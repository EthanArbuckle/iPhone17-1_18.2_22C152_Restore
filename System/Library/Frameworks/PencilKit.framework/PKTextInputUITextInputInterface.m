@interface PKTextInputUITextInputInterface
+ (BOOL)_callShouldChangeTextInRange:(id)a3 replacementText:(id)a4 inTextInput:(id)a5;
+ (BOOL)_callShouldInsertText:(id)a3 inTextInput:(id)a4 isMarkedText:(BOOL)a5;
+ (BOOL)_selectTextRange:(id)a3 inTextInput:(id)a4;
+ (BOOL)clearActivePreviewInTextInput:(id)a3;
+ (BOOL)configureSelectionStyleForDeletionPreviewInTextInput:(id)a3;
+ (BOOL)configureSelectionStyleForHighlightInTextInput:(id)a3;
+ (BOOL)configureSelectionStyleForNormalSelectionInTextInput:(id)a3;
+ (BOOL)deleteTextInRange:(_NSRange)a3 inTextInput:(id)a4;
+ (BOOL)insertCommittedText:(id)a3 withAlternatives:(id)a4 activePreviewText:(id)a5 replacingRange:(_NSRange)a6 inTextInput:(id)a7;
+ (BOOL)isProtectedTextAttachment:(id)a3;
+ (BOOL)isValidRange:(_NSRange)a3 inTextInput:(id)a4;
+ (BOOL)makeTextInputFirstResponder:(id)a3 forPencilInput:(BOOL)a4;
+ (BOOL)selectTextInRange:(_NSRange)a3 inTextInput:(id)a4;
+ (BOOL)selectWordBoundaryAtPoint:(CGPoint)a3 inTextInput:(id)a4;
+ (BOOL)setSelectionWithReferencePoint:(CGPoint)a3 inTextInput:(id)a4;
+ (BOOL)showSelectionCommandsForTextInput:(id)a3;
+ (CGRect)caretRectForCharacterIndex:(int64_t)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5;
+ (CGRect)caretRectInCoordinateSpace:(id)a3 inTextInput:(id)a4;
+ (CGRect)firstRectForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5;
+ (_NSRange)_rangeFromUITextPosition:(id)a3 toUITextPosition:(id)a4 inTextInput:(id)a5;
+ (_NSRange)activePreviewRangeInTextInput:(id)a3;
+ (_NSRange)rangeOfCharacterAtIndex:(unint64_t)a3 inTextInput:(id)a4;
+ (_NSRange)selectedRangeInTextInput:(id)a3;
+ (id)_uiTextRangeForRange:(_NSRange)a3 inTextInput:(id)a4;
+ (id)attributesAtCharacterIndex:(int64_t)a3 inTextInput:(id)a4;
+ (id)editableTextAttachmentFileTypes;
+ (id)insertTextPlaceholderWithSize:(CGSize)a3 inTextInput:(id)a4;
+ (id)protectedCharacterIndexesInRange:(_NSRange)a3 inTextInput:(id)a4;
+ (id)rectValuesForSelectionRects:(id)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6;
+ (id)selectionRectsForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6;
+ (id)stringInRange:(_NSRange)a3 inTextInput:(id)a4;
+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6;
+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6 adjustForLastCharacter:(BOOL)a7;
+ (int64_t)contentLengthForTextInput:(id)a3;
+ (void)notifyTextDidChangeInTextInput:(id)a3;
+ (void)notifyTextWillChangeInTextInput:(id)a3;
+ (void)removeTextPlaceholder:(id)a3 inTextInput:(id)a4;
@end

@implementation PKTextInputUITextInputInterface

+ (BOOL)makeTextInputFirstResponder:(id)a3 forPencilInput:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v5, "set_textInputSource:", 3);
  }
  if (([v5 isFirstResponder] & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      v7 = [v5 textInputTraits];
      v8 = v7;
      if (v7 && ([v7 deferBecomingResponder] & 1) != 0)
      {
        [v8 setDeferBecomingResponder:0];
        char v6 = [v5 becomeFirstResponder];
        [v8 setDeferBecomingResponder:1];
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v8 = 0;
    }
    char v6 = [v5 becomeFirstResponder];
    goto LABEL_12;
  }
  char v6 = 1;
LABEL_13:
  char v9 = [v5 isFirstResponder] & v6;

  return v9;
}

+ (BOOL)isValidRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = [v6 beginningOfDocument];
  v8 = [v6 positionFromPosition:v7 offset:location];

  char v9 = [v6 positionFromPosition:v8 offset:length];

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;

  return v11;
}

+ (BOOL)_callShouldChangeTextInRange:(id)a3 replacementText:(id)a4 inTextInput:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v10 conformsToProtocol:&unk_1F2089760])
  {
    BOOL v11 = [v8 start];
    v12 = [v8 end];
    uint64_t v13 = [a1 _rangeFromUITextPosition:v11 toUITextPosition:v12 inTextInput:v10];
    uint64_t v15 = v14;

    char v16 = objc_msgSend(v10, "keyboardInput:shouldReplaceTextInRange:replacementText:", v10, v13, v15, v9);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v17 = 1;
      goto LABEL_10;
    }
    if (!v8)
    {
      BOOL v17 = 0;
      goto LABEL_10;
    }
    char v16 = [v10 shouldChangeTextInRange:v8 replacementText:v9];
  }
  BOOL v17 = v16;
LABEL_10:

  return v17;
}

+ (BOOL)_callShouldInsertText:(id)a3 inTextInput:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 conformsToProtocol:&unk_1F2089760])
  {
    char v9 = [v8 keyboardInput:v8 shouldInsertText:v7 isMarkedText:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v10 = [v8 selectedTextRange];
    if (v10) {
      char v9 = [v8 shouldChangeTextInRange:v10 replacementText:v7];
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

+ (BOOL)insertCommittedText:(id)a3 withAlternatives:(id)a4 activePreviewText:(id)a5 replacingRange:(_NSRange)a6 inTextInput:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v68[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = (__CFString *)a5;
  id v16 = a7;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    if ([v13 length] | length)
    {
      LODWORD(v17) = [a1 _callShouldInsertText:v13 inTextInput:v16 isMarkedText:0];
      id v18 = v16;
      if (v17)
      {
        v56 = v14;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (objc_opt_respondsToSelector() & 1) == 0 || (isKindOfClass)
        {
          char v24 = objc_opt_respondsToSelector();
          v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          if (v24)
          {
            id v14 = v56;
            if (v26)
            {
              v27 = (objc_class *)objc_opt_class();
              v28 = NSStringFromClass(v27);
              *(_DWORD *)buf = 134218498;
              id v60 = v18;
              __int16 v61 = 2112;
              v62 = v28;
              __int16 v63 = 2048;
              uint64_t v64 = [v13 length];
              _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertAttributedText:. Inserting text of length %ld.", buf, 0x20u);
            }
            [v18 insertText:v13 alternatives:v56 style:1];
          }
          else
          {
            id v14 = v56;
            if (v26)
            {
              v29 = (objc_class *)objc_opt_class();
              v30 = NSStringFromClass(v29);
              *(_DWORD *)buf = 134218754;
              id v60 = v18;
              __int16 v61 = 2112;
              v62 = v30;
              __int16 v63 = 2048;
              uint64_t v64 = [v13 length];
              __int16 v65 = 2048;
              uint64_t v66 = [v56 count];
              _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertText:alternatives:style:. Inserting text of length %ld and ignoring %ld alternatives.", buf, 0x2Au);
            }
            [v18 insertText:v13];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            && [v18 textAlignment] != 4)
          {
            v54 = 0;
            v55 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13];
          }
          else
          {
            v20 = objc_opt_new();
            if ([v13 _isNaturallyRTL]) {
              uint64_t v21 = 2;
            }
            else {
              uint64_t v21 = 0;
            }
            [v20 setAlignment:v21];
            id v22 = objc_alloc(MEMORY[0x1E4F28E48]);
            uint64_t v67 = *MEMORY[0x1E4FB0738];
            v68[0] = v20;
            v54 = v20;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
            v55 = (void *)[v22 initWithString:v13 attributes:v23];
          }
          char v31 = objc_opt_respondsToSelector();
          id v14 = v56;
          if (v56 && (v31 & 1) != 0 && [v56 count])
          {
            v32 = (void *)[objc_alloc(MEMORY[0x1E4FB0868]) initWithPrimaryString:v13 alternativeStrings:v56];
            id v14 = v56;
            objc_msgSend(v55, "addAttribute:value:range:", *MEMORY[0x1E4FB0780], v32, 0, objc_msgSend(v55, "length"));
          }
          v33 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v18);
          if (v33 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v34 = [v33 start];
            v35 = [v18 textStylingAtPosition:v34 inDirection:0];
            v36 = (void *)[v35 mutableCopy];

            if (v36)
            {
              if (v54)
              {
                uint64_t v53 = *MEMORY[0x1E4FB0738];
                v37 = objc_msgSend(v36, "objectForKeyedSubscript:");
                v52 = (void *)[v37 mutableCopy];

                v38 = v54;
                if (v52)
                {
                  objc_msgSend(v52, "setAlignment:", objc_msgSend(v54, "alignment", v54));
                  v38 = v52;
                }
                [v36 setObject:v38 forKeyedSubscript:v53];
              }
              objc_msgSend(v55, "addAttributes:range:", v36, 0, objc_msgSend(v55, "length"));
            }

            id v14 = v56;
          }
          [v18 insertAttributedText:v55];
        }
      }
    }
    else
    {
      LODWORD(v17) = 1;
    }
    goto LABEL_39;
  }
  BOOL v17 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v16);
  if (v17)
  {
    [v16 setSelectedTextRange:v17];

    goto LABEL_4;
  }
LABEL_39:
  v39 = [v16 markedTextRange];
  if (v39)
  {
    v40 = [v16 markedTextRange];
    int v41 = [v40 isEmpty] ^ 1;
  }
  else
  {
    int v41 = 0;
  }

  if (v17)
  {
    if ([(__CFString *)v15 length]) {
      int v42 = 1;
    }
    else {
      int v42 = v41;
    }
    if (v42 != 1) {
      goto LABEL_56;
    }
    if (!v15) {
      uint64_t v15 = &stru_1F1FB2C00;
    }
    if ([a1 _callShouldInsertText:v15 inTextInput:v16 isMarkedText:1])
    {
      uint64_t v43 = [(__CFString *)v15 length];
      v44 = +[PKTextInputSettings sharedSettings];
      if ([v44 styledActivePreview])
      {
        char v45 = objc_opt_respondsToSelector();

        if (v45)
        {
          v57[0] = *MEMORY[0x1E4FB0700];
          v46 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.3];
          v58[0] = v46;
          v57[1] = *MEMORY[0x1E4FB06C0];
          v47 = [MEMORY[0x1E4FB1618] clearColor];
          v58[1] = v47;
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

          v49 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15 attributes:v48];
          objc_msgSend(v16, "setAttributedMarkedText:selectedRange:", v49, v43, 0);

LABEL_56:
          BOOL v50 = 1;
          goto LABEL_57;
        }
      }
      else
      {
      }
      objc_msgSend(v16, "setMarkedText:selectedRange:", v15, v43, 0);
      goto LABEL_56;
    }
  }
  BOOL v50 = 0;
LABEL_57:

  return v50;
}

+ (id)insertTextPlaceholderWithSize:(CGSize)a3 inTextInput:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [v7 selectedTextRange];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (width <= 0.0)
    {
      if (height <= 0.0)
      {
        char v9 = 0;
        goto LABEL_22;
      }
      id v16 = [v8 start];
      [v7 caretRectForPosition:v16];
      double v18 = v17;

      int v19 = vcvtpd_s64_f64(height / v18);
      char v9 = [MEMORY[0x1E4F28E78] string];
      if (v19 >= 1)
      {
        do
        {
          [v9 appendString:@"\n"];
          --v19;
        }
        while (v19);
      }
    }
    else
    {
      int v14 = vcvtpd_s64_f64(width / 5.0);
      if (v14 <= 16) {
        int v15 = 16;
      }
      else {
        int v15 = v14;
      }
      char v9 = [MEMORY[0x1E4F28E78] string];
      do
      {
        [v9 appendString:@" "];
        --v15;
      }
      while (v15);
    }
    if (v9 && [a1 _callShouldInsertText:v9 inTextInput:v7 isMarkedText:0])
    {
      [a1 notifyTextWillChangeInTextInput:v7];
      [v7 insertText:v9];
      v20 = [v7 selectedTextRange];
      uint64_t v21 = [v8 start];
      if (v21
        && (id v22 = (void *)v21,
            [v20 end],
            v23 = objc_claimAutoreleasedReturnValue(),
            v23,
            v22,
            v23))
      {
        char v24 = [v8 start];
        v25 = [v20 end];
        BOOL v26 = [v7 textRangeFromPosition:v24 toPosition:v25];

        v27 = [v7 selectionRectsForRange:v26];
        id v10 = +[PKTextInputTextPlaceholder placeholderWithText:v9 rects:v27];
      }
      else
      {
        BOOL v26 = [v20 end];
        [v7 caretRectForPosition:v26];
        id v10 = +[PKTextInputTextPlaceholder placeholderWithToken:frame:](PKTextInputTextPlaceholder, "placeholderWithToken:frame:", v9);
      }

      goto LABEL_3;
    }
LABEL_22:

    id v10 = 0;
    goto LABEL_23;
  }
  [a1 notifyTextWillChangeInTextInput:v7];
  char v9 = objc_msgSend(v7, "insertTextPlaceholderWithSize:", width, height);
  id v10 = +[PKTextInputTextPlaceholder placeholderWithTextPlaceholder:v9];
LABEL_3:

  if (v10)
  {
    BOOL v11 = [v8 start];
    v12 = [v8 start];
    id v13 = [v7 textRangeFromPosition:v11 toPosition:v12];

    [v7 setSelectedTextRange:v13];
  }
  [a1 notifyTextDidChangeInTextInput:v7];
LABEL_23:

  return v10;
}

+ (void)removeTextPlaceholder:(id)a3 inTextInput:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [v19 placeholder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      [a1 notifyTextWillChangeInTextInput:v6];
      char v9 = [v19 placeholder];
      [v6 removeTextPlaceholder:v9];

      [a1 notifyTextDidChangeInTextInput:v6];
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v10 = [v19 placeholder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v19 placeholder];
    id v13 = [v6 selectedTextRange];
    int v14 = [v13 start];
    int v15 = objc_msgSend(v6, "positionFromPosition:offset:", v14, objc_msgSend(v12, "length"));

    id v16 = [v13 start];
    double v17 = [v6 textRangeFromPosition:v16 toPosition:v15];

    double v18 = [v6 textInRange:v17];
    if ([v18 isEqualToString:v12]
      && [a1 _callShouldChangeTextInRange:v17 replacementText:&stru_1F1FB2C00 inTextInput:v6])
    {
      [a1 notifyTextWillChangeInTextInput:v6];
      [v6 replaceRange:v17 withText:&stru_1F1FB2C00];
      [a1 notifyTextDidChangeInTextInput:v6];
    }
  }
LABEL_10:
}

+ (BOOL)deleteTextInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  char v8 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  if (v8
    && [a1 _callShouldChangeTextInRange:v8 replacementText:&stru_1F1FB2C00 inTextInput:v7])
  {
    [v7 setSelectedTextRange:v8];
    [v7 deleteBackward];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (_NSRange)selectedRangeInTextInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 selectedTextRange];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 start];
    char v8 = [v6 end];
    uint64_t v9 = [a1 _rangeFromUITextPosition:v7 toUITextPosition:v8 inTextInput:v4];
    NSUInteger v11 = v10;
  }
  else
  {
    NSUInteger v11 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

+ (BOOL)selectTextInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  char v8 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  LOBYTE(location) = [a1 _selectTextRange:v8 inTextInput:v7];

  return location;
}

+ (BOOL)_selectTextRange:(id)a3 inTextInput:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = [v5 inputDelegate];
    [v7 selectionWillChange:v5];
    [v5 setSelectedTextRange:v6];

    [v7 selectionDidChange:v5];
  }
  return a3 != 0;
}

+ (BOOL)setSelectionWithReferencePoint:(CGPoint)a3 inTextInput:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  char v8 = objc_msgSend(v7, "closestPositionToPoint:", x, y);
  if (v8)
  {
    uint64_t v9 = [v7 textRangeFromPosition:v8 toPosition:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v10 = [a1 _selectTextRange:v9 inTextInput:v7];

  return v10;
}

+ (BOOL)selectWordBoundaryAtPoint:(CGPoint)a3 inTextInput:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  char v8 = objc_msgSend(v7, "closestPositionToPoint:", x, y);
  uint64_t v9 = [v7 beginningOfDocument];
  char v10 = [v7 endOfDocument];
  id v11 = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKTextInputUITextInputInterface_selectWordBoundaryAtPoint_inTextInput___block_invoke;
  aBlock[3] = &unk_1E64CB018;
  id v12 = v7;
  id v53 = v12;
  id v13 = v9;
  id v54 = v13;
  id v14 = v10;
  id v55 = v14;
  int v15 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  if (v11)
  {
    id v51 = v13;
    id v16 = v11;
    do
    {
      int v17 = v15[2](v15, v16);
      if (v17) {
        break;
      }
      double v18 = [v12 tokenizer];
      uint64_t v19 = [v18 positionFromPosition:v16 toBoundary:1 inDirection:1];

      id v16 = (void *)v19;
    }
    while (v19);
    v20 = v11;
    do
    {
      if (v15[2](v15, v20))
      {
        if (v17)
        {
          [v12 caretRectForPosition:v16];
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          [v12 caretRectForPosition:v20];
          CGFloat v49 = v34;
          CGFloat v50 = v33;
          CGFloat v36 = v35;
          CGFloat v48 = v37;
          v56.origin.double x = v26;
          v56.origin.double y = v28;
          v56.size.double width = v30;
          v56.size.double height = v32;
          CGFloat MidX = CGRectGetMidX(v56);
          CGFloat v39 = (MidX - x) * (MidX - x);
          v57.origin.double x = v26;
          v57.origin.double y = v28;
          v57.size.double width = v30;
          v57.size.double height = v32;
          CGFloat MidY = CGRectGetMidY(v57);
          CGFloat v41 = v39 + (MidY - y) * (MidY - y);
          v58.origin.double x = v50;
          v58.origin.double y = v36;
          v58.size.double width = v49;
          v58.size.double height = v48;
          CGFloat v42 = CGRectGetMidX(v58);
          CGFloat v43 = (v42 - x) * (v42 - x);
          v59.origin.double x = v50;
          v59.origin.double y = v36;
          v59.size.double width = v49;
          v59.size.double height = v48;
          CGFloat v44 = CGRectGetMidY(v59);
          if (v41 >= v43 + (v44 - y) * (v44 - y)) {
            v23 = v20;
          }
          else {
            v23 = v16;
          }
        }
        else
        {
          v23 = v20;
        }
        goto LABEL_17;
      }
      uint64_t v21 = [v12 tokenizer];
      uint64_t v22 = [v21 positionFromPosition:v20 toBoundary:1 inDirection:0];

      v20 = (void *)v22;
    }
    while (v22);
    if ((v17 & 1) == 0)
    {
      char v24 = 0;
      goto LABEL_18;
    }
    v20 = 0;
    v23 = v16;
LABEL_17:
    id v45 = v23;

    v46 = [v12 textRangeFromPosition:v45 toPosition:v45];
    char v24 = [a1 _selectTextRange:v46 inTextInput:v12];

    id v11 = v45;
LABEL_18:
    id v13 = v51;
  }
  else
  {
    id v16 = 0;
    char v24 = 0;
  }

  return v24;
}

uint64_t __73__PKTextInputUITextInputInterface_selectWordBoundaryAtPoint_inTextInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) tokenizer];
  uint64_t v5 = 1;
  if (([v4 isPosition:v3 atBoundary:1 inDirection:0] & 1) == 0)
  {
    if ([v3 isEqual:*(void *)(a1 + 40)]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v3 isEqual:*(void *)(a1 + 48)];
    }
  }

  return v5;
}

+ (BOOL)showSelectionCommandsForTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 inputDelegate];
    char v5 = objc_opt_respondsToSelector();
    if (v5) {
      [v4 showSelectionCommands];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

+ (BOOL)configureSelectionStyleForHighlightInTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 interactionAssistant];
    char v5 = v4;
    BOOL v6 = v4 != 0;
    if (v4) {
      [v4 configureForPencilHighlightMode];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)configureSelectionStyleForDeletionPreviewInTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 interactionAssistant];
    char v5 = v4;
    BOOL v6 = v4 != 0;
    if (v4) {
      [v4 configureForPencilDeletionPreviewMode];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)configureSelectionStyleForNormalSelectionInTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 interactionAssistant];
    char v5 = v4;
    BOOL v6 = v4 != 0;
    if (v4) {
      [v4 configureForSelectionMode];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (CGRect)caretRectInCoordinateSpace:(id)a3 inTextInput:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 selectedTextRange];
  char v8 = [v7 start];
  [v5 caretRectForPosition:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  int v17 = [v5 textInputView];

  double v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v6, v10, v12, v14, v16);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

+ (_NSRange)activePreviewRangeInTextInput:(id)a3
{
  id v3 = a3;
  id v4 = [v3 beginningOfDocument];
  id v5 = [v3 markedTextRange];
  id v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && v5)
  {
    double v9 = [v5 start];
    uint64_t v8 = [v3 offsetFromPosition:v4 toPosition:v9];

    double v10 = [v6 start];
    double v11 = [v6 end];
    uint64_t v7 = [v3 offsetFromPosition:v10 toPosition:v11];
  }
  NSUInteger v12 = v8;
  NSUInteger v13 = v7;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

+ (BOOL)clearActivePreviewInTextInput:(id)a3
{
  return 1;
}

+ (int64_t)contentLengthForTextInput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 beginningOfDocument];
  uint64_t v6 = [v4 endOfDocument];
  uint64_t v7 = (void *)v6;
  int64_t v8 = 0;
  if (v5 && v6)
  {
    double v9 = [v4 beginningOfDocument];
    double v10 = [v4 endOfDocument];
    [a1 _rangeFromUITextPosition:v9 toUITextPosition:v10 inTextInput:v4];
    int64_t v8 = v11;
  }
  return v8;
}

+ (id)stringInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  int64_t v8 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  if (v8)
  {
    double v9 = [v7 textInRange:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (id)editableTextAttachmentFileTypes
{
  if (qword_1EB3C62A0 != -1) {
    dispatch_once(&qword_1EB3C62A0, &__block_literal_global_84);
  }
  v2 = (void *)_MergedGlobals_158;

  return v2;
}

void __66__PKTextInputUITextInputInterface_editableTextAttachmentFileTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.notes.inlinetextattachment", @"com.apple.notes.inlinetextattachment.hashtag", @"com.apple.notes.inlinetextattachment.mention", 0);
  v1 = (void *)_MergedGlobals_158;
  _MergedGlobals_158 = v0;
}

+ (BOOL)isProtectedTextAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fileType];

  if (v5)
  {
    uint64_t v6 = [a1 editableTextAttachmentFileTypes];
    id v7 = [v4 fileType];
    int v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)protectedCharacterIndexesInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  int v8 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  double v9 = v8;
  if (v8 && ([v8 isEmpty] & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v11 = [a1 selectedRangeInTextInput:v7];
    uint64_t v23 = v12;
    if (length)
    {
      uint64_t v13 = 0;
      uint64_t v21 = *MEMORY[0x1E4FB06B8];
      NSUInteger v22 = location - v11;
      do
      {
        double v14 = [v9 start];
        double v15 = [v7 positionFromPosition:v14 offset:v13];

        if (v15)
        {
          if ((v22 + v13) | v23)
          {
            uint64_t v17 = 0;
LABEL_11:
            double v18 = [v7 textStylingAtPosition:v15 inDirection:v17];
            double v19 = [v18 objectForKeyedSubscript:v21];
            if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || [a1 isProtectedTextAttachment:v19])
            {
              [v10 addIndex:location + v13];
            }

            goto LABEL_16;
          }
          uint64_t v16 = [v7 positionFromPosition:v15 offset:1];

          double v15 = (void *)v16;
          uint64_t v17 = 1;
          if (v16) {
            goto LABEL_11;
          }
        }
LABEL_16:
        ++v13;
      }
      while (length != v13);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)attributesAtCharacterIndex:(int64_t)a3 inTextInput:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 beginningOfDocument];
  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v5 positionFromPosition:v6 offset:a3], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = (void *)v7;
    double v9 = [v5 textStylingAtPosition:v7 inDirection:0];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (_NSRange)rangeOfCharacterAtIndex:(unint64_t)a3 inTextInput:(id)a4
{
  unint64_t v4 = a3;
  if (a3 >= 0xA) {
    unint64_t v6 = a3 - 10;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = a3 + 20;
  id v8 = a4;
  unint64_t v9 = [a1 contentLengthForTextInput:v8] - 1;
  if (v7 < v9) {
    unint64_t v9 = v7;
  }
  id v10 = objc_msgSend(a1, "stringInRange:inTextInput:", v6, v9 - v6, v8);

  if ([v10 length] <= v4 - v6)
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v11 = [v10 rangeOfComposedCharacterSequenceAtIndex:v4 - v6];
    unint64_t v13 = v11 + v6;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v12;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v4 = v13;
    }
  }

  NSUInteger v15 = v4;
  NSUInteger v16 = v14;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

+ (CGRect)firstRectForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v10);
  if (v11)
  {
    [v10 firstRectForRange:v11];
    double v15 = v12;
    double v17 = v16;
    double v18 = v13;
    double v19 = v14;
    if (v14 > 0.0)
    {
      double v12 = v13 / v14;
      if (v13 / v14 > 1.0 && length == 1)
      {
        uint64_t v21 = objc_msgSend(v10, "textInRange:", v11, v12);
        if ([v21 length] == 1)
        {
          NSUInteger v22 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          int v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", 0));

          if (v23) {
            double v18 = v19 * 0.5;
          }
        }
      }
    }
    double v24 = objc_msgSend(v10, "textInputView", v12);
    double v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v24, v9, v15, v17, v18, v19);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    double v25 = *MEMORY[0x1E4F1DB20];
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v31 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6
{
  return objc_msgSend(a1, "characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:", a4, a5, a6, 1, a3.x, a3.y);
}

+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6 adjustForLastCharacter:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a3.y;
  double x = a3.x;
  id v13 = a5;
  id v14 = a4;
  double v15 = [v13 textInputView];
  double v16 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v14, v15, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v18 = v17;

  double v19 = objc_msgSend(v13, "closestPositionToPoint:", v16, v18);
  double v20 = [v13 beginningOfDocument];
  uint64_t v21 = [v13 endOfDocument];
  NSUInteger v22 = (void *)v21;
  if (v19) {
    BOOL v23 = v20 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23 || v21 == 0)
  {
    int64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v26 = [v13 offsetFromPosition:v20 toPosition:v19];
    if (v26 <= 1) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = v26;
    }
    int64_t v28 = v27 - 1;
    if (v8) {
      int64_t v25 = v26;
    }
    else {
      int64_t v25 = v28;
    }
    if ([v13 offsetFromPosition:v20 toPosition:v22] >= 1
      && [v19 isEqual:v22]
      && v7)
    {
      double v30 = [v13 positionFromPosition:v22 offset:-1];
      if (v30)
      {
        uint64_t v31 = [a1 _rangeFromUITextPosition:v30 toUITextPosition:v22 inTextInput:v13];
        uint64_t v33 = v32;
        double v34 = [v13 textInputView];
        objc_msgSend(a1, "firstRectForRange:inCoordinateSpace:inTextInput:", v31, v33, v34, v13);
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        double v42 = v41;

        v49.origin.double x = v36;
        v49.origin.double y = v38;
        v49.size.double width = v40;
        v49.size.double height = v42;
        if (!CGRectIsNull(v49))
        {
          v50.origin.double x = v36;
          v50.origin.double y = v38;
          v50.size.double width = v40;
          v50.size.double height = v42;
          double v43 = v18 - CGRectGetMaxY(v50);
          if (v43 >= 0.0 && v43 < v42)
          {
            v51.origin.double x = v36;
            v51.origin.double y = v38;
            v51.size.double width = v40;
            v51.size.double height = v42;
            uint64_t v45 = objc_msgSend(v13, "closestPositionToPoint:", v16, CGRectGetMidY(v51));

            if (v45)
            {
              uint64_t v46 = [v13 offsetFromPosition:v20 toPosition:v45];
              if (v46 <= 1) {
                uint64_t v47 = 1;
              }
              else {
                uint64_t v47 = v46;
              }
              int64_t v25 = v47 - 1;
              double v19 = (void *)v45;
            }
            else
            {
              double v19 = 0;
            }
          }
        }
      }
    }
  }

  return v25;
}

+ (CGRect)caretRectForCharacterIndex:(int64_t)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 beginningOfDocument];
  id v10 = [v8 positionFromPosition:v9 offset:a3];

  if (v10)
  {
    [v8 caretRectForPosition:v10];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [v8 textInputView];
    double v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v7, v12, v14, v16, v18);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB20];
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

+ (id)selectionRectsForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v14 = a4;
  id v15 = a5;
  double v16 = objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v15);
  if (v16)
  {
    double v17 = [v15 selectionRectsForRange:v16];
    double v18 = objc_msgSend(a1, "rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:", v17, v14, v15, x, y, width, height);
  }
  else
  {
    double v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (id)rectValuesForSelectionRects:(id)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v22 = objc_msgSend(v14, "textInputView", (void)v33);
        [v21 rect];
        objc_msgSend(v22, "PK_convertRect:toCoordinateSpace:", v13);
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        if (!CGRectIsNull(v40))
        {
          v41.origin.CGFloat x = v24;
          v41.origin.CGFloat y = v26;
          v41.size.CGFloat width = v28;
          v41.size.CGFloat height = v30;
          v44.origin.CGFloat x = x;
          v44.origin.CGFloat y = y;
          v44.size.CGFloat width = width;
          v44.size.CGFloat height = height;
          CGRect v42 = CGRectIntersection(v41, v44);
          double v24 = v42.origin.x;
          double v26 = v42.origin.y;
          double v28 = v42.size.width;
          double v30 = v42.size.height;
        }
        v43.origin.CGFloat x = v24;
        v43.origin.CGFloat y = v26;
        v43.size.CGFloat width = v28;
        v43.size.CGFloat height = v30;
        if (!CGRectIsNull(v43))
        {
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24, v26, v28, v30);
          [v15 addObject:v31];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  return v15;
}

+ (void)notifyTextWillChangeInTextInput:(id)a3
{
  id v4 = a3;
  id v3 = [v4 inputDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 willBeginPencilTextInputEditing];
  }
  [v3 textWillChange:v4];
}

+ (void)notifyTextDidChangeInTextInput:(id)a3
{
  id v4 = a3;
  id v3 = [v4 inputDelegate];
  [v3 textDidChange:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 didFinishPencilTextInputEditing];
  }
}

+ (id)_uiTextRangeForRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  id v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [v6 beginningOfDocument];
    id v10 = [v7 positionFromPosition:v9 offset:location];

    uint64_t v11 = [v7 positionFromPosition:v10 offset:length];
    id v12 = (void *)v11;
    id v8 = 0;
    if (v10 && v11)
    {
      id v8 = [v7 textRangeFromPosition:v10 toPosition:v11];
    }
  }

  return v8;
}

+ (_NSRange)_rangeFromUITextPosition:(id)a3 toUITextPosition:(id)a4 inTextInput:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 beginningOfDocument];
  if (!v7 || !v10)
  {

    goto LABEL_6;
  }

  if (!v8)
  {
LABEL_6:
    uint64_t v13 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  uint64_t v11 = [v9 beginningOfDocument];
  uint64_t v12 = [v9 offsetFromPosition:v11 toPosition:v7];

  uint64_t v13 = [v9 offsetFromPosition:v7 toPosition:v8];
LABEL_7:

  NSUInteger v14 = v12;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

@end
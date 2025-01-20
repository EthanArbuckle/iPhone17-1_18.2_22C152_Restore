@interface PKTextInputUtilities
+ (BOOL)isMagicCanvasGenerationView:(id)a3;
+ (BOOL)isResponderSupportedTextInput:(id)a3;
+ (BOOL)isResponderSupportedTextInput:(id)a3 checkForNotes:(BOOL)a4 outTextInputTraits:(id *)a5;
+ (BOOL)isResponderSupportedTextInput:(id)a3 outTextInputTraits:(id *)a4;
+ (BOOL)isUnderMagicView:(id)a3;
+ (BOOL)isValidReachableInteraction:(id)a3;
+ (BOOL)shouldAvoidNonEditableView:(id)a3;
+ (BOOL)textInputTraitsAreSecure:(id)a3;
+ (CGRect)selectionClipRectForTextInput:(id)a3;
+ (Class)notesTextViewClass;
+ (id)_notesTextViewFromResponder:(id)a3;
+ (id)nonEditableTextInputForView:(id)a3;
+ (id)textInputTraitsFromTextInput:(id)a3;
+ (int64_t)responderTextInputSource:(id)a3;
+ (void)adjustSelectionWithDelta:(_NSRange)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5;
+ (void)markAnalyticsForDeletionCount:(unint64_t)a3 rangeToReplace:(_NSRange)a4;
+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4;
+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4 withAlternatives:(int64_t)a5;
+ (void)markAnalyticsForRedo;
+ (void)markAnalyticsForSelectionChange:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4;
+ (void)markAnalyticsForUndo;
+ (void)removeTextAlternativesForTextInput:(id)a3;
+ (void)requestDocumentContext:(id)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5;
@end

@implementation PKTextInputUtilities

+ (id)textInputTraitsFromTextInput:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v3 conformsToProtocol:&unk_1F20A7268] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E4FB1D98];
    v6 = [v3 textInputTraits];
    v4 = [v5 traitsByAdoptingTraits:v6 lightweight:1];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1D98] traitsByAdoptingTraits:v3 lightweight:1];
  }

  return v4;
}

+ (BOOL)textInputTraitsAreSecure:(id)a3
{
  id v3 = a3;
  if ([v3 isSecureTextEntry])
  {
    char v4 = 1;
  }
  else
  {
    v5 = (void *)*MEMORY[0x1E4FB2FB0];
    v6 = [v3 textContentType];
    if ([v5 isEqualToString:v6])
    {
      char v4 = 1;
    }
    else
    {
      v7 = (void *)*MEMORY[0x1E4FB2FA0];
      v8 = [v3 textContentType];
      char v4 = [v7 isEqualToString:v8];
    }
  }

  return v4;
}

+ (Class)notesTextViewClass
{
  if (qword_1EB3C5DA0 != -1) {
    dispatch_once(&qword_1EB3C5DA0, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_112;

  return (Class)v2;
}

Class __42__PKTextInputUtilities_notesTextViewClass__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Ictextview.isa);
  _MergedGlobals_112 = (uint64_t)result;
  return result;
}

+ (id)_notesTextViewFromResponder:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqual:@"com.apple.mobilenotes"];

  if (v7)
  {
    [a1 notesTextViewClass];
    id v8 = v4;
    if (v8)
    {
      do
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v9 = [v8 nextResponder];

        id v8 = (id)v9;
      }
      while (v9);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidReachableInteraction:(id)a3
{
  id v3 = [a1 _notesTextViewFromResponder:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 ink];
    char v6 = [v5 _isHandwritingInk];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (BOOL)isUnderMagicView:(id)a3
{
  uint64_t v3 = [a3 superview];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  do
  {
    BOOL v5 = +[PKTextInputUtilities isMagicCanvasGenerationView:v4];
    if (v5) {
      break;
    }
    uint64_t v6 = [v4 superview];

    id v4 = (void *)v6;
  }
  while (v6);

  return v5;
}

+ (BOOL)isMagicCanvasGenerationView:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 magicGenerativeViewForHitTesting];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isResponderSupportedTextInput:(id)a3
{
  return [a1 isResponderSupportedTextInput:a3 outTextInputTraits:0];
}

+ (BOOL)isResponderSupportedTextInput:(id)a3 outTextInputTraits:(id *)a4
{
  return [a1 isResponderSupportedTextInput:a3 checkForNotes:1 outTextInputTraits:a4];
}

+ (BOOL)isResponderSupportedTextInput:(id)a3 checkForNotes:(BOOL)a4 outTextInputTraits:(id *)a5
{
  id v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  id v8 = [a1 textInputTraitsFromTextInput:v7];
  uint64_t v9 = v8;
  if (a5) {
    *a5 = v8;
  }
  char v10 = [a1 textInputTraitsAreSecure:v9];

  if ((v10 & 1) == 0 && [v7 conformsToProtocol:&unk_1F208B728])
  {
    v11 = [a1 _notesTextViewFromResponder:v7];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 ink];
      int v14 = [v13 _isHandwritingInk];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 |= +[PKTextInputUtilities isUnderMagicView:v7];
      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (int64_t)responderTextInputSource:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 _textInputSource];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldAvoidNonEditableView:(id)a3
{
  id v3 = a3;
  if (qword_1EB3C5DC0 != -1) {
    dispatch_once(&qword_1EB3C5DC0, &__block_literal_global_434);
  }
  if (qword_1EB3C5DB8 && (objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    LOBYTE(v4) = 1;
    goto LABEL_16;
  }
  if (qword_1EB3C5DA8) {
    BOOL v5 = qword_1EB3C5DB0 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v4) = 0;
    goto LABEL_16;
  }
  int64_t v4 = [v3 superview];
  if (v4)
  {
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [v4 superview];

      int64_t v4 = (void *)v6;
      if (!v6) {
        goto LABEL_16;
      }
    }

    goto LABEL_5;
  }
LABEL_16:

  return (char)v4;
}

Class __51__PKTextInputUtilities_shouldAvoidNonEditableView___block_invoke()
{
  qword_1EB3C5DA8 = (uint64_t)NSClassFromString(&cfstr_Mupdfview.isa);
  qword_1EB3C5DB0 = (uint64_t)NSClassFromString(&cfstr_Pdfdocumentvie.isa);
  Class result = NSClassFromString(&cfstr_Pdftextinputvi.isa);
  qword_1EB3C5DB8 = (uint64_t)result;
  return result;
}

+ (id)nonEditableTextInputForView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && ([a1 shouldAvoidNonEditableView:v4] & 1) != 0) {
    goto LABEL_7;
  }
  if ([a1 isResponderSupportedTextInput:v4 checkForNotes:0 outTextInputTraits:0])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v4 isEditable] & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 isSelectable]) {
        goto LABEL_7;
      }
    }
    else if ([v4 canBecomeFirstResponder])
    {
LABEL_7:
      id v5 = 0;
      goto LABEL_28;
    }
    id v5 = v4;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_msgSend(v4, "interactions", 0);
    id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = objc_opt_class();
          if (v11 == objc_opt_class())
          {
            id v7 = v10;
            goto LABEL_18;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v12 = [v7 textInput];
    if ([v12 conformsToProtocol:&unk_1F208B728]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = [v12 interactionAssistant];

      if (v13) {
        int v14 = v12;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    id v5 = v14;
  }
LABEL_28:

  return v5;
}

+ (void)requestDocumentContext:(id)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 conformsToProtocol:&unk_1F20A7268])
  {
    id v10 = v8;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v11 = (void *)qword_1EB3C5DC8;
    uint64_t v23 = qword_1EB3C5DC8;
    if (!qword_1EB3C5DC8)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getBETextDocumentRequestClass_block_invoke;
      v19[3] = &unk_1E64C5478;
      v19[4] = &v20;
      __getBETextDocumentRequestClass_block_invoke((uint64_t)v19);
      uint64_t v11 = (void *)v21[3];
    }
    v12 = v11;
    _Block_object_dispose(&v20, 8);
    v13 = (void *)[[v12 alloc] _initWithUIKitDocumentRequest:v7];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke;
    v17[3] = &unk_1E64C5428;
    id v18 = v9;
    id v14 = v9;
    [v10 requestDocumentContext:v13 completionHandler:v17];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke_2;
    v15[3] = &unk_1E64C5450;
    id v16 = v9;
    id v10 = v9;
    [v8 requestDocumentContext:v7 completionHandler:v15];
    v13 = v16;
  }
}

void __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _uikitDocumentContext];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)adjustSelectionWithDelta:(_NSRange)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v8 = a5;
  if ([v9 conformsToProtocol:&unk_1F20A7268]) {
    objc_msgSend(v9, "adjustSelectionByRange:completionHandler:", location, length, v8);
  }
  else {
    objc_msgSend(v9, "adjustSelectionWithDelta:completionHandler:", location, length, v8);
  }
}

+ (CGRect)selectionClipRectForTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v3 selectionClipRect];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      double v8 = *MEMORY[0x1E4F1DB20];
      double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_7;
    }
    [v3 _selectionClipRect];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
LABEL_7:

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (void)removeTextAlternativesForTextInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 removeTextAlternatives];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 removeEmojiAlternatives];
  }
}

+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = [a3 componentsJoinedByString:&stru_1F1FB2C00];
  double v6 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  double v7 = [v6 _textInputSessionAnalytics];
  objc_msgSend(v7, "didInsertText:relativeRangeBefore:", v8, location, length);
}

+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4 withAlternatives:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = [a3 componentsJoinedByString:&stru_1F1FB2C00];
  id v8 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  double v9 = [v8 _textInputSessionAnalytics];
  objc_msgSend(v9, "didInsertText:relativeRangeBefore:withNumAlternatives:", v10, location, length, a5);
}

+ (void)markAnalyticsForDeletionCount:(unint64_t)a3 rangeToReplace:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  double v7 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  id v8 = [v7 _textInputSessionAnalytics];

  if (objc_opt_respondsToSelector())
  {
    [v8 didDeleteBackwardCount:a3];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v8, "didDeleteBackward:relativeRangeBefore:", a3, location, length);
  }
}

+ (void)markAnalyticsForSelectionChange:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  id v9 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  id v8 = [v9 _textInputSessionAnalytics];
  objc_msgSend(v8, "didChangeToSelection:relativeRangeBefore:", v7, v6, location, length);
}

+ (void)markAnalyticsForUndo
{
  id v3 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  v2 = [v3 _textInputSessionAnalytics];
  [v2 didUndo];
}

+ (void)markAnalyticsForRedo
{
  id v3 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  v2 = [v3 _textInputSessionAnalytics];
  [v2 didRedo];
}

@end
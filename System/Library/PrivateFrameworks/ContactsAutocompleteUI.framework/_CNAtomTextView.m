@interface _CNAtomTextView
+ (id)os_log;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hostRecipientViewHasSearchResults;
- (BOOL)hostRecipientViewHasSearchTextOrTokensAndNoSearchResults;
- (BOOL)isEditingTextStorage;
- (BOOL)notifyDelegateWithBooleanSelector:(SEL)a3;
- (BOOL)notifyDelegateWithSelector:(SEL)a3 checkReturnValue:(BOOL)a4;
- (BOOL)notifyDelegateWithVoidSelector:(SEL)a3;
- (BOOL)resignFirstResponder;
- (CGRect)convertGlyphRect:(CGRect)a3;
- (CNComposeRecipientTextView)hostRecipientView;
- (NSArray)atoms;
- (_CNAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)selectionRectsForRange:(id)a3;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (int64_t)baseWritingDirection;
- (void)batchTextStorageUpdates:(id)a3;
- (void)commaPressed;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)delete:(id)a3;
- (void)downArrowPressed;
- (void)enumerateAtomAttachments:(id)a3;
- (void)enumerateAtoms:(id)a3;
- (void)enumerateAtomsInCharacterRange:(_NSRange)a3 withBlock:(id)a4;
- (void)escKeyPressed;
- (void)leftArrowPressed;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)returnPressed;
- (void)rightArrowPressed;
- (void)setHostRecipientView:(id)a3;
- (void)tabPressed;
- (void)upArrowPressed;
@end

@implementation _CNAtomTextView

+ (id)os_log
{
  if (os_log_cn_once_token_8 != -1) {
    dispatch_once(&os_log_cn_once_token_8, &__block_literal_global_707);
  }
  v2 = (void *)os_log_cn_once_object_8;

  return v2;
}

- (_CNAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_CNAtomTextView;
  v4 = -[_CNAtomTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)_CNAtomTextView;
    v6 = [(_CNAtomTextView *)&v8 undoManager];
    [v6 disableUndoRegistration];

    v5->_textStorageEditingDepth = 0;
    [(_CNAtomTextView *)v5 setContentInsetAdjustmentBehavior:2];
    [(_CNAtomTextView *)v5 setClipsToBounds:0];
  }
  return v5;
}

- (NSArray)atoms
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24___CNAtomTextView_atoms__block_invoke;
  v6[3] = &unk_1E6128F48;
  id v4 = v3;
  id v7 = v4;
  [(_CNAtomTextView *)self enumerateAtoms:v6];

  return (NSArray *)v4;
}

- (CGRect)convertGlyphRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_CNAtomTextView *)self textContainerInset];
  double v9 = y + v8;
  [(_CNAtomTextView *)self textContainerInset];
  double v11 = x + v10;
  double v12 = v9;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)enumerateAtoms:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNAtomTextView *)self textStorage];
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", 0, [v5 length], v4);
}

- (void)enumerateAtomsInCharacterRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  double v8 = [(_CNAtomTextView *)self textStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60___CNAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke;
  v10[3] = &unk_1E6129258;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v10);
}

- (void)enumerateAtomAttachments:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNAtomTextView *)self textStorage];
  v6 = [(_CNAtomTextView *)self textStorage];
  uint64_t v7 = [v6 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___CNAtomTextView_enumerateAtomAttachments___block_invoke;
  v9[3] = &unk_1E6129258;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);
}

- (BOOL)isEditingTextStorage
{
  return self->_textStorageEditingDepth != 0;
}

- (void)batchTextStorageUpdates:(id)a3
{
  ++self->_textStorageEditingDepth;
  id v4 = (void (**)(void))a3;
  id v5 = [(_CNAtomTextView *)self textStorage];
  [v5 beginEditing];

  v4[2](v4);
  --self->_textStorageEditingDepth;
  v6 = [(_CNAtomTextView *)self textStorage];
  [v6 endEditing];

  id v7 = [(_CNAtomTextView *)self hostRecipientView];
  [v7 _recomputeTextContainerExclusionPaths];
}

- (BOOL)becomeFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextView;
  BOOL v3 = [(_CNAtomTextView *)&v8 becomeFirstResponder];
  id v4 = [(_CNAtomTextView *)self hostRecipientView];
  id v5 = v4;
  if (v3 && v4 != 0) {
    [v4 atomTextViewDidBecomeFirstResponder:self];
  }

  return v3;
}

- (BOOL)resignFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextView;
  BOOL v3 = [(_CNAtomTextView *)&v8 resignFirstResponder];
  id v4 = [(_CNAtomTextView *)self hostRecipientView];
  id v5 = v4;
  if (v3 && v4 != 0) {
    [v4 atomTextViewDidResignFirstResponder:self];
  }

  return v3;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  uint64_t v5 = [(_CNAtomTextView *)self selectedRange];
  uint64_t v7 = v6;
  objc_super v8 = [(_CNAtomTextView *)self textStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42___CNAtomTextView_selectionRectsForRange___block_invoke;
  v13[3] = &unk_1E6129280;
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  v13[4] = self;
  id v9 = v4;
  id v14 = v9;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", v5, v7, 0, v13);

  id v10 = v14;
  id v11 = v9;

  return v11;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextView;
  id v4 = [(_CNAtomTextView *)&v8 textStylingAtPosition:a3 inDirection:a4];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4FB06C0]];

  return v5;
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNAtomTextView;
  [(_CNAtomTextView *)&v5 makeTextWritingDirectionLeftToRight:a3];
  id v4 = [(_CNAtomTextView *)self hostRecipientView];
  [v4 atomTextView:self didChangeWritingDirection:0];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNAtomTextView;
  [(_CNAtomTextView *)&v5 makeTextWritingDirectionRightToLeft:a3];
  id v4 = [(_CNAtomTextView *)self hostRecipientView];
  [v4 atomTextView:self didChangeWritingDirection:1];
}

- (int64_t)baseWritingDirection
{
  BOOL v3 = [(_CNAtomTextView *)self textStorage];
  uint64_t v4 = [v3 length];

  objc_super v5 = (void *)MEMORY[0x1E4FB0738];
  if (!v4) {
    goto LABEL_9;
  }
  if ([(_CNAtomTextView *)self selectedRange] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
  uint64_t v6 = [(_CNAtomTextView *)self textStorage];
  uint64_t v7 = [v6 attributesAtIndex:0 effectiveRange:0];

  objc_super v8 = [v7 objectForKey:*v5];

  if (!v8)
  {
LABEL_9:
    id v9 = [(_CNAtomTextView *)self typingAttributes];
    objc_super v8 = [v9 objectForKey:*v5];

    if (!v8) {
      return -1;
    }
  }
  int64_t v10 = [v8 baseWritingDirection];

  return v10;
}

- (void)copy:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(_CNAtomTextView *)self selectedRange];
  if (v4)
  {
    v26 = [MEMORY[0x1E4F42C50] generalPasteboard];
    v27 = [MEMORY[0x1E4F1CA48] array];
    objc_super v5 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v6 = [(_CNAtomTextView *)self selectedRange];
    uint64_t v8 = v7;
    id v9 = [MEMORY[0x1E4F28E78] string];
    if (v6 < v6 + v8)
    {
      uint64_t v11 = *MEMORY[0x1E4FB06B8];
      *(void *)&long long v10 = 138412290;
      long long v25 = v10;
      do
      {
        __int16 v28 = 0;
        double v12 = [(_CNAtomTextView *)self textStorage];
        double v13 = [v12 string];
        int v14 = [v13 characterAtIndex:v6];

        __int16 v28 = v14;
        if (v14 == 65532)
        {
          if ([v9 length])
          {
            uint64_t v15 = (void *)[v9 copy];
            [v5 addObject:v15];
            [v9 setString:&stru_1F0EC0C28];
          }
          uint64_t v16 = [(_CNAtomTextView *)self textStorage];
          v17 = [v16 attributesAtIndex:v6 effectiveRange:0];

          v18 = [v17 objectForKey:v11];
          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [v18 recipient];
              v20 = [v19 pasteboardString];
              [v5 addObject:v20];

              if ([v19 supportsPasteboardUnarchiving])
              {
                [v19 addRecipientToPasteboard:v27];
                v21 = objc_msgSend((id)objc_opt_class(), "os_log");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v25;
                  v30 = v19;
                  _os_log_impl(&dword_1B5AF5000, v21, OS_LOG_TYPE_INFO, "Pasteboard archived recipient:%@", buf, 0xCu);
                }
              }
            }
          }
        }
        else
        {
          v17 = [NSString stringWithCharacters:&v28 length:1];
          [v9 appendString:v17];
        }

        ++v6;
        --v8;
      }
      while (v8);
    }
    if ([v9 length])
    {
      v22 = (void *)[v9 copy];
      [v5 addObject:v22];
    }
    v23 = [v5 componentsJoinedByString:@", "];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v23];
    [v27 addObject:v24];
    [v26 setItemProviders:v27];
  }
}

- (void)paste:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(_CNAtomTextView *)self hostRecipientView];
  if ([v5 enabled])
  {
    char v6 = [(_CNAtomTextView *)self isEditable];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F42C50] generalPasteboard];
      v56[0] = @"kCNPasteboardTypeComposeRecipient";
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
      int v9 = [v7 containsPasteboardTypes:v8 inItemSet:0];

      if (v9)
      {
        long long v10 = [v7 valuesForPasteboardType:@"kCNPasteboardTypeComposeRecipient" inItemSet:0];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          v41 = v7;
          id v42 = v4;
          char v13 = 0;
          uint64_t v14 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v50 != v14) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(*((void *)&v49 + 1) + 8 * i) error:0];
              v17 = objc_msgSend((id)objc_opt_class(), "os_log");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1B5AF5000, v17, OS_LOG_TYPE_INFO, "Pasteboard recipient:%@", (uint8_t *)&buf, 0xCu);
              }

              if (v16)
              {
                v18 = [v16 address];

                if (v18)
                {
                  v19 = [(_CNAtomTextView *)self hostRecipientView];
                  [v19 addRecipient:v16];

                  char v13 = 1;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v12);

          uint64_t v7 = v41;
          id v4 = v42;
          if (v13) {
            goto LABEL_48;
          }
        }
        else
        {
        }
      }
      uint64_t v20 = *MEMORY[0x1E4F5A258];
      v21 = objc_msgSend(v7, "itemProviders", v41, v42);
      LOBYTE(v20) = (*(uint64_t (**)(uint64_t, void *))(v20 + 16))(v20, v21);

      if ((v20 & 1) == 0)
      {
        v22 = [v7 itemProviders];
        v23 = objc_msgSend(v22, "_cn_filter:", &__block_literal_global_733);

        if ([v23 count])
        {
          v24 = [(_CNAtomTextView *)self hostRecipientView];
          [v24 addRecipientsFromContactItemProviders:v23];

LABEL_48:
          goto LABEL_49;
        }
      }
      *(void *)&long long buf = (id)*MEMORY[0x1E4F22688];
      id v25 = (id)*MEMORY[0x1E4F226F0];
      uint64_t v26 = 0;
      *((void *)&buf + 1) = v25;
      char v27 = 1;
      do
      {
        char v28 = v27;
        v29 = [v7 valueForPasteboardType:*(void *)&v55[8 * v26 - 8]];
        if (v29) {
          break;
        }
        char v27 = 0;
        uint64_t v26 = 1;
      }
      while ((v28 & 1) != 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = [[NSString alloc] initWithData:v29 encoding:4];

        v29 = (void *)v30;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = [v29 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

        v32 = [MEMORY[0x1E4F73508] addressListFromEncodedString:v31];
        if ((unint64_t)[v32 count] > 1)
        {
          v33 = [(_CNAtomTextView *)self hostRecipientView];
          v34 = [v33 delegate];
          if (objc_opt_respondsToSelector()) {
            [v34 dismissSearchResultsForComposeRecipientView:v33];
          }
          if (objc_opt_respondsToSelector())
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v35 = v32;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v45 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  [v34 composeRecipientView:v33 didFinishEnteringAddress:*(void *)(*((void *)&v44 + 1) + 8 * j)];
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
              }
              while (v37);
            }
          }
        }
        else
        {
          v48.receiver = self;
          v48.super_class = (Class)_CNAtomTextView;
          [(_CNAtomTextView *)&v48 paste:v4];
        }

        v29 = (void *)v31;
      }
      else
      {
        v43.receiver = self;
        v43.super_class = (Class)_CNAtomTextView;
        [(_CNAtomTextView *)&v43 paste:v4];
      }

      for (uint64_t k = 8; k != -8; k -= 8)
      goto LABEL_48;
    }
  }
  else
  {
  }
LABEL_49:
}

- (void)delete:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  uint64_t v5 = [(_CNAtomTextView *)self selectedRange];
  uint64_t v7 = v6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __26___CNAtomTextView_delete___block_invoke;
  v21[3] = &unk_1E6128F48;
  id v8 = v4;
  id v22 = v8;
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", v5, v7, v21);
  int v9 = [(_CNAtomTextView *)self textStorage];
  uint64_t v10 = [(_CNAtomTextView *)self selectedRange];
  objc_msgSend(v9, "deleteCharactersInRange:", v10, v11);

  -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v12 = [(_CNAtomTextView *)self hostRecipientView];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __26___CNAtomTextView_delete___block_invoke_2;
  v19 = &unk_1E61292C8;
  id v13 = v12;
  id v20 = v13;
  objc_msgSend(v8, "_cn_each:", &v16);
  uint64_t v14 = objc_msgSend(v13, "delegate", v16, v17, v18, v19);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = [(_CNAtomTextView *)self text];
    [v14 composeRecipientView:v13 textDidChange:v15];
  }
}

- (void)cut:(id)a3
{
  id v4 = a3;
  [(_CNAtomTextView *)self copy:v4];
  [(_CNAtomTextView *)self delete:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_CNAtomTextView;
  unsigned __int8 v6 = [(_CNAtomTextView *)&v13 canPerformAction:a3 withSender:a4];
  if (sel_paste_ == a3)
  {
    int v9 = [MEMORY[0x1E4F42C50] generalPasteboard];
    uint64_t v10 = *MEMORY[0x1E4F22688];
    v14[0] = *MEMORY[0x1E4F226F0];
    v14[1] = v10;
    v14[2] = @"kCNPasteboardTypeComposeRecipient";
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    unsigned __int8 v7 = [v9 containsPasteboardTypes:v11 inItemSet:0];
  }
  else
  {
    unsigned __int8 v7 = v6;
    if (sel_delete_ == a3)
    {
      if (CNComposeIsAppDesignedForVisionOS())
      {
        [(_CNAtomTextView *)self selectedRange];
        return v8 != 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return v7;
}

- (id)undoManager
{
  v2 = [(_CNAtomTextView *)self hostRecipientView];
  BOOL v3 = [v2 undoManager];

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double x = a3.x;
  double y = a3.y;
  id v5 = a4;
  unsigned __int8 v6 = [(_CNAtomTextView *)self hostRecipientView];
  unsigned __int8 v7 = [v6 atomContainerView];

  v51.receiver = self;
  v51.super_class = (Class)_CNAtomTextView;
  uint64_t v8 = -[_CNAtomTextView hitTest:withEvent:](&v51, sel_hitTest_withEvent_, v5, x, y);
  int v9 = objc_msgSend(v7, "hitTest:withEvent:", v5, x, y);

  id v10 = v8;
  uint64_t v11 = [(_CNAtomTextView *)self selectedRange];
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    uint64_t v15 = [(_CNAtomTextView *)self textStorage];
    uint64_t v16 = [v15 attributesAtIndex:v13 effectiveRange:0];

    uint64_t v17 = [(_CNAtomTextView *)self textStorage];
    v18 = [v17 attributesAtIndex:v14 + v13 - 1 effectiveRange:0];

    uint64_t v19 = *MEMORY[0x1E4FB06B8];
    id v20 = [v16 objectForKey:*MEMORY[0x1E4FB06B8]];
    uint64_t v21 = [v18 objectForKey:v19];
    id v22 = (void *)v21;
    id v23 = v10;
    if (v20)
    {
      id v23 = v10;
      if (v21)
      {
        objc_opt_class();
        id v23 = v10;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v23 = v10;
          if (objc_opt_isKindOfClass())
          {
            v24 = [v16 objectForKey:v19];
            id v25 = [v24 atomView];

            [v25 frame];
            double v27 = v26;
            double v29 = v28;
            CGAffineTransformMakeTranslation(&v50, 0.0, -6.0);
            CGFloat v30 = v50.tx + v29 * v50.c + v50.a * v27;
            CGFloat v31 = v50.ty + v29 * v50.d + v50.b * v27;
            v32 = [v18 objectForKey:v19];
            v33 = [v32 atomView];

            [v33 frame];
            CGFloat v34 = v53.origin.x;
            CGFloat v35 = v53.origin.y;
            CGFloat width = v53.size.width;
            CGFloat height = v53.size.height;
            double MaxX = CGRectGetMaxX(v53);
            v54.origin.double x = v34;
            v54.origin.double y = v35;
            v54.size.CGFloat width = width;
            v54.size.CGFloat height = height;
            double MaxY = CGRectGetMaxY(v54);
            CGAffineTransformMakeTranslation(&v49, 0.0, 6.0);
            v38.f64[0] = x;
            v38.f64[1] = y;
            float64x2_t v39 = vsubq_f64(vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v49.c, MaxY), *(float64x2_t *)&v49.a, MaxX)), v38);
            double v40 = sqrt(vaddvq_f64(vmulq_f64(v39, v39)));
            BOOL v41 = sqrt((v30 - x) * (v30 - x) + (v31 - y) * (v31 - y)) <= 14.0 || v40 <= 14.0;
            id v23 = v10;
            if (!v41)
            {
              if (v9) {
                id v42 = v9;
              }
              else {
                id v42 = v10;
              }
              id v23 = v42;
            }
          }
        }
      }
    }
  }
  else
  {
    if (v9) {
      objc_super v43 = v9;
    }
    else {
      objc_super v43 = v10;
    }
    id v23 = v43;
    uint64_t v16 = v10;
  }

  return v23;
}

- (id)keyCommands
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30___CNAtomTextView_keyCommands__block_invoke;
  block[3] = &unk_1E6128548;
  block[4] = self;
  if (keyCommands_onceToken != -1) {
    dispatch_once(&keyCommands_onceToken, block);
  }
  return (id)keyCommands_keyCommands;
}

- (void)upArrowPressed
{
}

- (void)downArrowPressed
{
  BOOL v3 = [(_CNAtomTextView *)self notifyDelegateWithVoidSelector:sel_selectNextSearchResultForComposeRecipientView_];
  id v5 = [(_CNAtomTextView *)self hostRecipientView];
  id v4 = [v5 delegate];
  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 presentSearchResultsForComposeRecipientView:v5];
  }
}

- (void)leftArrowPressed
{
  uint64_t v3 = [(_CNAtomTextView *)self effectiveUserInterfaceLayoutDirection];
  id v4 = &selRef_collapseSelectedSearchResultForComposeRecipientView_;
  if (v3) {
    id v4 = &selRef_expandSelectedSearchResultForComposeRecipientView_;
  }
  if (![(_CNAtomTextView *)self notifyDelegateWithBooleanSelector:*v4])
  {
    uint64_t v5 = [(_CNAtomTextView *)self selectedRange];
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    uint64_t v8 = !v7;
    -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", v5 - v8, 0);
  }
}

- (void)rightArrowPressed
{
  uint64_t v3 = [(_CNAtomTextView *)self effectiveUserInterfaceLayoutDirection];
  id v4 = &selRef_expandSelectedSearchResultForComposeRecipientView_;
  if (v3) {
    id v4 = &selRef_collapseSelectedSearchResultForComposeRecipientView_;
  }
  if (![(_CNAtomTextView *)self notifyDelegateWithBooleanSelector:*v4])
  {
    uint64_t v5 = [(_CNAtomTextView *)self selectedRange];
    if (v6) {
      uint64_t v7 = v5 + v6;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", v7, 0);
  }
}

- (void)returnPressed
{
  if ([(_CNAtomTextView *)self hostRecipientViewHasSearchResults])
  {
    uint64_t v3 = [(_CNAtomTextView *)self hostRecipientView];
    id v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(_CNAtomTextView *)self hostRecipientView];
      uint64_t v7 = [v6 delegate];
      uint64_t v8 = [(_CNAtomTextView *)self hostRecipientView];
      char v9 = [v7 chooseSelectedSearchResultForComposeRecipientView:v8 context:2];

      if ((v9 & 1) == 0)
      {
        id v13 = [(_CNAtomTextView *)self hostRecipientView];
        [v13 finishEnteringRecipient];
      }
      return;
    }
    uint64_t v12 = sel_chooseSelectedSearchResultForComposeRecipientView_;
  }
  else
  {
    if (![(_CNAtomTextView *)self hostRecipientViewHasSearchTextOrTokensAndNoSearchResults])return; {
    id v10 = [(_CNAtomTextView *)self hostRecipientView];
    }
    char v11 = [v10 finishEnteringRecipient];

    if (v11) {
      return;
    }
    uint64_t v12 = sel_composeRecipientViewReturnPressed_;
  }

  [(_CNAtomTextView *)self notifyDelegateWithVoidSelector:v12];
}

- (void)tabPressed
{
  BOOL v3 = [(_CNAtomTextView *)self hostRecipientViewHasSearchResults];
  id v4 = [(_CNAtomTextView *)self hostRecipientView];
  char v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v16 = [(_CNAtomTextView *)self hostRecipientView];
      uint64_t v8 = [v16 delegate];
      char v9 = [(_CNAtomTextView *)self hostRecipientView];
      [v8 chooseSelectedSearchResultForComposeRecipientView:v9 context:1];

      return;
    }
    char v11 = sel_chooseSelectedSearchResultForComposeRecipientView_;
    goto LABEL_12;
  }
  int v10 = [v4 finishEnteringRecipient];

  if (v10) {
    return;
  }
  uint64_t v12 = [(_CNAtomTextView *)self hostRecipientView];
  id v13 = [v12 delegate];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    char v11 = sel_composeRecipientViewReturnPressed_;
LABEL_12:
    uint64_t v15 = self;
    goto LABEL_13;
  }
  uint64_t v15 = self;
  char v11 = sel_composeRecipientViewTabPressed_;
LABEL_13:

  [(_CNAtomTextView *)v15 notifyDelegateWithVoidSelector:v11];
}

- (void)commaPressed
{
  if (![(_CNAtomTextView *)self hostRecipientViewHasSearchResults])
  {
    if (![(_CNAtomTextView *)self hostRecipientViewHasSearchTextOrTokensAndNoSearchResults])return; {
    goto LABEL_4;
    }
  }
  BOOL v3 = [(_CNAtomTextView *)self hostRecipientView];
  id v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(_CNAtomTextView *)self hostRecipientView];
    char v7 = [v6 delegate];
    uint64_t v8 = [(_CNAtomTextView *)self hostRecipientView];
    char v9 = [v7 chooseSelectedSearchResultForComposeRecipientView:v8 context:3];

    if (v9) {
      return;
    }
LABEL_4:
    id v10 = [(_CNAtomTextView *)self hostRecipientView];
    [v10 finishEnteringRecipient];

    return;
  }

  [(_CNAtomTextView *)self notifyDelegateWithVoidSelector:sel_chooseSelectedSearchResultForComposeRecipientView_];
}

- (void)escKeyPressed
{
  BOOL v3 = [(_CNAtomTextView *)self hostRecipientView];
  id v5 = [v3 delegate];

  if ([(_CNAtomTextView *)self hostRecipientViewHasSearchResults]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [(_CNAtomTextView *)self hostRecipientView];
    [v5 dismissSearchResultsForComposeRecipientView:v4];
  }
  else
  {
    id v4 = [(_CNAtomTextView *)self hostRecipientView];
    [v4 clearText];
  }
}

- (BOOL)notifyDelegateWithVoidSelector:(SEL)a3
{
  return [(_CNAtomTextView *)self notifyDelegateWithSelector:a3 checkReturnValue:0];
}

- (BOOL)notifyDelegateWithBooleanSelector:(SEL)a3
{
  return [(_CNAtomTextView *)self notifyDelegateWithSelector:a3 checkReturnValue:1];
}

- (BOOL)notifyDelegateWithSelector:(SEL)a3 checkReturnValue:(BOOL)a4
{
  BOOL v4 = a4;
  char v15 = 0;
  id v14 = [(_CNAtomTextView *)self hostRecipientView];
  char v7 = [v14 delegate];
  if (([(_CNAtomTextView *)self hostRecipientViewHasSearchResults]
     || (sel_composeRecipientViewReturnPressed_ != a3 ? (BOOL v8 = sel_composeRecipientViewTabPressed_ == a3) : (BOOL v8 = 1), v8))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v9 = (void *)MEMORY[0x1E4F1CA18];
    id v10 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    char v11 = [v9 invocationWithMethodSignature:v10];

    [v11 setSelector:a3];
    [v11 setTarget:v7];
    [v11 setArgument:&v14 atIndex:2];
    [v11 invoke];
    if (v4) {
      [v11 getReturnValue:&v15];
    }

    BOOL v12 = v15 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)hostRecipientViewHasSearchResults
{
  v2 = [(_CNAtomTextView *)self hostRecipientView];
  BOOL v3 = [v2 delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 composeRecipientViewShowingSearchResults:v2];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hostRecipientViewHasSearchTextOrTokensAndNoSearchResults
{
  if ([(_CNAtomTextView *)self hostRecipientViewHasSearchResults]) {
    return 0;
  }
  char v4 = [(_CNAtomTextView *)self hostRecipientView];
  id v5 = [v4 text];
  if ([v5 length])
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v6 = [(_CNAtomTextView *)self atoms];
    BOOL v3 = [v6 count] != 0;
  }
  return v3;
}

- (CNComposeRecipientTextView)hostRecipientView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostRecipientView);

  return (CNComposeRecipientTextView *)WeakRetained;
}

- (void)setHostRecipientView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
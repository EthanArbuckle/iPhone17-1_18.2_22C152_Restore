@interface _MFAtomTextView
- (BOOL)_delegateSupportsKeyboardEvents;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isEditingTextStorage;
- (BOOL)resignFirstResponder;
- (CGRect)convertGlyphRect:(CGRect)a3;
- (MFComposeRecipientTextView)hostRecipientView;
- (NSArray)atoms;
- (_MFAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (int64_t)baseWritingDirection;
- (void)_handleKeyUIEvent:(id)a3;
- (void)batchTextStorageUpdates:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)enumerateAtomAttachments:(id)a3;
- (void)enumerateAtoms:(id)a3;
- (void)enumerateAtomsInCharacterRange:(_NSRange)a3 withBlock:(id)a4;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setHostRecipientView:(id)a3;
@end

@implementation _MFAtomTextView

- (_MFAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MFAtomTextView;
  v10 = -[_MFAtomTextView initWithFrame:textContainer:](&v15, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v14.receiver = v10;
    v14.super_class = (Class)_MFAtomTextView;
    v12 = [(_MFAtomTextView *)&v14 undoManager];
    [v12 disableUndoRegistration];

    v11->_textStorageEditingDepth = 0;
  }

  return v11;
}

- (NSArray)atoms
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24___MFAtomTextView_atoms__block_invoke;
  v6[3] = &unk_1E5F79B48;
  id v4 = v3;
  id v7 = v4;
  [(_MFAtomTextView *)self enumerateAtoms:v6];

  return (NSArray *)v4;
}

- (CGRect)convertGlyphRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_MFAtomTextView *)self textContainerInset];
  double v9 = y + v8;
  [(_MFAtomTextView *)self textContainerInset];
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
  id v5 = a3;
  id v4 = [(_MFAtomTextView *)self textStorage];
  -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", 0, [v4 length], v5);
}

- (void)enumerateAtomsInCharacterRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  double v8 = [(_MFAtomTextView *)self textStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60___MFAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke;
  v10[3] = &unk_1E5F79E30;
  id v9 = v7;
  id v11 = v9;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v10);
}

- (void)enumerateAtomAttachments:(id)a3
{
  id v4 = a3;
  id v5 = [(_MFAtomTextView *)self textStorage];
  v6 = [(_MFAtomTextView *)self textStorage];
  uint64_t v7 = [v6 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___MFAtomTextView_enumerateAtomAttachments___block_invoke;
  v9[3] = &unk_1E5F79E30;
  id v8 = v4;
  id v10 = v8;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);
}

- (BOOL)isEditingTextStorage
{
  return self->_textStorageEditingDepth != 0;
}

- (void)batchTextStorageUpdates:(id)a3
{
  uint64_t v7 = (void (**)(void))a3;
  ++self->_textStorageEditingDepth;
  id v4 = [(_MFAtomTextView *)self textStorage];
  [v4 beginEditing];

  v7[2]();
  --self->_textStorageEditingDepth;
  id v5 = [(_MFAtomTextView *)self textStorage];
  [v5 endEditing];

  v6 = [(_MFAtomTextView *)self hostRecipientView];
  [v6 _recomputeTextContainerExclusionPaths];
}

- (BOOL)becomeFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextView;
  BOOL v3 = [(_MFAtomTextView *)&v8 becomeFirstResponder];
  id v4 = [(_MFAtomTextView *)self hostRecipientView];
  id v5 = v4;
  if (v3 && v4 != 0) {
    [v4 atomTextViewDidBecomeFirstResponder:self];
  }

  return v3;
}

- (BOOL)resignFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextView;
  BOOL v3 = [(_MFAtomTextView *)&v8 resignFirstResponder];
  id v4 = [(_MFAtomTextView *)self hostRecipientView];
  id v5 = v4;
  if (v3 && v4 != 0) {
    [v4 atomTextViewDidResignFirstResponder:self];
  }

  return v3;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  uint64_t v5 = [(_MFAtomTextView *)self selectedRange];
  uint64_t v7 = v6;
  objc_super v8 = [(_MFAtomTextView *)self textStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42___MFAtomTextView_selectionRectsForRange___block_invoke;
  v13[3] = &unk_1E5F79E58;
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
  v8.super_class = (Class)_MFAtomTextView;
  id v4 = [(_MFAtomTextView *)&v8 textStylingAtPosition:a3 inDirection:a4];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4FB06C0]];

  return v5;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    v6.receiver = self;
    v6.super_class = (Class)_MFAtomTextView;
    -[_MFAtomTextView setContentOffset:](&v6, sel_setContentOffset_, x, y);
  }
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MFAtomTextView;
  [(_MFAtomTextView *)&v6 makeTextWritingDirectionLeftToRight:v4];
  uint64_t v5 = [(_MFAtomTextView *)self hostRecipientView];
  [v5 atomTextView:self didChangeWritingDirection:0];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MFAtomTextView;
  [(_MFAtomTextView *)&v6 makeTextWritingDirectionRightToLeft:v4];
  uint64_t v5 = [(_MFAtomTextView *)self hostRecipientView];
  [v5 atomTextView:self didChangeWritingDirection:1];
}

- (int64_t)baseWritingDirection
{
  BOOL v3 = [(_MFAtomTextView *)self textStorage];
  uint64_t v4 = [v3 length];

  uint64_t v5 = (void *)MEMORY[0x1E4FB0738];
  if (v4)
  {
    if ([(_MFAtomTextView *)self selectedRange] != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v6 = [(_MFAtomTextView *)self textStorage];
      uint64_t v7 = [v6 attributesAtIndex:0 effectiveRange:0];

      objc_super v8 = [v7 objectForKey:*v5];

      if (v8) {
        goto LABEL_5;
      }
    }
  }
  id v9 = [(_MFAtomTextView *)self typingAttributes];
  objc_super v8 = [v9 objectForKey:*v5];

  if (v8) {
LABEL_5:
  }
    int64_t v10 = [v8 baseWritingDirection];
  else {
    int64_t v10 = -1;
  }

  return v10;
}

- (void)copy:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  [(_MFAtomTextView *)self selectedRange];
  if (v4)
  {
    v25 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v26 = [MEMORY[0x1E4F1CA48] array];
    v27 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v5 = [(_MFAtomTextView *)self selectedRange];
    uint64_t v7 = v6;
    objc_super v8 = [MEMORY[0x1E4F28E78] string];
    if (v5 < v5 + v7)
    {
      uint64_t v9 = *MEMORY[0x1E4FB06B8];
      do
      {
        __int16 v28 = -21846;
        int64_t v10 = [(_MFAtomTextView *)self textStorage];
        id v11 = [v10 string];
        int v12 = [v11 characterAtIndex:v5];

        __int16 v28 = v12;
        if (v12 == 65532)
        {
          if ([v8 length])
          {
            double v13 = (void *)[v8 copy];
            [v27 addObject:v13];
            [v8 setString:&stru_1F0817A00];
          }
          id v14 = [(_MFAtomTextView *)self textStorage];
          uint64_t v15 = [v14 attributesAtIndex:v5 effectiveRange:0];

          uint64_t v16 = [v15 objectForKey:v9];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [v16 recipient];
              v18 = [v17 uncommentedAddress];
              [v27 addObject:v18];

              v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
              v31 = @"kMFPasteboardTypeComposeRecipient";
              v32[0] = v19;
              v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
              [v26 addObject:v20];
            }
          }
        }
        else
        {
          uint64_t v15 = [NSString stringWithCharacters:&v28 length:1];
          [v8 appendString:v15];
        }

        ++v5;
        --v7;
      }
      while (v7);
    }
    if ([v8 length])
    {
      v21 = (void *)[v8 copy];
      [v27 addObject:v21];
    }
    v22 = [v27 componentsJoinedByString:@", "];
    v23 = [(id)*MEMORY[0x1E4F444F0] identifier];
    v29 = v23;
    v30 = v22;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v26 addObject:v24];

    [v25 setItems:v26];
  }
}

- (void)paste:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v43[0] = @"kMFPasteboardTypeComposeRecipient";
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  int v6 = [v4 containsPasteboardTypes:v5 inItemSet:0];

  if (v6)
  {
    [v4 valuesForPasteboardType:@"kMFPasteboardTypeComposeRecipient" inItemSet:0];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(*((void *)&v35 + 1) + 8 * i) error:0];
          if (v11)
          {
            int v12 = [(_MFAtomTextView *)self hostRecipientView];
            [v12 addRecipient:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v40 = [(id)*MEMORY[0x1E4F44470] identifier];
    uint64_t v13 = [(id)*MEMORY[0x1E4F444F0] identifier];
    uint64_t v14 = 0;
    unint64_t v41 = v13;
    char v15 = 1;
    do
    {
      uint64_t v16 = [v4 valueForPasteboardType:*(&v40 + v14)];
      char v17 = (v16 == 0) & v15;
      uint64_t v14 = 1;
      char v15 = 0;
    }
    while ((v17 & 1) != 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [[NSString alloc] initWithData:v16 encoding:4];

      uint64_t v16 = (void *)v18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v16 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

      v20 = [MEMORY[0x1E4F73508] addressListFromEncodedString:v19];
      if ((unint64_t)[v20 count] > 1)
      {
        v21 = [(_MFAtomTextView *)self hostRecipientView];
        v22 = [v21 delegate];
        if (objc_opt_respondsToSelector()) {
          [v22 dismissSearchResultsForComposeRecipientView:v21];
        }
        if (objc_opt_respondsToSelector())
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v23 = v20;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v31 != v25) {
                  objc_enumerationMutation(v23);
                }
                [v22 composeRecipientView:v21 didFinishEnteringAddress:*(void *)(*((void *)&v30 + 1) + 8 * j)];
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v24);
          }
        }
      }
      else
      {
        v34.receiver = self;
        v34.super_class = (Class)_MFAtomTextView;
        [(_MFAtomTextView *)&v34 paste:v28];
      }

      uint64_t v16 = (void *)v19;
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)_MFAtomTextView;
      [(_MFAtomTextView *)&v29 paste:v28];
    }

    for (uint64_t k = 8; k != -8; k -= 8)
  }
}

- (void)cut:(id)a3
{
  id v7 = a3;
  -[_MFAtomTextView copy:](self, "copy:");
  uint64_t v4 = [(_MFAtomTextView *)self textStorage];
  uint64_t v5 = [(_MFAtomTextView *)self selectedRange];
  objc_msgSend(v4, "deleteCharactersInRange:", v5, v6);

  -[_MFAtomTextView setSelectedRange:](self, "setSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (sel_paste_ == a3)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    uint64_t v9 = [(id)*MEMORY[0x1E4F444F0] identifier];
    v14[0] = v9;
    int64_t v10 = [(id)*MEMORY[0x1E4F44470] identifier];
    v14[1] = v10;
    v14[2] = @"kMFPasteboardTypeComposeRecipient";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    unsigned __int8 v7 = [v8 containsPasteboardTypes:v11 inItemSet:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_MFAtomTextView;
    unsigned __int8 v7 = [(_MFAtomTextView *)&v13 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (id)undoManager
{
  v2 = [(_MFAtomTextView *)self hostRecipientView];
  BOOL v3 = [v2 undoManager];

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double x = a3.x;
  double y = a3.y;
  id v5 = a4;
  id v6 = [(_MFAtomTextView *)self hostRecipientView];
  unsigned __int8 v7 = [v6 atomContainerView];

  v57.receiver = self;
  v57.super_class = (Class)_MFAtomTextView;
  uint64_t v8 = -[_MFAtomTextView hitTest:withEvent:](&v57, sel_hitTest_withEvent_, v5, x, y);
  uint64_t v9 = objc_msgSend(v7, "hitTest:withEvent:", v5, x, y);
  id v10 = v8;
  uint64_t v11 = [(_MFAtomTextView *)self selectedRange];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = v11;
    v52 = v7;
    char v15 = [(_MFAtomTextView *)self textStorage];
    uint64_t v16 = [v15 attributesAtIndex:v14 effectiveRange:0];

    char v17 = [(_MFAtomTextView *)self textStorage];
    uint64_t v18 = [v17 attributesAtIndex:v13 + v14 - 1 effectiveRange:0];

    uint64_t v19 = *MEMORY[0x1E4FB06B8];
    v20 = [v16 objectForKey:*MEMORY[0x1E4FB06B8]];
    uint64_t v21 = [v18 objectForKey:v19];
    v22 = (void *)v21;
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
            uint64_t v24 = [v16 objectForKey:v19];
            uint64_t v25 = [v24 atomView];

            [v25 frame];
            double v27 = v26;
            double v29 = v28;
            CGAffineTransformMakeTranslation(&v56, 0.0, -6.0);
            double b = v56.b;
            CGFloat d = v56.d;
            double c = v56.c;
            tdouble y = v56.ty;
            tdouble x = v56.tx;
            double a = v56.a;
            long long v33 = [v18 objectForKey:v19];
            double v48 = d;
            objc_super v34 = [v33 atomView];

            [v34 frame];
            CGFloat v35 = v59.origin.x;
            CGFloat v36 = v59.origin.y;
            CGFloat width = v59.size.width;
            CGFloat height = v59.size.height;
            double MaxX = CGRectGetMaxX(v59);
            v60.origin.double x = v35;
            v60.origin.double y = v36;
            v60.size.CGFloat width = width;
            v60.size.CGFloat height = height;
            double MaxY = CGRectGetMaxY(v60);
            CGAffineTransformMakeTranslation(&v55, 0.0, 6.0);
            v39.f64[0] = x;
            v39.f64[1] = y;
            float64x2_t v40 = vsubq_f64(vaddq_f64(*(float64x2_t *)&v55.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v55.c, MaxY), *(float64x2_t *)&v55.a, MaxX)), v39);
            double v41 = sqrt(vaddvq_f64(vmulq_f64(v40, v40)));
            BOOL v42 = sqrt((tx + v29 * c + a * v27 - x) * (tx + v29 * c + a * v27 - x)+ (ty + v29 * v48 + b * v27 - y) * (ty + v29 * v48 + b * v27 - y)) <= 14.0|| v41 <= 14.0;
            id v23 = v10;
            if (!v42)
            {
              if (v9) {
                v43 = v9;
              }
              else {
                v43 = v10;
              }
              id v23 = v43;
            }
          }
        }
      }
    }

    unsigned __int8 v7 = v52;
  }
  else
  {
    if (v9) {
      v44 = v9;
    }
    else {
      v44 = v10;
    }
    id v23 = v44;
    uint64_t v16 = v10;
  }

  return v23;
}

- (BOOL)_delegateSupportsKeyboardEvents
{
  v2 = [(_MFAtomTextView *)self hostRecipientView];
  BOOL v3 = [v2 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  if ([(_MFAtomTextView *)self _delegateSupportsKeyboardEvents])
  {
    id v5 = [(_MFAtomTextView *)self hostRecipientView];
    id v6 = [v5 delegate];
    if ([v4 type] == 4)
    {
      unsigned __int8 v7 = [v4 _modifiedInput];
      uint64_t v8 = v7;
      uint64_t v9 = (void *)*MEMORY[0x1E4FB2AF8];
      if (v7 == (void *)*MEMORY[0x1E4FB2AF8] || v7 == (void *)*MEMORY[0x1E4FB2B98])
      {
        if ([v6 composeRecipientViewShowingSearchResults:v5])
        {
          if (([v4 _isKeyDown] & 1) == 0)
          {
            if (v8 == v9) {
              [v6 selectNextSearchResultForComposeRecipientView:v5];
            }
            else {
              [v6 selectPreviousSearchResultForComposeRecipientView:v5];
            }
          }
          goto LABEL_29;
        }
        if (v8 == v9
          && [v4 _isKeyDown]
          && ([v6 presentSearchResultsForComposeRecipientView:v5] & 1) != 0)
        {
LABEL_29:

          goto LABEL_26;
        }
      }
      else if ([v7 length] == 1 {
             && ([v8 characterAtIndex:0] == 13
      }
              || [v8 characterAtIndex:0] == 9)
             && [v6 composeRecipientViewShowingSearchResults:v5]
             && [v6 chooseSelectedSearchResultForComposeRecipientView:v5])
      {
        if [v8 characterAtIndex:0] == 9 && (objc_opt_respondsToSelector()) {
          [v6 composeRecipientViewReturnPressed:v5];
        }
        goto LABEL_29;
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)_MFAtomTextView;
    [(_MFAtomTextView *)&v11 _handleKeyUIEvent:v4];
LABEL_26:

    goto LABEL_27;
  }
  v12.receiver = self;
  v12.super_class = (Class)_MFAtomTextView;
  [(_MFAtomTextView *)&v12 _handleKeyUIEvent:v4];
LABEL_27:
}

- (MFComposeRecipientTextView)hostRecipientView
{
  WeakRetaineCGFloat d = objc_loadWeakRetained((id *)&self->_hostRecipientView);

  return (MFComposeRecipientTextView *)WeakRetained;
}

- (void)setHostRecipientView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface PDFTextInputView
- (BOOL)_allowAnimatedUpdateSelectionRectViews;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)isSecureTextEntry;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSDictionary)markedTextStyle;
- (PDFTextInputView)initWithDelegate:(id)a3;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (id)_closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)_selectionForTextRange:(id)a3;
- (id)_targetedPreviewForRange:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4;
- (id)linkRegionsConstrainedToLineAtPoint:(CGPoint)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selection;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (void)_setDimmingViewVisible:(BOOL)a3;
- (void)clearAllDecoratedFoundText;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)deleteBackward;
- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTokenizer:(id)a3;
- (void)unmarkText;
- (void)updateGestureRecognizerDependencies;
- (void)updateTextSelectionGraphics;
@end

@implementation PDFTextInputView

- (PDFTextInputView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFTextInputView;
  v5 = [(PDFTextInputView *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82D28]) initWithTextInput:v6];
    textInputTokenizer = v6->_textInputTokenizer;
    v6->_textInputTokenizer = (UITextInputTokenizer *)v7;

    uint64_t v9 = [MEMORY[0x263F82D30] textInteractionsForSet:1];
    textInteraction = v6->_textInteraction;
    v6->_textInteraction = (UITextInteraction *)v9;

    [(UITextInteraction *)v6->_textInteraction setDelegate:v6];
    [(UITextInteraction *)v6->_textInteraction setTextInput:v6];
    [(PDFTextInputView *)v6 addInteraction:v6->_textInteraction];
  }

  return v6;
}

- (void)updateTextSelectionGraphics
{
  [(UITextInputDelegate *)self->_textInputDelegate selectionWillChange:self];
  textInputDelegate = self->_textInputDelegate;

  [(UITextInputDelegate *)textInputDelegate selectionDidChange:self];
}

- (void)setSelection:(id)a3
{
  if (a3)
  {
    id v4 = +[PDFTextRange textRangeFromSelection:](PDFTextRange, "textRangeFromSelection:");
    textSelectionRange = self->_textSelectionRange;
    id obj = v4;
    if (textSelectionRange)
    {
      BOOL v6 = [(UITextRange *)textSelectionRange isEmpty];
      id v4 = obj;
      int v7 = !v6;
      if (obj)
      {
LABEL_4:
        int v8 = [v4 isEmpty] ^ 1;
LABEL_10:
        if ((v7 | v8) == 1)
        {
          [(UITextInputDelegate *)self->_textInputDelegate textWillChange:self];
          objc_storeStrong((id *)&self->_textSelectionRange, obj);
          [(UITextInputDelegate *)self->_textInputDelegate textDidChange:self];
        }

        return;
      }
    }
    else
    {
      int v7 = 0;
      if (v4) {
        goto LABEL_4;
      }
    }
    int v8 = 0;
    goto LABEL_10;
  }
  [(UITextInputDelegate *)self->_textInputDelegate textWillChange:self];
  uint64_t v9 = self->_textSelectionRange;
  self->_textSelectionRange = 0;

  textInputDelegate = self->_textInputDelegate;

  [(UITextInputDelegate *)textInputDelegate textDidChange:self];
}

- (id)selection
{
  return [(PDFTextInputView *)self _selectionForTextRange:self->_textSelectionRange];
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  if (a7) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  -[UITextInteraction _performGestureType:state:location:locationOfFirstTouch:forTouchType:](self->_textInteraction, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", 2, a4, v7, a5.x, a5.y, a6.x, a6.y);
}

- (void)updateGestureRecognizerDependencies
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(PDFTextInputView *)self gestureRecognizers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [WeakRetained pdfView];
  v19 = [v5 gestureRecognizers];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v19;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_17;
                }
LABEL_16:
                [v9 requireGestureRecognizerToFail:v15];
                goto LABEL_17;
              }
              uint64_t v16 = [v9 numberOfTapsRequired];
              if (v16 == [v15 numberOfTapsRequired]) {
                goto LABEL_16;
              }
LABEL_17:
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
}

- (id)_selectionForTextRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = [WeakRetained pdfView];

    uint64_t v7 = [v6 document];
    uint64_t v8 = v7;
    if (v7 && ([v7 isLocked] & 1) == 0)
    {
      id v10 = [v4 start];
      uint64_t v11 = [v4 end];
      uint64_t v12 = [v10 page];
      uint64_t v13 = [v10 offset];
      uint64_t v14 = [v11 page];
      uint64_t v9 = objc_msgSend(v8, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v12, v13, v14, objc_msgSend(v11, "offset") - 1);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)textInRange:(id)a3
{
  v3 = [(PDFTextInputView *)self _selectionForTextRange:a3];
  id v4 = [v3 string];

  return v4;
}

- (UITextRange)selectedTextRange
{
  return self->_textSelectionRange;
}

- (void)setSelectedTextRange:(id)a3
{
  id v26 = a3;
  v5 = [v26 start];
  uint64_t v6 = [v5 page];
  p_textSelectionRange = &self->_textSelectionRange;
  uint64_t v8 = [(UITextRange *)self->_textSelectionRange start];
  uint64_t v9 = [v8 page];
  if (v6 == v9)
  {
    id v10 = [v26 start];
    uint64_t v11 = [v10 offset];
    uint64_t v12 = [(UITextRange *)*p_textSelectionRange start];
    if (v11 == [v12 offset])
    {
      long long v25 = [v26 end];
      uint64_t v13 = [v25 page];
      uint64_t v14 = [(UITextRange *)*p_textSelectionRange end];
      v15 = [v14 page];
      if (v13 == v15)
      {
        long long v22 = [v26 end];
        uint64_t v24 = [v22 offset];
        long long v21 = [(UITextRange *)*p_textSelectionRange end];
        uint64_t v23 = [v21 offset];

        if (v24 == v23) {
          goto LABEL_11;
        }
        goto LABEL_7;
      }
    }
    uint64_t v9 = v6;
  }

LABEL_7:
  objc_storeStrong((id *)&self->_textSelectionRange, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = [WeakRetained pdfView];

  uint64_t v18 = [v17 document];
  v19 = v18;
  if (v18 && ([v18 isLocked] & 1) == 0)
  {
    long long v20 = [(PDFTextInputView *)self _selectionForTextRange:v26];
    [v17 setCurrentSelection:v20 updateTextInput:0];
  }
LABEL_11:
}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained pdfView];

  id v4 = [v3 document];
  v5 = v4;
  if (!v4 || ([v4 isLocked] & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v6 = (PDFTextPosition *)[v5 pageCount];
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [v5 pageAtIndex:v7];
    uint64_t v9 = [v8 selectionForAll];
    uint64_t v10 = [v9 numberOfTextRangesOnPage:v8];

    if (v10) {
      break;
    }

    if (v6 == (PDFTextPosition *)++v7) {
      goto LABEL_10;
    }
  }
  if (v8)
  {
    uint64_t v6 = [[PDFTextPosition alloc] initWithOffset:0 onPage:v8];
  }
  else
  {
LABEL_10:
    uint64_t v6 = 0;
  }
LABEL_11:

  return (UITextPosition *)v6;
}

- (UITextPosition)endOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained pdfView];

  id v4 = [v3 document];
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if ([v4 isLocked]) {
    goto LABEL_10;
  }
  uint64_t v6 = [v5 pageCount];
  if (v6 < 1) {
    goto LABEL_10;
  }
  uint64_t v7 = v6 + 1;
  while (1)
  {
    uint64_t v8 = [v5 pageAtIndex:v7 - 2];
    uint64_t v9 = [v8 selectionForAll];
    uint64_t v10 = [v9 numberOfTextRangesOnPage:v8];

    if (v10) {
      break;
    }

    if ((unint64_t)--v7 <= 1) {
      goto LABEL_10;
    }
  }
  if (v8)
  {
    uint64_t v11 = [v8 selectionForAll];
    uint64_t v12 = objc_msgSend(v11, "rangeAtIndex:onPage:", objc_msgSend(v11, "numberOfTextRangesOnPage:", v8) - 1, v8);
    uint64_t v14 = [[PDFTextPosition alloc] initWithOffset:v12 + v13 onPage:v8];
  }
  else
  {
LABEL_10:
    uint64_t v14 = 0;
  }

  return (UITextPosition *)v14;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PDFTextRange alloc] initFromPos:v6 toPos:v5];

  return v7;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return [(PDFTextInputView *)self positionFromPosition:a3 inDirection:2 offset:a4];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v7 = a3;
  if (a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = [WeakRetained pdfView];

    uint64_t v10 = [v9 document];
    uint64_t v11 = v10;
    if (v10 && ([v10 isLocked] & 1) == 0)
    {
      v15 = [v7 page];
      uint64_t v16 = [v7 offset];
      v17 = [v7 page];
      uint64_t v18 = objc_msgSend(v11, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v15, v16, v17, objc_msgSend(v7, "offset"));

      if (a5 < 0)
      {
        [v18 extendSelectionAtStart:-a5];
        id v26 = [v18 pages];
        long long v20 = [v26 firstObject];

        uint64_t v27 = [v18 rangeAtIndex:0 onPage:v20];
        uint64_t v24 = [PDFTextPosition alloc];
        uint64_t v25 = v27;
      }
      else
      {
        [v18 extendSelectionAtEnd:a5];
        v19 = [v18 pages];
        long long v20 = [v19 lastObject];

        uint64_t v21 = objc_msgSend(v18, "rangeAtIndex:onPage:", objc_msgSend(v18, "numberOfTextRangesOnPage:", v20) - 1, v20);
        uint64_t v23 = v22;
        uint64_t v24 = [PDFTextPosition alloc];
        uint64_t v25 = v23 + v21 - 1;
      }
      uint64_t v12 = [(PDFTextPosition *)v24 initWithOffset:v25 onPage:v20];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = [PDFTextPosition alloc];
    uint64_t v14 = [v7 offset];
    uint64_t v9 = [v7 page];
    uint64_t v12 = [(PDFTextPosition *)v13 initWithOffset:v14 onPage:v9];
  }

  return v12;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v7 page];
  uint64_t v9 = [v8 document];
  uint64_t v10 = [v9 indexForPage:v8];

  id v11 = v6;
  uint64_t v12 = [v11 page];
  uint64_t v13 = [v12 document];
  uint64_t v14 = [v13 indexForPage:v12];

  if (v10 < v14)
  {
LABEL_5:
    int64_t v15 = -1;
    goto LABEL_6;
  }
  if (v10 <= v14)
  {
    uint64_t v16 = [v7 offset];
    if (v16 >= [v11 offset])
    {
      uint64_t v18 = [v7 offset];
      int64_t v15 = v18 > [v11 offset];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v15 = 1;
LABEL_6:

  return v15;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [WeakRetained pdfView];

  uint64_t v10 = [v9 document];
  id v11 = v10;
  if (v10 && ([v10 isLocked] & 1) == 0)
  {
    id v13 = v6;
    if (v7)
    {
      id v14 = v7;
    }
    else
    {
      id v14 = [(PDFTextInputView *)self endOfDocument];
    }
    int64_t v15 = v14;
    uint64_t v16 = [v13 page];
    uint64_t v17 = [v13 offset];
    uint64_t v18 = [v15 page];
    v38 = v15;
    v19 = objc_msgSend(v11, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v16, v17, v18, objc_msgSend(v15, "offset"));

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v20 = [v19 pages];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v34 = v13;
      v35 = v9;
      id v36 = v7;
      id v37 = v6;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v27 = [v19 numberOfTextRangesOnPage:v26];
          if (v27)
          {
            uint64_t v28 = v27;
            for (uint64_t j = 0; j != v28; ++j)
            {
              [v19 rangeAtIndex:j onPage:v26];
              v23 += v30;
            }
          }
          v31 = [v19 pages];
          v32 = [v31 firstObject];

          if (v26 != v32) {
            ++v23;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v22);
      int64_t v12 = v23 - 1;
      id v7 = v36;
      id v6 = v37;
      id v13 = v34;
      uint64_t v9 = v35;
    }
    else
    {
      int64_t v12 = -1;
    }
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (UITextInputDelegate)inputDelegate
{
  return self->_textInputDelegate;
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  return self->_textInputTokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 3)
  {
    uint64_t v7 = [v5 start];
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    uint64_t v7 = [v5 end];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PDFTextInputView *)self positionFromPosition:v6 inDirection:a4 offset:1];
  uint64_t v8 = [(PDFTextInputView *)self textRangeFromPosition:v6 toPosition:v7];

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pdfView];

  uint64_t v7 = [v6 document];
  uint64_t v8 = v7;
  if (v7 && ![v7 isLocked])
  {
    id v13 = [(PDFTextInputView *)self _selectionForTextRange:v4];
    id v14 = v13;
    if (v13)
    {
      int64_t v15 = [v13 pages];
      uint64_t v16 = [v15 firstObject];

      [v14 firstSpanBoundsForPage:v16];
      objc_msgSend(v6, "convertRect:fromPage:", v16);
      objc_msgSend(v6, "convertRect:toView:", self);
      double v9 = v17;
      double v10 = v18;
      double v11 = v19;
      double v12 = v20;
    }
    else
    {
      double v9 = *MEMORY[0x263F001A0];
      double v10 = *(double *)(MEMORY[0x263F001A0] + 8);
      double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v12 = *(double *)(MEMORY[0x263F001A0] + 24);
    }
  }
  else
  {
    double v9 = *MEMORY[0x263F001A0];
    double v10 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  double v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pdfView];

  uint64_t v7 = [v6 document];
  uint64_t v8 = v7;
  if (v7 && ![v7 isLocked])
  {
    id v13 = v4;
    id v14 = [v13 page];
    uint64_t v15 = [v13 offset];

    uint64_t v16 = [v8 selectionFromPage:v14 atCharacterIndex:v15 toPage:v14 atCharacterIndex:v15];
    [v16 boundsForPage:v14];
    objc_msgSend(v6, "convertRect:fromPage:", v14);
    objc_msgSend(v6, "convertRect:toView:", self);
    double v9 = v17;
    double v10 = v18;
    double v11 = v19;
    double v12 = v20;
  }
  else
  {
    double v9 = *MEMORY[0x263F001A0];
    double v10 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  double v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pdfView];

  uint64_t v7 = [v6 document];
  uint64_t v8 = v7;
  if (v7 && ([v7 isLocked] & 1) == 0)
  {
    double v10 = [(PDFTextInputView *)v31 _selectionForTextRange:v4];
    if (v10)
    {
      v29 = v8;
      id v30 = v4;
      uint64_t v28 = v10;
      double v11 = [v10 selectionsByLine];
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            double v18 = [v17 pages];
            double v19 = [v18 firstObject];

            [v17 boundsForPage:v19];
            objc_msgSend(v6, "convertRect:fromPage:", v19);
            objc_msgSend(v6, "convertRect:toView:", v31);
            double v24 = -[PDFTextSelectionRect initWithRect:onPage:]([PDFTextSelectionRect alloc], "initWithRect:onPage:", v19, v20, v21, v22, v23);
            uint64_t v25 = [v12 firstObject];

            if (v17 == v25) {
              [(PDFTextSelectionRect *)v24 setIsStartingRect:1];
            }
            id v26 = [v12 lastObject];

            if (v17 == v26) {
              [(PDFTextSelectionRect *)v24 setIsEndingRect:1];
            }
            [v9 addObject:v24];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v14);
      }

      uint64_t v8 = v29;
      id v4 = v30;
      double v10 = v28;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained pdfView];

  double v10 = [v9 document];
  double v11 = v10;
  if (!v10 || ([v10 isLocked] & 1) != 0)
  {
    id v12 = 0;
    goto LABEL_17;
  }
  -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  double v14 = v13;
  double v16 = v15;
  double v17 = objc_msgSend(v9, "pageForPoint:nearest:", 1);
  if (v17)
  {
    double v18 = [v7 start];
    double v19 = [v7 end];
    if (v7)
    {
      double v20 = [v18 page];
      unint64_t v21 = [v11 indexForPage:v20];

      double v22 = [v19 page];
      unint64_t v23 = [v11 indexForPage:v22];

      unint64_t v24 = [v11 indexForPage:v17];
      id v12 = 0;
      if (v24 < v21 || v24 > v23) {
        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "convertPoint:toPage:", v17, v14, v16);
    double v26 = v25;
    double v28 = v27;
    v29 = objc_msgSend(v17, "selectionForCharacterAtPoint:");
    id v30 = v29;
    if (v29)
    {
      uint64_t v31 = [v29 rangeAtIndex:0 onPage:v17];
    }
    else
    {
      uint64_t v31 = objc_msgSend(v17, "characterIndexNearestPoint:", v26, v28);
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
    }
    id v12 = [[PDFTextPosition alloc] initWithOffset:v31 onPage:v17];
    goto LABEL_14;
  }
  id v12 = 0;
LABEL_16:

LABEL_17:

  return v12;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return -[PDFTextInputView _closestPositionToPoint:withinRange:](self, "_closestPositionToPoint:withinRange:", 0, a3.x, a3.y);
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  id v4 = -[PDFTextInputView _closestPositionToPoint:withinRange:](self, "_closestPositionToPoint:withinRange:", 0, a3.x, a3.y);
  id v5 = [(PDFTextInputView *)self positionFromPosition:v4 offset:1];
  id v6 = [[PDFTextRange alloc] initFromPos:v4 toPos:v5];

  return v6;
}

- (BOOL)_allowAnimatedUpdateSelectionRectViews
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (BOOL)isSecureTextEntry
{
  return 0;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
}

- (void)unmarkText
{
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
}

- (void)deleteBackward
{
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [WeakRetained pdfView];

  id v9 = [v8 document];
  double v10 = v9;
  if (!v9
    || ([v9 isLocked] & 1) != 0
    || [v8 isInMarkupMode] && !objc_msgSend(v8, "isTextSelectionEnabled"))
  {
    LOBYTE(v18) = 0;
  }
  else
  {
    -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    double v12 = v11;
    double v14 = v13;
    double v15 = objc_msgSend(v8, "pageForPoint:nearest:", 1);
    if (v15)
    {
      objc_msgSend(v8, "convertPoint:toPage:", v15, v12, v14);
      double v16 = objc_msgSend(v15, "annotationAtPoint:");
      double v17 = [v16 valueForAnnotationKey:@"/FT"];
      if ([v17 isEqualToString:@"/Tx"]) {
        LOBYTE(v18) = 0;
      }
      else {
        int v18 = [v17 isEqualToString:@"/Ch"] ^ 1;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (id)linkRegionsConstrainedToLineAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained pdfView];

  v38 = self;
  -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = objc_msgSend(v7, "pageForPoint:nearest:", 1);
  if (v12)
  {
    objc_msgSend(v7, "convertPoint:toPage:", v12, v9, v11);
    double v13 = objc_msgSend(v12, "selectionForLineAtPoint:");
    if (v13)
    {
      id v36 = v13;
      [v13 boundsForPage:v12];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      id v39 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v37 = v12;
      double v22 = [v12 annotations];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v41 != v25) {
              objc_enumerationMutation(v22);
            }
            double v27 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            double v28 = [v27 valueForAnnotationKey:@"/Subtype"];
            int v29 = [v28 isEqualToString:@"/Link"];

            if (v29)
            {
              [v27 bounds];
              double v30 = v47.origin.x;
              double v31 = v47.origin.y;
              double width = v47.size.width;
              double height = v47.size.height;
              v48.origin.double x = v15;
              v48.origin.double y = v17;
              v48.size.double width = v19;
              v48.size.double height = v21;
              if (PDFRectIntersectsRect(v47, v48))
              {
                objc_msgSend(v7, "convertRect:fromPage:", v37, v30, v31, width, height);
                objc_msgSend(v7, "convertRect:toView:", v38);
                long long v34 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:");
                [v39 addObject:v34];
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v24);
      }

      double v13 = v36;
      double v12 = v37;
    }
    else
    {
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (void)_setDimmingViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL dimmingViewVisible = self->_dimmingViewVisible;
  self->_BOOL dimmingViewVisible = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained pdfView];
  double v8 = [v7 documentView];

  if (dimmingViewVisible || !v3)
  {
    if (dimmingViewVisible && !v3)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke_2;
      v16[3] = &unk_264203940;
      v16[4] = self;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke_3;
      v15[3] = &unk_264203C98;
      v15[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v16 animations:v15 completion:0.2];
    }
  }
  else
  {
    searchDimmingView = self->_searchDimmingView;
    if (!searchDimmingView)
    {
      id v11 = objc_alloc(MEMORY[0x263F82D48]);
      [v8 bounds];
      double v12 = (UITextSearchingDimmingView *)objc_msgSend(v11, "initWithFrame:");
      double v13 = self->_searchDimmingView;
      self->_searchDimmingView = v12;

      searchDimmingView = self->_searchDimmingView;
    }
    double v14 = [(UITextSearchingDimmingView *)searchDimmingView superview];

    if (!v14) {
      [v8 addSubview:self->_searchDimmingView];
    }
    [(UITextSearchingDimmingView *)self->_searchDimmingView setAlpha:0.0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke;
    v17[3] = &unk_264203940;
    v17[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:4 delay:v17 options:0 animations:0.2 completion:0.0];
  }
  if (v3) {
    [v8 bringSubviewToFront:self->_searchDimmingView];
  }
}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:1.0];
}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:0.0];
}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 464) removeFromSuperview];
  }
  return result;
}

- (id)_targetedPreviewForRange:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pdfView];

  id v7 = [(PDFTextInputView *)self _selectionForTextRange:v4];
  double v8 = [v7 pages];
  double v9 = [v8 objectAtIndex:0];

  uint64_t v45 = v7;
  [v7 boundsForPage:v9];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  double v15 = v14;
  uint64_t v17 = v16;
  objc_msgSend(v6, "convertRect:fromPage:", v9);
  double v46 = v18;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = PDFScreenGetBackingScaleFactor() * (v21 / v15);
  double v26 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v22, v24);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __45__PDFTextInputView__targetedPreviewForRange___block_invoke;
  v52[3] = &unk_264203CC0;
  id v43 = v9;
  uint64_t v44 = v26;
  id v53 = v43;
  uint64_t v54 = v11;
  uint64_t v55 = v13;
  double v56 = v15;
  uint64_t v57 = v17;
  double v58 = v25;
  double v27 = [v26 imageWithActions:v52];
  double v28 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v27];
  objc_msgSend(v28, "setFrame:", v46, v20, v22, v24);
  [v28 setClipsToBounds:1];
  CGRect v47 = v4;
  int v29 = [(PDFTextInputView *)self selectionRectsForRange:v4];
  double v30 = [MEMORY[0x263EFF980] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = (void *)MEMORY[0x263F08D40];
        [*(id *)(*((void *)&v48 + 1) + 8 * i) rect];
        uint64_t v37 = objc_msgSend(v36, "valueWithCGRect:");
        [v30 addObject:v37];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v33);
  }

  v38 = [MEMORY[0x263F82D10] preferredPreviewParametersForTextLineRects:v30];
  id v39 = objc_alloc(MEMORY[0x263F82AE0]);
  [v6 frame];
  UIRectGetCenter();
  long long v40 = objc_msgSend(v39, "initWithContainer:center:", v6);
  long long v41 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v28 parameters:v38 target:v40];

  return v41;
}

uint64_t __45__PDFTextInputView__targetedPreviewForRange___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 boundsForBox:0];
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, v5 - *(double *)(a1 + 40), v6 - *(double *)(a1 + 48));
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  CGAffineTransform v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  CGAffineTransform v12 = v11;
  uint64_t v7 = [v4 CGContext];

  CGAffineTransform v11 = v12;
  CGContextSetCTM();
  return [*(id *)(a1 + 32) drawWithBox:0 toContext:v7];
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  id v7 = a4;
  double v8 = [(PDFTextInputView *)self _selectionForTextRange:a3];
  CGAffineTransform v9 = [(PDFTextInputView *)self _selectionForTextRange:v7];

  int64_t v10 = [v8 compare:v9];
  return v10;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v13 = [WeakRetained pdfView];

  double v14 = [v13 document];
  [(PDFTextSearchAggregator *)self->_activeSearch invalidate];
  double v15 = [[PDFTextSearchAggregator alloc] initWithSearchString:v11 aggregator:v9];

  activeSearch = self->_activeSearch;
  self->_activeSearch = v15;

  v19[0] = v11;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v18 = [v10 stringCompareOptions];

  [v14 asyncFindStrings:v17 withOptions:v18 withDelegate:self->_activeSearch onQueue:MEMORY[0x263EF83A0]];
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5 == 1)
  {
    foundTextRanges = self->_foundTextRanges;
    if (!foundTextRanges)
    {
      double v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      double v23 = self->_foundTextRanges;
      self->_foundTextRanges = v22;

      foundTextRanges = self->_foundTextRanges;
    }
    [(NSMutableArray *)foundTextRanges addObject:v9];
  }
  else if (a5 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    CGAffineTransform v12 = [WeakRetained pdfView];

    objc_storeStrong((id *)&self->_highlightedTextRange, a3);
    uint64_t v13 = [(PDFTextInputView *)self _selectionForTextRange:v9];
    double v14 = v13;
    if (v13)
    {
      double v15 = [v13 pages];
      uint64_t v16 = [v15 objectAtIndex:0];

      [v14 boundsForPage:v16];
      objc_msgSend(v12, "goToRect:onPage:", v16);
    }
    searchHighlightView = self->_searchHighlightView;
    if (!searchHighlightView)
    {
      objc_initWeak(&location, self);
      id v18 = objc_alloc(MEMORY[0x263F82D10]);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke;
      v25[3] = &unk_264203CE8;
      objc_copyWeak(&v26, &location);
      double v19 = (UITextHighlightView *)[v18 initWithPreviewProvider:v25];
      double v20 = self->_searchHighlightView;
      self->_searchHighlightView = v19;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      searchHighlightView = self->_searchHighlightView;
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke_2;
    v24[3] = &unk_264203940;
    v24[4] = self;
    [(UITextHighlightView *)searchHighlightView animateWithCompletion:v24];
  }
  [(PDFTextInputView *)self setNeedsLayout];
}

id __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _targetedPreviewForRange:WeakRetained[59]];

  return v2;
}

void __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
  BOOL v3 = [WeakRetained pdfView];
  id v4 = [v3 findInteraction];
  char v5 = [v4 isFindNavigatorVisible];

  if ((v5 & 1) == 0)
  {
    double v6 = *(void **)(*(void *)(a1 + 32) + 456);
    [v6 fadeAwayWithCompletion:0];
  }
}

- (void)clearAllDecoratedFoundText
{
  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  [(NSMutableArray *)self->_foundTextRanges removeAllObjects];
  [(PDFTextInputView *)self _setDimmingViewVisible:0];

  [(PDFTextInputView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)PDFTextInputView;
  [(PDFTextInputView *)&v69 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained pdfView];

  char v5 = [v4 documentView];
  double v6 = [v4 documentScrollView];
  v52 = v4;
  id v7 = [v4 findInteraction];
  int v8 = [v7 isFindNavigatorVisible];

  if ([(NSMutableArray *)self->_foundTextRanges count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  id v53 = v6;
  if (v9)
  {
    [(PDFTextInputView *)self _setDimmingViewVisible:0];
  }
  else
  {
    [(PDFTextInputView *)self _setDimmingViewVisible:1];
    id v10 = [MEMORY[0x263EFF980] array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = self->_foundTextRanges;
    uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    uint64_t v56 = v11;
    if (v11)
    {
      uint64_t v55 = *(void *)v66;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [(PDFTextInputView *)self selectionRectsForRange:*(void *)(*((void *)&v65 + 1) + 8 * v12)];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v71 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v62 != v16) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*((void *)&v61 + 1) + 8 * i) rect];
                objc_msgSend(v5, "convertRect:fromView:", self);
                id v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
                [v10 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v71 count:16];
            }
            while (v15);
          }

          ++v12;
        }
        while (v12 != v56);
        uint64_t v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v56);
    }

    double v6 = v53;
    [v53 contentSize];
    double v20 = v19;
    [v5 bounds];
    if (v20 >= v21) {
      double v22 = v20;
    }
    else {
      double v22 = v21;
    }
    [v53 contentSize];
    double v24 = v23;
    [v5 bounds];
    if (v24 >= v25) {
      double v26 = v24;
    }
    else {
      double v26 = v25;
    }
    -[UITextSearchingDimmingView setFrame:](self->_searchDimmingView, "setFrame:", -800.0, -800.0, v22 + 1600.0, v26 + 1600.0);
    [(UITextSearchingDimmingView *)self->_searchDimmingView setTextRects:v10];
    -[UITextSearchingDimmingView setContentInset:](self->_searchDimmingView, "setContentInset:", -800.0, -800.0, -800.0, -800.0);
  }
  searchHighlightView = self->_searchHighlightView;
  if (self->_highlightedTextRange)
  {
    double v28 = [(UITextHighlightView *)searchHighlightView superview];

    if (!v28) {
      [v5 addSubview:self->_searchHighlightView];
    }
    int v29 = [(PDFTextInputView *)self selectionRectsForRange:self->_highlightedTextRange];
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
    uint64_t v34 = [MEMORY[0x263EFF980] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v35 = v29;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v58 != v38) {
            objc_enumerationMutation(v35);
          }
          long long v40 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          [v40 rect];
          v76.origin.double x = v41;
          v76.origin.double y = v42;
          v76.size.double width = v43;
          v76.size.double height = v44;
          v74.origin.double x = x;
          v74.origin.double y = y;
          v74.size.double width = width;
          v74.size.double height = height;
          CGRect v75 = CGRectUnion(v74, v76);
          double x = v75.origin.x;
          double y = v75.origin.y;
          double width = v75.size.width;
          double height = v75.size.height;
          uint64_t v45 = (void *)MEMORY[0x263F08D40];
          [v40 rect];
          double v46 = objc_msgSend(v45, "valueWithCGRect:");
          [v34 addObject:v46];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v37);
    }

    CGRect v47 = [MEMORY[0x263F82D10] preferredPreviewParametersForTextLineRects:v34];
    [v47 _textPathInsets];
    objc_msgSend(v5, "convertRect:fromView:", self, x + v51, y + v48, width - (v51 + v49), height - (v48 + v50));
    -[UITextHighlightView setFrame:](self->_searchHighlightView, "setFrame:");
    [(UITextHighlightView *)self->_searchHighlightView invalidateContentView];
    [v5 bringSubviewToFront:self->_searchHighlightView];

    double v6 = v53;
  }
  else
  {
    [(UITextHighlightView *)searchHighlightView removeFromSuperview];
  }
}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v9 = [WeakRetained pdfView];

  id v10 = [(PDFTextInputView *)self _selectionForTextRange:v6];
  uint64_t v11 = [v9 renderingProperties];
  int v12 = [v11 isUsingPDFExtensionView];

  if (v12)
  {
    if (v10 && ([v10 isEmpty] & 1) == 0)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v13 = objc_msgSend(v10, "pages", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v51;
LABEL_6:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * v17);
          double v19 = [v9 document];
          uint64_t v20 = [v19 indexForPage:v18];

          double v21 = [v9 pageViewForPageAtIndex:v20];
          if ([v21 isVisible]) {
            break;
          }

          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v56 count:16];
            if (v15) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }

        if (!v21) {
          goto LABEL_21;
        }
        double v28 = [v21 page];
        [v10 boundsForPage:v28];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;

        uint64_t v37 = [v21 page];
        objc_msgSend(v9, "convertRect:fromPage:", v37, v30, v32, v34, v36);
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;

        double v46 = [MEMORY[0x263F08A00] defaultCenter];
        v54[0] = @"visible";
        v54[1] = @"selectionRect";
        v55[0] = MEMORY[0x263EFFA88];
        CGRect v47 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v39, v41, v43, v45);
        v55[1] = v47;
        double v48 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
        [v46 postNotificationName:@"PDFTextSelectionShowTextSelectionMenu" object:v9 userInfo:v48];
      }
      else
      {
LABEL_12:
        double v21 = v13;
      }
    }
LABEL_21:
    double v27 = [MEMORY[0x263F82940] menuWithChildren:MEMORY[0x263EFFA68]];
  }
  else
  {
    double v22 = [v9 controller];
    double v23 = [MEMORY[0x263EFF980] arrayWithArray:v7];
    double v24 = [v22 additionalEditMenuElementsForSelection:v10];
    if ([v24 count])
    {
      uint64_t v25 = [v7 indexOfObjectPassingTest:&__block_literal_global_2];
      if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v25 = [v7 count] - 1;
      }
      double v26 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v25 + 1, objc_msgSend(v24, "count"));
      [v23 insertObjects:v24 atIndexes:v26];
    }
    double v27 = [MEMORY[0x263F82940] menuWithChildren:v23];
  }

  return v27;
}

uint64_t __58__PDFTextInputView_editMenuForTextRange_suggestedActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 identifier];
    uint64_t v7 = [v6 isEqual:*MEMORY[0x263F838A8]];
    if (v7) {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearch, 0);
  objc_storeStrong((id *)&self->_foundTextRanges, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
  objc_storeStrong((id *)&self->_searchDimmingView, 0);
  objc_storeStrong((id *)&self->_searchHighlightView, 0);
  objc_storeStrong((id *)&self->_textInputTokenizer, 0);
  objc_storeStrong((id *)&self->_textInputDelegate, 0);
  objc_storeStrong((id *)&self->_textInteraction, 0);
  objc_storeStrong((id *)&self->_textSelectionRange, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface PKTiledTextView
- (BOOL)_didHitNestedTiledView:(id)a3;
- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop;
- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing;
- (BOOL)_shouldUpdateHeightOfAttachments;
- (BOOL)canAddStroke;
- (BOOL)hasEndAttachment;
- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)rulerHostWantsSharedRuler;
- (CGRect)frameOfEndAttachment;
- (PKTextAttachmentDrawingViewProviderView)standInEndAttachmentView;
- (UIButton)tapToRadarButton;
- (id)_textView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)saveTempData:(id)a3 name:(id)a4;
- (id)standInAttachmentView;
- (id)viewForAttachmentAtBlankSpace;
- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3;
- (void)_canvasViewWillCreateSnapshot;
- (void)_layoutSubviews;
- (void)_scrollViewDidScroll;
- (void)_setupTapToRadarButton;
- (void)_tapToRadarButtonTapped:(id)a3;
- (void)appendPath:(id)a3 attachmentString:(id)a4;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5;
- (void)dealloc;
- (void)handwritingFeedback:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDefaultDrawingClass:(Class)a3;
- (void)setLinedPaper:(id)a3;
- (void)setStandInEndAttachmentView:(id)a3;
- (void)setTapToRadarButton:(id)a3;
- (void)textDidBeginEditing:(id)a3;
- (void)textDidChange:(id)a3;
- (void)textDidEndEditing:(id)a3;
- (void)updateEndAttachment;
@end

@implementation PKTiledTextView

void __38__PKTiledTextView_updateEndAttachment__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasEndAttachment];
  v3 = [*(id *)(a1 + 32) standInEndAttachmentView];
  id v21 = v3;
  if (v2)
  {
    [v3 setHidden:1];
  }
  else
  {
    [v3 setHidden:0];

    v4 = [*(id *)(a1 + 32) canvasView];
    char v5 = [v4 isDrawing];

    if (v5) {
      return;
    }
    [*(id *)(a1 + 32) frameOfEndAttachment];
    if (v9 <= 0.0) {
      return;
    }
    double v10 = v6;
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    v14 = [*(id *)(a1 + 32) standInEndAttachmentView];
    [v14 frame];
    if (vabdd_f64(v18, v10) >= 0.01 || vabdd_f64(v15, v11) >= 0.01)
    {
    }
    else
    {
      double v19 = v17;
      double v20 = vabdd_f64(v16, v12);

      if (v20 < 0.01 && vabdd_f64(v19, v13) < 0.01) {
        return;
      }
    }
    id v21 = [*(id *)(a1 + 32) standInEndAttachmentView];
    objc_msgSend(v21, "setFrame:", v10, v11, v12, v13);
  }
}

- (PKTextAttachmentDrawingViewProviderView)standInEndAttachmentView
{
  return self->_standInEndAttachmentView;
}

- (BOOL)hasEndAttachment
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = [(PKTiledView *)self attachmentViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isAtEndOfDocument])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_layoutSubviews
{
  uint64_t v3 = [(PKTiledTextView *)self _textView];
  char v4 = [v3 _freezeTextContainerSize];

  if ((v4 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTiledTextView;
    [(PKTiledView *)&v5 _layoutSubviews];
    [(PKTiledTextView *)self updateEndAttachment];
  }
}

- (CGRect)frameOfEndAttachment
{
  int v2 = [(PKTiledTextView *)self _textView];
  uint64_t v3 = [v2 textContainer];
  [v3 textContainerOrigin];
  double v5 = v4;

  double v6 = [v2 textStorage];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [v2 _frameOfTrailingWhitespace];
    double v9 = v8;
    double v11 = v10;
    [v2 frame];
    double v13 = v12;
    if (v11 <= 0.0) {
      double v14 = 0.0;
    }
    else {
      double v14 = 200.0;
    }
  }
  else
  {
    [v2 contentOffset];
    double v16 = v5 + v15;
    [v2 adjustedContentInset];
    double v9 = v16 + v17;
    [v2 frame];
    double v13 = v18;
    double v14 = 200.0;
  }

  double v19 = 0.0;
  double v20 = v9;
  double v21 = v13;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_textView
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(PKTiledView *)self scrollView];
  double v5 = PKDynamicCast(v3, v4);

  return v5;
}

- (void)updateEndAttachment
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__PKTiledTextView_updateEndAttachment__block_invoke;
  v2[3] = &unk_1E64C61C0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __33__PKTiledTextView_textDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTilesForVisibleRect];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateEndAttachment];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v11 layoutSubviews];
  uint64_t v3 = [(PKTiledTextView *)self tapToRadarButton];

  if (v3)
  {
    double v4 = [(PKTiledTextView *)self tapToRadarButton];
    objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v6 = v5;
    double v8 = v7;

    [(PKTiledTextView *)self bounds];
    CGFloat v9 = CGRectGetWidth(v12) - v6 + -30.0;
    double v10 = [(PKTiledTextView *)self tapToRadarButton];
    objc_msgSend(v10, "setFrame:", v9, 70.0, v6, v8);
  }
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTiledTextView;
  id v9 = [(PKTiledView *)&v34 initInScrollView:v8 sixChannelBlending:v6 defaultDrawingClass:a5];
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    objc_super v11 = PKCheckedDynamicCast(v10, v8);
    [v9 setInsertSpaceEnabled:1];
    CGRect v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4FB07F0];
    double v14 = [v11 textStorage];
    [v12 addObserver:v9 selector:sel_textDidChange_ name:v13 object:v14];

    double v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v9 selector:sel_textDidChange_ name:*MEMORY[0x1E4FB30A0] object:v11];

    double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel_textDidBeginEditing_ name:*MEMORY[0x1E4FB3098] object:v11];

    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v9 selector:sel_textDidEndEditing_ name:*MEMORY[0x1E4FB30A8] object:v11];

    double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel_handwritingFeedback_ name:@"PKPaletteTapToRadarCommandTriggeredNotification" object:0];

    NSClassFromString(&cfstr_Uitextcontaine.isa);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v19 = objc_msgSend(v8, "subviews", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            [v9 setAttachmentContainerView:v24];
            goto LABEL_12;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [v9 setSupportsCopyAsText:1];
    v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v26 = [v25 BOOLForKey:@"PKTapToRadarButtonEnabled"];

    if (v26) {
      [v9 _setupTapToRadarButton];
    }
    [v8 addObserver:v9 forKeyPath:@"backgroundColor" options:0 context:kScrollViewBackgroundColorObserverContext];
    v27 = [v9 _textView];
    [v27 _updateDrawingBackgroundColor];

    v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v9];
    [v9 addInteraction:v28];
  }
  return v9;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)_scrollViewDidScroll
{
  v2.receiver = self;
  v2.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v2 _scrollViewDidScroll];
}

- (void)textDidChange:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PKTiledTextView_textDidChange___block_invoke;
  block[3] = &unk_1E64C61C0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

- (void)dealloc
{
  [(PKTextAttachmentDrawingViewProviderView *)self->_standInEndAttachmentView removeFromSuperview];
  uint64_t v3 = [(PKTiledView *)self scrollView];
  [v3 removeObserver:self forKeyPath:@"backgroundColor" context:kScrollViewBackgroundColorObserverContext];

  v4.receiver = self;
  v4.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kScrollViewBackgroundColorObserverContext == a6)
  {
    id v6 = [(PKTiledTextView *)self _textView];
    [v6 _updateDrawingBackgroundColor];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKTiledTextView;
    -[PKTiledView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setDefaultDrawingClass:(Class)a3
{
  if ([(PKTiledView *)self defaultDrawingClass] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTiledTextView;
    [(PKTiledView *)&v5 setDefaultDrawingClass:a3];
    [(PKTextAttachmentDrawingViewProviderView *)self->_standInEndAttachmentView removeFromSuperview];
  }
}

- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop
{
  objc_super v2 = [(PKTiledTextView *)self _textView];
  char v3 = [v2 isPaperEnabled];

  return v3;
}

- (void)textDidBeginEditing:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PKTiledTextView_textDidBeginEditing___block_invoke;
  v3[3] = &unk_1E64C61C0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
}

void __39__PKTiledTextView_textDidBeginEditing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) standInEndAttachmentView];
  [v1 setAlpha:0.0];
}

- (void)textDidEndEditing:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PKTiledTextView_textDidEndEditing___block_invoke;
  v3[3] = &unk_1E64C61C0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
}

void __37__PKTiledTextView_textDidEndEditing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) standInEndAttachmentView];
  [v1 setAlpha:1.0];
}

- (BOOL)_shouldUpdateHeightOfAttachments
{
  return 1;
}

- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing
{
  return 0;
}

- (id)standInAttachmentView
{
  standInEndAttachmentView = self->_standInEndAttachmentView;
  if (!standInEndAttachmentView)
  {
    objc_super v4 = +[PKTextAttachmentDrawingViewProvider drawingViewClassForDrawingClass:[(PKTiledView *)self defaultDrawingClass]];
    objc_super v5 = [(objc_class *)[(PKTiledView *)self defaultDrawingClass] fileType];
    id v6 = (objc_class *)[MEMORY[0x1E4FB0870] textAttachmentClassForFileType:v5];
    if (!v6) {
      id v6 = (objc_class *)objc_opt_class();
    }
    id v7 = [v6 alloc];
    id v8 = [MEMORY[0x1E4F1C9B8] data];
    id v9 = (void *)[v7 initWithData:v8 ofType:v5];

    uint64_t v10 = (PKTextAttachmentDrawingViewProviderView *)objc_msgSend([v4 alloc], "initWithAttachment:drawingClass:inserted:", v9, -[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"), 0);
    objc_super v11 = self->_standInEndAttachmentView;
    self->_standInEndAttachmentView = v10;

    -[PKTextAttachmentDrawingViewProviderView setFrame:](self->_standInEndAttachmentView, "setFrame:", 0.0, 0.0, 1000.0, 200.0);
    [(PKTextAttachmentDrawingViewProviderView *)self->_standInEndAttachmentView setUserInteractionEnabled:0];
    CGRect v12 = [(PKTiledTextView *)self _textView];
    [v12 addSubview:self->_standInEndAttachmentView];

    standInEndAttachmentView = self->_standInEndAttachmentView;
  }

  return (id)[(PKTextAttachmentDrawingViewProviderView *)standInEndAttachmentView topLevelAttachmentView];
}

- (BOOL)canAddStroke
{
  objc_super v2 = [(PKTiledTextView *)self _textView];
  char v3 = [v2 _canAddStroke];

  return v3;
}

- (void)_canvasViewWillCreateSnapshot
{
  v4.receiver = self;
  v4.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v4 _canvasViewWillCreateSnapshot];
  char v3 = [(PKTiledTextView *)self _textView];
  [v3 _canvasViewWillCreateSnapshot];
}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTiledTextView;
  -[PKTiledView canvasViewWillBeginNewStroke:withTouch:location:](&v12, sel_canvasViewWillBeginNewStroke_withTouch_location_, a3, v9, x, y);
  uint64_t v10 = [(PKTiledView *)self drawingTouchThatHitNothing];

  if (v9 && !v10)
  {
    objc_super v11 = [(PKTiledTextView *)self _textView];
    [v11 _willBeginNewStrokeForTouch:v9];
  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v5 canvasViewDidEndDrawing:a3];
  objc_super v4 = [(PKTiledTextView *)self _textView];
  [v4 _didEndStroke];
}

- (void)setLinedPaper:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTiledTextView;
  [(PKTiledView *)&v5 setLinedPaper:a3];
  objc_super v4 = [(PKTiledTextView *)self standInEndAttachmentView];
  [v4 setNeedsLayout];
}

- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTiledTextView *)self standInAttachmentView];

  if (v5 != v4)
  {
    id v6 = [v4 attachmentContainerView];
    if (![v6 isFirstResponder]) {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_5:

  return v6;
}

- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(PKTiledTextView *)self _textView];
  id v6 = v5;
  id v7 = 0;
  if (v5 && y > 0.0)
  {
    id v8 = [v5 textStorage];

    if (v8)
    {
      id v8 = objc_msgSend(v6, "closestPositionToPoint:", x, y);
      id v9 = [v6 endOfDocument];
      if (![v8 isEqual:v9])
      {
        uint64_t v20 = [v6 drawingDelegate];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v21 = [v6 drawingDelegate];
          int v22 = [v21 textView:v6 isEndOfDocument:v8];

          if (v22) {
            goto LABEL_6;
          }
        }
        else
        {
        }
        v23 = [v6 beginningOfDocument];
        uint64_t v24 = [v6 offsetFromPosition:v23 toPosition:v8];

        v25 = [v6 textStorage];
        uint64_t v26 = [v25 length] - 1;

        if (v24 == v26)
        {
          v27 = [v6 textStorage];
          id v7 = [v27 attribute:*MEMORY[0x1E4FB06B8] atIndex:v24 effectiveRange:0];

          if (PKIsInlineDrawingOrPaperAttachment(v7)) {
            goto LABEL_20;
          }
        }
        id v7 = 0;
        goto LABEL_20;
      }
    }
LABEL_6:
    uint64_t v10 = [v6 textStorage];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      objc_super v12 = [v6 textStorage];
      uint64_t v13 = [v12 string];
      double v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      double v15 = [v14 invertedSet];
      uint64_t v16 = [v13 rangeOfCharacterFromSet:v15 options:4];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v17 = [v6 textStorage];
        id v7 = [v17 attribute:*MEMORY[0x1E4FB06B8] atIndex:v16 effectiveRange:0];

        if (v7)
        {
          if (PKIsInlineDrawingOrPaperAttachment(v7))
          {
LABEL_20:

            goto LABEL_21;
          }
        }
      }
    }
    double v18 = [v6 textStorage];
    uint64_t v19 = [v18 length];

    id v7 = [v6 _insertEmptyDrawingAttachmentAtLocation:v19];
    goto LABEL_20;
  }
LABEL_21:

  return v7 != 0;
}

- (id)viewForAttachmentAtBlankSpace
{
  objc_super v2 = [(PKTiledTextView *)self _textView];
  char v3 = [v2 textStorage];
  id v4 = [v3 string];
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v6 = [v5 invertedSet];
  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6 options:4];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [v2 textStorage];
    uint64_t v10 = [v9 attribute:*MEMORY[0x1E4FB06B8] atIndex:v7 effectiveRange:0];

    if (v10 && PKIsInlineDrawingOrPaperAttachment(v10))
    {
      uint64_t v11 = objc_msgSend(v2, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v10, v7, 1);
      objc_super v12 = [v11 view];
      if (objc_opt_respondsToSelector())
      {
        id v8 = [v12 topLevelAttachmentView];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_didHitNestedTiledView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  do
  {
    id v6 = [(PKTiledView *)self scrollView];

    if (v5 == v6) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      uint64_t v7 = objc_msgSend(v5, "subviews", 0, 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {

              BOOL v13 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v12 = [v5 superview];

    id v5 = (void *)v12;
  }
  while (v12);
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && [v7 _hidEvent])
  {
    uint64_t v9 = [(PKTiledTextView *)self _textView];
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    double v11 = v10;
    double v13 = v12;

    double v14 = [(PKTiledTextView *)self _textView];
    long long v15 = objc_msgSend(v14, "hitTest:withEvent:", 0, v11, v13);

    if (v15 && [(PKTiledTextView *)self _didHitNestedTiledView:v15])
    {
      long long v16 = 0;
    }
    else
    {
      long long v17 = [(PKTiledView *)self scrollView];
      long long v18 = [v17 _textInteraction];
      [v18 setDelegate:self];

      uint64_t v19 = [(PKTiledTextView *)self tapToRadarButton];

      if (!v19) {
        goto LABEL_10;
      }
      uint64_t v20 = [(PKTiledTextView *)self tapToRadarButton];
      uint64_t v21 = [(PKTiledTextView *)self tapToRadarButton];
      objc_msgSend(v21, "convertPoint:fromView:", self, x, y);
      int v22 = objc_msgSend(v20, "hitTest:withEvent:", v8);

      if (v22)
      {
        uint64_t v23 = [(PKTiledTextView *)self tapToRadarButton];
      }
      else
      {
LABEL_10:
        v25.receiver = self;
        v25.super_class = (Class)PKTiledTextView;
        uint64_t v23 = -[PKTiledView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v8, x, y);
      }
      long long v16 = (void *)v23;
    }
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(PKTiledTextView *)self window];
  uint64_t v8 = +[PKToolPicker activeToolPickerForWindow:v7];

  uint64_t v9 = [(PKTiledTextView *)self _textView];
  double v10 = [v9 ink];
  int v11 = [v10 _isHandwritingInk];

  double v12 = [(PKTiledView *)self scrollView];
  -[PKTiledTextView convertPoint:fromView:](self, "convertPoint:fromView:", v12, x, y);
  double v14 = v13;
  double v16 = v15;

  if (![v8 isVisible] || v11)
  {
    long long v18 = [(PKTiledTextView *)self _textView];
    if ([v18 isEditing])
    {
      BOOL v17 = 1;
    }
    else
    {
      uint64_t v19 = -[PKTiledView hitAttachment:](self, "hitAttachment:", v14, v16);
      BOOL v17 = v19 == 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_setupTapToRadarButton
{
  v12[1] = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [(PKTiledTextView *)self setTapToRadarButton:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  id v5 = [MEMORY[0x1E4FB08E0] fontWithName:@"Apple Color Emoji" size:30.0];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = (void *)[v4 initWithString:@"🐜" attributes:v6];

  uint64_t v8 = [(PKTiledTextView *)self tapToRadarButton];
  [v8 setAttributedTitle:v7 forState:0];

  uint64_t v9 = [(PKTiledTextView *)self tapToRadarButton];
  [v9 addTarget:self action:sel__tapToRadarButtonTapped_ forControlEvents:64];

  double v10 = [(PKTiledTextView *)self tapToRadarButton];
  [(PKTiledTextView *)self addSubview:v10];
}

- (void)_tapToRadarButtonTapped:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4FB17D8]);
  id v5 = [(PKTiledTextView *)self window];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v10 = [MEMORY[0x1E4FB17E0] defaultFormat];
  uint64_t v11 = objc_msgSend(v4, "initWithSize:format:", v10, v7, v9);

  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __43__PKTiledTextView__tapToRadarButtonTapped___block_invoke;
  v98[3] = &unk_1E64C92A8;
  v98[4] = self;
  v77 = v11;
  double v12 = [v11 imageWithActions:v98];
  double v13 = (void *)MEMORY[0x1E4F1CB10];
  double v14 = NSTemporaryDirectory();
  double v15 = [v14 stringByAppendingPathComponent:@"screenshot.png"];
  uint64_t v16 = [v13 fileURLWithPath:v15];

  v76 = v12;
  BOOL v17 = UIImagePNGRepresentation(v12);
  id v97 = 0;
  v78 = (void *)v16;
  [v17 writeToURL:v16 options:1 error:&v97];
  id v75 = v97;

  long long v18 = [MEMORY[0x1E4F1CA48] array];
  v80 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = [(PKTiledView *)self attachmentViews];
  v82 = v19;
  if ([v19 count])
  {
    unint64_t v20 = 0;
    unint64_t v21 = 0x1E4F29000uLL;
    v79 = v18;
    do
    {
      int v22 = [v19 objectAtIndexedSubscript:v20];
      uint64_t v23 = [v22 drawing];
      uint64_t v24 = (void *)[v23 copy];

      objc_super v25 = [v24 serialize];
      uint64_t v26 = objc_msgSend(*(id *)(v21 + 24), "stringWithFormat:", @"%d_drawing.drawing", v20);
      v27 = [(PKTiledTextView *)self saveTempData:v25 name:v26];

      v28 = [v27 path];
      [v18 addObject:v28];

      if ([v24 recognitionEnabled])
      {
        v29 = [v24 recognitionSession];

        if (v29)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F5C050]);
          long long v31 = [v24 recognitionSession];
          long long v32 = (void *)[v30 initWithRecognitionSession:v31];

          [v32 start];
          [v32 waitForPendingUpdates];
          long long v33 = [v32 indexableContent];
          [v33 indexableTextRepresentation];
          v35 = unint64_t v34 = v21;
          v83 = [v35 dataUsingEncoding:4];

          uint64_t v36 = objc_msgSend(*(id *)(v34 + 24), "stringWithFormat:", @"%d_indexableText.txt", v20);
          v37 = [(PKTiledTextView *)self saveTempData:v83 name:v36];

          v38 = [v37 path];
          [v80 addObject:v38];

          v39 = [v32 indexableContent];
          v40 = [v39 presentableTextRepresentation];
          v41 = [v40 dataUsingEncoding:4];

          v42 = objc_msgSend(*(id *)(v34 + 24), "stringWithFormat:", @"%d_presentableText.txt", v20);
          v43 = [(PKTiledTextView *)self saveTempData:v41 name:v42];

          v44 = [v43 path];
          [v81 addObject:v44];

          uint64_t v19 = v82;
          unint64_t v21 = v34;

          long long v18 = v79;
        }
      }

      ++v20;
    }
    while (v20 < [v19 count]);
  }
  id v45 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v45 setScheme:@"tap-to-radar"];
  v84 = v45;
  [v45 setHost:@"new"];
  v46 = [MEMORY[0x1E4F1CA48] array];
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"Handwriting"];
  [v46 addObject:v47];

  v48 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v46 addObject:v48];

  v49 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"391023"];
  [v46 addObject:v49];

  v50 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Keywords" value:@"834455"];
  [v46 addObject:v50];

  v51 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Other Bug"];
  [v46 addObject:v51];

  v52 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v46 addObject:v52];

  v53 = [MEMORY[0x1E4F28E78] string];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v54 = v18;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v94 != v57) {
          objc_enumerationMutation(v54);
        }
        [(PKTiledTextView *)self appendPath:*(void *)(*((void *)&v93 + 1) + 8 * i) attachmentString:v53];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v93 objects:v101 count:16];
    }
    while (v56);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v59 = v80;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v90 != v62) {
          objc_enumerationMutation(v59);
        }
        [(PKTiledTextView *)self appendPath:*(void *)(*((void *)&v89 + 1) + 8 * j) attachmentString:v53];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v89 objects:v100 count:16];
    }
    while (v61);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v64 = v81;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v85 objects:v99 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v86 != v67) {
          objc_enumerationMutation(v64);
        }
        [(PKTiledTextView *)self appendPath:*(void *)(*((void *)&v85 + 1) + 8 * k) attachmentString:v53];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v85 objects:v99 count:16];
    }
    while (v66);
  }

  v69 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Attachments" value:v53];
  [v46 addObject:v69];

  v70 = [MEMORY[0x1E4F28E78] string];
  if (!v75)
  {
    v71 = [v78 path];
    [(PKTiledTextView *)self appendPath:v71 attachmentString:v70];
  }
  v72 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Screenshot" value:v70];
  [v46 addObject:v72];

  [v84 setQueryItems:v46];
  v73 = [v84 URL];
  v74 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v74 openURL:v73 withOptions:0];
}

void __43__PKTiledTextView__tapToRadarButtonTapped___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) window];
  objc_super v2 = [*(id *)(a1 + 32) window];
  [v2 bounds];
  objc_msgSend(v3, "drawViewHierarchyInRect:");
}

- (void)appendPath:(id)a3 attachmentString:(id)a4
{
  id v7 = a4;
  id v5 = a3;
  if ([v7 length])
  {
    uint64_t v6 = [NSString stringWithFormat:@",%@", v5];

    id v5 = (id)v6;
  }
  [v7 appendString:v5];
}

- (id)saveTempData:(id)a3 name:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  id v7 = a3;
  double v8 = NSTemporaryDirectory();
  double v9 = [v8 stringByAppendingPathComponent:v6];

  double v10 = [v5 fileURLWithPath:v9];

  uint64_t v13 = 0;
  [v7 writeToURL:v10 options:1 error:&v13];

  id v11 = 0;
  if (!v13) {
    id v11 = v10;
  }

  return v11;
}

- (void)handwritingFeedback:(id)a3
{
  id v14 = [(PKTiledView *)self attachmentViews];
  id v4 = objc_opt_new();
  uint64_t v5 = [v14 count];
  id v6 = v14;
  if (v5)
  {
    for (unint64_t i = 0; i < v11; ++i)
    {
      double v8 = [v6 objectAtIndexedSubscript:i];
      double v9 = [v8 drawing];
      double v10 = (void *)[v9 copy];

      if (v10) {
        [v4 addObject:v10];
      }

      unint64_t v11 = [v14 count];
      id v6 = v14;
    }
  }
  if ([v4 count])
  {
    double v12 = [(PKTiledTextView *)self window];
    uint64_t v13 = [v12 rootViewController];
    +[PKHandwritingDebugUtility presentHandwritingDebugViewFromViewController:v13 allDrawings:v4 tiledView:self];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  [a4 location];
  double v8 = -[PKTiledView hitAttachment:](self, "hitAttachment:");
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = v7;
  }

  return v9;
}

- (void)setStandInEndAttachmentView:(id)a3
{
}

- (void)setTapToRadarButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);

  objc_storeStrong((id *)&self->_standInEndAttachmentView, 0);
}

@end
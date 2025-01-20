@interface PKTextAttachmentResizeView
+ (double)resizeHitSize;
- (BOOL)enabled;
- (BOOL)highlighted;
- (BOOL)shown;
- (BOOL)top;
- (CGRect)originalDrawingBounds;
- (CGRect)originalViewBounds;
- (PKDrawingAdjustmentKnob)knobView;
- (PKTextAttachmentResizeViewDelegate)delegate;
- (UIEdgeInsets)originalContentInset;
- (UIView)separatorHighlightedView;
- (UIView)separatorView;
- (double)resizeContentInset;
- (id)initAtTop:(BOOL)a3 delegate:(id)a4;
- (void)didMoveToWindow;
- (void)drawingScrollViewDidScroll:(id)a3;
- (void)handleGesture:(id)a3;
- (void)layoutInsideSuperview;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setKnobView:(id)a3;
- (void)setOriginalContentInset:(UIEdgeInsets)a3;
- (void)setOriginalDrawingBounds:(CGRect)a3;
- (void)setOriginalViewBounds:(CGRect)a3;
- (void)setSeparatorHighlightedView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)show:(BOOL)a3 enabled:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation PKTextAttachmentResizeView

- (id)initAtTop:(BOOL)a3 delegate:(id)a4
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v16.receiver = self;
  v16.super_class = (Class)PKTextAttachmentResizeView;
  id v7 = a4;
  v8 = -[PKTextAttachmentResizeView initWithFrame:](&v16, sel_initWithFrame_, v5, v6, 1024.0, 100.0);
  -[PKTextAttachmentResizeView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0, v16.receiver, v16.super_class);
  objc_storeWeak((id *)&v8->_delegate, v7);

  v9 = objc_alloc_init(PKDrawingAdjustmentKnob);
  knobView = v8->_knobView;
  v8->_knobView = v9;

  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorView = v8->_separatorView;
  v8->_separatorView = v11;

  v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorHighlightedView = v8->_separatorHighlightedView;
  v8->_separatorHighlightedView = v13;

  v8->_top = a3;
  v8->_enabled = 1;
  [(PKTextAttachmentResizeView *)v8 addSubview:v8->_separatorView];
  [(PKTextAttachmentResizeView *)v8 addSubview:v8->_separatorHighlightedView];
  [(PKTextAttachmentResizeView *)v8 addSubview:v8->_knobView];
  [(UIView *)v8->_separatorHighlightedView _setCornerRadius:0.75];
  [(UIView *)v8->_separatorHighlightedView setAlpha:0.0];
  return v8;
}

+ (double)resizeHitSize
{
  return 100.0;
}

- (void)didMoveToWindow
{
  v3 = [(PKTextAttachmentResizeView *)self tintColor];
  [(UIView *)self->_separatorView setBackgroundColor:v3];

  id v4 = [(PKTextAttachmentResizeView *)self tintColor];
  [(UIView *)self->_separatorHighlightedView setBackgroundColor:v4];
}

- (void)layoutSubviews
{
  [(PKTextAttachmentResizeView *)self bounds];
  double v5 = v4;
  if (self->_top) {
    double v6 = 0.0;
  }
  else {
    double v6 = v3 + -16.0;
  }
  +[PKDrawingAdjustmentKnob leftMargin];
  double v8 = v7;
  double v9 = v7 + 7.5;
  double v10 = v5 - v7 + -28.0;
  if ([(PKTextAttachmentResizeView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v14.size.width = 15.0;
    v14.size.height = 16.0;
    v14.origin.x = v8;
    v14.origin.y = v6;
    double v8 = v5 - CGRectGetMaxX(v14);
    v15.size.height = 0.5;
    v15.origin.x = v9;
    v15.origin.y = v6 + 7.75;
    v15.size.width = v10;
    double v11 = v5 - CGRectGetMaxX(v15);
    v16.size.height = 1.5;
    v16.origin.x = v9;
    v16.origin.y = v6 + 7.25;
    v16.size.width = v10;
    double v9 = v5 - CGRectGetMaxX(v16);
  }
  else
  {
    double v11 = v9;
  }
  -[PKDrawingAdjustmentKnob setFrame:](self->_knobView, "setFrame:", v8, v6, 15.0, 16.0);
  -[UIView setFrame:](self->_separatorView, "setFrame:", v11, v6 + 7.75, v10, 0.5);
  separatorHighlightedView = self->_separatorHighlightedView;

  -[UIView setFrame:](separatorHighlightedView, "setFrame:", v9, v6 + 7.25, v10, 1.5);
}

- (double)resizeContentInset
{
  UIRoundToViewScale();
  return result;
}

- (BOOL)shown
{
  [(PKTextAttachmentResizeView *)self alpha];
  return v2 > 0.0;
}

- (void)show:(BOOL)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(PKTextAttachmentResizeView *)self shown] != a3)
  {
    [(PKTextAttachmentResizeView *)self setEnabled:v6];
    if (v5)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__PKTextAttachmentResizeView_show_enabled_animated___block_invoke;
      v11[3] = &unk_1E64C8030;
      v11[4] = self;
      BOOL v12 = v7;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v11 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      double v9 = 0.0;
      if (v7)
      {
        BOOL v10 = [(PKTextAttachmentResizeView *)self enabled];
        double v9 = 0.4;
        if (v10) {
          double v9 = 1.0;
        }
      }
      [(PKTextAttachmentResizeView *)self setAlpha:v9];
    }
  }
}

uint64_t __52__PKTextAttachmentResizeView_show_enabled_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    int v2 = [*(id *)(a1 + 32) enabled];
    double v3 = 0.4;
    if (v2) {
      double v3 = 1.0;
    }
  }
  else
  {
    double v3 = 0.0;
  }
  double v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__PKTextAttachmentResizeView_setHighlighted___block_invoke;
    v3[3] = &unk_1E64C61C0;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.2];
  }
}

uint64_t __45__PKTextAttachmentResizeView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(v1 + 409)) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 432) setAlpha:v2];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__PKTextAttachmentResizeView_setEnabled___block_invoke;
    v3[3] = &unk_1E64C61C0;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v3 options:0 animations:0.2 completion:0.0];
  }
}

uint64_t __41__PKTextAttachmentResizeView_setEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shown];
  double v3 = 0.0;
  if (v2)
  {
    int v4 = objc_msgSend(*(id *)(a1 + 32), "enabled", 0.0);
    double v3 = 0.4;
    if (v4) {
      double v3 = 1.0;
    }
  }
  BOOL v5 = *(void **)(a1 + 32);

  return [v5 setAlpha:v3];
}

- (void)layoutInsideSuperview
{
  double v3 = [(PKTextAttachmentResizeView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(PKTextAttachmentResizeView *)self superview];
  [v8 safeAreaInsets];
  double v10 = v9;
  double v12 = v11;

  double v13 = 28.0;
  double v14 = 28.0;
  if ([(PKTextAttachmentResizeView *)self effectiveUserInterfaceLayoutDirection] != 1)
  {
    +[PKDrawingAdjustmentKnob leftMargin];
    double v14 = v15;
  }
  if ([(PKTextAttachmentResizeView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    +[PKDrawingAdjustmentKnob leftMargin];
    double v13 = v16;
  }
  double v17 = 0.0;
  if (![(PKTextAttachmentResizeView *)self top])
  {
    [(PKTextAttachmentResizeView *)self bounds];
    double v17 = v7 - CGRectGetHeight(v24) + 0.0;
  }
  if (v12 >= v13) {
    double v18 = v12;
  }
  else {
    double v18 = v13;
  }
  double v19 = v18 - v13;
  if (v10 >= v14) {
    double v20 = v10;
  }
  else {
    double v20 = v14;
  }
  double v21 = v20 - v14;
  [(PKTextAttachmentResizeView *)self bounds];
  double Height = CGRectGetHeight(v25);

  -[PKTextAttachmentResizeView setFrame:](self, "setFrame:", v21 + 0.0, v17, v5 - (v21 + v19), Height);
}

- (void)handleGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(PKTextAttachmentResizeView *)self delegate];
  double v6 = [v5 resizeViewTextView:self];

  double v7 = [(PKTextAttachmentResizeView *)self delegate];
  [v7 resizeViewDrawingBounds:self];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  uint64_t v16 = [v4 state];
  if ((unint64_t)(v16 - 2) < 2)
  {
    [v4 translationInView:self];
    double v18 = v17;
    BOOL v19 = [(PKTextAttachmentResizeView *)self top];
    double v20 = fmin(v18, 20.0);
    double v21 = -20.0;
    if (v18 >= -20.0) {
      double v21 = v18;
    }
    if (v19) {
      double v22 = v20;
    }
    else {
      double v22 = v21;
    }
    v76.origin.x = v9;
    v76.origin.y = v11;
    v76.size.CGFloat width = v13;
    v76.size.double height = v15;
    if (CGRectIsEmpty(v76)
      && ([(PKTextAttachmentResizeView *)self top] && v22 >= 20.0
       || ![(PKTextAttachmentResizeView *)self top] && v22 <= -20.0))
    {
      if ([v4 state] == 3)
      {
        v23 = [(PKTextAttachmentResizeView *)self delegate];
        [v23 resizeViewRemoveAttachment:self];
      }
      else
      {
        [(PKTextAttachmentResizeView *)self frame];
        -[PKTextAttachmentResizeView setFrame:](self, "setFrame:");
        v23 = [(PKTextAttachmentResizeView *)self delegate];
        [v23 resizeViewLayoutAttachment:self];
      }
    }
    else
    {
      v37 = [(PKTextAttachmentResizeView *)self delegate];
      BOOL v38 = [(PKTextAttachmentResizeView *)self top];
      double v39 = fabs(v22);
      double v40 = 0.0;
      if (v22 >= 0.0) {
        double v40 = v22;
      }
      if (v38) {
        double v41 = v39;
      }
      else {
        double v41 = v40;
      }
      objc_msgSend(v37, "resizeView:setDrawingHeight:originalHeight:growFromTop:", self, -[PKTextAttachmentResizeView top](self, "top"), v41, self->_originalViewBounds.size.height);

      if ([v4 state] != 3) {
        goto LABEL_28;
      }
      v23 = [(PKTextAttachmentResizeView *)self delegate];
      objc_msgSend(v23, "resizeView:finishedWithOriginalDrawingBounds:originalViewBounds:", self, self->_originalDrawingBounds.origin.x, self->_originalDrawingBounds.origin.y, self->_originalDrawingBounds.size.width, self->_originalDrawingBounds.size.height, self->_originalViewBounds.origin.x, self->_originalViewBounds.origin.y, self->_originalViewBounds.size.width, self->_originalViewBounds.size.height);
    }

LABEL_28:
    v42 = [(PKTextAttachmentResizeView *)self delegate];
    [v42 resizeViewDidUpdate:self];

    goto LABEL_29;
  }
  if (v16 == 1)
  {
    self->_originalDrawingBounds.origin.x = v9;
    self->_originalDrawingBounds.origin.y = v11;
    self->_originalDrawingBounds.size.CGFloat width = v13;
    self->_originalDrawingBounds.size.double height = v15;
    CGRect v24 = [(PKTextAttachmentResizeView *)self superview];
    [v24 bounds];
    self->_originalViewBounds.origin.x = v25;
    self->_originalViewBounds.origin.y = v26;
    self->_originalViewBounds.size.CGFloat width = v27;
    self->_originalViewBounds.size.double height = v28;

    CGPoint origin = self->_originalViewBounds.origin;
    CGFloat width = self->_originalViewBounds.size.width;
    double height = self->_originalViewBounds.size.height;
    if ([(PKTextAttachmentResizeView *)self top]) {
      double v30 = -height;
    }
    else {
      double v30 = height;
    }
    objc_msgSend(v4, "setTranslation:inView:", self, 0.0, v30);
    [v6 contentInset];
    self->_originalContentInset.double top = v31;
    self->_originalContentInset.left = v32;
    self->_originalContentInset.bottom = v33;
    self->_originalContentInset.right = v34;
    [(PKTextAttachmentResizeView *)self top];
    UIEdgeInsetsAdd();
    objc_msgSend(v6, "setContentInset:");
    v35 = (void *)MEMORY[0x1E4F1CB00];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __44__PKTextAttachmentResizeView_handleGesture___block_invoke;
    v69[3] = &unk_1E64C8058;
    id v70 = v4;
    double v75 = height;
    id v71 = v6;
    v72 = self;
    id v36 = (id)[v35 scheduledTimerWithTimeInterval:1 repeats:v69 block:0.0166666667];
  }
LABEL_29:
  if ([v4 state] >= 3)
  {
    if ([(PKTextAttachmentResizeView *)self top]
      && ([v6 contentOffset],
          double v44 = v43,
          double v45 = self->_originalContentInset.top,
          [v6 _contentScrollInset],
          v44 < -(v45 + v46)))
    {
      v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v47 addObserver:self selector:sel_drawingScrollViewDidScroll_ name:@"_UIScrollViewAnimationEndedNotification" object:0];

      double top = self->_originalContentInset.top;
      double v49 = -self->_originalContentInset.left;
      [v6 _contentScrollInset];
      double v51 = -(top + v50);
    }
    else
    {
      if ([(PKTextAttachmentResizeView *)self top]
        || ([v6 contentOffset],
            double v53 = v52,
            [v6 bounds],
            double v55 = v53 + v54,
            [v6 contentSize],
            double v57 = v56 + self->_originalContentInset.bottom,
            [v6 _contentScrollInset],
            v55 <= v57 + v58))
      {
        objc_msgSend(v6, "setContentInset:", self->_originalContentInset.top, self->_originalContentInset.left, self->_originalContentInset.bottom, self->_originalContentInset.right);
        goto LABEL_40;
      }
      v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v59 addObserver:self selector:sel_drawingScrollViewDidScroll_ name:@"_UIScrollViewAnimationEndedNotification" object:0];

      double v49 = -self->_originalContentInset.left;
      [v6 contentSize];
      double v61 = v60 + self->_originalContentInset.bottom;
      [v6 _contentScrollInset];
      double v63 = v61 + v62;
      [v6 bounds];
      double v65 = v63 - v64;
      double v66 = self->_originalContentInset.top;
      [v6 _contentScrollInset];
      double v68 = -(v66 + v67);
      if (v65 >= v68) {
        double v51 = v65;
      }
      else {
        double v51 = v68;
      }
    }
    objc_msgSend(v6, "setContentOffset:animated:", 1, v49, v51);
  }
LABEL_40:
}

void __44__PKTextAttachmentResizeView_handleGesture___block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  if ([*(id *)(a1 + 32) state] != 1 && objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    [v31 invalidate];
    goto LABEL_18;
  }
  [*(id *)(a1 + 40) bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)(a1 + 32) locationInView:*(void *)(a1 + 40)];
  double v12 = v11;
  [*(id *)(a1 + 40) bounds];
  if (-(*(double *)(a1 + 80) - v13 * 0.75) >= 0.0) {
    double v14 = -(*(double *)(a1 + 80) - v13 * 0.75);
  }
  else {
    double v14 = 0.0;
  }
  if ([*(id *)(a1 + 48) top])
  {
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.CGFloat width = v8;
    v33.size.double height = v10;
    if (v12 <= CGRectGetMinY(v33) + 40.0)
    {
      double v16 = 6.0;
      if (v14 <= 6.0) {
        double v16 = v14;
      }
      double v14 = -v16;
      goto LABEL_16;
    }
  }
  if (([*(id *)(a1 + 48) top] & 1) == 0)
  {
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.CGFloat width = v8;
    v34.size.double height = v10;
    if (v12 >= CGRectGetMaxY(v34) + -40.0)
    {
      double v15 = 6.0;
      if (v14 > 6.0)
      {
LABEL_17:
        [*(id *)(a1 + 40) contentOffset];
        double v18 = v17;
        double v20 = v19;
        [*(id *)(a1 + 32) translationInView:*(void *)(a1 + 48)];
        double v22 = v21;
        double v24 = v23;
        objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", v18, v15 + v20);
        [*(id *)(a1 + 40) contentOffset];
        double v26 = v25;
        double v27 = v25 - v20;
        CGFloat v28 = [*(id *)(a1 + 48) delegate];
        v29 = *(void **)(a1 + 48);
        [v29 frame];
        objc_msgSend(v28, "resizeView:setDrawingHeight:originalHeight:growFromTop:", v29, objc_msgSend(*(id *)(a1 + 48), "top"), vabdd_f64(v26, v20) + v30, *(double *)(*(void *)(a1 + 48) + 504));

        objc_msgSend(*(id *)(a1 + 32), "setTranslation:inView:", *(void *)(a1 + 48), v22, v24 + v27);
        goto LABEL_18;
      }
LABEL_16:
      double v15 = v14;
      if (v14 == 0.0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)drawingScrollViewDidScroll:(id)a3
{
  CGFloat v4 = [(PKTextAttachmentResizeView *)self delegate];
  id v6 = [v4 resizeViewTextView:self];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"_UIScrollViewAnimationEndedNotification" object:0];

  objc_msgSend(v6, "setContentInset:", self->_originalContentInset.top, self->_originalContentInset.left, self->_originalContentInset.bottom, self->_originalContentInset.right);
}

- (BOOL)top
{
  return self->_top;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CGRect)originalDrawingBounds
{
  double x = self->_originalDrawingBounds.origin.x;
  double y = self->_originalDrawingBounds.origin.y;
  double width = self->_originalDrawingBounds.size.width;
  double height = self->_originalDrawingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalDrawingBounds:(CGRect)a3
{
  self->_originalDrawingBounds = a3;
}

- (PKDrawingAdjustmentKnob)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)separatorHighlightedView
{
  return self->_separatorHighlightedView;
}

- (void)setSeparatorHighlightedView:(id)a3
{
}

- (PKTextAttachmentResizeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextAttachmentResizeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)originalViewBounds
{
  double x = self->_originalViewBounds.origin.x;
  double y = self->_originalViewBounds.origin.y;
  double width = self->_originalViewBounds.size.width;
  double height = self->_originalViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalViewBounds:(CGRect)a3
{
  self->_originalViewBounds = a3;
}

- (UIEdgeInsets)originalContentInset
{
  double top = self->_originalContentInset.top;
  double left = self->_originalContentInset.left;
  double bottom = self->_originalContentInset.bottom;
  double right = self->_originalContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOriginalContentInset:(UIEdgeInsets)a3
{
  self->_originalContentInset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_separatorHighlightedView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_knobView, 0);
}

@end
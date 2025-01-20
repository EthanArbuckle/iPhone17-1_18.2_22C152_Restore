@interface CAMControlDrawerCustomButton
- (BOOL)_isTouchInTrackedView;
- (BOOL)_shouldRejectAccessibilityGestureForHUDManager:(id)a3;
- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isSelfExpanding;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3;
- (CAMControlDrawerExpandableButtonDelegate)delegate;
- (UIEdgeInsets)expansionInsets;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5;
- (void)_setTouchInTrackedView:(BOOL)a3;
- (void)_updateHighlightedView;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpansionInsets:(UIEdgeInsets)a3;
@end

@implementation CAMControlDrawerCustomButton

- (BOOL)isExpandable
{
  return 1;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawerCustomButton;
  [(CAMControlDrawerButton *)&v7 layoutSubviews];
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    v3 = [(CAMControlDrawerButton *)self _backgroundView];
    [v3 center];

    [(CAMControlDrawerCustomButton *)self expansionInsets];
    v4 = [(CAMControlDrawerButton *)self _imageView];
    v5 = [(CAMControlDrawerButton *)self _backgroundView];
    v6 = [(CAMControlDrawerButton *)self _slashView];
    [v4 bounds];
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v4, "setCenter:");
    [v5 bounds];
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v5, "setCenter:");
    [v6 bounds];
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v6, "setCenter:");
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    v8 = [(CAMControlDrawerButton *)self _backgroundView];
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v22.origin.double x = v10;
    v22.origin.double y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    v21.double x = x;
    v21.double y = y;
    BOOL v17 = CGRectContainsPoint(v22, v21);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CAMControlDrawerCustomButton;
    BOOL v17 = -[CAMControlDrawerCustomButton pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v18 = v17;

  return v18;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    [v6 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [(CAMControlDrawerButton *)self _backgroundView];
    -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", -[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));
  }
  else
  {
    [(CAMControlDrawerCustomButton *)self _setTouchInTrackedView:1];
  }
  [(CAMControlDrawerCustomButton *)self _updateHighlightedView];
  v15.receiver = self;
  v15.super_class = (Class)CAMControlDrawerCustomButton;
  BOOL v13 = [(CAMControlDrawerCustomButton *)&v15 beginTrackingWithTouch:v6 withEvent:v7];

  return v13;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [(CAMControlDrawerButton *)self _backgroundView];
  -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", -[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));

  [(CAMControlDrawerCustomButton *)self _updateHighlightedView];
  v14.receiver = self;
  v14.super_class = (Class)CAMControlDrawerCustomButton;
  LOBYTE(self) = [(CAMControlDrawerCustomButton *)&v14 continueTrackingWithTouch:v7 withEvent:v6];

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  if ([(CAMControlDrawerCustomButton *)self _isTouchInTrackedView]
    && [(CAMControlDrawerCustomButton *)self isSelfExpanding])
  {
    [(CAMControlDrawerCustomButton *)self _setExpanded:[(CAMControlDrawerCustomButton *)self isExpanded] ^ 1 animated:1 shouldNotify:1];
  }
  [(CAMControlDrawerCustomButton *)self _setTouchInTrackedView:0];
  [(CAMControlDrawerCustomButton *)self _updateHighlightedView];
}

- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v6 = a3;
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 origin];
  double v16 = v15;

  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGRect v22 = CGRectInset(v21, -20.0, -v16);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(v22, *(CGPoint *)&v17);
}

- (BOOL)_shouldRejectAccessibilityGestureForHUDManager:(id)a3
{
  id v4 = a3;
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    [v4 locationOfAccessibilityGestureInView:self];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(CAMControlDrawerButton *)self _backgroundView];
    BOOL v10 = !-[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v9, v6, v8);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  return ![(CAMControlDrawerCustomButton *)self _shouldRejectAccessibilityGestureForHUDManager:a3];
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  if (![(CAMControlDrawerCustomButton *)self _shouldRejectAccessibilityGestureForHUDManager:a3])
  {
    [(CAMControlDrawerCustomButton *)self cancelTouchTracking];
    [(CAMControlDrawerCustomButton *)self sendActionsForControlEvents:64];
    if ([(CAMControlDrawerCustomButton *)self isSelfExpanding])
    {
      uint64_t v4 = [(CAMControlDrawerCustomButton *)self isExpanded] ^ 1;
      [(CAMControlDrawerCustomButton *)self _setExpanded:v4 animated:1 shouldNotify:1];
    }
  }
}

- (void)_updateHighlightedView
{
  BOOL v3 = [(CAMControlDrawerCustomButton *)self _isTouchInTrackedView];
  [(CAMControlDrawerButton *)self setHighlighted:v3];
}

- (BOOL)isSelfExpanding
{
  return 1;
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_expansionInsets.left
    || a3.top != self->_expansionInsets.top
    || a3.right != self->_expansionInsets.right
    || a3.bottom != self->_expansionInsets.bottom)
  {
    self->_expansionInsets = a3;
    [(CAMControlDrawerCustomButton *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  if (self->_expanded != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    BOOL v7 = a3;
    if (a4) {
      [(CAMControlDrawerCustomButton *)self layoutIfNeeded];
    }
    if (v5)
    {
      double v9 = [(CAMControlDrawerCustomButton *)self delegate];
      [v9 expandableButton:self willChangeExpanded:v7];
    }
    self->_expanded = v7;
    [(CAMControlDrawerCustomButton *)self setNeedsLayout];
    if (v6)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __67__CAMControlDrawerCustomButton__setExpanded_animated_shouldNotify___block_invoke;
      v10[3] = &unk_263FA0208;
      v10[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
  }
}

uint64_t __67__CAMControlDrawerCustomButton__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (UIEdgeInsets)expansionInsets
{
  double top = self->_expansionInsets.top;
  double left = self->_expansionInsets.left;
  double bottom = self->_expansionInsets.bottom;
  double right = self->_expansionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CAMControlDrawerExpandableButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMControlDrawerExpandableButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)_isTouchInTrackedView
{
  return self->__touchInTrackedView;
}

- (void)_setTouchInTrackedView:(BOOL)a3
{
  self->__touchInTrackedView = a3;
}

- (void).cxx_destruct
{
}

@end
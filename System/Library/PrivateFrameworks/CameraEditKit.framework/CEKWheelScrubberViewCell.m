@interface CEKWheelScrubberViewCell
+ (CGSize)defaultContentSize;
+ (CGSize)defaultScreenScaleContentSize;
+ (CGSize)defaultSize;
+ (double)defaultContentInsetWidth;
- (CEKWheelScrubberViewCell)initWithFrame:(CGRect)a3;
- (UIView)_clippingView;
- (UIView)_selectionDotView;
- (UIView)itemView;
- (UIView)overlayView;
- (double)contentInsetWidth;
- (double)selectionDotCenterTopSpacing;
- (int64_t)dotPlacement;
- (void)_updateSelectionDot;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentInsetWidth:(double)a3;
- (void)setDotPlacement:(int64_t)a3;
- (void)setOverlayView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionDotCenterTopSpacing:(double)a3;
@end

@implementation CEKWheelScrubberViewCell

+ (CGSize)defaultScreenScaleContentSize
{
  [a1 defaultContentSize];
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];

  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  double v5 = v4;
  v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)defaultContentSize
{
  int v2 = CEKIsSmallPhone();
  double v3 = 52.0;
  if (v2) {
    double v3 = 41.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CEKWheelScrubberViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CEKWheelScrubberViewCell;
  double v3 = -[CEKWheelScrubberViewCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [(id)objc_opt_class() defaultContentInsetWidth];
    v3->_contentInsetWidth = v4;
    double v5 = [(CEKWheelScrubberViewCell *)v3 contentView];
    [v5 setAutoresizingMask:18];
    [(CEKWheelScrubberViewCell *)v3 bounds];
    CGRect v21 = CGRectInset(v20, v3->_contentInsetWidth, v3->_contentInsetWidth);
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    clippingView = v3->__clippingView;
    v3->__clippingView = (UIView *)v6;

    [(UIView *)v3->__clippingView setAutoresizingMask:18];
    [(UIView *)v3->__clippingView setClipsToBounds:1];
    [v5 addSubview:v3->__clippingView];
    [(UIView *)v3->__clippingView bounds];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
    itemView = v3->_itemView;
    v3->_itemView = (UIView *)v12;

    [(UIView *)v3->_itemView setAutoresizingMask:18];
    [(UIView *)v3->_itemView setClipsToBounds:1];
    [(UIView *)v3->__clippingView addSubview:v3->_itemView];
    id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    selectionDotView = v3->__selectionDotView;
    v3->__selectionDotView = (UIView *)v15;

    [v5 addSubview:v3->__selectionDotView];
    [(CEKWheelScrubberViewCell *)v3 _updateSelectionDot];
    v3->_dotPlacement = 0;
    v17 = v3;
  }
  return v3;
}

- (void)_updateSelectionDot
{
  if ([(CEKWheelScrubberViewCell *)self isSelected]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  +[CEKWheelScrubberUtilities dotIndicatorDiameter];
  double v5 = v4;
  id v10 = +[CEKWheelScrubberUtilities dotIndicatorBackgroundColor];
  uint64_t v6 = [(CEKWheelScrubberViewCell *)self _selectionDotView];
  [v6 setBackgroundColor:v10];

  double v7 = [(CEKWheelScrubberViewCell *)self _selectionDotView];
  double v8 = [v7 layer];
  [v8 setCornerRadius:v5 * 0.5];

  double v9 = [(CEKWheelScrubberViewCell *)self _selectionDotView];
  [v9 setAlpha:v3];
}

- (void)setSelectionDotCenterTopSpacing:(double)a3
{
  if (self->_selectionDotCenterTopSpacing != a3)
  {
    self->_selectionDotCenterTopSpacing = a3;
    [(CEKWheelScrubberViewCell *)self setNeedsLayout];
  }
}

- (void)setDotPlacement:(int64_t)a3
{
  if (self->_dotPlacement != a3)
  {
    self->_dotPlacement = a3;
    [(CEKWheelScrubberViewCell *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CEKWheelScrubberViewCell *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)CEKWheelScrubberViewCell;
  [(CEKWheelScrubberViewCell *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(CEKWheelScrubberViewCell *)self _updateSelectionDot];
  }
}

- (void)setContentInsetWidth:(double)a3
{
  if (self->_contentInsetWidth != a3)
  {
    self->_contentInsetWidth = a3;
    [(CEKWheelScrubberViewCell *)self setNeedsLayout];
  }
}

- (void)setOverlayView:(id)a3
{
  int v5 = (UIView *)a3;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    double v7 = v5;
    [(UIView *)overlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayView, a3);
    overlayView = (UIView *)[(CEKWheelScrubberViewCell *)self addSubview:self->_overlayView];
    int v5 = v7;
  }
  MEMORY[0x1F41817F8](overlayView, v5);
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CEKWheelScrubberViewCell;
  [(CEKWheelScrubberViewCell *)&v35 layoutSubviews];
  [(CEKWheelScrubberViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CEKWheelScrubberViewCell *)self contentInsetWidth];
  CGFloat v12 = v11;
  v36.origin.double x = v4;
  v36.origin.double y = v6;
  v36.size.double width = v8;
  v36.size.double height = v10;
  CGRect v37 = CGRectInset(v36, v12, v12);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  v17 = [(CEKWheelScrubberViewCell *)self _clippingView];
  CGFloat v34 = x;
  objc_msgSend(v17, "setFrame:", x, y, width, height);

  +[CEKWheelScrubberUtilities dotIndicatorDiameter];
  double v19 = v18;
  [(CEKWheelScrubberViewCell *)self selectionDotCenterTopSpacing];
  int64_t v20 = [(CEKWheelScrubberViewCell *)self dotPlacement];
  if (v20 == 2 || v20 == 1)
  {
    v40.origin.double x = v4;
    v40.origin.double y = v6;
    v40.size.double width = v8;
    v40.size.double height = v10;
    CGRectGetMidX(v40);
    UIRoundToViewScale();
    double v25 = v26;
    CGFloat v23 = v34;
    v41.origin.double x = v34;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    CGRectGetMinX(v41);
    UIRoundToViewScale();
    double v22 = v27;
  }
  else if (v20)
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v23 = v34;
  }
  else
  {
    v38.origin.double x = v4;
    v38.origin.double y = v6;
    v38.size.double width = v8;
    v38.size.double height = v10;
    CGRectGetMidX(v38);
    UIRoundToViewScale();
    double v22 = v21;
    CGFloat v23 = v34;
    v39.origin.double x = v34;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    CGRectGetMinY(v39);
    UIRoundToViewScale();
    double v25 = v24;
  }
  v28 = [(CEKWheelScrubberViewCell *)self _selectionDotView];
  objc_msgSend(v28, "setFrame:", v22, v25, v19, v19);

  v29 = [(CEKWheelScrubberViewCell *)self overlayView];

  if (v29)
  {
    v30 = [(CEKWheelScrubberViewCell *)self overlayView];
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, width, height);

    v42.origin.double x = v23;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    double MidX = CGRectGetMidX(v42);
    v43.origin.double x = v23;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    double MidY = CGRectGetMidY(v43);
    v33 = [(CEKWheelScrubberViewCell *)self overlayView];
    objc_msgSend(v33, "setCenter:", MidX, MidY);
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CEKWheelScrubberViewCell;
  [(CEKWheelScrubberViewCell *)&v3 prepareForReuse];
  [(CEKWheelScrubberViewCell *)self setOverlayView:0];
}

+ (double)defaultContentInsetWidth
{
  return 1.0;
}

+ (CGSize)defaultSize
{
  [a1 defaultContentInsetWidth];
  double v4 = v3;
  [a1 defaultContentSize];
  double v6 = v5 + v4 * 2.0;
  double v8 = v7 + v4 * 2.0;
  result.double height = v8;
  result.double width = v6;
  return result;
}

- (double)contentInsetWidth
{
  return self->_contentInsetWidth;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (double)selectionDotCenterTopSpacing
{
  return self->_selectionDotCenterTopSpacing;
}

- (int64_t)dotPlacement
{
  return self->_dotPlacement;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIView)_selectionDotView
{
  return self->__selectionDotView;
}

- (UIView)_clippingView
{
  return self->__clippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clippingView, 0);
  objc_storeStrong((id *)&self->__selectionDotView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
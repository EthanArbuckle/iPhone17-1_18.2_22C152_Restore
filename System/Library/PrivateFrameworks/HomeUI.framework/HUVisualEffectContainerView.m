@interface HUVisualEffectContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HUVisualEffectContainerView)initWithInnerContentView:(id)a3;
- (UIView)innerContentView;
- (void)layoutSubviews;
- (void)setInnerContentView:(id)a3;
@end

@implementation HUVisualEffectContainerView

- (HUVisualEffectContainerView)initWithInnerContentView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUVisualEffectContainerView;
  v5 = [(HUVisualEffectContainerView *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUVisualEffectContainerView *)v5 setInnerContentView:v4];
  }

  return v6;
}

- (void)setInnerContentView:(id)a3
{
  v5 = (UIView *)a3;
  innerContentView = self->_innerContentView;
  objc_super v8 = v5;
  if (innerContentView != v5)
  {
    [(UIView *)innerContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_innerContentView, a3);
    v7 = [(HUVisualEffectContainerView *)self contentView];
    [v7 addSubview:v8];

    [(HUVisualEffectContainerView *)self invalidateIntrinsicContentSize];
    [(HUVisualEffectContainerView *)self setNeedsLayout];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v10 = [(HUVisualEffectContainerView *)self innerContentView];

  if (v10)
  {
    v13 = [(HUVisualEffectContainerView *)self innerContentView];
    *(float *)&double v14 = a4;
    *(float *)&double v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    double v17 = v16;
    double v19 = v18;

    double v20 = v17;
    double v21 = v19;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HUVisualEffectContainerView;
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    -[HUVisualEffectContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v22, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUVisualEffectContainerView *)self innerContentView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(HUVisualEffectContainerView *)self innerContentView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HUVisualEffectContainerView;
  [(HUVisualEffectContainerView *)&v4 layoutSubviews];
  double v3 = [(HUVisualEffectContainerView *)self innerContentView];
  [(HUVisualEffectContainerView *)self bounds];
  objc_msgSend(v3, "hu_setFramePreservingTransform:");
}

- (UIView)innerContentView
{
  return self->_innerContentView;
}

- (void).cxx_destruct
{
}

@end
@interface AVTFixedSizeViewContainer
- (AVTFixedSizeViewContainer)initWithFixedSizeView:(id)a3;
- (UIView)fixedSizeView;
- (void)layoutSubviews;
@end

@implementation AVTFixedSizeViewContainer

- (AVTFixedSizeViewContainer)initWithFixedSizeView:(id)a3
{
  id v5 = a3;
  [v5 frame];
  v10.receiver = self;
  v10.super_class = (Class)AVTFixedSizeViewContainer;
  v6 = -[AVTFixedSizeViewContainer initWithFrame:](&v10, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    p_fixedSizeView = (id *)&v6->_fixedSizeView;
    objc_storeStrong((id *)&v6->_fixedSizeView, a3);
    [*p_fixedSizeView setAutoresizingMask:0];
    [*p_fixedSizeView _setSafeAreaInsetsFrozen:1];
    [(AVTFixedSizeViewContainer *)v7 addSubview:v5];
  }

  return v7;
}

- (void)layoutSubviews
{
  [(AVTFixedSizeViewContainer *)self bounds];
  double MidX = CGRectGetMidX(v15);
  [(AVTFixedSizeViewContainer *)self bounds];
  double MidY = CGRectGetMidY(v16);
  id v5 = [(AVTFixedSizeViewContainer *)self fixedSizeView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;

  if (MidX != v7 || MidY != v9)
  {
    v11 = [(AVTFixedSizeViewContainer *)self fixedSizeView];
    objc_msgSend(v11, "setCenter:", MidX, MidY);
  }
  v12 = [(AVTFixedSizeViewContainer *)self fixedSizeView];
  [v12 bounds];

  [(AVTFixedSizeViewContainer *)self bounds];
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v13 = [(AVTFixedSizeViewContainer *)self fixedSizeView];
  memset(v14, 0, sizeof(v14));
  [v13 setTransform:v14];
}

- (UIView)fixedSizeView
{
  return self->_fixedSizeView;
}

- (void).cxx_destruct
{
}

@end
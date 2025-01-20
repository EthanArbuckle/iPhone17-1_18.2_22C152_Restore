@interface HURemoteContextHostingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HURemoteContextHostingView)initWithContentView:(id)a3;
- (UIView)contentView;
- (UIView)destinationOutContainerView;
- (UIView)destinationOutView;
- (UIView)destinationOverView;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (unint64_t)maskedCorners;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)setContentView:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
@end

@implementation HURemoteContextHostingView

- (HURemoteContextHostingView)initWithContentView:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HURemoteContextHostingView;
  v5 = [(HURemoteContextHostingView *)&v36 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(HURemoteContextHostingView *)v5 layer];
    [v7 setAllowsGroupBlending:0];

    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HURemoteContextHostingView *)v6 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    destinationOutContainerView = v6->_destinationOutContainerView;
    v6->_destinationOutContainerView = (UIView *)v9;

    v11 = [(UIView *)v6->_destinationOutContainerView layer];
    [v11 setAllowsGroupBlending:0];

    [(HURemoteContextHostingView *)v6 addSubview:v6->_destinationOutContainerView];
    id v12 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HURemoteContextHostingView *)v6 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    destinationOutView = v6->_destinationOutView;
    v6->_destinationOutView = (UIView *)v13;

    [(UIView *)v6->_destinationOutView setClipsToBounds:1];
    v15 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(UIView *)v6->_destinationOutView setBackgroundColor:v15];

    uint64_t v16 = *MEMORY[0x1E4F3A098];
    v17 = [(UIView *)v6->_destinationOutView layer];
    [v17 setCompositingFilter:v16];

    [(UIView *)v6->_destinationOutContainerView addSubview:v6->_destinationOutView];
    id v18 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HURemoteContextHostingView *)v6 bounds];
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
    destinationOverView = v6->_destinationOverView;
    v6->_destinationOverView = (UIView *)v19;

    uint64_t v21 = *MEMORY[0x1E4F3A0A0];
    v22 = [(UIView *)v6->_destinationOverView layer];
    [v22 setCompositingFilter:v21];

    [(HURemoteContextHostingView *)v6 addSubview:v6->_destinationOverView];
    [(HURemoteContextHostingView *)v6 setContentView:v4];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = [(HURemoteContextHostingView *)v6 destinationOutView];
    v37[0] = v23;
    v24 = [(HURemoteContextHostingView *)v6 destinationOutContainerView];
    v37[1] = v24;
    v25 = [(HURemoteContextHostingView *)v6 destinationOverView];
    v37[2] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v30++) setAutoresizingMask:18];
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v28);
    }
  }
  return v6;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xF;
  id v5 = [(HURemoteContextHostingView *)self destinationOutView];
  id v4 = [v5 layer];
  [v4 setMaskedCorners:v3];
}

- (UIView)destinationOutView
{
  return self->_destinationOutView;
}

- (UIView)destinationOverView
{
  return self->_destinationOverView;
}

- (void)setContentView:(id)a3
{
  id v5 = (UIView *)a3;
  contentView = self->_contentView;
  uint64_t v9 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    v7 = [(HURemoteContextHostingView *)self destinationOverView];
    [v7 addSubview:v9];

    [(HURemoteContextHostingView *)self bounds];
    -[UIView setFrame:](v9, "setFrame:");
    [(UIView *)v9 setAutoresizingMask:18];
    id v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(UIView *)v9 setBackgroundColor:v8];
  }
}

- (UIView)destinationOutContainerView
{
  return self->_destinationOutContainerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(HURemoteContextHostingView *)self contentView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(HURemoteContextHostingView *)self contentView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (unint64_t)maskedCorners
{
  v2 = [(HURemoteContextHostingView *)self destinationOutView];
  unint64_t v3 = [v2 layer];
  unint64_t v4 = [v3 maskedCorners] & 0xF;

  return v4;
}

- (double)_cornerRadius
{
  v2 = [(HURemoteContextHostingView *)self destinationOutView];
  [v2 _cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  id v4 = [(HURemoteContextHostingView *)self destinationOutView];
  [v4 _setCornerRadius:a3];
}

- (double)_continuousCornerRadius
{
  v2 = [(HURemoteContextHostingView *)self destinationOutView];
  [v2 _continuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4 = [(HURemoteContextHostingView *)self destinationOutView];
  [v4 _setContinuousCornerRadius:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationOverView, 0);
  objc_storeStrong((id *)&self->_destinationOutView, 0);
  objc_storeStrong((id *)&self->_destinationOutContainerView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
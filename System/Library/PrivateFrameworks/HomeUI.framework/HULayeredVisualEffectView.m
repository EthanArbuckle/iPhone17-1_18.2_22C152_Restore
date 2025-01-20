@interface HULayeredVisualEffectView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HULayeredBackgroundEffect)backgroundEffect;
- (HULayeredContentEffect)contentEffect;
- (HULayeredVisualEffectView)initWithContentEffect:(id)a3 backgroundEffect:(id)a4;
- (HULayeredVisualEffectView)initWithFrame:(CGRect)a3;
- (UIView)backgroundFillView;
- (UIView)contentView;
- (UIVisualEffectView)backgroundEffectView;
- (UIVisualEffectView)contentEffectView;
- (double)backgroundEffectAlpha;
- (double)contentEffectAlpha;
- (double)cornerRadius;
- (void)_applyCornerRadius;
- (void)_updateBackgroundEffects;
- (void)_updateContentEffects;
- (void)_updateSubviewOrder;
- (void)setBackgroundEffect:(id)a3;
- (void)setBackgroundEffectAlpha:(double)a3;
- (void)setBackgroundEffectView:(id)a3;
- (void)setBackgroundFillView:(id)a3;
- (void)setContentEffect:(id)a3;
- (void)setContentEffectAlpha:(double)a3;
- (void)setContentEffectView:(id)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation HULayeredVisualEffectView

- (HULayeredVisualEffectView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HULayeredVisualEffectView;
  v3 = -[HULayeredVisualEffectView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    [(HULayeredVisualEffectView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    contentEffectView = v3->_contentEffectView;
    v3->_contentEffectView = (UIVisualEffectView *)v5;

    [(UIVisualEffectView *)v3->_contentEffectView setAutoresizingMask:18];
    [(HULayeredVisualEffectView *)v3 addSubview:v3->_contentEffectView];
    v3->_contentEffectAlpha = 1.0;
    v3->_backgroundEffectAlpha = 1.0;
    [(HULayeredVisualEffectView *)v3 _updateContentEffects];
    [(HULayeredVisualEffectView *)v3 _updateBackgroundEffects];
  }
  return v3;
}

- (HULayeredVisualEffectView)initWithContentEffect:(id)a3 backgroundEffect:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HULayeredVisualEffectView;
  v9 = [(HULayeredVisualEffectView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentEffect, a3);
    objc_storeStrong((id *)&v10->_backgroundEffect, a4);
    v10->_contentEffectAlpha = 1.0;
    v10->_backgroundEffectAlpha = 1.0;
    [(HULayeredVisualEffectView *)v10 _updateContentEffects];
    [(HULayeredVisualEffectView *)v10 _updateBackgroundEffects];
  }

  return v10;
}

- (void)setContentEffect:(id)a3
{
  uint64_t v5 = (HULayeredContentEffect *)a3;
  if (self->_contentEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentEffect, a3);
    [(HULayeredVisualEffectView *)self _updateContentEffects];
    uint64_t v5 = v6;
  }
}

- (void)setBackgroundEffect:(id)a3
{
  uint64_t v5 = (HULayeredBackgroundEffect *)a3;
  if (self->_backgroundEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundEffect, a3);
    [(HULayeredVisualEffectView *)self _updateBackgroundEffects];
    uint64_t v5 = v6;
  }
}

- (UIView)contentView
{
  v2 = [(HULayeredVisualEffectView *)self contentEffectView];
  v3 = [v2 contentView];

  return (UIView *)v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = [(HULayeredVisualEffectView *)self contentView];
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

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(HULayeredVisualEffectView *)self _applyCornerRadius];
  }
}

- (void)setContentEffectAlpha:(double)a3
{
  if (self->_contentEffectAlpha != a3)
  {
    self->_contentEffectAlpha = a3;
    [(HULayeredVisualEffectView *)self _updateContentEffects];
  }
}

- (void)setBackgroundEffectAlpha:(double)a3
{
  if (self->_backgroundEffectAlpha != a3)
  {
    self->_backgroundEffectAlpha = a3;
    [(HULayeredVisualEffectView *)self _updateBackgroundEffects];
  }
}

- (void)_updateContentEffects
{
  v3 = [(HULayeredVisualEffectView *)self contentEffect];
  id v4 = [v3 vibrancyEffect];
  uint64_t v5 = [(HULayeredVisualEffectView *)self contentEffectView];
  [v5 setEffect:v4];

  v6 = [(HULayeredVisualEffectView *)self contentEffect];
  id v7 = [v6 tintColor];
  id v8 = [(HULayeredVisualEffectView *)self contentEffectView];
  [v8 setTintColor:v7];

  [(HULayeredVisualEffectView *)self contentEffectAlpha];
  double v10 = v9;
  id v11 = [(HULayeredVisualEffectView *)self contentEffectView];
  [v11 setAlpha:v10];
}

- (void)_updateBackgroundEffects
{
  v3 = [(HULayeredVisualEffectView *)self backgroundEffect];
  uint64_t v4 = [v3 blurEffect];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = [(HULayeredVisualEffectView *)self backgroundEffectView];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F43028]);
    [(HULayeredVisualEffectView *)self bounds];
    id v8 = objc_msgSend(v7, "initWithFrame:");
    [(HULayeredVisualEffectView *)self setBackgroundEffectView:v8];

    double v9 = [(HULayeredVisualEffectView *)self backgroundEffectView];
    [v9 setAutoresizingMask:18];

    v3 = [(HULayeredVisualEffectView *)self backgroundEffectView];
    [(HULayeredVisualEffectView *)self insertSubview:v3 atIndex:0];
  }

LABEL_5:
  double v10 = [(HULayeredVisualEffectView *)self backgroundEffect];
  id v11 = [v10 blurEffect];
  double v12 = [(HULayeredVisualEffectView *)self backgroundEffectView];
  [v12 setEffect:v11];

  double v13 = [(HULayeredVisualEffectView *)self backgroundEffect];
  uint64_t v14 = [v13 fillColor];
  if (v14)
  {
    double v15 = (void *)v14;
    double v16 = [(HULayeredVisualEffectView *)self backgroundFillView];

    if (v16) {
      goto LABEL_9;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HULayeredVisualEffectView *)self bounds];
    v18 = objc_msgSend(v17, "initWithFrame:");
    [(HULayeredVisualEffectView *)self setBackgroundFillView:v18];

    v19 = [(HULayeredVisualEffectView *)self backgroundFillView];
    [v19 setAutoresizingMask:18];

    double v13 = [(HULayeredVisualEffectView *)self backgroundFillView];
    [(HULayeredVisualEffectView *)self insertSubview:v13 atIndex:0];
  }

LABEL_9:
  v20 = [(HULayeredVisualEffectView *)self backgroundEffect];
  v21 = [v20 fillColor];
  v22 = [(HULayeredVisualEffectView *)self backgroundFillView];
  [v22 setBackgroundColor:v21];

  v23 = [(HULayeredVisualEffectView *)self backgroundEffect];
  v24 = [v23 fillColor];
  if (v24) {
    double v25 = 1.0;
  }
  else {
    double v25 = 0.0;
  }
  v26 = [(HULayeredVisualEffectView *)self backgroundFillView];
  [v26 setAlpha:v25];

  [(HULayeredVisualEffectView *)self backgroundEffectAlpha];
  double v28 = v27;
  v29 = [(HULayeredVisualEffectView *)self backgroundEffectView];
  [v29 setAlpha:v28];

  [(HULayeredVisualEffectView *)self _updateSubviewOrder];

  [(HULayeredVisualEffectView *)self _applyCornerRadius];
}

- (void)_updateSubviewOrder
{
  v3 = [(HULayeredVisualEffectView *)self backgroundFillView];

  if (v3)
  {
    uint64_t v4 = [(HULayeredVisualEffectView *)self backgroundFillView];
    [(HULayeredVisualEffectView *)self sendSubviewToBack:v4];
  }
  uint64_t v5 = [(HULayeredVisualEffectView *)self backgroundEffectView];

  if (v5)
  {
    id v6 = [(HULayeredVisualEffectView *)self backgroundEffectView];
    [(HULayeredVisualEffectView *)self sendSubviewToBack:v6];
  }
}

- (void)_applyCornerRadius
{
  [(HULayeredVisualEffectView *)self cornerRadius];
  double v4 = v3;
  uint64_t v5 = [(HULayeredVisualEffectView *)self backgroundEffectView];
  [v5 _setCornerRadius:v4];

  [(HULayeredVisualEffectView *)self cornerRadius];
  double v7 = v6;
  id v8 = [(HULayeredVisualEffectView *)self backgroundFillView];
  [v8 _setCornerRadius:v7];
}

- (HULayeredContentEffect)contentEffect
{
  return self->_contentEffect;
}

- (HULayeredBackgroundEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (double)contentEffectAlpha
{
  return self->_contentEffectAlpha;
}

- (double)backgroundEffectAlpha
{
  return self->_backgroundEffectAlpha;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffectView)contentEffectView
{
  return self->_contentEffectView;
}

- (void)setContentEffectView:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (UIView)backgroundFillView
{
  return self->_backgroundFillView;
}

- (void)setBackgroundFillView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundFillView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);

  objc_storeStrong((id *)&self->_contentEffect, 0);
}

@end
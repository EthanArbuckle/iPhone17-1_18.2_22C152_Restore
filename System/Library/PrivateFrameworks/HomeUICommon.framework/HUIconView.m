@interface HUIconView
- (BOOL)disableContinuousAnimation;
- (BOOL)useIntrinsicContentSizeFromAsset;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HFIconDescriptor)iconDescriptor;
- (HUIconContentView)currentIconContentView;
- (HUIconView)initWithFrame:(CGRect)a3;
- (HUIconView)initWithFrame:(CGRect)a3 contentMode:(int64_t)a4;
- (UIVisualEffect)vibrancyEffect;
- (UIVisualEffectView)effectView;
- (double)vibrancyEffectAnimationDuration;
- (id)_defaultVibrancyEffect;
- (id)contentContainerView;
- (int64_t)contentMode;
- (unint64_t)displayContext;
- (unint64_t)displayStyle;
- (unint64_t)iconSize;
- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3;
- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)reclaimIconIfPossible;
- (void)renounceIconIfPossible;
- (void)setContentMode:(int64_t)a3;
- (void)setCurrentIconContentView:(id)a3;
- (void)setDisableContinuousAnimation:(BOOL)a3;
- (void)setDisplayContext:(unint64_t)a3;
- (void)setEffectView:(id)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setUseIntrinsicContentSizeFromAsset:(BOOL)a3;
- (void)setVibrancyEffect:(id)a3;
- (void)setVibrancyEffect:(id)a3 animated:(BOOL)a4;
- (void)setVibrancyEffectAnimationDuration:(double)a3;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUIconView

- (void)setVibrancyEffect:(id)a3
{
}

- (void)setUseIntrinsicContentSizeFromAsset:(BOOL)a3
{
  self->_useIntrinsicContentSizeFromAsset = a3;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (HUIconView)initWithFrame:(CGRect)a3 contentMode:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUIconView;
  v5 = -[HUIconView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:0];
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v6;

    v8 = [(UIVisualEffectView *)v5->_effectView contentView];
    [v8 setClipsToBounds:0];

    [(HUIconView *)v5 addSubview:v5->_effectView];
    v5->_contentMode = a4;
    v5->_vibrancyEffectAnimationDuration = 0.25;
  }
  return v5;
}

- (id)contentContainerView
{
  v2 = [(HUIconView *)self effectView];
  v3 = [v2 contentView];

  return v3;
}

- (void)setIconSize:(unint64_t)a3
{
  if (self->_iconSize != a3)
  {
    self->_iconSize = a3;
    v5 = [(HUIconView *)self currentIconContentView];
    [v5 setIconSize:a3];

    [(HUIconView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  double v3 = HUDefaultSizeForIconSize([(HUIconView *)self iconSize]);
  double v5 = v4;
  uint64_t v6 = [(HUIconView *)self currentIconContentView];
  if ([v6 conformsToProtocol:&unk_2702D4DF0]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8 && [(HUIconView *)self useIntrinsicContentSizeFromAsset])
  {
    [v8 iconContentIntrinsicContentSize];
    double v3 = v9;
    double v5 = v10;
  }
  -[HUIconView sizeThatFits:](self, "sizeThatFits:", v3, v5);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v43 = a3;
  id v8 = [(HUIconView *)self currentIconContentView];
  if (v43)
  {
    [v8 setHidden:0];

    double v9 = [(HUIconView *)self currentIconContentView];
    uint64_t v10 = objc_opt_class();

    double v11 = +[HUIconContentView iconContentViewClassForIconDescriptor:v43];
    if ((objc_class *)v10 != v11)
    {
      double v12 = [(HUIconView *)self currentIconContentView];
      [v12 removeFromSuperview];

      double v13 = [(HUIconView *)self currentIconContentView];

      if (v13)
      {
        double v14 = +[HUIconContentViewReuseQueue globalReuseQueueForContentViewClass:v10];
        double v15 = [(HUIconView *)self currentIconContentView];
        [v14 reapContentView:v15];
      }
      if (v11)
      {
        double v16 = +[HUIconContentViewReuseQueue globalReuseQueueForContentViewClass:v11];
        v17 = [v16 dequeueContentView];
        [(HUIconView *)self setCurrentIconContentView:v17];

        [(HUIconView *)self bounds];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        v26 = [(HUIconView *)self currentIconContentView];
        objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

        v27 = [(HUIconView *)self currentIconContentView];
        [v27 setDelegate:self];

        unint64_t v28 = [(HUIconView *)self displayContext];
        v29 = [(HUIconView *)self currentIconContentView];
        [v29 setDisplayContext:v28];

        BOOL v30 = [(HUIconView *)self disableContinuousAnimation];
        v31 = [(HUIconView *)self currentIconContentView];
        [v31 setDisableContinuousAnimation:v30];

        unint64_t v32 = [(HUIconView *)self iconSize];
        v33 = [(HUIconView *)self currentIconContentView];
        [v33 setIconSize:v32];

        v34 = [(HUIconView *)self contentContainerView];
        v35 = [(HUIconView *)self currentIconContentView];
        [v34 addSubview:v35];

        [(HUIconView *)self invalidateIntrinsicContentSize];
        [(HUIconView *)self setNeedsLayout];
      }
      else
      {
        [(HUIconView *)self setCurrentIconContentView:0];
      }
    }
    v36 = [(HUIconView *)self currentIconContentView];
    [v36 updateWithIconDescriptor:v43 displayStyle:a4 animated:v5];

    objc_opt_class();
    v37 = [(HUIconView *)self currentIconContentView];
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
    id v8 = v38;

    if (v8) {
      objc_msgSend(v8, "setIconContentMode:", -[HUIconView contentMode](self, "contentMode"));
    }
    objc_opt_class();
    v39 = [(HUIconView *)self currentIconContentView];
    if (objc_opt_isKindOfClass()) {
      v40 = v39;
    }
    else {
      v40 = 0;
    }
    id v41 = v40;

    objc_msgSend(v41, "setUseAssetMarginSize:", -[HUIconView useIntrinsicContentSizeFromAsset](self, "useIntrinsicContentSizeFromAsset") ^ 1);
    unint64_t displayStyle = self->_displayStyle;
    self->_unint64_t displayStyle = a4;
    if ((objc_class *)v10 != v11 || displayStyle != a4) {
      [(HUIconView *)self _updateVisualEffectStateForVibrancyEffectChange:0];
    }
    [(HUIconView *)self invalidateIntrinsicContentSize];
    [(HUIconView *)self setNeedsLayout];
  }
  else
  {
    [v8 setHidden:1];
  }
}

- (HUIconContentView)currentIconContentView
{
  return self->_currentIconContentView;
}

- (BOOL)useIntrinsicContentSizeFromAsset
{
  return self->_useIntrinsicContentSizeFromAsset;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)HUIconView;
  [(HUIconView *)&v22 layoutSubviews];
  [(HUIconView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(HUIconView *)self effectView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __28__HUIconView_layoutSubviews__block_invoke;
  v21[3] = &unk_265381088;
  v21[4] = self;
  __28__HUIconView_layoutSubviews__block_invoke((uint64_t)v21);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(HUIconView *)self currentIconContentView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v7 = [(HUIconView *)self vibrancyEffect];
  double v8 = [(HUIconView *)self currentIconContentView];
  [v8 setVibrancyEffect:v7];

  double v9 = [(HUIconView *)self currentIconContentView];
  int v10 = [v9 wantsManagedVibrancyEffect];

  unint64_t v11 = [(HUIconView *)self displayStyle];
  double v12 = [(HUIconView *)self effectView];
  double v13 = v12;
  BOOL v28 = v11 == 2;
  if (v11 == 2 && v10)
  {
    double v14 = [v12 effect];

    if (!v14 || v5)
    {
      if (v4)
      {
        double v15 = (void *)MEMORY[0x263F1CB60];
        [(HUIconView *)self vibrancyEffectAnimationDuration];
        double v17 = v16;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke;
        v36[3] = &unk_2653810B0;
        v36[4] = self;
        id v37 = v7;
        [v15 animateWithDuration:v36 animations:v17];
      }
      else
      {
        double v18 = [(HUIconView *)self effectView];
        [v18 setEffect:v7];
      }
    }
  }
  else
  {
    [v12 setEffect:0];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v19 = [(HUIconView *)self currentIconContentView];
  double v20 = [v19 managedVisualEffectViews];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    if (v11 == 2) {
      double v24 = v7;
    }
    else {
      double v24 = 0;
    }
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (v4)
        {
          v27 = (void *)MEMORY[0x263F1CB60];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke_2;
          v29[3] = &unk_2653810D8;
          v29[4] = v26;
          BOOL v31 = v28;
          id v30 = v7;
          [v27 animateWithDuration:v29 animations:0.25];
        }
        else
        {
          [v26 setEffect:v24];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v22);
  }
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UIVisualEffect)vibrancyEffect
{
  vibrancyEffect = self->_vibrancyEffect;
  if (vibrancyEffect)
  {
    double v3 = vibrancyEffect;
  }
  else
  {
    double v3 = [(HUIconView *)self _defaultVibrancyEffect];
  }
  return v3;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (id)_defaultVibrancyEffect
{
  v2 = [MEMORY[0x263F1C480] effectWithStyle:4];
  double v3 = [MEMORY[0x263F1CB58] _effectForBlurEffect:v2 vibrancyStyle:110];

  return v3;
}

uint64_t __28__HUIconView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 bounds];
  objc_msgSend(v2, "sizeThatFits:", v3, v4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  [*(id *)(a1 + 32) bounds];
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v14.origin.x = *(CGFloat *)MEMORY[0x263F00148];
  v14.origin.y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  memset(&v10, 0, sizeof(v10));
  v14.size.width = v6;
  v14.size.height = v8;
  CGRectApplyAffineTransform(v14, &v10);
  [*(id *)(a1 + 32) bounds];
  return UIRectCenteredIntegralRect();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double v5 = [(HUIconView *)self currentIconContentView];
  if (v5)
  {
    CGFloat v6 = [(HUIconView *)self currentIconContentView];
    [v6 aspectRatio];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
  }

  double v9 = height * v8;
  double v10 = height;
  result.double height = v10;
  result.width = v9;
  return result;
}

- (void)setCurrentIconContentView:(id)a3
{
}

- (unint64_t)displayContext
{
  return self->_displayContext;
}

- (BOOL)disableContinuousAnimation
{
  return self->_disableContinuousAnimation;
}

- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3
{
}

- (void)setVibrancyEffect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((-[UIVisualEffect isEqual:](self->_vibrancyEffect, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyEffect, a3);
    [(HUIconView *)self _updateVisualEffectStateForVibrancyEffectChange:1 animated:v4];
  }
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (HUIconView)initWithFrame:(CGRect)a3
{
  return -[HUIconView initWithFrame:contentMode:](self, "initWithFrame:contentMode:", 4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renounceIconIfPossible
{
  id v2 = [(HUIconView *)self currentIconContentView];
  [v2 renounceIconIfPossible];
}

- (void)reclaimIconIfPossible
{
  id v2 = [(HUIconView *)self currentIconContentView];
  [v2 reclaimIconIfPossible];
}

void __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) effectView];
  [v2 setEffect:v1];
}

uint64_t __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v1 = 0;
  }
  return [*(id *)(a1 + 32) setEffect:v1];
}

- (void)setDisplayContext:(unint64_t)a3
{
  unint64_t displayContext = self->_displayContext;
  self->_unint64_t displayContext = a3;
  CGFloat v6 = [(HUIconView *)self currentIconContentView];
  [v6 setDisplayContext:a3];

  if (displayContext != a3 && !self->_vibrancyEffect)
  {
    [(HUIconView *)self _updateVisualEffectStateForVibrancyEffectChange:1];
  }
}

- (HFIconDescriptor)iconDescriptor
{
  id v2 = [(HUIconView *)self currentIconContentView];
  double v3 = [v2 iconDescriptor];

  return (HFIconDescriptor *)v3;
}

- (void)setDisableContinuousAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableContinuousAnimation = a3;
  id v4 = [(HUIconView *)self currentIconContentView];
  [v4 setDisableContinuousAnimation:v3];
}

- (double)vibrancyEffectAnimationDuration
{
  return self->_vibrancyEffectAnimationDuration;
}

- (void)setVibrancyEffectAnimationDuration:(double)a3
{
  self->_vibrancyEffectAnimationDuration = a3;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIconContentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
}

@end
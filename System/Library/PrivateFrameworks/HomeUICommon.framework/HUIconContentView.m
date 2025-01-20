@interface HUIconContentView
+ (Class)iconContentViewClassForIconDescriptor:(id)a3;
+ (id)iconImageNamed:(id)a3 withSize:(unint64_t)a4 displayStyle:(unint64_t)a5;
- (BOOL)disableContinuousAnimation;
- (BOOL)shouldFlipForRTL;
- (BOOL)wantsManagedVibrancyEffect;
- (HFIconDescriptor)iconDescriptor;
- (HUIconContentView)initWithFrame:(CGRect)a3;
- (HUIconContentViewDelegate)delegate;
- (UIVisualEffect)vibrancyEffect;
- (double)aspectRatio;
- (id)managedVisualEffectViews;
- (int64_t)primaryState;
- (int64_t)renderingMode;
- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4;
- (unint64_t)displayContext;
- (unint64_t)displayStyle;
- (unint64_t)iconSize;
- (void)_updateOverrideRenderingModeForSubviewsOfView:(id)a3;
- (void)invalidateRenderingMode;
- (void)setAspectRatio:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableContinuousAnimation:(BOOL)a3;
- (void)setDisplayContext:(unint64_t)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setPrimaryState:(int64_t)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setVibrancyEffect:(id)a3;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUIconContentView

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (BOOL)wantsManagedVibrancyEffect
{
  return 1;
}

- (void)setVibrancyEffect:(id)a3
{
}

- (id)managedVisualEffectViews
{
  return (id)MEMORY[0x263EFFA68];
}

+ (Class)iconContentViewClassForIconDescriptor:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [MEMORY[0x263F47B48] isHomeUIService];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && v3) {
          NSLog(&cfstr_NoIconViewClas.isa, v3);
        }
      }
    }
  }
  v4 = (objc_class *)(id)objc_opt_class();

  return v4;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  [(HUIconContentView *)self setIconDescriptor:v7];
  [(HUIconContentView *)self setDisplayStyle:a4];
  if ([(HUIconContentView *)self effectiveUserInterfaceLayoutDirection] == 1
    && [(HUIconContentView *)self shouldFlipForRTL])
  {
    int v8 = [v7 shouldForceLTR] ^ 1;
  }
  else
  {
    int v8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v7 isSystemImage];
    CGFloat v10 = -1.0;
    if (v8 & ~v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CGFloat v10 = -1.0;
  if ((v8 & 1) == 0) {
LABEL_9:
  }
    CGFloat v10 = 1.0;
LABEL_10:
  CGAffineTransformMakeScale(&v12, v10, 1.0);
  CGAffineTransform v11 = v12;
  [(HUIconContentView *)self setTransform:&v11];
}

- (void)_updateOverrideRenderingModeForSubviewsOfView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend(a3, "subviews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          int64_t v11 = [(HUIconContentView *)self renderingModeForSubview:v10 suggestedRenderingMode:[(HUIconContentView *)self renderingMode]];
          id v12 = [v10 image];
          v13 = [v12 imageWithRenderingMode:v11];
          [v10 setImage:v13];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v12 = v9;
          objc_msgSend(v12, "_setTextColorFollowsTintColor:", -[HUIconContentView renderingMode](self, "renderingMode") == 2);
        }

LABEL_11:
        [(HUIconContentView *)self _updateOverrideRenderingModeForSubviewsOfView:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
  [(HUIconContentView *)self _updateOverrideRenderingModeForSubviewsOfView:self];
}

- (void)setIconDescriptor:(id)a3
{
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
  [(HUIconContentView *)self setRenderingMode:2 * (a3 != 1)];
}

- (void)setDisplayContext:(unint64_t)a3
{
  self->_displayContext = a3;
}

- (void)setDisableContinuousAnimation:(BOOL)a3
{
  self->_disableContinuousAnimation = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (HUIconContentView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUIconContentView;
  result = -[HUIconContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_aspectRatio = 1.0;
  }
  return result;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4
{
  return a4;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setAspectRatio:(double)a3
{
  if (vabdd_f64(a3, self->_aspectRatio) > 0.00000011920929)
  {
    self->_aspectRatio = a3;
    objc_super v4 = [(HUIconContentView *)self delegate];
    [v4 iconContentView:self didChangeAspectRatio:self->_aspectRatio];

    [(HUIconContentView *)self setNeedsLayout];
  }
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (HUIconContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HUIconContentViewDelegate *)WeakRetained;
}

- (BOOL)shouldFlipForRTL
{
  return 1;
}

- (void)invalidateRenderingMode
{
}

+ (id)iconImageNamed:(id)a3 withSize:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  return HUIconImageNamed(a3, a4, a5);
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (unint64_t)displayContext
{
  return self->_displayContext;
}

- (BOOL)disableContinuousAnimation
{
  return self->_disableContinuousAnimation;
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
}

@end
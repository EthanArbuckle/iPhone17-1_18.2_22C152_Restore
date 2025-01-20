@interface _HUQuickControlControllableHostView
- (BOOL)isUserInteractionActive;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (HUQuickControlViewProfile)profile;
- (MTMaterialView)backgroundView;
- (_HUQuickControlControllableHostView)initWithProfile:(id)a3;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (void)setBackgroundView:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation _HUQuickControlControllableHostView

- (_HUQuickControlControllableHostView)initWithProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HUQuickControlControllableHostView;
  v6 = -[_HUQuickControlControllableHostView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 configuration:1];
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = (MTMaterialView *)v8;

    [(MTMaterialView *)v7->_backgroundView _setContinuousCornerRadius:28.0];
    [(MTMaterialView *)v7->_backgroundView setUserInteractionEnabled:0];
    [(MTMaterialView *)v7->_backgroundView setAutoresizingMask:18];
    [(_HUQuickControlControllableHostView *)v7 addSubview:v7->_backgroundView];
  }

  return v7;
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor];
}

- (HUQuickControlViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end
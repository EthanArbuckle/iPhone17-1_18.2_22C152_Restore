@interface CPUINowPlayingButtonWrapperView
- (CPUINowPlayingButton)nowPlayingButton;
- (CPUINowPlayingButtonWrapperView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4;
@end

@implementation CPUINowPlayingButtonWrapperView

- (CPUINowPlayingButtonWrapperView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [[CPUINowPlayingButton alloc] initWithBundleIdentifier:v7];

  v9 = CPUILocalizedStringForKey(@"NOW_PLAYING");
  v17[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(CPUINowPlayingButton *)v8 setAccessibilityUserInputLabels:v10];

  [(CPUINowPlayingButton *)v8 frame];
  v16.receiver = self;
  v16.super_class = (Class)CPUINowPlayingButtonWrapperView;
  v12 = -[CPUINowPlayingButtonWrapperView initWithFrame:](&v16, sel_initWithFrame_, x, y, v11 + 6.0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_nowPlayingButton, v8);
    [(CPUINowPlayingButtonWrapperView *)v13 addSubview:v8];
    if ([(CPUINowPlayingButtonWrapperView *)v13 effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(CPUINowPlayingButton *)v8 frame];
      [(CPUINowPlayingButton *)v8 setFrame:v14 + 6.0];
    }
  }

  return v13;
}

- (CPUINowPlayingButton)nowPlayingButton
{
  return self->_nowPlayingButton;
}

- (void).cxx_destruct
{
}

@end
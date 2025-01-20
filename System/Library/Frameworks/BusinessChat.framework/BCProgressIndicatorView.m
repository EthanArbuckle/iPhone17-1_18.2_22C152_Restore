@interface BCProgressIndicatorView
- (BCProgressIndicatorView)init;
- (uint64_t)hide;
- (void)show;
@end

@implementation BCProgressIndicatorView

- (BCProgressIndicatorView)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCProgressIndicatorView;
  v2 = [(BCProgressIndicatorView *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [MEMORY[0x263F1C550] colorNamed:@"ProgressBarColor" inBundle:v3 compatibleWithTraitCollection:0];
    [(BCProgressIndicatorView *)v2 setProgressTintColor:v4];
  }
  return v2;
}

- (uint64_t)hide
{
  if (result)
  {
    v1[4] = result;
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __31__BCProgressIndicatorView_hide__block_invoke;
    v2[3] = &unk_264851ED0;
    v2[4] = result;
    v1[0] = MEMORY[0x263EF8330];
    v1[1] = 3221225472;
    v1[2] = __31__BCProgressIndicatorView_hide__block_invoke_2;
    v1[3] = &unk_2648521C8;
    return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:v1 completion:0.25];
  }
  return result;
}

uint64_t __31__BCProgressIndicatorView_hide__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __31__BCProgressIndicatorView_hide__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  [*(id *)(a1 + 32) setHidden:a2];
  if (v2)
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v3, 0);
  }
}

- (void)show
{
  if (result)
  {
    v1 = result;
    [result setHidden:0];
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __31__BCProgressIndicatorView_show__block_invoke;
    v2[3] = &unk_264851ED0;
    v2[4] = v1;
    return (void *)[MEMORY[0x263F1CB60] animateWithDuration:v2 animations:&__block_literal_global_1 completion:0.25];
  }
  return result;
}

uint64_t __31__BCProgressIndicatorView_show__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __31__BCProgressIndicatorView_show__block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end
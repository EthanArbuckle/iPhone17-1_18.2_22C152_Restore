@interface ASNavigationController
- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASNavigationController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)ASNavigationController;
  [(ASNavigationController *)&v15 viewDidLoad];
  [(ASNavigationController *)self _setBuiltinTransitionStyle:1];
  id v3 = objc_alloc_init(MEMORY[0x263F827E8]);
  v4 = [(ASNavigationController *)self navigationBar];
  [v4 setBackgroundImage:v3 forBarMetrics:0];

  v5 = [(ASNavigationController *)self navigationBar];
  [v5 setTranslucent:1];

  id v6 = objc_alloc(MEMORY[0x263F82E50]);
  v7 = +[ASViewServiceInterfaceUtilities paneBackgroundBlurEffect];
  v8 = (UIVisualEffectView *)[v6 initWithEffect:v7];
  backdropView = self->_backdropView;
  self->_backdropView = v8;

  v10 = [(ASNavigationController *)self view];
  [v10 bounds];
  -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:");

  v11 = [(ASNavigationController *)self view];
  [v11 insertSubview:self->_backdropView atIndex:0];

  if (([MEMORY[0x263F29440] isPad] & 1) == 0)
  {
    [(UIVisualEffectView *)self->_backdropView _setContinuousCornerRadius:10.0];
    v12 = [(UIVisualEffectView *)self->_backdropView layer];
    [v12 setMaskedCorners:3];

    [(UIVisualEffectView *)self->_backdropView setClipsToBounds:1];
  }
  v13 = [MEMORY[0x263F825C8] clearColor];
  v14 = [(ASNavigationController *)self view];
  [v14 setBackgroundColor:v13];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v6 = a3;
  -[ASNavigationController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)ASNavigationController;
  [(ASNavigationController *)&v7 preferredContentSizeDidChangeForChildContentContainer:v6];
}

- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  +[ASViewServiceInterfaceUtilities navigationBarHeight];
  double v6 = height + v5;
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
}

@end
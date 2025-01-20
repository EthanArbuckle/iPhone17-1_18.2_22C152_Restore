@interface _UIColorPickerContainerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_UIColorPickerContainerViewController)initWithCoder:(id)a3;
- (_UIColorPickerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIColorPickerViewProvidingDelegate)_delegate;
- (void)_commonInit;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyeDropper;
- (void)_pickerDidSelectColor:(id)a3 isVolatile:(BOOL)a4;
- (void)_pickerDidShowEyedropperWithSelectionBlock:(id)a3 dismissBlock:(id)a4;
- (void)_setConfiguration:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4;
- (void)_updateContentViewConfiguration;
- (void)buildMenuWithBuilder:(id)a3;
- (void)dismissEyedropper:(BOOL)a3;
- (void)eyedropperDidDismiss;
- (void)eyedropperDidSelectColor:(id)a3;
- (void)floatEyedropper;
- (void)invokeEyedropper;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewLayoutMarginsDidChange;
@end

@implementation _UIColorPickerContainerViewController

- (_UIColorPickerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIColorPickerContainerViewController;
  v4 = [(_UIColorPickerContainerViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(_UIColorPickerContainerViewController *)v4 _commonInit];
  }
  return v5;
}

- (_UIColorPickerContainerViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIColorPickerContainerViewController;
  v3 = [(_UIColorPickerContainerViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIColorPickerContainerViewController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = +[UIMenuSystem mainSystem];
  [v3 _setInitialBuildingResponder:self];
}

- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4
{
}

- (void)_setConfiguration:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  [(_UIColorPickerContainerViewController *)self _updateContentViewConfiguration];
  if ([v6 _isInPopoverPresentation]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = (uint64_t)[v6 _isEmbedded];
  }
  [(UIVisualEffectView *)self->_visualEffectView setHidden:v5];
}

- (void)dismissEyedropper:(BOOL)a3
{
}

- (void)_pickerDidFinish
{
  id v2 = [(_UIColorPickerContainerViewController *)self _delegate];
  [v2 _pickerDidFinish];
}

- (void)_pickerDidSelectColor:(id)a3 isVolatile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(_UIColorPickerContainerViewController *)self _delegate];
  id v7 = v6;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
  [v9 _pickerDidSelectColor:v7 colorSpace:CGColorSpaceGetName(ColorSpace) isVolatile:v4];
}

- (void)_pickerDidShowEyedropperWithSelectionBlock:(id)a3 dismissBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_UIColorPickerContainerViewController *)self view];
  [v8 setUserInteractionEnabled:0];

  [(_UIColorPickerContainerViewController *)self invokeEyedropper];
  id v9 = [(_UIColorPickerContainerViewController *)self _delegate];
  [v9 _pickerDidShowEyedropper];

  id v10 = objc_retainBlock(v6);
  id eyeDropperDismissBlock = self->_eyeDropperDismissBlock;
  self->_id eyeDropperDismissBlock = v10;

  id v12 = objc_retainBlock(v7);
  id eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_id eyeDropperSelectionBlock = v12;
}

- (void)_pickerDidFloatEyeDropper
{
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v6 = a3;
  id v3 = [v6 system];
  BOOL v4 = +[UIMenuSystem mainSystem];

  if (v3 == v4)
  {
    uint64_t v5 = +[UIMenu menuWithTitle:&stru_100064488 image:0 identifier:UIMenuRoot options:0 children:&__NSArray0__struct];
    [v6 replaceMenuForIdentifier:UIMenuRoot withMenu:v5];
  }
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(_UIColorPickerContainerViewController *)self setView:v3];

  id v4 = objc_alloc((Class)UIVisualEffectView);
  uint64_t v5 = +[UIBlurEffect effectWithStyle:9];
  id v6 = (UIVisualEffectView *)[v4 initWithEffect:v5];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  [(UIVisualEffectView *)self->_visualEffectView setAutoresizingMask:18];
  v8 = [(_UIColorPickerContainerViewController *)self view];
  [v8 addSubview:self->_visualEffectView];

  id v9 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  [(UIScrollView *)v9 setClipsToBounds:0];
  [(UIScrollView *)v9 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v9 setShowsHorizontalScrollIndicator:0];
  -[UIScrollView _setTouchInsets:](v9, "_setTouchInsets:", 0.0, 0.0, -1.79769313e308, 0.0);
  scrollView = self->_scrollView;
  self->_scrollView = v9;
  v11 = v9;

  id v12 = (UIView *)objc_alloc_init((Class)UIView);
  v13 = [(UIView *)v12 layer];
  [v13 setHitTestsAsOpaque:1];

  [(UIScrollView *)v11 addSubview:v12];
  touchExtensionView = self->_touchExtensionView;
  self->_touchExtensionView = v12;
  v41 = v12;

  id v15 = objc_alloc_init(NSClassFromString(@"_UIColorPickerContentViewController"));
  [(_UIColorPickerContainerViewController *)self addChildViewController:v15];
  v16 = [v15 view];
  [(UIScrollView *)v11 addSubview:v16];

  [v15 didMoveToParentViewController:self];
  contentViewController = self->_contentViewController;
  self->_contentViewController = (_UIColorPickerViewProviding *)v15;
  id v34 = v15;

  [(UIScrollView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(_UIColorPickerContainerViewController *)self view];
  [v18 addSubview:v11];

  v39 = [(UIScrollView *)v11 leadingAnchor];
  v40 = [(_UIColorPickerContainerViewController *)self view];
  v38 = [v40 safeAreaLayoutGuide];
  v37 = [v38 leadingAnchor];
  v36 = [v39 constraintEqualToAnchor:v37];
  v42[0] = v36;
  v33 = [(UIScrollView *)v11 trailingAnchor];
  v35 = [(_UIColorPickerContainerViewController *)self view];
  v32 = [v35 safeAreaLayoutGuide];
  v31 = [v32 trailingAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v42[1] = v30;
  v28 = [(UIScrollView *)v11 topAnchor];
  v29 = [(_UIColorPickerContainerViewController *)self view];
  v19 = [v29 safeAreaLayoutGuide];
  v20 = [v19 topAnchor];
  v21 = [v28 constraintEqualToAnchor:v20];
  v42[2] = v21;
  v22 = [(UIScrollView *)v11 bottomAnchor];
  v23 = [(_UIColorPickerContainerViewController *)self view];
  v24 = [v23 keyboardLayoutGuide];
  v25 = [v24 topAnchor];
  v26 = [v22 constraintEqualToAnchor:v25];
  v42[3] = v26;
  v27 = +[NSArray arrayWithObjects:v42 count:4];
  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_contentViewController == a3)
  {
    [a3 preferredContentSize];
    if (v4 > 0.0)
    {
      double v6 = v5;
      if (v5 > 0.0)
      {
        double v7 = v4;
        UISizeRoundToViewScale();
        -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:");
        v8 = [(_UIColorPickerViewProviding *)self->_contentViewController view];
        objc_msgSend(v8, "setFrame:", 0.0, 0.0, v7, 10000.0);

        -[UIView setFrame:](self->_touchExtensionView, "setFrame:", 0.0, 0.0, v7, 10000.0);
        -[_UIColorPickerContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v6);
      }
    }
  }
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerContainerViewController;
  [(_UIColorPickerContainerViewController *)&v3 viewLayoutMarginsDidChange];
  [(_UIColorPickerContainerViewController *)self _updateContentViewConfiguration];
}

- (void)_updateContentViewConfiguration
{
  id v10 = [(_UIColorPickerViewControllerConfiguration *)self->_configuration copy];
  [v10 _preferredWidth];
  double v4 = v3;
  double v5 = [(_UIColorPickerContainerViewController *)self view];
  [v5 safeAreaInsets];
  double v7 = v4 - v6;
  v8 = [(_UIColorPickerContainerViewController *)self view];
  [v8 safeAreaInsets];
  objc_msgSend(v10, "set_preferredWidth:", v7 - v9);

  [(_UIColorPickerViewProviding *)self->_contentViewController _setConfiguration:v10];
}

- (void)invokeEyedropper
{
  colorSampler = self->_colorSampler;
  if (!colorSampler)
  {
    double v4 = (_UIColorSampler *)objc_opt_new();
    double v5 = self->_colorSampler;
    self->_colorSampler = v4;

    [(_UIColorSampler *)self->_colorSampler setFloatEyedropperOnStart:0];
    colorSampler = self->_colorSampler;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004959C;
  v6[3] = &unk_1000643E8;
  v6[4] = self;
  [(_UIColorSampler *)colorSampler showSamplerWithSelectionHandler:v6];
}

- (void)floatEyedropper
{
}

- (void)eyedropperDidSelectColor:(id)a3
{
  id v6 = a3;
  double v4 = [(_UIColorPickerContainerViewController *)self _delegate];
  [v4 _pickerDidSelectColor:v6 colorSpace:0 isVolatile:0];

  id eyeDropperSelectionBlock = (void (**)(id, id))self->_eyeDropperSelectionBlock;
  if (eyeDropperSelectionBlock) {
    eyeDropperSelectionBlock[2](eyeDropperSelectionBlock, v6);
  }
}

- (void)eyedropperDidDismiss
{
  double v3 = [(_UIColorPickerContainerViewController *)self view];
  [v3 setUserInteractionEnabled:1];

  double v4 = [(_UIColorPickerContainerViewController *)self _delegate];
  [v4 _pickerDidDismissEyedropper];

  id eyeDropperDismissBlock = (void (**)(void))self->_eyeDropperDismissBlock;
  if (eyeDropperDismissBlock)
  {
    eyeDropperDismissBlock[2]();
    id v6 = self->_eyeDropperDismissBlock;
  }
  else
  {
    id v6 = 0;
  }
  self->_id eyeDropperDismissBlock = 0;

  id eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_id eyeDropperSelectionBlock = 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIColorPickerViewProvidingDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);

  return (_UIColorPickerViewProvidingDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_touchExtensionView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_colorSampler, 0);
  objc_storeStrong(&self->_eyeDropperSelectionBlock, 0);

  objc_storeStrong(&self->_eyeDropperDismissBlock, 0);
}

@end
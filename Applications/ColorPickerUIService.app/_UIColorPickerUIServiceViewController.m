@interface _UIColorPickerUIServiceViewController
- (BOOL)_canShowWhileLocked;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyedropper;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)_setConfiguration:(id)a3;
- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4;
- (void)dismissEyedropper:(BOOL)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIColorPickerUIServiceViewController

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)_UIColorPickerUIServiceViewController;
  [(_UIColorPickerUIServiceViewController *)&v25 viewDidLoad];
  v3 = objc_alloc_init(_UIColorPickerContainerViewController);
  [(_UIColorPickerUIServiceViewController *)self addChildViewController:v3];
  v24 = v3;
  v4 = [(_UIColorPickerContainerViewController *)v3 view];
  v5 = [(_UIColorPickerUIServiceViewController *)self view];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UIColorPickerContainerViewController *)v3 didMoveToParentViewController:self];
  v22 = [v4 leadingAnchor];
  v23 = [(_UIColorPickerUIServiceViewController *)self view];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v26[0] = v20;
  v18 = [v4 trailingAnchor];
  v19 = [(_UIColorPickerUIServiceViewController *)self view];
  v17 = [v19 trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v16;
  v15 = [v4 topAnchor];
  v6 = [(_UIColorPickerUIServiceViewController *)self view];
  v7 = [v6 topAnchor];
  v8 = [v15 constraintEqualToAnchor:v7];
  v26[2] = v8;
  v9 = [v4 bottomAnchor];
  v10 = [(_UIColorPickerUIServiceViewController *)self view];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v26[3] = v12;
  v13 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v13];

  [(_UIColorPickerContainerViewController *)v24 _setDelegate:self];
  containerViewController = self->_containerViewController;
  self->_containerViewController = v24;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_containerViewController == a3)
  {
    [a3 preferredContentSize];
    double v5 = v4;
    double v7 = v6;
    -[_UIColorPickerUIServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    id v8 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
    [v8 _setPreferredContentSize:v5, v7];
  }
}

- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4
{
}

- (void)_setConfiguration:(id)a3
{
}

- (void)dismissEyedropper:(BOOL)a3
{
}

- (void)_pickerDidFinish
{
  id v4 = +[_UIColorPickerActionClientToHost actionForColorPickerDidFinish];
  v3 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
  [v3 sendAction:v4];
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  id v7 = +[_UIColorPickerActionClientToHost actionForColorPickerDidSelectColor:a3 colorSpace:a4 isVolatile:a5];
  double v6 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
  [v6 sendAction:v7];
}

- (void)_pickerDidShowEyedropper
{
  id v4 = +[_UIColorPickerActionClientToHost actionForColorPickerDidShowEyedropper];
  v3 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
  [v3 sendAction:v4];
}

- (void)_pickerDidFloatEyedropper
{
  id v4 = +[_UIColorPickerActionClientToHost actionForColorPickerDidFloatEyedropper];
  v3 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
  [v3 sendAction:v4];
}

- (void)_pickerDidDismissEyedropper
{
  id v4 = +[_UIColorPickerActionClientToHost actionForColorPickerDidDismissEyedropper];
  v3 = [(_UIColorPickerUIServiceViewController *)self _hostedWindowScene];
  [v3 sendAction:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
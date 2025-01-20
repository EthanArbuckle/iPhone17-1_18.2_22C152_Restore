@interface _UIColorPickerViewServiceOperatorViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (id)host;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyedropper;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)_prepareForDisplayWithCompletion:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4;
- (void)dismissEyedropper:(BOOL)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIColorPickerViewServiceOperatorViewController

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)_UIColorPickerViewServiceOperatorViewController;
  [(_UIColorPickerViewServiceOperatorViewController *)&v25 viewDidLoad];
  v3 = objc_alloc_init(_UIColorPickerContainerViewController);
  [(_UIColorPickerViewServiceOperatorViewController *)self addChildViewController:v3];
  v24 = v3;
  v4 = [(_UIColorPickerContainerViewController *)v3 view];
  v5 = [(_UIColorPickerViewServiceOperatorViewController *)self view];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UIColorPickerContainerViewController *)v3 didMoveToParentViewController:self];
  v22 = [v4 leadingAnchor];
  v23 = [(_UIColorPickerViewServiceOperatorViewController *)self view];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v26[0] = v20;
  v18 = [v4 trailingAnchor];
  v19 = [(_UIColorPickerViewServiceOperatorViewController *)self view];
  v17 = [v19 trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v16;
  v15 = [v4 topAnchor];
  v6 = [(_UIColorPickerViewServiceOperatorViewController *)self view];
  v7 = [v6 topAnchor];
  v8 = [v15 constraintEqualToAnchor:v7];
  v26[2] = v8;
  v9 = [v4 bottomAnchor];
  v10 = [(_UIColorPickerViewServiceOperatorViewController *)self view];
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
    -[_UIColorPickerViewServiceOperatorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIColorPickerRemoteViewControllerService];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIColorPickerRemoteViewControllerHost];
}

- (id)host
{
  return [(_UIColorPickerViewServiceOperatorViewController *)self _remoteViewControllerProxy];
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

- (void)_prepareForDisplayWithCompletion:(id)a3
{
}

- (void)_pickerDidFinish
{
  id v2 = [(_UIColorPickerViewServiceOperatorViewController *)self host];
  [v2 _pickerDidFinish];
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UIColorPickerViewServiceOperatorViewController *)self host];
  [v10 _pickerDidSelectColor:v9 colorSpace:v8 isVolatile:v5];
}

- (void)_pickerDidShowEyedropper
{
  id v2 = [(_UIColorPickerViewServiceOperatorViewController *)self host];
  [v2 _pickerDidShowEyedropper];
}

- (void)_pickerDidFloatEyedropper
{
  id v2 = [(_UIColorPickerViewServiceOperatorViewController *)self host];
  [v2 _pickerDidFloatEyedropper];
}

- (void)_pickerDidDismissEyedropper
{
  id v2 = [(_UIColorPickerViewServiceOperatorViewController *)self host];
  [v2 _pickerDidDismissEyedropper];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
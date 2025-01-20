@interface FBAForgetDeviceViewController
- (FBAForgetDeviceProtocol)delegate;
- (FBKGroupedDevice)device;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didReceiveMemoryWarning;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBAForgetDeviceViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FBAForgetDeviceViewController;
  [(FBAForgetDeviceViewController *)&v5 viewDidLoad];
  v3 = [(FBAForgetDeviceViewController *)self tableView];
  [v3 setEstimatedSectionHeaderHeight:0.0];

  v4 = [(FBAForgetDeviceViewController *)self tableView];
  [v4 setEstimatedSectionFooterHeight:0.0];

  [(FBAForgetDeviceViewController *)self setClearsSelectionOnViewWillAppear:0];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FBAForgetDeviceViewController;
  [(FBAForgetDeviceViewController *)&v2 didReceiveMemoryWarning];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"FORGET_DEVICE_INSTRUCTION" value:&stru_1000F6658 table:0];
  v7 = [(FBAForgetDeviceViewController *)self device];
  v8 = [v7 name];
  if ([v8 isEqualToString:&stru_1000F6658])
  {
    v9 = +[NSBundle mainBundle];
    [v9 localizedStringForKey:@"THIS_DEVICE" value:&stru_1000F6658 table:0];
  }
  else
  {
    v9 = [(FBAForgetDeviceViewController *)self device];
    [v9 name];
  v10 = };
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v10);

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v4 = [a3 dequeueReusableCellWithIdentifier:@"ForgetDeviceCell" forIndexPath:a4];
  objc_super v5 = +[iFBAConstants tintColor];
  v6 = [v4 textLabel];
  [v6 setTextColor:v5];

  unint64_t v7 = (unint64_t)[v4 accessibilityTraits];
  [v4 setAccessibilityTraits:UIAccessibilityTraitButton | v7];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5 = [(FBAForgetDeviceViewController *)self delegate];

  if (v5)
  {
    v6 = [(FBAForgetDeviceViewController *)self delegate];
    unint64_t v7 = [(FBAForgetDeviceViewController *)self device];
    [v6 didTapForgetDevice:v7];
  }
  id v9 = [(FBAForgetDeviceViewController *)self navigationController];
  id v8 = [v9 popViewControllerAnimated:1];
}

- (FBAForgetDeviceProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBAForgetDeviceProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
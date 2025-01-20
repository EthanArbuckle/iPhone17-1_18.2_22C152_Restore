@interface FBADevicePairingViewController
- (BOOL)_internalMode;
- (BOOL)pinPairingInProgress;
- (BOOL)shouldShowDevUI;
- (FBAPairingPresentationDelegate)delegate;
- (NSArray)_allDevices;
- (NSArray)deviceGroups;
- (NSArray)notConfiguredDevice;
- (NSArray)pairedDevices;
- (NSString)filterPlatform;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 loadingSpinnerViewForSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)context;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_showInternalUIIfNeeded;
- (void)awakeFromNib;
- (void)didCancel;
- (void)didChangeDeviceParingWithDeviceAdded:(id)a3 removed:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)didTapForgetDevice:(id)a3;
- (void)dismissSelf;
- (void)handleDeviceTapWithDevice:(id)a3 inSection:(unint64_t)a4;
- (void)reload;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceGroups:(id)a3;
- (void)setFilterPlatform:(id)a3;
- (void)setNotConfiguredDevice:(id)a3;
- (void)setPairedDevices:(id)a3;
- (void)setPinPairingInProgress:(BOOL)a3;
- (void)set_allDevices:(id)a3;
- (void)set_internalMode:(BOOL)a3;
- (void)setupBarButtonItems;
- (void)showDevUI;
- (void)showFBAPairing;
- (void)showPinPairingViewForDevice:(id)a3;
- (void)showTextViewWithText:(id)a3 title:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleDev;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FBADevicePairingViewController

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v3 awakeFromNib];
  [(FBADevicePairingViewController *)self setContext:2];
  [(FBADevicePairingViewController *)self setPinPairingInProgress:0];
  [(FBADevicePairingViewController *)self setFilterPlatform:0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v9 viewDidLoad];
  +[FBADevicePairingCell estimatedRowHeight];
  double v4 = v3;
  v5 = [(FBADevicePairingViewController *)self tableView];
  [v5 setEstimatedRowHeight:v4];

  v6 = [(FBADevicePairingViewController *)self tableView];
  [v6 setRowHeight:UITableViewAutomaticDimension];

  v7 = [(FBADevicePairingViewController *)self tableView];
  [v7 setEstimatedSectionHeaderHeight:40.0];

  v8 = [(FBADevicePairingViewController *)self tableView];
  [v8 setSectionHeaderHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v8 viewWillAppear:a3];
  [(FBADevicePairingViewController *)self setupBarButtonItems];
  double v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"PAIRING_VIEW_TITLE" value:&stru_1000F6658 table:0];
  v6 = [(FBADevicePairingViewController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"reload" name:FBKDeviceListDidChangeNotification object:0];

  [(FBADevicePairingViewController *)self _showInternalUIIfNeeded];
  [(FBADevicePairingViewController *)self reload];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v5 viewDidAppear:a3];
  if ([(FBADevicePairingViewController *)self pinPairingInProgress])
  {
    [(FBADevicePairingViewController *)self setPinPairingInProgress:0];
    [(FBADevicePairingViewController *)self reload];
  }
  else
  {
    double v4 = +[FBKDeviceManager sharedInstance];
    [v4 beginScanning];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v5 viewWillDisappear:a3];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v5 viewDidDisappear:a3];
  if (![(FBADevicePairingViewController *)self pinPairingInProgress])
  {
    double v4 = +[FBKDeviceManager sharedInstance];
    [v4 stopScanning];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FBADevicePairingViewController;
  [(FBADevicePairingViewController *)&v2 didReceiveMemoryWarning];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->__internalMode) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = [(FBADevicePairingViewController *)self deviceGroups];
  v6 = [v5 objectAtIndex:a4];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    v6 = [(FBADevicePairingViewController *)self tableView:a3 loadingSpinnerViewForSection:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 loadingSpinnerViewForSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v11 setAxis:0];
  [v11 setAlignment:3];
  [v11 setSpacing:1.17549435e-38];
  id v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v13 = [(FBADevicePairingViewController *)self tableView:v6 titleForHeaderInSection:a4];

  [v12 setText:v13];
  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v12 setFont:v14];

  v15 = +[UIColor secondaryLabelColor];
  [v12 setTextColor:v15];

  [v12 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v16) = 1144750080;
  [v12 setContentHuggingPriority:0 forAxis:v16];
  [v12 sizeToFit];
  [v11 addArrangedSubview:v12];
  id v17 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v17 startAnimating];
  [v11 addArrangedSubview:v17];
  [v11 setLayoutMarginsRelativeArrangement:1];
  [v11 setDirectionalLayoutMargins:10.0, 16.0, 10.0, 16.0];

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      if (self->__internalMode) {
        v10 = @"All Devices Visible to DED";
      }
      else {
        v10 = 0;
      }
      break;
    case 1:
      id v7 = +[NSBundle mainBundle];
      objc_super v8 = v7;
      CFStringRef v9 = @"OTHER_DEVICES";
      goto LABEL_9;
    case 0:
      id v7 = +[NSBundle mainBundle];
      objc_super v8 = v7;
      CFStringRef v9 = @"MY_DEVICES";
LABEL_9:
      v10 = [v7 localizedStringForKey:v9 value:&stru_1000F6658 table:0];

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ((char *)[a3 numberOfSections] - 1 == (unsigned char *)a4)
  {
    uint64_t v4 = +[NSBundle mainBundle];
    uint64_t v5 = [v4 localizedStringForKey:@"DEVICE_PAIRING_FOOTER_TEXT" value:&stru_1000F6658 table:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100124050 != -1) {
    dispatch_once(&qword_100124050, &stru_1000F3190);
  }
  objc_super v8 = [v6 dequeueReusableCellWithIdentifier:qword_100124058 forIndexPath:v7];
  if ([v7 section] == (id)1)
  {
    unint64_t v9 = (unint64_t)[v8 accessibilityTraits];
    [v8 setAccessibilityTraits:UIAccessibilityTraitButton | v9];
    v10 = +[NSBundle mainBundle];
    id v11 = v10;
    CFStringRef v12 = @"DEVICE_CELL_HINT_TAP_TO_PAIR";
  }
  else
  {
    [v8 setAccessibilityTraits:[v8 accessibilityTraits] & ~UIAccessibilityTraitButton];
    v10 = +[NSBundle mainBundle];
    id v11 = v10;
    CFStringRef v12 = @"DEVICE_CELL_HINT_PAIRED";
  }
  v13 = [v10 localizedStringForKey:v12 value:&stru_1000F6658 table:0];
  [v8 setAccessibilityHint:v13];

  v14 = [(FBADevicePairingViewController *)self deviceGroups];
  v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  double v16 = [v15 objectAtIndexedSubscript:[v7 row]];
  [v8 updateWithDevice:v16 showsDetail:[v7 section] == 0 showsTransport:self->__internalMode];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBADevicePairingViewController *)self deviceGroups];
  id v7 = [v6 objectAtIndexedSubscript:[v5 section]];
  objc_super v8 = [v7 objectAtIndexedSubscript:[v5 row]];

  unint64_t v9 = +[FBALog ded];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v8 publicLogDescription];
    int v13 = 138543362;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "selected [%{public}@] on pairing view", (uint8_t *)&v13, 0xCu);
  }
  id v11 = +[FBALog ded];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000A5790();
  }

  -[FBADevicePairingViewController handleDeviceTapWithDevice:inSection:](self, "handleDeviceTapWithDevice:inSection:", v8, [v5 section]);
  CFStringRef v12 = [(FBADevicePairingViewController *)self tableView];
  [v12 deselectRowAtIndexPath:v5 animated:1];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBADevicePairingViewController *)self deviceGroups];
  id v7 = [v6 objectAtIndexedSubscript:[v5 section]];
  objc_super v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  if (self->__internalMode)
  {
    unint64_t v9 = [v8 name];
    if ([v9 isEqualToString:&stru_1000F6658])
    {
      v10 = @"Device Data";
    }
    else
    {
      v10 = [v8 name];
    }

    int v13 = [v8 debugDetails];
    [(FBADevicePairingViewController *)self showTextViewWithText:v13 title:v10];

LABEL_10:
    goto LABEL_11;
  }
  if (![v5 section])
  {
    unsigned int v11 = [v8 isCurrentDevice];
    CFStringRef v12 = +[FBALog ded];
    v10 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000A5804(v10);
      }
      goto LABEL_10;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v8 publicLogDescription];
      int v20 = 138543362;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "showing device detail on device [%{public}@]", (uint8_t *)&v20, 0xCu);
    }
    v15 = [(FBADevicePairingViewController *)self storyboard];
    double v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v18 = [v15 instantiateViewControllerWithIdentifier:v17];

    [v18 setDevice:v8];
    [v18 setDelegate:self];
    v19 = [(FBADevicePairingViewController *)self navigationController];
    [v19 pushViewController:v18 animated:1];
  }
LABEL_11:
}

- (void)didTapForgetDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(FBADevicePairingViewController *)self pairedDevices];
  if ([v5 containsObject:v4])
  {
    unsigned int v6 = [v4 isCurrentDevice];
    unsigned int v7 = [v4 isFBKPaired];

    if (v7 && !v6)
    {
      [v4 removeFBKPairing];
      [(FBADevicePairingViewController *)self didChangeDeviceParingWithDeviceAdded:0 removed:v4];
      goto LABEL_9;
    }
  }
  else
  {
  }
  objc_super v8 = +[FBALog ded];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000A5848(v4, v8);
  }

LABEL_9:
}

- (void)handleDeviceTapWithDevice:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = v6;
  if (a4 == 2)
  {
    if (self->__internalMode)
    {
      unint64_t v9 = +[FBALog ded];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000A5920();
      }

      if (([v7 isFBKPaired] & 1) == 0
        && ([v7 isCurrentDevice] & 1) == 0)
      {
        v10 = +[FBALog ded];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000A58DC(v10);
        }

        [(FBADevicePairingViewController *)self handleDeviceTapWithDevice:v7 inSection:1];
      }
    }
  }
  else if (a4 == 1)
  {
    if ([v6 needsPairing]
      && ([v7 dedSharingDevice], objc_super v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      [(FBADevicePairingViewController *)self showPinPairingViewForDevice:v7];
    }
    else if ([v7 isReady])
    {
      [v7 pairToFBK];
      [(FBADevicePairingViewController *)self didChangeDeviceParingWithDeviceAdded:v7 removed:0];
    }
    else
    {
      unsigned int v11 = +[FBALog ded];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000A5994();
      }
    }
  }
}

- (void)reload
{
  double v3 = +[FBALog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "reload devices view", buf, 2u);
  }

  id v4 = +[FBKDeviceManager sharedInstance];
  id v5 = [v4 configuredDevices];
  [(FBADevicePairingViewController *)self setPairedDevices:v5];

  if ((id)[(FBADevicePairingViewController *)self context] == (id)4
    && ([(FBADevicePairingViewController *)self filterPlatform],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = DEDDevicePlatformiOS;
    objc_super v8 = [(FBADevicePairingViewController *)self filterPlatform];
    if ([v8 isEqualToString:DEDDevicePlatformUnspecified])
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(FBADevicePairingViewController *)self filterPlatform];
    }
    unsigned int v11 = v9;

    CFStringRef v12 = +[FBKDeviceManager sharedInstance];
    int v13 = [v12 notConfiguredDevices];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100025F58;
    v25[3] = &unk_1000F31B8;
    id v26 = v11;
    id v10 = v11;
    v14 = [v13 ded_selectItemsPassingTest:v25];
    [(FBADevicePairingViewController *)self setNotConfiguredDevice:v14];
  }
  else
  {
    id v7 = +[FBKDeviceManager sharedInstance];
    id v10 = [v7 notConfiguredDevices];
    [(FBADevicePairingViewController *)self setNotConfiguredDevice:v10];
  }

  if (self->__internalMode)
  {
    v15 = +[FBKDeviceManager sharedInstance];
    double v16 = [v15 allDevices];
    [(FBADevicePairingViewController *)self set_allDevices:v16];
  }
  id v17 = [(FBADevicePairingViewController *)self pairedDevices];
  v29[0] = v17;
  v18 = [(FBADevicePairingViewController *)self notConfiguredDevice];
  v29[1] = v18;
  v19 = +[NSArray arrayWithObjects:v29 count:2];
  [(FBADevicePairingViewController *)self setDeviceGroups:v19];

  if (self->__internalMode)
  {
    int v20 = [(FBADevicePairingViewController *)self pairedDevices];
    v28[0] = v20;
    v21 = [(FBADevicePairingViewController *)self notConfiguredDevice];
    v28[1] = v21;
    v22 = [(FBADevicePairingViewController *)self _allDevices];
    v28[2] = v22;
    v23 = +[NSArray arrayWithObjects:v28 count:3];
    [(FBADevicePairingViewController *)self setDeviceGroups:v23];
  }
  v24 = [(FBADevicePairingViewController *)self tableView];
  [v24 reloadData];
}

- (void)showPinPairingViewForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(FBADevicePairingViewController *)self storyboard];
  id v6 = self;
  id v7 = +[FBKDeviceManager sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026120;
  v11[3] = &unk_1000F27C8;
  v11[4] = v6;
  CFStringRef v12 = v6;
  id v13 = v5;
  id v14 = v4;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  [v7 beginPairingDevice:v8 showUIBlock:v11];
}

- (void)setupBarButtonItems
{
  int64_t v3 = [(FBADevicePairingViewController *)self context];
  if ((unint64_t)(v3 - 2) < 2)
  {
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissSelf"];
    id v5 = [(FBADevicePairingViewController *)self navigationItem];
    id v6 = v5;
    id v7 = v8;
  }
  else
  {
    if (v3 == 1)
    {
      id v8 = [(FBADevicePairingViewController *)self navigationItem];
      [v8 setRightBarButtonItem:0];
      goto LABEL_8;
    }
    if (v3 != 4) {
      return;
    }
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"didCancel"];
    id v4 = [(FBADevicePairingViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v8];

    id v5 = [(FBADevicePairingViewController *)self navigationItem];
    id v6 = v5;
    id v7 = 0;
  }
  [v5 setRightBarButtonItem:v7];

LABEL_8:
}

- (void)didCancel
{
  int64_t v3 = +[FBALog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device pairing view did cancel", v9, 2u);
  }

  uint64_t v4 = [(FBADevicePairingViewController *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(FBADevicePairingViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(FBADevicePairingViewController *)self delegate];
      [v8 pairingViewDidCancel];
    }
  }
}

- (void)dismissSelf
{
  int64_t v3 = +[FBALog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device pairing view did hit done", buf, 2u);
  }

  uint64_t v4 = [(FBADevicePairingViewController *)self delegate];
  id v5 = [(FBADevicePairingViewController *)self presentingViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026538;
  v7[3] = &unk_1000F2518;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

- (void)didChangeDeviceParingWithDeviceAdded:(id)a3 removed:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  char v7 = [(FBADevicePairingViewController *)self delegate];

  if (v7)
  {
    id v8 = [(FBADevicePairingViewController *)self delegate];
    [v8 pairedDevicesDidChangeWithAddedDevice:v9 removed:v6];
  }
  [(FBADevicePairingViewController *)self reload];
}

- (void)showTextViewWithText:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBADevicePairingViewController *)self storyboard];
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  id v12 = [v8 instantiateViewControllerWithIdentifier:v10];

  [v12 setTitle:v6];
  [v12 setText:v7];

  unsigned int v11 = [(FBADevicePairingViewController *)self navigationController];
  [v11 pushViewController:v12 animated:1];
}

- (void)toggleDev
{
  [(FBADevicePairingViewController *)self set_internalMode:[(FBADevicePairingViewController *)self _internalMode] ^ 1];

  [(FBADevicePairingViewController *)self reload];
}

- (void)showFBAPairing
{
  id v3 = +[FBKGroupedDevice inspectFBKPairing];
  [(FBADevicePairingViewController *)self showTextViewWithText:v3 title:@"FBA Paired Devices"];
}

- (void)showDevUI
{
  id v3 = [(FBADevicePairingViewController *)self navigationController];
  [v3 setToolbarHidden:0 animated:1];

  id v4 = objc_alloc((Class)UIBarButtonItem);
  id v5 = sub_10002484C(@"Show FBA Pairing");
  id v6 = [v4 initWithTitle:v5 style:0 target:self action:"showFBAPairing"];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  id v8 = sub_10002484C(@"Toggle Internal Details");
  id v9 = [v7 initWithTitle:v8 style:0 target:self action:"toggleDev"];

  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0 v6];
  v13[1] = v10;
  v13[2] = v9;
  unsigned int v11 = +[NSArray arrayWithObjects:v13 count:3];
  [(FBADevicePairingViewController *)self setToolbarItems:v11];

  id v12 = [(FBADevicePairingViewController *)self navigationController];
  [v12 setToolbarHidden:0];

  [(FBADevicePairingViewController *)self reload];
}

- (void)_showInternalUIIfNeeded
{
  if ([(FBADevicePairingViewController *)self shouldShowDevUI])
  {
    [(FBADevicePairingViewController *)self showDevUI];
  }
  else
  {
    [(FBADevicePairingViewController *)self set_internalMode:0];
    id v3 = [(FBADevicePairingViewController *)self navigationController];
    [v3 setToolbarHidden:1];

    [(FBADevicePairingViewController *)self setToolbarItems:&__NSArray0__struct];
  }
}

- (BOOL)shouldShowDevUI
{
  int v2 = FBKIsInternalInstall();
  if (v2)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:FBKShowDevicePairingInternal];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (FBAPairingPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBAPairingPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)filterPlatform
{
  return self->_filterPlatform;
}

- (void)setFilterPlatform:(id)a3
{
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (NSArray)notConfiguredDevice
{
  return self->_notConfiguredDevice;
}

- (void)setNotConfiguredDevice:(id)a3
{
}

- (NSArray)_allDevices
{
  return self->__allDevices;
}

- (void)set_allDevices:(id)a3
{
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
}

- (BOOL)pinPairingInProgress
{
  return self->_pinPairingInProgress;
}

- (void)setPinPairingInProgress:(BOOL)a3
{
  self->_pinPairingInProgress = a3;
}

- (BOOL)_internalMode
{
  return self->__internalMode;
}

- (void)set_internalMode:(BOOL)a3
{
  self->__internalMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->__allDevices, 0);
  objc_storeStrong((id *)&self->_notConfiguredDevice, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_filterPlatform, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
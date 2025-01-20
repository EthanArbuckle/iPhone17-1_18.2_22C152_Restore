@interface AccessibilitySettingsViewController
- (AXContentSizedTableView)tableView;
- (AccessibilitySettingsViewController)initWithAccessibilityOptions:(id)a3 device:(id)a4;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (NRDevice)device;
- (NSArray)accessibilityOptions;
- (NSMutableDictionary)customizedAccessibilityOptions;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)titleString;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)setCustomizedAccessibilityOptions:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)switchToggled:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AccessibilitySettingsViewController

- (AccessibilitySettingsViewController)initWithAccessibilityOptions:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)AccessibilitySettingsViewController;
  v9 = [(AccessibilitySettingsViewController *)&v27 initWithTitle:&stru_82A0 detailText:0 icon:0 contentLayout:3];
  v10 = v9;
  if (v9)
  {
    [(AccessibilitySettingsViewController *)v9 setStyle:10];
    objc_storeStrong((id *)&v10->_accessibilityOptions, a3);
    objc_storeStrong((id *)&v10->_device, a4);
    uint64_t v11 = +[NSMutableDictionary dictionary];
    customizedAccessibilityOptions = v10->_customizedAccessibilityOptions;
    v10->_customizedAccessibilityOptions = (NSMutableDictionary *)v11;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_customizedAccessibilityOptions, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *(void *)(*((void *)&v23 + 1) + 8 * (void)v17), (void)v23);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    v18 = [(NSMutableDictionary *)v10->_customizedAccessibilityOptions objectForKeyedSubscript:&off_8618];
    unsigned int v19 = [v18 BOOLValue];

    v20 = [(NSMutableDictionary *)v10->_customizedAccessibilityOptions objectForKeyedSubscript:&off_8630];
    unsigned int v21 = [v20 BOOLValue];

    if (v19 && v21) {
      [(NSMutableDictionary *)v10->_customizedAccessibilityOptions setObject:&__kCFBooleanFalse forKeyedSubscript:&off_8630];
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)AccessibilitySettingsViewController;
  [(AccessibilitySettingsViewController *)&v46 viewDidLoad];
  v45 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", @"Accessibility");
  if (v3)
  {
    v4 = [(AccessibilitySettingsViewController *)self headerView];
    [v4 setIcon:v3 accessibilityLabel:0];
  }
  v5 = [(AccessibilitySettingsViewController *)self alternateChoiceButton];
  [v5 titleLabel];
  v6 = v44 = (void *)v3;
  [v6 setNumberOfLines:0];

  id v7 = [(AccessibilitySettingsViewController *)self alternateChoiceButton];
  id v8 = [v7 titleLabel];
  [v8 setLineBreakMode:0];

  v9 = [AXContentSizedTableView alloc];
  v10 = [(AccessibilitySettingsViewController *)self contentView];
  [v10 bounds];
  uint64_t v11 = -[AXContentSizedTableView initWithFrame:style:](v9, "initWithFrame:style:", 2);
  [(AccessibilitySettingsViewController *)self setTableView:v11];

  v12 = [(AccessibilitySettingsViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"AXSettingCellReuseIdentifier"];

  id v13 = [(AccessibilitySettingsViewController *)self tableView];
  [v13 setRowHeight:UITableViewAutomaticDimension];

  id v14 = [(AccessibilitySettingsViewController *)self tableView];
  [v14 setDelegate:self];

  id v15 = [(AccessibilitySettingsViewController *)self tableView];
  [v15 setDataSource:self];

  uint64_t v16 = BPSSeparatorColor();
  v17 = [(AccessibilitySettingsViewController *)self tableView];
  [v17 setSeparatorColor:v16];

  v18 = [(AccessibilitySettingsViewController *)self tableView];
  [v18 setScrollEnabled:0];

  unsigned int v19 = [(AccessibilitySettingsViewController *)self contentView];
  v20 = [(AccessibilitySettingsViewController *)self tableView];
  [v19 addSubview:v20];

  unsigned int v21 = [(AccessibilitySettingsViewController *)self tableView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v43 = [(AccessibilitySettingsViewController *)self contentView];
  v41 = [v43 topAnchor];
  v42 = [(AccessibilitySettingsViewController *)self tableView];
  v40 = [v42 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v47[0] = v39;
  v38 = [(AccessibilitySettingsViewController *)self contentView];
  v36 = [v38 leadingAnchor];
  v37 = [(AccessibilitySettingsViewController *)self tableView];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v47[1] = v34;
  v33 = [(AccessibilitySettingsViewController *)self contentView];
  v32 = [v33 trailingAnchor];
  v22 = [(AccessibilitySettingsViewController *)self tableView];
  long long v23 = [v22 trailingAnchor];
  long long v24 = [v32 constraintEqualToAnchor:v23];
  v47[2] = v24;
  long long v25 = [(AccessibilitySettingsViewController *)self contentView];
  long long v26 = [v25 bottomAnchor];
  objc_super v27 = [(AccessibilitySettingsViewController *)self tableView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v47[3] = v29;
  v30 = +[NSArray arrayWithObjects:v47 count:4];
  +[NSLayoutConstraint activateConstraints:v30];

  v31 = [(AccessibilitySettingsViewController *)self tableView];
  [v31 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AccessibilitySettingsViewController;
  [(AccessibilitySettingsViewController *)&v7 viewDidAppear:a3];
  v4 = [(AccessibilitySettingsViewController *)self tableView];
  v5 = [(AccessibilitySettingsViewController *)self tableView];
  v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:1];
}

- (id)titleString
{
  return accessibilityLocalizedString(@"accessibility.settings.title");
}

- (id)detailString
{
  return accessibilityLocalizedString(@"accessibility.settings.subtitle");
}

- (id)suggestedButtonTitle
{
  return accessibilityLocalizedString(@"continue");
}

- (id)alternateButtonTitle
{
  return accessibilityLocalizedString(@"set.up.later");
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = [(AccessibilitySettingsViewController *)self customizedAccessibilityOptions];
  v5 = [(AccessibilitySettingsViewController *)self device];
  accessibilitySetAccessibilityOptionsOnDevice(v4, v5);

  id v6 = [(AccessibilitySettingsViewController *)self miniFlowDelegate];
  [v6 miniFlowStepComplete:self];
}

- (void)alternateButtonPressed:(id)a3
{
  v4 = +[NSMutableDictionary dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(AccessibilitySettingsViewController *)self accessibilityOptions];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(AccessibilitySettingsViewController *)self device];
  accessibilitySetAccessibilityOptionsOnDevice(v4, v10);

  uint64_t v11 = [(AccessibilitySettingsViewController *)self miniFlowDelegate];
  [v11 miniFlowStepComplete:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(AccessibilitySettingsViewController *)self accessibilityOptions];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = [(AccessibilitySettingsViewController *)self accessibilityOptions];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 unsignedIntegerValue];

  return accessibilityLocalizedDescriptionForSetupOption((unint64_t)v7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"AXSettingCellReuseIdentifier" forIndexPath:v6];
  [v7 setSelectionStyle:0];
  uint64_t v8 = [(AccessibilitySettingsViewController *)self accessibilityOptions];
  id v9 = [v6 section];

  v10 = [v8 objectAtIndexedSubscript:v9];
  id v11 = [v10 unsignedIntegerValue];

  long long v12 = [v7 textLabel];
  long long v13 = accessibilityLocalizedStringForSetupOption((unint64_t)v11);
  [v12 setText:v13];

  long long v14 = [(AccessibilitySettingsViewController *)self customizedAccessibilityOptions];
  long long v15 = +[NSNumber numberWithUnsignedInteger:v11];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];
  id v17 = [v16 BOOLValue];

  id v18 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v18 setOn:v17 animated:0];
  [v18 setTag:v11];
  [v18 addTarget:self action:"switchToggled:" forControlEvents:4096];
  [v7 setAccessoryView:v18];

  return v7;
}

- (void)switchToggled:(id)a3
{
  id v18 = a3;
  id v4 = (char *)[v18 tag];
  id v5 = v4;
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    unsigned int v7 = [v18 isOn] ^ 1;
    char v6 = 1;
  }
  else
  {
    if (v4) {
      char v6 = 1;
    }
    else {
      char v6 = [v18 isOn] ^ 1;
    }
    unsigned int v7 = 1;
  }
  uint64_t v8 = [(AccessibilitySettingsViewController *)self customizedAccessibilityOptions];
  id v9 = [v8 objectForKeyedSubscript:&off_8618];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = [(AccessibilitySettingsViewController *)self customizedAccessibilityOptions];
  long long v12 = [v11 objectForKeyedSubscript:&off_8630];
  unsigned int v13 = [v12 BOOLValue];

  if ((v6 & 1) != 0 || !v13)
  {
    long long v14 = v18;
    if ((v7 | v10 ^ 1))
    {
      long long v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isOn]);
      uint64_t v16 = [(AccessibilitySettingsViewController *)self customizedAccessibilityOptions];
      id v17 = +[NSNumber numberWithUnsignedInteger:v5];
      [v16 setObject:v15 forKeyedSubscript:v17];

      goto LABEL_13;
    }
  }
  else
  {
    long long v14 = v18;
  }
  [v14 setOn:0 animated:0];
LABEL_13:
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (NSArray)accessibilityOptions
{
  return self->_accessibilityOptions;
}

- (NRDevice)device
{
  return self->_device;
}

- (AXContentSizedTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSMutableDictionary)customizedAccessibilityOptions
{
  return self->_customizedAccessibilityOptions;
}

- (void)setCustomizedAccessibilityOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizedAccessibilityOptions, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_accessibilityOptions, 0);

  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

@end
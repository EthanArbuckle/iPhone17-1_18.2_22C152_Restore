@interface NPHCSAppCellularDataUsageCell
+ (id)cellForTableView:(id)a3 reuseIdentifier:(id)a4 appDataUsageItem:(id)a5 isCellularSetup:(BOOL)a6;
- (NPHCSAppCellularDataUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 appDataUsageItem:(id)a5;
- (NPHCSAppCellularDataUsageItem)appDataUsageItem;
- (UISwitch)accessorySwitch;
- (void)_cellularDataPolicySwitchFlipped:(id)a3;
- (void)_setIcon;
- (void)prepareForReuse;
- (void)setAccessorySwitch:(id)a3;
- (void)setAppDataUsageItem:(id)a3;
@end

@implementation NPHCSAppCellularDataUsageCell

- (NPHCSAppCellularDataUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 appDataUsageItem:(id)a5
{
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPHCSAppCellularDataUsageCell;
  v9 = [(NPHCSAppCellularDataUsageCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [(NPHCSAppCellularDataUsageCell *)v9 imageView];
    [v11 setImage:0];

    v12 = [(NPHCSAppCellularDataUsageCell *)v10 textLabel];
    [v12 setNumberOfLines:0];

    v13 = [(NPHCSAppCellularDataUsageCell *)v10 detailTextLabel];
    [v13 setNumberOfLines:0];

    if (+[NPHSharedUtilities isActiveWatchChinaRegionCellular](NPHSharedUtilities, "isActiveWatchChinaRegionCellular")|| (-[NPHCSAppCellularDataUsageCell appDataUsageItem](v10, "appDataUsageItem"), v14 = [(NPHCSAppCellularDataUsageCell *)v10 setAppDataUsageItem:v8];
    {
      [(NPHCSAppCellularDataUsageCell *)v10 setAccessoryType:1];
    }
    else
    {
      id v16 = objc_alloc_init((Class)UISwitch);
      [(NPHCSAppCellularDataUsageCell *)v10 setAccessorySwitch:v16];

      v17 = [(NPHCSAppCellularDataUsageCell *)v10 accessorySwitch];
      [v17 addTarget:v10 action:"_cellularDataPolicySwitchFlipped:" forControlEvents:4096];

      v18 = [(NPHCSAppCellularDataUsageCell *)v10 accessorySwitch];
      [(NPHCSAppCellularDataUsageCell *)v10 setAccessoryView:v18];

      [(NPHCSAppCellularDataUsageCell *)v10 setSelectionStyle:0];
    }
  }

  return v10;
}

+ (id)cellForTableView:(id)a3 reuseIdentifier:(id)a4 appDataUsageItem:(id)a5 isCellularSetup:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  v11 = [a3 dequeueReusableCellWithIdentifier:v9];
  if (!v11) {
    v11 = [[NPHCSAppCellularDataUsageCell alloc] initWithStyle:3 reuseIdentifier:v9 appDataUsageItem:v10];
  }
  [(NPHCSAppCellularDataUsageCell *)v11 setAppDataUsageItem:v10];
  v12 = [v10 hyphenatedDisplayName];
  v13 = [(NPHCSAppCellularDataUsageCell *)v11 textLabel];
  [v13 setAttributedText:v12];

  id v14 = [v10 isCellularDataEnabled];
  unsigned __int8 v15 = [(NPHCSAppCellularDataUsageCell *)v11 accessorySwitch];
  [v15 setOn:v14];

  if (+[NPHSharedUtilities isActiveWatchChinaRegionCellular])
  {
    id v16 = [v10 chinaSKUWirelessDataOptionForCellularSetup:v6];
    v17 = [(NPHCSAppCellularDataUsageCell *)v11 detailTextLabel];
    [v17 setText:v16];

    v18 = [v10 usageDisplayString];
    id v19 = [v18 length];

    if (!v19) {
      goto LABEL_8;
    }
    objc_super v20 = [v10 displayName];
    v21 = [v10 usageDisplayString];
    v22 = +[NSString stringWithFormat:@"%@\n%@", v20, v21];

    v23 = [v10 usageDisplayString];
    id v24 = [v22 rangeOfString:v23];
    uint64_t v26 = v25;

    id v27 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v22];
    v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    objc_msgSend(v27, "addAttribute:value:range:", NSFontAttributeName, v28, v24, v26);

    id v29 = [v27 copy];
    v30 = [(NPHCSAppCellularDataUsageCell *)v11 textLabel];
    [v30 setAttributedText:v29];
  }
  else
  {
    v22 = [v10 usageDisplayString];
    id v27 = [(NPHCSAppCellularDataUsageCell *)v11 detailTextLabel];
    [v27 setText:v22];
  }

LABEL_8:
  if ([v10 isForAnApp])
  {
    v31 = [(NPHCSAppCellularDataUsageCell *)v11 accessoryView];
    [v31 setHidden:0];

    [(NPHCSAppCellularDataUsageCell *)v11 _setIcon];
    v32 = +[MCProfileConnection sharedConnection];
    unsigned int v33 = [v32 effectiveBoolValueForSetting:MCFeatureAppCellularDataModificationAllowed];

    BOOL v34 = v33 != 2;
    if (v33 == 2) {
      double v35 = 0.5;
    }
    else {
      double v35 = 1.0;
    }
    [(NPHCSAppCellularDataUsageCell *)v11 setUserInteractionEnabled:v33 != 2];
    v36 = [(NPHCSAppCellularDataUsageCell *)v11 accessorySwitch];
    [v36 setEnabled:v34];
    v37 = [(NPHCSAppCellularDataUsageCell *)v11 detailTextLabel];
    [v37 setEnabled:v34];
    v38 = [(NPHCSAppCellularDataUsageCell *)v11 textLabel];
    [v38 setEnabled:v34];

    v39 = [(NPHCSAppCellularDataUsageCell *)v11 imageView];
    [v39 setAlpha:v35];
  }
  else
  {
    v40 = [v10 childObjects];

    if (v40)
    {
      [(NPHCSAppCellularDataUsageCell *)v11 setAccessoryType:1];
      v41 = v11;
      uint64_t v42 = 3;
    }
    else
    {
      [(NPHCSAppCellularDataUsageCell *)v11 setAccessoryType:0];
      v41 = v11;
      uint64_t v42 = 0;
    }
    [(NPHCSAppCellularDataUsageCell *)v41 setSelectionStyle:v42];
  }

  return v11;
}

- (void)_setIcon
{
  objc_initWeak(&location, self);
  v3 = [(NPHCSAppCellularDataUsageCell *)self appDataUsageItem];
  unsigned int v4 = [v3 isForAnApp];

  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_79B8;
    v19[3] = &unk_1C628;
    objc_copyWeak(&v20, &location);
    v5 = objc_retainBlock(v19);
    id v18 = 0;
    BOOL v6 = +[UIScreen mainScreen];
    v7 = [v6 traitCollection];
    [v7 displayScale];
    if (v8 <= 2.0) {
      uint64_t v9 = 47;
    }
    else {
      uint64_t v9 = 48;
    }

    id v10 = +[NanoResourceGrabber sharedInstance];
    v11 = [(NPHCSAppCellularDataUsageCell *)self appDataUsageItem];
    v12 = [v11 bundleID];
    [v10 getCachedIconForBundleID:v12 iconVariant:v9 outIconImage:&v18 updateBlock:v5];

    if (v18)
    {
      v13 = [(NPHCSAppCellularDataUsageCell *)self imageView];
      [v13 setImage:v18];
    }
    else
    {
      id v14 = [(NPHCSAppCellularDataUsageCell *)self imageView];
      unsigned __int8 v15 = PSBlankIconImage();
      [v14 setImage:v15];

      v13 = [(NPHCSAppCellularDataUsageCell *)self appDataUsageItem];
      id v16 = [v13 bundleID];
      v17 = dispatch_get_global_queue(0, 0);
      [v10 getIconForBundleID:v16 iconVariant:v9 queue:v17 block:v5 timeout:10.0];
    }
    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&location);
}

- (void)_cellularDataPolicySwitchFlipped:(id)a3
{
  unsigned int v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[NPHCSAppCellularDataUsageCell _cellularDataPolicySwitchFlipped:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v5 = [(NPHCSAppCellularDataUsageCell *)self accessorySwitch];
  id v6 = [v5 isOn];

  v7 = [(NPHCSAppCellularDataUsageCell *)self appDataUsageItem];
  [v7 setUsagePoliciesForCellular:v6];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)NPHCSAppCellularDataUsageCell;
  [(NPHCSAppCellularDataUsageCell *)&v4 prepareForReuse];
  [(NPHCSAppCellularDataUsageCell *)self setAppDataUsageItem:0];
  v3 = [(NPHCSAppCellularDataUsageCell *)self imageView];
  [v3 setImage:0];
}

- (NPHCSAppCellularDataUsageItem)appDataUsageItem
{
  return self->_appDataUsageItem;
}

- (void)setAppDataUsageItem:(id)a3
{
}

- (UISwitch)accessorySwitch
{
  return self->_accessorySwitch;
}

- (void)setAccessorySwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySwitch, 0);

  objc_storeStrong((id *)&self->_appDataUsageItem, 0);
}

@end
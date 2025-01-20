@interface CARTextSizePanel
- (CARSettingsGroupCellSpecifier)groupSpecifier;
- (CARTextSizePanel)initWithPanelController:(id)a3;
- (id)cellSpecifier;
- (id)cellSpecifiers;
- (void)_updateSelectedIndex;
- (void)invalidate;
- (void)setGroupSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARTextSizePanel

- (CARTextSizePanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CARTextSizePanel;
  v5 = [(CARSettingsPanel *)&v21 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = sub_1000210C8(@"TEXT_SIZE_SMALL");
    v22[0] = v6;
    v7 = sub_1000210C8(@"TEXT_SIZE_MEDIUM");
    v22[1] = v7;
    v8 = sub_1000210C8(@"TEXT_SIZE_LARGE");
    v22[2] = v8;
    v9 = +[NSArray arrayWithObjects:v22 count:3];

    v10 = [CARSettingsGroupCellSpecifier alloc];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10000E56C;
    v18 = &unk_1000921A0;
    objc_copyWeak(&v19, &location);
    v11 = [(CARSettingsGroupCellSpecifier *)v10 initWithTitles:v9 actionBlock:&v15];
    groupSpecifier = v5->_groupSpecifier;
    v5->_groupSpecifier = v11;

    [(CARTextSizePanel *)v5 _updateSelectedIndex];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_10000E67C, @"AppleCarPlayPreferredContentSizeCategoryChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CARTextSizePanel;
  [(CARSettingsPanel *)&v4 invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleCarPlayPreferredContentSizeCategoryChangedNotification", 0);
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    objc_super v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"TEXT_SIZE_TITLE");
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10000E850;
    v14 = &unk_100092008;
    objc_copyWeak(&v15, &location);
    v6 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:0 accessoryType:1 actionBlock:&v11];
    v7 = self->_cellSpecifier;
    self->_cellSpecifier = v6;

    v8 = [(CARTextSizePanel *)self groupSpecifier];
    v9 = [v8 selectedTitle];
    [(CARSettingsCellSpecifier *)self->_cellSpecifier setDetail:v9];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)cellSpecifiers
{
  v2 = [(CARTextSizePanel *)self groupSpecifier];
  v3 = [v2 groupSpecifiers];

  return v3;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CARTextSizePanel;
  [(CARSettingsTablePanel *)&v2 viewDidLoad];
}

- (void)_updateSelectedIndex
{
  v3 = +[CARPrototypePref contentSize];
  id v6 = [v3 value];

  if ([v6 isEqualToString:UIContentSizeCategoryMedium])
  {
    uint64_t v4 = 0;
  }
  else if ([v6 isEqualToString:UIContentSizeCategoryLarge])
  {
    uint64_t v4 = 1;
  }
  else if ([v6 isEqualToString:UIContentSizeCategoryExtraLarge])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = [(CARTextSizePanel *)self groupSpecifier];
  [v5 setSelectedIndex:v4];
}

- (CARSettingsGroupCellSpecifier)groupSpecifier
{
  return (CARSettingsGroupCellSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (void)setGroupSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end
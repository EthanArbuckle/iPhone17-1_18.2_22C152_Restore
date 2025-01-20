@interface CARDebugSettingsCollectionPanel
- (CARDebugCollectionConfig)config;
- (CARDebugSettingsCollectionPanel)initWithPanelController:(id)a3;
- (NSArray)colors;
- (UIEdgeInsets)sectionInset;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (id)cellSpecifier;
- (id)cellSpecifiers;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_refreshConfig;
- (void)invalidate;
- (void)setConfig:(id)a3;
@end

@implementation CARDebugSettingsCollectionPanel

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100027F7C;
    v8[3] = &unk_100092008;
    objc_copyWeak(&v9, &location);
    v5 = [(CARSettingsCellSpecifier *)v4 initWithTitle:@"Debug Collection Panel" image:0 accessoryType:1 actionBlock:v8];
    v6 = self->_cellSpecifier;
    self->_cellSpecifier = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (CARDebugSettingsCollectionPanel)initWithPanelController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CARDebugSettingsCollectionPanel;
  v3 = [(CARSettingsPanel *)&v8 initWithPanelController:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    config = v3->_config;
    v3->_config = (CARDebugCollectionConfig *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_100028070, @"com.apple.CarPlaySettings.DebugCollectionPanel.refreshConfig", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CARDebugSettingsCollectionPanel;
  [(CARSettingsPanel *)&v4 invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.CarPlaySettings.DebugCollectionPanel.refreshConfig", 0);
}

- (void)_refreshConfig
{
  v3 = objc_opt_new();
  [(CARDebugSettingsCollectionPanel *)self setConfig:v3];

  [(CARSettingsCollectionPanel *)self reloadSpecifiers];
}

- (id)cellSpecifiers
{
  v3 = objc_opt_new();
  objc_super v4 = [(CARDebugSettingsCollectionPanel *)self config];
  id v5 = [v4 cells];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [CARDebugCollectionView alloc];
      objc_super v8 = [(CARDebugSettingsCollectionPanel *)self config];
      id v9 = [(CARDebugSettingsCollectionPanel *)self colors];
      v10 = [(CARDebugSettingsCollectionPanel *)self colors];
      v11 = [v9 objectAtIndexedSubscript:v6 % (unint64_t)[v10 count]];
      v12 = [(CARDebugCollectionView *)v7 initWithConfig:v8 color:v11];

      v13 = [CARSettingsCellViewSpecifier alloc];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000282FC;
      v19[3] = &unk_100092358;
      v20 = v12;
      v14 = v12;
      v15 = [(CARSettingsCellViewSpecifier *)v13 initWithView:v14 actionBlock:v19];
      [v3 addObject:v15];

      ++v6;
      v16 = [(CARDebugSettingsCollectionPanel *)self config];
      id v17 = [v16 cells];
    }
    while ((unint64_t)v17 > v6);
  }

  return v3;
}

- (unint64_t)numberOfColumns
{
  v2 = [(CARDebugSettingsCollectionPanel *)self config];
  id v3 = [v2 columns];

  return (unint64_t)v3;
}

- (unint64_t)numberOfRows
{
  v2 = [(CARDebugSettingsCollectionPanel *)self config];
  id v3 = [v2 rows];

  return (unint64_t)v3;
}

- (UIEdgeInsets)sectionInset
{
  v2 = [(CARDebugSettingsCollectionPanel *)self config];
  [v2 sectionInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)minimumLineSpacing
{
  v2 = [(CARDebugSettingsCollectionPanel *)self config];
  [v2 minimumLineSpacing];
  double v4 = v3;

  return v4;
}

- (double)minimumInteritemSpacing
{
  v2 = [(CARDebugSettingsCollectionPanel *)self config];
  [v2 minimumInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (NSArray)colors
{
  colors = self->_colors;
  if (!colors)
  {
    double v4 = +[UIColor systemRedColor];
    double v5 = +[UIColor systemOrangeColor];
    v14[1] = v5;
    double v6 = +[UIColor systemYellowColor];
    v14[2] = v6;
    double v7 = +[UIColor systemGreenColor];
    v14[3] = v7;
    double v8 = +[UIColor systemBlueColor];
    v14[4] = v8;
    double v9 = +[UIColor systemIndigoColor];
    v14[5] = v9;
    double v10 = +[UIColor systemPurpleColor];
    v14[6] = v10;
    double v11 = +[NSArray arrayWithObjects:v14 count:7];
    double v12 = self->_colors;
    self->_colors = v11;

    colors = self->_colors;
  }

  return colors;
}

- (CARDebugCollectionConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_colors, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end
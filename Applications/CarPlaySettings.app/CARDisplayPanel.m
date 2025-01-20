@interface CARDisplayPanel
- (CARDisplayPanel)initWithPanelController:(id)a3;
- (NSArray)panels;
- (id)cellSpecifier;
- (id)cellSpecifiers;
- (void)viewDidLoad;
@end

@implementation CARDisplayPanel

- (CARDisplayPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CARDisplayPanel;
  v5 = [(CARSettingsPanel *)&v11 initWithPanelController:v4];
  if (v5)
  {
    v6 = [[CARDisplayModePanel alloc] initWithPanelController:v4];
    v12[0] = v6;
    v7 = [[CARTextSizePanel alloc] initWithPanelController:v4];
    v12[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v12 count:2];
    panels = v5->_panels;
    v5->_panels = (NSArray *)v8;
  }
  return v5;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"DISPLAY_TEXT_TITLE");
    v6 = +[CARSettingsImageCache displayImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001BDB0;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    uint64_t v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)cellSpecifiers
{
  cellSpecifiers = self->_cellSpecifiers;
  if (!cellSpecifiers)
  {
    id v4 = [(CARDisplayPanel *)self panels];
    v5 = NSStringFromSelector("cellSpecifier");
    v6 = [v4 valueForKey:v5];
    v7 = +[NSMutableArray arrayWithArray:v6];

    uint64_t v8 = self->_cellSpecifiers;
    self->_cellSpecifiers = v7;

    cellSpecifiers = self->_cellSpecifiers;
  }

  return cellSpecifiers;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CARDisplayPanel;
  [(CARSettingsTablePanel *)&v2 viewDidLoad];
}

- (NSArray)panels
{
  return self->_panels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_cellSpecifiers, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end
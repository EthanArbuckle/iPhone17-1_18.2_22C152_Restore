@interface CARNavigationOverridesPanel
- (CARNavigationOverridesPanel)initWithPanelController:(id)a3;
- (NSArray)switches;
- (id)cellSpecifier;
- (id)cellSpecifiers;
@end

@implementation CARNavigationOverridesPanel

- (CARNavigationOverridesPanel)initWithPanelController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CARNavigationOverridesPanel;
  v3 = [(CARSettingsPanel *)&v10 initWithPanelController:a3];
  if (v3)
  {
    v4 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"maps:/car/instrumentcluster" image:0 accessoryType:0 actionBlock:&stru_1000922D0];
    v11[0] = v4;
    v5 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"maps:/car/instrumentcluster/instructioncard" image:0 accessoryType:0 actionBlock:&stru_1000922F0];
    v11[1] = v5;
    v6 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"maps:/car/instrumentcluster/map" image:0 accessoryType:0 actionBlock:&stru_100092310];
    v11[2] = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:v11 count:3];
    switches = v3->_switches;
    v3->_switches = (NSArray *)v7;
  }
  return v3;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v5 = +[CARSettingsImageCache internalImage];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015F58;
    v9[3] = &unk_100092008;
    objc_copyWeak(&v10, &location);
    v6 = [(CARSettingsCellSpecifier *)v4 initWithTitle:@"showUI URL Override" image:v5 accessoryType:1 actionBlock:v9];
    uint64_t v7 = self->_cellSpecifier;
    self->_cellSpecifier = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)cellSpecifiers
{
  return [(CARNavigationOverridesPanel *)self switches];
}

- (NSArray)switches
{
  return self->_switches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switches, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end
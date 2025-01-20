@interface ClarityUISettingsListController
- (BOOL)areSpecifiersLoaded;
- (ClarityUISettingsListController)initWithDataSource:(id)a3;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)loadSpecifiers;
- (void)reloadSpecifiers;
- (void)viewDidLoad;
@end

@implementation ClarityUISettingsListController

- (ClarityUISettingsListController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ClarityUISettingsListController;
  v6 = [(ClarityUISettingsListController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = [v5 bundleIdentifier];
    uint64_t v9 = ClarityUIDisplayNameForApp(v8);
    title = v7->_title;
    v7->_title = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ClarityUISettingsListController;
  [(ClarityUISettingsListController *)&v5 viewDidLoad];
  title = self->_title;
  v4 = [(ClarityUISettingsListController *)self navigationItem];
  [v4 setTitle:title];
}

- (BOOL)areSpecifiersLoaded
{
  return [(ClarityUISettingsDataSource *)self->_dataSource areSpecifiersLoaded];
}

- (void)loadSpecifiers
{
}

- (void)reloadSpecifiers
{
}

- (id)specifiers
{
  if (![(ClarityUISettingsListController *)self areSpecifiersLoaded]) {
    [(ClarityUISettingsListController *)self loadSpecifiers];
  }
  uint64_t v3 = [(ClarityUISettingsDataSource *)self->_dataSource specifiers];
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  objc_super v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;

  v6 = *(void **)&self->PSListController_opaque[v4];

  return v6;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
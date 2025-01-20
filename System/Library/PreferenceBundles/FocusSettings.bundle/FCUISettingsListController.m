@interface FCUISettingsListController
- (BOOL)isAddButtonHidden;
- (id)_configuredModeForSemanticType:(int64_t)a3;
- (id)tintColor;
- (int64_t)imageSymbolWeight;
- (void)_handleSetupRequestForSemanticType:(int64_t)a3;
- (void)_presentSetupControllerForUnknownMode;
- (void)emitNavigationEvent;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)presentSetupControllerForPlaceholderMode:(id)a3;
- (void)setAddButtonHidden:(BOOL)a3;
- (void)setupNavigationController:(id)a3 createDefaultModeConfigurationForMode:(id)a4;
- (void)showConfigurationForModeIdentifier:(id)a3 animate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FCUISettingsListController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)FCUISettingsListController;
  [(FCUISettingsListController *)&v12 viewDidLoad];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:[(FCUISettingsListController *)self imageSymbolWeight] weight:24.0];
  v4 = +[UIImage systemImageNamed:@"plus" withConfiguration:v3];
  v5 = +[UIButton buttonWithType:0];
  [v5 addTarget:self action:"_addButtonPressed:" forControlEvents:64];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 44.0, 44.0);
  [v5 setImage:v4 forState:0];
  v6 = [v5 imageView];
  [v6 setContentMode:4];

  v7 = [v5 imageView];
  v8 = [(FCUISettingsListController *)self tintColor];
  [v7 setTintColor:v8];

  v9 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v5];
  addButtomItem = self->_addButtomItem;
  self->_addButtomItem = v9;

  [(UIBarButtonItem *)self->_addButtomItem setHidden:self->_addButtonHidden];
  v11 = [(FCUISettingsListController *)self navigationItem];
  [v11 setRightBarButtonItem:self->_addButtomItem];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FCUISettingsListController;
  [(FCUISettingsListController *)&v4 viewDidAppear:a3];
  [(FCUISettingsListController *)self emitNavigationEvent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCUISettingsListController;
  [(FCUISettingsListController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(FCUISettingsListController *)self specifierDataSource];
  [v4 reloadSpecifiers];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7DC8;
  v9[3] = &unk_1CD68;
  id v10 = a3;
  v11 = self;
  id v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)FCUISettingsListController;
  id v6 = v12;
  id v7 = v10;
  [(FCUISettingsListController *)&v8 handleURL:v7 withCompletion:v9];
}

- (void)setAddButtonHidden:(BOOL)a3
{
  self->_addButtonHidden = a3;
  -[UIBarButtonItem setHidden:](self->_addButtomItem, "setHidden:");
}

- (void)presentSetupControllerForPlaceholderMode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)DNDMode);
  id v6 = [v4 name];
  id v7 = [v4 modeIdentifier];
  objc_super v8 = [v4 symbolImageName];
  v9 = [v4 tintColorName];
  id v10 = [v4 semanticType];

  id v12 = [v5 initWithName:v6 modeIdentifier:v7 symbolImageName:v8 tintColorName:v9 semanticType:v10];
  v11 = +[FCUISetupNavigationController setupNavigationControllerForMode:v12];
  [v11 setSetupDelegate:self];
  [(FCUISettingsListController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)showConfigurationForModeIdentifier:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(FCUISettingsListController *)self specifierForID:a3];
  if (v6)
  {
    id v7 = [(FCUISettingsListController *)self selectSpecifier:v6];
    if (v7) {
      [(FCUISettingsListController *)self showController:v7 animate:v4];
    }
  }

  _objc_release_x1();
}

- (void)setupNavigationController:(id)a3 createDefaultModeConfigurationForMode:(id)a4
{
  id v5 = a4;
  id v6 = [(FCUISettingsListController *)self specifierDataSource];
  [v6 createDefaultModeConfigurationForMode:v5];
}

- (id)_configuredModeForSemanticType:(int64_t)a3
{
  BOOL v4 = [(FCUISettingsListController *)self specifierDataSource];
  id v5 = [v4 allReservedModes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_81B4;
  v8[3] = &unk_1CBE8;
  v8[4] = a3;
  id v6 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v8);

  return v6;
}

- (void)_presentSetupControllerForUnknownMode
{
  id v6 = [(FCUISettingsListController *)self specifierDataSource];
  v3 = [v6 placeholderModes];
  BOOL v4 = [v6 allReservedModes];
  id v5 = +[FCUISetupNavigationController setupNavigationControllerForUnknownModeWithPlaceholderModes:v3 allReservedModes:v4];
  [v5 setSetupDelegate:self];
  [(FCUISettingsListController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_handleSetupRequestForSemanticType:(int64_t)a3
{
  id v6 = [(FCUISettingsListController *)self specifierDataSource];
  id v5 = [v6 placeholderModeForSemanticType:a3];
  [(FCUISettingsListController *)self presentSetupControllerForPlaceholderMode:v5];
}

- (int64_t)imageSymbolWeight
{
  return 3;
}

- (id)tintColor
{
  return +[UIColor systemBlueColor];
}

- (void)emitNavigationEvent
{
  v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Focus"];
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  id v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"Focus" table:0 locale:v7 bundleURL:v5];

  id v10 = v8;
  v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(FCUISettingsListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.focus" title:v8 localizedNavigationComponents:v9 deepLink:v3];
}

- (BOOL)isAddButtonHidden
{
  return self->_addButtonHidden;
}

- (void).cxx_destruct
{
}

@end
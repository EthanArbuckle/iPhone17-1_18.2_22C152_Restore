@interface HPRFSessionTrackerAppCyclingPowerFTPViewController
+ (id)numberFormatter;
- (FIUIFormattingManager)formattingManager;
- (HPRFSessionTrackerAppCyclingPowerFTPViewController)initWithConfiguration:(id)a3 updateDelegate:(id)a4;
- (PSSpecifier)functionalThresholdPowerSpecifier;
- (UITapGestureRecognizer)tapGesture;
- (UITextField)editableTextField;
- (WOCyclingPowerZonesConfiguration)configuration;
- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate;
- (id)_functionalThresholdPower;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_didBeginEditing:(id)a3;
- (void)_insertFunctionalThresholdPowerSpecifiers:(id)a3;
- (void)_pressedTableView;
- (void)_setFunctionalThresholdPower:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEditableTextField:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setFunctionalThresholdPowerSpecifier:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppCyclingPowerFTPViewController

- (HPRFSessionTrackerAppCyclingPowerFTPViewController)initWithConfiguration:(id)a3 updateDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HPRFSessionTrackerAppCyclingPowerFTPViewController;
  v9 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_updateDelegate, v8);
    objc_storeStrong((id *)&v10->_configuration, a3);
    v11 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v10 action:"_pressedTableView"];
    tapGesture = v10->_tapGesture;
    v10->_tapGesture = v11;
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HPRFSessionTrackerAppCyclingPowerFTPViewController;
  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)&v7 viewWillAppear:a3];
  v4 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self table];
  v5 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self tapGesture];
  [v4 addGestureRecognizer:v5];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_didBeginEditing:" name:UITextFieldTextDidBeginEditingNotification object:0];

  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self editableTextField];
  [v3 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFSessionTrackerAppCyclingPowerFTPViewController;
  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:0];

  v5 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self table];
  [v5 endEditing:1];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_SHORT_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v4 = +[NSString stringWithFormat:v3];

  return v4;
}

- (id)applicationBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)specifiers
{
  id v3 = objc_opt_new();
  v4 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self localizedPaneTitle];
  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self setTitle:v4];

  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self _insertFunctionalThresholdPowerSpecifiers:v3];
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  objc_super v6 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v7 = v3;

  id v8 = *(id *)&self->BPSNotificationAppController_opaque[v5];
  return v8;
}

- (void)_insertFunctionalThresholdPowerSpecifiers:(id)a3
{
  id v4 = a3;
  id v18 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_EDIT_FTP_GROUP_ID"];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_EDIT_FTP_HEADER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [v18 setName:v6];

  id v7 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self configuration];
  id v8 = +[HPRFSessionTrackerAppCyclingPowerConfigViewController automaticFTPString:v7];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_MANUAL_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8);

  [v18 setProperty:v11 forKey:PSFooterTextGroupKey];
  [v4 addObject:v18];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_EDIT_FTP_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  objc_super v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"_setFunctionalThresholdPower:" get:"_functionalThresholdPower" detail:0 cell:8 edit:0];
  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self setFunctionalThresholdPowerSpecifier:v14];

  v15 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self functionalThresholdPowerSpecifier];
  [v15 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  v16 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self functionalThresholdPowerSpecifier];
  [v16 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];

  v17 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self functionalThresholdPowerSpecifier];
  [v4 addObject:v17];
}

+ (id)numberFormatter
{
  if (qword_3D058 != -1) {
    dispatch_once(&qword_3D058, &stru_30FF0);
  }
  v2 = (void *)qword_3D050;

  return v2;
}

- (id)_functionalThresholdPower
{
  id v3 = [(id)objc_opt_class() numberFormatter];
  id v4 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self configuration];
  uint64_t v5 = [v4 functionalThresholdPower];
  objc_super v6 = [v5 quantity];
  [v6 _value];
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v8 = [v3 stringFromNumber:v7];

  return v8;
}

- (void)_setFunctionalThresholdPower:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    id v4 = [(id)objc_opt_class() numberFormatter];
    uint64_t v5 = [v4 numberFromString:v9];

    if (v5)
    {
      double v6 = (double)(uint64_t)[v5 integerValue];
      id v7 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self configuration];
      id v8 = +[WOCyclingPowerZonesConfigurationEditor changeFunctionalThresholdPowerTo:v7 using:v6];
      [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self setConfiguration:v8];
    }
  }
  [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self reloadSpecifiers];
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  id v6 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self updateDelegate];
  [v6 updateWithConfiguration:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HPRFSessionTrackerAppCyclingPowerFTPViewController;
  id v5 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == &dword_8)
  {
    id v6 = [v5 editableTextField];
    [v6 setReturnKeyGoesToNextResponder:0];
    [v6 setReturnKeyType:9];
    [v6 setKeyboardType:4];
    id v7 = [v6 traitCollection];
    objc_msgSend(v6, "setTextAlignment:", 2 * (objc_msgSend(v7, "layoutDirection") == 0));

    [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self setEditableTextField:v6];
  }

  return v5;
}

- (void)_didBeginEditing:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_853C;
  block[3] = &unk_31018;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_pressedTableView
{
  id v2 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)self table];
  [v2 endEditing:1];
}

- (WOCyclingPowerZonesConfiguration)configuration
{
  return self->_configuration;
}

- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (WOCyclingPowerZonesConfigurationUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (PSSpecifier)functionalThresholdPowerSpecifier
{
  return self->_functionalThresholdPowerSpecifier;
}

- (void)setFunctionalThresholdPowerSpecifier:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (UITextField)editableTextField
{
  return self->_editableTextField;
}

- (void)setEditableTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTextField, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_functionalThresholdPowerSpecifier, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
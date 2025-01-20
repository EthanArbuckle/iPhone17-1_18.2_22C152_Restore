@interface TopNavigationController
- (TopNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)dealloc;
- (void)updateUI:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TopNavigationController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)TopNavigationController;
  [(TopNavigationController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TopNavigationController;
  [(TopNavigationController *)&v12 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/FONT_SETTING"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"FONT_SETTING_TITLE_PLURAL" table:@"FontSettings" locale:v6 bundleURL:v8];

  [(TopNavigationController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.gear" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
  v10 = +[FontSettingsManager sharedManager];
  id v11 = [v10 systemFontFamilies];
}

- (TopNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TopNavigationController;
  v4 = [(TopNavigationController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:v4 selector:"updateUI:" name:@"FontSettingsManagerUpdated" object:0];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"SYSTEM_FONTS" value:&stru_1CDF0 table:@"FontSettings"];
    objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"MY_FONTS" value:&stru_1CDF0 table:@"FontSettings"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v14[0] = v7;
    v14[1] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v14 count:2];
    objc_super v12 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v11;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)updateUI:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"FontSettingsFontListChanged" object:0];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TopNavigationController;
  [(TopNavigationController *)&v4 dealloc];
}

@end
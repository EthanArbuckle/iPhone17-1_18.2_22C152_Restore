@interface AXAppleWatchRemoteScreenController
- (id)observerToken;
- (id)specifiers;
- (id)twiceRemtoeScreenValue:(id)a3;
- (void)dealloc;
- (void)setObserverToken:(id)a3;
- (void)twiceRemtoeScreenValue:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation AXAppleWatchRemoteScreenController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)AXAppleWatchRemoteScreenController;
  [(AXAppleWatchRemoteScreenController *)&v13 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = kAXSTwiceRemoteScreenNotification;
  v5 = +[NSOperationQueue mainQueue];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = __49__AXAppleWatchRemoteScreenController_viewDidLoad__block_invoke;
  v10 = &unk_20B390;
  objc_copyWeak(&v11, &location);
  v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:&v7];
  -[AXAppleWatchRemoteScreenController setObserverToken:](self, "setObserverToken:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__AXAppleWatchRemoteScreenController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  v3 = [(AXAppleWatchRemoteScreenController *)self observerToken];

  if (v3)
  {
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    v5 = [(AXAppleWatchRemoteScreenController *)self observerToken];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)AXAppleWatchRemoteScreenController;
  [(AccessibilitySettingsBaseController *)&v6 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"APPLE_WATCH_REMOTE_SCREEN_FOOTER", @"Accessibility");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    uint64_t v8 = settingsLocString(@"APPLE_WATCH_REMOTE_SCREEN", @"Accessibility");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"twiceRemtoeScreenValue:specifier:" get:"twiceRemtoeScreenValue:" detail:0 cell:6 edit:0];

    [v9 setProperty:@"APPLE_WATCH_REMOTE_SCREEN" forKey:PSIDKey];
    [v9 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v5 addObject:v9];
    v10 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    uint64_t v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)twiceRemtoeScreenValue:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  _AXSTwiceRemoteScreenSetPlatform();
  id v5 = [v4 BOOLValue];

  __AXSTwiceRemoteScreenSetEnabled(v5);
}

- (id)twiceRemtoeScreenValue:(id)a3
{
  uint64_t v3 = _AXSTwiceRemoteScreenEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)observerToken
{
  return self->_observerToken;
}

- (void)setObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
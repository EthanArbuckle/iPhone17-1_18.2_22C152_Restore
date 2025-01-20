@interface AXSelectAppViewController
- (BOOL)showsHiddenApps;
- (NSDictionary)selectedApps;
- (NSMutableArray)appSpecifiers;
- (id)makeSpecifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_generateUnselectedAppSpecifiers;
- (void)_handleAppDidEnterBackground;
- (void)_removeSelectedAndHiddenAppSpecfiers;
- (void)_showHiddenApps:(id)a3;
- (void)applicationDidResume;
- (void)cancelButtonClicked:(id)a3;
- (void)setAppSpecifiers:(id)a3;
- (void)setSelectedApps:(id)a3;
- (void)setShowsHiddenApps:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AXSelectAppViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AXSelectAppViewController;
  [(AXSelectAppViewController *)&v6 viewDidLoad];
  id v3 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonClicked:"];
  v4 = [(AXSelectAppViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleAppDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)AXSelectAppViewController;
  [(AXSelectAppViewController *)&v3 applicationDidResume];
  [(AXSelectAppViewController *)self setNeedsSpecifierRefresh];
  [(AXSelectAppViewController *)self reloadSpecifiers];
}

- (void)setSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApps, a3);
  [(AXSelectAppViewController *)self setNeedsSpecifierRefresh];

  [(AXSelectAppViewController *)self reloadSpecifiers];
}

- (id)makeSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (_os_feature_enabled_impl() && !self->_showsHiddenApps)
  {
    v4 = +[PSSpecifier groupSpecifierWithName:0];
    [v3 addObject:v4];
    v5 = settingsLocString(@"PROTECTED_APPS_SHOW_HIDDEN_TITLE", @"Accessibility");
    objc_super v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v6 setButtonAction:"_showHiddenApps:"];
    [v6 setIdentifier:@"PROTECTED_APPS_SHOW_HIDDEN_TITLE"];
    [v3 addObject:v6];
  }
  v7 = +[PSSpecifier groupSpecifierWithID:@"PER_APP_APPS_GROUP"];
  [v3 addObject:v7];
  [(AXSelectAppViewController *)self _generateUnselectedAppSpecifiers];
  [v3 axSafelyAddObjectsFromArray:self->_appSpecifiers];

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXSelectAppViewController *)self specifierForIndexPath:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 identifier];
    unsigned int v11 = [v10 isEqualToString:@"PROTECTED_APPS_SHOW_HIDDEN_TITLE"];

    if (v11)
    {
      v14.receiver = self;
      v14.super_class = (Class)AXSelectAppViewController;
      [(AXSelectAppViewController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
    }
    else
    {
      v12 = [(AXSelectAppViewController *)self parentController];
      [v12 addAppSpecifier:v9];
      v13 = [(AXSelectAppViewController *)self navigationController];
      [v13 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AXSelectAppViewController;
  id v6 = a4;
  id v7 = [(AXSelectAppViewController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[AXSelectAppViewController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v18.receiver, v18.super_class);

  v9 = [v8 propertyForKey:PSIconImageKey];
  if (v9)
  {
    uint64_t v10 = kISImageDescriptorTableUIName;
    id v11 = v7;
    v12 = +[ISImageDescriptor imageDescriptorNamed:v10];
    [v12 continuousCornerRadius];
    double v14 = v13;

    v15 = [v11 iconImageView];
    [v15 _setContinuousCornerRadius:v14];

    v16 = [v11 iconImageView];

    [v16 setClipsToBounds:1];
  }

  return v7;
}

- (void)_generateUnselectedAppSpecifiers
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = v3;

  AXGenerateAppAndServiceNameSpecifiers(self, self->_appSpecifiers);

  [(AXSelectAppViewController *)self _removeSelectedAndHiddenAppSpecfiers];
}

- (void)_removeSelectedAndHiddenAppSpecfiers
{
  int v17 = _os_feature_enabled_impl();
  id v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_appSpecifiers;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v7);
        v9 = [v8 propertyForKey:@"BundleIdentifier"];
        if (!v9) {
          goto LABEL_13;
        }
        uint64_t v10 = [(AXSelectAppViewController *)self selectedApps];
        id v11 = [v10 objectForKey:v9];
        int v12 = v17;
        if (v11) {
          int v12 = 0;
        }
        if (v12 != 1)
        {
          double v13 = v11;

          if (!v13) {
            goto LABEL_14;
          }
LABEL_13:
          [v3 addObject:v8];
          goto LABEL_14;
        }
        if (self->_showsHiddenApps)
        {

          goto LABEL_14;
        }
        char v14 = AXIsHiddenAppWithBundleId();

        if (v14) {
          goto LABEL_13;
        }
LABEL_14:

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v5 = v15;
    }
    while (v15);
  }

  [(NSMutableArray *)self->_appSpecifiers removeObjectsInArray:v3];
}

- (void)_showHiddenApps:(id)a3
{
  id v4 = [(AXSelectAppViewController *)self parentController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__AXSelectAppViewController__showHiddenApps___block_invoke;
  v5[3] = &unk_2097B8;
  v5[4] = self;
  [v4 showHiddenAppsWithCompletion:v5];
}

id __45__AXSelectAppViewController__showHiddenApps___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowsHiddenApps:1];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

- (void)_handleAppDidEnterBackground
{
  self->_showsHiddenApps = 0;
}

- (void)cancelButtonClicked:(id)a3
{
}

- (NSDictionary)selectedApps
{
  return self->_selectedApps;
}

- (BOOL)showsHiddenApps
{
  return self->_showsHiddenApps;
}

- (void)setShowsHiddenApps:(BOOL)a3
{
  self->_showsHiddenApps = a3;
}

- (NSMutableArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);

  objc_storeStrong((id *)&self->_selectedApps, 0);
}

@end
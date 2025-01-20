@interface BuddyLanguageLocaleFlow
+ (id)allowedFlowItems;
- (BOOL)isResumingFromLanguageReboot;
- (BOOL)languageSet;
- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyLanguageChangeObserver)languageChangeObserver;
- (BuddyLanguageLocaleDataSource)dataSource;
- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 dataSource:(id)a4 flowDelegate:(id)a5 flowStarter:(id)a6 dependencyInjector:(id)a7;
- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (BuddyLanguageLocaleSelectionReceiver)receiver;
- (id)firstItem;
- (id)precedingItemsClasses;
- (void)_injectDependencies:(id)a3;
- (void)configureFlowItem:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)languageCompositeUpdated;
- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setLanguageChangeObserver:(id)a3;
- (void)setLanguageSet:(BOOL)a3;
- (void)setReceiver:(id)a3;
- (void)setResumingFromLanguageReboot:(BOOL)a3;
- (void)userSelectedLanguage:(id)a3;
@end

@implementation BuddyLanguageLocaleFlow

- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v12 = objc_alloc_init(BuddyLanguageLocaleDataSource);
  id v9 = v17;
  id v17 = 0;
  id v17 = [v9 initWithNavigationController:location[0] dataSource:v12 flowDelegate:v15 flowStarter:v14 dependencyInjector:v13];
  v10 = (BuddyLanguageLocaleFlow *)v17;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 dataSource:(id)a4 flowDelegate:(id)a5 flowStarter:(id)a6 dependencyInjector:(id)a7
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  id v11 = v27;
  id v27 = 0;
  v21.receiver = v11;
  v21.super_class = (Class)BuddyLanguageLocaleFlow;
  id v27 = [(BuddyLanguageLocaleFlow *)&v21 initWithNavigationController:location[0] flowDelegate:v24 flowStarter:v23 dependencyInjector:v22];
  objc_storeStrong(&v27, v27);
  if (v27)
  {
    [v27 setDataSource:v25];
    id v12 = v27;
    id v13 = [v27 dataSource];
    [v13 setDelegate:v12];

    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    id v14 = +[NSArray arrayWithObjects:v28 count:2];
    [v27 setClassList:v14];

    id v15 = objc_alloc_init(BuddyLanguageChangeObserver);
    [v27 setLanguageChangeObserver:v15];

    id v16 = v27;
    id v17 = [v27 languageChangeObserver];
    [v17 setDelegate:v16];

    id v18 = [v27 languageChangeObserver];
    [v18 startObservingLanguageChanges];
  }
  v19 = (BuddyLanguageLocaleFlow *)v27;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v27, 0);
  return v19;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_buddyPreferencesExcludedFromBackup, location[0]);
  id v3 = location[0];
  v4 = [(BuddyLanguageLocaleFlow *)v6 dataSource];
  [(BuddyLanguageLocaleDataSource *)v4 setBuddyPreferencesExcludedFromBackup:v3];

  objc_storeStrong(location, 0);
}

- (id)firstItem
{
  id v9 = self;
  location[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyLanguageLocaleFlow;
  location[0] = [(BuddyLanguageLocaleFlow *)&v7 firstItem];
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyLanguageDependencyReceiver])
  {
    id v2 = location[0];
    id v3 = [(BuddyLanguageLocaleFlow *)v9 dataSource];
    v4 = [(BuddyLanguageLocaleDataSource *)v3 languageComposite];
    [v2 setLanguageComposite:v4];
  }
  id v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

- (id)precedingItemsClasses
{
  if ([(BuddyLanguageLocaleFlow *)self isResumingFromLanguageReboot])
  {
    uint64_t v4 = objc_opt_class();
    id v3 = +[NSArray arrayWithObjects:&v4 count:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)configureFlowItem:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageLocaleFlow;
  [(BuddyLanguageLocaleFlow *)&v3 configureFlowItem:location[0]];
  [(BuddyLanguageLocaleFlow *)v5 _injectDependencies:location[0]];
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:2];
}

- (void)_injectDependencies:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = (uint64_t (**)(id, id))[(BuddyLanguageLocaleFlow *)v12 injector];
  id v4 = (id)v3[2](v3, location[0]);

  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyLanguageDependencyReceiver])
  {
    id v10 = location[0];
    id v5 = [(BuddyLanguageLocaleFlow *)v12 dataSource];
    v6 = [(BuddyLanguageLocaleDataSource *)v5 languageComposite];
    [v10 setLanguageComposite:v6];

    [v10 setSelectionReceiver:v12];
    objc_storeStrong(&v10, 0);
  }
  else if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyLocaleDependencyReceiver])
  {
    id v9 = location[0];
    objc_super v7 = [(BuddyLanguageLocaleFlow *)v12 dataSource];
    v8 = [(BuddyLanguageLocaleDataSource *)v7 localeComposite];
    [v9 setLocaleComposite:v8];

    [v9 setSelectionReceiver:v12];
    [v9 setResumingFromLanguageReboot:[self isResumingFromLanguageReboot]];
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  [(BuddyLanguageLocaleFlow *)v11 setResumingFromLanguageReboot:0];
  [(BuddyLanguageLocaleFlow *)v11 _injectDependencies:v9];
  char v8 = 0;
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyLanguageDependencyReceiver])
  {
    id v7 = location[0];
    char v8 = [v7 showLocalizedNames] & 1;
    objc_storeStrong(&v7, 0);
  }
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___BuddyLocaleDependencyReceiver])
  {
    id v6 = v9;
    [v6 setShowLocalizedNames:v8 & 1];
    objc_storeStrong(&v6, 0);
  }
  v5.receiver = v11;
  v5.super_class = (Class)BuddyLanguageLocaleFlow;
  [(BuddyLanguageLocaleFlow *)&v5 flowItemDone:location[0] nextItem:v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(BuddyLanguageLocaleFlow *)v10 classList];
  id v6 = [(BuddyLanguageLocaleFlow *)v10 navigationController];
  id v7 = [v6 topViewController];
  char v8 = [v5 containsObject:objc_opt_class()] ^ 1;

  if ((v8 & 1) == 0) {
    [(BuddyLanguageLocaleFlow *)v10 flowItemDone:v10 nextItem:0];
  }
  objc_storeStrong(location, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [(BuddyLanguageLocaleFlow *)v6 dataSource];
  [(BuddyLanguageLocaleDataSource *)v3 userSelectedLanguage:location[0]];

  id v4 = [(BuddyLanguageLocaleFlow *)v6 receiver];
  [(BuddyLanguageLocaleSelectionReceiver *)v4 userSelectedLanguage:location[0]];

  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = [(BuddyLanguageLocaleFlow *)v12 receiver];
  unsigned __int8 v8 = [(BuddyLanguageLocaleSelectionReceiver *)v7 userSelectedLanguageWithLocale:location[0] countryCode:v10 localePaneScrollOffset:a5];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (void)languageCompositeUpdated
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = +[NSMutableArray array];
  id v2 = [(BuddyLanguageLocaleFlow *)v20 controllers];
  id v3 = [v2 count];

  if (v3)
  {
    id v4 = [(BuddyLanguageLocaleFlow *)v20 controllers];
    [location[0] addObjectsFromArray:v4];
  }
  id v5 = [(BuddyLanguageLocaleFlow *)v20 navigationController];
  id v6 = [v5 viewControllers];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(BuddyLanguageLocaleFlow *)v20 navigationController];
    id v9 = [v8 viewControllers];
    [location[0] addObjectsFromArray:v9];
  }
  memset(__b, 0, sizeof(__b));
  id v10 = location[0];
  id v11 = [v10 countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v11; ++i)
      {
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(v10);
        }
        id v18 = *(id *)(__b[1] + 8 * i);
        if ([v18 conformsToProtocol:&OBJC_PROTOCOL___BuddyLanguageDependencyReceiver])
        {
          id v16 = v18;
          id v14 = [(BuddyLanguageLocaleFlow *)v20 dataSource];
          id v15 = [(BuddyLanguageLocaleDataSource *)v14 languageComposite];
          [v16 setLanguageComposite:v15];

          objc_storeStrong(&v16, 0);
        }
      }
      id v11 = [v10 countByEnumeratingWithState:__b objects:v21 count:16];
    }
    while (v11);
  }

  objc_storeStrong(location, 0);
}

- (BuddyLanguageLocaleSelectionReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  self->_receiver = (BuddyLanguageLocaleSelectionReceiver *)a3;
}

- (BOOL)languageSet
{
  return self->_languageSet;
}

- (void)setLanguageSet:(BOOL)a3
{
  self->_languageSet = a3;
}

- (BOOL)isResumingFromLanguageReboot
{
  return self->_resumingFromLanguageReboot;
}

- (void)setResumingFromLanguageReboot:(BOOL)a3
{
  self->_resumingFromLanguageReboot = a3;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (BuddyLanguageLocaleDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BuddyLanguageChangeObserver)languageChangeObserver
{
  return self->_languageChangeObserver;
}

- (void)setLanguageChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
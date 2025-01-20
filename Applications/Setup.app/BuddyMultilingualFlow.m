@interface BuddyMultilingualFlow
+ (BOOL)controllerNeedsToRun;
+ (id)allowedFlowItems;
- (BYDeviceProvider)expressFlowCustomizable;
- (BuddyMultilingualDataModelProvider)dictationProvider;
- (BuddyMultilingualDataModelProviderCollection)providerCollection;
- (ProximitySetupController)proximitySetupController;
- (id)classList;
- (id)firstItem;
- (void)_writeOutDictationDefaults;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)injectItemIfNeeded:(id)a3 forClass:(Class)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDictationProvider:(id)a3;
- (void)setExpressFlowCustomizable:(id)a3;
- (void)setProviderCollection:(id)a3;
- (void)setProximitySetupController:(id)a3;
@end

@implementation BuddyMultilingualFlow

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun() ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMultilingualFlow *)v34 proximitySetupController];
  unsigned __int8 v4 = [(ProximitySetupController *)v3 hasAppliedSettings];

  char v32 = v4 & 1;
  char v31 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers] & 1;
  char v30 = 0;
  char v5 = 0;
  if ((v4 & 1) == 0) {
    char v5 = v31 ^ 1;
  }
  char v30 = v5 & 1;
  id v29 = objc_retainBlock(&stru_1002B3F18);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = (id)(*((uint64_t (**)(id, void))v29 + 2))(v29, v30 & 1);
    id v25 = (id)(*((uint64_t (**)(id, void))v29 + 2))(v29, v32 & 1);
    id v24 = (id)(*((uint64_t (**)(id, void))v29 + 2))(v29, v31 & 1);
    sub_100177800((uint64_t)buf, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24);
    _os_log_impl((void *)&_mh_execute_header, oslog, v27, "BuddyMultilingualFlow needs to run %{public}@ because proximityFlag was %{public}@, shared iPad flag was %{public}@", buf, 0x20u);

    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v30)
  {
    id v22 = +[BuddyMultilingualDataModelProvider instanceForKeyboardSelector];
    id v21 = +[BuddyMultilingualDataModelProvider instanceForDictationSelectorExpress];
    id v6 = +[BuddyMultilingualDataModelProvider instanceForDictationSelector];
    [(BuddyMultilingualFlow *)v34 setDictationProvider:v6];

    v7 = [[BuddyMultilingualDataModelProviderCollection alloc] initWithKeyboardProvider:v22 withDictationProvider:v21];
    [(BuddyMultilingualFlow *)v34 setProviderCollection:v7];

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v8 = +[NSArray arrayWithObjects:v36 count:3];
    [(BuddyMultilingualFlow *)v34 setClassList:v8];

    char v20 = 0;
    id v9 = [(BuddyMultilingualFlow *)v34 starter];
    unsigned __int8 v10 = 0;
    if ([v9 controllerNeedsToRunForClass:objc_opt_class()]) {
      unsigned __int8 v10 = +[BuddyKeyboardLanguageOrderSelector needsFullscreenPane];
    }

    char v20 = v10 & 1;
    char v19 = 0;
    id v11 = [(BuddyMultilingualFlow *)v34 starter];
    unsigned __int8 v12 = 0;
    if ([v11 controllerNeedsToRunForClass:objc_opt_class()]) {
      unsigned __int8 v12 = +[BuddyDictationLanguageOrderSelector needsFullscreenPane];
    }

    char v19 = v12 & 1;
    char v18 = 0;
    char v13 = 1;
    if ((v20 & 1) == 0) {
      char v13 = v19;
    }
    char v18 = v13;
    if ((v13 & 1) == 0) {
      [(BuddyMultilingualFlow *)v34 _writeOutDictationDefaults];
    }
    id v17 = objc_alloc_init((Class)NSMutableArray);
    if (v20) {
      [v17 addObject:@"Keyboards"];
    }
    if (v19) {
      [v17 addObject:@"Dictation"];
    }
    os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v17 componentsJoinedByString:@", "];
      sub_10004B238((uint64_t)v35, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, v16, v15, "Language settings available for customization: %@", v35, 0xCu);

      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong((id *)&v16, 0);
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], v18 & 1);
    }
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    int v23 = 0;
  }
  else
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v23 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (id)classList
{
  id location[2] = self;
  location[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyMultilingualFlow;
  location[0] = [(BuddyMultilingualFlow *)&v9 classList];
  if (![location[0] count])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v7 = 17;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      v2 = oslog;
      os_log_type_t v3 = v7;
      sub_10004B24C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "BuddyMultilingualFlow failed to set initial classList", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)firstItem
{
  id v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualFlow;
  location[0] = [(BuddyMultilingualFlow *)&v4 firstItem];
  [(BuddyMultilingualFlow *)v6 injectItemIfNeeded:location[0] forClass:objc_opt_class()];
  id v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  unsigned __int8 v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (char v5 = [(BuddyMultilingualFlow *)v12 providerCollection],
        char v6 = ![(BuddyMultilingualDataModelProviderCollection *)v5 expressFlowDidCustomize],
        v5,
        (v6 & 1) != 0))
  {
    v9.receiver = v12;
    v9.super_class = (Class)BuddyMultilingualFlow;
    [(BuddyMultilingualFlow *)&v9 flowItemDone:location[0] nextItem:0];
    int v8 = 1;
  }
  else
  {
    [(BuddyMultilingualFlow *)v12 injectItemIfNeeded:v10 forClass:objc_opt_class()];
    v7.receiver = v12;
    v7.super_class = (Class)BuddyMultilingualFlow;
    [(BuddyMultilingualFlow *)&v7 flowItemDone:location[0] nextItem:v10];
    int v8 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)injectItemIfNeeded:(id)a3 forClass:(Class)a4
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v11 = a4;
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyMultilingualDataModelInjectable])
  {
    id v10 = location[0];
    if (v11 == (Class)objc_opt_class())
    {
      char v5 = [(BuddyMultilingualFlow *)v13 providerCollection];
      char v6 = [(BuddyMultilingualDataModelProviderCollection *)v5 keyboardProvider];
      [v10 setProvider:v6];
    }
    else if (v11 == (Class)objc_opt_class())
    {
      objc_super v7 = [(BuddyMultilingualFlow *)v13 dictationProvider];
      [v10 setProvider:v7];
    }
    objc_storeStrong(&v10, 0);
  }
  else if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyMultilingualDataModelCollectionInjectable])
  {
    id v9 = location[0];
    int v8 = [(BuddyMultilingualFlow *)v13 providerCollection];
    [v9 setProviderCollection:v8];

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

- (void)_writeOutDictationDefaults
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = +[BuddyMultilingualDataModelProvider instanceForDictationSelectorExpress];
  id v2 = [location[0] createDataSourceForPreselectedItems];
  +[BuddyDictationLanguageOrderSelector writePreferredDictationLanguagesToSystem:v2];

  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYDeviceProvider)expressFlowCustomizable
{
  return self->_expressFlowCustomizable;
}

- (void)setExpressFlowCustomizable:(id)a3
{
}

- (BuddyMultilingualDataModelProviderCollection)providerCollection
{
  return self->_providerCollection;
}

- (void)setProviderCollection:(id)a3
{
}

- (BuddyMultilingualDataModelProvider)dictationProvider
{
  return self->_dictationProvider;
}

- (void)setDictationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
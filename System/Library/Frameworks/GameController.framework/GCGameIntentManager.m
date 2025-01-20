@interface GCGameIntentManager
+ (id)instance;
- (GCGameIntentManager)init;
- (id)stringForCategory:(unint64_t)a3;
- (void)dealloc;
- (void)launchToSpringboard;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)stepToNextCategory;
- (void)toggleGamesFolder;
- (void)toggleGamesFolderAndDismissOnly:(BOOL)a3;
- (void)tryPresentAppLibraryPod;
@end

@implementation GCGameIntentManager

+ (id)instance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __31__GCGameIntentManager_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher_0 != -1) {
    dispatch_once(&instance_dispatcher_0, block);
  }
  v2 = (void *)instance_sharedInstance_0;

  return v2;
}

void __31__GCGameIntentManager_instance__block_invoke(uint64_t a1)
{
  if (currentProcessIsGameControllerDaemon()) {
    id v2 = objc_alloc_init(*(Class *)(a1 + 32));
  }
  else {
    id v2 = 0;
  }
  v3 = (void *)instance_sharedInstance_0;
  instance_sharedInstance_0 = (uint64_t)v2;
}

- (GCGameIntentManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)GCGameIntentManager;
  id v2 = [(GCGameIntentManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"GCGameIntentEnable" options:5 context:0];
    v2->_BOOL enabled = 1;
    v5 = [(NSUserDefaults *)v2->_defaults objectForKey:@"GCGameIntentEnable"];

    if (v5) {
      v2->_BOOL enabled = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"GCGameIntentEnable"];
    }
    v6 = (SBSHomeScreenService *)objc_alloc_init((Class)&off_26D2C4050);
    service = v2->_service;
    v2->_service = v6;

    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL enabled = v2->_enabled;
        *(_DWORD *)buf = 67109120;
        BOOL v13 = enabled;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "GCGameIntentManager BOOL enabled = %d", buf, 8u);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_defaults removeObserver:self forKeyPath:@"GCGameIntentEnable"];
  v3.receiver = self;
  v3.super_class = (Class)GCGameIntentManager;
  [(GCGameIntentManager *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  objc_super v11 = (NSUserDefaults *)a4;
  id v12 = a5;
  if (self->_defaults == v11 && [v10 isEqualToString:@"GCGameIntentEnable"])
  {
    self->_BOOL enabled = [(NSUserDefaults *)self->_defaults BOOLForKey:@"GCGameIntentEnable"];
    if (gc_isInternalBuild())
    {
      BOOL v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL enabled = self->_enabled;
        *(_DWORD *)buf = 67109120;
        BOOL v17 = enabled;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "GCGameIntentManager BOOL enabled = %d", buf, 8u);
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GCGameIntentManager;
    [(GCGameIntentManager *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)stepToNextCategory
{
  unint64_t currentCategory = self->_currentCategory;
  unint64_t v4 = 1000;
  uint64_t v5 = 2;
  if (currentCategory != 1000) {
    uint64_t v5 = 0;
  }
  if (currentCategory != 6014) {
    unint64_t v4 = v5;
  }
  if (currentCategory == 2) {
    unint64_t v4 = 0;
  }
  self->_unint64_t currentCategory = v4;
  if (gc_isInternalBuild())
  {
    v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = self->_currentCategory;
      int v8 = 134218240;
      unint64_t v9 = currentCategory;
      __int16 v10 = 2048;
      unint64_t v11 = v7;
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "Stepping to next category: %lu -> %lu", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)stringForCategory:(unint64_t)a3
{
  objc_super v3 = @"Games";
  unint64_t v4 = @"N/A";
  if (a3 == 1000) {
    unint64_t v4 = @"Games (alt)";
  }
  if (a3 != 6014) {
    objc_super v3 = v4;
  }
  if (a3 == 2) {
    return @"Arcade";
  }
  else {
    return v3;
  }
}

- (void)tryPresentAppLibraryPod
{
  service = self->_service;
  unint64_t v4 = +[NSString stringWithFormat:@"%lu", self->_currentCategory];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke;
  v5[3] = &unk_26D22B9F0;
  v5[4] = self;
  [(SBSHomeScreenService *)service presentAppLibraryCategoryPodForCategoryIdentifier:v4 completion:v5];
}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      v14 = getGCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "Error trying to present library pod: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    uint64_t v4 = [v3 code];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4 == 9)
    {
      [*(id *)(v5 + 32) dismissAppLibraryWithCompletion:&__block_literal_global_16];
      goto LABEL_17;
    }
    if (*(void *)(v5 + 24))
    {
      if ([v3 code] == 4)
      {
        if (gc_isInternalBuild())
        {
          objc_super v15 = getGCLogger();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [*(id *)(a1 + 32) stringForCategory:*(void *)(*(void *)(a1 + 32) + 24)];
            int v19 = 138412290;
            id v20 = v16;
            _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_DEFAULT, "%@ lookup failed - stepping to next category and trying again!", (uint8_t *)&v19, 0xCu);
          }
        }
        [*(id *)(a1 + 32) stepToNextCategory];
LABEL_16:
        [*(id *)(a1 + 32) tryPresentAppLibraryPod];
        goto LABEL_17;
      }
      if ([v3 code] == 2)
      {
        if (gc_isInternalBuild())
        {
          BOOL v17 = getGCLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [*(id *)(a1 + 32) stringForCategory:*(void *)(*(void *)(a1 + 32) + 24)];
            int v19 = 138412290;
            id v20 = v18;
            _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "%@ not on the home screen! Dismissing frontmost application and trying again...", (uint8_t *)&v19, 0xCu);
          }
        }
        SBSSuspendFrontmostApplication();
        goto LABEL_16;
      }
      uint64_t v7 = [v3 code];
      int isInternalBuild = gc_isInternalBuild();
      if (v7 == 9)
      {
        if (!isInternalBuild) {
          goto LABEL_17;
        }
        unint64_t v9 = getGCLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = [*(id *)(a1 + 32) stringForCategory:*(void *)(*(void *)(a1 + 32) + 24)];
          int v19 = 138412290;
          id v20 = v10;
          unint64_t v11 = "%@ library is already presented!";
          id v12 = v9;
          uint32_t v13 = 12;
LABEL_25:
          _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, v13);
        }
      }
      else
      {
        if (!isInternalBuild) {
          goto LABEL_17;
        }
        unint64_t v9 = getGCLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = [*(id *)(a1 + 32) stringForCategory:*(void *)(*(void *)(a1 + 32) + 24)];
          int v19 = 138412546;
          id v20 = v10;
          __int16 v21 = 2112;
          id v22 = v3;
          unint64_t v11 = "Presented %@ library! %@";
          id v12 = v9;
          uint32_t v13 = 22;
          goto LABEL_25;
        }
      }

      goto LABEL_17;
    }
    if (gc_isInternalBuild())
    {
      v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "Current category == ATXAppDirectoryCategoryIDSpecialMin. Unable to open library pod.", (uint8_t *)&v19, 2u);
      }
    }
  }
LABEL_17:
}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_110(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_110_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)toggleGamesFolder
{
}

- (void)toggleGamesFolderAndDismissOnly:(BOOL)a3
{
  if (self->_enabled)
  {
    uint64_t v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      if (gc_isInternalBuild())
      {
        int v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "Toggling games library...", buf, 2u);
        }
      }
      service = self->_service;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __55__GCGameIntentManager_toggleGamesFolderAndDismissOnly___block_invoke;
      v9[3] = &unk_26D22BC38;
      BOOL v10 = a3;
      v9[4] = self;
      [(SBSHomeScreenService *)service dismissAppLibraryWithCompletion:v9];
    }
  }
}

void __55__GCGameIntentManager_toggleGamesFolderAndDismissOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        id v6 = v3;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "Unable to dismiss app library: %@", (uint8_t *)&v5, 0xCu);
      }
    }
    if ([v3 code] == 7 && !*(unsigned char *)(a1 + 40))
    {
      *(void *)(*(void *)(a1 + 32) + 24) = 6014;
      [*(id *)(a1 + 32) tryPresentAppLibraryPod];
    }
  }
}

- (void)launchToSpringboard
{
  if (self->_enabled)
  {
    id v2 = +[UIDevice currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if (v3 == 1)
    {
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v5 = 0;
          _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "Suspending the frontmost application...", v5, 2u);
        }
      }
      SBSSuspendFrontmostApplication();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_110_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "Unable to dismiss app library: %@", (uint8_t *)&v2, 0xCu);
}

@end
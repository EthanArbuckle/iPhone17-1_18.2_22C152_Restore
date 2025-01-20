@interface ACUIAppInstaller
+ (id)currentStoreFront;
- (ACUIAppInstallerDelegate)delegate;
- (BOOL)_isGreenTeaAvailable;
- (BOOL)_quicklyGenerateCachedReachabilityResultConsideringPublisherURL:(BOOL)a3;
- (BOOL)isAvailableInStore;
- (BOOL)isDownloadable;
- (BOOL)isInstalled;
- (BOOL)requiresReachabilityCheckToDetermineDownloadability;
- (NSURL)publisherURL;
- (id)initForAppWithDescription:(id)a3;
- (void)_performAvailabilityCheck:(id)a3;
- (void)_performReachabilityCheck:(id)a3;
- (void)_setAvailableInStoreResult:(BOOL)a3;
- (void)_setCachedReachabilityResult:(BOOL)a3;
- (void)checkAvailabilityInStore:(id)a3;
- (void)fetchDownloadability:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPublisherURL:(id)a3;
- (void)start;
@end

@implementation ACUIAppInstaller

- (id)initForAppWithDescription:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)ACUIAppInstaller;
  v9 = [(ACUIAppInstaller *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, location[0]);
    v6 = [(ACUIAppDescription *)v9->_app bundleID];

    if (v6)
    {
      v9->_availableInStoreResult = 1;
      v9->_needsAvailableInStoreCheck = 1;
    }
    else
    {
      v9->_availableInStoreResult = 0;
      v9->_needsAvailableInStoreCheck = 0;
    }
    [(ACUIAppInstaller *)v9 _quicklyGenerateCachedReachabilityResultConsideringPublisherURL:0];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)isInstalled
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21 = self;
  SEL v20 = a2;
  v2 = [(ACUIAppDescription *)self->_app bundleID];
  BOOL v14 = v2 != 0;

  if (v14)
  {
    BOOL v3 = v21->_dateOfLastInstallationCheck == 0;
    char v18 = 0;
    BOOL v13 = 1;
    if (!v3)
    {
      id v19 = (id)[MEMORY[0x1E4F1C9C8] date];
      char v18 = 1;
      [v19 timeIntervalSinceDate:v21->_dateOfLastInstallationCheck];
      BOOL v13 = v4 > 20.0;
    }
    if (v18) {

    }
    if (v13)
    {
      os_log_t oslog = (os_log_t)_ACUILogSystem();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(ACUIAppDescription *)v21->_app name];
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v24, (uint64_t)"-[ACUIAppInstaller isInstalled]", 56, (uint64_t)v12);
        _os_log_impl(&dword_1DDFE5000, oslog, type, "%s (%d) \"Installation check for app %@ hasn't been done in a while.\"", v24, 0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
      dateOfLastInstallationCheck = v21->_dateOfLastInstallationCheck;
      v21->_dateOfLastInstallationCheck = v5;

      id v11 = (id)[MEMORY[0x1E4F223E0] defaultWorkspace];
      v10 = [(ACUIAppDescription *)v21->_app bundleID];
      char v7 = objc_msgSend(v11, "applicationIsInstalled:");
      v21->_resultOfLastInstallationCheck = v7 & 1;

      os_log_t v15 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v9 = [(ACUIAppDescription *)v21->_app bundleID];
        __os_log_helper_16_2_4_8_32_4_0_8_64_4_0((uint64_t)v23, (uint64_t)"-[ACUIAppInstaller isInstalled]", 61, (uint64_t)v9, v21->_resultOfLastInstallationCheck);
        _os_log_debug_impl(&dword_1DDFE5000, v15, OS_LOG_TYPE_DEBUG, "%s (%d) \"Installation lookup result for bundle ID %@: %d\"", v23, 0x22u);
      }
      objc_storeStrong((id *)&v15, 0);
    }
    return v21->_resultOfLastInstallationCheck;
  }
  else
  {
    return 0;
  }
}

- (void)_setCachedReachabilityResult:(BOOL)a3
{
  BOOL v6 = a3 != self->_cachedReachabilityResult;
  self->_cachedReachabilityResult = a3;
  if (v6)
  {
    double v4 = [(ACUIAppInstaller *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v3 = [(ACUIAppInstaller *)self delegate];
      [(ACUIAppInstallerDelegate *)v3 appIsDownloadableDidChange:self];
    }
  }
}

- (BOOL)_isGreenTeaAvailable
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8 = self;
  SEL v7 = a2;
  char v5 = MGGetBoolAnswer() & 1;
  char v6 = v5;
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      v2 = @"YES";
    }
    else {
      v2 = @"NO";
    }
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v9, (uint64_t)"-[ACUIAppInstaller _isGreenTeaAvailable]", 125, (uint64_t)v2);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"System reports having Green Tea capability as: %@\"", v9, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v6 & 1;
}

- (BOOL)_quicklyGenerateCachedReachabilityResultConsideringPublisherURL:(BOOL)a3
{
  BOOL v7 = a3;
  BOOL v3 = [(ACUIAppDescription *)self->_app persistentID];
  BOOL v5 = v3 != 0;

  if (v5)
  {
    if ((!v7 || self->_publisherURL) && [(ACUIAppInstaller *)self _isGreenTeaAvailable])
    {
      return 0;
    }
    else
    {
      [(ACUIAppInstaller *)self _setCachedReachabilityResult:1];
      return 1;
    }
  }
  else
  {
    [(ACUIAppInstaller *)self _setCachedReachabilityResult:0];
    return 1;
  }
}

- (void)_performReachabilityCheck:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = (id)[MEMORY[0x1E4F290D0] requestWithURL:v19->_publisherURL];
  id v16 = _ACUILogSystem();
  os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = [(NSURL *)v19->_publisherURL absoluteString];
    double v4 = [(ACUIAppDescription *)v19->_app name];
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v20, (uint64_t)"-[ACUIAppInstaller _performReachabilityCheck:]", 152, (uint64_t)v5, (uint64_t)v4);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v16, v15, "%s (%d) \"Contacting %@ to verify reachability of %@\"", v20, 0x26u);
  }
  objc_storeStrong(&v16, 0);
  objc_initWeak(&v14, v19);
  queue = dispatch_get_global_queue(0, 0);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __46__ACUIAppInstaller__performReachabilityCheck___block_invoke;
  uint64_t v10 = &unk_1E6D1FD80;
  id v11 = v17;
  objc_copyWeak(&v13, &v14);
  id v12 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __46__ACUIAppInstaller__performReachabilityCheck___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v13[0] = 0;
  id v12 = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  id v11 = 0;
  id v10 = 0;
  id v2 = (id)[MEMORY[0x1E4F29090] sendSynchronousRequest:v1 returningResponse:&v11 error:&v10];
  objc_storeStrong(v13, v11);
  objc_storeStrong(&v12, v10);
  id v9 = _ACUILogSystem();
  os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13[0], "statusCode"));
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v14, (uint64_t)"-[ACUIAppInstaller _performReachabilityCheck:]_block_invoke", 160, (uint64_t)v4);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v9, v8, "%s (%d) \"Reachability check response had HTTP status code: %@\"", v14, 0x1Cu);
  }
  objc_storeStrong(&v9, 0);
  BOOL v7 = 0;
  BOOL v3 = 0;
  if (!v12) {
    BOOL v3 = [v13[0] statusCode] == 200;
  }
  BOOL v7 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setCachedReachabilityResult:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
}

- (BOOL)requiresReachabilityCheckToDetermineDownloadability
{
  BOOL v3 = 0;
  if (self->_publisherURL) {
    return [(ACUIAppInstaller *)self _isGreenTeaAvailable];
  }
  return v3;
}

- (BOOL)isDownloadable
{
  return self->_cachedReachabilityResult;
}

- (void)fetchDownloadability:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(ACUIAppInstaller *)v15 _quicklyGenerateCachedReachabilityResultConsideringPublisherURL:1])
  {
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v15->_cachedReachabilityResult);
  }
  else
  {
    char v13 = 0;
    obj = v15;
    objc_sync_enter(obj);
    BOOL v3 = v15->_dateOfLastReachabilityCheck == 0;
    char v11 = 0;
    BOOL v9 = 1;
    if (!v3)
    {
      id v12 = (id)[MEMORY[0x1E4F1C9C8] date];
      char v11 = 1;
      [v12 timeIntervalSinceDate:v15->_dateOfLastReachabilityCheck];
      BOOL v9 = v4 > 60.0;
    }
    if (v11) {

    }
    if (v9)
    {
      char v13 = 1;
      os_log_t oslog = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = [(ACUIAppDescription *)v15->_app name];
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v16, (uint64_t)"-[ACUIAppInstaller fetchDownloadability:]", 195, (uint64_t)v7);
        _os_log_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Reachability check for app %@ hasn't been done in a while.\"", v16, 0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      BOOL v5 = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
      dateOfLastReachabilityCheck = v15->_dateOfLastReachabilityCheck;
      v15->_dateOfLastReachabilityCheck = v5;
    }
    objc_sync_exit(obj);

    if (v13) {
      [(ACUIAppInstaller *)v15 _performReachabilityCheck:location[0]];
    }
    else {
      (*((void (**)(id, BOOL))location[0] + 2))(location[0], v15->_cachedReachabilityResult);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v18 = self;
  location[1] = (id)a2;
  id v2 = [(ACUIAppDescription *)self->_app persistentID];
  BOOL v8 = v2 != 0;

  if (v8)
  {
    location[0] = _ACUILogSystem();
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      BOOL v7 = [(ACUIAppDescription *)v18->_app name];
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v19, (uint64_t)"-[ACUIAppInstaller start]", 217, (uint64_t)v7);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)location[0], v16, "%s (%d) \"ACUIApplication %@ will begin downloading.\"", v19, 0x1Cu);
    }
    objc_storeStrong(location, 0);
    BOOL v3 = [(ACUIAppInstaller *)v18 delegate];
    [(ACUIAppInstallerDelegate *)v3 appInstallerWillStart:v18];

    id v15 = objc_alloc_init(MEMORY[0x1E4FA81D0]);
    id v4 = v15;
    BOOL v5 = [(ACUIAppDescription *)v18->_app persistentID];
    objc_msgSend(v4, "setValue:forParameter:");

    id v6 = v15;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __25__ACUIAppInstaller_start__block_invoke;
    char v13 = &unk_1E6D1FDC8;
    id v14 = v18;
    [v6 startWithItemLookupBlock:&v9];
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v15, 0);
  }
}

void __25__ACUIAppInstaller_start__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v26 = 0;
  objc_storeStrong(&v26, a3);
  v25[1] = a1;
  if (location[0] && [location[0] count] == 1)
  {
    v25[0] = _ACUILogSystem();
    os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v25[0], OS_LOG_TYPE_DEBUG))
    {
      id v15 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "count"));
      id v14 = (id)[*(id *)(a1[4] + 8) persistentID];
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v31, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 226, (uint64_t)v15, (uint64_t)v14);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v25[0], v24, "%s (%d) \"%@ items matching PID %@ found.\"", v31, 0x26u);
    }
    objc_storeStrong(v25, 0);
    id v23 = (id)[location[0] objectAtIndexedSubscript:0];
    id v10 = (id)[v23 ITunesStoreIdentifier];
    id v9 = (id)[v10 stringValue];
    int v11 = (void *)[v9 UTF8String];

    v22[2] = v11;
    id v12 = (id)[v23 valueForProperty:@"bundle-id"];
    char v13 = (void *)[v12 UTF8String];

    v22[1] = v13;
    uint64_t v3 = SBSSpringBoardServerPort();
    MEMORY[0x1E01CBA60](v3, v11, v13);
    v22[0] = _ACUILogSystem();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v30, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 237);
      _os_log_impl(&dword_1DDFE5000, (os_log_t)v22[0], v21, "%s (%d) \"Suspending current application to begin app install!\"", v30, 0x12u);
    }
    objc_storeStrong(v22, 0);
    id v6 = (id)[MEMORY[0x1E4F42738] sharedApplication];
    [v6 suspend];

    id v4 = objc_alloc(MEMORY[0x1E4FA8270]);
    uint64_t v20 = [v4 initWithItem:v23];
    id v7 = objc_alloc(MEMORY[0x1E4FA8278]);
    uint64_t v29 = v20;
    id v8 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    id v19 = (id)objc_msgSend(v7, "initWithPurchases:");

    [v19 start];
    objc_storeStrong(&v19, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)[*(id *)(a1[4] + 8) persistentID];
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 245, (uint64_t)v5);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"SS lookup failed to find an item for the app with PID: %@\"", v28, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)_setAvailableInStoreResult:(BOOL)a3
{
  BOOL v7 = a3 != self->_availableInStoreResult;
  self->_availableInStoreResult = a3;
  self->_needsAvailableInStoreCheck = 0;
  char v5 = 0;
  char v4 = 0;
  if (v7)
  {
    id v6 = [(ACUIAppInstaller *)self delegate];
    char v5 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  if (v5) {

  }
  if (v4)
  {
    uint64_t v3 = [(ACUIAppInstaller *)self delegate];
    [(ACUIAppInstallerDelegate *)v3 appIsAvailableInStoreDidChange:self];
  }
}

- (void)_performAvailabilityCheck:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  os_log_type_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = objc_alloc_init(MEMORY[0x1E4FA81F0]);
  char v5 = [(ACUIAppDescription *)v16->_app bundleID];
  v17[0] = v5;
  id v4 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  objc_msgSend(v14, "setValue:forRequestParameter:");

  [v14 setKeyProfile:*MEMORY[0x1E4FA86D0]];
  [v14 setLocalizationStyle:0];
  objc_initWeak(&from, v16);
  id v3 = v14;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __46__ACUIAppInstaller__performAvailabilityCheck___block_invoke;
  id v10 = &unk_1E6D1FDF0;
  objc_copyWeak(&v12, &from);
  id v11 = location[0];
  [v3 startWithLookupBlock:&v6];
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __46__ACUIAppInstaller__performAvailabilityCheck___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v13 = 0;
  objc_storeStrong(&v13, a3);
  uint64_t v12 = a1;
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  BOOL v5 = 0;
  if (!v13)
  {
    BOOL v5 = 0;
    if (location[0])
    {
      id v10 = (id)[location[0] allItems];
      char v9 = 1;
      BOOL v5 = 0;
      if (v10)
      {
        id v8 = (id)[location[0] allItems];
        char v7 = 1;
        BOOL v5 = [v8 count] != 0;
      }
    }
  }
  if (v7) {

  }
  if (v9) {
  if (v5)
  }
    char v11 = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setAvailableInStoreResult:v11 & 1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAvailableInStore
{
  return self->_availableInStoreResult;
}

- (void)checkAvailabilityInStore:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_needsAvailableInStoreCheck) {
    [(ACUIAppInstaller *)v4 _performAvailabilityCheck:location[0]];
  }
  else {
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v4->_availableInStoreResult);
  }
  objc_storeStrong(location, 0);
}

+ (id)currentStoreFront
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  id v8 = (id)[MEMORY[0x1E4FA8140] currentDevice];
  id v12 = (id)[v8 storeFrontIdentifier];

  if (v12)
  {
    id v7 = (id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-,"];
    uint64_t v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:");
    uint64_t v11 = v2;

    if (v11)
    {
      id v3 = (id)[v12 substringToIndex:v10];
      id v4 = location[0];
      location[0] = v3;
    }
    else
    {
      objc_storeStrong(location, v12);
    }
  }
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v14, (uint64_t)"+[ACUIAppInstaller currentStoreFront]", 316, (uint64_t)v12, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIAppInstaller currentStoreFront started with identifier '%@' and is returning storeFront '%@'\"", v14, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = location[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (NSURL)publisherURL
{
  return self->_publisherURL;
}

- (void)setPublisherURL:(id)a3
{
}

- (ACUIAppInstallerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACUIAppInstallerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
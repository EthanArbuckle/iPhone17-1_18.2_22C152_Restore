@interface CKContextContentProviderManager
+ (BOOL)isSafariContentProvider;
+ (BOOL)isSpringBoard;
+ (id)sharedManager;
+ (unint64_t)optionsForControlCode:(unsigned __int8)a3;
+ (unsigned)controlCodeForNonce:(unint64_t)a3;
+ (void)_observeApplicationStateNotifications;
- (BOOL)_hasQueuedForReportingActivity:(id)a3;
- (BOOL)_isActivityReportingAllowedForCurrentBundleIdentifier:(id)a3;
- (BOOL)_isDonationAllowedWithControlCode:(unsigned __int8)a3;
- (CKContextContentProviderManager)init;
- (id)_formContextUserActivityFromUserActivity:(id)a3;
- (unint64_t)providerCount;
- (void)_dequeueActivityForReporting:(id)a3;
- (void)_hasForegroundActiveContentWithReply:(id)a3;
- (void)_loadContextKitIfNecessaryWithExecutor:(id)a3;
- (void)_prepareAndDonateUserActivity:(id)a3;
- (void)_prepareAndExtractContentForUserActivity:(id)a3 bundleIdentifier:(id)a4;
- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 andReply:(id)a6;
- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 requiringMainQueue:(BOOL)a6 andReply:(id)a7;
- (void)_queueActivityForReporting:(id)a3;
- (void)addProvider:(id)a3;
- (void)removeProvider:(id)a3;
- (void)scheduleUserActivityRecordingWithUserActivity:(id)a3;
- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4;
- (void)userActivityWasCreated:(id)a3;
- (void)userActivityWasInvalidated:(id)a3;
@end

@implementation CKContextContentProviderManager

uint64_t __89__CKContextContentProviderManager__isActivityReportingAllowedForCurrentBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) hasPrefix:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (void)userActivityWasCreated:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v7 = v3;
    if ([v3 isEligibleForPrediction])
    {
      v4 = [MEMORY[0x1E4F28B50] mainBundle];
      v5 = [v4 bundleIdentifier];

      if ([&unk_1F0E605F8 containsObject:v5])
      {
        v6 = +[CKContextContentProviderManager sharedManager];
        [v6 scheduleUserActivityRecordingWithUserActivity:v7];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[CKContextContentProviderManager sharedManager];
    [v5 scheduleUserActivityRecordingWithUserActivity:v4];
  }
}

- (BOOL)_isActivityReportingAllowedForCurrentBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E60610];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__CKContextContentProviderManager__isActivityReportingAllowedForCurrentBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6110F48;
  id v5 = v3;
  id v8 = v5;
  v9 = &v10;
  [v4 enumerateObjectsUsingBlock:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)scheduleUserActivityRecordingWithUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 bundleIdentifier];

  if ([(CKContextContentProviderManager *)v5 _isActivityReportingAllowedForCurrentBundleIdentifier:v7]&& ([(NSMutableArray *)v5->_userActivitiesQueuedForReporting containsObject:v4] & 1) == 0)
  {
    objc_initWeak(&location, v5);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __81__CKContextContentProviderManager_scheduleUserActivityRecordingWithUserActivity___block_invoke;
    v16 = &unk_1E6110E60;
    objc_copyWeak(&v19, &location);
    id v8 = v4;
    id v17 = v8;
    id v18 = v7;
    dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, &v13);
    -[CKContextContentProviderManager _loadContextKitIfNecessaryWithExecutor:](v5, "_loadContextKitIfNecessaryWithExecutor:", 0, v13, v14, v15, v16);
    [(CKContextContentProviderManager *)v5 _queueActivityForReporting:v8];
    LODWORD(v8) = isSafariContentProvider;
    unint64_t v10 = [(NSMutableArray *)v5->_userActivitiesQueuedForReporting count];
    double v11 = 3.0;
    if (v8) {
      double v11 = 5.0;
    }
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * (double)v10 * 1000000000.0));
    dispatch_after(v12, MEMORY[0x1E4F14428], v9);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v5);
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_instance;

  return v2;
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke(uint64_t a1)
{
  v2 = getprogname();
  id v3 = v2;
  if (v2 && !strncmp(v2, "SafariViewService", 0x11uLL))
  {
    isSafariContentProvider = 1;
    [*(id *)(a1 + 32) _observeApplicationStateNotifications];
  }
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];

  if ([v5 isEqualToString:@"com.apple.mobilesafari"])
  {
    v6 = &isSafariContentProvider;
LABEL_8:
    char *v6 = 1;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"com.apple.springboard"])
  {
    v6 = &isSpringBoard;
    goto LABEL_8;
  }
LABEL_9:
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)[[NSString alloc] initWithUTF8String:v3];
  }
  id v8 = (void *)donationBundleIdentifier;
  donationBundleIdentifier = (uint64_t)v7;

  if ([&unk_1F0E605E0 containsObject:v5]) {
    goto LABEL_24;
  }
  dispatch_block_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v10 = [v9 objectForInfoDictionaryKey:@"UIContentTextExtractionEnabled"];
  double v11 = v10;
  if (!v10) {
    unint64_t v10 = (void *)MEMORY[0x1E4F1CC38];
  }
  char v12 = [v10 BOOLValue];

  if ((v12 & 1) == 0)
  {
LABEL_24:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Donations not allowed from this process. Setup aborted.", buf, 2u);
    }
  }
  else
  {
    uint64_t v13 = objc_alloc_init(CKContextContentProviderManager);
    uint64_t v14 = (void *)sharedManager_instance;
    sharedManager_instance = (uint64_t)v13;

    v15 = (const char *)[@"com.apple.contextkit.content-request" UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke_13;
    handler[3] = &__block_descriptor_40_e8_v12__0i8l;
    handler[4] = *(void *)(a1 + 32);
    uint32_t v16 = notify_register_dispatch(v15, &kContentTextExtractionNotificationToken, MEMORY[0x1E4F14428], handler);
    if (v16)
    {
      int v17 = v16;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __48__CKContextContentProviderManager_sharedManager__block_invoke_cold_1(v17);
      }
    }
  }
}

- (CKContextContentProviderManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKContextContentProviderManager;
  v2 = [(CKContextContentProviderManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    providers = v2->_providers;
    v2->_providers = (NSHashTable *)v3;

    +[CKContextUIClasses lookupClasses];
    [NSClassFromString(&cfstr_Uauseractivity.isa) performSelector:sel_addUserActivityObserver_ withObject:v2];
    dispatch_queue_t v5 = dispatch_queue_create("CKContextContentProviderManager Activity Reporting Queue", 0);
    activityReportingQueue = v2->_activityReportingQueue;
    v2->_activityReportingQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userActivitiesQueuedForReporting = v2->_userActivitiesQueuedForReporting;
    v2->_userActivitiesQueuedForReporting = v7;
  }
  return v2;
}

- (void)addProvider:(id)a3
{
  id v5 = a3;
  id v4 = self->_providers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_providers addObject:v5];
  objc_sync_exit(v4);
}

+ (BOOL)isSpringBoard
{
  return isSpringBoard;
}

- (void)_queueActivityForReporting:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (isSafariContentProvider == 1) {
    [(NSMutableArray *)v4->_userActivitiesQueuedForReporting removeAllObjects];
  }
  [(NSMutableArray *)v4->_userActivitiesQueuedForReporting addObject:v5];
  objc_sync_exit(v4);
}

- (void)_loadContextKitIfNecessaryWithExecutor:(id)a3
{
  id v3 = a3;
  if (!objc_lookUpClass("CKContextGlobals"))
  {
    [v3 markIncomplete];
    id v4 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CKContextContentProviderManager__loadContextKitIfNecessaryWithExecutor___block_invoke;
    block[3] = &unk_1E6110DC8;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_13()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(kContentTextExtractionNotificationToken, &state64);
  if (state)
  {
    int v1 = state;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __48__CKContextContentProviderManager_sharedManager__block_invoke_13_cold_1(v1);
    }
  }
  if (state64 && (uint64_t v2 = time(0) - (state64 & 0xFFFFFFFFFFLL), v2 >= 3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v2;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Ignoring outdated notification; delta=%llu seconds",
        buf,
        0xCu);
    }
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v4 = [(id)objc_opt_class() controlCodeForNonce:state64];
    uint64_t v5 = [(id)objc_opt_class() optionsForControlCode:v4];
    id v6 = (void *)sharedManager_instance;
    uint64_t v7 = state64;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke_15;
    v9[3] = &unk_1E6110D60;
    id v10 = v3;
    id v8 = v3;
    [v6 _prepareDonationWithNonce:v7 options:v5 isRecentsCapture:0 andReply:v9];
  }
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    v5[0] = 67109120;
    v5[1] = (int)(v4 * -1000.0);
    _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Donating to ContextService after %i ms.", (uint8_t *)v5, 8u);
  }
  [v3 donate];
}

+ (unint64_t)optionsForControlCode:(unsigned __int8)a3
{
  if ((a3 - 2) > 4) {
    return 0;
  }
  else {
    return qword_1B56BD950[(char)(a3 - 2)];
  }
}

+ (BOOL)isSafariContentProvider
{
  return isSafariContentProvider;
}

- (unint64_t)providerCount
{
  id v3 = self->_providers;
  objc_sync_enter(v3);
  unint64_t v4 = [(NSHashTable *)self->_providers count];
  objc_sync_exit(v3);

  return v4;
}

- (void)removeProvider:(id)a3
{
  id v5 = a3;
  unint64_t v4 = self->_providers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_providers removeObject:v5];
  objc_sync_exit(v4);
}

+ (unsigned)controlCodeForNonce:(unint64_t)a3
{
  return BYTE5(a3);
}

uint64_t __74__CKContextContentProviderManager__loadContextKitIfNecessaryWithExecutor___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)getCKContextGlobalsClass_softClass;
  uint64_t v9 = getCKContextGlobalsClass_softClass;
  if (!getCKContextGlobalsClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    _DWORD v5[2] = __getCKContextGlobalsClass_block_invoke;
    v5[3] = &unk_1E6110F98;
    v5[4] = &v6;
    __getCKContextGlobalsClass_block_invoke((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [*(id *)(a1 + 32) markReady];
}

- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 requiringMainQueue:(BOOL)a6 andReply:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  if (a6)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_requiringMainQueue_andReply___block_invoke;
    v13[3] = &unk_1E6110DF0;
    objc_copyWeak(v15, &location);
    id v14 = v12;
    v15[1] = (id)a3;
    v15[2] = (id)a4;
    BOOL v16 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v13);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CKContextContentProviderManager *)self _prepareDonationWithNonce:a3 options:a4 isRecentsCapture:v8 andReply:v12];
  }
}

void __114__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_requiringMainQueue_andReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _prepareDonationWithNonce:*(void *)(a1 + 48) options:*(void *)(a1 + 56) isRecentsCapture:*(unsigned __int8 *)(a1 + 64) andReply:*(void *)(a1 + 32)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 andReply:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[CKContextContentProviderManager _prepareDonationWithNonce:options:isRecentsCapture:andReply:]();
  }
  id v11 = objc_alloc(MEMORY[0x1E4F5AC40]);
  id v12 = v11;
  if (donationBundleIdentifier)
  {
    uint64_t v13 = objc_msgSend(v11, "initWithDonorBundleIdentifier:");
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 bundleIdentifier];
    uint64_t v13 = (void *)[v12 initWithDonorBundleIdentifier:v15];
  }
  [v13 setNonce:a3];
  uint64_t v16 = [(id)objc_opt_class() controlCodeForNonce:a3];
  if (a5
    || [(CKContextContentProviderManager *)self _isDonationAllowedWithControlCode:v16])
  {
    int v17 = self->_providers;
    objc_sync_enter(v17);
    if ([(NSHashTable *)self->_providers count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v18 = [(NSHashTable *)self->_providers allObjects];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v47;
        double v21 = 0.75;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v46 + 1) + 8 * i) timeout];
            if (v23 > v21) {
              double v21 = v23;
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v19);
      }
      else
      {
        double v21 = 0.75;
      }

      objc_sync_exit(v17);
      BOOL v24 = v21 > 60.0;
      v25 = [CKContextExecutor alloc];
      double v26 = v21 * 1000000000.0;
      v27 = dispatch_get_global_queue(25, 0);
      double v28 = 6.0e10;
      if (!v24) {
        double v28 = v26;
      }
      dispatch_time_t v29 = dispatch_time(0, (uint64_t)v28);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __95__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_andReply___block_invoke;
      v43[3] = &unk_1E6110E18;
      id v44 = v13;
      id v45 = v10;
      v30 = [(CKContextExecutor *)v25 initWithContext:v44 workItemQueue:MEMORY[0x1E4F14428] completionQueue:v27 timeoutAfter:v29 completionHandler:v43];

      if (objc_opt_respondsToSelector())
      {
        v31 = (void *)MEMORY[0x1E4F43060];
        v32 = [MEMORY[0x1E4F42D90] mainScreen];
        v33 = [v31 _unassociatedWindowSceneForScreen:v32 create:0];

        if (v33) {
          +[CKContextContentProviderUIScene extractFromScene:v33 usingExecutor:v30 withOptions:a4];
        }
      }
      v34 = self->_providers;
      objc_sync_enter(v34);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v35 = [(NSHashTable *)self->_providers allObjects];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v39 objects:v50 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v40 != v37) {
              objc_enumerationMutation(v35);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * j) extractUsingExecutor:v30 withOptions:a4];
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v39 objects:v50 count:16];
        }
        while (v36);
      }

      objc_sync_exit(v34);
      [(CKContextContentProviderManager *)self _loadContextKitIfNecessaryWithExecutor:v30];
      [(CKContextExecutor *)v30 markReady];
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
      objc_sync_exit(v17);
    }
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __95__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_andReply___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 32) items];
    int v7 = 134217984;
    uint64_t v8 = [v6 count];
    _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Extraction timed out; donations so far: %lu",
      (uint8_t *)&v7,
      0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isDonationAllowedWithControlCode:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F43630];
  if (forceIneligible)
  {
LABEL_2:
    BOOL v5 = 0;
    goto LABEL_11;
  }
  if (v3 == 1 && (isSafariContentProvider & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[CKContextContentProviderManager _isDonationAllowedWithControlCode:]();
    }
    goto LABEL_2;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v5 = v4 == 0;
    goto LABEL_11;
  }
  if (![v4 performSelector:sel__shouldAllowContentTextContextExtraction]) {
    goto LABEL_2;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[CKContextContentProviderManager _isDonationAllowedWithControlCode:]();
  }
  BOOL v5 = 1;
LABEL_11:

  return v5;
}

+ (void)_observeApplicationStateNotifications
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = (id)[v2 addObserverForName:*MEMORY[0x1E4F43660] object:0 queue:0 usingBlock:&__block_literal_global_0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = (id)[v4 addObserverForName:*MEMORY[0x1E4F43708] object:0 queue:0 usingBlock:&__block_literal_global_43];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = (id)[v7 addObserverForName:*MEMORY[0x1E4F43648] object:0 queue:0 usingBlock:&__block_literal_global_45];
}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke()
{
  forceIneligible = 1;
}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke_2()
{
  forceIneligible = 0;
}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke_3()
{
  forceIneligible = 0;
}

- (void)userActivityWasInvalidated:(id)a3
{
  if (a3) {
    -[CKContextContentProviderManager _dequeueActivityForReporting:](self, "_dequeueActivityForReporting:");
  }
}

uint64_t __81__CKContextContentProviderManager_scheduleUserActivityRecordingWithUserActivity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([WeakRetained _hasQueuedForReportingActivity:*(void *)(a1 + 32)]) {
      [v4 _prepareAndExtractContentForUserActivity:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40)];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_prepareAndExtractContentForUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSHashTable *)self->_providers count])
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke;
    v8[3] = &unk_1E6110ED8;
    objc_copyWeak(&v12, &location);
    id v9 = v7;
    id v10 = self;
    id v11 = v6;
    [(CKContextContentProviderManager *)self _hasForegroundActiveContentWithReply:v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_cold_1(a1);
    }
    objc_initWeak(&location, WeakRetained);
    id v5 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_46;
    block[3] = &unk_1E6110EB0;
    objc_copyWeak(&v8, &location);
    id v7 = *(id *)(a1 + 48);
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_46(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _formContextUserActivityFromUserActivity:*(void *)(a1 + 32)];
    if (v4)
    {
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      id v8 = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_2;
      id v9 = &unk_1E6110E88;
      id v5 = v3;
      id v10 = v5;
      id v11 = v4;
      [v11 prepareForDonationWithCompletionHandler:&v6];
      objc_msgSend(v5, "_dequeueActivityForReporting:", *(void *)(a1 + 32), v6, v7, v8, v9);
    }
  }
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_3;
    v3[3] = &unk_1E6110D60;
    uint64_t v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    [v2 _prepareDonationWithNonce:0 options:0 isRecentsCapture:1 requiringMainQueue:1 andReply:v3];
  }
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setAssociatedUserActivity:v2];
  [v3 donate];
}

- (void)_prepareAndDonateUserActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CKContextContentProviderManager *)self _formContextUserActivityFromUserActivity:v4];
    if (v5)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke;
      v6[3] = &unk_1E6110F20;
      objc_copyWeak(&v8, &location);
      id v7 = v4;
      [v5 prepareForDonationWithCompletionHandler:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (a2) {
      [WeakRetained _prepareDonationWithNonce:0 options:0 isRecentsCapture:1 andReply:&__block_literal_global_49];
    }
    [v5 _dequeueActivityForReporting:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

uint64_t __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 donate];
}

- (id)_formContextUserActivityFromUserActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 bundleIdentifier];

    if ([v7 length])
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5AC50]) initWithUserActivity:v4];
      [v8 setBundleIdentifier:v7];
    }
    else
    {
      id v8 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_hasQueuedForReportingActivity:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableArray *)v5->_userActivitiesQueuedForReporting containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_dequeueActivityForReporting:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_userActivitiesQueuedForReporting removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_hasForegroundActiveContentWithReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CKContextContentProviderManager__hasForegroundActiveContentWithReply___block_invoke;
  block[3] = &unk_1E6110F70;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__CKContextContentProviderManager__hasForegroundActiveContentWithReply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = WeakRetained[1];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            id v11 = objc_msgSend(v10, "_scene", (void)v13);
            uint64_t v12 = [v11 activationState];

            if (!v12)
            {
              (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

              goto LABEL_15;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivitiesQueuedForReporting, 0);
  objc_storeStrong((id *)&self->_activityReportingQueue, 0);

  objc_storeStrong((id *)&self->_providers, 0);
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not register for extraction; error:%u",
    (uint8_t *)v1,
    8u);
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_13_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get notification state; error:%i",
    (uint8_t *)v1,
    8u);
}

- (void)_prepareDonationWithNonce:options:isRecentsCapture:andReply:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Preparing a donation...", v0, 2u);
}

- (void)_isDonationAllowedWithControlCode:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  int v1 = [v0 bundleIdentifier];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "The client %@ is allowed to donate", (uint8_t *)&v2, 0xCu);
}

- (void)_isDonationAllowedWithControlCode:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "The client is not allowed to donate due it being a Safari provider", v0, 2u);
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Preparing donation of user activity for foreground process: %@", (uint8_t *)&v2, 0xCu);
}

@end
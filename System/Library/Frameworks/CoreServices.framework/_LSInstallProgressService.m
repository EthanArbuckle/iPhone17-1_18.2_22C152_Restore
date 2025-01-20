@interface _LSInstallProgressService
+ (id)sharedInstance;
+ (int)notificationTypeForOperation:(unint64_t)a3;
+ (void)beginListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SEL)observerSelectorForNotification:(int)a3;
- (_LSInstallProgressService)init;
- (id)_LSFindPlaceholderApplications;
- (id)_prepareApplicationProxiesForNotification:(int)a3 identifiers:(id)a4 withPlugins:(BOOL)a5;
- (id)loadJournalledNotificationsFromDisk;
- (id)parentProgressForApplication:(id)a3 andPhase:(unint64_t)a4 isActive:(BOOL)a5;
- (id)progressProportionsForBundleID:(id)a3;
- (unint64_t)finalInstallPhaseForAppProxy:(id)a3;
- (void)_placeholderIconUpdatedForApp:(id)a3;
- (void)_placeholdersUninstalled:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSendNotificationFenceWithTimeout:(double)a3 fenceBlock:(id)a4;
- (void)coalesceProportionsSave;
- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6;
- (void)detachAndSendNotification:(id)a3 forApplicationExtensionRecords:(id)a4;
- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserver:(id)a5;
- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserverProxy:(id)a5;
- (void)discardProportionsForBundleID:(id)a3;
- (void)dispatchJournalledNotificationsToConnectedClients;
- (void)dispatchJournalledNotificationsToObserver:(id)a3;
- (void)getMaxProgressPhaseUnitsForLoading:(int *)a3 restoring:(int *)a4 installing:(int *)a5 essentialAssets:(int *)a6 forAppProxy:(id)a7;
- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4;
- (void)installationFailedForApplication:(id)a3;
- (void)loadProportions;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performJournalRecovery;
- (void)rebuildInstallIndexes;
- (void)removeObserver:(id)a3;
- (void)restoreInactiveInstalls;
- (void)saveProportions;
- (void)sendDatabaseRebuiltNotification;
- (void)sendDatabaseRebuiltNotificationToObserver:(id)a3;
- (void)sendNetworkUsageChangedNotification;
- (void)sendNotification:(id)a3 ForPlugins:(id)a4;
- (void)sendNotification:(int)a3 forAppProxies:(id)a4 Plugins:(BOOL)a5 completion:(id)a6;
- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 completion:(id)a6;
- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation _LSInstallProgressService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((int)softLinkMKBDeviceUnlockedSinceBoot[0]() <= 0)
  {
    v8 = [v7 _xpcConnection];
    CFURLRef v9 = _LSCopyExecutableURLForXPCConnection(v8);

    v10 = [(__CFURL *)v9 lastPathComponent];
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      __int16 v30 = 2112;
      v31 = v10;
      __int16 v32 = 2048;
      uint64_t v33 = (int)[v7 processIdentifier];
      _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "Service %@ being accessed by %@ (%lu) before first unlock.", buf, 0x20u);
    }
  }
  v14 = installProgressInterface();
  [v7 setExportedInterface:v14];

  v15 = workspaceObserverInterface();
  [v7 setRemoteObjectInterface:v15];

  v16 = [[LSInstallProgressObserver alloc] initWithConnection:v7];
  [v7 setExportedObject:v16];
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke;
  v23 = &unk_1E5231A38;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, (id *)buf);
  v17 = v16;
  v24 = v17;
  v18 = (void *)MEMORY[0x18530F950](&v20);
  objc_msgSend(v7, "setInvalidationHandler:", v18, v20, v21, v22, v23);
  [v7 setInterruptionHandler:v18];
  [v7 resume];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___LSInstallProgressService_addObserver___block_invoke;
  block[3] = &unk_1E522C290;
  v23 = v24;
  block[4] = self;
  id v6 = v4;
  id v22 = v6;
  dispatch_sync(observersQueue, block);
  id v7 = self;
  objc_sync_enter(v7);
  v8 = [(NSMutableOrderedSet *)v7->_orderedInstalls array];
  CFURLRef v9 = (void *)[v8 copy];

  v10 = [(NSMutableSet *)v7->_inactiveInstalls allObjects];
  v11 = (void *)[v10 copy];

  objc_sync_exit(v7);
  v12 = self->_observersQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41___LSInstallProgressService_addObserver___block_invoke_2;
  v16[3] = &unk_1E5231A60;
  id v19 = v11;
  uint64_t v20 = v24;
  v16[4] = v7;
  id v17 = v6;
  id v18 = v9;
  id v13 = v11;
  id v14 = v9;
  id v15 = v6;
  dispatch_async(v12, v16);

  _Block_object_dispose(v24, 8);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_204);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;

  return v2;
}

+ (void)beginListening
{
  if (beginListening_once_0 != -1) {
    dispatch_once(&beginListening_once_0, &__block_literal_global_206_0);
  }
}

+ (int)notificationTypeForOperation:(unint64_t)a3
{
  if (a3 > 8) {
    return 1;
  }
  else {
    return dword_182AF9358[a3];
  }
}

- (_LSInstallProgressService)init
{
  v37.receiver = self;
  v37.super_class = (Class)_LSInstallProgressService;
  id v2 = [(_LSInstallProgressService *)&v37 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = objc_alloc_init(LSInstallProgressList);
    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:0];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    v12 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    id v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.lsd.appcontrols", 0);
    id v18 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.lsd.observers", v19);
    uint64_t v21 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v20;

    *((unsigned char *)v2 + 128) = 0;
    [v2 sendNetworkUsageChangedNotification];
    id v22 = *((void *)v2 + 9);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33___LSInstallProgressService_init__block_invoke;
    block[3] = &unk_1E522C268;
    v23 = (NSObject **)v2;
    v36 = v23;
    dispatch_async(v22, block);
    v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v25 = v23[11];
    v23[11] = v24;

    dispatch_source_t v26 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 9));
    v27 = v23[13];
    v23[13] = v26;

    objc_initWeak(&location, v23);
    v28 = v23[13];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33___LSInstallProgressService_init__block_invoke_2;
    handler[3] = &unk_1E522C1C8;
    objc_copyWeak(&v33, &location);
    dispatch_source_set_event_handler(v28, handler);
    dispatch_resume(v23[13]);
    v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v30 = v23[15];
    v23[15] = v29;

    *((_DWORD *)v23 + 28) = 0;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return (_LSInstallProgressService *)v2;
}

- (id)_LSFindPlaceholderApplications
{
  id v6 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!_LSContextInit(&v6))
  {
    v5 = v6;
    id v4 = v2;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(&v6);
  }

  return v2;
}

- (void)restoreInactiveInstalls
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  dispatch_source_t v26 = __Block_byref_object_copy__56;
  v27 = __Block_byref_object_dispose__56;
  id v28 = 0;
  uint64_t v3 = _LSDatabaseGetSeedingGroup();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  _LSServer_DatabaseExecutionContext();
  id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke;
  v22[3] = &unk_1E522BA50;
  v22[4] = self;
  v22[5] = &v23;
  -[LSDBExecutionContext syncRead:](v4, v22);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)v24[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v6 = 138412546;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F28F90];
        uint64_t v11 = objc_msgSend(v9, "bundleIdentifier", v15);
        v12 = [v10 publishingKeyForApp:v11 withPhase:0];

        uint64_t v13 = _LSProgressLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v9 installFailureReason];
          *(_DWORD *)buf = v15;
          __int16 v30 = v9;
          __int16 v31 = 2112;
          __int16 v32 = v14;
          _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "Restoring progress for %@ with failure state %@", buf, 0x16u);
        }
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_216;
        v17[3] = &unk_1E522C740;
        v17[4] = v9;
        [(_LSInstallProgressService *)self createInstallProgressForApplication:v9 withPhase:0 andPublishingString:v12 reply:v17];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v33 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___LSInstallProgressService_removeObserver___block_invoke;
  v7[3] = &unk_1E522BBD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observersQueue, v7);
}

- (void)getMaxProgressPhaseUnitsForLoading:(int *)a3 restoring:(int *)a4 installing:(int *)a5 essentialAssets:(int *)a6 forAppProxy:(id)a7
{
  id v11 = a7;
  uint64_t v12 = [v11 installType];
  if (v12 == 2) {
    unint64_t v13 = 35;
  }
  else {
    unint64_t v13 = 40;
  }
  if (v12 == 2) {
    unint64_t v14 = 10;
  }
  else {
    unint64_t v14 = 0;
  }
  if (v12 == 2) {
    unint64_t v15 = 55;
  }
  else {
    unint64_t v15 = 60;
  }
  v16 = objc_msgSend(v11, "bundleIdentifier", a6);

  id v36 = [(_LSInstallProgressService *)self progressProportionsForBundleID:v16];

  unint64_t v17 = (unint64_t)v36;
  if (v36)
  {
    long long v18 = [v36 objectForKeyedSubscript:&unk_1ECB439D8];
    [v18 doubleValue];
    double v20 = v19;
    long long v21 = [v36 objectForKeyedSubscript:&unk_1ECB439F0];
    [v21 doubleValue];
    double v23 = v20 + v22;
    v24 = [v36 objectForKeyedSubscript:&unk_1ECB43A08];
    [v24 doubleValue];
    double v26 = v23 + v25;
    v27 = [v36 objectForKeyedSubscript:&unk_1ECB43A20];
    [v27 doubleValue];
    double v29 = v26 + v28;

    unint64_t v15 = computeEffectiveUnitsForPhase(0, v15, v36, v29);
    unint64_t v14 = computeEffectiveUnitsForPhase(2, v14, v36, v29);
    unint64_t v13 = computeEffectiveUnitsForPhase(1, v13, v36, v29);
    unint64_t v17 = computeEffectiveUnitsForPhase(4, v13, v36, v29);
  }
  double v30 = 100.0 / (double)(v13 + v15 + v17 + v14);
  unint64_t v31 = (unint64_t)(v30 * (double)v14);
  unint64_t v32 = (unint64_t)(v30 * (double)v13);
  unint64_t v33 = (unint64_t)(v30 * (double)v17);
  if (a3) {
    *a3 = 100 - v33 - (v32 + v31);
  }
  if (a4) {
    *a4 = v31;
  }
  if (a5) {
    *a5 = v32;
  }
  if (v35) {
    _DWORD *v35 = v33;
  }
}

- (unint64_t)finalInstallPhaseForAppProxy:(id)a3
{
  uint64_t v3 = [a3 correspondingApplicationRecord];
  if ([v3 requiresPostProcessing]) {
    unint64_t v4 = 4;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (void *)MEMORY[0x18530F680]();
  unint64_t v14 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
  unint64_t v15 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
  v16 = a6;
  if (v16 && _NSIsNSString() && [v16 length])
  {
    uint64_t v17 = [v16 rangeOfString:@"." options:4];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v18 = _LSProgressLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:]();
      }
      goto LABEL_9;
    }
    uint64_t v19 = v17;
    long long v18 = [v16 substringToIndex:v17];
    v57 = [v16 substringFromIndex:v19 + 1];
    if (!v18 || !_NSIsNSString() || ![v18 length])
    {
      uint64_t v34 = _LSProgressLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v10;
        _os_log_impl(&dword_182959000, v34, OS_LOG_TYPE_DEFAULT, "Received kvo for %@ notification with invalid bundleID", buf, 0xCu);
      }

      goto LABEL_28;
    }
    double v20 = _LSProgressLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v71 = v18;
      __int16 v72 = 2112;
      *(void *)v73 = v16;
      *(_WORD *)&v73[8] = 2112;
      *(void *)&v73[10] = v10;
      *(_WORD *)&v73[18] = 2112;
      id v74 = v12;
      _os_log_debug_impl(&dword_182959000, v20, OS_LOG_TYPE_DEBUG, "Received kvo for %@ <%@:%@> with change %@", buf, 0x2Au);
    }

    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__56;
    v67 = __Block_byref_object_dispose__56;
    id v68 = 0;
    _LSServer_DatabaseExecutionContext();
    long long v21 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v60[3] = &unk_1E522BA50;
    v62 = &v63;
    v53 = v18;
    v61 = v53;
    -[LSDBExecutionContext syncRead:](v21, v60);

    if (!v64[5])
    {
      p_super = _LSProgressLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:]();
      }
      goto LABEL_37;
    }
    double v22 = self;
    objc_sync_enter(v22);
    id obj = v22;
    v56 = [(LSInstallProgressList *)v22->_progresses progressForBundleID:v53];
    if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v23 = [v56 installPhaseString];
      char v24 = [v57 isEqualToString:v23];

      if (v24)
      {
        if ([v10 isEqualToString:@"fractionCompleted"])
        {
          [v14 doubleValue];
          double v26 = v25;
          [v15 doubleValue];
          double v28 = v27;
          [v15 doubleValue];
          double v30 = v29;
          [v14 doubleValue];
          if (v30 < v31) {
            goto LABEL_36;
          }
          [v15 doubleValue];
          if (v32 > 1.0 || v28 == v26) {
            goto LABEL_36;
          }
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          [(_LSInstallProgressService *)obj getMaxProgressPhaseUnitsForLoading:(char *)&v59 + 4 restoring:&v59 installing:(char *)&v58 + 4 essentialAssets:&v58 forAppProxy:v64[5]];
          int v33 = 0;
          int v54 = 0;
          uint64_t v51 = 0;
          switch([v56 installPhase])
          {
            case 0:
              int v54 = 0;
              uint64_t v51 = 0;
              int v33 = (int)(v28 * (double)SHIDWORD(v59));
              break;
            case 1:
              int v33 = HIDWORD(v59);
              int v54 = v59;
              LODWORD(v51) = 0;
              HIDWORD(v51) = (int)(v28 * (double)SHIDWORD(v58));
              break;
            case 2:
              uint64_t v51 = 0;
              int v33 = HIDWORD(v59);
              int v54 = (int)(v28 * (double)(int)v59);
              break;
            case 3:
              break;
            case 4:
              int v33 = HIDWORD(v59);
              int v54 = v59;
              LODWORD(v51) = (int)(v28 * (double)(int)v58);
              HIDWORD(v51) = HIDWORD(v58);
              break;
            default:
              int v54 = 0;
              uint64_t v51 = 0;
              break;
          }
          v47 = _LSProgressLog();
          v48 = (v54 + v33 + HIDWORD(v51) + (int)v51);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            int v50 = [v56 installPhase];
            *(_DWORD *)buf = 134219522;
            v71 = v48;
            __int16 v72 = 1024;
            *(_DWORD *)v73 = v50;
            *(_WORD *)&v73[4] = 2112;
            *(void *)&v73[6] = v16;
            *(_WORD *)&v73[14] = 1024;
            *(_DWORD *)&v73[16] = HIDWORD(v59);
            LOWORD(v74) = 1024;
            *(_DWORD *)((char *)&v74 + 2) = v59;
            HIWORD(v74) = 1024;
            int v75 = HIDWORD(v58);
            __int16 v76 = 1024;
            int v77 = v58;
            _os_log_debug_impl(&dword_182959000, v47, OS_LOG_TYPE_DEBUG, "setting completed unit count to %llu for progress in phase %d (ps %@). maxes: %d %d %d %d", buf, 0x34u);
          }

          [v56 setCompletedUnitCount:v48];
        }
        else
        {
          if (![v10 isEqualToString:@"userInfo.installState"])
          {
            if ([v10 isEqualToString:@"pausable"])
            {
              int v43 = [v15 BOOLValue];
              if (v43 != [v56 isPausable]) {
                objc_msgSend(v56, "setPausable:", objc_msgSend(v15, "BOOLValue"));
              }
            }
            else if ([v10 isEqualToString:@"cancellable"])
            {
              int v44 = [v15 BOOLValue];
              if (v44 != [v56 isCancellable]) {
                objc_msgSend(v56, "setCancellable:", objc_msgSend(v15, "BOOLValue"));
              }
            }
            else if ([v10 isEqualToString:@"prioritizable"])
            {
              int v45 = [v15 BOOLValue];
              if (v45 != [v56 isPrioritizable]) {
                objc_msgSend(v56, "setPrioritizable:", objc_msgSend(v15, "BOOLValue"));
              }
            }
            goto LABEL_36;
          }
          int v37 = [v14 intValue];
          if (v37 == [v15 intValue]) {
            goto LABEL_36;
          }
          v38 = _LSProgressLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v55 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "installPhase"));
            *(_DWORD *)buf = 138412546;
            v71 = v55;
            __int16 v72 = 2112;
            *(void *)v73 = v49;
            _os_log_debug_impl(&dword_182959000, v38, OS_LOG_TYPE_DEBUG, "LSInstallProgress: Got update for userInfo.installState: newVal = %@, parentPhase = %@", buf, 0x16u);
          }
          if ([v15 integerValue] == 5
            && (uint64_t v39 = [v56 installPhase],
                v39 != [(_LSInstallProgressService *)obj finalInstallPhaseForAppProxy:v64[5]]))
          {
            int v42 = 0;
          }
          else
          {
            objc_msgSend(v56, "setInstallState:", (int)objc_msgSend(v15, "intValue"));
            v40 = _LSProgressLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              v41 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue"));
              -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.4(v41, (uint64_t)buf, v40);
            }

            int v42 = 1;
          }
          if ([v15 intValue] == 4
            || [v15 intValue] == 2
            || ![v15 intValue])
          {
            [v56 setPausable:1];
            [v56 setCancellable:1];
            [v56 setPrioritizable:1];
            if ([v15 intValue] == 4) {
              [v56 setCompletedUnitCount:0];
            }
          }
          if (!v42)
          {
LABEL_36:

            p_super = &obj->super;
            objc_sync_exit(obj);
LABEL_37:

            _Block_object_dispose(&v63, 8);
LABEL_28:

            goto LABEL_9;
          }
        }
        uint64_t v69 = v64[5];
        v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v69, 1, v51);
        [(_LSInstallProgressService *)obj sendNotification:3 forAppProxies:v35 Plugins:0 completion:0];
      }
      else
      {
        v35 = _LSProgressLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v46 = [v56 installPhaseString];
          *(_DWORD *)buf = 138412802;
          v71 = v16;
          __int16 v72 = 2112;
          *(void *)v73 = v46;
          *(_WORD *)&v73[8] = 2112;
          *(void *)&v73[10] = v57;
          _os_log_debug_impl(&dword_182959000, v35, OS_LOG_TYPE_DEBUG, "LSInstallProgress: Got update for %@ but parent phase %@ does not match %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v35 = _LSProgressLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:]();
      }
    }

    goto LABEL_36;
  }
  long long v18 = _LSProgressLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v10;
    _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEFAULT, "Received kvo for %@ notification with invalid context", buf, 0xCu);
  }
LABEL_9:
}

- (id)parentProgressForApplication:(id)a3 andPhase:(unint64_t)a4 isActive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  context = (void *)MEMORY[0x18530F680]();
  uint64_t v9 = [v8 bundleIdentifier];
  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    id v11 = [(LSInstallProgressList *)v10->_progresses progressForBundleID:v9];
    if (v11)
    {
      id v12 = [(NSMutableDictionary *)v10->_installIndexes objectForKeyedSubscript:v9];
      unint64_t v13 = [(NSMutableDictionary *)v10->_installTypes objectForKeyedSubscript:v9];
      uint64_t v14 = [v13 unsignedIntegerValue];
      if (v13 && ((uint64_t v15 = [v8 installType], (unint64_t)(v14 - 7) > 2) || v14 == v15))
      {
        if (([(NSMutableSet *)v10->_inactiveInstalls containsObject:v9] & v5) == 1)
        {
          char v24 = _LSProgressLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            double v25 = [v11 _LSDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)int v37 = v25;
            _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Updating installState for %@ to LSInstallStateWaiting", buf, 0xCu);
          }
          double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          [(NSMutableDictionary *)v10->_installTypes setObject:v26 forKeyedSubscript:v9];

          [(NSMutableSet *)v10->_inactiveInstalls removeObject:v9];
          [(NSMutableOrderedSet *)v10->_orderedInstalls addObject:v9];
          [(_LSInstallProgressService *)v10 rebuildInstallIndexes];
          [v11 setInstallState:0];
        }
      }
      else
      {
        v16 = _LSProgressLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)int v37 = [v8 installType];
          *(_WORD *)&v37[4] = 1024;
          *(_DWORD *)&v37[6] = v14;
          *(_WORD *)v38 = 2112;
          *(void *)&v38[2] = v8;
          _os_log_debug_impl(&dword_182959000, v16, OS_LOG_TYPE_DEBUG, "Updating install type to %u from %u from: %@", buf, 0x18u);
        }

        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        [(NSMutableDictionary *)v10->_installTypes setObject:v17 forKeyedSubscript:v9];

        if (!v12)
        {
          [(NSMutableSet *)v10->_inactiveInstalls removeObject:v9];
          if (v5)
          {
            [(NSMutableOrderedSet *)v10->_orderedInstalls addObject:v9];
            [v11 setInstallState:0];
          }
          else
          {
            [(NSMutableSet *)v10->_inactiveInstalls addObject:v9];
          }
        }
        [(_LSInstallProgressService *)v10 rebuildInstallIndexes];
      }
      if (a4 == 3 && [v11 installPhase] != 2) {
        goto LABEL_37;
      }
      double v29 = _LSProgressLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        double v30 = [v11 _LSDescription];
        double v31 = [NSNumber numberWithUnsignedInteger:a4];
        *(_DWORD *)buf = 138412546;
        *(void *)int v37 = v30;
        *(_WORD *)&v37[8] = 2112;
        *(void *)v38 = v31;
        _os_log_impl(&dword_182959000, v29, OS_LOG_TYPE_DEFAULT, "Updating installPhase for %@ to %@", buf, 0x16u);
      }
      [v11 setInstallPhase:a4];
      if (a4 <= 4 && ((1 << a4) & 0x19) != 0)
      {
LABEL_37:
        [v11 setPausable:1];
        BOOL v32 = 1;
        [v11 setCancellable:1];
      }
      else
      {
        [v11 setPausable:0];
        [v11 setCancellable:0];
        BOOL v32 = a4 == 1;
      }
      [v11 setPrioritizable:v32];
    }
    else
    {
      if (v5)
      {
        if (([(NSMutableOrderedSet *)v10->_orderedInstalls containsObject:v9] & 1) == 0)
        {
          [(NSMutableOrderedSet *)v10->_orderedInstalls addObject:v9];
          double v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          [(NSMutableDictionary *)v10->_installTypes setObject:v22 forKeyedSubscript:v9];

          double v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableOrderedSet indexOfObject:](v10->_orderedInstalls, "indexOfObject:", v9));
          [(NSMutableDictionary *)v10->_installIndexes setObject:v23 forKey:v9];
        }
        if (!v10->_usingNetwork)
        {
          v10->_usingNetwork = 1;
          [(_LSInstallProgressService *)v10 sendNetworkUsageChangedNotification];
        }
      }
      else if (([(NSMutableSet *)v10->_inactiveInstalls containsObject:v9] & 1) == 0)
      {
        [(NSMutableSet *)v10->_inactiveInstalls addObject:v9];
        double v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        [(NSMutableDictionary *)v10->_installTypes setObject:v27 forKeyedSubscript:v9];
      }
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:0 bundleID:v9 andPhase:a4];
      [(LSInstallProgressList *)v10->_progresses setProgress:v11 forBundleID:v9];
      objc_msgSend(v11, "ls_setExpectedFinalInstallPhase:", -[_LSInstallProgressService finalInstallPhaseForAppProxy:](v10, "finalInstallPhaseForAppProxy:", v8));
      [v11 _publish];
      id v12 = _LSProgressLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = [v11 _LSDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)int v37 = v28;
        _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Created parent progress %@", buf, 0xCu);
      }
    }

    objc_sync_exit(v10);
    int v33 = _LSProgressLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[_LSInstallProgressService parentProgressForApplication:andPhase:isActive:](v11, (uint64_t)v8, v33);
    }
  }
  else
  {
    long long v18 = _LSProgressLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:a4];
      double v20 = (void *)v19;
      long long v21 = @"INACTIVE";
      *(_DWORD *)buf = 138412802;
      *(void *)int v37 = v8;
      *(_WORD *)&v37[8] = 2112;
      if (v5) {
        long long v21 = @"ACTIVE";
      }
      *(void *)v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      uint64_t v39 = v21;
      _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bundleID, failed to create parent progress for %@ {%@-%@}", buf, 0x20u);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  unint64_t v13 = (void (**)(id, void *))a6;
  uint64_t v14 = (void *)MEMORY[0x18530F680]();
  if (v12)
  {
    uint64_t v15 = self->_publishingStrings;
    objc_sync_enter(v15);
    v16 = [(NSMutableSet *)self->_publishingStrings member:v12];
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      uint64_t v19 = _LSProgressLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v12;
        _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "Using publishing string \"%{public}@\" for the first time", buf, 0xCu);
      }

      [(NSMutableSet *)self->_publishingStrings addObject:v12];
      id v18 = [(NSMutableSet *)self->_publishingStrings member:v12];

      if (!v18)
      {
        int v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, self, @"_LSInstallProgressService.m", 1023, @"Failed to get back value \"%@\" we just inserted into an NSMutableSet.", 0 object file lineNumber description];

        id v18 = 0;
      }
    }

    objc_sync_exit(v15);
  }
  else
  {
    id v18 = 0;
  }
  double v20 = _LSProgressLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v36 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412802;
    id v47 = v11;
    __int16 v48 = 2112;
    v49 = v36;
    __int16 v50 = 2112;
    id v51 = v18;
    _os_log_debug_impl(&dword_182959000, v20, OS_LOG_TYPE_DEBUG, "createInstallProgressForApplication:%@ withPhase:%@ andPublishingString:%@", buf, 0x20u);
  }
  long long v21 = [v11 bundleIdentifier];
  if (!v11)
  {
    double v31 = _LSProgressLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = 0;
      _os_log_impl(&dword_182959000, v31, OS_LOG_TYPE_DEFAULT, "Cannot create install progress for app, invalid app proxy %@", buf, 0xCu);
    }

    uint64_t v44 = *MEMORY[0x1E4F28228];
    int v45 = @"invalid application proxy";
    BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    int v33 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1034, v32);
    v13[2](v13, v33);

    goto LABEL_29;
  }
  if (!v18)
  {
    uint64_t v34 = _LSProgressLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v11;
      __int16 v48 = 2112;
      v49 = 0;
      _os_log_impl(&dword_182959000, v34, OS_LOG_TYPE_DEFAULT, "Cannot create install progress for app %@, missing publishing key %@", buf, 0x16u);
    }

    uint64_t v42 = *MEMORY[0x1E4F28228];
    int v43 = @"no publishing key";
    BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v35 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1040, v32);
    v13[2](v13, v35);

    goto LABEL_29;
  }
  double v22 = [(_LSInstallProgressService *)self parentProgressForApplication:v11 andPhase:a4 isActive:1];
  double v23 = _LSProgressLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    char v24 = [v22 _LSDescription];
    double v25 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412546;
    id v47 = v24;
    __int16 v48 = 2112;
    v49 = v25;
    _os_log_impl(&dword_182959000, v23, OS_LOG_TYPE_DEFAULT, "Parent progress for installation %@, adding phase %@", buf, 0x16u);
  }
  if (!v22)
  {
    BOOL v32 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1048, 0);
    v13[2](v13, v32);
LABEL_29:

    goto LABEL_30;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke;
  v38[3] = &unk_1E5231AB0;
  id v26 = v18;
  id v39 = v26;
  uint64_t v40 = self;
  id v27 = v21;
  id v41 = v27;
  double v28 = (void *)MEMORY[0x18530F950](v38);
  double v29 = [MEMORY[0x1E4F28F90] _addSubscriberForCategory:v26 usingPublishingHandler:v28];
  if (v29) {
    [(LSInstallProgressList *)self->_progresses addSubscriber:v29 forPublishingKey:v26 andBundleID:v27];
  }
  double v30 = _LSProgressLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v26;
    _os_log_impl(&dword_182959000, v30, OS_LOG_TYPE_DEFAULT, "Subscribing to %@", buf, 0xCu);
  }

  v13[2](v13, 0);
LABEL_30:
}

- (void)rebuildInstallIndexes
{
  [(NSMutableDictionary *)self->_installIndexes removeAllObjects];
  if ([(NSMutableOrderedSet *)self->_orderedInstalls count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = [(NSMutableOrderedSet *)self->_orderedInstalls objectAtIndex:v3];
      BOOL v5 = [NSNumber numberWithInt:v3];
      [(NSMutableDictionary *)self->_installIndexes setObject:v5 forKey:v4];

      ++v3;
    }
    while ([(NSMutableOrderedSet *)self->_orderedInstalls count] > v3);
  }
}

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x18530F680]();
  id v8 = _LSProgressLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Installation ended for %@ with state %@", (uint8_t *)&v14, 0x16u);
  }
  v10 = self;
  objc_sync_enter(v10);
  id v11 = [(LSInstallProgressList *)v10->_progresses progressForBundleID:v6];
  id v12 = v11;
  if (v11)
  {
    if (a4 == 5) {
      [v11 setCompletedUnitCount:100];
    }
    [v12 setInstallState:a4];
    if ([(NSMutableSet *)v10->_inactiveInstalls containsObject:v6])
    {
      [(NSMutableSet *)v10->_inactiveInstalls removeObject:v6];
    }
    else
    {
      [(NSMutableOrderedSet *)v10->_orderedInstalls removeObject:v6];
      [(NSMutableDictionary *)v10->_installIndexes removeObjectForKey:v6];
      [(_LSInstallProgressService *)v10 rebuildInstallIndexes];
    }
    [(NSMutableDictionary *)v10->_installTypes removeObjectForKey:v6];
    if (![(NSMutableOrderedSet *)v10->_orderedInstalls count] && v10->_usingNetwork)
    {
      v10->_usingNetwork = 0;
      [(_LSInstallProgressService *)v10 sendNetworkUsageChangedNotification];
    }
    [v12 _unpublish];
    [(LSInstallProgressList *)v10->_progresses removeProgressForBundleID:v6];
    [(_LSInstallProgressService *)v10 discardProportionsForBundleID:v6];
  }
  else
  {
    unint64_t v13 = _LSProgressLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "Could not find parent progress for %@, it may have been removed", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_sync_exit(v10);
}

- (void)installationFailedForApplication:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x18530F680]();
  id v6 = _LSProgressLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_LSInstallProgressService installationFailedForApplication:]();
  }

  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(LSInstallProgressList *)v7->_progresses progressForBundleID:v4];
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__56;
    double v20 = __Block_byref_object_dispose__56;
    id v21 = 0;
    _LSServer_DatabaseExecutionContext();
    uint64_t v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62___LSInstallProgressService_installationFailedForApplication___block_invoke;
    v13[3] = &unk_1E522BA50;
    p_long long buf = &buf;
    id v10 = v4;
    id v14 = v10;
    -[LSDBExecutionContext syncRead:](v9, v13);

    [(NSMutableSet *)v7->_inactiveInstalls addObject:v10];
    [(NSMutableOrderedSet *)v7->_orderedInstalls removeObject:v10];
    [(_LSInstallProgressService *)v7 rebuildInstallIndexes];
    if (![(NSMutableOrderedSet *)v7->_orderedInstalls count] && v7->_usingNetwork)
    {
      v7->_usingNetwork = 0;
      [(_LSInstallProgressService *)v7 sendNetworkUsageChangedNotification];
    }
    [v8 setCompletedUnitCount:0];
    [v8 setInstallState:4];
    [v8 setCancellable:1];
    [v8 setPausable:1];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      [(_LSInstallProgressService *)v7 sendNotification:3 forAppProxies:v11 Plugins:0 completion:0];
    }
    else
    {
      id v11 = _LSProgressLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService installationFailedForApplication:]();
      }
    }

    [v8 _unpublish];
    [(LSInstallProgressList *)v7->_progresses removeProgressForBundleID:v10];
    [(_LSInstallProgressService *)v7 discardProportionsForBundleID:v10];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = _LSProgressLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Could not find parent progress for %@, it may have been removed", (uint8_t *)&buf, 0xCu);
    }
  }
  objc_sync_exit(v7);
}

- (void)_placeholderIconUpdatedForApp:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  inactiveInstalls = v4->_inactiveInstalls;
  id v6 = [v12 bundleIdentifier];
  LOBYTE(inactiveInstalls) = [(NSMutableSet *)inactiveInstalls containsObject:v6];

  if ((inactiveInstalls & 1) == 0)
  {
    installIndexes = v4->_installIndexes;
    id v8 = [v12 bundleIdentifier];
    uint64_t v9 = [(NSMutableDictionary *)installIndexes objectForKeyedSubscript:v8];

    if (!v9)
    {
      orderedInstalls = v4->_orderedInstalls;
      id v11 = [v12 bundleIdentifier];
      [(NSMutableOrderedSet *)orderedInstalls addObject:v11];

      [(_LSInstallProgressService *)v4 rebuildInstallIndexes];
    }
  }
  objc_sync_exit(v4);
}

- (void)_placeholdersUninstalled:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", v13, (void)v14);
        id v10 = self;
        objc_sync_enter(v10);
        if (([(NSMutableSet *)self->_inactiveInstalls containsObject:v9] & 1) == 0)
        {
          [(NSMutableDictionary *)self->_installIndexes objectForKey:v9];
        }
        id v11 = _LSProgressLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v13;
          uint64_t v19 = v9;
          _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "Placeholder for %@ uninstalled; removing progress tracking",
            buf,
            0xCu);
        }

        id v12 = [(LSInstallProgressList *)self->_progresses progressForBundleID:v9];
        [(NSMutableSet *)self->_inactiveInstalls removeObject:v9];
        [(NSMutableOrderedSet *)self->_orderedInstalls removeObject:v9];
        [(_LSInstallProgressService *)v10 rebuildInstallIndexes];
        if (![(NSMutableOrderedSet *)self->_orderedInstalls count] && self->_usingNetwork)
        {
          self->_usingNetwork = 0;
          [(_LSInstallProgressService *)v10 sendNetworkUsageChangedNotification];
        }
        [(NSMutableDictionary *)self->_installTypes removeObjectForKey:v9];
        [v12 _unpublish];
        [(LSInstallProgressList *)self->_progresses removeProgressForBundleID:v9];
        [(_LSInstallProgressService *)v10 discardProportionsForBundleID:v9];

        objc_sync_exit(v10);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)sendNotification:(id)a3 ForPlugins:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "correspondingApplicationExtensionRecord", (void)v15);
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    [(_LSInstallProgressService *)self detachAndSendNotification:v6 forApplicationExtensionRecords:v8];
  }
}

- (void)detachAndSendNotification:(id)a3 forApplicationExtensionRecords:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v20 = self;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v24 + 1) + 8 * v13);
          if (recordSelectorsForPluginNotification_onceToken != -1) {
            dispatch_once(&recordSelectorsForPluginNotification_onceToken, &__block_literal_global_547);
          }
          if (recordSelectorsForPluginNotification_registeredSels)
          {
            long long v15 = *(const char **)recordSelectorsForPluginNotification_registeredSels;
            if (*(void *)recordSelectorsForPluginNotification_registeredSels)
            {
              long long v16 = (const char **)(recordSelectorsForPluginNotification_registeredSels + 8);
              do
              {
                id v17 = [v14 v15];
                long long v18 = *v16++;
                long long v15 = v18;
              }
              while (v18);
            }
          }
          [v14 detach];

          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    installControlsQueue = v20->_installControlsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86___LSInstallProgressService_detachAndSendNotification_forApplicationExtensionRecords___block_invoke;
    block[3] = &unk_1E522BBD8;
    id v22 = v9;
    id v23 = v6;
    dispatch_async(installControlsQueue, block);
  }
}

- (SEL)observerSelectorForNotification:(int)a3
{
  SEL result = 0;
  switch(a3)
  {
    case 1:
      SEL result = sel_applicationInstallsDidStart_;
      break;
    case 2:
      SEL result = sel_applicationInstallsDidUpdateIcon_;
      break;
    case 4:
      SEL result = sel_applicationsWillInstall_;
      break;
    case 5:
      SEL result = sel_applicationsWillUninstall_;
      break;
    case 7:
    case 10:
      SEL result = sel_applicationsDidInstall_;
      break;
    case 8:
    case 9:
      SEL result = sel_applicationsDidUninstall_;
      break;
    case 11:
      SEL result = sel_applicationsDidFailToInstall_;
      break;
    case 12:
      SEL result = sel_applicationsDidFailToUninstall_;
      break;
    case 13:
      SEL result = sel_applicationIconDidChange_;
      break;
    case 14:
      SEL result = sel_applicationsDidChangePersonas_;
      break;
    case 15:
      SEL result = sel_applicationInstallsDidChange_;
      break;
    default:
      return result;
  }
  return result;
}

- (void)sendNotification:(int)a3 forAppProxies:(id)a4 Plugins:(BOOL)a5 completion:(id)a6
{
  BOOL v32 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = (uint64_t (**)(void))a6;
  MEMORY[0x185310450]();
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke;
  v46[3] = &unk_1E522C268;
  v46[4] = self;
  double v30 = v10;
  int v29 = a3;
  double v28 = self;
  if (sendNotification_forAppProxies_Plugins_completion__onceToken != -1) {
    dispatch_once(&sendNotification_forAppProxies_Plugins_completion__onceToken, v46);
  }
  int v33 = objc_opt_new();
  double v31 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v18 = [v17 bundleType];
        char v19 = [v18 isEqualToString:@"Hidden"];

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = [v17 bundleIdentifier];
          [v11 addObject:v20];

          uint64_t v21 = [v17 bundleType];
          char v22 = [v21 isEqualToString:@"VPNPlugin"];

          if ((v22 & 1) == 0)
          {
            [v33 addObject:v17];
            if (v32)
            {
              id v23 = [v17 plugInKitPlugins];
              [v31 addObjectsFromArray:v23];
            }
          }
        }
        [v17 detach];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v14);
  }

  uint64_t v24 = [v33 count];
  if (v24)
  {
    observersQueue = v28->_observersQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2;
    block[3] = &unk_1E5231AD8;
    void block[4] = v28;
    int v40 = v29;
    id v35 = v12;
    BOOL v41 = v32;
    id v36 = v33;
    id v37 = v11;
    long long v26 = v31;
    id v38 = v31;
    long long v27 = v30;
    id v39 = v30;
    dispatch_async(observersQueue, block);
  }
  else
  {
    long long v27 = v30;
    long long v26 = v31;
    if (v30) {
      uint64_t v24 = v30[2](v30);
    }
    MEMORY[0x185310460](v24);
  }
}

- (void)sendDatabaseRebuiltNotificationToObserver:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x18530F680]();
  uint64_t v5 = [v3 connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke;
  v8[3] = &unk_1E522C740;
  id v6 = v3;
  id v9 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 databaseWasRebuilt];
}

- (void)sendDatabaseRebuiltNotification
{
  id v3 = (void *)os_transaction_create();
  observersQueue = self->_observersQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke;
  v6[3] = &unk_1E522BBD8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(observersQueue, v6);
}

- (id)_prepareApplicationProxiesForNotification:(int)a3 identifiers:(id)a4 withPlugins:(BOOL)a5
{
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__56;
  id v23 = __Block_byref_object_dispose__56;
  id v24 = (id)objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  id v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = a3 == 15 || (a3 - 1) < 3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke;
  v14[3] = &unk_1E5231B00;
  id v11 = v7;
  BOOL v17 = v10;
  id v15 = v11;
  long long v16 = &v19;
  BOOL v18 = a5;
  -[LSDBExecutionContext syncRead:](v8, v14);

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v13 = a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x18530F680]();
  id v12 = [(_LSInstallProgressService *)self _prepareApplicationProxiesForNotification:v8 identifiers:v13 withPlugins:v7];
  [(_LSInstallProgressService *)self sendNotification:v8 forAppProxies:v12 Plugins:v7 completion:v10];
}

- (void)loadProportions
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Couldn't deserialize proportion state: got %@, error %@");
}

- (void)saveProportions
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Could not write progress proportions: %@", v2, v3, v4, v5, v6);
}

- (void)coalesceProportionsSave
{
  uint64_t v3 = _LSProgressLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_INFO, "Coalescing progress proportions save", v6, 2u);
  }

  progressProportionsSaveTimerSource = self->_progressProportionsSaveTimerSource;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(progressProportionsSaveTimerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)discardProportionsForBundleID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  dispatch_time_t v5 = _LSProgressLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "Discarding proportions for %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableDictionary *)self->_progressProportions removeObjectForKey:v4];
  [(_LSInstallProgressService *)self coalesceProportionsSave];
  os_unfair_lock_unlock(&self->_progressProportionsLock);
}

- (id)progressProportionsForBundleID:(id)a3
{
  p_progressProportionsLock = &self->_progressProportionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_progressProportionsLock);
  int v6 = [(NSMutableDictionary *)self->_progressProportions objectForKeyedSubscript:v5];

  id v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(p_progressProportionsLock);

  return v7;
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)MEMORY[0x18530F680]();
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__56;
  long long v27 = __Block_byref_object_dispose__56;
  id v28 = 0;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  _LSServer_DatabaseExecutionContext();
  id v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke;
  uint64_t v20 = &unk_1E5231B28;
  id v13 = v9;
  id v21 = v13;
  char v22 = &v23;
  -[LSDBExecutionContext syncRead:](v12, &v17);

  uint64_t v14 = _LSProgressLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v24[5];
    *(_DWORD *)long long buf = 138412802;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "Setting progress proportions for %@ to %@, error is %@", buf, 0x20u);
  }

  if (!v24[5])
  {
    long long v16 = objc_msgSend(v8, "copy", v17, v18, v19, v20);
    [(NSMutableDictionary *)self->_progressProportions setObject:v16 forKeyedSubscript:v13];

    [(_LSInstallProgressService *)self coalesceProportionsSave];
  }

  os_unfair_lock_unlock(&self->_progressProportionsLock);
  v10[2](v10, v24[5]);
  _Block_object_dispose(&v23, 8);
}

- (void)sendNetworkUsageChangedNotification
{
  installControlsQueue = self->_installControlsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke;
  block[3] = &unk_1E522C268;
  void block[4] = self;
  dispatch_async(installControlsQueue, block);
}

- (void)addSendNotificationFenceWithTimeout:(double)a3 fenceBlock:(id)a4
{
  id v6 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__332;
  v28[4] = __Block_byref_object_dispose__333;
  id v29 = (id)MEMORY[0x18530F950]();
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__56;
  long long v26 = __Block_byref_object_dispose__56;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__56;
  v20[4] = __Block_byref_object_dispose__56;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke;
  v19[3] = &unk_1E5231B50;
  v19[4] = v28;
  v19[5] = &v22;
  v19[6] = v20;
  id v7 = (void *)MEMORY[0x18530F950](v19);
  if (a3 >= 0.0 && ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
    || (unint64_t)(*(void *)&a3 - 1) <= 0xFFFFFFFFFFFFELL)
  {
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_observersQueue);
    id v11 = (void *)v23[5];
    v23[5] = (uint64_t)v10;

    id v12 = v23[5];
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    dispatch_source_set_event_handler((dispatch_source_t)v23[5], v7);
    dispatch_resume((dispatch_object_t)v23[5]);
  }
  observersQueue = self->_observersQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_334;
  v16[3] = &unk_1E5231BC8;
  id v17 = v7;
  uint64_t v18 = v20;
  v16[4] = self;
  id v15 = v7;
  dispatch_async(observersQueue, v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
}

- (id)loadJournalledNotificationsFromDisk
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = 0x1E4F28000uLL;
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(id)__LSDefaultsGetSharedInstance() installJournalDirectoryURL];
  id v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:&__block_literal_global_338];

  id v6 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v34 = v6;
    id v9 = 0;
    uint64_t v10 = *(void *)v41;
    unint64_t v11 = 0x1E4F1C000uLL;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v35 = v8;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        uint64_t v14 = *(void **)(v11 + 2488);
        id v39 = v9;
        id v15 = [v14 dataWithContentsOfURL:v13 options:8 error:&v39];
        id v16 = v39;

        if (!v16)
        {
          uint64_t v18 = v10;
          unint64_t v19 = v11;
          unint64_t v20 = v2;
          id v21 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v22 = objc_opt_class();
          id v38 = 0;
          id v17 = objc_msgSend(v21, "ls_unarchivedObjectOfClass:fromData:error:", v22, v15, &v38);
          id v16 = v38;
          uint64_t v23 = _LSInstallLog();
          uint64_t v24 = v23;
          if (v16)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              long long v45 = v13;
              __int16 v46 = 2112;
              uint64_t v47 = (uint64_t)v16;
              _os_log_error_impl(&dword_182959000, v24, OS_LOG_TYPE_ERROR, "Error unarchiving notification journal %@: %@", buf, 0x16u);
            }
            goto LABEL_12;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = [v17 primaryBundleID];
            uint64_t v29 = [v17 installOperation];
            *(_DWORD *)long long buf = 138412546;
            long long v45 = v28;
            __int16 v46 = 2048;
            uint64_t v47 = v29;
            _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Loaded notification journaller for %@, install op %lu", buf, 0x16u);
          }
          if ([v17 applicableForCurrentDatabase])
          {
            [v34 addObject:v17];
          }
          else
          {
            uint64_t v24 = _LSInstallLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [v17 primaryBundleID];
              uint64_t v31 = [v17 installOperation];
              *(_DWORD *)long long buf = 138412546;
              long long v45 = v30;
              __int16 v46 = 2048;
              uint64_t v47 = v31;
              _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Notification journaller for %@, install op %lu, not applicable for current database", buf, 0x16u);
            }
LABEL_12:
          }
          unint64_t v2 = v20;
          unint64_t v11 = v19;
          uint64_t v10 = v18;
          uint64_t v8 = v35;
          goto LABEL_14;
        }
        id v17 = _LSInstallLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          long long v45 = v13;
          __int16 v46 = 2112;
          uint64_t v47 = (uint64_t)v16;
          _os_log_error_impl(&dword_182959000, v17, OS_LOG_TYPE_ERROR, "Error reading install notification journal %@: %@", buf, 0x16u);
        }
LABEL_14:

        uint64_t v25 = [*(id *)(v2 + 3256) defaultManager];
        id v37 = 0;
        char v26 = [v25 removeItemAtURL:v13 error:&v37];
        id v9 = v37;

        if ((v26 & 1) == 0)
        {
          id v27 = _LSInstallLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            long long v45 = v13;
            __int16 v46 = 2112;
            uint64_t v47 = (uint64_t)v9;
            _os_log_error_impl(&dword_182959000, v27, OS_LOG_TYPE_ERROR, "Error unlinking notification journal file at %@: %@", buf, 0x16u);
          }
        }
        ++v12;
      }
      while (v8 != v12);
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      uint64_t v8 = v32;
      if (!v32)
      {

        id v6 = v34;
        break;
      }
    }
  }

  [v6 sortUsingComparator:&__block_literal_global_342];

  return v6;
}

- (void)performJournalRecovery
{
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke;
  block[3] = &unk_1E522C268;
  void block[4] = self;
  dispatch_sync(observersQueue, block);
  id v4 = self->_observersQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_2;
  v5[3] = &unk_1E522C268;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (void)dispatchJournalledNotificationsToConnectedClients
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_journalledNotificationsToReplay;
  uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v3;
        id v4 = *(void **)(*((void *)&v25 + 1) + 8 * v3);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v5 = [v4 journalledNotifications];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v11 = [v10 notification];
              uint64_t v12 = [v10 bundleIDs];
              dispatch_time_t v13 = -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:](self, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", v11, v12, [v10 includePlugins]);

              uint64_t v14 = _LSInstallLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                int v15 = [v10 notification];
                int v16 = [v10 includePlugins];
                *(_DWORD *)long long buf = 67109634;
                int v30 = v15;
                __int16 v31 = 2112;
                uint64_t v32 = v13;
                __int16 v33 = 1024;
                int v34 = v16;
                _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "dispatching journalled notification: %d for %@ (plugins: %d)", buf, 0x18u);
              }

              -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:](self, "sendNotification:forAppProxies:Plugins:completion:", [v10 notification], v13, objc_msgSend(v10, "includePlugins"), 0);
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v19);
  }
}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserverProxy:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v22 = a5;
  id v9 = [(_LSInstallProgressService *)self observerSelectorForNotification:v6];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "bundleType", v20);
          if ([v17 isEqualToString:@"Hidden"])
          {
          }
          else
          {
            uint64_t v18 = [v16 bundleType];
            char v19 = [v18 isEqualToString:@"VPNPlugin"];

            if ((v19 & 1) == 0) {
              [v11 addObject:v16];
            }
          }
          objc_msgSend(v22, v10, v11);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    id v8 = v20;
  }
}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserver:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v8 connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke;
  v13[3] = &unk_1E522C740;
  id v14 = v8;
  id v11 = v8;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v13];

  [(_LSInstallProgressService *)self directlySendNotification:v6 withProxies:v9 toObserverProxy:v12];
}

- (void)dispatchJournalledNotificationsToObserver:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSProgressLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v48 = (unint64_t)v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "Sending journalled notifications to newly connecting observer %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 connection];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke;
  v44[3] = &unk_1E522C740;
  id v27 = v4;
  id v45 = v27;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v44];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = self->_journalledNotificationsToReplay;
  uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v8;
        id v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v10 = [v9 journalledNotifications];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              int v16 = _LSProgressLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                unint64_t v17 = [v15 notification];
                uint64_t v18 = [v15 bundleIDs];
                *(_DWORD *)long long buf = 134218242;
                unint64_t v48 = v17;
                __int16 v49 = 2112;
                __int16 v50 = v18;
                _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_INFO, "Sending notification %lu for bundles %@ to observer.", buf, 0x16u);
              }
              uint64_t v19 = [v15 notification];
              id v20 = [v15 bundleIDs];
              long long v21 = -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:](self, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", v19, v20, [v15 includePlugins]);

              -[_LSInstallProgressService directlySendNotification:withProxies:toObserverProxy:](self, "directlySendNotification:withProxies:toObserverProxy:", [v15 notification], v21, v7);
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v51 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v30);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = self->_startupJournalledNotifications;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * j) dispatchToObserver:v27 forInstallProgressService:self];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProportions, 0);
  objc_storeStrong((id *)&self->_progressProportionsSaveTimerSource, 0);
  objc_storeStrong((id *)&self->_startupJournalledNotifications, 0);
  objc_storeStrong((id *)&self->_journalledNotificationsToReplay, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_installControlsQueue, 0);
  objc_storeStrong((id *)&self->_installTypes, 0);
  objc_storeStrong((id *)&self->_inactiveInstalls, 0);
  objc_storeStrong((id *)&self->_orderedInstalls, 0);
  objc_storeStrong((id *)&self->_installIndexes, 0);
  objc_storeStrong((id *)&self->_publishingStrings, 0);
  objc_storeStrong((id *)&self->_progresses, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Failed to parse. observeValueForKeyPath: %@ does not contain period", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "In observeValueForKeyPath:%@ could not find appProxy for %@, it may have been removed");
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "In observeValueForKeyPath:%@ could not find parent progress for %@, it may have been removed");
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182959000, a3, (uint64_t)a3, "LSInstallProgress: setting parent installState to %@", (uint8_t *)a2);
}

- (void)parentProgressForApplication:(void *)a1 andPhase:(uint64_t)a2 isActive:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 _LSDescription];
  OUTLINED_FUNCTION_2_8();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_182959000, a3, OS_LOG_TYPE_DEBUG, "Got parent progress %@ for app %@, ", v6, 0x16u);
}

- (void)installationFailedForApplication:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_3(&dword_182959000, v0, v1, "Could not find applicationProxy for %@ in installationFailedForApplication:", v2);
}

- (void)installationFailedForApplication:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Installation failed for %@", v2, v3, v4, v5, v6);
}

@end
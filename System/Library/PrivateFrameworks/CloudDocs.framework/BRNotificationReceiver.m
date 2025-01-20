@interface BRNotificationReceiver
- (BRNotificationReceiver)init;
- (BRNotificationReceiverDelegate)delegate;
- (double)batchingDelay;
- (id)_obtainNotificationSenderFromDaemon;
- (unint64_t)batchingChanges;
- (unint64_t)pendingCount;
- (void)_invalidateAndNotify:(BOOL)a3;
- (void)_obtainNotificationSenderFromDaemon;
- (void)_receiveUpdates:(id)a3;
- (void)_signalSourceIfNeeded;
- (void)_watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5;
- (void)dealloc;
- (void)dequeue:(unint64_t)a3 block:(id)a4;
- (void)disableUpdatesFromIPCBeforeStitching;
- (void)enableUpdatesFromIPCAfterStitching;
- (void)flush;
- (void)init;
- (void)invalidate;
- (void)invalidateAndDontNotifyDelegate;
- (void)invalidateAndNotify:(BOOL)a3;
- (void)networkDidChangeReachabilityStatusTo:(BOOL)a3;
- (void)receiveProgressUpdates:(id)a3 reply:(id)a4;
- (void)receiveStitchingUpdates:(id)a3;
- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6;
- (void)resume;
- (void)setBatchingChanges:(unint64_t)a3;
- (void)setBatchingDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)suspend;
- (void)watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5;
@end

@implementation BRNotificationReceiver

- (BRNotificationReceiver)init
{
  v40.receiver = self;
  v40.super_class = (Class)BRNotificationReceiver;
  id v2 = [(BRNotificationReceiver *)&v40 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.br.notifs-receiver", v4);

    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = *((void *)v2 + 1);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.br.notifs-receiver.ipc", v9, v8);

    v11 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v10;

    v12 = objc_alloc_init(BRNotificationQueue);
    v13 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v12;

    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v15 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v14;

    if (!*((void *)v2 + 7))
    {
      v32 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver init]", 47);
      v33 = brc_default_log(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[BRNotificationReceiver init]();
      }
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v18;

    objc_initWeak(&location, v2);
    v20 = (void *)*((void *)v2 + 7);
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __30__BRNotificationReceiver_init__block_invoke;
    v37 = &unk_1E59AE2E8;
    objc_copyWeak(&v38, &location);
    id v21 = v20;
    v22 = &v34;
    v23 = v21;
    v24 = v22;
    v25 = v24;
    v26 = v24;
    if (brc_block_remember_persona)
    {
      v26 = brc_block_remember_persona(v24);
    }
    dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v26);
    dispatch_source_set_event_handler(v23, v27);

    *((_DWORD *)v2 + 31) = -1;
    atomic_store(1u, (unsigned int *)v2 + 30);
    v28 = objc_msgSend(MEMORY[0x1E4FB36F8], "sharedManager", v34, v35, v36, v37);
    uint64_t v29 = objc_msgSend(v28, "br_currentPersonaID");
    v30 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v29;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return (BRNotificationReceiver *)v2;
}

void __30__BRNotificationReceiver_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[3] count];
    id v2 = v8;
    if (v3)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)v8[1]);
      v8[12] = (id)brc_monotonic_time_now();
      [v8[6] notificationsReceiverDidReceiveNotificationsBatch:v8];
      id v2 = v8;
      v4 = v8[9];
      dispatch_queue_t v5 = v8[10];
      BOOL v6 = v4 >= v5;
      v7 = (void *)(v4 - v5);
      if (v6) {
        v8[9] = v7;
      }
    }
  }
  [v2 _signalSourceIfNeeded];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _timer == nil%@", v2, v3, v4, v5, v6);
}

- (unint64_t)pendingCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__BRNotificationReceiver_pendingCount__block_invoke;
  v5[3] = &unk_1E59AE180;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__BRNotificationReceiver_pendingCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dequeue:(unint64_t)a3 block:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  [(BRNotificationQueue *)self->_notifs dequeue:a3 block:v7];
}

- (id)_obtainNotificationSenderFromDaemon
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[BRDaemonConnection defaultConnection];
  uint64_t v4 = (void *)[v3 newSyncProxy];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke;
  v23[3] = &unk_1E59AE330;
  id v5 = v4;
  id v24 = v5;
  v25 = self;
  [v5 getItemUpdateSenderWithReceiver:self reply:v23];
  uint64_t v6 = [v5 result];
  if (v6)
  {
    objc_storeStrong((id *)&self->_sender, v6);
    [v6 boostPriority:&__block_literal_global_19];
  }
  else
  {
    id v7 = [v5 error];

    if (v7)
    {
      uint64_t v8 = [v5 error];
      int v9 = objc_msgSend(v8, "br_isCloudDocsErrorCode:", 2);

      if (v9)
      {
        dispatch_queue_t v10 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 151);
        v11 = brc_default_log(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          dispatch_block_t v27 = v10;
          _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot query iCloud Drive items because we are logged out%@", buf, 0xCu);
        }
      }
      else
      {
        dispatch_queue_t v10 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 153);
        v11 = brc_default_log(0);
        if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
          [(BRNotificationReceiver *)v5 _obtainNotificationSenderFromDaemon];
        }
      }

      dispatch_source_t v14 = [v5 error];
      v15 = [v14 domain];
      int v16 = [v15 isEqualToString:@"BRCloudDocsErrorDomain"];

      if (v16) {
        [(BRNotificationReceiverDelegate *)self->_delegate notificationsReceiverDidFinishGathering:self];
      }
      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_21;
      v22[3] = &unk_1E59AE358;
      v22[4] = self;
      id v18 = [v17 addObserverForName:@"BRAccountTokenDidChangeNotification" object:0 queue:0 usingBlock:v22];
      accountTokenDidChangeNotificationObserver = self->_accountTokenDidChangeNotificationObserver;
      self->_accountTokenDidChangeNotificationObserver = v18;
    }
    else
    {
      v12 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 176);
      v13 = brc_default_log(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRNotificationReceiver _obtainNotificationSenderFromDaemon]();
      }
    }
  }
  id v20 = v6;

  return v20;
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  dispatch_queue_t v10 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 113);
  v11 = brc_default_log(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_cold_1();
  }

  [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_14];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_14;
  v14[3] = &unk_1E59AD448;
  v12 = *(void **)(a1 + 32);
  v14[4] = *(void *)(a1 + 40);
  v13 = [v9 remoteObjectProxyWithErrorHandler:v14];

  [v12 setObjResult:v13 error:v8];
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v6 = 0;
  }
  if (BRCurrentProcessIsOwningContainerWithID(v4))
  {
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v8 = +[BRContainer versionOfBundle:v7 changedFromVersion:v6];

    if (v8)
    {
      id v9 = +[BRDaemonConnection defaultConnection];
      dispatch_queue_t v10 = (void *)[v9 newSyncProxy];

      [v10 updateContainerMetadataForID:v4];
    }
  }
  v11 = [v5 objectForKey:@"extension"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    [v12 bytes];
    if (sandbox_extension_consume() < 0)
    {
      int v13 = *__error();
      dispatch_source_t v14 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 133);
      v15 = brc_default_log(0);
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        int v16 = 138412802;
        id v17 = v12;
        __int16 v18 = 1024;
        int v19 = v13;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_error_impl(&dword_19ED3F000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", (uint8_t *)&v16, 0x1Cu);
      }

      *__error() = v13;
    }
  }
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 139, v7);
  id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 139);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v7[0];
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ got error %@%@", buf, 0x2Au);
  }

  [*(id *)(a1 + 32) invalidate];
  __brc_leave_section((uint64_t)v7);
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(*(void *)(a1 + 32) + 144) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v4 = *(id *)(*(void *)(a1 + 32) + 144)) == 0)
  {
    if (_block_invoke___personaOnceToken_0 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_0, &__block_literal_global_24);
    }
    id v5 = (id)_block_invoke___personalPersona_0;
    int v6 = 1;
  }
  else
  {
    id v5 = v4;
    int v6 = 0;
  }
  id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  BOOL v8 = [v7 currentPersona];

  id v25 = 0;
  id v9 = [v8 userPersonaUniqueString];
  __int16 v10 = v9;
  if (v9 == v5 || ([v9 isEqualToString:v5] & 1) != 0)
  {
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v24 = 0;
    __int16 v14 = (void *)[v8 copyCurrentPersonaContextWithError:&v24];
    id v15 = v24;
    id v16 = v25;
    id v25 = v14;

    if (v15)
    {
      id v17 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      __int16 v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    uint64_t v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (v11)
    {
      int v19 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      __int16 v20 = brc_default_log(0);
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 144);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        dispatch_block_t v27 = v19;
        _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v6 && ([v8 isDataSeparatedPersona] & 1) == 0)
    {
      int v19 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      __int16 v20 = brc_default_log(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      uint64_t v11 = 0;
      goto LABEL_29;
    }
    uint64_t v22 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
    v23 = brc_default_log(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 172, buf);
  __int16 v12 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 172);
  id v13 = brc_default_log(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_21_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  __brc_leave_section((uint64_t)buf);

  _BRRestorePersona(&v25);
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke___personalPersona_0;
  _block_invoke___personalPersona_0 = v0;
}

- (void)_watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v70 = a4;
  id v71 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v69 = v8;
  if (!self->_sender)
  {
    v68 = self;
    [(BRNotificationReceiver *)self resume];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v106 objects:v110 count:16];
    if (v10)
    {
      __int16 v72 = 0;
      v73 = 0;
      os_log_t oslog = 0;
      int v77 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v13 = *(void *)v107;
      uint64_t v14 = *MEMORY[0x1E4F28638];
      uint64_t v15 = *MEMORY[0x1E4F28640];
      uint64_t v16 = *MEMORY[0x1E4F28610];
      uint64_t v75 = *MEMORY[0x1E4F28628];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v107 != v13) {
            objc_enumerationMutation(v9);
          }
          __int16 v18 = *(void **)(*((void *)&v106 + 1) + 8 * v17);
          if ([v18 isEqual:v14])
          {
            int v12 = 1;
          }
          else if ([v18 isEqual:v15])
          {
            int v11 = 1;
          }
          else if ([v18 isEqual:v16] & 1) != 0 || (objc_msgSend(v18, "isEqual:", v75))
          {
            int v77 = 1;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (oslog)
              {
                id v25 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 233);
                v26 = brc_default_log(0);
                if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
                  -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]();
                }
LABEL_41:

                goto LABEL_111;
              }
              os_log_t oslog = v18;
              __int16 v72 = 10;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v25 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 247);
                v26 = brc_default_log(0);
                if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
                  -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.4();
                }
                goto LABEL_41;
              }
              int v19 = v73;
              if (!v73)
              {
                int v19 = [MEMORY[0x1E4F1CA48] array];
              }
              v73 = v19;
              [v19 addObject:v18];
            }
          }
          ++v17;
        }
        while (v10 != v17);
        uint64_t v20 = [v9 countByEnumeratingWithState:&v106 objects:v110 count:16];
        uint64_t v10 = v20;
      }
      while (v20);
    }
    else
    {
      __int16 v72 = 0;
      v73 = 0;
      os_log_t oslog = 0;
      int v77 = 0;
      int v11 = 0;
      int v12 = 0;
    }

    if ((dyld_get_active_platform() & 0xFFFFFFFB) == 2
      && (dyld_program_sdk_at_least() & 1) == 0
      && !(v77 & 1 | (((v12 | v11) & 1) == 0)))
    {
      uint64_t v21 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 258);
      uint64_t v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]();
      }

      int v77 = 1;
    }
    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__5;
    v104 = __Block_byref_object_dispose__5;
    id v105 = 0;
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke;
    v99[3] = &unk_1E59AD448;
    v99[4] = v68;
    v76 = (void *)MEMORY[0x19F3C48D0](v99);
    if (v11 & v12)
    {
      v23 = objc_msgSend(v71, "br_watchedURL");
      if (v23)
      {
        __int16 v24 = 9;
      }
      else
      {
        v23 = objc_msgSend(v71, "br_urlWithWatchedChildren");
        if (!v23) {
          goto LABEL_49;
        }
        __int16 v24 = 10;
      }
      __int16 v72 = v24;
      if (oslog)
      {
        dispatch_block_t v27 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 294);
        uint64_t v28 = brc_default_log(0);
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
          -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]();
        }

        goto LABEL_110;
      }
      os_log_t oslog = v23;
    }
LABEL_49:
    if (v11)
    {
      v23 = [v71 extractSearchTermFromPredicate];
    }
    else
    {
      v23 = 0;
    }
    if (oslog)
    {
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31;
      v94[3] = &unk_1E59AE380;
      v97 = &v100;
      v95[0] = oslog;
      v95[1] = v68;
      __int16 v98 = v72;
      id v96 = v76;
      BRPerformWithPersonaAndErrorForURLIfAble(v95[0], v94);

      uint64_t v29 = v95;
LABEL_104:

LABEL_105:
      if (v68->_sender)
      {
        uint64_t v86 = 0;
        v87 = (int *)&v86;
        uint64_t v88 = 0x2020000000;
        int v89 = 0;
        BRNotificationNameForServerAvailabilityChanges();
        id v53 = objc_claimAutoreleasedReturnValue();
        v54 = (const char *)[v53 UTF8String];
        v55 = v87;
        queue = v68->_queue;
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_36;
        v82[3] = &unk_1E59AE3A8;
        v85 = &v86;
        id v57 = v53;
        id v83 = v57;
        v84 = v68;
        v58 = queue;
        v59 = v82;
        v60 = [MEMORY[0x1E4FB36F8] sharedManager];
        v61 = objc_msgSend(v60, "br_currentPersonaID");

        *(void *)handler = MEMORY[0x1E4F143A8];
        *(void *)&handler[8] = 3221225472;
        *(void *)&handler[16] = __br_notify_register_dispatch_block_invoke_3;
        v112 = &unk_1E59AD580;
        id v62 = v61;
        id v113 = v62;
        v115 = v54;
        v63 = v59;
        id v114 = v63;
        notify_register_dispatch(v54, v55 + 6, v58, handler);

        v68->_networkReachabilityToken = v87[6];
        v64 = v68->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_2;
        block[3] = &unk_1E59AE3D0;
        v80 = v68;
        v81 = &v86;
        id v79 = v57;
        id v65 = v57;
        dispatch_async(v64, block);

        _Block_object_dispose(&v86, 8);
      }
      else
      {
        v66 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 379);
        v67 = brc_default_log(1);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(void *)&handler[4] = v9;
          *(_WORD *)&handler[12] = 2112;
          *(void *)&handler[14] = v66;
          _os_log_impl(&dword_19ED3F000, v67, OS_LOG_TYPE_DEFAULT, "[WARNING] This NSMetadataQuery did not watch anything (scopes: %@)%@", handler, 0x16u);
        }
      }
      goto LABEL_110;
    }
    if ([v23 length])
    {
      uint64_t v30 = [(BRNotificationReceiver *)v68 _obtainNotificationSenderFromDaemon];
      v31 = (void *)v101[5];
      v101[5] = v30;

      if (v101[5])
      {
        int active_platform = dyld_get_active_platform();
        if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
        {
          if (!dyld_program_sdk_at_least())
          {
            int v38 = 1;
            goto LABEL_75;
          }
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
        }
        int v38 = 9;
LABEL_75:
        int v39 = dyld_get_active_platform();
        if ((v39 & 0xFFFFFFFB) == 2 || v39 == 1 || v39 == 11)
        {
          int v40 = dyld_program_sdk_at_least();
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v39);
          int v40 = 1;
        }
        int v41 = [v71 isFolderOnlyPredicate];
        unsigned int v42 = v38 | 0x10;
        if (!v40) {
          unsigned int v42 = v38;
        }
        if (v41) {
          uint64_t v43 = v42 | 0x40;
        }
        else {
          uint64_t v43 = v42;
        }
        v44 = (void *)v101[5];
        v45 = v92;
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_34;
        v92[3] = &unk_1E59ADD58;
        v92[4] = v9;
        id v93 = v76;
        [v44 watchItemsNamesPrefixedBy:v23 inScopes:v43 appLibraryIDs:v73 gatherReply:v92];

LABEL_103:
        uint64_t v29 = (id *)(v45 + 4);
        goto LABEL_104;
      }
LABEL_110:

      _Block_object_dispose(&v100, 8);
      goto LABEL_111;
    }
    if (((v11 | v12 | v77) & 1) == 0) {
      goto LABEL_105;
    }
    uint64_t v33 = [(BRNotificationReceiver *)v68 _obtainNotificationSenderFromDaemon];
    uint64_t v34 = (void *)v101[5];
    v101[5] = v33;

    if (!v101[5]) {
      goto LABEL_110;
    }
    int v35 = v11;
    if (v12) {
      int v35 = v11 & 1 | 2;
    }
    if (v77) {
      int v36 = v35 | 4;
    }
    else {
      int v36 = v35;
    }
    int v37 = dyld_get_active_platform();
    if ((v37 & 0xFFFFFFFB) == 2 || v37 == 1 || v37 == 11)
    {
      if (!dyld_program_sdk_at_least())
      {
LABEL_90:
        int v46 = dyld_get_active_platform();
        if ((v46 & 0xFFFFFFFB) == 2 || v46 == 1 || v46 == 11)
        {
          int v47 = dyld_program_sdk_at_least();
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v46);
          int v47 = 1;
        }
        int v48 = [v71 isFolderOnlyPredicate];
        unsigned int v49 = v36 | 0x10;
        if (!v47) {
          unsigned int v49 = v36;
        }
        if (v48) {
          uint64_t v50 = v49 | 0x40;
        }
        else {
          uint64_t v50 = v49;
        }
        v45 = v90;
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_35;
        v90[3] = &unk_1E59ADD58;
        v90[4] = v9;
        id v91 = v76;
        v51 = (void *)MEMORY[0x19F3C48D0](v90);
        v52 = (void *)v101[5];
        if (v73) {
          [v52 watchScopes:v50 appLibraryIDs:v73 gatherReply:v51];
        }
        else {
          [v52 watchScopes:v50 gatherReply:v51];
        }

        goto LABEL_103;
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", v37);
    }
    v36 |= 8u;
    goto LABEL_90;
  }
  v73 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 197);
  brc_default_log(0);
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT)) {
    -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.5();
  }
LABEL_111:
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 268);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] gathering failed: %@%@", buf, 0x16u);
    }
  }
  else
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 270);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_cold_1();
    }
  }

  int v6 = objc_msgSend(v3, "br_isPOSIXErrorCode:", 4);
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 invalidate];
  }
  else
  {
    id v8 = v7[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_30;
    block[3] = &unk_1E59AD3B0;
    void block[4] = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "notificationsReceiverDidFinishGathering:");
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  if (v8)
  {
    id v9 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 307);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31_cold_2();
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "br_isInSyncedLocation"))
  {
    if (v7)
    {
      id v11 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 315);
      __int16 v12 = brc_default_log(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31_cold_1();
      }
    }
    uint64_t v13 = [*(id *)(a1 + 40) _obtainNotificationSenderFromDaemon];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(unsigned __int16 *)(a1 + 64);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_32;
    v19[3] = &unk_1E59ADD58;
    id v20 = v17;
    id v21 = *(id *)(a1 + 48);
    [v16 watchItemAtURL:v20 options:v18 gatherReply:v19];
  }
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 323);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for children of '%@' failed: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 342);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for scopes %@ failed: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 367);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for scopes %@ failed: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_36(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) == a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 1;
    brc_notify_get_state(a2, &v3, [*(id *)(result + 32) UTF8String]);
    return [*(id *)(v2 + 40) networkDidChangeReachabilityStatusTo:v3 != 0];
  }
  return result;
}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = 1;
  brc_notify_get_state(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &v3, [*(id *)(a1 + 32) UTF8String]);
  return [*(id *)(a1 + 40) networkDidChangeReachabilityStatusTo:v3 != 0];
}

- (void)watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__BRNotificationReceiver_watchUbiquitousScopes_bundleID_predicate___block_invoke;
  v15[3] = &unk_1E59AE3F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __67__BRNotificationReceiver_watchUbiquitousScopes_bundleID_predicate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _watchUbiquitousScopes:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) predicate:*(void *)(a1 + 56)];
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int add = atomic_fetch_add(&self->_suspendCount, 1u);
  if (!add) {
    dispatch_suspend((dispatch_object_t)self->_source);
  }
  id v4 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver suspend]", 419);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138413058;
    int v7 = self;
    __int16 v8 = 1024;
    unsigned int v9 = add;
    __int16 v10 = 1024;
    unsigned int v11 = add + 1;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: suspended (%d->%d)%@", (uint8_t *)&v6, 0x22u);
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: suspendCount >= 0%@", v2, v3, v4, v5, v6);
}

- (void)flush
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BRNotificationReceiver_flush__block_invoke;
  block[3] = &unk_1E59AD3B0;
  void block[4] = self;
  dispatch_sync(queue, block);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_39);
}

void __31__BRNotificationReceiver_flush__block_invoke(uint64_t a1)
{
}

- (void)_invalidateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_accountTokenDidChangeNotificationObserver)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_accountTokenDidChangeNotificationObserver];

    accountTokenDidChangeNotificationObserver = self->_accountTokenDidChangeNotificationObserver;
    self->_accountTokenDidChangeNotificationObserver = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v7 = [(NSMutableDictionary *)self->_progressObserverByID allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) stop];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  [(NSMutableDictionary *)self->_progressObserverByID removeAllObjects];
  if (!self->_isInvalidated)
  {
    int networkReachabilityToken = self->_networkReachabilityToken;
    if (networkReachabilityToken != -1) {
      notify_cancel(networkReachabilityToken);
    }
    [(BRItemNotificationSending *)self->_sender invalidate];
    sender = self->_sender;
    self->_sender = 0;

    self->_isInvalidated = 1;
    uint64_t v14 = self->_delegate;
    [(BRNotificationReceiver *)self setDelegate:0];
    if (v3)
    {
      ipcQueue = self->_ipcQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __47__BRNotificationReceiver__invalidateAndNotify___block_invoke;
      v18[3] = &unk_1E59AD648;
      int v19 = v14;
      id v20 = self;
      dispatch_async(ipcQueue, v18);
    }
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      id v17 = self->_timer;
      self->_timer = 0;
    }
    dispatch_source_cancel((dispatch_source_t)self->_source);
  }
}

uint64_t __47__BRNotificationReceiver__invalidateAndNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationsReceiverDidInvalidate:*(void *)(a1 + 40)];
}

- (void)invalidateAndNotify:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_isInvalidated)
  {
    memset(v10, 0, sizeof(v10));
    __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver invalidateAndNotify:]", 492, v10);
    uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver invalidateAndNotify:]", 492);
    uint8_t v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = v10[0];
      __int16 v13 = 2112;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating notifications from %@%@", buf, 0x20u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BRNotificationReceiver_invalidateAndNotify___block_invoke;
    block[3] = &unk_1E59AE420;
    void block[4] = self;
    BOOL v9 = a3;
    dispatch_sync(queue, block);
    __brc_leave_section((uint64_t)v10);
  }
}

uint64_t __46__BRNotificationReceiver_invalidateAndNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAndNotify:*(unsigned __int8 *)(a1 + 40)];
}

- (void)invalidate
{
}

- (void)invalidateAndDontNotifyDelegate
{
}

- (void)_signalSourceIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@ notify delegate now%@");
}

void __47__BRNotificationReceiver__signalSourceIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _signalSourceIfNeeded]_block_invoke", 544, v9);
  uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _signalSourceIfNeeded]_block_invoke", 544);
  BOOL v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v9[0];
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ notification timer fired%@", buf, 0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(v4 + 80);
  if (*(void *)(v4 + 72) < v5)
  {
    *(void *)(v4 + 72) = v5;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v4 + 24) count]) {
    dispatch_source_merge_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56), 1uLL);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = 0;

  __brc_leave_section((uint64_t)v9);
}

- (void)_receiveUpdates:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalidated)
  {
    BOOL isNetworkReachable = self->_isNetworkReachable;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (!v6) {
      goto LABEL_34;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v10 fileObjectID];
        if (v11)
        {
          __int16 v12 = [(NSMutableDictionary *)self->_itemInTransferByID objectForKey:v11];
          if (!v12 || ![v10 isDead] || objc_msgSend(v10, "canMerge:", v12))
          {
            if ([v10 isInTransfer])
            {
              if (isNetworkReachable)
              {
                if (v12) {
                  goto LABEL_14;
                }
LABEL_20:
                itemInTransferByID = self->_itemInTransferByID;
                __int16 v15 = (void *)[v10 copy];
                [(NSMutableDictionary *)itemInTransferByID setObject:v15 forKey:v11];
              }
              else
              {
                [v10 setIsNetworkOffline:1];
                if (!v12) {
                  goto LABEL_20;
                }
LABEL_14:
                [v12 merge:v10];
              }
            }
            else
            {
              [v10 setIsNetworkOffline:0];
              [(NSMutableDictionary *)self->_itemInTransferByID removeObjectForKey:v11];
            }
            uint64_t v16 = [v10 url];
            if (v16)
            {
              uint64_t v17 = (void *)v16;
              if ([v10 isUploadActive])
              {

LABEL_25:
                int v19 = [(NSMutableDictionary *)self->_progressObserverByID objectForKey:v11];
                if (v19)
                {
                  id v20 = v19;
                  long long v21 = [(BRQueryItemProgressObserver *)v19 item];
                  [v21 merge:v10];
                }
                else
                {
                  id v20 = [[BRQueryItemProgressObserver alloc] initWithItem:v10];
                  [(BRQueryItemProgressObserver *)v20 setQueue:self->_queue];
                  v25[0] = MEMORY[0x1E4F143A8];
                  v25[1] = 3221225472;
                  v25[2] = __42__BRNotificationReceiver__receiveUpdates___block_invoke;
                  v25[3] = &unk_1E59AE448;
                  v25[4] = self;
                  [(BRQueryItemProgressObserver *)v20 setProgressHandler:v25];
                  [(NSMutableDictionary *)self->_progressObserverByID setObject:v20 forKey:v11];
                  [(BRQueryItemProgressObserver *)v20 start];
                }
LABEL_30:

                goto LABEL_31;
              }
              char v18 = [v10 isDownloadActive];

              if (v18) {
                goto LABEL_25;
              }
            }
            long long v22 = [(NSMutableDictionary *)self->_progressObserverByID objectForKey:v11];
            if (v22)
            {
              id v20 = v22;
              [(BRQueryItemProgressObserver *)v22 stop];
              [(NSMutableDictionary *)self->_progressObserverByID removeObjectForKey:v11];
              goto LABEL_30;
            }
LABEL_31:
            [(BRNotificationQueue *)self->_notifs addNotification:v10 asDead:0];
          }
        }
        else
        {
          __int16 v12 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _receiveUpdates:]", 575);
          uint64_t v13 = brc_default_log(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v12;
            _os_log_fault_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we should always have a fileObjectID%@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (!v7)
      {
LABEL_34:

        self->_receivedChanges += [v5 count];
        [(BRNotificationReceiver *)self _signalSourceIfNeeded];
        id v4 = v23;
        break;
      }
    }
  }
}

uint64_t __42__BRNotificationReceiver__receiveUpdates___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (!*(unsigned char *)(v2 + 129))
  {
    uint64_t v3 = result;
    id v4 = *(void **)(v2 + 24);
    id v5 = (void *)[a2 copy];
    [v4 addNotification:v5 asDead:0];

    ++*(void *)(*(void *)(v3 + 32) + 72);
    uint64_t v6 = *(void **)(v3 + 32);
    return [v6 _signalSourceIfNeeded];
  }
  return result;
}

- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]", 644, v26);
  __int16 v14 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]", 644);
  __int16 v15 = brc_default_log(1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v26[0];
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_debug_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx receiving %@%@", buf, 0x20u);
  }

  ipcQueue = self->_ipcQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke;
  v21[3] = &unk_1E59AE470;
  v21[4] = self;
  id v17 = v13;
  id v25 = v17;
  id v18 = v11;
  id v22 = v18;
  id v19 = v12;
  id v23 = v19;
  id v20 = v10;
  id v24 = v20;
  dispatch_async_with_logs(ipcQueue, v21);

  __brc_leave_section((uint64_t)v26);
}

void __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3C4670]();
  if (*(unsigned char *)(*(void *)(a1 + 32) + 129))
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]_block_invoke", 648);
    id v4 = brc_default_log(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if ([*(id *)(a1 + 40) count] || objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      id v5 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]_block_invoke", 653);
      uint64_t v6 = brc_default_log(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v27 = v19;
        __int16 v28 = 2112;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] received extensions\nlogical:%@\nphysical:%@%@", buf, 0x20u);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = *(id *)(a1 + 56);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v13 = *(void **)(a1 + 40);
            __int16 v14 = objc_msgSend(v12, "fileObjectID", (void)v21);
            __int16 v15 = [v13 objectForKey:v14];

            uint64_t v16 = *(void **)(a1 + 48);
            id v17 = [v12 fileObjectID];
            id v18 = [v16 objectForKey:v17];

            [v12 attachLogicalExtension:v15 physicalExtension:v18];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v9);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_receiveUpdates:", *(void *)(a1 + 56), (void)v21);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)receiveProgressUpdates:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver receiveProgressUpdates:reply:]", 672, v16);
  uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveProgressUpdates:reply:]", 672);
  uint64_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    long long v22 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx receiving progress updates %@%@", buf, 0x20u);
  }

  ipcQueue = self->_ipcQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__BRNotificationReceiver_receiveProgressUpdates_reply___block_invoke;
  v13[3] = &unk_1E59AE498;
  v13[4] = self;
  id v11 = v7;
  id v15 = v11;
  id v12 = v6;
  id v14 = v12;
  dispatch_async_with_logs(ipcQueue, v13);

  __brc_leave_section((uint64_t)v16);
}

void __55__BRNotificationReceiver_receiveProgressUpdates_reply___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 129))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 112);
          id v11 = objc_msgSend(v9, "folderID", (void)v14);
          id v12 = [v10 objectForKeyedSubscript:v11];

          if (v12)
          {
            [v12 mergeProgressUpdate:v9];
            id v13 = (void *)[v12 copy];
            [v3 addObject:v13];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 32) _receiveUpdates:v3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)networkDidChangeReachabilityStatusTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 700, v22);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 700);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = v22[0];
    if (v3) {
      long long v17 = "reachable";
    }
    else {
      long long v17 = "not reachable";
    }
    __int16 v26 = 2080;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx network is %s%@", buf, 0x20u);
  }

  self->_BOOL isNetworkReachable = v3;
  if (!self->_isInvalidated)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v8 = [(NSMutableDictionary *)self->_itemInTransferByID allValues];
    uint64_t v9 = (void *)[v7 initWithArray:v8 copyItems:1];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      BOOL v13 = !v3;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "setIsNetworkOffline:", v13, (void)v18);
        }
        while (v11 != v14);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    long long v15 = brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 713);
    long long v16 = brc_default_log(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]();
    }

    [(BRNotificationReceiver *)self _receiveUpdates:v10];
  }
  __brc_leave_section((uint64_t)v22);
}

- (void)receiveStitchingUpdates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__BRNotificationReceiver_receiveStitchingUpdates___block_invoke;
  void v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs(queue, v7);
}

uint64_t __50__BRNotificationReceiver_receiveStitchingUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveUpdates:*(void *)(a1 + 40)];
}

- (void)disableUpdatesFromIPCBeforeStitching
{
  dispatch_suspend((dispatch_object_t)self->_ipcQueue);
  queue = self->_queue;

  dispatch_sync(queue, &__block_literal_global_46);
}

- (void)enableUpdatesFromIPCAfterStitching
{
}

- (unint64_t)batchingChanges
{
  return self->_batchingChanges;
}

- (void)setBatchingChanges:(unint64_t)a3
{
  self->_batchingChanges = a3;
}

- (double)batchingDelay
{
  return self->_batchingDelay;
}

- (void)setBatchingDelay:(double)a3
{
  self->_batchingDelay = a3;
}

- (BRNotificationReceiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_accountTokenDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_itemInTransferByID, 0);
  objc_storeStrong((id *)&self->_progressObserverByID, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_ipcQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _source%@", v2, v3, v4, v5, v6);
}

- (void)_obtainNotificationSenderFromDaemon
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 error];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19ED3F000, a3, (os_log_type_t)0x90u, "[ERROR] cannot query iCloud Drive items: %@%@", (uint8_t *)&v6, 0x16u);
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] received %@%@");
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] ┏%llx received token change notification, reloading%@");
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] cannot pass more than one URL in the scopes%@", v1, 0xCu);
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] forcing external documents even if not specified%@", v2, v3, v4, v5, v6);
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] Unable to understand scope: %@%@");
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] API MISUSE: It's not allowed to call -watchUbiquitousScopes:predicate: twice%@", v2, v3, v4, v5, v6);
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] gathering completed%@", v2, v3, v4, v5, v6);
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Using persona ID for NSMDQ %@%@");
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_31_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Couldn't adopt persona in NSMDQ but falling back to daemon%@", v2, v3, v4, v5, v6);
}

void __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] skiping update process as we were invalidated%@", v2, v3, v4, v5, v6);
}

- (void)networkDidChangeReachabilityStatusTo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] updating items: %@%@");
}

@end
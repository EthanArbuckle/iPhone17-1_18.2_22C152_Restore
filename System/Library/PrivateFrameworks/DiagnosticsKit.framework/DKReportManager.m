@interface DKReportManager
- (BOOL)isCancelled;
- (DKExtensionDiscovery)discovery;
- (DKReportManager)init;
- (DKReportManager)initWithBundleIdentifier:(id)a3;
- (DKReportPlanner)planner;
- (DKReporterRegistry)registry;
- (NSArray)availableReportGenerators;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)reportManagerQueue;
- (id)sendRequestsForGroup:(id)a3 concurrent:(BOOL)a4 failOnError:(BOOL)a5 error:(id *)a6;
- (void)cancelAllReports;
- (void)reportWithComponentPredicateManifest:(id)a3 completion:(id)a4;
- (void)reportersWithCompletion:(id)a3;
- (void)setAvailableReportGenerators:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDiscovery:(id)a3;
- (void)setPlanner:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setReportManagerQueue:(id)a3;
@end

@implementation DKReportManager

- (DKReportManager)init
{
  return [(DKReportManager *)self initWithBundleIdentifier:@"Default"];
}

- (DKReportManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DKReportManager;
  v6 = [(DKReportManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = objc_opt_new();
    registry = v7->_registry;
    v7->_registry = (DKReporterRegistry *)v8;

    uint64_t v10 = +[DKReportPlanner plannerWithReportGeneratorRegistry:v7->_registry];
    planner = v7->_planner;
    v7->_planner = (DKReportPlanner *)v10;

    v12 = v7->_registry;
    v13 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.diagnostics-reporter-service"];
    uint64_t v14 = +[DKExtensionDiscovery discoveryUsingExtensionRegistry:v12 services:v13 bundleIdentifier:v7->_bundleIdentifier];
    discovery = v7->_discovery;
    v7->_discovery = (DKExtensionDiscovery *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.DiagnosticsKit.reportManager", MEMORY[0x263EF83A8]);
    reportManagerQueue = v7->_reportManagerQueue;
    v7->_reportManagerQueue = (OS_dispatch_queue *)v16;

    v7->_cancelled = 0;
  }

  return v7;
}

- (void)reportWithComponentPredicateManifest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DKReportManager *)self setCancelled:0];
  uint64_t v8 = [(DKReportManager *)self reportManagerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__DKReportManager_reportWithComponentPredicateManifest_completion___block_invoke;
  block[3] = &unk_264E86898;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__DKReportManager_reportWithComponentPredicateManifest_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v2, OS_LOG_TYPE_DEFAULT, "Waiting for discovery...", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) discovery];
  [v3 waitUntilComplete];

  v4 = [*(id *)(a1 + 32) planner];
  id v5 = [v4 requestGroupsForPredicateManifest:*(void *)(a1 + 40)];

  id v6 = [MEMORY[0x263EFF8C0] array];
  id v7 = +[DKReport reportWithComponents:v6];

  uint64_t v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "Starting to request reports...", buf, 2u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v28;
LABEL_7:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
      if ([*(id *)(a1 + 32) isCancelled]) {
        goto LABEL_19;
      }
      dispatch_queue_t v16 = *(void **)(a1 + 32);
      id v26 = v12;
      v17 = [v16 sendRequestsForGroup:v15 concurrent:1 failOnError:1 error:&v26];
      id v18 = v26;

      if (v17) {
        break;
      }
      objc_super v19 = *(void **)(a1 + 32);
      id v25 = v18;
      v17 = [v19 sendRequestsForGroup:v15 concurrent:0 failOnError:0 error:&v25];
      id v12 = v25;

      if (v17) {
        goto LABEL_14;
      }
LABEL_15:
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v11) {
          goto LABEL_7;
        }
        goto LABEL_19;
      }
    }
    id v12 = v18;
LABEL_14:
    uint64_t v20 = [v17 reportByMergingReport:v7];

    id v7 = (void *)v20;
    goto LABEL_15;
  }
  id v12 = 0;
LABEL_19:

  if ([*(id *)(a1 + 32) isCancelled])
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v22 = DKErrorLocalizedDescriptionForCode(-1003);
    v33 = v22;
    v23 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v24 = [v21 errorWithDomain:@"DKErrorDomain" code:-1003 userInfo:v23];

    id v12 = (id)v24;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)sendRequestsForGroup:(id)a3 concurrent:(BOOL)a4 failOnError:(BOOL)a5 error:(id *)a6
{
  BOOL v37 = a5;
  BOOL v49 = a4;
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v43 = a3;
  group = dispatch_group_create();
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  int v87 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  id v7 = [MEMORY[0x263EFF8C0] array];
  id v83 = +[DKReport reportWithComponents:v7];

  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 1;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy_;
  v72 = __Block_byref_object_dispose_;
  id v73 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = [v43 requests];
  uint64_t v41 = [obj countByEnumeratingWithState:&v64 objects:v106 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v65;
    uint64_t v44 = *MEMORY[0x263F08320];
LABEL_3:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v65 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v64 + 1) + 8 * v42);
      if ([(DKReportManager *)self isCancelled]) {
        break;
      }
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v45 = [v8 manifest];
      uint64_t v47 = [v45 countByEnumeratingWithState:&v60 objects:v105 count:16];
      if (v47)
      {
        uint64_t v46 = *(void *)v61;
LABEL_9:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v61 != v46) {
            objc_enumerationMutation(v45);
          }
          uint64_t v10 = *(void *)(*((void *)&v60 + 1) + 8 * v9);
          if ([(DKReportManager *)self isCancelled]) {
            break;
          }
          uint64_t v11 = [v8 generator];
          id v12 = [v11 extensionAttributes];
          uint64_t v13 = +[DKExtensionRequest requestWithExtensionAttributes:v12];

          [v13 setHostServicesDelegate:self];
          if (v13)
          {
            dispatch_group_enter(group);
            ++*((_DWORD *)v85 + 6);
            uint64_t v14 = DiagnosticsKitLogHandleForCategory(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v13 requestIdentifier];
              int v16 = *((_DWORD *)v85 + 6);
              *(_DWORD *)buf = 138414082;
              *(void *)v91 = v15;
              *(_WORD *)&v91[8] = 1024;
              int v92 = v16;
              __int16 v93 = 1024;
              BOOL v94 = v49;
              __int16 v95 = 2112;
              v96 = v13;
              __int16 v97 = 2112;
              uint64_t v98 = v10;
              __int16 v99 = 2112;
              v100 = v8;
              __int16 v101 = 2112;
              id v102 = v43;
              __int16 v103 = 2112;
              v104 = v13;
              _os_log_impl(&dword_23D039000, v14, OS_LOG_TYPE_DEFAULT, "[RID: %@] Starting; count: %d, concurrent: %d; %@ < %@ < %@ < %@; request: %@",
                buf,
                0x4Au);
            }
            dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
            id v18 = NSString;
            objc_super v19 = [v13 requestIdentifier];
            uint64_t v20 = [v18 stringWithFormat:@"%@", v19];

            v21 = NSString;
            v22 = [v13 description];
            v23 = [v21 stringWithString:v22];

            uint64_t v24 = [v8 generator];
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __69__DKReportManager_sendRequestsForGroup_concurrent_failOnError_error___block_invoke;
            v50[3] = &unk_264E868C0;
            v55 = &v78;
            v56 = &v74;
            v57 = &v68;
            v51 = group;
            v58 = &v84;
            id v25 = v20;
            id v52 = v25;
            BOOL v59 = v49;
            id v26 = v23;
            id v53 = v26;
            long long v27 = v17;
            v54 = v27;
            [v24 beginRequest:v13 payload:v10 completion:v50];

            if (!v49)
            {
              dispatch_time_t v28 = dispatch_time(0, 60000000000);
              dispatch_semaphore_wait(v27, v28);
            }
          }
          else
          {
            long long v29 = DiagnosticsKitLogHandleForCategory(1);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              int v32 = *((_DWORD *)v85 + 6);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v91 = v32;
              *(_WORD *)&v91[4] = 1024;
              *(_DWORD *)&v91[6] = v49;
              _os_log_error_impl(&dword_23D039000, v29, OS_LOG_TYPE_ERROR, "Could not start report request; count: %d, concurrent: %d",
                buf,
                0xEu);
            }

            long long v30 = (void *)MEMORY[0x263F087E8];
            uint64_t v88 = v44;
            long long v27 = DKErrorLocalizedDescriptionForCode(-1001);
            v89 = v27;
            id v25 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            uint64_t v31 = [v30 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v25];
            id v26 = (id)v69[5];
            v69[5] = v31;
          }

          if (v47 == ++v9)
          {
            uint64_t v47 = [v45 countByEnumeratingWithState:&v60 objects:v105 count:16];
            if (v47) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      if (++v42 == v41)
      {
        uint64_t v41 = [obj countByEnumeratingWithState:&v64 objects:v106 count:16];
        if (v41) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (a6) {
    *a6 = (id) v69[5];
  }
  dispatch_time_t v33 = dispatch_time(0, 60000000000);
  dispatch_group_wait(group, v33);
  if (v37 && !*((unsigned char *)v75 + 24))
  {
    v34 = (void *)v79[5];
    v79[5] = 0;
  }
  id v35 = (id)v79[5];
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  return v35;
}

void __69__DKReportManager_sendRequestsForGroup_concurrent_failOnError_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  objc_sync_enter(v8);
  uint64_t v9 = [v7 reportByMergingReport:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  objc_sync_exit(v8);
  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  id v12 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    int v14 = *(unsigned __int8 *)(a1 + 96);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    int v17 = 138413570;
    uint64_t v18 = v15;
    __int16 v19 = 1024;
    int v20 = v13;
    __int16 v21 = 1024;
    int v22 = v14;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v16;
    _os_log_impl(&dword_23D039000, v12, OS_LOG_TYPE_DEFAULT, "[RID: %@] Finished; count: %d, concurrent: %d; Report: %@, error: %@; request: %@",
      (uint8_t *)&v17,
      0x36u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)reportersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKReportManager *)self reportManagerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__DKReportManager_reportersWithCompletion___block_invoke;
  v7[3] = &unk_264E86828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__DKReportManager_reportersWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) discovery];
  [v2 waitUntilComplete];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) availableReportGenerators];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (void)cancelAllReports
{
  [(DKReportManager *)self setCancelled:1];
  id v3 = [(DKReportManager *)self registry];
  [v3 enumerateExtensionAdaptersWithBlock:&__block_literal_global_7];
}

uint64_t __35__DKReportManager_cancelAllReports__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelAll];
}

- (NSArray)availableReportGenerators
{
  return self->_availableReportGenerators;
}

- (void)setAvailableReportGenerators:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (DKReporterRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (DKReportPlanner)planner
{
  return self->_planner;
}

- (void)setPlanner:(id)a3
{
}

- (DKExtensionDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (OS_dispatch_queue)reportManagerQueue
{
  return self->_reportManagerQueue;
}

- (void)setReportManagerQueue:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManagerQueue, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_planner, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_availableReportGenerators, 0);
}

@end
@interface CKDXPCConnectionManager
+ (id)sharedConnectionManager;
+ (void)clouddStarted;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)clientConnections;
- (NSMutableArray)statusReportCallbacks;
- (NSMutableArray)tearDownOperations;
- (NSOperationQueue)clientConnectionQueue;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)statusReportCallbackQueue;
- (OS_dispatch_queue)statusReportQueue;
- (OS_dispatch_source)sighandlerSource;
- (OS_dispatch_source)statusReportRequestSource;
- (id)CKStatusReportArray;
- (id)initInternal;
- (unint64_t)stateHandle;
- (void)_dumpStatusReportArrayToOsTrace:(id)a3;
- (void)_dumpStatusReportToFileHandle:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)dumpStatusReportToFileHandle:(id)a3;
- (void)enumerateConnections:(id)a3;
- (void)setClientConnectionQueue:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setSighandlerSource:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStatusReportCallbackQueue:(id)a3;
- (void)setStatusReportCallbacks:(id)a3;
- (void)setStatusReportQueue:(id)a3;
- (void)setStatusReportRequestSource:(id)a3;
- (void)setTearDownOperations:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)statusReportWithCompletionHandler:(id)a3;
@end

@implementation CKDXPCConnectionManager

+ (void)clouddStarted
{
  qword_1EBBCE288 = os_transaction_create();
  MEMORY[0x1F41817F8]();
}

+ (id)sharedConnectionManager
{
  if (qword_1EBBCFB38 != -1) {
    dispatch_once(&qword_1EBBCFB38, &unk_1F20428D0);
  }
  v2 = (void *)qword_1EBBCFB30;
  return v2;
}

- (id)initInternal
{
  v51.receiver = self;
  v51.super_class = (Class)CKDXPCConnectionManager;
  id v4 = [(CKDXPCConnectionManager *)&v51 init];
  if (v4)
  {
    objc_msgSend_enableTransactions(MEMORY[0x1E4F29290], v2, v3);
    v7 = objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
    unint64_t v10 = objc_msgSend_processType(v7, v8, v9);

    if (v10 > 2) {
      id v13 = 0;
    }
    else {
      id v13 = **((id **)&unk_1E64F0AA0 + v10);
    }
    v14 = objc_msgSend_currentProcess(CKDDaemonProcess, v11, v12);
    char isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v14, v15, v16);

    if ((isSystemInstalledBinary & 1) == 0)
    {
      uint64_t v19 = objc_msgSend_stringByAppendingString_(v13, v18, @".debug");

      id v13 = (id)v19;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v22 = objc_msgSend_initWithMachServiceName_(v20, v21, (uint64_t)v13);
    v23 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v22;

    objc_msgSend_setDelegate_(*((void **)v4 + 1), v24, (uint64_t)v4);
    uint64_t v25 = objc_opt_new();
    v26 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v25;

    uint64_t v27 = objc_opt_new();
    v28 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v27;

    objc_msgSend_setMaxConcurrentOperationCount_(*((void **)v4 + 5), v29, 10);
    uint64_t v30 = objc_opt_new();
    v31 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v30;

    uint64_t v32 = objc_opt_new();
    v33 = (void *)*((void *)v4 + 10);
    *((void *)v4 + 10) = v32;

    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.cloudkit.connectionManager.statusreport.callback", v35);
    v37 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v36;

    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v39 = dispatch_queue_attr_make_with_qos_class(v38, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v40 = dispatch_queue_create("com.apple.cloudkit.connectionManager.statusreport", v39);
    v41 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v40;

    dispatch_source_t v42 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v4 + 8));
    v43 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v42;

    v44 = *((void *)v4 + 7);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    v54 = sub_1C4D5BB0C;
    v55 = &unk_1E64F0A80;
    id v56 = &unk_1F20428F0;
    dispatch_source_set_event_handler(v44, &handler);

    dispatch_resume(*((dispatch_object_t *)v4 + 7));
    v45 = CKGetGlobalQueue();
    dispatch_source_t v46 = dispatch_source_create(MEMORY[0x1E4F14480], 0x1DuLL, 0, v45);
    v47 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v46;

    v48 = *((void *)v4 + 4);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    v54 = sub_1C4D5BB0C;
    v55 = &unk_1E64F0A80;
    id v56 = &unk_1F2042910;
    dispatch_source_set_event_handler(v48, &handler);

    dispatch_resume(*((dispatch_object_t *)v4 + 4));
    v49 = dispatch_get_global_queue(0, 0);
    *((void *)v4 + 6) = os_state_add_handler();
  }
  return v4;
}

- (void)dealloc
{
  id v4 = objc_msgSend_sighandlerSource(self, a2, v2);
  dispatch_source_cancel(v4);

  v7 = objc_msgSend_statusReportRequestSource(self, v5, v6);
  dispatch_source_cancel(v7);

  if (objc_msgSend_stateHandle(self, v8, v9))
  {
    objc_msgSend_stateHandle(self, v10, v11);
    os_state_remove_handler();
  }
  while (1)
  {
    v14 = objc_msgSend_sighandlerSource(self, v10, v11);
    if (dispatch_source_testcancel(v14)) {
      break;
    }
    uint64_t v12 = objc_msgSend_statusReportRequestSource(self, v15, v16);
    intptr_t v13 = dispatch_source_testcancel(v12);

    if (v13) {
      goto LABEL_7;
    }
    usleep(0xAu);
  }

LABEL_7:
  v17.receiver = self;
  v17.super_class = (Class)CKDXPCConnectionManager;
  [(CKDXPCConnectionManager *)&v17 dealloc];
}

- (void)activate
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEFAULT, "Activating connection manager", v10, 2u);
  }
  uint64_t v6 = objc_msgSend_xpcListener(self, v4, v5);
  objc_msgSend_activate(v6, v7, v8);

  uint64_t v9 = (void *)qword_1EBBCE288;
  qword_1EBBCE288 = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v5 = a4;
  context = (void *)MEMORY[0x1C8789E70]();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v69 = _os_activity_create(&dword_1C4CFF000, "xpcConnection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v69, &state);
  uint64_t v8 = objc_msgSend_CKXPCDaemonToClientMuxerInterface(MEMORY[0x1E4F1A498], v6, v7);
  objc_msgSend_setRemoteObjectInterface_(v5, v9, (uint64_t)v8);

  uint64_t v12 = objc_msgSend_CKXPCClientToDaemonMuxerInterface(MEMORY[0x1E4F1A498], v10, v11);
  objc_msgSend_setExportedInterface_(v5, v13, (uint64_t)v12);

  v14 = [CKDXPCConnection alloc];
  uint64_t v16 = objc_msgSend_initWithXPCConnection_(v14, v15, (uint64_t)v5);
  objc_msgSend_setExportedObject_(v5, v17, (uint64_t)v16);
  objc_initWeak(&location, v16);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v18 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v91 = v16;
    _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "New connection from client %@", buf, 0xCu);
  }
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = sub_1C4D5A588;
  v85[3] = &unk_1E64F09E0;
  objc_copyWeak(&v86, &location);
  objc_msgSend_setInterruptionHandler_(v5, v19, (uint64_t)v85);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = sub_1C4D5A668;
  v83[3] = &unk_1E64F09E0;
  objc_copyWeak(&v84, &location);
  objc_msgSend_setInvalidationHandler_(v5, v20, (uint64_t)v83);
  v21 = (void *)MEMORY[0x1E4F28B48];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = sub_1C4D5AB40;
  v80[3] = &unk_1E64F0948;
  id v71 = v16;
  id v81 = v71;
  id v66 = v5;
  id v82 = v66;
  v23 = objc_msgSend_blockOperationWithBlock_(v21, v22, (uint64_t)v80);
  v24 = objc_opt_new();
  uint64_t v27 = objc_msgSend_processScopedClientProxy(v71, v25, v26);
  uint64_t v30 = objc_msgSend_processBinaryName(v27, v28, v29);

  if (v30)
  {
    objc_msgSend_tearDownOperations(self, v31, v32);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v35 = objc_msgSend_tearDownOperations(self, v33, v34);
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v76, v98, 16);
    if (v39)
    {
      uint64_t v40 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v77 != v40) {
            objc_enumerationMutation(v35);
          }
          dispatch_source_t v42 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          v43 = objc_msgSend_name(v42, v37, v38);
          int isEqualToString = objc_msgSend_isEqualToString_(v43, v44, (uint64_t)v30);

          if (isEqualToString) {
            objc_msgSend_addObject_(v24, v37, (uint64_t)v42);
          }
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v76, v98, 16);
      }
      while (v39);
    }

    objc_sync_exit(obj);
  }
  if (objc_msgSend_count(v24, v31, v32))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v48 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      uint64_t v51 = objc_msgSend_count(v24, v49, v50);
      unint64_t v54 = objc_msgSend_count(v24, v52, v53);
      v55 = &stru_1F2044F30;
      *(_DWORD *)buf = 138413058;
      id v91 = v71;
      __int16 v92 = 2112;
      if (v54 > 1) {
        v55 = @"s";
      }
      v93 = v30;
      __int16 v94 = 2048;
      uint64_t v95 = v51;
      __int16 v96 = 2112;
      v97 = v55;
      _os_log_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_INFO, "Incoming client %@ connection with processBinaryName %@ is waiting to resume its xpc connection. We have %ld existing connection%@ tearing down", buf, 0x2Au);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v56 = v24;
    uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v72, v89, 16);
    if (v59)
    {
      uint64_t v60 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v73 != v60) {
            objc_enumerationMutation(v56);
          }
          objc_msgSend_addDependency_(v23, v58, *(void *)(*((void *)&v72 + 1) + 8 * j));
        }
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v58, (uint64_t)&v72, v89, 16);
      }
      while (v59);
    }
  }
  v62 = objc_msgSend_clientConnectionQueue(self, v46, v47);
  objc_msgSend_addOperation_(v62, v63, (uint64_t)v23);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);

  return 1;
}

- (void)enumerateConnections:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_clientConnections(self, v5, v6);
  objc_sync_enter(v7);
  unint64_t v10 = objc_msgSend_clientConnections(self, v8, v9);
  intptr_t v13 = objc_msgSend_copy(v10, v11, v12);

  objc_sync_exit(v7);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D5AD88;
  v16[3] = &unk_1E64F0A30;
  id v17 = v4;
  id v14 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v15, (uint64_t)v16);
}

- (id)CKStatusReportArray
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v107 = objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v4, v5);
  uint64_t v6 = NSString;
  uint64_t v9 = objc_msgSend_availabilityDescription(v107, v7, v8);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v6, v10, @"System Availability: %@", v9);
  objc_msgSend_addObject_(v3, v12, (uint64_t)v11);

  v15 = objc_msgSend_clientConnections(self, v13, v14);
  objc_sync_enter(v15);
  v18 = objc_msgSend_clientConnections(self, v16, v17);
  v21 = objc_msgSend_copy(v18, v19, v20);

  objc_sync_exit(v15);
  uint64_t v22 = NSString;
  uint64_t v25 = objc_msgSend_count(v21, v23, v24);
  uint64_t v27 = objc_msgSend_stringWithFormat_(v22, v26, @"\n%lu connected clients", v25);
  objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x2020000000;
  uint64_t v121 = -1;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = v21;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v114, v123, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v115 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        uint64_t v34 = (void *)MEMORY[0x1C8789E70]();
        v37 = objc_msgSend_CKStatusReportArray(v33, v35, v36);
        objc_msgSend_addObject_(v3, v38, (uint64_t)v37);

        if (v119[3] == -1)
        {
          v113[0] = MEMORY[0x1E4F143A8];
          v113[1] = 3221225472;
          v113[2] = sub_1C4D5B360;
          v113[3] = &unk_1E64F0A58;
          v113[4] = &v118;
          objc_msgSend_enumerateContainersWithOptions_usingBlock_(v33, v39, 4, v113);
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v114, v123, 16);
    }
    while (v30);
  }

  objc_msgSend_addObject_(v3, v41, @"------ Shared Foreground Queue Operations -------");
  v44 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v42, v43);
  uint64_t v47 = objc_msgSend_operations(v44, v45, v46);

  if (objc_msgSend_count(v47, v48, v49))
  {
    v52 = NSString;
    uint64_t v53 = objc_msgSend_count(v47, v50, v51);
    id v56 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v54, v55);
    uint64_t v59 = objc_msgSend_maxConcurrentOperationCount(v56, v57, v58);
    v61 = objc_msgSend_stringWithFormat_(v52, v60, @"%lu/%ld {", v53, v59);
    objc_msgSend_addObject_(v3, v62, (uint64_t)v61);

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v63 = v47;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v109, v122, 16);
    if (v65)
    {
      uint64_t v66 = *(void *)v110;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v110 != v66) {
            objc_enumerationMutation(v63);
          }
          uint64_t v68 = *(void *)(*((void *)&v109 + 1) + 8 * j);
          v69 = (void *)MEMORY[0x1C8789E70]();
          long long v72 = objc_msgSend_operationStatusReport_(CKDContainer, v70, v68);
          if (v72) {
            objc_msgSend_addObject_(v3, v71, (uint64_t)v72);
          }
        }
        uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v73, (uint64_t)&v109, v122, 16);
      }
      while (v65);
    }

    objc_msgSend_addObject_(v3, v74, @"}");
  }
  else
  {
    objc_msgSend_addObject_(v3, v50, @"No operations.");
  }
  objc_msgSend_addObject_(v3, v75, @"------ Global Configuration Manager -------");
  long long v78 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v76, v77);
  id v81 = objc_msgSend_CKStatusReportArray(v78, v79, v80);
  objc_msgSend_addObject_(v3, v82, (uint64_t)v81);

  objc_msgSend_addObject_(v3, v83, @"-------------------------------------------");
  if (objc_msgSend_availabilityState(v107, v84, v85))
  {
    v88 = objc_msgSend_existingDefaultContext(CKDLogicalDeviceContext, v86, v87);
    id v91 = objc_msgSend_throttleManager(v88, v89, v90);
    __int16 v94 = objc_msgSend_CKStatusReportArray(v91, v92, v93);

    if (objc_msgSend_count(v94, v95, v96))
    {
      objc_msgSend_addObject_(v3, v97, (uint64_t)&stru_1F2044F30);
      objc_msgSend_addObject_(v3, v98, @"------ Active Throttles -------");
      objc_msgSend_addObject_(v3, v99, (uint64_t)v94);
      objc_msgSend_addObject_(v3, v100, @"-------------------------------------------");
    }
  }
  v101 = NSString;
  v102 = CKStringFromServerEnvironment();
  v104 = objc_msgSend_stringWithFormat_(v101, v103, @"Cached environment is %@", v102);
  objc_msgSend_addObject_(v3, v105, (uint64_t)v104);

  _Block_object_dispose(&v118, 8);
  return v3;
}

- (void)_dumpStatusReportArrayToOsTrace:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_statusReportQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v20, v26, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    intptr_t v13 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A540];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v17, v16);
        }
        else
        {
          if (*v13 != -1) {
            dispatch_once(v13, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v19 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v16;
            _os_log_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v18, (uint64_t)&v20, v26, 16);
    }
    while (v11);
  }
}

- (void)_dumpStatusReportToFileHandle:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_statusReportQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v11 = objc_msgSend_CKStatusReportArray(self, v8, v9);
  if (v4)
  {
    uint64_t v12 = (void *)MEMORY[0x1C8789E70]();
    intptr_t v13 = NSString;
    uint64_t v15 = objc_msgSend_CKComponentsAndSubcomponentsJoinedByString_(v11, v14, @"\n");
    uint64_t v17 = objc_msgSend_stringWithFormat_(v13, v16, @"%@", v15);

    uint64_t v19 = objc_msgSend_dataUsingEncoding_(v17, v18, 4);
    objc_msgSend_writeData_(v4, v20, (uint64_t)v19);
  }
  else
  {
    objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v10, (uint64_t)v11);
  }
  long long v21 = NSString;
  long long v22 = CKTestNotificationPrefix();
  uint64_t v24 = objc_msgSend_stringWithFormat_(v21, v23, @"%@%@", v22, *MEMORY[0x1E4F1A668]);

  uint64_t v27 = (const char *)objc_msgSend_UTF8String(v24, v25, v26);
  notify_post(v27);
  if (!v4)
  {
    objc_msgSend_statusReportCallbacks(self, v28, v29);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v32 = objc_msgSend_statusReportCallbacks(self, v30, v31);
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v47, v51, 16);
    if (v36)
    {
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v32);
          }
          uint64_t v39 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v40 = objc_msgSend_statusReportCallbackQueue(self, v34, v35);
          dispatch_async(v40, v39);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v47, v51, 16);
      }
      while (v36);
    }

    uint64_t v43 = objc_msgSend_statusReportCallbacks(self, v41, v42);
    objc_msgSend_removeAllObjects(v43, v44, v45);

    objc_sync_exit(obj);
  }
}

- (void)dumpStatusReportToFileHandle:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_statusReportQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D5B8D4;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (void)statusReportWithCompletionHandler:(id)a3
{
  id aBlock = a3;
  if (aBlock)
  {
    uint64_t v6 = objc_msgSend_statusReportCallbacks(self, v4, v5);
    objc_sync_enter(v6);
    uint64_t v9 = objc_msgSend_statusReportCallbacks(self, v7, v8);
    id v10 = _Block_copy(aBlock);
    objc_msgSend_addObject_(v9, v11, (uint64_t)v10);

    objc_sync_exit(v6);
  }
  uint64_t v12 = objc_msgSend_statusReportRequestSource(self, v4, v5);
  dispatch_source_merge_data(v12, 1uLL);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableArray)tearDownOperations
{
  return self->_tearDownOperations;
}

- (void)setTearDownOperations:(id)a3
{
}

- (OS_dispatch_source)sighandlerSource
{
  return self->_sighandlerSource;
}

- (void)setSighandlerSource:(id)a3
{
}

- (NSOperationQueue)clientConnectionQueue
{
  return self->_clientConnectionQueue;
}

- (void)setClientConnectionQueue:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (OS_dispatch_source)statusReportRequestSource
{
  return self->_statusReportRequestSource;
}

- (void)setStatusReportRequestSource:(id)a3
{
}

- (OS_dispatch_queue)statusReportQueue
{
  return self->_statusReportQueue;
}

- (void)setStatusReportQueue:(id)a3
{
}

- (OS_dispatch_queue)statusReportCallbackQueue
{
  return self->_statusReportCallbackQueue;
}

- (void)setStatusReportCallbackQueue:(id)a3
{
}

- (NSMutableArray)statusReportCallbacks
{
  return self->_statusReportCallbacks;
}

- (void)setStatusReportCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReportCallbacks, 0);
  objc_storeStrong((id *)&self->_statusReportCallbackQueue, 0);
  objc_storeStrong((id *)&self->_statusReportQueue, 0);
  objc_storeStrong((id *)&self->_statusReportRequestSource, 0);
  objc_storeStrong((id *)&self->_clientConnectionQueue, 0);
  objc_storeStrong((id *)&self->_sighandlerSource, 0);
  objc_storeStrong((id *)&self->_tearDownOperations, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
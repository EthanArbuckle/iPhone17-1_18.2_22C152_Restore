@interface CSProcessManager
+ (id)sharedInstanceWithEnrolledProcesses:(id)a3 andExemptions:(id)a4;
- (BOOL)onlyMonitorDaemons;
- (NSMutableDictionary)allProcessesMap;
- (NSMutableDictionary)processNameIdentiferByPID;
- (NSMutableSet)observers;
- (NSSet)enrolledProcessesSet;
- (NSSet)exemptProcessesSet;
- (OS_dispatch_source)timer;
- (OS_os_log)logger;
- (id)_initWithEnrolledProcesses:(id)a3 andExemptions:(id)a4;
- (id)getProcessForPID:(int)a3;
- (id)identiferForPID:(int)a3;
- (id)processForIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)notifyObserversOfNewInstances:(id)a3;
- (void)pollPIDs;
- (void)recordTerminationForPID:(int)a3;
- (void)removeObserver:(id)a3;
- (void)schedulePIDPolling;
- (void)setAllProcessesMap:(id)a3;
- (void)setEnrolledProcessesSet:(id)a3;
- (void)setExemptProcessesSet:(id)a3;
- (void)setLogger:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOnlyMonitorDaemons:(BOOL)a3;
- (void)setProcessNameIdentiferByPID:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation CSProcessManager

+ (id)sharedInstanceWithEnrolledProcesses:(id)a3 andExemptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__CSProcessManager_sharedInstanceWithEnrolledProcesses_andExemptions___block_invoke;
  v12[3] = &unk_26528B108;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = sharedInstanceWithEnrolledProcesses_andExemptions__onceToken;
  id v8 = v6;
  id v9 = v5;
  if (v7 != -1) {
    dispatch_once(&sharedInstanceWithEnrolledProcesses_andExemptions__onceToken, v12);
  }
  id v10 = (id)sharedInstanceWithEnrolledProcesses_andExemptions___sharedInstance;

  return v10;
}

- (void)pollPIDs
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  unsigned int v4 = proc_listpids(1u, 0, 0, 0);
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    size_t v6 = v4;
    uint64_t v7 = malloc_type_malloc(v4, 0xAB321DA3uLL);
    if (v7)
    {
      id v8 = v7;
      v44 = v3;
      memset(v7, 255, v6);
      v43 = v8;
      int v9 = proc_listpids(1u, 0, v8, v5);
      if (v9 < 4)
      {
LABEL_4:
        free(v43);
        v3 = v44;
        [(CSProcessManager *)self notifyObserversOfNewInstances:v44];
        goto LABEL_5;
      }
      if ((unint64_t)v9 >> 2 <= 1) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = (unint64_t)v9 >> 2;
      }
      unint64_t v11 = 0x263F64000uLL;
      unint64_t v12 = 0x263F08000uLL;
      id v13 = (int *)v8;
      while (1)
      {
        int v15 = *v13++;
        uint64_t v14 = v15;
        if (v15 >= 1) {
          break;
        }
LABEL_47:
        if (!--v10) {
          goto LABEL_4;
        }
      }
      v16 = *(void **)(v11 + 1392);
      v17 = [*(id *)(v12 + 2584) numberWithInt:v14];
      id v46 = 0;
      v18 = [v16 handleForIdentifier:v17 error:&v46];
      id v19 = v46;

      if (v19)
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v48 = v14;
          *(_WORD *)&v48[4] = 2112;
          *(void *)&v48[6] = v19;
          _os_log_error_impl(&dword_24A698000, logger, OS_LOG_TYPE_ERROR, "Error grabbing RBSProcessHandle (pid%i) to perform isDaemon check %@", buf, 0x12u);
        }
        goto LABEL_46;
      }
      v21 = [v18 identity];
      v22 = v21;
      if (self->_onlyMonitorDaemons && ([v21 isDaemon] & 1) == 0)
      {
        v33 = self->_logger;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v14;
          _os_log_debug_impl(&dword_24A698000, v33, OS_LOG_TYPE_DEBUG, "Skipping pid: %d since it is not a daemon", buf, 8u);
        }
        goto LABEL_45;
      }
      v45 = v22;
      if ([v22 isDaemon])
      {
        v23 = [v18 daemonJobLabel];
        v24 = self->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          _os_log_debug_impl(&dword_24A698000, v24, OS_LOG_TYPE_DEBUG, "Using daemonJobLabel:%@ for pid: %d", buf, 0x12u);
        }
        goto LABEL_27;
      }
      uint64_t v25 = [v18 bundle];
      if (!v25) {
        goto LABEL_25;
      }
      v26 = (void *)v25;
      v27 = [v18 bundle];
      v28 = [v27 identifier];

      if (v28)
      {
        v29 = [v18 bundle];
        v23 = [v29 identifier];

        v30 = self->_logger;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          v31 = v30;
          v32 = "Using bundleID:%@ for pid: %d";
LABEL_50:
          _os_log_debug_impl(&dword_24A698000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0x12u);
        }
      }
      else
      {
LABEL_25:
        v23 = [v18 name];
        v34 = self->_logger;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          v31 = v34;
          v32 = "Using name:%@ for pid: %d";
          goto LABEL_50;
        }
      }
      v22 = v45;
LABEL_27:
      if (v23)
      {
        if (![(NSSet *)self->_enrolledProcessesSet containsObject:v23])
        {
          v35 = self->_logger;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v48 = v23;
            *(_WORD *)&v48[8] = 1024;
            *(_DWORD *)&v48[10] = v14;
            _os_log_debug_impl(&dword_24A698000, v35, OS_LOG_TYPE_DEBUG, "Process:%@[%d] is not explicitly enrolled, it will get default restrictions.", buf, 0x12u);
          }
        }
        v36 = [(NSMutableDictionary *)self->_allProcessesMap objectForKey:v23];
        v37 = [NSNumber numberWithInt:v14];
        [(NSMutableDictionary *)self->_processNameIdentiferByPID setObject:v23 forKeyedSubscript:v37];
        if (v36)
        {
          int v38 = [(CSProcess *)v36 currentPID];
          if (v38 == -1)
          {
            [(CSProcess *)v36 setCurrentPID:v14];
            [v44 addObject:v23];
          }
          else
          {
            int v39 = v38;
            if (v14 != v38)
            {
              log = self->_logger;
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)v48 = v23;
                *(_WORD *)&v48[8] = 1024;
                *(_DWORD *)&v48[10] = v39;
                __int16 v49 = 1024;
                int v50 = v14;
                _os_log_error_impl(&dword_24A698000, log, OS_LOG_TYPE_ERROR, "%@ was PID: %d before, is %d now. Exit handler should fire soon.", buf, 0x18u);
              }
            }
          }
        }
        else
        {
          v36 = [[CSProcess alloc] initWithIdentifier:v23 andPID:v14];
          if ([(NSSet *)self->_exemptProcessesSet containsObject:v23]) {
            [(CSProcess *)v36 setExemptFromMitigations:1];
          }
          [(NSMutableDictionary *)self->_allProcessesMap setObject:v36 forKeyedSubscript:v23];
          [v44 addObject:v23];
          v41 = self->_logger;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v48 = v14;
            *(_WORD *)&v48[4] = 2112;
            *(void *)&v48[6] = v23;
            _os_log_debug_impl(&dword_24A698000, v41, OS_LOG_TYPE_DEBUG, "Tracking pid: %d for process:%@", buf, 0x12u);
          }
        }

        v22 = v45;
      }
      else
      {
        v40 = self->_logger;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v14;
          _os_log_debug_impl(&dword_24A698000, v40, OS_LOG_TYPE_DEBUG, "Skipping pid: %d since we could not get daemonJobLabel, bundleIDidentifier or name", buf, 8u);
        }
      }

      unint64_t v11 = 0x263F64000;
      unint64_t v12 = 0x263F08000;
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
  }
LABEL_5:
}

- (void)recordTerminationForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = v3;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Process %d exited", buf, 8u);
  }
  size_t v6 = [(CSProcessManager *)self getProcessForPID:v3];
  uint64_t v7 = v6;
  if (v6) {
    [v6 performCleanupOnExit];
  }
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  int v9 = getMainQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CSProcessManager_recordTerminationForPID___block_invoke;
  v10[3] = &unk_26528B158;
  v10[4] = self;
  int v11 = v3;
  dispatch_after(v8, v9, v10);
}

- (id)getProcessForPID:(int)a3
{
  processNameIdentiferByPID = self->_processNameIdentiferByPID;
  int v5 = [NSNumber numberWithInt:*(void *)&a3];
  size_t v6 = [(NSMutableDictionary *)processNameIdentiferByPID objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_allProcessesMap objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)processForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_allProcessesMap objectForKeyedSubscript:a3];
}

- (void)notifyObserversOfNewInstances:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_observers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "observeNewRunningProcesses:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __38__CSProcessManager_schedulePIDPolling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pollPIDs];
}

uint64_t __70__CSProcessManager_sharedInstanceWithEnrolledProcesses_andExemptions___block_invoke(uint64_t a1)
{
  sharedInstanceWithEnrolledProcesses_andExemptions___sharedInstance = [[CSProcessManager alloc] _initWithEnrolledProcesses:*(void *)(a1 + 32) andExemptions:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (id)_initWithEnrolledProcesses:(id)a3 andExemptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSProcessManager;
  uint64_t v8 = [(CSProcessManager *)&v24 init];
  if (v8)
  {
    uint64_t v9 = +[CSLogger logForCategory:@"CSProcessManager"];
    logger = v8->_logger;
    v8->_logger = (OS_os_log *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    allProcessesMap = v8->_allProcessesMap;
    v8->_allProcessesMap = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    processNameIdentiferByPID = v8->_processNameIdentiferByPID;
    v8->_processNameIdentiferByPID = (NSMutableDictionary *)v13;

    uint64_t v15 = [v6 copy];
    enrolledProcessesSet = v8->_enrolledProcessesSet;
    v8->_enrolledProcessesSet = (NSSet *)v15;

    uint64_t v17 = [v7 copy];
    exemptProcessesSet = v8->_exemptProcessesSet;
    v8->_exemptProcessesSet = (NSSet *)v17;

    v8->_onlyMonitorDaemons = 1;
    timer = v8->_timer;
    v8->_timer = 0;

    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    observers = v8->_observers;
    v8->_observers = (NSMutableSet *)v20;

    [(CSProcessManager *)v8 schedulePIDPolling];
    v22 = v8;
  }

  return v8;
}

- (void)schedulePIDPolling
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "Repeating timer for PID polling armed.", v1, 2u);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)identiferForPID:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  int v5 = [(NSMutableDictionary *)self->_processNameIdentiferByPID objectForKeyedSubscript:v4];

  return v5;
}

void __44__CSProcessManager_recordTerminationForPID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) processNameIdentiferByPID];
  v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v3 removeObjectForKey:v2];
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (NSSet)enrolledProcessesSet
{
  return self->_enrolledProcessesSet;
}

- (void)setEnrolledProcessesSet:(id)a3
{
}

- (NSSet)exemptProcessesSet
{
  return self->_exemptProcessesSet;
}

- (void)setExemptProcessesSet:(id)a3
{
}

- (NSMutableDictionary)allProcessesMap
{
  return self->_allProcessesMap;
}

- (void)setAllProcessesMap:(id)a3
{
}

- (NSMutableDictionary)processNameIdentiferByPID
{
  return self->_processNameIdentiferByPID;
}

- (void)setProcessNameIdentiferByPID:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)onlyMonitorDaemons
{
  return self->_onlyMonitorDaemons;
}

- (void)setOnlyMonitorDaemons:(BOOL)a3
{
  self->_onlyMonitorDaemons = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processNameIdentiferByPID, 0);
  objc_storeStrong((id *)&self->_allProcessesMap, 0);
  objc_storeStrong((id *)&self->_exemptProcessesSet, 0);
  objc_storeStrong((id *)&self->_enrolledProcessesSet, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
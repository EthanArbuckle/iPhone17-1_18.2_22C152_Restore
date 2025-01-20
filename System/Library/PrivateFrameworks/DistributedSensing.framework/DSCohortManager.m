@interface DSCohortManager
- (DSXPCServer)xpcDaemonServer;
- (NSMutableDictionary)devices;
- (OS_dispatch_queue)dispatchQueue;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)printConsensusData;
- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setXpcDaemonServer:(id)a3;
@end

@implementation DSCohortManager

- (void)deviceFound:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(DSCohortManager *)self _deviceFound:v5];
}

- (void)deviceLost:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(DSCohortManager *)self _deviceLost:v5];
}

- (void)_deviceFound:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 identifier];
    devices = self->_devices;
    if (!devices)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v9 = self->_devices;
      self->_devices = v8;

      devices = self->_devices;
    }
    v10 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v6];

    unint64_t v11 = 0x267FC1000uLL;
    unint64_t v12 = 0x267FC1000uLL;
    if (v10)
    {
      v13 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
      if (onceTokenDSCohortManager != -1) {
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      }
      v14 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v72 = v6;
        _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "Updating device with ID: %@", buf, 0xCu);
      }
      [(DSDeviceContext *)v13 updateWithCBDevice:v5];
      char v15 = [(DSDeviceContext *)v13 changedFlag];
      v59 = v6;
      if (onceTokenDSCohortManager != -1) {
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      }
      unint64_t v16 = v15 & 2;
      unint64_t v17 = v15 & 4;
      v18 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v72 = v16 >> 1;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = v17 >> 2;
        _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, "Changed DSInfo: %d, DSAction %d", buf, 0xEu);
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v19 = [(DSXPCServer *)self->_xpcDaemonServer xpcConnections];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v66 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            v25 = [v24 motionSession];

            if (v25) {
              BOOL v26 = v16 == 0;
            }
            else {
              BOOL v26 = 1;
            }
            if (v26)
            {
              v27 = [v24 kappaSession];

              if (v27) {
                BOOL v28 = v17 == 0;
              }
              else {
                BOOL v28 = 1;
              }
              if (v28) {
                continue;
              }
              v29 = [v24 kappaSession];
            }
            else
            {
              v29 = [v24 motionSession];
            }
            v30 = v29;
            v31 = [v29 deviceChangedHandler];

            if (v31)
            {
              ((void (**)(void, DSDeviceContext *))v31)[2](v31, v13);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v21);
      }

      id v32 = 0;
      unint64_t v12 = 0x267FC1000;
      unint64_t v11 = 0x267FC1000;
    }
    else
    {
      if (onceTokenDSCohortManager != -1) {
        dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
      }
      v33 = logObjDSCohortManager;
      if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v72 = v6;
        _os_log_impl(&dword_223BD6000, v33, OS_LOG_TYPE_DEFAULT, "Adding device with ID: %@", buf, 0xCu);
      }
      id v64 = 0;
      v13 = [[DSDeviceContext alloc] initWithCBDevice:v5 error:&v64];
      id v32 = v64;
      if (!v13)
      {
        if (onceTokenDSCohortManager != -1) {
          dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
        }
        v57 = logObjDSCohortManager;
        if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v72 = v32;
          _os_log_impl(&dword_223BD6000, v57, OS_LOG_TYPE_DEFAULT, "Failed to init DSDeviceContext with error : %@", buf, 0xCu);
        }
LABEL_69:

        goto LABEL_70;
      }
      v58 = v5;
      v59 = v6;
      [(NSMutableDictionary *)self->_devices setObject:v13 forKeyedSubscript:v6];
    }
    char v34 = [(DSDeviceContext *)v13 discoveryFlag];
    unint64_t v35 = v34 & 2;
    if (*(void *)(v11 + 3592) != -1) {
      dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
    }
    unint64_t v36 = v34 & 4;
    v37 = *(NSObject **)(v12 + 3584);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v72 = v35 >> 1;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = v36 >> 2;
      _os_log_impl(&dword_223BD6000, v37, OS_LOG_TYPE_DEFAULT, "Discovered DSInfo: %d, DSAction %d", buf, 0xEu);
    }
    if (v35)
    {
      if (!self->_dataManager)
      {
        v38 = [[DSConsensusDataManager alloc] initWithWindowOfInterest:15.0];
        dataManager = self->_dataManager;
        self->_dataManager = v38;
      }
      v40 = [DSConsensusDatum alloc];
      uint64_t v41 = [(DSDeviceContext *)v13 vehicleConfidence];
      v42 = [MEMORY[0x263EFF910] now];
      v43 = [(DSConsensusDatum *)v40 initWithIdentifier:v59 andConfidence:v41 atTime:v42];

      if (v43) {
        [(DSConsensusDataManager *)self->_dataManager addDatum:v43];
      }
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v44 = [(DSXPCServer *)self->_xpcDaemonServer xpcConnections];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          v50 = [v49 motionSession];

          if (v50) {
            BOOL v51 = v35 == 0;
          }
          else {
            BOOL v51 = 1;
          }
          if (!v51)
          {
            v54 = [v49 motionSession];
            goto LABEL_64;
          }
          v52 = [v49 kappaSession];

          if (v52) {
            BOOL v53 = v36 == 0;
          }
          else {
            BOOL v53 = 1;
          }
          if (!v53)
          {
            v54 = [v49 kappaSession];
LABEL_64:
            v55 = v54;
            v56 = [v54 deviceFoundHandler];

            if (v56)
            {
              ((void (**)(void, DSDeviceContext *))v56)[2](v56, v13);
            }
            continue;
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v46);
    }

    id v5 = v58;
    v6 = v59;
    goto LABEL_69;
  }
LABEL_70:
}

- (void)_deviceLost:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
  if (v5)
  {
    if (onceTokenDSCohortManager != -1) {
      dispatch_once(&onceTokenDSCohortManager, &__block_literal_global_10);
    }
    v6 = logObjDSCohortManager;
    if (os_log_type_enabled((os_log_t)logObjDSCohortManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v28 = v4;
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "Removing device with ID: %@", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
  }
  uint64_t v7 = [v5 dsInfoIsAlreadyFound];
  uint64_t v8 = [v5 dsActionIsAlreadyFound];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = [(DSXPCServer *)self->_xpcDaemonServer xpcConnections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v15 = [v14 motionSession];

        if (v15) {
          BOOL v16 = v7 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          v19 = [v14 motionSession];
          goto LABEL_22;
        }
        unint64_t v17 = [v14 kappaSession];

        if (v17) {
          BOOL v18 = v8 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          v19 = [v14 kappaSession];
LABEL_22:
          uint64_t v20 = v19;
          uint64_t v21 = [v19 deviceLostHandler];

          if (v21)
          {
            ((void (**)(void, void *))v21)[2](v21, v5);
          }
          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)printConsensusData
{
  dataManager = self->_dataManager;
  if (dataManager) {
    [(DSConsensusDataManager *)dataManager printConsensusData];
  }
}

- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4
{
  dataManager = self->_dataManager;
  if (dataManager) {
    [(DSConsensusDataManager *)dataManager printConsensusDataFromWindowStart:a3 ToWindowEnd:a4];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

@end
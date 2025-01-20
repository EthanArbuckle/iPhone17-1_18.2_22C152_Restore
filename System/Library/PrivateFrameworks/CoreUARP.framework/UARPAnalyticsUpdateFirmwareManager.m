@interface UARPAnalyticsUpdateFirmwareManager
- (UARPAnalyticsUpdateFirmwareManager)initWithController:(id)a3 queue:(id)a4;
- (id)description;
- (id)updateStateForAccessoryID:(id)a3 assetID:(id)a4;
- (id)updateStatesForAccessoryID:(id)a3;
- (void)configurePurgeTimer;
- (void)dealloc;
- (void)purgeStaleUpdateStateRecords;
- (void)setAccessoryIDUnreachable:(id)a3;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)stagingStartedForAccessoryID:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5;
- (void)updateComplete:(id)a3;
@end

@implementation UARPAnalyticsUpdateFirmwareManager

- (UARPAnalyticsUpdateFirmwareManager)initWithController:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UARPAnalyticsUpdateFirmwareManager;
  v8 = [(UARPAnalyticsUpdateFirmwareManager *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_controller, v6);
    os_log_t v10 = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    stateArray = v9->_stateArray;
    v9->_stateArray = (NSMutableArray *)v12;

    [(UARPAnalyticsUpdateFirmwareManager *)v9 configurePurgeTimer];
  }

  return v9;
}

- (void)dealloc
{
  purgeTimer = self->_purgeTimer;
  if (purgeTimer) {
    dispatch_source_cancel(purgeTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)UARPAnalyticsUpdateFirmwareManager;
  [(UARPAnalyticsUpdateFirmwareManager *)&v4 dealloc];
}

- (void)configurePurgeTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  purgeTimer = self->_purgeTimer;
  self->_purgeTimer = v3;

  v5 = self->_purgeTimer;
  dispatch_time_t v6 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v5, v6, 0x34630B8A000uLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  id v7 = self->_purgeTimer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__UARPAnalyticsUpdateFirmwareManager_configurePurgeTimer__block_invoke;
  v8[3] = &unk_264491768;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_purgeTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__UARPAnalyticsUpdateFirmwareManager_configurePurgeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained purgeStaleUpdateStateRecords];
}

- (id)updateStateForAccessoryID:(id)a3 assetID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_stateArray;
  id v9 = (id)[(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "accessoryID", (void)v17);
        if ([v6 analyticsIsEqual:v13])
        {
          v14 = [v12 assetID];
          char v15 = [v7 analyticsIsEqual:v14];

          if (v15)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v9 = (id)[(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
LABEL_12:

  return v9;
}

- (id)updateStatesForAccessoryID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_stateArray;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "accessoryID", (void)v16);
        int v13 = [v4 analyticsIsEqual:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v14;
}

- (void)stagingStartedForAccessoryID:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = "NO";
    *(_DWORD *)int v13 = 136315906;
    *(void *)&v13[4] = "-[UARPAnalyticsUpdateFirmwareManager stagingStartedForAccessoryID:assetID:userIntent:]";
    if (v5) {
      v11 = "YES";
    }
    *(_WORD *)&v13[12] = 2112;
    *(void *)&v13[14] = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2080;
    long long v17 = v11;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: %@ %@ userIntent=%s", v13, 0x2Au);
  }
  -[UARPAnalyticsUpdateFirmwareManager updateStateForAccessoryID:assetID:](self, "updateStateForAccessoryID:assetID:", v8, v9, *(_OWORD *)v13);
  uint64_t v12 = (UARPAnalyticsUpdateFirmwareState *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    uint64_t v12 = [[UARPAnalyticsUpdateFirmwareState alloc] initWithAccessoryID:v8 assetID:v9];
    [(NSMutableArray *)self->_stateArray addObject:v12];
  }
  [(UARPAnalyticsUpdateFirmwareState *)v12 stagingStartedWithUserIntent:v5];
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = log;
    int v17 = 136315906;
    uint64_t v18 = "-[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2080;
    v24 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: %@ %@ status=%s", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v12 = [(UARPAnalyticsUpdateFirmwareManager *)self updateStateForAccessoryID:v8 assetID:v9];
  int v13 = v12;
  if (v12)
  {
    [v12 stagingCompleteWithStatus:a5];
    uint64_t v14 = [v9 isUrgentUpdate];
    id v15 = [v13 assetID];
    [v15 setIsUrgentUpdate:v14];

    [(UARPAnalyticsUpdateFirmwareManager *)self updateComplete:v13];
  }
  else
  {
    __int16 v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]((uint64_t)v8, (uint64_t)v9, v16);
    }
  }
}

- (void)setAccessoryIDUnreachable:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [(UARPAnalyticsUpdateFirmwareManager *)self updateStatesForAccessoryID:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 136315394;
    long long v12 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = "-[UARPAnalyticsUpdateFirmwareManager setAccessoryIDUnreachable:]";
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: %@ unreachable", buf, 0x16u);
        }
        objc_msgSend(v10, "accessoryUnreachable", v12);
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)purgeStaleUpdateStateRecords
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Purge timer fired", buf, 2u);
  }
  id v4 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = self->_stateArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((unint64_t)[v10 age] >> 7 >= 0x2A3) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_stateArray removeObjectsInArray:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v25;
    *(void *)&long long v13 = 138412290;
    long long v23 = v13;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        int v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v33 = v17;
          _os_log_error_impl(&dword_21E079000, v18, OS_LOG_TYPE_ERROR, "Purging %@", buf, 0xCu);
        }
        objc_msgSend(v17, "accessoryUnreachable", v23, (void)v24);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        id v20 = [v17 accessoryID];
        __int16 v21 = [v17 assetID];
        uint64_t v22 = [v17 eventParams];
        [WeakRetained sendUpdateFirmwareAnalyticsEventForAccessoryID:v20 assetID:v21 params:v22];
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v14);
  }
}

- (void)updateComplete:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[UARPAnalyticsUpdateFirmwareManager updateComplete:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v10, 0x16u);
  }
  [(NSMutableArray *)self->_stateArray removeObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v7 = [v4 accessoryID];
  uint64_t v8 = [v4 assetID];
  id v9 = [v4 eventParams];
  [WeakRetained sendUpdateFirmwareAnalyticsEventForAccessoryID:v7 assetID:v8 params:v9];
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@\n{\n", v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_stateArray;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 appendFormat:@"%@\n", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [v6 appendString:@"}"];
  __int16 v12 = [NSString stringWithString:v6];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateArray, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)stagingCompleteForAccessoryID:(uint64_t)a1 assetID:(uint64_t)a2 status:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "%s: No record for %@ %@", (uint8_t *)&v3, 0x20u);
}

@end
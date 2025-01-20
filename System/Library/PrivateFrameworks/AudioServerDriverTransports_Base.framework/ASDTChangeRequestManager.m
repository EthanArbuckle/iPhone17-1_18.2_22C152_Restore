@interface ASDTChangeRequestManager
+ (id)forDelegate:(id)a3;
- (ASDTChangeRequestManager)initWithDelegate:(id)a3;
- (ASDTChangeRequestManagerDelegate)delegate;
- (ASDTCondition)changeRequestLock;
- (BOOL)configurationChangePendingForObject:(id)a3;
- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (NSMutableDictionary)changeRequestQueues;
- (NSString)bundleID;
- (id)queueForObject:(id)a3 withName:(id)a4;
- (unsigned)changeIndex;
- (void)doWaitForConfigurationChangesForQueue:(id)a3 withTimeout:(ASDTTime *)a4;
- (void)setBundleID:(id)a3;
- (void)setChangeIndex:(unsigned int)a3;
- (void)setChangeRequestLock:(id)a3;
- (void)setChangeRequestQueues:(id)a3;
- (void)setDelegate:(id)a3;
- (void)waitForAllConfigurationChanges;
- (void)waitForConfigurationChangesForDevice:(id)a3;
@end

@implementation ASDTChangeRequestManager

- (ASDTChangeRequestManager)initWithDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDTChangeRequestManager;
  v5 = [(ASDTChangeRequestManager *)&v21 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  [(ASDTChangeRequestManager *)v5 setDelegate:v4];
  id v7 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 bundleID];
    [(ASDTChangeRequestManager *)v6 setBundleID:v8];
  }
  else
  {
    [(ASDTChangeRequestManager *)v6 setBundleID:@"ASDTChangeRequestManager"];
  }
  v9 = NSString;
  v10 = [(ASDTChangeRequestManager *)v6 bundleID];
  v11 = [v9 stringWithFormat:@"%@.changeRequest", v10];

  v12 = +[ASDTCondition conditionWithName:v11];
  [(ASDTChangeRequestManager *)v6 setChangeRequestLock:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(ASDTChangeRequestManager *)v6 setChangeRequestQueues:v13];

  v14 = [(ASDTChangeRequestManager *)v6 changeRequestLock];
  if (v14)
  {
    v15 = [(ASDTChangeRequestManager *)v6 changeRequestQueues];
    BOOL v16 = v15 == 0;

    if (!v16)
    {

LABEL_8:
      v17 = v6;
      goto LABEL_12;
    }
  }
  v18 = ASDTBaseLogType();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = [(ASDTChangeRequestManager *)v6 bundleID];
    [(ASDTChangeRequestManager *)v19 initWithDelegate:v18];
  }

  v17 = 0;
LABEL_12:

  return v17;
}

+ (id)forDelegate:(id)a3
{
  id v3 = a3;
  id v4 = [[ASDTChangeRequestManager alloc] initWithDelegate:v3];

  return v4;
}

- (id)queueForObject:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASDTChangeRequestManager *)self changeRequestQueues];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v9 = +[ASDTChangeRequestQueue forObject:v6 withName:v7 andManager:self];
    if (v9)
    {
      v10 = [(ASDTChangeRequestManager *)self changeRequestQueues];
      [v10 setObject:v9 forKey:v7];
    }
  }

  return v9;
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 asdtName];
  ++self->_changeIndex;
  v9 = +[ASDTChangeRequest withIndex:andBlock:](ASDTChangeRequest, "withIndex:andBlock:");
  v10 = ASDTBaseLogType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(ASDTChangeRequestManager *)self bundleID];
    int v22 = 138412802;
    uint64_t v23 = v11;
    __int16 v24 = 1024;
    int v25 = [v9 index];
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_2489BC000, v10, OS_LOG_TYPE_DEFAULT, "%@: Requesting config change %u for device: %@", (uint8_t *)&v22, 0x1Cu);
  }
  v12 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v12 lock];

  v13 = [(ASDTChangeRequestManager *)self queueForObject:v6 withName:v8];
  v14 = v13;
  if (v13)
  {
    int v15 = [v13 addChangeRequest:v9];
    BOOL v16 = [(ASDTChangeRequestManager *)self changeRequestLock];
    [v16 unlock];

    if (!v15)
    {
      char v18 = 1;
      goto LABEL_11;
    }
    v17 = [(ASDTChangeRequestManager *)self delegate];
    char v18 = [v17 requestConfigurationChange:v14];
  }
  else
  {
    v19 = [(ASDTChangeRequestManager *)self changeRequestLock];
    [v19 unlock];

    v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = [(ASDTChangeRequestManager *)self bundleID];
      -[ASDTChangeRequestManager requestConfigurationChangeForDevice:withBlock:](v20, (uint64_t)v8, (uint64_t)&v22);
    }
    char v18 = 0;
  }

LABEL_11:
  return v18;
}

- (BOOL)configurationChangePendingForObject:(id)a3
{
  id v4 = [a3 asdtName];
  v5 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v5 lock];

  id v6 = [(ASDTChangeRequestManager *)self changeRequestQueues];
  id v7 = [v6 objectForKey:v4];

  char v8 = [v7 flags];
  v9 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v9 unlock];

  return v8 & 1;
}

- (void)doWaitForConfigurationChangesForQueue:(id)a3 withTimeout:(ASDTTime *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  while (([v6 flags] & 3) != 0)
  {
    id v7 = [(ASDTChangeRequestManager *)self changeRequestLock];
    long long v12 = *(_OWORD *)&a4->nsec;
    uint64_t v13 = *(void *)&a4->hostFrac;
    char v8 = [v7 waitUntilTime:&v12];

    if ((v8 & 1) == 0)
    {
      v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(ASDTChangeRequestManager *)self bundleID];
        v11 = [v6 name];
        -[ASDTChangeRequestManager doWaitForConfigurationChangesForQueue:withTimeout:](v10, v11, (uint64_t)v14);
      }

      break;
    }
  }
}

- (void)waitForConfigurationChangesForDevice:(id)a3
{
  id v4 = [a3 asdtName];
  ASDTTime::futureSecs((ASDTTime *)5, (uint64_t)&v11);
  v5 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v5 lock];

  id v6 = [(ASDTChangeRequestManager *)self changeRequestQueues];
  id v7 = [v6 objectForKey:v4];

  long long v9 = v11;
  uint64_t v10 = v12;
  [(ASDTChangeRequestManager *)self doWaitForConfigurationChangesForQueue:v7 withTimeout:&v9];
  char v8 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v8 unlock];
}

- (void)waitForAllConfigurationChanges
{
  id v3 = (ASDTTime *)ASDTTime::futureSecs((ASDTTime *)0xA, (uint64_t)&v18);
  ASDTTime::machAbsoluteTime(v3, (uint64_t)&v16);
  id v4 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v4 lock];

  for (i = 0; ; i = v8)
  {
    id v6 = [(ASDTChangeRequestManager *)self changeRequestQueues];
    id v7 = [v6 allValues];
    char v8 = [v7 firstObject];

    if (!v8) {
      break;
    }
    uint64_t v9 = v16;
    uint64_t v10 = v18;

    if (v9 >= v10) {
      goto LABEL_6;
    }
    long long v14 = v18;
    uint64_t v15 = v19;
    ASDTTime::machAbsoluteTime((ASDTTime *)[(ASDTChangeRequestManager *)self doWaitForConfigurationChangesForQueue:v8 withTimeout:&v14], (uint64_t)&v12);
    long long v16 = v12;
    uint64_t v17 = v13;
  }

LABEL_6:
  long long v11 = [(ASDTChangeRequestManager *)self changeRequestLock];
  [v11 unlock];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (ASDTCondition)changeRequestLock
{
  return self->_changeRequestLock;
}

- (void)setChangeRequestLock:(id)a3
{
}

- (NSMutableDictionary)changeRequestQueues
{
  return self->_changeRequestQueues;
}

- (void)setChangeRequestQueues:(id)a3
{
}

- (ASDTChangeRequestManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTChangeRequestManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)changeIndex
{
  return self->_changeIndex;
}

- (void)setChangeIndex:(unsigned int)a3
{
  self->_changeIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changeRequestQueues, 0);
  objc_storeStrong((id *)&self->_changeRequestLock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)initWithDelegate:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Memory allocation error.", buf, 0xCu);
}

- (void)requestConfigurationChangeForDevice:(uint64_t)a3 withBlock:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_2489BC000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to create change request queue for %@", v4, 0x16u);
}

- (void)doWaitForConfigurationChangesForQueue:(uint64_t)a3 withTimeout:.cold.1(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_2489BC000, v6, OS_LOG_TYPE_ERROR, "%@: Timeout waiting for config changes on %@", v5, 0x16u);
}

@end
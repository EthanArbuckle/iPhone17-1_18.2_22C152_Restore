@interface ASDTPMActionWaiter
- (ASDTPMAction)waitAction;
- (ASDTPMActionWaiter)initWithConfig:(id)a3 forSequencer:(id)a4;
- (NSCondition)waitForActionCondition;
- (NSString)waitActionName;
- (int)action;
- (unsigned)waitTimeoutUs;
- (void)action;
- (void)interestNotification:(int)a3 forDevice:(id)a4;
- (void)setWaitAction:(id)a3;
- (void)setWaitActionName:(id)a3;
- (void)setWaitForActionCondition:(id)a3;
- (void)setWaitTimeoutUs:(unsigned int)a3;
@end

@implementation ASDTPMActionWaiter

- (ASDTPMActionWaiter)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDTPMActionWaiter;
  v7 = [(ASDTPMAction *)&v24 initWithConfig:v6 forSequencer:a4];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = [v6 asdtDeviceUID];
  v9 = [v6 asdtPMActionWaiterActionName];
  [(ASDTPMActionWaiter *)v7 setWaitActionName:v9];

  -[ASDTPMActionWaiter setWaitTimeoutUs:](v7, "setWaitTimeoutUs:", [v6 asdtPMActionWaiterTimeoutUs]);
  id v10 = objc_alloc_init(MEMORY[0x263F08740]);
  [(ASDTPMActionWaiter *)v7 setWaitForActionCondition:v10];

  v11 = NSString;
  v12 = [(ASDTPMDevice *)v7 name];
  v13 = [v11 stringWithFormat:@"%s.%@.cond", "com.apple.AudioServerDriverTransports", v12];
  v14 = [(ASDTPMActionWaiter *)v7 waitForActionCondition];
  [v14 setName:v13];

  if (v8)
  {
    uint64_t v15 = [(ASDTPMActionWaiter *)v7 waitActionName];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(ASDTPMActionWaiter *)v7 waitForActionCondition];

      if (v17)
      {
        v18 = [(ASDTPMDevice *)v7 parentSequencer];
        v19 = [v18 parentDevice];
        v20 = [v19 deviceManager];
        [v20 registerObject:v7 withInterests:1 forUID:v8];

LABEL_6:
        v21 = v7;
        goto LABEL_10;
      }
    }
  }
  v22 = ASDTBaseLogType();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[ASDTPMActionWaiter initWithConfig:forSequencer:](v7);
  }

  v21 = 0;
LABEL_10:

  return v21;
}

- (void)interestNotification:(int)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = ASDTBaseLogType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ASDTPMActionWaiter interestNotification:forDevice:](self, v6);
  }

  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 pmSequencer];
    v9 = [(ASDTPMActionWaiter *)self waitActionName];
    id v10 = [v8 pmDeviceWithName:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(ASDTPMActionWaiter *)self waitForActionCondition];
      [v11 lock];

      [(ASDTPMActionWaiter *)self setWaitAction:v10];
      v12 = [(ASDTPMActionWaiter *)self waitForActionCondition];
      [v12 signal];

      v13 = [(ASDTPMActionWaiter *)self waitForActionCondition];
      [v13 unlock];
    }
    else
    {
      v13 = ASDTBaseLogType();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ASDTPMActionWaiter interestNotification:forDevice:](self, v13);
      }
    }
  }
  else
  {
    id v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMActionWaiter interestNotification:forDevice:](self);
    }
  }
}

- (int)action
{
  *(void *)&v17[5] = *MEMORY[0x263EF8340];
  if ([(ASDTPMActionWaiter *)self waitTimeoutUs])
  {
    v3 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", (double)-[ASDTPMActionWaiter waitTimeoutUs](self, "waitTimeoutUs") / 1000000.0);
  }
  else
  {
    v3 = 0;
  }
  v4 = [(ASDTPMActionWaiter *)self waitForActionCondition];
  [v4 lock];

  id v5 = [(ASDTPMActionWaiter *)self waitAction];

  if (!v5)
  {
    do
    {
      v11 = ASDTBaseLogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        [(ASDTPMActionWaiter *)v16 action];
      }

      v12 = [(ASDTPMActionWaiter *)self waitForActionCondition];
      v13 = v12;
      if (v3)
      {
        char v14 = [v12 waitUntilDate:v3];

        if ((v14 & 1) == 0)
        {
          v8 = [(ASDTPMActionWaiter *)self waitForActionCondition];
          [v8 unlock];
          int v9 = 1852990585;
          goto LABEL_8;
        }
      }
      else
      {
        [v12 wait];
      }
      uint64_t v15 = [(ASDTPMActionWaiter *)self waitAction];
    }
    while (!v15);
  }
  id v6 = [(ASDTPMActionWaiter *)self waitForActionCondition];
  [v6 unlock];

  id v7 = ASDTBaseLogType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ASDTPMActionWaiter *)self action];
  }

  v8 = [(ASDTPMActionWaiter *)self waitAction];
  int v9 = objc_msgSend(v8, "waitForCompletion:", -[ASDTPMActionWaiter waitTimeoutUs](self, "waitTimeoutUs"));
LABEL_8:

  return v9;
}

- (NSString)waitActionName
{
  return self->_waitActionName;
}

- (void)setWaitActionName:(id)a3
{
}

- (ASDTPMAction)waitAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waitAction);
  return (ASDTPMAction *)WeakRetained;
}

- (void)setWaitAction:(id)a3
{
}

- (unsigned)waitTimeoutUs
{
  return self->_waitTimeoutUs;
}

- (void)setWaitTimeoutUs:(unsigned int)a3
{
  self->_waitTimeoutUs = a3;
}

- (NSCondition)waitForActionCondition
{
  return self->_waitForActionCondition;
}

- (void)setWaitForActionCondition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForActionCondition, 0);
  objc_destroyWeak((id *)&self->_waitAction);
  objc_storeStrong((id *)&self->_waitActionName, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Missing device UID or action name keys, or memory allocation error", v4, v5, v6, v7, 2u);
}

- (void)interestNotification:(void *)a1 forDevice:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 waitActionName];
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%@: Action with name '%@' is not an ASDTPMAction!", v6, 0x16u);
}

- (void)interestNotification:(void *)a1 forDevice:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Device is not an ASDTAudioDevice!", v4, v5, v6, v7, 2u);
}

- (void)interestNotification:(void *)a1 forDevice:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_2489BC000, a2, OS_LOG_TYPE_DEBUG, "%@: Notified.", (uint8_t *)&v4, 0xCu);
}

- (void)action
{
  uint64_t v7 = [a2 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_2489BC000, a4, OS_LOG_TYPE_DEBUG, "%@: Waiting for action.", a1, 0xCu);
}

@end
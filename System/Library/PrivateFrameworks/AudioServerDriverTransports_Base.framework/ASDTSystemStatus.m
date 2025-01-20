@interface ASDTSystemStatus
+ (id)systemStatus;
- (ASDTCondition)mutex;
- (ASDTSystemStatus)init;
- (BOOL)enabled;
- (NSMutableSet)deviceUIDs;
- (STMediaStatusDomainMicrophoneRecordingAttribution)attribution;
- (STMediaStatusDomainPublisher)publisher;
- (void)init;
- (void)publishMicrophoneEnabled:(BOOL)a3;
- (void)recordingIsEnabled:(BOOL)a3 forDeviceUID:(id)a4;
- (void)setAttribution:(id)a3;
- (void)setDeviceUIDs:(id)a3;
- (void)setMutex:(id)a3;
- (void)setPublisher:(id)a3;
@end

@implementation ASDTSystemStatus

+ (id)systemStatus
{
  if (+[ASDTSystemStatus systemStatus]::onceToken != -1) {
    dispatch_once(&+[ASDTSystemStatus systemStatus]::onceToken, &__block_literal_global_0);
  }
  v2 = (void *)gSystemStatus;
  return v2;
}

uint64_t __32__ASDTSystemStatus_systemStatus__block_invoke()
{
  gSystemStatus = objc_alloc_init(ASDTSystemStatus);
  return MEMORY[0x270F9A758]();
}

- (ASDTSystemStatus)init
{
  v21.receiver = self;
  v21.super_class = (Class)ASDTSystemStatus;
  v2 = [(ASDTSystemStatus *)&v21 init];
  if (!v2) {
    goto LABEL_17;
  }
  v3 = +[ASDTCondition conditionWithName:@"com.apple.AudioServerDriverTransports.SystemStatus"];
  [(ASDTSystemStatus *)v2 setMutex:v3];

  v4 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  [(ASDTSystemStatus *)v2 setDeviceUIDs:v4];

  v5 = [(ASDTSystemStatus *)v2 mutex];
  if (!v5
    || ([(ASDTSystemStatus *)v2 deviceUIDs],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemStatus init]();
    }
    goto LABEL_9;
  }
  *(void *)&long long v7 = -1;
  *((void *)&v7 + 1) = -1;
  *(_OWORD *)task_info_out = v7;
  long long v20 = v7;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x263EF8960], 0xFu, task_info_out, &task_info_outCnt))
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemStatus init].cold.5();
    }
    goto LABEL_9;
  }
  if (!objc_opt_class() || !objc_opt_class() || !objc_opt_class())
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2489BC000, v8, OS_LOG_TYPE_INFO, "SystemStatus is not supported on this system.", buf, 2u);
    }
    goto LABEL_9;
  }
  id v10 = objc_alloc_init(MEMORY[0x263F7C2E8]);
  [(ASDTSystemStatus *)v2 setPublisher:v10];

  v11 = [(ASDTSystemStatus *)v2 publisher];

  if (!v11)
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemStatus init]();
    }
    goto LABEL_9;
  }
  v16[0] = *(_OWORD *)task_info_out;
  v16[1] = v20;
  v8 = [MEMORY[0x263F7C2A8] attributionWithAuditToken:v16];
  if (v8)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F7C2E0]) initWithActivityAttribution:v8];
    [(ASDTSystemStatus *)v2 setAttribution:v12];

    v13 = [(ASDTSystemStatus *)v2 attribution];

    if (v13)
    {

LABEL_17:
      v9 = v2;
      goto LABEL_18;
    }
    v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemStatus init].cold.4();
    }
  }
  else
  {
    v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemStatus init]();
    }
  }

LABEL_9:
  v9 = 0;
LABEL_18:

  return v9;
}

- (BOOL)enabled
{
  v3 = [(ASDTSystemStatus *)self mutex];
  [v3 lock];

  v4 = [(ASDTSystemStatus *)self deviceUIDs];
  uint64_t v5 = [v4 count];

  v6 = [(ASDTSystemStatus *)self mutex];
  [v6 unlock];

  return v5 != 0;
}

- (void)recordingIsEnabled:(BOOL)a3 forDeviceUID:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  if (!v14) {
    goto LABEL_10;
  }
  v6 = [(ASDTSystemStatus *)self mutex];
  [v6 lock];

  long long v7 = [(ASDTSystemStatus *)self deviceUIDs];
  int v8 = [v7 containsObject:v14];

  if (((!v4 | v8) & 1) == 0)
  {
    id v10 = [(ASDTSystemStatus *)self deviceUIDs];
    [v10 addObject:v14];
    goto LABEL_7;
  }
  char v9 = 0;
  if (!v4 && ((v8 ^ 1) & 1) == 0)
  {
    id v10 = [(ASDTSystemStatus *)self deviceUIDs];
    [v10 removeObject:v14];
LABEL_7:

    char v9 = 1;
  }
  v11 = [(ASDTSystemStatus *)self deviceUIDs];
  uint64_t v12 = [v11 count];

  v13 = [(ASDTSystemStatus *)self mutex];
  [v13 unlock];

  if (v9) {
    [(ASDTSystemStatus *)self publishMicrophoneEnabled:v12 != 0];
  }
LABEL_10:
}

- (void)publishMicrophoneEnabled:(BOOL)a3
{
  uint64_t v5 = [(ASDTSystemStatus *)self publisher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__ASDTSystemStatus_publishMicrophoneEnabled___block_invoke;
  v6[3] = &unk_265243D90;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 updateVolatileDataWithBlock:v6];
}

void __45__ASDTSystemStatus_publishMicrophoneEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v4 = [v3 attribution];
    [v5 addMicrophoneAttribution:v4];
  }
  else
  {
    BOOL v4 = [v3 attribution];
    [v5 removeMicrophoneAttribution:v4];
  }
}

- (ASDTCondition)mutex
{
  return self->_mutex;
}

- (void)setMutex:(id)a3
{
}

- (NSMutableSet)deviceUIDs
{
  return self->_deviceUIDs;
}

- (void)setDeviceUIDs:(id)a3
{
}

- (STMediaStatusDomainPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_deviceUIDs, 0);
  objc_storeStrong((id *)&self->_mutex, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Failed to create an audit token.", v2, v3, v4, v5, v6);
}

@end
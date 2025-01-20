@interface CSFSensorControlSelfLogger
+ (id)sharedLogger;
- (int)_getMHSensorControlStatusWithCSFSensorStatus:(unint64_t)a3;
- (void)logSensorControlStartWithStatus:(unint64_t)a3 withMHUUID:(id)a4;
@end

@implementation CSFSensorControlSelfLogger

- (int)_getMHSensorControlStatusWithCSFSensorStatus:(unint64_t)a3
{
  if (a3 - 1 < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)logSensorControlStartWithStatus:(unint64_t)a3 withMHUUID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      v14 = "-[CSFSensorControlSelfLogger logSensorControlStartWithStatus:withMHUUID:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating new mhUUID: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FA08E8]);
  objc_msgSend(v8, "setSensorControlStatus:", -[CSFSensorControlSelfLogger _getMHSensorControlStatusWithCSFSensorStatus:](self, "_getMHSensorControlStatusWithCSFSensorStatus:", a3));
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];
  [v10 setMhId:v11];

  [v9 setEventMetadata:v10];
  [v9 setSensorControlStatusReported:v8];
  v12 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v12 emitMessage:v9];
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_9728 != -1) {
    dispatch_once(&sharedLogger_onceToken_9728, &__block_literal_global_9729);
  }
  v2 = (void *)sharedLogger_sharedLogger;
  return v2;
}

uint64_t __42__CSFSensorControlSelfLogger_sharedLogger__block_invoke()
{
  sharedLogger_sharedLogger = objc_alloc_init(CSFSensorControlSelfLogger);
  return MEMORY[0x1F41817F8]();
}

@end
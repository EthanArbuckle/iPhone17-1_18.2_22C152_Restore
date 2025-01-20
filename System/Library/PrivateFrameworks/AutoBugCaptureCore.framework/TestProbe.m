@interface TestProbe
+ (id)testProbeStatusString:(unsigned int)a3;
+ (void)autoBugCapturePath:(id *)a3 autoBugCaptureUID:(id *)a4 autoBugCaptureGID:(id *)a5;
+ (void)loadCoreUtils;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunning;
- (BOOL)startPeriodicTimer;
- (BOOL)startPeriodicTimerAt:(unint64_t)a3 repeatInterval:(unint64_t)a4;
- (NSMutableArray)probeOutputFilePaths;
- (NSString)diagSessionUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)periodicTimer;
- (TestProbe)initWithQueue:(id)a3;
- (unsigned)status;
- (void)cancelTest:(id)a3;
- (void)removeProbeOutputFiles;
- (void)setDiagSessionUUID:(id)a3;
- (void)setPeriodicTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setUuid:(id)a3;
- (void)stopPeriodicTimer;
@end

@implementation TestProbe

+ (void)autoBugCapturePath:(id *)a3 autoBugCaptureUID:(id *)a4 autoBugCaptureGID:(id *)a5
{
  if (autoBugCapturePath) {
    BOOL v8 = autoBugCaptureUID == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || autoBugCaptureGID == 0)
  {
    v10 = +[ABCAdministrator sharedInstance];
    v11 = [v10 configurationManager];

    if (v11)
    {
      uint64_t v12 = [v11 logArchivePath];
      v13 = (void *)autoBugCapturePath;
      autoBugCapturePath = v12;

      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "logArchiveUID"));
      v15 = (void *)autoBugCaptureUID;
      autoBugCaptureUID = v14;

      uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "logArchiveGID"));
      v17 = (void *)autoBugCaptureGID;
      autoBugCaptureGID = v16;
    }
  }
  if (a3) {
    *a3 = (id) autoBugCapturePath;
  }
  if (a4) {
    *a4 = (id) autoBugCaptureUID;
  }
  if (a5) {
    *a5 = (id) autoBugCaptureGID;
  }
}

- (TestProbe)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TestProbe;
  v6 = [(TestProbe *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_status = -1;
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    probeOutputFilePaths = v7->_probeOutputFilePaths;
    v7->_probeOutputFilePaths = (NSMutableArray *)v10;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TestProbe *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(TestProbe *)v4 uuid];
      char v6 = [v5 isEqual:self->_uuid];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)cancelTest:(id)a3
{
  id v5 = a3;
  [(TestProbe *)self stopTest];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 4);
    v4 = v5;
  }
}

+ (id)testProbeStatusString:(unsigned int)a3
{
  if (a3 + 1 > 6) {
    return @"UNEXPECTED PROBE STATUS!";
  }
  else {
    return off_263FC3540[a3 + 1];
  }
}

- (BOOL)startPeriodicTimer
{
  return 0;
}

- (BOOL)startPeriodicTimerAt:(unint64_t)a3 repeatInterval:(unint64_t)a4
{
  v7 = [(TestProbe *)self queue];
  uint64_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);

  if (v8)
  {
    dispatch_source_set_timer(v8, a3, a4, 0);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    objc_super v13 = __49__TestProbe_startPeriodicTimerAt_repeatInterval___block_invoke;
    uint64_t v14 = &unk_263FC3430;
    v15 = self;
    v9 = v8;
    uint64_t v16 = v9;
    dispatch_source_set_event_handler(v9, &v11);
    -[TestProbe setPeriodicTimer:](self, "setPeriodicTimer:", v9, v11, v12, v13, v14, v15);
    dispatch_resume(v9);
  }
  return v8 != 0;
}

uint64_t __49__TestProbe_startPeriodicTimerAt_repeatInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicTimerFired:*(void *)(a1 + 40)];
}

- (void)stopPeriodicTimer
{
  v3 = [(TestProbe *)self periodicTimer];

  if (v3)
  {
    v4 = [(TestProbe *)self periodicTimer];
    dispatch_source_cancel(v4);

    [(TestProbe *)self setPeriodicTimer:0];
  }
}

+ (void)loadCoreUtils
{
  return dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 6);
}

- (void)removeProbeOutputFiles
{
  v3 = [(TestProbe *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TestProbe_removeProbeOutputFiles__block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __35__TestProbe_removeProbeOutputFiles__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) probeOutputFilePaths];
  if ([v1 count])
  {
    v2 = [MEMORY[0x263F08850] defaultManager];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = v1;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ([v2 fileExistsAtPath:v8])
          {
            id v13 = 0;
            char v9 = [v2 removeItemAtPath:v8 error:&v13];
            uint64_t v10 = v13;
            if ((v9 & 1) == 0)
            {
              uint64_t v11 = symptomsLogHandle();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v19 = v8;
                __int16 v20 = 2112;
                v21 = v10;
                _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Couldn't delete canceled file: %@ because %@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v10 = symptomsLogHandle();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v19 = v8;
              _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Couldn't locate file at %@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v5);
    }

    v1 = v12;
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)diagSessionUUID
{
  return self->_diagSessionUUID;
}

- (void)setDiagSessionUUID:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)periodicTimer
{
  return self->_periodicTimer;
}

- (void)setPeriodicTimer:(id)a3
{
}

- (NSMutableArray)probeOutputFilePaths
{
  return self->_probeOutputFilePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeOutputFilePaths, 0);
  objc_storeStrong((id *)&self->_periodicTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_diagSessionUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
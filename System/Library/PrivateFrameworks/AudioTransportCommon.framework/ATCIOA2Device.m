@interface ATCIOA2Device
+ (id)iokitMatchingDictionary;
- (ATCIOA2Device)initWithService:(id)a3;
- (BOOL)changeToSampleRate:(double)a3 error:(id *)a4;
- (BOOL)performConfiigChangeForNotification:(IOAudio2Notification *)a3 error:(id *)a4;
- (BOOL)startIOError:(id *)a3;
- (BOOL)stopIOError:(id *)a3;
- (NSArray)availableSampleRates;
- (NSArray)inputStreams;
- (NSArray)outputStreams;
- (NSString)name;
- (NSString)uid;
- (double)sampleRate;
- (id)_buildInputStreams;
- (id)_buildOutputStreams;
- (unsigned)clockDomain;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)ioBufferSize;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (void)dealloc;
- (void)handleNotification:(IOAudio2Notification *)a3;
- (void)setAvailableSampleRates:(id)a3;
- (void)setInputStreams:(id)a3;
- (void)setOutputStreams:(id)a3;
@end

@implementation ATCIOA2Device

+ (id)iokitMatchingDictionary
{
  return (id)[MEMORY[0x263F4B1F8] serviceMatching:@"IOAudio2Device"];
}

- (ATCIOA2Device)initWithService:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v62.receiver = self;
  v62.super_class = (Class)ATCIOA2Device;
  v6 = [(ATCIOA2Device *)&v62 init];
  if (!v6) {
    goto LABEL_50;
  }
  v7 = v6;
  uint64_t v8 = [v5 propertyForKey:@"device name"];
  name = v7->_name;
  v7->_name = (NSString *)v8;

  uint64_t v10 = [v5 propertyForKey:@"device UID"];
  uid = v7->_uid;
  v7->_uid = (NSString *)v10;

  id v12 = [NSString stringWithFormat:@"com.apple.audio.AudioTransportCommon.aeadevice.%@", v7->_uid];
  dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  if (!v7->_queue)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "_queue != nil";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 75;
    v48 = &_os_log_internal;
LABEL_48:
    _os_log_impl(&dword_225991000, v48, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_49;
  }
  uint64_t v15 = [objc_alloc(MEMORY[0x263F4B1F0]) initOnDispatchQueue:v7->_queue];
  notificationPort = v7->_notificationPort;
  v7->_notificationPort = (IOKNotificationPort *)v15;

  if (!v7->_notificationPort)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "_notificationPort != nil";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 78;
    v48 = &_os_log_internal;
    goto LABEL_48;
  }
  uint64_t v17 = [v5 connectToServiceOfType:0];
  connection = v7->_connection;
  v7->_connection = (IOKConnection *)v17;

  v19 = v7->_connection;
  if (!v19)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "_connection != nil";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 81;
    v48 = &_os_log_internal;
    goto LABEL_48;
  }
  uint64_t v60 = 0;
  v61 = 0;
  if (([(IOKConnection *)v19 mapMemory64OfType:0 withOptions:1 atAddress:&v61 ofSize:&v60 error:0] & 1) == 0)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "success";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 87;
    v48 = &_os_log_internal;
    goto LABEL_48;
  }
  if (v60 != 40)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "size == sizeof(IOAudio2EngineStatus)";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 88;
    v48 = &_os_log_internal;
    goto LABEL_48;
  }
  v20 = v61;
  v7->_engineStatus = v61;
  if (!v20)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316418;
    v66 = "_engineStatus != nil";
    __int16 v67 = 2048;
    uint64_t v68 = 0;
    __int16 v69 = 2048;
    uint64_t v70 = 0;
    __int16 v71 = 2080;
    v72 = &unk_225995856;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    __int16 v75 = 1024;
    int v76 = 91;
    v48 = &_os_log_internal;
    goto LABEL_48;
  }
  unsigned int v21 = [(IOKNotificationPort *)v7->_notificationPort machPort];
  dispatch_source_t v22 = dispatch_source_create(MEMORY[0x263EF83C8], v21, 0, (dispatch_queue_t)v7->_queue);
  notificationSource = v7->_notificationSource;
  v7->_notificationSource = (OS_dispatch_source *)v22;

  v24 = v7->_notificationSource;
  if (!v24)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v66 = "_notificationSource != nil";
      __int16 v67 = 2048;
      uint64_t v68 = 0;
      __int16 v69 = 2048;
      uint64_t v70 = 0;
      __int16 v71 = 2080;
      v72 = &unk_225995856;
      __int16 v73 = 2080;
      v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      __int16 v75 = 1024;
      int v76 = 94;
      v48 = &_os_log_internal;
      goto LABEL_48;
    }
LABEL_49:

LABEL_50:
    v25 = 0;
    goto LABEL_51;
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __33__ATCIOA2Device_initWithService___block_invoke;
  handler[3] = &unk_264760738;
  v25 = v7;
  v59 = v25;
  dispatch_source_set_event_handler(v24, handler);
  dispatch_resume((dispatch_object_t)v7->_notificationSource);
  if (([(IOKConnection *)v7->_connection setNotificationPort:v7->_notificationPort ofType:0 withReference:v25 error:0] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v66 = "success";
      __int16 v67 = 2048;
      uint64_t v68 = 0;
      __int16 v69 = 2048;
      uint64_t v70 = 0;
      __int16 v71 = 2080;
      v72 = &unk_225995856;
      __int16 v73 = 2080;
      v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      __int16 v75 = 1024;
      int v76 = 130;
      _os_log_impl(&dword_225991000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    availableSampleRates = v25;
    v25 = 0;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v25->_service, a3);
  uint64_t v26 = [(ATCIOA2Device *)v25 _buildInputStreams];
  inputStreams = v25->_inputStreams;
  v25->_inputStreams = (NSArray *)v26;

  uint64_t v28 = [(ATCIOA2Device *)v25 _buildOutputStreams];
  outputStreams = v25->_outputStreams;
  v25->_outputStreams = (NSArray *)v28;

  if ([(NSArray *)v25->_inputStreams count])
  {
    v30 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v31 = [(NSArray *)v25->_inputStreams firstObject];
    v32 = [v31 availableFormats];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = NSNumber;
          [*(id *)(*((void *)&v54 + 1) + 8 * i) sampleRate];
          v38 = objc_msgSend(v37, "numberWithDouble:");
          if (![(NSArray *)v30 containsObject:v38]) {
            [(NSArray *)v30 addObject:v38];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v34);
    }
  }
  else
  {
    if (![(NSArray *)v25->_outputStreams count])
    {
      uint64_t v47 = [MEMORY[0x263EFF8C0] array];
      availableSampleRates = v25->_availableSampleRates;
      v25->_availableSampleRates = (NSArray *)v47;
      goto LABEL_32;
    }
    v30 = [MEMORY[0x263EFF980] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v39 = [(NSArray *)v25->_outputStreams firstObject];
    v32 = [v39 availableFormats];

    uint64_t v40 = [v32 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v51 != v42) {
            objc_enumerationMutation(v32);
          }
          v44 = NSNumber;
          [*(id *)(*((void *)&v50 + 1) + 8 * j) sampleRate];
          v45 = objc_msgSend(v44, "numberWithDouble:");
          if (![(NSArray *)v30 containsObject:v45]) {
            [(NSArray *)v30 addObject:v45];
          }
        }
        uint64_t v41 = [v32 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v41);
    }
  }

  availableSampleRates = v25->_availableSampleRates;
  v25->_availableSampleRates = v30;
LABEL_32:

LABEL_51:
  return v25;
}

void __33__ATCIOA2Device_initWithService___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A6387B0]();
  v5.msgh_local_port = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "machPort", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (mach_msg(&v5, 2, 0, 0x88u, [*(id *)(*(void *)(a1 + 32) + 32) machPort], 0, 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v9 = "theError == noErr";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      uint64_t v15 = &unk_225995856;
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      __int16 v18 = 1024;
      int v19 = 113;
      _os_log_impl(&dword_225991000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
  }
  else if (v6)
  {
    unint64_t v3 = 0;
    v4 = &v7;
    do
    {
      [*(id *)(a1 + 32) handleNotification:v4];
      ++v3;
      v4 += 2;
    }
    while (v3 < v6);
  }
}

- (double)sampleRate
{
  v2 = [(IOKService *)self->_service propertyForKey:@"sample rate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  double v4 = IOAudio2Fixed64ToFloat64([v3 longLongValue]);

  return v4;
}

- (BOOL)changeToSampleRate:(double)a3 error:(id *)a4
{
  unint64_t v7 = Float64ToIOAudio2Fixed64(a3);
  return [(IOKConnection *)self->_connection callMethodWithSelector:4 scalarInputs:0 scalarInputCount:0 structInput:&v7 structInputSize:8 scalarOutputs:0 scalarOutputCount:0 structOutput:0 structOutputSize:0 error:a4];
}

- (unsigned)clockDomain
{
  v2 = [(IOKService *)self->_service propertyForKey:@"clock domain"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)inputSafetyOffset
{
  v2 = [(IOKService *)self->_service propertyForKey:@"input safety offset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)inputLatency
{
  v2 = [(IOKService *)self->_service propertyForKey:@"input latency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)outputSafetyOffset
{
  v2 = [(IOKService *)self->_service propertyForKey:@"output safety offset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)outputLatency
{
  v2 = [(IOKService *)self->_service propertyForKey:@"output latency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)ioBufferSize
{
  v2 = [(IOKService *)self->_service propertyForKey:@"io buffer frame size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (id)_buildInputStreams
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(IOKService *)self->_service propertyForKey:@"input streams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [[ATCIOA2Stream alloc] initWithService:self->_service connection:self->_connection index:v8 + i input:1 description:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (v11) {
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v8 += i;
      }
      while (v7);
    }

    if ([v4 count]) {
      id v12 = v4;
    }
    else {
      id v12 = 0;
    }

    id v3 = v14;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_buildOutputStreams
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(IOKService *)self->_service propertyForKey:@"output streams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [[ATCIOA2Stream alloc] initWithService:self->_service connection:self->_connection index:v8 + i input:0 description:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (v11) {
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v8 += i;
      }
      while (v7);
    }

    if ([v4 count]) {
      id v12 = v4;
    }
    else {
      id v12 = 0;
    }

    id v3 = v14;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)startIOError:(id *)a3
{
  return [(IOKConnection *)self->_connection callMethodWithSelector:0 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 structOutput:0 structOutputSize:0 error:a3];
}

- (BOOL)stopIOError:(id *)a3
{
  return [(IOKConnection *)self->_connection callMethodWithSelector:1 scalarInputs:0 scalarInputCount:0 structInput:0 structInputSize:0 scalarOutputs:0 scalarOutputCount:0 structOutput:0 structOutputSize:0 error:a3];
}

- (BOOL)performConfiigChangeForNotification:(IOAudio2Notification *)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(IOKService *)self->_service properties];
  char v8 = [(IOKConnection *)self->_connection callMethodWithSelector:3 scalarInputs:0 scalarInputCount:0 structInput:a3 structInputSize:32 scalarOutputs:0 scalarOutputCount:0 structOutput:0 structOutputSize:0 error:a4];
  uint64_t v9 = [(IOKService *)self->_service properties];
  __int16 v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = [v7 allKeys];
  id v12 = [v10 arrayWithArray:v11];

  uint64_t v13 = [v9 allKeys];
  [v12 removeObjectsInArray:v13];

  __int16 v14 = (void *)MEMORY[0x263EFF980];
  long long v15 = [v9 allKeys];
  long long v16 = [v14 arrayWithArray:v15];

  long long v17 = [v7 allKeys];
  [v16 removeObjectsInArray:v17];

  long long v18 = [(ATCIOA2Device *)self _buildInputStreams];
  [(ATCIOA2Device *)self setInputStreams:v18];

  int v19 = [(ATCIOA2Device *)self _buildOutputStreams];
  [(ATCIOA2Device *)self setOutputStreams:v19];

  uint64_t v20 = [(ATCIOA2Device *)self inputStreams];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v44 = v16;
    v45 = v12;
    char v46 = v8;
    dispatch_source_t v22 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v23 = [(ATCIOA2Device *)self inputStreams];
    v24 = [v23 firstObject];
    v25 = [v24 availableFormats];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = NSNumber;
          [*(id *)(*((void *)&v51 + 1) + 8 * i) sampleRate];
          v31 = objc_msgSend(v30, "numberWithDouble:");
          if (([v22 containsObject:v31] & 1) == 0) {
            [v22 addObject:v31];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v27);
    }
  }
  else
  {
    v32 = [(ATCIOA2Device *)self outputStreams];
    uint64_t v33 = [v32 count];

    if (!v33)
    {
      v43 = [MEMORY[0x263EFF8C0] array];
      [(ATCIOA2Device *)self setAvailableSampleRates:v43];

      goto LABEL_23;
    }
    v44 = v16;
    v45 = v12;
    char v46 = v8;
    dispatch_source_t v22 = [MEMORY[0x263EFF980] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v34 = [(ATCIOA2Device *)self outputStreams];
    uint64_t v35 = [v34 firstObject];
    v25 = [v35 availableFormats];

    uint64_t v36 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v25);
          }
          uint64_t v40 = NSNumber;
          [*(id *)(*((void *)&v47 + 1) + 8 * j) sampleRate];
          uint64_t v41 = objc_msgSend(v40, "numberWithDouble:");
          if (([v22 containsObject:v41] & 1) == 0) {
            [v22 addObject:v41];
          }
        }
        uint64_t v37 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v37);
    }
  }

  [(ATCIOA2Device *)self setAvailableSampleRates:v22];
  char v8 = v46;
  long long v16 = v44;
  id v12 = v45;
LABEL_23:

  return v8;
}

- (void)handleNotification:(IOAudio2Notification *)a3
{
  unsigned int var1 = a3->var1;
  if (var1 == 1751215220)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    char v8 = &_os_log_internal;
    uint64_t v9 = "IO Stopped";
LABEL_13:
    _os_log_impl(&dword_225991000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    return;
  }
  if (var1 == 1735354734)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    char v8 = &_os_log_internal;
    uint64_t v9 = "IO Started";
    goto LABEL_13;
  }
  if (var1 != 1668247142)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    char v8 = &_os_log_internal;
    uint64_t v9 = "Received an unexpected IOAudio2Notification";
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225991000, &_os_log_internal, OS_LOG_TYPE_INFO, "Request Config Change", buf, 2u);
  }
  long long v6 = *(_OWORD *)&a3->var4;
  long long v11 = *(_OWORD *)&a3->var0;
  long long v12 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__ATCIOA2Device_handleNotification___block_invoke;
  v10[3] = &unk_264760760;
  v10[4] = self;
  uint64_t v7 = (void (**)(void))MEMORY[0x22A6388E0](v10);
  v7[2]();
}

void __36__ATCIOA2Device_handleNotification___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A6387B0]();
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  [*(id *)(a1 + 32) performConfiigChangeForNotification:v4 error:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATCIOA2Device;
  [(ATCIOA2Device *)&v2 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSArray)availableSampleRates
{
  return self->_availableSampleRates;
}

- (void)setAvailableSampleRates:(id)a3
{
}

- (NSArray)inputStreams
{
  return self->_inputStreams;
}

- (void)setInputStreams:(id)a3
{
}

- (NSArray)outputStreams
{
  return self->_outputStreams;
}

- (void)setOutputStreams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStreams, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
  objc_storeStrong((id *)&self->_availableSampleRates, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_notificationSource, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
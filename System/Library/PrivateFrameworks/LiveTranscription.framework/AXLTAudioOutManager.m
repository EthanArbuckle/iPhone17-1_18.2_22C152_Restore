@interface AXLTAudioOutManager
+ (AXLTAudioOutManager)sharedInstance;
+ (BOOL)isExcludedAppID:(id)a3;
- (AVSystemController)avSystemController;
- (AXLTAudioOutManager)init;
- (AXLTTranscriberDelegateProtocol)delegate;
- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3;
- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 error:(id *)a6;
- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 excludingPIDs:(id)a6 error:(id *)a7;
- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 error:(id *)a5;
- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 excludingPIDs:(id)a5 error:(id *)a6;
- (BOOL)_startTranscriptionForPID:(int)a3 error:(id *)a4;
- (BOOL)_stopTranscriptionForPID:(int)a3 error:(id *)a4;
- (BOOL)isTranscribing;
- (BOOL)isTranscribingForPID:(int)a3;
- (BOOL)startTranscription:(id *)a3;
- (BOOL)stopTranscription:(id *)a3;
- (BOOL)subscribed;
- (NSMapTable)processToTranscriberMap;
- (OS_dispatch_queue)bufferQueue;
- (id)_reportErrorWithCode:(int64_t)a3 debugErrorString:(id)a4 cleanupForPID:(int)a5;
- (id)_tapDescriptionForPID:(int)a3 tapFormat:(id)a4 excludePIDs:(id)a5;
- (id)appInfoFromPid:(int)a3;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_cleanupAllPids;
- (void)_cleanupForPID:(int)a3;
- (void)_setupAVSystemNotificationSystem;
- (void)_someSessionIsPlayingDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)handleInputBufferWithContext:(void *)a3 audioQueue:(OpaqueAudioQueue *)a4 audioBuffer:(AudioQueueBuffer *)a5 timestamp:(const AudioTimeStamp *)a6 packetCount:(unsigned int)a7 packetDesc:(const AudioStreamPacketDescription *)a8;
- (void)registerFirstTimeForAVSystemControllerNotifications;
- (void)registerForAVSystemContollerNotifications;
- (void)setAvSystemController:(id)a3;
- (void)setBufferQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsTranscribing:(BOOL)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)unregisterForAVSystemContollerNotifications;
- (void)updateAudioSessionsInfoFromSessionsArray:(id)a3;
@end

@implementation AXLTAudioOutManager

+ (AXLTAudioOutManager)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance__shared_1;
  return (AXLTAudioOutManager *)v2;
}

uint64_t __37__AXLTAudioOutManager_sharedInstance__block_invoke()
{
  sharedInstance__shared_1 = objc_alloc_init(AXLTAudioOutManager);
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isExcludedAppID:(id)a3
{
  uint64_t v3 = isExcludedAppID__onceToken[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(isExcludedAppID__onceToken, &__block_literal_global_276);
  }
  char v5 = [(id)isExcludedAppID___excludedAppIDs containsObject:v4];

  return v5;
}

void __39__AXLTAudioOutManager_isExcludedAppID___block_invoke()
{
  v0 = (void *)isExcludedAppID___excludedAppIDs;
  isExcludedAppID___excludedAppIDs = (uint64_t)&unk_26EFE6DC0;
}

- (AXLTAudioOutManager)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AXLTAudioOutManager;
  v2 = [(AXLTAudioOutManager *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_isTranscribing = 0;
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.LiveTranscription.audioOutManagerBufferQueue", v4);
    bufferQueue = v3->_bufferQueue;
    v3->_bufferQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    processToTranscriberMap = v3->_processToTranscriberMap;
    v3->_processToTranscriberMap = (NSMapTable *)v7;

    [(AXLTAudioOutManager *)v3 _setupAVSystemNotificationSystem];
    v9 = AXLogLiveTranscription();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      avSystemController = v3->_avSystemController;
      *(_DWORD *)buf = 138412290;
      v14 = avSystemController;
      _os_log_impl(&dword_23C242000, v9, OS_LOG_TYPE_INFO, "_avSystemController: %@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)dealloc
{
  [(AXLTAudioOutManager *)self stopTranscription:0];
  [(AXLTAudioOutManager *)self _stopTranscriptionForPID:4294967293 error:0];
  [(AXLTAudioOutManager *)self _stopTranscriptionForPID:4294967294 error:0];
  v3.receiver = self;
  v3.super_class = (Class)AXLTAudioOutManager;
  [(AXLTAudioOutManager *)&v3 dealloc];
}

- (BOOL)startTranscription:(id *)a3
{
  if ([(AXLTAudioOutManager *)self isTranscribing])
  {
    id v4 = AXLogLiveTranscription();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C242000, v4, OS_LOG_TYPE_INFO, "Already registered for transcribing", buf, 2u);
    }
  }
  else
  {
    [(AXLTAudioOutManager *)self setIsTranscribing:1];
    dispatch_queue_t v5 = +[AXLTTranscriber sharedInstance];
    uint64_t v6 = [v5 downloadState];

    if (v6 == -1)
    {
      uint64_t v7 = +[AXLTTranscriber sharedInstance];
      [v7 setDownloadState:-2];
    }
    v8 = AXLogLiveTranscription();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23C242000, v8, OS_LOG_TYPE_INFO, "registered for transcription", v10, 2u);
    }

    [(AXLTAudioOutManager *)self registerFirstTimeForAVSystemControllerNotifications];
  }
  return 1;
}

- (BOOL)stopTranscription:(id *)a3
{
  if ([(AXLTAudioOutManager *)self isTranscribing])
  {
    [(AXLTAudioOutManager *)self setIsTranscribing:0];
    [(AXLTAudioOutManager *)self unregisterForAVSystemContollerNotifications];
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F54470] object:0];
  }
  else
  {
    dispatch_queue_t v5 = AXLogLiveTranscription();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_INFO, "Already stopped transcribing", v7, 2u);
    }
  }
  return 1;
}

- (BOOL)isTranscribingForPID:(int)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatch_queue_t v5 = [(AXLTAudioOutManager *)self bufferQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AXLTAudioOutManager_isTranscribingForPID___block_invoke;
  block[3] = &unk_264E39C50;
  int v8 = a3;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

void __44__AXLTAudioOutManager_isTranscribingForPID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) intValue] == *(_DWORD *)(a1 + 48))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_reportErrorWithCode:(int64_t)a3 debugErrorString:(id)a4 cleanupForPID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  long long v9 = AXLogLiveTranscription();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[AXLTAudioOutManager _reportErrorWithCode:debugErrorString:cleanupForPID:]();
  }

  long long v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F07F80];
  v15[0] = v8;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = [v10 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:a3 userInfo:v11];

  [(AXLTAudioOutManager *)self _cleanupForPID:v5];
  return v12;
}

- (BOOL)_startTranscriptionForPID:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v7 = AXLCLocString(@"liveCaptions.system");
  LOBYTE(a4) = [(AXLTAudioOutManager *)self _startTranscriptionForPID:v5 appID:@"System" appName:v7 excludingPIDs:0 error:a4];

  return (char)a4;
}

- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 error:(id *)a5
{
  return [(AXLTAudioOutManager *)self _startTranscriptionForPID:*(void *)&a3 appID:@"System" appName:a4 excludingPIDs:0 error:a5];
}

- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 excludingPIDs:(id)a5 error:(id *)a6
{
  return [(AXLTAudioOutManager *)self _startTranscriptionForPID:*(void *)&a3 appID:@"System" appName:a4 excludingPIDs:a5 error:a6];
}

- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 error:(id *)a6
{
  return [(AXLTAudioOutManager *)self _startTranscriptionForPID:*(void *)&a3 appID:a4 appName:a5 excludingPIDs:0 error:a6];
}

- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 excludingPIDs:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [(AXLTAudioOutManager *)self isTranscribingForPID:v10];
  v16 = AXLogLiveTranscription();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [NSNumber numberWithInt:v10];
      LODWORD(buf.mSampleRate) = 138412546;
      *(void *)((char *)&buf.mSampleRate + 4) = v13;
      LOWORD(buf.mFormatFlags) = 2112;
      *(void *)((char *)&buf.mFormatFlags + 2) = v20;
      _os_log_impl(&dword_23C242000, v17, OS_LOG_TYPE_DEFAULT, "AudioManager: Starting transcription for app: %@, pid: %@", (uint8_t *)&buf, 0x16u);
    }
    v21 = [AXLTAudioOutTranscriber alloc];
    v22 = [(AXLTAudioOutManager *)self delegate];
    v23 = [(AXLTAudioOutTranscriber *)v21 initWithPID:v10 appID:v12 appName:v13 delegate:v22];

    v24 = [(AXLTAudioOutManager *)self bufferQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__AXLTAudioOutManager__startTranscriptionForPID_appID_appName_excludingPIDs_error___block_invoke;
    block[3] = &unk_264E39C78;
    block[4] = self;
    v17 = v23;
    v44 = v17;
    int v45 = v10;
    dispatch_sync(v24, block);

    uint64_t v25 = [v17 pid];
    v26 = [v17 tapFormat];
    v27 = [(AXLTAudioOutManager *)self _tapDescriptionForPID:v25 tapFormat:v26 excludePIDs:v14];

    v28 = [v27 format];
    uint64_t v29 = [v28 streamDescription];
    uint64_t v30 = *(void *)(v29 + 32);
    long long v31 = *(_OWORD *)(v29 + 16);
    *(_OWORD *)&buf.mSampleRate = *(_OWORD *)v29;
    *(_OWORD *)&buf.signed int mBytesPerPacket = v31;
    *(void *)&buf.mBitsPerChannel = v30;

    AudioQueueRef outAQ = 0;
    uint64_t v32 = AudioQueueNewInput(&buf, (AudioQueueInputCallback)handleInputBuffer, v17, 0, 0, 0x800u, &outAQ);
    if (v32)
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create audio queue: %d", v32);
      [(AXLTAudioOutManager *)self _reportErrorWithCode:5 debugErrorString:v33 cleanupForPID:v10];
      BOOL v18 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    [v17 setAudioQueue:outAQ];
    v33 = (void *)[objc_alloc(MEMORY[0x263EFC098]) initWithTapDescription:v27];
    uint64_t v34 = AudioQueueSetProperty(outAQ, 0x71746F62u, v33, 8u);
    if (v34)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to create tap: %d", v34);
    }
    else
    {
      signed int mBytesPerPacket = buf.mBytesPerPacket;
      UInt32 outData = buf.mBytesPerPacket;
      if (!buf.mBytesPerPacket)
      {
        UInt32 ioDataSize = 4;
        uint64_t Property = AudioQueueGetProperty(outAQ, 0x786F7073u, &outData, &ioDataSize);
        if (Property)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Failed to get max output packet size: %d", Property);
          goto LABEL_10;
        }
        signed int mBytesPerPacket = outData;
      }
      if (![v17 createAudioBuffersWithBufferByteSize:fmin(buf.mSampleRate * (double)mBytesPerPacket, 6400.0) error:a7])goto LABEL_11; {
      uint64_t v38 = AudioQueueStart(outAQ, 0);
      }
      if (!v38)
      {
        BOOL v18 = 1;
        goto LABEL_12;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to start audio queue: %d", v38);
    }
    v35 = LABEL_10:;
    *a7 = [(AXLTAudioOutManager *)self _reportErrorWithCode:5 debugErrorString:v35 cleanupForPID:v10];

LABEL_11:
    BOOL v18 = 0;
    goto LABEL_12;
  }
  BOOL v18 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v19 = [NSNumber numberWithInt:v10];
    LODWORD(buf.mSampleRate) = 138412546;
    *(void *)((char *)&buf.mSampleRate + 4) = v13;
    LOWORD(buf.mFormatFlags) = 2112;
    *(void *)((char *)&buf.mFormatFlags + 2) = v19;
    _os_log_impl(&dword_23C242000, v17, OS_LOG_TYPE_INFO, "AudioManager already transcribing for app: %@, pid: %@", (uint8_t *)&buf, 0x16u);
  }
LABEL_13:

  return v18;
}

void __83__AXLTAudioOutManager__startTranscriptionForPID_appID_appName_excludingPIDs_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) processToTranscriberMap];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v4 setObject:v2 forKey:v3];
}

- (BOOL)_stopTranscriptionForPID:(int)a3 error:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = AXLogLiveTranscription();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [NSNumber numberWithInt:v4];
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_23C242000, v6, OS_LOG_TYPE_DEFAULT, "AudioManager: Stopping transcription for pid: %@", (uint8_t *)&v9, 0xCu);
  }
  [(AXLTAudioOutManager *)self _cleanupForPID:v4];
  return 1;
}

- (void)handleInputBufferWithContext:(void *)a3 audioQueue:(OpaqueAudioQueue *)a4 audioBuffer:(AudioQueueBuffer *)a5 timestamp:(const AudioTimeStamp *)a6 packetCount:(unsigned int)a7 packetDesc:(const AudioStreamPacketDescription *)a8
{
  id v14 = a3;
  BOOL v15 = [(AXLTAudioOutManager *)self bufferQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__AXLTAudioOutManager_handleInputBufferWithContext_audioQueue_audioBuffer_timestamp_packetCount_packetDesc___block_invoke;
  block[3] = &unk_264E39CA0;
  block[4] = self;
  id v18 = v14;
  v19 = a5;
  v20 = a4;
  unsigned int v23 = a7;
  v21 = a6;
  v22 = a8;
  id v16 = v14;
  dispatch_async(v15, block);
}

void __108__AXLTAudioOutManager_handleInputBufferWithContext_audioQueue_audioBuffer_timestamp_packetCount_packetDesc___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) processToTranscriberMap];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid"));
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(unsigned int *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 72);
    [v5 handleAudioBuffer:v6 audioQueue:v7 timestamp:v8 packetCount:v9 packetDesc:v10];
  }
}

- (void)_cleanupForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(AXLTAudioOutManager *)self processToTranscriberMap];
  uint64_t v6 = [NSNumber numberWithInt:v3];
  uint64_t v7 = [v5 objectForKey:v6];

  uint64_t v8 = [(AXLTAudioOutManager *)self bufferQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__AXLTAudioOutManager__cleanupForPID___block_invoke;
  v9[3] = &unk_264E39CC8;
  v9[4] = self;
  int v10 = v3;
  dispatch_sync(v8, v9);

  [v7 cleanup];
}

void __38__AXLTAudioOutManager__cleanupForPID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) processToTranscriberMap];
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v3 removeObjectForKey:v2];
}

- (void)_cleanupAllPids
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = [(AXLTAudioOutManager *)self bufferQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AXLTAudioOutManager__cleanupAllPids__block_invoke;
  block[3] = &unk_264E398D8;
  block[4] = self;
  id v5 = v3;
  id v16 = v5;
  dispatch_sync(v4, block);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cleanup", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

void __38__AXLTAudioOutManager__cleanupAllPids__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) processToTranscriberMap];
  id v9 = [v2 keyEnumerator];

  uint64_t v3 = [v9 nextObject];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      id v5 = [*(id *)(a1 + 32) processToTranscriberMap];
      id v6 = [v5 objectForKey:v4];

      if (v6) {
        [*(id *)(a1 + 40) addObject:v6];
      }

      uint64_t v7 = [v9 nextObject];

      uint64_t v4 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = [*(id *)(a1 + 32) processToTranscriberMap];
  [v8 removeAllObjects];
}

- (id)_tapDescriptionForPID:(int)a3 tapFormat:(id)a4 excludePIDs:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (![(AXLTAudioOutManager *)self _pidSupportsCoreMediaNotifications:v6]
    && v6 == -1)
  {
    uint64_t v13 = [v9 count];
    id v14 = objc_alloc(MEMORY[0x263EFC0A0]);
    if (v13) {
      uint64_t v10 = [v14 initSystemTapWithFormat:v8 excludePIDs:v9];
    }
    else {
      uint64_t v10 = [v14 initSystemTapWithFormat:v8];
    }
  }
  else
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFC0A0]) initProcessTapWithFormat:v8 PID:v6];
  }
  long long v11 = (void *)v10;

  return v11;
}

- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3
{
  return (a3 + 1) < 0xFFFFFFFE;
}

- (void)registerFirstTimeForAVSystemControllerNotifications
{
}

- (void)registerForAVSystemContollerNotifications
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v3 = AXLogLiveTranscription();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(AXLTAudioOutManager *)v3 registerFirstTimeForAVSystemControllerNotifications];
    }
  }
  [(AXLTAudioOutManager *)self setSubscribed:1];
  long long v11 = [MEMORY[0x263F544E0] sharedAVSystemController];
  long long v12 = [v11 attributeForKey:*MEMORY[0x263F54400]];
  [(AXLTAudioOutManager *)self updateAudioSessionsInfoFromSessionsArray:v12];

  uint64_t v13 = AXLogLiveTranscription();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_23C242000, v13, OS_LOG_TYPE_INFO, "registered for _someSessionIsPlayingDidChangeNotification", v15, 2u);
  }

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__someSessionIsPlayingDidChangeNotification_ name:*MEMORY[0x263F54490] object:0];
}

- (void)unregisterForAVSystemContollerNotifications
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v3 = AXLogLiveTranscription();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(AXLTAudioOutManager *)v3 registerFirstTimeForAVSystemControllerNotifications];
    }
  }
  long long v11 = AXLogLiveTranscription();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_23C242000, v11, OS_LOG_TYPE_INFO, "unregistered for _someSessionIsPlayingDidChangeNotification", v13, 2u);
  }

  long long v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 removeObserver:self name:*MEMORY[0x263F54490] object:0];

  [(AXLTAudioOutManager *)self _cleanupAllPids];
  [(AXLTAudioOutManager *)self setSubscribed:0];
}

- (void)_someSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogLiveTranscription();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_INFO, "Audio Sessions states were changed", buf, 2u);
  }

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54498]];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke;
    v8[3] = &unk_264E398D8;
    id v9 = v7;
    uint64_t v10 = self;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 40) updateAudioSessionsInfoFromSessionsArray:*(void *)(a1 + 32)];
}

- (void)_setupAVSystemNotificationSystem
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C242000, log, OS_LOG_TYPE_ERROR, "failed to register for avSystemController for notifications", v1, 2u);
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXLTAudioOutManager _avSessionMediaServicesResetNotification:](v4);
  }

  [(AXLTAudioOutManager *)self _setupAVSystemNotificationSystem];
}

- (void)updateAudioSessionsInfoFromSessionsArray:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogLiveTranscription();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_DEFAULT, "AudioManager: Updating Audio Sessions", buf, 2u);
  }

  if ([(AXLTAudioOutManager *)self subscribed])
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:](v4, v7);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v42 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v61 count:16];
    v44 = v6;
    int v45 = self;
    if (v9)
    {
      uint64_t v10 = v9;
      v46 = 0;
      long long v11 = (void *)MEMORY[0x263F54408];
      uint64_t v48 = *(void *)v52;
      id v43 = v8;
      do
      {
        uint64_t v12 = 0;
        uint64_t v47 = v10;
        do
        {
          if (*(void *)v52 != v48) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v12), "objectForKeyedSubscript:", *v11, v42);
          uint64_t v14 = [v13 intValue];
          BOOL v15 = AXLogLiveTranscription();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
            LODWORD(v57) = v14;
            _os_log_debug_impl(&dword_23C242000, v15, OS_LOG_TYPE_DEBUG, "updateAudioSessionsInfoFromSessionsArray pid: %d", buf, 8u);
          }

          if (v14)
          {
            if ([(AXLTAudioOutManager *)self isTranscribingForPID:v14])
            {
              [v6 setObject:@"playing" forKeyedSubscript:v13];
              id v16 = AXLogLiveTranscription();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
                LODWORD(v57) = v14;
                _os_log_debug_impl(&dword_23C242000, v16, OS_LOG_TYPE_DEBUG, "isTranscribingForPID pid: %d", buf, 8u);
              }
            }
            else
            {
              v17 = AXLogLiveTranscription();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
                LODWORD(v57) = v14;
                _os_log_debug_impl(&dword_23C242000, v17, OS_LOG_TYPE_DEBUG, "start transcribing pid: %d", buf, 8u);
              }

              id v16 = [(AXLTAudioOutManager *)self appInfoFromPid:v14];
              uint64_t v18 = AXLogLiveTranscription();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:]((uint64_t)v60, (uint64_t)v16);
              }

              v19 = [v16 objectForKeyedSubscript:@"AppIDKey"];
              BOOL v20 = +[AXLTAudioOutManager isExcludedAppID:v19];

              if (!v20)
              {
                v21 = AXLogLiveTranscription();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = [v16 objectForKeyedSubscript:@"AppNameKey"];
                  unsigned int v23 = [NSNumber numberWithInt:v14];
                  *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
                  v57 = v22;
                  __int16 v58 = 2112;
                  v59 = v23;
                  _os_log_impl(&dword_23C242000, v21, OS_LOG_TYPE_DEFAULT, "AudioManager Sessions: Starting transcription for app: %@, pid: %@", buf, 0x16u);
                }
                v24 = [v16 objectForKeyedSubscript:@"AppIDKey"];
                uint64_t v25 = [v16 objectForKeyedSubscript:@"AppNameKey"];
                id v50 = v46;
                BOOL v26 = [(AXLTAudioOutManager *)self _startTranscriptionForPID:v14 appID:v24 appName:v25 error:&v50];
                id v27 = v50;

                if (v26)
                {
                  uint64_t v6 = v44;
                  [v44 setObject:@"playing" forKeyedSubscript:v13];
                  v28 = AXLogLiveTranscription();
                  id v8 = v43;
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
                    LODWORD(v57) = v14;
                    _os_log_debug_impl(&dword_23C242000, v28, OS_LOG_TYPE_DEBUG, "isTranscribingForPID pid: %d", buf, 8u);
                  }
                }
                else
                {
                  v28 = AXLogLiveTranscription();
                  id v8 = v43;
                  uint64_t v6 = v44;
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
                    LODWORD(v57) = v14;
                    _os_log_error_impl(&dword_23C242000, v28, OS_LOG_TYPE_ERROR, "failed to start transcription for pid: %d\n", buf, 8u);
                  }
                }
                self = v45;

                v46 = v27;
              }
              uint64_t v10 = v47;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v10);
    }
    else
    {
      v46 = 0;
    }

    uint64_t v29 = [(AXLTAudioOutManager *)self processToTranscriberMap];
    uint64_t v30 = (void *)[v29 copy];

    long long v31 = [v30 keyEnumerator];
    uint64_t v32 = [v31 nextObject];
    if (v32)
    {
      v33 = (void *)v32;
      id v4 = v42;
      uint64_t v34 = v46;
      do
      {
        v35 = -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v33, v42);

        if (v35)
        {
          id v36 = v34;
        }
        else
        {
          v37 = AXLogLiveTranscription();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
            v57 = v33;
            _os_log_impl(&dword_23C242000, v37, OS_LOG_TYPE_DEFAULT, "AudioManager Sessions: Stopping transcription for pid: %@", buf, 0xCu);
          }

          uint64_t v38 = [v33 intValue];
          id v49 = v34;
          BOOL v39 = [(AXLTAudioOutManager *)v45 _stopTranscriptionForPID:v38 error:&v49];
          id v36 = v49;

          if (!v39)
          {
            v40 = AXLogLiveTranscription();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:]((uint64_t)v55, (uint64_t)v33);
            }

            uint64_t v6 = v44;
          }
        }
        uint64_t v41 = [v31 nextObject];

        v33 = (void *)v41;
        uint64_t v34 = v36;
      }
      while (v41);
    }
    else
    {
      id v36 = v46;
      id v4 = v42;
    }
  }
  else
  {
    uint64_t v6 = AXLogLiveTranscription();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)AudioStreamBasicDescription buf = 0;
      _os_log_impl(&dword_23C242000, v6, OS_LOG_TYPE_DEFAULT, "AudioManager: Not subscribed to audio session updates, skip", buf, 2u);
    }
  }
}

- (id)appInfoFromPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = @"System";
  uint64_t v5 = AXLCLocString(@"liveCaptions.system");
  uint64_t v6 = (void *)MEMORY[0x263F64570];
  uint64_t v7 = [MEMORY[0x263F64580] identifierWithPid:v3];
  id v26 = 0;
  id v8 = [v6 handleForIdentifier:v7 error:&v26];
  id v9 = v26;

  if (v9)
  {
    uint64_t v10 = AXLogLiveTranscription();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXLTAudioOutManager appInfoFromPid:].cold.5(v9);
    }
    goto LABEL_4;
  }
  uint64_t v13 = [v8 bundle];
  uint64_t v14 = [v13 identifier];

  BOOL v15 = [v8 hostProcess];
  id v16 = [v15 bundle];
  uint64_t v10 = [v16 identifier];

  v17 = AXLogLiveTranscription();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[AXLTAudioOutManager appInfoFromPid:].cold.4();
  }

  uint64_t v18 = AXLogLiveTranscription();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[AXLTAudioOutManager appInfoFromPid:]();
  }

  if (v10)
  {
    id v25 = 0;
    v19 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v10 allowPlaceholder:0 error:&v25];
    id v9 = v25;
    id v4 = v10;

    if (!v19) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  if (v14)
  {
    id v24 = 0;
    v19 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v24];
    id v9 = v24;
    id v4 = v14;
    if (!v19) {
      goto LABEL_4;
    }
LABEL_16:
    BOOL v20 = [v19 localizedName];

    if (v20)
    {
      uint64_t v21 = [v19 localizedName];

      uint64_t v5 = (void *)v21;
    }
    else
    {
      v22 = AXLogLiveTranscription();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[AXLTAudioOutManager appInfoFromPid:](v9);
      }
    }
    goto LABEL_4;
  }
  unsigned int v23 = AXLogLiveTranscription();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[AXLTAudioOutManager appInfoFromPid:](v23);
  }

  id v4 = v4;
  id v9 = 0;
LABEL_4:

  v27[0] = @"AppIDKey";
  v27[1] = @"AppNameKey";
  v28[0] = v4;
  v28[1] = v5;
  long long v11 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v11;
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTTranscriberDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)bufferQueue
{
  return self->_bufferQueue;
}

- (void)setBufferQueue:(id)a3
{
}

- (NSMapTable)processToTranscriberMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (AVSystemController)avSystemController
{
  return self->_avSystemController;
}

- (void)setAvSystemController:(id)a3
{
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_processToTranscriberMap, 0);
  objc_storeStrong((id *)&self->_bufferQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_reportErrorWithCode:debugErrorString:cleanupForPID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C242000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, a2, v3, "_someSessionIsPlayingDidChangeNotification [session count]: %lu", v4);
}

- (void)_avSessionMediaServicesResetNotification:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23C242000, log, OS_LOG_TYPE_DEBUG, "_avSessionMediaServicesResetNotification callback", v1, 2u);
}

- (void)updateAudioSessionsInfoFromSessionsArray:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  int v5 = objc_msgSend((id)OUTLINED_FUNCTION_3_0(a1, a2), "intValue");
  *(_DWORD *)uint64_t v4 = 67109120;
  *uint64_t v3 = v5;
  _os_log_error_impl(&dword_23C242000, v2, OS_LOG_TYPE_ERROR, "failed to stop transcription for pid: %d\n", v4, 8u);
}

- (void)updateAudioSessionsInfoFromSessionsArray:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  int v5 = objc_msgSend((id)OUTLINED_FUNCTION_3_0(a1, a2), "description");
  *(_DWORD *)uint64_t v4 = 138412290;
  *uint64_t v3 = v5;
  _os_log_debug_impl(&dword_23C242000, v2, OS_LOG_TYPE_DEBUG, "appInfo: %@", v4, 0xCu);
}

- (void)updateAudioSessionsInfoFromSessionsArray:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, a2, v4, "sessions: %@", v5);
}

- (void)appInfoFromPid:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23C242000, log, OS_LOG_TYPE_ERROR, "Couldn't get appID", v1, 2u);
}

- (void)appInfoFromPid:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "Couldn't read appName from record, error = %@", v4, v5, v6, v7, v8);
}

- (void)appInfoFromPid:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, v0, v1, "Host AppID: %@", v2);
}

- (void)appInfoFromPid:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, v0, v1, "Process AppID: %@", v2);
}

- (void)appInfoFromPid:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "Couldn't get process handle, error = %@", v4, v5, v6, v7, v8);
}

@end
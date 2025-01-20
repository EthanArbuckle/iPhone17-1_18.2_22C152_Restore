@interface ASDDSPStream
- (ASDDSPGraph)hardwareDSP;
- (ASDDSPStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (ASDDSPStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6;
- (ASDStreamDSPConfiguration)currentDSPConfiguration;
- (BOOL)_allocateStreamingResources;
- (BOOL)addClientDSP:(id)a3 forClient:(unsigned int)a4;
- (BOOL)addClientDSP:(id)a3 withKey:(unint64_t)a4;
- (BOOL)addHardwareDSP:(id)a3;
- (BOOL)bypassMode;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5;
- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5 andMode:(int64_t)a6;
- (BOOL)graphStructureIsValid:(id)a3 clientID:(unint64_t)a4;
- (BOOL)isRunning;
- (BOOL)keepGraphInitialized;
- (BOOL)removeClientDSPForClient:(unsigned int)a3;
- (BOOL)removeClientDSPwithKey:(unint64_t)a3;
- (BOOL)removeHardwareDSP;
- (NSArray)underlyingStreams;
- (id).cxx_construct;
- (id)_hardwareDSP;
- (id)clientDSPForClient:(unsigned int)a3;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (id)getASDAudioDefaultsPath;
- (id)getDSPCaptureDirectory;
- (id)processOutputBlock;
- (id)readInputBlock;
- (id)writeMixBlock;
- (int64_t)getAudioCaptureRingBufferModeWithDict:(id)a3;
- (int64_t)getAudioDebugTypeWithDict:(id)a3;
- (int64_t)getDSPCaptureTypeFromDefault;
- (int64_t)graphAudioValidationMode;
- (int64_t)maximumFramesPerIOCycle;
- (unint64_t)underlyingInputStreamCount;
- (unint64_t)underlyingOutputStreamCount;
- (void)_allocateStreamingResourcesForGraphHelper:(void *)a3;
- (void)_deallocateStreamingResources;
- (void)_resumeProcessing;
- (void)_suspendProcessing;
- (void)_updateLatency;
- (void)_updateMaximumFramesPerIOCycle;
- (void)dealloc;
- (void)doSetUnderlyingStreams:(id)a3;
- (void)enableDSPCaptureByType:(int64_t)a3 withGraph:(id)a4;
- (void)enableDSPCaptureInAction;
- (void)enableDSPFileInjectionOnGraph:(id)a3 withFormat:(id)a4;
- (void)removeHardwareDSP;
- (void)resumeProcessing;
- (void)setBypassMode:(BOOL)a3;
- (void)setCurrentDSPConfiguration:(id)a3;
- (void)setGraphAudioValidationMode:(int64_t)a3;
- (void)setKeepGraphInitialized:(BOOL)a3;
- (void)setUnderlyingInputStreamCount:(unint64_t)a3;
- (void)setUnderlyingOutputStreamCount:(unint64_t)a3;
- (void)setUnderlyingStreams:(id)a3;
- (void)sleepForNumberOfSamples:(unint64_t)a3;
- (void)startStream;
- (void)stopStream;
- (void)suspendProcessing;
- (void)updateLatency;
@end

@implementation ASDDSPStream

- (id)getDSPCaptureDirectory
{
  return @"/tmp/AudioCapture/DSP";
}

- (id)getASDAudioDefaultsPath
{
  return @"com.apple.audio.AudioServerDriver";
}

- (int64_t)getDSPCaptureTypeFromDefault
{
  defaults = self->_defaults;
  if (!defaults) {
    return 0;
  }
  int64_t v4 = [(NSUserDefaults *)defaults valueForKey:@"EnableDSPCapture"];

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSPCaptureTypeBasic enabled!", buf, 2u);
    }
    int64_t v4 = 1;
  }
  v5 = [(NSUserDefaults *)self->_defaults valueForKey:@"EnableDSPCaptureOnPluginDevice"];

  if (v5)
  {
    v4 |= 2uLL;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSPCaptureTypePluginDevice enabled!", v10, 2u);
    }
  }
  v6 = [(NSUserDefaults *)self->_defaults valueForKey:@"EnableDSPCaptureOnDSPGraph"];

  if (!v6)
  {
    if (v4) {
      return v4;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NO DSP capture is enabled!", v8, 2u);
    }
    return 0;
  }
  v4 |= 4uLL;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSPCaptureTypeDSPGraph enabled!", v9, 2u);
  }
  return v4;
}

- (int64_t)getAudioDebugTypeWithDict:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Getting Audio Debug Type...", buf, 2u);
  }
  int64_t v4 = [v3 valueForKey:@"DebugType"];
  v5 = v4;
  if (!v4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      int64_t v6 = 1;
      goto LABEL_15;
    }
    __int16 v11 = 0;
    v7 = &_os_log_internal;
    v8 = "Using default Audio Debug Type: ReinitializeGraph!";
    v9 = (uint8_t *)&v11;
LABEL_13:
    _os_log_impl(&dword_225CD5000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_14;
  }
  if (![v4 isEqualToString:@"KeepGraphInitialized"])
  {
    if (![v5 isEqualToString:@"ReinitializeGraph"]
      || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_14;
    }
    *(_WORD *)v12 = 0;
    v7 = &_os_log_internal;
    v8 = "Using Audio Debug Type: ReinitializeGraph!";
    v9 = v12;
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Using Audio Debug Type: KeepGraphInitialized!", v13, 2u);
  }
  int64_t v6 = 0;
LABEL_15:

  return v6;
}

- (int64_t)getAudioCaptureRingBufferModeWithDict:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Getting Audio Capture Ring Buffer Mode...", buf, 2u);
  }
  int64_t v4 = [v3 valueForKey:@"RingBufferMode"];
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: None!", v8, 2u);
    }
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"Short"])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Short!", v11, 2u);
    }
    int64_t v6 = 1;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"Normal"])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      int64_t v6 = 2;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Normal!", v10, 2u);
    }
    else
    {
      int64_t v6 = 2;
    }
    goto LABEL_18;
  }
  if (![v5 isEqualToString:@"Long"])
  {
LABEL_17:
    int64_t v6 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Long!", v9, 2u);
  }
  int64_t v6 = 3;
LABEL_18:

  return v6;
}

- (void)enableDSPCaptureInAction
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "enableDSPCaptureInAction!", buf, 2u);
  }
  id v3 = [(ASDDSPStream *)self hardwareDSP];
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Found graph, enabling DSP Capture in action!", v5, 2u);
    }
    int64_t v4 = [(ASDDSPStream *)self getDSPCaptureTypeFromDefault];
    self->_DSPCaptureType = v4;
    [(ASDDSPStream *)self enableDSPCaptureByType:v4 withGraph:v3];
  }
}

- (ASDDSPStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF940];
  int64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "-[ASDDSPStream initWithDirection:withPlugin:]", a4);
  [v5 raise:*MEMORY[0x263EFF4A0], @"Do not call %@", v6 format];

  return 0;
}

- (void)doSetUnderlyingStreams:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v13 = a3;
  objc_storeStrong((id *)&self->_underlyingStreams, a3);
  self->_underlyingInputStreamCount = 0;
  self->_underlyingOutputStreamCount = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_underlyingStreams;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v8), "direction", v13);
        p_underlyingInputStreamCount = &self->_underlyingInputStreamCount;
        if (v9 == 1869968496)
        {
          unsigned int v11 = [(ASDStream *)self direction];
          p_underlyingInputStreamCount = &self->_underlyingOutputStreamCount;
          if (v11 == 1768845428)
          {
            v12 = [MEMORY[0x263F08690] currentHandler];
            [v12 handleFailureInMethod:a2 object:self file:@"ASDDSPStream.mm" lineNumber:248 description:@"Underlying stream has a different direction than the DSP stream"];

            p_underlyingInputStreamCount = &self->_underlyingOutputStreamCount;
          }
        }
        ++*p_underlyingInputStreamCount;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (ASDDSPStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = (DSPGraph *)a6;
  if (DSPGraph::ABIVersion(v13) != 4)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"ASDDSPStream.mm" lineNumber:261 description:@"DSPGraph ABI runtime/compile-time mismatch"];
  }
  v30.receiver = self;
  v30.super_class = (Class)ASDDSPStream;
  v14 = [(ASDStream *)&v30 initWithDirection:v7 withPlugin:v13];
  long long v15 = v14;
  if (v14)
  {
    mHUPSource = v14->mHUPSource;
    v14->mHUPSource = 0;

    objc_storeWeak((id *)&v15->_owningDevice, v11);
    [(ASDDSPStream *)v15 doSetUnderlyingStreams:v12];
    v15->_ioReferenceCount = 0;
    [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v17 = [(id)objc_claimAutoreleasedReturnValue() bundleIdentifier];
    long long v18 = NSString;
    v19 = [(ASDStream *)v15 streamName];
    id v20 = [v18 stringWithFormat:@"%@.dspStream.%@.dspQueue", v17, v19];
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
    dspQueue = v15->_dspQueue;
    v15->_dspQueue = (OS_dispatch_queue *)v21;

    v23 = NSString;
    v24 = [(ASDStream *)v15 streamName];
    id v25 = [v23 stringWithFormat:@"%@.dspStream.%@.propertyQueue", v17, v24];
    dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
    propertyQueue = v15->_propertyQueue;
    v15->_propertyQueue = (OS_dispatch_queue *)v26;

    [(ASDDSPStream *)v15 _updateMaximumFramesPerIOCycle];
    operator new();
  }

  return 0;
}

void __72__ASDDSPStream_initWithOwningDevice_underlyingStreams_direction_plugin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enableDSPCaptureInAction];
}

- (void)setUnderlyingStreams:(id)a3
{
  id v4 = a3;
  dspQueue = self->_dspQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__ASDDSPStream_setUnderlyingStreams___block_invoke;
  v7[3] = &unk_264772F40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dspQueue, v7);
}

uint64_t __37__ASDDSPStream_setUnderlyingStreams___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doSetUnderlyingStreams:*(void *)(a1 + 40)];
}

- (NSArray)underlyingStreams
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ASDDSPStream_underlyingStreams__block_invoke;
  v5[3] = &unk_264772F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __33__ASDDSPStream_underlyingStreams__block_invoke(uint64_t a1)
{
}

- (void)setGraphAudioValidationMode:(int64_t)a3
{
  dspQueue = self->_dspQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__ASDDSPStream_setGraphAudioValidationMode___block_invoke;
  v4[3] = &unk_264772FB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dspQueue, v4);
}

uint64_t __44__ASDDSPStream_setGraphAudioValidationMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 384) = *(void *)(result + 40);
  if (*(void *)(*(void *)(result + 32) + 288)) {
    return ASDDSPStreamHelper::setGraphAudioValidationMode(*(void *)(*(void *)(result + 32) + 288), *(void *)(result + 40));
  }
  return result;
}

- (int64_t)graphAudioValidationMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ASDDSPStream_graphAudioValidationMode__block_invoke;
  v5[3] = &unk_264772F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__ASDDSPStream_graphAudioValidationMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 384);
  return result;
}

- (void)startStream
{
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ASDDSPStream_startStream__block_invoke;
  block[3] = &unk_264772FB8;
  block[4] = self;
  block[5] = a2;
  dispatch_sync(dspQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ASDDSPStream;
  [(ASDStream *)&v4 startStream];
}

uint64_t __27__ASDDSPStream_startStream__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _hardwareDSP];

  if (!v2)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ASDDSPStream.mm" lineNumber:348 description:@"DSPStreams must have hardware DSP"];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (!*(void *)(result + 392))
  {
    [(id)result _updateMaximumFramesPerIOCycle];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 376);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "startStream", (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    if (([*(id *)(a1 + 32) _allocateStreamingResources] & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ASDDSPStream.mm" lineNumber:360 description:@"Couldn't allocate streaming resources"];
    }
    ++*(void *)(*(void *)(a1 + 32) + 392);
    uint64_t result = *(void *)(a1 + 32);
  }
  *(unsigned char *)(result + 408) = 1;
  return result;
}

- (void)sleepForNumberOfSamples:(unint64_t)a3
{
  id v4 = [(ASDStream *)self physicalFormat];
  [v4 sampleRate];
  double v6 = (double)a3 / v5 * 1000000.0;

  usleep(v6);
}

- (void)stopStream
{
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPStream;
  [(ASDStream *)&v5 stopStream];
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__ASDDSPStream_stopStream__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __26__ASDDSPStream_stopStream__block_invoke(uint64_t result)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(result + 32) + 408) = 0;
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 392);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    uint64_t v5 = result;
    *(void *)(v1 + 392) = v4;
    uint64_t v6 = *(void *)(result + 32);
    if (!*(void *)(v6 + 392))
    {
      uint64_t v7 = v6 + 296;
      uint64_t v8 = *(void *)(v6 + 304);
      if (v8 != v6 + 296)
      {
        do
        {
          ASDDSPGraphHelper::resetGraph((DSPGraph::Graph **)(v8 + 16));
          uint64_t v8 = *(void *)(v8 + 8);
        }
        while (v8 != v7);
        uint64_t v6 = *(void *)(v5 + 32);
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v9 = *(id *)(v6 + 376);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "stopStream", (void)v13);
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }

      return [*(id *)(v5 + 32) _deallocateStreamingResources];
    }
  }
  return result;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  return 0;
}

- (BOOL)_allocateStreamingResources
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__ASDDSPStream__allocateStreamingResources__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  uint64_t v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

void __43__ASDDSPStream__allocateStreamingResources__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) physicalFormat];
  BOOL v3 = v2;
  if (v2) {
    [v2 audioStreamBasicDescription];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v24, &v23);

  uint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 376);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v15 = [v8 direction];
        id v9 = [v8 physicalFormat];
        uint64_t v10 = v9;
        if (v9) {
          [v9 audioStreamBasicDescription];
        }
        else {
          memset(&v23, 0, sizeof(v23));
        }
        id v14 = [v8 readInputBlock];
        id v13 = [v8 writeMixBlock];
        unint64_t v11 = v21;
        if (v21 >= v22)
        {
          uint64_t v12 = std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>(&v20, &v15, &v23, &v14, &v13);
        }
        else
        {
          std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>((uint64_t)&v20, &v15, &v23, &v14, &v13);
          uint64_t v12 = v11 + 72;
        }
        unint64_t v21 = v12;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) direction];
  operator new();
}

- (void)_deallocateStreamingResources
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__ASDDSPStream__deallocateStreamingResources__block_invoke;
  v2[3] = &unk_264772D28;
  v2[4] = self;
  v3[0] = &unk_26D96F898;
  v3[3] = v3;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v3);
}

ASDDSPStreamHelper *__45__ASDDSPStream__deallocateStreamingResources__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = v2 + 296;
  uint64_t v4 = *(void *)(v2 + 304);
  if (v4 != v2 + 296)
  {
    do
    {
      ASDDSPGraphHelper::deallocateStreamingResources((DSPGraph::Graph **)(v4 + 16));
      uint64_t v4 = *(void *)(v4 + 8);
    }
    while (v4 != v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  ASDDSPStreamHelper::deallocateStreamingResources(*(ASDDSPStreamHelper **)(v2 + 288));
  uint64_t v5 = (ASDDSPStreamHelper **)(*(void *)(a1 + 32) + 288);
  return std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100](v5, 0);
}

- (void)_allocateStreamingResourcesForGraphHelper:(void *)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  if (!a3) {
    -[ASDDSPStream _allocateStreamingResourcesForGraphHelper:]();
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__ASDDSPStream__allocateStreamingResourcesForGraphHelper___block_invoke;
  v3[3] = &unk_264772FB8;
  v3[4] = self;
  void v3[5] = a3;
  v4[0] = &unk_26D96F898;
  v4[3] = v4;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v3);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v4);
}

void __58__ASDDSPStream__allocateStreamingResourcesForGraphHelper___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(ASDDSPStreamHelper **)(*(void *)(a1 + 32) + 288);
  if (*(void *)(v2 + 32) == -1)
  {
    uint64_t v10 = (void *)ASDDSPStreamHelper::dspInStreamFormats(v3);
    unint64_t v11 = (void *)ASDDSPStreamHelper::dspOutStreamFormats(*(ASDDSPStreamHelper **)(*(void *)(a1 + 32) + 288));
    [*(id *)(a1 + 32) maximumFramesPerIOCycle];
    [*(id *)(a1 + 32) keepGraphInitialized];
    ASDDSPGraphHelper::allocateStreamingResources(v2, v10, v11);
  }
  else
  {
    uint64_t v4 = ASDDSPStreamHelper::dspFormat(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    long long v6 = *(_OWORD *)(v4 + 16);
    long long v18 = *(_OWORD *)v4;
    long long v19 = v6;
    uint64_t v20 = *(void *)(v4 + 32);
    uint64_t v7 = operator new(0x28uLL);
    unint64_t v22 = (char *)v7 + 40;
    AudioStreamBasicDescription v23 = (char *)v7 + 40;
    long long v8 = v19;
    _OWORD *v7 = v18;
    v7[1] = v8;
    *((void *)v7 + 4) = v20;
    unint64_t v21 = v7;
    long long v12 = *(_OWORD *)v4;
    long long v13 = *(_OWORD *)(v4 + 16);
    uint64_t v14 = *(void *)(v4 + 32);
    id v9 = operator new(0x28uLL);
    long long v16 = (char *)v9 + 40;
    long long v17 = (char *)v9 + 40;
    _OWORD *v9 = v12;
    v9[1] = v13;
    *((void *)v9 + 4) = v14;
    __p = v9;
    [*(id *)(a1 + 32) maximumFramesPerIOCycle];
    [*(id *)(a1 + 32) keepGraphInitialized];
    ASDDSPGraphHelper::allocateStreamingResources(v5, &v21, &__p);
    if (__p)
    {
      long long v16 = __p;
      operator delete(__p);
    }
    if (v21)
    {
      unint64_t v22 = v21;
      operator delete(v21);
    }
  }
}

- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5
{
  return [(ASDDSPStream *)self enableBasicDSPCaptureOnGraph:a3 withLevel:a4 andDebugType:a5 andMode:0];
}

- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5 andMode:(int64_t)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!v11)
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v17) {
      -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v10 name];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Enabling basic DSP Capture on dsp graph: %@ with level: %@", buf, 0x16u);
  }
  if ([v11 isEqualToString:@"Light"])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    id v44 = (id)objc_opt_new();
    long long v13 = [v10 inputs];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke;
    v38[3] = &unk_264772FE0;
    v38[4] = buf;
    [v13 enumerateObjectsUsingBlock:v38];

    uint64_t v14 = [v10 outputs];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke_2;
    v37[3] = &unk_264772FE0;
    v37[4] = buf;
    [v14 enumerateObjectsUsingBlock:v37];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v39 = 138412290;
      uint64_t v40 = v15;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Enabling basic DSP Capture on dsp graph box names:%@", v39, 0xCu);
    }
    BOOL v16 = +[ASDDSPGraphUtilities startRecordingBoxes:*(void *)(*(void *)&buf[8] + 40) inGraph:v10 fromStream:self toDirectory:self->_DSPCaptureDirectory withType:a5 andMode:a6 error:0];
    _Block_object_dispose(buf, 8);

    if (!v16) {
      goto LABEL_18;
    }
  }
  else
  {
    if (![v11 isEqualToString:@"Heavy"])
    {
      BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v27) {
        -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
      goto LABEL_18;
    }
    if (!+[ASDDSPGraphUtilities startRecordingAllBoxesInGraph:v10 fromStream:self toDirectory:self->_DSPCaptureDirectory withType:a5 error:0])
    {
LABEL_18:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v35 = [v10 name];
        -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](v35, buf);
      }
LABEL_20:
      BOOL v26 = 0;
      goto LABEL_21;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v10 name];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v25;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);
  }
  BOOL v26 = 1;
LABEL_21:

  return v26;
}

void __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 name];
  objc_msgSend(v2, "addObject:");
}

void __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 name];
  objc_msgSend(v2, "addObject:");
}

- (void)enableDSPCaptureByType:(int64_t)a3 withGraph:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    if (a3)
    {
      uint64_t v7 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"EnableDSPCapture"];
      long long v8 = [v7 valueForKey:@"Level"];
      [(ASDDSPStream *)self enableBasicDSPCaptureOnGraph:v6 withLevel:v8 andDebugType:[(ASDDSPStream *)self getAudioDebugTypeWithDict:v7] andMode:[(ASDDSPStream *)self getAudioCaptureRingBufferModeWithDict:v7]];
    }
    if ((a3 & 2) != 0)
    {
      id v9 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"EnableDSPCaptureOnPluginDevice"];
      id v10 = [v9 valueForKey:@"PluginDevice"];
      id v11 = [v9 valueForKey:@"Level"];
      uint64_t v34 = [v9 valueForKey:@"Boxes"];
      int64_t v12 = [(ASDDSPStream *)self getAudioDebugTypeWithDict:v9];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
        uint64_t v14 = [WeakRetained deviceUID];
        *(_DWORD *)buf = 138412546;
        v37 = v14;
        __int16 v38 = 2112;
        v39 = v10;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "OwningDeviceUID: %@, tagetPluginDeviceUID: %@", buf, 0x16u);
      }
      id v15 = objc_loadWeakRetained((id *)&self->_owningDevice);
      BOOL v16 = [v15 deviceUID];
      int v17 = [v16 isEqualToString:v10];

      if (v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v6 name];
          *(_DWORD *)buf = 138412546;
          v37 = v18;
          __int16 v38 = 2112;
          v39 = v10;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Enabling DSP capture on dsp graph: %@ within Plugin Device: %@", buf, 0x16u);
        }
        if (v11) {
          BOOL v19 = [(ASDDSPStream *)self enableBasicDSPCaptureOnGraph:v6 withLevel:v11 andDebugType:v12];
        }
        else {
          BOOL v19 = +[ASDDSPGraphUtilities startRecordingBoxes:v34 inGraph:v6 fromStream:self toDirectory:self->_DSPCaptureDirectory withType:v12 error:0];
        }
        if (v19)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v6 name];
            *(_DWORD *)buf = 138412290;
            v37 = v20;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [v6 name];
          -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](v21, v35);
        }
      }
    }
    if ((a3 & 4) != 0)
    {
      uint64_t v22 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"EnableDSPCaptureOnDSPGraph"];
      uint64_t v23 = [v22 valueForKey:@"DSPGraph"];
      uint64_t v24 = [v22 valueForKey:@"Level"];
      id v25 = [v22 valueForKey:@"Boxes"];
      int64_t v26 = [(ASDDSPStream *)self getAudioDebugTypeWithDict:v22];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v27 = [v6 name];
        *(_DWORD *)buf = 138412546;
        v37 = v27;
        __int16 v38 = 2112;
        v39 = v23;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSP graph name: %@, targetGraphName: %@", buf, 0x16u);
      }
      uint64_t v28 = [v6 name];
      int v29 = [v28 isEqualToString:v23];

      if (v29)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [v6 name];
          *(_DWORD *)buf = 138412290;
          v37 = v30;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Enabling DSP Capture on dsp graph: %@", buf, 0xCu);
        }
        if (v24) {
          BOOL v31 = [(ASDDSPStream *)self enableBasicDSPCaptureOnGraph:v6 withLevel:v24 andDebugType:v26];
        }
        else {
          BOOL v31 = +[ASDDSPGraphUtilities startRecordingBoxes:v25 inGraph:v6 fromStream:self toDirectory:self->_DSPCaptureDirectory withType:v26 error:0];
        }
        if (v31)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [v6 name];
            *(_DWORD *)buf = 138412290;
            v37 = v32;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = [v6 name];
          -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](v33, buf);
        }
      }
    }
  }
  else
  {
    +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:v6];
  }
}

- (void)enableDSPFileInjectionOnGraph:(id)a3 withFormat:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  if (!+[ASDDSPGraphUtilities startInjectingBoxes:v7 inGraph:v5 error:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    long long v8 = [v5 name];
    -[ASDDSPStream enableDSPFileInjectionOnGraph:withFormat:](v8, (uint64_t)v6, v9);
  }
}

- (BOOL)addClientDSP:(id)a3 withKey:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 uninitialize];
    [v7 unconfigure];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    dspQueue = self->_dspQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __37__ASDDSPStream_addClientDSP_withKey___block_invoke;
    v19[3] = &unk_264773008;
    v19[4] = self;
    uint64_t v21 = &v23;
    unint64_t v22 = a4;
    id v20 = v7;
    dispatch_sync(dspQueue, v19);
    BOOL v9 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[ASDDSPStream addClientDSP:withKey:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke(void *a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2;
  v5[3] = &unk_264773008;
  uint64_t v2 = (void *)a1[5];
  v5[4] = a1[4];
  id v3 = v2;
  uint64_t v4 = a1[7];
  uint64_t v7 = a1[6];
  uint64_t v8 = v4;
  id v6 = v3;
  v9[0] = &unk_26D96F898;
  v9[3] = v9;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v5);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v9);
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) graphStructureIsValid:*(void *)(a1 + 40) clientID:*(void *)(a1 + 56)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
  [WeakRetained samplingRate];
  double v5 = v4;

  id v6 = [*(id *)(a1 + 32) physicalFormat];
  uint64_t v7 = [*(id *)(a1 + 32) maximumFramesPerIOCycle];
  if (v5 <= 0.0)
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v14) {
      __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  else if (v6)
  {
    uint64_t v8 = v7;
    if (v7 <= 0)
    {
      BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v30) {
        __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    else
    {
      if (v2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v9 = [*(id *)(a1 + 40) name];
          BOOL v10 = [*(id *)(a1 + 32) streamName];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "configuring graph %@ for stream %@", buf, 0x16u);
        }
        uint64_t v11 = *(void **)(a1 + 40);
        [v6 sampleRate];
        [v11 setVariableSliceDuration:v8 forSampleRate:(uint64_t)v12];
        [*(id *)(a1 + 40) configure];
        uint64_t v13 = *(void **)(a1 + 40);
        if (v13)
        {
          [v13 graph];
        }
        else
        {
          uint64_t v70 = 0;
          v71 = 0;
        }
        ASDDSPGraphHelper::ASDDSPGraphHelper(buf, &v70, *(void *)(a1 + 56));
        if (v71) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v71);
        }
        [*(id *)(a1 + 32) enableDSPCaptureByType:*(void *)(*(void *)(a1 + 32) + 344) withGraph:*(void *)(a1 + 40)];
        id v44 = [*(id *)(*(void *)(a1 + 32) + 368) valueForKey:@"EnableDSPFileInjectionOnDSPGraph"];
        BOOL v45 = v44 == 0;

        if (!v45)
        {
          v46 = [*(id *)(*(void *)(a1 + 32) + 368) dictionaryForKey:@"EnableDSPFileInjectionOnDSPGraph"];
          v47 = [v46 valueForKey:@"DSPGraph"];
          v48 = [*(id *)(a1 + 40) name];
          int v49 = [v48 isEqualToString:v47];

          if (v49)
          {
            v50 = [v46 valueForKey:@"InjectionFormat"];
            [*(id *)(a1 + 32) enableDSPFileInjectionOnGraph:*(void *)(a1 + 40) withFormat:v50];
          }
        }
        uint64_t v51 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v51 + 408))
        {
          [(id)v51 _allocateStreamingResourcesForGraphHelper:buf];
          uint64_t v51 = *(void *)(a1 + 32);
        }
        uint64_t v52 = *(void *)(v51 + 320);
        uint64_t v53 = *(void *)(a1 + 56);
        v54 = (atomic_uint *)(v52 + 48);
        atomic_fetch_add((atomic_uint *volatile)(v52 + 48), 1u);
        uint64_t v55 = atomic_load((unint64_t *)(v52 + 40));
        if (v55)
        {
          caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v55, v53);
          if (v56)
          {
            atomic_fetch_add((atomic_uint *volatile)v56, 1u);
            v57 = *(void **)(v56 + 16);
            atomic_fetch_add((atomic_uint *volatile)(v52 + 48), 0xFFFFFFFF);
            atomic_fetch_add((atomic_uint *volatile)v56, 0xFFFFFFFF);
            caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::remove(*(void *)(*(void *)(a1 + 32) + 320), *(void *)(a1 + 56));
            uint64_t v58 = *(void *)(a1 + 32) + 296;
            v72[0] = (uint64_t)v72;
            v72[1] = (uint64_t)v72;
            v72[2] = 0;
            v59 = *(void **)(v58 + 8);
            if (v59 != (void *)v58)
            {
              do
              {
                v60 = (void *)v59[1];
                if (v59 + 2 == v57)
                {
                  while (v60 != (void *)v58 && v60 + 2 == v57)
                    v60 = (void *)v60[1];
                  std::list<ASDDSPGraphHelper>::splice((uint64_t)v72, v72, v58, v59, v60);
                  if (v60 != (void *)v58) {
                    v60 = (void *)v60[1];
                  }
                }
                v59 = v60;
              }
              while (v60 != (void *)v58);
            }
            std::__list_imp<ASDDSPGraphHelper>::clear(v72);
            goto LABEL_42;
          }
          v54 = (atomic_uint *)(v52 + 48);
        }
        atomic_fetch_add(v54, 0xFFFFFFFF);
LABEL_42:
        uint64_t v62 = *(void *)(a1 + 32);
        v63 = operator new(0x38uLL);
        long long v64 = *(_OWORD *)buf;
        long long v65 = *(_OWORD *)&buf[16];
        memset(buf, 0, sizeof(buf));
        v63[1] = v64;
        v63[2] = v65;
        *((void *)v63 + 6) = *(void *)v74;
        *((void *)v63 + 1) = v62 + 296;
        uint64_t v66 = *(void *)(v62 + 296);
        *(void *)v63 = v66;
        *(void *)(v66 + 8) = v63;
        *(void *)(v62 + 296) = v63;
        ++*(void *)(v62 + 312);
        caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::_addOrReplace(*(void *)(*(void *)(a1 + 32) + 320), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 32) + 296) + 16, 0);
        if ([*(id *)(a1 + 32) keepGraphInitialized]) {
          [*(id *)(a1 + 40) initialize];
        }
        v67 = *(unsigned char **)(a1 + 32);
        if (!v67[408]) {
          [v67 _updateLatency];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        uint64_t v68 = *(void *)&buf[24];
        *(void *)&unsigned char buf[24] = 0;
        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 8))(v68);
        }
        uint64_t v69 = *(void *)&buf[16];
        *(void *)&uint8_t buf[16] = 0;
        if (v69) {
          (*(void (**)(uint64_t))(*(void *)v69 + 8))(v69);
        }
        if (*(void *)&buf[8]) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
        }
        goto LABEL_52;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = [*(id *)(a1 + 40) name];
        uint64_t v39 = [*(id *)(a1 + 40) numberOfInputs];
        uint64_t v40 = [*(id *)(a1 + 40) numberOfOutputs];
        uint64_t v41 = *(void *)(a1 + 32);
        uint64_t v42 = *(void *)(v41 + 416);
        uint64_t v43 = *(void *)(v41 + 424);
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&unsigned char buf[24] = v40;
        *(_WORD *)v74 = 2048;
        *(void *)&v74[2] = v42;
        __int16 v75 = 2048;
        uint64_t v76 = v43;
        _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ graph structure isn't valid. numGraphInputs = %ld, numGraphOutputs = %ld, numUnderlyingInputStreams = %ld, numUnderlyingOutputStreams = %ld", buf, 0x34u);
      }
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
LABEL_52:
}

- (BOOL)removeClientDSPwithKey:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  dspQueue = self->_dspQueue;
  char v10 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ASDDSPStream_removeClientDSPwithKey___block_invoke;
  block[3] = &unk_264773050;
  void block[5] = &v7;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync(dspQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__ASDDSPStream_removeClientDSPwithKey___block_invoke(void *a1)
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1[4] + 320);
  uint64_t v3 = a1[6];
  char v4 = (atomic_uint *)(v2 + 48);
  atomic_fetch_add((atomic_uint *volatile)(v2 + 48), 1u);
  uint64_t v5 = atomic_load((unint64_t *)(v2 + 40));
  if (!v5) {
    goto LABEL_18;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v5, v3);
  if (!v6)
  {
    char v4 = (atomic_uint *)(v2 + 48);
LABEL_18:
    atomic_fetch_add(v4, 0xFFFFFFFF);
    goto LABEL_19;
  }
  atomic_fetch_add((atomic_uint *volatile)v6, 1u);
  uint64_t v7 = *(void **)(v6 + 16);
  atomic_fetch_add((atomic_uint *volatile)(v2 + 48), 0xFFFFFFFF);
  atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF);
  uint64_t v8 = a1[4];
  if (*(unsigned char *)(v8 + 408))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__ASDDSPStream_removeClientDSPwithKey___block_invoke_2;
    v13[3] = &__block_descriptor_48_e5_v8__0l;
    v13[4] = v7;
    char v14 = 1;
    v15[0] = *(_DWORD *)v16;
    *(_DWORD *)((char *)v15 + 3) = *(_DWORD *)&v16[3];
    v17[0] = (uint64_t)&unk_26D96F898;
    v17[3] = (uint64_t)v17;
    ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v13);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v17);
    uint64_t v8 = a1[4];
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::remove(*(void *)(v8 + 320), a1[6]);
  uint64_t v9 = a1[4] + 296;
  v17[0] = (uint64_t)v17;
  v17[1] = (uint64_t)v17;
  v17[2] = 0;
  char v10 = *(void **)(v9 + 8);
  if (v10 != (void *)v9)
  {
    do
    {
      uint64_t v11 = (void *)v10[1];
      if (v10 + 2 == v7)
      {
        while (v11 != (void *)v9 && v11 + 2 == v7)
          uint64_t v11 = (void *)v11[1];
        std::list<ASDDSPGraphHelper>::splice((uint64_t)v17, v17, v9, v10, v11);
        if (v11 != (void *)v9) {
          uint64_t v11 = (void *)v11[1];
        }
      }
      char v10 = v11;
    }
    while (v11 != (void *)v9);
  }
  std::__list_imp<ASDDSPGraphHelper>::clear(v17);
LABEL_19:
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
}

DSPGraph::Graph *__39__ASDDSPStream_removeClientDSPwithKey___block_invoke_2(uint64_t a1)
{
  return ASDDSPGraphHelper::deallocateStreamingResources(*(DSPGraph::Graph ***)(a1 + 32));
}

- (BOOL)graphStructureIsValid:(id)a3 clientID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == -1)
  {
    if ([(ASDStream *)self direction] == 1768845428)
    {
      uint64_t v11 = [v7 numberOfInputs];
      NSUInteger v12 = [(NSArray *)self->_underlyingStreams count];
      BOOL v10 = [v7 numberOfOutputs] == 1 && v11 == v12;
    }
    else
    {
      if ([(ASDStream *)self direction] != 1869968496)
      {
        BOOL v15 = 1;
        goto LABEL_16;
      }
      uint64_t v13 = [v7 numberOfOutputs];
      unint64_t underlyingOutputStreamCount = self->_underlyingOutputStreamCount;
      BOOL v10 = [v7 numberOfInputs] == self->_underlyingInputStreamCount + 1
         && v13 == underlyingOutputStreamCount;
    }
  }
  else
  {
    uint64_t v8 = [v6 numberOfInputs];
    uint64_t v9 = [v7 numberOfOutputs];
    BOOL v10 = [v7 numberOfInputs] == 1 && v8 == v9;
  }
  BOOL v15 = v10;
LABEL_16:

  return v15;
}

- (void)suspendProcessing
{
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASDDSPStream_suspendProcessing__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __33__ASDDSPStream_suspendProcessing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suspendProcessing];
}

- (void)_suspendProcessing
{
  value = self->_streamHelper.__ptr_.__value_;
  if (value) {
    ASDDSPStreamHelper::suspendProcessing(value);
  }
}

- (void)resumeProcessing
{
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASDDSPStream_resumeProcessing__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __32__ASDDSPStream_resumeProcessing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeProcessing];
}

- (void)_resumeProcessing
{
  value = self->_streamHelper.__ptr_.__value_;
  if (value) {
    ASDDSPStreamHelper::resumeProcessing(value);
  }
}

- (void)updateLatency
{
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDDSPStream_updateLatency__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __29__ASDDSPStream_updateLatency__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLatency];
}

- (void)_updateMaximumFramesPerIOCycle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  self->_maximumFramesPerIOCycle = [WeakRetained timestampPeriod];
}

- (int64_t)maximumFramesPerIOCycle
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ASDDSPStream_maximumFramesPerIOCycle__block_invoke;
  v5[3] = &unk_264773078;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__ASDDSPStream_maximumFramesPerIOCycle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateMaximumFramesPerIOCycle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 360);
  return result;
}

- (void)_updateLatency
{
}

uint64_t __30__ASDDSPStream__updateLatency__block_invoke(uint64_t a1)
{
  uint64_t v2 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
  unsigned int v3 = DSPGraph::Box::totalLatencyInSamples(v2);
  uint64_t result = *(unsigned int *)(a1 + 44);
  if (v3 > result)
  {
    uint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
    return DSPGraph::Box::totalLatencyInSamples(v5);
  }
  return result;
}

uint64_t __30__ASDDSPStream__updateLatency__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
  unsigned int v3 = DSPGraph::Box::totalLatencyInSamples(v2);
  uint64_t result = *(unsigned int *)(a1 + 40);
  if (v3 > result)
  {
    uint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
    return DSPGraph::Box::totalLatencyInSamples(v5);
  }
  return result;
}

- (BOOL)addHardwareDSP:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  int v6 = [WeakRetained isRunning];

  if (v6)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      -[ASDDSPStream addHardwareDSP:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = [(ASDDSPStream *)self addClientDSP:v4 withKey:-1];
  }

  return v15;
}

- (BOOL)removeHardwareDSP
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  int v4 = [WeakRetained isRunning];

  if (v4)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      [(ASDDSPStream *)v5 removeHardwareDSP];
    }
    return 0;
  }
  else
  {
    return [(ASDDSPStream *)self removeClientDSPwithKey:-1];
  }
}

- (BOOL)addClientDSP:(id)a3 forClient:(unsigned int)a4
{
  return [(ASDDSPStream *)self addClientDSP:a3 withKey:a4];
}

- (BOOL)removeClientDSPForClient:(unsigned int)a3
{
  return [(ASDDSPStream *)self removeClientDSPwithKey:a3];
}

- (ASDDSPGraph)hardwareDSP
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__ASDDSPStream_hardwareDSP__block_invoke;
  v5[3] = &unk_264772F90;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDDSPGraph *)v3;
}

uint64_t __27__ASDDSPStream_hardwareDSP__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _hardwareDSP];
  return MEMORY[0x270F9A758]();
}

- (id)_hardwareDSP
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__ASDDSPStream__hardwareDSP__block_invoke;
  v4[3] = &unk_2647730E0;
  v4[4] = self;
  v5[0] = &unk_26D96F8E0;
  v5[1] = 0;
  v5[3] = v5;
  uint64_t v2 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v5);
  return v2;
}

ASDDSPGraph *__28__ASDDSPStream__hardwareDSP__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 320);
  uint64_t v2 = (atomic_uint *)(v1 + 48);
  atomic_fetch_add((atomic_uint *volatile)(v1 + 48), 1u);
  uint64_t v3 = atomic_load((unint64_t *)(v1 + 40));
  if (!v3)
  {
    uint64_t v10 = 0;
LABEL_11:
    atomic_fetch_add(v2, 0xFFFFFFFF);
    goto LABEL_12;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v3, -1);
  if (!v4)
  {
    uint64_t v10 = 0;
    uint64_t v2 = (atomic_uint *)(v1 + 48);
    goto LABEL_11;
  }
  BOOL v5 = (atomic_uint *)v4;
  atomic_fetch_add((atomic_uint *volatile)v4, 1u);
  uint64_t v6 = *(uint64_t **)(v4 + 16);
  atomic_fetch_add((atomic_uint *volatile)(v1 + 48), 0xFFFFFFFF);
  uint64_t v7 = [ASDDSPGraph alloc];
  if (!*v6) {
    __assert_rtn("providedGraph", "ASDDSPGraphHelper.h", 45, "mProvidedGraph");
  }
  uint64_t v8 = (std::__shared_weak_count *)v6[1];
  uint64_t v12 = *v6;
  uint64_t v13 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = [(ASDDSPGraph *)v7 initWithDSPGraph:&v12];
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  uint64_t v10 = v9;
  atomic_fetch_add(v5, 0xFFFFFFFF);

LABEL_12:
  return v10;
}

- (id)clientDSPForClient:(unsigned int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  dspQueue = self->_dspQueue;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDDSPStream_clientDSPForClient___block_invoke;
  block[3] = &unk_264773108;
  unsigned int v7 = a3;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync(dspQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void *__35__ASDDSPStream_clientDSPForClient___block_invoke(uint64_t a1)
{
  v5[4] = *MEMORY[0x263EF8340];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__ASDDSPStream_clientDSPForClient___block_invoke_2;
  v2[3] = &unk_264773108;
  int v4 = *(_DWORD *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  v5[0] = &unk_26D96F898;
  v5[3] = v5;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v2);
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v5);
}

void __35__ASDDSPStream_clientDSPForClient___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 320);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  int v4 = (atomic_uint *)(v2 + 48);
  atomic_fetch_add((atomic_uint *volatile)(v2 + 48), 1u);
  uint64_t v5 = atomic_load((unint64_t *)(v2 + 40));
  if (v5)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v5, v3);
    if (v6)
    {
      unsigned int v7 = (atomic_uint *)v6;
      atomic_fetch_add((atomic_uint *volatile)v6, 1u);
      uint64_t v8 = *(uint64_t **)(v6 + 16);
      atomic_fetch_add(v4, 0xFFFFFFFF);
      uint64_t v9 = [ASDDSPGraph alloc];
      if (!*v8) {
        __assert_rtn("providedGraph", "ASDDSPGraphHelper.h", 45, "mProvidedGraph");
      }
      uint64_t v10 = (std::__shared_weak_count *)v8[1];
      uint64_t v14 = *v8;
      BOOL v15 = v10;
      if (v10) {
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v11 = [(ASDDSPGraph *)v9 initWithDSPGraph:&v14];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
      int v4 = v7;
    }
  }
  atomic_fetch_add(v4, 0xFFFFFFFF);
}

- (id)readInputBlock
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__ASDDSPStream_readInputBlock__block_invoke;
  v4[3] = &unk_264773130;
  v4[4] = v5;
  uint64_t v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __30__ASDDSPStream_readInputBlock__block_invoke(uint64_t a1, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  uint64_t v5 = **(ASDDSPStreamHelper ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v5) {
    __30__ASDDSPStream_readInputBlock__block_invoke_cold_1();
  }
  return ASDDSPStreamHelper::readInput(v5, a2, a3, a4, a5);
}

- (id)processOutputBlock
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__ASDDSPStream_processOutputBlock__block_invoke;
  v4[3] = &unk_264773130;
  v4[4] = v5;
  uint64_t v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __34__ASDDSPStream_processOutputBlock__block_invoke(uint64_t a1, int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, unsigned int a6)
{
  uint64_t v6 = **(ASDDSPStreamHelper ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v6) {
    __34__ASDDSPStream_processOutputBlock__block_invoke_cold_1();
  }
  return ASDDSPStreamHelper::processOutput(v6, a2, a3, a4, a5, a6);
}

- (id)writeMixBlock
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ASDDSPStream_writeMixBlock__block_invoke;
  v4[3] = &unk_264773130;
  v4[4] = v5;
  uint64_t v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __29__ASDDSPStream_writeMixBlock__block_invoke(uint64_t a1, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  uint64_t v5 = **(ASDDSPStreamHelper ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v5) {
    __29__ASDDSPStream_writeMixBlock__block_invoke_cold_1();
  }
  return ASDDSPStreamHelper::writeMix(v5, a2, a3, a4, a5);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDDSPStream;
  unsigned int v7 = [(ASDStream *)&v21 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [v7 appendFormat:@"%@|    DSP Configuration:\n", v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(ASDDSPStream *)self currentDSPConfiguration];
  uint64_t v9 = [v8 hardwareDSP];
  uint64_t v10 = [v9 dspItems];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 path];
          [v7 appendFormat:@"%@|         - Graph: %s\n", v6, objc_msgSend(v15, "UTF8String")];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v14 path];
            [v7 appendFormat:@"%@|         - Strip: %s\n", v6, objc_msgSend(v15, "UTF8String")];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            id v15 = [v14 path];
            [v7 appendFormat:@"%@|         - Property strip: %s\n", v6, objc_msgSend(v15, "UTF8String")];
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)driverClassName
{
  return @"DSPAudioStream";
}

- (void)dealloc
{
  mHUPSource = self->mHUPSource;
  if (mHUPSource)
  {
    dispatch_source_cancel(mHUPSource);
    BOOL v4 = self->mHUPSource;
    self->mHUPSource = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPStream;
  [(ASDObject *)&v5 dealloc];
}

- (void)setBypassMode:(BOOL)a3
{
  self->_bypassMode = a3;
  value = self->_streamHelper.__ptr_.__value_;
  if (value) {
    ASDDSPStreamHelper::setBypassGraphMode(value, a3);
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (unint64_t)underlyingInputStreamCount
{
  return self->_underlyingInputStreamCount;
}

- (void)setUnderlyingInputStreamCount:(unint64_t)a3
{
  self->_underlyingInputStreamCount = a3;
}

- (unint64_t)underlyingOutputStreamCount
{
  return self->_underlyingOutputStreamCount;
}

- (void)setUnderlyingOutputStreamCount:(unint64_t)a3
{
  self->_unint64_t underlyingOutputStreamCount = a3;
}

- (ASDStreamDSPConfiguration)currentDSPConfiguration
{
  return self->_currentDSPConfiguration;
}

- (void)setCurrentDSPConfiguration:(id)a3
{
}

- (BOOL)keepGraphInitialized
{
  return self->_keepGraphInitialized;
}

- (void)setKeepGraphInitialized:(BOOL)a3
{
  self->_keepGraphInitialized = a3;
}

- (BOOL)bypassMode
{
  return self->_bypassMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDSPConfiguration, 0);
  objc_storeStrong((id *)&self->mHUPSource, 0);
  objc_storeStrong((id *)&self->_underlyingStreams, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_DSPCaptureDirectory, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_dspQueue, 0);
  std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>>::reset[abi:ne180100]((uint64_t *)&self->_clientToGraphMap, 0);
  std::__list_imp<ASDDSPGraphHelper>::clear((uint64_t *)&self->_graphHelpers);
  std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100](&self->_streamHelper.__ptr_.__value_, 0);
  objc_destroyWeak((id *)&self->_owningDevice);
}

- (id).cxx_construct
{
  *((void *)self + 36) = 0;
  *((void *)self + 37) = (char *)self + 296;
  *((void *)self + 38) = (char *)self + 296;
  *((void *)self + 39) = 0;
  *((void *)self + 40) = 0;
  return self;
}

- (void)_allocateStreamingResourcesForGraphHelper:.cold.1()
{
}

- (void)enableBasicDSPCaptureOnGraph:(uint64_t)a3 withLevel:(uint64_t)a4 andDebugType:(uint64_t)a5 andMode:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enableBasicDSPCaptureOnGraph:(void *)a1 withLevel:(uint8_t *)buf andDebugType:andMode:.cold.2(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to enable DSP Capture on dsp graph: %@", buf, 0xCu);
}

- (void)enableBasicDSPCaptureOnGraph:(uint64_t)a3 withLevel:(uint64_t)a4 andDebugType:(uint64_t)a5 andMode:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enableDSPFileInjectionOnGraph:(uint8_t *)buf withFormat:.cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to enable DSP file injection on dsp graph: %@, with format %@", buf, 0x16u);
}

- (void)addClientDSP:(uint64_t)a3 withKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addHardwareDSP:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeHardwareDSP
{
}

void __30__ASDDSPStream_readInputBlock__block_invoke_cold_1()
{
}

void __34__ASDDSPStream_processOutputBlock__block_invoke_cold_1()
{
}

void __29__ASDDSPStream_writeMixBlock__block_invoke_cold_1()
{
}

@end
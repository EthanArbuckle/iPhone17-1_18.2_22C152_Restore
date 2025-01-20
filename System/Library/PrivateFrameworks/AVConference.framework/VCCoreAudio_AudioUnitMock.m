@interface VCCoreAudio_AudioUnitMock
+ (id)sharedInstance;
- (BOOL)audioUnit:(OpaqueAudioComponentInstance *)a3 setParameter:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 bufferOffsetInFrames:(unsigned int)a8 outStatus:(int *)a9;
- (BOOL)complexRender:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberOfPackets:(unsigned int)a7 outNumberOfPackets:(unsigned int *)a8 outPacketDescriptions:(AudioStreamPacketDescription *)a9 ioData:(AudioBufferList *)a10 outMetadata:(void *)a11 outMetadataByteSize:(unsigned int *)a12 outStatus:(int *)a13;
- (BOOL)generateMutedTalkerNotification:(unsigned int)a3;
- (BOOL)getProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 outData:(void *)a7 ioDataSize:(unsigned int *)a8 outStatus:(int *)a9;
- (BOOL)initialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4;
- (BOOL)outputUnitStart:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4;
- (BOOL)outputUnitStop:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4;
- (BOOL)registerAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3;
- (BOOL)render:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberFrames:(unsigned int)a7 ioData:(AudioBufferList *)a8 outStatus:(int *)a9;
- (BOOL)setProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 inData:(const void *)a7 inDataSize:(unsigned int)a8 outStatus:(int *)a9;
- (BOOL)shouldProcessAudioUnit:(OpaqueAudioComponentInstance *)a3;
- (BOOL)uninitialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4;
- (BOOL)unregisterAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3;
- (VCCoreAudio_AudioUnitMock)init;
- (id)audioInstanceForAudioUnit:(OpaqueAudioComponentInstance *)a3;
- (id)newKeyForAudioUnit:(OpaqueAudioComponentInstance *)a3;
- (void)runAudioCallback;
- (void)runAudioCallbackWithSampleCount:(unsigned int)a3 timeGap:(double)a4;
- (void)start;
- (void)startMicThread;
- (void)stop;
- (void)stopMicThread;
@end

@implementation VCCoreAudio_AudioUnitMock

+ (id)sharedInstance
{
  if (sharedInstance_token_5 != -1) {
    dispatch_once(&sharedInstance_token_5, &__block_literal_global_88);
  }
  return (id)sharedInstance__audioUnitMock;
}

- (VCCoreAudio_AudioUnitMock)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCCoreAudio_AudioUnitMock;
  v2 = [(VCObject *)&v4 init];
  if (v2) {
    v2->_audioUnitInstanceMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)start
{
  [(VCObject *)self lock];
  if (!self->_isMockingEnabled)
  {
    _audioUnitStub = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Initialize;
    off_1EB5E6358 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Uninitialize;
    off_1EB5E6360 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_SetProperty;
    off_1EB5E6368 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_GetProperty;
    off_1EB5E6370 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Render;
    off_1EB5E6378 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_ComplexRender;
    off_1EB5E6380 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_OutputUnitStart;
    off_1EB5E6388 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_OutputUnitStop;
    off_1EB5E6390 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_SetParameter;
    self->_isMockingEnabled = 1;
    if (+[VCDefaults BOOLeanValueForKey:@"forceEnableAudioMockInputPathForAppleTV" defaultValue:0])
    {
      [(VCCoreAudio_AudioUnitMock *)self startMicThread];
    }
  }

  [(VCObject *)self unlock];
}

- (void)stop
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled)
  {
    _audioUnitStub = (uint64_t (*)(void))MEMORY[0x1E4F189C8];
    off_1EB5E6358 = (uint64_t (*)(void))MEMORY[0x1E4F189E8];
    off_1EB5E6360 = (uint64_t (*)(void))MEMORY[0x1E4F189E0];
    off_1EB5E6368 = (uint64_t (*)(void))MEMORY[0x1E4F189C0];
    off_1EB5E6370 = (uint64_t (*)(void))MEMORY[0x1E4F189D0];
    off_1EB5E6378 = (uint64_t (*)(void))MEMORY[0x1E4F189B8];
    off_1EB5E6380 = (uint64_t (*)(void))MEMORY[0x1E4F189A0];
    off_1EB5E6388 = (uint64_t (*)(void))MEMORY[0x1E4F189A8];
    off_1EB5E6390 = (uint64_t (*)(void))MEMORY[0x1E4F189D8];
    self->_isMockingEnabled = 0;
    if (self->_micThread) {
      [(VCCoreAudio_AudioUnitMock *)self stopMicThread];
    }
  }

  [(VCObject *)self unlock];
}

- (void)startMicThread
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  v3 = "-[VCCoreAudio_AudioUnitMock startMicThread]";
  __int16 v4 = 1024;
  int v5 = 199;
  __int16 v6 = v0;
  v7 = "com.apple.VideoConference.VCAudioUnitMock.MicThread";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create thread=%s", v2, 0x26u);
}

- (void)stopMicThread
{
  self->_terminateMicThread = 1;
  VCRealTimeThread_Stop((uint64_t)self->_micThread);
  micThread = self->_micThread;

  VCRealTimeThread_Finalize((uint64_t)micThread);
}

- (void)runAudioCallback
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = (void *)[(NSMutableDictionary *)self->_audioUnitInstanceMap allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        [(VCObject *)self lock];
        if (!self->_terminateMicThread
          && self->_isMockingEnabled
          && [v8 isInitialized]
          && [v8 isRunning])
        {
          char v9 = [v8 isReconfiguring];
          [(VCObject *)self unlock];
          if ((v9 & 1) == 0) {
            [v8 runAudioCallback];
          }
        }
        else
        {
          [(VCObject *)self unlock];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }
}

- (void)runAudioCallbackWithSampleCount:(unsigned int)a3 timeGap:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_audioUnitInstanceMap allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        [(VCObject *)self lock];
        if (!self->_terminateMicThread
          && self->_isMockingEnabled
          && [v12 isInitialized]
          && [v12 isRunning])
        {
          char v13 = [v12 isReconfiguring];
          [(VCObject *)self unlock];
          if ((v13 & 1) == 0) {
            [v12 runAudioCallbackWithSampleCount:v5 timeGap:a4];
          }
        }
        else
        {
          [(VCObject *)self unlock];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
      uint64_t v9 = v14;
    }
    while (v14);
  }
}

- (BOOL)generateMutedTalkerNotification:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_audioUnitInstanceMap allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    int v8 = 1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        [(VCObject *)self lock];
        if (!self->_terminateMicThread && self->_isMockingEnabled && [v10 isInitialized])
        {
          int v11 = [v10 isRunning];
          [(VCObject *)self unlock];
          if (v11) {
            v8 &= [v10 generateMutedTalkerNotification:a3];
          }
        }
        else
        {
          [(VCObject *)self unlock];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8 & 1;
}

- (BOOL)registerAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3
{
  id v5 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:");
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(VCCoreAudio_AudioUnitMockInstance);
    id v7 = [(VCCoreAudio_AudioUnitMock *)self newKeyForAudioUnit:a3];
    [(NSMutableDictionary *)self->_audioUnitInstanceMap setObject:v6 forKeyedSubscript:v7];
  }
  return v5 == 0;
}

- (BOOL)unregisterAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3
{
  id v5 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:");
  if (v5)
  {
    id v6 = [(VCCoreAudio_AudioUnitMock *)self newKeyForAudioUnit:a3];
    [(NSMutableDictionary *)self->_audioUnitInstanceMap setObject:0 forKeyedSubscript:v6];
  }
  return v5 != 0;
}

- (BOOL)shouldProcessAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  BOOL result = 1;
  if ((uint64_t)a3 > 1919512424)
  {
    if (a3 == (OpaqueAudioComponentInstance *)1919512425) {
      return result;
    }
    uint64_t v4 = 1987078510;
  }
  else
  {
    if (a3 == (OpaqueAudioComponentInstance *)1650616686) {
      return result;
    }
    uint64_t v4 = 1684366953;
  }
  if (a3 != (OpaqueAudioComponentInstance *)v4) {
    return a3 == (OpaqueAudioComponentInstance *)1937339241;
  }
  return result;
}

- (id)newKeyForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%p", a3);
}

- (id)audioInstanceForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  id v4 = [(VCCoreAudio_AudioUnitMock *)self newKeyForAudioUnit:a3];
  id v5 = (void *)[(NSMutableDictionary *)self->_audioUnitInstanceMap objectForKey:v4];

  return v5;
}

- (BOOL)setProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 inData:(const void *)a7 inDataSize:(unsigned int)a8 outStatus:(int *)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v11 = *(void *)&a5;
  [(VCObject *)self lock];
  if (!self->_isMockingEnabled
    || ![(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    BOOL v16 = 0;
    goto LABEL_23;
  }
  id v15 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
  *a9 = 0;
  BOOL v16 = 1;
  if ((int)a4 > 2020)
  {
    if ((int)a4 > 2105)
    {
      if (a4 == 2106)
      {
        int v17 = [v15 setMutedTalkerNotificiationHandlerWithScope:v11 data:a7 dataSize:v9];
        goto LABEL_22;
      }
      if (a4 == 1718839674) {
        [v15 setBufferFrameSizeSet:1];
      }
    }
    else
    {
      if (a4 == 2021)
      {
        int v17 = [v15 setIOBufferDurationWithScope:v11 data:a7 dataSize:v9];
        goto LABEL_22;
      }
      if (a4 == 2023) {
        [v15 setAudioSessionIDSet:1];
      }
    }
  }
  else if ((int)a4 > 2002)
  {
    if (a4 == 2003)
    {
      int v17 = [v15 setEnableIOWithScope:v11 data:a7 dataSize:v9];
      goto LABEL_22;
    }
    if (a4 == 2005)
    {
      int v17 = [v15 setInputCallbackWithScope:v11 data:a7 dataSize:v9];
      goto LABEL_22;
    }
  }
  else
  {
    if (a4 == 8)
    {
      int v17 = [v15 setStreamFormatWithScope:v11 data:a7 dataSize:v9];
      goto LABEL_22;
    }
    if (a4 == 23)
    {
      int v17 = [v15 setRenderCallbackWithScope:v11 data:a7 dataSize:v9];
LABEL_22:
      *a9 = v17;
    }
  }
LABEL_23:
  [(VCObject *)self unlock];
  return v16;
}

- (BOOL)getProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 outData:(void *)a7 ioDataSize:(unsigned int *)a8 outStatus:(int *)a9
{
  uint64_t v11 = *(void *)&a5;
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v15 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    *a9 = 0;
    int v16 = -2;
    if ((int)a4 > 2004)
    {
      switch(a4)
      {
        case 0x7D5u:
          int v16 = [v15 getInputCallbackWithScope:v11 data:a7 dataSize:a8];
          break;
        case 0x7E5u:
          int v16 = [v15 getIOBufferDurationWithScope:v11 data:a7 dataSize:a8];
          break;
        case 0x840u:
          int v16 = [v15 getMaximumMediadataByteSizeWithScope:v11 data:a7 dataSize:a8];
          break;
      }
    }
    else
    {
      switch(a4)
      {
        case 8u:
          int v16 = [v15 getStreamFormatWithScope:v11 data:a7 dataSize:a8];
          break;
        case 0x17u:
          int v16 = [v15 getRenderCallbackWithScope:v11 data:a7 dataSize:a8];
          break;
        case 0x7D3u:
          int v16 = [v15 getEnableIOWithScope:v11 data:a7 dataSize:a8];
          break;
      }
    }
    *a9 = v16;
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(VCObject *)self unlock];
  return v17;
}

- (BOOL)render:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberFrames:(unsigned int)a7 ioData:(AudioBufferList *)a8 outStatus:(int *)a9
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v11 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if ([v11 isInitialized])
    {
      int v12 = -3;
      if ([v11 isRunning])
      {
        if ([v11 isReconfiguring]) {
          int v12 = -3;
        }
        else {
          int v12 = 0;
        }
      }
    }
    else
    {
      int v12 = -3;
    }
    *a9 = v12;
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
  [(VCObject *)self unlock];
  return v13;
}

- (BOOL)complexRender:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberOfPackets:(unsigned int)a7 outNumberOfPackets:(unsigned int *)a8 outPacketDescriptions:(AudioStreamPacketDescription *)a9 ioData:(AudioBufferList *)a10 outMetadata:(void *)a11 outMetadataByteSize:(unsigned int *)a12 outStatus:(int *)a13
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v15 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if ([v15 isInitialized])
    {
      int v16 = -3;
      if ([v15 isRunning])
      {
        if ([v15 isReconfiguring]) {
          int v16 = -3;
        }
        else {
          int v16 = 0;
        }
      }
    }
    else
    {
      int v16 = -3;
    }
    *a13 = v16;
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(VCObject *)self unlock];
  return v17;
}

- (BOOL)initialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v7 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if ([v7 isRunning])
    {
      int v8 = -3;
    }
    else
    {
      [v7 setIsInitialized:1];
      int v8 = 0;
    }
    *a4 = v8;
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
  [(VCObject *)self unlock];
  return v9;
}

- (BOOL)uninitialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v7 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if (![v7 isInitialized] || (objc_msgSend(v7, "isRunning") & 1) != 0)
    {
      int v8 = -3;
    }
    else
    {
      [v7 setIsInitialized:0];
      int v8 = 0;
    }
    *a4 = v8;
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
  [(VCObject *)self unlock];
  return v9;
}

- (BOOL)outputUnitStart:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v7 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if (![v7 isInitialized] || objc_msgSend(v7, "isRunning"))
    {
      *a4 = -3;
      BOOL v8 = 1;
    }
    else
    {
      *a4 = 0;
      BOOL v8 = 1;
      [v7 setIsRunning:1];
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  [(VCObject *)self unlock];
  return v8;
}

- (BOOL)outputUnitStop:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v7 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    if [v7 isInitialized] && (objc_msgSend(v7, "isRunning"))
    {
      *a4 = 0;
      [v7 setIsRunning:0];
    }
    else
    {
      *a4 = -3;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  [(VCObject *)self unlock];
  return v8;
}

- (BOOL)audioUnit:(OpaqueAudioComponentInstance *)a3 setParameter:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 bufferOffsetInFrames:(unsigned int)a8 outStatus:(int *)a9
{
  [(VCObject *)self lock];
  if (self->_isMockingEnabled
    && [(VCCoreAudio_AudioUnitMock *)self shouldProcessAudioUnit:a3])
  {
    id v14 = [(VCCoreAudio_AudioUnitMock *)self audioInstanceForAudioUnit:a3];
    *a9 = 0;
    if (a4 == 14)
    {
      *(float *)&double v15 = a7;
      [v14 setDynamicDuckerVolume:v15];
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }
  [(VCObject *)self unlock];
  return v16;
}

@end
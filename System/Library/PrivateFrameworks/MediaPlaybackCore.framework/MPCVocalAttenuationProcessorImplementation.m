@interface MPCVocalAttenuationProcessorImplementation
- (BOOL)_createAudioUnit:(id *)a3;
- (BOOL)_initializeAudioUnit:(id *)a3;
- (BOOL)_setupAudioUnitWithModel:(id)a3 error:(id *)a4;
- (BOOL)isAvailable;
- (BOOL)isCompatibleWithAudioFormat:(AudioStreamBasicDescription *)a3 maxFrames:(unsigned int)a4;
- (BOOL)isEnabled;
- (BOOL)processAudioBuffer:(AudioBufferList *)a3 sampleIndex:(int64_t)a4 numberFrames:(unsigned int)a5 error:(id *)a6;
- (MPCVocalAttenuationModel)model;
- (MPCVocalAttenuationProcessorImplementation)init;
- (MPCVocalAttenuationProcessorImplementation)initWithMaxAttenuationLevel:(float)a3 audioFormat:(AudioStreamBasicDescription *)a4 maxFrames:(unsigned int)a5;
- (double)renderingLimit;
- (double)sampleTime;
- (float)level;
- (float)maxLevel;
- (float)minLevel;
- (int64_t)state;
- (void)_applyAttenuationLevelToAudioUnit;
- (void)_prepareWithModel:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)prepareWithModel:(id)a3 completion:(id)a4;
- (void)resetAudioUnit;
- (void)setEnabled:(BOOL)a3;
- (void)setLevel:(float)a3;
- (void)tearDownWithCompletion:(id)a3;
@end

@implementation MPCVocalAttenuationProcessorImplementation

- (BOOL)isAvailable
{
  return [(MPCVocalAttenuationProcessorImplementation *)self state] == 2
      || [(MPCVocalAttenuationProcessorImplementation *)self state] == 3
      || [(MPCVocalAttenuationProcessorImplementation *)self state] == 4;
}

- (int64_t)state
{
  return self->_state;
}

- (double)renderingLimit
{
  v3 = [MEMORY[0x263F12178] standardUserDefaults];
  [v3 audioTapTimeOutRatioForFailureDetection];
  double v5 = v4;
  [(MPCVocalAttenuationProcessorImplementation *)self sampleTime];
  double v7 = v6 * v5;

  return v7;
}

- (double)sampleTime
{
  LODWORD(v2) = self->_maxFrames;
  return (double)v2 / self->_audioFormat.mSampleRate * 1000.0;
}

- (MPCVocalAttenuationProcessorImplementation)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:2 channels:0 interleaved:44100.0];
  uint64_t v4 = [v3 streamDescription];
  long long v5 = *(_OWORD *)v4;
  long long v6 = *(_OWORD *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 32);
  v9[0] = v5;
  v9[1] = v6;
  LODWORD(v5) = 1119748096;
  double v7 = [(MPCVocalAttenuationProcessorImplementation *)self initWithMaxAttenuationLevel:v9 audioFormat:0x2000 maxFrames:*(double *)&v5];

  return v7;
}

- (MPCVocalAttenuationProcessorImplementation)initWithMaxAttenuationLevel:(float)a3 audioFormat:(AudioStreamBasicDescription *)a4 maxFrames:(unsigned int)a5
{
  v15.receiver = self;
  v15.super_class = (Class)MPCVocalAttenuationProcessorImplementation;
  v8 = [(MPCVocalAttenuationProcessorImplementation *)&v15 init];
  v9 = (MPCVocalAttenuationProcessorImplementation *)v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a4->mSampleRate;
    long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *((void *)v8 + 16) = *(void *)&a4->mBitsPerChannel;
    *((_OWORD *)v8 + 6) = v10;
    *((_OWORD *)v8 + 7) = v11;
    *((_DWORD *)v8 + 34) = a5;
    *(_OWORD *)(v8 + 8) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *((_DWORD *)v8 + 42) = 0;
    *((float *)v8 + 43) = a3;
    *((void *)v8 + 22) = 0;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAProcessorCreationQueue", 0);
    creationQueue = v9->_creationQueue;
    v9->_creationQueue = (OS_dispatch_queue *)v12;
  }
  return v9;
}

- (void)dealloc
{
  ioBuffer = self->_ioBuffer;
  if (ioBuffer) {
    free(ioBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCVocalAttenuationProcessorImplementation;
  [(MPCVocalAttenuationProcessorImplementation *)&v4 dealloc];
}

- (void)resetAudioUnit
{
  *(_OWORD *)&self->_timestamp.mSMPTETime.mHours = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mSubframes = 0u;
  *(_OWORD *)&self->_timestamp.mRateScalar = 0u;
  *(_OWORD *)&self->_timestamp.mSampleTime = 0u;
  self->_previousContiguousSampleIndex = -1;
  self->_nextContiguousSampleIndex = -1;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_creationQueue, 0);
}

- (float)maxLevel
{
  return self->_maxLevel;
}

- (float)minLevel
{
  return self->_minLevel;
}

- (float)level
{
  return self->_level;
}

- (MPCVocalAttenuationModel)model
{
  return self->_model;
}

- (void)_applyAttenuationLevelToAudioUnit
{
  v23[1] = *MEMORY[0x263EF8340];
  if ([(MPCVocalAttenuationProcessorImplementation *)self isAvailable])
  {
    OSStatus v3 = AudioUnitSetParameter(self->_processingAU, 0, 0, 0, self->_level, 0);
    if (!v3)
    {
      id v9 = 0;
      goto LABEL_22;
    }
    OSStatus v4 = v3;
    long long v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F08410];
    uint64_t v7 = v3;
    v23[0] = *MEMORY[0x263F08320];
    memset(buf, 0, 20);
    int v8 = bswap32(v3);
    *(_DWORD *)&buf[1] = v8;
    if ((v8 & 0x80) != 0)
    {
      if (!__maskrune((char)v8, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v8 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v10 = (__int16)v8 >> 8;
    if ((v8 & 0x8000) != 0)
    {
      if (!__maskrune(v10, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v10 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v11 = v8 << 8 >> 24;
    if ((v8 & 0x800000) != 0)
    {
      if (!__maskrune(v11, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v12 = v8 >> 24;
    if (v8 < 0)
    {
      if (__maskrune(v12, 0x40000uLL)) {
        goto LABEL_18;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 60) & 0x40000) != 0)
    {
LABEL_18:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
LABEL_21:
      v13 = [NSString stringWithUTF8String:buf];
      *(void *)buf = v13;
      v14 = [NSDictionary dictionaryWithObjects:buf forKeys:v23 count:1];
      id v9 = [v5 errorWithDomain:v6 code:v7 userInfo:v14];

LABEL_22:
      id v15 = v9;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v15;
          v18 = "[AP] - %{public}@ - Error setting audio attenuation level: %{public}@";
          v19 = v17;
          os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_27:
          _os_log_impl(&dword_21BB87000, v19, v20, v18, buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double level = self->_level;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = level;
        v18 = "[AP] - %{public}@ - New attenuation level: %f";
        v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_27;
      }

      return;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v4);
    goto LABEL_21;
  }
}

- (BOOL)_initializeAudioUnit:(id *)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  OSStatus v5 = AudioUnitInitialize(self->_processingAU);
  if (!v5)
  {
    unsigned int v11 = 0;
    BOOL v12 = 1;
    goto LABEL_26;
  }
  OSStatus v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08410];
  uint64_t v9 = v5;
  uint64_t v24 = *MEMORY[0x263F08320];
  memset(buf, 0, 20);
  int v10 = bswap32(v5);
  *(_DWORD *)&buf[1] = v10;
  if ((v10 & 0x80) != 0)
  {
    if (!__maskrune((char)v10, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v10 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v13 = (__int16)v10 >> 8;
  if ((v10 & 0x8000) != 0)
  {
    if (!__maskrune(v13, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v14 = v10 << 8 >> 24;
  if ((v10 & 0x800000) != 0)
  {
    if (!__maskrune(v14, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v14 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v15 = v10 >> 24;
  if (v10 < 0)
  {
    if (__maskrune(v15, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15 + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&buf[5], "'");
    buf[0] = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v6);
LABEL_20:
  v16 = [NSString stringWithUTF8String:buf];
  v25[0] = v16;
  BOOL v12 = 1;
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v18 = [v7 errorWithDomain:v8 code:v9 userInfo:v17];

  id v19 = v18;
  unsigned int v11 = v19;
  if (v19)
  {
    if (a3) {
      *a3 = v19;
    }
    os_log_type_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = *a3;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error initializing audio unit: %{public}@", buf, 0x16u);
    }

    BOOL v12 = 0;
  }
LABEL_26:

  return v12;
}

- (BOOL)_setupAudioUnitWithModel:(id)a3 error:(id *)a4
{
  v152[1] = *MEMORY[0x263EF8340];
  OSStatus v6 = a3;
  inData[0] = inputRenderCallback;
  inData[1] = self;
  OSStatus v7 = AudioUnitSetProperty(self->_processingAU, 0x17u, 1u, 0, inData, 0x10u);
  if (!v7) {
    goto LABEL_25;
  }
  OSStatus v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08410];
  uint64_t v11 = v7;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v7);
  uint64_t v12 = MEMORY[0x263EF8318];
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v12 + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v12 + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(v12 + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v8);
LABEL_20:
  unsigned int v13 = [NSString stringWithUTF8String:v150];
  v152[0] = v13;
  unsigned int v14 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v15 = [v9 errorWithDomain:v10 code:v11 userInfo:v14];

  id v16 = v15;
  if (v16)
  {
    v17 = v16;
    if (a4) {
      *a4 = v16;
    }
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_165;
    }
    id v19 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v19;
    os_log_type_t v20 = "[AP] - %{public}@ - Error setting input render callback format: %{public}@";
LABEL_164:
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)v150, 0x16u);
LABEL_165:

    BOOL v94 = 0;
    goto LABEL_166;
  }
LABEL_25:
  self->_ioBuffer = (AudioBufferList *)malloc_type_malloc(16 * (self->_audioFormat.mChannelsPerFrame - 1) + 24, 0x7E22D33BuLL);
  id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t maxFrames = self->_maxFrames;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2048;
    *(void *)((char *)&v150[3] + 2) = maxFrames;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up maximum frames per slice to %ld", (uint8_t *)v150, 0x16u);
  }

  OSStatus v23 = AudioUnitSetProperty(self->_processingAU, 0xEu, 0, 0, &self->_maxFrames, 4u);
  if (!v23) {
    goto LABEL_51;
  }
  OSStatus v24 = v23;
  v25 = (void *)MEMORY[0x263F087E8];
  uint64_t v26 = *MEMORY[0x263F08410];
  uint64_t v27 = v23;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v23);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL)) {
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL)) {
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL)) {
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL)) {
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_43:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_46;
  }
LABEL_45:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v24);
LABEL_46:
  v28 = [NSString stringWithUTF8String:v150];
  v152[0] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v30 = [v25 errorWithDomain:v26 code:v27 userInfo:v29];

  id v31 = v30;
  if (v31)
  {
    v17 = v31;
    if (a4) {
      *a4 = v31;
    }
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_165;
    }
    id v32 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v32;
    os_log_type_t v20 = "[AP] - %{public}@ - Error setting max frames: %{public}@";
    goto LABEL_164;
  }
LABEL_51:
  v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u", self->_audioFormat.mFormatID, *(void *)&self->_audioFormat.mSampleRate, self->_audioFormat.mBytesPerPacket, self->_audioFormat.mFramesPerPacket, self->_audioFormat.mBytesPerFrame, self->_audioFormat.mChannelsPerFrame, self->_audioFormat.mBitsPerChannel);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v34;
    _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up stream processing format to %{public}@", (uint8_t *)v150, 0x16u);
  }
  OSStatus v35 = AudioUnitSetProperty(self->_processingAU, 8u, 1u, 0, &self->_audioFormat, 0x28u);
  if (!v35)
  {
    v37 = v6;
    goto LABEL_77;
  }
  OSStatus v36 = v35;
  v37 = v6;
  v38 = (void *)MEMORY[0x263F087E8];
  uint64_t v39 = *MEMORY[0x263F08410];
  uint64_t v40 = v35;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v35);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL)) {
      goto LABEL_71;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL)) {
      goto LABEL_71;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL)) {
      goto LABEL_71;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL)) {
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_69:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_72;
  }
LABEL_71:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v36);
LABEL_72:
  v41 = [NSString stringWithUTF8String:v150];
  v152[0] = v41;
  v42 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v43 = [v38 errorWithDomain:v39 code:v40 userInfo:v42];

  id v44 = v43;
  if (v44)
  {
    v17 = v44;
    if (a4) {
      *a4 = v44;
    }
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    OSStatus v6 = v37;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_165;
    }
    id v45 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v45;
    os_log_type_t v20 = "[AP] - %{public}@ - Error setting input format: %{public}@";
    goto LABEL_164;
  }
LABEL_77:
  OSStatus v46 = AudioUnitSetProperty(self->_processingAU, 8u, 2u, 0, &self->_audioFormat, 0x28u);
  if (!v46)
  {
    OSStatus v6 = v37;
    goto LABEL_102;
  }
  OSStatus v47 = v46;
  v48 = (void *)MEMORY[0x263F087E8];
  uint64_t v49 = *MEMORY[0x263F08410];
  uint64_t v50 = v46;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v46);
  if ((v150[0] & 0x8000) != 0) {
    int v51 = __maskrune(SBYTE1(v150[0]), 0x40000uLL);
  }
  else {
    int v51 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
  }
  OSStatus v6 = v37;
  if (!v51) {
    goto LABEL_96;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL)) {
      goto LABEL_96;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_96;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL)) {
      goto LABEL_96;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_96;
  }
  if (SLOBYTE(v150[1]) < 0) {
    int v52 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL);
  }
  else {
    int v52 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000;
  }
  if (v52)
  {
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_97;
  }
LABEL_96:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v47);
LABEL_97:
  v53 = [NSString stringWithUTF8String:v150];
  v152[0] = v53;
  v54 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v55 = [v48 errorWithDomain:v49 code:v50 userInfo:v54];

  id v56 = v55;
  if (v56)
  {
    v17 = v56;
    if (a4) {
      *a4 = v56;
    }
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_165;
    }
    id v57 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v57;
    os_log_type_t v20 = "[AP] - %{public}@ - Error setting output format: %{public}@";
    goto LABEL_164;
  }
LABEL_102:
  v58 = _MPCLogCategoryPlayback();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      v59 = (void *)v6[4];
    }
    else {
      v59 = 0;
    }
    id v60 = v59;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v60;
    _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up plist path to %{public}@", (uint8_t *)v150, 0x16u);
  }
  id v148 = 0;
  if (v6) {
    v61 = (void *)v6[4];
  }
  else {
    v61 = 0;
  }
  id v62 = v61;

  id v148 = v62;
  OSStatus v63 = AudioUnitSetProperty(self->_processingAU, 0x7530u, 0, 0, &v148, 8u);
  if (!v63) {
    goto LABEL_133;
  }
  OSStatus v64 = v63;
  v65 = (void *)MEMORY[0x263F087E8];
  uint64_t v66 = *MEMORY[0x263F08410];
  uint64_t v67 = v63;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v63);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL)) {
      goto LABEL_127;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_127;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL)) {
      goto LABEL_127;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_127;
  }
  if (SHIBYTE(v150[0]) < 0) {
    int v68 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL);
  }
  else {
    int v68 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000;
  }
  if (v68)
  {
    if (SLOBYTE(v150[1]) < 0
       ? __maskrune(SLOBYTE(v150[1]), 0x40000uLL)
       : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000)
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
      goto LABEL_128;
    }
  }
LABEL_127:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v64);
LABEL_128:
  v70 = [NSString stringWithUTF8String:v150];
  v152[0] = v70;
  v71 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v72 = [v65 errorWithDomain:v66 code:v67 userInfo:v71];

  id v73 = v72;
  if (v73)
  {
    v17 = v73;
    if (a4) {
      *a4 = v73;
    }
    id v18 = _MPCLogCategoryPlayback();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_165;
    }
    id v74 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v74;
    os_log_type_t v20 = "[AP] - %{public}@ - Error setting model plist path: %{public}@";
    goto LABEL_164;
  }
LABEL_133:
  v75 = _MPCLogCategoryPlayback();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      v76 = (void *)v6[3];
    }
    else {
      v76 = 0;
    }
    id v77 = v76;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v77;
    _os_log_impl(&dword_21BB87000, v75, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up model base path to %{public}@", (uint8_t *)v150, 0x16u);
  }
  id v147 = 0;
  if (v6) {
    v78 = (void *)v6[3];
  }
  else {
    v78 = 0;
  }
  id v79 = v78;

  id v147 = v79;
  OSStatus v80 = AudioUnitSetProperty(self->_processingAU, 0x9C40u, 0, 0, &v147, 8u);
  if (v80)
  {
    OSStatus v81 = v80;
    v82 = (void *)MEMORY[0x263F087E8];
    uint64_t v83 = *MEMORY[0x263F08410];
    uint64_t v84 = v80;
    uint64_t v151 = *MEMORY[0x263F08320];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v80);
    int v85 = (v150[0] & 0x8000) != 0
        ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
        : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v85
      && (SBYTE2(v150[0]) < 0
        ? (int v86 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (int v86 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v86
       && (SHIBYTE(v150[0]) < 0
         ? (int v87 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (int v87 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v87
        && (SLOBYTE(v150[1]) < 0
          ? (int v88 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (int v88 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v88))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v81);
    }
    v89 = [NSString stringWithUTF8String:v150];
    v152[0] = v89;
    v90 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
    id v91 = [v82 errorWithDomain:v83 code:v84 userInfo:v90];

    id v92 = v91;
    if (v92)
    {
      v17 = v92;
      if (a4) {
        *a4 = v92;
      }
      id v18 = _MPCLogCategoryPlayback();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_165;
      }
      id v93 = *a4;
      v150[0] = 138543618;
      *(void *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(void *)((char *)&v150[3] + 2) = v93;
      os_log_type_t v20 = "[AP] - %{public}@ - Error setting model base path: %{public}@";
      goto LABEL_164;
    }
  }
  v96 = _MPCLogCategoryPlayback();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    v150[0] = 138543362;
    *(void *)&v150[1] = self;
    _os_log_impl(&dword_21BB87000, v96, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Turning dereverb off", (uint8_t *)v150, 0xCu);
  }

  v146 = &stru_26CBCA930;
  OSStatus v97 = AudioUnitSetProperty(self->_processingAU, 0xC350u, 0, 0, &v146, 8u);
  if (v97)
  {
    OSStatus v98 = v97;
    v99 = (void *)MEMORY[0x263F087E8];
    uint64_t v100 = *MEMORY[0x263F08410];
    uint64_t v101 = v97;
    uint64_t v151 = *MEMORY[0x263F08320];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v97);
    int v102 = (v150[0] & 0x8000) != 0
         ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v102
      && (SBYTE2(v150[0]) < 0
        ? (int v103 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (int v103 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v103
       && (SHIBYTE(v150[0]) < 0
         ? (int v104 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (int v104 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v104
        && (SLOBYTE(v150[1]) < 0
          ? (int v105 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (int v105 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v105))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v98);
    }
    v106 = [NSString stringWithUTF8String:v150];
    v152[0] = v106;
    v107 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
    id v108 = [v99 errorWithDomain:v100 code:v101 userInfo:v107];

    id v109 = v108;
    if (v109)
    {
      v17 = v109;
      if (a4) {
        *a4 = v109;
      }
      v110 = _MPCLogCategoryPlayback();
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        goto LABEL_251;
      }
      id v111 = *a4;
      v150[0] = 138543618;
      *(void *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(void *)((char *)&v150[3] + 2) = v111;
      v112 = "[AP] - %{public}@ - Error disabling Dereverb: %{public}@";
LABEL_250:
      _os_log_impl(&dword_21BB87000, v110, OS_LOG_TYPE_ERROR, v112, (uint8_t *)v150, 0x16u);
LABEL_251:
      BOOL v94 = 0;
LABEL_252:

      goto LABEL_166;
    }
  }
  v113 = [MEMORY[0x263F12178] standardUserDefaults];
  int v114 = [v113 shouldBypassVocalAttenuationDenoising];

  v110 = _MPCLogCategoryPlayback();
  BOOL v115 = os_log_type_enabled(v110, OS_LOG_TYPE_INFO);
  if (!v114)
  {
    if (v115)
    {
      v150[0] = 138543362;
      *(void *)&v150[1] = self;
      BOOL v94 = 1;
      _os_log_impl(&dword_21BB87000, v110, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Keeping denoising on", (uint8_t *)v150, 0xCu);
      v17 = 0;
    }
    else
    {
      v17 = 0;
      BOOL v94 = 1;
    }
    goto LABEL_252;
  }
  if (v115)
  {
    v150[0] = 138543362;
    *(void *)&v150[1] = self;
    _os_log_impl(&dword_21BB87000, v110, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Turning denoising off", (uint8_t *)v150, 0xCu);
  }

  OSStatus v116 = AudioUnitSetParameter(self->_processingAU, 0x17626u, 0, 0, 1.0, 0);
  if (v116)
  {
    OSStatus v117 = v116;
    v118 = (void *)MEMORY[0x263F087E8];
    uint64_t v119 = *MEMORY[0x263F08410];
    uint64_t v120 = v116;
    uint64_t v151 = *MEMORY[0x263F08320];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v116);
    int v121 = (v150[0] & 0x8000) != 0
         ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v121
      && (SBYTE2(v150[0]) < 0
        ? (int v122 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (int v122 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v122
       && (SHIBYTE(v150[0]) < 0
         ? (int v123 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (int v123 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v123
        && (SLOBYTE(v150[1]) < 0
          ? (int v124 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (int v124 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v124))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v117);
    }
    v125 = [NSString stringWithUTF8String:v150];
    v152[0] = v125;
    v126 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
    id v127 = [v118 errorWithDomain:v119 code:v120 userInfo:v126];

    id v128 = v127;
    if (v128)
    {
      v17 = v128;
      if (a4) {
        *a4 = v128;
      }
      v110 = _MPCLogCategoryPlayback();
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        goto LABEL_251;
      }
      id v129 = *a4;
      v150[0] = 138543618;
      *(void *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(void *)((char *)&v150[3] + 2) = v129;
      v112 = "[AP] - %{public}@ - Error setting UseTuningMode to 1: %{public}@";
      goto LABEL_250;
    }
  }
  OSStatus v130 = AudioUnitSetParameter(self->_processingAU, 0x17627u, 0, 0, 0.0, 0);
  if (!v130)
  {
    v17 = 0;
    BOOL v94 = 1;
    goto LABEL_166;
  }
  OSStatus v131 = v130;
  v132 = (void *)MEMORY[0x263F087E8];
  uint64_t v133 = *MEMORY[0x263F08410];
  uint64_t v134 = v130;
  uint64_t v151 = *MEMORY[0x263F08320];
  memset(v150, 0, 20);
  __darwin_ct_rune_t v135 = bswap32(v130);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = v135;
  if ((v135 & 0x80) != 0) {
    int v136 = __maskrune((char)v135, 0x40000uLL);
  }
  else {
    int v136 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v135 + 60) & 0x40000;
  }
  if (v136
    && ((unsigned int v137 = (__int16)v135 >> 8, (v135 & 0x8000) != 0)
      ? (int v138 = __maskrune(v137, 0x40000uLL))
      : (int v138 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v137 + 60) & 0x40000),
        v138
     && (SHIBYTE(v150[0]) < 0
       ? (int v139 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
       : (int v139 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
         v139
      && (SLOBYTE(v150[1]) < 0
        ? (int v140 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
        : (int v140 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
          v140))))
  {
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
  }
  else
  {
    __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v131);
  }
  v141 = [NSString stringWithUTF8String:v150];
  v152[0] = v141;
  BOOL v94 = 1;
  v142 = [NSDictionary dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v143 = [v132 errorWithDomain:v133 code:v134 userInfo:v142];

  id v144 = v143;
  v17 = v144;
  if (v144)
  {
    if (a4) {
      *a4 = v144;
    }
    v110 = _MPCLogCategoryPlayback();
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
      goto LABEL_251;
    }
    id v145 = *a4;
    v150[0] = 138543618;
    *(void *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(void *)((char *)&v150[3] + 2) = v145;
    v112 = "[AP] - %{public}@ - Error setting TuningMode to 0: %{public}@";
    goto LABEL_250;
  }
LABEL_166:

  return v94;
}

- (BOOL)_createAudioUnit:(id *)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)&inDesc.componentType = *(_OWORD *)"xfuasiovlppa";
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  OSStatus v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = Next;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Found AudioComponent: %p", buf, 0x16u);
  }

  OSStatus v7 = AudioComponentInstanceNew(Next, &self->_processingAU);
  if (!v7)
  {
    unsigned int v14 = 0;
    BOOL v15 = 1;
    goto LABEL_28;
  }
  OSStatus v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08410];
  uint64_t v11 = v7;
  uint64_t v26 = *MEMORY[0x263F08320];
  memset(buf, 0, 20);
  unsigned int v12 = bswap32(v7);
  *(_DWORD *)&buf[1] = v12;
  uint64_t v13 = MEMORY[0x263EF8318];
  if ((v12 & 0x80) != 0)
  {
    if (!__maskrune((char)v12, 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v12 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  unsigned int v16 = (__int16)v12 >> 8;
  if ((v12 & 0x8000) != 0)
  {
    if (!__maskrune(v16, 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(v13 + 4 * v16 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  if ((char)buf[3] < 0)
  {
    if (!__maskrune((char)buf[3], 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(v13 + 4 * (char)buf[3] + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  if ((char)buf[4] < 0)
  {
    if (__maskrune((char)buf[4], 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v13 + 4 * (char)buf[4] + 60) & 0x40000) != 0)
  {
LABEL_19:
    strcpy((char *)&buf[5], "'");
    buf[0] = 39;
    goto LABEL_22;
  }
LABEL_21:
  __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v8);
LABEL_22:
  v17 = [NSString stringWithUTF8String:buf];
  v27[0] = v17;
  BOOL v15 = 1;
  id v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v19 = [v9 errorWithDomain:v10 code:v11 userInfo:v18];

  id v20 = v19;
  unsigned int v14 = v20;
  if (v20)
  {
    if (a3) {
      *a3 = v20;
    }
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = *a3;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error creating audio unit: %{public}@", buf, 0x16u);
    }

    BOOL v15 = 0;
  }
LABEL_28:

  return v15;
}

- (void)_prepareWithModel:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  OSStatus v7 = (void (**)(id, uint64_t, void *))a4;
  id v22 = 0;
  BOOL v8 = [(MPCVocalAttenuationProcessorImplementation *)self _createAudioUnit:&v22];
  id v9 = v22;
  id v10 = v9;
  if (!v8)
  {
    BOOL v15 = (void *)MEMORY[0x263F087E8];
    unsigned int v16 = @"Unable to create audio unit";
    uint64_t v17 = 201;
LABEL_10:
    id v19 = objc_msgSend(v15, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCSuntoryError", v17, v10, v16);
    v7[2](v7, 5, v19);

    goto LABEL_11;
  }
  id v21 = v9;
  BOOL v11 = [(MPCVocalAttenuationProcessorImplementation *)self _setupAudioUnitWithModel:v6 error:&v21];
  id v12 = v21;

  if (!v11)
  {
    id v18 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCSuntoryError", 202, v12, @"Unable to setup audio unit");
    v7[2](v7, 5, v18);

    id v10 = v12;
    goto LABEL_11;
  }
  id v20 = v12;
  BOOL v13 = [(MPCVocalAttenuationProcessorImplementation *)self _initializeAudioUnit:&v20];
  id v10 = v20;

  if (!v13)
  {
    BOOL v15 = (void *)MEMORY[0x263F087E8];
    unsigned int v16 = @"Unable to initialize audio unit";
    uint64_t v17 = 203;
    goto LABEL_10;
  }
  unsigned int v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    OSStatus v24 = self;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Audio Unit created", buf, 0xCu);
  }

  v7[2](v7, 2, 0);
LABEL_11:
}

- (BOOL)processAudioBuffer:(AudioBufferList *)a3 sampleIndex:(int64_t)a4 numberFrames:(unsigned int)a5 error:(id *)a6
{
  v82[1] = *MEMORY[0x263EF8340];
  if (![(MPCVocalAttenuationProcessorImplementation *)self isAvailable])
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCSuntoryError", 211, @"Attempting to process data while processor is unavailable");
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a6 = v29;
      return result;
    }
    return 0;
  }
  if (!self->_enabled) {
    return 0;
  }
  if (self->_maxFrames < a5 && self->_nextContiguousSampleIndex - self->_previousContiguousSampleIndex != a5)
  {
    BOOL v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t maxFrames = self->_maxFrames;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = maxFrames;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[AP] - Request to render %ld frames [more than expected max %ld frames]", buf, 0x16u);
    }
  }
  float mSampleTime = self->_timestamp.mSampleTime;
  float v14 = (float)a5;
  float v15 = mSampleTime / (float)a5;
  unsigned int v16 = [MEMORY[0x263F12178] standardUserDefaults];
  int v17 = [v16 vocalAttenuationLogInputAndOuputRMSValues];

  if (v17)
  {
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      Float64 v19 = self->_timestamp.mSampleTime;
      int64_t previousContiguousSampleIndex = self->_previousContiguousSampleIndex;
      int64_t nextContiguousSampleIndex = self->_nextContiguousSampleIndex;
      *(_DWORD *)buf = 134218752;
      *(Float64 *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      __int16 v78 = 2048;
      int64_t v79 = nextContiguousSampleIndex;
      __int16 v80 = 2048;
      int64_t v81 = previousContiguousSampleIndex;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - INPUT  - sampleTime: %f - sampleIndex: %lld - nextContiguous: %lld - previousContiguous: %lld", buf, 0x2Au);
    }

    uint64_t mNumberBuffers = a3->mNumberBuffers;
    if (mNumberBuffers)
    {
      uint64_t v23 = 0;
      float v24 = 0.0;
      do
      {
        mData = (float *)a3->mBuffers[v23].mData;
        if (mData) {
          BOOL v26 = a5 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          uint64_t v27 = a5;
          do
          {
            float v28 = *mData++;
            float v24 = v24 + (float)((float)(v28 * v28) / v14);
            --v27;
          }
          while (v27);
        }
        ++v23;
      }
      while (v23 != mNumberBuffers);
    }
    else
    {
      float v24 = 0.0;
    }
    id v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = sqrt(v24);
      _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - INPUT  - frame: %7.0f - rms: %15.10f", buf, 0x16u);
    }
  }
  if (a4 == -1 || self->_nextContiguousSampleIndex != a4 && self->_previousContiguousSampleIndex != a4)
  {
    uint64_t v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      Float64 v40 = self->_timestamp.mSampleTime;
      int64_t v42 = self->_previousContiguousSampleIndex;
      int64_t v41 = self->_nextContiguousSampleIndex;
      *(_DWORD *)buf = 134218752;
      *(Float64 *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      __int16 v78 = 2048;
      int64_t v79 = v41;
      __int16 v80 = 2048;
      int64_t v81 = v42;
      _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[AP] - Resetting audio unit for time discontinuity [no audio] - sampleTime: %f - sampleIndex: %lld - nextContiguous: %lld - previousContiguous: %lld", buf, 0x2Au);
    }

    if (v17)
    {
      id v43 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - RESET  - frame: %7.0f", buf, 0xCu);
      }
    }
    self->_timestamp.float mSampleTime = 0.0;
    int64_t v44 = a4 & ~(a4 >> 63);
    self->_int64_t previousContiguousSampleIndex = v44;
    self->_int64_t nextContiguousSampleIndex = v44 + a5;
    unint64_t v45 = a3->mNumberBuffers;
    if (v45)
    {
      unint64_t v46 = 0;
      uint64_t v47 = 16;
      do
      {
        v48 = *(float **)((char *)&a3->mNumberBuffers + v47);
        if (v48)
        {
          vDSP_vclr(v48, 1, a5);
          unint64_t v45 = a3->mNumberBuffers;
        }
        ++v46;
        v47 += 16;
      }
      while (v46 < v45);
    }
    OSStatus v49 = AudioUnitReset(self->_processingAU, 0, 0);
    if (!v49)
    {
      id v55 = 0;
LABEL_82:
      id v63 = v55;
      OSStatus v64 = v63;
      if (a6 && v63)
      {
        objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCSuntoryError", 213, v63, @"Audio unit reset failed");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_94;
    }
    OSStatus v50 = v49;
    int v51 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F08410];
    uint64_t v53 = v49;
    v82[0] = *MEMORY[0x263F08320];
    memset(buf, 0, 20);
    unsigned int v54 = bswap32(v49);
    *(_DWORD *)&buf[1] = v54;
    if ((v54 & 0x80) != 0)
    {
      if (!__maskrune((char)v54, 0x40000uLL)) {
        goto LABEL_80;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v54 + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    unsigned int v57 = (__int16)v54 >> 8;
    if ((v54 & 0x8000) != 0)
    {
      if (!__maskrune(v57, 0x40000uLL)) {
        goto LABEL_80;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v57 + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    if ((buf[3] & 0x80000000) != 0)
    {
      if (!__maskrune(buf[3], 0x40000uLL)) {
        goto LABEL_80;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * buf[3] + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    if ((buf[4] & 0x80000000) != 0) {
      int v59 = __maskrune(buf[4], 0x40000uLL);
    }
    else {
      int v59 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * buf[4] + 60) & 0x40000;
    }
    if (v59)
    {
      strcpy(&buf[5], "'");
      buf[0] = 39;
LABEL_81:
      v61 = [NSString stringWithUTF8String:buf];
      *(void *)buf = v61;
      id v62 = [NSDictionary dictionaryWithObjects:buf forKeys:v82 count:1];
      id v55 = [v51 errorWithDomain:v52 code:v53 userInfo:v62];

      goto LABEL_82;
    }
LABEL_80:
    __sprintf_chk(buf, 0, 0x14uLL, "%d", v50);
    goto LABEL_81;
  }
  if (a3->mNumberBuffers)
  {
    unint64_t v32 = 0;
    uint64_t v33 = 8;
    do
    {
      *(_OWORD *)((char *)&self->_ioBuffer->mNumberBuffers + v33) = *(_OWORD *)((char *)&a3->mNumberBuffers + v33);
      ++v32;
      v33 += 16;
    }
    while (v32 < a3->mNumberBuffers);
  }
  OSStatus v34 = AudioUnitRender(self->_processingAU, 0, &self->_timestamp, 0, a5, a3);
  if (!v34)
  {
    id v56 = 0;
    goto LABEL_90;
  }
  OSStatus v35 = v34;
  v76 = (void *)MEMORY[0x263F087E8];
  uint64_t v36 = *MEMORY[0x263F08410];
  uint64_t v37 = v34;
  v82[0] = *MEMORY[0x263F08320];
  memset(buf, 0, 20);
  *(_DWORD *)&buf[1] = bswap32(v34);
  uint64_t v38 = MEMORY[0x263EF8318];
  if ((buf[1] & 0x80) != 0)
  {
    if (!__maskrune(buf[1], 0x40000uLL)) {
      goto LABEL_88;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * buf[1] + 60) & 0x40000) == 0)
  {
    goto LABEL_88;
  }
  if ((buf[2] & 0x80000000) != 0)
  {
    if (__maskrune(buf[2], 0x40000uLL)) {
      goto LABEL_68;
    }
LABEL_88:
    __sprintf_chk(buf, 0, 0x14uLL, "%d", v35);
    goto LABEL_89;
  }
  if ((*(_DWORD *)(v38 + 4 * buf[2] + 60) & 0x40000) == 0) {
    goto LABEL_88;
  }
LABEL_68:
  if ((buf[3] & 0x80000000) != 0) {
    int v58 = __maskrune(buf[3], 0x40000uLL);
  }
  else {
    int v58 = *(_DWORD *)(v38 + 4 * buf[3] + 60) & 0x40000;
  }
  if (!v58) {
    goto LABEL_88;
  }
  if (!((buf[4] & 0x80000000) != 0 ? __maskrune(buf[4], 0x40000uLL) : *(_DWORD *)(v38 + 4 * buf[4] + 60) & 0x40000)) {
    goto LABEL_88;
  }
  strcpy(&buf[5], "'");
  buf[0] = 39;
LABEL_89:
  v65 = [NSString stringWithUTF8String:buf];
  *(void *)buf = v65;
  uint64_t v66 = [NSDictionary dictionaryWithObjects:buf forKeys:v82 count:1];
  id v56 = [v76 errorWithDomain:v36 code:v37 userInfo:v66];

LABEL_90:
  id v67 = v56;
  OSStatus v64 = v67;
  if (a6 && v67)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCSuntoryError", 210, v67, @"Data processing failure");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  self->_timestamp.float mSampleTime = self->_timestamp.mSampleTime + (double)a5;
  self->_int64_t previousContiguousSampleIndex = a4;
  self->_int64_t nextContiguousSampleIndex = a4 + a5;
LABEL_94:

  if (v17)
  {
    uint64_t v68 = a3->mNumberBuffers;
    if (v68)
    {
      uint64_t v69 = 0;
      float v70 = 0.0;
      do
      {
        v71 = (float *)a3->mBuffers[v69].mData;
        if (v71) {
          BOOL v72 = a5 == 0;
        }
        else {
          BOOL v72 = 1;
        }
        if (!v72)
        {
          uint64_t v73 = a5;
          do
          {
            float v74 = *v71++;
            float v70 = v70 + (float)((float)(v74 * v74) / v14);
            --v73;
          }
          while (v73);
        }
        ++v69;
      }
      while (v69 != v68);
    }
    else
    {
      float v70 = 0.0;
    }
    v75 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = sqrt(v70);
      _os_log_impl(&dword_21BB87000, v75, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - OUTPUT - frame: %7.0f - rms: %15.10f", buf, 0x16u);
    }
  }
  return 1;
}

- (BOOL)isCompatibleWithAudioFormat:(AudioStreamBasicDescription *)a3 maxFrames:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  OSStatus v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u", a3->mFormatID, *(void *)&a3->mSampleRate, a3->mBytesPerPacket, a3->mFramesPerPacket, a3->mBytesPerFrame, a3->mChannelsPerFrame, a3->mBitsPerChannel);
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u", self->_audioFormat.mFormatID, *(void *)&self->_audioFormat.mSampleRate, self->_audioFormat.mBytesPerPacket, self->_audioFormat.mFramesPerPacket, self->_audioFormat.mBytesPerFrame, self->_audioFormat.mChannelsPerFrame, self->_audioFormat.mBitsPerChannel);
    unsigned int maxFrames = self->_maxFrames;
    *(_DWORD *)buf = 138544386;
    float v15 = self;
    __int16 v16 = 2114;
    int v17 = v8;
    __int16 v18 = 2114;
    Float64 v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = a4;
    __int16 v22 = 1024;
    unsigned int v23 = maxFrames;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - isCompatibleWithAudioFormat - format: %{public}@ vs %{public}@ - frames: %u vs %u", buf, 0x2Cu);
  }
  BOOL result = 0;
  int v12 = ~vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32(vceqq_s32(*(int32x4_t *)&self->_audioFormat.mFormatID, *(int32x4_t *)&a3->mFormatID), 0x1FuLL)), (int8x16_t)xmmword_21BEF1680)) & 0xF;
  BOOL v13 = self->_audioFormat.mSampleRate == a3->mSampleRate && v12 == 0;
  if (v13
    && self->_audioFormat.mBytesPerFrame == a3->mBytesPerFrame
    && self->_audioFormat.mChannelsPerFrame == a3->mChannelsPerFrame
    && self->_audioFormat.mBitsPerChannel == a3->mBitsPerChannel)
  {
    return self->_maxFrames >= a4;
  }
  return result;
}

- (void)setLevel:(float)a3
{
  if ([(MPCVocalAttenuationProcessorImplementation *)self isAvailable])
  {
    float v5 = fminf(fmaxf(self->_minLevel, a3), self->_maxLevel);
    if (v5 != self->_level)
    {
      self->_double level = v5;
      [(MPCVocalAttenuationProcessorImplementation *)self _applyAttenuationLevelToAudioUnit];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPCVocalAttenuationProcessorImplementation *)self isAvailable] && self->_enabled != v3)
  {
    self->_enabled = v3;
    int64_t v5 = 3;
    if (!v3) {
      int64_t v5 = 4;
    }
    self->_state = v5;
    [(MPCVocalAttenuationProcessorImplementation *)self _applyAttenuationLevelToAudioUnit];
  }
}

- (void)tearDownWithCompletion:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(MPCVocalAttenuationProcessorImplementation *)self state];
  if (v6 <= 5)
  {
    if (((1 << v6) & 0x1C) != 0)
    {
      creationQueue = self->_creationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke;
      block[3] = &unk_2643C55A8;
      block[4] = self;
      id v12 = v5;
      dispatch_async(creationQueue, block);
    }
    else
    {
      BOOL v8 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v9 = [(MPCVocalAttenuationProcessorImplementation *)self state];
      if (v9 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v9);
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = off_2643C21F8[v9];
      }
    }
  }
}

void __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke(uint64_t a1)
{
  AudioUnitUninitialize(*(AudioUnit *)(*(void *)(a1 + 32) + 144));
  AudioComponentInstanceDispose(*(AudioComponentInstance *)(*(void *)(a1 + 32) + 144));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke_2;
  v3[3] = &unk_2643C55A8;
  unint64_t v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = 0;
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 176), 0);
}

- (void)prepareWithModel:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(MPCVocalAttenuationProcessorImplementation *)self state];
  if ((unint64_t)(v10 - 1) >= 5)
  {
    if (!v10)
    {
      objc_storeStrong((id *)&self->_model, a3);
      self->_state = 1;
      creationQueue = self->_creationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke;
      block[3] = &unk_2643C5620;
      block[4] = self;
      id v16 = v8;
      id v17 = v9;
      dispatch_async(creationQueue, block);
    }
  }
  else
  {
    BOOL v11 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v12 = [(MPCVocalAttenuationProcessorImplementation *)self state];
    if (v12 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v12);
      BOOL v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = off_2643C21F8[v12];
    }
  }
}

void __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_2;
  v3[3] = &unk_2643C21D8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _prepareWithModel:v2 completion:v3];
}

void __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_3;
  v8[3] = &unk_2643C21B0;
  unint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  uint64_t v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_3(void *a1)
{
  *(void *)(a1[4] + 176) = a1[7];
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 176), a1[5]);
}

@end
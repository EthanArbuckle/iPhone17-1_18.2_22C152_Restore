@interface MPCProcessAudioTap
- (BOOL)isEnabled;
- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 delegate:(id)a5;
- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 numberOfChannels:(unsigned int)a5 delegate:(id)a6;
- (MPCProcessAudioTap)initWithRefreshRate:(id)a3 delegate:(id)a4;
- (MPCProcessAudioTapDelegate)delegate;
- (unsigned)numberOfChannels;
- (unsigned)numberOfFrames;
- (unsigned)sampleRate;
- (void)_createProcessTapWithNumberOfFrames:(unsigned int)a3 sampleRate:(double)a4;
- (void)_destroyProcessTap;
- (void)dealloc;
- (void)mediaServerDidDie:(id)a3;
- (void)mediaServerDidRestart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNumberOfFrames:(unsigned int)a3;
- (void)setupNotifications;
- (void)start;
- (void)stop;
- (void)tearDownNotifications;
@end

@implementation MPCProcessAudioTap

uint64_t __72__MPCProcessAudioTap_initWithPID_refreshRate_numberOfChannels_delegate___block_invoke(uint64_t a1, double a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  LODWORD(a2) = v2[12];
  return [v2 _createProcessTapWithNumberOfFrames:v2[11] sampleRate:(double)*(unint64_t *)&a2];
}

- (unsigned)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)numberOfFrames
{
  return self->_numberOfFrames;
}

- (MPCProcessAudioTap)initWithRefreshRate:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MPCProcessAudioTap *)self initWithPID:getpid() refreshRate:v7 numberOfChannels:1 delegate:v6];

  return v8;
}

- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 numberOfChannels:(unsigned int)a5 delegate:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MPCProcessAudioTap;
  v12 = [(MPCProcessAudioTap *)&v28 init];
  v13 = v12;
  if (v12)
  {
    v12->_pid = a3;
    v12->_unsigned int sampleRate = 48000;
    v12->_numberOfChannels = a5;
    v12->_enabled = 1;
    if (v10)
    {
      unint64_t v14 = [v10 integerValue];
    }
    else
    {
      v16 = [MEMORY[0x263F12178] standardUserDefaults];
      unint64_t v14 = [v16 audioAnalysisRefreshRate];
    }
    LODWORD(v15) = v13->_sampleRate;
    double v17 = log2((double)v15 / (double)v14);
    unsigned int v18 = exp2(ceil(v17));
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int sampleRate = v13->_sampleRate;
      *(_DWORD *)buf = 134219520;
      v30 = v13;
      __int16 v31 = 2048;
      unint64_t v32 = v14;
      __int16 v33 = 2048;
      double v34 = (float)((float)sampleRate / (float)v18);
      __int16 v35 = 1024;
      unsigned int v36 = v18;
      __int16 v37 = 1024;
      unsigned int v38 = sampleRate;
      __int16 v39 = 2048;
      double v40 = (float)((float)((float)v18 / (float)sampleRate) * 1000.0);
      __int16 v41 = 2048;
      double v42 = v34;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Desired refresh rate for process tap: %luHz - Actual refresh rate: %3.1fHz [%u samples @ %uHz] - FFT Info: dt=%3.1fms df=%3.1fHz", buf, 0x40u);
    }

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.mediaplaybackcore.audiotap", 0);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v21;

    v13->_numberOfFrames = v18;
    objc_storeWeak((id *)&v13->_delegate, v11);
    v23 = v13->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__MPCProcessAudioTap_initWithPID_refreshRate_numberOfChannels_delegate___block_invoke;
    block[3] = &unk_2643C5FC8;
    v24 = v13;
    v27 = v24;
    dispatch_async(v23, block);
    [(MPCProcessAudioTap *)v24 setupNotifications];
  }
  return v13;
}

- (void)setupNotifications
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_mediaServerDidDie_ name:*MEMORY[0x263EF90E8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_mediaServerDidRestart_ name:*MEMORY[0x263EF90F8] object:0];
}

- (void)_createProcessTapWithNumberOfFrames:(unsigned int)a3 sampleRate:(double)a4
{
  v69[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v7 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:self->_numberOfChannels channels:1 interleaved:a4];
  uint64_t v8 = [v7 streamDescription];
  uint64_t v9 = *(void *)(v8 + 32);
  long long v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)&inFormat.mSampleRate = *(_OWORD *)v8;
  *(_OWORD *)&inFormat.mBytesPerPacket = v10;
  *(void *)&inFormat.mBitsPerChannel = v9;
  id v11 = (void *)[objc_alloc(MEMORY[0x263EFC0A0]) initProcessTapWithFormat:v7 PID:self->_pid];
  self->_processingQueue = 0;
  p_processingQueue = &self->_processingQueue;
  OSStatus v13 = AudioQueueNewInput(&inFormat, (AudioQueueInputCallback)_MPCHandleProcessTapBuffer, self, 0, 0, 0x800u, &self->_processingQueue);
  if (!v13)
  {
    id v19 = 0;
    goto LABEL_21;
  }
  OSStatus v14 = v13;
  unint64_t v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F08410];
  uint64_t v17 = v13;
  v69[0] = *MEMORY[0x263F08320];
  memset(v67, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(v13);
  uint64_t v18 = MEMORY[0x263EF8318];
  if ((v67[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SBYTE2(v67[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v18 + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v67[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v18 + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v67[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v67[1]), 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_19:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v14);
    goto LABEL_20;
  }
  if ((*(_DWORD *)(v18 + 4 * SLOBYTE(v67[1]) + 60) & 0x40000) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  strcpy((char *)&v67[1] + 1, "'");
  LOBYTE(v67[0]) = 39;
LABEL_20:
  v20 = [NSString stringWithUTF8String:v67];
  *(void *)v67 = v20;
  dispatch_queue_t v21 = [NSDictionary dictionaryWithObjects:v67 forKeys:v69 count:1];
  id v19 = [v15 errorWithDomain:v16 code:v17 userInfo:v21];

LABEL_21:
  id v22 = v19;
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u", inFormat.mFormatID, *(void *)&inFormat.mSampleRate, inFormat.mBytesPerPacket, inFormat.mFramesPerPacket, inFormat.mBytesPerFrame, inFormat.mChannelsPerFrame, inFormat.mBitsPerChannel);
      v67[0] = 134218242;
      *(void *)&v67[1] = self;
      LOWORD(v67[3]) = 2114;
      *(void *)((char *)&v67[3] + 2) = v25;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - ASBD for process tap: %{public}@", (uint8_t *)v67, 0x16u);
    }
    v26 = (const void *)[objc_alloc(MEMORY[0x263EFC098]) initWithTapDescription:v11];
    OSStatus v27 = AudioQueueSetProperty(*p_processingQueue, 0x71746F62u, v26, 8u);
    v65 = (void *)v26;
    if (!v27) {
      goto LABEL_49;
    }
    OSStatus v28 = v27;
    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08410];
    uint64_t v31 = v27;
    uint64_t v68 = *MEMORY[0x263F08320];
    memset(v67, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(v27);
    if ((v67[0] & 0x8000) != 0)
    {
      if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SBYTE2(v67[0]) < 0)
    {
      if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SHIBYTE(v67[0]) < 0)
    {
      if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SLOBYTE(v67[1]) < 0)
    {
      if (__maskrune(SLOBYTE(v67[1]), 0x40000uLL)) {
        goto LABEL_43;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000) != 0)
    {
LABEL_43:
      strcpy((char *)&v67[1] + 1, "'");
      LOBYTE(v67[0]) = 39;
      goto LABEL_46;
    }
LABEL_45:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v28);
LABEL_46:
    unint64_t v32 = [NSString stringWithUTF8String:v67];
    v69[0] = v32;
    __int16 v33 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v34 = [v29 errorWithDomain:v30 code:v31 userInfo:v33];

    id v35 = v34;
    if (v35)
    {
      id v22 = v35;
      unsigned int v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(void *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(void *)((char *)&v67[3] + 2) = v22;
        __int16 v37 = "[AP] - MPCProcessAudioTap %p - Error adding processing tap to audio queue: %{public}@";
LABEL_95:
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_ERROR, v37, (uint8_t *)v67, 0x16u);
        goto LABEL_96;
      }
      goto LABEL_96;
    }
LABEL_49:
    OSStatus Buffer = AudioQueueAllocateBuffer(self->_processingQueue, *(_DWORD *)([v7 streamDescription] + 20)* a3* *(_DWORD *)(objc_msgSend(v7, "streamDescription") + 24), &self->_monoAudioBuffer);
    if (!Buffer) {
      goto LABEL_72;
    }
    OSStatus v39 = Buffer;
    double v40 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08410];
    uint64_t v42 = Buffer;
    uint64_t v68 = *MEMORY[0x263F08320];
    memset(v67, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(Buffer);
    if ((v67[0] & 0x8000) != 0)
    {
      if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL)) {
        goto LABEL_68;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SBYTE2(v67[0]) < 0)
    {
      if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL)) {
        goto LABEL_68;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SHIBYTE(v67[0]) < 0)
    {
      if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL)) {
        goto LABEL_68;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SLOBYTE(v67[1]) < 0) {
      int v43 = __maskrune(SLOBYTE(v67[1]), 0x40000uLL);
    }
    else {
      int v43 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000;
    }
    if (v43)
    {
      strcpy((char *)&v67[1] + 1, "'");
      LOBYTE(v67[0]) = 39;
      goto LABEL_69;
    }
LABEL_68:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v39);
LABEL_69:
    v44 = [NSString stringWithUTF8String:v67];
    v69[0] = v44;
    v45 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v46 = [v40 errorWithDomain:v41 code:v42 userInfo:v45];

    id v47 = v46;
    if (v47)
    {
      id v22 = v47;
      unsigned int v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(void *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(void *)((char *)&v67[3] + 2) = v22;
        __int16 v37 = "[AP] - MPCProcessAudioTap %p - Error allocating buffer for audio queue: %{public}@";
        goto LABEL_95;
      }
LABEL_96:

      [(MPCProcessAudioTap *)self _destroyProcessTap];
      v61 = v65;
LABEL_101:

      goto LABEL_102;
    }
LABEL_72:
    OSStatus v48 = AudioQueueEnqueueBuffer(*p_processingQueue, self->_monoAudioBuffer, 0, 0);
    if (!v48) {
      goto LABEL_97;
    }
    OSStatus v49 = v48;
    v50 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08410];
    uint64_t v52 = v48;
    uint64_t v68 = *MEMORY[0x263F08320];
    memset(v67, 0, 20);
    __darwin_ct_rune_t v53 = bswap32(v48);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = v53;
    if ((v53 & 0x80) != 0)
    {
      if (!__maskrune((char)v53, 0x40000uLL)) {
        goto LABEL_91;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v53 + 60) & 0x40000) == 0)
    {
      goto LABEL_91;
    }
    unsigned int v54 = (__int16)v53 >> 8;
    if ((v53 & 0x8000) != 0)
    {
      if (!__maskrune(v54, 0x40000uLL)) {
        goto LABEL_91;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v54 + 60) & 0x40000) == 0)
    {
      goto LABEL_91;
    }
    if (SHIBYTE(v67[0]) < 0) {
      int v55 = __maskrune(SHIBYTE(v67[0]), 0x40000uLL);
    }
    else {
      int v55 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000;
    }
    if (v55)
    {
      if (SLOBYTE(v67[1]) < 0
         ? __maskrune(SLOBYTE(v67[1]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000)
      {
        strcpy((char *)&v67[1] + 1, "'");
        LOBYTE(v67[0]) = 39;
        goto LABEL_92;
      }
    }
LABEL_91:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v49);
LABEL_92:
    v57 = [NSString stringWithUTF8String:v67];
    v69[0] = v57;
    v58 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v59 = [v50 errorWithDomain:v51 code:v52 userInfo:v58];

    id v60 = v59;
    if (v60)
    {
      id v22 = v60;
      unsigned int v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(void *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(void *)((char *)&v67[3] + 2) = v22;
        __int16 v37 = "[AP] - MPCProcessAudioTap %p - Error Enqueuing buffer for audio queue: %{public}@";
        goto LABEL_95;
      }
      goto LABEL_96;
    }
LABEL_97:
    v62 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
    os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
    if (_activeTaps)
    {
      [(id)_activeTaps addObject:v62];
    }
    else
    {
      uint64_t v63 = [MEMORY[0x263EFF9C0] setWithObject:v62];
      v64 = (void *)_activeTaps;
      _activeTaps = v63;
    }
    v61 = v65;
    os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

    id v22 = 0;
    self->_enabled = 1;
    goto LABEL_101;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v67[0] = 134218242;
    *(void *)&v67[1] = self;
    LOWORD(v67[3]) = 2114;
    *(void *)((char *)&v67[3] + 2) = v22;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Error creating new audio queue for processing: %{public}@", (uint8_t *)v67, 0x16u);
  }

  [(MPCProcessAudioTap *)self _destroyProcessTap];
LABEL_102:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (MPCProcessAudioTapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCProcessAudioTapDelegate *)WeakRetained;
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setNumberOfFrames:(unsigned int)a3
{
  self->_numberOfFrames = a3;
}

- (void)mediaServerDidRestart:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - mediaserverd restarted - creating AQ", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__MPCProcessAudioTap_mediaServerDidRestart___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __44__MPCProcessAudioTap_mediaServerDidRestart___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 numberOfFrames];
  double v4 = (double)[*(id *)(a1 + 32) sampleRate];

  return [v2 _createProcessTapWithNumberOfFrames:v3 sampleRate:v4];
}

- (void)mediaServerDidDie:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - mediaserverd died - clearing AQ", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MPCProcessAudioTap_mediaServerDidDie___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __40__MPCProcessAudioTap_mediaServerDidDie___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  OSStatus v2 = AudioQueueStop(*(AudioQueueRef *)(*(void *)(a1 + 32) + 8), 1u);
  if (!v2)
  {
    id v8 = 0;
    goto LABEL_21;
  }
  OSStatus v3 = v2;
  double v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08410];
  uint64_t v6 = v2;
  v21[0] = *MEMORY[0x263F08320];
  memset(buf, 0, 20);
  int v7 = bswap32(v2);
  *(_DWORD *)&buf[1] = v7;
  if ((v7 & 0x80) != 0)
  {
    if (!__maskrune((char)v7, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v7 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v9 = (__int16)v7 >> 8;
  if ((v7 & 0x8000) != 0)
  {
    if (!__maskrune(v9, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v10 = v7 << 8 >> 24;
  if ((v7 & 0x800000) != 0)
  {
    if (!__maskrune(v10, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v10 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v11 = v7 >> 24;
  if (v7 < 0)
  {
    if (__maskrune(v11, 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_19:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v3);
    goto LABEL_20;
  }
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x40000) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  strcpy((char *)&buf[5], "'");
  buf[0] = 39;
LABEL_20:
  v12 = [NSString stringWithUTF8String:buf];
  *(void *)buf = v12;
  OSStatus v13 = [NSDictionary dictionaryWithObjects:buf forKeys:v21 count:1];
  id v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v13];

LABEL_21:
  id v14 = v8;
  unint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = objc_msgSend(v14, "msv_description");
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue [mediaserverd death] error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue [mediaserverd death]", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _destroyProcessTap];
}

- (void)tearDownNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_destroyProcessTap
{
  v34[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
  [(id)_activeTaps removeObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

  self->_enabled = 0;
  monoAudioOSStatus Buffer = self->_monoAudioBuffer;
  if (monoAudioBuffer)
  {
    OSStatus v5 = AudioQueueFreeBuffer(self->_processingQueue, monoAudioBuffer);
    if (!v5)
    {
      id v11 = 0;
LABEL_25:
      self->_monoAudioOSStatus Buffer = 0;

      goto LABEL_26;
    }
    OSStatus v6 = v5;
    int v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08410];
    uint64_t v9 = v5;
    uint64_t v33 = *MEMORY[0x263F08320];
    memset(buf, 0, 20);
    int v10 = bswap32(v5);
    *(_DWORD *)&buf[1] = v10;
    if ((v10 & 0x80) != 0)
    {
      if (!__maskrune((char)v10, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v10 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v12 = (__int16)v10 >> 8;
    if ((v10 & 0x8000) != 0)
    {
      if (!__maskrune(v12, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v13 = v10 << 8 >> 24;
    if ((v10 & 0x800000) != 0)
    {
      if (!__maskrune(v13, 0x40000uLL)) {
        goto LABEL_20;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    unsigned int v14 = v10 >> 24;
    if (v10 < 0)
    {
      if (__maskrune(v14, 0x40000uLL)) {
        goto LABEL_18;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v14 + 60) & 0x40000) != 0)
    {
LABEL_18:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
      goto LABEL_21;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v6);
LABEL_21:
    unint64_t v15 = [NSString stringWithUTF8String:buf];
    v34[0] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v17 = [v7 errorWithDomain:v8 code:v9 userInfo:v16];

    id v11 = v17;
    if (v11)
    {
      uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "MPCProcessAudioTap %p - Audio tap - Error freeing AQ buffer: %{public}@", buf, 0x16u);
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  processingQueue = self->_processingQueue;
  if (!processingQueue) {
    return;
  }
  OSStatus v20 = AudioQueueDispose(processingQueue, 0);
  if (v20)
  {
    OSStatus v21 = v20;
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08410];
    uint64_t v24 = v20;
    uint64_t v33 = *MEMORY[0x263F08320];
    memset(buf, 0, 20);
    unsigned int v25 = bswap32(v20);
    *(_DWORD *)&buf[1] = v25;
    if ((v25 & 0x80) != 0)
    {
      if (!__maskrune((char)v25, 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v25 + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    unsigned int v27 = (__int16)v25 >> 8;
    if ((v25 & 0x8000) != 0)
    {
      if (!__maskrune(v27, 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v27 + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if ((char)buf[3] < 0)
    {
      if (!__maskrune((char)buf[3], 0x40000uLL)) {
        goto LABEL_45;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)buf[3] + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if ((char)buf[4] < 0)
    {
      if (__maskrune((char)buf[4], 0x40000uLL)) {
        goto LABEL_43;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)buf[4] + 60) & 0x40000) != 0)
    {
LABEL_43:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
      goto LABEL_46;
    }
LABEL_45:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v21);
LABEL_46:
    OSStatus v28 = [NSString stringWithUTF8String:buf];
    v34[0] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v30 = [v22 errorWithDomain:v23 code:v24 userInfo:v29];

    id v26 = v30;
    if (v26)
    {
      uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, "MPCProcessAudioTap %p - Audio tap - Error disposing of processing audio queue: %{public}@", buf, 0x16u);
      }
    }
    goto LABEL_50;
  }
  id v26 = 0;
LABEL_50:
  self->_processingQueue = 0;
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  OSStatus v6 = __29__MPCProcessAudioTap_dealloc__block_invoke;
  int v7 = &unk_2643C5FC8;
  uint64_t v8 = self;
  msv_dispatch_sync_on_queue();
  v3.receiver = self;
  v3.super_class = (Class)MPCProcessAudioTap;
  [(MPCProcessAudioTap *)&v3 dealloc];
}

OpaqueAudioQueue *__29__MPCProcessAudioTap_dealloc__block_invoke(uint64_t a1)
{
  result = *(OpaqueAudioQueue **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    AudioQueueStop(result, 1u);
    objc_super v3 = *(void **)(a1 + 32);
    return (OpaqueAudioQueue *)[v3 _destroyProcessTap];
  }
  return result;
}

- (void)stop
{
  [(MPCProcessAudioTap *)self setEnabled:0];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__MPCProcessAudioTap_stop__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __26__MPCProcessAudioTap_stop__block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  OSStatus v2 = *(OpaqueAudioQueue **)(*(void *)(a1 + 32) + 8);
  if (!v2) {
    return;
  }
  OSStatus v3 = AudioQueueStop(v2, 1u);
  if (v3)
  {
    OSStatus v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
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
      unsigned int v13 = [NSString stringWithUTF8String:buf];
      *(void *)buf = v13;
      unsigned int v14 = [NSDictionary dictionaryWithObjects:buf forKeys:v23 count:1];
      id v9 = [v5 errorWithDomain:v6 code:v7 userInfo:v14];

      goto LABEL_22;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v4);
    goto LABEL_21;
  }
  id v9 = 0;
LABEL_22:
  id v15 = v9;
  uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = objc_msgSend(v15, "msv_description");
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v20;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _destroyProcessTap];
  OSStatus v21 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v21 processAudioTapDidStop];
  }
}

- (void)start
{
  [(MPCProcessAudioTap *)self setEnabled:1];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__MPCProcessAudioTap_start__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __27__MPCProcessAudioTap_start__block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  OSStatus v2 = *(void **)(a1 + 32);
  OSStatus v3 = (OpaqueAudioQueue *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_createProcessTapWithNumberOfFrames:sampleRate:", objc_msgSend(v2, "numberOfFrames"), (double)objc_msgSend(*(id *)(a1 + 32), "sampleRate"));
    OSStatus v3 = *(OpaqueAudioQueue **)(*(void *)(a1 + 32) + 8);
  }
  OSStatus v4 = AudioQueueStart(v3, 0);
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_23;
  }
  OSStatus v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08410];
  uint64_t v8 = v4;
  v23[0] = *MEMORY[0x263F08320];
  memset(buf, 0, 20);
  int v9 = bswap32(v4);
  *(_DWORD *)&buf[1] = v9;
  if ((v9 & 0x80) != 0)
  {
    if (!__maskrune((char)v9, 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  unsigned int v11 = (__int16)v9 >> 8;
  if ((v9 & 0x8000) != 0)
  {
    if (!__maskrune(v11, 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  unsigned int v12 = v9 << 8 >> 24;
  if ((v9 & 0x800000) != 0)
  {
    if (!__maskrune(v12, 0x40000uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  unsigned int v13 = v9 >> 24;
  if (v9 < 0)
  {
    if (__maskrune(v13, 0x40000uLL)) {
      goto LABEL_19;
    }
LABEL_21:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v5);
    goto LABEL_22;
  }
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x40000) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  strcpy((char *)&buf[5], "'");
  buf[0] = 39;
LABEL_22:
  unsigned int v14 = [NSString stringWithUTF8String:buf];
  *(void *)buf = v14;
  id v15 = [NSDictionary dictionaryWithObjects:buf forKeys:v23 count:1];
  id v10 = [v6 errorWithDomain:v7 code:v8 userInfo:v15];

LABEL_23:
  id v16 = v10;
  id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = objc_msgSend(v16, "msv_description");
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Starting processing audio queue error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Starting processing audio queue", buf, 0xCu);
  }
}

- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 delegate:(id)a5
{
  return [(MPCProcessAudioTap *)self initWithPID:*(void *)&a3 refreshRate:a4 numberOfChannels:1 delegate:a5];
}

@end
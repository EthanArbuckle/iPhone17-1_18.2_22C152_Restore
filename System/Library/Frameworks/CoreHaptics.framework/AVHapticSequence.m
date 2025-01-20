@interface AVHapticSequence
- (AVHapticPlayer)player;
- (AVHapticSequence)init;
- (AVHapticSequence)initWithData:(id)a3 player:(id)a4 error:(id *)a5;
- (AVHapticSequence)initWithDictionary:(id)a3 player:(id)a4 error:(id *)a5;
- (AVHapticSequence)initWithEvents:(id)a3 player:(id)a4 error:(id *)a5;
- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)cancelAndReturnError:(id *)a3;
- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4;
- (BOOL)isMuted;
- (BOOL)loopingEnabled;
- (BOOL)pauseAtTime:(double)a3 error:(id *)a4;
- (BOOL)playAtTime:(double)a3 offset:(double)a4 error:(id *)a5;
- (BOOL)prepareToPlayAndReturnError:(id *)a3;
- (BOOL)resetAtTime:(double)a3 error:(id *)a4;
- (BOOL)resumeAtTime:(double)a3 error:(id *)a4;
- (BOOL)seekToTime:(double)a3 error:(id *)a4;
- (BOOL)setLoopLength:(float)a3 error:(id *)a4;
- (BOOL)setLoopingEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 channel:(unint64_t)a5 atTime:(double)a6 error:(id *)a7;
- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)stopAtTime:(double)a3 error:(id *)a4;
- (double)duration;
- (double)lastStartTime;
- (float)playbackRate;
- (id)completionHandler;
- (unint64_t)activeChannel;
- (unint64_t)channelCount;
- (unint64_t)eventBehavior;
- (unint64_t)getChannelCount;
- (unint64_t)seqID;
- (void)dealloc;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEventBehavior:(unint64_t)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setLastStartTime:(double)a3;
- (void)setLoopingEnabled:(BOOL)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlayer:(id)a3;
- (void)setSeqID:(unint64_t)a3;
@end

@implementation AVHapticSequence

- (AVHapticSequence)init
{
  return 0;
}

- (AVHapticSequence)initWithData:(id)a3 player:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 856;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticSequence initWithData:player:error:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v8;
    *(_WORD *)&buf[38] = 2048;
    id v30 = v9;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with data %p, player %p", buf, 0x30u);
  }

LABEL_8:
  v28.receiver = self;
  v28.super_class = (Class)AVHapticSequence;
  v12 = [(AVHapticSequence *)&v28 init];
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      [(AVHapticSequence *)v12 setPlayer:v9];
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0xFFFFFFFFLL;
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      uint64_t v23 = 0;
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2020000000;
      uint64_t v19 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__4;
      *(void *)&buf[32] = __Block_byref_object_dispose__4;
      id v30 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__AVHapticSequence_initWithData_player_error___block_invoke;
      v15[3] = &unk_1E622E338;
      v15[4] = &v24;
      v15[5] = &v20;
      v15[6] = &v16;
      v15[7] = buf;
      if ([v9 loadAndPrepareHapticSequenceFromData:v8 reply:v15])
      {
        [(AVHapticSequence *)v13 setSeqID:v25[3]];
        [(AVHapticSequence *)v13 setLastStartTime:-1.0];
        *(_WORD *)&v13->_loopIsEnabled = 0;
        v13->_playbackRate = 1.0;
        *(void *)&v13->_duration = v21[3];
        v13->_channelCount = v17[3];
        v13->_activeChannel = 0;
        if (!a5) {
          goto LABEL_18;
        }
      }
      else
      {

        v13 = 0;
        if (!a5)
        {
LABEL_18:
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v16, 8);
          _Block_object_dispose(&v20, 8);
          _Block_object_dispose(&v24, 8);
          goto LABEL_19;
        }
      }
      *a5 = *(id *)(*(void *)&buf[8] + 40);
      goto LABEL_18;
    }
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    }

    v13 = 0;
  }
LABEL_19:

  return v13;
}

void __46__AVHapticSequence_initWithData_player_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136316418;
    v15 = "AVHapticPlayer.mm";
    __int16 v16 = 1024;
    int v17 = 874;
    __int16 v18 = 2080;
    uint64_t v19 = "-[AVHapticSequence initWithData:player:error:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = a2;
    __int16 v22 = 1024;
    int v23 = a3;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithData: reply block for hapticPlayer loadAndPrepareHapticSequenceFromData: replyID: %u, replyChannelCount: %u, replyError: %@", (uint8_t *)&v14, 0x32u);
  }

LABEL_8:
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(void *)(a1[5] + 8) + 24) = a5;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v12 = *(void *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
}

- (AVHapticSequence)initWithEvents:(id)a3 player:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 903;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticSequence initWithEvents:player:error:]";
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with event array", buf, 0x1Cu);
  }

LABEL_8:
  v28.receiver = self;
  v28.super_class = (Class)AVHapticSequence;
  uint64_t v12 = [(AVHapticSequence *)&v28 init];
  v13 = v12;
  if (v12)
  {
    [(AVHapticSequence *)v12 setPlayer:v9];
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0xFFFFFFFFLL;
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__4;
    id v30 = __Block_byref_object_dispose__4;
    id v31 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__AVHapticSequence_initWithEvents_player_error___block_invoke;
    v15[3] = &unk_1E622E338;
    v15[4] = &v24;
    v15[5] = &v20;
    v15[6] = &v16;
    v15[7] = buf;
    if ([v9 loadAndPrepareHapticSequenceFromEvents:v8 reply:v15])
    {
      [(AVHapticSequence *)v13 setSeqID:v25[3]];
      [(AVHapticSequence *)v13 setLastStartTime:-1.0];
      *(_WORD *)&v13->_loopIsEnabled = 0;
      v13->_playbackRate = 1.0;
      *(void *)&v13->_duration = v21[3];
      v13->_channelCount = v17[3];
      v13->_activeChannel = 0;
      if (!a5) {
        goto LABEL_14;
      }
    }
    else
    {

      v13 = 0;
      if (!a5)
      {
LABEL_14:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v24, 8);
        goto LABEL_15;
      }
    }
    *a5 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

void __48__AVHapticSequence_initWithEvents_player_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136316418;
    v15 = "AVHapticPlayer.mm";
    __int16 v16 = 1024;
    int v17 = 916;
    __int16 v18 = 2080;
    uint64_t v19 = "-[AVHapticSequence initWithEvents:player:error:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = a2;
    __int16 v22 = 1024;
    int v23 = a3;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithEvents: reply block for hapticPlayer loadAndPrepareHapticSequenceFromEvents: replyID: %u, replyChannelCount: %u, replyError: %@", (uint8_t *)&v14, 0x32u);
  }

LABEL_8:
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(void *)(a1[5] + 8) + 24) = a5;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v12 = *(void *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
}

- (AVHapticSequence)initWithDictionary:(id)a3 player:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 945;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticSequence initWithDictionary:player:error:]";
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with dictionary", buf, 0x1Cu);
  }

LABEL_8:
  v20.receiver = self;
  v20.super_class = (Class)AVHapticSequence;
  uint64_t v12 = [(AVHapticSequence *)&v20 init];
  v13 = v12;
  if (v12)
  {
    [(AVHapticSequence *)v12 setPlayer:v9];
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0xFFFFFFFFLL;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__4;
    __int16 v22 = __Block_byref_object_dispose__4;
    id v23 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__AVHapticSequence_initWithDictionary_player_error___block_invoke;
    v15[3] = &unk_1E622E2C0;
    v15[4] = &v16;
    v15[5] = buf;
    if ([v9 loadAndPrepareHapticSequenceFromVibePattern:v8 reply:v15])
    {
      [(AVHapticSequence *)v13 setSeqID:v17[3]];
      [(AVHapticSequence *)v13 setLastStartTime:-1.0];
      *(_WORD *)&v13->_loopIsEnabled = 0;
      v13->_playbackRate = 1.0;
      v13->_duration = 5.0;
      *(_OWORD *)&v13->_channelCount = xmmword_1BA95A4D0;
      if (!a5) {
        goto LABEL_14;
      }
    }
    else
    {

      v13 = 0;
      if (!a5)
      {
LABEL_14:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v16, 8);
        goto LABEL_15;
      }
    }
    *a5 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

void __52__AVHapticSequence_initWithDictionary_player_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136316162;
    id v11 = "AVHapticPlayer.mm";
    __int16 v12 = 1024;
    int v13 = 956;
    __int16 v14 = 2080;
    v15 = "-[AVHapticSequence initWithDictionary:player:error:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithDictionary: reply block for hapticPlayer loadAndPrepareHapticSequenceFromVibePattern: replyID: %u, replyError: %@", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_8:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  id v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(AVHapticSequence *)self player];
    id v7 = [v6 client];
    *(_DWORD *)buf = 136316162;
    __int16 v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 982;
    __int16 v17 = 2080;
    __int16 v18 = "-[AVHapticSequence dealloc]";
    __int16 v19 = 2048;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    uint64_t v22 = [v7 clientID];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc seq %p, clientID: 0x%lx", buf, 0x30u);
  }
LABEL_8:
  if (self->_loopIsEnabled)
  {
    if (kAVHCScope)
    {
      uint64_t v8 = *(id *)kAVHCScope;
      if (!v8)
      {
LABEL_16:
        int v10 = [(AVHapticSequence *)self player];
        [v10 enableSequenceLooping:self->_seqID enable:0 error:0];

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "AVHapticPlayer.mm";
      __int16 v15 = 1024;
      int v16 = 984;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVHapticSequence dealloc]";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Destroying a sequence that is still looping!  Disabling loop.", buf, 0x1Cu);
    }

    goto LABEL_16;
  }
LABEL_17:
  id v11 = [(AVHapticSequence *)self player];
  [v11 detachHapticSequence:self->_seqID];

  self->_seqID = -1;
  v12.receiver = self;
  v12.super_class = (Class)AVHapticSequence;
  [(AVHapticSequence *)&v12 dealloc];
}

- (unint64_t)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(AVHapticSequence *)self player];
    id v9 = [v8 client];
    int v17 = 136316418;
    __int16 v18 = "AVHapticPlayer.mm";
    __int16 v19 = 1024;
    int v20 = 999;
    __int16 v21 = 2080;
    uint64_t v22 = "-[AVHapticSequence setEventBehavior:]";
    __int16 v23 = 2048;
    uint64_t v24 = [v9 clientID];
    __int16 v25 = 1024;
    int v26 = [(AVHapticSequence *)self seqID];
    __int16 v27 = 1024;
    int v28 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx seqID: %u behavior: %u", (uint8_t *)&v17, 0x32u);
  }
LABEL_8:
  if (self->_eventBehavior == a3) {
    return;
  }
  if (a3 > 7)
  {
    if (kAVHCScope)
    {
      __int16 v15 = *(id *)kAVHCScope;
      if (!v15) {
        return;
      }
    }
    else
    {
      __int16 v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      __int16 v18 = "AVHapticPlayer.mm";
      __int16 v19 = 1024;
      int v20 = 1002;
      __int16 v21 = 2080;
      uint64_t v22 = "-[AVHapticSequence setEventBehavior:]";
      __int16 v23 = 1024;
      LODWORD(v24) = a3;
      _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal event behavior: %u", (uint8_t *)&v17, 0x22u);
    }
  }
  else
  {
    if (![(AVHapticSequence *)self channelCount]) {
      goto LABEL_14;
    }
    unint64_t v10 = 0;
    char v11 = 1;
    do
    {
      objc_super v12 = [(AVHapticSequence *)self player];
      int v13 = [v12 client];
      char v14 = objc_msgSend(v13, "setSequenceEventBehavior:behavior:channel:", -[AVHapticSequence seqID](self, "seqID"), a3, v10);

      v11 &= v14;
      ++v10;
    }
    while (v10 < [(AVHapticSequence *)self channelCount]);
    if (v11) {
LABEL_14:
    }
      self->_eventBehavior = a3;
  }
}

- (BOOL)setLoopingEnabled:(BOOL)a3 error:(id *)a4
{
  if (self->_seqID == -1)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 1020, "-[AVHapticSequence setLoopingEnabled:error:]", "_seqID != kInvalidSequenceID", -4812, a4);
  }
  else
  {
    BOOL v5 = a3;
    id v7 = [(AVHapticSequence *)self player];
    int v8 = [v7 enableSequenceLooping:self->_seqID enable:v5 error:a4];

    if (v8)
    {
      self->_loopIsEnabled = v5;
      return 1;
    }
  }
  return 0;
}

- (void)setCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(AVHapticSequence *)self player];
  BOOL v5 = [v4 client];
  [v5 setSequenceFinishedHandlerForID:self->_seqID finishedHandler:v6];
}

- (id)completionHandler
{
  id v3 = [(AVHapticSequence *)self player];
  id v4 = [v3 client];
  BOOL v5 = [v4 getSequenceFinishedHandlerForID:self->_seqID];

  return v5;
}

- (unint64_t)getChannelCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t channelCount = v2->_channelCount;
  objc_sync_exit(v2);

  return channelCount;
}

- (BOOL)loopingEnabled
{
  return self->_loopIsEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
}

- (BOOL)setLoopLength:(float)a3 error:(id *)a4
{
  id v7 = [(AVHapticSequence *)self player];
  *(float *)&double v8 = a3;
  int v9 = [v7 setSequenceLoopLength:self->_seqID length:a4 error:v8];

  if (v9) {
    self->_loopLength = a3;
  }
  return v9;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  BOOL v5 = [(AVHapticSequence *)self player];
  *(float *)&double v6 = a3;
  int v7 = [v5 setSequencePlaybackRate:self->_seqID rate:0 error:v6];

  if (v7) {
    self->_playbackRate = a3;
  }
}

- (BOOL)prepareToPlayAndReturnError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  int v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [(AVHapticSequence *)v4 player];
    int v9 = [v8 client];
    int v22 = 136315906;
    __int16 v23 = "AVHapticPlayer.mm";
    __int16 v24 = 1024;
    int v25 = 1077;
    __int16 v26 = 2080;
    __int16 v27 = "-[AVHapticSequence prepareToPlayAndReturnError:]";
    __int16 v28 = 2048;
    uint64_t v29 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: prepare to play seq: clientID: 0x%lx", (uint8_t *)&v22, 0x26u);
  }
LABEL_8:
  unint64_t v10 = [(AVHapticSequence *)v4 player];
  char v11 = [v10 resourcesAllocated];

  if ((v11 & 1) == 0)
  {
    int v17 = -4807;
    __int16 v18 = "self.player.resourcesAllocated";
    uint64_t v19 = 1078;
LABEL_16:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v19, "-[AVHapticSequence prepareToPlayAndReturnError:]", v18, v17, a3);
    char v16 = 0;
    char v20 = 0;
    goto LABEL_19;
  }
  if (v4->_seqID == -1)
  {
    int v17 = -4812;
    __int16 v18 = "_seqID != kInvalidSequenceID";
    uint64_t v19 = 1079;
    goto LABEL_16;
  }
  objc_super v12 = [(AVHapticSequence *)v4 player];
  int v13 = [v12 prepareHapticSequence:v4->_seqID error:a3];

  if (v13)
  {
    if ([(AVHapticSequence *)v4 loopingEnabled]
      && ([(AVHapticSequence *)v4 player],
          char v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 enableSequenceLooping:v4->_seqID enable:1 error:a3],
          v14,
          (v15 & 1) == 0))
    {
      char v16 = 0;
      v4->_loopIsEnabled = 0;
    }
    else
    {
      char v16 = 1;
    }
  }
  else
  {
    char v16 = 0;
  }
  char v20 = 1;
LABEL_19:
  objc_sync_exit(v4);

  return v16 & v20;
}

- (BOOL)playAtTime:(double)a3 offset:(double)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  double v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  char v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(AVHapticSequence *)v8 seqID];
    int v13 = [(AVHapticSequence *)v8 player];
    char v14 = [v13 client];
    uint64_t v15 = [v14 clientID];
    double playbackRate = v8->_playbackRate;
    BOOL isMuted = v8->_isMuted;
    *(_DWORD *)v50 = 136317186;
    *(void *)&v50[4] = "AVHapticPlayer.mm";
    *(_WORD *)&v50[12] = 1024;
    *(_DWORD *)&v50[14] = 1096;
    __int16 v51 = 2080;
    v52 = "-[AVHapticSequence playAtTime:offset:error:]";
    __int16 v53 = 1024;
    int v54 = v12;
    __int16 v55 = 2048;
    *(void *)v56 = v15;
    *(_WORD *)&v56[8] = 2048;
    *(double *)&v56[10] = a3;
    __int16 v57 = 2048;
    double v58 = a4;
    __int16 v59 = 2048;
    double v60 = playbackRate;
    __int16 v61 = 1024;
    BOOL v62 = isMuted;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: play seq %u: clientID: 0x%lx time: %.3f offsetTime: %.3f playback rate: %.1f muted: %d", v50, 0x50u);
  }
LABEL_8:
  __int16 v18 = [(AVHapticSequence *)v8 player];
  char v19 = [v18 resourcesAllocated];

  if ((v19 & 1) == 0)
  {
    int v29 = -4807;
    uint64_t v30 = "self.player.resourcesAllocated";
    uint64_t v31 = 1097;
LABEL_23:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v31, "-[AVHapticSequence playAtTime:offset:error:]", v30, v29, a5);
    char v32 = 0;
    char v33 = 0;
    goto LABEL_24;
  }
  char v20 = [(AVHapticSequence *)v8 player];
  __int16 v21 = [v20 client];
  BOOL v22 = [v21 clientID] == -1;

  if (v22)
  {
    int v29 = -4812;
    uint64_t v30 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v31 = 1098;
    goto LABEL_23;
  }
  __int16 v23 = [(AVHapticSequence *)v8 player];
  __int16 v24 = [v23 client];
  char v25 = [v24 running];

  if ((v25 & 1) == 0)
  {
    int v29 = -4805;
    uint64_t v30 = "self.player.client.running";
    uint64_t v31 = 1099;
    goto LABEL_23;
  }
  if (v8->_seqID == -1)
  {
    int v29 = -4812;
    uint64_t v30 = "_seqID != kInvalidSequenceID";
    uint64_t v31 = 1100;
    goto LABEL_23;
  }
  if ([(AVHapticSequence *)v8 loopingEnabled])
  {
    __int16 v26 = [(AVHapticSequence *)v8 player];
    char v27 = [v26 enableSequenceLooping:v8->_seqID enable:1 error:a5];

    if ((v27 & 1) == 0) {
      v8->_loopIsEnabled = 0;
    }
  }
  if ([(AVHapticSequence *)v8 channelCount] < 2) {
    goto LABEL_37;
  }
  if (!kAVHCScope)
  {
    id v28 = (id)MEMORY[0x1E4F14500];
    id v35 = MEMORY[0x1E4F14500];
    goto LABEL_26;
  }
  id v28 = *(id *)kAVHCScope;
  if (v28)
  {
LABEL_26:
    v36 = v28;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      int v37 = [(AVHapticSequence *)v8 seqID];
      int v38 = [(AVHapticSequence *)v8 activeChannel];
      v39 = "but sequence was muted";
      BOOL v40 = v8->_isMuted;
      *(void *)&v50[4] = "AVHapticPlayer.mm";
      *(_DWORD *)v50 = 136316418;
      *(_WORD *)&v50[12] = 1024;
      if (!v40) {
        v39 = "";
      }
      *(_DWORD *)&v50[14] = 1108;
      __int16 v51 = 2080;
      v52 = "-[AVHapticSequence playAtTime:offset:error:]";
      __int16 v53 = 1024;
      int v54 = v37;
      __int16 v55 = 1024;
      *(_DWORD *)v56 = v38;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v39;
      _os_log_impl(&dword_1BA902000, v36, OS_LOG_TYPE_INFO, "%25s:%-5d %s: soloing sequence ID: %u track %u %s", v50, 0x32u);
    }
  }
  uint64_t v41 = [(AVHapticSequence *)v8 channelCount];
  if (v41 - 1 >= 0)
  {
    do
    {
      --v41;
      double v42 = 1.0;
      if (!v8->_isMuted)
      {
        if (v41 == [(AVHapticSequence *)v8 activeChannel]) {
          double v42 = 0.0;
        }
        else {
          double v42 = 1.0;
        }
      }
      v43 = [(AVHapticSequence *)v8 player];
      float v44 = v42;
      *(float *)&double v45 = v44;
      [v43 setSequenceChannelParam:v8->_seqID atTime:v41 channel:1014 param:a5 value:a3 error:v45];

      v46 = [(AVHapticSequence *)v8 player];
      *(float *)&double v47 = v44;
      [v46 setSequenceChannelParam:v8->_seqID atTime:v41 channel:2014 param:a5 value:a3 error:v47];
    }
    while (v41 > 0);
  }
LABEL_37:
  v48 = [(AVHapticSequence *)v8 player];
  int v49 = [v48 playHapticSequence:v8->_seqID atTime:a3 offset:a4];

  if (v49)
  {
    [(AVHapticSequence *)v8 setLastStartTime:a3];
    char v32 = 1;
    char v33 = 1;
  }
  else
  {
    char v33 = 0;
    char v32 = 1;
  }
LABEL_24:
  objc_sync_exit(v8);

  return v32 & v33;
}

- (BOOL)stopAtTime:(double)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v26 = 136316162;
    char v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 1128;
    __int16 v30 = 2080;
    uint64_t v31 = "-[AVHapticSequence stopAtTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v11 clientID];
    __int16 v34 = 2048;
    double v35 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v22 = -4807;
    __int16 v23 = "self.player.resourcesAllocated";
    uint64_t v24 = 1129;
LABEL_19:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence stopAtTime:error:]", v23, v22, a4);
    LOBYTE(a4) = 0;
    char v21 = 0;
    goto LABEL_20;
  }
  char v14 = [(AVHapticSequence *)v6 player];
  uint64_t v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v22 = -4812;
    __int16 v23 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v24 = 1130;
    goto LABEL_19;
  }
  int v17 = [(AVHapticSequence *)v6 player];
  __int16 v18 = [v17 client];
  char v19 = [v18 running];

  if ((v19 & 1) == 0)
  {
    int v22 = -4805;
    __int16 v23 = "self.player.client.running";
    uint64_t v24 = 1131;
    goto LABEL_19;
  }
  if (v6->_seqID == -1)
  {
    int v22 = -4812;
    __int16 v23 = "_seqID != kInvalidSequenceID";
    uint64_t v24 = 1132;
    goto LABEL_19;
  }
  char v20 = [(AVHapticSequence *)v6 player];
  LODWORD(a4) = [v20 stopHapticSequence:v6->_seqID atTime:a3];

  if (a4)
  {
    [(AVHapticSequence *)v6 setLastStartTime:-1.0];
    LOBYTE(a4) = 1;
  }
  char v21 = 1;
LABEL_20:
  objc_sync_exit(v6);

  return a4 & v21;
}

- (BOOL)pauseAtTime:(double)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v26 = 136316162;
    char v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 1146;
    __int16 v30 = 2080;
    uint64_t v31 = "-[AVHapticSequence pauseAtTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v11 clientID];
    __int16 v34 = 2048;
    double v35 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: pause seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v22 = -4807;
    __int16 v23 = "self.player.resourcesAllocated";
    uint64_t v24 = 1147;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence pauseAtTime:error:]", v23, v22, a4);
    char v21 = 0;
    goto LABEL_18;
  }
  char v14 = [(AVHapticSequence *)v6 player];
  uint64_t v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v22 = -4812;
    __int16 v23 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v24 = 1148;
    goto LABEL_17;
  }
  int v17 = [(AVHapticSequence *)v6 player];
  __int16 v18 = [v17 client];
  char v19 = [v18 running];

  if ((v19 & 1) == 0)
  {
    int v22 = -4805;
    __int16 v23 = "self.player.client.running";
    uint64_t v24 = 1149;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    int v22 = -4812;
    __int16 v23 = "_seqID != kInvalidSequenceID";
    uint64_t v24 = 1150;
    goto LABEL_17;
  }
  char v20 = [(AVHapticSequence *)v6 player];
  char v21 = [v20 pauseHapticSequence:v6->_seqID atTime:a3];

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)resumeAtTime:(double)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v26 = 136316162;
    char v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 1161;
    __int16 v30 = 2080;
    uint64_t v31 = "-[AVHapticSequence resumeAtTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v11 clientID];
    __int16 v34 = 2048;
    double v35 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: resume seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v22 = -4807;
    __int16 v23 = "self.player.resourcesAllocated";
    uint64_t v24 = 1162;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence resumeAtTime:error:]", v23, v22, a4);
    char v21 = 0;
    goto LABEL_18;
  }
  char v14 = [(AVHapticSequence *)v6 player];
  uint64_t v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v22 = -4812;
    __int16 v23 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v24 = 1163;
    goto LABEL_17;
  }
  int v17 = [(AVHapticSequence *)v6 player];
  __int16 v18 = [v17 client];
  char v19 = [v18 running];

  if ((v19 & 1) == 0)
  {
    int v22 = -4805;
    __int16 v23 = "self.player.client.running";
    uint64_t v24 = 1164;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    int v22 = -4812;
    __int16 v23 = "_seqID != kInvalidSequenceID";
    uint64_t v24 = 1165;
    goto LABEL_17;
  }
  char v20 = [(AVHapticSequence *)v6 player];
  char v21 = [v20 resumeHapticSequence:v6->_seqID atTime:a3];

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)seekToTime:(double)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v26 = 136315906;
    char v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 1176;
    __int16 v30 = 2080;
    uint64_t v31 = "-[AVHapticSequence seekToTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v11 clientID];
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: seek seq: clientID: 0x%lx time: NOW", (uint8_t *)&v26, 0x26u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v22 = -4807;
    __int16 v23 = "self.player.resourcesAllocated";
    uint64_t v24 = 1177;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence seekToTime:error:]", v23, v22, a4);
    char v21 = 0;
    goto LABEL_18;
  }
  char v14 = [(AVHapticSequence *)v6 player];
  uint64_t v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v22 = -4812;
    __int16 v23 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v24 = 1178;
    goto LABEL_17;
  }
  int v17 = [(AVHapticSequence *)v6 player];
  __int16 v18 = [v17 client];
  char v19 = [v18 running];

  if ((v19 & 1) == 0)
  {
    int v22 = -4805;
    __int16 v23 = "self.player.client.running";
    uint64_t v24 = 1179;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    int v22 = -4812;
    __int16 v23 = "_seqID != kInvalidSequenceID";
    uint64_t v24 = 1180;
    goto LABEL_17;
  }
  char v20 = [(AVHapticSequence *)v6 player];
  char v21 = [v20 seekHapticSequence:v6->_seqID toTime:a3];

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)resetAtTime:(double)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v23 = 136316162;
    uint64_t v24 = "AVHapticPlayer.mm";
    __int16 v25 = 1024;
    int v26 = 1193;
    __int16 v27 = 2080;
    __int16 v28 = "-[AVHapticSequence resetAtTime:error:]";
    __int16 v29 = 2048;
    uint64_t v30 = [v11 clientID];
    __int16 v31 = 2048;
    double v32 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: reset parameters on seq: clientID: 0x%lx time: %.3f ", (uint8_t *)&v23, 0x30u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v19 = -4807;
    char v20 = "self.player.resourcesAllocated";
    uint64_t v21 = 1194;
LABEL_15:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticSequence resetAtTime:error:]", v20, v19, a4);
    char v18 = 0;
    goto LABEL_16;
  }
  char v14 = [(AVHapticSequence *)v6 player];
  uint64_t v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v19 = -4812;
    char v20 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v21 = 1195;
    goto LABEL_15;
  }
  if (v6->_seqID == -1)
  {
    int v19 = -4812;
    char v20 = "_seqID != kInvalidSequenceID";
    uint64_t v21 = 1196;
    goto LABEL_15;
  }
  int v17 = [(AVHapticSequence *)v6 player];
  char v18 = [v17 resetHapticSequence:v6->_seqID atTime:a3];

LABEL_16:
  objc_sync_exit(v6);

  return v18;
}

- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 channel:(unint64_t)a5 atTime:(double)a6 error:(id *)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v12 = self;
  objc_sync_enter(v12);
  if (kAVHCScope)
  {
    id v13 = *(id *)kAVHCScope;
    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  uint64_t v15 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = [(AVHapticSequence *)v12 player];
    int v17 = [v16 client];
    int v33 = 136316930;
    uint64_t v34 = "AVHapticPlayer.mm";
    __int16 v35 = 1024;
    int v36 = 1209;
    __int16 v37 = 2080;
    int v38 = "-[AVHapticSequence setParameter:value:channel:atTime:error:]";
    __int16 v39 = 2048;
    uint64_t v40 = [v17 clientID];
    __int16 v41 = 1024;
    int v42 = a3;
    __int16 v43 = 2048;
    double v44 = a4;
    __int16 v45 = 1024;
    int v46 = a5;
    __int16 v47 = 2048;
    double v48 = a6;
    _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: set param on seq: clientID: 0x%lx type: %u value: %.2f channelIndex: %u atTime: %.3f", (uint8_t *)&v33, 0x46u);
  }
LABEL_8:
  if ([(AVHapticSequence *)v12 channelCount] <= a5)
  {
    int v29 = -4804;
    uint64_t v30 = "channelIndex < self.channelCount";
    uint64_t v31 = 1210;
LABEL_19:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v31, "-[AVHapticSequence setParameter:value:channel:atTime:error:]", v30, v29, a7);
    char v28 = 0;
    goto LABEL_20;
  }
  char v18 = [(AVHapticSequence *)v12 player];
  char v19 = [v18 resourcesAllocated];

  if ((v19 & 1) == 0)
  {
    int v29 = -4807;
    uint64_t v30 = "self.player.resourcesAllocated";
    uint64_t v31 = 1211;
    goto LABEL_19;
  }
  char v20 = [(AVHapticSequence *)v12 player];
  uint64_t v21 = [v20 client];
  BOOL v22 = [v21 clientID] == -1;

  if (v22)
  {
    int v29 = -4812;
    uint64_t v30 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v31 = 1212;
    goto LABEL_19;
  }
  int v23 = [(AVHapticSequence *)v12 player];
  uint64_t v24 = [v23 client];
  char v25 = [v24 running];

  if ((v25 & 1) == 0)
  {
    int v29 = -4805;
    uint64_t v30 = "self.player.client.running";
    uint64_t v31 = 1213;
    goto LABEL_19;
  }
  if (v12->_seqID == -1)
  {
    int v29 = -4812;
    uint64_t v30 = "_seqID != kInvalidSequenceID";
    uint64_t v31 = 1214;
    goto LABEL_19;
  }
  int v26 = [(AVHapticSequence *)v12 player];
  *(float *)&double v27 = a4;
  char v28 = [v26 setSequenceChannelParam:v12->_seqID atTime:a5 channel:a3 param:a7 value:a6 error:v27];

LABEL_20:
  objc_sync_exit(v12);

  return v28;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(AVHapticSequence *)v4 player];
    id v9 = [v8 client];
    int v24 = 136315906;
    char v25 = "AVHapticPlayer.mm";
    __int16 v26 = 1024;
    int v27 = 1224;
    __int16 v28 = 2080;
    int v29 = "-[AVHapticSequence cancelAndReturnError:]";
    __int16 v30 = 2048;
    uint64_t v31 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: cancel seq: clientID: 0x%lx", (uint8_t *)&v24, 0x26u);
  }
LABEL_8:
  id v10 = [(AVHapticSequence *)v4 player];
  char v11 = [v10 resourcesAllocated];

  if ((v11 & 1) == 0)
  {
    int v20 = -4807;
    uint64_t v21 = "self.player.resourcesAllocated";
    uint64_t v22 = 1225;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v22, "-[AVHapticSequence cancelAndReturnError:]", v21, v20, a3);
    char v19 = 0;
    goto LABEL_18;
  }
  int v12 = [(AVHapticSequence *)v4 player];
  id v13 = [v12 client];
  BOOL v14 = [v13 clientID] == -1;

  if (v14)
  {
    int v20 = -4812;
    uint64_t v21 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v22 = 1226;
    goto LABEL_17;
  }
  uint64_t v15 = [(AVHapticSequence *)v4 player];
  BOOL v16 = [v15 client];
  char v17 = [v16 running];

  if ((v17 & 1) == 0)
  {
    int v20 = -4805;
    uint64_t v21 = "self.player.client.running";
    uint64_t v22 = 1227;
    goto LABEL_17;
  }
  if (v4->_seqID == -1)
  {
    int v20 = -4812;
    uint64_t v21 = "_seqID != kInvalidSequenceID";
    uint64_t v22 = 1228;
    goto LABEL_17;
  }
  char v18 = [(AVHapticSequence *)v4 player];
  char v19 = [v18 clearSequenceEvents:v4->_seqID atTime:0.0];

LABEL_18:
  objc_sync_exit(v4);

  return v19;
}

- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  char v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(AVHapticSequence *)v8 seqID];
    id v13 = [(AVHapticSequence *)v8 player];
    BOOL v14 = [v13 client];
    uint64_t v15 = [v14 clientID];
    BOOL isMuted = v8->_isMuted;
    int v46 = 136316930;
    __int16 v47 = "AVHapticPlayer.mm";
    __int16 v48 = 1024;
    int v49 = 1240;
    __int16 v50 = 2080;
    __int16 v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
    __int16 v52 = 1024;
    *(_DWORD *)__int16 v53 = v12;
    *(_WORD *)&v53[4] = 2048;
    *(void *)&v53[6] = v15;
    __int16 v54 = 2048;
    double v55 = a4;
    __int16 v56 = 1024;
    int v57 = a3;
    __int16 v58 = 1024;
    BOOL v59 = isMuted;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: activating seqID %u track index: clientID: 0x%lx time: %.3f index: %u muted: %d", (uint8_t *)&v46, 0x42u);
  }
LABEL_8:
  if ([(AVHapticSequence *)v8 channelCount] <= a3)
  {
    int v32 = -4804;
    int v33 = "index < self.channelCount";
    uint64_t v34 = 1241;
LABEL_25:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v34, "-[AVHapticSequence activateChannelByIndex:atTime:error:]", v33, v32, a5);
    char v35 = 0;
    goto LABEL_26;
  }
  char v17 = [(AVHapticSequence *)v8 player];
  char v18 = [v17 resourcesAllocated];

  if ((v18 & 1) == 0)
  {
    int v32 = -4807;
    int v33 = "self.player.resourcesAllocated";
    uint64_t v34 = 1242;
    goto LABEL_25;
  }
  char v19 = [(AVHapticSequence *)v8 player];
  int v20 = [v19 client];
  BOOL v21 = [v20 clientID] == -1;

  if (v21)
  {
    int v32 = -4812;
    int v33 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v34 = 1243;
    goto LABEL_25;
  }
  if (v8->_seqID == -1)
  {
    int v32 = -4812;
    int v33 = "_seqID != kInvalidSequenceID";
    uint64_t v34 = 1244;
    goto LABEL_25;
  }
  if ([(AVHapticSequence *)v8 activeChannel] == a3)
  {
LABEL_42:
    char v35 = 1;
    goto LABEL_26;
  }
  [(AVHapticSequence *)v8 setActiveChannel:a3];
  uint64_t v22 = [(AVHapticSequence *)v8 player];
  int v23 = [v22 client];
  int v24 = [v23 running];

  if (!v24)
  {
    if (kAVHCScope)
    {
      __int16 v37 = *(id *)kAVHCScope;
      if (!v37) {
        goto LABEL_42;
      }
    }
    else
    {
      __int16 v37 = MEMORY[0x1E4F14500];
      id v45 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 136315650;
      __int16 v47 = "AVHapticPlayer.mm";
      __int16 v48 = 1024;
      int v49 = 1260;
      __int16 v50 = 2080;
      __int16 v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
      _os_log_impl(&dword_1BA902000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Associated player is not running - action delayed until sequence start", (uint8_t *)&v46, 0x1Cu);
    }

    goto LABEL_42;
  }
  [(AVHapticSequence *)v8 lastStartTime];
  if (v25 == -1.0 || ([(AVHapticSequence *)v8 lastStartTime], v26 <= a4))
  {
    double v29 = a4;
  }
  else
  {
    [(AVHapticSequence *)v8 lastStartTime];
    double v29 = v28;
    if (v28 > a4)
    {
      __int16 v30 = CALog::LogObjIfEnabled((CALog *)3, kAVHCScope, v27);
      uint64_t v31 = v30;
      if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 136315906;
        __int16 v47 = "AVHapticPlayer.mm";
        __int16 v48 = 1024;
        int v49 = 1252;
        __int16 v50 = 2080;
        __int16 v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
        __int16 v52 = 2048;
        *(double *)__int16 v53 = v29;
        _os_log_impl(&dword_1BA902000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: request pushed out to pending play request at time %.3f", (uint8_t *)&v46, 0x26u);
      }
    }
  }
  unint64_t v38 = 0;
  char v35 = 1;
  while (v38 < [(AVHapticSequence *)v8 channelCount])
  {
    double v39 = 1.0;
    if (!v8->_isMuted)
    {
      if (v38 == [(AVHapticSequence *)v8 activeChannel]) {
        double v39 = 0.0;
      }
      else {
        double v39 = 1.0;
      }
    }
    uint64_t v40 = [(AVHapticSequence *)v8 player];
    float v41 = v39;
    *(float *)&double v42 = v41;
    [v40 setSequenceChannelParam:v8->_seqID atTime:v38 channel:1014 param:a5 value:v29 error:v42];

    __int16 v43 = [(AVHapticSequence *)v8 player];
    *(float *)&double v44 = v41;
    char v35 = [v43 setSequenceChannelParam:v8->_seqID atTime:v38 channel:2014 param:a5 value:v29 error:v44];

    ++v38;
  }
LABEL_26:
  objc_sync_exit(v8);

  return v35 & 1;
}

- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  char v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(AVHapticSequence *)v8 player];
    id v13 = [v12 client];
    int v29 = 136316418;
    __int16 v30 = "AVHapticPlayer.mm";
    __int16 v31 = 1024;
    int v32 = 1273;
    __int16 v33 = 2080;
    uint64_t v34 = "-[AVHapticSequence setVolume:atTime:error:]";
    __int16 v35 = 2048;
    uint64_t v36 = [v13 clientID];
    __int16 v37 = 2048;
    double v38 = a4;
    __int16 v39 = 2048;
    double v40 = a3;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: set volume on seq: clientID: 0x%lx time: %.3f volume: %.3f", (uint8_t *)&v29, 0x3Au);
  }
LABEL_8:
  BOOL v14 = [(AVHapticSequence *)v8 player];
  char v15 = [v14 resourcesAllocated];

  if ((v15 & 1) == 0)
  {
    int v24 = -4807;
    double v25 = "self.player.resourcesAllocated";
    uint64_t v26 = 1274;
LABEL_18:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v26, "-[AVHapticSequence setVolume:atTime:error:]", v25, v24, a5);
    BOOL v27 = 0;
    goto LABEL_19;
  }
  BOOL v16 = [(AVHapticSequence *)v8 player];
  char v17 = [v16 client];
  BOOL v18 = [v17 clientID] == -1;

  if (v18)
  {
    int v24 = -4812;
    double v25 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v26 = 1275;
    goto LABEL_18;
  }
  if (v8->_seqID == -1)
  {
    int v24 = -4812;
    double v25 = "_seqID != kInvalidSequenceID";
    uint64_t v26 = 1276;
    goto LABEL_18;
  }
  for (unint64_t i = 0; i < [(AVHapticSequence *)v8 channelCount]; ++i)
  {
    int v20 = [(AVHapticSequence *)v8 player];
    *(float *)&double v21 = a3;
    [v20 setSequenceChannelParam:v8->_seqID atTime:i channel:1000 param:a5 value:a4 error:v21];

    uint64_t v22 = [(AVHapticSequence *)v8 player];
    *(float *)&double v23 = a3;
    [v22 setSequenceChannelParam:v8->_seqID atTime:i channel:2000 param:a5 value:a4 error:v23];
  }
  BOOL v27 = 1;
LABEL_19:
  objc_sync_exit(v8);

  return v27;
}

- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticSequence *)v6 player];
    char v11 = [v10 client];
    int v23 = 136316162;
    int v24 = "AVHapticPlayer.mm";
    __int16 v25 = 1024;
    int v26 = 1289;
    __int16 v27 = 2080;
    double v28 = "-[AVHapticSequence earlyUnduckAudioAtTime:error:]";
    __int16 v29 = 2048;
    uint64_t v30 = [v11 clientID];
    __int16 v31 = 2048;
    double v32 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: early unduck audio on seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v23, 0x30u);
  }
LABEL_8:
  int v12 = [(AVHapticSequence *)v6 player];
  char v13 = [v12 resourcesAllocated];

  if ((v13 & 1) == 0)
  {
    int v19 = -4807;
    int v20 = "self.player.resourcesAllocated";
    uint64_t v21 = 1290;
LABEL_15:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticSequence earlyUnduckAudioAtTime:error:]", v20, v19, a4);
    char v18 = 0;
    goto LABEL_16;
  }
  BOOL v14 = [(AVHapticSequence *)v6 player];
  char v15 = [v14 client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v19 = -4812;
    int v20 = "self.player.client.clientID != kInvalidClientID";
    uint64_t v21 = 1291;
    goto LABEL_15;
  }
  if (v6->_seqID == -1)
  {
    int v19 = -4812;
    int v20 = "_seqID != kInvalidSequenceID";
    uint64_t v21 = 1292;
    goto LABEL_15;
  }
  char v17 = [(AVHapticSequence *)v6 player];
  char v18 = [v17 sendUnduckAudioCommand:v6->_seqID atTime:a3];

LABEL_16:
  objc_sync_exit(v6);

  return v18;
}

- (AVHapticPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  return (AVHapticPlayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (unint64_t)seqID
{
  return self->_seqID;
}

- (void)setSeqID:(unint64_t)a3
{
  self->_seqID = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)lastStartTime
{
  return self->_lastStartTime;
}

- (void)setLastStartTime:(double)a3
{
  self->_lastStartTime = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_BOOL isMuted = a3;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

- (void).cxx_destruct
{
}

@end
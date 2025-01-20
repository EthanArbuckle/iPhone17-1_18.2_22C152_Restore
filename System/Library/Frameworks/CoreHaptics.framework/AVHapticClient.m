@interface AVHapticClient
- (AVHapticClient)initWithOptions:(id)a3 error:(id *)a4;
- (BOOL)clearEventsFromTime:(double)a3 channel:(unint64_t)a4;
- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4;
- (BOOL)connected;
- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5;
- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7;
- (BOOL)disconnecting;
- (BOOL)doScheduleParamCurve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 paramCurve:(id)a6 error:(id *)a7;
- (BOOL)doScheduleParamCurveWithMemoryReserve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 memoryReserve:(HapticSharedMemoryAddressReserve *)a6 paramCurve:(id)a7 error:(id *)a8;
- (BOOL)doSendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 sorted:(BOOL)a7 outToken:(unint64_t *)a8 error:(id *)a9;
- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5;
- (BOOL)finish:(id)a3;
- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4;
- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4;
- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4;
- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4;
- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4;
- (BOOL)prewarmed;
- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (BOOL)removeAssignedChannelID:(unint64_t)a3 error:(id *)a4;
- (BOOL)requestAssignedChannels:(unint64_t)a3 error:(id *)a4;
- (BOOL)resetChannel:(unint64_t)a3 atTime:(double)a4;
- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)running;
- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 error:(id *)a7;
- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4;
- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 outToken:(unint64_t *)a7 error:(id *)a8;
- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4;
- (BOOL)setChannelEventBehavior:(unint64_t)a3 channel:(unint64_t)a4;
- (BOOL)setParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 channel:(unint64_t)a6;
- (BOOL)setPlayerBehavior:(unint64_t)a3 error:(id *)a4;
- (BOOL)setSequenceChannelParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 sequenceID:(unint64_t)a6 channel:(unint64_t)a7;
- (BOOL)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channel:(unint64_t)a5;
- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5;
- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5;
- (BOOL)setupConnectionWithOptions:(id)a3 error:(id *)a4;
- (BOOL)startHapticSequence:(unint64_t)a3 atTime:(double)a4 withOffset:(double)a5;
- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (NSArray)channelKeys;
- (double)hapticLatency;
- (id).cxx_construct;
- (id)asyncStopCallback;
- (id)completionCallback;
- (id)connectionCallback;
- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4;
- (id)getSequenceFinishedHandlerForID:(unint64_t)a3;
- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4;
- (int)serverProcessID;
- (int)state;
- (unint64_t)clientID;
- (unsigned)calculateHapticCommandParamCurveMemorySize:(unsigned int)a3;
- (void)allocateResources:(id)a3;
- (void)callSequenceFinishedHandlersWithError:(id)a3;
- (void)clearAssignedChannels;
- (void)clientCompletedWithError:(id)a3;
- (void)clientDisconnectingForReason:(unint64_t)a3 error:(id)a4;
- (void)clientStoppedForReason:(unint64_t)a3 error:(id)a4;
- (void)dealloc;
- (void)destroySharedMemory;
- (void)detachHapticSequence:(unint64_t)a3;
- (void)detachSequenceEntryforID:(unint64_t)a3;
- (void)disconnect;
- (void)doInit;
- (void)handleServerConnectionInterruption;
- (void)handleServerConnectionInvalidation;
- (void)prewarm:(id)a3;
- (void)queryServerCapabilities:(id)a3 reply:(id)a4;
- (void)releaseResources;
- (void)sequenceFinished:(unint64_t)a3 error:(id)a4;
- (void)setAsyncStopCallback:(id)a3;
- (void)setChannelKeys:(id)a3;
- (void)setCompletionCallback:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionCallback:(id)a3;
- (void)setRunStateForSequenceEntryWithID:(unint64_t)a3 running:(BOOL)a4;
- (void)setSequenceFinishedHandlerForID:(unint64_t)a3 finishedHandler:(id)a4;
- (void)setServerProcessID:(int)a3;
- (void)setState:(int)a3;
- (void)startRunning:(id)a3;
- (void)stopPrewarm;
- (void)stopRunning;
- (void)stopRunning:(id)a3;
@end

@implementation AVHapticClient

void __42__AVHapticClient_setPlayerBehavior_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 1274;
      __int16 v11 = 2080;
      v12 = "-[AVHapticClient setPlayerBehavior:error:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }
  }
LABEL_9:
}

- (void)queryServerCapabilities:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  v8 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:&__block_literal_global_38];
  [v8 queryCapabilities:v9 reply:v7];
}

- (BOOL)finish:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(AVHapticClient *)self clientID];
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)v40 = "AVHapticClient.mm";
    *(_WORD *)&v40[8] = 1024;
    *(_DWORD *)&v40[10] = 420;
    *(_WORD *)&v40[14] = 2080;
    *(void *)&v40[16] = "-[AVHapticClient finish:]";
    *(_WORD *)&v40[24] = 1024;
    *(_DWORD *)&v40[26] = v5;
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x finishing", buf, 0x22u);
  }

LABEL_8:
  if (![(AVHapticClient *)self running])
  {
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4805 userInfo:0];
    if (kAVHCScope)
    {
      v18 = *(id *)kAVHCScope;
      if (!v18)
      {
LABEL_27:
        v22 = *((void *)self + 18);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __25__AVHapticClient_finish___block_invoke_57;
        v29[3] = &unk_1E622E310;
        id v32 = v4;
        id v16 = v17;
        id v30 = v16;
        v31 = self;
        dispatch_sync(v22, v29);

        v23 = &v32;
        goto LABEL_34;
      }
    }
    else
    {
      v18 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v40 = "AVHapticClient.mm";
      *(_WORD *)&v40[8] = 1024;
      *(_DWORD *)&v40[10] = 446;
      *(_WORD *)&v40[14] = 2080;
      *(void *)&v40[16] = "-[AVHapticClient finish:]";
      *(_WORD *)&v40[24] = 2112;
      *(void *)&v40[26] = v17;
      *(_WORD *)&v40[34] = 1024;
      LODWORD(v41) = v5;
      _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player was not running - bailing with error %@ for client 0x%x", buf, 0x2Cu);
    }

    goto LABEL_27;
  }
  v8 = *((void *)self + 18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__AVHapticClient_finish___block_invoke;
  block[3] = &unk_1E622DF50;
  id v9 = v4;
  block[4] = self;
  id v38 = v9;
  dispatch_sync(v8, block);
  uint64_t v10 = mach_absolute_time();
  double v11 = (double)v10 * 0.0000000416666667;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      v12 = *(id *)kAVHCScope;
      if (v12)
      {
        __int16 v13 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v40 = "AVHapticClient.mm";
          *(_WORD *)&v40[8] = 1024;
          *(_DWORD *)&v40[10] = 430;
          *(_WORD *)&v40[14] = 2080;
          *(void *)&v40[16] = "-[AVHapticClient finish:]";
          *(_WORD *)&v40[24] = 2048;
          *(double *)&v40[26] = (double)v10 * 0.0000000416666667;
          *(_WORD *)&v40[34] = 2048;
          *(void *)&long long v41 = v10;
          _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing FinalEvent with time %f [host time was %llu]", buf, 0x30u);
        }
      }
    }
  }
  id v14 = self;
  objc_sync_enter(v14);
  int v45 = 0;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  *(_OWORD *)&v40[20] = 0u;
  *(_DWORD *)buf = 327792;
  *(double *)&v40[4] = v11;
  *(void *)&v40[12] = -1;
  char v15 = writeCommand();
  objc_sync_exit(v14);

  if ((v15 & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
    if (kAVHCScope)
    {
      v20 = *(id *)kAVHCScope;
      if (!v20)
      {
LABEL_32:
        v25 = *((void *)self + 18);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __25__AVHapticClient_finish___block_invoke_56;
        v33[3] = &unk_1E622E310;
        id v36 = v9;
        id v16 = v19;
        id v34 = v16;
        v35 = v14;
        dispatch_sync(v25, v33);

        goto LABEL_33;
      }
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v40 = "AVHapticClient.mm";
      *(_WORD *)&v40[8] = 1024;
      *(_DWORD *)&v40[10] = 437;
      *(_WORD *)&v40[14] = 2080;
      *(void *)&v40[16] = "-[AVHapticClient finish:]";
      *(_WORD *)&v40[24] = 2112;
      *(void *)&v40[26] = v19;
      *(_WORD *)&v40[34] = 1024;
      LODWORD(v41) = v5;
      _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Attempt to write FinalEvent failed - bailing by calling completionCallback with error %@ for client 0x%x", buf, 0x2Cu);
    }

    goto LABEL_32;
  }
  id v16 = 0;
LABEL_33:
  v23 = &v38;
LABEL_34:

  if (kAVHCScope)
  {
    v26 = *(id *)kAVHCScope;
    if (!v26) {
      goto LABEL_41;
    }
  }
  else
  {
    v26 = MEMORY[0x1E4F14500];
    id v27 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)v40 = "AVHapticClient.mm";
    *(_WORD *)&v40[8] = 1024;
    *(_DWORD *)&v40[10] = 452;
    *(_WORD *)&v40[14] = 2080;
    *(void *)&v40[16] = "-[AVHapticClient finish:]";
    *(_WORD *)&v40[24] = 1024;
    *(_DWORD *)&v40[26] = v5;
    _os_log_impl(&dword_1BA902000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x done with finish", buf, 0x22u);
  }

LABEL_41:
  return v16 == 0;
}

- (BOOL)running
{
  return (*((_DWORD *)self + 38) - 1) < 2;
}

- (void)startRunning:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "AVHapticClient.mm";
    __int16 v24 = 1024;
    int v25 = 362;
    __int16 v26 = 2080;
    id v27 = "-[AVHapticClient startRunning:]";
    __int16 v28 = 1024;
    int v29 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x starting", buf, 0x22u);
  }

LABEL_8:
  [(AVHapticClient *)self setState:1];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __31__AVHapticClient_startRunning___block_invoke;
  v18[3] = &unk_1E622DF78;
  objc_copyWeak(&v20, &location);
  id v9 = v5;
  id v19 = v9;
  uint64_t v10 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__AVHapticClient_startRunning___block_invoke_2;
  v15[3] = &unk_1E622DF78;
  objc_copyWeak(&v17, &location);
  id v11 = v9;
  id v16 = v11;
  [v10 startRunning:v15];
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v12 = *(id *)kAVHCScope;
      if (v12)
      {
        __int16 v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v14 = [(AVHapticClient *)self clientID];
          *(_DWORD *)buf = 136315906;
          v23 = "AVHapticClient.mm";
          __int16 v24 = 1024;
          int v25 = 379;
          __int16 v26 = 2080;
          id v27 = "-[AVHapticClient startRunning:]";
          __int16 v28 = 1024;
          int v29 = v14;
          _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x done with startRunning:", buf, 0x22u);
        }
      }
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = (void *)*((void *)self + 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AVHapticClient_getAsyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E622E3B0;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setState:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)self + 38) != a3)
  {
    if (kAVHSScope)
    {
      id v5 = *(id *)kAVHSScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      id v5 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 136316162;
      id v9 = "AVHapticClient.mm";
      int v11 = 106;
      __int16 v12 = 2080;
      __int16 v10 = 1024;
      __int16 v13 = "-[AVHapticClient setState:]";
      __int16 v14 = 1024;
      int v15 = [(AVHapticClient *)self clientID];
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x EngineState -> %d", (uint8_t *)&v8, 0x28u);
    }
  }
LABEL_9:
  *((_DWORD *)self + 38) = a3;
}

- (void)setAsyncStopCallback:(id)a3
{
}

- (unint64_t)clientID
{
  return *((void *)self + 21);
}

- (BOOL)setPlayerBehavior:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  id v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  if (kAVHCScope)
  {
    int v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    int v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "AVHapticClient.mm";
    __int16 v25 = 1024;
    int v26 = 1268;
    __int16 v27 = 2080;
    __int16 v28 = "-[AVHapticClient setPlayerBehavior:error:]";
    __int16 v29 = 1024;
    int v30 = a3;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with player behavior %u", buf, 0x22u);
  }

LABEL_8:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__AVHapticClient_setPlayerBehavior_error___block_invoke;
  v16[3] = &unk_1E622E2E8;
  v16[4] = &v17;
  __int16 v10 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__AVHapticClient_setPlayerBehavior_error___block_invoke_2;
  v15[3] = &unk_1E622E2E8;
  void v15[4] = &v17;
  [v10 setPlayerBehavior:a3 reply:v15];
  if (a4) {
    *a4 = (id) v18[5];
  }
  if (kAVHCScope)
  {
    int v11 = *(id *)kAVHCScope;
    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "AVHapticClient.mm";
    __int16 v25 = 1024;
    int v26 = 1277;
    __int16 v27 = 2080;
    __int16 v28 = "-[AVHapticClient setPlayerBehavior:error:]";
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Exited", buf, 0x1Cu);
  }

LABEL_17:
  BOOL v13 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v13;
}

- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = (void *)*((void *)self + 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AVHapticClient_getSyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E622E3B0;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)allocateResources:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v21 = "AVHapticClient.mm";
    __int16 v22 = 1024;
    int v23 = 188;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVHapticClient allocateResources:]";
    __int16 v26 = 1024;
    int v27 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x allocating", buf, 0x22u);
  }

LABEL_8:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__AVHapticClient_allocateResources___block_invoke;
  v18[3] = &unk_1E622E270;
  id v9 = v5;
  id v19 = v9;
  __int16 v10 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:v18];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__AVHapticClient_allocateResources___block_invoke_2;
  v14[3] = &unk_1E622E298;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v15 = v11;
  [v10 allocateClientResources:v14];
  if (kAVHCScope)
  {
    id v12 = *(id *)kAVHCScope;
    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
    id v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "AVHapticClient.mm";
    __int16 v22 = 1024;
    int v23 = 216;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVHapticClient allocateResources:]";
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done allocating", buf, 0x1Cu);
  }

LABEL_15:
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 850045863;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 17) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = (char *)self + 128;
  return self;
}

uint64_t __25__AVHapticClient_finish___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v2 = *(id *)kAVHCScope;
    if (!v2) {
      return [*(id *)(a1 + 32) setCompletionCallback:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  id v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(a1 + 40));
    int v7 = 136315906;
    id v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 425;
    __int16 v11 = 2080;
    id v12 = "-[AVHapticClient finish:]_block_invoke";
    __int16 v13 = 2048;
    __int16 v14 = v5;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: completionCallback set to %p", (uint8_t *)&v7, 0x26u);
  }
  return [*(id *)(a1 + 32) setCompletionCallback:*(void *)(a1 + 40)];
}

- (void)setCompletionCallback:(id)a3
{
}

- (void)setConnectionCallback:(id)a3
{
}

- (AVHapticClient)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (setupClientLogScopes(void)::once != -1) {
    dispatch_once(&setupClientLogScopes(void)::once, &__block_literal_global_1);
  }
  if (kAVHCScope)
  {
    int v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "AVHapticClient.mm";
    __int16 v20 = 1024;
    int v21 = 139;
    __int16 v22 = 2080;
    int v23 = "-[AVHapticClient initWithOptions:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initializing with options", buf, 0x1Cu);
  }

LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)AVHapticClient;
  __int16 v9 = [(AVHapticClient *)&v17 init];
  int v10 = v9;
  if (v9)
  {
    [(AVHapticClient *)v9 doInit];
    if (![(AVHapticClient *)v10 setupConnectionWithOptions:v6 error:a4])
    {
      if (kAVHCScope)
      {
        id v12 = *(id *)kAVHCScope;
        if (!v12)
        {
LABEL_27:
          [(AVHapticClient *)v10 disconnect];
          __int16 v14 = 0;
          goto LABEL_28;
        }
      }
      else
      {
        id v12 = MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "AVHapticClient.mm";
        __int16 v20 = 1024;
        int v21 = 144;
        __int16 v22 = 2080;
        int v23 = "-[AVHapticClient initWithOptions:error:]";
        _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Init calling disconnect on self", buf, 0x1Cu);
      }

      goto LABEL_27;
    }
  }
  if (!kAVHCScope)
  {
    __int16 v11 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    goto LABEL_19;
  }
  __int16 v11 = *(id *)kAVHCScope;
  if (v11)
  {
LABEL_19:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "AVHapticClient.mm";
      __int16 v20 = 1024;
      int v21 = 149;
      __int16 v22 = 2080;
      int v23 = "-[AVHapticClient initWithOptions:error:]";
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Init exited", buf, 0x1Cu);
    }
  }
  __int16 v14 = v10;
LABEL_28:

  return v14;
}

- (BOOL)setupConnectionWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1153;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient setupConnectionWithOptions:error:]";
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Connecting...", buf, 0x1Cu);
  }

LABEL_8:
  id v8 = [v56 objectForKey:@"MachServiceName"];
  id v9 = objc_alloc(MEMORY[0x1E4F29268]);
  if (v8) {
    int v10 = v8;
  }
  else {
    int v10 = @"com.apple.audio.hapticd";
  }
  uint64_t v11 = [v9 initWithMachServiceName:v10 options:4096];
  id v12 = (void *)*((void *)self + 1);
  *((void *)self + 1) = v11;

  id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F145D630];
  [*((id *)self + 1) setExportedInterface:v13];

  [*((id *)self + 1) setExportedObject:self];
  __int16 v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F14614F0];
  [*((id *)self + 1) setRemoteObjectInterface:v14];

  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v15 = *(id *)kAVHCScope;
      if (v15)
      {
        id v16 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *((void *)self + 1);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1162;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "-[AVHapticClient setupConnectionWithOptions:error:]";
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v17;
          _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: [xpc] Connection: %@", buf, 0x26u);
        }
      }
    }
  }
  uint64_t v18 = [*((id *)self + 1) remoteObjectInterface];
  [v18 setXPCType:MEMORY[0x1E4F145E8] forSelector:sel_allocateClientResources_ argumentIndex:0 ofReply:1];

  objc_initWeak(&location, self);
  id v19 = (void *)*((void *)self + 1);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke;
  v67[3] = &unk_1E622E360;
  objc_copyWeak(&v68, &location);
  [v19 setInterruptionHandler:v67];
  __int16 v20 = (void *)*((void *)self + 1);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2;
  v65[3] = &unk_1E622E360;
  objc_copyWeak(&v66, &location);
  [v20 setInvalidationHandler:v65];
  [(AVHapticClient *)self setConnected:1];
  [*((id *)self + 1) resume];
  [(AVHapticClient *)self setServerProcessID:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v81 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  if (kAVHCScope)
  {
    int v21 = *(id *)kAVHCScope;
    if (!v21) {
      goto LABEL_24;
    }
  }
  else
  {
    int v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v70 = 136315906;
    v71 = "AVHapticClient.mm";
    __int16 v72 = 1024;
    int v73 = 1183;
    __int16 v74 = 2080;
    v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    __int16 v76 = 2112;
    id v77 = v56;
    _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling configureWithOptions:reply on server with dictionary: '%@'", v70, 0x26u);
  }

LABEL_24:
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_144;
  v60[3] = &unk_1E622E2E8;
  v60[4] = buf;
  int v23 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:v60];
  uint64_t v24 = (void *)MEMORY[0x1BA9F2B70]();
  __int16 v25 = dispatch_group_create();
  dispatch_group_enter(v25);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2_145;
  v57[3] = &unk_1E622E388;
  v59 = &v61;
  __int16 v26 = v25;
  v58 = v26;
  [v23 configureWithOptions:v56 reply:v57];
  dispatch_time_t v27 = dispatch_time(0, 1000000000);
  if (!dispatch_group_wait(v26, v27)) {
    goto LABEL_33;
  }
  if (!kAVHCScope)
  {
    uint64_t v28 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  uint64_t v28 = *(id *)kAVHCScope;
  if (v28)
  {
LABEL_29:
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v70 = 136315650;
      v71 = "AVHapticClient.mm";
      __int16 v72 = 1024;
      int v73 = 1198;
      __int16 v74 = 2080;
      v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Initial XPC call to server timed out", v70, 0x1Cu);
    }
  }
  uint64_t v30 = *(void *)&buf[8];
  uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4810 userInfo:0];
  id v32 = v31;
  objc_storeStrong((id *)(v30 + 40), v31);
LABEL_33:

  -[AVHapticClient setServerProcessID:](self, "setServerProcessID:", [*((id *)self + 1) processIdentifier]);
  if (kAVHCScope)
  {
    id v33 = *(id *)kAVHCScope;
    if (!v33) {
      goto LABEL_40;
    }
  }
  else
  {
    id v33 = (id)MEMORY[0x1E4F14500];
    id v34 = MEMORY[0x1E4F14500];
  }
  v35 = v33;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    id v36 = (void *)*((void *)self + 1);
    int v37 = [v36 processIdentifier];
    *(_DWORD *)v70 = 136316162;
    v71 = "AVHapticClient.mm";
    __int16 v72 = 1024;
    int v73 = 1206;
    __int16 v74 = 2080;
    v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    __int16 v76 = 2112;
    id v77 = v36;
    __int16 v78 = 1024;
    int v79 = v37;
    _os_log_impl(&dword_1BA902000, v35, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Server connection: %@, PID: %d", v70, 0x2Cu);
  }

LABEL_40:
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    if (kAVHCScope)
    {
      id v38 = *(id *)kAVHCScope;
      if (!v38) {
        goto LABEL_64;
      }
    }
    else
    {
      id v38 = MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v70 = 136315906;
      v71 = "AVHapticClient.mm";
      __int16 v72 = 1024;
      int v73 = 1209;
      __int16 v74 = 2080;
      v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      __int16 v76 = 2112;
      id v77 = v41;
      long long v42 = "%25s:%-5d %s: [xpc] Got error during transaction: %@";
      long long v43 = v38;
      os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
LABEL_57:
      _os_log_impl(&dword_1BA902000, v43, v44, v42, v70, 0x26u);
      goto LABEL_63;
    }
    goto LABEL_63;
  }
  uint64_t v39 = v62[3];
  if (!v39)
  {
    if (kAVHCScope)
    {
      int v45 = *(id *)kAVHCScope;
      if (!v45)
      {
LABEL_62:
        uint64_t v49 = *(void *)&buf[8];
        id v50 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4810 userInfo:0];
        id v38 = *(NSObject **)(v49 + 40);
        *(void *)(v49 + 40) = v50;
        goto LABEL_63;
      }
    }
    else
    {
      int v45 = MEMORY[0x1E4F14500];
      id v48 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 136315650;
      v71 = "AVHapticClient.mm";
      __int16 v72 = 1024;
      int v73 = 1212;
      __int16 v74 = 2080;
      v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      _os_log_impl(&dword_1BA902000, v45, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] ERROR: Failed retrieving client ID", v70, 0x1Cu);
    }

    goto LABEL_62;
  }
  *((void *)self + 21) = v39;
  if (!kAVHCScope)
  {
    id v38 = MEMORY[0x1E4F14500];
    id v46 = MEMORY[0x1E4F14500];
LABEL_55:
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)*((void *)self + 21);
      *(_DWORD *)v70 = 136315906;
      v71 = "AVHapticClient.mm";
      __int16 v72 = 1024;
      int v73 = 1217;
      __int16 v74 = 2080;
      v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      __int16 v76 = 2048;
      id v77 = v47;
      long long v42 = "%25s:%-5d %s: Client ID: 0x%lx";
      long long v43 = v38;
      os_log_type_t v44 = OS_LOG_TYPE_INFO;
      goto LABEL_57;
    }
LABEL_63:

    goto LABEL_64;
  }
  id v38 = *(id *)kAVHCScope;
  if (v38) {
    goto LABEL_55;
  }
LABEL_64:
  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  if (kAVHCScope)
  {
    v51 = *(id *)kAVHCScope;
    if (!v51) {
      goto LABEL_73;
    }
  }
  else
  {
    v51 = MEMORY[0x1E4F14500];
    id v52 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v70 = 136315650;
    v71 = "AVHapticClient.mm";
    __int16 v72 = 1024;
    int v73 = 1223;
    __int16 v74 = 2080;
    v75 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    _os_log_impl(&dword_1BA902000, v51, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done connecting", v70, 0x1Cu);
  }

LABEL_73:
  BOOL v53 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);

  return v53;
}

- (void)setServerProcessID:(int)a3
{
  *((_DWORD *)self + 40) = a3;
}

- (void)setConnected:(BOOL)a3
{
  *((unsigned char *)self + 158) = a3;
}

- (void)doInit
{
  *((void *)self + 3) = 1;
  id v3 = (void *)*((void *)self + 22);
  *((void *)self + 22) = 0;

  *((_DWORD *)self + 38) = 0;
  *((unsigned char *)self + 158) = 0;
  id v4 = (void *)*((void *)self + 23);
  *((void *)self + 23) = 0;

  dispatch_queue_t v5 = dispatch_queue_create("Client completion queue", 0);
  id v6 = (void *)*((void *)self + 18);
  *((void *)self + 18) = v5;

  Boolean keyExistsAndHasValidFormat = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"hapticserver_timeout", @"com.apple.coreaudio", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v8 = AppIntegerValue;
  }
  else {
    int v8 = 5;
  }
  *((_DWORD *)self + 8) = v8;
  *((unsigned char *)self + 156) = 0;
}

void __43__AVHapticClient_clientCompletedWithError___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4) {
        goto LABEL_32;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    int v18 = 136315650;
    id v19 = "AVHapticClient.mm";
    __int16 v20 = 1024;
    int v21 = 1467;
    __int16 v22 = 2080;
    int v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    id v16 = "%25s:%-5d %s: AVHapticClient 'strongSelf' is nil";
    goto LABEL_30;
  }
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    id v19 = "AVHapticClient.mm";
    __int16 v20 = 1024;
    int v21 = 1456;
    __int16 v22 = 2080;
    int v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    __int16 v24 = 1024;
    LODWORD(v25) = [WeakRetained clientID];
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Async dispatch: preparing to call completionCallback for client 0x%x", (uint8_t *)&v18, 0x22u);
  }

LABEL_12:
  id v7 = [WeakRetained completionCallback];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4) {
        goto LABEL_32;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    int v18 = 136315650;
    id v19 = "AVHapticClient.mm";
    __int16 v20 = 1024;
    int v21 = 1463;
    __int16 v22 = 2080;
    int v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    id v16 = "%25s:%-5d %s: strongSelf.completionCallback is nil";
LABEL_30:
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0x1Cu);
LABEL_31:

    goto LABEL_32;
  }
  if (!kAVHCScope)
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
    goto LABEL_20;
  }
  id v9 = *(id *)kAVHCScope;
  if (v9)
  {
LABEL_20:
    uint64_t v11 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [WeakRetained completionCallback];
      id v13 = (void *)MEMORY[0x1BA9F2D90]();
      int v18 = 136315906;
      id v19 = "AVHapticClient.mm";
      __int16 v20 = 1024;
      int v21 = 1458;
      __int16 v22 = 2080;
      int v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
      __int16 v24 = 2048;
      __int16 v25 = v13;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling completionCallback %p and then setting to nil", (uint8_t *)&v18, 0x26u);
    }
  }
  __int16 v14 = [WeakRetained completionCallback];
  v14[2](v14, *(void *)(a1 + 32));

  [WeakRetained setCompletionCallback:0];
LABEL_32:
}

- (id)completionCallback
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)prewarm:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  BOOL v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    int v18 = "AVHapticClient.mm";
    __int16 v19 = 1024;
    int v20 = 335;
    __int16 v21 = 2080;
    __int16 v22 = "-[AVHapticClient prewarm:]";
    __int16 v23 = 1024;
    int v24 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x starting prewarm", buf, 0x22u);
  }

LABEL_8:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __26__AVHapticClient_prewarm___block_invoke;
  v15[3] = &unk_1E622E270;
  id v9 = v5;
  id v16 = v9;
  id v10 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:v15];
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __26__AVHapticClient_prewarm___block_invoke_2;
  v12[3] = &unk_1E622DF78;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v9;
  id v13 = v11;
  [v10 prewarm:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2_145(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      id v7 = "AVHapticClient.mm";
      __int16 v8 = 1024;
      int v9 = 1191;
      __int16 v10 = 2080;
      id v11 = "-[AVHapticClient setupConnectionWithOptions:error:]_block_invoke_2";
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed setting options / retrieving client ID from server", (uint8_t *)&v6, 0x1Cu);
    }
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)clientCompletedWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
    *(_DWORD *)buf = 136315906;
    int v18 = "AVHapticClient.mm";
    __int16 v19 = 1024;
    int v20 = 1451;
    __int16 v21 = 2080;
    __int16 v22 = "-[AVHapticClient clientCompletedWithError:]";
    __int16 v23 = 1024;
    int v24 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side (async) finish completion callback for client 0x%x called from server", buf, 0x22u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  __int16 v8 = *((void *)self + 18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVHapticClient_clientCompletedWithError___block_invoke;
  block[3] = &unk_1E622E400;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v8, block);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v10 = *(id *)kAVHCScope;
      if (v10)
      {
        id v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v12 = [(AVHapticClient *)self clientID];
          *(_DWORD *)buf = 136315906;
          int v18 = "AVHapticClient.mm";
          __int16 v19 = 1024;
          int v20 = 1470;
          __int16 v21 = 2080;
          __int16 v22 = "-[AVHapticClient clientCompletedWithError:]";
          __int16 v23 = 1024;
          int v24 = v12;
          _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side finish completionCallback done for client 0x%x", buf, 0x22u);
        }
      }
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __26__AVHapticClient_prewarm___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 157) = v3 == 0;
  }
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "AVHapticClient.mm";
    __int16 v10 = 1024;
    int v11 = 345;
    __int16 v12 = 2080;
    id v13 = "-[AVHapticClient prewarm:]_block_invoke_2";
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Server called client-side prewarm completionCallback", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __36__AVHapticClient_allocateResources___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    if (kAVHCScope)
    {
      id v9 = *(id *)kAVHCScope;
      if (!v9)
      {
LABEL_12:
        id v14 = v8;
        goto LABEL_37;
      }
    }
    else
    {
      id v9 = (id)MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    __int16 v12 = v9;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v8 localizedDescription];
      int v24 = 136315906;
      uint64_t v25 = "AVHapticClient.mm";
      __int16 v26 = 1024;
      int v27 = 196;
      __int16 v28 = 2080;
      id v29 = "-[AVHapticClient allocateResources:]_block_invoke_2";
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to set up client: %@", (uint8_t *)&v24, 0x26u);
    }
    goto LABEL_12;
  }
  if (kAVHCScope)
  {
    __int16 v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_17;
    }
  }
  else
  {
    __int16 v10 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315906;
    uint64_t v25 = "AVHapticClient.mm";
    __int16 v26 = 1024;
    int v27 = 200;
    __int16 v28 = 2080;
    id v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    __int16 v30 = 1024;
    LODWORD(v31) = a3;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Server returned shared buffer of size %u", (uint8_t *)&v24, 0x22u);
  }

LABEL_17:
  if (!a3) {
    __36__AVHapticClient_allocateResources___block_invoke_2_cold_1();
  }
  if (kAVHCScope)
  {
    id v16 = *(id *)kAVHCScope;
    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
    id v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315650;
    uint64_t v25 = "AVHapticClient.mm";
    __int16 v26 = 1024;
    int v27 = 202;
    __int16 v28 = 2080;
    id v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting up shared memory on client", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_25:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t HapticCommandWriter = createHapticCommandWriter();
    WeakRetained[2] = HapticCommandWriter;
    if (!HapticCommandWriter)
    {
      if (kAVHCScope)
      {
        int v20 = *(id *)kAVHCScope;
        if (!v20)
        {
LABEL_35:
          id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
          goto LABEL_36;
        }
      }
      else
      {
        int v20 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136315650;
        uint64_t v25 = "AVHapticClient.mm";
        __int16 v26 = 1024;
        int v27 = 207;
        __int16 v28 = 2080;
        id v29 = "-[AVHapticClient allocateResources:]_block_invoke";
        _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to access shared memory", (uint8_t *)&v24, 0x1Cu);
      }

      goto LABEL_35;
    }
  }
  id v14 = 0;
LABEL_36:

LABEL_37:
  if (kAVHCScope)
  {
    __int16 v22 = *(id *)kAVHCScope;
    if (!v22) {
      goto LABEL_44;
    }
  }
  else
  {
    __int16 v22 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315650;
    uint64_t v25 = "AVHapticClient.mm";
    __int16 v26 = 1024;
    int v27 = 212;
    __int16 v28 = 2080;
    id v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Notifying caller via completion callback", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_44:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)doSendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 sorted:(BOOL)a7 outToken:(unint64_t *)a8 error:(id *)a9
{
  LODWORD(v79) = a7;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v84 = a4;
  v86 = v12;
  int v82 = [v12 count];
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v13 = *(id *)kAVHCScope;
      if (v13)
      {
        id v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 547;
          *(_WORD *)&v93[14] = 2080;
          *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 1024;
          *(_DWORD *)&v93[26] = [(AVHapticClient *)self clientID];
          *(_WORD *)&v93[30] = 1024;
          *(_DWORD *)&v93[32] = v82;
          *(_WORD *)&v93[36] = 2048;
          *(double *)&v93[38] = a5;
          _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing %u events from passed-in event array at time: %.3f", buf, 0x32u);
        }
      }
    }
  }
  int v91 = 0;
  if (v82)
  {
    uint64_t v15 = 0;
    int v16 = 336;
    do
    {
      id v17 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v79);
      uint64_t v18 = [v17 eventCategory];
      if (v18)
      {
        if (v18 == 1)
        {
          unsigned int v22 = 168;
        }
        else
        {
          if (v18 != 2)
          {
            if (kAVHCScope)
            {
              uint64_t v63 = *(id *)kAVHCScope;
              if (!v63)
              {
LABEL_109:
                if (a9)
                {
                  *a9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4821 userInfo:0];
                }

                goto LABEL_153;
              }
            }
            else
            {
              uint64_t v63 = MEMORY[0x1E4F14500];
              id v69 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)v93 = "AVHapticClient.mm";
              *(_WORD *)&v93[8] = 1024;
              *(_DWORD *)&v93[10] = 573;
              *(_WORD *)&v93[14] = 2080;
              *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
              _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event is none of haptic/audio event, parameter, or parameter curve. returning", buf, 0x1Cu);
            }

            goto LABEL_109;
          }
          __int16 v19 = [v17 parameterCurve];
          int v20 = [v19 controlPoints];
          uint64_t v21 = [v20 count];

          unsigned int v22 = [(AVHapticClient *)self calculateHapticCommandParamCurveMemorySize:v21];
        }
      }
      else
      {
        [v17 duration];
        if (v23 == 0.0) {
          unsigned int v22 = 168;
        }
        else {
          unsigned int v22 = 336;
        }
      }

      v16 += v22;
      ++v15;
    }
    while (v82 != v15);
  }
  uint64_t v87 = 0;
  int v88 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  if ((reserveForWrite() & 1) == 0)
  {
    if ((unint64_t)[v12 count] < 3)
    {
      if (!kAVHCScope || (*(unsigned char *)(kAVHCScope + 8) & 1) == 0) {
        goto LABEL_153;
      }
      uint64_t v61 = *(id *)kAVHCScope;
      v60 = v61;
      if (v61)
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 603;
          *(_WORD *)&v93[14] = 2080;
          *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          _os_log_impl(&dword_1BA902000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Bailing out on recursion because event array cannot be split further", buf, 0x1Cu);
        }

        goto LABEL_153;
      }
      goto LABEL_154;
    }
    if ((v79 & 1) == 0)
    {
      id v12 = [v12 sortedArrayUsingComparator:&__block_literal_global_351];
    }
    v86 = v12;
    uint64_t v64 = objc_msgSend(v12, "subarrayWithRange:", 0, HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(v12));
    if (kAVHCScope && (*(unsigned char *)(kAVHCScope + 8) & 1) != 0)
    {
      v65 = *(id *)kAVHCScope;
      v60 = v65;
      if (!v65)
      {
LABEL_95:

        goto LABEL_154;
      }
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 594;
        *(_WORD *)&v93[14] = 2080;
        *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        *(_WORD *)&v93[24] = 1024;
        *(_DWORD *)&v93[26] = v91;
        _os_log_impl(&dword_1BA902000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Bailing out on recursion (availableSize = %u)", buf, 0x22u);
      }
    }
    LOBYTE(v60) = 0;
    goto LABEL_95;
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v24 = *(id *)kAVHCScope;
      if (v24)
      {
        uint64_t v25 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 607;
          *(_WORD *)&v93[14] = 2080;
          *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 2048;
          *(double *)&v93[26] = a5;
          _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ====>> StartEventList at time: %f", buf, 0x26u);
        }
      }
    }
  }
  memset(&v93[20], 0, 84);
  *(_DWORD *)buf = 393328;
  *(double *)&v93[4] = a5;
  *(void *)&v93[12] = a6;
  if (!writeCommandToReserved())
  {
    if (kAVHCScope)
    {
      v62 = *(id *)kAVHCScope;
      if (!v62)
      {
LABEL_100:
        if (!a9) {
          goto LABEL_153;
        }
        id v67 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
LABEL_118:
        LOBYTE(v60) = 0;
        *a9 = v67;
        goto LABEL_154;
      }
    }
    else
    {
      v62 = MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v93 = "AVHapticClient.mm";
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = 608;
      *(_WORD *)&v93[14] = 2080;
      *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
      _os_log_impl(&dword_1BA902000, v62, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_100;
  }
  if (!v82)
  {
LABEL_64:
    if (kAVHCScope)
    {
      if (*(unsigned char *)(kAVHCScope + 8))
      {
        v58 = *(id *)kAVHCScope;
        if (v58)
        {
          v59 = v58;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)v93 = "AVHapticClient.mm";
            *(_WORD *)&v93[8] = 1024;
            *(_DWORD *)&v93[10] = 640;
            *(_WORD *)&v93[14] = 2080;
            *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
            *(_WORD *)&v93[24] = 2048;
            *(double *)&v93[26] = a5;
            _os_log_impl(&dword_1BA902000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <<==== EndEventList at time: %f", buf, 0x26u);
          }
        }
      }
    }
    memset(&v93[20], 0, 84);
    *(_DWORD *)buf = 458864;
    *(double *)&v93[4] = a5;
    *(void *)&v93[12] = a6;
    if (writeCommandToReserved())
    {
      updateReservedWriteIndex();
      LOBYTE(v60) = 1;
      goto LABEL_154;
    }
    if (kAVHCScope)
    {
      id v68 = *(id *)kAVHCScope;
      if (!v68)
      {
LABEL_116:
        if (!a9) {
          goto LABEL_153;
        }
        id v67 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
        goto LABEL_118;
      }
    }
    else
    {
      id v68 = MEMORY[0x1E4F14500];
      id v70 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v93 = "AVHapticClient.mm";
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = 641;
      *(_WORD *)&v93[14] = 2080;
      *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
      _os_log_impl(&dword_1BA902000, v68, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_116;
  }
  uint64_t v26 = 0;
  uint64_t v80 = 136315906;
  while (1)
  {
    int v27 = objc_msgSend(v12, "objectAtIndexedSubscript:", v26, v80);
    uint64_t v28 = [v27 eventCategory];
    if (!v28) {
      break;
    }
    if (v28 != 1)
    {
      if (v28 == 2)
      {
        if (kAVHCScope)
        {
          if (*(unsigned char *)(kAVHCScope + 8))
          {
            id v29 = *(id *)kAVHCScope;
            if (v29)
            {
              __int16 v30 = v29;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                [v27 time];
                *(_DWORD *)buf = v80;
                *(void *)v93 = "AVHapticClient.mm";
                *(_WORD *)&v93[8] = 1024;
                *(_DWORD *)&v93[10] = 630;
                *(_WORD *)&v93[14] = 2080;
                *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
                *(_WORD *)&v93[24] = 2048;
                *(void *)&v93[26] = v31;
                _os_log_impl(&dword_1BA902000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Param curve: relative time %f", buf, 0x26u);
              }
            }
          }
        }
        uint64_t v32 = [v27 paramType];
        [v27 time];
        double v34 = v33;
        v35 = [v27 parameterCurve];
        id v36 = [v35 controlPoints];
        int v37 = [v36 sortedArrayUsingComparator:&__block_literal_global_354];
        [(AVHapticClient *)self doScheduleParamCurveWithMemoryReserve:v32 atTime:a6 channel:&v87 memoryReserve:v37 paramCurve:a9 error:v34];

        goto LABEL_63;
      }
      if (kAVHCScope)
      {
        v71 = *(id *)kAVHCScope;
        if (!v71)
        {
LABEL_135:
          if (!a9) {
            goto LABEL_152;
          }
          uint64_t v74 = -4821;
          goto LABEL_151;
        }
      }
      else
      {
        v71 = MEMORY[0x1E4F14500];
        id v73 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 635;
        *(_WORD *)&v93[14] = 2080;
        *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        _os_log_impl(&dword_1BA902000, v71, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event is none of haptic/audio event, parameter, or parameter curve. returning", buf, 0x1Cu);
      }

      goto LABEL_135;
    }
    if (kAVHCScope)
    {
      if (*(unsigned char *)(kAVHCScope + 8))
      {
        id v51 = *(id *)kAVHCScope;
        if (v51)
        {
          id v52 = v51;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            [v27 time];
            *(_DWORD *)buf = v80;
            *(void *)v93 = "AVHapticClient.mm";
            *(_WORD *)&v93[8] = 1024;
            *(_DWORD *)&v93[10] = 625;
            *(_WORD *)&v93[14] = 2080;
            *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
            *(_WORD *)&v93[24] = 2048;
            *(void *)&v93[26] = v53;
            _os_log_impl(&dword_1BA902000, v52, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Param event: relative time %f", buf, 0x26u);
          }
        }
      }
    }
    [v27 time];
    uint64_t v55 = v54;
    uint64_t v56 = [v27 paramType];
    [v27 value];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v94 = 0u;
    memset(&v93[32], 0, 80);
    *(_DWORD *)buf = 196644;
    *(void *)&v93[4] = v55;
    *(void *)&v93[12] = a6;
    *(void *)&v93[20] = v56;
    *(_DWORD *)&v93[28] = v57;
    if ((writeCommandToReserved() & 1) == 0)
    {
      if (kAVHCScope)
      {
        __int16 v72 = *(id *)kAVHCScope;
        if (!v72) {
          goto LABEL_149;
        }
      }
      else
      {
        __int16 v72 = MEMORY[0x1E4F14500];
        id v76 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 626;
        *(_WORD *)&v93[14] = 2080;
        *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        _os_log_impl(&dword_1BA902000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
      }
      goto LABEL_148;
    }
LABEL_63:

    if (v82 == ++v26) {
      goto LABEL_64;
    }
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v38 = *(id *)kAVHCScope;
      if (v38)
      {
        uint64_t v39 = v38;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          [v27 time];
          *(_DWORD *)buf = v80;
          *(void *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 613;
          *(_WORD *)&v93[14] = 2080;
          *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 2048;
          *(void *)&v93[26] = v40;
          _os_log_impl(&dword_1BA902000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Start event: relative time %f", buf, 0x26u);
        }
      }
    }
  }
  startEventFromEvent(v27, v84, a6, *((void *)self + 3), (uint64_t)buf);
  if (writeCommandToReserved())
  {
    [v27 duration];
    if (v41 != 0.0)
    {
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          id v42 = *(id *)kAVHCScope;
          if (v42)
          {
            long long v43 = v42;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              [v27 time];
              double v45 = v44;
              [v27 duration];
              *(_DWORD *)buf = v80;
              *(void *)v93 = "AVHapticClient.mm";
              *(_WORD *)&v93[8] = 1024;
              *(_DWORD *)&v93[10] = 616;
              *(_WORD *)&v93[14] = 2080;
              *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
              *(_WORD *)&v93[24] = 2048;
              *(double *)&v93[26] = v45 + v46;
              _os_log_impl(&dword_1BA902000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Stop event added: relative time %f", buf, 0x26u);
            }
          }
        }
      }
      [v27 time];
      double v48 = v47;
      [v27 duration];
      uint64_t v49 = *((void *)self + 3);
      memset(&v93[36], 0, 68);
      *(_DWORD *)buf = 131184;
      *(double *)&v93[4] = v48 + v50;
      *(void *)&v93[12] = a6;
      *(void *)&v93[20] = 0;
      *(void *)&v93[28] = v49;
      if ((writeCommandToReserved() & 1) == 0)
      {
        if (kAVHCScope)
        {
          __int16 v72 = *(id *)kAVHCScope;
          if (!v72) {
            goto LABEL_149;
          }
        }
        else
        {
          __int16 v72 = MEMORY[0x1E4F14500];
          id v77 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 617;
          *(_WORD *)&v93[14] = 2080;
          *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          _os_log_impl(&dword_1BA902000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
        }
        goto LABEL_148;
      }
    }
    if (a8) {
      *a8 = *((void *)self + 3);
    }
    ++*((void *)self + 3);
    goto LABEL_63;
  }
  if (kAVHCScope)
  {
    __int16 v72 = *(id *)kAVHCScope;
    if (!v72) {
      goto LABEL_149;
    }
  }
  else
  {
    __int16 v72 = MEMORY[0x1E4F14500];
    id v75 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)v93 = "AVHapticClient.mm";
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = 614;
    *(_WORD *)&v93[14] = 2080;
    *(void *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
    _os_log_impl(&dword_1BA902000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
  }
LABEL_148:

LABEL_149:
  if (!a9) {
    goto LABEL_152;
  }
  uint64_t v74 = -4899;
LABEL_151:
  *a9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v74 userInfo:0];
LABEL_152:

LABEL_153:
  LOBYTE(v60) = 0;
LABEL_154:

  return (char)v60;
}

void __48__AVHapticClient_requestAssignedChannels_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 count];
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    id v12 = "AVHapticClient.mm";
    __int16 v13 = 1024;
    int v14 = 1300;
    __int16 v15 = 2080;
    int v16 = "-[AVHapticClient requestAssignedChannels:error:]_block_invoke_2";
    __int16 v17 = 1024;
    int v18 = v7;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Server returned count of %u", (uint8_t *)&v11, 0x22u);
  }

LABEL_8:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setChannelKeys:v5];
  }
}

void __48__AVHapticClient_removeAssignedChannelID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __31__AVHapticClient_startRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained setState:2 * (v4 == 0)];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __30__AVHapticClient_stopRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setState:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopRunning:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    double v23 = "AVHapticClient.mm";
    __int16 v24 = 1024;
    int v25 = 397;
    __int16 v26 = 2080;
    int v27 = "-[AVHapticClient stopRunning:]";
    __int16 v28 = 1024;
    int v29 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping", buf, 0x22u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__AVHapticClient_stopRunning___block_invoke;
  v18[3] = &unk_1E622DF78;
  objc_copyWeak(&v20, &location);
  id v9 = v5;
  id v19 = v9;
  __int16 v10 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:v18];
  [(AVHapticClient *)self setState:3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__AVHapticClient_stopRunning___block_invoke_2;
  v15[3] = &unk_1E622DF78;
  objc_copyWeak(&v17, &location);
  id v11 = v9;
  id v16 = v11;
  [v10 stopRunning:v15];
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v12 = *(id *)kAVHCScope;
      if (v12)
      {
        __int16 v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v14 = [(AVHapticClient *)self clientID];
          *(_DWORD *)buf = 136315906;
          double v23 = "AVHapticClient.mm";
          __int16 v24 = 1024;
          int v25 = 414;
          __int16 v26 = 2080;
          int v27 = "-[AVHapticClient stopRunning:]";
          __int16 v28 = 1024;
          int v29 = v14;
          _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x done with stopRunning:", buf, 0x22u);
        }
      }
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)setChannelKeys:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
  id v5 = (void *)*((void *)self + 22);
  *((void *)self + 22) = v4;
}

- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 outToken:(unint64_t *)a7 error:(id *)a8
{
  int v14 = self;
  id v15 = a4;
  id v16 = a3;
  objc_sync_enter(v14);
  LOBYTE(a8) = [(AVHapticClient *)v14 doSendEvents:v16 withImmediateParameters:v15 atTime:a6 channel:0 sorted:a7 outToken:a8 error:a5];

  objc_sync_exit(v14);
  return (char)a8;
}

- (BOOL)resetChannel:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)&v12[0] = "AVHapticClient.mm";
          WORD4(v12[0]) = 1024;
          *(_DWORD *)((char *)v12 + 10) = 489;
          HIWORD(v12[0]) = 2080;
          *(void *)&v12[1] = "-[AVHapticClient resetChannel:atTime:]";
          WORD4(v12[1]) = 1024;
          *(_DWORD *)((char *)&v12[1] + 10) = [(AVHapticClient *)v6 clientID];
          HIWORD(v12[1]) = 2048;
          *(double *)&v12[2] = a4;
          WORD4(v12[2]) = 1024;
          *(_DWORD *)((char *)&v12[2] + 10) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing reset event: time: %.3f channelID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset((char *)&v12[1] + 4, 0, 84);
  int v11 = 786544;
  *(double *)((char *)v12 + 4) = a4;
  *(void *)((char *)v12 + 12) = a3;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)requestAssignedChannels:(unint64_t)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1292;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient requestAssignedChannels:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a3;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with request for %u channels", buf, 0x22u);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__AVHapticClient_requestAssignedChannels_error___block_invoke;
  v18[3] = &unk_1E622E2E8;
  void v18[4] = buf;
  __int16 v10 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v18];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__AVHapticClient_requestAssignedChannels_error___block_invoke_2;
  v15[3] = &unk_1E622E3D8;
  void v15[4] = buf;
  objc_copyWeak(&v16, &location);
  [v10 requestChannels:a3 reply:v15];
  int v11 = *(void **)(*(void *)&buf[8] + 40);
  if (a4) {
    *a4 = v11;
  }
  if (kAVHCScope)
  {
    id v12 = *(id *)kAVHCScope;
    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
    id v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v19 = 136315650;
    id v20 = "AVHapticClient.mm";
    __int16 v21 = 1024;
    int v22 = 1310;
    __int16 v23 = 2080;
    __int16 v24 = "-[AVHapticClient requestAssignedChannels:error:]";
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done requesting channels", v19, 0x1Cu);
  }

LABEL_17:
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v11 == 0;
}

- (BOOL)removeAssignedChannelID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1316;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient removeAssignedChannelID:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a3;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with request to remove channelID %u", buf, 0x22u);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__AVHapticClient_removeAssignedChannelID_error___block_invoke;
  v16[3] = &unk_1E622E2E8;
  v16[4] = buf;
  __int16 v10 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__AVHapticClient_removeAssignedChannelID_error___block_invoke_2;
  v15[3] = &unk_1E622E2E8;
  void v15[4] = buf;
  [v10 removeChannel:a3 reply:v15];
  int v11 = *(void **)(*(void *)&buf[8] + 40);
  if (a4) {
    *a4 = v11;
  }
  if (kAVHCScope)
  {
    id v12 = *(id *)kAVHCScope;
    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
    id v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v17 = 136315650;
    int v18 = "AVHapticClient.mm";
    __int16 v19 = 1024;
    int v20 = 1328;
    __int16 v21 = 2080;
    int v22 = "-[AVHapticClient removeAssignedChannelID:error:]";
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done removing channel", v17, 0x1Cu);
  }

LABEL_17:
  _Block_object_dispose(buf, 8);

  return v11 == 0;
}

- (NSArray)channelKeys
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (int)state
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kAVHSScope)
  {
    if (*(unsigned char *)(kAVHSScope + 8))
    {
      id v3 = *(id *)kAVHSScope;
      if (v3)
      {
        uint64_t v4 = v3;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          int v5 = [(AVHapticClient *)self clientID];
          int v6 = *((_DWORD *)self + 38);
          int v8 = 136316162;
          id v9 = "AVHapticClient.mm";
          int v11 = 112;
          __int16 v12 = 2080;
          __int16 v10 = 1024;
          id v13 = "-[AVHapticClient state]";
          __int16 v14 = 1024;
          int v15 = v5;
          __int16 v16 = 1024;
          int v17 = v6;
          _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: (Client 0x%x returning EngineState %d)", (uint8_t *)&v8, 0x28u);
        }
      }
    }
  }
  return *((_DWORD *)self + 38);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
  int v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "AVHapticClient.mm";
    __int16 v11 = 1024;
    int v12 = 155;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVHapticClient dealloc]";
    __int16 v15 = 1024;
    int v16 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Deallocating HapticClient 0x%x", buf, 0x22u);
  }

LABEL_8:
  [(AVHapticClient *)self disconnect];
  [(AVHapticClient *)self destroySharedMemory];
  if (kAVHCScope)
  {
    int v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_15;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "AVHapticClient.mm";
    __int16 v11 = 1024;
    int v12 = 158;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVHapticClient dealloc]";
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc of HapticClient exited", buf, 0x1Cu);
  }

LABEL_15:
  v8.receiver = self;
  v8.super_class = (Class)AVHapticClient;
  [(AVHapticClient *)&v8 dealloc];
}

void __48__AVHapticClient_queryServerCapabilities_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
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
  int v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = [v2 localizedDescription];
    int v7 = 136315906;
    objc_super v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 166;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticClient queryServerCapabilities:reply:]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to get server capabilities: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

- (double)hapticLatency
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__1;
  v10[4] = __Block_byref_object_dispose__1;
  id v11 = 0;
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:&__block_literal_global_40];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVHapticClient_hapticLatency__block_invoke_41;
  v5[3] = &unk_1E622E248;
  v5[4] = &v6;
  v5[5] = v10;
  [v2 getHapticLatency:v5];
  double v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);

  return v3;
}

void __31__AVHapticClient_hapticLatency__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
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
  int v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [v2 localizedDescription];
    int v7 = 136315906;
    uint64_t v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 176;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticClient hapticLatency]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to get latency: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

void __31__AVHapticClient_hapticLatency__block_invoke_41(uint64_t a1, void *a2, double a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (kAVHCScope)
    {
      int v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      int v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v10 = 136315906;
      __int16 v11 = "AVHapticClient.mm";
      __int16 v12 = 1024;
      int v13 = 181;
      __int16 v14 = 2080;
      uint64_t v15 = "-[AVHapticClient hapticLatency]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v10, 0x26u);
    }
  }
LABEL_9:
}

uint64_t __36__AVHapticClient_allocateResources___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, uint64_t))a4;
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
  __int16 v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 221;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient loadHapticEvent:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v7;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading dictionary: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  *(void *)&unsigned char buf[40] = 0;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  __int16 v12 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:&__block_literal_global_46];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40__AVHapticClient_loadHapticEvent_reply___block_invoke_2;
  v21[3] = &unk_1E622E2C0;
  v21[4] = buf;
  v21[5] = &v22;
  [v12 loadHapticEvent:v7 reply:v21];
  uint64_t v13 = *(void *)(*(void *)&buf[8] + 40);
  if (!v13)
  {
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    __int16 v14 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  __int16 v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_14:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v26 = 136315906;
      uint64_t v27 = "AVHapticClient.mm";
      __int16 v28 = 1024;
      int v29 = 233;
      __int16 v30 = 2080;
      uint64_t v31 = "-[AVHapticClient loadHapticEvent:reply:]";
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v26, 0x26u);
    }
  }
  uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v23[3], v15);
  if (kAVHCScope)
  {
    uint64_t v18 = *(id *)kAVHCScope;
    if (!v18) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v26 = 136315650;
    uint64_t v27 = "AVHapticClient.mm";
    __int16 v28 = 1024;
    int v29 = 239;
    __int16 v30 = 2080;
    uint64_t v31 = "-[AVHapticClient loadHapticEvent:reply:]";
    _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading event", v26, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v13 == 0;
}

void __40__AVHapticClient_loadHapticEvent_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      id v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      id v10 = "AVHapticClient.mm";
      __int16 v11 = 1024;
      int v12 = 228;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVHapticClient loadHapticEvent:reply:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = (void (**)(id, void, uint64_t))a7;
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = __Block_byref_object_copy__1;
  uint64_t v35 = __Block_byref_object_dispose__1;
  id v36 = 0;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v17 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:&__block_literal_global_49];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__AVHapticClient_createCustomAudioEvent_format_frames_options_reply___block_invoke_2;
  v26[3] = &unk_1E622E2C0;
  uint8_t v26[4] = &v31;
  v26[5] = &v27;
  [v17 createCustomAudioEvent:v13 format:v14 frames:a5 options:v15 reply:v26];
  uint64_t v18 = v32[5];
  if (!v18)
  {
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    id v19 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v19 = *(id *)kAVHCScope;
  if (v19)
  {
LABEL_7:
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v32[5];
      *(_DWORD *)buf = 136315906;
      id v38 = "AVHapticClient.mm";
      __int16 v39 = 1024;
      int v40 = 256;
      __int16 v41 = 2080;
      id v42 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]";
      __int16 v43 = 2112;
      uint64_t v44 = v22;
      _os_log_impl(&dword_1BA902000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }
  }
  uint64_t v20 = v32[5];
LABEL_11:
  v16[2](v16, v28[3], v20);
  if (kAVHCScope)
  {
    __int16 v23 = *(id *)kAVHCScope;
    if (!v23) {
      goto LABEL_18;
    }
  }
  else
  {
    __int16 v23 = MEMORY[0x1E4F14500];
    id v24 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v38 = "AVHapticClient.mm";
    __int16 v39 = 1024;
    int v40 = 262;
    __int16 v41 = 2080;
    id v42 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]";
    _os_log_impl(&dword_1BA902000, v23, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done creating event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v18 == 0;
}

void __69__AVHapticClient_createCustomAudioEvent_format_frames_options_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      id v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      id v10 = "AVHapticClient.mm";
      __int16 v11 = 1024;
      int v12 = 251;
      __int16 v13 = 2080;
      id v14 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__1;
  uint64_t v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  __int16 v11 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:&__block_literal_global_51];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__AVHapticClient_copyCustomAudioEvent_options_reply___block_invoke_2;
  v20[3] = &unk_1E622E2C0;
  v20[4] = &v25;
  v20[5] = &v21;
  [v11 copyCustomAudioEvent:a3 options:v9 reply:v20];
  uint64_t v12 = v26[5];
  if (!v12)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    __int16 v13 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  __int16 v13 = *(id *)kAVHCScope;
  if (v13)
  {
LABEL_7:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v26[5];
      *(_DWORD *)buf = 136315906;
      __int16 v32 = "AVHapticClient.mm";
      __int16 v33 = 1024;
      int v34 = 279;
      __int16 v35 = 2080;
      id v36 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]";
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }
  }
  uint64_t v14 = v26[5];
LABEL_11:
  v10[2](v10, v22[3], v14);
  if (kAVHCScope)
  {
    uint64_t v17 = *(id *)kAVHCScope;
    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v32 = "AVHapticClient.mm";
    __int16 v33 = 1024;
    int v34 = 285;
    __int16 v35 = 2080;
    id v36 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]";
    _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done copying event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12 == 0;
}

void __53__AVHapticClient_copyCustomAudioEvent_options_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      id v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      id v10 = "AVHapticClient.mm";
      __int16 v11 = 1024;
      int v12 = 274;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke;
  v18[3] = &unk_1E622E2E8;
  void v18[4] = &v19;
  id v8 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke_2;
  v17[3] = &unk_1E622E2E8;
  uint8_t v17[4] = &v19;
  [v8 referenceCustomAudioEvent:a3 reply:v17];
  uint64_t v9 = v20[5];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    id v10 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v10 = *(id *)kAVHCScope;
  if (v10)
  {
LABEL_7:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v20[5];
      *(_DWORD *)buf = 136315906;
      id v26 = "AVHapticClient.mm";
      __int16 v27 = 1024;
      int v28 = 301;
      __int16 v29 = 2080;
      id v30 = "-[AVHapticClient referenceCustomAudioEvent:reply:]";
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }
  }
  uint64_t v11 = v20[5];
LABEL_11:
  v7[2](v7, v11);
  if (kAVHCScope)
  {
    uint64_t v14 = *(id *)kAVHCScope;
    if (!v14) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v26 = "AVHapticClient.mm";
    __int16 v27 = 1024;
    int v28 = 307;
    __int16 v29 = 2080;
    id v30 = "-[AVHapticClient referenceCustomAudioEvent:reply:]";
    _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done referencing event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v19, 8);

  return v9 == 0;
}

void __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      int v5 = *(id *)kAVHCScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      int v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 297;
      __int16 v11 = 2080;
      id v12 = "-[AVHapticClient referenceCustomAudioEvent:reply:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }
  }
LABEL_9:
}

- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v7 = (void (**)(id, void))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke;
  v18[3] = &unk_1E622E2E8;
  void v18[4] = &v19;
  id v8 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke_2;
  v17[3] = &unk_1E622E2E8;
  uint8_t v17[4] = &v19;
  [v8 releaseCustomAudioEvent:a3 reply:v17];
  uint64_t v9 = v20[5];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    int v10 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  int v10 = *(id *)kAVHCScope;
  if (v10)
  {
LABEL_7:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v20[5];
      *(_DWORD *)buf = 136315906;
      id v26 = "AVHapticClient.mm";
      __int16 v27 = 1024;
      int v28 = 323;
      __int16 v29 = 2080;
      id v30 = "-[AVHapticClient releaseCustomAudioEvent:reply:]";
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }
  }
  uint64_t v11 = v20[5];
LABEL_11:
  v7[2](v7, v11);
  if (kAVHCScope)
  {
    id v14 = *(id *)kAVHCScope;
    if (!v14) {
      goto LABEL_18;
    }
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v26 = "AVHapticClient.mm";
    __int16 v27 = 1024;
    int v28 = 329;
    __int16 v29 = 2080;
    id v30 = "-[AVHapticClient releaseCustomAudioEvent:reply:]";
    _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done releasing event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v19, 8);

  return v9 == 0;
}

void __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      int v5 = *(id *)kAVHCScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      int v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 319;
      __int16 v11 = 2080;
      id v12 = "-[AVHapticClient releaseCustomAudioEvent:reply:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }
  }
LABEL_9:
}

uint64_t __26__AVHapticClient_prewarm___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopPrewarm
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    __int16 v9 = "AVHapticClient.mm";
    __int16 v10 = 1024;
    int v11 = 352;
    __int16 v12 = 2080;
    __int16 v13 = "-[AVHapticClient stopPrewarm]";
    __int16 v14 = 1024;
    int v15 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping prewarm", (uint8_t *)&v8, 0x22u);
  }

LABEL_8:
  int v7 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:&__block_literal_global_53];
  [v7 stopPrewarm];
  *((unsigned char *)self + 157) = 0;
}

void __29__AVHapticClient_stopPrewarm__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v2 localizedDescription];
    int v7 = 136315906;
    int v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 354;
    __int16 v11 = 2080;
    __int16 v12 = "-[AVHapticClient stopPrewarm]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to stop prewarm: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

void __31__AVHapticClient_startRunning___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setState:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopRunning
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315906;
    int v10 = "AVHapticClient.mm";
    __int16 v11 = 1024;
    int v12 = 386;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVHapticClient stopRunning]";
    __int16 v15 = 1024;
    int v16 = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping", (uint8_t *)&v9, 0x22u);
  }

LABEL_8:
  [(AVHapticClient *)self setState:0];
  int v7 = (void *)*((void *)self + 23);
  *((void *)self + 23) = 0;

  int v8 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:&__block_literal_global_55];
  [v8 stopRunning];
}

void __29__AVHapticClient_stopRunning__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v2 localizedDescription];
    int v7 = 136315906;
    int v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 390;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticClient stopRunning]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to stop running: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

void __30__AVHapticClient_stopRunning___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setState:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __25__AVHapticClient_finish___block_invoke_56(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);

  return [v2 setCompletionCallback:0];
}

uint64_t __25__AVHapticClient_finish___block_invoke_57(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);

  return [v2 setCompletionCallback:0];
}

- (BOOL)setChannelEventBehavior:(unint64_t)a3 channel:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  int v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_DWORD *)&buf[14] = 464;
    *(_WORD *)&buf[18] = 2080;
    *(_WORD *)&buf[12] = 1024;
    *(void *)&buf[20] = "-[AVHapticClient setChannelEventBehavior:channel:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x, behavior %u", buf, 0x28u);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke;
  v20[3] = &unk_1E622E2E8;
  v20[4] = buf;
  __int16 v11 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke_2;
  v19[3] = &unk_1E622E2E8;
  uint8_t v19[4] = buf;
  [v11 setChannelEventBehavior:a4 behavior:a3 reply:v19];
  uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
  if (!v12) {
    goto LABEL_16;
  }
  if (kAVHCScope)
  {
    __int16 v13 = *(id *)kAVHCScope;
    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v21 = 136315906;
    uint64_t v22 = "AVHapticClient.mm";
    __int16 v23 = 1024;
    int v24 = 475;
    __int16 v25 = 2080;
    id v26 = "-[AVHapticClient setChannelEventBehavior:channel:]";
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v21, 0x26u);
  }

LABEL_16:
  if (kAVHCScope)
  {
    int v16 = *(id *)kAVHCScope;
    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
    int v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136315650;
    uint64_t v22 = "AVHapticClient.mm";
    __int16 v23 = 1024;
    int v24 = 480;
    __int16 v25 = 2080;
    id v26 = "-[AVHapticClient setChannelEventBehavior:channel:]";
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done setting behavior", v21, 0x1Cu);
  }

LABEL_23:
  _Block_object_dispose(buf, 8);

  return v12 == 0;
}

void __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke(uint64_t a1, void *a2)
{
}

void __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      id v5 = *(id *)kAVHCScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 471;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVHapticClient setChannelEventBehavior:channel:]_block_invoke_2";
      __int16 v13 = 2048;
      id v14 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %p", (uint8_t *)&v7, 0x26u);
    }
  }
LABEL_9:
}

- (BOOL)doScheduleParamCurve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 paramCurve:(id)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  uint64_t v13 = [v12 count];
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v14 = *(id *)kAVHCScope;
      if (v14)
      {
        uint64_t v15 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
          __int16 v23 = 1024;
          *(_DWORD *)int v24 = 654;
          *(_WORD *)&v24[4] = 2080;
          *(void *)&v24[6] = "-[AVHapticClient doScheduleParamCurve:atTime:channel:paramCurve:error:]";
          *(_WORD *)&v24[14] = 1024;
          *(_DWORD *)&v24[16] = [(AVHapticClient *)self clientID];
          __int16 v25 = 1024;
          int v26 = v13;
          __int16 v27 = 2048;
          double v28 = a4;
          _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing %u param curve control points from passed-in param curve array at time: %.3f", buf, 0x32u);
        }
      }
    }
  }
  [(AVHapticClient *)self calculateHapticCommandParamCurveMemorySize:v13];
  memset(buf, 0, sizeof(buf));
  *(void *)&v24[2] = 0;
  *(void *)&v24[10] = 0;
  if (reserveForWrite())
  {
    BOOL v16 = [(AVHapticClient *)self doScheduleParamCurveWithMemoryReserve:a3 atTime:a5 channel:buf memoryReserve:v12 paramCurve:a7 error:a4];
    id v17 = v12;
  }
  else
  {
    id v17 = [v12 sortedArrayUsingComparator:&__block_literal_global_354];

    unint64_t IndexOfSplit = HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(v17);
    uint64_t v19 = objc_msgSend(v17, "subarrayWithRange:", 0, IndexOfSplit);
    if ([(AVHapticClient *)self doScheduleParamCurve:a3 atTime:a5 channel:v19 paramCurve:a7 error:a4])
    {
      uint64_t v20 = objc_msgSend(v17, "subarrayWithRange:", IndexOfSplit, v13 - IndexOfSplit);

      BOOL v16 = [(AVHapticClient *)self doScheduleParamCurve:a3 atTime:a5 channel:v20 paramCurve:a7 error:a4];
      uint64_t v19 = (void *)v20;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  return v16;
}

- (BOOL)doScheduleParamCurveWithMemoryReserve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 memoryReserve:(HapticSharedMemoryAddressReserve *)a6 paramCurve:(id)a7 error:(id *)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  __int16 v11 = [v10 objectAtIndexedSubscript:0];
  [v11 time];
  double v13 = v12;

  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v14 = *(id *)kAVHCScope;
      if (v14)
      {
        uint64_t v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          *(void *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 701;
          *(_WORD *)&v62[14] = 2080;
          *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = a3;
          *(_WORD *)&v62[30] = 2048;
          *(double *)&v62[32] = a4;
          *(_WORD *)&v62[40] = 2048;
          *(double *)&v62[42] = v13;
          *(_WORD *)&v62[50] = 2048;
          *(double *)&v62[52] = v13 + a4;
          _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: => StartParamCurveList (paramID %u) at (relative-to-event-list) original time %.3f + firstPointTimeOffset %.3f = adjusted time %.3f", buf, 0x40u);
        }
      }
    }
  }
  unsigned int v16 = [v10 count];
  unsigned int v51 = v16;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v17 = *(id *)kAVHCScope;
      if (v17)
      {
        id v18 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 704;
          *(_WORD *)&v62[14] = 2080;
          *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = v16;
          _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u curve points", buf, 0x22u);
        }
      }
    }
  }
  *(_DWORD *)buf = 589936;
  *(double *)&v62[4] = v13 + a4;
  *(void *)&v62[12] = a5;
  *(void *)&v62[20] = a3;
  memset(&v62[28], 0, 76);
  if (!writeCommandToReserved())
  {
    if (kAVHCScope)
    {
      int v40 = *(id *)kAVHCScope;
      if (!v40) {
        goto LABEL_53;
      }
    }
    else
    {
      int v40 = MEMORY[0x1E4F14500];
      id v41 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 707;
      *(_WORD *)&v62[14] = 2080;
      *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1BA902000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

LABEL_53:
    if (a8)
    {
      id v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
LABEL_67:
      BOOL v39 = 0;
      *a8 = v42;
      goto LABEL_75;
    }
LABEL_74:
    BOOL v39 = 0;
    goto LABEL_75;
  }
  if (v16)
  {
    unsigned int v20 = 0;
    double v21 = 0.0;
    *(void *)&long long v19 = 136316162;
    long long v48 = v19;
    while (1)
    {
      int v60 = 0;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      if (v20 + 16 <= v16) {
        unint64_t v22 = 16;
      }
      else {
        unint64_t v22 = v16 - v20;
      }
      long long v52 = 0uLL;
      long long v53 = 0uLL;
      if (v22)
      {
        unint64_t v23 = 0;
        int v24 = (float *)&v52 + 2;
        do
        {
          __int16 v25 = objc_msgSend(v10, "objectAtIndexedSubscript:", v20 + v23, v48);
          [v25 time];
          *(float *)&double v26 = v26 - v21 - v13;
          *(v24 - 1) = *(float *)&v26;
          [v25 value];
          clientParamToSynthParam();
          if (kAVHCScope)
          {
            if (*(unsigned char *)(kAVHCScope + 8))
            {
              __int16 v27 = *(id *)kAVHCScope;
              if (v27)
              {
                double v28 = v27;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  double v29 = *(v24 - 1);
                  double v30 = *v24;
                  *(_DWORD *)buf = 136316674;
                  *(void *)v62 = "AVHapticClient.mm";
                  *(_WORD *)&v62[8] = 1024;
                  *(_DWORD *)&v62[10] = 732;
                  *(_WORD *)&v62[14] = 2080;
                  *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryRese"
                                        "rve:paramCurve:error:]";
                  *(_WORD *)&v62[24] = 1024;
                  *(_DWORD *)&v62[26] = v20 + v23;
                  *(_WORD *)&v62[30] = 1024;
                  *(_DWORD *)&v62[32] = 0;
                  *(_WORD *)&v62[36] = 2048;
                  *(double *)&v62[38] = v29;
                  *(_WORD *)&v62[46] = 2048;
                  *(double *)&v62[48] = v30;
                  _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Point #%u for synth param[%u]: adjusted rel time: %.3f, converted value: %f", buf, 0x3Cu);
                }
              }
            }
          }

          ++v23;
          v24 += 2;
        }
        while (v23 < v22);
      }
      LODWORD(v52) = v22;
      double v31 = v21;
      unsigned int v16 = v51;
      if (v20 + 16 <= v51)
      {
        uint64_t v32 = [v10 objectAtIndexedSubscript:v20 + 15];
        [v32 time];
        double v34 = v33;

        double v31 = v34 - v13;
        unsigned int v16 = v51;
      }
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          __int16 v35 = *(id *)kAVHCScope;
          if (v35)
          {
            id v36 = v35;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v48;
              *(void *)v62 = "AVHapticClient.mm";
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = 742;
              *(_WORD *)&v62[14] = 2080;
              *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:"
                                    "paramCurve:error:]";
              *(_WORD *)&v62[24] = 1024;
              *(_DWORD *)&v62[26] = a3;
              *(_WORD *)&v62[30] = 2048;
              *(double *)&v62[32] = v21;
              _os_log_impl(&dword_1BA902000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: == AddParamCurve (paramID %u) rel time %.3f", buf, 0x2Cu);
            }

            unsigned int v16 = v51;
          }
        }
      }
      long long v64 = v58;
      long long v65 = v59;
      int v66 = v60;
      *(_OWORD *)&v62[60] = v54;
      *(_OWORD *)&v62[76] = v55;
      *(_OWORD *)&v62[92] = v56;
      long long v63 = v57;
      *(_OWORD *)&v62[28] = v52;
      *(_OWORD *)&v62[44] = v53;
      *(_DWORD *)buf = 655524;
      *(double *)&v62[4] = v21;
      *(void *)&v62[12] = a5;
      *(void *)&v62[20] = a3;
      if ((writeCommandToReserved() & 1) == 0) {
        break;
      }
      v20 += 15;
      double v21 = v31;
      if (v20 >= v16) {
        goto LABEL_38;
      }
    }
    if (kAVHCScope)
    {
      uint64_t v44 = *(id *)kAVHCScope;
      if (!v44)
      {
LABEL_72:
        if (a8)
        {
          *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
        }
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v44 = MEMORY[0x1E4F14500];
      id v46 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 743;
      *(_WORD *)&v62[14] = 2080;
      *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1BA902000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_72;
  }
LABEL_38:
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      __int16 v37 = *(id *)kAVHCScope;
      if (v37)
      {
        uint64_t v38 = v37;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          *(void *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 748;
          *(_WORD *)&v62[14] = 2080;
          *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = a3;
          *(_WORD *)&v62[30] = 2048;
          *(double *)&v62[32] = a4;
          *(_WORD *)&v62[40] = 2048;
          *(double *)&v62[42] = v13;
          *(_WORD *)&v62[50] = 2048;
          *(double *)&v62[52] = v13 + a4;
          _os_log_impl(&dword_1BA902000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <= EndParamCurveList (paramID %u) at  original time %f + firstPointTimeOffset %.3f = adjusted time %.3f", buf, 0x40u);
        }
      }
    }
  }
  memset(&v62[28], 0, 76);
  *(_DWORD *)buf = 721008;
  *(double *)&v62[4] = v13 + a4;
  *(void *)&v62[12] = a5;
  *(void *)&v62[20] = a3;
  if ((writeCommandToReserved() & 1) == 0)
  {
    if (kAVHCScope)
    {
      __int16 v43 = *(id *)kAVHCScope;
      if (!v43) {
        goto LABEL_65;
      }
    }
    else
    {
      __int16 v43 = MEMORY[0x1E4F14500];
      id v45 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 749;
      *(_WORD *)&v62[14] = 2080;
      *(void *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1BA902000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

LABEL_65:
    if (a8)
    {
      id v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4899 userInfo:0];
      goto LABEL_67;
    }
    goto LABEL_74;
  }
  BOOL v39 = 1;
LABEL_75:

  return v39;
}

- (BOOL)clearEventsFromTime:(double)a3 channel:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)&v12[0] = "AVHapticClient.mm";
          WORD4(v12[0]) = 1024;
          *(_DWORD *)((char *)v12 + 10) = 763;
          HIWORD(v12[0]) = 2080;
          *(void *)&v12[1] = "-[AVHapticClient clearEventsFromTime:channel:]";
          WORD4(v12[1]) = 1024;
          *(_DWORD *)((char *)&v12[1] + 10) = [(AVHapticClient *)v6 clientID];
          HIWORD(v12[1]) = 2048;
          *(double *)&v12[2] = a3;
          WORD4(v12[2]) = 1024;
          *(_DWORD *)((char *)&v12[2] + 10) = 4;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing command: time: %.3f type: %hu", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset((char *)&v12[1] + 4, 0, 84);
  int v11 = 262256;
  *(double *)((char *)v12 + 4) = a3;
  *(void *)((char *)v12 + 12) = a4;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)setParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 channel:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = self;
  objc_sync_enter(v10);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v11 = *(id *)kAVHCScope;
      if (v11)
      {
        double v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 136316930;
          *(void *)unsigned int v16 = "AVHapticClient.mm";
          *(_WORD *)&v16[8] = 1024;
          *(_DWORD *)&v16[10] = 771;
          *(_WORD *)&v16[14] = 2080;
          *(void *)&v16[16] = "-[AVHapticClient setParameter:atTime:value:channel:]";
          *(_WORD *)&v16[24] = 1024;
          *(_DWORD *)&v16[26] = [(AVHapticClient *)v10 clientID];
          *(_WORD *)&v16[30] = 2048;
          *(double *)&long long v17 = a4;
          WORD4(v17) = 1024;
          *(_DWORD *)((char *)&v17 + 10) = 3;
          HIWORD(v17) = 1024;
          LODWORD(v18) = a3;
          WORD2(v18) = 2048;
          *(double *)((char *)&v18 + 6) = a5;
          _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing command: time: %.3f type: %hu ID: %u, value: %f", (uint8_t *)&v15, 0x42u);
        }
      }
    }
  }
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  int v15 = 196644;
  *(double *)&v16[4] = a4;
  *(void *)&v16[12] = a6;
  *(void *)&v16[20] = a3;
  *(float *)&v16[28] = a5;
  char v13 = writeCommand();
  objc_sync_exit(v10);

  return v13;
}

- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 error:(id *)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  char v13 = self;
  objc_sync_enter(v13);
  if (![(AVHapticClient *)v13 doScheduleParamCurve:a3 atTime:a6 channel:v12 paramCurve:a7 error:a5])
  {
    if (kAVHCScope)
    {
      id v15 = *(id *)kAVHCScope;
      if (!v15) {
        goto LABEL_9;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    long long v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:]([(AVHapticClient *)v13 clientID], v18, v17);
    }

LABEL_9:
    -[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:]();
  }
  objc_sync_exit(v13);

  return 1;
}

- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, double))a4;
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
  id v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = 793;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v7;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading sequence: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  *(void *)&unsigned char buf[40] = 0;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  uint64_t v30 = 0;
  double v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke;
  v25[3] = &unk_1E622E2E8;
  v25[4] = buf;
  id v12 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke_2;
  v24[3] = &unk_1E622E338;
  v24[4] = &v34;
  v24[5] = &v30;
  v24[6] = &v26;
  v24[7] = buf;
  [v12 loadHapticSequenceFromData:v7 reply:v24];
  char v13 = (id *)(*(void *)&buf[8] + 40);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v15 = v35[3];
    id obj = 0;
    [(AVHapticClient *)self prepareHapticSequence:v15 error:&obj];
    objc_storeStrong(v13, obj);
    uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
    BOOL v17 = v16 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    id v14 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  id v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_14:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v38 = 136315906;
      BOOL v39 = "AVHapticClient.mm";
      __int16 v40 = 1024;
      int v41 = 811;
      __int16 v42 = 2080;
      __int16 v43 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
      __int16 v44 = 2048;
      uint64_t v45 = v19;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %p", v38, 0x26u);
    }
  }
  BOOL v17 = 0;
  uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v35[3], v27[3], v16, v31[3]);
  if (kAVHCScope)
  {
    long long v20 = *(id *)kAVHCScope;
    if (!v20) {
      goto LABEL_25;
    }
  }
  else
  {
    long long v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v38 = 136315650;
    BOOL v39 = "AVHapticClient.mm";
    __int16 v40 = 1024;
    int v41 = 819;
    __int16 v42 = 2080;
    __int16 v43 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
    _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading sequence", v38, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v11 = *(id *)kAVHCScope;
      if (v11)
      {
        id v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 136315650;
          uint64_t v16 = "AVHapticClient.mm";
          __int16 v17 = 1024;
          int v18 = 802;
          __int16 v19 = 2080;
          long long v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]_block_invoke_2";
          _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromData:reply: top of [serverDelegate loadHapticSequenceFromData] reply block", (uint8_t *)&v15, 0x1Cu);
        }
      }
    }
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(void *)(a1[5] + 8) + 24) = a5;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  if (v10)
  {
    if (kAVHCScope)
    {
      char v13 = *(id *)kAVHCScope;
      if (!v13) {
        goto LABEL_15;
      }
    }
    else
    {
      char v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = "AVHapticClient.mm";
      __int16 v17 = 1024;
      int v18 = 807;
      __int16 v19 = 2080;
      long long v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]_block_invoke";
      __int16 v21 = 2048;
      id v22 = v10;
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %p", (uint8_t *)&v15, 0x26u);
    }
  }
LABEL_15:
}

- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, double))a4;
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
  id v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = 826;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading sequence from event array", buf, 0x22u);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v47 = 0;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  uint64_t v30 = 0;
  double v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke;
  v25[3] = &unk_1E622E2E8;
  v25[4] = buf;
  id v12 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke_2;
  v24[3] = &unk_1E622E338;
  v24[4] = &v34;
  v24[5] = &v30;
  v24[6] = &v26;
  v24[7] = buf;
  [v12 loadHapticSequenceFromEvents:v7 reply:v24];
  char v13 = (id *)(*(void *)&buf[8] + 40);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v15 = v35[3];
    id obj = 0;
    [(AVHapticClient *)self prepareHapticSequence:v15 error:&obj];
    objc_storeStrong(v13, obj);
    uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
    BOOL v17 = v16 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    id v14 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  id v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_14:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v38 = 136315906;
      BOOL v39 = "AVHapticClient.mm";
      __int16 v40 = 1024;
      int v41 = 844;
      __int16 v42 = 2080;
      __int16 v43 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
      __int16 v44 = 2112;
      uint64_t v45 = v19;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v38, 0x26u);
    }
  }
  BOOL v17 = 0;
  uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v35[3], v27[3], v16, v31[3]);
  if (kAVHCScope)
  {
    long long v20 = *(id *)kAVHCScope;
    if (!v20) {
      goto LABEL_25;
    }
  }
  else
  {
    long long v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v38 = 136315650;
    BOOL v39 = "AVHapticClient.mm";
    __int16 v40 = 1024;
    int v41 = 852;
    __int16 v42 = 2080;
    __int16 v43 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
    _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading sequence", v38, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v11 = *(id *)kAVHCScope;
      if (v11)
      {
        id v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 136315650;
          uint64_t v16 = "AVHapticClient.mm";
          __int16 v17 = 1024;
          int v18 = 835;
          __int16 v19 = 2080;
          long long v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]_block_invoke_2";
          _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromEvents:reply: top of [serverDelegate loadHapticSequenceFromEvents] reply block", (uint8_t *)&v15, 0x1Cu);
        }
      }
    }
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(void *)(a1[5] + 8) + 24) = a5;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  if (v10)
  {
    if (kAVHCScope)
    {
      char v13 = *(id *)kAVHCScope;
      if (!v13) {
        goto LABEL_15;
      }
    }
    else
    {
      char v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "AVHapticClient.mm";
      __int16 v17 = 1024;
      int v18 = 840;
      __int16 v19 = 2112;
      long long v20 = v10;
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Got error from server: %@", (uint8_t *)&v15, 0x1Cu);
    }
  }
LABEL_15:
}

- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, uint64_t))a4;
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
  id v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = 858;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v7;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading pattern: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  *(void *)&unsigned char buf[40] = 0;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke;
  v25[3] = &unk_1E622E2E8;
  v25[4] = buf;
  id v12 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke_2;
  v24[3] = &unk_1E622E2C0;
  v24[4] = &v26;
  v24[5] = buf;
  [v12 loadVibePattern:v7 reply:v24];
  char v13 = (id *)(*(void *)&buf[8] + 40);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v15 = v27[3];
    id obj = 0;
    [(AVHapticClient *)self prepareHapticSequence:v15 error:&obj];
    objc_storeStrong(v13, obj);
    uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
    BOOL v17 = v16 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    id v14 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  id v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_14:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v30 = 136315906;
      double v31 = "AVHapticClient.mm";
      __int16 v32 = 1024;
      int v33 = 872;
      __int16 v34 = 2080;
      __int16 v35 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
      __int16 v36 = 2112;
      uint64_t v37 = v19;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v30, 0x26u);
    }
  }
  BOOL v17 = 0;
  uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v27[3], v16);
  if (kAVHCScope)
  {
    long long v20 = *(id *)kAVHCScope;
    if (!v20) {
      goto LABEL_25;
    }
  }
  else
  {
    long long v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v30 = 136315650;
    double v31 = "AVHapticClient.mm";
    __int16 v32 = 1024;
    int v33 = 880;
    __int16 v34 = 2080;
    __int16 v35 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading pattern", v30, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136315650;
          id v12 = "AVHapticClient.mm";
          __int16 v13 = 1024;
          int v14 = 865;
          __int16 v15 = 2080;
          uint64_t v16 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]_block_invoke_2";
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromVibePattern:reply: top of [serverDelegate loadVibePattern] reply block", (uint8_t *)&v11, 0x1Cu);
        }
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      id v9 = *(id *)kAVHCScope;
      if (!v9) {
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      id v12 = "AVHapticClient.mm";
      __int16 v13 = 1024;
      int v14 = 868;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v11, 0x26u);
    }
  }
LABEL_15:
}

- (BOOL)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channel:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  id v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = 886;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = a4;
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x, seqID %u, behavior %u", buf, 0x2Eu);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v32 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke;
  v22[3] = &unk_1E622E2E8;
  v22[4] = buf;
  __int16 v13 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke_2;
  v21[3] = &unk_1E622E2E8;
  uint8_t v21[4] = buf;
  [v13 setSequenceEventBehavior:a3 behavior:a4 channelIndex:a5 reply:v21];
  uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
  if (!v14) {
    goto LABEL_16;
  }
  if (kAVHCScope)
  {
    __int16 v15 = *(id *)kAVHCScope;
    if (!v15) {
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v23 = 136315906;
    long long v24 = "AVHapticClient.mm";
    __int16 v25 = 1024;
    int v26 = 897;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    __int16 v29 = 2112;
    uint64_t v30 = v17;
    _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v23, 0x26u);
  }

LABEL_16:
  if (kAVHCScope)
  {
    id v18 = *(id *)kAVHCScope;
    if (!v18) {
      goto LABEL_23;
    }
  }
  else
  {
    id v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v23 = 136315650;
    long long v24 = "AVHapticClient.mm";
    __int16 v25 = 1024;
    int v26 = 902;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done setting behavior", v23, 0x1Cu);
  }

LABEL_23:
  _Block_object_dispose(buf, 8);

  return v14 == 0;
}

void __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke(uint64_t a1, void *a2)
{
}

void __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      id v5 = *(id *)kAVHCScope;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 893;
      __int16 v11 = 2080;
      id v12 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }
  }
LABEL_9:
}

- (void)setSequenceFinishedHandlerForID:(unint64_t)a3 finishedHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v20 = a3;
  id v6 = a4;
  int v7 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  int v10 = (void *)*((void *)self + 16);
  __int16 v9 = (uint64_t **)((char *)self + 128);
  id v8 = v10;
  __int16 v11 = v9 - 1;
  if (v10)
  {
    uint64_t v12 = (uint64_t)v9;
    do
    {
      unint64_t v13 = v8[4];
      BOOL v14 = v13 >= a3;
      if (v13 >= a3) {
        uint64_t v15 = v8;
      }
      else {
        uint64_t v15 = v8 + 1;
      }
      if (v14) {
        uint64_t v12 = (uint64_t)v8;
      }
      id v8 = (void *)*v15;
    }
    while (*v15);
    if ((uint64_t **)v12 != v9 && *(void *)(v12 + 32) <= a3) {
      std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(v9 - 1, v12);
    }
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v16 = *(id *)kAVHCScope;
      if (v16)
      {
        uint64_t v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v18 = (void *)MEMORY[0x1BA9F2D90](v6);
          *(_DWORD *)buf = 136316162;
          id v22 = "AVHapticClient.mm";
          __int16 v23 = 1024;
          int v24 = 914;
          __int16 v25 = 2080;
          int v26 = "-[AVHapticClient setSequenceFinishedHandlerForID:finishedHandler:]";
          __int16 v27 = 2048;
          uint64_t v28 = v18;
          __int16 v29 = 1024;
          int v30 = a3;
          _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Caching sequence finished handler block %p for seqID %u", buf, 0x2Cu);
        }
      }
    }
  }
  id v19 = [[AVHapticSequenceEntry alloc] initWithHandler:v6];
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__emplace_unique_key_args<unsigned long,unsigned long &,AVHapticSequenceEntry * {__strong}>(v11, &v20, (uint64_t *)&v20, (uint64_t *)&v19);

  std::mutex::unlock(v7);
}

- (id)getSequenceFinishedHandlerForID:(unint64_t)a3
{
  id v5 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  id v8 = (void *)*((void *)self + 16);
  int v7 = (char *)self + 128;
  id v6 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  __int16 v9 = (id *)v7;
  do
  {
    unint64_t v10 = v6[4];
    BOOL v11 = v10 >= a3;
    if (v10 >= a3) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = v6 + 1;
    }
    if (v11) {
      __int16 v9 = (id *)v6;
    }
    id v6 = (void *)*v12;
  }
  while (*v12);
  if (v9 != (id *)v7 && (unint64_t)v9[4] <= a3)
  {
    uint64_t v15 = [v9[5] handler];
    unint64_t v13 = (void *)MEMORY[0x1BA9F2D90]();
  }
  else
  {
LABEL_12:
    unint64_t v13 = 0;
  }
  std::mutex::unlock(v5);

  return v13;
}

- (void)callSequenceFinishedHandlersWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    uint64_t v15 = "AVHapticClient.mm";
    __int16 v16 = 1024;
    int v17 = 927;
    __int16 v18 = 2080;
    id v19 = "-[AVHapticClient callSequenceFinishedHandlersWithError:]";
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling completion handlers on any active sequences", (uint8_t *)&v14, 0x1Cu);
  }

LABEL_8:
  std::mutex::lock((std::mutex *)((char *)self + 56));
  int v7 = (char *)*((void *)self + 15);
  id v8 = (char *)self + 128;
  if (v7 != (char *)self + 128)
  {
    do
    {
      id v9 = *((id *)v7 + 5);
      unint64_t v10 = [v9 handler];
      ((void (**)(void, id))v10)[2](v10, v4);

      BOOL v11 = (char *)*((void *)v7 + 1);
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          BOOL v11 = *(char **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (char *)*((void *)v7 + 2);
          BOOL v13 = *(void *)v12 == (void)v7;
          int v7 = v12;
        }
        while (!v13);
      }
      int v7 = v12;
    }
    while (v12 != v8);
  }
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy((uint64_t)self + 120, *((void **)self + 16));
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 15) = v8;
  std::mutex::unlock((std::mutex *)((char *)self + 56));
}

- (void)setRunStateForSequenceEntryWithID:(unint64_t)a3 running:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  unint64_t v10 = (void *)*((void *)self + 16);
  id v9 = (char *)self + 128;
  id v8 = v10;
  if (v10)
  {
    BOOL v11 = (id *)v9;
    do
    {
      unint64_t v12 = v8[4];
      BOOL v13 = v12 >= a3;
      if (v12 >= a3) {
        int v14 = v8;
      }
      else {
        int v14 = v8 + 1;
      }
      if (v13) {
        BOOL v11 = (id *)v8;
      }
      id v8 = (void *)*v14;
    }
    while (*v14);
    if (v11 != (id *)v9 && (unint64_t)v11[4] <= a3) {
      [v11[5] setRunning:v4];
    }
  }

  std::mutex::unlock(v7);
}

- (void)detachSequenceEntryforID:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  id v8 = (void *)*((void *)self + 16);
  int v7 = (char *)self + 128;
  id v6 = v8;
  if (v8)
  {
    id v9 = (uint64_t **)(v7 - 8);
    uint64_t v10 = (uint64_t)v7;
    do
    {
      unint64_t v11 = v6[4];
      BOOL v12 = v11 >= a3;
      if (v11 >= a3) {
        BOOL v13 = v6;
      }
      else {
        BOOL v13 = v6 + 1;
      }
      if (v12) {
        uint64_t v10 = (uint64_t)v6;
      }
      id v6 = (void *)*v13;
    }
    while (*v13);
    if ((char *)v10 != v7 && *(void *)(v10 + 32) <= a3)
    {
      if ([*(id *)(v10 + 40) running])
      {
        if (kAVHCScope)
        {
          if (*(unsigned char *)(kAVHCScope + 8))
          {
            int v14 = *(id *)kAVHCScope;
            if (v14)
            {
              uint64_t v15 = v14;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                int v18 = 136315906;
                id v19 = "AVHapticClient.mm";
                __int16 v20 = 1024;
                int v21 = 950;
                __int16 v22 = 2080;
                __int16 v23 = "-[AVHapticClient detachSequenceEntryforID:]";
                __int16 v24 = 1024;
                int v25 = a3;
                _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sequence %u is running - setting entry to detached", (uint8_t *)&v18, 0x22u);
              }
            }
          }
        }
        [*(id *)(v10 + 40) setDetached:1];
      }
      else
      {
        if (kAVHCScope)
        {
          if (*(unsigned char *)(kAVHCScope + 8))
          {
            __int16 v16 = *(id *)kAVHCScope;
            if (v16)
            {
              int v17 = v16;
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                int v18 = 136315906;
                id v19 = "AVHapticClient.mm";
                __int16 v20 = 1024;
                int v21 = 954;
                __int16 v22 = 2080;
                __int16 v23 = "-[AVHapticClient detachSequenceEntryforID:]";
                __int16 v24 = 1024;
                int v25 = a3;
                _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sequence %u is not running - deleting entry", (uint8_t *)&v18, 0x22u);
              }
            }
          }
        }
        std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(v9, v10);
      }
    }
  }
  std::mutex::unlock(v5);
}

- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  uint64_t v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticClient.mm";
    *(_DWORD *)&buf[14] = 962;
    *(_WORD *)&buf[18] = 2080;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(void *)&buf[20] = "-[AVHapticClient prepareHapticSequence:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = [(AVHapticClient *)self clientID];
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x preparing sequenceID: %u", buf, 0x28u);
  }

LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__1;
  *(void *)&buf[32] = __Block_byref_object_dispose__1;
  id v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__AVHapticClient_prepareHapticSequence_error___block_invoke;
  v20[3] = &unk_1E622E2E8;
  v20[4] = buf;
  unint64_t v11 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__AVHapticClient_prepareHapticSequence_error___block_invoke_2;
  v19[3] = &unk_1E622E2E8;
  uint8_t v19[4] = buf;
  [v11 prepareHapticSequence:a3 reply:v19];
  uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
  if (!v12) {
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    BOOL v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    goto LABEL_13;
  }
  BOOL v13 = *(id *)kAVHCScope;
  if (v13)
  {
LABEL_13:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)int v21 = 136315906;
      __int16 v22 = "AVHapticClient.mm";
      __int16 v23 = 1024;
      int v24 = 974;
      __int16 v25 = 2080;
      uint64_t v26 = "-[AVHapticClient prepareHapticSequence:error:]";
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v21, 0x26u);
    }
  }
  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
LABEL_18:
  if (kAVHCScope)
  {
    __int16 v16 = *(id *)kAVHCScope;
    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
    __int16 v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v21 = 136315650;
    __int16 v22 = "AVHapticClient.mm";
    __int16 v23 = 1024;
    int v24 = 982;
    __int16 v25 = 2080;
    uint64_t v26 = "-[AVHapticClient prepareHapticSequence:error:]";
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done preparing", v21, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(buf, 8);

  return v12 == 0;
}

void __46__AVHapticClient_prepareHapticSequence_error___block_invoke(uint64_t a1, void *a2)
{
}

void __46__AVHapticClient_prepareHapticSequence_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v5 = *(id *)kAVHCScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          int v9 = 136315650;
          uint64_t v10 = "AVHapticClient.mm";
          __int16 v11 = 1024;
          int v12 = 968;
          __int16 v13 = 2080;
          id v14 = "-[AVHapticClient prepareHapticSequence:error:]_block_invoke_2";
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: prepareHapticSequence:error: top of [serverDelegate prepareHapticSequence] reply block", (uint8_t *)&v9, 0x1Cu);
        }
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      int v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_15;
      }
    }
    else
    {
      int v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = "AVHapticClient.mm";
      __int16 v11 = 1024;
      int v12 = 970;
      __int16 v13 = 2080;
      id v14 = "-[AVHapticClient prepareHapticSequence:error:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }
  }
LABEL_15:
}

- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v9 = *(id *)kAVHCScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136316418;
          *(void *)__int16 v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 991;
          *(_WORD *)&v15[14] = 2080;
          *(void *)&v15[16] = "-[AVHapticClient enableSequenceLooping:enable:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          float v16 = *(float *)&a3;
          LOWORD(v17) = 1024;
          *(_DWORD *)((char *)&v17 + 2) = v6;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u looping: %d", (uint8_t *)&v14, 0x2Eu);
        }
      }
    }
  }
  memset(v23, 0, sizeof(v23));
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  int v14 = 1441832;
  *(void *)&void v15[4] = 0;
  *(void *)&v15[12] = a3;
  *(void *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 101;
  float v16 = (float)v6;
  char v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4811 userInfo:0];
  }
  return v11;
}

- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v9 = *(id *)kAVHCScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136316418;
          *(void *)__int16 v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 1006;
          *(_WORD *)&v15[14] = 2080;
          *(void *)&v15[16] = "-[AVHapticClient setSequenceLoopLength:length:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          float v16 = *(float *)&a3;
          LOWORD(v17) = 2048;
          *(double *)((char *)&v17 + 2) = a4;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u loop length: %f", (uint8_t *)&v14, 0x32u);
        }
      }
    }
  }
  memset(v23, 0, sizeof(v23));
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  int v14 = 1441832;
  *(void *)&void v15[4] = 0;
  *(void *)&v15[12] = a3;
  *(void *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 102;
  float v16 = a4;
  char v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4811 userInfo:0];
  }
  return v11;
}

- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v9 = *(id *)kAVHCScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136316418;
          *(void *)__int16 v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 1021;
          *(_WORD *)&v15[14] = 2080;
          *(void *)&v15[16] = "-[AVHapticClient setSequencePlaybackRate:rate:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          float v16 = *(float *)&a3;
          LOWORD(v17) = 2048;
          *(double *)((char *)&v17 + 2) = a4;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u rate: %f", (uint8_t *)&v14, 0x32u);
        }
      }
    }
  }
  memset(v23, 0, sizeof(v23));
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  int v14 = 1441832;
  *(void *)&void v15[4] = 0;
  *(void *)&v15[12] = a3;
  *(void *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 103;
  float v16 = a4;
  char v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4811 userInfo:0];
  }
  return v11;
}

- (BOOL)startHapticSequence:(unint64_t)a3 atTime:(double)a4 withOffset:(double)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v9 = *(id *)kAVHCScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v13 = 136316674;
          *(void *)int v14 = "AVHapticClient.mm";
          *(_WORD *)&v14[8] = 1024;
          *(_DWORD *)&v14[10] = 1034;
          *(_WORD *)&v14[14] = 2080;
          *(void *)&v14[16] = "-[AVHapticClient startHapticSequence:atTime:withOffset:]";
          *(_WORD *)&v14[24] = 2048;
          *(double *)&v14[26] = a4;
          *(_WORD *)&v14[34] = 1024;
          LODWORD(v15[0]) = 20;
          WORD2(v15[0]) = 1024;
          *(_DWORD *)((char *)v15 + 6) = a3;
          WORD5(v15[0]) = 2048;
          *(double *)((char *)v15 + 12) = a5;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f type: %hu sequenceID: %u offset: %f", (uint8_t *)&v13, 0x3Cu);
        }
      }
    }
  }
  memset(v15, 0, 124);
  int v13 = 1310760;
  *(double *)&void v14[4] = a4;
  *(void *)&v14[12] = a3;
  *(void *)&v14[20] = 51;
  *(double *)&v14[28] = a5;
  int v11 = writeCommand();
  if (v11) {
    [(AVHapticClient *)v8 setRunStateForSequenceEntryWithID:a3 running:1];
  }
  objc_sync_exit(v8);

  return v11;
}

- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1048;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient stopHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 52;
  *(void *)&v12[28] = 0xBFF0000000000000;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1056;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient pauseHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 53;
  *(void *)&v12[28] = 0xBFF0000000000000;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1064;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient resumeHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 54;
  *(void *)&v12[28] = 0xBFF0000000000000;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1073;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient seekHapticSequence:toTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(void *)&v12[26] = 0;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(void *)&void v12[4] = 0;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 55;
  *(double *)&v12[28] = a4;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1081;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient resetHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 56;
  *(void *)&v12[28] = 0xBFF0000000000000;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1089;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient sendUnduckAudioCommand:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  memset(v19, 0, sizeof(v19));
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  int v11 = 1310760;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  *(void *)&v12[20] = 57;
  *(void *)&v12[28] = 0xBFF0000000000000;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)setSequenceChannelParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 sequenceID:(unint64_t)a6 channel:(unint64_t)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v12 = self;
  objc_sync_enter(v12);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      long long v13 = *(id *)kAVHCScope;
      if (v13)
      {
        long long v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 136317186;
          *(void *)long long v18 = "AVHapticClient.mm";
          *(_WORD *)&v18[8] = 1024;
          *(_DWORD *)&v18[10] = 1097;
          *(_WORD *)&v18[14] = 2080;
          *(void *)&v18[16] = "-[AVHapticClient setSequenceChannelParameter:atTime:value:sequenceID:channel:]";
          *(_WORD *)&v18[24] = 2048;
          *(double *)&v18[26] = a4;
          *(_WORD *)&v18[34] = 1024;
          *(_DWORD *)long long v19 = 21;
          *(_WORD *)&uint8_t v19[4] = 1024;
          *(_DWORD *)&v19[6] = a6;
          *(_WORD *)&v19[10] = 1024;
          LODWORD(v20[0]) = a7;
          WORD2(v20[0]) = 1024;
          *(_DWORD *)((char *)v20 + 6) = a3;
          WORD5(v20[0]) = 2048;
          *(double *)((char *)v20 + 12) = a5;
          _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f type: %hu sequenceID: %u channel: %u param: %u value: %.3f", (uint8_t *)&v17, 0x48u);
        }
      }
    }
  }
  memset(v20, 0, sizeof(v20));
  int v17 = 1376312;
  *(double *)&void v18[4] = a4;
  *(void *)&v18[12] = a6;
  *(void *)&v18[20] = 0;
  *(void *)&v18[28] = a7;
  *(void *)long long v19 = a3;
  *(float *)&v19[8] = a5;
  char v15 = writeCommand();
  objc_sync_exit(v12);

  return v15;
}

- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      int v7 = *(id *)kAVHCScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316418;
          *(void *)char v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&_OWORD v12[10] = 1105;
          *(_WORD *)&v12[14] = 2080;
          *(void *)&v12[16] = "-[AVHapticClient clearSequenceEvents:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 23;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }
      }
    }
  }
  int v17 = 0;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  *(_OWORD *)&v12[20] = 0u;
  int v11 = 1507440;
  *(double *)&void v12[4] = a4;
  *(void *)&v12[12] = a3;
  char v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (void)detachHapticSequence:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136316162;
    int v11 = "AVHapticClient.mm";
    int v13 = 1113;
    __int16 v14 = 2080;
    __int16 v12 = 1024;
    long long v15 = "-[AVHapticClient detachHapticSequence:]";
    __int16 v16 = 1024;
    int v17 = [(AVHapticClient *)v5 clientID];
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x detaching sequenceID %u", (uint8_t *)&v10, 0x28u);
  }

LABEL_8:
  char v9 = [(AVHapticClient *)v5 getAsyncDelegateForMethod:a2 errorHandler:&__block_literal_global_65];
  [(AVHapticClient *)v5 detachSequenceEntryforID:a3];
  [v9 detachSequence:a3];

  objc_sync_exit(v5);
}

- (void)releaseResources
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    int v10 = "AVHapticClient.mm";
    __int16 v11 = 1024;
    int v12 = 1124;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVHapticClient releaseResources]";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: releasing resources", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_8:
  [(AVHapticClient *)self destroySharedMemory];
  id v6 = [(AVHapticClient *)self getAsyncDelegateForMethod:a2 errorHandler:&__block_literal_global_67];
  [v6 releaseClientResources];
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    int v10 = "AVHapticClient.mm";
    __int16 v11 = 1024;
    int v12 = 1129;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVHapticClient releaseResources]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: done releasing", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_15:
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleServerConnectionInterruption];
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleServerConnectionInvalidation];
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_144(uint64_t a1, void *a2)
{
}

void __57__AVHapticClient_getAsyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      int v9 = [WeakRetained clientID];
      int v10 = [v3 localizedDescription];
      int v11 = 136316418;
      int v12 = "AVHapticClient.mm";
      __int16 v13 = 1024;
      int v14 = 1232;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVHapticClient getAsyncDelegateForMethod:errorHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2112;
      long long v22 = v10;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Async XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__AVHapticClient_getSyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      int v9 = [WeakRetained clientID];
      int v10 = [v3 localizedDescription];
      int v11 = 136316418;
      int v12 = "AVHapticClient.mm";
      __int16 v13 = 1024;
      int v14 = 1243;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVHapticClient getSyncDelegateForMethod:errorHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2112;
      long long v22 = v10;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Sync XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disconnect
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(AVHapticClient *)self connected]) {
    return;
  }
  [(AVHapticClient *)self setConnected:0];
  if (!kAVHCScope)
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  id v3 = *(id *)kAVHCScope;
  if (v3)
  {
LABEL_6:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 1254;
      __int16 v11 = 2080;
      int v12 = "-[AVHapticClient disconnect]";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Invalidating...", (uint8_t *)&v7, 0x1Cu);
    }
  }
  [*((id *)self + 1) invalidate];
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      return;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "AVHapticClient.mm";
    __int16 v9 = 1024;
    int v10 = 1256;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticClient disconnect]";
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done disconnecting", (uint8_t *)&v7, 0x1Cu);
  }
}

void __42__AVHapticClient_setPlayerBehavior_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)clearAssignedChannels
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__1;
  v4[4] = __Block_byref_object_dispose__1;
  id v5 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__AVHapticClient_clearAssignedChannels__block_invoke;
  v3[3] = &unk_1E622E2E8;
  v3[4] = v4;
  id v2 = [(AVHapticClient *)self getSyncDelegateForMethod:a2 errorHandler:v3];
  [v2 releaseChannels];

  _Block_object_dispose(v4, 8);
}

void __39__AVHapticClient_clearAssignedChannels__block_invoke(uint64_t a1, void *a2)
{
}

void __48__AVHapticClient_requestAssignedChannels_error___block_invoke(uint64_t a1, void *a2)
{
}

void __48__AVHapticClient_removeAssignedChannelID_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)handleServerConnectionInterruption
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v3 = [(AVHapticClient *)self clientID];
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v25 = "AVHapticClient.mm";
    __int16 v26 = 1024;
    int v27 = 1335;
    __int16 v28 = 2080;
    __int16 v29 = "-[AVHapticClient handleServerConnectionInterruption]";
    __int16 v30 = 1024;
    int v31 = v3;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] Entered (due to connection interruption) for client ID 0x%x", buf, 0x22u);
  }

LABEL_8:
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4811 userInfo:0];
  uint64_t v7 = *((void *)self + 6);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  [(AVHapticClient *)self callSequenceFinishedHandlersWithError:v6];
  objc_initWeak(&location, self);
  id v8 = *((void *)self + 18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVHapticClient_handleServerConnectionInterruption__block_invoke;
  block[3] = &unk_1E622E400;
  objc_copyWeak(&v22, &location);
  id v9 = v6;
  id v21 = v9;
  dispatch_async(v8, block);
  int v10 = self;
  objc_sync_enter(v10);
  if ([(AVHapticClient *)v10 running])
  {
    __int16 v11 = [(AVHapticClient *)v10 asyncStopCallback];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      if (kAVHCScope)
      {
        uint64_t v13 = *(id *)kAVHCScope;
        if (!v13)
        {
LABEL_19:
          __int16 v15 = [(AVHapticClient *)v10 asyncStopCallback];
          if ([(AVHapticClient *)v10 disconnecting]) {
            uint64_t v16 = 3;
          }
          else {
            uint64_t v16 = -1;
          }
          v15[2](v15, v16);

          __int16 v17 = (void *)*((void *)v10 + 23);
          *((void *)v10 + 23) = 0;

          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v25 = "AVHapticClient.mm";
        __int16 v26 = 1024;
        int v27 = 1354;
        __int16 v28 = 2080;
        __int16 v29 = "-[AVHapticClient handleServerConnectionInterruption]";
        _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: We were running, so call async stopped callback", buf, 0x1Cu);
      }

      goto LABEL_19;
    }
  }
LABEL_23:
  objc_sync_exit(v10);

  *((void *)v10 + 21) = -1;
  *((unsigned char *)v10 + 156) = 0;
  [(AVHapticClient *)v10 setState:0];
  if (kAVHCScope)
  {
    id v18 = *(id *)kAVHCScope;
    if (!v18) {
      goto LABEL_30;
    }
  }
  else
  {
    id v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v25 = "AVHapticClient.mm";
    __int16 v26 = 1024;
    int v27 = 1362;
    __int16 v28 = 2080;
    __int16 v29 = "-[AVHapticClient handleServerConnectionInterruption]";
    __int16 v30 = 1024;
    int v31 = v3;
    _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done handling crash for client ID 0x%x", buf, 0x22u);
  }

LABEL_30:
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __52__AVHapticClient_handleServerConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = [WeakRetained completionCallback];

  if (v3)
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4)
      {
LABEL_9:
        id v6 = [WeakRetained completionCallback];
        v6[2](v6, *(void *)(a1 + 32));

        [WeakRetained setCompletionCallback:0];
        goto LABEL_10;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      id v8 = "AVHapticClient.mm";
      __int16 v9 = 1024;
      int v10 = 1346;
      __int16 v11 = 2080;
      BOOL v12 = "-[AVHapticClient handleServerConnectionInterruption]_block_invoke";
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: We were waiting for a completion callback, so call it now", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)handleServerConnectionInvalidation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = [(AVHapticClient *)self clientID];
  if ([(AVHapticClient *)self connected])
  {
    if (kAVHCScope)
    {
      id v4 = *(id *)kAVHCScope;
      if (!v4)
      {
LABEL_12:
        id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4811 userInfo:0];
        uint64_t v7 = *((void *)self + 6);
        if (v7) {
          (*(void (**)(uint64_t, NSObject *))(v7 + 16))(v7, v5);
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315906;
      BOOL v12 = "AVHapticClient.mm";
      __int16 v13 = 1024;
      int v14 = 1369;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] Entered (due to connection invalidation) for client ID 0x%x", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  if (!kAVHCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
LABEL_15:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315906;
      BOOL v12 = "AVHapticClient.mm";
      __int16 v13 = 1024;
      int v14 = 1377;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Entered (due to client disconnect) for client ID 0x%x", (uint8_t *)&v11, 0x22u);
    }
    goto LABEL_17;
  }
  id v5 = *(id *)kAVHCScope;
  if (v5) {
    goto LABEL_15;
  }
LABEL_18:
  if (kAVHCScope)
  {
    __int16 v9 = *(id *)kAVHCScope;
    if (!v9) {
      return;
    }
  }
  else
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    BOOL v12 = "AVHapticClient.mm";
    __int16 v13 = 1024;
    int v14 = 1379;
    __int16 v15 = 2080;
    uint64_t v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
    __int16 v17 = 1024;
    int v18 = v3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done handling disconnect for client ID 0x%x", (uint8_t *)&v11, 0x22u);
  }
}

- (unsigned)calculateHapticCommandParamCurveMemorySize:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 < 0x11)
  {
    int v5 = 1;
  }
  else
  {
    unsigned int v3 = (a3 - 16) / 0xF;
    if (a3 - 16 == 15 * v3) {
      unsigned int v4 = (a3 - 16) / 0xF;
    }
    else {
      unsigned int v4 = v3 + 1;
    }
    int v5 = v4 + 1;
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v6 = *(id *)kAVHCScope;
      if (v6)
      {
        uint64_t v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v9 = 136316674;
          id v10 = "AVHapticClient.mm";
          __int16 v11 = 1024;
          int v12 = 1405;
          __int16 v13 = 2080;
          int v14 = "-[AVHapticClient calculateHapticCommandParamCurveMemorySize:]";
          __int16 v15 = 1024;
          int v16 = v5;
          __int16 v17 = 1024;
          int v18 = v5 + 2;
          __int16 v19 = 1024;
          int v20 = 168;
          __int16 v21 = 1024;
          int v22 = 168 * (v5 + 2);
          _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u sub curves, %u HapticCommands in total, sizeof(HapticCommand):%u, total size:%u bytes ", (uint8_t *)&v9, 0x34u);
        }
      }
    }
  }
  return 168 * (v5 + 2);
}

- (void)destroySharedMemory
{
  id obj = self;
  objc_sync_enter(obj);
  destroyHapticCommandWriter();
  *((void *)obj + 2) = 0;
  objc_sync_exit(obj);
}

- (void)sequenceFinished:(unint64_t)a3 error:(id)a4
{
  *(void *)&v32[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
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
  int v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136316162;
    __int16 v26 = "AVHapticClient.mm";
    int v28 = 1422;
    __int16 v29 = 2080;
    __int16 v27 = 1024;
    __int16 v30 = "-[AVHapticClient sequenceFinished:error:]";
    __int16 v31 = 1024;
    *(_DWORD *)uint64_t v32 = [(AVHapticClient *)self clientID];
    v32[2] = 1024;
    *(_DWORD *)&v32[3] = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side sequence finish callback for client 0x%x, seq %u", (uint8_t *)&v25, 0x28u);
  }

LABEL_8:
  std::mutex::lock((std::mutex *)((char *)self + 56));
  id v10 = (void *)*((void *)self + 16);
  if (!v10) {
    goto LABEL_19;
  }
  __int16 v11 = (id *)((char *)self + 128);
  do
  {
    unint64_t v12 = v10[4];
    BOOL v13 = v12 >= a3;
    if (v12 >= a3) {
      int v14 = v10;
    }
    else {
      int v14 = v10 + 1;
    }
    if (v13) {
      __int16 v11 = (id *)v10;
    }
    id v10 = (void *)*v14;
  }
  while (*v14);
  if (v11 != (id *)((char *)self + 128) && (unint64_t)v11[4] <= a3)
  {
    uint64_t v16 = [v11[5] handler];
    [v11[5] setRunning:0];
    if ([v11[5] detached])
    {
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          __int16 v17 = *(id *)kAVHCScope;
          if (v17)
          {
            int v18 = v17;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              int v25 = 136315650;
              __int16 v26 = "AVHapticClient.mm";
              __int16 v27 = 1024;
              int v28 = 1431;
              __int16 v29 = 2080;
              __int16 v30 = "-[AVHapticClient sequenceFinished:error:]";
              _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Deleting finished handler block for detached sequence", (uint8_t *)&v25, 0x1Cu);
            }
          }
        }
      }
      std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase((uint64_t **)self + 15, (uint64_t)v11);
    }
    std::mutex::unlock((std::mutex *)((char *)self + 56));
    if (v16)
    {
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          __int16 v19 = *(id *)kAVHCScope;
          if (v19)
          {
            int v20 = v19;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              __int16 v21 = (void *)MEMORY[0x1BA9F2D90](v16);
              int v25 = 136315906;
              __int16 v26 = "AVHapticClient.mm";
              __int16 v27 = 1024;
              int v28 = 1437;
              __int16 v29 = 2080;
              __int16 v30 = "-[AVHapticClient sequenceFinished:error:]";
              __int16 v31 = 2048;
              *(void *)uint64_t v32 = v21;
              _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling cached sequence finished handler block %p", (uint8_t *)&v25, 0x26u);
            }
          }
        }
      }
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          id v22 = *(id *)kAVHCScope;
          if (v22)
          {
            uint64_t v23 = v22;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              int v24 = [(AVHapticClient *)self clientID];
              int v25 = 136315906;
              __int16 v26 = "AVHapticClient.mm";
              __int16 v27 = 1024;
              int v28 = 1439;
              __int16 v29 = 2080;
              __int16 v30 = "-[AVHapticClient sequenceFinished:error:]";
              __int16 v31 = 1024;
              *(_DWORD *)uint64_t v32 = v24;
              _os_log_impl(&dword_1BA902000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side sequence finish callback done for client 0x%x", (uint8_t *)&v25, 0x22u);
            }
          }
        }
      }
      goto LABEL_46;
    }
  }
  else
  {
LABEL_19:
    std::mutex::unlock((std::mutex *)((char *)self + 56));
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      __int16 v15 = *(id *)kAVHCScope;
      if (v15)
      {
        uint64_t v16 = (uint64_t)v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v25 = 136315906;
          __int16 v26 = "AVHapticClient.mm";
          __int16 v27 = 1024;
          int v28 = 1442;
          __int16 v29 = 2080;
          __int16 v30 = "-[AVHapticClient sequenceFinished:error:]";
          __int16 v31 = 1024;
          *(_DWORD *)uint64_t v32 = a3;
          _os_log_impl(&dword_1BA902000, (os_log_t)v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No cached sequence finished handler block for seq %u", (uint8_t *)&v25, 0x22u);
        }
LABEL_46:
      }
    }
  }
}

- (void)clientStoppedForReason:(unint64_t)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
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
  int v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136316162;
    __int16 v21 = "AVHapticClient.mm";
    int v23 = 1475;
    __int16 v24 = 2080;
    __int16 v22 = 1024;
    int v25 = "-[AVHapticClient clientStoppedForReason:error:]";
    __int16 v26 = 1024;
    int v27 = [(AVHapticClient *)self clientID];
    __int16 v28 = 1024;
    int v29 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side (async) stop callback for client 0x%x, reason %d", (uint8_t *)&v20, 0x28u);
  }

LABEL_8:
  id v10 = self;
  objc_sync_enter(v10);
  __int16 v11 = [(AVHapticClient *)v10 asyncStopCallback];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    if (![(AVHapticClient *)v10 running])
    {
      if (kAVHCScope)
      {
        BOOL v13 = *(id *)kAVHCScope;
        if (!v13) {
          goto LABEL_17;
        }
      }
      else
      {
        BOOL v13 = MEMORY[0x1E4F14500];
        id v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315650;
        __int16 v21 = "AVHapticClient.mm";
        __int16 v22 = 1024;
        int v23 = 1478;
        __int16 v24 = 2080;
        int v25 = "-[AVHapticClient clientStoppedForReason:error:]";
        _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client thinks it is not running.  Did we just get a call to stop?", (uint8_t *)&v20, 0x1Cu);
      }
    }
LABEL_17:
    [(AVHapticClient *)v10 setState:0];
    __int16 v15 = [(AVHapticClient *)v10 asyncStopCallback];
    v15[2](v15, a3);

    uint64_t v16 = (void *)*((void *)v10 + 23);
    *((void *)v10 + 23) = 0;
  }
  objc_sync_exit(v10);

  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v17 = *(id *)kAVHCScope;
      if (v17)
      {
        int v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v19 = [(AVHapticClient *)v10 clientID];
          int v20 = 136315906;
          __int16 v21 = "AVHapticClient.mm";
          __int16 v22 = 1024;
          int v23 = 1484;
          __int16 v24 = 2080;
          int v25 = "-[AVHapticClient clientStoppedForReason:error:]";
          __int16 v26 = 1024;
          int v27 = v19;
          _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side (async) stop callback done for client 0x%x", (uint8_t *)&v20, 0x22u);
        }
      }
    }
  }
}

- (void)clientDisconnectingForReason:(unint64_t)a3 error:(id)a4
{
  int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
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
  int v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136316162;
    __int16 v11 = "AVHapticClient.mm";
    int v13 = 1489;
    __int16 v14 = 2080;
    __int16 v12 = 1024;
    __int16 v15 = "-[AVHapticClient clientDisconnectingForReason:error:]";
    __int16 v16 = 1024;
    int v17 = [(AVHapticClient *)self clientID];
    __int16 v18 = 1024;
    int v19 = v4;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side call for client 0x%x with disconnect reason %d", (uint8_t *)&v10, 0x28u);
  }

LABEL_8:
  *((unsigned char *)self + 156) = 1;
}

- (BOOL)prewarmed
{
  return *((unsigned char *)self + 157) & 1;
}

- (BOOL)connected
{
  return *((unsigned char *)self + 158) & 1;
}

- (id)connectionCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)disconnecting
{
  return *((unsigned char *)self + 156) & 1;
}

- (int)serverProcessID
{
  return *((_DWORD *)self + 40);
}

- (id)asyncStopCallback
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 18, 0);
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy((uint64_t)self + 120, *((void **)self + 16));
  std::mutex::~mutex((std::mutex *)((char *)self + 56));
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);

  objc_storeStrong((id *)self + 1, 0);
}

void __36__AVHapticClient_allocateResources___block_invoke_2_cold_1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    v1 = "AVHapticClient.mm";
    __int16 v2 = 1024;
    int v3 = 201;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(sharedBufferSize > 0) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

- (void)scheduleParameterCurve:(os_log_t)log curve:atTime:channel:error:.cold.1(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = "AVHapticClient.mm";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 781;
  *((_WORD *)buf + 9) = 2080;
  *(void *)(buf + 20) = "-[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:]";
  *((_WORD *)buf + 14) = 1024;
  *(_DWORD *)(buf + 30) = a1;
  _os_log_impl(&dword_1BA902000, log, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Client 0x%x: doScheduleParamCurve failed!", buf, 0x22u);
}

- (void)scheduleParameterCurve:curve:atTime:channel:error:.cold.2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    v1 = "AVHapticClient.mm";
    __int16 v2 = 1024;
    int v3 = 783;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(result) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

@end
@interface AXLTLiveTranscription
+ (AXLTLiveTranscription)sharedInstance;
- (AXLTLiveTranscription)init;
- (AXLTLiveTranscriptionDelegate)delegate;
- (AXLTSpeechTranscriber)speechTranscriber;
- (AXLTTestTranscriber)testTranscriber;
- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3;
- (BOOL)noPunctuation;
- (BOOL)startTranscribing:(int64_t)a3 callbackBlock:(id)a4 error:(id *)a5;
- (BOOL)startTranscribing:(int64_t)a3 excludingPIDs:(id)a4 callbackBlock:(id)a5 error:(id *)a6;
- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 audioInfoBlock:(id)a6 error:(id *)a7;
- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 error:(id *)a6;
- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 excludingPIDs:(id)a5 callbackBlock:(id)a6 audioInfoBlock:(id)a7 error:(id *)a8;
- (BOOL)stopTranscribing:(int64_t)a3 error:(id *)a4;
- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 error:(id *)a5;
- (NSMutableDictionary)dataReceivers;
- (id)_receiverKeyForRequestType:(int64_t)a3 targetPID:(int)a4;
- (int64_t)taskHint;
- (void)audioInfoData:(id)a3;
- (void)resetTranscribing:(int64_t)a3;
- (void)setDataReceivers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNoPunctuation:(BOOL)a3;
- (void)setSpeechTranscriber:(id)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setTestTranscriber:(id)a3;
- (void)transcriberOutputData:(id)a3;
@end

@implementation AXLTLiveTranscription

+ (AXLTLiveTranscription)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__shared;
  return (AXLTLiveTranscription *)v2;
}

uint64_t __39__AXLTLiveTranscription_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (AXLTLiveTranscription)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXLTLiveTranscription;
  v2 = [(AXLTLiveTranscription *)&v11 init];
  if (v2)
  {
    v3 = [[AXLTTestTranscriber alloc] initWithDelegate:v2];
    testTranscriber = v2->_testTranscriber;
    v2->_testTranscriber = v3;

    v5 = [[AXLTSpeechTranscriber alloc] initWithDelegate:v2];
    speechTranscriber = v2->_speechTranscriber;
    v2->_speechTranscriber = v5;

    v7 = +[AXLTAudioOutManager sharedInstance];
    [v7 setDelegate:v2];

    uint64_t v8 = objc_opt_new();
    dataReceivers = v2->_dataReceivers;
    v2->_dataReceivers = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (BOOL)startTranscribing:(int64_t)a3 callbackBlock:(id)a4 error:(id *)a5
{
  return [(AXLTLiveTranscription *)self startTranscribing:a3 targetPID:0xFFFFFFFFLL callbackBlock:a4 error:a5];
}

- (BOOL)startTranscribing:(int64_t)a3 excludingPIDs:(id)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return [(AXLTLiveTranscription *)self startTranscribing:a3 targetPID:0xFFFFFFFFLL excludingPIDs:a4 callbackBlock:a5 audioInfoBlock:0 error:a6];
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return [(AXLTLiveTranscription *)self startTranscribing:a3 targetPID:*(void *)&a4 excludingPIDs:0 callbackBlock:a5 audioInfoBlock:0 error:a6];
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 audioInfoBlock:(id)a6 error:(id *)a7
{
  return [(AXLTLiveTranscription *)self startTranscribing:a3 targetPID:*(void *)&a4 excludingPIDs:0 callbackBlock:a5 audioInfoBlock:a6 error:a7];
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 excludingPIDs:(id)a5 callbackBlock:(id)a6 audioInfoBlock:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a4;
  v75[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = AXLogLiveTranscription();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)v71 = a3;
    *(_WORD *)&v71[8] = 1024;
    *(_DWORD *)&v71[10] = v11;
    _os_log_impl(&dword_23C242000, v17, OS_LOG_TYPE_DEFAULT, "API startTranscribing request: %ld, targetPID: %d", buf, 0x12u);
  }

  BOOL v18 = [(AXLTLiveTranscription *)self noPunctuation];
  v19 = +[AXLTTranscriber sharedInstance];
  [v19 setNoPunctuation:v18];

  int64_t v20 = [(AXLTLiveTranscription *)self taskHint];
  v21 = +[AXLTTranscriber sharedInstance];
  [v21 setTaskHint:v20];

  if (v15)
  {
    switch(a3)
    {
      case 2:
        v35 = AXLogLiveTranscription();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          [(AXLTLiveTranscription *)v35 startTranscribing:v37 targetPID:v38 excludingPIDs:v39 callbackBlock:v40 audioInfoBlock:v41 error:v42];
        }

        v43 = [(AXLTLiveTranscription *)self testTranscriber];
        v66 = 0;
        char v44 = [v43 startTranscription:&v66];
        v45 = v66;
        break;
      case 1:
        v46 = AXLogLiveTranscription();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          [(AXLTLiveTranscription *)v46 startTranscribing:v48 targetPID:v49 excludingPIDs:v50 callbackBlock:v51 audioInfoBlock:v52 error:v53];
        }

        if (![(AXLTLiveTranscription *)self _pidSupportsCoreMediaNotifications:v11])
        {
          v54 = @"Call";
          if (v11 == -1)
          {
            v54 = @"System";
            v55 = @"liveCaptions.system";
          }
          else
          {
            v55 = @"liveCaptions.call";
          }
          v56 = v54;
          v57 = AXLCLocString(v55);
          v58 = +[AXLTAudioOutManager sharedInstance];
          id v67 = 0;
          char v65 = [v58 _startTranscriptionForPID:v11 appID:v56 appName:v57 excludingPIDs:v14 error:&v67];

          id v32 = v67;
          if (v65) {
            goto LABEL_26;
          }
          goto LABEL_29;
        }
        v43 = +[AXLTAudioOutManager sharedInstance];
        v68 = 0;
        char v44 = [v43 startTranscription:&v68];
        v45 = v68;
        break;
      case 0:
        v22 = AXLogLiveTranscription();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          [(AXLTLiveTranscription *)v22 startTranscribing:v24 targetPID:v25 excludingPIDs:v26 callbackBlock:v27 audioInfoBlock:v28 error:v29];
        }

        v30 = [(AXLTLiveTranscription *)self speechTranscriber];
        id v69 = 0;
        int v31 = [v30 startTranscription:&v69];
        id v32 = v69;

        if (!v31) {
          goto LABEL_29;
        }
LABEL_26:
        v59 = [[AXLTTranscribedDataReceiver alloc] initWithRequestType:a3 targetPID:v11 handler:v15 audioInfoBlock:v16];
        v60 = [(AXLTLiveTranscription *)self _receiverKeyForRequestType:a3 targetPID:v11];
        v61 = [(AXLTLiveTranscription *)self dataReceivers];
        [v61 setObject:v59 forKeyedSubscript:v60];

        v62 = AXLogLiveTranscription();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v71 = v11;
          *(_WORD *)&v71[4] = 2048;
          *(void *)&v71[6] = a3;
          __int16 v72 = 2112;
          v73 = v60;
          _os_log_debug_impl(&dword_23C242000, v62, OS_LOG_TYPE_DEBUG, "registered pid: %d to receive transcription updates for: %ld, key: %@", buf, 0x1Cu);
        }

        BOOL v34 = 1;
        goto LABEL_32;
      default:
        id v32 = 0;
LABEL_29:
        AXLogLiveTranscription();
        v59 = (AXLTTranscribedDataReceiver *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v59->super, OS_LOG_TYPE_ERROR))
        {
          v64 = [v32 localizedDescription];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v71 = v11;
          *(_WORD *)&v71[4] = 2048;
          *(void *)&v71[6] = a3;
          __int16 v72 = 2112;
          v73 = v64;
          _os_log_error_impl(&dword_23C242000, &v59->super, OS_LOG_TYPE_ERROR, "fail to register pid: %d to receive transcription updates for: %ld, error: %@", buf, 0x1Cu);
        }
        BOOL v34 = 0;
LABEL_32:

        goto LABEL_33;
    }
    id v32 = v45;

    if (v44) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v74 = *MEMORY[0x263F07F80];
  v75[0] = @"callback handler is nil";
  id v32 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];
  [v33 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:1 userInfo:v32];
  BOOL v34 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v34;
}

- (BOOL)stopTranscribing:(int64_t)a3 error:(id *)a4
{
  return [(AXLTLiveTranscription *)self stopTranscribing:a3 targetPID:0xFFFFFFFFLL error:a4];
}

- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 error:(id *)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v8 = AXLogLiveTranscription();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)uint64_t v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v5;
    _os_log_impl(&dword_23C242000, v8, OS_LOG_TYPE_DEFAULT, "API stopTranscribing request: %ld, targetPID: %d", buf, 0x12u);
  }

  if (!a3)
  {
    id v14 = [(AXLTLiveTranscription *)self speechTranscriber];
    id v26 = 0;
    int v15 = [v14 stopTranscription:&v26];
    id v16 = v26;

    if (!v15) {
      goto LABEL_17;
    }
LABEL_14:
    v17 = [(AXLTLiveTranscription *)self _receiverKeyForRequestType:a3 targetPID:v5];
    BOOL v18 = AXLogLiveTranscription();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v28 = v5;
      *(_WORD *)&v28[4] = 2048;
      *(void *)&v28[6] = a3;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_debug_impl(&dword_23C242000, v18, OS_LOG_TYPE_DEBUG, "removed pid: %d to receive transcription updates for: %ld, key: %@", buf, 0x1Cu);
    }

    v19 = [(AXLTLiveTranscription *)self dataReceivers];
    [v19 removeObjectForKey:v17];

    BOOL v20 = 1;
    goto LABEL_20;
  }
  if (a3 == 2)
  {
    uint64_t v11 = [(AXLTLiveTranscription *)self testTranscriber];
    uint64_t v23 = 0;
    char v12 = [v11 stopTranscription:&v23];
    v13 = v23;
    goto LABEL_13;
  }
  if (a3 != 1)
  {
    id v16 = 0;
    goto LABEL_14;
  }
  BOOL v9 = [(AXLTLiveTranscription *)self _pidSupportsCoreMediaNotifications:v5];
  v10 = +[AXLTAudioOutManager sharedInstance];
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v25 = 0;
    char v12 = [v10 stopTranscription:&v25];
    v13 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    char v12 = [v10 _stopTranscriptionForPID:v5 error:&v24];
    v13 = v24;
  }
LABEL_13:
  id v16 = v13;

  if (v12) {
    goto LABEL_14;
  }
LABEL_17:
  v17 = AXLogLiveTranscription();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v22 = [v16 localizedDescription];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v28 = v5;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = a3;
    __int16 v29 = 2112;
    v30 = v22;
    _os_log_error_impl(&dword_23C242000, v17, OS_LOG_TYPE_ERROR, "fail to remove pid: %d to receive transcription updates for: %ld, error: %@", buf, 0x1Cu);
  }
  BOOL v20 = 0;
LABEL_20:

  return v20;
}

- (void)resetTranscribing:(int64_t)a3
{
  uint64_t v5 = AXLogLiveTranscription();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXLTLiveTranscription resetTranscribing:](a3, v5);
  }

  if (a3 == 2)
  {
    v6 = [(AXLTLiveTranscription *)self testTranscriber];
  }
  else if (a3 == 1)
  {
    v6 = +[AXLTAudioOutManager sharedInstance];
  }
  else
  {
    if (a3) {
      return;
    }
    v6 = [(AXLTLiveTranscription *)self speechTranscriber];
  }
  v7 = v6;
  [v6 resetTranscription];
}

- (void)transcriberOutputData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", [v4 requestType], objc_msgSend(v4, "pid"));
  v6 = AXLogLiveTranscription();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXLTLiveTranscription transcriberOutputData:]();
  }

  v7 = [(AXLTLiveTranscription *)self dataReceivers];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    BOOL v9 = [v8 callbackBlock];
    ((void (**)(void, id))v9)[2](v9, v4);
  }
}

- (void)audioInfoData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", [v4 requestType], objc_msgSend(v4, "pid"));
  v6 = AXLogLiveTranscription();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXLTLiveTranscription audioInfoData:]();
  }

  v7 = [(AXLTLiveTranscription *)self dataReceivers];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    BOOL v9 = [v8 audioInfoBlock];

    if (v9)
    {
      v10 = [v8 audioInfoBlock];
      ((void (**)(void, id))v10)[2](v10, v4);
    }
  }
  uint64_t v11 = [(AXLTLiveTranscription *)self delegate];

  if (v11)
  {
    char v12 = [(AXLTLiveTranscription *)self delegate];
    [v12 liveTranscriptionAudioInfoDataArrived:v4];
  }
}

- (id)_receiverKeyForRequestType:(int64_t)a3 targetPID:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    if ([(AXLTLiveTranscription *)self _pidSupportsCoreMediaNotifications:*(void *)&a4])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%ld_%ld", a3, -1);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%ld_%d", a3, v4);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0, v8);
  v6 = };
  return v6;
}

- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3
{
  return (a3 + 1) < 0xFFFFFFFE;
}

- (AXLTLiveTranscriptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTLiveTranscriptionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)noPunctuation
{
  return self->_noPunctuation;
}

- (void)setNoPunctuation:(BOOL)a3
{
  self->_noPunctuation = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (AXLTSpeechTranscriber)speechTranscriber
{
  return self->_speechTranscriber;
}

- (void)setSpeechTranscriber:(id)a3
{
}

- (AXLTTestTranscriber)testTranscriber
{
  return self->_testTranscriber;
}

- (void)setTestTranscriber:(id)a3
{
}

- (NSMutableDictionary)dataReceivers
{
  return self->_dataReceivers;
}

- (void)setDataReceivers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataReceivers, 0);
  objc_storeStrong((id *)&self->_testTranscriber, 0);
  objc_storeStrong((id *)&self->_speechTranscriber, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetTranscribing:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23C242000, a2, OS_LOG_TYPE_DEBUG, "API resetTranscribing for type: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)transcriberOutputData:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_23C242000, v0, v1, "receiver: %@, data: %@");
}

- (void)audioInfoData:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_23C242000, v0, v1, "receiver: %@, audio data: %@");
}

@end
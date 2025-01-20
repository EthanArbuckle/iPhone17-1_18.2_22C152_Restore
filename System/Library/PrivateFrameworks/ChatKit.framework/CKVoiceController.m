@interface CKVoiceController
- (AVVoiceController)voiceController;
- (CKVoiceController)initWithActivationMode:(int64_t)a3 recordSettings:(id)a4 queue:(id)a5;
- (CKVoiceControllerDelegate)delegate;
- (NSDictionary)recordSettings;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)powerUpdateTimer;
- (float)averagePower;
- (int64_t)_activationMode;
- (unint64_t)streamID;
- (void)_setActivationMode:(int64_t)a3;
- (void)cleanup;
- (void)dealloc;
- (void)messageSent:(id)a3;
- (void)playAlertSoundForType:(int)a3;
- (void)record;
- (void)releaseAudioSession;
- (void)setActivationMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerUpdateTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordSettings:(id)a3;
- (void)setStreamID:(unint64_t)a3;
- (void)setVoiceController:(id)a3;
- (void)startUpdatingPower;
- (void)stop;
- (void)stopUpdatingPower;
- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5;
- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5;
- (void)voiceControllerDidStopRecordingForClientError;
- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4;
@end

@implementation CKVoiceController

- (void)dealloc
{
  [(CKVoiceController *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CKVoiceController;
  [(CKVoiceController *)&v3 dealloc];
}

- (void)cleanup
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(CKVoiceController *)self voiceController];

  if (v4)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__36;
    v7[4] = __Block_byref_object_dispose__36;
    id v8 = 0;
    id v8 = [(CKVoiceController *)self voiceController];
    [(CKVoiceController *)self setVoiceController:0];
    v5 = [(CKVoiceController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__CKVoiceController_cleanup__block_invoke;
    block[3] = &unk_1E5620B90;
    block[4] = v7;
    dispatch_async(v5, block);

    _Block_object_dispose(v7, 8);
  }
}

void __28__CKVoiceController_cleanup__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = 0;
  [v1 teardownWithError:&v4];
  id v2 = v4;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "-[AVVoiceController teardownWithError:...] failed with error %@", buf, 0xCu);
    }
  }
}

- (CKVoiceController)initWithActivationMode:(int64_t)a3 recordSettings:(id)a4 queue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKVoiceController;
  v10 = [(CKVoiceController *)&v19 init];
  v11 = v10;
  if (v10)
  {
    [(CKVoiceController *)v10 setQueue:v9];
    [(CKVoiceController *)v11 setRecordSettings:v8];
    [(CKVoiceController *)v11 _setActivationMode:a3];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v11 selector:sel_messageSent_ name:*MEMORY[0x1E4F6BA60] object:0];

    v13 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    [v13 _setPostMessageSentNotifications:1];

    v14 = [(CKVoiceController *)v11 queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__CKVoiceController_initWithActivationMode_recordSettings_queue___block_invoke;
    v16[3] = &unk_1E5622950;
    v17 = v11;
    int64_t v18 = a3;
    dispatch_async(v14, v16);
  }
  return v11;
}

void __65__CKVoiceController_initWithActivationMode_recordSettings_queue___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F154F8]) initVoiceControllerForClient:2 withError:&v16];
  id v3 = v16;
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  int v5 = v4;
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v3;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "-[AVVoiceController initWithContext:...] failed with error %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) voiceControllerDidStopRecordingForClientError];
  }
  else
  {
    if (v6)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "-[AVVoiceController initWithContext:...] setting up.", buf, 2u);
      }
    }
    [v2 setRecordDelegate:*(void *)(a1 + 32)];
    id v9 = [MEMORY[0x1E4F1CB10] ckURLForResource:@"MessageRecordStart" withExtension:@"caf"];
    [v2 setAlertSoundFromURL:v9 forType:1];
    v10 = [MEMORY[0x1E4F1CB10] ckURLForResource:@"MessageRecordStop" withExtension:@"caf"];
    [v2 setAlertSoundFromURL:v10 forType:2];
    [*(id *)(a1 + 32) setVoiceController:v2];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F154B0]) initWithMode:*(void *)(a1 + 40) deviceUID:0];
    id v14 = 0;
    uint64_t v15 = 0;
    uint64_t v12 = [v2 setContext:v11 streamType:&v15 error:&v14];
    id v3 = v14;
    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v3;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "[voiceController setContext:streamType:error:] failed with error: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) setStreamID:v12];
    }
  }
}

- (void)setActivationMode:(int64_t)a3
{
  -[CKVoiceController _setActivationMode:](self, "_setActivationMode:");
  int v5 = [(CKVoiceController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CKVoiceController_setActivationMode___block_invoke;
  v6[3] = &unk_1E5622950;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __39__CKVoiceController_setActivationMode___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) voiceController];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F154B0]) initWithMode:*(void *)(a1 + 40) deviceUID:0];
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v4 = [v2 setContext:v3 streamType:&v8 error:&v7];
  id v5 = v7;
  if (v5 || ([*(id *)(a1 + 32) setStreamID:v4], !v2))
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "-[AVVoiceController setCurrentContext:] failed with error %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) voiceControllerDidStopRecordingForClientError];
  }
}

- (void)record
{
  id v3 = [(CKVoiceController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CKVoiceController_record__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __27__CKVoiceController_record__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) voiceController];
  uint64_t v4 = [*v2 streamID];
  id v26 = 0;
  [v3 activateAudioSessionForStream:v4 isPrewarm:0 recordMode:1 error:&v26];
  id v5 = v26;

  id v6 = objc_alloc(MEMORY[0x1E4F154D0]);
  uint64_t v7 = [*v2 streamID];
  uint64_t v8 = [*v2 recordSettings];
  id v9 = (void *)[v6 initWithStreamID:v7 settings:v8 bufferDuration:0.1];

  [v9 setMeteringEnabled:1];
  id v10 = [*v2 voiceController];
  id v25 = v5;
  char v11 = [v10 prepareRecordForStream:v9 error:&v25];
  id v12 = v25;

  if (v12) {
    char v13 = 0;
  }
  else {
    char v13 = v11;
  }
  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "-[AVVoiceController prepareRecordWithSettings:...] succeeded, about to start recording", buf, 2u);
      }
    }
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F154A0]), "initWithStreamID:", objc_msgSend(*(id *)(a1 + 32), "streamID"));
    id v16 = [*(id *)(a1 + 32) voiceController];
    id v24 = 0;
    [v16 configureAlertBehaviorForStream:v15 error:&v24];
    id v17 = v24;

    if (v17 && IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v17;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "[voiceController configureAlertBehaviorForStream] failed with error: %@", buf, 0xCu);
      }
    }
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F154F0]), "initWithStreamID:atStartHostTime:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);
    [v19 setStartAlert:2];

    v20 = [*(id *)(a1 + 32) voiceController];
    id v23 = 0;
    [v20 startRecordForStream:v19 error:&v23];
    id v12 = v23;

    if (v12 && IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v12;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "[voiceController startRecordForStream] failed with error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) voiceControllerDidStopRecordingForClientError];
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v12;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "[voiceController prepareRecordForStream:...] failed with error:%@", buf, 0xCu);
      }
    }
  }
}

- (void)stop
{
  [(CKVoiceController *)self stopUpdatingPower];
  id v3 = [(CKVoiceController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CKVoiceController_stop__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __25__CKVoiceController_stop__block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController stop] about to stop recording", v4, 2u);
    }
  }
  id v3 = [*(id *)(a1 + 32) voiceController];
  objc_msgSend(v3, "stopRecordForStream:error:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);
}

- (void)playAlertSoundForType:(int)a3
{
  int64_t v5 = [(CKVoiceController *)self _activationMode];
  id v6 = [(CKVoiceController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CKVoiceController_playAlertSoundForType___block_invoke;
  block[3] = &unk_1E56282E0;
  int v8 = a3;
  block[4] = self;
  void block[5] = v5;
  dispatch_async(v6, block);
}

void __43__CKVoiceController_playAlertSoundForType___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = *(_DWORD *)(a1 + 48);
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController playAlertSoundForType:...] playing alert type: %u", (uint8_t *)v9, 8u);
    }
  }
  unsigned int v4 = *(_DWORD *)(a1 + 48) & 0xFFFFFFFE;
  if (*(void *)(a1 + 40) == 1768764005 && v4 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "-[AVVoiceController playAlertSoundForType:...] activation mode was raise, resetting activation context", (uint8_t *)v9, 2u);
      }
    }
    uint64_t v7 = [MEMORY[0x1E4F153E0] sharedInstance];
    [v7 setActivationContext:MEMORY[0x1E4F1CC08] error:0];
  }
  int v8 = [*(id *)(a1 + 32) voiceController];
  [v8 playAlertSoundForType:*(unsigned int *)(a1 + 48) overrideMode:-1];

  if (v4 == 2) {
    usleep(0xB71B0u);
  }
}

- (void)releaseAudioSession
{
  int v3 = [(CKVoiceController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CKVoiceController_releaseAudioSession__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __40__CKVoiceController_releaseAudioSession__block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController releaseAudioSession]", buf, 2u);
    }
  }
  int v3 = [*(id *)(a1 + 32) voiceController];
  objc_msgSend(v3, "deactivateAudioSessionForStream:withOptions:error:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 1, 0);

  unsigned int v4 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v4 setActivationContext:MEMORY[0x1E4F1CC08] error:0];

  int64_t v5 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v6 = *MEMORY[0x1E4F15050];
  id v11 = 0;
  char v7 = [v5 setMode:v6 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __40__CKVoiceController_releaseAudioSession__block_invoke_cold_1((uint64_t)v8, v9);
    }
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "reverted audio session back to AVAudioSessionModeDefault", v10, 2u);
    }
LABEL_11:
  }
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v7;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "voiceControllerDidStartRecording:successfully: %d", buf, 8u);
    }
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__CKVoiceController_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(CKVoiceController *)self voiceControllerDidStopRecordingForClientError];
  }
}

void __83__CKVoiceController_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "voiceControllerDidStartRecording:successfully:..., about to start updating power", v4, 2u);
    }
  }
  [*(id *)(a1 + 32) startUpdatingPower];
  int v3 = [*(id *)(a1 + 32) delegate];
  [v3 voiceControllerDidStartRecording:*(void *)(a1 + 32)];
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CKVoiceController_voiceControllerAudioCallback_forStream_buffer___block_invoke;
  v8[3] = &unk_1E5620AF8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __67__CKVoiceController_voiceControllerAudioCallback_forStream_buffer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 voiceControllerRecordBufferAvailable:*(void *)(a1 + 32) buffer:*(void *)(a1 + 40)];
}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = a5;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecording:forReason: %d", buf, 8u);
    }
  }
  [(CKVoiceController *)self stopUpdatingPower];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __73__CKVoiceController_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  v9[3] = &unk_1E5622950;
  v9[4] = self;
  v9[5] = a5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __73__CKVoiceController_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecording:forReason: block run", v7, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = v3 == -11786;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = v4;
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 voiceControllerDidFinishRecording:*(void *)(a1 + 32) successfully:v5];
}

- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4
{
  -[CKVoiceController setStreamID:](self, "setStreamID:", *MEMORY[0x1E4F152D0], a4);
  int64_t v5 = [(CKVoiceController *)self _activationMode];

  [(CKVoiceController *)self setActivationMode:v5];
}

- (float)averagePower
{
  uint64_t v3 = [(CKVoiceController *)self powerUpdateTimer];

  if (v3)
  {
    BOOL v4 = [(CKVoiceController *)self voiceController];
    objc_msgSend(v4, "updateMeterForStream:", -[CKVoiceController streamID](self, "streamID"));
    objc_msgSend(v4, "getAveragePowerForStream:forChannel:", -[CKVoiceController streamID](self, "streamID"), 0);
    float v6 = v5;
  }
  else
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    [v4 audioRecordingViewMinimumDBLevel];
    float v6 = v7;
  }

  return v6;
}

- (void)voiceControllerDidStopRecordingForClientError
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)float v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecordingForClientError", v5, 2u);
    }
  }
  BOOL v4 = [(CKVoiceController *)self voiceController];
  [(CKVoiceController *)self voiceControllerDidStopRecording:v4 forStream:[(CKVoiceController *)self streamID] forReason:-11799];
}

- (void)startUpdatingPower
{
  uint64_t v3 = [(CKVoiceController *)self powerUpdateTimer];
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Shouldn't have a power update timer already", buf, 2u);
      }
    }
    [(CKVoiceController *)self stopUpdatingPower];
  }
  float v5 = [(CKVoiceController *)self queue];
  float v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);

  dispatch_source_set_timer(v6, 0, 0x3F940AAuLL, 0);
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __39__CKVoiceController_startUpdatingPower__block_invoke;
  id v10 = &unk_1E5622AB8;
  objc_copyWeak(&v12, (id *)buf);
  int v11 = self;
  dispatch_source_set_event_handler(v6, &v7);
  -[CKVoiceController setPowerUpdateTimer:](self, "setPowerUpdateTimer:", v6, v7, v8, v9, v10);
  dispatch_resume(v6);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __39__CKVoiceController_startUpdatingPower__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained voiceController];
  objc_msgSend(v3, "updateMeterForStream:", objc_msgSend(*(id *)(a1 + 32), "streamID"));
  objc_msgSend(v3, "getAveragePowerForStream:forChannel:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CKVoiceController_startUpdatingPower__block_invoke_2;
  v6[3] = &unk_1E5628308;
  id v7 = WeakRetained;
  int v8 = v4;
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __39__CKVoiceController_startUpdatingPower__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 voiceController:*(void *)(a1 + 32) didUpdateAveragePower:v2];
}

- (void)stopUpdatingPower
{
  id v3 = [(CKVoiceController *)self powerUpdateTimer];
  if (v3)
  {
    int v4 = v3;
    dispatch_source_cancel(v3);
    [(CKVoiceController *)self setPowerUpdateTimer:0];
    id v3 = v4;
  }
}

- (void)messageSent:(id)a3
{
  id v4 = a3;
  id v5 = [(CKVoiceController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CKVoiceController_messageSent___block_invoke;
  block[3] = &unk_1E5620C40;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __33__CKVoiceController_messageSent___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "messageSent: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return usleep(0xB71B0u);
}

- (CKVoiceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKVoiceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)_activationMode
{
  return self->__activationMode;
}

- (void)_setActivationMode:(int64_t)a3
{
  self->__activationMode = a3;
}

- (NSDictionary)recordSettings
{
  return self->_recordSettings;
}

- (void)setRecordSettings:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)powerUpdateTimer
{
  return self->_powerUpdateTimer;
}

- (void)setPowerUpdateTimer:(id)a3
{
}

- (AVVoiceController)voiceController
{
  return self->_voiceController;
}

- (void)setVoiceController:(id)a3
{
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_powerUpdateTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recordSettings, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __40__CKVoiceController_releaseAudioSession__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "failed to revert audio session back to AVAudioSessionModeDefault: %@", (uint8_t *)&v2, 0xCu);
}

@end
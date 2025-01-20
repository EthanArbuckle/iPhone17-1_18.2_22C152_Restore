@interface CSSiriSpeechRecordingContext
- (BOOL)allowContinuousConversation;
- (BOOL)wantsRecordedAudioBufferLogs;
- (CSSiriSpeechRecordingContext)initWithSessionUUID:(id)a3 turnIdentifier:(id)a4;
- (NSString)sessionUUID;
- (id)_createRequestLinkInfo:(id)a3 component:(int)a4;
- (id)description;
- (void)_didBecomeCurrent;
- (void)_didResignCurrent;
- (void)_donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:(id)a3;
- (void)_finalizeAudioFileWriterWithCompletion:(id)a3;
- (void)_initializeAudioFileWriterWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3;
- (void)_instrumentSiriCue:(int)a3;
- (void)_removeRecordedAudio;
- (void)acquireRecordedAudioWithHandler:(id)a3;
- (void)appendRecordedAudioBuffer:(id)a3;
- (void)becomeCurrent;
- (void)beginRecordingAudioWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3;
- (void)dealloc;
- (void)didDetectTwoShotWithAudioActivationInfo:(id)a3 atTime:(double)a4;
- (void)didStopRecordingWithError:(id)a3;
- (void)emitRequestLinkEventForMHUUID:(id)a3;
- (void)emitRequestLinkEventForRtsSessionId:(id)a3;
- (void)endRecordingAudio;
- (void)getAudioRecordRouteAndDeviceIdentificationWithCompletion:(id)a3;
- (void)instrumentSiriCue:(int)a3;
- (void)instrumentSiriCueForAlertType:(int64_t)a3;
- (void)relinquishAudioSessionAssertionsWithContext:(id)a3;
- (void)relinquishAudioSessionAssertionsWithError:(id)a3;
- (void)resignCurrent;
- (void)updateAccessToRecordedAudioForVoiceIdentificationTraining:(BOOL)a3 forResultCandidateId:(id)a4 sharedUserId:(id)a5;
- (void)updateAudioRecordContext:(id)a3;
- (void)updateAudioRecordDeviceInfo:(id)a3;
- (void)updateRecordingInfo:(id)a3;
- (void)updateRecordingSettings:(id)a3;
- (void)updateSelectedResultCandidateId:(id)a3;
- (void)updateStartSpeechId:(id)a3;
- (void)updateVoiceTriggerInfo:(id)a3;
- (void)willPrepareAndStartRecordingWithAudioActivationInfo:(id)a3;
- (void)willStopRecordingAtHostTime:(unint64_t)a3;
@end

@implementation CSSiriSpeechRecordingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_audioMessageRequestClient, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_withoutResultCandidateSharedUserId, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_resultCandidateToSharedUserIdMap, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_allowedResultCandidateIds, 0);
  objc_storeStrong((id *)&self->_recordingAudioGroup, 0);
  objc_storeStrong((id *)&self->_twoShotDetectionAudioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_startRecordingAudioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_recordedAudioFileURL, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_recordingInfo, 0);
  objc_storeStrong((id *)&self->_recordingSettings, 0);
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);
  objc_storeStrong((id *)&self->_audioRecordDeviceInfo, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_selectedResultCandidateId, 0);
  objc_storeStrong((id *)&self->_startSpeechId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)wantsRecordedAudioBufferLogs
{
  return self->_wantsRecordedAudioBufferLogs;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (BOOL)allowContinuousConversation
{
  return [(CSAudioRecordContext *)self->_audioRecordContext isAudioRecordTypeSupportedByContinuousConversation];
}

- (void)_removeRecordedAudio
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_recordedAudioFileURL
    && (!AFIsInternalInstall() || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0))
  {
    v3 = (os_log_t *)MEMORY[0x1E4F4E380];
    v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      recordedAudioFileURL = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = recordedAudioFileURL;
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s %p Removing recorded audio at %@...", buf, 0x20u);
    }
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7 = self->_recordedAudioFileURL;
    id v14 = 0;
    int v8 = [v6 removeItemAtURL:v7 error:&v14];
    id v9 = v14;

    v10 = *v3;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_recordedAudioFileURL;
        *(_DWORD *)buf = 136315906;
        v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v13;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s %p Failed to remove recorded audio at %@ (error = %@).", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v11 = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s %p Removed recorded audio at %@.", buf, 0x20u);
    }
    v12 = self->_recordedAudioFileURL;
    self->_recordedAudioFileURL = 0;
  }
}

- (void)_donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = v4;
  recordingAudioGroup = self->_recordingAudioGroup;
  if (recordingAudioGroup)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke;
    v8[3] = &unk_1E658D3A0;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(recordingAudioGroup, queue, v8);
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 88))
  {
    if (*(void *)(v2 + 32)) {
      uint64_t v3 = objc_msgSend(*(id *)(v2 + 128), "containsObject:");
    }
    else {
      uint64_t v3 = *(unsigned char *)(v2 + 120) != 0;
    }
    v6 = (os_log_t *)MEMORY[0x1E4F4E380];
    v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 88);
      v10 = @"DENIED";
      if (v3) {
        v10 = @"ALLOWED";
      }
      *(_DWORD *)buf = 136315906;
      v24 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s %p Access to payload audio at %@ is %@, setting payload recording flag for CoreSpeech.", buf, 0x2Au);
    }
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = [NSNumber numberWithBool:v3];
    [v11 setObject:v12 forKey:@"shouldRecordPayload"];

    v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 88);
      *(_DWORD *)buf = 136315650;
      v24 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      __int16 v25 = 2048;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s %p Donating recorded audio at %@...", buf, 0x20u);
    }
    v16 = [*(id *)(*(void *)(a1 + 32) + 88) relativePath];
    __int16 v17 = *(void **)(a1 + 32);
    uint64_t v19 = v17[5];
    uint64_t v18 = v17[6];
    uint64_t v20 = v17[7];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_81;
    v21[3] = &unk_1E658D378;
    v21[4] = v17;
    id v22 = *(id *)(a1 + 40);
    +[CSVoiceIdXPCClient notifyImplicitUtterance:v16 audioDeviceType:v18 audioRecordType:v19 voiceTriggerEventInfo:v20 otherCtxt:v11 completion:v21];
  }
  else
  {
    v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      __int16 v25 = 2048;
      uint64_t v26 = v2;
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s %p No recorded audio.", buf, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_81(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_2;
  block[3] = &unk_1E658D198;
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[5];
      uint64_t v6 = *(void *)(v5 + 88);
      int v10 = 136315906;
      id v11 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke_2";
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v2;
      _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %p Failed to donate recorded audio at %@ for  VoiceID training (error = %@).", (uint8_t *)&v10, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(v7 + 88);
    int v10 = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p Donated recorded audio at %@ for  Voice VoiceID training.", (uint8_t *)&v10, 0x20u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_didResignCurrent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    *(_DWORD *)buf = 136315650;
    int v10 = "-[CSSiriSpeechRecordingContext _didResignCurrent]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = sessionUUID;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", buf, 0x20u);
  }
  int v5 = [MEMORY[0x1E4F5D450] supportsSCDAFramework];
  uint64_t v6 = (id *)0x1E4F9FAF0;
  if (!v5) {
    uint64_t v6 = (id *)0x1E4F4E508;
  }
  uint64_t v7 = [*v6 sharedMonitor];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke;
  v8[3] = &unk_1E658C8E8;
  v8[4] = self;
  [v7 waitForMyriadDecisionForReason:@"Donating recorded audio to CoreSpeech" withCompletion:v8];
}

void __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke_2;
  v4[3] = &unk_1E658C870;
  char v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke_2(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 32);
    if (v2[7])
    {
      uint64_t v3 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        int v4 = 136315138;
        char v5 = "-[CSSiriSpeechRecordingContext _didResignCurrent]_block_invoke_2";
        _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s Myriad won & voice trigger present, donating recorded audio to CoreSpeech.", (uint8_t *)&v4, 0xCu);
        uint64_t v2 = *(void **)(v1 + 32);
      }
      return [v2 _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:0];
    }
  }
  return result;
}

- (void)_didBecomeCurrent
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    int v5 = 136315650;
    uint64_t v6 = "-[CSSiriSpeechRecordingContext _didBecomeCurrent]";
    __int16 v7 = 2048;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    int v10 = sessionUUID;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", (uint8_t *)&v5, 0x20u);
  }
}

- (id)_createRequestLinkInfo:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v5 = (objc_class *)MEMORY[0x1E4FA1378];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];

  __int16 v9 = (void *)[v7 initWithNSUUID:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA1308]);
  [v10 setUuid:v9];
  [v10 setComponent:v4];

  return v10;
}

- (void)emitRequestLinkEventForRtsSessionId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CSSiriSpeechRecordingContext *)self _createRequestLinkInfo:self->_sessionUUID component:1];
  id v6 = [v4 UUIDString];
  id v7 = [(CSSiriSpeechRecordingContext *)self _createRequestLinkInfo:v6 component:41];

  id v8 = objc_alloc_init(MEMORY[0x1E4FA12F8]);
  [v8 setSource:v5];
  [v8 setTarget:v7];
  __int16 v9 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v9 emitMessage:v8];

  id v10 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    __int16 v12 = [v4 UUIDString];
    sessionUUID = self->_sessionUUID;
    int v14 = 136315651;
    uint64_t v15 = "-[CSSiriSpeechRecordingContext emitRequestLinkEventForRtsSessionId:]";
    __int16 v16 = 2113;
    uint64_t v17 = v12;
    __int16 v18 = 2113;
    uint64_t v19 = sessionUUID;
    _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s rtsSessionId: %{private}@, requestId: %{private}@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)emitRequestLinkEventForMHUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  sessionUUID = self->_sessionUUID;
  id v5 = a3;
  id v6 = [(CSSiriSpeechRecordingContext *)self _createRequestLinkInfo:sessionUUID component:1];
  id v7 = [v5 UUIDString];

  id v8 = [(CSSiriSpeechRecordingContext *)self _createRequestLinkInfo:v7 component:9];

  id v9 = objc_alloc_init(MEMORY[0x1E4FA12F8]);
  [v9 setSource:v6];
  [v9 setTarget:v8];
  id v10 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v10 emitMessage:v9];

  uint64_t v11 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    __int16 v13 = "-[CSSiriSpeechRecordingContext emitRequestLinkEventForMHUUID:]";
    _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
}

- (void)instrumentSiriCueForAlertType:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CSSiriSpeechRecordingContext_instrumentSiriCueForAlertType___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __62__CSSiriSpeechRecordingContext_instrumentSiriCueForAlertType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40) == 1)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
    if (v2)
    {
      uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F152F0]];
      if (![v3 count])
      {
        id v9 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315138;
          int v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
          _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s No alert behavior in recordingSettings", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_17;
      }
      id v4 = [v3 objectForKey:&unk_1F23C46D0];
      id v5 = v4;
      if (!v4)
      {
        id v10 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315138;
          int v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
          _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s No alert style specified for record starting", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_16;
      }
      uint64_t v6 = [v4 integerValue];
      if (v6 == 2)
      {
        uint64_t v7 = 1;
      }
      else
      {
        if (v6 != 1)
        {
LABEL_16:

LABEL_17:
          return;
        }
        uint64_t v7 = 3;
      }
      [*(id *)(a1 + 32) _instrumentSiriCue:v7];
      goto LABEL_16;
    }
    id v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s recordingSettings was nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_instrumentSiriCue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FA1318]);
  [v6 setSiriCueType:v3];
  id v5 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v5 logInstrumentation:v6 machAbsoluteTime:mach_absolute_time() turnIdentifier:self->_turnIdentifier];
}

- (void)instrumentSiriCue:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CSSiriSpeechRecordingContext_instrumentSiriCue___block_invoke;
  v4[3] = &unk_1E658BDD8;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __50__CSSiriSpeechRecordingContext_instrumentSiriCue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _instrumentSiriCue:*(unsigned int *)(a1 + 40)];
}

- (void)_finalizeAudioFileWriterWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    audioFileWriter = self->_audioFileWriter;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecordingContext _finalizeAudioFileWriterWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v16 = (uint64_t (*)(uint64_t, uint64_t))audioFileWriter;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (_audioFileWriter = %@)", buf, 0x20u);
  }
  if (self->_audioFileWriter)
  {
    uint64_t v7 = self->_queue;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v16 = __Block_byref_object_copy__3478;
    uint64_t v17 = __Block_byref_object_dispose__3479;
    id v8 = self->_audioFileWriter;
    __int16 v18 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke;
    v11[3] = &unk_1E6589BC8;
    id v9 = v7;
    int v12 = v9;
    id v13 = v4;
    uint64_t v14 = buf;
    [(CSSiriAudioFileWriter *)v8 flushWithCompletion:v11];
    id v10 = self->_audioFileWriter;
    self->_audioFileWriter = 0;

    _Block_object_dispose(buf, 8);
  }
}

void __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke_2;
  v13[3] = &unk_1E6589BA0;
  id v8 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v7;
  uint64_t v10 = *(void *)(a1 + 48);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v8, v13);
}

void __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)_initializeAudioFileWriterWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  int v5 = [CSSiriAudioFileWriter alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__CSSiriSpeechRecordingContext__initializeAudioFileWriterWithAudioStreamBasicDescription___block_invoke;
  v8[3] = &unk_1E6589B78;
  v8[4] = self;
  id v6 = [(CSSiriAudioFileWriter *)v5 initWithType:2 pathGenerator:v8 priority:21];
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v6;

  [(CSSiriAudioFileWriter *)self->_audioFileWriter configureWithAudioStreamBasicDescription:a3];
}

id __90__CSSiriSpeechRecordingContext__initializeAudioFileWriterWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  uint64_t v2 = CSSiriSpeechRecordingRecordedAudioDirectoryPath();
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

  id v4 = [NSString alloc];
  int v5 = *(__CFString **)(*(void *)(a1 + 32) + 184);
  if (!v5) {
    int v5 = @"Unknown";
  }
  id v6 = (void *)[v4 initWithFormat:@"%@.wav", v5];
  id v7 = [v2 stringByAppendingPathComponent:v6];

  return v7;
}

- (void)endRecordingAudio
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSSiriSpeechRecordingContext endRecordingAudio]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[161])
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke_2;
    v2[3] = &unk_1E6589A68;
    v2[4] = result;
    return (unsigned char *)[result _finalizeAudioFileWriterWithCompletion:v2];
  }
  return result;
}

void __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  if (v6)
  {
    __int16 v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 136315650;
      uint64_t v17 = "-[CSSiriSpeechRecordingContext endRecordingAudio]_block_invoke_2";
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v16, 0x20u);
    }
  }
  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v9;

  id v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 88);
    int v16 = 136315650;
    uint64_t v17 = "-[CSSiriSpeechRecordingContext endRecordingAudio]_block_invoke";
    __int16 v18 = 2048;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s %p (_recordedAudioFileURL = %@)", (uint8_t *)&v16, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
}

- (void)appendRecordedAudioBuffer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CSSiriSpeechRecordingContext_appendRecordedAudioBuffer___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__CSSiriSpeechRecordingContext_appendRecordedAudioBuffer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) appendAudioData:*(void *)(a1 + 40)];
}

- (void)beginRecordingAudioWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[CSSiriSpeechRecordingContext beginRecordingAudioWithAudioStreamBasicDescription:]";
    __int16 v14 = 2048;
    uint64_t v15 = self;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  long long v6 = *(_OWORD *)&a3->mBytesPerPacket;
  long long v9 = *(_OWORD *)&a3->mSampleRate;
  long long v10 = v6;
  uint64_t v11 = *(void *)&a3->mBitsPerChannel;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke;
  v8[3] = &unk_1E6589B50;
  v8[4] = self;
  dispatch_async(queue, v8);
}

void __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 161) = [*(id *)(*(void *)(a1 + 32) + 40) shouldUseLocalAudioFileWriter];
  if ([*(id *)(*(void *)(a1 + 32) + 40) isRequestDuringActiveCall])
  {
    uint64_t v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v7 = "-[CSSiriSpeechRecordingContext beginRecordingAudioWithAudioStreamBasicDescription:]_block_invoke";
      __int16 v8 = 2048;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_INFO, "%s %p, ignore begin recording audio due to active phone call", buf, 0x16u);
    }
  }
  else
  {
    id v4 = *(unsigned char **)(a1 + 32);
    if (v4[161])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke_2;
      v5[3] = &unk_1E6589A68;
      v5[4] = v4;
      [v4 _finalizeAudioFileWriterWithCompletion:v5];
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
      [*(id *)(a1 + 32) _initializeAudioFileWriterWithAudioStreamBasicDescription:a1 + 40];
    }
  }
}

void __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke_2(uint64_t a1)
{
}

- (void)relinquishAudioSessionAssertionsWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[CSSiriSpeechRecordingContext relinquishAudioSessionAssertionsWithError:]";
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p error = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithError___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __74__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithError___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) relinquishWithError:*(void *)(a1 + 40) options:0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v3 relinquishWithError:v2 options:0];
}

- (void)relinquishAudioSessionAssertionsWithContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[CSSiriSpeechRecordingContext relinquishAudioSessionAssertionsWithContext:]";
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithContext___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __76__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) relinquishWithContext:*(void *)(a1 + 40) options:0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v3 relinquishWithContext:v2 options:0];
}

- (void)didStopRecordingWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[CSSiriSpeechRecordingContext didStopRecordingWithError:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p error = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__CSSiriSpeechRecordingContext_didStopRecordingWithError___block_invoke;
    v7[3] = &unk_1E658D4B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __58__CSSiriSpeechRecordingContext_didStopRecordingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) relinquishWithError:*(void *)(a1 + 40) options:1];
}

- (void)willStopRecordingAtHostTime:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  long long v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[CSSiriSpeechRecordingContext willStopRecordingAtHostTime:]";
    __int16 v16 = 2048;
    uint64_t v17 = self;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %p hostTime = %llu", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke;
    v13[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    void v13[4] = a3;
    id v7 = (void *)[MEMORY[0x1E4F4E3C8] newWithBuilder:v13];
    id v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "-[CSSiriSpeechRecordingContext willStopRecordingAtHostTime:]";
      __int16 v16 = 2048;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      unint64_t v19 = (unint64_t)v7;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke_48;
    block[3] = &unk_1E658D4B0;
    void block[4] = self;
    id v12 = v7;
    id v10 = v7;
    dispatch_async(queue, block);
  }
}

void __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (!v4)
  {
    uint64_t v4 = mach_absolute_time();
    id v3 = v5;
  }
  [v3 setTimestamp:v4];
  [v5 setReason:@"Stop Recording"];
}

uint64_t __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke_48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) relinquishWithContext:*(void *)(a1 + 40) options:1];
}

- (void)didDetectTwoShotWithAudioActivationInfo:(id)a3 atTime:(double)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v34 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
    __int16 v35 = 2048;
    v36 = self;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2048;
    double v40 = a4;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s %p audioActivationInfo = %@, time = %f", buf, 0x2Au);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    id v9 = [v6 dateByAddingTimeIntervalSinceActivation:a4];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v12 = v11;

    __int16 v13 = [v12 dateByAddingTimeInterval:0.2];

    os_log_t v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = v14;
      [v13 timeIntervalSinceNow];
      *(_DWORD *)buf = 136315906;
      v34 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2048;
      double v40 = v16;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s %p effectiveDate = %@ (%f)", buf, 0x2Au);
    }
    objc_initWeak(&location, self);
    uint64_t v17 = AFAudioSessionAssertionGetCurrentAcquisitionService();
    __int16 v18 = (void *)MEMORY[0x1E4F4E3C8];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke;
    v29[3] = &unk_1E6589AE0;
    id v19 = v13;
    id v30 = v19;
    uint64_t v31 = self;
    uint64_t v20 = (void *)[v18 newWithBuilder:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_2;
    v27[3] = &unk_1E6589B08;
    objc_copyWeak(&v28, &location);
    id v21 = [v17 acquireAudioSessionAssertionWithContext:v20 relinquishmentHandler:v27];

    uint64_t v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v21;
      _os_log_impl(&dword_1C9338000, v22, OS_LOG_TYPE_INFO, "%s %p twoShotDetectionAudioSessionAssertion = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_43;
    v25[3] = &unk_1E658D4B0;
    v25[4] = self;
    id v26 = v21;
    id v24 = v21;
    dispatch_async(queue, v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setTimestamp:mach_absolute_time()];
  [v3 setReason:@"Two Shot Detection"];
  [v3 setEffectiveDate:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 184);
  id v6 = @"sessionUUID";
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 setUserInfo:v5];
}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)*MEMORY[0x1E4F4E380];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v10 = 136315650;
      id v11 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]_block_invoke_2";
      __int16 v12 = 2048;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v10, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v10 = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]_block_invoke";
    __int16 v12 = 2048;
    id v13 = WeakRetained;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s %p (relinquishmentContext = %@)", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }
}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_43(uint64_t a1)
{
}

- (void)willPrepareAndStartRecordingWithAudioActivationInfo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
    __int16 v29 = 2048;
    id v30 = self;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %p audioActivationInfo = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    id v7 = [v4 audioSessionActivationTargetDate];
    os_log_t v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      [v7 timeIntervalSinceNow];
      *(_DWORD *)buf = 136315906;
      id v28 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
      __int16 v29 = 2048;
      id v30 = self;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2048;
      uint64_t v34 = v10;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s %p effectiveDate = %@ (%f)", buf, 0x2Au);
    }
    objc_initWeak(&location, self);
    id v11 = AFAudioSessionAssertionGetCurrentAcquisitionService();
    __int16 v12 = (void *)MEMORY[0x1E4F4E3C8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke;
    v23[3] = &unk_1E6589AE0;
    id v13 = v7;
    id v24 = v13;
    __int16 v25 = self;
    __int16 v14 = (void *)[v12 newWithBuilder:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_2;
    v21[3] = &unk_1E6589B08;
    objc_copyWeak(&v22, &location);
    id v15 = [v11 acquireAudioSessionAssertionWithContext:v14 relinquishmentHandler:v21];

    uint64_t v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v28 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
      __int16 v29 = 2048;
      id v30 = self;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s %p startRecordingAudioSessionAssertion = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_37;
    v19[3] = &unk_1E658D4B0;
    v19[4] = self;
    id v20 = v15;
    id v18 = v15;
    dispatch_async(queue, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setTimestamp:mach_absolute_time()];
  [v3 setReason:@"Start Recording"];
  [v3 setEffectiveDate:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 184);
  id v6 = @"sessionUUID";
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 setUserInfo:v5];
}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)*MEMORY[0x1E4F4E380];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      os_log_t v8 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v10 = 136315650;
      id v11 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]_block_invoke_2";
      __int16 v12 = 2048;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v10, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    os_log_t v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v10 = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]_block_invoke";
    __int16 v12 = 2048;
    id v13 = WeakRetained;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s %p (relinquishmentContext = %@)", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }
}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_37(uint64_t a1)
{
}

- (void)updateRecordingSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext updateRecordingSettings:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (recordingSettings = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CSSiriSpeechRecordingContext_updateRecordingSettings___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __56__CSSiriSpeechRecordingContext_updateRecordingSettings___block_invoke(uint64_t a1)
{
}

- (void)updateRecordingInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext updateRecordingInfo:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (recordingInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CSSiriSpeechRecordingContext_updateRecordingInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __52__CSSiriSpeechRecordingContext_updateRecordingInfo___block_invoke(uint64_t a1)
{
}

- (void)updateVoiceTriggerInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext updateVoiceTriggerInfo:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (voiceTriggerInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CSSiriSpeechRecordingContext_updateVoiceTriggerInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __55__CSSiriSpeechRecordingContext_updateVoiceTriggerInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (void)updateAudioRecordDeviceInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext updateAudioRecordDeviceInfo:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (audioRecordDeviceInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CSSiriSpeechRecordingContext_updateAudioRecordDeviceInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __60__CSSiriSpeechRecordingContext_updateAudioRecordDeviceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (void)updateAudioRecordContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriSpeechRecordingContext updateAudioRecordContext:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (audioRecordContext = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CSSiriSpeechRecordingContext_updateAudioRecordContext___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __57__CSSiriSpeechRecordingContext_updateAudioRecordContext___block_invoke(uint64_t a1)
{
}

- (void)acquireRecordedAudioWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v10 = "-[CSSiriSpeechRecordingContext acquireRecordedAudioWithHandler:]";
      __int16 v11 = 2048;
      __int16 v12 = self;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke;
    v7[3] = &unk_1E658D3A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 112);
  uint64_t v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2;
  v4[3] = &unk_1E658D3A0;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 40);
  dispatch_group_notify(v2, v3, v4);
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) isRequestDuringActiveCall])
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    int v3 = [*(id *)(*(void *)(a1 + 32) + 40) shouldUseLocalAudioFileWriter];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3)
    {
      id v5 = (uint64_t (*)(uint64_t, uint64_t))*(id *)(v4 + 88);
      id v6 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecordingContext acquireRecordedAudioWithHandler:]_block_invoke_2";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %p (recordedAudioFileURL = %@)", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v20 = __Block_byref_object_copy__3478;
      id v21 = __Block_byref_object_dispose__3479;
      id v22 = *(id *)(a1 + 32);
      id v8 = objc_alloc(MEMORY[0x1E4F4E558]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_22;
      v18[3] = &unk_1E6589A90;
      v18[4] = buf;
      id v9 = (void *)[v8 initWithBlock:v18];
      uint64_t v10 = *(void *)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2_24;
      v16[3] = &unk_1E658D4D8;
      id v11 = v9;
      id v17 = v11;
      (*(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t), void *))(v10 + 16))(v10, v5, v16);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      __int16 v12 = *(void **)(v4 + 168);
      uint64_t v13 = *(void *)(v4 + 184);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_3;
      v14[3] = &unk_1E6589AB8;
      v14[4] = v4;
      id v15 = *(id *)(a1 + 40);
      [v12 getAudioFileWithRequestId:v13 completion:v14];
    }
  }
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3478;
  void v11[4] = __Block_byref_object_dispose__3479;
  id v12 = *(id *)(a1 + 32);
  id v4 = objc_alloc(MEMORY[0x1E4F4E558]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_4;
  v10[3] = &unk_1E6589A90;
  v10[4] = v11;
  id v5 = (void *)[v4 initWithBlock:v10];
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_5;
  v8[3] = &unk_1E658D4D8;
  id v7 = v5;
  id v9 = v7;
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v3, v8);

  _Block_object_dispose(v11, 8);
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (void)getAudioRecordRouteAndDeviceIdentificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __89__CSSiriSpeechRecordingContext_getAudioRecordRouteAndDeviceIdentificationWithCompletion___block_invoke;
    v7[3] = &unk_1E658D3A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __89__CSSiriSpeechRecordingContext_getAudioRecordRouteAndDeviceIdentificationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) route];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) remoteDeviceUID];
  id v4 = v3;
  if (v3) {
    [v3 UUIDString];
  }
  else {
  id v5 = [*(id *)(*(void *)(a1 + 32) + 72) deviceIdentifier];
  }
  uint64_t v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315906;
    id v8 = "-[CSSiriSpeechRecordingContext getAudioRecordRouteAndDeviceIdentificationWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s route = %@, deviceIdentifier = %@, deviceUID = %@", (uint8_t *)&v7, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAccessToRecordedAudioForVoiceIdentificationTraining:(BOOL)a3 forResultCandidateId:(id)a4 sharedUserId:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v20 = "-[CSSiriSpeechRecordingContext updateAccessToRecordedAudioForVoiceIdentificationTraining:forResultCandidateId:sharedUserId:]";
    __int16 v21 = 2048;
    id v22 = self;
    __int16 v23 = 1024;
    BOOL v24 = v6;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s %p (allows = %d, resultCandidateId = %@)", buf, 0x26u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__CSSiriSpeechRecordingContext_updateAccessToRecordedAudioForVoiceIdentificationTraining_forResultCandidateId_sharedUserId___block_invoke;
  v14[3] = &unk_1E658D488;
  BOOL v18 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

void __124__CSSiriSpeechRecordingContext_updateAccessToRecordedAudioForVoiceIdentificationTraining_forResultCandidateId_sharedUserId___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 128);
    if (v2)
    {
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = *(void **)(v6 + 128);
        *(void *)(v6 + 128) = v5;

        uint64_t v3 = *(void *)(a1 + 40);
      }
      if (!*(void *)(v3 + 136))
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void **)(v9 + 136);
        *(void *)(v9 + 136) = v8;

        uint64_t v3 = *(void *)(a1 + 40);
      }
      [*(id *)(v3 + 128) addObject:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 48))
      {
        __int16 v11 = *(void **)(*(void *)(a1 + 40) + 136);
        objc_msgSend(v11, "setObject:forKey:");
      }
    }
    else
    {
      objc_msgSend(v4, "removeObject:");
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(*(void *)(a1 + 40) + 136);
      [v15 removeObjectForKey:v14];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 120) = v2;
    id v12 = *(void **)(a1 + 48);
    id v13 = (id *)(*(void *)(a1 + 40) + 152);
    objc_storeStrong(v13, v12);
  }
}

- (void)updateSelectedResultCandidateId:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "-[CSSiriSpeechRecordingContext updateSelectedResultCandidateId:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (selectedResultCandidateId = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CSSiriSpeechRecordingContext_updateSelectedResultCandidateId___block_invoke;
  v8[3] = &unk_1E658D4B0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __64__CSSiriSpeechRecordingContext_updateSelectedResultCandidateId___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (void)updateStartSpeechId:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "-[CSSiriSpeechRecordingContext updateStartSpeechId:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %p (startSpeechId = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CSSiriSpeechRecordingContext_updateStartSpeechId___block_invoke;
  v8[3] = &unk_1E658D4B0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __52__CSSiriSpeechRecordingContext_updateStartSpeechId___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)resignCurrent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSSiriSpeechRecordingContext resignCurrent]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSSiriSpeechRecordingContext_resignCurrent__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__CSSiriSpeechRecordingContext_resignCurrent__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 0;
    return [*(id *)(result + 32) _didResignCurrent];
  }
  return result;
}

- (void)becomeCurrent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSSiriSpeechRecordingContext becomeCurrent]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSSiriSpeechRecordingContext_becomeCurrent__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__CSSiriSpeechRecordingContext_becomeCurrent__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    return [*(id *)(result + 32) _didBecomeCurrent];
  }
  return result;
}

- (CSSiriSpeechRecordingContext)initWithSessionUUID:(id)a3 turnIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CSSiriSpeechRecordingContext;
  __int16 v8 = [(CSSiriSpeechRecordingContext *)&v23 init];
  if (v8)
  {
    if (!v6)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F29128]);
      id v6 = [v9 UUIDString];
    }
    uint64_t v10 = [v6 copy];
    sessionUUID = v8->_sessionUUID;
    v8->_sessionUUID = (NSString *)v10;

    __int16 v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v13 = v8->_sessionUUID;
      *(_DWORD *)buf = 136315650;
      __int16 v25 = "-[CSSiriSpeechRecordingContext initWithSessionUUID:turnIdentifier:]";
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      __int16 v29 = v13;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@", buf, 0x20u);
    }
    __int16 v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.assistant.request.speech-context", v14);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    dispatch_group_t v17 = dispatch_group_create();
    recordingAudioGroup = v8->_recordingAudioGroup;
    v8->_recordingAudioGroup = (OS_dispatch_group *)v17;

    objc_storeStrong((id *)&v8->_turnIdentifier, a4);
    if (AFIsInternalInstall())
    {
      id v19 = [MEMORY[0x1E4F4E538] sharedPreferences];
      v8->_wantsRecordedAudioBufferLogs = [v19 shouldLogForQA];
    }
    else
    {
      v8->_wantsRecordedAudioBufferLogs = 0;
    }
    id v20 = objc_alloc_init(CSSiriAudioMessageRequestClient);
    audioMessageRequestClient = v8->_audioMessageRequestClient;
    v8->_audioMessageRequestClient = v20;

    v8->_shouldUseLocalFileWriter = 1;
  }

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)CSSiriSpeechRecordingContext;
  id v4 = [(CSSiriSpeechRecordingContext *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ (sessionUUID = %@)", v4, self->_sessionUUID];

  return v5;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "-[CSSiriSpeechRecordingContext dealloc]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    dispatch_queue_t v15 = sessionUUID;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", buf, 0x20u);
  }
  id v5 = self->_recordingAudioGroup;
  id v6 = v5;
  if (self->_shouldUseLocalFileWriter)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__CSSiriSpeechRecordingContext_dealloc__block_invoke;
    v8[3] = &unk_1E6589A68;
    id v9 = v5;
    [(CSSiriSpeechRecordingContext *)self _finalizeAudioFileWriterWithCompletion:v8];
  }
  [(CSSiriSpeechRecordingContext *)self _removeRecordedAudio];
  [(CSSiriAudioMessageRequestClient *)self->_audioMessageRequestClient releaseAudioMessageRetainLockFromRequestId:self->_sessionUUID];

  v7.receiver = self;
  v7.super_class = (Class)CSSiriSpeechRecordingContext;
  [(CSSiriSpeechRecordingContext *)&v7 dealloc];
}

void __39__CSSiriSpeechRecordingContext_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  [v5 removeItemAtURL:v4 error:0];

  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

@end
@interface AFConnectionClientServiceDelegate
- (AFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4;
- (id)_connectionDelegate;
- (void)aceConnectionWillRetryOnError:(id)a3;
- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3;
- (void)acousticIDRequestWillStart;
- (void)appLaunchFailedWithBundleIdentifier:(id)a3;
- (void)audioPlaybackRequestDidStart:(id)a3;
- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4;
- (void)audioPlaybackRequestWillStart:(id)a3;
- (void)audioSessionDidBecomeActive:(BOOL)a3;
- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3;
- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4;
- (void)audioSessionIDChanged:(unsigned int)a3;
- (void)audioSessionWillBecomeActive:(BOOL)a3;
- (void)cacheImage:(id)a3;
- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)extensionRequestWillStartForApplication:(id)a3;
- (void)getBulletinContext:(id)a3;
- (void)invalidateCurrentUserActivity;
- (void)musicWasDetected;
- (void)networkDidBecomeActive;
- (void)quickStopWasHandledWithActions:(unint64_t)a3;
- (void)requestDidAskForTimeoutExtension:(double)a3;
- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)requestDidUpdateResponseMode:(id)a3;
- (void)requestHandleCommand:(id)a3 reply:(id)a4;
- (void)requestRequestedDismissAssistant;
- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3;
- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5;
- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4;
- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)shouldSpeakChanged:(BOOL)a3;
- (void)speechRecognitionDidFail:(id)a3;
- (void)speechRecognized:(id)a3;
- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4;
- (void)speechRecognizedPartialResult:(id)a3;
- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5;
- (void)speechRecordingDidCancelWithReply:(id)a3;
- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7;
- (void)speechRecordingDidEndWithReply:(id)a3;
- (void)speechRecordingDidFail:(id)a3 reply:(id)a4;
- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4;
- (void)speechRecordingStartpointDetectedWithReply:(id)a3;
- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3;
- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4;
- (void)startPlaybackDidFail:(int64_t)a3;
- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)willStopRecordingWithSignpostID:(unint64_t)a3;
@end

@implementation AFConnectionClientServiceDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)networkDidBecomeActive
{
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__AFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &to);
  dispatch_async(targetQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
}

void __59__AFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _markNetworkDidBecomeActive];
}

- (void)appLaunchFailedWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E5929FC0;
  objc_copyWeak(&v9, &to);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __73__AFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tellDelegateFailedToLaunchAppWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E5929FC0;
  objc_copyWeak(&v9, &to);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __78__AFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tellDelegateWillProcessAppLaunchWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)audioSessionDidBecomeActive:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke;
  v4[3] = &unk_1E592AEA0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __65__AFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)audioSessionWillBecomeActive:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__AFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke;
  v4[3] = &unk_1E592AEA0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __66__AFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)startPlaybackDidFail:(int64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke;
  v4[3] = &unk_1E592B398;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __58__AFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateStartPlaybackDidFail:*(void *)(a1 + 40)];
}

- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__AFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke;
  v13[3] = &unk_1E5926858;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, v13);
}

void __80__AFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateWillProcessStartPlayback:a1[7] intent:a1[5] completion:a1[6]];
}

- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __71__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestDidStop:a1[5] error:a1[6]];
}

- (void)audioPlaybackRequestDidStart:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __66__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestDidStart:*(void *)(a1 + 40)];
}

- (void)audioPlaybackRequestWillStart:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__AFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __67__AFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestWillStart:*(void *)(a1 + 40)];
}

- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  id v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke;
  block[3] = &unk_1E5927270;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(targetQueue, block);
}

void __77__AFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidEndInterruption:*(unsigned __int8 *)(a1 + 48) userInfo:*(void *)(a1 + 40)];
}

- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__AFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __82__AFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:*(void *)(a1 + 40)];
}

- (void)speechRecognitionDidFail:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E592B3C0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __62__AFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _cancelRequestTimeoutForReason:v3];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v4 _tellSpeechDelegateRecognitionDidFail:*(void *)(a1 + 40)];
}

- (void)speechRecognizedPartialResult:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke;
  block[3] = &unk_1E592B3C0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __67__AFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _extendExistingRequestTimeoutForReason:v3];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v4 _tellSpeechDelegateSpeechRecognizedPartialResult:*(void *)(a1 + 40)];
}

- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__AFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __86__AFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellSpeechDelegateRecognitionUpdateWillBeginForTask:*(void *)(a1 + 40)];
}

- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__AFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_1E592C220;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(targetQueue, v15);
}

void __97__AFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:a1[5] utterances:a1[6] refId:a1[7]];
}

- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __84__AFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:a1[5] refId:a1[6]];
}

- (void)speechRecognized:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AFConnectionClientServiceDelegate_speechRecognized___block_invoke;
  block[3] = &unk_1E592B3C0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __54__AFConnectionClientServiceDelegate_speechRecognized___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _markSpeechRecognized];
  [WeakRetained _extendRequestTimeoutForReason:v2 durationInSeconds:0.0];
  [WeakRetained _tellSpeechDelegateSpeechRecognized:*(void *)(a1 + 40)];
  [WeakRetained _beginInterstitialsForReason:v2];
}

- (void)willStopRecordingWithSignpostID:(unint64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke;
  v4[3] = &unk_1E592B398;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __69__AFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _willStopRecordingWithSignpostID:*(void *)(a1 + 40)];
}

- (void)speechRecordingDidFail:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

uint64_t __66__AFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _speechRecordingDidFailWithError:a1[5]];

  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)speechRecordingDidCancelWithReply:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __71__AFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _updateStateIfNotInSync];
  [WeakRetained _checkAndSetIsCapturingSpeech:0];
  [WeakRetained _tellSpeechDelegateRecordingDidCancel];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)speechRecordingDidEndWithReply:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke;
  block[3] = &unk_1E592B3E8;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __68__AFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _extendRequestTimeoutForReason:v2 durationInSeconds:0.0];
  [WeakRetained _checkAndSetIsCapturingSpeech:0];
  [WeakRetained _tellSpeechDelegateRecordingDidEnd];
  [WeakRetained _beginInterstitialsForReason:v2];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke;
  block[3] = &unk_1E592B3E8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(targetQueue, block);
}

void __87__AFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateToPerformTwoShotPromptWithType:a1[6] reply:a1[5]];
}

- (void)speechRecordingStartpointDetectedWithReply:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__AFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

uint64_t __80__AFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellSpeechDelegateRecordingDidDetectStartpoint];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__AFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke;
  block[3] = &unk_1E5924A18;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a4;
  BOOL v22 = a5;
  id v19 = v13;
  unint64_t v20 = a6;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(targetQueue, block);
}

void __119__AFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setRecordRoute:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 64)) {
    [WeakRetained _markIsDucking];
  }
  if (*(unsigned char *)(a1 + 65)) {
    [WeakRetained _markIsTwoShot];
  }
  uint64_t v2 = WeakRetained;
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_updateSpeechEndHostTime:");
    uint64_t v2 = WeakRetained;
  }
  [v2 _tellSpeechDelegateRecordingDidChangeAVRecordRoute:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  kdebug_trace();
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__AFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke;
  v13[3] = &unk_1E5927298;
  unsigned int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, v13);
}

void __97__AFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setAudioSessionID:*(unsigned int *)(a1 + 56)];
  [WeakRetained _setRecordRoute:*(void *)(a1 + 40)];
  [WeakRetained _tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40) audioSessionID:*(unsigned int *)(a1 + 56)];
  [WeakRetained _updateStateIfNotInSync];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

uint64_t __97__AFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  char v3 = [WeakRetained _startInputAudioPowerUpdatesWithXPCWrapper:a1[5]];

  id v4 = objc_loadWeakRetained((id *)(a1[4] + 8));
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a1[5];
  }
  [v4 _tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:v6];

  uint64_t result = a1[6];
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)aceConnectionWillRetryOnError:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__AFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __67__AFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _aceConnectionWillRetryOnError:*(void *)(a1 + 40)];
}

- (void)audioSessionIDChanged:(unsigned int)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__AFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke;
  v4[3] = &unk_1E5929AC8;
  void v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __59__AFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)shouldSpeakChanged:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke;
  v4[3] = &unk_1E592AEA0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __56__AFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setShouldSpeak:*(unsigned __int8 *)(a1 + 40)];
}

- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__AFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __82__AFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateExtensionRequestFinishedForApplication:a1[5] error:a1[6]];
}

- (void)extensionRequestWillStartForApplication:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __77__AFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateExtensionRequestWillStartForApplication:*(void *)(a1 + 40)];
}

- (void)cacheImage:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AFConnectionClientServiceDelegate_cacheImage___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __48__AFConnectionClientServiceDelegate_cacheImage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateCacheImage:*(void *)(a1 + 40)];
}

- (void)invalidateCurrentUserActivity
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __66__AFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateInvalidateCurrentUserActivity];
}

- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __68__AFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateSetUserActivityInfo:a1[5] webpageURL:a1[6]];
}

- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke;
  v4[3] = &unk_1E592AEA0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __75__AFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateDidFinishAcousticIDRequestWithSuccess:*(unsigned __int8 *)(a1 + 40)];
}

- (void)musicWasDetected
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AFConnectionClientServiceDelegate_musicWasDetected__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __53__AFConnectionClientServiceDelegate_musicWasDetected__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateDidDetectMusic];
}

- (void)acousticIDRequestWillStart
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __63__AFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateWillStartAcousticIDRequest];
}

- (void)getBulletinContext:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AFConnectionClientServiceDelegate_getBulletinContext___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __56__AFConnectionClientServiceDelegate_getBulletinContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v2 = [WeakRetained _cachedBulletins];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (void)quickStopWasHandledWithActions:(unint64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke;
  v4[3] = &unk_1E592B398;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __68__AFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[AFConnectionClientServiceDelegate quickStopWasHandledWithActions:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s %@ Got quick stop handled message with actions %tu taken.", (uint8_t *)&v7, 0x20u);
  }
  BOOL v5 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnection:WeakRetained didHandleQuickStopWithAction:*(void *)(a1 + 40)];
  }
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke;
  v4[3] = &unk_1E592B398;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __70__AFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained requestDidAskForTimeoutExtension:*(double *)(a1 + 40)];
}

- (void)requestDidUpdateResponseMode:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__AFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __66__AFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[AFFeatureFlags isStateFeedbackEnabled])
  {
    uint64_t v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 136315650;
      id v8 = "-[AFConnectionClientServiceDelegate requestDidUpdateResponseMode:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #modes %@ Got update to response mode : %@", (uint8_t *)&v7, 0x20u);
    }
    BOOL v5 = [*(id *)(a1 + 32) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v5 assistantConnection:WeakRetained didUpdateResponseMode:*(void *)(a1 + 40)];
    }
  }
}

- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__AFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke;
  v4[3] = &unk_1E592B398;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __80__AFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[AFConnectionClientServiceDelegate requestRequestedDismissAssistantWithReason:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message with reason : %ld", (uint8_t *)&v7, 0x20u);
  }
  BOOL v5 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnection:WeakRetained dismissAssistantWithReason:*(void *)(a1 + 40)];
LABEL_7:

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnectionDismissAssistant:WeakRetained];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)requestRequestedDismissAssistant
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __69__AFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    int v7 = "-[AFConnectionClientServiceDelegate requestRequestedDismissAssistant]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 assistantConnectionDismissAssistant:WeakRetained];
  }
}

- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke;
  block[3] = &unk_1E592C598;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __67__AFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v4 = [*(id *)(a1 + 40) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v4 assistantConnection:WeakRetained openURL:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[AFConnectionClientServiceDelegate requestRequestedOpenURL:reply:]_block_invoke";
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected nil URL", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__AFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke;
  v15[3] = &unk_1E592A8F8;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(targetQueue, v15);
}

void __91__AFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v4 = [*(id *)(a1 + 40) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v4 assistantConnection:WeakRetained openApplicationWithBundleID:*(void *)(a1 + 32) URL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[AFConnectionClientServiceDelegate requestRequestedOpenApplicationWithBundleID:URL:reply:]_block_invoke";
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected nil bundle ID", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)requestHandleCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke;
  block[3] = &unk_1E592C598;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal
    && (double ClientCommandDeliveryDelay = _AFPreferencesGetClientCommandDeliveryDelay(), ClientCommandDeliveryDelay > 0.0))
  {
    double v3 = ClientCommandDeliveryDelay;
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    [v4 systemUptime];
    uint64_t v6 = v5;

    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      BOOL v22 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      double v26 = v3;
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s Delaying delivery of client command %@ by %f seconds...", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v9 = [WeakRetained _activeRequestUUID];

    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_739;
    block[3] = &unk_1E5925C18;
    void block[4] = v11;
    id v17 = v9;
    id v18 = *(id *)(a1 + 32);
    uint64_t v20 = v6;
    id v19 = *(id *)(a1 + 48);
    id v13 = v9;
    dispatch_after(v10, v12, block);
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [v15 _handleCommand:*(void *)(a1 + 32) reply:*(void *)(a1 + 48)];
  }
}

void __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_739(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v3 = [WeakRetained _activeRequestUUID];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  uint64_t v5 = AFSiriLogContextConnection;
  BOOL v6 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = (void *)MEMORY[0x1E4F28F80];
      dispatch_time_t v10 = v5;
      uint64_t v11 = [v9 processInfo];
      [v11 systemUptime];
      double v13 = v12 - *(double *)(a1 + 64);
      int v15 = 136315650;
      id v16 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      double v20 = v13;
      _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s Delayed delivery of client command %@ by %f seconds.", (uint8_t *)&v15, 0x20u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v7 _handleCommand:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else if (v6)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    int v15 = 136315394;
    id v16 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Dropping delayed client command %@ because request already ended.", (uint8_t *)&v15, 0x16u);
  }
}

- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2;
  v4[3] = &unk_1E5924788;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [WeakRetained _handleCommand:v3 reply:v4];
}

uint64_t __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __71__AFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _startUIRequestWithInfo:a1[5] completion:a1[6]];
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __71__AFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _startUIRequestWithText:a1[5] completion:a1[6]];
}

- (id)_connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v3 = [WeakRetained delegate];

  return v3;
}

- (AFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AFConnectionClientServiceDelegate;
  uint64_t v8 = [(AFConnectionClientServiceDelegate *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    if (v7)
    {
      id v10 = (OS_dispatch_queue *)v7;
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v10;
    }
    else
    {
      id v12 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v12;
    }
  }
  return v9;
}

@end
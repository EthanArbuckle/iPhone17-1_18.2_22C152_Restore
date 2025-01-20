@interface CSSiriAudioPlaybackService
+ (id)sharedService;
- (CSSiriAudioPlaybackService)initWithAudioSessionController:(id)a3;
- (id)_audioSession;
- (id)_createAudioPlaybackSessionWithRequest:(id)a3 options:(unint64_t)a4;
- (id)_hapticEngine;
- (id)_playHapticForRequest:(id)a3;
- (unsigned)_audioSessionID;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_evictAllReusableSessionsForReason:(id)a3;
- (void)_handleExecutionForSession:(id)a3;
- (void)_handleFinalizationForSession:(id)a3 error:(id)a4;
- (void)_handlePreparationForSession:(id)a3;
- (void)_hapticPlaybackDidCompleteForAllActiveRequests;
- (void)_initializeAndPrewarmHapticEngineIfNeededForRequest:(id)a3;
- (void)_invalidate;
- (void)_prewarmRequest:(id)a3 completion:(id)a4;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_startHapticOnlyRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)_startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)_stopAllRequests:(BOOL)a3 completion:(id)a4;
- (void)_stopAllRequestsSynchronously;
- (void)_stopRequest:(id)a3 immediately:(BOOL)a4;
- (void)addListener:(id)a3;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)memoryPressureObserver:(id)a3 didChangeFromCondition:(int64_t)a4 toCondition:(int64_t)a5;
- (void)prewarmRequest:(id)a3 completion:(id)a4;
- (void)removeAllListeners;
- (void)removeListener:(id)a3;
- (void)startRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)stopAllRequests:(BOOL)a3 completion:(id)a4;
- (void)stopAllRequestsSynchronously;
- (void)stopRequest:(id)a3 immediately:(BOOL)a4;
@end

@implementation CSSiriAudioPlaybackService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHapticRequests, 0);
  objc_storeStrong((id *)&self->_pendingHapticRequests, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_reusableSessionsByRequest, 0);
  objc_storeStrong((id *)&self->_activeSessionsByRequest, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)memoryPressureObserver:(id)a3 didChangeFromCondition:(int64_t)a4 toCondition:(int64_t)a5
{
  if (a5 >= 2)
  {
    v8[6] = v5;
    v8[7] = v6;
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__CSSiriAudioPlaybackService_memoryPressureObserver_didChangeFromCondition_toCondition___block_invoke;
    v8[3] = &unk_1E658D3C8;
    v8[4] = self;
    v8[5] = a2;
    dispatch_async(queue, v8);
  }
}

void __88__CSSiriAudioPlaybackService_memoryPressureObserver_didChangeFromCondition_toCondition___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _evictAllReusableSessionsForReason:v2];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerResetNotification___block_invoke;
  v9[3] = &unk_1E658D3C8;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);
}

void __98__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerResetNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAudioSessionID:0];
  id v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _evictAllReusableSessionsForReason:v3];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke;
  v9[3] = &unk_1E658D3C8;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);
}

void __97__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAudioSessionID:0];
  id v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _evictAllReusableSessionsForReason:v3];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __122__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E658D3C8;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);
}

void __122__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAudioSessionID:0];
  id v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _evictAllReusableSessionsForReason:v3];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __121__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E658D3C8;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);
}

void __121__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAudioSessionID:0];
  id v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _evictAllReusableSessionsForReason:v3];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E658D4B0;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F15020]];
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (v3)
  {
    if (v3 == 1)
    {
      v4 = *(void **)(*(void *)(a1 + 40) + 24);
      [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_26_26062];
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F15008]];
    char v6 = [v5 unsignedIntegerValue];

    v7 = *(void **)(*(void *)(a1 + 40) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3;
    v8[3] = &__block_descriptor_33_e69_v32__0__AFAudioPlaybackRequest_8___CSSiriAudioPlaybackSession__16_B24l;
    char v9 = v6 & 1;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 handleEndInterruption:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 handleBeginInterruption];
}

- (id)_createAudioPlaybackSessionWithRequest:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if ((a4 & 4) != 0
    || (v7 = [[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased alloc] initWithQueue:self->_queue request:v6 options:a4]) == 0)
  {
    v7 = [[CSSiriAudioPlaybackSessionImplAVPlayerBased alloc] initWithQueue:self->_queue request:v6 options:a4];
  }

  return v7;
}

- (id)_audioSession
{
  if (!self->_audioSession)
  {
    uint64_t v3 = [(CSSiriAudioPlaybackService *)self _audioSessionID];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F153E0] retrieveSessionWithID:v3];
      audioSession = self->_audioSession;
      self->_audioSession = v4;
    }
  }
  id v6 = self->_audioSession;
  return v6;
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    audioSession = self->_audioSession;
    self->_audioSession = 0;
  }
}

- (unsigned)_audioSessionID
{
  unsigned int result = self->_audioSessionID;
  if (!result)
  {
    unsigned int result = [(CSAudioSessionController *)self->_audioSessionController getAudioSessionID];
    self->_audioSessionID = result;
  }
  return result;
}

- (void)_evictAllReusableSessionsForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_reusableSessionsByRequest count];
  id v6 = *MEMORY[0x1E4F4E368];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v9 = 136315650;
      id v10 = "-[CSSiriAudioPlaybackService _evictAllReusableSessionsForReason:]";
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Evict %tu sessions from reusable session pool because %@.", (uint8_t *)&v9, 0x20u);
    }
    [(NSMutableDictionary *)self->_reusableSessionsByRequest removeAllObjects];
    reusableSessionsByRequest = self->_reusableSessionsByRequest;
    self->_reusableSessionsByRequest = 0;
  }
  else if (v7)
  {
    int v9 = 136315138;
    id v10 = "-[CSSiriAudioPlaybackService _evictAllReusableSessionsForReason:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Reusable session pool is already empty.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSHashTable *)self->_listeners setRepresentation];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__CSSiriAudioPlaybackService__enumerateListenersUsingBlock___block_invoke;
    v6[3] = &unk_1E658CE08;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __60__CSSiriAudioPlaybackService__enumerateListenersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidate
{
  uint64_t v3 = [MEMORY[0x1E4F4E4E0] sharedObserver];
  [v3 removeListener:self];

  [(CSAudioSessionController *)self->_audioSessionController unregisterObserver:self];
  [(CSSiriAudioPlaybackService *)self _stopAllRequests:1 completion:0];
}

- (void)_stopAllRequestsSynchronously
{
}

uint64_t __59__CSSiriAudioPlaybackService__stopAllRequestsSynchronously__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stop:1 completion:0];
}

- (void)_stopAllRequests:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  activeSessionsByRequest = self->_activeSessionsByRequest;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke;
  v14[3] = &unk_1E658CDC0;
  dispatch_group_t v15 = v7;
  BOOL v16 = a3;
  int v9 = v7;
  [(NSMutableDictionary *)activeSessionsByRequest enumerateKeysAndObjectsUsingBlock:v14];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_3;
  block[3] = &unk_1E658D1C0;
  id v13 = v6;
  id v11 = v6;
  dispatch_group_notify(v9, queue, block);
}

void __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = a3;
  dispatch_group_enter(v4);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_2;
  v7[3] = &unk_1E658D4D8;
  id v8 = *(id *)(a1 + 32);
  [v5 stop:v6 completion:v7];
}

uint64_t __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_2(uint64_t a1)
{
}

- (void)_stopRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(NSMutableDictionary *)self->_activeSessionsByRequest objectForKey:a3];
  [v5 stop:v4 completion:0];
}

- (void)_handleFinalizationForSession:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSObject **)MEMORY[0x1E4F4E368];
  int v9 = *MEMORY[0x1E4F4E368];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s session = %@, error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  id v10 = [v6 request];
  [(NSMutableDictionary *)self->_activeSessionsByRequest removeObjectForKey:v10];
  if (!v7 && ([v6 options] & 2) != 0)
  {
    id v11 = *v8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s Add successfully finalized session %@ to reusable session pool.", buf, 0x16u);
    }
    reusableSessionsByRequest = self->_reusableSessionsByRequest;
    if (!reusableSessionsByRequest)
    {
      id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v14 = self->_reusableSessionsByRequest;
      self->_reusableSessionsByRequest = v13;

      reusableSessionsByRequest = self->_reusableSessionsByRequest;
    }
    [(NSMutableDictionary *)reusableSessionsByRequest setObject:v6 forKey:v10];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__CSSiriAudioPlaybackService__handleFinalizationForSession_error___block_invoke;
  v17[3] = &unk_1E658CD98;
  v17[4] = self;
  id v18 = v10;
  id v19 = v7;
  id v15 = v7;
  id v16 = v10;
  [(CSSiriAudioPlaybackService *)self _enumerateListenersUsingBlock:v17];
}

uint64_t __66__CSSiriAudioPlaybackService__handleFinalizationForSession_error___block_invoke(void *a1, void *a2)
{
  return [a2 audioPlaybackService:a1[4] didStopRequest:a1[5] error:a1[6]];
}

- (void)_handleExecutionForSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSSiriAudioPlaybackService _handleExecutionForSession:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  id v6 = [v4 request];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CSSiriAudioPlaybackService__handleExecutionForSession___block_invoke;
  v8[3] = &unk_1E658CCD0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CSSiriAudioPlaybackService *)self _enumerateListenersUsingBlock:v8];
}

uint64_t __57__CSSiriAudioPlaybackService__handleExecutionForSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 audioPlaybackService:*(void *)(a1 + 32) didStartRequest:*(void *)(a1 + 40)];
}

- (void)_handlePreparationForSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSSiriAudioPlaybackService _handlePreparationForSession:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  id v6 = [v4 request];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CSSiriAudioPlaybackService__handlePreparationForSession___block_invoke;
  v8[3] = &unk_1E658CCD0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CSSiriAudioPlaybackService *)self _enumerateListenersUsingBlock:v8];
}

uint64_t __59__CSSiriAudioPlaybackService__handlePreparationForSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 audioPlaybackService:*(void *)(a1 + 32) willStartRequest:*(void *)(a1 + 40)];
}

- (void)_startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v24 = a5;
  id v22 = a6;
  id v13 = a7;
  if (a4)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_reusableSessionsByRequest objectForKey:v12];
    if (v14)
    {
      [(NSMutableDictionary *)self->_reusableSessionsByRequest removeObjectForKey:v12];
      id v15 = *MEMORY[0x1E4F4E368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
        __int16 v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s Reuse existing session %@ from reusable session pool.", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = objc_msgSend(v12, "hapticLibraryKey", v22);

  if (v16)
  {
    [(CSSiriAudioPlaybackService *)self _initializeAndPrewarmHapticEngineIfNeededForRequest:v12];
    v17 = [v12 itemURL];
    if (v17)
    {
    }
    else
    {
      id v18 = [v12 itemData];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        [(CSSiriAudioPlaybackService *)self _startHapticOnlyRequest:v12 options:a4 preparationHandler:v24 executionHandler:v23 finalizationHandler:v13];
        goto LABEL_14;
      }
    }
  }
  if (!v14)
  {
    uint64_t v14 = [(CSSiriAudioPlaybackService *)self _createAudioPlaybackSessionWithRequest:v12 options:a4];
    v20 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
      __int16 v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_INFO, "%s Create new session %@.", buf, 0x16u);
    }
  }
  [(NSMutableDictionary *)self->_activeSessionsByRequest setObject:v14 forKey:v12];
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v14);
  v21 = [(CSSiriAudioPlaybackService *)self _audioSession];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
  v35[3] = &unk_1E658CD20;
  id v36 = v24;
  objc_copyWeak(&v37, (id *)buf);
  objc_copyWeak(&v38, &location);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3;
  v29[3] = &unk_1E658CD48;
  id v32 = v23;
  objc_copyWeak(&v33, (id *)buf);
  objc_copyWeak(&v34, &location);
  id v30 = v12;
  v31 = self;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2_15;
  v25[3] = &unk_1E658CD70;
  id v26 = v13;
  objc_copyWeak(&v27, (id *)buf);
  objc_copyWeak(&v28, &location);
  [v14 startWithOptions:0 audioSession:v21 preparationHandler:v35 executionHandler:v29 finalizationHandler:v25];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
LABEL_14:
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = v4;
  if (WeakRetained && v4)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2;
    v7[3] = &unk_1E658D4B0;
    id v8 = WeakRetained;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [*(id *)(a1 + 32) hapticLibraryKey];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) _playHapticForRequest:*(void *)(a1 + 32)];
    if (v6)
    {
      id v7 = *MEMORY[0x1E4F4E368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler"
              ":]_block_invoke_3";
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s Failed to play haptic for playback request: %@", buf, 0x16u);
      }
    }
  }
  if (WeakRetained && v4)
  {
    id v8 = WeakRetained[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_14;
    v9[3] = &unk_1E658D4B0;
    id v10 = WeakRetained;
    id v11 = v4;
    dispatch_async(v8, v9);
  }
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = v6;
  if (WeakRetained && v6)
  {
    id v8 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3_16;
    block[3] = &unk_1E658D3F0;
    id v10 = WeakRetained;
    id v11 = v7;
    id v12 = v3;
    dispatch_async(v8, block);
  }
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFinalizationForSession:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleExecutionForSession:*(void *)(a1 + 40)];
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreparationForSession:*(void *)(a1 + 40)];
}

- (void)_prewarmRequest:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  reusableSessionsByRequest = self->_reusableSessionsByRequest;
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)reusableSessionsByRequest objectForKey:v6];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      BOOL v19 = "-[CSSiriAudioPlaybackService _prewarmRequest:completion:]";
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s Reuse existing session %@ from reusable session pool.", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v10 = [(CSSiriAudioPlaybackService *)self _createAudioPlaybackSessionWithRequest:v6 options:3];
    id v12 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      BOOL v19 = "-[CSSiriAudioPlaybackService _prewarmRequest:completion:]";
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s Create new session %@.", (uint8_t *)&v18, 0x16u);
    }
    id v13 = self->_reusableSessionsByRequest;
    if (!v13)
    {
      __int16 v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = self->_reusableSessionsByRequest;
      self->_reusableSessionsByRequest = v14;

      id v13 = self->_reusableSessionsByRequest;
    }
    [(NSMutableDictionary *)v13 setObject:v10 forKey:v6];
  }
  uint64_t v16 = [v6 hapticLibraryKey];

  if (v16) {
    [(CSSiriAudioPlaybackService *)self _initializeAndPrewarmHapticEngineIfNeededForRequest:v6];
  }
  v17 = [(CSSiriAudioPlaybackService *)self _audioSession];
  [v10 prepareWithOptions:0 audioSession:v17 completion:v8];
}

- (void)_startHapticOnlyRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (void (**)(void))a5;
  id v13 = (void (**)(void))a6;
  __int16 v14 = (void (**)(id, void))a7;
  id v15 = (os_log_t *)MEMORY[0x1E4F4E368];
  uint64_t v16 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSSiriAudioPlaybackService _startHapticOnlyRequest:options:preparationHandler:exec"
                                    "utionHandler:finalizationHandler:]";
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s No audio file set, but haptic playback request present", (uint8_t *)&buf, 0xCu);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
  v24[3] = &unk_1E658CCD0;
  v24[4] = self;
  id v17 = v11;
  id v25 = v17;
  [(CSSiriAudioPlaybackService *)self _enumerateListenersUsingBlock:v24];
  if (v12) {
    v12[2](v12);
  }
  if (v13) {
    v13[2](v13);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__26090;
  id v33 = __Block_byref_object_dispose__26091;
  id v34 = [(CSSiriAudioPlaybackService *)self _playHapticForRequest:v17];
  uint64_t v18 = *(void *)(*((void *)&buf + 1) + 40);
  if (v18)
  {
    BOOL v19 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v26 = 136315394;
      id v27 = "-[CSSiriAudioPlaybackService _startHapticOnlyRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s Failed to play haptic for playback request: %@", v26, 0x16u);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_13;
  v21[3] = &unk_1E658CCF8;
  v21[4] = self;
  id v20 = v17;
  id v22 = v20;
  p_long long buf = &buf;
  [(CSSiriAudioPlaybackService *)self _enumerateListenersUsingBlock:v21];
  if (v14) {
    v14[2](v14, *(void *)(*((void *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 audioPlaybackService:*(void *)(a1 + 32) didStartRequest:*(void *)(a1 + 40)];
}

uint64_t __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_13(void *a1, void *a2)
{
  return [a2 audioPlaybackService:a1[4] didStopRequest:a1[5] error:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)_initializeAndPrewarmHapticEngineIfNeededForRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CSSiriAudioPlaybackService *)self _hapticEngine];
  id v6 = (os_log_t *)MEMORY[0x1E4F4E368];
  id v7 = *MEMORY[0x1E4F4E368];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s haptic engine already created, adding %@ to pendingHapticRequests", buf, 0x16u);
    }
    goto LABEL_4;
  }
  if (v8)
  {
    *(_DWORD *)long long buf = 136315138;
    v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s creating haptic engine for audio playback request", buf, 0xCu);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1DF60]);
  id v10 = [(CSSiriAudioPlaybackService *)self _audioSession];
  id v19 = 0;
  id v5 = (void *)[v9 initWithAudioSession:v10 error:&v19];
  id v11 = v19;

  if (v11)
  {
    os_log_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      __int16 v22 = 2112;
      id v23 = v11;
      id v13 = "%s error creating haptic engine %@";
      __int16 v14 = v12;
      uint32_t v15 = 22;
LABEL_15:
      _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  [v5 setPlaysHapticsOnly:1];
  id v18 = 0;
  [v5 startAndReturnError:&v18];
  id v16 = v18;
  if (v16)
  {
    id v11 = v16;
    id v17 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      id v13 = "%s Failed to start haptic engine";
      __int16 v14 = v17;
      uint32_t v15 = 12;
      goto LABEL_15;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_4:
  [(NSMutableDictionary *)self->_pendingHapticRequests setObject:v5 forKey:v4];
LABEL_13:
}

- (void)_hapticPlaybackDidCompleteForAllActiveRequests
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CSSiriAudioPlaybackService__hapticPlaybackDidCompleteForAllActiveRequests__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __76__CSSiriAudioPlaybackService__hapticPlaybackDidCompleteForAllActiveRequests__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_playHapticForRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CSSiriAudioPlaybackService *)self _hapticEngine];
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v12 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, "%s Failed to start playing haptic for request: %@", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F4E478] errorWithCode:1401];
    if (!v13)
    {
LABEL_3:
      uint64_t v6 = [v4 hapticLibraryKey];
      id v20 = 0;
      long long v7 = [MEMORY[0x1E4F1DF90] patternForKey:v6 error:&v20];
      id v8 = v20;

      if (!v8)
      {
        id v19 = 0;
        long long v9 = [v5 createPlayerWithPattern:v7 error:&v19];
        id v10 = v19;
        if (v10)
        {
          id v8 = v10;
        }
        else
        {
          uint32_t v15 = *MEMORY[0x1E4F4E360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            __int16 v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
            _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Starting haptic playback", buf, 0xCu);
          }
          id v18 = 0;
          [v9 startAtTime:&v18 error:0.0];
          id v16 = v18;
          id v8 = v16;
          if (v5 && !v16)
          {
            [(NSMutableDictionary *)self->_activeHapticRequests setObject:v5 forKey:v4];
            [(NSMutableDictionary *)self->_pendingHapticRequests removeObjectForKey:v4];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke;
            v17[3] = &unk_1E658CCA8;
            v17[4] = self;
            [v5 notifyWhenPlayersFinished:v17];
            goto LABEL_15;
          }
        }
LABEL_14:
        [(NSMutableDictionary *)self->_pendingHapticRequests removeObjectForKey:v4];
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      id v8 = (id)v13;
      long long v7 = 0;
    }
    long long v9 = 0;
    goto LABEL_14;
  }
  id v11 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
    _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s audio playback request can not be nil", buf, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F4E478] errorWithCode:1401];
LABEL_16:

  return v8;
}

uint64_t __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x1E4F4E360];
  uint64_t v5 = *MEMORY[0x1E4F4E360];
  if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v12 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Haptic playback stopped with error: %@", buf, 0x16u);
    uint64_t v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v12 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]_block_invoke";
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Haptic playback stopped", buf, 0xCu);
  }
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke_9;
  block[3] = &unk_1E658D4D8;
  void block[4] = v7;
  dispatch_after(v6, v8, block);

  return 1;
}

uint64_t __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hapticPlaybackDidCompleteForAllActiveRequests];
}

- (id)_hapticEngine
{
  if ([(NSMutableDictionary *)self->_pendingHapticRequests count])
  {
    pendingHapticRequests = self->_pendingHapticRequests;
LABEL_5:
    id v4 = [(NSMutableDictionary *)pendingHapticRequests allKeys];
    uint64_t v5 = [v4 firstObject];
    dispatch_time_t v6 = [(NSMutableDictionary *)pendingHapticRequests objectForKey:v5];

    goto LABEL_6;
  }
  if ([(NSMutableDictionary *)self->_activeHapticRequests count])
  {
    pendingHapticRequests = self->_activeHapticRequests;
    goto LABEL_5;
  }
  dispatch_time_t v6 = 0;
LABEL_6:
  return v6;
}

- (void)stopAllRequestsSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSSiriAudioPlaybackService_stopAllRequestsSynchronously__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __58__CSSiriAudioPlaybackService_stopAllRequestsSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAllRequestsSynchronously];
}

- (void)stopAllRequests:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CSSiriAudioPlaybackService_stopAllRequests_completion___block_invoke;
  block[3] = &unk_1E658CC80;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __57__CSSiriAudioPlaybackService_stopAllRequests_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAllRequests:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)stopRequest:(id)a3 immediately:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CSSiriAudioPlaybackService_stopRequest_immediately___block_invoke;
    block[3] = &unk_1E658CC58;
    void block[4] = self;
    id v10 = v6;
    BOOL v11 = a4;
    dispatch_async(queue, block);
  }
}

uint64_t __54__CSSiriAudioPlaybackService_stopRequest_immediately___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopRequest:*(void *)(a1 + 40) immediately:*(unsigned __int8 *)(a1 + 48)];
}

- (void)startRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
}

- (void)prewarmRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CSSiriAudioPlaybackService_prewarmRequest_completion___block_invoke;
    block[3] = &unk_1E658D198;
    void block[4] = self;
    id v12 = v6;
    __int16 v13 = v8;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    id v10 = [MEMORY[0x1E4F4E478] errorWithCode:1407];
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

uint64_t __56__CSSiriAudioPlaybackService_prewarmRequest_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prewarmRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeAllListeners
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSSiriAudioPlaybackService_removeAllListeners__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__CSSiriAudioPlaybackService_removeAllListeners__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__CSSiriAudioPlaybackService_removeListener___block_invoke;
    v7[3] = &unk_1E658D4B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __45__CSSiriAudioPlaybackService_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__CSSiriAudioPlaybackService_addListener___block_invoke;
    v7[3] = &unk_1E658D4B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __42__CSSiriAudioPlaybackService_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void (**)(void, void))v15;
  if (v12)
  {
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __107__CSSiriAudioPlaybackService_startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
    v19[3] = &unk_1E658CC30;
    v19[4] = self;
    id v20 = v12;
    unint64_t v24 = a4;
    id v21 = v13;
    id v22 = v14;
    __int16 v23 = v16;
    dispatch_async(queue, v19);
  }
  else if (v15)
  {
    id v18 = [MEMORY[0x1E4F4E478] errorWithCode:1407];
    ((void (**)(void, void *))v16)[2](v16, v18);
  }
}

uint64_t __107__CSSiriAudioPlaybackService_startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 72) preparationHandler:*(void *)(a1 + 48) executionHandler:*(void *)(a1 + 56) finalizationHandler:*(void *)(a1 + 64)];
}

- (CSSiriAudioPlaybackService)initWithAudioSessionController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackService;
  id v6 = [(CSSiriAudioPlaybackService *)&v16 init];
  if (v6)
  {
    id v7 = CSSiriAudioServiceGetWorkloop();
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    if (v7) {
      dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.assistant.audio-playback-service", v8, v7);
    }
    else {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.assistant.audio-playback-service", v8);
    }
    id v10 = (OS_dispatch_queue *)v9;

    queue = v6->_queue;
    v6->_queue = v10;

    objc_storeStrong((id *)&v6->_audioSessionController, a3);
    id v12 = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CSSiriAudioPlaybackService_initWithAudioSessionController___block_invoke;
    block[3] = &unk_1E658D4D8;
    id v15 = v6;
    dispatch_async(v12, block);
  }
  return v6;
}

uint64_t __61__CSSiriAudioPlaybackService_initWithAudioSessionController___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v8;

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v11;

  id v14 = [MEMORY[0x1E4F4E4E0] sharedObserver];
  [v14 addListener:*(void *)(a1 + 32)];

  id v15 = *(void **)(*(void *)(a1 + 32) + 56);
  return objc_msgSend(v15, "registerObserver:");
}

+ (id)sharedService
{
  if (sharedService_onceToken_26113 != -1) {
    dispatch_once(&sharedService_onceToken_26113, &__block_literal_global_26114);
  }
  id v2 = (void *)sharedService_sharedService_26115;
  return v2;
}

void __43__CSSiriAudioPlaybackService_sharedService__block_invoke()
{
  id v2 = +[CSAudioSessionController sharedInstance];
  v0 = [[CSSiriAudioPlaybackService alloc] initWithAudioSessionController:v2];
  v1 = (void *)sharedService_sharedService_26115;
  sharedService_sharedService_26115 = (uint64_t)v0;
}

@end
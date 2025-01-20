@interface AudioRemixSessionManager
- (AudioRemixSessionManager)init;
- (AudioRemixSessionManager)initWithNodeMetadataOutput:(id)a3;
- (BOOL)sessionReady;
- (double)sampleRate;
- (int)_handleSessionCreated:(id)a3;
- (int)_handleSubscriberCompletedFromCancellation:(BOOL)a3;
- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4;
- (int)startNewSessionBlocking;
- (unsigned)channelCount;
- (void)abortSessionIfNeeded;
- (void)dealloc;
- (void)setFormatSampleRate:(double)a3 andChannelCount:(unsigned int)a4;
- (void)submitAudioBuffer:(id)a3;
@end

@implementation AudioRemixSessionManager

- (double)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (BOOL)sessionReady
{
  return self->_session != 0;
}

- (AudioRemixSessionManager)init
{
  return 0;
}

- (AudioRemixSessionManager)initWithNodeMetadataOutput:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AudioRemixSessionManager;
  v4 = [(AudioRemixSessionManager *)&v7 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cameracapture.audioremixanalysis.application", v5);
    v4->_subscriber = 0;
    v4->_session = 0;
    v4->_nodeMetadataOutput = (BWNodeOutput *)a3;
    v4->_sampleRate = 0.0;
    v4->_channelCount = 0;
  }
  return v4;
}

- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4
{
  subscriber = self->_subscriber;
  if (subscriber)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
    return [(AudioRemixSubscriber *)subscriber finishAndGetResultsBlockingWithStartingPTS:&v7 andEndingPTS:&v6];
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (void)dealloc
{
  [(AudioRemixSessionManager *)self abortSessionIfNeeded];
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AudioRemixSessionManager;
  [(AudioRemixSessionManager *)&v4 dealloc];
}

- (void)setFormatSampleRate:(double)a3 andChannelCount:(unsigned int)a4
{
  self->_sampleRate = a3;
  self->_channelCount = a4;
}

- (int)startNewSessionBlocking
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  [(AudioRemixSessionManager *)self abortSessionIfNeeded];
  v3 = (void *)[objc_alloc((Class)getSNMovieRemixRequestClass()) initWithInputAudioSampleRate:(uint64_t)self->_sampleRate inputAudioChannelCount:self->_channelCount];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  dispatch_semaphore_t v17 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AudioRemixSessionManager_startNewSessionBlocking__block_invoke;
  v9[3] = &unk_1E5C251C0;
  objc_copyWeak(&v10, &location);
  v9[4] = &v18;
  v9[5] = &v12;
  [(id)getSNMovieRemixClass() runRequest:v3 completionHandler:v9];
  objc_super v4 = v13[5];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  dispatch_release((dispatch_object_t)v13[5]);
  v13[5] = 0;
  if (v6) {
    *((_DWORD *)v19 + 6) = FigSignalErrorAt();
  }

  int v7 = *((_DWORD *)v19 + 6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v7;
}

intptr_t __51__AudioRemixSessionManager_startNewSessionBlocking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  if (!a3 && Weak && a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [Weak _handleSessionCreated:a2];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      FigDebugAssert3();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
  }
  int v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v7);
}

- (void)abortSessionIfNeeded
{
  session = self->_session;
  if (session)
  {
    subscriber = self->_subscriber;
    if (subscriber)
    {

      self->_subscriber = 0;
      session = self->_session;
    }
    [(SNMovieRemixSession *)session finishWithError:0];

    self->_session = 0;
  }
}

- (int)_handleSubscriberCompletedFromCancellation:(BOOL)a3
{
  int result = 0;
  if (a3) {
    return FigSignalErrorAt();
  }
  return result;
}

- (int)_handleSessionCreated:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AudioRemixSessionManager__handleSessionCreated___block_invoke;
  block[3] = &unk_1E5C25210;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(workQueue, block);
  int v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __50__AudioRemixSessionManager__handleSessionCreated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24)
    || (*(void *)(v2 + 24) = *(void *)(a1 + 40), (v3 = *(void **)(*(void *)(a1 + 32) + 24)) == 0))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    id v4 = v3;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__AudioRemixSessionManager__handleSessionCreated___block_invoke_2;
    v5[3] = &unk_1E5C251E8;
    v5[4] = *(void *)(a1 + 48);
    objc_copyWeak(&v6, &location);
    *(void *)(*(void *)(a1 + 32) + 16) = [[AudioRemixSubscriber alloc] initWithSession:*(void *)(*(void *)(a1 + 32) + 24) andNodeMetadataOutput:*(void *)(*(void *)(a1 + 32) + 32) completionHandler:v5];
    [*(id *)(*(void *)(a1 + 32) + 16) activate];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

uint64_t __50__AudioRemixSessionManager__handleSessionCreated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 || (id Weak = objc_loadWeak((id *)(a1 + 40))) == 0)
  {
    uint64_t result = FigSignalErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    uint64_t result = [Weak _handleSubscriberCompletedFromCancellation:a2];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)submitAudioBuffer:(id)a3
{
  if (a3) {
    -[SNMovieRemixSession yieldBuffer:](self->_session, "yieldBuffer:");
  }
}

@end
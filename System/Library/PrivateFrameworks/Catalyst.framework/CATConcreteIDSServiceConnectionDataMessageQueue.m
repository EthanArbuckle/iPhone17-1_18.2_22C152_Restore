@interface CATConcreteIDSServiceConnectionDataMessageQueue
+ (id)flushTimerIdentifier;
- (CATConcreteIDSServiceConnectionDataMessageQueue)initWithWorkQueue:(id)a3 timerSource:(id)a4 dataChunker:(id)a5 flushPromptInterval:(double)a6 supportsRetransmit:(BOOL)a7;
- (CATIDSServiceConnectionDataMessageQueueDelegate)delegate;
- (void)flushTimerDidFire:(id)a3 fireCount:(unint64_t)a4;
- (void)receiveData:(id)a3 completion:(id)a4;
- (void)receiveRemoteSequenceNumber:(unint64_t)a3;
- (void)retransmitContent:(id)a3;
- (void)retransmitSequenceNumbers:(id)a3;
- (void)scheduleFlushTimer;
- (void)setDelegate:(id)a3;
@end

@implementation CATConcreteIDSServiceConnectionDataMessageQueue

- (CATConcreteIDSServiceConnectionDataMessageQueue)initWithWorkQueue:(id)a3 timerSource:(id)a4 dataChunker:(id)a5 flushPromptInterval:(double)a6 supportsRetransmit:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CATConcreteIDSServiceConnectionDataMessageQueue;
  v16 = [(CATConcreteIDSServiceConnectionDataMessageQueue *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->mWorkQueue, a3);
    objc_storeStrong((id *)&v17->mTimerSource, a4);
    objc_storeStrong((id *)&v17->mDataChunker, a5);
    v17->mFlushPromptInterval = a6;
    v17->mSupportsRetransmit = a7;
    uint64_t v18 = objc_opt_new();
    mSendContentsBySequenceNumber = v17->mSendContentsBySequenceNumber;
    v17->mSendContentsBySequenceNumber = (NSMutableDictionary *)v18;
  }
  return v17;
}

- (void)receiveData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![v7 length])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CATIDSServiceConnectionMessageQueue.m" lineNumber:67 description:@"Attempted to enqueue data to send of lenght 0"];
  }
  v9 = [(CATIDSServiceConnectionDataChunker *)self->mDataChunker chunkDataIntoMessageContent:v7];
  v10 = v9;
  if (self->mSupportsRetransmit)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    v11 = [v9 firstObject];
    v12 = [v11 sequenceNumber];
    uint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v21 = v13;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __74__CATConcreteIDSServiceConnectionDataMessageQueue_receiveData_completion___block_invoke;
    v17[3] = &unk_2641DC6D8;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v10, "cat_forEach:", v17);
    self->mTailSequenceNumber = v19[3] + 1;
    if (!self->mFlushTimer) {
      [(CATConcreteIDSServiceConnectionDataMessageQueue *)self scheduleFlushTimer];
    }
    id v14 = [(CATConcreteIDSServiceConnectionDataMessageQueue *)self delegate];
    [v14 dataMessageQueue:self needsToSendContents:v10 shouldSkipTheLine:0 completion:v8];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v15 = [(CATConcreteIDSServiceConnectionDataMessageQueue *)self delegate];
    [v15 dataMessageQueue:self needsToSendContents:v10 shouldSkipTheLine:0 completion:v8];
  }
}

void __74__CATConcreteIDSServiceConnectionDataMessageQueue_receiveData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v16 = v3;
  v5 = [v3 sequenceNumber];
  unint64_t v6 = [v5 unsignedIntegerValue];
  if (v4 <= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v4 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v4;
  }
  if (v8 + ~v7 > 0x186A0)
  {
    BOOL v9 = v4 >= v6;
    BOOL v10 = v4 > v6;
  }
  else
  {
    BOOL v9 = v6 >= v4;
    BOOL v10 = v6 > v4;
  }
  int v11 = !v9;
  if (!v10)
  {

    if (!v11) {
      goto LABEL_17;
    }
    v5 = [v16 sequenceNumber];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 unsignedIntegerValue];
  }

LABEL_17:
  v12 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v13 = NSNumber;
  id v14 = [v16 sequenceNumber];
  id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue"));
  [v12 setObject:v16 forKeyedSubscript:v15];
}

- (void)receiveRemoteSequenceNumber:(unint64_t)a3
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  unint64_t mHeadSequenceNumber = self->mHeadSequenceNumber;
  unint64_t v6 = mHeadSequenceNumber - 1;
  if (mHeadSequenceNumber - 1 <= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = mHeadSequenceNumber - 1;
  }
  if (mHeadSequenceNumber - 1 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = mHeadSequenceNumber - 1;
  }
  if (v8 + ~v7 > 0x186A0)
  {
    BOOL v11 = v6 > a3;
    BOOL v10 = v6 < a3;
    if (v11) {
      return;
    }
  }
  else
  {
    BOOL v9 = v6 >= a3;
    BOOL v10 = v6 > a3;
    if (!v9) {
      return;
    }
  }
  if (v10)
  {
    for (; mHeadSequenceNumber <= a3; ++mHeadSequenceNumber)
    {
      mSendContentsBySequenceNumber = self->mSendContentsBySequenceNumber;
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:mHeadSequenceNumber];
      [(NSMutableDictionary *)mSendContentsBySequenceNumber setObject:0 forKeyedSubscript:v13];
    }
    self->unint64_t mHeadSequenceNumber = a3 + 1;
    if (a3 + 1 >= self->mTailSequenceNumber)
    {
      [(CATTimer *)self->mFlushTimer invalidate];
      mFlushTimer = self->mFlushTimer;
      self->mFlushTimer = 0;
    }
    else
    {
      [(CATConcreteIDSServiceConnectionDataMessageQueue *)self scheduleFlushTimer];
    }
  }
}

- (void)retransmitSequenceNumbers:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if ([v4 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitSequenceNumbers___block_invoke;
    v7[3] = &unk_2641DBED8;
    v7[4] = self;
    uint64_t v5 = objc_msgSend(v4, "cat_map:", v7);
  }
  else
  {
    uint64_t v5 = [(NSMutableDictionary *)self->mSendContentsBySequenceNumber allValues];
  }
  unint64_t v6 = (void *)v5;
  [(CATConcreteIDSServiceConnectionDataMessageQueue *)self retransmitContent:v5];
}

uint64_t __77__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitSequenceNumbers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:a2];
}

+ (id)flushTimerIdentifier
{
  return (id)[NSString stringWithFormat:@"%@-FlushTimer", a1];
}

- (void)scheduleFlushTimer
{
  objc_initWeak(&location, self);
  [(CATTimer *)self->mFlushTimer invalidate];
  mTimerSource = self->mTimerSource;
  id v4 = [(id)objc_opt_class() flushTimerIdentifier];
  double mFlushPromptInterval = self->mFlushPromptInterval;
  mWorkQueue = self->mWorkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__CATConcreteIDSServiceConnectionDataMessageQueue_scheduleFlushTimer__block_invoke;
  v9[3] = &unk_2641DC700;
  objc_copyWeak(&v10, &location);
  unint64_t v7 = [(CATTimerSource *)mTimerSource scheduleInfiniteTimerWithIdentifier:v4 timeInterval:mWorkQueue queue:v9 fireHandler:mFlushPromptInterval];
  mFlushTimer = self->mFlushTimer;
  self->mFlushTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_scheduleFlushTimer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained flushTimerDidFire:v5 fireCount:a3];
}

- (void)flushTimerDidFire:(id)a3 fireCount:(unint64_t)a4
{
  char v4 = a4;
  mWorkQueue = self->mWorkQueue;
  unint64_t v7 = (CATTimer *)a3;
  CATAssertIsQueue(mWorkQueue);
  mFlushTimer = self->mFlushTimer;

  if ((v4 & 1) != 0 && mFlushTimer == v7)
  {
    id v9 = [(CATConcreteIDSServiceConnectionDataMessageQueue *)self delegate];
    [v9 dataMessageQueue:self wantsToCheckRemote:self->mHeadSequenceNumber - 1];
  }
}

- (void)retransmitContent:(id)a3
{
  id v4 = a3;
  id v5 = [(CATConcreteIDSServiceConnectionDataMessageQueue *)self delegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke;
  v7[3] = &unk_2641DC728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dataMessageQueue:self needsToSendContents:v6 shouldSkipTheLine:1 completion:v7];
}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (_CATLogGeneral_onceToken_17 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_17, &__block_literal_global_23);
    }
    id v4 = _CATLogGeneral_logObj_17;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_17, OS_LOG_TYPE_ERROR)) {
      __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke_cold_1(a1, v4);
    }
  }
}

- (CATIDSServiceConnectionDataMessageQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionDataMessageQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mSendContentsBySequenceNumber, 0);
  objc_storeStrong((id *)&self->mFlushTimer, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mDataChunker, 0);

  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to send data contents: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
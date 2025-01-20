@interface FCPauseRingsSampleObserver
- (FCPauseRingsSampleObserver)initWithProfile:(id)a3;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation FCPauseRingsSampleObserver

- (FCPauseRingsSampleObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPauseRingsSampleObserver;
  v5 = [(FCPauseRingsSampleObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HDCreateSerialUtilityDispatchQueue();
    serviceQueue = v6->_serviceQueue;
    v6->_serviceQueue = (OS_dispatch_queue *)v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:v6->_serviceQueue];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained dataManager];
  v5 = [MEMORY[0x1E4F2B2C0] pauseRingsScheduleType];
  [v4 addObserver:self forDataType:v5];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
}

uint64_t __50__FCPauseRingsSampleObserver_samplesAdded_anchor___block_invoke()
{
  v0 = (const char *)[(id)*MEMORY[0x1E4F62068] UTF8String];
  return notify_post(v0);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
}

uint64_t __63__FCPauseRingsSampleObserver_samplesOfTypesWereRemoved_anchor___block_invoke()
{
  v0 = (const char *)[(id)*MEMORY[0x1E4F62068] UTF8String];
  return notify_post(v0);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained dataManager];
  v5 = [MEMORY[0x1E4F2B2C0] pauseRingsScheduleType];
  [v4 removeObserver:self forDataType:v5];

  v6.receiver = self;
  v6.super_class = (Class)FCPauseRingsSampleObserver;
  [(FCPauseRingsSampleObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
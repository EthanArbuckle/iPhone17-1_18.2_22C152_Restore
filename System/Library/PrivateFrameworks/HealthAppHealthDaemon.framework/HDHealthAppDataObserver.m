@interface HDHealthAppDataObserver
- (HDDataManager)dataManager;
- (HDHAHealthPluginHostFeedGenerator)feedGenerator;
- (HDHealthAppDataObserver)initWithProfile:(id)a3;
- (HDHealthAppDataObserver)initWithProfile:(id)a3 debounceTime:(double)a4;
- (HDProfile)profile;
- (OS_dispatch_queue)debounceQueue;
- (_HKDelayedOperation)delayedOperation;
- (id)alertSampleTypes;
- (void)dealloc;
- (void)debounceRunBackgroundGeneration;
- (void)observeForAlertSampleTypes;
- (void)runBackgroundGeneration;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setDataManager:(id)a3;
- (void)setDebounceQueue:(id)a3;
- (void)setDelayedOperation:(id)a3;
- (void)setFeedGenerator:(id)a3;
- (void)setProfile:(id)a3;
- (void)start;
@end

@implementation HDHealthAppDataObserver

- (HDHealthAppDataObserver)initWithProfile:(id)a3
{
  return [(HDHealthAppDataObserver *)self initWithProfile:a3 debounceTime:5.0];
}

- (HDHealthAppDataObserver)initWithProfile:(id)a3 debounceTime:(double)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppDataObserver;
  v7 = [(HDHealthAppDataObserver *)&v24 init];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_profile, v6);
    uint64_t v10 = [v6 dataManager];
    dataManager = v8->_dataManager;
    v8->_dataManager = (HDDataManager *)v10;

    v12 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
    feedGenerator = v8->_feedGenerator;
    v8->_feedGenerator = v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    debounceQueue = v8->_debounceQueue;
    v8->_debounceQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    id v16 = objc_alloc(MEMORY[0x263F0A9B0]);
    v17 = [(HDHealthAppDataObserver *)v8 debounceQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__HDHealthAppDataObserver_initWithProfile_debounceTime___block_invoke;
    v21[3] = &unk_2653588D0;
    objc_copyWeak(&v22, &location);
    uint64_t v18 = [v16 initWithMode:1 queue:v17 delay:v21 block:a4];
    delayedOperation = v8->_delayedOperation;
    v8->_delayedOperation = (_HKDelayedOperation *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __56__HDHealthAppDataObserver_initWithProfile_debounceTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runBackgroundGeneration];
}

- (void)dealloc
{
  [(_HKDelayedOperation *)self->_delayedOperation invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHealthAppDataObserver;
  [(HDHealthAppDataObserver *)&v3 dealloc];
}

- (void)start
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained cloudSyncManager];
  [v4 addObserver:self queue:self->_debounceQueue];

  [(HDHealthAppDataObserver *)self observeForAlertSampleTypes];
}

- (void)observeForAlertSampleTypes
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [(HDHealthAppDataObserver *)self alertSampleTypes];
  _HKInitializeLogging();
  v4 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_250D3F000, v4, OS_LOG_TYPE_DEFAULT, "Observing samples %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HDHealthAppDataObserver *)self alertSampleTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(HDHealthAppDataObserver *)self dataManager];
        [v11 addSynchronousObserver:self forSampleType:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)alertSampleTypes
{
  v14[10] = *MEMORY[0x263EF8340];
  long long v13 = [MEMORY[0x263F0A598] atrialFibrillationEventType];
  v14[0] = v13;
  v2 = [MEMORY[0x263F0A598] environmentalAudioExposureEventType];
  v14[1] = v2;
  objc_super v3 = [MEMORY[0x263F0A598] headphoneAudioExposureEventType];
  v14[2] = v3;
  v4 = [MEMORY[0x263F0A598] bradycardiaType];
  v14[3] = v4;
  v5 = [MEMORY[0x263F0A598] tachycardiaType];
  v14[4] = v5;
  uint64_t v6 = [MEMORY[0x263F0A598] workoutType];
  v14[5] = v6;
  uint64_t v7 = [MEMORY[0x263F0A598] lowCardioFitnessEventType];
  v14[6] = v7;
  uint64_t v8 = [MEMORY[0x263F0A358] electrocardiogramType];
  v14[7] = v8;
  uint64_t v9 = [MEMORY[0x263F0A158] _categoryTypeWithCode:250];
  v14[8] = v9;
  uint64_t v10 = [MEMORY[0x263F0A158] _categoryTypeWithCode:276];
  v14[9] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:10];

  return v11;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F09968];
  uint64_t v7 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_250D3F000, v7, OS_LOG_TYPE_DEFAULT, "HDHealthAppDataObserver received notification for an observed sample type", v11, 2u);
  }
  uint64_t v8 = [v5 firstObject];
  uint64_t v9 = [v8 sampleType];

  if (v9)
  {
    [(HDHealthAppDataObserver *)self debounceRunBackgroundGeneration];
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      -[HDHealthAppDataObserver samplesAdded:anchor:](v10, v5);
    }
  }
}

- (void)debounceRunBackgroundGeneration
{
  objc_super v3 = [(HDHealthAppDataObserver *)self debounceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HDHealthAppDataObserver_debounceRunBackgroundGeneration__block_invoke;
  block[3] = &unk_2653588F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__HDHealthAppDataObserver_debounceRunBackgroundGeneration__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayedOperation];
  [v1 execute];
}

- (void)runBackgroundGeneration
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_250D3F000, log, OS_LOG_TYPE_ERROR, "HDHealthAppDataObserver failed to lookup restore completion date; assuming restore is complete.",
    v1,
    2u);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
}

- (OS_dispatch_queue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
}

- (HDHAHealthPluginHostFeedGenerator)feedGenerator
{
  return self->_feedGenerator;
}

- (void)setFeedGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGenerator, 0);
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:(void *)a1 anchor:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = a1;
  v4 = [a2 firstObject];
  int v5 = 138477827;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_250D3F000, v3, OS_LOG_TYPE_ERROR, "Failed to get sample type for sample %{private}@", (uint8_t *)&v5, 0xCu);
}

@end
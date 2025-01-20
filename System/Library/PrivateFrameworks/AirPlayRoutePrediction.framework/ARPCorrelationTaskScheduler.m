@interface ARPCorrelationTaskScheduler
- (ARPCorrelationTaskScheduler)initWithKnowledgeStore:(id)a3;
- (BPSSink)sinkAccessories;
- (BPSSink)sinkMediaAccessories;
- (BPSSink)sinkScenes;
- (NSDate)bookmark;
- (OS_dispatch_queue)queue;
- (_DKKnowledgeQuerying)knowledgeStore;
- (void)_executeCorrelationTask;
- (void)_executeHomeControlMicrolocationCorrelationTask;
- (void)_executeHomeControlNextActionCorrelationTask;
- (void)dealloc;
- (void)executeCorrelationTask;
- (void)homeKitEventInserted;
- (void)microLocationEventInserted:(id)a3;
- (void)nowPlayingEventInserted:(id)a3;
- (void)setBookmark:(id)a3;
@end

@implementation ARPCorrelationTaskScheduler

- (ARPCorrelationTaskScheduler)initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ARPCorrelationTaskScheduler;
  v6 = [(ARPCorrelationTaskScheduler *)&v48 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AirPlayRoutePrediction.correlation-task-queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
    bookmark = v7->_bookmark;
    v7->_bookmark = (NSDate *)v11;

    v13 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v14 = *MEMORY[0x263F35190];
    v15 = [MEMORY[0x263F35148] nowPlayingStream];
    v16 = [v15 name];
    [v13 addObserver:v7 selector:sel_nowPlayingEventInserted_ name:v14 object:v16];

    v17 = [MEMORY[0x263F087C8] defaultCenter];
    v18 = [MEMORY[0x263F35148] microLocationVisitStream];
    v19 = [v18 name];
    [v17 addObserver:v7 selector:sel_microLocationEventInserted_ name:v14 object:v19];

    v20 = (void *)[objc_alloc((Class)getBMBiomeSchedulerClass()) initWithIdentifier:@"com.apple.AirPlayRoutePrediction.HomeControlAccessoryEventNotification" targetQueue:v7->_queue];
    v21 = (void *)[objc_alloc((Class)getBMBiomeSchedulerClass()) initWithIdentifier:@"com.apple.AirPlayRoutePrediction.HomeControlMediaAccessoryEventNotification" targetQueue:v7->_queue];
    v22 = (void *)[objc_alloc((Class)getBMBiomeSchedulerClass()) initWithIdentifier:@"com.apple.AirPlayRoutePrediction.HomeControlActionSetEventNotification" targetQueue:v7->_queue];
    v23 = [getBMStreamsClass() homeKitClientAccessoryControlStream];
    v24 = [v23 publisher];
    v25 = [v24 subscribeOn:v20];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_2;
    v46[3] = &unk_2640B41F8;
    v26 = v7;
    v47 = v26;
    uint64_t v27 = [v25 sinkWithCompletion:&__block_literal_global_3 receiveInput:v46];
    sinkAccessories = v26->_sinkAccessories;
    v26->_sinkAccessories = (BPSSink *)v27;

    v29 = [getBMStreamsClass() homeKitClientMediaAccessoryControlStream];
    v30 = [v29 publisher];
    v31 = [v30 subscribeOn:v21];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_4;
    v44[3] = &unk_2640B41F8;
    v32 = v26;
    v45 = v32;
    uint64_t v33 = [v31 sinkWithCompletion:&__block_literal_global_20 receiveInput:v44];
    sinkMediaAccessories = v32->_sinkMediaAccessories;
    v32->_sinkMediaAccessories = (BPSSink *)v33;

    v35 = [getBMStreamsClass() homeKitClientActionSetStream];
    v36 = [v35 publisher];
    v37 = [v36 subscribeOn:v22];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_6;
    v42[3] = &unk_2640B41F8;
    v38 = v32;
    v43 = v38;
    uint64_t v39 = [v37 sinkWithCompletion:&__block_literal_global_22 receiveInput:v42];
    sinkScenes = v38->_sinkScenes;
    v38->_sinkScenes = (BPSSink *)v39;
  }
  return v7;
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeKitEventInserted];
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeKitEventInserted];
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeKitEventInserted];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F35190];
  id v5 = [MEMORY[0x263F35148] nowPlayingStream];
  v6 = [v5 name];
  [v3 removeObserver:self name:v4 object:v6];

  [(BPSSink *)self->_sinkAccessories cancel];
  [(BPSSink *)self->_sinkMediaAccessories cancel];
  [(BPSSink *)self->_sinkScenes cancel];
  v7.receiver = self;
  v7.super_class = (Class)ARPCorrelationTaskScheduler;
  [(ARPCorrelationTaskScheduler *)&v7 dealloc];
}

- (void)nowPlayingEventInserted:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  +[ARPRoutingSession routingSessionTimeout];
  double v6 = v5;
  objc_super v7 = [(ARPCorrelationTaskScheduler *)self bookmark];
  v8 = [v7 earlierDate:v4];

  dispatch_queue_t v9 = [v4 dateByAddingTimeInterval:-v6];
  v10 = [v9 laterDate:v8];

  [(ARPCorrelationTaskScheduler *)self setBookmark:v4];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v4];
  v12 = [(ARPCorrelationTaskScheduler *)self knowledgeStore];
  v13 = +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:v11 knowledgeStore:v12 eventLimit:1 longFormVideoFilter:0];

  if (v13)
  {
    uint64_t v14 = [(ARPCorrelationTaskScheduler *)self queue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__ARPCorrelationTaskScheduler_nowPlayingEventInserted___block_invoke;
    v19[3] = &unk_2640B4220;
    v19[4] = self;
    v15 = v19;
    v16 = (void *)os_transaction_create();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke;
    block[3] = &unk_2640B4270;
    id v21 = v16;
    id v22 = v15;
    id v17 = v16;
    dispatch_async(v14, block);
  }
  else
  {
    v18 = ARPLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ARPCorrelationTaskScheduler nowPlayingEventInserted:](v18);
    }
  }
}

uint64_t __55__ARPCorrelationTaskScheduler_nowPlayingEventInserted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeCorrelationTask];
}

- (void)_executeHomeControlMicrolocationCorrelationTask
{
  v3 = [(ARPCorrelationTaskScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [ARPHomeControlMicrolocationCorrelationTask alloc];
  double v5 = +[ARPHomeControlSuggester defaultCorrelationsSessionFile];
  double v6 = [(ARPCorrelationTaskScheduler *)self knowledgeStore];
  objc_super v7 = [(ARPHomeControlMicrolocationCorrelationTask *)v4 initWithCorrelationsFile:v5 knowledgeStore:v6];

  [(ARPHomeControlMicrolocationCorrelationTask *)v7 execute];
}

- (void)_executeHomeControlNextActionCorrelationTask
{
  v2 = [(ARPCorrelationTaskScheduler *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = [ARPHomeControlNextActionCorrelationTask alloc];
  uint64_t v4 = +[ARPHomeControlSuggester defaultCorrelationsSessionFile];
  double v5 = [(ARPHomeControlNextActionCorrelationTask *)v3 initWithCorrelationsFile:v4];

  [(ARPHomeControlNextActionCorrelationTask *)v5 execute];
}

- (void)microLocationEventInserted:(id)a3
{
  uint64_t v4 = [(ARPCorrelationTaskScheduler *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__ARPCorrelationTaskScheduler_microLocationEventInserted___block_invoke;
  v8[3] = &unk_2640B4220;
  v8[4] = self;
  double v5 = v8;
  double v6 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_2640B4270;
  id v10 = v6;
  id v11 = v5;
  id v7 = v6;
  dispatch_async(v4, block);
}

uint64_t __58__ARPCorrelationTaskScheduler_microLocationEventInserted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeHomeControlMicrolocationCorrelationTask];
}

- (void)homeKitEventInserted
{
  v3 = [(ARPCorrelationTaskScheduler *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ARPCorrelationTaskScheduler_homeKitEventInserted__block_invoke;
  v7[3] = &unk_2640B4220;
  v7[4] = self;
  uint64_t v4 = v7;
  double v5 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_2640B4270;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

uint64_t __51__ARPCorrelationTaskScheduler_homeKitEventInserted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeHomeControlNextActionCorrelationTask];
}

- (void)_executeCorrelationTask
{
  v3 = [(ARPCorrelationTaskScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [ARPCorrelationTask alloc];
  double v5 = +[ARPRoutePredictor defaultFile];
  id v6 = [(ARPCorrelationTaskScheduler *)self knowledgeStore];
  id v7 = [(ARPCorrelationTask *)v4 initWithCorrelationsFile:v5 knowledgeStore:v6];

  [(ARPCorrelationTask *)v7 execute];
}

- (void)executeCorrelationTask
{
  v3 = [(ARPCorrelationTaskScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ARPCorrelationTaskScheduler_executeCorrelationTask__block_invoke;
  block[3] = &unk_2640B4220;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __53__ARPCorrelationTaskScheduler_executeCorrelationTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeCorrelationTask];
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BPSSink)sinkAccessories
{
  return self->_sinkAccessories;
}

- (BPSSink)sinkMediaAccessories
{
  return self->_sinkMediaAccessories;
}

- (BPSSink)sinkScenes
{
  return self->_sinkScenes;
}

- (NSDate)bookmark
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_sinkScenes, 0);
  objc_storeStrong((id *)&self->_sinkMediaAccessories, 0);
  objc_storeStrong((id *)&self->_sinkAccessories, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)nowPlayingEventInserted:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE41000, log, OS_LOG_TYPE_DEBUG, "Inserted now playing event was not part of a routing session.", v1, 2u);
}

@end
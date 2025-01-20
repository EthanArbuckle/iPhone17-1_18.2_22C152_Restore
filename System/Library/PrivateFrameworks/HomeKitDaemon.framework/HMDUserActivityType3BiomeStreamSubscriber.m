@interface HMDUserActivityType3BiomeStreamSubscriber
- (BMBiomeScheduler)scheduler;
- (BMStoreEvent)cachedMostRecentEvent;
- (BMStream)stream;
- (BOOL)isConfigured;
- (BOOL)isEvent:(id)a3 within24HoursInThePastOfDate:(id)a4;
- (BPSSink)sink;
- (HMDUserActivityType3BiomeStreamSubscriber)initWithIdentifier:(id)a3 stream:(id)a4 filterEventBlock:(id)a5;
- (HMDUserActivityType3BiomeStreamSubscriberDelegate)delegate;
- (NSString)identifier;
- (OS_dispatch_queue)biomeQueue;
- (id)_fetchMostRecentEventFromDate:(id)a3;
- (id)filterEventBlock;
- (id)mostRecentEvent;
- (void)configureWithCompletion:(id)a3;
- (void)fetchMostRecentEventWithCompletion:(id)a3;
- (void)registerForBiomeStreamWithIdentifier:(id)a3;
- (void)setCachedMostRecentEvent:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSink:(id)a3;
- (void)unconfigure;
@end

@implementation HMDUserActivityType3BiomeStreamSubscriber

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterEventBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedMostRecentEvent, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)filterEventBlock
{
  return self->_filterEventBlock;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setCachedMostRecentEvent:(id)a3
{
}

- (BMStoreEvent)cachedMostRecentEvent
{
  return self->_cachedMostRecentEvent;
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setScheduler:(id)a3
{
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)biomeQueue
{
  return self->_biomeQueue;
}

- (void)setSink:(id)a3
{
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserActivityType3BiomeStreamSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserActivityType3BiomeStreamSubscriberDelegate *)WeakRetained;
}

- (void)unconfigure
{
  v3 = [(HMDUserActivityType3BiomeStreamSubscriber *)self sink];
  [v3 cancel];

  [(HMDUserActivityType3BiomeStreamSubscriber *)self setSink:0];
}

- (BOOL)isConfigured
{
  v3 = [(HMDUserActivityType3BiomeStreamSubscriber *)self sink];
  if (v3)
  {
    v4 = [(HMDUserActivityType3BiomeStreamSubscriber *)self scheduler];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEvent:(id)a3 within24HoursInThePastOfDate:(id)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x263EFF910];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  [v7 timestamp];
  double v10 = v9;

  v11 = (void *)[v8 initWithTimeIntervalSinceReferenceDate:v10];
  [v6 timeIntervalSinceDate:v11];
  double v13 = v12;

  BOOL v14 = v13 <= 86400.0 && v13 >= 0.0;
  return v14;
}

- (id)_fetchMostRecentEventFromDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = [v5 dateByAddingUnit:16 value:-1 toDate:v4 options:0];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:v6 maxEvents:0 lastN:0 reversed:1];
  id v8 = [(HMDUserActivityType3BiomeStreamSubscriber *)self stream];
  double v9 = [v8 publisherWithOptions:v7];

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__120854;
  v25 = __Block_byref_object_dispose__120855;
  id v26 = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke;
  v18[3] = &unk_264A1FB18;
  objc_copyWeak(&v19, &location);
  v18[4] = v27;
  double v10 = [v9 filterWithIsIncluded:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_2;
  v16[3] = &unk_264A1FAC8;
  objc_copyWeak(&v17, &location);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_3;
  v14[3] = &unk_264A1FB40;
  objc_copyWeak(&v15, &location);
  v14[4] = &v21;
  id v11 = (id)[v10 sinkWithCompletion:v16 receiveInput:v14];

  id v12 = (id)v22[5];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(v27, 8);
  return v12;
}

uint64_t __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained filterEventBlock];
  if (v5
    && (id v6 = (void *)v5,
        [WeakRetained filterEventBlock],
        id v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        int v8 = ((uint64_t (**)(void, id))v7)[2](v7, v3),
        v7,
        v6,
        !v8)
    || (uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8), *(unsigned char *)(v9 + 24)))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
    *(unsigned char *)(v9 + 24) = 1;
  }

  return v10;
}

void __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 error];
}

void __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)fetchMostRecentEventWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] now];
  id v6 = [(HMDUserActivityType3BiomeStreamSubscriber *)self biomeQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDUserActivityType3BiomeStreamSubscriber_fetchMostRecentEventWithCompletion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __80__HMDUserActivityType3BiomeStreamSubscriber_fetchMostRecentEventWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchMostRecentEventFromDate:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)mostRecentEvent
{
  if ([(HMDUserActivityType3BiomeStreamSubscriber *)self isConfigured])
  {
    id v3 = [(HMDUserActivityType3BiomeStreamSubscriber *)self cachedMostRecentEvent];
    id v4 = [MEMORY[0x263EFF910] now];
    BOOL v5 = [(HMDUserActivityType3BiomeStreamSubscriber *)self isEvent:v3 within24HoursInThePastOfDate:v4];

    if (v5) {
      id v6 = v3;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)registerForBiomeStreamWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F2A758]);
  id v6 = [(HMDUserActivityType3BiomeStreamSubscriber *)self biomeQueue];
  id v7 = (void *)[v5 initWithIdentifier:v4 targetQueue:v6];
  [(HMDUserActivityType3BiomeStreamSubscriber *)self setScheduler:v7];

  objc_initWeak(location, self);
  id v8 = [(HMDUserActivityType3BiomeStreamSubscriber *)self stream];
  uint64_t v9 = [v8 DSLPublisher];
  id v10 = [(HMDUserActivityType3BiomeStreamSubscriber *)self scheduler];
  id v11 = [v9 subscribeOn:v10];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke;
  v18[3] = &unk_264A1FAA0;
  objc_copyWeak(&v19, location);
  id v12 = [v11 filterWithIsIncluded:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_2;
  v16[3] = &unk_264A1FAC8;
  objc_copyWeak(&v17, location);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_3;
  v14[3] = &unk_264A1FAF0;
  objc_copyWeak(&v15, location);
  double v13 = [v12 sinkWithCompletion:v16 receiveInput:v14];
  [(HMDUserActivityType3BiomeStreamSubscriber *)self setSink:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

uint64_t __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained filterEventBlock];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

void __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

void __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [MEMORY[0x263EFF910] now];
  int v5 = [WeakRetained isEvent:v7 within24HoursInThePastOfDate:v4];

  if (v5)
  {
    [WeakRetained setCachedMostRecentEvent:v7];
    id v6 = [WeakRetained delegate];
    [v6 biomeEventDidUpdate];
  }
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HMDUserActivityType3BiomeStreamSubscriber_configureWithCompletion___block_invoke;
  v6[3] = &unk_264A1FA78;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMDUserActivityType3BiomeStreamSubscriber *)self fetchMostRecentEventWithCompletion:v6];
}

uint64_t __69__HMDUserActivityType3BiomeStreamSubscriber_configureWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCachedMostRecentEvent:a2];
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 identifier];
  [v3 registerForBiomeStreamWithIdentifier:v4];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (HMDUserActivityType3BiomeStreamSubscriber)initWithIdentifier:(id)a3 stream:(id)a4 filterEventBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserActivityType3BiomeStreamSubscriber;
  id v12 = [(HMDUserActivityType3BiomeStreamSubscriber *)&v23 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_stream, a4);
    BOOL v14 = [NSString stringWithFormat:@"BiomeStreamSubscriberQueue-%@", v9];
    HMDispatchQueueNameString();
    id v15 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)[v15 UTF8String];
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    biomeQueue = v13->_biomeQueue;
    v13->_biomeQueue = (OS_dispatch_queue *)v18;

    v20 = _Block_copy(v11);
    id filterEventBlock = v13->_filterEventBlock;
    v13->_id filterEventBlock = v20;
  }
  return v13;
}

@end
@interface CATConcreteTimerSource
- (CATConcreteTimerSource)init;
- (id)scheduleInfiniteTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6;
- (id)scheduleOneShotTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6;
- (id)scheduleRepeatTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 totalFires:(unint64_t)a6 fireHandler:(id)a7;
@end

@implementation CATConcreteTimerSource

- (CATConcreteTimerSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)CATConcreteTimerSource;
  v2 = [(CATConcreteTimerSource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    mWorkQueue = v2->mWorkQueue;
    v2->mWorkQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)scheduleOneShotTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6
{
  id v10 = a6;
  mWorkQueue = self->mWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __92__CATConcreteTimerSource_scheduleOneShotTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke;
  v15[3] = &unk_2641DC7A0;
  id v16 = v10;
  id v12 = v10;
  v13 = +[CATDispatchTimer scheduledTimerWithIdentifier:a3 workQueue:mWorkQueue delegateQueue:a5 timeInterval:1 totalFires:0 firesForever:v15 fireHandler:a4];

  return v13;
}

uint64_t __92__CATConcreteTimerSource_scheduleOneShotTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)scheduleRepeatTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 totalFires:(unint64_t)a6 fireHandler:(id)a7
{
  id v12 = a7;
  mWorkQueue = self->mWorkQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__CATConcreteTimerSource_scheduleRepeatTimerWithIdentifier_timeInterval_queue_totalFires_fireHandler___block_invoke;
  v17[3] = &unk_2641DC7A0;
  id v18 = v12;
  id v14 = v12;
  v15 = +[CATDispatchTimer scheduledTimerWithIdentifier:a3 workQueue:mWorkQueue delegateQueue:a5 timeInterval:a6 totalFires:0 firesForever:v17 fireHandler:a4];

  return v15;
}

uint64_t __102__CATConcreteTimerSource_scheduleRepeatTimerWithIdentifier_timeInterval_queue_totalFires_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)scheduleInfiniteTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6
{
  id v10 = a6;
  mWorkQueue = self->mWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__CATConcreteTimerSource_scheduleInfiniteTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke;
  v15[3] = &unk_2641DC7A0;
  id v16 = v10;
  id v12 = v10;
  v13 = +[CATDispatchTimer scheduledTimerWithIdentifier:a3 workQueue:mWorkQueue delegateQueue:a5 timeInterval:0 totalFires:1 firesForever:v15 fireHandler:a4];

  return v13;
}

uint64_t __93__CATConcreteTimerSource_scheduleInfiniteTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end
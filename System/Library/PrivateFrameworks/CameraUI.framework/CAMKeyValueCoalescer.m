@interface CAMKeyValueCoalescer
- (CAMKeyValueCoalescer)initWithInterval:(double)a3 handler:(id)a4;
- (NSMutableDictionary)_previousValues;
- (NSMutableDictionary)_values;
- (OS_dispatch_queue)_coalescingQueue;
- (OS_dispatch_source)coalescingTimer;
- (double)_interval;
- (id)_handler;
- (void)_pushCoalescedValues;
- (void)coalesceValue:(id)a3 forKeyPath:(id)a4;
- (void)flush;
- (void)setCoalescingTimer:(id)a3;
@end

@implementation CAMKeyValueCoalescer

- (CAMKeyValueCoalescer)initWithInterval:(double)a3 handler:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMKeyValueCoalescer;
  v7 = [(CAMKeyValueCoalescer *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->__interval = a3;
    uint64_t v9 = [v6 copy];
    id handler = v8->__handler;
    v8->__id handler = (id)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    values = v8->__values;
    v8->__values = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    previousValues = v8->__previousValues;
    v8->__previousValues = v13;

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.camera.key-value-coalescing", v15);
    coalescingQueue = v8->__coalescingQueue;
    v8->__coalescingQueue = (OS_dispatch_queue *)v16;

    v18 = v8;
  }

  return v8;
}

- (void)coalesceValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(CAMKeyValueCoalescer *)self _coalescingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke;
    block[3] = &unk_263FA0CD0;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(v9, block);
  }
}

- (OS_dispatch_queue)_coalescingQueue
{
  return self->__coalescingQueue;
}

void __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _values];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) coalescingTimer];
  if (!v3)
  {
    v4 = [*(id *)(a1 + 32) _coalescingQueue];
    v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);

    [*(id *)(a1 + 32) _interval];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke_2;
    id v11 = &unk_263FA0408;
    uint64_t v12 = *(void *)(a1 + 32);
    v3 = v5;
    v13 = v3;
    dispatch_source_set_event_handler(v3, &v8);
    dispatch_resume(v3);
    objc_msgSend(*(id *)(a1 + 32), "setCoalescingTimer:", v3, v8, v9, v10, v11, v12);
  }
}

- (NSMutableDictionary)_values
{
  return self->__values;
}

- (OS_dispatch_source)coalescingTimer
{
  return self->_coalescingTimer;
}

- (double)_interval
{
  return self->__interval;
}

- (void)setCoalescingTimer:(id)a3
{
}

uint64_t __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _pushCoalescedValues];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 setCoalescingTimer:0];
}

- (void)_pushCoalescedValues
{
  dispatch_time_t v7 = [(CAMKeyValueCoalescer *)self _handler];
  v3 = [(CAMKeyValueCoalescer *)self _values];
  v4 = [(CAMKeyValueCoalescer *)self _previousValues];
  if (v7)
  {
    v5 = (void *)[v3 copy];
    double v6 = (void *)[v4 copy];
    v7[2](v7, v5, v6);
  }
  [v4 removeAllObjects];
  [v4 addEntriesFromDictionary:v3];
  [v3 removeAllObjects];
}

- (id)_handler
{
  return self->__handler;
}

- (NSMutableDictionary)_previousValues
{
  return self->__previousValues;
}

- (void)flush
{
  v3 = [(CAMKeyValueCoalescer *)self _coalescingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__CAMKeyValueCoalescer_flush__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__CAMKeyValueCoalescer_flush__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) coalescingTimer];
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v2);
    [*(id *)(a1 + 32) setCoalescingTimer:0];
    [*(id *)(a1 + 32) _pushCoalescedValues];
    v2 = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__coalescingQueue, 0);
  objc_storeStrong((id *)&self->__previousValues, 0);
  objc_storeStrong((id *)&self->__values, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong(&self->__handler, 0);
}

@end
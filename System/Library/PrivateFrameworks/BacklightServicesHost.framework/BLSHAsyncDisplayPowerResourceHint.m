@interface BLSHAsyncDisplayPowerResourceHint
+ (id)hintWithHint:(id)a3;
+ (id)sharedHighPriorityQueue;
- (BLSHAsyncDisplayPowerResourceHint)initWithHint:(id)a3;
- (BOOL)updateState:(unint64_t)a3;
@end

@implementation BLSHAsyncDisplayPowerResourceHint

+ (id)sharedHighPriorityQueue
{
  if (sharedHighPriorityQueue_onceToken != -1) {
    dispatch_once(&sharedHighPriorityQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedHighPriorityQueue_sharedQueue;

  return v2;
}

uint64_t __60__BLSHAsyncDisplayPowerResourceHint_sharedHighPriorityQueue__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("BLSHAsyncDisplayPowerResourceHint workloop");
  v1 = (void *)sharedHighPriorityQueue_rootWorkloop;
  sharedHighPriorityQueue_rootWorkloop = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)sharedHighPriorityQueue_rootWorkloop);
  sharedHighPriorityQueue_sharedQueue = (uint64_t)dispatch_queue_create_with_target_V2("BLSHAsyncDisplayPowerResourceHintQueue", 0, (dispatch_queue_t)sharedHighPriorityQueue_rootWorkloop);

  return MEMORY[0x270F9A758]();
}

+ (id)hintWithHint:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithHint:v4];

  return v5;
}

- (BLSHAsyncDisplayPowerResourceHint)initWithHint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHAsyncDisplayPowerResourceHint;
  v6 = [(BLSHAsyncDisplayPowerResourceHint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hint, a3);
  }

  return v7;
}

- (BOOL)updateState:(unint64_t)a3
{
  id v4 = self->_hint;
  id v5 = +[BLSHAsyncDisplayPowerResourceHint sharedHighPriorityQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__BLSHAsyncDisplayPowerResourceHint_updateState___block_invoke;
  v8[3] = &unk_264532230;
  objc_super v9 = v4;
  unint64_t v10 = a3;
  v6 = v4;
  dispatch_async(v5, v8);

  return 1;
}

uint64_t __49__BLSHAsyncDisplayPowerResourceHint_updateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateState:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end
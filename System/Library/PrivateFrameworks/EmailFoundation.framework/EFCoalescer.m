@interface EFCoalescer
- (EFCoalescer)initWithCoalescingAction:(id)a3;
- (void)_handleCoalesceEvent;
- (void)coalesceValue:(id)a3;
- (void)dealloc;
@end

@implementation EFCoalescer

- (EFCoalescer)initWithCoalescingAction:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EFCoalescer;
  v5 = [(EFCoalescer *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    id coalescerAction = v6->_coalescerAction;
    v6->_id coalescerAction = (id)v7;

    id v9 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v6];
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v6->_queue);
    coalescer = v6->_coalescer;
    v6->_coalescer = (OS_dispatch_source *)v14;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v16 = v6->_coalescer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__EFCoalescer_initWithCoalescingAction___block_invoke;
    handler[3] = &unk_1E6121B18;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume((dispatch_object_t)v6->_coalescer);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __40__EFCoalescer_initWithCoalescingAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCoalesceEvent];
}

- (void)dealloc
{
  coalescer = self->_coalescer;
  if (coalescer) {
    dispatch_source_cancel(coalescer);
  }
  v4.receiver = self;
  v4.super_class = (Class)EFCoalescer;
  [(EFCoalescer *)&v4 dealloc];
}

- (void)coalesceValue:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong(&self->_coalescedValue, a3);
  os_unfair_lock_unlock(&self->_lock);
  if (v5) {
    dispatch_source_merge_data((dispatch_source_t)self->_coalescer, 1uLL);
  }
  else {
    (*((void (**)(void))self->_coalescerAction + 2))();
  }
}

- (void)_handleCoalesceEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_coalescedValue;
  id coalescedValue = self->_coalescedValue;
  self->_id coalescedValue = 0;

  os_unfair_lock_unlock(p_lock);
  if (v5) {
    (*((void (**)(void))self->_coalescerAction + 2))();
  }
  sleep(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_coalescedValue, 0);
  objc_storeStrong(&self->_coalescerAction, 0);
}

@end
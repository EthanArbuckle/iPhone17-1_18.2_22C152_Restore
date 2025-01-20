@interface CRXUTimer
+ (id)scheduledTimerWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7;
- (CRXUTimer)initWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7;
- (SEL)selector;
- (id)target;
- (void)dealloc;
- (void)handleTimer;
- (void)invalidate;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation CRXUTimer

- (CRXUTimer)initWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CRXUTimer;
  v14 = [(CRXUTimer *)&v26 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_target, v12);
    if (a5) {
      SEL v16 = a5;
    }
    else {
      SEL v16 = 0;
    }
    v15->_selector = v16;
    v17 = [v13 queue];
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v17);
    timer = v15->_timer;
    v15->_timer = (OS_dispatch_source *)v18;

    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v15->_timer, v20, v20, 0);
    v21 = v15->_timer;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__CRXUTimer_initWithTimeInterval_weakTarget_selector_repeats_queue___block_invoke;
    v23[3] = &unk_2652E2178;
    BOOL v25 = a6;
    v24 = v15;
    dispatch_source_set_event_handler(v21, v23);
    dispatch_resume((dispatch_object_t)v15->_timer);
  }
  return v15;
}

uint64_t __68__CRXUTimer_initWithTimeInterval_weakTarget_selector_repeats_queue___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) invalidate];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 handleTimer];
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRXUTimer;
  [(CRXUTimer *)&v4 dealloc];
}

- (void)invalidate
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    objc_super v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)handleTimer
{
  uint64_t v3 = [(CRXUTimer *)self target];
  if (v3
    && (objc_super v4 = (void *)v3,
        [(CRXUTimer *)self target],
        v5 = objc_claimAutoreleasedReturnValue(),
        [(CRXUTimer *)self selector],
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = [(CRXUTimer *)self target];
    v8 = (void (*)(id, SEL, CRXUTimer *))objc_msgSend(v7, "methodForSelector:", -[CRXUTimer selector](self, "selector"));

    id v9 = [(CRXUTimer *)self target];
    v8(v9, [(CRXUTimer *)self selector], self);
  }
  else
  {
    [(CRXUTimer *)self invalidate];
  }
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  v14 = (void *)[objc_alloc((Class)a1) initWithTimeInterval:v13 weakTarget:a5 selector:v7 repeats:v12 queue:a3];

  return v14;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_selector = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
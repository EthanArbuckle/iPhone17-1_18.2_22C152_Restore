@interface VCPTimer
+ (id)timerWithInterval:(unint64_t)a3 unit:(unint64_t)a4 oneShot:(BOOL)a5 andBlock:(id)a6;
+ (id)timerWithIntervalSeconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5;
- (VCPTimer)initWithIntervalNanoseconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5;
- (void)dealloc;
- (void)destroy;
- (void)handleTimerEvent;
@end

@implementation VCPTimer

- (VCPTimer)initWithIntervalNanoseconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5
{
  id v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VCPTimer;
  id v9 = [(VCPTimer *)&v24 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaanalysisd.timer", 0);
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v9 + 1));
    v13 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v12;

    atomic_store(1u, (unsigned __int8 *)v9 + 24);
    *((unsigned char *)v9 + 25) = a4;
    v14 = _Block_copy(v8);
    v15 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v14;

    v16 = *((void *)v9 + 2);
    dispatch_time_t v17 = dispatch_time(0, a3);
    if (*((unsigned char *)v9 + 25)) {
      uint64_t v18 = -1;
    }
    else {
      uint64_t v18 = a3;
    }
    dispatch_source_set_timer(v16, v17, v18, 0xF4240uLL);
    objc_initWeak(&location, v9);
    v19 = *((void *)v9 + 2);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__VCPTimer_initWithIntervalNanoseconds_isOneShot_andBlock___block_invoke;
    v21[3] = &unk_1E62981D8;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v19, v21);
    dispatch_resume(*((dispatch_object_t *)v9 + 2));
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return (VCPTimer *)v9;
}

void __59__VCPTimer_initWithIntervalNanoseconds_isOneShot_andBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained handleTimerEvent];
  }
}

+ (id)timerWithInterval:(unint64_t)a3 unit:(unint64_t)a4 oneShot:(BOOL)a5 andBlock:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  if (a4 <= 3) {
    dispatch_queue_t v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIntervalNanoseconds:+[VCPTimer timerWithInterval:unit:oneShot:andBlock:]::kTimeScaler[a4] * a3 isOneShot:v6 andBlock:v9];
  }
  else {
    dispatch_queue_t v10 = 0;
  }

  return v10;
}

+ (id)timerWithIntervalSeconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(id)objc_opt_class() timerWithInterval:a3 unit:3 oneShot:v5 andBlock:v7];

  return v8;
}

- (void)dealloc
{
  [(VCPTimer *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)VCPTimer;
  [(VCPTimer *)&v3 dealloc];
}

- (void)handleTimerEvent
{
  if (self->_isOneShot)
  {
    if ((atomic_exchange((atomic_uchar *volatile)&self->_active, 0) & 1) == 0) {
      return;
    }
LABEL_5:
    (*((void (**)(void))self->_block + 2))();
    return;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_active);
  if (v2) {
    goto LABEL_5;
  }
}

- (void)destroy
{
  if (atomic_exchange((atomic_uchar *volatile)&self->_active, 0)) {
    dispatch_source_cancel((dispatch_source_t)self->_source);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
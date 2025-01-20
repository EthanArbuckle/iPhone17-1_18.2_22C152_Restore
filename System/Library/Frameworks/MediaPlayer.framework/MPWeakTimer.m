@interface MPWeakTimer
+ (id)timerWithInterval:(double)a3 block:(id)a4;
+ (id)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5;
+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (MPWeakTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (MPWeakTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (void)dealloc;
- (void)invalidate;
@end

@implementation MPWeakTimer

- (void).cxx_destruct
{
}

- (void)invalidate
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (void)dealloc
{
  [(MPWeakTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPWeakTimer;
  [(MPWeakTimer *)&v3 dealloc];
}

- (MPWeakTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  v9 = a5;
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MPWeakTimer;
  id v11 = [(MPWeakTimer *)&v17 init];
  if (v11)
  {
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    double v14 = a3 * 1000000000.0;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)v14);
    dispatch_source_set_timer(*((dispatch_source_t *)v11 + 1), v15, (unint64_t)v14, 0x989680uLL);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v11 + 1), v10);
    dispatch_resume(*((dispatch_object_t *)v11 + 1));
  }

  return (MPWeakTimer *)v11;
}

- (MPWeakTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return [(MPWeakTimer *)self initWithInterval:1 repeats:a4 queue:a5 block:a3];
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  dispatch_source_t v12 = (void *)[objc_alloc((Class)a1) initWithInterval:v7 repeats:v11 queue:v10 block:a3];

  return v12;
}

+ (id)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (id)[a1 timerWithInterval:1 repeats:a4 queue:a5 block:a3];
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5
{
  return (id)[a1 timerWithInterval:a4 repeats:MEMORY[0x1E4F14428] queue:a5 block:a3];
}

+ (id)timerWithInterval:(double)a3 block:(id)a4
{
  return (id)[a1 timerWithInterval:1 repeats:a4 block:a3];
}

@end
@interface ATXTimer
+ (id)fireAtDate:(id)a3 block:(id)a4;
- (ATXTimer)initWithDate:(id)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation ATXTimer

- (ATXTimer)initWithDate:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimer;
  id v8 = [(ATXTimer *)&v17 init];
  if (v8)
  {
    [v6 timeIntervalSince1970];
    v16.tv_sec = (int)v9;
    v16.tv_nsec = 0;
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, MEMORY[0x1E4F14428]);
    v11 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v10;

    v12 = *((void *)v8 + 1);
    dispatch_time_t v13 = dispatch_walltime(&v16, 0);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v7);
    dispatch_resume(*((dispatch_object_t *)v8 + 1));
    id v14 = v8;
  }

  return (ATXTimer *)v8;
}

- (void)dealloc
{
  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->_source;
    self->_source = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ATXTimer;
  [(ATXTimer *)&v5 dealloc];
}

+ (id)fireAtDate:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 block:v6];

  return v8;
}

- (void).cxx_destruct
{
}

@end
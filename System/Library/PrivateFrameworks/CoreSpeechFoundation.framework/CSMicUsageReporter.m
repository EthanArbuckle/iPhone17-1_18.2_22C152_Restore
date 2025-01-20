@interface CSMicUsageReporter
- (CSMicUsageReporter)init;
- (OS_dispatch_queue)queue;
- (void)setQueue:(id)a3;
@end

@implementation CSMicUsageReporter

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSMicUsageReporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSMicUsageReporter;
  v2 = [(CSMicUsageReporter *)&v7 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(33, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("CSMicUsageReporter", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end
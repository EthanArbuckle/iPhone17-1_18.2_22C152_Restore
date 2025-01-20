@interface ODRTaskQueue
- (ODRTaskQueue)init;
@end

@implementation ODRTaskQueue

- (ODRTaskQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODRTaskQueue;
  v2 = [(ODRTaskQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    queue = v2->_queue;
    v2->_queue = (TaskQueue *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
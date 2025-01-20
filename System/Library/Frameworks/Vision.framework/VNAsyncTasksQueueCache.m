@interface VNAsyncTasksQueueCache
- (id)queueWithUniqueAppendix:(id)a3;
@end

@implementation VNAsyncTasksQueueCache

- (id)queueWithUniqueAppendix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)VNAsyncTasksQueueCache;
  v6 = [(VNTasksQueueCache *)&v8 _queueWithUniqueAppendix:v4 queueClass:v5];

  return v6;
}

@end
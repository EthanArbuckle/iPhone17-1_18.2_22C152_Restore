@interface _EFBufferedQueueStrategy
- (NSString)descriptionType;
- (_EFBufferedQueueStrategy)initWithCapacity:(unint64_t)a3 batchHandler:(id)a4;
- (id)batchHandler;
- (unint64_t)capacity;
- (void)dequeueObject:(id)a3 buffer:(id)a4;
- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5;
@end

@implementation _EFBufferedQueueStrategy

- (_EFBufferedQueueStrategy)initWithCapacity:(unint64_t)a3 batchHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFBufferedQueueStrategy;
  v7 = [(_EFBufferedQueueStrategy *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_capacity = a3;
    v9 = _Block_copy(v6);
    id batchHandler = v8->_batchHandler;
    v8->_id batchHandler = v9;
  }
  return v8;
}

- (NSString)descriptionType
{
  return (NSString *)@"buffered";
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  v9 = v8;
  if (v6) {
    [v8 removeObject:v12];
  }
  [v9 addObject:v12];
  if ([v9 count] >= self->_capacity)
  {
    v10 = (void *)MEMORY[0x1BA9A5240]();
    v11 = (void *)[v9 copy];
    (*((void (**)(void))self->_batchHandler + 2))();
    [v9 removeAllObjects];
  }
}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
}

- (id)batchHandler
{
  return self->_batchHandler;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
}

@end
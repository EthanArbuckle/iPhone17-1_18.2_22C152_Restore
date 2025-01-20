@interface _FMBoundedQueueingStrategy
- (_FMBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3;
- (_FMBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3 overflowHandler:(id)a4;
- (void)enqueueObject:(id)a3 buffer:(id)a4;
@end

@implementation _FMBoundedQueueingStrategy

- (_FMBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_FMBoundedQueueingStrategy;
  v4 = [(_FMBoundedQueueingStrategy *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = v4;
  }

  return v5;
}

- (_FMBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6 = a4;
  v7 = [(_FMBoundedQueueingStrategy *)self initWithCapacity:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id overflowHandler = v7->_overflowHandler;
    v7->_id overflowHandler = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (void)enqueueObject:(id)a3 buffer:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 count] == self->_capacity)
  {
    id overflowHandler = (void (**)(id, void *))self->_overflowHandler;
    if (overflowHandler)
    {
      uint64_t v8 = [v6 firstObject];
      overflowHandler[2](overflowHandler, v8);
    }
    [v6 removeObjectAtIndex:0];
  }
  [v6 addObject:v9];
}

- (void).cxx_destruct
{
}

@end
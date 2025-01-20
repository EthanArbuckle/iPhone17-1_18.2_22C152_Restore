@interface FMQueue
+ (id)boundedQueueWithCapacity:(unint64_t)a3;
+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4;
+ (id)priorityQueueWithComparator:(id)a3;
- (FMQueue)init;
- (FMQueue)initWithStrategy:(id)a3;
- (NSArray)allObjects;
- (id)dequeue;
- (id)drain;
- (id)peek;
- (unint64_t)count;
- (void)dequeueObject:(id)a3;
- (void)enqueue:(id)a3;
@end

@implementation FMQueue

+ (id)priorityQueueWithComparator:(id)a3
{
  id v4 = a3;
  v5 = [[_FMPriorityQueueingStrategy alloc] initWithComparator:v4];

  v6 = (void *)[objc_alloc((Class)a1) initWithStrategy:v5];
  return v6;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  id v4 = [[_FMBoundedQueueingStrategy alloc] initWithCapacity:a3];
  v5 = (void *)[objc_alloc((Class)a1) initWithStrategy:v4];

  return v5;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6 = a4;
  v7 = [[_FMBoundedQueueingStrategy alloc] initWithCapacity:a3 overflowHandler:v6];

  v8 = (void *)[objc_alloc((Class)a1) initWithStrategy:v7];
  return v8;
}

- (FMQueue)init
{
  v3 = objc_alloc_init(_FMDefaultQueueingStrategy);
  id v4 = [(FMQueue *)self initWithStrategy:v3];

  return v4;
}

- (FMQueue)initWithStrategy:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMQueue;
  id v6 = [(FMQueue *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    buffer = v6->_buffer;
    v6->_buffer = v7;

    objc_storeStrong((id *)&v6->_strategy, a3);
    v9 = v6;
  }

  return v6;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_buffer count];
}

- (NSArray)allObjects
{
  v2 = (void *)[(NSMutableArray *)self->_buffer copy];
  return (NSArray *)v2;
}

- (void)enqueue:(id)a3
{
}

- (id)peek
{
  return (id)[(NSMutableArray *)self->_buffer firstObject];
}

- (id)dequeue
{
  if ([(NSMutableArray *)self->_buffer count])
  {
    v3 = [(NSMutableArray *)self->_buffer firstObject];
    [(NSMutableArray *)self->_buffer removeObjectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)dequeueObject:(id)a3
{
}

- (id)drain
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_buffer];
  [(NSMutableArray *)self->_buffer removeAllObjects];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
@interface CNQueue
+ (id)boundedQueueWithCapacity:(unint64_t)a3;
+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4;
+ (id)priorityQueueWithComparator:(id)a3;
- (CNQueue)init;
- (CNQueue)initWithStrategy:(id)a3;
- (CNQueueingStrategy)strategy;
- (NSArray)allObjects;
- (NSMutableArray)buffer;
- (id)dequeue;
- (id)drain;
- (id)peek;
- (unint64_t)count;
- (void)dequeueObject:(id)a3;
- (void)enqueue:(id)a3;
- (void)enqueueObjectsFromArray:(id)a3;
@end

@implementation CNQueue

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

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  v4 = [[_CNBoundedQueueingStrategy alloc] initWithCapacity:a3];
  v5 = (void *)[objc_alloc((Class)a1) initWithStrategy:v4];

  return v5;
}

- (CNQueue)init
{
  v3 = objc_alloc_init(_CNDefaultQueueingStrategy);
  v4 = [(CNQueue *)self initWithStrategy:v3];

  return v4;
}

- (CNQueue)initWithStrategy:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNQueue;
  v6 = [(CNQueue *)&v11 init];
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

- (NSArray)allObjects
{
  v2 = (void *)[(NSMutableArray *)self->_buffer copy];

  return (NSArray *)v2;
}

- (void)enqueue:(id)a3
{
}

- (void)dequeueObject:(id)a3
{
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_buffer count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6 = a4;
  v7 = [[_CNBoundedQueueingStrategy alloc] initWithCapacity:a3 overflowHandler:v6];

  v8 = (void *)[objc_alloc((Class)a1) initWithStrategy:v7];

  return v8;
}

+ (id)priorityQueueWithComparator:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNPriorityQueueingStrategy alloc] initWithComparator:v4];

  id v6 = (void *)[objc_alloc((Class)a1) initWithStrategy:v5];

  return v6;
}

- (void)enqueueObjectsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNQueue *)self enqueue:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)peek
{
  return (id)[(NSMutableArray *)self->_buffer firstObject];
}

- (id)drain
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_buffer];
  [(NSMutableArray *)self->_buffer removeAllObjects];

  return v3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (CNQueueingStrategy)strategy
{
  return self->_strategy;
}

@end
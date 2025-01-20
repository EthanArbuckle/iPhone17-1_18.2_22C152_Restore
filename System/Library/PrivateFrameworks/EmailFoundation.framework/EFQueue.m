@interface EFQueue
+ (id)boundedQueueWithCapacity:(unint64_t)a3;
+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4;
+ (id)bufferedQueueWithCapacity:(unint64_t)a3 batchHandler:(id)a4;
+ (id)priorityQueueWithComparator:(id)a3;
- (EFQueue)init;
- (EFQueue)initWithStrategy:(id)a3;
- (EFQueueingStrategy)strategy;
- (NSArray)allObjects;
- (NSMutableArray)buffer;
- (id)debugDescription;
- (id)dequeue;
- (id)description;
- (id)drain;
- (id)peek;
- (unint64_t)count;
- (void)dequeueObject:(id)a3;
- (void)enqueue:(id)a3;
- (void)enqueue:(id)a3 replaceIfExists:(BOOL)a4;
@end

@implementation EFQueue

- (void)dequeueObject:(id)a3
{
}

- (void)enqueue:(id)a3 replaceIfExists:(BOOL)a4
{
}

- (void)enqueue:(id)a3
{
}

- (id)dequeue
{
  v3 = [(EFQueue *)self peek];
  if (v3) {
    [(NSMutableArray *)self->_buffer removeObjectAtIndex:0];
  }
  return v3;
}

- (id)peek
{
  return (id)[(NSMutableArray *)self->_buffer firstObject];
}

+ (id)priorityQueueWithComparator:(id)a3
{
  id v3 = a3;
  v4 = [[_EFPriorityQueueStrategy alloc] initWithComparator:v3];
  v5 = [[EFQueue alloc] initWithStrategy:v4];

  return v5;
}

- (EFQueue)initWithStrategy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EFQueue;
  v6 = [(EFQueue *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    buffer = v6->_buffer;
    v6->_buffer = v7;

    objc_storeStrong((id *)&v6->_strategy, a3);
  }

  return v6;
}

- (id)drain
{
  id v3 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_buffer];
  [(NSMutableArray *)self->_buffer removeAllObjects];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v5 = a4;
  v6 = [[_EFBoundedQueueStrategy alloc] initWithCapacity:a3 overflowHandler:v5];
  v7 = [[EFQueue alloc] initWithStrategy:v6];

  return v7;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  id v3 = [[_EFBoundedQueueStrategy alloc] initWithCapacity:a3 overflowHandler:0];
  v4 = [[EFQueue alloc] initWithStrategy:v3];

  return v4;
}

+ (id)bufferedQueueWithCapacity:(unint64_t)a3 batchHandler:(id)a4
{
  id v5 = a4;
  v6 = [[_EFBufferedQueueStrategy alloc] initWithCapacity:a3 batchHandler:v5];
  v7 = [[EFQueue alloc] initWithStrategy:v6];

  return v7;
}

- (EFQueue)init
{
  id v3 = objc_alloc_init(_EFDefaultQueueingStrategy);
  v4 = [(EFQueue *)self initWithStrategy:v3];

  return v4;
}

- (id)debugDescription
{
  id v3 = [(EFQueue *)self description];
  v4 = [(NSMutableArray *)self->_buffer componentsJoinedByString:@",\n\t"];
  if (![v4 length])
  {
    uint64_t v5 = [NSString stringWithFormat:@" {\n\t%@\n}", v4];

    v4 = (void *)v5;
  }
  v6 = [NSString stringWithFormat:@"%@ %@", v3, v4];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EFQueueingStrategy *)self->_strategy descriptionType];
  v6 = [v3 stringWithFormat:@"<%@: %p> (%@) %lld items", v4, self, v5, -[NSMutableArray count](self->_buffer, "count")];

  return v6;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_buffer count];
}

- (NSArray)allObjects
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_buffer];
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (EFQueueingStrategy)strategy
{
  return self->_strategy;
}

@end
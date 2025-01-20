@interface _FMPriorityQueueingStrategy
- (_FMPriorityQueueingStrategy)init;
- (_FMPriorityQueueingStrategy)initWithComparator:(id)a3;
- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4;
- (void)enqueueObject:(id)a3 buffer:(id)a4;
@end

@implementation _FMPriorityQueueingStrategy

- (_FMPriorityQueueingStrategy)init
{
  return [(_FMPriorityQueueingStrategy *)self initWithComparator:0];
}

- (_FMPriorityQueueingStrategy)initWithComparator:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_FMPriorityQueueingStrategy;
  v5 = [(_FMPriorityQueueingStrategy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id priorityComparator = v5->_priorityComparator;
    v5->_id priorityComparator = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)enqueueObject:(id)a3 buffer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[_FMPriorityQueueingStrategy _insertionIndexForObject:buffer:](self, "_insertionIndexForObject:buffer:", v7, v6));
}

- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __63___FMPriorityQueueingStrategy__insertionIndexForObject_buffer___block_invoke;
  v14 = &unk_1E60194E0;
  v15 = self;
  id v16 = v6;
  id v8 = v6;
  unint64_t v9 = [v7 indexOfObjectPassingTest:&v11];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = objc_msgSend(v7, "count", v11, v12, v13, v14, v15, v16);
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end
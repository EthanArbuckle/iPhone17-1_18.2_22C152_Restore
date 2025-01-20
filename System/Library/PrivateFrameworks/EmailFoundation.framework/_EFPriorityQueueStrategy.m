@interface _EFPriorityQueueStrategy
- (NSString)descriptionType;
- (_EFPriorityQueueStrategy)initWithComparator:(id)a3;
- (id)comparator;
- (unint64_t)_indexForObject:(id)a3 buffer:(id)a4;
- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4;
- (void)dequeueObject:(id)a3 buffer:(id)a4;
- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5;
@end

@implementation _EFPriorityQueueStrategy

- (void).cxx_destruct
{
}

- (_EFPriorityQueueStrategy)initWithComparator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFPriorityQueueStrategy;
  v5 = [(_EFPriorityQueueStrategy *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id comparator = v5->_comparator;
    v5->_id comparator = v6;
  }
  return v5;
}

- (NSString)descriptionType
{
  return (NSString *)@"priority";
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65___EFPriorityQueueStrategy_enqueueObject_replaceIfExists_buffer___block_invoke;
    v11[3] = &unk_1E6122FE0;
    id v12 = v8;
    v10 = [v9 indexesOfObjectsPassingTest:v11];
    [v9 removeObjectsAtIndexes:v10];
  }
  objc_msgSend(v9, "insertObject:atIndex:", v8, -[_EFPriorityQueueStrategy _insertionIndexForObject:buffer:](self, "_insertionIndexForObject:buffer:", v8, v9));
}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t v7 = [(_EFPriorityQueueStrategy *)self _indexForObject:v8 buffer:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 < [v6 count]) {
    [v6 removeObjectAtIndex:v7];
  }
}

- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 1536, self->_comparator);

  return v8;
}

- (unint64_t)_indexForObject:(id)a3 buffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 512, self->_comparator);

  return v8;
}

- (id)comparator
{
  return self->_comparator;
}

@end
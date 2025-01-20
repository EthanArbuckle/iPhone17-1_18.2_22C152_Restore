@interface MKPriorityToIndexMap
- (BOOL)addPriorities:(id)a3;
- (BOOL)contains:(id)a3;
- (BOOL)containsPriority:(double)a3;
- (MKPriorityToIndexMap)init;
- (MKPriorityToIndexMap)initWithPriorities:(id)a3;
- (double)priorityOfIndex:(unint64_t)a3;
- (id)nextPriorityFromPriorities:(id)a3 prioritiesToReAdd:(id)a4;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)indexOfPriority:(double)a3;
- (void)appendRemainingPriorities:(id)a3 prioritiesToReAdd:(id)a4;
- (void)insertPriorities:(id)a3 prioritiesToReAdd:(id)a4;
@end

@implementation MKPriorityToIndexMap

uint64_t __38__MKPriorityToIndexMap_addPriorities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_prioritiesToIndexes objectForKeyedSubscript:a3];
}

- (MKPriorityToIndexMap)initWithPriorities:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPriorityToIndexMap;
  v5 = [(MKPriorityToIndexMap *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    prioritiesToIndexes = v5->_prioritiesToIndexes;
    v5->_prioritiesToIndexes = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    priorities = v5->_priorities;
    v5->_priorities = v8;

    [(MKPriorityToIndexMap *)v5 addPriorities:v4];
  }

  return v5;
}

- (BOOL)addPriorities:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_prioritiesToIndexes, "objectForKeyedSubscript:", v11, (void)v17);

          if (!v12) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v5 count];
    BOOL v14 = v13 != 0;
    if (v13)
    {
      [v5 sortWithOptions:1 usingComparator:&__block_literal_global_11];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(MKPriorityToIndexMap *)self insertPriorities:v5 prioritiesToReAdd:v15];
      [(MKPriorityToIndexMap *)self appendRemainingPriorities:v5 prioritiesToReAdd:v15];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)insertPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([(NSMutableArray *)self->_priorities count] && [(NSMutableArray *)self->_priorities count])
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if (!v8)
      {
        uint64_t v8 = [(MKPriorityToIndexMap *)self nextPriorityFromPriorities:v13 prioritiesToReAdd:v6];
      }
      uint64_t v9 = [(NSMutableArray *)self->_priorities objectAtIndexedSubscript:v7];
      if ([v8 compare:v9] == -1)
      {
        [v6 addObject:v9];
        [(NSMutableArray *)self->_priorities setObject:v8 atIndexedSubscript:v7];
        v10 = [NSNumber numberWithUnsignedInteger:v7];
        [(NSMutableDictionary *)self->_prioritiesToIndexes setObject:v10 forKeyedSubscript:v8];

        uint64_t v11 = [v13 firstObject];

        v12 = v13;
        if (v8 != v11) {
          v12 = v6;
        }
        [v12 removeObjectAtIndex:0];

        uint64_t v8 = 0;
      }
      ++v7;
    }
    while (v7 < [(NSMutableArray *)self->_priorities count]);
  }
}

- (void)appendRemainingPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  while ([v11 count] || objc_msgSend(v6, "count"))
  {
    unint64_t v7 = [(MKPriorityToIndexMap *)self nextPriorityFromPriorities:v11 prioritiesToReAdd:v6];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_priorities, "count"));
    [(NSMutableDictionary *)self->_prioritiesToIndexes setObject:v8 forKeyedSubscript:v7];

    [(NSMutableArray *)self->_priorities addObject:v7];
    uint64_t v9 = [v11 firstObject];

    v10 = v11;
    if (v7 != v9) {
      v10 = v6;
    }
    [v10 removeObjectAtIndex:0];
  }
}

- (id)nextPriorityFromPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [v6 firstObject];

  if (v7)
  {
    uint64_t v9 = [v5 firstObject];
    if (!v8 || (v10 = [v8 compare:v9], id v11 = v8, v10 != -1)) {
      id v11 = v9;
    }
    id v12 = v11;

    uint64_t v8 = v12;
  }

  return v8;
}

- (BOOL)containsPriority:(double)a3
{
  prioritiesToIndexes = self->_prioritiesToIndexes;
  id v4 = [NSNumber numberWithDouble:a3];
  id v5 = [(NSMutableDictionary *)prioritiesToIndexes objectForKeyedSubscript:v4];
  LOBYTE(prioritiesToIndexes) = v5 != 0;

  return (char)prioritiesToIndexes;
}

- (MKPriorityToIndexMap)init
{
  return [(MKPriorityToIndexMap *)self initWithPriorities:0];
}

- (int64_t)indexOfPriority:(double)a3
{
  prioritiesToIndexes = self->_prioritiesToIndexes;
  id v4 = [NSNumber numberWithDouble:a3];
  id v5 = [(NSMutableDictionary *)prioritiesToIndexes objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (double)priorityOfIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_priorities count] <= a3) {
    return 2.22507386e-308;
  }
  id v5 = [(NSMutableArray *)self->_priorities objectAtIndexedSubscript:a3];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (BOOL)contains:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_prioritiesToIndexes objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesToIndexes, 0);

  objc_storeStrong((id *)&self->_priorities, 0);
}

@end
@interface ARTimeKeyedList
- (ARTimeKeyedList)init;
- (ARTimeKeyedList)initWithMaxSize:(unint64_t)a3;
- (id)description;
- (id)nearestObjectForTime:(double)a3;
- (unint64_t)insertionIndexForTime:(id)a3;
- (void)appendObject:(id)a3 forTime:(double)a4;
- (void)clear;
@end

@implementation ARTimeKeyedList

- (ARTimeKeyedList)initWithMaxSize:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ARTimeKeyedList;
  v4 = [(ARTimeKeyedList *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxSize = a3;
    uint64_t v6 = objc_opt_new();
    times = v5->_times;
    v5->_times = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v8;
  }
  return v5;
}

- (ARTimeKeyedList)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[ARTimeKeyedList init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return [(ARTimeKeyedList *)self initWithMaxSize:0];
}

- (unint64_t)insertionIndexForTime:(id)a3
{
  times = self->_times;
  id v4 = a3;
  unint64_t v5 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](times, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSMutableArray *)times count], 1024, &__block_literal_global_103);

  return v5;
}

uint64_t __41__ARTimeKeyedList_insertionIndexForTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)nearestObjectForTime:(double)a3
{
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  unint64_t v6 = [(ARTimeKeyedList *)self insertionIndexForTime:v5];
  if (v6)
  {
    v7 = [(NSMutableArray *)self->_times objectAtIndexedSubscript:v6 - 1];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [(NSMutableArray *)self->_objects objectAtIndexedSubscript:v6 - 1];
  }
  else
  {
    v10 = 0;
    double v9 = -1.79769313e308;
  }
  if (v6 < [(NSMutableArray *)self->_times count]
    && ([(NSMutableArray *)self->_times objectAtIndexedSubscript:v6],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        [v11 doubleValue],
        double v13 = v12,
        v11,
        v13 - a3 < a3 - v9))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", v6, v13 - a3);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (void)appendObject:(id)a3 forTime:(double)a4
{
  unint64_t v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithDouble:a4];
  unint64_t v8 = [(ARTimeKeyedList *)self insertionIndexForTime:v9];
  [(NSMutableArray *)self->_times insertObject:v9 atIndex:v8];
  [(NSMutableArray *)self->_objects insertObject:v7 atIndex:v8];

  if ([(NSMutableArray *)self->_times count] > self->_maxSize)
  {
    [(NSMutableArray *)self->_times removeObjectAtIndex:0];
    [(NSMutableArray *)self->_objects removeObjectAtIndex:0];
  }
}

- (void)clear
{
  [(NSMutableArray *)self->_times removeAllObjects];
  objects = self->_objects;
  [(NSMutableArray *)objects removeAllObjects];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)ARTimeKeyedList;
  id v4 = [(ARTimeKeyedList *)&v7 description];
  unint64_t v5 = [v3 stringWithFormat:@"%@ MaxSize: %lu\n", v4, self->_maxSize];

  [v5 appendFormat:@"Times: %@\n", self->_times];
  [v5 appendFormat:@"Objects: %@\n", self->_objects];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_times, 0);
}

@end
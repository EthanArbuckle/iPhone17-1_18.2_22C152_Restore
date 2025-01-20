@interface HMIVideoEventBuffer
- (HMIVideoEventBuffer)initWithMaxCapacity:(int64_t)a3;
- (id)description;
- (id)extractObjectsInTimeRange:(id *)a3;
- (id)firstObject;
- (id)neighborsOfObject:(id)a3;
- (id)objectsInTimeRange:(id *)a3 includeEnd:(BOOL)a4;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeAllObjects;
@end

@implementation HMIVideoEventBuffer

- (HMIVideoEventBuffer)initWithMaxCapacity:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMIVideoEventBuffer;
  v4 = [(HMIVideoEventBuffer *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    data = v4->_data;
    v4->_data = (NSMutableArray *)v5;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_maxCapacity = a3;
  }
  return v4;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_data removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)addObject:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  if ((unint64_t)[(NSMutableArray *)self->_data count] >= self->_maxCapacity) {
    [(NSMutableArray *)self->_data hmf_removeFirstObject];
  }
  uint64_t v4 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, [(NSMutableArray *)self->_data count], 1024, &__block_literal_global_148);
  data = self->_data;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)data addObject:v6];
  }
  else {
    -[NSMutableArray insertObject:atIndex:](data, "insertObject:atIndex:", v6);
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __33__HMIVideoEventBuffer_addObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  [v4 time];
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 time];
LABEL_6:
  uint64_t v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

- (id)objectsInTimeRange:(id *)a3 includeEnd:(BOOL)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  data = self->_data;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__HMIVideoEventBuffer_objectsInTimeRange_includeEnd___block_invoke;
  v12[3] = &__block_descriptor_81_e32_B32__0___HMIVideoEvent__8Q16_B24l;
  BOOL v16 = a4;
  long long v9 = *(_OWORD *)&a3->var0.var3;
  long long v13 = *(_OWORD *)&a3->var0.var0;
  long long v14 = v9;
  long long v15 = *(_OWORD *)&a3->var1.var1;
  v10 = [(NSMutableArray *)data hmf_objectsPassingTest:v12];
  os_unfair_lock_unlock(p_lock);
  return v10;
}

BOOL __53__HMIVideoEventBuffer_objectsInTimeRange_includeEnd___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_6;
  }
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&range.start.epoch = v4;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 64);
  CMTimeRangeGetEnd(&time1, &range);
  if (v3) {
    [v3 time];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  if (!CMTimeCompare(&time1, &time2))
  {
    BOOL v7 = 1;
  }
  else
  {
LABEL_6:
    id v5 = (_OWORD *)(a1 + 32);
    if (v3) {
      [v3 time];
    }
    else {
      memset(&v9, 0, sizeof(v9));
    }
    long long v6 = v5[1];
    *(_OWORD *)&range.start.value = *v5;
    *(_OWORD *)&range.start.epoch = v6;
    *(_OWORD *)&range.duration.timescale = v5[2];
    BOOL v7 = CMTimeRangeContainsTime(&range, &v9) != 0;
  }

  return v7;
}

- (id)extractObjectsInTimeRange:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  data = self->_data;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__HMIVideoEventBuffer_extractObjectsInTimeRange___block_invoke;
  v11[3] = &__block_descriptor_80_e32_B32__0___HMIVideoEvent__8Q16_B24l;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  long long v12 = *(_OWORD *)&a3->var0.var0;
  long long v13 = v7;
  long long v14 = *(_OWORD *)&a3->var1.var1;
  objc_super v8 = [(NSMutableArray *)data indexesOfObjectsPassingTest:v11];
  CMTime v9 = [(NSMutableArray *)self->_data objectsAtIndexes:v8];
  [(NSMutableArray *)self->_data removeObjectsAtIndexes:v8];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

BOOL __49__HMIVideoEventBuffer_extractObjectsInTimeRange___block_invoke(_OWORD *a1, void *a2)
{
  if (a2) {
    [a2 time];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  long long v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) != 0;
}

- (id)neighborsOfObject:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSMutableArray *)self->_data count], 1024, &__block_literal_global_153);
  if (v6 && v6 < [(NSMutableArray *)self->_data count])
  {
    long long v7 = [(NSMutableArray *)self->_data objectAtIndex:v6 - 1];
    v12[0] = v7;
    objc_super v8 = [(NSMutableArray *)self->_data objectAtIndex:v6];
    v12[1] = v8;
    CMTime v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

LABEL_6:
    goto LABEL_8;
  }
  if (v6 < [(NSMutableArray *)self->_data count])
  {
    long long v7 = [(NSMutableArray *)self->_data objectAtIndex:v6];
    v11 = v7;
    CMTime v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    goto LABEL_6;
  }
  CMTime v9 = (void *)MEMORY[0x263EFFA68];
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

uint64_t __41__HMIVideoEventBuffer_neighborsOfObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  [v4 time];
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 time];
LABEL_6:
  uint64_t v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_data count];
}

- (id)firstObject
{
  return (id)[(NSMutableArray *)self->_data firstObject];
}

- (id)description
{
  v2 = [(NSMutableArray *)self->_data na_map:&__block_literal_global_157];
  long long v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

id __34__HMIVideoEventBuffer_description__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 time];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  v2 = HMICMTimeDescription(&v4);
  return v2;
}

- (void).cxx_destruct
{
}

@end
@interface HKSortedSampleArray
- (BOOL)insertSamples:(id)a3;
- (BOOL)removeSample:(id)a3;
- (BOOL)removeSampleAtIndex:(int64_t)a3;
- (BOOL)removeSamplesWithUUIDs:(id)a3;
- (HKSortedSampleArray)init;
- (NSSortDescriptor)sortDescriptor;
- (id)allSamples;
- (id)description;
- (id)reverseSampleEnumerator;
- (id)sampleAtIndex:(int64_t)a3;
- (id)sampleEnumerator;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_addResultsToUUIDMappingRemovingDuplicates:(id)a3;
- (void)removeAllSamples;
- (void)setSortDescriptor:(id)a3;
@end

@implementation HKSortedSampleArray

- (HKSortedSampleArray)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSortedSampleArray;
  v2 = [(HKSortedSampleArray *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    samples = v2->_samples;
    v2->_samples = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    samplesByUUID = v2->_samplesByUUID;
    v2->_samplesByUUID = v5;
  }
  return v2;
}

- (void)_addResultsToUUIDMappingRemovingDuplicates:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v8 objectAtIndexedSubscript:v4];
      v6 = [v5 UUID];
      v7 = [(NSMutableDictionary *)self->_samplesByUUID objectForKeyedSubscript:v6];

      if (v7)
      {
        [v8 removeObjectAtIndex:v4];
      }
      else
      {
        [(NSMutableDictionary *)self->_samplesByUUID setObject:v5 forKeyedSubscript:v6];
        ++v4;
      }
    }
    while (v4 < [v8 count]);
  }
}

- (BOOL)insertSamples:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)[a3 mutableCopy];
  v11[0] = self->_sortDescriptor;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 sortUsingDescriptors:v5];

  [(HKSortedSampleArray *)self _addResultsToUUIDMappingRemovingDuplicates:v4];
  uint64_t v6 = [v4 count];
  if ([(NSMutableArray *)self->_samples count])
  {
    unint64_t v7 = 0;
    do
    {
      if (![v4 count]) {
        break;
      }
      id v8 = [(NSMutableArray *)self->_samples objectAtIndexedSubscript:v7];
      v9 = [v4 firstObject];
      if ([(NSSortDescriptor *)self->_sortDescriptor compareObject:v9 toObject:v8] == NSOrderedAscending)
      {
        [(NSMutableArray *)self->_samples insertObject:v9 atIndex:v7];
        [v4 removeObjectAtIndex:0];
      }
      ++v7;
    }
    while (v7 < [(NSMutableArray *)self->_samples count]);
  }
  if ([v4 count]) {
    [(NSMutableArray *)self->_samples addObjectsFromArray:v4];
  }

  return v6 != 0;
}

- (id)sampleAtIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_samples objectAtIndexedSubscript:a3];
}

- (id)allSamples
{
  return self->_samples;
}

- (int64_t)count
{
  return [(NSMutableArray *)self->_samples count];
}

- (BOOL)removeSample:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_samples indexOfObject:a3];

  return [(HKSortedSampleArray *)self removeSampleAtIndex:v4];
}

- (BOOL)removeSampleAtIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if ([(HKSortedSampleArray *)self count] <= a3) {
    return 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_samples objectAtIndexedSubscript:a3];
  samplesByUUID = self->_samplesByUUID;
  id v8 = [v6 UUID];
  [(NSMutableDictionary *)samplesByUUID removeObjectForKey:v8];

  [(NSMutableArray *)self->_samples removeObjectAtIndex:a3];
  return 1;
}

- (BOOL)removeSamplesWithUUIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [(NSMutableDictionary *)self->_samplesByUUID objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          v7 |= [(HKSortedSampleArray *)self removeSample:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (void)removeAllSamples
{
  [(NSMutableArray *)self->_samples removeAllObjects];
  samplesByUUID = self->_samplesByUUID;

  [(NSMutableDictionary *)samplesByUUID removeAllObjects];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_samples countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)sampleEnumerator
{
  return (id)[(NSMutableArray *)self->_samples objectEnumerator];
}

- (id)reverseSampleEnumerator
{
  return (id)[(NSMutableArray *)self->_samples reverseObjectEnumerator];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKSortedSampleArray;
  id v4 = [(HKSortedSampleArray *)&v8 description];
  uint64_t v5 = [(NSMutableArray *)self->_samples description];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setSortDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_samplesByUUID, 0);

  objc_storeStrong((id *)&self->_samples, 0);
}

@end
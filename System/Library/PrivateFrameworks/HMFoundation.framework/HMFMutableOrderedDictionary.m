@interface HMFMutableOrderedDictionary
- (HMFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3;
- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6;
- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4;
- (NSArray)allKeys;
- (NSArray)allValues;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setBySortingDictionary:(id)a3;
- (void)setBySortingDictionary:(id)a3 keyComparator:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setOrderedDictionary:(id)a3;
@end

@implementation HMFMutableOrderedDictionary

- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMFMutableOrderedDictionary;
  return [(HMFOrderedDictionary *)&v5 initWithObjects:a3 orderedKeySet:a4];
}

- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 alloc];
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    id v15 = v12;
  }
  else {
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }
  v16 = (void *)[v13 initWithArray:v15 copyItems:v7];

  id v17 = objc_alloc(MEMORY[0x1E4F1CA70]);
  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = v14;
  }
  v19 = (void *)[v17 initWithArray:v18 copyItems:v6];

  v20 = [(HMFMutableOrderedDictionary *)self initWithObjects:v16 orderedKeySet:v19];
  return v20;
}

- (HMFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:a3];
  BOOL v7 = [(HMFMutableOrderedDictionary *)self initWithObjects:v5 orderedKeySet:v6];

  return v7;
}

- (NSArray)allKeys
{
  v2 = [(NSOrderedSet *)self->super._keys array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allValues
{
  v2 = (void *)[(NSArray *)self->super._objects copy];
  return (NSArray *)v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v11 = a4;
  keys = self->super._keys;
  id v7 = a3;
  uint64_t v8 = [(NSOrderedSet *)keys indexOfObject:v11];
  objects = self->super._objects;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSArray *)objects addObject:v7];

    v10 = self->super._keys;
    id v7 = (id)[v11 copyWithZone:0];
    [(NSOrderedSet *)v10 addObject:v7];
  }
  else
  {
    [(NSArray *)objects replaceObjectAtIndex:v8 withObject:v7];
  }
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3) {
    [(HMFMutableOrderedDictionary *)self setObject:a3 forKey:a4];
  }
  else {
    [(HMFMutableOrderedDictionary *)self removeObjectForKey:a4];
  }
}

- (void)removeObjectForKey:(id)a3
{
  NSUInteger v4 = [(NSOrderedSet *)self->super._keys indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = v4;
    [(NSArray *)self->super._objects removeObjectAtIndex:v4];
    keys = self->super._keys;
    [(NSOrderedSet *)keys removeObjectAtIndex:v5];
  }
}

- (void)removeObjectsForKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 >= 2)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          NSUInteger v12 = -[NSOrderedSet indexOfObject:](self->super._keys, "indexOfObject:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
            [v6 addIndex:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(NSArray *)self->super._objects removeObjectsAtIndexes:v6];
    [(NSOrderedSet *)self->super._keys removeObjectsAtIndexes:v6];
    goto LABEL_14;
  }
  if (v5)
  {
    id v6 = [v4 firstObject];
    [(HMFMutableOrderedDictionary *)self removeObjectForKey:v6];
LABEL_14:
  }
}

- (void)setOrderedDictionary:(id)a3
{
  objects = self->super._objects;
  uint64_t v5 = *((void *)a3 + 1);
  id v6 = a3;
  [(NSArray *)objects setArray:v5];
  [(NSOrderedSet *)self->super._keys removeAllObjects];
  keys = self->super._keys;
  uint64_t v8 = v6[2];

  [(NSOrderedSet *)keys unionOrderedSet:v8];
}

- (void)setBySortingDictionary:(id)a3
{
}

- (void)setBySortingDictionary:(id)a3 keyComparator:(id)a4
{
  id v7 = 0;
  uint64_t v8 = 0;
  sortKeysAndValuesOfDictionary(a3, a4, &v8, &v7);
  uint64_t v5 = v7;
  [(NSArray *)self->super._objects setArray:v7];
  [(NSOrderedSet *)self->super._keys removeAllObjects];
  id v6 = v8;
  -[NSOrderedSet addObjectsFromArray:](self->super._keys, "addObjectsFromArray:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMFOrderedDictionary alloc];
  uint64_t v5 = (void *)[(NSArray *)self->super._objects copy];
  id v6 = (void *)[(NSOrderedSet *)self->super._keys copy];
  id v7 = [(HMFOrderedDictionary *)v4 initWithObjects:v5 orderedKeySet:v6];

  return v7;
}

@end
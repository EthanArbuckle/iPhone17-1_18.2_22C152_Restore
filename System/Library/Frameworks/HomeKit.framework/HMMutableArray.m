@interface HMMutableArray
+ (HMMutableArray)arrayWithArray:(id)a3;
+ (id)array;
- (BOOL)addObjectIfNotPresent:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMMutableArray)initWithArray:(id)a3;
- (NSArray)array;
- (NSMutableArray)internal;
- (id)filteredArrayUsingPredicate:(id)a3;
- (id)firstItemWithCharacteristicType:(id)a3;
- (id)firstItemWithInstanceID:(id)a3;
- (id)firstItemWithName:(id)a3;
- (id)firstItemWithUUID:(id)a3;
- (id)firstItemWithUniqueIdentifier:(id)a3;
- (id)firstItemWithValue:(id)a3 forKey:(id)a4;
- (id)itemsWithValue:(id)a3 forKey:(id)a4;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)replaceObject:(id)a3;
- (void)setArray:(id)a3;
- (void)setIfDifferent:(id)a3;
@end

@implementation HMMutableArray

- (NSArray)array
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(HMMutableArray *)self internal];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (NSMutableArray)internal
{
  return self->_internal;
}

- (void)setArray:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMMutableArray *)self internal];
  if (v6) {
    [v5 setArray:v6];
  }
  else {
    [v5 removeAllObjects];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)addObjectsFromArray:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    v5 = [(HMMutableArray *)self internal];
    [v5 addObjectsFromArray:v6];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)firstItemWithUUID:(id)a3
{
  return [(HMMutableArray *)self firstItemWithValue:a3 forKey:@"uuid"];
}

- (id)firstItemWithValue:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = [(HMMutableArray *)self internal];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 valueForKeyPath:v7];
        char v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v16 = v13;

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = 0;
LABEL_11:
  os_unfair_lock_unlock(p_lock);

  return v16;
}

+ (id)array
{
  v2 = [HMMutableArray alloc];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMMutableArray *)v2 initWithArray:v3];

  return v4;
}

- (HMMutableArray)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMutableArray;
  v5 = [(HMMutableArray *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    }
    internal = v5->_internal;
    v5->_internal = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)removeObjectsInArray:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMMutableArray *)self internal];
  [v5 removeObjectsInArray:v6];

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMMutableArray *)self internal];
  unint64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMutableArray *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(HMMutableArray *)self array];
      id v7 = [(HMMutableArray *)v5 array];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMMutableArray *)self internal];
  char v7 = [v6 containsObject:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)setIfDifferent:(id)a3
{
  id v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(HMMutableArray *)self internal];
  char v7 = [v5 setWithArray:v6];

  if (([v7 isEqualToSet:v10] & 1) == 0)
  {
    char v8 = [(HMMutableArray *)self internal];
    objc_super v9 = [v10 allObjects];
    [v8 setArray:v9];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)itemsWithValue:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v9 = [(HMMutableArray *)self internal];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 valueForKeyPath:v7];
        int v15 = [v14 isEqual:v6];

        if (v15) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);

  return v8;
}

- (id)filteredArrayUsingPredicate:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMMutableArray *)self internal];
  id v7 = [v6 filteredArrayUsingPredicate:v4];

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)addObjectIfNotPresent:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMMutableArray *)self internal];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    char v8 = [(HMMutableArray *)self internal];
    [v8 addObject:v4];
  }
  os_unfair_lock_unlock(p_lock);

  return v7 ^ 1;
}

- (void)addObject:(id)a3
{
  id v6 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HMMutableArray *)self internal];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllObjects
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMMutableArray *)self internal];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v6 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HMMutableArray *)self internal];
  [v5 removeObjectsAtIndexes:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObject:(id)a3
{
  id v6 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HMMutableArray *)self internal];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)replaceObject:(id)a3
{
  id v7 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HMMutableArray *)self internal];
  [v5 removeObject:v7];

  id v6 = [(HMMutableArray *)self internal];
  [v6 addObject:v7];

  os_unfair_lock_unlock(p_lock);
}

+ (HMMutableArray)arrayWithArray:(id)a3
{
  id v3 = a3;
  id v4 = [[HMMutableArray alloc] initWithArray:v3];

  return v4;
}

- (id)firstItemWithCharacteristicType:(id)a3
{
  return [(HMMutableArray *)self firstItemWithValue:a3 forKey:@"characteristicType"];
}

- (id)firstItemWithInstanceID:(id)a3
{
  return [(HMMutableArray *)self firstItemWithValue:a3 forKey:@"instanceID"];
}

- (id)firstItemWithUniqueIdentifier:(id)a3
{
  return [(HMMutableArray *)self firstItemWithValue:a3 forKey:@"uniqueIdentifier"];
}

- (id)firstItemWithName:(id)a3
{
  return [(HMMutableArray *)self firstItemWithValue:a3 forKey:@"name"];
}

@end
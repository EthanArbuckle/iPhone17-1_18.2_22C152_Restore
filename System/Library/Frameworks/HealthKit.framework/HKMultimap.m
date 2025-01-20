@interface HKMultimap
+ (id)multimapWithStrongObjects;
+ (id)multimapWithWeakObjects;
- (BOOL)isEqual:(id)a3;
- (HKMultimap)init;
- (HKMultimap)initWithType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectsForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)removeObject:(id)a3;
- (void)removeObject:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation HKMultimap

- (HKMultimap)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKMultimap;
  v4 = [(HKMultimap *)&v8 init];
  if (v4)
  {
    if (a3 == 1) {
      [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    }
    else {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    }
    table = v4->_table;
    v4->_table = (NSMapTable *)v5;
  }
  return v4;
}

- (HKMultimap)init
{
  return [(HKMultimap *)self initWithType:0];
}

+ (id)multimapWithWeakObjects
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:1];

  return v2;
}

+ (id)multimapWithStrongObjects
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:0];

  return v2;
}

- (unint64_t)count
{
  v2 = [(NSMapTable *)self->_table objectEnumerator];
  v3 = [v2 allObjects];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = -[_HKMappingKey initWithObject:andKey:]((id *)[_HKMappingKey alloc], v7, v6);

  [(NSMapTable *)self->_table setObject:v7 forKey:v8];
}

- (void)removeObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_table keyEnumerator];
  id v6 = [v5 allObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[_HKMappingKey objectMatches:](v12, v4)) {
          -[NSMapTable removeObjectForKey:](self->_table, "removeObjectForKey:", v12, (void)v13);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)removeObjectsForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_table keyEnumerator];
  id v6 = [v5 allObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
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
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        if (v12 && objc_msgSend(*(id *)(v12 + 16), "isEqual:", v4, (void)v13)) {
          [(NSMapTable *)self->_table removeObjectForKey:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[_HKMappingKey initWithObject:andKey:]((id *)[_HKMappingKey alloc], v7, v6);

  [(NSMapTable *)self->_table removeObjectForKey:v8];
}

- (id)objectsForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMapTable *)self->_table keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && [*(id *)(v11 + 16) isEqual:v4])
        {
          uint64_t v12 = [(NSMapTable *)self->_table objectForKey:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMultimap *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    id v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()]) {
      char v6 = [(NSMapTable *)self->_table isEqual:v4->_table];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMapTable *)self->_table hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[HKMultimap alloc] initWithType:0];
  uint64_t v6 = [(NSMapTable *)self->_table copyWithZone:a3];
  table = v5->_table;
  v5->_table = (NSMapTable *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end
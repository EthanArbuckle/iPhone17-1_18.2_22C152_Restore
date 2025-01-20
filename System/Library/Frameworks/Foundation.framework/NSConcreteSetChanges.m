@interface NSConcreteSetChanges
- (NSConcreteSetChanges)init;
- (NSConcreteSetChanges)initWithCapacity:(unint64_t)a3;
- (NSConcreteSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (NSConcreteSetChanges)initWithSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)changeCount;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_fault;
- (void)_willChange;
- (void)addChange:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)filterObjectsWithTest:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)setSet:(id)a3;
- (void)transformObjectsWithBlock:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSConcreteSetChanges

- (unint64_t)count
{
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;

  return [(NSSet *)backing count];
}

- (id)member:(id)a3
{
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;

  return [(NSSet *)backing member:a3];
}

- (id)objectEnumerator
{
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;

  return [(NSSet *)backing objectEnumerator];
}

- (NSConcreteSetChanges)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];

  return [(NSConcreteSetChanges *)self initWithSet:v3];
}

- (NSConcreteSetChanges)initWithCapacity:(unint64_t)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);

  return [(NSConcreteSetChanges *)self initWithSet:v4];
}

- (NSConcreteSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObjects:a3 count:a4];

  return [(NSConcreteSetChanges *)self initWithSet:v5];
}

- (NSConcreteSetChanges)initWithSet:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteSetChanges;
  uint64_t v4 = [(NSConcreteSetChanges *)&v6 init];
  if (v4) {
    v4->_backing = (NSSet *)[a3 copy];
  }
  return v4;
}

- (void)_willChange
{
  if (!self->_changes) {
    self->_changes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
}

- (void)addChange:(id)a3
{
  [(NSConcreteSetChanges *)self _willChange];
  [(NSConcreteSetChanges *)self willChangeValueForKey:@"changeCount"];
  [(NSMutableArray *)self->_changes addObject:a3];

  [(NSConcreteSetChanges *)self didChangeValueForKey:@"changeCount"];
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [(NSSetChanges *)self addObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;

  return [(NSSet *)backing countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)intersectSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSConcreteSetChanges *)self _willChange];
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSSet *)backing countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(backing);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (![a3 member:v10])
        {
          long long v11 = [[NSSetChange alloc] initWithType:3 object:v10];
          [(NSConcreteSetChanges *)self addChange:v11];
        }
      }
      uint64_t v7 = [(NSSet *)backing countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v7);
  }
}

- (void)setSet:(id)a3
{
  [(NSConcreteSetChanges *)self removeAllObjects];

  [(NSConcreteSetChanges *)self unionSet:a3];
}

- (void)minusSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSConcreteSetChanges *)self _willChange];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = [[NSSetChange alloc] initWithType:3 object:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [(NSConcreteSetChanges *)self addChange:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (void)removeAllObjects
{
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  backing = self->_backing;

  [(NSConcreteSetChanges *)self minusSet:backing];
}

- (void)unionSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSConcreteSetChanges *)self _willChange];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = [[NSSetChange alloc] initWithType:2 object:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [(NSConcreteSetChanges *)self addChange:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (void)filterObjectsWithTest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  char v11 = 0;
  backing = self->_backing;
  uint64_t v6 = [(NSSet *)backing countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(backing);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      if (((*((uint64_t (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v11) & 1) == 0) {
        [(NSSetChanges *)self removeObject:v10];
      }
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSSet *)backing countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v7) {
          goto LABEL_5;
        }
        return;
      }
    }
  }
}

- (void)transformObjectsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (self->_changes) {
    [(NSConcreteSetChanges *)self _fault];
  }
  char v13 = 0;
  backing = self->_backing;
  uint64_t v6 = [(NSSet *)backing countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(backing);
      }
      uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
      uint64_t v11 = (*((uint64_t (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v13);
      if (v11 != v10)
      {
        uint64_t v12 = v11;
        [(NSSetChanges *)self removeObject:v10];
        [(NSSetChanges *)self addObject:v12];
      }
      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSSet *)backing countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v7) {
          goto LABEL_5;
        }
        return;
      }
    }
  }
}

- (unint64_t)changeCount
{
  return [(NSMutableArray *)self->_changes count];
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  changes = self->_changes;
  uint64_t v5 = [(NSMutableArray *)changes countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(changes);
      }
      (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * v8), &v9);
      if (v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)changes countByEnumeratingWithState:&v11 objects:v10 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v12 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  changes = self->_changes;
  uint64_t v7 = [(NSMutableArray *)changes countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(changes);
      }
      long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      if ([v11 changeType] == a3) {
        (*((void (**)(id, void *, char *))a4 + 2))(a4, v11, &v12);
      }
      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)changes countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v8) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[NSConcreteSetChanges alloc] initWithSet:self->_backing];
  v4->_changes = (NSMutableArray *)[(NSMutableArray *)self->_changes mutableCopy];
  return v4;
}

- (void)_fault
{
  if (self->_changes)
  {
    if (!self->_backingIsMutable)
    {
      backing = self->_backing;
      self->_backing = (NSSet *)[(NSSet *)backing mutableCopy];

      self->_backingIsMutable = 1;
    }
    uint64_t v4 = self->_backing;
    [(NSSetChanges *)self applyChangesToSet:v4];
  }
}

- (id)description
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSString *)[NSMutableString alloc] initWithFormat:@"NSSetChanges(%p) with base %@, and changes:", self, self->_backing];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NSConcreteSetChanges_description__block_invoke;
  v5[3] = &unk_1E51FA900;
  v5[4] = v3;
  [(NSConcreteSetChanges *)self enumerateChangesUsingBlock:v5];
  return v3;
}

uint64_t __35__NSConcreteSetChanges_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if ([a2 changeType] == 2) {
    uint64_t v4 = @"added";
  }
  else {
    uint64_t v4 = @"removed";
  }
  return [v3 appendFormat:@"\n\t%@ %@", v4, objc_msgSend(a2, "value")];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteSetChanges;
  [(NSConcreteSetChanges *)&v3 dealloc];
}

@end
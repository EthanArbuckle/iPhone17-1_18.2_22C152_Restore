@interface CNMutableMultiDictionary
- (id)copyWithZone:(_NSZone *)a3;
- (void)addNonNilObject:(id)a3 forKey:(id)a4;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)removeObject:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
- (void)setObjects:(id)a3 forKey:(id)a4;
@end

@implementation CNMutableMultiDictionary

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNMultiDictionary *)self objectsForKey:v6];
  id v9 = [v8 arrayByAddingObject:v7];

  [(NSMutableDictionary *)self->super._entries setObject:v9 forKey:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNMultiDictionary alloc];
  entries = self->super._entries;

  return [(CNMultiDictionary *)v4 initWithEntries:entries];
}

- (void)setObjects:(id)a3 forKey:(id)a4
{
}

- (void)addNonNilObject:(id)a3 forKey:(id)a4
{
  if (a3) {
    [(CNMutableMultiDictionary *)self addObject:a3 forKey:a4];
  }
}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNMultiDictionary *)self objectsForKey:v7];
  id v9 = (void *)[v8 mutableCopy];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CNMutableMultiDictionary_removeObject_forKey___block_invoke;
  v14[3] = &unk_1E569FA50;
  id v10 = v6;
  id v15 = v10;
  v11 = [v9 indexesOfObjectsPassingTest:v14];
  [v9 removeObjectsAtIndexes:v11];
  uint64_t v12 = [v9 count];
  entries = self->super._entries;
  if (v12) {
    [(NSMutableDictionary *)entries setObject:v9 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)entries removeObjectForKey:v7];
  }
}

uint64_t __48__CNMutableMultiDictionary_removeObject_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

- (void)removeObjectsForKey:(id)a3
{
}

@end
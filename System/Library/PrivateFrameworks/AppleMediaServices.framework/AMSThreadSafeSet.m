@interface AMSThreadSafeSet
- (AMSThreadSafeObject)backingSet;
- (AMSThreadSafeSet)init;
- (BOOL)containsObject:(id)a3;
- (NSArray)allObjects;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)setBackingSet:(id)a3;
@end

@implementation AMSThreadSafeSet

- (void)removeObject:(id)a3
{
  id v4 = a3;
  v5 = [(AMSThreadSafeSet *)self backingSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__AMSThreadSafeSet_removeObject___block_invoke;
  v7[3] = &unk_1E55A71D0;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  v5 = [(AMSThreadSafeSet *)self backingSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__AMSThreadSafeSet_addObject___block_invoke;
  v7[3] = &unk_1E55A71D0;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

- (AMSThreadSafeObject)backingSet
{
  return self->_backingSet;
}

id __30__AMSThreadSafeSet_addObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addObject:*(void *)(a1 + 32)];
  return v3;
}

id __33__AMSThreadSafeSet_removeObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeObject:*(void *)(a1 + 32)];
  return v3;
}

- (AMSThreadSafeSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSThreadSafeSet;
  v2 = [(AMSThreadSafeSet *)&v8 init];
  if (v2)
  {
    id v3 = [AMSThreadSafeObject alloc];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = [(AMSThreadSafeObject *)v3 initWithObject:v4];
    backingSet = v2->_backingSet;
    v2->_backingSet = (AMSThreadSafeObject *)v5;
  }
  return v2;
}

- (NSArray)allObjects
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__68;
  v10 = __Block_byref_object_dispose__68;
  id v11 = (id)MEMORY[0x1E4F1CBF0];
  v2 = [(AMSThreadSafeSet *)self backingSet];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AMSThreadSafeSet_allObjects__block_invoke;
  v5[3] = &unk_1E55A71A8;
  v5[4] = &v6;
  [v2 read:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __30__AMSThreadSafeSet_allObjects__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 allObjects];
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(AMSThreadSafeSet *)self backingSet];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__AMSThreadSafeSet_count__block_invoke;
  v5[3] = &unk_1E55A71A8;
  v5[4] = &v6;
  [v2 read:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__AMSThreadSafeSet_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(AMSThreadSafeSet *)self backingSet];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__AMSThreadSafeSet_containsObject___block_invoke;
  v8[3] = &unk_1E55A71F8;
  v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 read:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __35__AMSThreadSafeSet_containsObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setBackingSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface AMSThreadSafeDictionary
- (AMSThreadSafeDictionary)init;
- (AMSThreadSafeObject)backingDictionary;
- (NSArray)allKeys;
- (NSArray)allValues;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)readWrite:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setBackingDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation AMSThreadSafeDictionary

- (NSArray)allKeys
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  v2 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AMSThreadSafeDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E55A70E8;
  v5[4] = &v6;
  [v2 read:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (AMSThreadSafeObject)backingDictionary
{
  return self->_backingDictionary;
}

uint64_t __34__AMSThreadSafeDictionary_allKeys__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 allKeys];
  return MEMORY[0x1F41817F8]();
}

uint64_t __51__AMSThreadSafeDictionary_objectForKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  v5 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AMSThreadSafeDictionary_objectForKeyedSubscript___block_invoke;
  v9[3] = &unk_1E559E440;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 read:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

id __55__AMSThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 40)];
  return v3;
}

- (AMSThreadSafeDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSThreadSafeDictionary;
  v2 = [(AMSThreadSafeDictionary *)&v8 init];
  if (v2)
  {
    id v3 = [AMSThreadSafeObject alloc];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [(AMSThreadSafeObject *)v3 initWithObject:v4];
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (AMSThreadSafeObject *)v5;
  }
  return v2;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AMSThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke;
  v11[3] = &unk_1E55A7180;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 readWrite:v11];
}

- (NSArray)allValues
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__67;
  id v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  v2 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AMSThreadSafeDictionary_allValues__block_invoke;
  v5[3] = &unk_1E55A70E8;
  v5[4] = &v6;
  [v2 read:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __36__AMSThreadSafeDictionary_allValues__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 allValues];
  return MEMORY[0x1F41817F8]();
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  uint64_t v5 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AMSThreadSafeDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E559E440;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 read:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __40__AMSThreadSafeDictionary_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (void)readWrite:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AMSThreadSafeDictionary_readWrite___block_invoke;
  v7[3] = &unk_1E55A7110;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

id __37__AMSThreadSafeDictionary_readWrite___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  v3(v2, v4);
  uint64_t v5 = (void *)[v4 mutableCopy];

  return v5;
}

- (void)removeAllObjects
{
  id v2 = [(AMSThreadSafeDictionary *)self backingDictionary];
  [v2 readWrite:&__block_literal_global_129];
}

id __43__AMSThreadSafeDictionary_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 removeAllObjects];
  return v2;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AMSThreadSafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E55A7158;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

id __46__AMSThreadSafeDictionary_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSThreadSafeDictionary *)self backingDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__AMSThreadSafeDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E55A7180;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 readWrite:v11];
}

id __44__AMSThreadSafeDictionary_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  return v3;
}

- (void)setBackingDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
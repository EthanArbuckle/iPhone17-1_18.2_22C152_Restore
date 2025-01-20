@interface AFBDictionary
- (AFBDictionary)initWithBufRef:(id)a3 count:(unint64_t)a4 keyClass:(Class)a5 keyAtIndex:(id)a6 tableAtIndex:(id)a7 objectForValidKey:(id)a8;
- (AFBDictionary)initWithCoder:(id)a3;
- (AFBDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (BOOL)isEqualToDictionary:(id)a3;
- (id)allKeys;
- (id)allKeysForObject:(id)a3;
- (id)allValues;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)keyAtIndex:(void *)a1;
@end

@implementation AFBDictionary

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (*((void (**)(void))self->_objectForValidKey + 2))();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AFBDictionary)initWithBufRef:(id)a3 count:(unint64_t)a4 keyClass:(Class)a5 keyAtIndex:(id)a6 tableAtIndex:(id)a7 objectForValidKey:(id)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)AFBDictionary;
  v19 = [(AFBDictionary *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bufRef, a3);
    v20->_count = a4;
    v20->_keyClass = a5;
    uint64_t v21 = MEMORY[0x230F71680](v16);
    id keyAtIndex = v20->_keyAtIndex;
    v20->_id keyAtIndex = (id)v21;

    uint64_t v23 = MEMORY[0x230F71680](v17);
    id tableAtIndex = v20->_tableAtIndex;
    v20->_id tableAtIndex = (id)v23;

    uint64_t v25 = MEMORY[0x230F71680](v18);
    id objectForValidKey = v20->_objectForValidKey;
    v20->_id objectForValidKey = (id)v25;
  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectForValidKey, 0);
  objc_storeStrong(&self->_tableAtIndex, 0);
  objc_storeStrong(&self->_keyAtIndex, 0);
  objc_storeStrong((id *)&self->_bufRef, 0);
}

- (AFBDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v6 = (AFBDictionary *)[objc_alloc(NSDictionary) initWithObjects:a3 forKeys:a4 count:a5];

  return v6;
}

- (AFBDictionary)initWithCoder:(id)a3
{
  result = (AFBDictionary *)a3;
  __break(1u);
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyEnumerator
{
  v2 = [[AFBDictionaryEnumerator alloc] initWithDictionary:self];
  return v2;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v5 = (void (**)(id, void *, void *, unsigned char *))a4;
  if (self->_count)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x230F71520]();
      unsigned __int8 v10 = 0;
      v8 = (*((void (**)(void))self->_keyAtIndex + 2))();
      v9 = (*((void (**)(void))self->_tableAtIndex + 2))();
      v5[2](v5, v8, v9, &v10);

      LODWORD(v8) = v10;
      if (v8) {
        break;
      }
      ++v6;
    }
    while (v6 < self->_count);
  }
}

- (id)allKeys
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__AFBDictionary_allKeys__block_invoke;
  v7[3] = &unk_26492B4B0;
  id v8 = v3;
  id v4 = v3;
  [(AFBDictionary *)self enumerateKeysAndObjectsUsingBlock:v7];
  v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __24__AFBDictionary_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allValues
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__AFBDictionary_allValues__block_invoke;
  v7[3] = &unk_26492B4B0;
  id v8 = v3;
  id v4 = v3;
  [(AFBDictionary *)self enumerateKeysAndObjectsUsingBlock:v7];
  v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __26__AFBDictionary_allValues__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)allKeysForObject:(id)a3
{
  id v4 = a3;
  if (v4 && self->_count)
  {
    v5 = objc_opt_new();
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __34__AFBDictionary_allKeysForObject___block_invoke;
    v12 = &unk_26492B4D8;
    id v13 = v4;
    id v14 = v5;
    id v6 = v5;
    [(AFBDictionary *)self enumerateKeysAndObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

void __34__AFBDictionary_allKeysForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isEqual:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)isEqualToDictionary:(id)a3
{
  id v4 = (AFBDictionary *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (uint64_t v6 = [(AFBDictionary *)v4 count], v6 == [(AFBDictionary *)self count]))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v5;
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__AFBDictionary_isEqualToDictionary___block_invoke;
      v14[3] = &unk_26492B500;
      id v8 = v7;
      id v15 = v8;
      id v16 = v18;
      id v17 = &v19;
      [(AFBDictionary *)self enumerateKeysAndObjectsUsingBlock:v14];
      BOOL v9 = *((unsigned char *)v20 + 24) != 0;

      _Block_object_dispose(v18, 8);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __37__AFBDictionary_isEqualToDictionary___block_invoke_2;
      v11[3] = &unk_26492B528;
      v12 = v5;
      id v13 = &v19;
      [(AFBDictionary *)self enumerateKeysAndObjectsUsingBlock:v11];
      BOOL v9 = *((unsigned char *)v20 + 24) != 0;

      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __37__AFBDictionary_isEqualToDictionary___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(a1[4] + 40);
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  id v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  id v9 = a3;
  uint64_t v10 = v8(v6, v7);
  LOBYTE(v7) = [v9 isEqual:v10];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
}

void __37__AFBDictionary_isEqualToDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v7 || ([v8 isEqual:v7] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)keyAtIndex:(void *)a1
{
  if (a1)
  {
    a1 = (*(void (**)(void))(a1[4] + 16))();
    uint64_t v1 = vars8;
  }
  return a1;
}

@end
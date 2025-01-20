@interface CNOrderedDictionary
+ (id)dictionaryWithObject:(id)a3 forKey:(id)a4;
+ (id)orderedDictionary;
- (BOOL)isEqual:(id)a3;
- (CNOrderedDictionary)init;
- (NSArray)allKeys;
- (NSArray)allObjects;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)forEach:(id)a3;
@end

@implementation CNOrderedDictionary

+ (id)orderedDictionary
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)dictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(CNMutableOrderedDictionary);
  [(CNMutableOrderedDictionary *)v7 setObject:v6 forKeyedSubscript:v5];

  return v7;
}

- (CNOrderedDictionary)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNOrderedDictionary;
  id v2 = [(CNOrderedDictionary *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedKeys = v2->_orderedKeys;
    v2->_orderedKeys = v5;

    v7 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
}

- (NSArray)allKeys
{
  id v2 = (void *)[(NSMutableArray *)self->_orderedKeys copy];

  return (NSArray *)v2;
}

- (NSArray)allObjects
{
  orderedKeys = self->_orderedKeys;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CNOrderedDictionary_allObjects__block_invoke;
  v5[3] = &unk_1E56A0150;
  v5[4] = self;
  v3 = [(NSMutableArray *)orderedKeys _cn_map:v5];

  return (NSArray *)v3;
}

uint64_t __33__CNOrderedDictionary_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
}

- (void)forEach:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self;
  uint64_t v6 = [(CNOrderedDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_dictionary, "objectForKeyedSubscript:", v10, (void)v12);
        v4[2](v4, v10, v11);
      }
      uint64_t v7 = [(CNOrderedDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_orderedKeys countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNMutableOrderedDictionary alloc];
  dictionary = self->_dictionary;
  orderedKeys = self->_orderedKeys;

  return [(CNMutableOrderedDictionary *)v4 initWithDictionary:dictionary orderedKeys:orderedKeys];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__CNOrderedDictionary_isEqual___block_invoke;
  v15[3] = &unk_1E56A0218;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __31__CNOrderedDictionary_isEqual___block_invoke_2;
  long long v12 = &unk_1E56A0218;
  long long v13 = self;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = _Block_copy(&aBlock);
  LOBYTE(self) = +[CNEqualsBuilder isObject:kindOfClass:andEqualToObject:withBlocks:](CNEqualsBuilder, "isObject:kindOfClass:andEqualToObject:withBlocks:", v6, v5, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

BOOL __31__CNOrderedDictionary_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 8) equalToOther:*(void *)(*(void *)(a1 + 40) + 8)];
}

BOOL __31__CNOrderedDictionary_isEqual___block_invoke_2(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 16) equalToOther:*(void *)(*(void *)(a1 + 40) + 16)];
}

- (unint64_t)hash
{
  aBlock[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__CNOrderedDictionary_hash__block_invoke;
  v6[3] = &unk_1E56A0070;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNOrderedDictionary_hash__block_invoke_2;
  aBlock[3] = &unk_1E56A0070;
  id v2 = _Block_copy(aBlock);
  unint64_t v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __27__CNOrderedDictionary_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 8)];
}

unint64_t __27__CNOrderedDictionary_hash__block_invoke_2(uint64_t a1)
{
  return +[CNHashBuilder arrayHash:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (id)description
{
  unint64_t v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"Dictionary", self->_dictionary, 0);
  id v5 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"Ordered Keys", self->_orderedKeys, 0);
  id v6 = [v3 build];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
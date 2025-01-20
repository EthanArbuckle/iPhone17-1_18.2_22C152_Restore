@interface CNMultiDictionary
+ (id)multiDictionary;
+ (id)multiDictionaryWithEntries:(id)a3;
+ (id)multiDictionaryWithObject:(id)a3 forKey:(id)a4;
- (BOOL)containsKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNMultiDictionary)init;
- (CNMultiDictionary)initWithEntries:(id)a3;
- (NSArray)allKeys;
- (NSDictionary)dictionaryRepresentation;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectsForKey:(id)a3;
- (id)objectsForKeys:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)eachObject:(id)a3;
@end

@implementation CNMultiDictionary

uint64_t __26__CNMultiDictionary_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)objectsForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_entries objectForKey:a3];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1C978] array];
  }

  return v3;
}

+ (id)multiDictionary
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    if (multiDictionary_cn_once_token_1 != -1) {
      dispatch_once(&multiDictionary_cn_once_token_1, &__block_literal_global_54);
    }
    id v4 = (id)multiDictionary_cn_once_object_1;
  }
  else
  {
    id v4 = objc_alloc_init((Class)a1);
  }

  return v4;
}

- (CNMultiDictionary)init
{
  return [(CNMultiDictionary *)self initWithEntries:MEMORY[0x1E4F1CC08]];
}

- (CNMultiDictionary)initWithEntries:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiDictionary;
  v5 = [(CNMultiDictionary *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  entries = self->_entries;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__CNMultiDictionary_count__block_invoke;
  v5[3] = &unk_1E56A1780;
  v5[4] = &v6;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__CNMultiDictionary_multiDictionary__block_invoke()
{
  v0 = objc_alloc_init(CNMultiDictionary);
  uint64_t v1 = multiDictionary_cn_once_object_1;
  multiDictionary_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)multiDictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(CNMutableMultiDictionary);
  [(CNMutableMultiDictionary *)v7 addObject:v6 forKey:v5];

  return v7;
}

+ (id)multiDictionaryWithEntries:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithEntries:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CNMutableMultiDictionary alloc];
  entries = self->_entries;

  return [(CNMultiDictionary *)v4 initWithEntries:entries];
}

- (NSArray)allKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_entries allKeys];
}

- (id)objectsForKeys:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CNMultiDictionary_objectsForKeys___block_invoke;
  v6[3] = &unk_1E56A0150;
  v6[4] = self;
  unint64_t v3 = objc_msgSend(a3, "_cn_map:", v6);
  id v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_7_2);

  return v4;
}

id __36__CNMultiDictionary_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsKey:v3])
  {
    id v4 = [*(id *)(a1 + 32) objectsForKey:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)containsKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_entries objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)eachObject:(id)a3
{
  id v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CNMultiDictionary_eachObject___block_invoke;
  v7[3] = &unk_1E56A17A8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v7];
}

void __32__CNMultiDictionary_eachObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__CNMultiDictionary_eachObject___block_invoke_2;
  v8[3] = &unk_1E569F818;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateObjectsUsingBlock:v8];
}

uint64_t __32__CNMultiDictionary_eachObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_entries copy];

  return (NSDictionary *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__CNMultiDictionary_isEqual___block_invoke;
  v8[3] = &unk_1E56A0218;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = +[CNEqualsBuilder isObject:kindOfClass:andEqualToObject:withBlocks:](CNEqualsBuilder, "isObject:kindOfClass:andEqualToObject:withBlocks:", v6, v5, self, v8, 0);

  return (char)self;
}

BOOL __29__CNMultiDictionary_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 8) equalToOther:*(void *)(*(void *)(a1 + 40) + 8)];
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__CNMultiDictionary_hash__block_invoke;
  v3[3] = &unk_1E56A0070;
  v3[4] = self;
  return +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v3, 0);
}

unint64_t __25__CNMultiDictionary_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (id)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"entries", self->_entries, 0);
  uint64_t v5 = [v3 build];

  return v5;
}

- (void).cxx_destruct
{
}

@end
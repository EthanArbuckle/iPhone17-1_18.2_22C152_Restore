@interface AFDataStore
- (AFDataStore)init;
- (AFDataStore)initWithEntries:(id)a3;
- (AFDataStore)initWithPropertyListRepresentation:(id)a3;
- (id)imageDataForKey:(id)a3;
- (id)propertyListRepresentation;
- (void)setImageData:(id)a3 forKey:(id)a4;
@end

@implementation AFDataStore

- (void).cxx_destruct
{
}

- (AFDataStore)initWithPropertyListRepresentation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  v6 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Version"];

  v7 = +[AFCoercion coercionWithBlock:&__block_literal_global_17516];
  [(AFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Entries"];

  id v20 = 0;
  v8 = [(AFDictionarySchema *)v5 coerceObject:v4 error:&v20];
  id v9 = v20;
  if (!v8)
  {
    uint64_t v14 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFDataStore initWithPropertyListRepresentation:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v4;
    __int16 v25 = 2114;
    id v26 = v9;
    v15 = "%s returning nil; passed invalid property list (%@): %{public}@";
    v16 = v14;
    uint32_t v17 = 32;
LABEL_10:
    _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_7;
  }
  v10 = [v8 objectForKey:@"Version"];
  uint64_t v11 = [v10 integerValue];

  if (v11 != 1)
  {
    uint64_t v18 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    v22 = "-[AFDataStore initWithPropertyListRepresentation:]";
    __int16 v23 = 2050;
    uint64_t v24 = v11;
    v15 = "%s unable to deserialize property list with version %{public}ld; returning nil";
    v16 = v18;
    uint32_t v17 = 22;
    goto LABEL_10;
  }
  v12 = [v8 objectForKey:@"Entries"];
  self = [(AFDataStore *)self initWithEntries:v12];

  v13 = self;
LABEL_8:

  return v13;
}

id __50__AFDataStore_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v20 = 0;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__17523;
  uint64_t v24 = __Block_byref_object_dispose__17524;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint32_t v17 = __Block_byref_object_copy__17523;
  uint64_t v18 = __Block_byref_object_dispose__17524;
  id v19 = 0;
  v5 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  v6 = v21;
  id obj = v21[5];
  v7 = [v5 coerceObject:v4 error:&obj];
  objc_storeStrong(v6 + 5, obj);

  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    id v9 = (void *)v15[5];
    v15[5] = v8;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__AFDataStore_initWithPropertyListRepresentation___block_invoke_30;
    v12[3] = &unk_1E5927A00;
    v12[4] = &v20;
    v12[5] = &v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
  }
  if (a3) {
    *a3 = v21[5];
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __50__AFDataStore_initWithPropertyListRepresentation___block_invoke_30(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v14 = 0;
  id v9 = [[_AFDataStoreEntry alloc] initWithPropertyListRepresentation:v8 error:&v14];

  id v10 = v14;
  id v11 = v14;
  if (v9)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKey:v7];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1EEE97100 forKey:@"Version"];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
  entries = self->_entries;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AFDataStore_propertyListRepresentation__block_invoke;
  v8[3] = &unk_1E59279B8;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v8];
  [v3 setObject:v6 forKey:@"Entries"];

  return v3;
}

void __41__AFDataStore_propertyListRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 propertyListRepresentation];
  [v4 setObject:v6 forKey:v5];
}

- (id)imageDataForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_entries objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 type] == 1)
    {
      id v7 = [v6 value];
      goto LABEL_7;
    }
    id v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      id v10 = v8;
      id v11 = [v6 value];
      int v12 = 136315650;
      v13 = "-[AFDataStore imageDataForKey:]";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      uint32_t v17 = v11;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s returning nil because value for key \"%@\" is %@, which cannot be coerced to an image", (uint8_t *)&v12, 0x20u);
    }
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (void)setImageData:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_AFDataStoreEntry alloc] initWithType:1 value:v7];

  [(NSMutableDictionary *)self->_entries setObject:v8 forKey:v6];
}

- (AFDataStore)init
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AFDataStore *)self initWithEntries:v3];

  return v4;
}

- (AFDataStore)initWithEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFDataStore;
  id v5 = [(AFDataStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;
  }
  return v5;
}

@end
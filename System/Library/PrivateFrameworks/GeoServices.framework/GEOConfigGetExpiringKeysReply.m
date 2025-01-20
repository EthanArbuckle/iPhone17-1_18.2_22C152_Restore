@interface GEOConfigGetExpiringKeysReply
- (BOOL)isValid;
- (GEOConfigGetExpiringKeysReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)expiringKeys;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setExpiringKeys:(id)a3;
@end

@implementation GEOConfigGetExpiringKeysReply

- (void).cxx_destruct
{
}

- (BOOL)isValid
{
  return 1;
}

- (GEOConfigGetExpiringKeysReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOConfigGetExpiringKeysReply;
  v7 = [(GEOXPCReply *)&v26 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "expiringKeys");
    size_t count = xpc_dictionary_get_count(v8);
    if (count)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:count];
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__103;
      v24 = __Block_byref_object_dispose__103;
      id v25 = 0;
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __61__GEOConfigGetExpiringKeysReply_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E53EA188;
      applier[4] = v8;
      v19 = &v20;
      id v11 = v10;
      id v18 = v11;
      xpc_dictionary_apply(v8, applier);
      if (a4)
      {
        v12 = (void *)v21[5];
        if (v12) {
          *a4 = v12;
        }
      }
      uint64_t v13 = [v11 count];
      if (v13) {
        v14 = (void *)[v11 copy];
      }
      else {
        v14 = (void *)MEMORY[0x1E4F1CC08];
      }
      objc_storeStrong((id *)&v7->_expiringKeys, v14);
      if (v13) {

      }
      _Block_object_dispose(&v20, 8);
    }

    v15 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigGetExpiringKeysReply;
  [(GEOXPCReply *)&v10 encodeToXPCDictionary:v4];
  if ([(NSDictionary *)self->_expiringKeys count])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    expiringKeys = self->_expiringKeys;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__GEOConfigGetExpiringKeysReply_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E53F66D8;
    id v7 = v5;
    id v9 = v7;
    [(NSDictionary *)expiringKeys enumerateKeysAndObjectsUsingBlock:v8];
    if (xpc_dictionary_get_count(v7)) {
      xpc_dictionary_set_value(v4, "expiringKeys", v7);
    }
  }
}

- (void)setExpiringKeys:(id)a3
{
}

- (NSDictionary)expiringKeys
{
  return self->_expiringKeys;
}

uint64_t __61__GEOConfigGetExpiringKeysReply_initWithXPCDictionary_error___block_invoke(uint64_t a1, const char *a2)
{
  id v4 = [NSString stringWithUTF8String:a2];
  size_t length = 0;
  data = xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 32), a2, &length);
  if (data)
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v9 + 40);
    objc_super v10 = [v7 unarchivedObjectOfClass:v8 fromData:v6 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    [*(id *)(a1 + 40) setObject:v10 forKey:v4];
  }
  return 1;
}

void __55__GEOConfigGetExpiringKeysReply_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_object_t v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = a2;
  id v7 = [v5 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = v6;
  objc_super v10 = (const char *)[v9 UTF8String];

  id v11 = v7;
  xpc_dictionary_set_data(v8, v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
}

@end
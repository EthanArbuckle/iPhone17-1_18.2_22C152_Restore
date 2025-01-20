@interface INSerializedCacheItem
+ (BOOL)supportsSecureCoding;
+ (void)deserializeCacheItem:(id)a3 completion:(id)a4;
+ (void)deserializeCacheItems:(id)a3 completion:(id)a4;
+ (void)serializeCacheableObjects:(id)a3 completion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (INSerializedCacheItem)init;
- (INSerializedCacheItem)initWithCoder:(id)a3;
- (INSerializedCacheItem)initWithType:(int64_t)a3 identifier:(id)a4 payload:(id)a5;
- (NSDictionary)payload;
- (NSString)identifier;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSerializedCacheItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)INSerializedCacheItem;
  v4 = [(INSerializedCacheItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {type = %zd, identifier = %@, payload = %@}", v4, self->_type, self->_identifier, self->_payload];

  return v5;
}

- (INSerializedCacheItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"payload"];

  v15 = [(INSerializedCacheItem *)self initWithType:v5 identifier:v6 payload:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_payload forKey:@"payload"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSerializedCacheItem *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v8 = 0;
      if (self->_type == v5->_type)
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          payload = self->_payload;
          if (payload == v5->_payload || -[NSDictionary isEqual:](payload, "isEqual:")) {
            BOOL v8 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  unint64_t v6 = v5 ^ [(NSDictionary *)self->_payload hash] ^ v4;

  return v6;
}

- (INSerializedCacheItem)initWithType:(int64_t)a3 identifier:(id)a4 payload:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INSerializedCacheItem;
  uint64_t v10 = [(INSerializedCacheItem *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_int64_t type = a3;
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v14;
  }
  return v11;
}

- (INSerializedCacheItem)init
{
  return [(INSerializedCacheItem *)self initWithType:0 identifier:0 payload:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)deserializeCacheItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [v5 type];
    if ((v7 == 1 || v7 == 2) && (uint64_t v8 = objc_opt_class()) != 0)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [v5 payload];
      uint64_t v11 = [v5 identifier];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__INSerializedCacheItem_deserializeCacheItem_completion___block_invoke;
      v12[3] = &unk_1E55198E8;
      id v13 = v6;
      [v9 buildFromCachePayload:v10 identifier:v11 completion:v12];
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void __57__INSerializedCacheItem_deserializeCacheItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_1EDBCF518]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

+ (void)deserializeCacheItems:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v7;
      *(_DWORD *)buf = 136315394;
      v22 = "+[INSerializedCacheItem deserializeCacheItems:completion:]";
      __int16 v23 = 2048;
      uint64_t v24 = [v5 count];
      _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Deserializing %tu serialized cache items...", buf, 0x16u);
    }
    dispatch_group_t v9 = dispatch_group_create();
    uint64_t v10 = INCacheableGetSerializationQueue();
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke;
    block[3] = &unk_1E551DC58;
    id v16 = v5;
    dispatch_group_t v17 = v9;
    id v18 = v11;
    id v19 = v10;
    id v20 = v6;
    uint64_t v12 = v10;
    id v13 = v11;
    uint64_t v14 = v9;
    dispatch_async(v12, block);
  }
}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * v5);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_2;
        v14[3] = &unk_1E55198C0;
        id v15 = *(id *)(a1 + 48);
        uint64_t v16 = v6;
        id v17 = *(id *)(a1 + 40);
        +[INSerializedCacheItem deserializeCacheItem:v6 completion:v14];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  uint64_t v7 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_7;
  block[3] = &unk_1E551DEF0;
  uint64_t v8 = *(NSObject **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 64);
  dispatch_group_notify(v8, v7, block);
}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315650;
      uint64_t v7 = "+[INSerializedCacheItem deserializeCacheItems:completion:]_block_invoke_2";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Deserialized %@ to %@", (uint8_t *)&v6, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 count];
    uint64_t v6 = [*(id *)(a1 + 40) count];
    int v9 = 136315650;
    __int16 v10 = "+[INSerializedCacheItem deserializeCacheItems:completion:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Deserialized %tu serialized cache items to %tu cacheable objects.", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  __int16 v8 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

+ (void)serializeCacheableObjects:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    dispatch_group_t v7 = dispatch_group_create();
    __int16 v8 = INCacheableGetSerializationQueue();
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke;
    block[3] = &unk_1E551DC58;
    id v14 = v5;
    dispatch_group_t v15 = v7;
    id v16 = v9;
    id v17 = v8;
    id v18 = v6;
    __int16 v10 = v8;
    id v11 = v9;
    uint64_t v12 = v7;
    dispatch_async(v10, block);
  }
}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_group_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        __int16 v8 = [v7 cacheIdentifier];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_2;
        v16[3] = &unk_1E5519898;
        v16[4] = v7;
        id v17 = v8;
        id v18 = *(id *)(a1 + 48);
        id v19 = *(id *)(a1 + 40);
        id v9 = v8;
        [v7 generateCachePayloadWithCompletion:v16];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  __int16 v10 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_4;
  block[3] = &unk_1E551DEF0;
  id v11 = *(NSObject **)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 64);
  dispatch_group_notify(v11, v10, block);
}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v4 = 2;
  }
  uint64_t v5 = [[INSerializedCacheItem alloc] initWithType:v4 identifier:*(void *)(a1 + 40) payload:v3];
  [*(id *)(a1 + 48) addObject:v5];
  uint64_t v6 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 136315650;
    id v9 = "+[INSerializedCacheItem serializeCacheableObjects:completion:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Serialized cacheableObject %@ to %@", (uint8_t *)&v8, 0x20u);
  }

LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 count];
    uint64_t v6 = [*(id *)(a1 + 40) count];
    int v9 = 136315650;
    __int16 v10 = "+[INSerializedCacheItem serializeCacheableObjects:completion:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Serialized %tu cacheable objects to %tu serialized cache items.", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

@end
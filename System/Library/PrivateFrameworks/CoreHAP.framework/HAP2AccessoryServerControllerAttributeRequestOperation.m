@interface HAP2AccessoryServerControllerAttributeRequestOperation
+ (id)_characteristicsFromCachedCharacteristics:(id)a3;
+ (id)_parseCache:(id)a3;
- (void)_cleanUp;
- (void)_sendRequest;
- (void)main;
@end

@implementation HAP2AccessoryServerControllerAttributeRequestOperation

- (void).cxx_destruct
{
}

- (void)_sendRequest
{
  v2 = self;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (HAP2AccessoryServerControllerAttributeRequestOperation *)self->_cache;
  }
  v3 = [(HAP2AccessoryServerControllerAttributeRequestOperation *)self accessoryCache];

  if (!v3) {
    goto LABEL_14;
  }
  v4 = objc_opt_class();
  if (v2) {
    cache = v2->_cache;
  }
  else {
    cache = 0;
  }
  v6 = [(HAP2AccessoryServerAccessoryCache *)cache accessoryCache];
  v7 = [v4 _parseCache:v6];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v8 = hap2Log_accessory;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v2;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to deserialize the cache falling back to the accessory", buf, 0xCu);
    }
LABEL_14:
    v10.receiver = v2;
    v10.super_class = (Class)HAP2AccessoryServerControllerAttributeRequestOperation;
    [(HAP2AccessoryServerControllerOperation *)&v10 _sendRequest];
    return;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v2;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Attempting to use the accessory cache", buf, 0xCu);
  }
  v9 = [[HAP2EncodedAttributeDatabaseResponseCached alloc] initWithAttributeDatabase:v7];
  -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)v2, v9);

  [(HAP2AccessoryServerControllerOperation *)v2 finish];
}

- (void)_cleanUp
{
  v3 = -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  -[HAP2AccessoryServerController setReadingAttributeDatabase:]((uint64_t)v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerControllerAttributeRequestOperation;
  [(HAP2AccessoryServerControllerOperation *)&v4 _cleanUp];
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&buf, 0xCu);
  }
  objc_super v4 = -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  -[HAP2AccessoryServerController setReadingAttributeDatabase:]((uint64_t)v4, 1);

  -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.super.isa);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v17 = __62__HAP2AccessoryServerControllerAttributeRequestOperation_main__block_invoke;
  v18 = &unk_1E69F2610;
  v19 = self;
  v6 = v16;
  if (v5)
  {
    [v5[10] assertCurrentQueue];
    id v7 = v5[8];
    if (v7)
    {
      v8 = [v7 metadataVersion];

      if (v8)
      {
        v17((uint64_t)v6, v5[8]);
        goto LABEL_22;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Invalidating accessory cache due to missing metadata version", (uint8_t *)&buf, 0xCu);
      }
      [v5[8] invalidateAccessoryCache];
    }
    objc_super v10 = [v5 accessoryServer];
    v11 = [v10 browser];
    v12 = [v11 storage];

    if (v12)
    {
      uint64_t v13 = [(id)objc_opt_class() controllerIdentifier];
      v14 = cacheFileIdentifierForAccessoryServer(v13, v10);

      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v21 = __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke;
      v22 = &unk_1E69F3300;
      v23 = v5;
      v25 = v6;
      id v24 = v10;
      [v12 fetchCacheForIdentifier:v14 completion:&buf];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v15 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ Unable to get to the storage", (uint8_t *)&buf, 0xCu);
      }
      v17((uint64_t)v6, 0);
    }
  }
LABEL_22:
}

uint64_t __62__HAP2AccessoryServerControllerAttributeRequestOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 368), a2);
    objc_super v4 = *(void **)(a1 + 32);
  }
  else
  {
    objc_super v4 = 0;
  }

  return [v4 _openTransport:0];
}

+ (id)_characteristicsFromCachedCharacteristics:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__HAP2AccessoryServerControllerAttributeRequestOperation__characteristicsFromCachedCharacteristics___block_invoke;
  v9[3] = &unk_1E69F2688;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];

  return v7;
}

void __100__HAP2AccessoryServerControllerAttributeRequestOperation__characteristicsFromCachedCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HAPCharacteristic alloc];
  v5 = [v3 characteristicUUID];
  id v6 = [v5 UUIDString];
  id v7 = [v3 characteristicInstanceId];
  uint64_t v8 = [v3 characteristicProperties];
  v9 = [v3 characteristicMetadata];

  LOBYTE(v11) = 1;
  v12 = [(HAPCharacteristic *)v4 initWithType:v6 instanceID:v7 value:0 stateNumber:0 properties:v8 eventNotificationsEnabled:0 implicitWriteWithResponse:v11 metadata:v9];

  id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(HAPCharacteristic *)v12 setValueUpdatedTime:v10];

  [*(id *)(a1 + 32) addObject:v12];
}

+ (id)_parseCache:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke;
  uint64_t v13 = &unk_1E69F2660;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 cachedServices];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke_2;
  id v14 = &unk_1E69F2638;
  uint64_t v8 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:&v11];
  uint64_t v10 = objc_msgSend(v9, "copy", v11, v12, v13, v14);
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
}

void __70__HAP2AccessoryServerControllerAttributeRequestOperation__parseCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v4 cachedCharacteristics];
  id v14 = [v3 _characteristicsFromCachedCharacteristics:v5];

  id v6 = [HAPService alloc];
  id v7 = [v4 serviceUUID];
  uint64_t v8 = [v7 UUIDString];
  id v9 = [v4 serviceInstanceId];
  uint64_t v10 = [v4 serviceProperties];
  uint64_t v11 = [v4 linkedServices];

  if (v11)
  {
    uint64_t v12 = [(HAPService *)v6 initWithType:v8 instanceID:v9 parsedCharacteristics:v14 serviceProperties:v10 linkedServices:v11];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1C978] array];
    uint64_t v12 = [(HAPService *)v6 initWithType:v8 instanceID:v9 parsedCharacteristics:v14 serviceProperties:v10 linkedServices:v13];
  }
  [*(id *)(a1 + 32) addObject:v12];
}

@end
@interface HAP2AccessoryServerAccessoryCache
+ (BOOL)supportsSecureCoding;
+ (id)accessoryCacheForAccessories:(id)a3;
+ (id)peripheralInfoFromMetadata:(id)a3;
- (HAP2AccessoryServerAccessoryCache)initWithBLEPeripheralInfo:(id)a3 cachedAccessories:(id)a4 sleepInterval:(id)a5 metadataVersion:(id)a6;
- (HAP2AccessoryServerAccessoryCache)initWithCoder:(id)a3;
- (HAP2AccessoryServerAccessoryCache)initWithMetadata:(id)a3 discoveredAccessories:(id)a4 sleepInterval:(id)a5;
- (HAPBLEPeripheralInfo)peripheralInfo;
- (NSDictionary)accessoryCache;
- (NSNumber)metadataVersion;
- (NSNumber)sleepInterval;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateAccessoryCache;
- (void)setAccessoryCache:(id)a3;
- (void)setPeripheralInfo:(id)a3;
- (void)setSleepInterval:(id)a3;
- (void)updateWithMetadata:(id)a3 discoveredAccessories:(id)a4;
@end

@implementation HAP2AccessoryServerAccessoryCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataVersion, 0);
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);

  objc_storeStrong((id *)&self->_peripheralInfo, 0);
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (void)setSleepInterval:(id)a3
{
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setAccessoryCache:(id)a3
{
}

- (NSDictionary)accessoryCache
{
  return self->_accessoryCache;
}

- (void)setPeripheralInfo:(id)a3
{
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (HAP2AccessoryServerAccessoryCache)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP2.pe"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v8 = [v6 setWithArray:v7];

  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HAP2.ac"];
  v10 = (void *)v9;
  if (v5 && v9)
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP2.si"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP2.mv"];
    self = [(HAP2AccessoryServerAccessoryCache *)self initWithBLEPeripheralInfo:v5 cachedAccessories:v10 sleepInterval:v11 metadataVersion:v12];

    v13 = self;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "AccessoryCache: Unable to decode objects", v16, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerAccessoryCache *)self peripheralInfo];
  [v4 encodeObject:v5 forKey:@"HAP2.pe"];

  v6 = [(HAP2AccessoryServerAccessoryCache *)self accessoryCache];
  [v4 encodeObject:v6 forKey:@"HAP2.ac"];

  v7 = [(HAP2AccessoryServerAccessoryCache *)self sleepInterval];
  [v4 encodeObject:v7 forKey:@"HAP2.si"];

  id v8 = [(HAP2AccessoryServerAccessoryCache *)self metadataVersion];
  [v4 encodeObject:v8 forKey:@"HAP2.mv"];
}

- (void)invalidateAccessoryCache
{
}

- (void)updateWithMetadata:(id)a3 discoveredAccessories:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() accessoryCacheForAccessories:v6];

  [(HAP2AccessoryServerAccessoryCache *)self setAccessoryCache:v8];
  id v9 = [(id)objc_opt_class() peripheralInfoFromMetadata:v7];

  [(HAP2AccessoryServerAccessoryCache *)self setPeripheralInfo:v9];
}

- (HAP2AccessoryServerAccessoryCache)initWithMetadata:(id)a3 discoveredAccessories:(id)a4 sleepInterval:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() peripheralInfoFromMetadata:v10];

  v12 = [(id)objc_opt_class() accessoryCacheForAccessories:v9];

  v13 = HAPGetHAPMetadataVersion();
  v14 = [(HAP2AccessoryServerAccessoryCache *)self initWithBLEPeripheralInfo:v11 cachedAccessories:v12 sleepInterval:v8 metadataVersion:v13];

  return v14;
}

- (HAP2AccessoryServerAccessoryCache)initWithBLEPeripheralInfo:(id)a3 cachedAccessories:(id)a4 sleepInterval:(id)a5 metadataVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerAccessoryCache;
  v15 = [(HAP2AccessoryServerAccessoryCache *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peripheralInfo, a3);
    objc_storeStrong((id *)&v16->_accessoryCache, a4);
    objc_storeStrong((id *)&v16->_sleepInterval, a5);
    objc_storeStrong((id *)&v16->_metadataVersion, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accessoryCacheForAccessories:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke;
  v9[3] = &unk_1E69F37E0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];

  return v7;
}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HAPBLEAccessoryCache alloc];
  v5 = [v3 identifier];
  id v6 = [(HAPBLEAccessoryCache *)v4 initWithPairingIdentifier:v5];

  id v7 = [v3 services];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_2;
  v12[3] = &unk_1E69F31E8;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = NSNumber;
  uint64_t v10 = [v3 instanceID];

  id v11 = [v9 numberWithUnsignedInteger:v10];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v11];
}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = a2;
  id v7 = [v5 alloc];
  id v8 = [v6 type];
  id v9 = (void *)[v7 initWithUUIDString:v8];

  uint64_t v10 = [HAPBLEServiceCache alloc];
  id v11 = [v6 instanceID];
  uint64_t v12 = [v6 serviceProperties];
  id v13 = [v6 linkedServices];
  id v14 = [(HAPBLEServiceCache *)v10 initWithServiceUUID:v9 instanceId:v11 instanceOrder:a3 serviceProperties:v12 linkedServices:v13];

  v15 = [v6 characteristics];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_3;
  v17[3] = &unk_1E69F3740;
  objc_super v18 = v14;
  v16 = v14;
  [v15 enumerateObjectsUsingBlock:v17];

  [*(id *)(a1 + 32) updateWithService:v16];
}

void __66__HAP2AccessoryServerAccessoryCache_accessoryCacheForAccessories___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 type];
  id v12 = (id)[v5 initWithUUIDString:v6];

  id v7 = [HAPBLECharacteristicCache alloc];
  id v8 = [v4 instanceID];
  uint64_t v9 = [v4 properties];
  uint64_t v10 = [v4 accessoryMetadata];

  id v11 = [(HAPBLECharacteristicCache *)v7 initWithCharacteristicUUID:v12 instanceId:v8 characteristicProperties:v9 characteristicMetadata:v10];
  [*(id *)(a1 + 32) updateWithCharacteristic:v11];
}

+ (id)peripheralInfoFromMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 protocolVersion];
  uint64_t v5 = [v4 majorVersion];
  id v6 = [v3 protocolVersion];
  uint64_t v7 = [v6 minorVersion] + 10 * v5;

  uint64_t v8 = [v3 hasPairings] ^ 1;
  uint64_t v9 = [HAPBLEPeripheralInfo alloc];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "stateNumber"));
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "configNumber"));
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));
  id v14 = [v3 name];

  v15 = [(HAPBLEPeripheralInfo *)v9 initWithPeripheralInfo:0 advertisedProtocolVersion:v7 previousProtocolVersion:0 resumeSessionId:0 lastSeen:v10 statusFlags:v11 stateNumber:0.0 configNumber:v12 categoryIdentifier:v13 accessoryName:v14];

  return v15;
}

@end
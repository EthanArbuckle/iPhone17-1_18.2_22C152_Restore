@interface HAPBLEServiceCache
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HAPBLEServiceCache)initWithCoder:(id)a3;
- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7;
- (NSArray)linkedServices;
- (NSMutableArray)cachedCharacteristics;
- (NSNumber)serviceInstanceId;
- (NSUUID)serviceUUID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serviceInstanceOrder;
- (unint64_t)serviceProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedCharacteristics:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setServiceInstanceOrder:(unint64_t)a3;
- (void)setServiceProperties:(unint64_t)a3;
- (void)updateWithCharacteristic:(id)a3;
- (void)updateWithService:(id)a3;
@end

@implementation HAPBLEServiceCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceId, 0);

  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

- (void)setCachedCharacteristics:(id)a3
{
}

- (NSMutableArray)cachedCharacteristics
{
  return self->_cachedCharacteristics;
}

- (void)setLinkedServices:(id)a3
{
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceInstanceOrder:(unint64_t)a3
{
  self->_serviceInstanceOrder = a3;
}

- (unint64_t)serviceInstanceOrder
{
  return self->_serviceInstanceOrder;
}

- (NSNumber)serviceInstanceId
{
  return self->_serviceInstanceId;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"\nList of Characteristics: %tu\n", objc_msgSend(v4, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      v11 = v5;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 = [v11 stringByAppendingFormat:@"%@", *(void *)(*((void *)&v25 + 1) + 8 * v10)];

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v12 = NSString;
  v13 = [(HAPBLEServiceCache *)self serviceUUID];
  v14 = [(HAPBLEServiceCache *)self serviceInstanceId];
  unint64_t v15 = [(HAPBLEServiceCache *)self serviceInstanceOrder];
  char v16 = [(HAPBLEServiceCache *)self serviceProperties];
  v17 = [MEMORY[0x1E4F28E78] string];
  v18 = v17;
  if (v16)
  {
    uint64_t v23 = [v17 stringByAppendingString:@": Primary"];

    v18 = (void *)v23;
    if ((v16 & 2) == 0)
    {
LABEL_10:
      if ((v16 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_10;
  }
  uint64_t v24 = [v18 stringByAppendingString:@": Hidden"];

  v18 = (void *)v24;
  if ((v16 & 4) != 0)
  {
LABEL_11:
    uint64_t v19 = [v18 stringByAppendingString:@": Configurable"];

    v18 = (void *)v19;
  }
LABEL_12:
  v20 = [(HAPBLEServiceCache *)self linkedServices];
  v21 = [v12 stringWithFormat:@"\n\nService Info:\n\tService UUID: %@,\n\tInstanceId: %@,\n\tOrder: %lu,\n\tProperties: %@,\n\tLinkedServices: %@,\n\t %@", v13, v14, v15, v18, v20, v5];

  return v21;
}

- (HAPBLEServiceCache)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HAPBLEServiceCache;
  v5 = [(HAPBLEServiceCache *)&v22 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUUI"];
  serviceUUID = v5->_serviceUUID;
  v5->_serviceUUID = (NSUUID *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SI"];
  serviceInstanceId = v5->_serviceInstanceId;
  v5->_serviceInstanceId = (NSNumber *)v8;

  v5->_serviceInstanceOrder = [v4 decodeIntegerForKey:@"SO"];
  v5->_serviceProperties = [v4 decodeIntegerForKey:@"SP"];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v12 = [v10 setWithArray:v11];
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"LS"];
  linkedServices = v5->_linkedServices;
  v5->_linkedServices = (NSArray *)v13;

  unint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v17 = [v15 setWithArray:v16];
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"CC"];
  cachedCharacteristics = v5->_cachedCharacteristics;
  v5->_cachedCharacteristics = (NSMutableArray *)v18;

  if (!v5->_serviceInstanceId) {
    goto LABEL_5;
  }
  if (v5->_serviceUUID) {
    v20 = v5;
  }
  else {
LABEL_5:
  }
    v20 = 0;

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBLEServiceCache *)self serviceUUID];
  [v4 encodeObject:v5 forKey:@"SUUI"];

  uint64_t v6 = [(HAPBLEServiceCache *)self serviceInstanceId];
  [v4 encodeObject:v6 forKey:@"SI"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder"), @"SO");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceProperties](self, "serviceProperties"), @"SP");
  uint64_t v7 = [(HAPBLEServiceCache *)self linkedServices];
  [v4 encodeObject:v7 forKey:@"LS"];

  id v8 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  [v4 encodeObject:v8 forKey:@"CC"];
}

- (void)updateWithCharacteristic:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 isEqual:v4])
        {
          [v10 updateWithCharacteristic:v4];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  [v5 addObject:v4];
LABEL_11:
}

- (void)updateWithService:(id)a3
{
  id v4 = a3;
  -[HAPBLEServiceCache setServiceInstanceOrder:](self, "setServiceInstanceOrder:", [v4 serviceInstanceOrder]);
  -[HAPBLEServiceCache setServiceProperties:](self, "setServiceProperties:", [v4 serviceProperties]);
  v5 = [v4 linkedServices];
  [(HAPBLEServiceCache *)self setLinkedServices:v5];

  id v6 = [v4 cachedCharacteristics];

  [(HAPBLEServiceCache *)self setCachedCharacteristics:v6];
}

- (unint64_t)hash
{
  v3 = [(HAPBLEServiceCache *)self serviceUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HAPBLEServiceCache *)self serviceInstanceId];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HAPBLEServiceCache *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(HAPBLEServiceCache *)self serviceUUID];
      uint64_t v7 = [(HAPBLEServiceCache *)v5 serviceUUID];
      int v8 = [v6 isEqual:v7];

      if (v8
        && ([(HAPBLEServiceCache *)self serviceInstanceId],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [(HAPBLEServiceCache *)v5 serviceInstanceId],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqual:v10],
            v10,
            v9,
            v11))
      {
        unint64_t v12 = [(HAPBLEServiceCache *)self serviceInstanceOrder];
        BOOL v13 = v12 == [(HAPBLEServiceCache *)v5 serviceInstanceOrder];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPBLEServiceCache;
  uint64_t v16 = [(HAPBLEServiceCache *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceUUID, a3);
    objc_storeStrong((id *)&v17->_serviceInstanceId, a4);
    v17->_serviceInstanceOrder = a5;
    v17->_serviceProperties = a6;
    objc_storeStrong((id *)&v17->_linkedServices, a7);
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    cachedCharacteristics = v17->_cachedCharacteristics;
    v17->_cachedCharacteristics = (NSMutableArray *)v18;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
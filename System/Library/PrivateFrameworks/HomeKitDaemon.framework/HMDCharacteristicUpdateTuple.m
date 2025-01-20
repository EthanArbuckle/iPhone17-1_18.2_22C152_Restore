@interface HMDCharacteristicUpdateTuple
+ (id)characteristicUpdateTuplesWithCharacteristics:(id)a3 isBroadcast:(BOOL)a4;
- (BOOL)isBroadcast;
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicResponse)characteristicResponse;
- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5;
- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5 reasons:(unint64_t)a6;
- (id)attributeDescriptions;
- (id)updatedValue;
- (id)value;
- (unint64_t)hash;
- (unint64_t)reasons;
- (void)setCharacteristicResponse:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HMDCharacteristicUpdateTuple

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicResponse, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (unint64_t)reasons
{
  return self->_reasons;
}

- (void)setCharacteristicResponse:(id)a3
{
}

- (HMDCharacteristicResponse)characteristicResponse
{
  return self->_characteristicResponse;
}

- (BOOL)isBroadcast
{
  return self->_broadcast;
}

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCharacteristicUpdateTuple *)self characteristic];
  v5 = (void *)[v3 initWithName:@"characteristic" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCharacteristicUpdateTuple *)self value];
  v8 = (void *)[v6 initWithName:@"value" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCharacteristicUpdateTuple *)self isBroadcast];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"isBroadcast" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicUpdateTuple reasons](self, "reasons"));
  v14 = (void *)[v12 initWithName:@"reasons" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (unint64_t)hash
{
  v2 = [(HMDCharacteristicUpdateTuple *)self characteristic];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6 && (unint64_t v7 = -[HMDCharacteristicUpdateTuple reasons](self, "reasons"), v7 == [v6 reasons]))
  {
    v8 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    id v9 = [v6 characteristic];
    if ([v8 isEqual:v9])
    {
      v10 = [(HMDCharacteristicUpdateTuple *)self value];
      v11 = [v6 value];
      if ([v10 isEqual:v11])
      {
        BOOL v12 = [(HMDCharacteristicUpdateTuple *)self isBroadcast];
        int v13 = v12 ^ [v6 isBroadcast] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)updatedValue
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDCharacteristicUpdateTuple *)self characteristicResponse];
  id v4 = [v3 request];
  int v5 = [v4 isMemberOfClass:objc_opt_class()];

  if (v5)
  {
    id v6 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    unint64_t v7 = [v6 lastKnownValue];

    v8 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    id v9 = [v8 lastKnownValueUpdateTime];
    v10 = [(HMDCharacteristicUpdateTuple *)self characteristicResponse];
    v11 = [v10 valueUpdatedTime];
    if ([v9 compare:v11] == 1)
    {
      BOOL v12 = [(HMDCharacteristicUpdateTuple *)self value];
      char v13 = [v7 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          int v20 = 138543874;
          v21 = v17;
          __int16 v22 = 2112;
          v23 = v15;
          __int16 v24 = 2112;
          v25 = v7;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating tuple to last known characteristic value %@ -> %@", (uint8_t *)&v20, 0x20u);
        }
        [(HMDCharacteristicUpdateTuple *)v15 setValue:v7];
      }
    }
    else
    {
    }
  }
  v18 = [(HMDCharacteristicUpdateTuple *)self value];
  return v18;
}

- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5 reasons:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCharacteristicUpdateTuple;
  char v13 = [(HMDCharacteristicUpdateTuple *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_characteristic, a3);
    objc_storeStrong(&v14->_value, a4);
    v14->_broadcast = a5;
    v14->_reasons = a6;
  }

  return v14;
}

- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5
{
  return [(HMDCharacteristicUpdateTuple *)self initWithCharacteristic:a3 updatedValue:a4 isBroadcast:a5 reasons:0];
}

+ (id)characteristicUpdateTuplesWithCharacteristics:(id)a3 isBroadcast:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = v5;
  unint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [HMDCharacteristicUpdateTuple alloc];
        v14 = [v12 value];
        v15 = [(HMDCharacteristicUpdateTuple *)v13 initWithCharacteristic:v12 updatedValue:v14 isBroadcast:v4];

        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

@end
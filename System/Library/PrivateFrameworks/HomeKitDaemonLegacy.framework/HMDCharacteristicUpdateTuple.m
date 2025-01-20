@interface HMDCharacteristicUpdateTuple
+ (id)characteristicUpdateTuplesWithCharacteristics:(id)a3 isBroadcast:(BOOL)a4;
- (BOOL)isBroadcast;
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicResponse)characteristicResponse;
- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5;
- (id)attributeDescriptions;
- (id)updatedValue;
- (id)value;
- (unint64_t)hash;
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
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCharacteristicUpdateTuple *)self characteristic];
  v5 = (void *)[v3 initWithName:@"characteristic" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCharacteristicUpdateTuple *)self value];
  v8 = (void *)[v6 initWithName:@"value" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCharacteristicUpdateTuple *)self isBroadcast];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"isBroadcast" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
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
  if (v6)
  {
    v7 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    v8 = [v6 characteristic];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMDCharacteristicUpdateTuple *)self value];
      v10 = [v6 value];
      if ([v9 isEqual:v10])
      {
        BOOL v11 = [(HMDCharacteristicUpdateTuple *)self isBroadcast];
        int v12 = v11 ^ [v6 isBroadcast] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)updatedValue
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMDCharacteristicUpdateTuple *)self characteristicResponse];
  id v4 = [v3 request];
  int v5 = [v4 isMemberOfClass:objc_opt_class()];

  if (v5)
  {
    id v6 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    v7 = [v6 lastKnownValue];

    v8 = [(HMDCharacteristicUpdateTuple *)self characteristic];
    id v9 = [v8 lastKnownValueUpdateTime];
    v10 = [(HMDCharacteristicUpdateTuple *)self characteristicResponse];
    BOOL v11 = [v10 valueUpdatedTime];
    if ([v9 compare:v11] == 1)
    {
      int v12 = [(HMDCharacteristicUpdateTuple *)self value];
      char v13 = [v7 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x1D9452090]();
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
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating tuple to last known characteristic value %@ -> %@", (uint8_t *)&v20, 0x20u);
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

- (HMDCharacteristicUpdateTuple)initWithCharacteristic:(id)a3 updatedValue:(id)a4 isBroadcast:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicUpdateTuple;
  BOOL v11 = [(HMDCharacteristicUpdateTuple *)&v14 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a3);
    objc_storeStrong(&v12->_value, a4);
    v12->_broadcast = a5;
  }

  return v12;
}

+ (id)characteristicUpdateTuplesWithCharacteristics:(id)a3 isBroadcast:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = v5;
  v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
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
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [HMDCharacteristicUpdateTuple alloc];
        objc_super v14 = [v12 value];
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
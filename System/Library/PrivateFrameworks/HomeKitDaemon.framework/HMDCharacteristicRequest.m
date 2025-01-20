@interface HMDCharacteristicRequest
+ (id)logCategory;
+ (id)requestWithCharacteristic:(id)a3;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicRequest)initWithCharacteristic:(id)a3;
- (HMDHAPAccessory)accessory;
- (HMDService)service;
- (id)attributeDescriptions;
- (id)previousValue;
- (unint64_t)hash;
- (void)setCompleted:(BOOL)a3;
@end

@implementation HMDCharacteristicRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (id)previousValue
{
  return self->_previousValue;
}

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (unint64_t)hash
{
  v2 = [(HMDCharacteristicRequest *)self characteristic];
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
    v7 = [(HMDCharacteristicRequest *)self characteristic];
    v8 = [v6 characteristic];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HMDHAPAccessory)accessory
{
  v2 = [(HMDCharacteristicRequest *)self characteristic];
  unint64_t v3 = [v2 accessory];

  return (HMDHAPAccessory *)v3;
}

- (HMDService)service
{
  v2 = [(HMDCharacteristicRequest *)self characteristic];
  unint64_t v3 = [v2 service];

  return (HMDService *)v3;
}

- (id)attributeDescriptions
{
  v39[5] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDCharacteristicRequest *)self characteristic];
  id v4 = [v3 accessory];

  v5 = [(HMDCharacteristicRequest *)self characteristic];
  id v6 = [v5 service];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = NSString;
  v38 = v4;
  v37 = [v4 name];
  v36 = [v4 uniqueIdentifier];
  v35 = [v8 stringWithFormat:@"(%@/%@)", v37, v36];
  v34 = (void *)[v7 initWithName:@"Accessory" value:v35];
  v39[0] = v34;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = NSString;
  v33 = v6;
  v32 = [v6 type];
  v31 = shortHAPTypeDescription(v32);
  v30 = [v6 instanceID];
  v29 = [v10 stringWithFormat:@"(%@/%@)", v31, v30];
  v28 = (void *)[v9 initWithName:@"Service" value:v29];
  v39[1] = v28;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = NSString;
  v27 = [(HMDCharacteristicRequest *)self characteristic];
  v13 = [v27 type];
  v14 = shortHAPTypeDescription(v13);
  v15 = [(HMDCharacteristicRequest *)self characteristic];
  v16 = [v15 instanceID];
  v17 = [v12 stringWithFormat:@"(%@/%@)", v14, v16];
  v18 = (void *)[v11 initWithName:@"Characteristic" value:v17];
  v39[2] = v18;
  id v19 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDCharacteristicRequest *)self previousValue];
  v21 = (void *)[v19 initWithName:@"Previous Value" value:v20];
  v39[3] = v21;
  id v22 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = [(HMDCharacteristicRequest *)self previousValue];
  v24 = (void *)[v22 initWithName:@"Type" value:objc_opt_class()];
  v39[4] = v24;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:5];

  return v26;
}

- (HMDCharacteristicRequest)initWithCharacteristic:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicRequest;
  id v6 = [(HMDCharacteristicRequest *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristic, a3);
    uint64_t v8 = [v5 value];
    id previousValue = v7->_previousValue;
    v7->_id previousValue = (id)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_269919 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_269919, &__block_literal_global_269920);
  }
  v2 = (void *)logCategory__hmf_once_v2_269921;
  return v2;
}

void __39__HMDCharacteristicRequest_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_269921;
  logCategory__hmf_once_v2_269921 = v0;
}

+ (id)requestWithCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCharacteristic:v4];

  return v5;
}

@end
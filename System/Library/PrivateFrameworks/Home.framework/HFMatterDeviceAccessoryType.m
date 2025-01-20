@interface HFMatterDeviceAccessoryType
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFMatterDeviceAccessoryType)initWithDeviceType:(id)a3;
- (NSNumber)deviceType;
- (id)description;
- (id)equivalentServiceType;
@end

@implementation HFMatterDeviceAccessoryType

void __42__HFMatterDeviceAccessoryType_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_386];
  uint64_t v2 = [v0 build];

  v3 = (void *)qword_26AB2E9E8;
  qword_26AB2E9E8 = v2;
}

+ (id)na_identity
{
  if (qword_26AB2E9E0 != -1) {
    dispatch_once(&qword_26AB2E9E0, &__block_literal_global_381);
  }
  uint64_t v2 = (void *)qword_26AB2E9E8;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HFMatterDeviceAccessoryType *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HFMatterDeviceAccessoryType *)v5 deviceType];
      v7 = [(HFMatterDeviceAccessoryType *)self deviceType];
      if ([(HFMatterDeviceAccessoryType *)v6 isEqual:v7])
      {
        char v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
      v9 = [(HFMatterDeviceAccessoryType *)v5 equivalentServiceType];
      v10 = [(HFMatterDeviceAccessoryType *)self equivalentServiceType];
      char v8 = [v9 isEqualToString:v10];

LABEL_10:
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HFMatterDeviceAccessoryType *)self equivalentServiceType];
      v6 = v4;
      v7 = [(HFMatterDeviceAccessoryType *)v6 serviceType];
      if (![(HFMatterDeviceAccessoryType *)v5 isEqualToString:v7])
      {
        char v8 = 0;
        goto LABEL_13;
      }
      v9 = [(HFMatterDeviceAccessoryType *)v6 subtype];
      char v8 = v9 == 0;
      goto LABEL_10;
    }
    char v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)equivalentServiceType
{
  objc_opt_class();
  self;
  if (qword_26AB2E9D0 != -1) {
    dispatch_once(&qword_26AB2E9D0, &__block_literal_global_374);
  }
  id v3 = (id)qword_26AB2E9D8;
  v4 = [(HFMatterDeviceAccessoryType *)self deviceType];
  v5 = [v3 objectForKey:v4];

  return v5;
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

uint64_t __42__HFMatterDeviceAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 deviceType];
}

- (HFMatterDeviceAccessoryType)initWithDeviceType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFMatterDeviceAccessoryType;
  v6 = [(HFAccessoryType *)&v9 _init];
  v7 = (HFMatterDeviceAccessoryType *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

void __55__HFMatterDeviceAccessoryType__deviceTypeToServiceType__block_invoke_2()
{
  v7[11] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D780];
  v6[0] = &unk_26C0F6060;
  v6[1] = &unk_26C0F6078;
  v7[0] = v0;
  v7[1] = v0;
  v6[2] = &unk_26C0F6090;
  v6[3] = &unk_26C0F60A8;
  v7[2] = v0;
  v7[3] = v0;
  uint64_t v1 = *MEMORY[0x263F0D798];
  v6[4] = &unk_26C0F60C0;
  v6[5] = &unk_26C0F6108;
  uint64_t v2 = *MEMORY[0x263F0D828];
  v7[4] = v1;
  v7[5] = v2;
  v6[6] = &unk_26C0F6120;
  v6[7] = &unk_26C0F6138;
  v7[6] = v2;
  v7[7] = v2;
  v6[8] = &unk_26C0F6150;
  v6[9] = &unk_26C0F60D8;
  uint64_t v3 = *MEMORY[0x263F0D7D0];
  v7[8] = v2;
  v7[9] = v3;
  v6[10] = &unk_26C0F60F0;
  v7[10] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:11];
  id v5 = (void *)qword_26AB2E9D8;
  qword_26AB2E9D8 = v4;
}

- (id)description
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(HFMatterDeviceAccessoryType *)self deviceType];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"matterDeviceType: 0x%02x", objc_msgSend(v3, "intValue"));

  return v4;
}

- (void).cxx_destruct
{
}

@end
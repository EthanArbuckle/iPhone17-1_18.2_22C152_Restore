@interface HAPMetadataUnit
+ (id)init:(id)a3 withDictionary:(id)a4;
- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4;
- (NSString)name;
- (NSString)unitDescription;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setName:(id)a3;
- (void)setUnitDescription:(id)a3;
@end

@implementation HAPMetadataUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setUnitDescription:(id)a3
{
}

- (NSString)unitDescription
{
  return self->_unitDescription;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)dump
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [(HAPMetadataUnit *)self name];
    v7 = [(HAPMetadataUnit *)self unitDescription];
    int v8 = 138543874;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataUnit %@:  description: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPMetadataUnit *)self name];
  v5 = [(HAPMetadataUnit *)self unitDescription];
  v6 = [v3 stringWithFormat:@"Unit %@ - %@", v4, v5];

  return v6;
}

- (id)generateDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HAPMetadataUnit *)self unitDescription];
  [v3 setObject:v4 forKeyedSubscript:@"DefaultDescription"];

  [v3 setObject:&stru_1F2C4E778 forKeyedSubscript:@"LocalizationKey"];

  return v3;
}

- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HAPMetadataUnit;
  int v8 = [(HAPMetadataUnit *)&v15 init];
  v9 = v8;
  if (v7 && v6)
  {
    if (v8)
    {
      uint64_t v10 = [v6 copy];
      name = v9->_name;
      v9->_name = (NSString *)v10;

      uint64_t v12 = [v7 copy];
      unitDescription = (HAPMetadataUnit *)v9->_unitDescription;
      v9->_unitDescription = (NSString *)v12;
    }
    else
    {
      unitDescription = 0;
    }
  }
  else
  {
    unitDescription = v8;
    v9 = 0;
  }

  return v9;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "hmf_stringForKey:", @"DefaultDescription");
  id v7 = [[HAPMetadataUnit alloc] initWithName:v5 description:v6];

  return v7;
}

@end
@interface HAPMetadataProperty
+ (id)init:(id)a3 withDictionary:(id)a4;
- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5;
- (NSNumber)bitPosition;
- (NSString)propertyDescription;
- (NSString)propertyType;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setBitPosition:(id)a3;
- (void)setPropertyDescription:(id)a3;
- (void)setPropertyType:(id)a3;
@end

@implementation HAPMetadataProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPosition, 0);
  objc_storeStrong((id *)&self->_propertyType, 0);

  objc_storeStrong((id *)&self->_propertyDescription, 0);
}

- (void)setBitPosition:(id)a3
{
}

- (NSNumber)bitPosition
{
  return self->_bitPosition;
}

- (void)setPropertyType:(id)a3
{
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyDescription:(id)a3
{
}

- (NSString)propertyDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)dump
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [(HAPMetadataProperty *)self propertyType];
    v7 = [(HAPMetadataProperty *)self propertyDescription];
    v8 = [(HAPMetadataProperty *)self bitPosition];
    int v9 = 138544130;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataProperty %@:  description: %@  bitPosition: %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPMetadataProperty *)self propertyType];
  v5 = [(HAPMetadataProperty *)self propertyDescription];
  v6 = [(HAPMetadataProperty *)self bitPosition];
  v7 = [v3 stringWithFormat:@"Unit %@ - %@ - bit %@", v4, v5, v6];

  return v7;
}

- (id)generateDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HAPMetadataProperty *)self bitPosition];
  [v3 setObject:v4 forKeyedSubscript:@"Position"];

  v5 = [(HAPMetadataProperty *)self propertyDescription];
  [v3 setObject:v5 forKeyedSubscript:@"DefaultDescription"];

  [v3 setObject:&stru_1F2C4E778 forKeyedSubscript:@"LocalizationKey"];

  return v3;
}

- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HAPMetadataProperty;
  __int16 v11 = [(HAPMetadataProperty *)&v18 init];
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      uint64_t v13 = [v8 copy];
      propertyType = v12->_propertyType;
      v12->_propertyType = (NSString *)v13;

      objc_storeStrong((id *)&v12->_bitPosition, a4);
      uint64_t v15 = [v10 copy];
      propertyDescription = (HAPMetadataProperty *)v12->_propertyDescription;
      v12->_propertyDescription = (NSString *)v15;
    }
    else
    {
      propertyDescription = 0;
    }
  }
  else
  {
    propertyDescription = v11;
    v12 = 0;
  }

  return v12;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v5, "hmf_numberForKey:", @"Position");
  id v8 = objc_msgSend(v5, "hmf_stringForKey:", @"DefaultDescription");

  id v9 = [[HAPMetadataProperty alloc] initWithType:v6 bitPosition:v7 description:v8];

  return v9;
}

@end
@interface HMDHAPMetadataCategory
- (HMDHAPMetadataCategory)init;
- (HMDHAPMetadataCategory)initWithIdentifier:(id)a3 uuid:(id)a4 name:(id)a5 description:(id)a6;
- (NSNumber)identifier;
- (NSString)catDescription;
- (NSString)description;
- (NSString)name;
- (NSString)uuidStr;
- (void)setCatDescription:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setUuidStr:(id)a3;
@end

@implementation HMDHAPMetadataCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCatDescription:(id)a3
{
}

- (NSString)catDescription
{
  return self->_catDescription;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setUuidStr:(id)a3
{
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDHAPMetadataCategory *)self name];
  v5 = [(HMDHAPMetadataCategory *)self catDescription];
  v6 = [(HMDHAPMetadataCategory *)self identifier];
  v7 = [(HMDHAPMetadataCategory *)self uuidStr];
  v8 = [v3 stringWithFormat:@"Accessory category %@: description: %@ identifier: %@ uuid: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (HMDHAPMetadataCategory)initWithIdentifier:(id)a3 uuid:(id)a4 name:(id)a5 description:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDHAPMetadataCategory;
  v15 = [(HMDHAPMetadataCategory *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    uint64_t v17 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v12);
    uuidStr = v16->_uuidStr;
    v16->_uuidStr = (NSString *)v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v13);
    name = v16->_name;
    v16->_name = (NSString *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v14);
    catDescription = v16->_catDescription;
    v16->_catDescription = (NSString *)v21;
  }
  return v16;
}

- (HMDHAPMetadataCategory)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end
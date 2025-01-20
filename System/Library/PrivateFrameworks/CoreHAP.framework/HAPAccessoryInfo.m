@interface HAPAccessoryInfo
- (BOOL)authenticated;
- (BOOL)isCertified;
- (BOOL)isDenylisted;
- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9;
- (NSNumber)category;
- (NSString)certificationStatus;
- (NSString)denylisted;
- (NSString)manufacturer;
- (NSString)modelName;
- (NSString)name;
- (NSString)ppid;
- (id)description;
@end

@implementation HAPAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_denylisted, 0);
  objc_storeStrong((id *)&self->_certificationStatus, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (NSString)denylisted
{
  return self->_denylisted;
}

- (NSString)certificationStatus
{
  return self->_certificationStatus;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPAccessoryInfo *)self name];
  v5 = [(HAPAccessoryInfo *)self manufacturer];
  v6 = [(HAPAccessoryInfo *)self modelName];
  v7 = [(HAPAccessoryInfo *)self category];
  v8 = [(HAPAccessoryInfo *)self certificationStatus];
  v9 = [(HAPAccessoryInfo *)self denylisted];
  v10 = [(HAPAccessoryInfo *)self ppid];
  v11 = [v3 stringWithFormat:@"Name: %@, Manufacturer: %@, Model: %@, Category: %@, Certification Status: %@, denylisted: %@, ppid: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isDenylisted
{
  v2 = [(HAPAccessoryInfo *)self denylisted];
  v3 = [v2 uppercaseString];
  char v4 = [@"YES" isEqualToString:v3];

  return v4;
}

- (BOOL)isCertified
{
  v2 = [(HAPAccessoryInfo *)self certificationStatus];
  v3 = [v2 uppercaseString];
  char v4 = [@"CERTIFIED" isEqualToString:v3];

  return v4;
}

- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v15 = (__CFString *)a3;
  id v16 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v17 = a9;
  if (!v15)
  {
    context = (void *)MEMORY[0x1D944E080]();
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = id v23 = v16;
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory name is Unknown", buf, 0xCu);

      id v16 = v23;
    }

    v15 = @"Unknown";
  }
  v29.receiver = self;
  v29.super_class = (Class)HAPAccessoryInfo;
  v20 = [(HAPAccessoryInfo *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, v15);
    objc_storeStrong((id *)&v21->_manufacturer, a4);
    objc_storeStrong((id *)&v21->_modelName, a5);
    objc_storeStrong((id *)&v21->_category, a6);
    objc_storeStrong((id *)&v21->_certificationStatus, a7);
    objc_storeStrong((id *)&v21->_denylisted, a8);
    objc_storeStrong((id *)&v21->_ppid, a9);
    v21->_authenticated = 0;
  }

  return v21;
}

@end
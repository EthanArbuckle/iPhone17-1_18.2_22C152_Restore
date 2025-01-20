@interface MSPublicDBInfo
+ (BOOL)supportsSecureCoding;
- (MSPublicDBInfo)initWithCoder:(id)a3;
- (MSPublicDBInfo)initWithServiceName:(id)a3 serviceID:(id)a4;
- (NSArray)bundleIDS;
- (NSString)configurationPublicKey;
- (NSString)recordName;
- (NSString)serviceID;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSURL)serviceIconPath;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIDS:(id)a3;
- (void)setConfigurationPublicKey:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setServiceIconPath:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation MSPublicDBInfo

- (MSPublicDBInfo)initWithServiceName:(id)a3 serviceID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSPublicDBInfo;
    v11 = [(MSPublicDBInfo *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_serviceName, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, @"serviceName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, @"serviceIdentifier");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordName, @"recordName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceType, @"serviceType");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceIconPath, @"serviceIconPath");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_bundleIDS, @"bundleIDS");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configurationPublicKey, @"configurationPublicKey");
  v4 = [v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceName forKey:@"_serviceName"];
  [v4 encodeObject:self->_serviceID forKey:@"_serviceID"];
  [v4 encodeObject:self->_recordName forKey:@"_recordName"];
  [v4 encodeObject:self->_serviceType forKey:@"_serviceType"];
  [v4 encodeObject:self->_serviceIconPath forKey:@"_serviceIconPath"];
  [v4 encodeObject:self->_configurationPublicKey forKey:@"_configurationPublicKey"];
  bundleIDS = self->_bundleIDS;
  id v9 = 0;
  v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:bundleIDS requiringSecureCoding:1 error:&v9];
  id v7 = v9;
  id v8 = v7;
  if (v7) {
    NSLog(&cfstr_ErrorEncodingB.isa, v7);
  }
  [v4 encodeObject:v6 forKey:@"_bundleIDS"];
}

- (MSPublicDBInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceName"];
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  if (self->_serviceName
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceID"],
        id v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        serviceID = self->_serviceID,
        self->_serviceID = v7,
        serviceID,
        self->_serviceID))
  {
    id v9 = -[MSPublicDBInfo initWithServiceName:serviceID:](self, "initWithServiceName:serviceID:", self->_serviceName);
    if (v9)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordName"];
      recordName = v9->_recordName;
      v9->_recordName = (NSString *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceType"];
      serviceType = v9->_serviceType;
      v9->_serviceType = (NSString *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceIconPath"];
      serviceIconPath = v9->_serviceIconPath;
      v9->_serviceIconPath = (NSURL *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_configurationPublicKey"];
      configurationPublicKey = v9->_configurationPublicKey;
      v9->_configurationPublicKey = (NSString *)v16;

      v18 = [v4 decodeObjectForKey:@"_bundleIDS"];
      v19 = (void *)MEMORY[0x263F08928];
      v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      uint64_t v24 = [v19 unarchivedObjectOfClasses:v23 fromData:v18 error:0];
      bundleIDS = v9->_bundleIDS;
      v9->_bundleIDS = (NSArray *)v24;
    }
    self = v9;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)configurationPublicKey
{
  return self->_configurationPublicKey;
}

- (void)setConfigurationPublicKey:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSURL)serviceIconPath
{
  return self->_serviceIconPath;
}

- (void)setServiceIconPath:(id)a3
{
}

- (NSArray)bundleIDS
{
  return self->_bundleIDS;
}

- (void)setBundleIDS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDS, 0);
  objc_storeStrong((id *)&self->_serviceIconPath, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_configurationPublicKey, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
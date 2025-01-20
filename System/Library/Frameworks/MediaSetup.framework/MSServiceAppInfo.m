@interface MSServiceAppInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)useInHome;
- (MSServiceAppInfo)initWithCoder:(id)a3;
- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4;
- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4 useInHome:(BOOL)a5 subscriptionStatus:(int64_t)a6;
- (NSArray)alternateBundleIDS;
- (NSString)serviceBundleID;
- (NSString)serviceName;
- (id)description;
- (int64_t)subscriptionStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateBundleIDS:(id)a3;
@end

@implementation MSServiceAppInfo

- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSServiceAppInfo;
  v9 = [(MSServiceAppInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_serviceBundleID, a4);
  }

  return v10;
}

- (MSServiceAppInfo)initWithServiceName:(id)a3 serviceBundleID:(id)a4 useInHome:(BOOL)a5 subscriptionStatus:(int64_t)a6
{
  result = [(MSServiceAppInfo *)self initWithServiceName:a3 serviceBundleID:a4];
  if (result)
  {
    result->_useInHome = a5;
    result->_subscriptionStatus = a6;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, @"serviceName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceBundleID, @"bundleID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_alternateBundleIDS, @"alternateBundleID");
  v4 = [v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v5 = a3;
  [v5 encodeObject:serviceName forKey:@"MSSServiceNameEncodedKey"];
  [v5 encodeObject:self->_serviceBundleID forKey:@"MSSServiceBundleIDEncodedKey"];
  [v5 encodeObject:self->_alternateBundleIDS forKey:@"MSSAlternateBundleIDSEncodedKey"];
}

- (MSServiceAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSServiceNameEncodedKey"];
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSServiceBundleIDEncodedKey"];
  serviceBundleID = self->_serviceBundleID;
  self->_serviceBundleID = v7;

  v9 = [(MSServiceAppInfo *)self initWithServiceName:self->_serviceName serviceBundleID:self->_serviceBundleID];
  if (v9)
  {
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    objc_super v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"MSSAlternateBundleIDSEncodedKey"];
    alternateBundleIDS = v9->_alternateBundleIDS;
    v9->_alternateBundleIDS = (NSArray *)v13;
  }
  return v9;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceBundleID
{
  return self->_serviceBundleID;
}

- (NSArray)alternateBundleIDS
{
  return self->_alternateBundleIDS;
}

- (void)setAlternateBundleIDS:(id)a3
{
}

- (BOOL)useInHome
{
  return self->_useInHome;
}

- (int64_t)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateBundleIDS, 0);
  objc_storeStrong((id *)&self->_serviceBundleID, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
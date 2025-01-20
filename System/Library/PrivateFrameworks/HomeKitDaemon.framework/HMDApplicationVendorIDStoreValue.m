@interface HMDApplicationVendorIDStoreValue
+ (BOOL)supportsSecureCoding;
- (BOOL)spiClient;
- (HMDApplicationVendorIDStoreValue)initWithCoder:(id)a3;
- (HMDApplicationVendorIDStoreValue)initWithVendorIDSha1:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6;
- (NSData)vendorIdSha1;
- (NSString)applicationBundleId;
- (NSString)companionAppBundleId;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDApplicationVendorIDStoreValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionAppBundleId, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_vendorIdSha1, 0);
}

- (BOOL)spiClient
{
  return self->_spiClient;
}

- (NSString)companionAppBundleId
{
  return self->_companionAppBundleId;
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (NSData)vendorIdSha1
{
  return self->_vendorIdSha1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(HMDApplicationVendorIDStoreValue *)self vendorIdSha1];
  [v7 encodeObject:v4 forKey:@"HM.vendorID"];

  v5 = [(HMDApplicationVendorIDStoreValue *)self applicationBundleId];
  [v7 encodeObject:v5 forKey:@"HM.applicationBundleID"];

  v6 = [(HMDApplicationVendorIDStoreValue *)self companionAppBundleId];
  [v7 encodeObject:v6 forKey:@"HM.companionApplicationBundleID"];

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDApplicationVendorIDStoreValue spiClient](self, "spiClient"), @"HM.isSPIApplication");
}

- (HMDApplicationVendorIDStoreValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDApplicationVendorIDStoreValue *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.vendorID"];
    uint64_t v7 = [v6 copy];
    vendorIdSha1 = v5->_vendorIdSha1;
    v5->_vendorIdSha1 = (NSData *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.applicationBundleID"];
    uint64_t v10 = [v9 copy];
    applicationBundleId = v5->_applicationBundleId;
    v5->_applicationBundleId = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.companionApplicationBundleID"];
    uint64_t v13 = [v12 copy];
    companionAppBundleId = v5->_companionAppBundleId;
    v5->_companionAppBundleId = (NSString *)v13;

    v5->_spiClient = [v4 decodeBoolForKey:@"HM.isSPIApplication"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMDApplicationVendorIDStoreValue *)self vendorIdSha1];
  v5 = [(HMDApplicationVendorIDStoreValue *)self applicationBundleId];
  v6 = [(HMDApplicationVendorIDStoreValue *)self companionAppBundleId];
  [(HMDApplicationVendorIDStoreValue *)self spiClient];
  uint64_t v7 = HMFBooleanToString();
  v8 = [v3 stringWithFormat:@"[V:%@, A:%@, C:%@ S:%@]", v4, v5, v6, v7];

  return v8;
}

- (HMDApplicationVendorIDStoreValue)initWithVendorIDSha1:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDApplicationVendorIDStoreValue;
  uint64_t v13 = [(HMDApplicationVendorIDStoreValue *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    vendorIdSha1 = v13->_vendorIdSha1;
    v13->_vendorIdSha1 = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    applicationBundleId = v13->_applicationBundleId;
    v13->_applicationBundleId = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    companionAppBundleId = v13->_companionAppBundleId;
    v13->_companionAppBundleId = (NSString *)v18;

    v13->_spiClient = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
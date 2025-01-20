@interface HUSoftwareLibraryLookupRequest
- (HMAccessory)accessory;
- (HUSoftwareLibraryLookupRequest)initWithAccessory:(id)a3;
- (HUSoftwareLibraryLookupRequest)initWithBundleID:(id)a3 storeID:(id)a4;
- (NSString)bundleID;
- (NSString)storeID;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUSoftwareLibraryLookupRequest

- (HUSoftwareLibraryLookupRequest)initWithBundleID:(id)a3 storeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareLibraryLookupRequest;
  v9 = [(HUSoftwareLibraryLookupRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_storeID, a4);
  }

  return v10;
}

- (HUSoftwareLibraryLookupRequest)initWithAccessory:(id)a3
{
  id v5 = a3;
  v6 = [v5 bundleID];
  id v7 = [v5 storeID];
  id v8 = [(HUSoftwareLibraryLookupRequest *)self initWithBundleID:v6 storeID:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_accessory, a3);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(HUSoftwareLibraryLookupRequest *)self bundleID];
  v6 = [(HUSoftwareLibraryLookupRequest *)self storeID];
  id v7 = (void *)[v4 initWithBundleID:v5 storeID:v6];

  uint64_t v8 = [(HUSoftwareLibraryLookupRequest *)self accessory];
  v9 = (void *)v7[3];
  v7[3] = v8;

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
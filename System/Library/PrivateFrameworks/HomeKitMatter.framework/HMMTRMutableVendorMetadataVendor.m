@interface HMMTRMutableVendorMetadataVendor
- (id)copyWithZone:(_NSZone *)a3;
- (void)addProduct:(id)a3;
- (void)copyVendorDetailsFromVendor:(id)a3;
- (void)removeProductWithID:(id)a3;
@end

@implementation HMMTRMutableVendorMetadataVendor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMMTRVendorMetadataVendor allocWithZone:a3];
  v5 = [(HMMTRVendorMetadataVendor *)self identifier];
  v6 = [(HMMTRVendorMetadataVendor *)v4 initWithIdentifier:v5];

  v7 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  [(HMMTRVendorMetadataVendor *)v6 setProductsByProductID:v7];

  v8 = [(HMMTRVendorMetadataVendor *)self name];
  [(HMMTRVendorMetadataVendor *)v6 setName:v8];

  v9 = [(HMMTRVendorMetadataVendor *)self appStoreID];
  [(HMMTRVendorMetadataVendor *)v6 setAppStoreID:v9];

  v10 = [(HMMTRVendorMetadataVendor *)self appBundleID];
  [(HMMTRVendorMetadataVendor *)v6 setAppBundleID:v10];

  [(HMMTRVendorMetadataVendor *)v6 setInvalid:[(HMMTRVendorMetadataVendor *)self invalid]];
  return v6;
}

- (void)copyVendorDetailsFromVendor:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  [(HMMTRVendorMetadataVendor *)self setName:v5];

  v6 = [v4 appStoreID];
  [(HMMTRVendorMetadataVendor *)self setAppStoreID:v6];

  v7 = [v4 appBundleID];
  [(HMMTRVendorMetadataVendor *)self setAppBundleID:v7];

  uint64_t v8 = [v4 invalid];
  [(HMMTRVendorMetadataVendor *)self setInvalid:v8];
}

- (void)removeProductWithID:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  id v6 = (id)[v5 mutableCopy];

  [v6 setObject:0 forKeyedSubscript:v4];
  [(HMMTRVendorMetadataVendor *)self setProductsByProductID:v6];
}

- (void)addProduct:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  id v7 = (id)[v5 mutableCopy];

  id v6 = [v4 identifier];
  [v7 setObject:v4 forKeyedSubscript:v6];

  [(HMMTRVendorMetadataVendor *)self setProductsByProductID:v7];
}

@end
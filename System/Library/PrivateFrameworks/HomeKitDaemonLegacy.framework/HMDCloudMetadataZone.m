@interface HMDCloudMetadataZone
+ (id)zoneRootRecordName;
+ (id)zoneSubscriptionName:(id)a3;
+ (void)createMetadataZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7;
- (HMDCloudRecord)metadataRecord;
- (void)setMetadataRecord:(id)a3;
- (void)setServerChangeToken:(id)a3;
@end

@implementation HMDCloudMetadataZone

- (void).cxx_destruct
{
}

- (void)setMetadataRecord:(id)a3
{
}

- (HMDCloudRecord)metadataRecord
{
  return self->_metadataRecord;
}

- (void)setServerChangeToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCloudMetadataZone;
  [(HMDCloudZone *)&v4 setServerChangeToken:a3];
  [(HMDCloudZone *)self updateCurrentServerChangeToken];
}

+ (void)createMetadataZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(id)objc_opt_class() zoneRootRecordName];
  v17 = [(id)objc_opt_class() zoneSubscriptionName:v15];
  v18 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__HMDCloudMetadataZone_createMetadataZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E6A099A0;
  id v21 = v11;
  id v19 = v11;
  [v18 createZoneWithName:v15 rootRecordName:v16 subscriptionName:v17 owner:v14 cacheZone:v13 cloudCache:v12 completion:v20];
}

uint64_t __89__HMDCloudMetadataZone_createMetadataZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)zoneSubscriptionName:(id)a3
{
  return @"E5E36C6B-A621-4F46-A593-E7EE5E6BC437";
}

+ (id)zoneRootRecordName
{
  return @"C67B4CFE-EAC3-463D-B4CE-E61F5C6CE005";
}

@end
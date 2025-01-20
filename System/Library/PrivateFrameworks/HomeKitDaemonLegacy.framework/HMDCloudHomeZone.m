@interface HMDCloudHomeZone
+ (id)zoneRootRecordName;
+ (id)zoneSharedRootRecordName;
+ (id)zoneSubscriptionName:(id)a3;
+ (void)createHomeZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7;
- (BOOL)isSharedHome;
- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3;
- (id)description;
- (void)setServerChangeToken:(id)a3;
@end

@implementation HMDCloudHomeZone

- (BOOL)isSharedHome
{
  return self->_sharedHome;
}

- (void)setServerChangeToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCloudHomeZone;
  [(HMDCloudZone *)&v4 setServerChangeToken:a3];
  [(HMDCloudZone *)self updateCurrentServerChangeToken];
}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  v3 = [[HMDCloudHomeZoneChange alloc] initWithZone:self temporaryCache:a3];
  return v3;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(HMDCloudZone *)self shortDescription];
  v5 = [(HMDCloudZone *)self rootGroup];
  v6 = [v3 stringWithFormat:@"<%@, Root Group = %@>", v4, v5];

  return v6;
}

+ (void)createHomeZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
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
  v20[2] = __81__HMDCloudHomeZone_createHomeZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E6A099A0;
  id v21 = v11;
  id v19 = v11;
  [v18 createZoneWithName:v15 rootRecordName:v16 subscriptionName:v17 owner:v14 cacheZone:v13 cloudCache:v12 completion:v20];
}

uint64_t __81__HMDCloudHomeZone_createHomeZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)zoneSubscriptionName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"_Subscription"];
}

+ (id)zoneSharedRootRecordName
{
  return @"1D8E88C5-7EEA-49D7-8E63-A060A96A224B";
}

+ (id)zoneRootRecordName
{
  return @"4B0A9686-599F-487E-B2B0-B63BF838D813";
}

@end
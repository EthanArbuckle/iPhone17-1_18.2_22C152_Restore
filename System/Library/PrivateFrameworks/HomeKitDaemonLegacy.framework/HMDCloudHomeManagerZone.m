@interface HMDCloudHomeManagerZone
+ (id)zoneRootRecordName;
+ (id)zoneSubscriptionName:(id)a3;
+ (void)createHomeManagerZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7;
- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3;
- (void)setServerChangeToken:(id)a3;
@end

@implementation HMDCloudHomeManagerZone

- (void)setServerChangeToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCloudHomeManagerZone;
  [(HMDCloudZone *)&v4 setServerChangeToken:a3];
  [(HMDCloudZone *)self updateCurrentServerChangeToken];
}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  v3 = [[HMDCloudHomeManagerZoneChange alloc] initWithZone:self temporaryCache:a3];
  return v3;
}

+ (void)createHomeManagerZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
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
  v20[2] = __95__HMDCloudHomeManagerZone_createHomeManagerZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E6A099A0;
  id v21 = v11;
  id v19 = v11;
  [v18 createZoneWithName:v15 rootRecordName:v16 subscriptionName:v17 owner:v14 cacheZone:v13 cloudCache:v12 completion:v20];
}

uint64_t __95__HMDCloudHomeManagerZone_createHomeManagerZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)zoneSubscriptionName:(id)a3
{
  return @"089DAA62-C6FD-4BB1-9EDE-17126F6076F7";
}

+ (id)zoneRootRecordName
{
  return @"14730983-0D6D-4F74-8076-4F5953FD83EB";
}

@end
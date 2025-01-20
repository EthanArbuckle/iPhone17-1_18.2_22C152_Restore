@interface HMDLegacyCloudDatabase
+ (id)recordZoneIDForLegacyName:(id)a3;
- (HMDLegacyCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4;
- (id)createLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)mirrorLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6;
@end

@implementation HMDLegacyCloudDatabase

- (id)createLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:a3];
  v13 = mirrorLegacyZone(self, 1, v12, v11, v10, (uint64_t)a6);

  return v13;
}

- (id)mirrorLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:a3];
  v13 = mirrorLegacyZone(self, 0, v12, v11, v10, (uint64_t)a6);

  return v13;
}

- (HMDLegacyCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyCloudDatabase;
  v4 = [(HMBCloudDatabase *)&v7 initWithLocalDatabase:a3 configuration:a4];
  v5 = v4;
  if (v4) {
    [(HMBCloudDatabase *)v4 setCloudZoneFactory:&__block_literal_global_104131];
  }
  return v5;
}

id __62__HMDLegacyCloudDatabase_initWithLocalDatabase_configuration___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  objc_super v7 = objc_alloc_init(HMDMutableLegacyCloudZoneConfiguration);
  v8 = [v5 zoneID];
  v9 = [v8 zoneID];
  id v10 = [v9 zoneName];
  char v11 = [v10 isEqual:@"HomeDataBlobZone"];

  if (v11)
  {
    v12 = off_264A124A8;
  }
  else
  {
    v13 = [v5 zoneID];
    v14 = [v13 zoneID];
    v15 = [v14 zoneName];
    int v16 = [v15 isEqual:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5"];

    if (v16) {
      v17 = @"14730983-0D6D-4F74-8076-4F5953FD83EB";
    }
    else {
      v17 = @"4B0A9686-599F-487E-B2B0-B63BF838D813";
    }
    [(HMDLegacyCloudZoneConfiguration *)v7 setRootRecordName:v17];
    v12 = off_264A124C8;
  }
  v18 = (void *)[objc_alloc(*v12) initWithCloudDatabase:v6 configuration:v7 state:v5];

  return v18;
}

+ (id)recordZoneIDForLegacyName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFD808];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithZoneName:v4 ownerName:*MEMORY[0x263EFD488]];

  return v6;
}

@end
@interface HMDLegacyCloudZoneConfiguration
- (NSString)rootRecordName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setRootRecordName:(id)a3;
@end

@implementation HMDLegacyCloudZoneConfiguration

- (void).cxx_destruct
{
}

- (void)setRootRecordName:(id)a3
{
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[HMDMutableLegacyCloudZoneConfiguration allocWithZone:a3] init];
  v5 = [(HMDLegacyCloudZoneConfiguration *)self rootRecordName];
  [(HMDLegacyCloudZoneConfiguration *)v4 setRootRecordName:v5];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyCloudZoneConfiguration;
  id v4 = [(HMBCloudZoneConfiguration *)&v7 copyWithZone:a3];
  v5 = [(HMDLegacyCloudZoneConfiguration *)self rootRecordName];
  [v4 setRootRecordName:v5];

  return v4;
}

@end
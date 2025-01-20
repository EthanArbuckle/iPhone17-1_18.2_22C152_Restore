@interface HMDMatterCapabilitiesFactory
+ (id)makeInstanceForAssetFilename:(int64_t)a3;
- (HMDMatterCapabilitiesFactory)init;
@end

@implementation HMDMatterCapabilitiesFactory

+ (id)makeInstanceForAssetFilename:(int64_t)a3
{
  id v3 = sub_22F69A580(a3);
  return v3;
}

- (HMDMatterCapabilitiesFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDMatterCapabilitiesFactory;
  return [(HMDMatterCapabilitiesFactory *)&v3 init];
}

@end
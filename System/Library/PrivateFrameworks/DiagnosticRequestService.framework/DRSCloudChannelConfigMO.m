@interface DRSCloudChannelConfigMO
+ (id)fetchRequest;
@end

@implementation DRSCloudChannelConfigMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSCloudChannelConfigMO"];
}

@end
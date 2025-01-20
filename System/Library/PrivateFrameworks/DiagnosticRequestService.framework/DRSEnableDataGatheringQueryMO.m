@interface DRSEnableDataGatheringQueryMO
+ (id)fetchRequest;
@end

@implementation DRSEnableDataGatheringQueryMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSEnableDataGatheringQueryMO"];
}

@end
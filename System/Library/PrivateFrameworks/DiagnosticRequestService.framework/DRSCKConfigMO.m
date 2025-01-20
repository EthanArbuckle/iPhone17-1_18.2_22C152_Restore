@interface DRSCKConfigMO
+ (id)fetchRequest;
@end

@implementation DRSCKConfigMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSCKConfigMO"];
}

@end
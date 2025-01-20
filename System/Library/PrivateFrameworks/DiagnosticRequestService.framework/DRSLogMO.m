@interface DRSLogMO
+ (id)fetchRequest;
@end

@implementation DRSLogMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSLogMO"];
}

@end
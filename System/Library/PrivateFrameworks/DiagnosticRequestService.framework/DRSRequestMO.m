@interface DRSRequestMO
+ (id)fetchRequest;
@end

@implementation DRSRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSRequestMO"];
}

@end
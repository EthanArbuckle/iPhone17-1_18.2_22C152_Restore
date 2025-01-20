@interface DRSSubmitRapidLogRequestMO
+ (id)fetchRequest;
@end

@implementation DRSSubmitRapidLogRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSSubmitRapidLogRequestMO"];
}

@end
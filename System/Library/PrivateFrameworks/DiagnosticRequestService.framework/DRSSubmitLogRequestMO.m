@interface DRSSubmitLogRequestMO
+ (id)fetchRequest;
@end

@implementation DRSSubmitLogRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSSubmitLogRequestMO"];
}

@end
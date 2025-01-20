@interface DRSSubmitLogToCKContainerRequestMO
+ (id)fetchRequest;
@end

@implementation DRSSubmitLogToCKContainerRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSSubmitLogToCKContainerRequestMO"];
}

@end
@interface DRSTailspinRequestMO
+ (id)fetchRequest;
@end

@implementation DRSTailspinRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSTailspinRequestMO"];
}

@end
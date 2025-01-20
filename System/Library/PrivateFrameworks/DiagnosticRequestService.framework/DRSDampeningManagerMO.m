@interface DRSDampeningManagerMO
+ (id)fetchRequest;
@end

@implementation DRSDampeningManagerMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSDampeningManagerMO"];
}

@end
@interface BMItemMO
+ (id)fetchRequest;
@end

@implementation BMItemMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Item"];
}

@end
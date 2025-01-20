@interface CustomCategory
+ (id)fetchRequest;
@end

@implementation CustomCategory

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"CustomCategory"];
}

@end
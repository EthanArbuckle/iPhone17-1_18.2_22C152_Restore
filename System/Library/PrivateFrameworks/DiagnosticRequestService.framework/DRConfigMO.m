@interface DRConfigMO
+ (id)fetchRequest;
@end

@implementation DRConfigMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRConfigMO"];
}

@end
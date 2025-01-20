@interface DRSDampeningConfigurationMO
+ (id)fetchRequest;
@end

@implementation DRSDampeningConfigurationMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSDampeningConfigurationMO"];
}

@end
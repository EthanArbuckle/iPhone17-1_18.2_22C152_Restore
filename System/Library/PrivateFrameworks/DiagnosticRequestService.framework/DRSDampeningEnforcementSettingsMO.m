@interface DRSDampeningEnforcementSettingsMO
+ (id)fetchRequest;
@end

@implementation DRSDampeningEnforcementSettingsMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSDampeningEnforcementSettingsMO"];
}

@end
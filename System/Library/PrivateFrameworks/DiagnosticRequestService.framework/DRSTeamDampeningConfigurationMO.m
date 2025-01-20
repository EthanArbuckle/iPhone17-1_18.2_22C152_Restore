@interface DRSTeamDampeningConfigurationMO
+ (id)fetchRequest;
@end

@implementation DRSTeamDampeningConfigurationMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSTeamDampeningConfigurationMO"];
}

@end
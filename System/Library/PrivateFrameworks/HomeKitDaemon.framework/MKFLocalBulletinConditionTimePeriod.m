@interface MKFLocalBulletinConditionTimePeriod
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinConditionTimePeriod

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinConditionTimePeriod"];
}

@end
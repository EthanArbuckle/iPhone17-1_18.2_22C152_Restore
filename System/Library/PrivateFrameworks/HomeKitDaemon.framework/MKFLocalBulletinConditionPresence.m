@interface MKFLocalBulletinConditionPresence
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinConditionPresence

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinConditionPresence"];
}

@end
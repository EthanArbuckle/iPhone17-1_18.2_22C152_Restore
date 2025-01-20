@interface MKFLocalBulletinCondition
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinCondition

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinCondition"];
}

@end
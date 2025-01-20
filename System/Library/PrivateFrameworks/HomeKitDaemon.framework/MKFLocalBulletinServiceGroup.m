@interface MKFLocalBulletinServiceGroup
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinServiceGroup

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinServiceGroup"];
}

@end
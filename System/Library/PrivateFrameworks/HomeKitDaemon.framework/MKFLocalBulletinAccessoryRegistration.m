@interface MKFLocalBulletinAccessoryRegistration
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinAccessoryRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinAccessoryRegistration"];
}

@end
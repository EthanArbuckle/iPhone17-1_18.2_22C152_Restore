@interface MKFLocalBulletinRegistration
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinRegistration"];
}

@end
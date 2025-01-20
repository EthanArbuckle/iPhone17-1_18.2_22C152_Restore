@interface BBBulletinService
- (id)initNoop;
@end

@implementation BBBulletinService

- (id)initNoop
{
  v3.receiver = self;
  v3.super_class = (Class)BBBulletinService;
  return [(BBBulletinService *)&v3 init];
}

@end
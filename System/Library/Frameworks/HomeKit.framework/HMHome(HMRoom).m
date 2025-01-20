@interface HMHome(HMRoom)
- (HMRoom)roomForEntireHome;
@end

@implementation HMHome(HMRoom)

- (HMRoom)roomForEntireHome
{
  return self->_roomForEntireHome;
}

@end
@interface ICSMirroringToMacAlert
- (ICSMirroringToMacAlert)init;
- (NSString)defaultButtonTitle;
- (NSString)title;
- (void)defaultResponse;
- (void)show;
@end

@implementation ICSMirroringToMacAlert

- (NSString)title
{
  return (NSString *)sub_100182EA8(self, (uint64_t)a2, (void (*)(void))sub_100182E08);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)sub_100182EA8(self, (uint64_t)a2, (void (*)(void))sub_100182F24);
}

- (void)defaultResponse
{
}

- (void)show
{
  v2 = self;
  sub_100182FC0();
}

- (ICSMirroringToMacAlert)init
{
  return (ICSMirroringToMacAlert *)sub_1001831FC();
}

@end
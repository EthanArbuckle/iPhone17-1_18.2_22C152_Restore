@interface ICSInterruptCallAlert
- (ICSInterruptCallAlert)init;
- (ICSInterruptCallAlert)initWithCallback:(id)a3;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSString)title;
- (void)defaultResponse;
@end

@implementation ICSInterruptCallAlert

- (ICSInterruptCallAlert)initWithCallback:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (ICSInterruptCallAlert *)sub_1001BFD40((uint64_t)sub_10017C7CC, v4);
}

- (NSString)title
{
  return (NSString *)sub_1001BFFA4(self, (uint64_t)a2, (void (*)(void))sub_1001BFE18);
}

- (NSString)message
{
  return (NSString *)sub_1001BFFA4(self, (uint64_t)a2, (void (*)(void))sub_1001BFE9C);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)sub_1001BFFA4(self, (uint64_t)a2, (void (*)(void))sub_1001BFF20);
}

- (NSString)otherButtonTitle
{
  return (NSString *)sub_1001BFFA4(self, (uint64_t)a2, (void (*)(void))sub_1001C0020);
}

- (void)defaultResponse
{
  v2 = self;
  sub_1001C008C();
}

- (ICSInterruptCallAlert)init
{
}

- (void).cxx_destruct
{
}

@end
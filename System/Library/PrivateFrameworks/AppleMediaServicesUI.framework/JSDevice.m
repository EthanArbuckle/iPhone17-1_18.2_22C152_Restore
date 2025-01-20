@interface JSDevice
- (BOOL)isBundle;
- (NSString)os;
- (NSString)osVersion;
- (NSString)productType;
- (_TtC14amsengagementd8JSDevice)init;
@end

@implementation JSDevice

- (NSString)osVersion
{
  return (NSString *)sub_10001796C(self, (uint64_t)a2, (void (*)(void))sub_100017A3C);
}

- (NSString)productType
{
  return (NSString *)sub_10001796C(self, (uint64_t)a2, (void (*)(void))sub_100017A48);
}

- (_TtC14amsengagementd8JSDevice)init
{
  return (_TtC14amsengagementd8JSDevice *)sub_100053E00();
}

- (BOOL)isBundle
{
  v2 = self;
  unsigned __int8 v3 = sub_1000DE0F0();

  return v3 & 1;
}

- (NSString)os
{
  return (NSString *)sub_10001796C(self, (uint64_t)a2, (void (*)(void))sub_1000DE134);
}

@end
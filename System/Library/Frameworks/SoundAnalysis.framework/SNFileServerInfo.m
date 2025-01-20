@interface SNFileServerInfo
- (NSString)identifier;
- (NSString)idsDeviceID;
- (NSString)model;
- (NSString)name;
- (SNFileServerInfo)init;
@end

@implementation SNFileServerInfo

- (NSString)identifier
{
  return (NSString *)sub_1DCAC14D0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCAC13E0);
}

- (NSString)idsDeviceID
{
  return (NSString *)sub_1DCAC14D0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCAC1430);
}

- (NSString)model
{
  return (NSString *)sub_1DCAC14D0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCAC1480);
}

- (NSString)name
{
  return (NSString *)sub_1DCAC14D0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCAC1520);
}

- (SNFileServerInfo)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
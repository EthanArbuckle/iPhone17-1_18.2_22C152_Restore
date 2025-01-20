@interface JSDeviceObject
- (BOOL)supportsHEIF;
- (NSString)buildType;
- (NSString)carrier;
- (NSString)guid;
- (NSString)language;
- (NSString)modelPartNumber;
- (NSString)productType;
- (NSString)serial;
- (_TtC16UtilityExtension14JSDeviceObject)init;
@end

@implementation JSDeviceObject

- (NSString)buildType
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018D44);
}

- (NSString)carrier
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018E38);
}

- (NSString)guid
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018EC8);
}

- (NSString)language
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018EEC);
}

- (NSString)modelPartNumber
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018F10);
}

- (NSString)productType
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018F64);
}

- (NSString)serial
{
  return (NSString *)sub_100018DC8(self, (uint64_t)a2, (void (*)(void))sub_100018FE8);
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (_TtC16UtilityExtension14JSDeviceObject)init
{
  return (_TtC16UtilityExtension14JSDeviceObject *)sub_10001903C();
}

@end
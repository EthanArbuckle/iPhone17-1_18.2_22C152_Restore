@interface JSDeviceObject
- (BOOL)supportsHEIF;
- (NSString)buildType;
- (NSString)carrier;
- (NSString)guid;
- (NSString)language;
- (NSString)modelPartNumber;
- (NSString)productType;
- (NSString)serial;
- (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject)init;
@end

@implementation JSDeviceObject

- (NSString)buildType
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_100017FDC);
}

- (NSString)carrier
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_1000180D0);
}

- (NSString)guid
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_100018160);
}

- (NSString)language
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_100018184);
}

- (NSString)modelPartNumber
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_1000181A8);
}

- (NSString)productType
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_1000181FC);
}

- (NSString)serial
{
  return (NSString *)sub_100018060(self, (uint64_t)a2, (void (*)(void))sub_100018280);
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject *)sub_1000182D4();
}

@end
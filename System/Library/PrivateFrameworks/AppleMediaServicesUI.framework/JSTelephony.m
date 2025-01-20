@interface JSTelephony
- (BOOL)hasTelephonyCapability;
- (BOOL)hasTelephonyEntitlement;
- (NSString)countryCode;
- (NSString)networkCode;
- (NSString)phoneNumber;
- (NSString)providerName;
- (NSString)radioTechnology;
- (NSString)radioType;
- (NSString)simStatus;
- (_TtC14amsengagementd11JSTelephony)init;
@end

@implementation JSTelephony

- (_TtC14amsengagementd11JSTelephony)init
{
  return (_TtC14amsengagementd11JSTelephony *)sub_100013CE8();
}

- (NSString)countryCode
{
  return (NSString *)sub_1000FD8F4(self, (uint64_t)a2, (void (*)(void))sub_1000FD154);
}

- (NSString)networkCode
{
  return (NSString *)sub_1000FD8F4(self, (uint64_t)a2, (void (*)(void))sub_1000FD1D8);
}

- (NSString)phoneNumber
{
  return (NSString *)sub_1000FD8F4(self, (uint64_t)a2, (void (*)(void))sub_1000FD574);
}

- (NSString)providerName
{
  return (NSString *)sub_1000FD8F4(self, (uint64_t)a2, (void (*)(void))sub_1000FD974);
}

- (NSString)radioTechnology
{
  return (NSString *)sub_1000FDDA0(self, (uint64_t)a2, (void (*)(void))sub_1000FDD7C);
}

- (NSString)radioType
{
  return (NSString *)sub_1000FDDA0(self, (uint64_t)a2, (void (*)(void))sub_1000FDE1C);
}

- (NSString)simStatus
{
  v2 = self;
  sub_1000FDF50();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)hasTelephonyCapability
{
  v2 = self;
  char v3 = sub_1000FDFF8();

  return v3 & 1;
}

- (BOOL)hasTelephonyEntitlement
{
  v2 = self;
  char v3 = sub_100009FE0();

  return v3 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd11JSTelephony_telephonyEntitlementFineGrained));
  swift_bridgeObjectRelease();
}

@end
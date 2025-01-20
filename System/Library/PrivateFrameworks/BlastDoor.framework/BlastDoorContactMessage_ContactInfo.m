@interface BlastDoorContactMessage_ContactInfo
- (BlastDoorContactMessage_ContactInfo)init;
- (NSString)contactFormatterTitle;
- (NSString)contactNameSubtitle;
- (NSString)contactNameTitle;
- (NSString)description;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)organizationNameSubtitle;
- (NSString)organizationNameTitle;
@end

@implementation BlastDoorContactMessage_ContactInfo

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)familyName
{
  return (NSString *)sub_1B17AA7A8();
}

- (NSString)givenName
{
  return (NSString *)sub_1B17A7844();
}

- (NSString)organizationNameTitle
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo);
}

- (NSString)contactFormatterTitle
{
  return (NSString *)sub_1B17A7974((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo);
}

- (NSString)contactNameTitle
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)organizationNameSubtitle
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)contactNameSubtitle
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorContactMessage_ContactInfo)init
{
  result = (BlastDoorContactMessage_ContactInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
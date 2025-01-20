@interface IdentityElementRawValueKeys
+ (NSString)address;
+ (NSString)age;
+ (NSString)dateOfBirth;
+ (NSString)documentDHSComplianceStatus;
+ (NSString)documentExpirationDate;
+ (NSString)documentIssueDate;
+ (NSString)documentNumber;
+ (NSString)drivingPrivileges;
+ (NSString)familyName;
+ (NSString)givenName;
+ (NSString)issuingAuthority;
+ (NSString)portrait;
+ (NSString)sex;
+ (id)ageIsOver:(int64_t)a3;
- (_TtC7CoreIDV27IdentityElementRawValueKeys)init;
@end

@implementation IdentityElementRawValueKeys

+ (NSString)givenName
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)familyName
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)sex
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)portrait
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)address
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)issuingAuthority
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)documentDHSComplianceStatus
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)documentExpirationDate
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)documentNumber
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)documentIssueDate
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)drivingPrivileges
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)age
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)dateOfBirth
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (id)ageIsOver:(int64_t)a3
{
  sub_2148A21A8();
  sub_2148A1BE8();
  swift_bridgeObjectRelease();
  sub_2148A1BE8();
  v3 = (void *)sub_2148A1B78();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC7CoreIDV27IdentityElementRawValueKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityElementRawValueKeys();
  return [(IdentityElementRawValueKeys *)&v3 init];
}

@end
@interface JSAccount
- (BOOL)hasFamilySharingEnabled;
- (BOOL)hasiCloudFamily;
- (BOOL)isHSA2;
- (NSDictionary)flags;
- (NSDictionary)privacyAcknowledgement;
- (NSString)altDsid;
- (NSString)credits;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)storefront;
- (NSString)username;
- (_TtC14amsengagementd9JSAccount)init;
@end

@implementation JSAccount

- (BOOL)isHSA2
{
  v2 = self;
  unsigned __int8 v3 = sub_10000CB90();

  return v3 & 1;
}

- (NSString)dsid
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ECC4);
}

- (void).cxx_destruct
{
}

- (NSString)firstName
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ED54);
}

- (NSString)username
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ED60);
}

- (NSString)lastName
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ED6C);
}

- (NSString)fullName
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ED78);
}

- (NSString)storefront
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_10001ED84);
}

- (NSString)altDsid
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_1000CEE40);
}

- (NSString)credits
{
  return (NSString *)sub_10001EBD4(self, (uint64_t)a2, (void (*)(void))sub_1000CEE64);
}

- (NSDictionary)flags
{
  return (NSDictionary *)sub_1000CF09C(self, (uint64_t)a2, (uint64_t (*)(void))sub_1000CEE88);
}

- (BOOL)hasFamilySharingEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1000CEF58();

  return v3 & 1;
}

- (BOOL)hasiCloudFamily
{
  v2 = self;
  unsigned __int8 v3 = sub_1000CEF98();

  return v3 & 1;
}

- (NSDictionary)privacyAcknowledgement
{
  return (NSDictionary *)sub_1000CF09C(self, (uint64_t)a2, sub_1000CF124);
}

- (_TtC14amsengagementd9JSAccount)init
{
}

@end
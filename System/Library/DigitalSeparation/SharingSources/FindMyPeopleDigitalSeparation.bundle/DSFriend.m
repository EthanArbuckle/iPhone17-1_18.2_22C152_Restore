@interface DSFriend
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (_TtC29FindMyPeopleDigitalSeparation8DSFriend)init;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation DSFriend

- (int64_t)role
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_role);
}

- (int64_t)permission
{
  return 1;
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)0;
}

- (NSString)unifiedContactIdentifier
{
  if (*(void *)&self->role[OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendContactIdentifier])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_9548();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)emailAddress
{
  v3 = self;
  v4 = self;
  NSString v5 = sub_9548();
  LODWORD(v3) = [v3 isStringEmailAddress:v5];

  if (v3)
  {
    swift_bridgeObjectRetain();

    NSString v6 = sub_9548();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)phoneNumber
{
  uint64_t v3 = self;
  v4 = self;
  NSString v5 = sub_9548();
  LOBYTE(v3) = [(id)v3 isStringEmailAddress:v5];

  if (v3)
  {

    NSString v6 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();

    NSString v6 = sub_9548();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v6;
}

- (_TtC29FindMyPeopleDigitalSeparation8DSFriend)init
{
  result = (_TtC29FindMyPeopleDigitalSeparation8DSFriend *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
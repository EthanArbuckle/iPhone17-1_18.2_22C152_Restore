@interface PersonalNicknameNameProvider
- (_TtC11MobilePhone28PersonalNicknameNameProvider)init;
- (id)familyName;
- (id)givenName;
- (id)middleName;
- (id)nickname;
@end

@implementation PersonalNicknameNameProvider

- (_TtC11MobilePhone28PersonalNicknameNameProvider)init
{
  result = (_TtC11MobilePhone28PersonalNicknameNameProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone28PersonalNicknameNameProvider_personalNickname));
}

- (id)givenName
{
  return @objc PersonalNicknameNameProvider.givenName()((char *)self, (uint64_t)a2, (SEL *)&selRef_firstName);
}

- (id)middleName
{
  return 0;
}

- (id)familyName
{
  return @objc PersonalNicknameNameProvider.givenName()((char *)self, (uint64_t)a2, (SEL *)&selRef_lastName);
}

- (id)nickname
{
  return 0;
}

@end
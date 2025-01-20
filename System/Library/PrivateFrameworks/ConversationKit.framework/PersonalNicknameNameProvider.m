@interface PersonalNicknameNameProvider
- (_TtC15ConversationKit28PersonalNicknameNameProvider)init;
- (id)familyName;
- (id)givenName;
- (id)middleName;
- (id)nickname;
@end

@implementation PersonalNicknameNameProvider

- (_TtC15ConversationKit28PersonalNicknameNameProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PersonalNicknameNameProvider_personalNickname));
}

- (id)givenName
{
  return @objc PersonalNicknameNameProvider.givenName()(self, (uint64_t)a2, (uint64_t (*)(void))PersonalNicknameNameProvider.givenName());
}

- (id)middleName
{
  return 0;
}

- (id)familyName
{
  return @objc PersonalNicknameNameProvider.givenName()(self, (uint64_t)a2, (uint64_t (*)(void))PersonalNicknameNameProvider.familyName());
}

- (id)nickname
{
  return 0;
}

@end
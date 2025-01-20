@interface NameAndPhotoUtilities
+ (void)prewarm;
- (_TtC15ConversationKit21NameAndPhotoUtilities)init;
- (void)handleIdsStatusChanged;
- (void)handlePersonalNicknameChanged:(id)a3;
@end

@implementation NameAndPhotoUtilities

+ (void)prewarm
{
}

- (_TtC15ConversationKit21NameAndPhotoUtilities)init
{
  return (_TtC15ConversationKit21NameAndPhotoUtilities *)NameAndPhotoUtilities.init()();
}

- (void)handleIdsStatusChanged
{
  v2 = self;
  NameAndPhotoUtilities.handleIdsStatusChanged()();
}

- (void)handlePersonalNicknameChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  NameAndPhotoUtilities.handlePersonalNicknameChanged(_:)((NSNotification)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_personalNickname));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_personalAvatarView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_imNicknameProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_imNicknameController));

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_idsLookupManager);
}

@end
@interface PersonalNicknameAvatarProvider
- (_TtC15ConversationKit30PersonalNicknameAvatarProvider)init;
- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4;
@end

@implementation PersonalNicknameAvatarProvider

- (_TtC15ConversationKit30PersonalNicknameAvatarProvider)init
{
}

- (void).cxx_destruct
{
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit30PersonalNicknameAvatarProvider_imageData), *(void *)&self->imageData[OBJC_IVAR____TtC15ConversationKit30PersonalNicknameAvatarProvider_imageData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = _Block_copy(a4);
  _Block_copy(v7);
  v8 = self;
  specialized PersonalNicknameAvatarProvider.generateAvatarImage(of:imageHandler:)((uint64_t)v8, (void (**)(void, void, void))v7, width, height);
  _Block_release(v7);
}

@end
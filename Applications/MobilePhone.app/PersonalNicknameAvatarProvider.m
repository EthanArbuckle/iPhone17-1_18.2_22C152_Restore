@interface PersonalNicknameAvatarProvider
- (_TtC11MobilePhone30PersonalNicknameAvatarProvider)init;
- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4;
@end

@implementation PersonalNicknameAvatarProvider

- (_TtC11MobilePhone30PersonalNicknameAvatarProvider)init
{
  result = (_TtC11MobilePhone30PersonalNicknameAvatarProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobilePhone30PersonalNicknameAvatarProvider_imageData), *(void *)&self->imageData[OBJC_IVAR____TtC11MobilePhone30PersonalNicknameAvatarProvider_imageData]);
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
  specialized PersonalNicknameAvatarProvider.generateAvatarImage(of:imageHandler:)((uint64_t)v8, (uint64_t)v7, width, height);
  _Block_release(v7);
  _Block_release(v7);
}

@end
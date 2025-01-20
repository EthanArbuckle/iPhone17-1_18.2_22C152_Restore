@interface STKEmojiGenerationRemoteController
- (STKEmojiGenerationRemoteController)initWithCoder:(id)a3;
- (STKEmojiGenerationRemoteController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP10StickerKit39EmojiGenerationRemoteControllerDelegate_)delegate;
- (id)activityType;
- (void)setDelegate:(id)a3;
@end

@implementation STKEmojiGenerationRemoteController

- (id)activityType
{
  sub_2453FFB38();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtP10StickerKit39EmojiGenerationRemoteControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR___STKEmojiGenerationRemoteController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2456A0530](v2);

  return (_TtP10StickerKit39EmojiGenerationRemoteControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (STKEmojiGenerationRemoteController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
    void *v6 = 0;
    v6[1] = 0;
    swift_unknownObjectWeakInit();
    id v7 = a4;
    v8 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
    void *v9 = 0;
    v9[1] = 0;
    swift_unknownObjectWeakInit();
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for EmojiGenerationRemoteController();
  v11 = [(RemoteBaseSceneHostingController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (STKEmojiGenerationRemoteController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
  void *v5 = 0;
  v5[1] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmojiGenerationRemoteController();
  return [(RemoteBaseSceneHostingController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___STKEmojiGenerationRemoteController_delegate;

  sub_245203A28((uint64_t)v3);
}

@end
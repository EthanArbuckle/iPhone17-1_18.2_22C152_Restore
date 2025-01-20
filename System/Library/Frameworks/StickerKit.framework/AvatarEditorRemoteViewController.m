@interface AvatarEditorRemoteViewController
- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityType;
@end

@implementation AvatarEditorRemoteViewController

- (id)activityType
{
  sub_2453FFB38();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    id v6 = a4;
    v7 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AvatarEditorRemoteViewController();
  v9 = [(RemoteBaseSceneHostingController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AvatarEditorRemoteViewController();
  return [(RemoteBaseSceneHostingController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
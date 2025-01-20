@interface StickerRemotePhotosViewController
- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityType;
- (void)stickerPhotosViewControllerShouldDismiss;
- (void)stickerPhotosViewControllerWithDidCreate:(id)a3;
- (void)stickerPhotosViewControllerWithDidCreate:(id)a3 isLive:(BOOL)a4;
@end

@implementation StickerRemotePhotosViewController

- (id)activityType
{
  sub_2453FFB38();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    id v6 = a4;
    v7 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StickerRemotePhotosViewController();
  v9 = [(RemoteBaseSceneHostingController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StickerRemotePhotosViewController();
  return [(RemoteBaseSceneHostingController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)stickerPhotosViewControllerShouldDismiss
{
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x2456A0530](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    objc_super v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)stickerPhotosViewControllerWithDidCreate:(id)a3
{
  sub_2453FF878();
  sub_2453FFD18();
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x2456A0530](v4))
  {
    uint64_t v5 = *((void *)v4 + 1);
    swift_getObjectType();
    objc_super v6 = *(void (**)(void))(v5 + 16);
    v7 = self;
    v6();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)stickerPhotosViewControllerWithDidCreate:(id)a3 isLive:(BOOL)a4
{
  objc_super v6 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x2456A0530](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    id v8 = *(void (**)(void))(v7 + 24);
    id v9 = a3;
    v10 = self;
    v8();

    swift_unknownObjectRelease();
  }
}

@end
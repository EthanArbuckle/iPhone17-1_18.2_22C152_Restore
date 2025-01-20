@interface AvatarStickersViewController
- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)stickerSheetControllerProvider:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6;
- (void)stickerSheetControllerDidScrollToContentOffset:(CGPoint)a3;
- (void)stickerSheetControllerDidUpdateContent;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AvatarStickersViewController

- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100078784();
}

- (void)viewDidLoad
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x108);
  v6 = self;
  v2();
  id v3 = [(AvatarStickersViewController *)v6 view];
  if (v3)
  {
    v4 = v3;
    type metadata accessor for KeylineView();
    v5 = sub_10004F960(v4);
    (*(void (**)(void *))((swift_isaMask & (uint64_t)v6->super.super.super.isa) + 0xA0))(v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100077E8C();
}

- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22StickersUltraExtension28AvatarStickersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_stickerSheetView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_keyline));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)stickerSheetControllerProvider:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6
{
  uint64_t v8 = sub_100078F50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100078F30();
  uint64_t v12 = sub_10007A250();
  uint64_t v14 = v13;
  sub_10007A250();
  id v15 = a3;
  v16 = self;
  id v17 = sub_1000788D0((uint64_t)v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v17;
}

- (void)stickerSheetControllerDidScrollToContentOffset:(CGPoint)a3
{
  double y = a3.y;
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x98);
  uint64_t v8 = self;
  v5 = (_TtC22StickersUltraExtension28AvatarStickersViewController *)v4();
  if (v5)
  {
    v6 = v5;
    (*(void (**)(double))((swift_isaMask & (uint64_t)v5->super.super.super.isa) + 0x58))(y);

    v7 = v6;
  }
  else
  {
    v7 = v8;
  }
}

- (void)stickerSheetControllerDidUpdateContent
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x110);
  id v3 = self;
  v2();
}

@end
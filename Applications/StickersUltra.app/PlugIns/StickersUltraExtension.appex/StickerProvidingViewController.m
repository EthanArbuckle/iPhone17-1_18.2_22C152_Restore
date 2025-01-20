@interface StickerProvidingViewController
- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StickerProvidingViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StickerProvidingViewController();
  id v4 = v8.receiver;
  [(StickerProvidingViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 view];
  if (v5)
  {
    v6 = v5;
    id v7 = [self clearColor];
    [v6 setBackgroundColor:v7];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10007A250();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22StickersUltraExtension30StickerProvidingViewController *)sub_10005464C(v5, v7, a4);
}

- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension30StickerProvidingViewController *)sub_100054774(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension30StickerProvidingViewController_activeController);
}

@end
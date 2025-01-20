@interface EmojiForegroundSpiralLayersViewController
- (BOOL)_canShowWhileLocked;
- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation EmojiForegroundSpiralLayersViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *)EmojiForegroundSpiralLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B8FB3E4();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiForegroundSpiralLayersViewController();
  id v4 = v5.receiver;
  [(EmojiForegroundSpiralLayersViewController *)&v5 viewIsAppearing:v3];
  sub_20B8FBA54();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiForegroundSpiralLayersViewController();
  id v2 = v3.receiver;
  [(EmojiForegroundSpiralLayersViewController *)&v3 viewDidLayoutSubviews];
  sub_20B8FBFC8();
}

- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController_logger;
  uint64_t v4 = sub_20B9267F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_20B8EBE30((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController_configuration, (uint64_t)v5);
  sub_20B8EC000((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_20B8EC06C);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
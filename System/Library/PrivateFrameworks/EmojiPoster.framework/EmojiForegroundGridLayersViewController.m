@interface EmojiForegroundGridLayersViewController
- (BOOL)_canShowWhileLocked;
- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EmojiForegroundGridLayersViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController *)EmojiForegroundGridLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B8EC820();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20B8ECAA0();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8ECBF0();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for EmojiForegroundGridLayersViewController();
  [(EmojiForegroundGridLayersViewController *)&v6 didMoveToParentViewController:v4];
}

- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundGridLayersViewController_logger;
  uint64_t v4 = sub_20B9267F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_20B8EBE30((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundGridLayersViewController_configuration, (uint64_t)v5);
  sub_20B8EC000((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_20B8EC06C);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
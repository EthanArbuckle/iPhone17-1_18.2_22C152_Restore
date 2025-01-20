@interface EmojiForegroundLayersViewController
- (BOOL)_canShowWhileLocked;
- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation EmojiForegroundLayersViewController

- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster35EmojiForegroundLayersViewController *)EmojiForegroundLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiForegroundLayersViewController();
  id v2 = v5.receiver;
  [(EmojiForegroundLayersViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setClipsToBounds_, 0);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster35EmojiForegroundLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_implementationVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_dimmingView));
  sub_20B8EBE30((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_configuration, (uint64_t)v3);
  sub_20B8EC000((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_20B8EC06C);
}

@end
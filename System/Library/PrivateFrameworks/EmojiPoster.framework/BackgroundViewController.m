@interface BackgroundViewController
- (BOOL)_canShowWhileLocked;
- (_TtC11EmojiPoster24BackgroundViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster24BackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BackgroundViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B92408C();
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BackgroundViewController();
  v2 = (char *)v14.receiver;
  [(BackgroundViewController *)&v14 viewDidLayoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_dimmingLayer];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC11EmojiPoster24BackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_20B926948();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11EmojiPoster24BackgroundViewController *)BackgroundViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster24BackgroundViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster24BackgroundViewController *)BackgroundViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_20B8E7820(*(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_backgroundConfiguration));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11EmojiPoster24BackgroundViewController_dimmingLayer);
}

@end
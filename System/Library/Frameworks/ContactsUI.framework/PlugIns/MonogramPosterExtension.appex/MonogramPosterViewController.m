@interface MonogramPosterViewController
- (BOOL)_canShowWhileLocked;
- (_TtC23MonogramPosterExtension28MonogramPosterViewController)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension28MonogramPosterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation MonogramPosterViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000046B4();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MonogramPosterViewController();
  id v6 = a3;
  id v7 = v8.receiver;
  [(MonogramPosterViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  sub_100004CC4();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC23MonogramPosterExtension28MonogramPosterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100016360();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC23MonogramPosterExtension28MonogramPosterViewController *)sub_100005180(v5, v7, a4);
}

- (_TtC23MonogramPosterExtension28MonogramPosterViewController)initWithCoder:(id)a3
{
  return (_TtC23MonogramPosterExtension28MonogramPosterViewController *)sub_10000537C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_logger;
  uint64_t v4 = sub_100016290();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel);
}

@end
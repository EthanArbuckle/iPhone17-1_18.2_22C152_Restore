@interface BackdropViewController
- (BOOL)_canShowWhileLocked;
- (_TtC13MediaRemoteUI22BackdropViewController)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI22BackdropViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)displayLinkFiredWithSender:(id)a3;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage:(id)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BackdropViewController

- (_TtC13MediaRemoteUI22BackdropViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13MediaRemoteUI22BackdropViewController *)sub_10000D1B4(v5, v7, a4);
}

- (_TtC13MediaRemoteUI22BackdropViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000EB20();
}

- (void)loadView
{
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for BackdropViewController();
  [(BackdropViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropViewController();
  v4 = v6.receiver;
  [(BackdropViewController *)&v6 viewWillAppear:v3];
  sub_10000E6F8();
  char v5 = v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen];
  v4[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 1;
  if ((v5 & 1) == 0) {
    sub_10000E068();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10000D7C0(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BackdropViewController();
  id v4 = v7.receiver;
  id v5 = a3;
  [(BackdropViewController *)&v7 didMoveToParentViewController:v5];
  if (v5)
  {
  }
  else
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [Strong invalidate];

    swift_unknownObjectWeakAssign();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateImage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_super v7 = self;
  sub_10000DC0C((uint64_t)a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10000DF4C((uint64_t)a3);
}

- (void)displayLinkFiredWithSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_backdropRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer));

  swift_unknownObjectWeakDestroy();
}

@end
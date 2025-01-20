@interface B332SetupViewController
- (_TtC18SharingViewService23B332SetupViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService23B332SetupViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService23B332SetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B332SetupViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000BBE54(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000BC16C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = sub_100069EE0;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  sub_1000BCB4C();
  sub_100017C38((uint64_t)v6);
}

- (void)dealloc
{
  v2 = self;
  sub_1000BC42C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC));

  swift_unknownObjectWeakDestroy();
}

- (_TtC18SharingViewService23B332SetupViewController)initWithMainController:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B332SetupViewController();
  return [(SVSBaseViewController *)&v6 initWithMainController:a3];
}

- (_TtC18SharingViewService23B332SetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
    swift_unknownObjectWeakInit();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
    swift_unknownObjectWeakInit();
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for B332SetupViewController();
  v9 = [(B332SetupViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18SharingViewService23B332SetupViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B332SetupViewController();
  return [(B332SetupViewController *)&v6 initWithCoder:a3];
}

@end
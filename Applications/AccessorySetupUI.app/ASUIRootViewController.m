@interface ASUIRootViewController
- (_TtC16AccessorySetupUI22ASUIRootViewController)init;
- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithCoder:(id)a3;
- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation ASUIRootViewController

- (_TtC16AccessorySetupUI22ASUIRootViewController)init
{
  return (_TtC16AccessorySetupUI22ASUIRootViewController *)sub_100004C88();
}

- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router);
  v5[1] = 0;
  v5[2] = 0;
  void *v5 = 0;
  id v6 = a3;

  result = (_TtC16AccessorySetupUI22ASUIRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ASUIRootViewController();
  [(ASUIRootViewController *)&v2 viewDidLoad];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_100005A7C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_100005A00;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015768;
  aBlock[3] = &unk_100059098;
  v9 = _Block_copy(aBlock);
  v10 = self;
  sub_100005A24((uint64_t)v6);
  swift_release();
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for ASUIRootViewController();
  [(ASUIRootViewController *)&v11 dismissViewControllerAnimated:v4 completion:v9];
  _Block_release(v9);
  sub_100005A34((uint64_t)v6);
}

- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16AccessorySetupUI22ASUIRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession));

  swift_unknownObjectRelease();
}

@end
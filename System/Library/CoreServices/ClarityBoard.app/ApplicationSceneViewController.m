@interface ApplicationSceneViewController
- (_TtC12ClarityBoard30ApplicationSceneViewController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ApplicationSceneViewController

- (_TtC12ClarityBoard30ApplicationSceneViewController)initWithCoder:(id)a3
{
  *(void *)&self->super.listLayoutObserver[OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_scene) = 0;
  id v5 = a3;

  result = (_TtC12ClarityBoard30ApplicationSceneViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_10004FC74();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ApplicationSceneViewController();
  [(ApplicationSceneViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1000327D8((uint64_t)self + OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_source));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_scene);
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ApplicationSceneViewController();
  v2 = (char *)v6.receiver;
  [(SceneViewControllerBase *)&v6 loadView];
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for SceneViewControllerBase();
  id v3 = [(ApplicationSceneViewController *)&v5 view];
  if (v3)
  {
    v4 = v3;
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), "setRealSafeAreaInsets:", *(double *)&v2[OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_safeAreaInsets], *(double *)&v2[OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_safeAreaInsets + 8], *(double *)&v2[OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_safeAreaInsets + 16], *(double *)&v2[OBJC_IVAR____TtC12ClarityBoard30ApplicationSceneViewController_safeAreaInsets + 24]);

    sub_10004EC10();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10004EEE0(a3);
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000515A0(v7);
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_10004F078(v6, (uint64_t)a4);
}

@end
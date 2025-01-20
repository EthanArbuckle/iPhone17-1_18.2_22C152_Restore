@interface SceneViewControllerBase
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (_TtC12ClarityBoard23SceneViewControllerBase)initWithCoder:(id)a3;
- (_TtC12ClarityBoard23SceneViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)sceneContentStateDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SceneViewControllerBase

- (_TtC12ClarityBoard23SceneViewControllerBase)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12ClarityBoard23SceneViewControllerBase_listLayoutObserver) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12ClarityBoard23SceneViewControllerBase_lastSceneInterfaceOrientation) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12ClarityBoard23SceneViewControllerBase_isAppeared) = 0;
  id v4 = a3;

  result = (_TtC12ClarityBoard23SceneViewControllerBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_1000A5484();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12ClarityBoard23SceneViewControllerBase_isAppeared) = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SceneViewControllerBase();
  id v4 = v6.receiver;
  id v5 = [(SceneViewControllerBase *)&v6 viewWillAppear:v3];
  (*(void (**)(id))((swift_isaMask & *v4) + 0xB8))(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12ClarityBoard23SceneViewControllerBase_isAppeared) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SceneViewControllerBase();
  id v4 = v6.receiver;
  id v5 = [(SceneViewControllerBase *)&v6 viewDidDisappear:v3];
  (*(void (**)(id))((swift_isaMask & *v4) + 0xC0))(v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1000A572C(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  objc_super v6 = self;
  v10[4] = sub_1000A62C8;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100033424;
  v10[3] = &unk_1001612F8;
  v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_retain();
  swift_release();
  [v6 animateWithDuration:v7 animations:0.25];
  _Block_release(v7);

  swift_release();
}

- (_TtC12ClarityBoard23SceneViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12ClarityBoard23SceneViewControllerBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
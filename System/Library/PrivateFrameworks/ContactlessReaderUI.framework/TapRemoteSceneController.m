@interface TapRemoteSceneController
- (BOOL)prefersStatusBarHidden;
- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handlePanWithSender:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TapRemoteSceneController

- (BOOL)prefersStatusBarHidden
{
  return (*((unsigned char *)&self->super.super.super.isa
          + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_showStatusBar) & 1) == 0;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return 4;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  v2 = self;
  TapRemoteSceneController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_walletSuppressor);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_hideMenuIndicatorTimer));
  swift_bridgeObjectRelease();
  sub_23EE25F78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_context));
  swift_unknownObjectWeakDestroy();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23EE20724(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23EE20958(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23EE20CF4();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_268C202D0;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v5, (uint64_t)qword_268C266A8);
  sub_23EDBA140(v10, (uint64_t)v7);
  uint64_t v11 = sub_23EF03AA8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_23EDB8D1C((uint64_t)v7, (uint64_t *)&unk_268C21A00);
  }
  else
  {
    sub_23ED9D368((uint64_t)v9, 0xD000000000000014, 0x800000023EF16850, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }
  v13 = (objc_class *)type metadata accessor for TapRemoteSceneController();
  v14.receiver = v9;
  v14.super_class = v13;
  [(TapRemoteSceneController *)&v14 viewDidDisappear:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v6 = sub_23EE1FC2C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_23EE2604C();
  sub_23EDB8970((uint64_t)v6);
}

- (void)handlePanWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23EE24E80(v4);
}

- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23EF05418();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC19ContactlessReaderUI24TapRemoteSceneController *)TapRemoteSceneController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI24TapRemoteSceneController *)TapRemoteSceneController.init(coder:)(a3);
}

@end
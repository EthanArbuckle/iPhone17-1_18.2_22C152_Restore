@interface CameraScannerFlowViewController
- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)init;
- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)onClose;
- (void)tapToRadarButtonTappedWithSender:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CameraScannerFlowViewController

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)init
{
  return (_TtC18HealthExperienceUI31CameraScannerFlowViewController *)CameraScannerFlowViewController.init()();
}

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI31CameraScannerFlowViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD6A2AA8();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CameraScannerFlowViewController();
  v4 = v6.receiver;
  id v5 = [(CameraScannerFlowViewController *)&v6 viewWillAppear:v3];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x120))(v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AD6A312C();
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)onClose
{
}

- (void)tapToRadarButtonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI31CameraScannerFlowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController_introductionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___dataScannerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___closeButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___tapToRadarButton);
}

@end
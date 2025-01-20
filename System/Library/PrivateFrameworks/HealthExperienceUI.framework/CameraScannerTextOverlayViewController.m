@interface CameraScannerTextOverlayViewController
- (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CameraScannerTextOverlayViewController

- (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground) = 1;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD723DD4();
}

- (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI38CameraScannerTextOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
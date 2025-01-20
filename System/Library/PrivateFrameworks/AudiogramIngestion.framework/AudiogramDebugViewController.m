@interface AudiogramDebugViewController
- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithCoder:(id)a3;
- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithImage:(id)a3 debugInfo:(id)a4;
- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AudiogramDebugViewController

- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithImage:(id)a3 debugInfo:(id)a4
{
  type metadata accessor for AudiogramDetectorResult();
  uint64_t v5 = sub_23F120E60();
  return (_TtC18AudiogramIngestion28AudiogramDebugViewController *)AudiogramDebugViewController.init(image:debugInfo:)((uint64_t)a3, v5);
}

- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel) = 0;
  id v4 = a3;

  result = (_TtC18AudiogramIngestion28AudiogramDebugViewController *)sub_23F121060();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23F117558();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_23F11797C(a3);
}

- (void)sliderValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23F118EA4(v4);
}

- (_TtC18AudiogramIngestion28AudiogramDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18AudiogramIngestion28AudiogramDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_image));
  swift_bridgeObjectRelease();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView));
}

@end
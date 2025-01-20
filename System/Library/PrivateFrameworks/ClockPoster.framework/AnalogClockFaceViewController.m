@interface AnalogClockFaceViewController
- (_TtC11ClockPoster29AnalogClockFaceViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation AnalogClockFaceViewController

- (_TtC11ClockPoster29AnalogClockFaceViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_clockFace;
  type metadata accessor for AnalogClockFaceView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster29AnalogClockFaceViewController *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_249F87964();
}

- (void).cxx_destruct
{
  sub_249F75BD8((uint64_t)self + OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_look);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_clockFace);
}

@end
@interface FMPFRingView
+ (Class)layerClass;
- (NSString)description;
- (_TtC11FMFindingUI12FMPFRingView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI12FMPFRingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
@end

@implementation FMPFRingView

- (_TtC11FMFindingUI12FMPFRingView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_style;
  uint64_t v5 = qword_269860300;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_269861D00;
  v9 = (void *)qword_269861D08;
  *(_OWORD *)v7 = xmmword_269861CF0;
  *((void *)v7 + 2) = v8;
  *((void *)v7 + 3) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_additionalRadiusScale) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_startAngle) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_endAngle) = 0;
  id v10 = v9;

  result = (_TtC11FMFindingUI12FMPFRingView *)sub_24D39D2B0();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_24D2BC100(0, &qword_269861D68);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_24D314184();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_startAngleSpring));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_additionalRadiusScaleSpring));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI12FMPFRingView_opacitySpring);
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_24D3156D0();
}

- (_TtC11FMFindingUI12FMPFRingView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI12FMPFRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
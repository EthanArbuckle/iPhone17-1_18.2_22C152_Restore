@interface ClimateContinuousStepper
- (CAFService)service;
- (NSUUID)trackerUUID;
- (void)didSlide:(id)a3;
- (void)layoutSubviews;
- (void)siblingDidStartSliding;
- (void)siblingDidStopSlidingWithWasIncreasing:(BOOL)a3;
- (void)siblingDidUpdateWithProgress:(double)a3;
@end

@implementation ClimateContinuousStepper

- (NSUUID)trackerUUID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CAFService)service
{
  return (CAFService *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_service));
}

- (void)layoutSubviews
{
  NSUUID v2 = self;
  sub_100099544();
}

- (void)didSlide:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10009A41C(v4);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_trackerUUID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_service));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_fillViewProgressConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_maskDownButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_maskUpButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateContinuousStepper_maskPrimaryButton));

  swift_bridgeObjectRelease();
}

- (void)siblingDidStartSliding
{
  NSUUID v2 = *(void (**)(uint64_t))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x320);
  v3 = self;
  v2(2);
  sub_10009A348(1);
}

- (void)siblingDidUpdateWithProgress:(double)a3
{
  uint64_t v4 = self;
  sub_10009B770(a3);
}

- (void)siblingDidStopSlidingWithWasIncreasing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10009B8B8(a3);
}

@end
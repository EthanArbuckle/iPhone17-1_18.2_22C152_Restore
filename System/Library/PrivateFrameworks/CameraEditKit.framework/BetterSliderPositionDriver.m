@interface BetterSliderPositionDriver
- (_TtC13CameraEditKit26BetterSliderPositionDriver)init;
- (double)distanceToDecelerate;
- (double)distanceTraveled;
- (double)velocity;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
@end

@implementation BetterSliderPositionDriver

- (_TtC13CameraEditKit26BetterSliderPositionDriver)init
{
  return (_TtC13CameraEditKit26BetterSliderPositionDriver *)sub_1BEE650E8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation);
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget);
}

- (double)velocity
{
  v2 = self;
  sub_1BEE653D0();
  double v4 = v3;

  return v4;
}

- (void)contactBeganWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE65FCC();
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE6557C(v4);
}

- (void)contactEndedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE66050();
}

@end
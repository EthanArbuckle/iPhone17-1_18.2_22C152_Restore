@interface ContactAwareSliderPositionDriver
- (_TtC13CameraEditKit32ContactAwareSliderPositionDriver)init;
- (double)distanceToDecelerate;
- (double)distanceTraveled;
- (double)velocity;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)setDistanceToDecelerate:(double)a3;
- (void)setDistanceTraveled:(double)a3;
@end

@implementation ContactAwareSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)velocity
{
  v2 = self;
  sub_1BEE68E78();
  double v4 = v3;

  return v4;
}

- (void)contactBeganWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE684A8(v4);
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE686A4(v4);
}

- (void)contactEndedWithAction:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BEE68AA4(a3);
}

- (_TtC13CameraEditKit32ContactAwareSliderPositionDriver)init
{
  return (_TtC13CameraEditKit32ContactAwareSliderPositionDriver *)sub_1BEE68F94();
}

- (void).cxx_destruct
{
}

@end
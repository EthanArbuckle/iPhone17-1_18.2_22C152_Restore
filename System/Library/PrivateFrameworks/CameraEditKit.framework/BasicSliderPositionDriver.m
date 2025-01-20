@interface BasicSliderPositionDriver
- (_TtC13CameraEditKit25BasicSliderPositionDriver)init;
- (double)distanceToDecelerate;
- (double)distanceTraveled;
- (double)velocity;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)setDistanceToDecelerate:(double)a3;
- (void)setDistanceTraveled:(double)a3;
@end

@implementation BasicSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)velocity
{
  return sub_1BEE67750();
}

- (void)contactBeganWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE67B7C();
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BEE67830(v4);
}

- (void)contactEndedWithAction:(id)a3
{
}

- (_TtC13CameraEditKit25BasicSliderPositionDriver)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)v2 = 0;
  v2[24] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)v3 = 0;
  v3[24] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BasicSliderPositionDriver();
  return [(BasicSliderPositionDriver *)&v5 init];
}

@end
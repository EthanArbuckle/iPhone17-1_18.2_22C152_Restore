@interface HIDPassthroughSliderPositionDriver
- (_TtC13CameraEditKit34HIDPassthroughSliderPositionDriver)init;
- (double)distanceToDecelerate;
- (double)distanceTraveled;
- (double)liftoffVelocity;
- (double)velocity;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)setDistanceToDecelerate:(double)a3;
- (void)setDistanceTraveled:(double)a3;
- (void)setLiftoffVelocity:(double)a3;
@end

@implementation HIDPassthroughSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)liftoffVelocity
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity);
}

- (void)setLiftoffVelocity:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = a3;
}

- (double)velocity
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity);
}

- (void)contactBeganWithAction:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = 0;
  uint64_t v4 = qword_1EA136350;
  id v5 = a3;
  v8 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1BEE6EC68();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EA1369F8);
  objc_msgSend(v5, sel__timestamp);
  sub_1BEE63CAC(v7, 0, 0, 0);
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BEE6211C(v4);
}

- (void)contactEndedWithAction:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1BEE622E4(a3);
}

- (_TtC13CameraEditKit34HIDPassthroughSliderPositionDriver)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HIDPassthroughSliderPositionDriver();
  return [(HIDPassthroughSliderPositionDriver *)&v3 init];
}

@end
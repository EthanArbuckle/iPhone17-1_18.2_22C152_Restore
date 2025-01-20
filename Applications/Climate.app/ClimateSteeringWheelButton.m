@interface ClimateSteeringWheelButton
- (_TtC7Climate26ClimateSteeringWheelButton)init;
- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4;
@end

@implementation ClimateSteeringWheelButton

- (_TtC7Climate26ClimateSteeringWheelButton)init
{
  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_currentValue) = 0;
  uint64_t v3 = OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  result = (_TtC7Climate26ClimateSteeringWheelButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_steeringWheel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_progressCircle));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_autoModeGlyph);
}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5 = a3;
  v6 = self;
  sub_10004E760();
}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10004E760();
}

@end
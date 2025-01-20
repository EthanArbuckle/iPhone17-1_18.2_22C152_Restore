@interface HNDEyeTrackingCoordinator
- (HNDEyeTrackingCoordinator)init;
- (HNDEyeTrackingCoordinator)initWithDisplayManager:(id)a3;
- (void)dismissCalibrationUI;
- (void)showCalibrationUI;
@end

@implementation HNDEyeTrackingCoordinator

- (HNDEyeTrackingCoordinator)initWithDisplayManager:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HNDEyeTrackingCoordinator_displayManager) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EyeTrackingCoordinator();
  id v4 = a3;
  return [(HNDEyeTrackingCoordinator *)&v6 init];
}

- (void)showCalibrationUI
{
  v2 = self;
  sub_1001100DC();
}

- (void)dismissCalibrationUI
{
  v2 = self;
  sub_100110388();
}

- (HNDEyeTrackingCoordinator)init
{
  result = (HNDEyeTrackingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
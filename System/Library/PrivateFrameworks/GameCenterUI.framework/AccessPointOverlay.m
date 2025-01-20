@interface AccessPointOverlay
- (void)isPresentingDashboardFromAccessPoint:(BOOL)a3;
- (void)requireOnboardingFlow;
- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(BOOL)a4;
- (void)updateAccessPointFrameCoordinates:(CGRect)a3;
@end

@implementation AccessPointOverlay

- (void)updateAccessPointFrameCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_retain();
  sub_1AF4BF15C(x, y, width, height);

  swift_release();
}

- (void)isPresentingDashboardFromAccessPoint:(BOOL)a3
{
  swift_retain();
  sub_1AF4BF1EC(a3);

  swift_release();
}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4 = sub_1AF7AE0E0();
  unint64_t v6 = v5;
  swift_retain();
  sub_1AF4BF340(v4, v6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)requireOnboardingFlow
{
  swift_retain();
  sub_1AF4BF580();

  swift_release();
}

@end
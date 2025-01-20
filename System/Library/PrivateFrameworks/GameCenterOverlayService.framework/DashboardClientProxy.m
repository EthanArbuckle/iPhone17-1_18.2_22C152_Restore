@interface DashboardClientProxy
- (void)didDismissDashboard;
- (void)finishAndPlay:(id)a3;
- (void)finishWith:(id)a3;
- (void)isPresentingDashboardFromAccessPoint:(id)a3;
- (void)quitTurnBasedMatch:(id)a3;
- (void)requireOnboardingFlow;
- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4;
- (void)updateAccessPointFrameCoordinates:(id)a3;
@end

@implementation DashboardClientProxy

- (void).cxx_destruct
{
  sub_24F9103B4((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  sub_24F9103B4((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate;
  sub_24F9103B4((uint64_t)v3);
}

- (void)didDismissDashboard
{
  v2 = self;
  DashboardClientProxy.didDismissDashboard()();
}

- (void)updateAccessPointFrameCoordinates:(id)a3
{
  id v4 = a3;
  v5 = self;
  DashboardClientProxy.updateAccessPointFrameCoordinates(_:)((NSValue)v4);
}

- (void)isPresentingDashboardFromAccessPoint:(id)a3
{
  id v4 = a3;
  v5 = self;
  DashboardClientProxy.isPresentingDashboardFromAccessPoint(_:)((NSValue)v4);
}

- (void)finishAndPlay:(id)a3
{
}

- (void)finishWith:(id)a3
{
}

- (void)quitTurnBasedMatch:(id)a3
{
}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4
{
  uint64_t v6 = sub_24F91C278();
  v8 = v7;
  id v9 = a4;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  DashboardClientProxy.setGameMode(bundleIdentifier:enabled:)(v11, (NSValue)v9);

  swift_bridgeObjectRelease();
}

- (void)requireOnboardingFlow
{
  v2 = self;
  DashboardClientProxy.requireOnboardingFlow()();
}

@end
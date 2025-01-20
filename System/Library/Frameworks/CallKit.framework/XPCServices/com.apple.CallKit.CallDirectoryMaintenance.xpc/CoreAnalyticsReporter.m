@interface CoreAnalyticsReporter
- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter)init;
- (void)sendBlastDoorWithError:(unint64_t)a3 for:(id)a4;
- (void)sendBlastDoorWithTimeInterval:(double)a3 for:(id)a4;
- (void)sendBlockingCacheHitFor:(id)a3;
- (void)sendBlockingWithError:(unint64_t)a3 for:(id)a4;
- (void)sendBlockingWithTimeInterval:(double)a3 for:(id)a4;
- (void)sendDisableWithTimeInterval:(double)a3 for:(id)a4;
- (void)sendEnableWithError:(unint64_t)a3 for:(id)a4;
- (void)sendEnableWithTimeInterval:(double)a3 for:(id)a4;
- (void)sendIdentityCacheHitFor:(id)a3;
- (void)sendIdentityWithError:(unint64_t)a3 for:(id)a4;
- (void)sendIdentityWithTimeInterval:(double)a3 for:(id)a4;
- (void)sendInstallationFor:(id)a3;
- (void)sendUninstallationFor:(id)a3;
@end

@implementation CoreAnalyticsReporter

- (void)sendBlastDoorWithTimeInterval:(double)a3 for:(id)a4
{
}

- (void)sendBlockingWithTimeInterval:(double)a3 for:(id)a4
{
}

- (void)sendIdentityWithTimeInterval:(double)a3 for:(id)a4
{
}

- (void)sendBlockingCacheHitFor:(id)a3
{
}

- (void)sendIdentityCacheHitFor:(id)a3
{
}

- (void)sendBlockingWithError:(unint64_t)a3 for:(id)a4
{
}

- (void)sendIdentityWithError:(unint64_t)a3 for:(id)a4
{
}

- (void)sendBlastDoorWithError:(unint64_t)a3 for:(id)a4
{
}

- (void)sendEnableWithTimeInterval:(double)a3 for:(id)a4
{
}

- (void)sendDisableWithTimeInterval:(double)a3 for:(id)a4
{
}

- (void)sendEnableWithError:(unint64_t)a3 for:(id)a4
{
}

- (void)sendInstallationFor:(id)a3
{
}

- (void)sendUninstallationFor:(id)a3
{
}

- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter)init
{
  return (_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter *)CoreAnalyticsReporter.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
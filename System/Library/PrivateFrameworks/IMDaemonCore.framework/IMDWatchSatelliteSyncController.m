@interface IMDWatchSatelliteSyncController
- (_TtC12IMDaemonCore31IMDWatchSatelliteSyncController)init;
- (void)satelliteStateDidChange:(BOOL)a3;
@end

@implementation IMDWatchSatelliteSyncController

- (void)satelliteStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;

  objc_msgSend(v4, sel_synchronizeSatelliteStatus_, v3);
}

- (_TtC12IMDaemonCore31IMDWatchSatelliteSyncController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IMDWatchSatelliteSyncController();
  return [(IMDWatchSatelliteSyncController *)&v3 init];
}

@end
@interface HMDSnapshotRemoteSession
- (HMDSnapshotRemoteSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9;
- (id)description;
@end

@implementation HMDSnapshotRemoteSession

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDSnapshotRemoteSession;
  v3 = [(HMDSnapshotSession *)&v6 description];
  v4 = [v2 stringWithFormat:@"Snapshot-Remote-Session: %@", v3];

  return v4;
}

- (HMDSnapshotRemoteSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9
{
  v11.receiver = self;
  v11.super_class = (Class)HMDSnapshotRemoteSession;
  char v10 = 0;
  return [(HMDSnapshotSession *)&v11 initWithSessionID:a3 accessory:a4 snapshotGetter:a5 message:a6 waitPeriod:a8 streamingTierType:a9 cameraLocallyReachable:a7 snapshotForNotification:v10];
}

@end
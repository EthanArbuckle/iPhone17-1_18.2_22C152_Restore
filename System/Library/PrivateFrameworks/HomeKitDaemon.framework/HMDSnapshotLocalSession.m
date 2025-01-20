@interface HMDSnapshotLocalSession
- (HMDSnapshotLocalSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10;
- (id)description;
- (void)addMessage:(id)a3;
@end

@implementation HMDSnapshotLocalSession

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDSnapshotLocalSession;
  v3 = [(HMDSnapshotSession *)&v6 description];
  v4 = [v2 stringWithFormat:@"Snapshot-Local-Session: %@", v3];

  return v4;
}

- (void)addMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSnapshotSession *)self sessionMessages];
  [v5 addObject:v4];
}

- (HMDSnapshotLocalSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  BOOL v10 = a9;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if (isWatch())
  {
    uint64_t v21 = 0;
  }
  else if (v10)
  {
    if (isiPadDevice() || isAppleTV()) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v22 = 4;
    if (a8 != 3) {
      uint64_t v22 = 1;
    }
    if (a8 == 2) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = v22;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDSnapshotLocalSession;
  v23 = [(HMDSnapshotSession *)&v25 initWithSessionID:v17 accessory:v18 snapshotGetter:v19 message:v20 waitPeriod:v21 streamingTierType:v10 cameraLocallyReachable:a7 snapshotForNotification:a10];

  return v23;
}

@end
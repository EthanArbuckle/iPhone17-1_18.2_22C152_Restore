@interface HMDSnapshotCompletionTimer
- (HMDSnapshotCompletionTimer)initWithSnapshotSession:(id)a3 timer:(double)a4;
- (HMDSnapshotSession)snapshotSession;
@end

@implementation HMDSnapshotCompletionTimer

- (void).cxx_destruct
{
}

- (HMDSnapshotSession)snapshotSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotSession);
  return (HMDSnapshotSession *)WeakRetained;
}

- (HMDSnapshotCompletionTimer)initWithSnapshotSession:(id)a3 timer:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDSnapshotCompletionTimer;
  v7 = [(HMFTimer *)&v10 initWithTimeInterval:0 options:a4];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_snapshotSession, v6);
  }

  return v8;
}

@end
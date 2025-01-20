@interface HMDSnapshotCacheEntry
- (HMDSnapshotCacheEntry)initWithSnapshotCharacteristicEventUUID:(id)a3 snapshotFile:(id)a4 timer:(id)a5;
- (HMDSnapshotFile)snapshotFile;
- (HMFTimer)timer;
- (NSString)snapshotCharacteristicEventUUID;
- (id)description;
- (id)snapshotRequestCompletion;
- (void)setSnapshotRequestCompletion:(id)a3;
@end

@implementation HMDSnapshotCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotRequestCompletion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_snapshotCharacteristicEventUUID, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

- (void)setSnapshotRequestCompletion:(id)a3
{
}

- (id)snapshotRequestCompletion
{
  return self->_snapshotRequestCompletion;
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (NSString)snapshotCharacteristicEventUUID
{
  return self->_snapshotCharacteristicEventUUID;
}

- (HMDSnapshotFile)snapshotFile
{
  return self->_snapshotFile;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDSnapshotCacheEntry *)self snapshotCharacteristicEventUUID];
  v5 = [(HMDSnapshotCacheEntry *)self snapshotFile];
  v6 = [v3 stringWithFormat:@"Snapshot-Characteristic-EventUUID %@, Snapshot-File %@", v4, v5];

  return v6;
}

- (HMDSnapshotCacheEntry)initWithSnapshotCharacteristicEventUUID:(id)a3 snapshotFile:(id)a4 timer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSnapshotCacheEntry;
  v12 = [(HMDSnapshotCacheEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_snapshotCharacteristicEventUUID, a3);
    objc_storeStrong((id *)&v13->_snapshotFile, a4);
    objc_storeStrong((id *)&v13->_timer, a5);
  }

  return v13;
}

@end
@interface DMCRFMBSnapshot
+ (id)snapshotIdentifierFromSnapshot:(id)a3;
- (DMCRFMBSnapshot)initWithSnapshot:(id)a3;
- (DMCRFSnapshotIdentifier)identifier;
- (MBSnapshot)snapshot;
- (NSDate)date;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSString)deviceName;
- (void)setSnapshot:(id)a3;
@end

@implementation DMCRFMBSnapshot

- (DMCRFMBSnapshot)initWithSnapshot:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCRFMBSnapshot;
  v6 = [(DMCRFMBSnapshot *)&v8 init];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_snapshot, a3);
    }
  }

  return v6;
}

+ (id)snapshotIdentifierFromSnapshot:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F559F0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 backupUUID];
  v7 = [v4 snapshotUUID];

  objc_super v8 = (void *)[v5 initWithBackupUUID:v6 snapshotUUID:v7];
  return v8;
}

- (NSDate)date
{
  v2 = [(DMCRFMBSnapshot *)self snapshot];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (NSDate)dateCreated
{
  v2 = [(DMCRFMBSnapshot *)self snapshot];
  v3 = [v2 created];

  return (NSDate *)v3;
}

- (NSDate)dateModified
{
  v2 = [(DMCRFMBSnapshot *)self snapshot];
  v3 = [v2 modified];

  return (NSDate *)v3;
}

- (NSString)deviceName
{
  v2 = [(DMCRFMBSnapshot *)self snapshot];
  v3 = [v2 deviceName];

  return (NSString *)v3;
}

- (DMCRFSnapshotIdentifier)identifier
{
  v3 = objc_opt_class();
  id v4 = [(DMCRFMBSnapshot *)self snapshot];
  id v5 = [v3 snapshotIdentifierFromSnapshot:v4];

  v6 = [[DMCRFMBSnapshotIdentifier alloc] initWithMBSnapshotIdentifier:v5];
  return (DMCRFSnapshotIdentifier *)v6;
}

- (MBSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
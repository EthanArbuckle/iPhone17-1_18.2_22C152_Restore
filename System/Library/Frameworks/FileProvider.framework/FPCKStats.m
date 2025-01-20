@interface FPCKStats
+ (BOOL)supportsSecureCoding;
- (FPCKStats)init;
- (FPCKStats)initWithCoder:(id)a3;
- (int64_t)numberOfBrokenFilesInBackupManifestCheck;
- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck;
- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck;
- (int64_t)numberOfBrokenFilesInReconciliationTableCheck;
- (int64_t)numberOfFilesChecked;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3;
- (void)setNumberOfFilesChecked:(int64_t)a3;
@end

@implementation FPCKStats

- (FPCKStats)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPCKStats;
  return [(FPCKStats *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfFilesChecked = self->_numberOfFilesChecked;
  id v5 = a3;
  [v5 encodeInteger:numberOfFilesChecked forKey:@"_numberOfFilesChecked"];
  [v5 encodeInteger:self->_numberOfBrokenFilesInFSAndFSSnapshotCheck forKey:@"_numberOfBrokenFilesInFSAndFSSnapshotCheck"];
  [v5 encodeInteger:self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck forKey:@"_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"];
  [v5 encodeInteger:self->_numberOfBrokenFilesInReconciliationTableCheck forKey:@"_numberOfBrokenFilesInReconciliationTableCheck"];
  [v5 encodeInteger:self->_numberOfBrokenFilesInBackupManifestCheck forKey:@"_numberOfBrokenFilesInBackupManifestCheck"];
}

- (FPCKStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPCKStats;
  id v5 = [(FPCKStats *)&v7 init];
  if (v5)
  {
    v5->_int64_t numberOfFilesChecked = [v4 decodeIntegerForKey:@"_numberOfFilesChecked"];
    v5->_numberOfBrokenFilesInFSAndFSSnapshotCheck = [v4 decodeIntegerForKey:@"_numberOfBrokenFilesInFSAndFSSnapshotCheck"];
    v5->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck = [v4 decodeIntegerForKey:@"_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"];
    v5->_numberOfBrokenFilesInReconciliationTableCheck = [v4 decodeIntegerForKey:@"_numberOfBrokenFilesInReconciliationTableCheck"];
    v5->_numberOfBrokenFilesInBackupManifestCheck = [v4 decodeIntegerForKey:@"_numberOfBrokenFilesInBackupManifestCheck"];
  }

  return v5;
}

- (int64_t)numberOfFilesChecked
{
  return self->_numberOfFilesChecked;
}

- (void)setNumberOfFilesChecked:(int64_t)a3
{
  self->_int64_t numberOfFilesChecked = a3;
}

- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck
{
  return self->_numberOfBrokenFilesInFSAndFSSnapshotCheck;
}

- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInFSAndFSSnapshotCheck = a3;
}

- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck
{
  return self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck;
}

- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck = a3;
}

- (int64_t)numberOfBrokenFilesInBackupManifestCheck
{
  return self->_numberOfBrokenFilesInBackupManifestCheck;
}

- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInBackupManifestCheck = a3;
}

- (int64_t)numberOfBrokenFilesInReconciliationTableCheck
{
  return self->_numberOfBrokenFilesInReconciliationTableCheck;
}

- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInReconciliationTableCheck = a3;
}

@end
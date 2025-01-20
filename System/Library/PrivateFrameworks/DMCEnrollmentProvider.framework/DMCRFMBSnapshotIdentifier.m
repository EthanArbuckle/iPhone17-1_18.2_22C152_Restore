@interface DMCRFMBSnapshotIdentifier
- (DMCRFMBSnapshotIdentifier)initWithMBSnapshotIdentifier:(id)a3;
- (MBSnapshotIdentifier)wrappedValue;
@end

@implementation DMCRFMBSnapshotIdentifier

- (DMCRFMBSnapshotIdentifier)initWithMBSnapshotIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCRFMBSnapshotIdentifier;
  v6 = [(DMCRFMBSnapshotIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedValue, a3);
  }

  return v7;
}

- (MBSnapshotIdentifier)wrappedValue
{
  return self->_wrappedValue;
}

- (void).cxx_destruct
{
}

@end
@interface _ADDeviceSyncCommandPullSnapshotResponseMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullSnapshotResponseMutation)initWithBase:(id)a3;
- (id)getSnapshot;
- (void)setSnapshot:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullSnapshotResponseMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSnapshot:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSnapshot
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_snapshot;
  }
  else
  {
    v2 = [(ADDeviceSyncCommandPullSnapshotResponse *)self->_base snapshot];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPullSnapshotResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPullSnapshotResponseMutation;
  v6 = [(_ADDeviceSyncCommandPullSnapshotResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
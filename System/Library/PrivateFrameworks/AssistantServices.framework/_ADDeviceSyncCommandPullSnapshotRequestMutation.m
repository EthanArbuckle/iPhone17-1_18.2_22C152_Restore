@interface _ADDeviceSyncCommandPullSnapshotRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullSnapshotRequestMutation)initWithBase:(id)a3;
- (id)getDataType;
- (void)setDataType:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullSnapshotRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDataType:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDataType
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_dataType;
  }
  else
  {
    v2 = [(ADDeviceSyncCommandPullSnapshotRequest *)self->_base dataType];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPullSnapshotRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPullSnapshotRequestMutation;
  v6 = [(_ADDeviceSyncCommandPullSnapshotRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
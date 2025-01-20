@interface _ADDeviceSyncMessageMutation
- (BOOL)isDirty;
- (_ADDeviceSyncMessageMutation)initWithBase:(id)a3;
- (id)getCommandPullDeltaRequest;
- (id)getCommandPullDeltaResponse;
- (id)getCommandPullGenerationsRequest;
- (id)getCommandPullGenerationsResponse;
- (id)getCommandPullSnapshotRequest;
- (id)getCommandPullSnapshotResponse;
- (id)getCommandPushGenerationsRequest;
- (id)getCommandPushGenerationsResponse;
- (int64_t)getType;
- (unint64_t)getSequence;
- (void)setCommandPullDeltaRequest:(id)a3;
- (void)setCommandPullDeltaResponse:(id)a3;
- (void)setCommandPullGenerationsRequest:(id)a3;
- (void)setCommandPullGenerationsResponse:(id)a3;
- (void)setCommandPullSnapshotRequest:(id)a3;
- (void)setCommandPullSnapshotResponse:(id)a3;
- (void)setCommandPushGenerationsRequest:(id)a3;
- (void)setCommandPushGenerationsResponse:(id)a3;
- (void)setSequence:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _ADDeviceSyncMessageMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPullSnapshotResponse, 0);
  objc_storeStrong((id *)&self->_commandPullSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_commandPullDeltaResponse, 0);
  objc_storeStrong((id *)&self->_commandPullDeltaRequest, 0);
  objc_storeStrong((id *)&self->_commandPullGenerationsResponse, 0);
  objc_storeStrong((id *)&self->_commandPullGenerationsRequest, 0);
  objc_storeStrong((id *)&self->_commandPushGenerationsResponse, 0);
  objc_storeStrong((id *)&self->_commandPushGenerationsRequest, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setCommandPullSnapshotResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getCommandPullSnapshotResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_commandPullSnapshotResponse;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullSnapshotResponse];
  }
  return v2;
}

- (void)setCommandPullSnapshotRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getCommandPullSnapshotRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_commandPullSnapshotRequest;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullSnapshotRequest];
  }
  return v2;
}

- (void)setCommandPullDeltaResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getCommandPullDeltaResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_commandPullDeltaResponse;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullDeltaResponse];
  }
  return v2;
}

- (void)setCommandPullDeltaRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getCommandPullDeltaRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_commandPullDeltaRequest;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullDeltaRequest];
  }
  return v2;
}

- (void)setCommandPullGenerationsResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getCommandPullGenerationsResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_commandPullGenerationsResponse;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullGenerationsResponse];
  }
  return v2;
}

- (void)setCommandPullGenerationsRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getCommandPullGenerationsRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_commandPullGenerationsRequest;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPullGenerationsRequest];
  }
  return v2;
}

- (void)setCommandPushGenerationsResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getCommandPushGenerationsResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_commandPushGenerationsResponse;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPushGenerationsResponse];
  }
  return v2;
}

- (void)setCommandPushGenerationsRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getCommandPushGenerationsRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_commandPushGenerationsRequest;
  }
  else
  {
    v2 = [(ADDeviceSyncMessage *)self->_base commandPushGenerationsRequest];
  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_type;
  }
  else {
    return [(ADDeviceSyncMessage *)self->_base type];
  }
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getSequence
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_sequence;
  }
  else {
    return [(ADDeviceSyncMessage *)self->_base sequence];
  }
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncMessageMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncMessageMutation;
  v6 = [(_ADDeviceSyncMessageMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
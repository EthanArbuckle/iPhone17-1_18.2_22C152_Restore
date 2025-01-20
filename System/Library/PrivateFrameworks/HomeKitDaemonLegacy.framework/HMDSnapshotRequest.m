@interface HMDSnapshotRequest
- (HMDSnapshotRequest)initWithCompletion:(id)a3;
- (id)completion;
@end

@implementation HMDSnapshotRequest

- (void).cxx_destruct
{
}

- (HMDSnapshotRequest)initWithCompletion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotRequest;
  v5 = [(HMDSnapshotRequest *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id completion = v5->_completion;
    v5->_id completion = v6;
  }
  return v5;
}

- (id)completion
{
  return self->_completion;
}

@end
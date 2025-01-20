@interface _ADDeviceSyncCommandPushGenerationsResponseMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPushGenerationsResponseMutation)initWithBase:(id)a3;
@end

@implementation _ADDeviceSyncCommandPushGenerationsResponseMutation

- (void).cxx_destruct
{
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPushGenerationsResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPushGenerationsResponseMutation;
  v6 = [(_ADDeviceSyncCommandPushGenerationsResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
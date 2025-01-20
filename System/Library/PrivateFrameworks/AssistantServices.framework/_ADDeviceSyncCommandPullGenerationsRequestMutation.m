@interface _ADDeviceSyncCommandPullGenerationsRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullGenerationsRequestMutation)initWithBase:(id)a3;
- (id)getDataTypes;
- (void)setDataTypes:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullGenerationsRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypes, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDataTypes:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDataTypes
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_dataTypes;
  }
  else
  {
    v2 = [(ADDeviceSyncCommandPullGenerationsRequest *)self->_base dataTypes];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPullGenerationsRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPullGenerationsRequestMutation;
  v6 = [(_ADDeviceSyncCommandPullGenerationsRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
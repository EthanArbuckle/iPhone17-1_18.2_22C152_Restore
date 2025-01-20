@interface _ADDeviceSyncCommandPushGenerationsRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPushGenerationsRequestMutation)initWithBase:(id)a3;
- (id)getGenerationsByDataType;
- (void)setGenerationsByDataType:(id)a3;
@end

@implementation _ADDeviceSyncCommandPushGenerationsRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationsByDataType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setGenerationsByDataType:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getGenerationsByDataType
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_generationsByDataType;
  }
  else
  {
    v2 = [(ADDeviceSyncCommandPushGenerationsRequest *)self->_base generationsByDataType];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPushGenerationsRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPushGenerationsRequestMutation;
  v6 = [(_ADDeviceSyncCommandPushGenerationsRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
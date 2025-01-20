@interface _ADDeviceSyncCommandPullDeltaRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullDeltaRequestMutation)initWithBase:(id)a3;
- (id)getDataType;
- (unint64_t)getGeneration;
- (unint64_t)getLimit;
- (void)setDataType:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation _ADDeviceSyncCommandPullDeltaRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getLimit
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_limit;
  }
  else {
    return [(ADDeviceSyncCommandPullDeltaRequest *)self->_base limit];
  }
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getGeneration
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_generation;
  }
  else {
    return [(ADDeviceSyncCommandPullDeltaRequest *)self->_base generation];
  }
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
    v2 = [(ADDeviceSyncCommandPullDeltaRequest *)self->_base dataType];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncCommandPullDeltaRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncCommandPullDeltaRequestMutation;
  v6 = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
@interface _AFInstanceInfoMutation
- (BOOL)isDirty;
- (_AFInstanceInfoMutation)initWithBase:(id)a3;
- (id)getApplicationUUID;
- (id)getInstanceUUID;
- (int64_t)getApplicationType;
- (void)setApplicationType:(int64_t)a3;
- (void)setApplicationUUID:(id)a3;
- (void)setInstanceUUID:(id)a3;
@end

@implementation _AFInstanceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUUID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setInstanceUUID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (void)setApplicationUUID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFInstanceInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFInstanceInfoMutation;
  v6 = [(_AFInstanceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (id)getInstanceUUID
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_instanceUUID;
  }
  else
  {
    v2 = [(AFInstanceInfo *)self->_base instanceUUID];
  }
  return v2;
}

- (id)getApplicationUUID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_applicationUUID;
  }
  else
  {
    v2 = [(AFInstanceInfo *)self->_base applicationUUID];
  }
  return v2;
}

- (int64_t)getApplicationType
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_applicationType;
  }
  else {
    return [(AFInstanceInfo *)self->_base applicationType];
  }
}

@end
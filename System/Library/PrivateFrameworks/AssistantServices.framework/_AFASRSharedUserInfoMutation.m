@interface _AFASRSharedUserInfoMutation
- (BOOL)isDirty;
- (_AFASRSharedUserInfoMutation)initWithBase:(id)a3;
- (id)getLoggableSharedUserId;
- (id)getPersonaId;
- (id)getSharedUserId;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setSharedUserId:(id)a3;
@end

@implementation _AFASRSharedUserInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setPersonaId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getPersonaId
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_personaId;
  }
  else
  {
    v2 = [(AFASRSharedUserInfo *)self->_base personaId];
  }
  return v2;
}

- (void)setLoggableSharedUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getLoggableSharedUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggableSharedUserId;
  }
  else
  {
    v2 = [(AFASRSharedUserInfo *)self->_base loggableSharedUserId];
  }
  return v2;
}

- (void)setSharedUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSharedUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    v2 = [(AFASRSharedUserInfo *)self->_base sharedUserId];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFASRSharedUserInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFASRSharedUserInfoMutation;
  v6 = [(_AFASRSharedUserInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
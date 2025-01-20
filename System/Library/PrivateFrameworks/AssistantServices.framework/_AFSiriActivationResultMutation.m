@interface _AFSiriActivationResultMutation
- (BOOL)isDirty;
- (_AFSiriActivationResultMutation)initWithBase:(id)a3;
- (id)getError;
- (int64_t)getActionType;
- (void)setActionType:(int64_t)a3;
- (void)setError:(id)a3;
@end

@implementation _AFSiriActivationResultMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setError:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getError
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_error;
  }
  else
  {
    v2 = [(AFSiriActivationResult *)self->_base error];
  }
  return v2;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getActionType
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_actionType;
  }
  else {
    return [(AFSiriActivationResult *)self->_base actionType];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSiriActivationResultMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriActivationResultMutation;
  v6 = [(_AFSiriActivationResultMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
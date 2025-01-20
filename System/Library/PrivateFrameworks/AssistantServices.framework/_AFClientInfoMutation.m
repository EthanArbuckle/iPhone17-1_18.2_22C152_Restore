@interface _AFClientInfoMutation
- (BOOL)isDirty;
- (_AFClientInfoMutation)initWithBase:(id)a3;
- (id)getProcessName;
- (int)getProcessIdentifier;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessName:(id)a3;
@end

@implementation _AFClientInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setProcessName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getProcessName
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_processName;
  }
  else
  {
    v2 = [(AFClientInfo *)self->_base processName];
  }
  return v2;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int)getProcessIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_processIdentifier;
  }
  else {
    return [(AFClientInfo *)self->_base processIdentifier];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFClientInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClientInfoMutation;
  v6 = [(_AFClientInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
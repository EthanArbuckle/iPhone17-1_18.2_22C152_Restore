@interface _AFApplicationContextSnapshotMutation
- (BOOL)isDirty;
- (_AFApplicationContextSnapshotMutation)initWithBase:(id)a3;
- (id)getApplicationContexts;
- (void)setApplicationContexts:(id)a3;
@end

@implementation _AFApplicationContextSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationContexts, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setApplicationContexts:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getApplicationContexts
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_applicationContexts;
  }
  else
  {
    v2 = [(AFApplicationContextSnapshot *)self->_base applicationContexts];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFApplicationContextSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFApplicationContextSnapshotMutation;
  v6 = [(_AFApplicationContextSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
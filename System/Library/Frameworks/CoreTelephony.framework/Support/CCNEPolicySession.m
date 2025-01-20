@interface CCNEPolicySession
- (BOOL)apply;
- (BOOL)dirty;
- (BOOL)removePolicyWithID:(unint64_t)a3;
- (CCNEPolicySession)init;
- (unint64_t)addPolicy:(id)a3;
- (void)setDirty:(BOOL)a3;
@end

@implementation CCNEPolicySession

- (CCNEPolicySession)init
{
  v7.receiver = self;
  v7.super_class = (Class)CCNEPolicySession;
  v2 = [(CCNEPolicySession *)&v7 init];
  if (v2)
  {
    v3 = (NEPolicySession *)objc_alloc_init((Class)NEPolicySession);
    session = v2->session;
    v2->session = v3;

    v5 = v2->session;
    if (v5) {
      [(NEPolicySession *)v5 setPriority:301];
    }
  }
  return v2;
}

- (unint64_t)addPolicy:(id)a3
{
  self->_dirty = 1;
  return (unint64_t)[(NEPolicySession *)self->session addPolicy:*((void *)a3 + 1)];
}

- (BOOL)removePolicyWithID:(unint64_t)a3
{
  self->_dirty = 1;
  return [(NEPolicySession *)self->session removePolicyWithID:a3];
}

- (BOOL)apply
{
  if (!self->_dirty) {
    return 1;
  }
  self->_dirty = 0;
  return [(NEPolicySession *)self->session apply];
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
}

@end
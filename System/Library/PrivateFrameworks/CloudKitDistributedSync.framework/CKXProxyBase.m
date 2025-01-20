@interface CKXProxyBase
- (BOOL)committed;
- (BOOL)isMutable;
- (CKXBackingStore)backingStore;
- (id)initInternal;
- (int64_t)scope;
- (void)associateWithBackingStore:(id)a3;
- (void)commit;
- (void)reset;
- (void)setScope:(int64_t)a3;
@end

@implementation CKXProxyBase

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)CKXProxyBase;
  v2 = [(CKXProxyBase *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_reset(v2, v3, v4);
  }
  return v5;
}

- (void)associateWithBackingStore:(id)a3
{
}

- (BOOL)isMutable
{
  return 0;
}

- (void)commit
{
  self->_scope = 0;
  self->_committed = 1;
}

- (void)reset
{
  self->_scope = 0;
  self->_committed = 0;
}

- (CKXBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);
  return (CKXBackingStore *)WeakRetained;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (BOOL)committed
{
  return self->_committed;
}

- (void).cxx_destruct
{
}

@end
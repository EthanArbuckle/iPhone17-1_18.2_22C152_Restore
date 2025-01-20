@interface CPLEngineWriteTransactionBlocker
- (CPLEngineWriteTransactionBlocker)initWithUnblockBlock:(id)a3;
- (void)dealloc;
- (void)unblock;
@end

@implementation CPLEngineWriteTransactionBlocker

- (void).cxx_destruct
{
}

- (void)dealloc
{
  unblock = (void (**)(id, SEL))self->_unblock;
  if (unblock) {
    unblock[2](unblock, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineWriteTransactionBlocker;
  [(CPLEngineWriteTransactionBlocker *)&v4 dealloc];
}

- (void)unblock
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = MEMORY[0x1BA994060](self->_unblock);
  id unblock = self->_unblock;
  self->_id unblock = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v5 = (void *)v6;
  }
}

- (CPLEngineWriteTransactionBlocker)initWithUnblockBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLEngineWriteTransactionBlocker;
  v5 = [(CPLEngineWriteTransactionBlocker *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    id unblock = v6->_unblock;
    v6->_id unblock = (id)v7;
  }
  return v6;
}

@end
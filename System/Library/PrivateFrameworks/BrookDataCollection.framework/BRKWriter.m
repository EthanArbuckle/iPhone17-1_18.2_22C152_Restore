@interface BRKWriter
- (BRKWriter)initWithPath:(id)a3;
- (NSString)path;
- (void)dealloc;
- (void)performWithLock:(id)a3;
@end

@implementation BRKWriter

- (BRKWriter)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRKWriter;
  v6 = [(BRKWriter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(BRKWriter *)self performSelector:sel_close];
  }
  v3.receiver = self;
  v3.super_class = (Class)BRKWriter;
  [(BRKWriter *)&v3 dealloc];
}

- (void)performWithLock:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_lock);
    v4[2](v4);

    os_unfair_lock_unlock(p_lock);
  }
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end
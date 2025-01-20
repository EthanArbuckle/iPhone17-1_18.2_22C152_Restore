@interface BRXPCSyncProxy
- (BRXPCSyncProxy)initWithXPCObject:(id)a3;
- (NSError)error;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)result;
- (void)forwardInvocation:(id)a3;
- (void)setBoolResult:(BOOL)a3 error:(id)a4;
- (void)setError:(id)a3;
- (void)setObjResult:(id)a3 error:(id)a4;
- (void)setResult:(id)a3;
@end

@implementation BRXPCSyncProxy

- (NSError)error
{
  return self->_error;
}

- (id)result
{
  return self->_result;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  target = self->_target;
  if (!target)
  {
    v6 = brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy forwardInvocation:]", 38);
    v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRXPCSyncProxy forwardInvocation:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    target = self->_target;
  }
  [target forwardInvocation:v4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  target = self->_target;
  if (!target)
  {
    uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy methodSignatureForSelector:]", 44);
    uint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRXPCSyncProxy forwardInvocation:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    target = self->_target;
  }
  v6 = [target methodSignatureForSelector:a3];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

- (BRXPCSyncProxy)initWithXPCObject:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy initWithXPCObject:]", 22);
    uint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRXPCSyncProxy initWithXPCObject:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__BRXPCSyncProxy_initWithXPCObject___block_invoke;
  v16[3] = &unk_1E59AD4C0;
  objc_copyWeak(&v17, &location);
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v16];
  target = self->_target;
  self->_target = v5;

  if (!self->_target)
  {

    self = 0;
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return self;
}

- (void)setObjResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  [(BRXPCSyncProxy *)self setResult:a3];
  [(BRXPCSyncProxy *)self setError:v6];
}

- (void)setResult:(id)a3
{
}

- (void)setError:(id)a3
{
}

void __36__BRXPCSyncProxy_initWithXPCObject___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setObjResult:0 error:v3];
}

- (void)setBoolResult:(BOOL)a3 error:(id)a4
{
  if (a3) {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a4;
  [(BRXPCSyncProxy *)self setResult:v5];
  [(BRXPCSyncProxy *)self setError:v6];
}

- (void)initWithXPCObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)forwardInvocation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
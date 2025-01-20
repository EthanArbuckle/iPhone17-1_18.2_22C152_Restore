@interface DIVerificationSession
+ (void)concludeVerification:(id)a3;
- (DIVerificationSession)initWithContext:(id)a3;
- (DIVerificationSessionContext)context;
- (id)client;
- (id)configureError;
- (void)concludeVerification;
- (void)confirmVerificationCompletedWithFeedback:(id)a3;
- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4;
- (void)setClient:(id)a3;
- (void)setConfigureError:(id)a3;
- (void)setContext:(id)a3;
- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4;
@end

@implementation DIVerificationSession

+ (void)concludeVerification:(id)a3
{
  id v5 = a3;
  v3 = objc_alloc_init(DIVClient);
  v4 = v3;
  if (v3) {
    [(DIVClient *)v3 concludeVerification:v5];
  }
}

- (DIVerificationSession)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5
    && ([v5 serviceName],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    v18.receiver = self;
    v18.super_class = (Class)DIVerificationSession;
    v9 = [(DIVerificationSession *)&v18 init];
    v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_context, a3);
      configureError = v10->_configureError;
      v10->_configureError = 0;

      v12 = objc_alloc_init(DIVClient);
      client = v10->_client;
      v10->_client = v12;

      v14 = v10->_client;
      if (v14)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __41__DIVerificationSession_initWithContext___block_invoke;
        v16[3] = &unk_26421C760;
        v10 = v10;
        v17 = v10;
        [(DIVClient *)v14 configure:v6 completion:v16];
      }
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

uint64_t __41__DIVerificationSession_initWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setConfigureError:a2];
}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DIVerificationSession *)self configureError];

  if (v8)
  {
    [(DIVerificationSession *)self setConfigureError:0];
    v9 = objc_alloc_init(DIVClient);
    [(DIVerificationSession *)self setClient:v9];

    v10 = [(DIVerificationSession *)self client];
    v11 = [(DIVerificationSession *)self context];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70__DIVerificationSession_performVerificationWithAttributes_completion___block_invoke;
    v14[3] = &unk_26421C760;
    v14[4] = self;
    [v10 configure:v11 completion:v14];
  }
  v12 = [(DIVerificationSession *)self client];

  if (v12)
  {
    v13 = [(DIVerificationSession *)self client];
    [v13 performVerificationWithAttributes:v6 completion:v7];
  }
  else
  {
    v13 = [MEMORY[0x263F087E8] errorWithDomain:@"DIVError" code:-2 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v13);
  }
}

uint64_t __70__DIVerificationSession_performVerificationWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setConfigureError:a2];
}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(DIVerificationSession *)self client];

  if (v7)
  {
    uint64_t v8 = [(DIVerificationSession *)self client];
    [v8 shareVerificationResultWithOptions:v9 completion:v6];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"DIVError" code:-2 userInfo:0];
    v6[2](v6, 0, v8);
  }
}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(DIVerificationSession *)self client];

  if (v7)
  {
    uint64_t v8 = [(DIVerificationSession *)self client];
    [v8 getVerificationResultWithOptions:v9 completion:v6];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"DIVError" code:-2 userInfo:0];
    v6[2](v6, 0, v8);
  }
}

- (void)invalidate
{
  id v2 = [(DIVerificationSession *)self client];
  [v2 invalidate];
}

- (void)concludeVerification
{
  id v2 = [(DIVerificationSession *)self client];
  [v2 concludeVerification:0];
}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(DIVerificationSession *)self client];
  [v5 confirmVerificationCompletedWithFeedback:v4];
}

- (void)setClient:(id)a3
{
  id v4 = (DIVClient *)a3;
  os_unfair_lock_lock(&self->_lock);
  client = self->_client;
  self->_client = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  id v4 = (DIVerificationSessionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfigureError:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock(&self->_lock);
  configureError = self->_configureError;
  self->_configureError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)client
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_client;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (DIVerificationSessionContext)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)configureError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_configureError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configureError, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
@interface KCSRPContext
+ (id)createWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6;
- (BOOL)isAuthenticated;
- (KCSRPContext)initWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6;
- (NSString)user;
- (ccrng_state)rng;
- (ccsrp_ctx)context;
- (const)userNameString;
- (id)dataForPassword:(id)a3;
- (id)getKey;
- (void)dealloc;
- (void)setContext:(ccsrp_ctx *)a3;
- (void)setRng:(ccrng_state *)a3;
- (void)setUser:(id)a3;
@end

@implementation KCSRPContext

- (void).cxx_destruct
{
}

- (void)setUser:(id)a3
{
}

- (NSString)user
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setContext:(ccsrp_ctx *)a3
{
  self->_context = a3;
}

- (ccsrp_ctx)context
{
  return self->_context;
}

- (BOOL)isAuthenticated
{
  v2 = [(KCSRPContext *)self context];
  return MEMORY[0x270ED8E18](v2);
}

- (id)getKey
{
  [(KCSRPContext *)self context];
  session_key = (void *)ccsrp_get_session_key();
  if (session_key) {
    session_key = (void *)[MEMORY[0x263EFF8F8] _newZeroingDataWithBytes:session_key length:0];
  }
  return session_key;
}

- (void)dealloc
{
  [(KCSRPContext *)self context];
  ccdh_ccn_size();
  [(KCSRPContext *)self context];
  [(KCSRPContext *)self context];
  cc_clear();
  free([(KCSRPContext *)self context]);
  v3.receiver = self;
  v3.super_class = (Class)KCSRPContext;
  [(KCSRPContext *)&v3 dealloc];
}

- (KCSRPContext)initWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KCSRPContext;
  v10 = [(KCSRPContext *)&v13 init];
  if (v10)
  {
    uint64_t v11 = ccdh_ccn_size();
    [(KCSRPContext *)v10 setContext:malloc_type_malloc(4 * (a4->var0 + v11) + 48, 0xF5D2908uLL)];
    [(KCSRPContext *)v10 context];
    ccsrp_ctx_init();
    [(KCSRPContext *)v10 setUser:v9];
    [(KCSRPContext *)v10 setRng:a6];
  }

  return v10;
}

- (const)userNameString
{
  id v2 = [(KCSRPContext *)self user];
  objc_super v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (id)dataForPassword:(id)a3
{
  return (id)[a3 dataUsingEncoding:4];
}

+ (id)createWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithUser:v10 digestInfo:a4 group:a5 randomSource:a6];

  return v11;
}

@end
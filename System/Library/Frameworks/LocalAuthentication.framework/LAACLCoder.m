@interface LAACLCoder
- (LAACLCoder)init;
- (id)encode;
- (void)addConstraint:(id)a3;
- (void)addCredential:(id)a3 credentialType:(int64_t)a4;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setFallbackAuthenticationType:(int64_t)a3;
@end

@implementation LAACLCoder

- (LAACLCoder)init
{
  v10.receiver = self;
  v10.super_class = (Class)LAACLCoder;
  v2 = [(LAACLCoder *)&v10 init];
  v3 = (LAACLCoder *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 8) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v4 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v5 = [MEMORY[0x1E4F1CC08] mutableCopy];
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableDictionary *)v5;

    uint64_t v7 = [v4 mutableCopy];
    credentials = v3->_credentials;
    v3->_credentials = (NSMutableDictionary *)v7;
  }
  return v3;
}

- (void)addConstraint:(id)a3
{
}

- (void)addCredential:(id)a3 credentialType:(int64_t)a4
{
  credentials = self->_credentials;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)credentials setObject:v7 forKeyedSubscript:v8];
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authType = a3;
}

- (void)setFallbackAuthenticationType:(int64_t)a3
{
  self->_fallbackAuthType = a3;
}

- (id)encode
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __20__LAACLCoder_encode__block_invoke;
  v8[3] = &unk_1E63C4750;
  v8[4] = self;
  v2 = __20__LAACLCoder_encode__block_invoke((uint64_t)v8);
  v3 = +[LAACLBuilder customACL:v2];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[LAACLBuilder denyAllACL];
  }
  v6 = v5;

  return v6;
}

LAACLBuilderCustomACLParams *__20__LAACLCoder_encode__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAACLBuilderCustomACLParams);
  [(LAACLBuilderCustomACLParams *)v2 setAuthType:*(void *)(*(void *)(a1 + 32) + 8)];
  [(LAACLBuilderCustomACLParams *)v2 setFallbackAuthType:*(void *)(*(void *)(a1 + 32) + 16)];
  [(LAACLBuilderCustomACLParams *)v2 setApConstraints:*(void *)(*(void *)(a1 + 32) + 24)];
  [(LAACLBuilderCustomACLParams *)v2 setCredentials:*(void *)(*(void *)(a1 + 32) + 32)];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
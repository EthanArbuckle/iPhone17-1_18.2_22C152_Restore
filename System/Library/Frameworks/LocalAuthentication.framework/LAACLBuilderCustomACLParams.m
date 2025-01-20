@interface LAACLBuilderCustomACLParams
- (LAACLBuilderCustomACLParams)init;
- (NSDictionary)apConstraints;
- (NSDictionary)credentials;
- (int64_t)authType;
- (int64_t)fallbackAuthType;
- (void)setApConstraints:(id)a3;
- (void)setAuthType:(int64_t)a3;
- (void)setCredentials:(id)a3;
- (void)setFallbackAuthType:(int64_t)a3;
@end

@implementation LAACLBuilderCustomACLParams

- (LAACLBuilderCustomACLParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)LAACLBuilderCustomACLParams;
  v2 = [(LAACLBuilderCustomACLParams *)&v8 init];
  v3 = (LAACLBuilderCustomACLParams *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 8) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v4 = (void *)*((void *)v2 + 3);
    v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    *((void *)v2 + 3) = MEMORY[0x1E4F1CC08];

    credentials = v3->_credentials;
    v3->_credentials = v5;
  }
  return v3;
}

- (int64_t)authType
{
  return self->_authType;
}

- (void)setAuthType:(int64_t)a3
{
  self->_authType = a3;
}

- (int64_t)fallbackAuthType
{
  return self->_fallbackAuthType;
}

- (void)setFallbackAuthType:(int64_t)a3
{
  self->_fallbackAuthType = a3;
}

- (NSDictionary)apConstraints
{
  return self->_apConstraints;
}

- (void)setApConstraints:(id)a3
{
}

- (NSDictionary)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);

  objc_storeStrong((id *)&self->_apConstraints, 0);
}

@end
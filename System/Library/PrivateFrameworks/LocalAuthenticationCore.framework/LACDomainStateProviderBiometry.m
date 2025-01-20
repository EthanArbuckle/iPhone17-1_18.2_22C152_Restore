@interface LACDomainStateProviderBiometry
+ (id)sharedInstance;
- (LACDomainStateProviderBiometry)initWithBiometryHelper:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
@end

@implementation LACDomainStateProviderBiometry

- (LACDomainStateProviderBiometry)initWithBiometryHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDomainStateProviderBiometry;
  v6 = [(LACDomainStateProviderBiometry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_helper, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstace;
  return v2;
}

void __48__LACDomainStateProviderBiometry_sharedInstance__block_invoke()
{
  v0 = [LACDomainStateProviderBiometry alloc];
  id v3 = +[LACBiometryHelper sharedInstance];
  uint64_t v1 = [(LACDomainStateProviderBiometry *)v0 initWithBiometryHelper:v3];
  v2 = (void *)sharedInstance_sharedInstace;
  sharedInstance_sharedInstace = v1;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *, void))a4;
  helper = self->_helper;
  id v8 = a3;
  uint64_t v9 = [(LACBiometryHelper *)helper biometryType];
  v10 = self->_helper;
  v11 = [v8 userID];

  id v21 = 0;
  v12 = [(LACBiometryHelper *)v10 biometryDatabaseHashForUser:v11 error:&v21];
  id v13 = v21;

  if (v13)
  {
    v14 = LACLogBiometry();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[LACDomainStateProviderBiometry domainStateForRequest:completion:]((uint64_t)v13, v14);
    }
  }
  v26 = @"kLACDomainStateResultKeyAvailableBiometryTypes";
  v15 = [NSNumber numberWithInteger:v9];
  v24 = v15;
  uint64_t v25 = MEMORY[0x263EFFA88];
  v16 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v18 = (void *)[v17 mutableCopy];

  if (v12)
  {
    v19 = [NSNumber numberWithInteger:v9];
    v22 = v19;
    v23 = v12;
    v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v18 setObject:v20 forKeyedSubscript:@"kLACDomainStateResultKeyBiometryStateHashes"];
  }
  v6[2](v6, v18, 0);
}

- (void).cxx_destruct
{
}

- (void)domainStateForRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "biometryDatabaseHashForUser returned error: %@", (uint8_t *)&v2, 0xCu);
}

@end
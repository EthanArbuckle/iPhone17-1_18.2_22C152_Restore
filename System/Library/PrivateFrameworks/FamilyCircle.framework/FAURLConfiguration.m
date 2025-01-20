@interface FAURLConfiguration
- (id)URLForEndpoint:(id)a3;
- (void)URLForEndpoint:(id)a3 withCompletion:(id)a4;
- (void)fetchAAURLConfigurationWithCompletion:(id)a3;
@end

@implementation FAURLConfiguration

- (void)URLForEndpoint:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "Desired enpoint %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke;
  v11[3] = &unk_1E6924C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(FAURLConfiguration *)self fetchAAURLConfigurationWithCompletion:v11];
}

void __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 urlForEndpoint:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (!(v6 | v7))
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "fa_familyErrorWithCode:", -1017);
  }
  if (v6)
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke_cold_1(v6, v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)URLForEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F46FF8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__FAURLConfiguration_URLForEndpoint___block_invoke;
  v9[3] = &unk_1E6924C50;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)[v5 initWithBlock:v9];

  return v7;
}

uint64_t __37__FAURLConfiguration_URLForEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) URLForEndpoint:*(void *)(a1 + 40) withCompletion:a2];
}

- (void)fetchAAURLConfigurationWithCompletion:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4BFE8];
  id v4 = a3;
  id v5 = [v3 sharedServer];
  [v5 configurationWithCompletion:v4];
}

void __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "Error getting url configuration %@", (uint8_t *)&v2, 0xCu);
}

@end
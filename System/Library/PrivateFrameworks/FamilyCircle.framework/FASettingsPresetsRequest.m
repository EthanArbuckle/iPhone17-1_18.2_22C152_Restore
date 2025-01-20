@interface FASettingsPresetsRequest
- (FASettingsPresetsRequest)initWithChildAge:(id)a3;
- (FASettingsPresetsRequest)initWithFamilyMember:(id)a3;
- (FASettingsPresetsRequest)initWithFamilyMemberAltDSID:(id)a3;
- (id)fetchCachedPresets;
- (id)fetchPresets;
- (void)fetchCachedPresetsWithCompletion:(id)a3;
- (void)fetchPresetsWithCompletion:(id)a3;
@end

@implementation FASettingsPresetsRequest

- (FASettingsPresetsRequest)initWithFamilyMember:(id)a3
{
  v4 = [a3 altDSID];
  v5 = [(FASettingsPresetsRequest *)self initWithFamilyMemberAltDSID:v4];

  return v5;
}

- (FASettingsPresetsRequest)initWithFamilyMemberAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FASettingsPresetsRequest;
  v6 = [(FAFamilyCircleRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (FASettingsPresetsRequest)initWithChildAge:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FASettingsPresetsRequest;
  v6 = [(FAFamilyCircleRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_childAge, a3);
  }

  return v7;
}

- (id)fetchPresets
{
  id v3 = objc_alloc(MEMORY[0x1E4F46FF8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__FASettingsPresetsRequest_fetchPresets__block_invoke;
  v6[3] = &unk_1E6924C00;
  v6[4] = self;
  v4 = (void *)[v3 initWithBlock:v6];
  return v4;
}

void __40__FASettingsPresetsRequest_fetchPresets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__FASettingsPresetsRequest_fetchPresets__block_invoke_2;
  v16[3] = &unk_1E6924B90;
  id v5 = v3;
  id v17 = v5;
  v6 = [v4 serviceRemoteObjectWithErrorHandler:v16];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
  v8 = _FALogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: fetching presets with altDSID", v15, 2u);
    }

    v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[4];
    v12 = [v10 requestOptions];
    [v6 fetchSettingsPresetsForMemberWithAltDSID:v11 fromCache:0 options:v12 replyBlock:v5];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: altDSID is nil fallback to fetching presets with age", v15, 2u);
    }

    v13 = *(void **)(a1 + 32);
    uint64_t v14 = v13[5];
    v12 = [v13 requestOptions];
    [v6 fetchSettingsPresetsForAge:v14 fromCache:0 options:v12 replyBlock:v5];
  }
}

uint64_t __40__FASettingsPresetsRequest_fetchPresets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPresetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FASettingsPresetsRequest *)self fetchPresets];
  [v5 onComplete:v4];
}

- (id)fetchCachedPresets
{
  id v3 = objc_alloc(MEMORY[0x1E4F46FF8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke;
  v6[3] = &unk_1E6924C00;
  v6[4] = self;
  id v4 = (void *)[v3 initWithBlock:v6];
  return v4;
}

void __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke_2;
  v16[3] = &unk_1E6924B90;
  id v5 = v3;
  id v17 = v5;
  v6 = [v4 serviceRemoteObjectWithErrorHandler:v16];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
  v8 = _FALogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: fetching cached presets with altDSID", v15, 2u);
    }

    v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[4];
    v12 = [v10 requestOptions];
    [v6 fetchSettingsPresetsForMemberWithAltDSID:v11 fromCache:1 options:v12 replyBlock:v5];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: altDSID is nil fallback to fetching cached presets with age", v15, 2u);
    }

    v13 = *(void **)(a1 + 32);
    uint64_t v14 = v13[5];
    v12 = [v13 requestOptions];
    [v6 fetchSettingsPresetsForAge:v14 fromCache:1 options:v12 replyBlock:v5];
  }
}

uint64_t __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCachedPresetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FASettingsPresetsRequest *)self fetchCachedPresets];
  [v5 onComplete:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAge, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
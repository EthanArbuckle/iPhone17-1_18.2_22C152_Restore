@interface HMRemoteLoginAnisetteDataProvider
+ (BOOL)supportsSecureCoding;
- (HMRemoteLoginAnisetteDataProvider)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (_HMContext)context;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation HMRemoteLoginAnisetteDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (HMRemoteLoginAnisetteDataProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMRemoteLoginAnisetteDataProvider;
  v5 = [(HMRemoteLoginAnisetteDataProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMRemoteLoginMessage *)[HMLegacyAnisetteDataRequest alloc] initNewMessage];
  [v8 setDsid:v7];

  objc_super v9 = [v8 messageName];
  v26 = v9;
  v10 = encodeRootObject(v8);
  v27[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  id v12 = objc_alloc(MEMORY[0x1E4F654B0]);
  v13 = [v8 messageName];
  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  v15 = [(HMRemoteLoginAnisetteDataProvider *)self uuid];
  v16 = (void *)[v14 initWithTarget:v15];
  v17 = (void *)[v12 initWithName:v13 destination:v16 payload:v11];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __78__HMRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v24 = &unk_1E5943468;
  id v25 = v6;
  id v18 = v6;
  [v17 setResponseHandler:&v21];
  v19 = [(HMRemoteLoginAnisetteDataProvider *)self context];
  v20 = [v19 messageDispatcher];
  [v20 sendMessage:v17];
}

void __78__HMRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = +[HMLegacyAnisetteDataResponse objWithDict:a3];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v8 anisetteData];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMRemoteLoginMessage *)[HMFetchAnisetteDataRequest alloc] initNewMessage];
  [v7 setShouldProvision:v4];
  id v8 = [v7 messageName];
  id v25 = v8;
  objc_super v9 = encodeRootObject(v7);
  v26[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = [v7 messageName];
  id v13 = objc_alloc(MEMORY[0x1E4F65488]);
  id v14 = [(HMRemoteLoginAnisetteDataProvider *)self uuid];
  v15 = (void *)[v13 initWithTarget:v14];
  v16 = (void *)[v11 initWithName:v12 destination:v15 payload:v10];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __93__HMRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v23 = &unk_1E5943468;
  id v24 = v6;
  id v17 = v6;
  [v16 setResponseHandler:&v20];
  id v18 = [(HMRemoteLoginAnisetteDataProvider *)self context];
  v19 = [v18 messageDispatcher];
  [v19 sendMessage:v16];
}

void __93__HMRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = +[HMFetchAnisetteDataResponse objWithDict:a3];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v8 anisetteData];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMRemoteLoginMessage *)[HMEraseAnisetteDataRequest alloc] initNewMessage];
  uint64_t v6 = [v5 messageName];
  v23 = v6;
  id v7 = encodeRootObject(v5);
  v24[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
  v10 = [v5 messageName];
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = [(HMRemoteLoginAnisetteDataProvider *)self uuid];
  id v13 = (void *)[v11 initWithTarget:v12];
  id v14 = (void *)[v9 initWithName:v10 destination:v13 payload:v8];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __65__HMRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  uint64_t v21 = &unk_1E5943468;
  id v22 = v4;
  id v15 = v4;
  [v14 setResponseHandler:&v18];
  v16 = [(HMRemoteLoginAnisetteDataProvider *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];
}

void __65__HMRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HMEraseAnisetteDataResponse objWithDict:a3];
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMRemoteLoginMessage *)[HMSyncAnisetteDataRequest alloc] initNewMessage];
  [v8 setSimData:v7];

  id v9 = [v8 messageName];
  v26 = v9;
  v10 = encodeRootObject(v8);
  v27[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  id v12 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v13 = [v8 messageName];
  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  id v15 = [(HMRemoteLoginAnisetteDataProvider *)self uuid];
  v16 = (void *)[v14 initWithTarget:v15];
  id v17 = (void *)[v12 initWithName:v13 destination:v16 payload:v11];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __72__HMRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  id v24 = &unk_1E5943468;
  id v25 = v6;
  id v18 = v6;
  [v17 setResponseHandler:&v21];
  uint64_t v19 = [(HMRemoteLoginAnisetteDataProvider *)self context];
  uint64_t v20 = [v19 messageDispatcher];
  [v20 sendMessage:v17];
}

void __72__HMRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HMSyncAnisetteDataResponse objWithDict:a3];
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMRemoteLoginMessage *)[HMProvisionAnisetteDataRequest alloc] initNewMessage];
  id v6 = [v5 messageName];
  v23 = v6;
  id v7 = encodeRootObject(v5);
  v24[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
  v10 = [v5 messageName];
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = [(HMRemoteLoginAnisetteDataProvider *)self uuid];
  id v13 = (void *)[v11 initWithTarget:v12];
  id v14 = (void *)[v9 initWithName:v10 destination:v13 payload:v8];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __69__HMRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  uint64_t v21 = &unk_1E5943468;
  id v22 = v4;
  id v15 = v4;
  [v14 setResponseHandler:&v18];
  v16 = [(HMRemoteLoginAnisetteDataProvider *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];
}

void __69__HMRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HMProvisionAnisetteDataResponse objWithDict:a3];
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
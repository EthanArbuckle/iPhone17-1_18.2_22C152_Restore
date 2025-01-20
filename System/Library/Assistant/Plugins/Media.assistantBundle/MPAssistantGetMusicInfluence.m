@interface MPAssistantGetMusicInfluence
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetMusicInfluence

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  requestAceHash = self->_requestAceHash;
  v5 = (void (**)(id, void *))a3;
  if (![(NSString *)requestAceHash length])
  {
    v6 = [(MPAssistantGetMusicInfluence *)self aceId];
    sub_1D4244ECC(@"Get Music Influence", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    int v26 = 138543362;
    v27 = v10;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Get Music Influence (invoke) <%{public}@>: invoked", (uint8_t *)&v26, 0xCu);
  }

  v11 = [MEMORY[0x1E4F319F8] standardUserDefaults];
  v12 = [v11 isPrivateListeningEnabled];
  int v13 = [v12 BOOLValue];

  v14 = [MEMORY[0x1E4F318C8] monitorForCurrentUser];
  v15 = v14;
  if (v14) {
    int v13 = [v14 isPrivateListeningEnabledForCurrentAccessory];
  }
  uint64_t v16 = v13 ^ 1u;
  id v17 = objc_alloc_init(MEMORY[0x1E4F96A28]);
  [v17 setValue:v16];
  id v18 = objc_alloc_init(MEMORY[0x1E4F96A38]);
  [v18 setSetting:v17];
  if (![(NSString *)self->_requestAceHash length])
  {
    v19 = [(MPAssistantGetMusicInfluence *)self aceId];
    sub_1D4244ECC(@"Get Music Influence", v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_requestAceHash;
    self->_requestAceHash = v20;
  }
  v22 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_requestAceHash;
    v24 = [v18 dictionary];
    int v26 = 138543618;
    v27 = v23;
    __int16 v28 = 2114;
    v29 = v24;
    _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_DEFAULT, "Get Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v26, 0x16u);
  }
  v25 = [v18 dictionary];
  v5[2](v5, v25);
}

@end
@interface MPAssistantSetMusicInfluence
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSetMusicInfluence

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantSetMusicInfluence *)self aceId];
    sub_1D4244ECC(@"Set Music Influence", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    int v42 = 138543618;
    v43 = v9;
    __int16 v44 = 1024;
    *(_DWORD *)v45 = [(SASettingSetBool *)self value];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Set Music Influence (invoke) <%{public}@>: enabled %{BOOL}u", (uint8_t *)&v42, 0x12u);
  }

  v10 = [MEMORY[0x1E4F319F8] standardUserDefaults];
  v11 = [v10 isPrivateListeningEnabled];
  uint64_t v12 = [v11 BOOLValue];

  v13 = [MEMORY[0x1E4F318C8] monitorForCurrentUser];
  v14 = v13;
  if (v13) {
    uint64_t v12 = [v13 isPrivateListeningEnabledForCurrentAccessory];
  }
  BOOL v15 = v12;
  if (![(SASettingSetBool *)self toggle]) {
    BOOL v15 = [(SASettingSetBool *)self value];
  }
  BOOL v16 = [(SASettingSetValue *)self dryRun];
  if (v12 == v15)
  {
    BOOL v25 = v16;
    if (!v16)
    {
      if (v14)
      {
        [v14 setPrivateListeningEnabledForCurrentAccessory:v15 ^ 1];
      }
      else
      {
        v26 = [NSNumber numberWithBool:v15 ^ 1];
        [v10 setPrivateListeningEnabled:v26];
      }
    }
    uint64_t v27 = v12 ^ 1;
    if (![(NSString *)self->_requestAceHash length])
    {
      v28 = [(MPAssistantSetMusicInfluence *)self aceId];
      sub_1D4244ECC(@"Set Music Influence", v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_requestAceHash;
      self->_requestAceHash = v29;
    }
    v31 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_requestAceHash;
      int v42 = 138544130;
      v43 = v32;
      __int16 v44 = 1024;
      *(_DWORD *)v45 = v25;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v27;
      __int16 v46 = 1024;
      BOOL v47 = v15;
      _os_log_impl(&dword_1D422A000, v31, OS_LOG_TYPE_DEFAULT, "Set Music Influence (perform) <%{public}@>: Dry run: %d, previous music influence: %d, and music influence: %d", (uint8_t *)&v42, 0x1Eu);
    }

    id v17 = objc_alloc_init(MEMORY[0x1E4F96A28]);
    [v17 setValue:v15];
    v33 = [NSNumber numberWithBool:v27];
    [v17 setPreviousValue:v33];

    id v24 = objc_alloc_init(MEMORY[0x1E4F96A40]);
    [v24 setSetting:v17];
    v34 = [v24 dictionary];
    v4[2](v4, v34);

    if (![(NSString *)self->_requestAceHash length])
    {
      v35 = [(MPAssistantSetMusicInfluence *)self aceId];
      sub_1D4244ECC(@"Set Music Influence", v35);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      v37 = self->_requestAceHash;
      self->_requestAceHash = v36;
    }
    v38 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = self->_requestAceHash;
      v40 = [v24 dictionary];
      int v42 = 138543618;
      v43 = v39;
      __int16 v44 = 2114;
      *(void *)v45 = v40;
      _os_log_impl(&dword_1D422A000, v38, OS_LOG_TYPE_DEFAULT, "Set Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v42, 0x16u);
    }
    v41 = [v24 dictionary];
    v4[2](v4, v41);
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F965A8]);
    [v17 setErrorCode:*MEMORY[0x1E4F976B8]];
    [v17 setReason:@"Value unchanged, No change was made"];
    if (![(NSString *)self->_requestAceHash length])
    {
      v18 = [(MPAssistantSetMusicInfluence *)self aceId];
      sub_1D4244ECC(@"Set Music Influence", v18);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_requestAceHash;
      self->_requestAceHash = v19;
    }
    v21 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_requestAceHash;
      v23 = [v17 dictionary];
      int v42 = 138543618;
      v43 = v22;
      __int16 v44 = 2114;
      *(void *)v45 = v23;
      _os_log_impl(&dword_1D422A000, v21, OS_LOG_TYPE_DEFAULT, "Set Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v42, 0x16u);
    }
    id v24 = [v17 dictionary];
    v4[2](v4, v24);
  }
}

@end
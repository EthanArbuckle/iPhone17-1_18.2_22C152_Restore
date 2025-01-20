@interface MPAssistantGetDynamiteClientState
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetDynamiteClientState

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F96A10]);
  if (![(NSString *)self->_requestAceHash length])
  {
    v6 = [(MPAssistantGetDynamiteClientState *)self aceId];
    sub_1D4244ECC(@"Get Dynamite Client State", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Get Dynamite Client State (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D425A738;
  v13[3] = &unk_1E69E3D50;
  v13[4] = self;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  sub_1D425A738((uint64_t)v13, 0);
}

@end
@interface MPAssistantGetState
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetState

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetState *)self aceId];
    sub_1D4244ECC(@"Get State", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v32 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F96800]);
  v11 = dispatch_get_global_queue(0, 0);
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = sub_1D42326B8;
  v28 = &unk_1E69E2B08;
  id v29 = v10;
  v30 = v12;
  MRMediaRemoteGetNowPlayingInfo();
  dispatch_group_enter(v30);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = sub_1D42327E4;
  v22 = &unk_1E69E2B30;
  id v23 = v29;
  v24 = v30;
  v13 = v30;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D4232840;
  block[3] = &unk_1E69E3DA0;
  block[4] = self;
  id v17 = v23;
  id v18 = v4;
  id v14 = v4;
  id v15 = v23;
  dispatch_group_notify(v13, v11, block);
}

@end
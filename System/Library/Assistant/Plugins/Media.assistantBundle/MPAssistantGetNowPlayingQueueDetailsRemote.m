@interface MPAssistantGetNowPlayingQueueDetailsRemote
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetNowPlayingQueueDetailsRemote

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self aceId];
    sub_1D4244ECC(@"Get Now Playing Queue Details Remote", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self hashedRouteUIDs];
    uint64_t v11 = [v10 count];
    v12 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self queueDetails];
    v13 = [v12 dictionary];
    [(MPAssistantGetNowPlayingQueueDetailsRemote *)self routeTimeout];
    *(_DWORD *)buf = 138544130;
    v36 = v9;
    __int16 v37 = 2048;
    uint64_t v38 = v11;
    __int16 v39 = 2114;
    v40 = v13;
    __int16 v41 = 2048;
    uint64_t v42 = v14;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details Remote (invoke) <%{public}@>: %lu UIDs, queue %{public}@, timeout %f", buf, 0x2Au);
  }
  v15 = self->_requestAceHash;
  v16 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self hashedRouteUIDs];
  sub_1D4245018(@"Get Now Playing Queue Details Remote", v15, v16);

  v17 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self hashedRouteUIDs];
  uint64_t v18 = [v17 count];

  if (v18 == 1)
  {
    dispatch_group_t v19 = dispatch_group_create();
    id v20 = objc_alloc_init(MEMORY[0x1E4F76E40]);
    v21 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self hashedRouteUIDs];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1D425ACFC;
    v30[3] = &unk_1E69E3E18;
    id v31 = v20;
    v32 = self;
    dispatch_group_t v33 = v19;
    id v34 = v4;
    v22 = v19;
    id v23 = v20;
    [v23 decodeHashedRouteUIDs:v21 completion:v30];
  }
  else
  {
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"Too many UIDs requested"];
    if (![(NSString *)self->_requestAceHash length])
    {
      v24 = [(MPAssistantGetNowPlayingQueueDetailsRemote *)self aceId];
      sub_1D4244ECC(@"Get Now Playing Queue Details Remote", v24);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_requestAceHash;
      self->_requestAceHash = v25;
    }
    v27 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = self->_requestAceHash;
      v29 = [v23 dictionary];
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v29;
      _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    v22 = [v23 dictionary];
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v22);
  }
}

@end
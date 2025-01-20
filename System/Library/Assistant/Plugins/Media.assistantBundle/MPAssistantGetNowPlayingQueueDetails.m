@interface MPAssistantGetNowPlayingQueueDetails
- (void)getSAMPMediaItems:(id)a3 origin:(void *)a4 completion:(id)a5;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetNowPlayingQueueDetails

- (void).cxx_destruct
{
}

- (void)getSAMPMediaItems:(id)a3 origin:(void *)a4 completion:(id)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a5;
  v8 = (const void *)MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  v9 = (const void *)MRNowPlayingPlayerPathCreate();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D4251C38;
  v11[3] = &unk_1E69E3948;
  int64_t v13 = var0;
  int64_t v14 = var1;
  id v12 = v7;
  id v10 = v7;
  MEMORY[0x1D9444DF0](v8, v9, MEMORY[0x1E4F14428], v11);
  CFRelease(v8);
  CFRelease(v9);
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetNowPlayingQueueDetails *)self aceId];
    sub_1D4244ECC(@"Get Now Playing Queue Details", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    id v10 = [(MPAssistantGetNowPlayingQueueDetails *)self hashedRouteUIDs];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [(MPAssistantGetNowPlayingQueueDetails *)self previousItemCount];
    uint64_t v13 = [(MPAssistantGetNowPlayingQueueDetails *)self nextItemCount];
    int64_t v14 = [(MPAssistantGetNowPlayingQueueDetails *)self preemptiveNowPlayingQueueDetailsTimeOut];
    *(_DWORD *)buf = 138544386;
    v73 = v9;
    __int16 v74 = 2048;
    uint64_t v75 = v11;
    __int16 v76 = 2048;
    uint64_t v77 = v12;
    __int16 v78 = 2048;
    uint64_t v79 = v13;
    __int16 v80 = 2114;
    v81 = v14;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details (invoke) <%{public}@>: %lu UIDs, prev %ld, next %ld, timeout %{public}@", buf, 0x34u);
  }
  v15 = self->_requestAceHash;
  v16 = [(MPAssistantGetNowPlayingQueueDetails *)self hashedRouteUIDs];
  sub_1D4245018(@"Get Now Playing Queue Details", v15, v16);

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.Assistant.GetNowPlayingQueueDetails", 0);
  dispatch_group_t v18 = dispatch_group_create();
  v19 = [(MPAssistantGetNowPlayingQueueDetails *)self hashedRouteUIDs];
  BOOL v20 = [v19 count] == 1;

  if (v20)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F76E40]);
    v22 = [(MPAssistantGetNowPlayingQueueDetails *)self hashedRouteUIDs];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = sub_1D4252468;
    v62[3] = &unk_1E69E38D0;
    id v23 = v21;
    id v63 = v23;
    v64 = self;
    id v66 = v4;
    v65 = v18;
    v67 = &v68;
    [v23 decodeHashedRouteUIDs:v22 completion:v62];
  }
  else
  {
    dispatch_group_enter(v18);
    uint64_t v55 = MEMORY[0x1E4F143A8];
    uint64_t v56 = 3221225472;
    v57 = sub_1D42526BC;
    v58 = &unk_1E69E38F8;
    v59 = self;
    v61 = &v68;
    v60 = v18;
    MRAVEndpointGetMyGroupLeaderWithTimeout();
  }
  dispatch_time_t v24 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v18, v24);
  if (v69[3])
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F96898]);
    dispatch_group_enter(v18);
    uint64_t v26 = [(MPAssistantGetNowPlayingQueueDetails *)self previousItemCount];
    uint64_t v27 = [(MPAssistantGetNowPlayingQueueDetails *)self previousItemCount];
    uint64_t v28 = -v26;
    uint64_t v29 = v69[3];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1D4252814;
    v52[3] = &unk_1E69E3D78;
    id v30 = v25;
    id v53 = v30;
    v31 = v18;
    v54 = v31;
    -[MPAssistantGetNowPlayingQueueDetails getSAMPMediaItems:origin:completion:](self, "getSAMPMediaItems:origin:completion:", v28, v27, v29, v52);
    dispatch_time_t v32 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v31, v32);
    dispatch_group_enter(v31);
    uint64_t v33 = [(MPAssistantGetNowPlayingQueueDetails *)self nextItemCount];
    uint64_t v34 = v69[3];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1D4252854;
    v49[3] = &unk_1E69E3D78;
    id v35 = v30;
    id v50 = v35;
    v36 = v31;
    v51 = v36;
    -[MPAssistantGetNowPlayingQueueDetails getSAMPMediaItems:origin:completion:](self, "getSAMPMediaItems:origin:completion:", 0, v33, v34, v49);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1D4252894;
    v45[3] = &unk_1E69E3920;
    v48 = &v68;
    v45[4] = self;
    id v46 = v35;
    id v47 = v4;
    id v37 = v35;
    dispatch_group_notify(v36, MEMORY[0x1E4F14428], v45);

    v38 = v53;
  }
  else
  {
    id v37 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"timed out"];
    if (![(NSString *)self->_requestAceHash length])
    {
      v39 = [(MPAssistantGetNowPlayingQueueDetails *)self aceId];
      sub_1D4244ECC(@"Get Now Playing Queue Details", v39);
      v40 = (NSString *)objc_claimAutoreleasedReturnValue();
      v41 = self->_requestAceHash;
      self->_requestAceHash = v40;
    }
    v42 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = self->_requestAceHash;
      v44 = [v37 dictionary];
      *(_DWORD *)buf = 138543618;
      v73 = v43;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v44;
      _os_log_impl(&dword_1D422A000, v42, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    v38 = [v37 dictionary];
    (*((void (**)(id, void *))v4 + 2))(v4, v38);
  }

  _Block_object_dispose(&v68, 8);
}

@end
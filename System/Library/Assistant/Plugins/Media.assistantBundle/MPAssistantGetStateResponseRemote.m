@interface MPAssistantGetStateResponseRemote
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
- (void)setPlayingInfoFromEndpoint:(void *)a3;
@end

@implementation MPAssistantGetStateResponseRemote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_responseCollectionQueue, 0);
  objc_storeStrong((id *)&self->_originMapping, 0);
  objc_storeStrong((id *)&self->_workingRemoteResponse, 0);

  objc_storeStrong((id *)&self->_decodedDeviceUIDs, 0);
}

- (void)setPlayingInfoFromEndpoint:(void *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetStateResponseRemote *)self aceId];
    sub_1D4244ECC(@"Get State Response Remote", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: Set info for: %{public}@", buf, 0x16u);
  }

  v10 = (void *)MRAVEndpointCopyUniqueIdentifier();
  if (MRAVEndpointIsLocalEndpoint())
  {
    LocalOrigin = (const void *)MRMediaRemoteGetLocalOrigin();
    CFRetain(LocalOrigin);
  }
  else
  {
    MRAVEndpointGetExternalDevice();
    LocalOrigin = (const void *)MRExternalDeviceCopyCustomOrigin();
  }
  v12 = dispatch_get_global_queue(25, 0);
  v13 = dispatch_group_create();
  v14 = (const void *)MRNowPlayingPlayerPathCreate();
  uint64_t v61 = 0;
  uint64_t v15 = MRMediaRemoteNowPlayingCopyResolvedPlayerPath();
  if (v14) {
    CFRelease(v14);
  }
  v16 = (const void *)MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  MRPlaybackQueueRequestSetIncludeInfo();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v63 = sub_1D422CDC4;
  v64 = sub_1D422CDD4;
  id v65 = 0;
  dispatch_group_enter(v13);
  CFRetain(a3);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1D422CDDC;
  v56[3] = &unk_1E69E29C8;
  v56[4] = self;
  id v17 = v10;
  id v57 = v17;
  v59 = buf;
  v60 = a3;
  v18 = v13;
  v58 = v18;
  MEMORY[0x1D9444DF0](v16, v15, v12, v56);
  if (v16) {
    CFRelease(v16);
  }
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  int v55 = 0;
  dispatch_group_enter(v18);
  CFRetain(a3);
  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  v47 = sub_1D422CFE0;
  v48 = &unk_1E69E29F0;
  v49 = self;
  id v19 = v17;
  id v50 = v19;
  v52 = v54;
  v53 = a3;
  v20 = v18;
  v51 = v20;
  MRMediaRemoteGetPlaybackStateForPlayer();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  dispatch_group_enter(v20);
  CFRetain(a3);
  uint64_t Client = MRNowPlayingPlayerPathGetClient();
  id v22 = MEMORY[0x1E4F14428];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = sub_1D422D140;
  v36 = &unk_1E69E2A18;
  v40 = v43;
  uint64_t v41 = Client;
  v37 = self;
  id v23 = v19;
  id v38 = v23;
  v42 = a3;
  v24 = v20;
  v39 = v24;
  MRMediaRemoteGetDeviceInfo();

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_1D422CDC4;
  v31[4] = sub_1D422CDD4;
  id v32 = 0;
  dispatch_group_enter(v24);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D422D380;
  v27[3] = &unk_1E69E2A40;
  v27[4] = self;
  id v28 = v23;
  v30 = v31;
  v25 = v24;
  v29 = v25;
  MEMORY[0x1D9444D50](v12, v27);
  CFRetain(a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D422D4C0;
  block[3] = &unk_1E69E2AB8;
  block[4] = self;
  block[5] = v31;
  block[6] = buf;
  block[7] = v43;
  block[8] = v54;
  block[9] = a3;
  block[10] = v15;
  block[11] = LocalOrigin;
  dispatch_group_notify(v25, v12, block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(buf, 8);
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetStateResponseRemote *)self aceId];
    sub_1D4244ECC(@"Get State Response Remote", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(MPAssistantGetStateResponseRemote *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    id v28 = v9;
    __int16 v29 = 2048;
    uint64_t v30 = [v10 count];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v11 = self->_requestAceHash;
  v12 = [(MPAssistantGetStateResponseRemote *)self hashedRouteUIDs];
  sub_1D4245018(@"Get State Response Remote", v11, v12);

  id v13 = objc_alloc_init(MEMORY[0x1E4F967F8]);
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  workingRemoteResponse = self->_workingRemoteResponse;
  self->_workingRemoteResponse = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  originMapping = self->_originMapping;
  self->_originMapping = v16;

  v18 = (MPCAssistantEncodings *)objc_alloc_init(MEMORY[0x1E4F76E40]);
  encoder = self->_encoder;
  self->_encoder = v18;

  v20 = self->_encoder;
  v21 = [(MPAssistantGetStateResponseRemote *)self hashedRouteUIDs];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D422E2A0;
  v24[3] = &unk_1E69E4070;
  id v25 = v13;
  id v26 = v4;
  v24[4] = self;
  id v22 = v13;
  id v23 = v4;
  [(MPCAssistantEncodings *)v20 decodeHashedRouteUIDs:v21 completion:v24];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPAssistantGetStateResponseRemote;
  [(MPAssistantGetStateResponseRemote *)&v4 dealloc];
}

@end
@interface MPAssistantStartPlayback
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantStartPlayback

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  if (![(NSString *)self->_requestAceHash length])
  {
    v6 = [(MPAssistantStartPlayback *)self aceId];
    sub_1D4244ECC(@"Start Playback", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v11 = [(MPAssistantStartPlayback *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v38 = v10;
    __int16 v39 = 2048;
    uint64_t v40 = [v11 count];
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Start Playback (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v12 = self->_requestAceHash;
  v13 = [(MPAssistantStartPlayback *)self hashedRouteUIDs];
  sub_1D4245018(@"Start Playback", v12, v13);

  v35[0] = *MEMORY[0x1E4F77680];
  v14 = [(MPAssistantStartPlayback *)self refId];
  v35[1] = *MEMORY[0x1E4F77770];
  v36[0] = v14;
  v36[1] = @"com.apple.MediaAssistant.siri";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  v16 = [(MPAssistantStartPlayback *)self hashedRouteUIDs];
  char v17 = [v16 containsObject:@"LOCAL_DEVICE"];

  if (v17)
  {
    v18 = 0;
  }
  else
  {
    v18 = [(MPAssistantStartPlayback *)self hashedRouteUIDs];
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v20 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D422C184;
  v27[3] = &unk_1E69E2950;
  id v28 = v20;
  id v29 = v18;
  id v30 = v19;
  id v31 = v15;
  id v32 = v5;
  v33 = self;
  id v34 = v4;
  id v21 = v4;
  id v22 = v5;
  id v23 = v15;
  id v24 = v19;
  id v25 = v18;
  id v26 = v20;
  sub_1D422C184((uint64_t)v27, 0);
}

@end
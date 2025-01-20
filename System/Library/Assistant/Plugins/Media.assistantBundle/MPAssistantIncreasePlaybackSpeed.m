@interface MPAssistantIncreasePlaybackSpeed
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantIncreasePlaybackSpeed

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  if (![(NSString *)self->_requestAceHash length])
  {
    v6 = [(MPAssistantIncreasePlaybackSpeed *)self aceId];
    sub_1D4244ECC(@"Increase Playback Speed", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v11 = [(MPAssistantIncreasePlaybackSpeed *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = [v11 count];
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Increase Playback Speed (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v12 = self->_requestAceHash;
  v13 = [(MPAssistantIncreasePlaybackSpeed *)self hashedRouteUIDs];
  sub_1D4245018(@"Increase Playback Speed", v12, v13);

  uint64_t v14 = *MEMORY[0x1E4F77770];
  v30[0] = *MEMORY[0x1E4F77738];
  v30[1] = v14;
  v31[0] = &unk_1F2BFEDF8;
  v31[1] = @"com.apple.MediaAssistant.siri";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v16 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v17 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D425BF74;
  v23[3] = &unk_1E69E3EE0;
  id v24 = v17;
  v25 = self;
  id v26 = v16;
  id v27 = v15;
  id v28 = v5;
  id v29 = v4;
  id v18 = v4;
  id v19 = v5;
  id v20 = v15;
  id v21 = v16;
  id v22 = v17;
  sub_1D425BF74((uint64_t)v23, 0);
}

@end
@interface MPAssistantSetPlaybackSpeed
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSetPlaybackSpeed

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
    v6 = [(MPAssistantSetPlaybackSpeed *)self aceId];
    sub_1D4244ECC(@"Seek To Playback Speed", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;
  }
  v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v11 = [(MPAssistantSetPlaybackSpeed *)self hashedRouteUIDs];
    uint64_t v12 = [v11 count];
    [(MPAssistantSetPlaybackSpeed *)self scalingFactor];
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    __int16 v39 = 2048;
    uint64_t v40 = v13;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Seek To Playback Speed (invoke) <%{public}@>: %lu UIDs, %f speed", buf, 0x20u);
  }
  v14 = self->_requestAceHash;
  v15 = [(MPAssistantSetPlaybackSpeed *)self hashedRouteUIDs];
  sub_1D4245018(@"Seek To Playback Speed", v14, v15);

  v33[0] = *MEMORY[0x1E4F776F8];
  v16 = NSNumber;
  [(MPAssistantSetPlaybackSpeed *)self scalingFactor];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v33[1] = *MEMORY[0x1E4F77770];
  v34[0] = v17;
  v34[1] = @"com.apple.MediaAssistant.siri";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  id v19 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v20 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1D423FDAC;
  v26[3] = &unk_1E69E3EE0;
  id v27 = v20;
  v28 = self;
  id v29 = v19;
  id v30 = v18;
  id v31 = v5;
  id v32 = v4;
  id v21 = v4;
  id v22 = v5;
  id v23 = v18;
  id v24 = v19;
  id v25 = v20;
  sub_1D423FDAC((uint64_t)v26, 0);
}

@end
@interface MPAssistantSeekToPlaybackPosition
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSeekToPlaybackPosition

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v42[0] = *MEMORY[0x1E4F776D8];
  v6 = NSNumber;
  v7 = [(MPAssistantSeekToPlaybackPosition *)self positionInMilliseconds];
  uint64_t v8 = [v7 longValue];
  if (v8 >= 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = -v8;
  }
  v10 = [v6 numberWithDouble:(double)v9 / 1000.0];
  v42[1] = *MEMORY[0x1E4F77770];
  v43[0] = v10;
  v43[1] = @"com.apple.MediaAssistant.siri";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

  if (![(NSString *)self->_requestAceHash length])
  {
    v12 = [(MPAssistantSeekToPlaybackPosition *)self aceId];
    sub_1D4244ECC(@"Seek To Playback Position", v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v13;
  }
  v15 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_requestAceHash;
    v17 = [(MPAssistantSeekToPlaybackPosition *)self hashedRouteUIDs];
    uint64_t v18 = [v17 count];
    v19 = [(MPAssistantSeekToPlaybackPosition *)self positionInMilliseconds];
    *(_DWORD *)buf = 138543874;
    v37 = v16;
    __int16 v38 = 2048;
    uint64_t v39 = v18;
    __int16 v40 = 2114;
    v41 = v19;
    _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_DEFAULT, "Seek To Playback Position (invoke) <%{public}@>: %lu UIDs, %{public}@ position", buf, 0x20u);
  }
  v20 = self->_requestAceHash;
  v21 = [(MPAssistantSeekToPlaybackPosition *)self hashedRouteUIDs];
  sub_1D4245018(@"Seek To Playback Position", v20, v21);

  id v22 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v23 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1D4244560;
  v29[3] = &unk_1E69E3EE0;
  id v30 = v23;
  v31 = self;
  id v32 = v22;
  id v33 = v11;
  id v34 = v5;
  id v35 = v4;
  id v24 = v4;
  id v25 = v5;
  id v26 = v11;
  id v27 = v22;
  id v28 = v23;
  sub_1D4244560((uint64_t)v29, 0);
}

@end
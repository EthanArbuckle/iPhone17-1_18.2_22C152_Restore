@interface MPAssistantPausePlayback
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantPausePlayback

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantPausePlayback *)self aceId];
    sub_1D4244ECC(@"Pause Playback", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(MPAssistantPausePlayback *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = [v10 count];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Pause Playback (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v11 = self->_requestAceHash;
  v12 = [(MPAssistantPausePlayback *)self hashedRouteUIDs];
  sub_1D4245018(@"Pause Playback", v11, v12);

  id v13 = objc_alloc_init(MEMORY[0x1E4F76E50]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F76E40]);
  v15 = [(MPAssistantPausePlayback *)self hashedRouteUIDs];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D4231FB4;
  v19[3] = &unk_1E69E3E18;
  id v20 = v13;
  v21 = self;
  id v22 = v14;
  id v23 = v4;
  id v16 = v4;
  id v17 = v14;
  id v18 = v13;
  [v17 decodeHashedRouteUIDs:v15 completion:v19];
}

@end
@interface MPAssistantSetVolumeLevel
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSetVolumeLevel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);

  objc_storeStrong((id *)&self->_discovery, 0);
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantSetVolumeLevel *)self aceId];
    sub_1D4244ECC(@"Set Volume Level", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(MPAssistantSetVolumeLevel *)self hashedRouteUIDs];
    uint64_t v11 = [v10 count];
    v12 = [(MPAssistantSetVolumeLevel *)self actionType];
    v13 = [(MPAssistantSetVolumeLevel *)self volumeValue];
    *(_DWORD *)buf = 138544386;
    v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = v11;
    __int16 v28 = 2114;
    v29 = v12;
    __int16 v30 = 2114;
    v31 = v13;
    __int16 v32 = 1024;
    int v33 = [(MPAssistantSetVolumeLevel *)self acknowledgedExceedingVolumeLimit];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Set Volume Level (invoke) <%{public}@>: %lu UIDs, %{public}@ action, %{public}@ volume, %{BOOL}u ack", buf, 0x30u);
  }
  v14 = self->_requestAceHash;
  v15 = [(MPAssistantSetVolumeLevel *)self hashedRouteUIDs];
  sub_1D4245018(@"Set Volume Level", v14, v15);

  id v16 = objc_alloc_init(MEMORY[0x1E4F76E40]);
  v17 = [(MPAssistantSetVolumeLevel *)self hashedRouteUIDs];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D4250580;
  v20[3] = &unk_1E69E4070;
  id v21 = v16;
  v22 = self;
  id v23 = v4;
  id v18 = v4;
  id v19 = v16;
  [v19 decodeHashedRouteUIDs:v17 completion:v20];
}

@end
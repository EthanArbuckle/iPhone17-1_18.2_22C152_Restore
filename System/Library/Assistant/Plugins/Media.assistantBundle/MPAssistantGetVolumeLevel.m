@interface MPAssistantGetVolumeLevel
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGetVolumeLevel

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantGetVolumeLevel *)self aceId];
    sub_1D4244ECC(@"Get Volume Level", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(MPAssistantGetVolumeLevel *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = [v10 count];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get Volume Level (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v11 = self->_requestAceHash;
  v12 = [(MPAssistantGetVolumeLevel *)self hashedRouteUIDs];
  sub_1D4245018(@"Get Volume Level", v11, v12);

  id v13 = objc_alloc_init(MEMORY[0x1E4F76E40]);
  v14 = [(MPAssistantGetVolumeLevel *)self hashedRouteUIDs];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D425DEE0;
  v17[3] = &unk_1E69E4070;
  id v18 = v13;
  v19 = self;
  id v20 = v4;
  id v15 = v4;
  id v16 = v13;
  [v16 decodeHashedRouteUIDs:v14 completion:v17];
}

@end
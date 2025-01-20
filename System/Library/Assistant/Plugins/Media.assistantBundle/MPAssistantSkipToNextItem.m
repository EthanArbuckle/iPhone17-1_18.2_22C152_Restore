@interface MPAssistantSkipToNextItem
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSkipToNextItem

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v34[0] = *MEMORY[0x1E4F77680];
  v6 = [(MPAssistantSkipToNextItem *)self refId];
  v34[1] = *MEMORY[0x1E4F77770];
  v35[0] = v6;
  v35[1] = @"com.apple.MediaAssistant.siri";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  if (![(NSString *)self->_requestAceHash length])
  {
    v8 = [(MPAssistantSkipToNextItem *)self aceId];
    sub_1D4244ECC(@"Skip To Next Item", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;
  }
  v11 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    v13 = [(MPAssistantSkipToNextItem *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = [v13 count];
    _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Skip To Next Item (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v14 = self->_requestAceHash;
  v15 = [(MPAssistantSkipToNextItem *)self hashedRouteUIDs];
  sub_1D4245018(@"Skip To Next Item", v14, v15);

  id v16 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  v17 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D424FC28;
  v23[3] = &unk_1E69E3EE0;
  id v24 = v17;
  v25 = self;
  id v26 = v16;
  id v27 = v7;
  id v28 = v5;
  id v29 = v4;
  id v18 = v4;
  id v19 = v5;
  id v20 = v7;
  id v21 = v16;
  id v22 = v17;
  sub_1D424FC28((uint64_t)v23, 0);
}

@end
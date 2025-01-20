@interface MPAssistantSkipToPreviousItem
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSkipToPreviousItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);

  objc_storeStrong((id *)&self->command, 0);
}

- (void)performWithCompletion:(id)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v35[0] = *MEMORY[0x1E4F77680];
  v6 = [(MPAssistantSkipToPreviousItem *)self refId];
  uint64_t v7 = *MEMORY[0x1E4F77780];
  v36[0] = v6;
  v36[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  v35[1] = v7;
  v35[2] = v8;
  v36[2] = @"com.apple.MediaAssistant.siri";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

  if (![(NSString *)self->_requestAceHash length])
  {
    v10 = [(MPAssistantSkipToPreviousItem *)self aceId];
    sub_1D4244ECC(@"Seek To Previous Item", v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;
  }
  v13 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_requestAceHash;
    v15 = [(MPAssistantSkipToPreviousItem *)self hashedRouteUIDs];
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    __int16 v33 = 2048;
    uint64_t v34 = [v15 count];
    _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Seek To Previous Item (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);
  }
  v16 = self->_requestAceHash;
  v17 = [(MPAssistantSkipToPreviousItem *)self hashedRouteUIDs];
  sub_1D4245018(@"Seek To Previous Item", v16, v17);

  v18 = (MPCAssistantCommand *)objc_alloc_init(MEMORY[0x1E4F76E28]);
  command = self->command;
  self->command = v18;

  v20 = [MEMORY[0x1E4F76E48] nowPlayingApplicationDestination];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D42416E8;
  v25[3] = &unk_1E69E3740;
  id v26 = v20;
  v27 = self;
  id v28 = v9;
  id v29 = v5;
  id v30 = v4;
  id v21 = v4;
  id v22 = v5;
  id v23 = v9;
  id v24 = v20;
  sub_1D42416E8((uint64_t)v25, 0);
}

@end
@interface MPAssistantAddMediaEntityToAcousticIDHistory
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddMediaEntityToAcousticIDHistory

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantAddMediaEntityToAcousticIDHistory *)self aceId];
    sub_1D4244ECC(@"Add Media Entity To Acoustic ID History", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(SAMPAddMediaEntityToAcousticIdHistory *)self adamId];
    v11 = [(SAMPAddMediaEntityToAcousticIdHistory *)self affiliateId];
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Acoustic ID History (invoke) <%{public}@>: adam ID %{public}@, affiliate ID %{public}@", buf, 0x20u);
  }
  v12 = [(SAMPAddMediaEntityToAcousticIdHistory *)self adamId];
  uint64_t v13 = [v12 longLongValue];

  v14 = [(SAMPAddMediaEntityToAcousticIdHistory *)self affiliateId];
  id v15 = objc_alloc(MEMORY[0x1E4FB8758]);
  v16 = [MEMORY[0x1E4FB87B8] activeAccount];
  v17 = (void *)[v15 initWithIdentity:v16];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4FB8710]) initWithRequestContext:v17 storeItemID:v13 affiliateIdentifier:v14];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D425DB14;
  v20[3] = &unk_1E69E3FD0;
  v20[4] = self;
  id v21 = v4;
  id v19 = v4;
  [v18 performRequestWithCompletionHandler:v20];
}

@end
@interface MPAssistantAddMediaItemsToLibrary
- (BOOL)_addMediaItemsToLibrarySupported;
- (int64_t)_extractAtomID;
- (void)_performAddMediaItemsWithCompletion:(id)a3;
- (void)_performWithCompletion:(id)a3;
- (void)_requestCompanionToAddMediaItemsForOrigin:(void *)a3 withCompletion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddMediaItemsToLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudController, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

- (void)_performAddMediaItemsWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(MPAssistantAddMediaItemsToLibrary *)self _extractAtomID];
  if (v5)
  {
    int64_t v6 = v5;
    if (![(NSString *)self->_requestAceHash length])
    {
      v7 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v7);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v8;
    }
    v10 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      __int16 v31 = 2048;
      int64_t v32 = v6;
      _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (cloud) <%{public}@>: Will add store item %lld", buf, 0x16u);
    }

    v12 = [MEMORY[0x1E4F31890] controllerWithUserIdentity:self->_userIdentity];
    cloudController = self->_cloudController;
    self->_cloudController = v12;

    v14 = (void *)[(NSString *)self->_requestAceHash copy];
    v15 = self->_cloudController;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1D425C7AC;
    v24[3] = &unk_1E69E3FA8;
    id v25 = v14;
    int64_t v28 = v6;
    v26 = self;
    id v27 = v4;
    id v16 = v14;
    [(MPCloudController *)v15 addStoreItemWithAdamID:v6 completionHandler:v24];

LABEL_13:
    goto LABEL_14;
  }
  if (v4)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v17 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_requestAceHash;
      self->_requestAceHash = v18;
    }
    v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestAceHash;
      v22 = [(SAMPAddMediaItemsToLibrary *)self mediaItems];
      *(_DWORD *)buf = 138543618;
      v30 = v21;
      __int16 v31 = 2114;
      int64_t v32 = (int64_t)v22;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (companion) <%{public}@>: No adam IDs in %{public}@", buf, 0x16u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v16 = (id)[v23 initWithErrorCode:*MEMORY[0x1E4F973A0]];
    (*((void (**)(id, id))v4 + 2))(v4, v16);
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_requestCompanionToAddMediaItemsForOrigin:(void *)a3 withCompletion:(id)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(MPAssistantAddMediaItemsToLibrary *)self _extractAtomID];
  v8 = (void *)[objc_alloc(NSNumber) initWithLongLong:v7];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D425CCB0;
  v27[3] = &unk_1E69E3F80;
  id v9 = v8;
  id v28 = v9;
  id v10 = v6;
  id v29 = v10;
  v11 = (void *)MEMORY[0x1D94452A0](v27);
  if (v7)
  {
    if (v10)
    {
      uint64_t v12 = *MEMORY[0x1E4F77770];
      v34[0] = *MEMORY[0x1E4F777D8];
      v34[1] = v12;
      v35[0] = v9;
      v35[1] = @"com.apple.MediaAssistant.siri";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      id v14 = objc_alloc_init(MEMORY[0x1E4F76E48]);
      [v14 setOrigin:a3];
      id v15 = objc_alloc_init(MEMORY[0x1E4F76E28]);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1D425CD60;
      v24[3] = &unk_1E69E4160;
      id v25 = v15;
      id v26 = v11;
      id v16 = v15;
      [v16 sendCommand:128 toDestination:v14 withOptions:v13 completion:v24];

LABEL_10:
    }
  }
  else if (v10)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v17 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v18;
    }
    v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestAceHash;
      v22 = [(SAMPAddMediaItemsToLibrary *)self mediaItems];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (companion) <%{public}@>: No adam IDs in %{public}@", buf, 0x16u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F965A8]);
    v13 = (void *)[v23 initWithErrorCode:*MEMORY[0x1E4F973A0]];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
    goto LABEL_10;
  }
}

- (int64_t)_extractAtomID
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(SAMPAddMediaItemsToLibrary *)self mediaItems];
  id v4 = [v3 items];
  int64_t v5 = [v3 identifier];
  if (sub_1D4232A80(v5) == 3)
  {
    id v6 = [v5 lastPathComponent];
    int64_t v7 = [v6 longLongValue];

    if (v7) {
      goto LABEL_23;
    }
  }
  else
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v8 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v8);
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v9;
    }
    v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = self->_requestAceHash;
      int v26 = 138543618;
      id v27 = v12;
      __int16 v28 = 2114;
      id v29 = v5;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Unsupported origin for collection %{public}@", (uint8_t *)&v26, 0x16u);
    }
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v13 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v13);
      id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v15 = self->_requestAceHash;
      self->_requestAceHash = v14;
    }
    id v16 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      int v26 = 138543618;
      id v27 = v17;
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Cannot add multiple items %{public}@", (uint8_t *)&v26, 0x16u);
    }
  }
  v18 = [v4 firstObject];
  v19 = [v18 identifier];
  if (sub_1D4232A80(v19) == 3)
  {
    v20 = [v19 lastPathComponent];
    int64_t v7 = [v20 longLongValue];
  }
  else
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v21 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Library", v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v23 = self->_requestAceHash;
      self->_requestAceHash = v22;
    }
    v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_requestAceHash;
      int v26 = 138543618;
      id v27 = v24;
      __int16 v28 = 2114;
      id v29 = v19;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Unsupported origin for entity %{public}@", (uint8_t *)&v26, 0x16u);
    }
    int64_t v7 = 0;
  }

LABEL_23:
  return v7;
}

- (BOOL)_addMediaItemsToLibrarySupported
{
  v2 = [MEMORY[0x1E4F31890] controllerWithUserIdentity:self->_userIdentity];
  [v2 becomeActiveAndWaitUntilDone:1];
  char v3 = [v2 isCloudLibraryEnabled];

  return v3;
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MPAssistantAddMediaItemsToLibrary *)self _addMediaItemsToLibrarySupported])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1D425D24C;
    v10[3] = &unk_1E69E3F30;
    id v11 = v4;
    id v5 = v4;
    [(MPAssistantAddMediaItemsToLibrary *)self _performAddMediaItemsWithCompletion:v10];
    id v6 = v11;
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D425D25C;
    v8[3] = &unk_1E69E3F58;
    v8[4] = self;
    id v9 = v4;
    id v7 = v4;
    sub_1D425D25C((uint64_t)v8, 0);
    id v6 = v9;
  }
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    id v5 = [(MPAssistantAddMediaItemsToLibrary *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Library", v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_requestAceHash;
    id v10 = [(SAMPAddMediaItemsToLibrary *)self mediaItems];
    id v11 = [v10 dictionary];
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (invoke) <%{public}@>: media items %{public}@", buf, 0x16u);
  }
  uint64_t v12 = self->_requestAceHash;
  v13 = [(SAMPAddMediaItemsToLibrary *)self influencedUserSharedUserId];
  id v14 = [(SAMPAddMediaItemsToLibrary *)self influencedUserSharedUserId];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D425D54C;
  v16[3] = &unk_1E69E3F08;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  sub_1D4246230(@"Add Media Items To Library", v12, v13, v14, v16);
}

@end
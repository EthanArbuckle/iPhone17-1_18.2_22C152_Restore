@interface MPAssistantAddMediaItemsToUpNextQueue
- (BOOL)_isInsertionPositionSupported:(int)a3 origin:(void *)a4 supportedCommands:(__CFArray *)a5;
- (id)_createLocalLibraryPlaybackQueueWithCollection:(id)a3 error:(id *)a4;
- (id)_createPlaybackQueueWithCollection:(id)a3 error:(id *)a4;
- (id)_createStoreTracklistPlaybackQueueWithCollection:(id)a3 error:(id *)a4;
- (void)_perform:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddMediaItemsToUpNextQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_discovery, 0);
}

- (BOOL)_isInsertionPositionSupported:(int)a3 origin:(void *)a4 supportedCommands:(__CFArray *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D4241DF4;
  v21[3] = &unk_1E69E30B8;
  int v22 = a3;
  v21[4] = self;
  v7 = (uint64_t (**)(void, void))MEMORY[0x1D94452A0](v21, a2, *(void *)&a3, a4);
  CFIndex Count = CFArrayGetCount(a5);
  if (Count < 1) {
    goto LABEL_9;
  }
  uint64_t v9 = Count;
  CFIndex v10 = 0;
  unsigned int v11 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a5, v10);
    if (MEMORY[0x1D9444CD0]() == 125) {
      break;
    }
    CFIndex v10 = v11;
    if (v9 <= v11++) {
      goto LABEL_9;
    }
  }
  if (MRMediaRemoteCommandInfoGetEnabled())
  {
    char v14 = ((uint64_t (**)(void, const void *))v7)[2](v7, ValueAtIndex);
  }
  else
  {
LABEL_9:
    if (![(NSString *)self->_requestAceHash length])
    {
      v15 = [(MPAssistantAddMediaItemsToUpNextQueue *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Up Next Queue", v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v16;
    }
    v18 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_requestAceHash;
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (issupported) <%{public}@>: MRMediaRemoteCommandInsertIntoPlaybackQueue not found in supported commands", buf, 0xCu);
    }

    char v14 = 0;
  }

  return v14;
}

- (id)_createStoreTracklistPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v40 = v5;
  v6 = [v5 items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = [*(id *)(*((void *)&v46 + 1) + 8 * i) identifier];
        if (sub_1D4232A80(v11) == 3)
        {
          v12 = [v11 lastPathComponent];
          uint64_t v13 = [v12 longLongValue];

          char v14 = [NSNumber numberWithLongLong:v13];
          [v41 addObject:v14];
        }
        else
        {
          if (![(NSString *)self->_requestAceHash length])
          {
            v15 = [(MPAssistantAddMediaItemsToUpNextQueue *)self aceId];
            sub_1D4244ECC(@"Add Media Items To Up Next Queue", v15);
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            requestAceHash = self->_requestAceHash;
            self->_requestAceHash = v16;
          }
          char v14 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v51 = v18;
            __int16 v52 = 2114;
            v53 = v11;
            _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (storetrack) <%{public}@>: unknown origin for %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v8);
  }

  if (![v41 count])
  {
    v19 = [v40 identifier];

    if (v19)
    {
      v20 = [v40 identifier];
      v21 = [v20 lastPathComponent];
      uint64_t v22 = [v21 longLongValue];

      v23 = [NSNumber numberWithLongLong:v22];
      [v41 addObject:v23];
    }
  }
  v24 = [MEMORY[0x1E4F318D0] emptyIdentifierSet];
  uint64_t v25 = [v40 identifier];
  v26 = [v25 scheme];
  int v27 = [v26 isEqualToString:@"x-sampplaylist"];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F318D0]);
    v29 = [MEMORY[0x1E4F31990] identityKind];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_1D4242420;
    v44[3] = &unk_1E69E3090;
    v30 = &v45;
    id v45 = v40;
    v31 = v44;
  }
  else
  {
    v32 = [v40 identifier];
    v33 = [v32 scheme];
    int v34 = [v33 isEqualToString:@"x-sampcollection-album"];

    if (!v34) {
      goto LABEL_22;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F318D0]);
    v29 = [MEMORY[0x1E4F31978] identityKind];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_1D42424AC;
    v42[3] = &unk_1E69E3090;
    v30 = &v43;
    id v43 = v40;
    v31 = v42;
  }
  uint64_t v35 = [v28 initWithSource:@"MPCAssistant" modelKind:v29 block:v31];

  v24 = (void *)v35;
LABEL_22:
  id v36 = objc_alloc(MEMORY[0x1E4F76E70]);
  v37 = [(MPAssistantAddMediaItemsToUpNextQueue *)self refId];
  v38 = (void *)[v36 initWithContextID:v37 storeItemIDs:v41 collectionIdentifierSet:v24];

  return v38;
}

- (id)_createLocalLibraryPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Up Next Queue" hash:self->_requestAceHash];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F31970]);
    uint64_t v9 = [v7 items];
    CFIndex v10 = (void *)[v8 initWithEntities:v9 entityType:0];

    id v11 = objc_alloc(MEMORY[0x1E4F76E58]);
    v12 = [(MPAssistantAddMediaItemsToUpNextQueue *)self refId];
    a4 = (id *)[v11 initWithContextID:v12 query:v10];
  }
  else if (a4)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      uint64_t v13 = [(MPAssistantAddMediaItemsToUpNextQueue *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Up Next Queue", v13);
      char v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v14;
    }
    v16 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (libraryqueue) <%{public}@>: collection %{public}@ does not exist", buf, 0x16u);
    }

    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v22 = @"Collection does not exist in library";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    *a4 = [v18 errorWithDomain:@"MPAssistantAddToUpNextErrorDomain" code:-1 userInfo:v19];

    a4 = 0;
  }

  return a4;
}

- (id)_createPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  id v8 = [v7 scheme];
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = sub_1D4232A80(v7);
  if (v9 == 3)
  {
    uint64_t v10 = [(MPAssistantAddMediaItemsToUpNextQueue *)self _createStoreTracklistPlaybackQueueWithCollection:v6 error:a4];
    goto LABEL_7;
  }
  if (v9 != 1)
  {
LABEL_5:
    id v11 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [(MPAssistantAddMediaItemsToUpNextQueue *)self _createLocalLibraryPlaybackQueueWithCollection:v6 error:a4];
LABEL_7:
  id v11 = (void *)v10;
LABEL_8:

  return v11;
}

- (void)_perform:(id)a3
{
  id v4 = a3;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D4242BA0;
  v28[3] = &unk_1E69E3F58;
  v28[4] = self;
  id v5 = v4;
  id v29 = v5;
  id v6 = (void *)MEMORY[0x1D94452A0](v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D4242F30;
  v25[3] = &unk_1E69E2FC8;
  id v7 = v6;
  id v26 = v7;
  id v8 = v5;
  id v27 = v8;
  uint64_t v9 = (void *)MEMORY[0x1D94452A0](v25);
  uint64_t v10 = [(MPAssistantAddMediaItemsToUpNextQueue *)self hashedRouteUIDs];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F76E40]);
    uint64_t v13 = [(MPAssistantAddMediaItemsToUpNextQueue *)self hashedRouteUIDs];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D4243134;
    v16[3] = &unk_1E69E3040;
    id v17 = v12;
    v18 = self;
    id v19 = v8;
    id v20 = v9;
    id v14 = v9;
    id v15 = v12;
    [v15 decodeHashedRouteUIDs:v13 completion:v16];
  }
  else
  {
    v21[0] = (id)MEMORY[0x1E4F143A8];
    v21[1] = (id)3221225472;
    v21[2] = sub_1D4243004;
    v21[3] = &unk_1E69E36F0;
    v21[4] = self;
    id v22 = v9;
    id v23 = v8;
    id v24 = v7;
    id v15 = v9;
    sub_1D4243004(v21, 0);
  }
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    id v5 = [(MPAssistantAddMediaItemsToUpNextQueue *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Up Next Queue", v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_requestAceHash;
    uint64_t v10 = [(MPAssistantAddMediaItemsToUpNextQueue *)self hashedRouteUIDs];
    uint64_t v11 = [v10 count];
    id v12 = [(MPAssistantAddMediaItemsToUpNextQueue *)self insertLocation];
    uint64_t v13 = [(MPAssistantAddMediaItemsToUpNextQueue *)self mediaCollection];
    id v14 = [v13 dictionary];
    *(_DWORD *)buf = 138544130;
    id v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (invoke) <%{public}@>: %lu UIDs, insert location %{public}@, media collection %{public}@", buf, 0x2Au);
  }
  id v15 = self->_requestAceHash;
  v16 = [(MPAssistantAddMediaItemsToUpNextQueue *)self hashedRouteUIDs];
  sub_1D4245018(@"Add Media Items To Up Next Queue", v15, v16);

  id v17 = self->_requestAceHash;
  v18 = [(MPAssistantAddMediaItemsToUpNextQueue *)self speakerSharedUserId];
  id v19 = [(MPAssistantAddMediaItemsToUpNextQueue *)self musicAccountSharedUserId];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D4243EBC;
  v21[3] = &unk_1E69E3F08;
  v21[4] = self;
  id v22 = v4;
  id v20 = v4;
  sub_1D4246230(@"Add Media Items To Up Next Queue", v17, v18, v19, v21);
}

@end
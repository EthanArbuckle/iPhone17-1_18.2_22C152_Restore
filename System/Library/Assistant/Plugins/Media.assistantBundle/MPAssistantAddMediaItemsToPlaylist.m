@interface MPAssistantAddMediaItemsToPlaylist
+ (void)_notifyAssistantWithError:(id)a3 requestHash:(id)a4 completion:(id)a5;
+ (void)_notifyAssistantWithString:(id)a3 requestHash:(id)a4 completion:(id)a5;
- (BOOL)_isSagaAuthenticated;
- (void)_addItemsToCloudLibrary:(id)a3;
- (void)_addItemsToLocalLibrary:(id)a3;
- (void)_appendItemToCloudPlaylist:(id)a3 completion:(id)a4;
- (void)_appendItemsToCloudPlaylist:(id)a3 completion:(id)a4;
- (void)_appendToPlaylistWithCompletion:(id)a3;
- (void)_prependItemsToCloudPlaylist:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddMediaItemsToPlaylist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudController, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

- (BOOL)_isSagaAuthenticated
{
  return MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity() != 0;
}

- (void)_prependItemsToCloudPlaylist:(id)a3 completion:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v73 = a4;
  if (![(NSString *)self->_requestAceHash length])
  {
    v7 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;
  }
  v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v101 = v11;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: head insertion", buf, 0xCu);
  }

  v12 = [MEMORY[0x1E4F31890] controllerWithUserIdentity:self->_userIdentity];
  cloudController = self->_cloudController;
  uint64_t v72 = 72;
  self->_cloudController = v12;

  v74 = v6;
  v83 = [MEMORY[0x1E4F31898] cloudItemIDListForPlaylist:v6];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  obuint64_t j = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  uint64_t v78 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
  if (v78)
  {
    uint64_t v14 = 0;
    uint64_t v77 = *(void *)v96;
    uint64_t v81 = *MEMORY[0x1E4F31520];
    uint64_t v82 = *MEMORY[0x1E4F31528];
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v96 != v77) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "identifier", v72);
        uint64_t v18 = sub_1D4232A80(v17);

        if (v18 != 3)
        {
          uint64_t v76 = i;
          v31 = [v16 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v80 = v31;
          id v79 = [v31 items];
          uint64_t v32 = [v79 countByEnumeratingWithState:&v87 objects:v99 count:16];
          if (!v32) {
            goto LABEL_49;
          }
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v88;
          while (1)
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v88 != v34) {
                objc_enumerationMutation(v79);
              }
              v36 = *(void **)(*((void *)&v87 + 1) + 8 * v35);
              v37 = [v36 valueForProperty:v82];
              uint64_t v38 = [v37 longLongValue];

              v39 = [v36 valueForProperty:v81];
              uint64_t v40 = [v39 unsignedLongLongValue];

              if (v40)
              {
                if (![(NSString *)self->_requestAceHash length])
                {
                  v41 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                  sub_1D4244ECC(@"Add Media Items To Playlist", v41);
                  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v43 = self->_requestAceHash;
                  self->_requestAceHash = v42;
                }
                v44 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v101 = v45;
                  __int16 v102 = 2048;
                  uint64_t v103 = v40;
                  _os_log_impl(&dword_1D422A000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend saga: %lld", buf, 0x16u);
                }

                uint64_t v46 = v14 + 1;
                v47 = v83;
                uint64_t v48 = v40;
                uint64_t v49 = 0;
LABEL_40:
                [v47 insertCloudItemID:v48 idType:v49 atIndex:v14];
                uint64_t v14 = v46;
                goto LABEL_41;
              }
              NSUInteger v50 = [(NSString *)self->_requestAceHash length];
              if (v38)
              {
                if (!v50)
                {
                  v51 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                  sub_1D4244ECC(@"Add Media Items To Playlist", v51);
                  v52 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v53 = self->_requestAceHash;
                  self->_requestAceHash = v52;
                }
                v54 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v101 = v55;
                  __int16 v102 = 2048;
                  uint64_t v103 = v38;
                  _os_log_impl(&dword_1D422A000, v54, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend adam: %lld", buf, 0x16u);
                }

                uint64_t v46 = v14 + 1;
                v47 = v83;
                uint64_t v48 = v38;
                uint64_t v49 = 1;
                goto LABEL_40;
              }
              if (!v50)
              {
                v56 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                sub_1D4244ECC(@"Add Media Items To Playlist", v56);
                v57 = (NSString *)objc_claimAutoreleasedReturnValue();
                v58 = self->_requestAceHash;
                self->_requestAceHash = v57;
              }
              v59 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v101 = v60;
                __int16 v102 = 2114;
                uint64_t v103 = (uint64_t)v36;
                _os_log_impl(&dword_1D422A000, v59, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend failed: %{public}@", buf, 0x16u);
              }

LABEL_41:
              ++v35;
            }
            while (v33 != v35);
            uint64_t v61 = [v79 countByEnumeratingWithState:&v87 objects:v99 count:16];
            uint64_t v33 = v61;
            if (!v61)
            {
LABEL_49:

              uint64_t i = v76;
              goto LABEL_50;
            }
          }
        }
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v80 = [v16 items];
        uint64_t v19 = [v80 countByEnumeratingWithState:&v91 objects:v104 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v92;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v92 != v21) {
                objc_enumerationMutation(v80);
              }
              v23 = [*(id *)(*((void *)&v91 + 1) + 8 * j) identifier];
              v24 = [v23 lastPathComponent];
              uint64_t v25 = [v24 longLongValue];

              if (![(NSString *)self->_requestAceHash length])
              {
                v26 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                sub_1D4244ECC(@"Add Media Items To Playlist", v26);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v28 = self->_requestAceHash;
                self->_requestAceHash = v27;
              }
              v29 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v101 = v30;
                __int16 v102 = 2048;
                uint64_t v103 = v25;
                _os_log_impl(&dword_1D422A000, v29, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend store: %lld", buf, 0x16u);
              }

              [v83 insertCloudItemID:v25 idType:1 atIndex:v14 + j];
            }
            v14 += j;
            uint64_t v20 = [v80 countByEnumeratingWithState:&v91 objects:v104 count:16];
          }
          while (v20);
        }
LABEL_50:
      }
      uint64_t v78 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    }
    while (v78);
  }

  if (![(NSString *)self->_requestAceHash length])
  {
    v62 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v62);
    v63 = (NSString *)objc_claimAutoreleasedReturnValue();
    v64 = self->_requestAceHash;
    self->_requestAceHash = v63;
  }
  v65 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v101 = v66;
    _os_log_impl(&dword_1D422A000, v65, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: rewrite playlist", buf, 0xCu);
  }

  v67 = (void *)[(NSString *)self->_requestAceHash copy];
  v68 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  uint64_t v69 = [v74 persistentID];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = sub_1D422F45C;
  v84[3] = &unk_1E69E3FD0;
  id v85 = v67;
  id v86 = v73;
  id v70 = v73;
  id v71 = v67;
  [v68 setPlaylistProperties:0 trackList:v83 forPlaylistWithPersistentID:v69 completionHandler:v84];
}

- (void)_appendItemsToCloudPlaylist:(id)a3 completion:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v72 = a4;
  if (![(NSString *)self->_requestAceHash length])
  {
    v7 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;
  }
  v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v99 = v11;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: tail insertion", buf, 0xCu);
  }

  v12 = [MEMORY[0x1E4F31890] controllerWithUserIdentity:self->_userIdentity];
  cloudController = self->_cloudController;
  uint64_t v71 = 72;
  self->_cloudController = v12;

  id v73 = v6;
  uint64_t v14 = [MEMORY[0x1E4F31898] cloudItemIDListForPlaylist:v6];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  uint64_t v77 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v77)
  {
    uint64_t v76 = *(void *)v94;
    uint64_t v80 = *MEMORY[0x1E4F31520];
    uint64_t v81 = *MEMORY[0x1E4F31528];
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v94 != v76) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "identifier", v71);
        uint64_t v18 = sub_1D4232A80(v17);

        if (v18 != 3)
        {
          uint64_t v75 = i;
          v31 = [v16 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v79 = v31;
          id v78 = [v31 items];
          uint64_t v32 = [v78 countByEnumeratingWithState:&v85 objects:v97 count:16];
          if (!v32) {
            goto LABEL_49;
          }
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v86;
          while (1)
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v86 != v34) {
                objc_enumerationMutation(v78);
              }
              v36 = *(void **)(*((void *)&v85 + 1) + 8 * v35);
              v37 = [v36 valueForProperty:v81];
              uint64_t v38 = [v37 longLongValue];

              v39 = [v36 valueForProperty:v80];
              uint64_t v40 = [v39 unsignedLongLongValue];

              if (v40)
              {
                if (![(NSString *)self->_requestAceHash length])
                {
                  v41 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                  sub_1D4244ECC(@"Add Media Items To Playlist", v41);
                  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v43 = self->_requestAceHash;
                  self->_requestAceHash = v42;
                }
                v44 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v99 = v45;
                  __int16 v100 = 2048;
                  uint64_t v101 = v40;
                  _os_log_impl(&dword_1D422A000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append saga: %lld", buf, 0x16u);
                }

                uint64_t v46 = v14;
                uint64_t v47 = v40;
                uint64_t v48 = 0;
LABEL_40:
                [v46 addCloudItemID:v47 idType:v48];
                goto LABEL_41;
              }
              NSUInteger v49 = [(NSString *)self->_requestAceHash length];
              if (v38)
              {
                if (!v49)
                {
                  NSUInteger v50 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                  sub_1D4244ECC(@"Add Media Items To Playlist", v50);
                  v51 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v52 = self->_requestAceHash;
                  self->_requestAceHash = v51;
                }
                v53 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  v54 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v99 = v54;
                  __int16 v100 = 2048;
                  uint64_t v101 = v38;
                  _os_log_impl(&dword_1D422A000, v53, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append adam: %lld", buf, 0x16u);
                }

                uint64_t v46 = v14;
                uint64_t v47 = v38;
                uint64_t v48 = 1;
                goto LABEL_40;
              }
              if (!v49)
              {
                v55 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                sub_1D4244ECC(@"Add Media Items To Playlist", v55);
                v56 = (NSString *)objc_claimAutoreleasedReturnValue();
                v57 = self->_requestAceHash;
                self->_requestAceHash = v56;
              }
              v58 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v59 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v99 = v59;
                __int16 v100 = 2114;
                uint64_t v101 = (uint64_t)v36;
                _os_log_impl(&dword_1D422A000, v58, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (cloud items) <%{public}@>: append failed: %{public}@", buf, 0x16u);
              }

LABEL_41:
              ++v35;
            }
            while (v33 != v35);
            uint64_t v60 = [v78 countByEnumeratingWithState:&v85 objects:v97 count:16];
            uint64_t v33 = v60;
            if (!v60)
            {
LABEL_49:

              uint64_t i = v75;
              goto LABEL_50;
            }
          }
        }
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v79 = [v16 items];
        uint64_t v19 = [v79 countByEnumeratingWithState:&v89 objects:v102 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v90;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v90 != v21) {
                objc_enumerationMutation(v79);
              }
              v23 = [*(id *)(*((void *)&v89 + 1) + 8 * j) identifier];
              v24 = [v23 lastPathComponent];
              uint64_t v25 = [v24 longLongValue];

              if (![(NSString *)self->_requestAceHash length])
              {
                v26 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                sub_1D4244ECC(@"Add Media Items To Playlist", v26);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v28 = self->_requestAceHash;
                self->_requestAceHash = v27;
              }
              v29 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v99 = v30;
                __int16 v100 = 2048;
                uint64_t v101 = v25;
                _os_log_impl(&dword_1D422A000, v29, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append store: %lld", buf, 0x16u);
              }

              [v14 addCloudItemID:v25 idType:1];
            }
            uint64_t v20 = [v79 countByEnumeratingWithState:&v89 objects:v102 count:16];
          }
          while (v20);
        }
LABEL_50:
      }
      uint64_t v77 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v77);
  }

  if (![(NSString *)self->_requestAceHash length])
  {
    uint64_t v61 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v61);
    v62 = (NSString *)objc_claimAutoreleasedReturnValue();
    v63 = self->_requestAceHash;
    self->_requestAceHash = v62;
  }
  v64 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v99 = v65;
    _os_log_impl(&dword_1D422A000, v64, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: rewrite playlist", buf, 0xCu);
  }

  v66 = (void *)[(NSString *)self->_requestAceHash copy];
  v67 = *(Class *)((char *)&self->super.super.super.super.super.isa + v71);
  uint64_t v68 = [v73 persistentID];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = sub_1D422FD60;
  v82[3] = &unk_1E69E3FD0;
  id v83 = v66;
  id v84 = v72;
  id v69 = v72;
  id v70 = v66;
  [v67 setPlaylistProperties:0 trackList:v14 forPlaylistWithPersistentID:v68 completionHandler:v82];
}

- (void)_appendItemToCloudPlaylist:(id)a3 completion:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(NSString *)self->_requestAceHash length])
  {
    v8 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;
  }
  v11 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v63 = v12;
    _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: tail insertion", buf, 0xCu);
  }

  v13 = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  uint64_t v14 = [v13 objectAtIndex:0];

  v15 = [MEMORY[0x1E4F31890] controllerWithUserIdentity:self->_userIdentity];
  cloudController = self->_cloudController;
  self->_cloudController = v15;

  v17 = [v14 identifier];
  uint64_t v18 = sub_1D4232A80(v17);

  if (v18 == 3)
  {
    uint64_t v19 = [v14 items];
    uint64_t v20 = [v19 objectAtIndex:0];
    uint64_t v21 = [v20 identifier];

    if (![(NSString *)self->_requestAceHash length])
    {
      v22 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Playlist", v22);
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_requestAceHash;
      self->_requestAceHash = v23;
    }
    uint64_t v25 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v63 = v26;
      __int16 v64 = 2114;
      uint64_t v65 = (uint64_t)v21;
      _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append store: %{public}@", buf, 0x16u);
    }

    v27 = [v21 lastPathComponent];
    uint64_t v28 = [v27 longLongValue];

    id v29 = (id)[(NSString *)self->_requestAceHash copy];
  }
  else
  {
    v30 = [v14 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];
    v31 = [v30 items];
    uint64_t v32 = [v31 objectAtIndex:0];

    if (![(NSString *)self->_requestAceHash length])
    {
      uint64_t v33 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Playlist", v33);
      uint64_t v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = self->_requestAceHash;
      self->_requestAceHash = v34;
    }
    v36 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v63 = v37;
      __int16 v64 = 2114;
      uint64_t v65 = (uint64_t)v32;
      _os_log_impl(&dword_1D422A000, v36, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append: %{public}@", buf, 0x16u);
    }

    uint64_t v38 = [v32 valueForProperty:*MEMORY[0x1E4F31528]];
    uint64_t v28 = [v38 longLongValue];

    v39 = [v32 valueForProperty:*MEMORY[0x1E4F31520]];
    uint64_t v40 = [v39 unsignedLongLongValue];

    id v29 = (id)[(NSString *)self->_requestAceHash copy];
    if (v40)
    {
      if (![(NSString *)self->_requestAceHash length])
      {
        v41 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
        sub_1D4244ECC(@"Add Media Items To Playlist", v41);
        v42 = (NSString *)objc_claimAutoreleasedReturnValue();
        v43 = self->_requestAceHash;
        self->_requestAceHash = v42;
      }
      v44 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = self->_requestAceHash;
        *(_DWORD *)buf = 138543618;
        v63 = v45;
        __int16 v64 = 2048;
        uint64_t v65 = v40;
        _os_log_impl(&dword_1D422A000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append saga: %llu", buf, 0x16u);
      }

      uint64_t v46 = self->_cloudController;
      uint64_t v47 = [v6 persistentID];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = sub_1D42304B8;
      v59[3] = &unk_1E69E3FD0;
      id v29 = v29;
      id v60 = v29;
      id v61 = v7;
      [(MPCloudController *)v46 addItemWithSagaID:v40 toPlaylistWithPersistentID:v47 completionHandler:v59];

      uint64_t v48 = v60;
      goto LABEL_27;
    }
  }
  if (!v28)
  {
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:@"Unknown item type" requestHash:self->_requestAceHash completion:v7];
    goto LABEL_29;
  }
  if (![(NSString *)self->_requestAceHash length])
  {
    NSUInteger v49 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v49);
    NSUInteger v50 = (NSString *)objc_claimAutoreleasedReturnValue();
    v51 = self->_requestAceHash;
    self->_requestAceHash = v50;
  }
  v52 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    v63 = v53;
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    _os_log_impl(&dword_1D422A000, v52, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append adam: %llu", buf, 0x16u);
  }

  v54 = self->_cloudController;
  uint64_t v55 = [v6 persistentID];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1D42304D0;
  v56[3] = &unk_1E69E3FD0;
  id v29 = v29;
  id v57 = v29;
  id v58 = v7;
  [(MPCloudController *)v54 addStoreItemWithAdamID:v28 toPlaylistWithPersistentID:v55 completionHandler:v56];

  uint64_t v48 = v57;
LABEL_27:

LABEL_29:
}

- (void)_addItemsToCloudLibrary:(id)a3
{
  id v15 = a3;
  v4 = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  uint64_t v5 = [v4 count];

  id v6 = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  id v7 = [v6 objectAtIndex:0];
  v8 = [v7 items];
  uint64_t v9 = [v8 count];

  v10 = [(SAMPAddMediaItemsToPlaylist *)self insertLocation];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F97310]];

  v12 = [(SAMPAddMediaItemsToPlaylist *)self playlist];
  v13 = [v12 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];

  id v14 = v13;
  if (v5 == 1 && v9 == 1 && v11)
  {
    [(MPAssistantAddMediaItemsToPlaylist *)self _appendItemToCloudPlaylist:v14 completion:v15];
  }
  else if (v11)
  {
    [(MPAssistantAddMediaItemsToPlaylist *)self _appendItemsToCloudPlaylist:v14 completion:v15];
  }
  else
  {
    [(MPAssistantAddMediaItemsToPlaylist *)self _prependItemsToCloudPlaylist:v14 completion:v15];
  }
}

- (void)_addItemsToLocalLibrary:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  v4 = [(SAMPAddMediaItemsToPlaylist *)self playlist];
  uint64_t v5 = [v4 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];

  id v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
  uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v76;
    uint64_t v59 = *MEMORY[0x1E4F31500];
    uint64_t v58 = *MEMORY[0x1E4F31528];
    uint64_t v53 = *(void *)v76;
    id v54 = v6;
    do
    {
      uint64_t v11 = 0;
      uint64_t v55 = v9;
      do
      {
        if (*(void *)v76 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v75 + 1) + 8 * v11);
        v13 = [v12 identifier];
        uint64_t v14 = sub_1D4232A80(v13);

        if (v14 == 3)
        {
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v15 = [v12 items];
          uint64_t v62 = [v15 countByEnumeratingWithState:&v71 objects:v85 count:16];
          if (v62)
          {
            uint64_t v57 = v11;
            uint64_t v60 = *(void *)v72;
            id v61 = v15;
            do
            {
              for (uint64_t i = 0; i != v62; ++i)
              {
                if (*(void *)v72 != v60) {
                  objc_enumerationMutation(v15);
                }
                v17 = [*(id *)(*((void *)&v71 + 1) + 8 * i) identifier];
                uint64_t v18 = [v17 lastPathComponent];
                uint64_t v19 = [v18 longLongValue];

                if (![(NSString *)self->_requestAceHash length])
                {
                  uint64_t v20 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
                  sub_1D4244ECC(@"Add Media Items To Playlist", v20);
                  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
                  requestAceHash = self->_requestAceHash;
                  self->_requestAceHash = v21;
                }
                v23 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  v24 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  uint64_t v82 = v24;
                  __int16 v83 = 2048;
                  uint64_t v84 = v19;
                  _os_log_impl(&dword_1D422A000, v23, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: add adam ID: %lld", buf, 0x16u);
                }
                uint64_t v25 = self;

                v26 = [NSNumber numberWithLongLong:v19];
                v27 = (void *)MEMORY[0x1E4F318F8];
                uint64_t v28 = [MEMORY[0x1E4F31968] predicateWithValue:v26 forProperty:v59];
                v80[0] = v28;
                id v29 = [MEMORY[0x1E4F31968] predicateWithValue:v26 forProperty:v58];
                v80[1] = v29;
                v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
                v31 = [v27 predicateMatchingPredicates:v30];

                uint64_t v32 = [MEMORY[0x1E4F31970] songsQuery];
                [v32 addFilterPredicate:v31];
                [v32 setEntityLimit:1];
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                uint64_t v33 = [v32 items];
                uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:v79 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v68;
                  do
                  {
                    for (uint64_t j = 0; j != v35; ++j)
                    {
                      if (*(void *)v68 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      [v7 addObject:*(void *)(*((void *)&v67 + 1) + 8 * j)];
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v67 objects:v79 count:16];
                  }
                  while (v35);
                }

                id v15 = v61;
                self = v25;
              }
              uint64_t v62 = [v61 countByEnumeratingWithState:&v71 objects:v85 count:16];
            }
            while (v62);
            id v6 = v54;
            uint64_t v9 = v55;
            uint64_t v10 = v53;
            uint64_t v11 = v57;
          }
        }
        else
        {
          id v15 = [v12 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];
          uint64_t v38 = [v15 items];
          [v7 addObjectsFromArray:v38];
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
    }
    while (v9);
  }

  if (![(NSString *)self->_requestAceHash length])
  {
    v39 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v39);
    uint64_t v40 = (NSString *)objc_claimAutoreleasedReturnValue();
    v41 = self->_requestAceHash;
    self->_requestAceHash = v40;
  }
  v42 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = self->_requestAceHash;
    uint64_t v44 = [v7 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v82 = v43;
    __int16 v83 = 2048;
    uint64_t v84 = v44;
    _os_log_impl(&dword_1D422A000, v42, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: items to add: %lu", buf, 0x16u);
  }

  v45 = [(SAMPAddMediaItemsToPlaylist *)self insertLocation];
  int v46 = [v45 isEqualToString:*MEMORY[0x1E4F97308]];

  if (v46)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v47 addObjectsFromArray:v7];
    uint64_t v48 = [v6 items];
    [v47 addObjectsFromArray:v48];

    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = sub_1D4230DA8;
    v65[3] = &unk_1E69E2ED8;
    v65[4] = self;
    NSUInteger v49 = v52;
    id v66 = v52;
    [v6 replaceItems:v47 completion:v65];
  }
  else
  {
    NSUInteger v50 = [(SAMPAddMediaItemsToPlaylist *)self insertLocation];
    int v51 = [v50 isEqualToString:*MEMORY[0x1E4F97310]];

    if (v51)
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = sub_1D4230F48;
      v63[3] = &unk_1E69E2ED8;
      v63[4] = self;
      NSUInteger v49 = v52;
      id v64 = v52;
      [v6 appendItems:v7 completion:v63];
    }
    else
    {
      NSUInteger v49 = v52;
      +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:@"Uexpected insertion order requested." requestHash:self->_requestAceHash completion:v52];
    }
  }
}

- (void)_appendToPlaylistWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SAMPAddMediaItemsToPlaylist *)self playlist];
  id v6 = [v5 MPMediaItemCollectionRepresentationWithUserIdentity:self->_userIdentity plugin:@"Add Media Items To Playlist" hash:self->_requestAceHash];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Collection object was not a playlist. Unable to add tracks to something that is not a playlist."];
    if (![(NSString *)self->_requestAceHash length])
    {
      id v15 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Playlist", v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v16;
    }
    uint64_t v18 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = self->_requestAceHash;
      int v29 = 138543618;
      v30 = v19;
      __int16 v31 = 2114;
      uint64_t v32 = v7;
      _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (append) <%{public}@>: failed: %{public}@", (uint8_t *)&v29, 0x16u);
    }

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v7];
    goto LABEL_15;
  }
  id v7 = [v6 valueForProperty:*MEMORY[0x1E4F31598]];
  if (![v7 BOOLValue])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v20 = (void *)[v21 initWithErrorCode:*MEMORY[0x1E4F97370]];
LABEL_15:
    v22 = v20;
    v23 = [v20 dictionary];
    v4[2](v4, v23);

    goto LABEL_16;
  }
  BOOL v8 = [(MPAssistantAddMediaItemsToPlaylist *)self _isSagaAuthenticated];
  NSUInteger v9 = [(NSString *)self->_requestAceHash length];
  if (v8)
  {
    if (!v9)
    {
      uint64_t v10 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Playlist", v10);
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->_requestAceHash;
      self->_requestAceHash = v11;
    }
    v13 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_requestAceHash;
      int v29 = 138543362;
      v30 = v14;
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (append) <%{public}@>: iCML available", (uint8_t *)&v29, 0xCu);
    }

    [(MPAssistantAddMediaItemsToPlaylist *)self _addItemsToCloudLibrary:v4];
  }
  else
  {
    if (!v9)
    {
      v24 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
      sub_1D4244ECC(@"Add Media Items To Playlist", v24);
      uint64_t v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_requestAceHash;
      self->_requestAceHash = v25;
    }
    v27 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = self->_requestAceHash;
      int v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (append) <%{public}@>: local library", (uint8_t *)&v29, 0xCu);
    }

    [(MPAssistantAddMediaItemsToPlaylist *)self _addItemsToLocalLibrary:v4];
  }
LABEL_16:
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    uint64_t v5 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  BOOL v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v9 = self->_requestAceHash;
    uint64_t v10 = [(SAMPAddMediaItemsToPlaylist *)self insertLocation];
    uint64_t v11 = [(SAMPAddMediaItemsToPlaylist *)self mediaItems];
    v12 = [(SAMPAddMediaItemsToPlaylist *)self playlist];
    v13 = [v12 dictionary];
    *(_DWORD *)buf = 138544130;
    id v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (invoke) <%{public}@>: insert location %{public}@, media item %{public}@, playlist %{public}@", buf, 0x2Au);
  }
  uint64_t v14 = self->_requestAceHash;
  id v15 = [(SAMPAddMediaItemsToPlaylist *)self influencedUserSharedUserId];
  v16 = [(SAMPAddMediaItemsToPlaylist *)self influencedUserSharedUserId];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1D4231670;
  v18[3] = &unk_1E69E3F08;
  v18[4] = self;
  id v19 = v4;
  id v17 = v4;
  sub_1D4246230(@"Add Media Items To Playlist", v14, v15, v16, v18);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_requestAceHash length])
  {
    v3 = [(MPAssistantAddMediaItemsToPlaylist *)self aceId];
    sub_1D4244ECC(@"Add Media Items To Playlist", v3);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v4;
  }
  id v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (dealloc) <%{public}@>: dealloced", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPAssistantAddMediaItemsToPlaylist;
  [(MPAssistantAddMediaItemsToPlaylist *)&v8 dealloc];
}

+ (void)_notifyAssistantWithError:(id)a3 requestHash:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3)
  {
    objc_super v8 = NSString;
    id v9 = a5;
    uint64_t v10 = [v8 stringWithFormat:@"%@", a3];
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v10];
    v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v11 dictionary];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = @"Add Media Items To Playlist";
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      __int16 v22 = v13;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x20u);
    }
    goto LABEL_6;
  }
  uint64_t v14 = (objc_class *)MEMORY[0x1E4F965B8];
  id v15 = a5;
  id v11 = objc_alloc_init(v14);
  uint64_t v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v11 dictionary];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = @"Add Media Items To Playlist";
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    __int16 v22 = v12;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x20u);
LABEL_6:
  }
  v16 = [v11 dictionary];
  (*((void (**)(id, void *))a5 + 2))(a5, v16);
}

+ (void)_notifyAssistantWithString:(id)a3 requestHash:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F965A8];
    id v10 = a5;
    id v11 = (id)[[v9 alloc] initWithReason:v7];
    v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v11 dictionary];
      int v19 = 138543874;
      id v20 = @"Add Media Items To Playlist";
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      uint64_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1D422A000, v14, v15, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    v16 = (objc_class *)MEMORY[0x1E4F965B8];
    id v17 = a5;
    id v11 = objc_alloc_init(v16);
    v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v11 dictionary];
      int v19 = 138543874;
      id v20 = @"Add Media Items To Playlist";
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      uint64_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  uint64_t v18 = [v11 dictionary];
  (*((void (**)(id, void *))a5 + 2))(a5, v18);
}

@end
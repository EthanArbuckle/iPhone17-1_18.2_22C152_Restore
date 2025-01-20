@interface MPAssistantLoadPredefinedQueue
- (id)_radioStations;
- (id)_validate;
- (void)_performWithNowPlayingItem:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MPAssistantLoadPredefinedQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_availability, 0);

  objc_storeStrong((id *)&self->_serviceHelper, 0);
}

- (id)_radioStations
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1D42573C0;
  v22 = sub_1D42573D0;
  id v23 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [MEMORY[0x1E4F31A08] defaultRadioLibrary];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = sub_1D42573D8;
  v15 = &unk_1E69E3D00;
  v17 = &v18;
  v4 = v2;
  v16 = v4;
  [v3 getRecentStationGroupsWithCompletionHandler:&v12];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (void *)v19[5];
  if (!v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F31A08], "defaultRadioLibrary", v12, v13, v14, v15);
    v7 = [v6 stations];
    uint64_t v8 = [v7 mutableCopy];
    v9 = (void *)v19[5];
    v19[5] = v8;

    v5 = (void *)v19[5];
  }
  id v10 = v5;

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)_validate
{
  unsigned int v2 = [(MPAssistantLoadPredefinedQueue *)self mediaItemType];
  if (v2 > 0xF || ((1 << v2) & 0xC008) == 0) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"Unsupported media item type"];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)_performWithNowPlayingItem:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v8 = a5;
  uint64_t v100 = *MEMORY[0x1E4F77770];
  v101[0] = @"com.apple.MediaAssistant.siri";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:&v100 count:1];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = sub_1D42580D8;
  v93[3] = &unk_1E69E3BE8;
  v93[4] = self;
  id v10 = v9;
  id v94 = v10;
  id v11 = v8;
  id v95 = v11;
  uint64_t v12 = (void *)MEMORY[0x1D94452A0](v93);
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = sub_1D42581F4;
  v91[3] = &unk_1E69E3C60;
  v91[4] = self;
  id v13 = v12;
  id v92 = v13;
  v14 = (void *)MEMORY[0x1D94452A0](v91);
  unsigned int v15 = [(MPAssistantLoadPredefinedQueue *)self mediaItemType];
  v79 = [(MPAssistantLoadPredefinedQueue *)self refId];
  if (v15 == 3)
  {
    if ((MRMediaRemoteIsBooksAppInstalled() & 1) == 0)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F965A8]);
      (*((void (**)(id, id))v11 + 2))(v11, v18);
    }
    uint64_t v19 = [MEMORY[0x1E4F31970] audiobooksQuery];
LABEL_9:
    id v20 = (id)v19;
    if (v19)
    {
      v21 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
      [v20 setMediaLibrary:v21];

      uint64_t v77 = a4;
      switch([(MPCAssistantAvailability *)self->_availability assistantStreamingGetAvailability:*(unsigned int *)&a4])
      {
        case 0:
          if (![(NSString *)self->_requestAceHash length])
          {
            v22 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v22);
            id v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            requestAceHash = self->_requestAceHash;
            self->_requestAceHash = v23;
          }
          v25 = _MPLogCategoryAssistant();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          v26 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v97 = v26;
          v27 = "Load Predefined Queue (query) <%{public}@>: streaming not available";
          break;
        case 1:
          if (![(NSString *)self->_requestAceHash length])
          {
            v34 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v34);
            v35 = (NSString *)objc_claimAutoreleasedReturnValue();
            v36 = self->_requestAceHash;
            self->_requestAceHash = v35;
          }
          v25 = _MPLogCategoryAssistant();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          v37 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v97 = v37;
          v27 = "Load Predefined Queue (query) <%{public}@>: network conditions do not permit streaming";
          break;
        case 2:
          if (![(NSString *)self->_requestAceHash length])
          {
            v38 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v38);
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            v40 = self->_requestAceHash;
            self->_requestAceHash = v39;
          }
          v25 = _MPLogCategoryAssistant();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          v41 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v97 = v41;
          v27 = "Load Predefined Queue (query) <%{public}@>: companion not available";
          break;
        case 3:
          if (![(NSString *)self->_requestAceHash length])
          {
            v69 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v69);
            v70 = (NSString *)objc_claimAutoreleasedReturnValue();
            v71 = self->_requestAceHash;
            self->_requestAceHash = v70;
          }
          v42 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v72 = self->_requestAceHash;
            *(_DWORD *)buf = 138543362;
            v97 = v72;
            _os_log_impl(&dword_1D422A000, v42, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (query) <%{public}@>: companion will be used", buf, 0xCu);
          }
          uint64_t v33 = 0;
          goto LABEL_32;
        case 4:
          if (![(NSString *)self->_requestAceHash length])
          {
            v73 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v73);
            v74 = (NSString *)objc_claimAutoreleasedReturnValue();
            v75 = self->_requestAceHash;
            self->_requestAceHash = v74;
          }
          v42 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v76 = self->_requestAceHash;
            *(_DWORD *)buf = 138543362;
            v97 = v76;
            _os_log_impl(&dword_1D422A000, v42, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (query) <%{public}@>: streaming available", buf, 0xCu);
          }
          goto LABEL_31;
        default:
          uint64_t v33 = 1;
          goto LABEL_33;
      }
      _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_30:

      v42 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4F313E0]];
      [v20 addFilterPredicate:v42];
LABEL_31:
      uint64_t v33 = 1;
LABEL_32:

LABEL_33:
      if ([v20 _countOfItems])
      {
        if (![(NSString *)self->_requestAceHash length])
        {
          v43 = [(MPAssistantLoadPredefinedQueue *)self aceId];
          sub_1D4244ECC(@"Load Predefined Queue", v43);
          v44 = (NSString *)objc_claimAutoreleasedReturnValue();
          v45 = self->_requestAceHash;
          self->_requestAceHash = v44;
        }
        v46 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v97 = v47;
          __int16 v98 = 2048;
          uint64_t v99 = v15;
          _os_log_impl(&dword_1D422A000, v46, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: beginning playback (type %ld).", buf, 0x16u);
        }

        uint64_t v48 = [(MPAssistantLoadPredefinedQueue *)self shouldShuffle];
        v49 = [MEMORY[0x1E4F76E58] queryQueueWithContextID:v79 query:v20];
        [v49 setShuffleType:v48];
        v50 = [(MPAssistantLoadPredefinedQueue *)self startPlaying];
        objc_msgSend(v49, "setShouldImmediatelyStartPlayback:", objc_msgSend(v50, "BOOLValue"));

        [v49 setShouldOverrideManuallyCuratedQueue:1];
        v51 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
        v52 = [(MPAssistantLoadPredefinedQueue *)self hashedRouteUIDs];
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = sub_1D4258AA8;
        v80[3] = &unk_1E69E3CB0;
        v80[4] = self;
        id v82 = v11;
        id v83 = v14;
        id v81 = v49;
        id v53 = v49;
        [v51 resolveWithQueue:v53 hashedRouteIdentifiers:v52 localPlaybackPermitted:v33 audioRoutingInfo:v77 completion:v80];
      }
      else
      {
        BOOL v54 = sub_1D4244E1C(self->_userIdentity);
        NSUInteger v55 = [(NSString *)self->_requestAceHash length];
        if (v54)
        {
          if (!v55)
          {
            v56 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v56);
            v57 = (NSString *)objc_claimAutoreleasedReturnValue();
            v58 = self->_requestAceHash;
            self->_requestAceHash = v57;
          }
          v59 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v60 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v97 = v60;
            __int16 v98 = 2048;
            uint64_t v99 = v15;
            _os_log_impl(&dword_1D422A000, v59, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: still loading library (type %ld).", buf, 0x16u);
          }

          id v61 = objc_alloc(MEMORY[0x1E4F965A8]);
          v62 = (void *)MEMORY[0x1E4F97398];
        }
        else
        {
          if (!v55)
          {
            v63 = [(MPAssistantLoadPredefinedQueue *)self aceId];
            sub_1D4244ECC(@"Load Predefined Queue", v63);
            v64 = (NSString *)objc_claimAutoreleasedReturnValue();
            v65 = self->_requestAceHash;
            self->_requestAceHash = v64;
          }
          v66 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v97 = v67;
            __int16 v98 = 2048;
            uint64_t v99 = v15;
            _os_log_impl(&dword_1D422A000, v66, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: empty library for (type %ld).", buf, 0x16u);
          }

          id v61 = objc_alloc(MEMORY[0x1E4F965A8]);
          v62 = (void *)MEMORY[0x1E4F97378];
        }
        v68 = (void *)[v61 initWithErrorCode:*v62];
        (*((void (**)(id, void *))v11 + 2))(v11, v68);
      }
      goto LABEL_51;
    }
LABEL_15:
    if (![(NSString *)self->_requestAceHash length])
    {
      v28 = [(MPAssistantLoadPredefinedQueue *)self aceId];
      sub_1D4244ECC(@"Load Predefined Queue", v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_requestAceHash;
      self->_requestAceHash = v29;
    }
    v31 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v97 = v32;
      __int16 v98 = 2048;
      uint64_t v99 = v15;
      _os_log_impl(&dword_1D422A000, v31, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: unrecognized media (type %ld).", buf, 0x16u);
    }

    id v20 = objc_alloc_init(MEMORY[0x1E4F965A8]);
    (*((void (**)(id, id))v11 + 2))(v11, v20);
LABEL_51:

    v17 = v78;
    goto LABEL_52;
  }
  if (v15 == 15)
  {
    uint64_t v19 = [MEMORY[0x1E4F31970] songsQuery];
    goto LABEL_9;
  }
  if (v15 != 14) {
    goto LABEL_15;
  }
  availability = self->_availability;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = sub_1D42582E0;
  v84[3] = &unk_1E69E3CD8;
  v84[4] = self;
  id v87 = v11;
  v17 = v78;
  id v85 = v78;
  $294CB042FB18EDF8FD74FDF4F765ED39 v90 = a4;
  id v86 = v10;
  id v88 = v14;
  int v89 = 14;
  [(MPCAssistantAvailability *)availability assistantRadioGetAvailability:*(unsigned int *)&a4 completion:v84];

LABEL_52:
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, NSObject *))a3;
  id v7 = a4;
  id v8 = (MPCAssistantAvailability *)objc_alloc_init(MEMORY[0x1E4F76E20]);
  availability = self->_availability;
  self->_availability = v8;

  objc_storeStrong((id *)&self->_serviceHelper, a4);
  if (qword_1EA6C8F18 != -1) {
    dispatch_once(&qword_1EA6C8F18, &unk_1F2BFA240);
  }
  if (![(NSString *)self->_requestAceHash length])
  {
    id v10 = [(MPAssistantLoadPredefinedQueue *)self aceId];
    sub_1D4244ECC(@"Load Predefined Queue", v10);
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;
  }
  id v13 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_requestAceHash;
    [(MPAssistantLoadPredefinedQueue *)self mediaItemType];
    unsigned int v15 = stringForSAMPType();
    int v16 = [(MPAssistantLoadPredefinedQueue *)self dryRun];
    v17 = &stru_1F2BFA380;
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    __int16 v33 = 2114;
    if (v16) {
      v17 = @" ⚠️ DRY RUN";
    }
    v34 = v15;
    __int16 v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (invoke) <%{public}@>: media item type %{public}@%{public}@", buf, 0x20u);
  }
  id v18 = self->_requestAceHash;
  uint64_t v19 = [(MPAssistantLoadPredefinedQueue *)self hashedRouteUIDs];
  sub_1D4245018(@"Load Predefined Queue", v18, v19);

  id v20 = [(MPAssistantLoadPredefinedQueue *)self _validate];
  if (v20)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v21 = [(MPAssistantLoadPredefinedQueue *)self aceId];
      sub_1D4244ECC(@"Load Predefined Queue", v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v23 = self->_requestAceHash;
      self->_requestAceHash = v22;
    }
    v24 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_requestAceHash;
      v26 = [v20 dictionary];
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      __int16 v33 = 2114;
      v34 = v26;
      _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    v27 = [v20 dictionary];
    v6[2](v6, v27);
  }
  else
  {
    v27 = sub_1D42461A8();
    v28 = dispatch_queue_create("com.apple.mediaPlayer.assistant.loadPredefinedQueue", 0);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D425980C;
    v29[3] = &unk_1E69E3BC0;
    v29[4] = self;
    v30 = v6;
    dispatch_group_notify(v27, v28, v29);
  }
}

@end
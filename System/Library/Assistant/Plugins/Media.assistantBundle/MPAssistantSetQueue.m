@interface MPAssistantSetQueue
- (void)_performMediaItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4;
- (void)_performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:(BOOL)a3 onlyPlayableItems:(BOOL)a4 onlyLocalItems:(BOOL)a5 completion:(id)a6;
- (void)_performRadioStationSetQueueAsDryRun:(BOOL)a3 completion:(id)a4;
- (void)_performStoreItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4;
- (void)_performWithCompletion:(id)a3;
- (void)_playAlbumFromMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6;
- (void)_playMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
- (void)sendQueue:(id)a3 toDestination:(id)a4 shouldResync:(BOOL)a5 completion:(id)a6;
@end

@implementation MPAssistantSetQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_availability, 0);

  objc_storeStrong((id *)&self->_serviceHelper, 0);
}

- (void)sendQueue:(id)a3 toDestination:(id)a4 shouldResync:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D4238D2C;
  v28[3] = &unk_1E69E2EB0;
  id v13 = v10;
  id v29 = v13;
  v30 = self;
  BOOL v32 = a5;
  id v31 = v12;
  id v14 = v12;
  v15 = (void *)MEMORY[0x1D94452A0](v28);
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaPlayer.assistant.setQueue.sendCommand", 0);
  v17 = (void *)[v11 mutableCopy];
  [v17 setSingleGroup:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D4238EE4;
  v22[3] = &unk_1E69E2F00;
  id v23 = v11;
  v24 = self;
  id v26 = v13;
  id v27 = v15;
  id v25 = v17;
  id v18 = v13;
  id v19 = v17;
  id v20 = v15;
  id v21 = v11;
  MEMORY[0x1D9444D60](v16, v22);
}

- (void)_playMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D4239608;
  v16[3] = &unk_1E69E2E60;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  BOOL v20 = a5;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  sub_1D4239608((uint64_t)v16, 0);
}

- (void)_playAlbumFromMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (![(NSString *)self->_requestAceHash length])
  {
    id v13 = [(MPAssistantSetQueue *)self aceId];
    sub_1D4244ECC(@"Set Queue", v13);
    id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v14;
  }
  dispatch_queue_t v16 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: find album with pid %{public}@", buf, 0x16u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D423A064;
  v21[3] = &unk_1E69E2E60;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  BOOL v25 = a5;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  sub_1D423A064((uint64_t)v21, 0);
}

- (void)_performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:(BOOL)a3 onlyPlayableItems:(BOOL)a4 onlyLocalItems:(BOOL)a5 completion:(id)a6
{
  BOOL v136 = a5;
  BOOL v129 = a4;
  BOOL v133 = a3;
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  v8 = [(MPAssistantSetQueue *)self mediaItems];
  v139 = [v8 identifier];

  v9 = [(MPAssistantSetQueue *)self refId];
  uint64_t v162 = 0;
  v163 = (id *)&v162;
  uint64_t v164 = 0x3032000000;
  v165 = sub_1D423C0E4;
  v166 = sub_1D423C0F4;
  id v167 = 0;
  v157[0] = MEMORY[0x1E4F143A8];
  v157[1] = 3221225472;
  v157[2] = sub_1D423C0FC;
  v157[3] = &unk_1E69E2DE8;
  v160 = &v162;
  v157[4] = self;
  id v135 = v7;
  id v159 = v135;
  id v132 = v9;
  id v158 = v132;
  BOOL v161 = v133;
  v134 = (void (**)(void))MEMORY[0x1D94452A0](v157);
  id v10 = [v139 scheme];
  LODWORD(v9) = [v10 isEqualToString:@"x-sampplaylist"];

  if (v9)
  {
    obuint64_t j = [MEMORY[0x1E4F31970] playlistsQuery];
    if (self->_userIdentity)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
      [obj setMediaLibrary:v11];
    }
    id v138 = [v139 lastPathComponent];
    if ([v138 length])
    {
      id v12 = [MEMORY[0x1E4F31968] predicateWithValue:v138 forProperty:*MEMORY[0x1E4F31568]];
      [obj addFilterPredicate:v12];

      objc_storeStrong(v163 + 5, obj);
      if (![(NSString *)self->_requestAceHash length])
      {
        id v13 = [(MPAssistantSetQueue *)self aceId];
        sub_1D4244ECC(@"Set Queue", v13);
        id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        requestAceHash = self->_requestAceHash;
        self->_requestAceHash = v14;
      }
      dispatch_queue_t v16 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = self->_requestAceHash;
        id v18 = [obj collections];
        id v19 = [v18 firstObject];
        *(_DWORD *)buf = 138543618;
        v174 = v17;
        __int16 v175 = 2114;
        v176 = v19;
        _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: playlist %{public}@", buf, 0x16u);
      }
      goto LABEL_97;
    }
    id v83 = objc_alloc(MEMORY[0x1E4F965A8]);
    dispatch_queue_t v16 = [v83 initWithErrorCode:*MEMORY[0x1E4F973B0]];
    (*((void (**)(id, uint64_t, NSObject *))v135 + 2))(v135, 1, v16);
    goto LABEL_88;
  }
  id v20 = [v139 scheme];
  int v21 = [v20 isEqualToString:@"x-sampmeditem"];

  if (!v21)
  {
    v59 = [v139 scheme];
    int v60 = [v59 isEqualToString:@"x-sampcollection-album"];

    if (!v60) {
      goto LABEL_98;
    }
    v61 = NSNumber;
    v62 = [v139 lastPathComponent];
    obuint64_t j = objc_msgSend(v61, "numberWithLongLong:", objc_msgSend(v62, "longLongValue"));

    if (![obj longLongValue])
    {
      if (![(NSString *)self->_requestAceHash length])
      {
        v97 = [(MPAssistantSetQueue *)self aceId];
        sub_1D4244ECC(@"Set Queue", v97);
        v98 = (NSString *)objc_claimAutoreleasedReturnValue();
        v99 = self->_requestAceHash;
        self->_requestAceHash = v98;
      }
      v100 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        v101 = self->_requestAceHash;
        *(_DWORD *)buf = 138543362;
        v174 = v101;
        _os_log_impl(&dword_1D422A000, v100, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no identifier received", buf, 0xCu);
      }

      id v102 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v138 = (id)[v102 initWithErrorCode:*MEMORY[0x1E4F973B0]];
      (*((void (**)(id, void, id))v135 + 2))(v135, 0, v138);
      goto LABEL_89;
    }
    id v138 = objc_alloc_init(MEMORY[0x1E4F31970]);
    if (self->_userIdentity)
    {
      v63 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
      [v138 setMediaLibrary:v63];
    }
    [v138 setIgnoreSystemFilterPredicates:1];
    [v138 setShouldIncludeNonLibraryEntities:1];
    v64 = [MEMORY[0x1E4F31968] predicateWithValue:obj forProperty:*MEMORY[0x1E4F31508]];
    [v138 addFilterPredicate:v64];

    v65 = NSNumber;
    v66 = [v138 items];
    v67 = [v66 firstObject];
    uint64_t v68 = *MEMORY[0x1E4F312E0];
    v69 = [v67 valueForProperty:*MEMORY[0x1E4F312E0]];
    dispatch_queue_t v16 = objc_msgSend(v65, "numberWithUnsignedLongLong:", objc_msgSend(v69, "unsignedLongLongValue"));

    uint64_t v70 = [v16 longLongValue];
    v71 = self->_requestAceHash;
    if (v70)
    {
      if (![(NSString *)v71 length])
      {
        v72 = [(MPAssistantSetQueue *)self aceId];
        sub_1D4244ECC(@"Set Queue", v72);
        v73 = (NSString *)objc_claimAutoreleasedReturnValue();
        v74 = self->_requestAceHash;
        self->_requestAceHash = v73;
      }
      v75 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = self->_requestAceHash;
        v77 = [v138 items];
        v78 = [v77 firstObject];
        *(_DWORD *)buf = 138543618;
        v174 = v76;
        __int16 v175 = 2114;
        v176 = v78;
        _os_log_impl(&dword_1D422A000, v75, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: pilot item %{public}@", buf, 0x16u);
      }
      v79 = [MEMORY[0x1E4F31970] albumsQuery];
      if (self->_userIdentity)
      {
        v80 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
        [v79 setMediaLibrary:v80];
      }
      [v79 setIgnoreSystemFilterPredicates:1];
      [v79 setShouldIncludeNonLibraryEntities:1];
      v81 = [MEMORY[0x1E4F31968] predicateWithValue:v16 forProperty:v68];
      [v79 addFilterPredicate:v81];

      id v82 = v163[5];
      v163[5] = v79;

      goto LABEL_97;
    }
    if (![(NSString *)v71 length])
    {
      v118 = [(MPAssistantSetQueue *)self aceId];
      sub_1D4244ECC(@"Set Queue", v118);
      v119 = (NSString *)objc_claimAutoreleasedReturnValue();
      v120 = self->_requestAceHash;
      self->_requestAceHash = v119;
    }
    v121 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    {
      v122 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v174 = v122;
      __int16 v175 = 2114;
      v176 = obj;
      _os_log_impl(&dword_1D422A000, v121, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no local item %{public}@.", buf, 0x16u);
    }

    id v123 = objc_alloc(MEMORY[0x1E4F965A8]);
    v58 = [v123 initWithErrorCode:*MEMORY[0x1E4F973A8]];
    (*((void (**)(id, uint64_t, NSObject *))v135 + 2))(v135, 1, v58);
LABEL_87:

LABEL_88:
LABEL_89:

    goto LABEL_99;
  }
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v138 = [(MPAssistantSetQueue *)self mediaItems];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v22 = [v138 items];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v153 objects:v172 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v154;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v154 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = [*(id *)(*((void *)&v153 + 1) + 8 * i) identifier];
        if (sub_1D4232A80(v26) == 3)
        {
          id v27 = [v26 lastPathComponent];
          uint64_t v28 = [v27 longLongValue];

          if (!v28) {
            goto LABEL_23;
          }
          id v29 = [NSNumber numberWithLongLong:v28];
          [obj addObject:v29];
        }
        else
        {
          if (![(NSString *)self->_requestAceHash length])
          {
            uint64_t v30 = [(MPAssistantSetQueue *)self aceId];
            sub_1D4244ECC(@"Set Queue", v30);
            id v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            BOOL v32 = self->_requestAceHash;
            self->_requestAceHash = v31;
          }
          id v29 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v33 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v174 = v33;
            __int16 v175 = 2114;
            v176 = v26;
            _os_log_impl(&dword_1D422A000, v29, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: content origin %{public}@", buf, 0x16u);
          }
        }

LABEL_23:
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v153 objects:v172 count:16];
    }
    while (v23);
  }

  if (![obj count])
  {
    v84 = [v138 identifier];
    BOOL v85 = v84 == 0;

    if (!v85)
    {
      v86 = [v138 identifier];
      v87 = [v86 lastPathComponent];
      uint64_t v88 = [v87 longLongValue];

      if (v88)
      {
        v89 = [NSNumber numberWithLongLong:v88];
        [obj addObject:v89];
      }
    }
  }
  if (![obj count])
  {
    id v90 = objc_alloc(MEMORY[0x1E4F965A8]);
    dispatch_queue_t v16 = [v90 initWithErrorCode:*MEMORY[0x1E4F973B0]];
    (*((void (**)(id, uint64_t, NSObject *))v135 + 2))(v135, 1, v16);
    goto LABEL_88;
  }
  dispatch_queue_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  obuint64_t j = obj;
  uint64_t v34 = [obj countByEnumeratingWithState:&v149 objects:v171 count:16];
  if (!v34) {
    goto LABEL_48;
  }
  uint64_t v131 = *(void *)v150;
  v35 = (uint64_t *)MEMORY[0x1E4F313F8];
  uint64_t v127 = *MEMORY[0x1E4F31500];
  uint64_t v126 = *MEMORY[0x1E4F31528];
  uint64_t v124 = *MEMORY[0x1E4F973A8];
  int v130 = v136 || v129;
  if (v136) {
    v35 = (uint64_t *)MEMORY[0x1E4F313E0];
  }
  uint64_t v128 = *v35;
  while (2)
  {
    uint64_t v125 = v34;
    for (uint64_t j = 0; j != v125; ++j)
    {
      if (*(void *)v150 != v131) {
        objc_enumerationMutation(obj);
      }
      v137 = *(NSObject **)(*((void *)&v149 + 1) + 8 * j);
      id v140 = objc_alloc_init(MEMORY[0x1E4F31970]);
      if (self->_userIdentity)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
        [v140 setMediaLibrary:v37];
      }
      [v140 setIgnoreSystemFilterPredicates:1];
      [v140 setShouldIncludeNonLibraryEntities:1];
      if (!v130
        || ([MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:v128],
            (uint64_t v38 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (![(NSString *)self->_requestAceHash length])
        {
          v91 = [(MPAssistantSetQueue *)self aceId];
          sub_1D4244ECC(@"Set Queue", v91);
          v92 = (NSString *)objc_claimAutoreleasedReturnValue();
          v93 = self->_requestAceHash;
          self->_requestAceHash = v92;
        }
        v94 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v95 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v174 = v95;
          _os_log_impl(&dword_1D422A000, v94, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no playable type set", buf, 0xCu);
        }

        v96 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no playable type set"];
        (*((void (**)(id, uint64_t, void *))v135 + 2))(v135, 1, v96);

        goto LABEL_86;
      }
      v39 = (void *)v38;
      v40 = (void *)MEMORY[0x1E4F318F0];
      v41 = (void *)MEMORY[0x1E4F318F8];
      v42 = [MEMORY[0x1E4F31968] predicateWithValue:v137 forProperty:v127];
      v169[0] = v42;
      uint64_t v43 = [MEMORY[0x1E4F31968] predicateWithValue:v137 forProperty:v126];
      v169[1] = v43;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];
      v45 = [v41 predicateMatchingPredicates:v44];
      v170[0] = v45;
      v170[1] = v39;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];
      v47 = [v40 predicateMatchingPredicates:v46];

      [v140 addFilterPredicate:v47];
      v48 = [v140 items];
      LOBYTE(v43) = [v48 count] == 0;

      if (v43)
      {
        if (![(NSString *)self->_requestAceHash length])
        {
          v103 = [(MPAssistantSetQueue *)self aceId];
          sub_1D4244ECC(@"Set Queue", v103);
          v104 = (NSString *)objc_claimAutoreleasedReturnValue();
          v105 = self->_requestAceHash;
          self->_requestAceHash = v104;
        }
        v106 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v107 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v174 = v107;
          __int16 v175 = 2114;
          v176 = v137;
          _os_log_impl(&dword_1D422A000, v106, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no local item %{public}@", buf, 0x16u);
        }

        v108 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithErrorCode:v124];
        (*((void (**)(id, uint64_t, void *))v135 + 2))(v135, 1, v108);

LABEL_86:
        v58 = obj;

        goto LABEL_87;
      }
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      v49 = [v140 items];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v145 objects:v168 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v146;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v146 != v51) {
              objc_enumerationMutation(v49);
            }
            [v16 addObject:*(void *)(*((void *)&v145 + 1) + 8 * k)];
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v145 objects:v168 count:16];
        }
        while (v50);
      }
    }
    uint64_t v34 = [obj countByEnumeratingWithState:&v149 objects:v171 count:16];
    if (v34) {
      continue;
    }
    break;
  }
LABEL_48:

  if ([v16 count] == 1)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      v53 = [(MPAssistantSetQueue *)self aceId];
      sub_1D4244ECC(@"Set Queue", v53);
      v54 = (NSString *)objc_claimAutoreleasedReturnValue();
      v55 = self->_requestAceHash;
      self->_requestAceHash = v54;
    }
    v56 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v174 = v57;
      __int16 v175 = 2114;
      v176 = v16;
      _os_log_impl(&dword_1D422A000, v56, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: album from %{public}@", buf, 0x16u);
    }

    v58 = [objc_alloc(MEMORY[0x1E4F31938]) initWithItems:v16];
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = sub_1D423C2E0;
    v142[3] = &unk_1E69E2D98;
    v143 = v134;
    id v144 = v135;
    [(MPAssistantSetQueue *)self _playAlbumFromMediaItems:v58 contextID:v132 dryRun:v133 completion:v142];

    goto LABEL_87;
  }
  uint64_t v109 = [objc_alloc(MEMORY[0x1E4F31970]) initWithEntities:v16 entityType:0];
  id v110 = v163[5];
  v163[5] = (id)v109;

  if (self->_userIdentity)
  {
    v111 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
    [v163[5] setMediaLibrary:v111];
  }
  if (![(NSString *)self->_requestAceHash length])
  {
    v112 = [(MPAssistantSetQueue *)self aceId];
    sub_1D4244ECC(@"Set Queue", v112);
    v113 = (NSString *)objc_claimAutoreleasedReturnValue();
    v114 = self->_requestAceHash;
    self->_requestAceHash = v113;
  }
  v115 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    v116 = self->_requestAceHash;
    v117 = v163[5];
    *(_DWORD *)buf = 138543618;
    v174 = v116;
    __int16 v175 = 2114;
    v176 = v117;
    _os_log_impl(&dword_1D422A000, v115, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: queue from %{public}@", buf, 0x16u);
  }

LABEL_97:
LABEL_98:
  v134[2]();
LABEL_99:

  _Block_object_dispose(&v162, 8);
}

- (void)_performStoreItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MPAssistantSetQueue *)self mediaItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D423C3F0;
  v10[3] = &unk_1E69E2D48;
  id v11 = v7;
  id v12 = v6;
  v10[4] = self;
  BOOL v13 = a3;
  id v8 = v7;
  id v9 = v6;
  sub_1D423C3F0((uint64_t)v10, 0);
}

- (void)_performMediaItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MPAssistantSetQueue *)self mediaItems];
  BOOL v25 = [v7 identifier];
  uint64_t v24 = [(MPAssistantSetQueue *)self refId];
  id v8 = [v7 MPMediaItemQueryOnlyPlayableItems:1 withUserIdentity:self->_userIdentity plugin:@"Set Queue" hash:self->_requestAceHash];
  if ([v8 _countOfItems])
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D423D69C;
    v29[3] = &unk_1E69E2D70;
    id v9 = v8;
    id v30 = v9;
    id v10 = v25;
    id v31 = v10;
    id v32 = v7;
    v33 = self;
    id v11 = v24;
    id v34 = v11;
    BOOL v36 = v4;
    id v12 = v6;
    id v35 = v12;
    BOOL v13 = (void (**)(void))MEMORY[0x1D94452A0](v29);
    id v14 = [v10 scheme];
    if ([v14 isEqualToString:@"x-sampmeditem"])
    {
      id v22 = v11;
      BOOL v23 = v4;
      [v9 items];
      dispatch_queue_t v16 = v15 = v6;
      uint64_t v17 = [v16 count];

      id v6 = v15;
      if (v17 == 1)
      {
        id v18 = [v9 collections];
        id v19 = [v18 firstObject];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1D423D7C8;
        v26[3] = &unk_1E69E2D98;
        id v27 = v13;
        id v28 = v12;
        [(MPAssistantSetQueue *)self _playAlbumFromMediaItems:v19 contextID:v22 dryRun:v23 completion:v26];

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
    }
    v13[2](v13);
    goto LABEL_8;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F965A8]);
  int v21 = (void *)[v20 initWithErrorCode:*MEMORY[0x1E4F973A8]];
  (*((void (**)(id, void *))v6 + 2))(v6, v21);

LABEL_9:
}

- (void)_performRadioStationSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MPAssistantSetQueue *)self mediaItems];
  id v8 = [v7 identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D423D8C8;
  v11[3] = &unk_1E69E2D48;
  id v12 = v8;
  id v13 = v6;
  v11[4] = self;
  BOOL v14 = a3;
  id v9 = v8;
  id v10 = v6;
  sub_1D423D8C8((uint64_t)v11, 0);
}

- (void)_performWithCompletion:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  v5 = [(MPAssistantSetQueue *)self mediaItems];
  id v6 = [v5 identifier];

  id v7 = [v6 scheme];
  id v8 = v7;
  if (!v7)
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      dispatch_queue_t v16 = [(MPAssistantSetQueue *)self aceId];
      sub_1D4244ECC(@"Set Queue", v16);
      uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v17;
    }
    id v19 = _MPLogCategoryAssistant();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    id v20 = self->_requestAceHash;
    int v21 = [(MPAssistantSetQueue *)self dryRun];
    id v22 = &stru_1F2BFA380;
    *(_DWORD *)buf = 138543874;
    v62 = v20;
    __int16 v63 = 2114;
    if (v21) {
      id v22 = @" ⚠️ DRY RUN";
    }
    v64 = v6;
    __int16 v65 = 2114;
    v66 = v22;
    BOOL v23 = "Set Queue (invalid) <%{public}@>: invoke with identifier %{public}@%{public}@";
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"x-sampradio"])
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      id v9 = [(MPAssistantSetQueue *)self aceId];
      sub_1D4244ECC(@"Set Queue", v9);
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v11 = self->_requestAceHash;
      self->_requestAceHash = v10;
    }
    id v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = self->_requestAceHash;
      int v14 = [(MPAssistantSetQueue *)self dryRun];
      id v15 = &stru_1F2BFA380;
      *(_DWORD *)buf = 138543874;
      v62 = v13;
      __int16 v63 = 2114;
      if (v14) {
        id v15 = @" ⚠️ DRY RUN";
      }
      v64 = v6;
      __int16 v65 = 2114;
      v66 = v15;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "Set Queue (radio) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
    }

    [(MPAssistantSetQueue *)self _performRadioStationSetQueueAsDryRun:[(MPAssistantSetQueue *)self dryRun] completion:v4];
    goto LABEL_51;
  }
  uint64_t v26 = sub_1D4232A80(v6);
  if (v26 == 4) {
    goto LABEL_21;
  }
  if (v26 != 3)
  {
    if (v26 == 1)
    {
LABEL_21:
      if (![(NSString *)self->_requestAceHash length])
      {
        id v27 = [(MPAssistantSetQueue *)self aceId];
        sub_1D4244ECC(@"Set Queue", v27);
        id v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v29 = self->_requestAceHash;
        self->_requestAceHash = v28;
      }
      id v30 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = self->_requestAceHash;
        int v32 = [(MPAssistantSetQueue *)self dryRun];
        v33 = &stru_1F2BFA380;
        *(_DWORD *)buf = 138543874;
        v62 = v31;
        __int16 v63 = 2114;
        if (v32) {
          v33 = @" ⚠️ DRY RUN";
        }
        v64 = v6;
        __int16 v65 = 2114;
        v66 = v33;
        _os_log_impl(&dword_1D422A000, v30, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
      }

      [(MPAssistantSetQueue *)self _performMediaItemsSetQueueAsDryRun:[(MPAssistantSetQueue *)self dryRun] completion:v4];
      goto LABEL_51;
    }
    if (![(NSString *)self->_requestAceHash length])
    {
      v45 = [(MPAssistantSetQueue *)self aceId];
      sub_1D4244ECC(@"Set Queue", v45);
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      v47 = self->_requestAceHash;
      self->_requestAceHash = v46;
    }
    id v19 = _MPLogCategoryAssistant();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      id v24 = objc_alloc(MEMORY[0x1E4F965A8]);
      BOOL v25 = (void *)[v24 initWithErrorCode:*MEMORY[0x1E4F973A0]];
      v4[2](v4, v25);

      goto LABEL_51;
    }
    v48 = self->_requestAceHash;
    int v49 = [(MPAssistantSetQueue *)self dryRun];
    uint64_t v50 = &stru_1F2BFA380;
    *(_DWORD *)buf = 138543874;
    v62 = v48;
    __int16 v63 = 2114;
    if (v49) {
      uint64_t v50 = @" ⚠️ DRY RUN";
    }
    v64 = v6;
    __int16 v65 = 2114;
    v66 = v50;
    BOOL v23 = "Set Queue (invalid) <%{public}@>: invoke with invalid origin identifier %{public}@%{public}@";
LABEL_16:
    _os_log_impl(&dword_1D422A000, v19, OS_LOG_TYPE_ERROR, v23, buf, 0x20u);
    goto LABEL_17;
  }
  id v34 = [(MPAssistantSetQueue *)self sharedUserIdFromPlayableMusicAccount];
  if ([v34 length])
  {
    id v35 = [(MPAssistantSetQueue *)self assetInfo];
    uint64_t v36 = [v35 length];

    if (!v36)
    {
      if (![(NSString *)self->_requestAceHash length])
      {
        v37 = [(MPAssistantSetQueue *)self aceId];
        sub_1D4244ECC(@"Set Queue", v37);
        uint64_t v38 = (NSString *)objc_claimAutoreleasedReturnValue();
        v39 = self->_requestAceHash;
        self->_requestAceHash = v38;
      }
      v40 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_requestAceHash;
        int v42 = [(MPAssistantSetQueue *)self dryRun];
        uint64_t v43 = &stru_1F2BFA380;
        *(_DWORD *)buf = 138543874;
        v62 = v41;
        __int16 v63 = 2114;
        if (v42) {
          uint64_t v43 = @" ⚠️ DRY RUN";
        }
        v64 = v6;
        __int16 v65 = 2114;
        v66 = v43;
        _os_log_impl(&dword_1D422A000, v40, OS_LOG_TYPE_DEFAULT, "Set Queue (localstore) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
      }

      uint64_t v44 = [(MPAssistantSetQueue *)self dryRun];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = sub_1D423E894;
      v58[3] = &unk_1E69E2CD0;
      v58[4] = self;
      id v59 = v6;
      int v60 = v4;
      [(MPAssistantSetQueue *)self _performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:v44 onlyPlayableItems:1 onlyLocalItems:0 completion:v58];

      goto LABEL_51;
    }
  }
  else
  {
  }
  if (![(NSString *)self->_requestAceHash length])
  {
    uint64_t v51 = [(MPAssistantSetQueue *)self aceId];
    sub_1D4244ECC(@"Set Queue", v51);
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
    v53 = self->_requestAceHash;
    self->_requestAceHash = v52;
  }
  v54 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = self->_requestAceHash;
    int v56 = [(MPAssistantSetQueue *)self dryRun];
    v57 = &stru_1F2BFA380;
    *(_DWORD *)buf = 138543874;
    v62 = v55;
    __int16 v63 = 2114;
    if (v56) {
      v57 = @" ⚠️ DRY RUN";
    }
    v64 = v6;
    __int16 v65 = 2114;
    v66 = v57;
    _os_log_impl(&dword_1D422A000, v54, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
  }

  [(MPAssistantSetQueue *)self _performStoreItemsSetQueueAsDryRun:[(MPAssistantSetQueue *)self dryRun] completion:v4];
LABEL_51:
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (AFServiceHelper *)a4;
  id v8 = (MPCAssistantAvailability *)objc_alloc_init(MEMORY[0x1E4F76E20]);
  availability = self->_availability;
  self->_availability = v8;

  if (![(NSString *)self->_requestAceHash length])
  {
    id v10 = [(MPAssistantSetQueue *)self aceId];
    sub_1D4244ECC(@"Set Queue", v10);
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;
  }
  id v13 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = self->_requestAceHash;
    id v31 = [(MPAssistantSetQueue *)self hashedRouteUIDs];
    uint64_t v28 = [v31 count];
    [(MPAssistantSetQueue *)self assetInfo];
    v30 = id v32 = v6;
    BOOL v14 = [v30 length] != 0;
    id v15 = [(MPAssistantSetQueue *)self requesterSharedUserId];
    dispatch_queue_t v16 = v7;
    BOOL v17 = [v15 length] != 0;
    id v18 = [(MPAssistantSetQueue *)self sharedUserIdFromPlayableMusicAccount];
    BOOL v19 = [v18 length] != 0;
    id v20 = [(MPAssistantSetQueue *)self startPlaying];
    *(_DWORD *)buf = 138544642;
    uint64_t v36 = v29;
    __int16 v37 = 2048;
    uint64_t v38 = v28;
    __int16 v39 = 1024;
    BOOL v40 = v14;
    __int16 v41 = 1024;
    BOOL v42 = v17;
    id v7 = v16;
    __int16 v43 = 1024;
    BOOL v44 = v19;
    __int16 v45 = 2114;
    v46 = v20;
    _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Set Queue (invoke) <%{public}@>: %lu UIDs, asset info present %{BOOL}u, requester shared user id present %{BOOL}u, playable music account shared user id present %{BOOL}u, start %{public}@", buf, 0x32u);

    id v6 = v32;
  }

  int v21 = self->_requestAceHash;
  id v22 = [(MPAssistantSetQueue *)self hashedRouteUIDs];
  sub_1D4245018(@"Set Queue", v21, v22);

  serviceHelper = self->_serviceHelper;
  self->_serviceHelper = v7;
  id v24 = v7;

  BOOL v25 = sub_1D42461A8();
  uint64_t v26 = dispatch_queue_create("com.apple.mediaPlayer.assistant.setQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D423ED3C;
  block[3] = &unk_1E69E3BC0;
  block[4] = self;
  id v34 = v6;
  id v27 = v6;
  dispatch_group_notify(v25, v26, block);
}

@end
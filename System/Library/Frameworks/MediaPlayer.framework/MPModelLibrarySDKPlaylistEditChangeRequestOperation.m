@interface MPModelLibrarySDKPlaylistEditChangeRequestOperation
- (void)_executeWithCloudLibraryEnabledConfirmed;
- (void)execute;
@end

@implementation MPModelLibrarySDKPlaylistEditChangeRequestOperation

- (void).cxx_destruct
{
}

- (void)_executeWithCloudLibraryEnabledConfirmed
{
  v4 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self request];
  v5 = [v4 playlist];
  v78 = v5;
  v82 = [v4 mediaLibrary];
  v81 = [v4 playlistName];
  uint64_t v83 = 0;
  v84 = (id *)&v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__32102;
  v87 = __Block_byref_object_dispose__32103;
  id v88 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v77 = [v4 shouldCreatePlaylist];
  if (v77)
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = [v7 bundleIdentifier];
    uint64_t v9 = [v82 _addPlaylistWithName:v81 externalVendorIdentifier:v8];
    id v10 = v84[5];
    v84[5] = (id)v9;

    if (v81) {
      [v6 setObject:v81 forKey:@"name"];
    }
    v11 = [v84[5] valueForProperty:@"dateCreated"];
    if (v11) {
      [v6 setObject:v11 forKey:@"dateCreated"];
    }
    if (v8) {
      [v6 setObject:v8 forKey:@"externalVendorIdentifier"];
    }
    if (v84[5])
    {
      v12 = [MPModelPlaylist alloc];
      v13 = [MPIdentifierSet alloc];
      v14 = +[MPModelPlaylistKind identityKind];
      v160[0] = MEMORY[0x1E4F143A8];
      v160[1] = 3221225472;
      v160[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke;
      v160[3] = &unk_1E57F4260;
      id v161 = v82;
      v162 = &v83;
      v15 = [(MPIdentifierSet *)v13 initWithSource:@"LibrarySDKPlaylistEdit" modelKind:v14 block:v160];
      v79 = [(MPModelObject *)v12 initWithIdentifiers:v15 block:&__block_literal_global_119];
    }
    else
    {
      v79 = 0;
    }

    v5 = v78;
  }
  else
  {
    v16 = [v5 identifiers];
    v17 = [v16 library];
    uint64_t v18 = [v17 persistentID];

    if (v18)
    {
      v19 = [v82 playlistWithPersistentID:v18];
    }
    else
    {
      v19 = 0;
    }
    objc_storeStrong(v84 + 5, v19);
    if (v18) {

    }
    v79 = v5;
  }
  if (v84[5])
  {
    uint64_t v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x3032000000;
    v157 = __Block_byref_object_copy__32102;
    v158 = __Block_byref_object_dispose__32103;
    id v159 = 0;
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryPlaylistEditChangeRequestOperation.accessQueue", 0);
    dispatch_group_t v21 = dispatch_group_create();
    v22 = [v4 playlistEntries];

    if (v22)
    {
      v68 = [MEMORY[0x1E4F28B00] currentHandler];
      [v68 handleFailureInMethod:a2, self, @"MPModelLibraryPlaylistEditChangeRequestOperation.mm", 529, @"To use the SDK Playlist Edit Change Request, the musicKitPlaylistEntries should be used instead of the playlistEntries property." object file lineNumber description];
    }
    v80 = [v4 musicKitPlaylistEntries];
    v23 = objc_alloc_init(MPMutableSectionedCollection);
    uint64_t v148 = 0;
    v149 = &v148;
    uint64_t v150 = 0x3032000000;
    v151 = __Block_byref_object_copy__32102;
    v152 = __Block_byref_object_dispose__32103;
    id v153 = 0;
    v76 = v23;
    [(MPMutableSectionedCollection *)v23 appendSection:&stru_1EE680640];
    if (v80)
    {
      v24 = objc_alloc_init(MPCloudControllerItemIDList);
      v25 = (void *)v155[5];
      v155[5] = (uint64_t)v24;

      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4;
      v147[3] = &unk_1E57F4288;
      v147[4] = &v154;
      v147[5] = &v148;
      [v80 enumerateItemsUsingBlock:v147];
    }
    if (v149[5])
    {
      uint64_t v26 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self completeResponseHandler];
      v27 = (void *)v26;
      if (v26) {
        (*(void (**)(uint64_t, uint64_t, void))(v26 + 16))(v26, v149[5], 0);
      }
      [(MPAsyncOperation *)self finishWithError:v149[5]];
LABEL_64:

      _Block_object_dispose(&v148, 8);
      _Block_object_dispose(&v154, 8);

      v5 = v78;
      goto LABEL_65;
    }
    BOOL v72 = v81 != 0;
    if (v81)
    {
      dispatch_group_enter(v21);
      id v31 = v84[5];
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5;
      v142[3] = &unk_1E57FA090;
      v143 = v20;
      id v144 = v6;
      id v32 = v81;
      id v145 = v32;
      v146 = v21;
      [v31 setValue:v32 forProperty:@"name" withCompletionBlock:v142];
    }
    v27 = [v4 playlistDescription];
    if (v27)
    {
      dispatch_group_enter(v21);
      id v33 = v84[5];
      v137[0] = MEMORY[0x1E4F143A8];
      v137[1] = 3221225472;
      v137[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7;
      v137[3] = &unk_1E57FA090;
      v138 = v20;
      id v139 = v6;
      id v34 = v27;
      id v140 = v34;
      v141 = v21;
      [v33 setValue:v34 forProperty:@"descriptionInfo" withCompletionBlock:v137];

      BOOL v72 = 1;
    }
    v74 = [v4 isPublicPlaylist];
    if (v74)
    {
      dispatch_group_enter(v21);
      id v35 = v84[5];
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9;
      v132[3] = &unk_1E57FA090;
      v133 = v20;
      id v134 = v6;
      id v36 = v74;
      id v135 = v36;
      v136 = v21;
      [v35 setValue:v36 forProperty:@"cloudIsPublic" withCompletionBlock:v132];
    }
    v73 = [v4 isVisiblePlaylist];
    if (v73)
    {
      dispatch_group_enter(v21);
      id v37 = v84[5];
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_11;
      v127[3] = &unk_1E57FA090;
      v128 = v20;
      id v129 = v6;
      id v38 = v73;
      id v130 = v38;
      v131 = v21;
      [v37 setValue:v38 forProperty:@"cloudIsVisible" withCompletionBlock:v127];
    }
    v71 = [v4 isCuratorPlaylist];
    if (v71)
    {
      dispatch_group_enter(v21);
      id v39 = v84[5];
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_13;
      v122[3] = &unk_1E57FA090;
      v123 = v20;
      id v124 = v6;
      id v40 = v71;
      id v125 = v40;
      v126 = v21;
      [v39 setValue:v40 forProperty:@"cloudIsCuratorPlaylist" withCompletionBlock:v122];
    }
    v70 = [v4 isOwner];
    if (v70)
    {
      dispatch_group_enter(v21);
      id v41 = v84[5];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_15;
      v117[3] = &unk_1E57FA090;
      v118 = v20;
      id v119 = v6;
      id v42 = v70;
      id v120 = v42;
      v121 = v21;
      [v41 setValue:v42 forProperty:@"iO" withCompletionBlock:v117];
    }
    v75 = [v4 authorDisplayName];
    if ([v75 length])
    {
      dispatch_group_enter(v21);
      id v43 = v84[5];
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_17;
      v112[3] = &unk_1E57FA090;
      v113 = v20;
      id v114 = v6;
      id v44 = v75;
      id v115 = v44;
      v116 = v21;
      [v43 setValue:v44 forProperty:@"externalVendorDisplayName" withCompletionBlock:v112];

      v45 = v113;
    }
    else
    {
      if ((v77 & 1) == 0 && ![v75 isEqualToString:&stru_1EE680640]) {
        goto LABEL_61;
      }
      v69 = [MEMORY[0x1E4F28B50] mainBundle];
      v46 = [v69 localizedInfoDictionary];
      v47 = [v46 objectForKey:@"CFBundleDisplayName"];

      if (![v47 length])
      {
        v48 = [v69 localizedInfoDictionary];
        uint64_t v49 = [v48 objectForKey:@"CFBundleExecutable"];

        v47 = (void *)v49;
      }
      if (![v47 length])
      {
        v50 = [v69 infoDictionary];
        uint64_t v51 = [v50 objectForKey:@"CFBundleDisplayName"];

        v47 = (void *)v51;
      }
      v52 = [v69 infoDictionary];
      v53 = [v52 objectForKey:@"CFBundleExecutable"];

      if (![v53 length])
      {
        v54 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1952E8000, v54, OS_LOG_TYPE_ERROR, "Could not resolve default author display name", buf, 2u);
        }
      }
      if (v53)
      {
        dispatch_group_enter(v21);
        id v55 = v84[5];
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_135;
        v106[3] = &unk_1E57FA090;
        v107 = v20;
        id v108 = v6;
        id v56 = v53;
        id v109 = v56;
        v110 = v21;
        [v55 setValue:v56 forProperty:@"externalVendorDisplayName" withCompletionBlock:v106];

        v57 = v107;
      }
      else
      {
        v57 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain" code:-10004 userInfo:0];
        uint64_t v58 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self completeResponseHandler];
        v59 = (void *)v58;
        if (v58) {
          (*(void (**)(uint64_t, void *, void))(v58 + 16))(v58, v57, 0);
        }
        [(MPAsyncOperation *)self finishWithError:v57];
      }
      v45 = v69;
    }

LABEL_61:
    if (((v77 | !v72) & 1) == 0)
    {
      dispatch_group_enter(v21);
      v60 = [MEMORY[0x1E4F1C9C8] date];
      id v61 = v84[5];
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_3_137;
      v101[3] = &unk_1E57FA090;
      v102 = v20;
      id v103 = v6;
      id v104 = v60;
      v105 = v21;
      id v62 = v60;
      [v61 setValue:v62 forProperty:@"dateModified" withCompletionBlock:v101];
    }
    dispatch_group_enter(v21);
    id v63 = v84[5];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5_139;
    v97[3] = &unk_1E57F42C0;
    v98 = v20;
    id v64 = v6;
    id v99 = v64;
    v65 = v21;
    v100 = v65;
    [v63 setValue:MEMORY[0x1E4F1CC38] forProperty:@"isExternalVendorPlaylist" withCompletionBlock:v97];
    v66 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7_141;
    block[3] = &unk_1E57F4310;
    id v67 = v64;
    char v96 = v77;
    id v90 = v67;
    v91 = self;
    v94 = &v154;
    v95 = &v83;
    id v92 = v82;
    v93 = v79;
    dispatch_group_notify(v65, v66, block);

    goto LABEL_64;
  }
  v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain" code:-10004 userInfo:0];
  uint64_t v29 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self completeResponseHandler];
  v30 = (void *)v29;
  if (v29) {
    (*(void (**)(uint64_t, void *, void))(v29 + 16))(v29, v28, 0);
  }
  [(MPAsyncOperation *)self finishWithError:v28];

LABEL_65:
  _Block_object_dispose(&v83, 8);
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2;
  v5[3] = &unk_1E57F4238;
  v5[4] = *(void *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v20 = a2;
  id v6 = [v20 identifiers];
  v7 = [v6 universalStore];

  v8 = [v20 identifiers];
  uint64_t v9 = [v8 personalizedStore];
  uint64_t v10 = [v9 cloudID];

  uint64_t v11 = [v7 adamID];
  if (!v11)
  {
    uint64_t v11 = [v7 subscriptionAdamID];
    if (!v11) {
      uint64_t v11 = [v7 purchasedAdamID];
    }
  }
  if (v10)
  {
    uint64_t v12 = 0;
LABEL_8:
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addCloudItemID:v10 idType:v12];
    goto LABEL_9;
  }
  if (v11)
  {
    uint64_t v12 = 1;
    uint64_t v10 = v11;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v14 = [v20 identifiers];
    v15 = [v14 universalStore];
    v16 = [v15 globalPlaylistID];
    [v13 addPlaylistID:v16];
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPPlaylistUpdateErrorDomain", -1, @"Failed to generate the necessary identifiers for an item attempting to be added to a playlist.");
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *a4 = 1;
  }
LABEL_9:
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_10;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_11(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_12;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_13(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_14;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_15(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_16;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_17(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_18;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_135(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2_136;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_3_137(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4_138;
    v4[3] = &unk_1E57F9F98;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5_139(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6_140;
    block[3] = &unk_1E57F9EA8;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    dispatch_sync(v3, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7_141(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(id *)(a1 + 32);
    if (v2)
    {
LABEL_5:
      id v3 = *(void **)(a1 + 40);
      if (*(unsigned char *)(a1 + 80))
      {
        v4 = [v3 userIdentity];
        id v5 = +[MPCloudController controllerWithUserIdentity:v4];
        uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) persistentID];
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8_142;
        v20[3] = &unk_1E57F42E8;
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void **)(a1 + 48);
        v20[4] = *(void *)(a1 + 40);
        id v10 = v9;
        uint64_t v11 = *(void *)(a1 + 72);
        id v21 = v10;
        uint64_t v23 = v11;
        id v22 = *(id *)(a1 + 56);
        objc_msgSend(v5, "sdk_createPlaylistWithPersistenID:properties:tracklist:completionHandler:", v6, v8, v7, v20);

        uint64_t v12 = v21;
      }
      else
      {
        v13 = [v3 userIdentity];
        v14 = +[MPCloudController controllerWithUserIdentity:v13];
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) persistentID];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9_143;
        v18[3] = &unk_1E57FA148;
        v18[4] = *(void *)(a1 + 40);
        id v19 = *(id *)(a1 + 56);
        objc_msgSend(v14, "sdk_setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v2, v15, v16, v18);

        uint64_t v12 = v19;
      }

      return;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = 0;
    goto LABEL_5;
  }
  id v17 = [*(id *)(a1 + 40) completeResponseHandler];
  if (v17) {
    (*((void (**)(id, void, void))v17 + 2))(v17, 0, *(void *)(a1 + 56));
  }
  [*(id *)(a1 + 40) finish];
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8_142(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v4 = [*(id *)(a1 + 32) completeResponseHandler];
  if (v4)
  {
    if (v5)
    {
      [*(id *)(a1 + 40) removePlaylist:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      ((void (**)(void, id, void))v4)[2](v4, v5, 0);
    }
    else
    {
      v4[2](v4, 0, *(void *)(a1 + 48));
    }
  }
  [*(id *)(a1 + 32) finish];
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9_143(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) completeResponseHandler];
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v5, *(void *)(a1 + 40));
  }
  [*(id *)(a1 + 32) finish];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6_140(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKey:@"isExternalVendorPlaylist"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"dateModified"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"externalVendorDisplayName"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"externalVendorDisplayName"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"iO"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"cloudIsCuratorPlaylist"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"cloudIsVisible"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"cloudIsPublic"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"descriptionInfo"];
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"name"];
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "persistentID"));
}

- (void)execute
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB85E8]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MPModelLibrarySDKPlaylistEditChangeRequestOperation_execute__block_invoke;
  v4[3] = &unk_1E57F4208;
  void v4[4] = self;
  [v3 requestCapabilitiesWithCompletionHandler:v4];
}

void __62__MPModelLibrarySDKPlaylistEditChangeRequestOperation_execute__block_invoke(uint64_t a1, __int16 a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if ((a2 & 0x100) != 0)
  {
    [*(id *)(a1 + 32) _executeWithCloudLibraryEnabledConfirmed];
  }
  else
  {
    if (v5) {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain", -10004, v5, @"Unable to check cloud service capabilities.");
    }
    else {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain", -10005, @"Add to cloud music library capability is missing.");
    }
    [*(id *)(a1 + 32) finishWithError:v6];
  }
}

@end
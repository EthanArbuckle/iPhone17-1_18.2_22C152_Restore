@interface MPModelLibraryFavoriteEntityChangeRequestOperation
- (MPModelLibraryFavoriteEntityChangeRequest)request;
- (id)_storeImportItemFromRequestIdentifiers:(id)a3 modelClass:(Class)a4 changeAction:(int64_t)a5;
- (id)responseHandler;
- (int64_t)_likedStateFromRequestAction:(int64_t)a3;
- (void)_runLibraryMappingRequestWithIdentifiers:(id)a3 class:(Class)a4 completionHandler:(id)a5;
- (void)_runRequestWithIdentifiers:(id)a3 persistentID:(int64_t)a4 favoriteEntityChangeRequestAction:(int64_t)a5 class:(Class)a6;
- (void)_setLikedStateForRequestAction:(int64_t)a3 forEntityWithPersistentID:(int64_t)a4 modelClass:(Class)a5;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryFavoriteEntityChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryFavoriteEntityChangeRequest)request
{
  return self->_request;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (int64_t)_likedStateFromRequestAction:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return qword_19568A070[a3];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryFavoriteEntityChangeRequestOperation.m", 606, @"FavoriteEntityChangeRequestAction (%d) is not a supported state", a3);

  return 0;
}

- (id)_storeImportItemFromRequestIdentifiers:(id)a3 modelClass:(Class)a4 changeAction:(int64_t)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [v8 universalStore];
  uint64_t v10 = [v9 adamID];

  if (!v10)
  {
    v11 = [v8 universalStore];
    uint64_t v10 = [v11 purchasedAdamID];

    if (!v10)
    {
      v12 = [v8 universalStore];
      uint64_t v10 = [v12 subscriptionAdamID];
    }
  }
  v13 = [v8 universalStore];
  v14 = [v13 globalPlaylistID];

  if (v10 || v14)
  {
    v16 = [[MPStoreItemLibraryImportElement alloc] initWithStoreItemID:v10 additionalTrackMetadata:0];
    if (a5 == 2)
    {
      if (_os_feature_enabled_impl()
        && [(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
      {
        v17 = (void *)MEMORY[0x1E4F79AF8];
        v18 = [(MPAsyncOperation *)self userIdentity];
        v19 = [v17 musicLibraryForUserAccount:v18];

        BOOL v20 = (unint64_t)[v19 sagaCloudFavoriteSongAddToLibraryBehavior] < 2;
      }
      else
      {
        BOOL v20 = 1;
      }
      v26 = [MPStoreItemLibraryImport alloc];
      v29[0] = v16;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v23 = v26;
      v24 = v22;
      BOOL v25 = v20;
    }
    else
    {
      v21 = [MPStoreItemLibraryImport alloc];
      v28 = v16;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      v23 = v21;
      v24 = v22;
      BOOL v25 = 0;
    }
    id v15 = [(MPStoreItemLibraryImport *)v23 initUsingLocalDeviceLibraryDestinationWithImportElements:v24 referralObject:0 usingLocalLibraryDestination:v25 usingCloudLibraryDestination:0];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_runLibraryMappingRequestWithIdentifiers:(id)a3 class:(Class)a4 completionHandler:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(MPAsyncOperation *)self userIdentity];
  v11 = +[MPStoreLibraryPersonalizationRequest libraryViewAllowingEmptyCollectionsForUserIdentity:v10];

  v12 = [(MPModelLibraryFavoriteEntityChangeRequest *)self->_request modelObject];
  v13 = objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v12 anyObject];
    v13 = objc_opt_class();
  }
  if ([v13 isSubclassOfClass:objc_opt_class()])
  {
    id v38 = v8;
    id v15 = v12;
    v16 = (void *)MEMORY[0x1E4F79AF8];
    v17 = [(MPAsyncOperation *)self userIdentity];
    v18 = [v16 musicLibraryForUserAccount:v17];

    [(__CFString *)v15 name];
    BOOL v20 = v19 = v11;
    v21 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    v37 = v19;
    [(MPStoreLibraryMappingRequestOperation *)v21 setLibraryView:v19];
    [(MPStoreLibraryMappingRequestOperation *)v21 setModelClass:a4];
    v36 = v18;
    if ([v20 length])
    {
      v22 = [v18 groupingKeyForString:v20];
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v22;
      if (!v22)
      {
        v24 = [MEMORY[0x1E4F1CA98] null];
      }
      BOOL v25 = [v23 dictionaryWithObject:v24 forKey:v38];
      v44 = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      [(MPStoreLibraryMappingRequestOperation *)v21 setAlbumArtistNamesToIdentifierSets:v26];

      if (!v22) {
      v41[0] = MEMORY[0x1E4F143A8];
      }
      v41[1] = 3221225472;
      v41[2] = __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke;
      v41[3] = &unk_1E57EE7F8;
      id v42 = v9;
      [(MPStoreLibraryMappingRequestOperation *)v21 setResponseHandler:v41];
      [(NSOperationQueue *)self->_operationQueue addOperation:v21];

      id v8 = v38;
    }
    else
    {
      v35 = (void *)MEMORY[0x1E4F77950];
      uint64_t v34 = *MEMORY[0x1E4F778C8];
      if (v15) {
        v28 = v15;
      }
      else {
        v28 = @"<nil>";
      }
      v45[0] = @"modelObject";
      v45[1] = @"action";
      v46[0] = v28;
      v29 = NSNumber;
      v30 = [(MPModelLibraryFavoriteEntityChangeRequest *)self->_request requestAction];
      v31 = objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "changeRequestAction"));
      v46[1] = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
      v47[0] = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      [v35 snapshotWithDomain:v34 type:@"Bug" subType:@"Album Artist With No Name" context:@"Request to run favorite change request for artist with no name" triggerThresholdValues:0 events:v33 completion:0];

      id v8 = v38;
      if (!v9) {
        goto LABEL_17;
      }
      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"No album artist name to favorite.");
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);
    }

LABEL_17:
    v11 = v37;
    goto LABEL_18;
  }
  v21 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
  [(MPStoreLibraryMappingRequestOperation *)v21 setLibraryView:v11];
  [(MPStoreLibraryMappingRequestOperation *)v21 setModelClass:a4];
  id v43 = v8;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  [(MPStoreLibraryMappingRequestOperation *)v21 setIdentifierSets:v27];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke_2;
  v39[3] = &unk_1E57EE7F8;
  v40 = (__CFString *)v9;
  [(MPStoreLibraryMappingRequestOperation *)v21 setResponseHandler:v39];
  [(NSOperationQueue *)self->_operationQueue addOperation:v21];
  id v15 = v40;
LABEL_18:
}

uint64_t __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setLikedStateForRequestAction:(int64_t)a3 forEntityWithPersistentID:(int64_t)a4 modelClass:(Class)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__4995;
  v101 = __Block_byref_object_dispose__4996;
  id v102 = 0;
  id v9 = [(MPAsyncOperation *)self userIdentity];
  uint64_t v10 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v9];

  v11 = [(MPModelLibraryFavoriteEntityChangeRequest *)self->_request modelObject];
  v85 = [v11 identifiers];

  int64_t v12 = [(MPModelLibraryFavoriteEntityChangeRequestOperation *)self _likedStateFromRequestAction:a3];
  v13 = [v10 favoriteSongsPlaylist];
  v14 = [v13 valueForProperty:@"keepLocal"];
  char v15 = [v14 BOOLValue];

  if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    id v16 = [v10 itemWithPersistentID:a4 verifyExistence:0];
    if (v16)
    {
      v17 = @"_itemLikedState";
      v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"likedState", @"keepLocal", 0);
      uint64_t v19 = [v16 valuesForProperties:v18];
      BOOL v20 = (void *)v98[5];
      v98[5] = v19;

      v21 = [(id)v98[5] objectForKey:@"likedState"];
      int v22 = [v21 intValue];

      v23 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v24 = v23;
      if (v12 == v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            BOOL v25 = @"Unknown";
          }
          else {
            BOOL v25 = off_1E57F2208[v12 - 1];
          }
          v59 = v25;
          *(_DWORD *)buf = 134218242;
          int64_t v104 = a4;
          __int16 v105 = 2114;
          int64_t v106 = (int64_t)v59;
          _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_ERROR, "track persistentID=%lld is already %{public}@", buf, 0x16u);
        }
        v60 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"track is already in correct favorited state");
        responseHandler = (void (**)(id, void *))self->_responseHandler;
        if (responseHandler) {
          responseHandler[2](responseHandler, v60);
        }
        [(MPAsyncOperation *)self finishWithError:v60];
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v45 = @"Unknown";
          }
          else {
            v45 = off_1E57F2208[v12 - 1];
          }
          v62 = v45;
          *(_DWORD *)buf = 138543618;
          int64_t v104 = (int64_t)v62;
          __int16 v105 = 2048;
          int64_t v106 = a4;
          _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for track with persistentID=%lld", buf, 0x16u);
        }
        id v63 = v16;
        v64 = [NSNumber numberWithInteger:v12];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke;
        v89[3] = &unk_1E57EE7D0;
        v93 = &v97;
        int64_t v94 = v12;
        char v96 = v15;
        int64_t v95 = a4;
        id v16 = v63;
        id v90 = v16;
        id v91 = v10;
        v92 = self;
        [v16 setValue:v64 forProperty:@"_itemLikedState" withCompletionBlock:v89];
      }
      v65 = @"_itemLikedState";
      goto LABEL_94;
    }
    id v42 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v104 = a4;
      _os_log_impl(&dword_1952E8000, v42, OS_LOG_TYPE_ERROR, "Could not locate item with persistentID=%lld", buf, 0xCu);
    }

    id v43 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 4, @"could not find song in media library");
    v44 = (void (**)(id, void *))self->_responseHandler;
    if (v44) {
      v44[2](v44, v43);
    }
LABEL_63:
    [(MPAsyncOperation *)self finishWithError:v43];

    id v16 = 0;
    v65 = 0;
    v18 = 0;
LABEL_94:

    goto LABEL_95;
  }
  if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    id v16 = [v10 playlistWithPersistentID:a4];
    if (v16)
    {
      v26 = @"_playlistLikedState";
      v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"likedState", 0);
      uint64_t v27 = [v16 valuesForProperties:v18];
      v28 = (void *)v98[5];
      v98[5] = v27;

      v29 = [(id)v98[5] objectForKey:@"likedState"];
      int v30 = [v29 intValue];

      v31 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v32 = v31;
      if (v12 == v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v33 = @"Unknown";
          }
          else {
            v33 = off_1E57F2208[v12 - 1];
          }
          v69 = v33;
          *(_DWORD *)buf = 134218242;
          int64_t v104 = a4;
          __int16 v105 = 2114;
          int64_t v106 = (int64_t)v69;
          _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_ERROR, "playlist persistentID=%lld is already %{public}@", buf, 0x16u);
        }
        v70 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"playlist is already in correct favorited state");
        v71 = (void (**)(id, void *))self->_responseHandler;
        if (v71) {
          v71[2](v71, v70);
        }
        [(MPAsyncOperation *)self finishWithError:v70];
      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v56 = @"Unknown";
          }
          else {
            v56 = off_1E57F2208[v12 - 1];
          }
          v72 = v56;
          *(_DWORD *)buf = 138543618;
          int64_t v104 = (int64_t)v72;
          __int16 v105 = 2048;
          int64_t v106 = a4;
          _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for playlist with persistentID=%lld", buf, 0x16u);
        }
        v73 = [NSNumber numberWithInteger:v12];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_88;
        v88[3] = &unk_1E57FA170;
        v88[4] = self;
        [v16 setValue:v73 forProperty:@"_playlistLikedState" withCompletionBlock:v88];
      }
      v65 = @"_playlistLikedState";
      goto LABEL_94;
    }
    v54 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v104 = a4;
      _os_log_impl(&dword_1952E8000, v54, OS_LOG_TYPE_ERROR, "Could not locate playlist with persistentID=%lld", buf, 0xCu);
    }

    id v43 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 4, @"could not find playlist in media library");
    v55 = (void (**)(id, void *))self->_responseHandler;
    if (v55) {
      v55[2](v55, v43);
    }
    goto LABEL_63;
  }
  if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    id v16 = [v10 collectionWithPersistentID:a4 groupingType:3];
    if (v16)
    {
      uint64_t v34 = @"_albumArtistLikedState";
      v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"albumArtistFavoriteState", 0);
      uint64_t v35 = [v16 valuesForProperties:v18];
      v36 = (void *)v98[5];
      v98[5] = v35;

      v37 = [(id)v98[5] objectForKey:@"albumArtistFavoriteState"];
      int v38 = [v37 intValue];

      v39 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v40 = v39;
      if (v12 == v38)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v41 = @"Unknown";
          }
          else {
            v41 = off_1E57F2208[v12 - 1];
          }
          v75 = v41;
          *(_DWORD *)buf = 134218242;
          int64_t v104 = a4;
          __int16 v105 = 2114;
          int64_t v106 = (int64_t)v75;
          _os_log_impl(&dword_1952E8000, v40, OS_LOG_TYPE_ERROR, "album artist persistentID=%lld is already %{public}@", buf, 0x16u);
        }
        v76 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"artist is already in correct favorited state");
        v77 = (void (**)(id, void *))self->_responseHandler;
        if (v77) {
          v77[2](v77, v76);
        }
        [(MPAsyncOperation *)self finishWithError:v76];
      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v66 = @"Unknown";
          }
          else {
            v66 = off_1E57F2208[v12 - 1];
          }
          v78 = v66;
          *(_DWORD *)buf = 138543618;
          int64_t v104 = (int64_t)v78;
          __int16 v105 = 2048;
          int64_t v106 = a4;
          _os_log_impl(&dword_1952E8000, v40, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for album artist with persistentID=%lld", buf, 0x16u);
        }
        v79 = [NSNumber numberWithInteger:v12];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_95;
        v87[3] = &unk_1E57FA170;
        v87[4] = self;
        [v16 setValue:v79 forProperty:@"_albumArtistLikedState" withCompletionBlock:v87];
      }
      v65 = @"_albumArtistLikedState";
      goto LABEL_94;
    }
    v57 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v104 = a4;
      __int16 v105 = 2114;
      int64_t v106 = (int64_t)v85;
      _os_log_impl(&dword_1952E8000, v57, OS_LOG_TYPE_ERROR, "Could not locate album artist with persistentID=%lld, identifiers=%{public}@", buf, 0x16u);
    }

    id v43 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 4, @"could not find album artist in media library");
    v58 = (void (**)(id, void *))self->_responseHandler;
    if (v58) {
      v58[2](v58, v43);
    }
    goto LABEL_63;
  }
  if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    id v16 = [v10 collectionWithPersistentID:a4 groupingType:1];
    if (v16)
    {
      v46 = @"_albumLikedState";
      v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"albumLikedState", 0);
      uint64_t v47 = [v16 valuesForProperties:v18];
      v48 = (void *)v98[5];
      v98[5] = v47;

      v49 = [(id)v98[5] objectForKey:@"albumLikedState"];
      int v50 = [v49 intValue];

      v51 = _MPLogCategoryFavoriting();
      v52 = v51;
      if (v12 == v50)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v53 = @"Unknown";
          }
          else {
            v53 = off_1E57F2208[v12 - 1];
          }
          v80 = v53;
          *(_DWORD *)buf = 134218242;
          int64_t v104 = a4;
          __int16 v105 = 2114;
          int64_t v106 = (int64_t)v80;
          _os_log_impl(&dword_1952E8000, v52, OS_LOG_TYPE_ERROR, "album persistentID=%lld is already %{public}@", buf, 0x16u);
        }
        v81 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"album is already in correct favorited state");
        v82 = (void (**)(id, void *))self->_responseHandler;
        if (v82) {
          v82[2](v82, v81);
        }
        [(MPAsyncOperation *)self finishWithError:v81];
      }
      else
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2) {
            v74 = @"Unknown";
          }
          else {
            v74 = off_1E57F2208[v12 - 1];
          }
          v83 = v74;
          *(_DWORD *)buf = 138543618;
          int64_t v104 = (int64_t)v83;
          __int16 v105 = 2048;
          int64_t v106 = a4;
          _os_log_impl(&dword_1952E8000, v52, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for album with persistentID=%lld", buf, 0x16u);
        }
        v84 = [NSNumber numberWithInteger:v12];
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_102;
        v86[3] = &unk_1E57FA170;
        v86[4] = self;
        [v16 setValue:v84 forProperty:@"_albumLikedState" withCompletionBlock:v86];
      }
      v65 = @"_albumLikedState";
      goto LABEL_94;
    }
    v67 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v104 = a4;
      _os_log_impl(&dword_1952E8000, v67, OS_LOG_TYPE_ERROR, "Could not locate album with persistentID=%lld", buf, 0xCu);
    }

    id v43 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 4, @"could not find album in media library");
    v68 = (void (**)(id, void *))self->_responseHandler;
    if (v68) {
      v68[2](v68, v43);
    }
    goto LABEL_63;
  }
  v18 = 0;
LABEL_95:

  _Block_object_dispose(&v97, 8);
}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKey:@"keepLocal"];
  uint64_t v6 = [v5 integerValue];

  if (!v4 && *(void *)(a1 + 64) == 2 && *(unsigned char *)(a1 + 80) && v6 == -1)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 72);
      int v12 = 134217984;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Clearing keep-local on favorited track. persistentID=%lld", (uint8_t *)&v12, 0xCu);
    }

    if ([*(id *)(a1 + 32) setValue:&unk_1EE6ECE18 forProperty:@"keepLocal"])
    {
      id v9 = [*(id *)(a1 + 40) ml3Library];
      [v9 notifyEntitiesAddedOrRemoved];
    }
  }
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = v10[36];
  if (v11)
  {
    (*(void (**)(void, id))(v11 + 16))(v10[36], v4);
    uint64_t v10 = *(void **)(a1 + 48);
  }
  [v10 finishWithError:v4];
}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[36];
  id v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    id v4 = v7;
    v5 = *(void **)(a1 + 32);
  }
  [v5 finishWithError:v4];
}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_95(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[36];
  id v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    id v4 = v7;
    v5 = *(void **)(a1 + 32);
  }
  [v5 finishWithError:v4];
}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[36];
  id v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    id v4 = v7;
    v5 = *(void **)(a1 + 32);
  }
  [v5 finishWithError:v4];
}

- (void)_runRequestWithIdentifiers:(id)a3 persistentID:(int64_t)a4 favoriteEntityChangeRequestAction:(int64_t)a5 class:(Class)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = MPNSStringForFavoriteEntityChangeRequestAction(a5);
    *(_DWORD *)buf = 138543874;
    BOOL v20 = v12;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    __int16 v23 = 2114;
    Class v24 = a6;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "Running request %{public}@ for entity with persistentID=%lld, modelClass=%{public}@", buf, 0x20u);
  }
  if (a4)
  {
    [(MPModelLibraryFavoriteEntityChangeRequestOperation *)self _setLikedStateForRequestAction:a5 forEntityWithPersistentID:a4 modelClass:a6];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke;
    v13[3] = &unk_1E57EE7A8;
    id v14 = v10;
    char v15 = self;
    int64_t v16 = a5;
    Class v17 = a6;
    uint64_t v18 = 0;
    [(MPModelLibraryFavoriteEntityChangeRequestOperation *)self _runLibraryMappingRequestWithIdentifiers:v14 class:a6 completionHandler:v13];
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    int v12 = [v5 libraryIdentifierSetForIdentifierSet:*(void *)(a1 + 32)];
    uint64_t v13 = [v12 library];
    uint64_t v14 = [v13 persistentID];

    char v15 = *(unsigned char **)(a1 + 40);
    if (v14)
    {
      [v15 _setLikedStateForRequestAction:*(void *)(a1 + 48) forEntityWithPersistentID:v14 modelClass:*(void *)(a1 + 56)];
    }
    else
    {
      if (v15[280])
      {
        v15[280] = 0;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v74 = 0;
        int64_t v16 = [*(id *)(a1 + 40) userIdentity];
        Class v17 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v16];

        uint64_t v18 = [*(id *)(a1 + 40) _storeImportItemFromRequestIdentifiers:*(void *)(a1 + 32) modelClass:*(void *)(a1 + 56) changeAction:*(void *)(a1 + 48)];
        if (v18)
        {
          if ([*(id *)(a1 + 56) isSubclassOfClass:objc_opt_class()])
          {
            uint64_t v19 = [*(id *)(a1 + 32) universalStore];
            BOOL v20 = [v19 globalPlaylistID];

            if ([v18 addToDeviceLibraryOnly])
            {
              __int16 v21 = v67;
              v67[0] = MEMORY[0x1E4F143A8];
              v67[1] = 3221225472;
              v67[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_46;
              v67[3] = &unk_1E57EE708;
              id v22 = v20;
              v67[4] = v22;
              v69 = buf;
              int8x16_t v42 = *(int8x16_t *)(a1 + 32);
              id v23 = (id)v42.i64[0];
              int8x16_t v68 = vextq_s8(v42, v42, 8uLL);
              uint64_t v24 = *(void *)(a1 + 56);
              uint64_t v70 = *(void *)(a1 + 48);
              uint64_t v71 = v24;
              [v17 addToLocalDeviceLibraryGlobalPlaylistWithID:v22 completion:v67];
            }
            else
            {
              v72 = v20;
              v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
              __int16 v21 = v62;
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_51;
              v62[3] = &unk_1E57EE708;
              v62[4] = v20;
              v64 = buf;
              int8x16_t v45 = *(int8x16_t *)(a1 + 32);
              id v38 = (id)v45.i64[0];
              int8x16_t v63 = vextq_s8(v45, v45, 8uLL);
              uint64_t v39 = *(void *)(a1 + 56);
              uint64_t v65 = *(void *)(a1 + 48);
              uint64_t v66 = v39;
              [v17 addNonLibraryOwnedPlaylistsWithGlobalIDs:v37 completion:v62];
            }
          }
          else if ([*(id *)(a1 + 56) isSubclassOfClass:objc_opt_class()])
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_52;
            v57[3] = &unk_1E57EE730;
            v59 = buf;
            int8x16_t v43 = *(int8x16_t *)(a1 + 32);
            id v33 = (id)v43.i64[0];
            int8x16_t v58 = vextq_s8(v43, v43, 8uLL);
            uint64_t v34 = *(void *)(a1 + 56);
            uint64_t v60 = *(void *)(a1 + 48);
            uint64_t v61 = v34;
            [v17 performStoreAlbumArtistLibraryImport:v18 withCompletion:v57];
          }
          else if ([*(id *)(a1 + 56) isSubclassOfClass:objc_opt_class()])
          {
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_58;
            v52[3] = &unk_1E57EE730;
            v54 = buf;
            int8x16_t v44 = *(int8x16_t *)(a1 + 32);
            id v35 = (id)v44.i64[0];
            int8x16_t v53 = vextq_s8(v44, v44, 8uLL);
            uint64_t v36 = *(void *)(a1 + 56);
            uint64_t v55 = *(void *)(a1 + 48);
            uint64_t v56 = v36;
            [v17 performStoreItemLibraryImport:v18 withCompletion:v52];
          }
          else
          {
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_62;
            void v47[3] = &unk_1E57EE780;
            uint64_t v49 = *(void *)(a1 + 48);
            int8x16_t v46 = *(int8x16_t *)(a1 + 32);
            id v40 = (id)v46.i64[0];
            int8x16_t v48 = vextq_s8(v46, v46, 8uLL);
            uint64_t v41 = *(void *)(a1 + 56);
            uint64_t v50 = *(void *)(a1 + 64);
            uint64_t v51 = v41;
            [v17 performStoreItemLibraryImport:v18 withCompletion:v47];
          }
          id v7 = 0;
        }
        else
        {
          id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 2, @"no store identifiers to run request");
          v31 = *(void **)(a1 + 40);
          uint64_t v32 = v31[36];
          if (v32)
          {
            (*(void (**)(void, void *))(v32 + 16))(v31[36], v7);
            v31 = *(void **)(a1 + 40);
          }
          [v31 finishWithError:v7];
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_32;
      }
      uint64_t v25 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_impl(&dword_1952E8000, v25, OS_LOG_TYPE_ERROR, "Could not locate entity identifiers=%{public}@, class=%{public}@", buf, 0x16u);
      }

      v28 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 4, @"could not find entity in media library");
      v29 = *(void **)(a1 + 40);
      uint64_t v30 = v29[36];
      if (v30)
      {
        (*(void (**)(void, void *))(v30 + 16))(v29[36], v28);
        v29 = *(void **)(a1 + 40);
      }
      [v29 finishWithError:v28];
    }
    id v7 = 0;
LABEL_32:

    goto LABEL_33;
  }
  id v7 = v6;
  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "Library mapping for identifiers=%{public}@ failed with error=%{public}@", buf, 0x16u);
  }

  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = v10[36];
  if (v11)
  {
    (*(void (**)(void, void *))(v11 + 16))(v10[36], v7);
    id v10 = *(void **)(a1 + 40);
  }
  [v10 finishWithError:v7];
LABEL_33:
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 64));
      uint64_t v9 = *(void *)(a1 + 32);
      int v20 = 138543874;
      __int16 v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);
    }
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v6);
      id v10 = *(void **)(a1 + 40);
    }
    [v10 finishWithError:v6];
  }
  else
  {
    int v12 = [v5 objectForKey:*(void *)(a1 + 32)];
    uint64_t v13 = v12;
    if (v12)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 longLongValue];
      [*(id *)(a1 + 40) _runRequestWithIdentifiers:*(void *)(a1 + 48) persistentID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) favoriteEntityChangeRequestAction:*(void *)(a1 + 64) class:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 64));
        uint64_t v16 = *(void *)(a1 + 32);
        int v20 = 138543874;
        __int16 v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v16;
        __int16 v24 = 2114;
        id v25 = v5;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);
      }
      Class v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"could not import playlist");
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = v18[36];
      if (v19)
      {
        (*(void (**)(void, void *))(v19 + 16))(v18[36], v17);
        uint64_t v18 = *(void **)(a1 + 40);
      }
      [v18 finishWithError:v17];
    }
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 64));
      uint64_t v9 = *(void *)(a1 + 32);
      int v20 = 138543874;
      __int16 v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);
    }
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v6);
      id v10 = *(void **)(a1 + 40);
    }
    [v10 finishWithError:v6];
  }
  else
  {
    int v12 = [v5 objectForKey:*(void *)(a1 + 32)];
    uint64_t v13 = v12;
    if (v12)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 longLongValue];
      [*(id *)(a1 + 40) _runRequestWithIdentifiers:*(void *)(a1 + 48) persistentID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) favoriteEntityChangeRequestAction:*(void *)(a1 + 64) class:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 64));
        uint64_t v16 = *(void *)(a1 + 32);
        int v20 = 138543874;
        __int16 v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v16;
        __int16 v24 = 2114;
        id v25 = v5;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);
      }
      Class v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"could not import playlist");
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = v18[36];
      if (v19)
      {
        (*(void (**)(void, void *))(v19 + 16))(v18[36], v17);
        uint64_t v18 = *(void **)(a1 + 40);
      }
      [v18 finishWithError:v17];
    }
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 40);
      int v21 = 138543874;
      __int16 v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for artist with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v21, 0x20u);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v6);
      id v10 = *(void **)(a1 + 32);
    }
    [v10 finishWithError:v6];
  }
  else
  {
    if ([v5 count])
    {
      int v12 = [v5 objectAtIndexedSubscript:0];
      uint64_t v13 = a1 + 48;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 longLongValue];
    }
    else
    {
      uint64_t v13 = a1 + 48;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    uint64_t v14 = *(void *)(*(void *)(*(void *)v13 + 8) + 24);
    if (v14)
    {
      [*(id *)(a1 + 32) _runRequestWithIdentifiers:*(void *)(a1 + 40) persistentID:v14 favoriteEntityChangeRequestAction:*(void *)(a1 + 56) class:*(void *)(a1 + 64)];
    }
    else
    {
      char v15 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 56));
        uint64_t v17 = *(void *)(a1 + 40);
        int v21 = 138543874;
        __int16 v22 = v16;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        __int16 v25 = 2114;
        id v26 = v5;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for identifiers=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v21, 0x20u);
      }
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"could not import album artist");
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = v19[36];
      if (v20)
      {
        (*(void (**)(void, void *))(v20 + 16))(v19[36], v18);
        uint64_t v19 = *(void **)(a1 + 32);
      }
      [v19 finishWithError:v18];
    }
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 40);
      int v20 = 138543874;
      int v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for entity with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v6);
      id v10 = *(void **)(a1 + 32);
    }
    [v10 finishWithError:v6];
  }
  else
  {
    if ([v5 count])
    {
      int v12 = [v5 objectAtIndexedSubscript:0];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 persistentID];
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v13)
    {
      [*(id *)(a1 + 32) _runRequestWithIdentifiers:*(void *)(a1 + 40) persistentID:v13 favoriteEntityChangeRequestAction:*(void *)(a1 + 56) class:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 56));
        uint64_t v16 = *(void *)(a1 + 40);
        int v20 = 138543874;
        int v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v16;
        __int16 v24 = 2114;
        id v25 = v5;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for identifiers=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);
      }
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"could not import song");
      uint64_t v18 = *(void **)(a1 + 32);
      uint64_t v19 = v18[36];
      if (v19)
      {
        (*(void (**)(void, void *))(v19 + 16))(v18[36], v17);
        uint64_t v18 = *(void **)(a1 + 32);
      }
      [v18 finishWithError:v17];
    }
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 48));
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      id v31 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for entity with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", buf, 0x20u);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v6);
      id v10 = *(void **)(a1 + 32);
    }
    [v10 finishWithError:v6];
  }
  else if (*(void *)(a1 + 48) == 2)
  {
    [*(id *)(a1 + 32) _runRequestWithIdentifiers:*(void *)(a1 + 40) persistentID:*(void *)(a1 + 56) favoriteEntityChangeRequestAction:2 class:*(void *)(a1 + 64)];
  }
  else if ([v5 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v31 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_2;
    v25[3] = &unk_1E57EE758;
    v25[4] = buf;
    [v5 enumerateObjectsUsingBlock:v25];
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 24);
    if (v12)
    {
      [*(id *)(a1 + 32) _runRequestWithIdentifiers:*(void *)(a1 + 40) persistentID:v12 favoriteEntityChangeRequestAction:*(void *)(a1 + 48) class:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 48));
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v26 = 138543618;
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "Not running %{public}@ request for entity with identifiers=%{public}@ as albumPersistentID is invalid", v26, 0x16u);
      }
      __int16 v22 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"albumPID of track is invalid");
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = v23[36];
      if (v24)
      {
        (*(void (**)(void, void *))(v24 + 16))(v23[36], v22);
        uint64_t v23 = *(void **)(a1 + 32);
      }
      [v23 finishWithError:v22];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = MPNSStringForFavoriteEntityChangeRequestAction(*(void *)(a1 + 48));
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "Not running %{public}@ request for entity with identifiers=%{public}@ as no tracks were imported", buf, 0x16u);
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", 5, @"album import did not add any tracks");
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = v17[36];
    if (v18)
    {
      (*(void (**)(void, void *))(v18 + 16))(v17[36], v16);
      uint64_t v17 = *(void **)(a1 + 32);
    }
    [v17 finishWithError:v16];
  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 valueForProperty:@"albumPID"];
  if (_NSIsNSNumber() && [v6 longLongValue])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 longLongValue];
    *a4 = 1;
  }
}

- (void)execute
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(MPModelLibraryFavoriteEntityChangeRequest *)self->_request modelObject];
  uint64_t v4 = [(MPModelLibraryFavoriteEntityChangeRequest *)self->_request requestAction];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v25 = 138543618;
      *(void *)&v25[4] = v3;
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v5;
      uint64_t v8 = "Not running favorite state change operation for entity=%{public}@ action=%{public}@ as the request is invalid";
LABEL_20:
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, v8, v25, 0x16u);
    }
LABEL_21:

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    int v20 = @"missing parameters to run request";
    uint64_t v21 = 2;
    goto LABEL_22;
  }
  char v9 = _os_feature_enabled_impl();
  if ((v9 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v25 = 138543618;
      *(void *)&v25[4] = v3;
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v5;
      uint64_t v8 = "Not running favorite state change operation for entity=%{public}@ action=%{public}@ Favoriting FF is disabled";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v10 = objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v3 anyObject];
    id v10 = objc_opt_class();
  }
  if (([v10 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([v10 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([v10 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([v10 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    [v10 isSubclassOfClass:objc_opt_class()];
    if (!self->_operationQueue)
    {
      uint64_t v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v12;

      [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
      [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryFavoriteEntityChangeRequestOperation.operationQueue"];
      uint64_t v14 = self->_operationQueue;
      uint64_t v15 = [MEMORY[0x1E4F29060] currentThread];
      -[NSOperationQueue setQualityOfService:](v14, "setQualityOfService:", [v15 qualityOfService]);
    }
    self->_canRerunRequest = 1;
    uint64_t v16 = [v3 identifiers];
    uint64_t v17 = [v16 library];
    uint64_t v18 = [v17 persistentID];

    -[MPModelLibraryFavoriteEntityChangeRequestOperation _runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:](self, "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", v16, v18, [v5 changeRequestAction], v10);
    goto LABEL_25;
  }
  uint64_t v24 = _MPLogCategoryFavoriting();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v25 = 138543618;
    *(void *)&v25[4] = v3;
    *(_WORD *)&v25[12] = 2114;
    *(void *)&v25[14] = v5;
    _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_DEFAULT, "Not running favorite state change operation for entity=%{public}@ action=%{public}@ as the request object is not supported", v25, 0x16u);
  }

  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  int v20 = @"unsupported entity type";
  uint64_t v21 = 3;
LABEL_22:
  __int16 v22 = objc_msgSend(v19, "msv_errorWithDomain:code:debugDescription:", @"MPModelLibraryFavoriteEntityChangeRequestErrorDomain", v21, v20, *(_OWORD *)v25, *(void *)&v25[16]);
  responseHandler = (void (**)(id, void *))self->_responseHandler;
  if (responseHandler) {
    responseHandler[2](responseHandler, v22);
  }
  [(MPAsyncOperation *)self finishWithError:v22];

LABEL_25:
}

@end
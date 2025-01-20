@interface MPServerObjectDatabaseStorePlatformImportRequest
+ (id)_childKeyForParentType:(id)a3 type:(id)a4;
+ (id)_entityTypeForObject:(id)a3;
+ (id)_unsupportedParentChildRelationships;
+ (id)_unsupportedStorePlatformKinds;
- (MPServerObjectDatabaseStorePlatformImportRequest)initWithPayload:(id)a3;
- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4;
@end

@implementation MPServerObjectDatabaseStorePlatformImportRequest

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(MPStorePlatformEntityTranslatorContext);
  v8 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  v9 = [(MPServerObjectDatabaseImportRequest *)self userIdentity];
  v10 = [v8 DSIDForUserIdentity:v9 outError:0];
  v11 = [v10 stringValue];
  [(MPStorePlatformEntityTranslatorContext *)v7 setPersonID:v11];

  v12 = [(MPStorePlatformEntityTranslatorContext *)v7 personID];
  uint64_t v13 = [v12 length];

  if (!v13) {
    [(MPStorePlatformEntityTranslatorContext *)v7 setPersonID:*MEMORY[0x1E4FB8580]];
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__9658;
  v37 = __Block_byref_object_dispose__9659;
  id v38 = 0;
  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [(MPServerObjectDatabaseImportRequest *)self payload];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke;
  v28[3] = &unk_1E57EF198;
  v28[4] = self;
  v16 = v7;
  v29 = v16;
  v32 = &v33;
  id v17 = v6;
  id v30 = v17;
  id v18 = v14;
  id v31 = v18;
  _MPServerObjectDatabaseMetadataImportEnumerateObjects(v15, a4, @"kind", 0, 0, 0, 0, v28);

  v19 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [v18 count];
    uint64_t v21 = v34[5];
    *(_DWORD *)buf = 67109378;
    int v40 = v20;
    __int16 v41 = 2114;
    uint64_t v42 = v21;
    _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: importing [Platform payload] childRelationsCount=%d collectionVersionHash=%{public}@", buf, 0x12u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_411;
  v25[3] = &unk_1E57EF170;
  id v22 = v17;
  id v26 = v22;
  v27 = &v33;
  [v18 enumerateObjectsUsingBlock:v25];
  v23 = [[MPServerObjectDatabaseImportResult alloc] initWithAnnotatedPayload:a4 playableAssetIdentifiers:0 error:0];

  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  uint64_t v13 = +[MPStorePlatformEntityTranslator translatorForKind:v11];
  v14 = v13;
  if (v13)
  {
    id v15 = [v13 identifiersForPayload:v12 context:*(void *)(a1 + 40)];
    *a8 = v15;
    id v56 = v15;
    if (v15)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        uint64_t v16 = [v12 objectForKeyedSubscript:@"versionHash"];
        uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        v19 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          id v66 = v20;
          __int16 v67 = 2114;
          id v68 = v11;
          _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: SP payload contains collectionPlaylistVersionHash=%{public}@ for type=%{public}@", buf, 0x16u);
        }
      }
      v52 = v14;
      v55 = v12;
      uint64_t v21 = [v12 objectForKeyedSubscript:@"childrenIds"];
      if ([v21 count])
      {
        unint64_t v22 = 0;
        do
        {
          v23 = [v21 objectAtIndexedSubscript:v22];
          v24 = [(id)objc_opt_class() _childKeyForParentType:v11 type:@"song"];
          if (v24)
          {
            v25 = [MPIdentifierSet alloc];
            id v26 = +[MPModelSongKind identityKind];
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_390;
            v62[3] = &unk_1E57F95D0;
            id v63 = v23;
            id v64 = *(id *)(a1 + 40);
            v27 = [(MPIdentifierSet *)v25 initWithSource:@"ServerObjectDatabase-ImportRequest" modelKind:v26 block:v62];

            uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            if (v28)
            {
              if (!v22)
              {
                [*(id *)(a1 + 48) removeRelationshipsForParentIdentifiers:v56 childKey:v24];
                uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              }
              [*(id *)(a1 + 48) relateIdentifiers:v27 toParentIdentifiers:v56 parentVersionHash:v28 childKey:v24 order:v22];
            }
            else
            {
              v29 = [[MPServerObjectDatabaseMediaAPIImportChildRelation alloc] initWithItemIdentifiers:v27 parentIdentifiers:v56 childKey:v24 relativeOrder:v22];
              [*(id *)(a1 + 56) addObject:v29];
            }
          }

          ++v22;
        }
        while (v22 < [v21 count]);
      }
      id v30 = v12;
      id v31 = [v12 objectForKeyedSubscript:@"children"];
      if (_NSIsNSDictionary())
      {
        v51 = v31;
        v32 = (void *)[v31 mutableCopy];
        uint64_t v33 = [v32 allKeys];
        if ([v33 count])
        {
          unint64_t v34 = 0;
          char v54 = 0;
          v53 = v21;
          do
          {
            uint64_t v35 = [v33 objectAtIndexedSubscript:v34];
            v36 = [v32 objectForKeyedSubscript:v35];
            if (_NSIsNSDictionary())
            {
              v37 = (void *)[v36 mutableCopy];
              id v38 = [v37 objectForKeyedSubscript:@"artwork"];

              if (!v38)
              {
                v39 = [v55 objectForKeyedSubscript:@"artwork"];
                uint64_t v21 = v53;
                [v37 setObject:v39 forKeyedSubscript:@"artwork"];

                [v32 setObject:v37 forKeyedSubscript:v35];
                char v54 = 1;
              }
            }
            ++v34;
          }
          while (v34 < [v33 count]);
          if (v54)
          {
            int v40 = (void *)[v55 mutableCopy];
            [v40 setObject:v32 forKeyedSubscript:@"children"];

            v55 = v40;
          }
        }

        id v30 = v55;
        id v31 = v51;
      }
      __int16 v41 = [v30 valueForKey:@"extendedAssetUrls"];
      uint64_t v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        id v43 = [v30 valueForKeyPath:@"assetUrls"];
      }
      v46 = v43;

      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_4;
      v57[3] = &unk_1E57EF0F8;
      id v58 = *(id *)(a1 + 48);
      id v44 = v56;
      uint64_t v47 = *(void *)(a1 + 32);
      id v59 = v44;
      uint64_t v60 = v47;
      id v12 = v30;
      id v61 = v12;
      [v46 enumerateKeysAndObjectsUsingBlock:v57];
      v48 = *(void **)(a1 + 48);
      v49 = [*(id *)(a1 + 32) expirationDate];
      uint64_t v45 = [v48 importObject:v12 type:v11 identifiers:v44 source:2 expiration:v49];

      v14 = v52;
LABEL_38:

      goto LABEL_39;
    }
    id v44 = 0;
  }
  else
  {
    id v44 = [(id)objc_opt_class() _unsupportedStorePlatformKinds];
    if (([v44 containsObject:v11] & 1) == 0)
    {
      [v44 addObject:v11];
      uint64_t v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v11;
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_FAULT, "Encountered unsupported StorePlatform kind: %@", buf, 0xCu);
      }
      uint64_t v45 = 0;
      goto LABEL_38;
    }
  }
  uint64_t v45 = 0;
LABEL_39:

  return v45;
}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_411(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (![v11 relativeOrder])
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v11 parentIdentifiers];
    v5 = [v11 childKey];
    [v3 removeRelationshipsForParentIdentifiers:v4 childKey:v5];
  }
  id v6 = *(void **)(a1 + 32);
  v7 = [v11 identifiers];
  v8 = [v11 parentIdentifiers];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    v9 = &stru_1EE680640;
  }
  v10 = [v11 childKey];
  objc_msgSend(v6, "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v7, v8, v9, v10, objc_msgSend(v11, "relativeOrder"));
}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_390(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_2;
  v6[3] = &unk_1E57FA390;
  id v7 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 setUniversalStoreIdentifiersWithBlock:v6];
  v5 = [*(id *)(a1 + 40) personID];
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:&__block_literal_global_394];
}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    id v7 = v5;
    if ([&unk_1EE6ED6B8 containsObject:v7])
    {
      uint64_t v8 = 1;
    }
    else if ([&unk_1EE6ED6D0 containsObject:v7])
    {
      uint64_t v8 = 2;
    }
    else if ([&unk_1EE6ED6E8 containsObject:v7])
    {
      uint64_t v8 = 3;
    }
    else if ([&unk_1EE6ED700 containsObject:v7])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    v14 = (void *)v13;
    if (v8 && v13)
    {
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = [*(id *)(a1 + 48) assetURLExpirationDate];
      [v15 importAssetURL:v14 forIdentifiers:v16 flavor:v8 expirationDate:v17];
    }
    else
    {
      if (![v7 isEqualToString:@"enhancedHls"] || !v14) {
        goto LABEL_25;
      }
      uint64_t v17 = [*(id *)(a1 + 56) valueForKey:@"redeliveryTargetId"];
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = [v17 longLongValue];
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = *MEMORY[0x1E4FB84A0];
      int v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      unint64_t v22 = [*(id *)(a1 + 48) assetURLExpirationDate];
      [v20 importHLSAssetURL:v14 keyCertificateURL:0 keyServerURL:0 redeliveryId:v18 protocolType:v19 isiTunesStoreStream:1 forIdentifiers:v21 expirationDate:v22];
    }
LABEL_25:

    goto LABEL_26;
  }
  v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = objc_opt_class();
    id v11 = v10;
    *(_DWORD *)buf = 138544130;
    v24 = v10;
    __int16 v25 = 2114;
    id v26 = (id)objc_opt_class();
    __int16 v27 = 2114;
    id v28 = v5;
    __int16 v29 = 2114;
    id v30 = v6;
    id v12 = v26;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assetURLs [StorePlatform]: flavorStringType=%{public}@ urlStringType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x2Au);
  }
LABEL_26:
}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "longLongValue"));
}

- (MPServerObjectDatabaseStorePlatformImportRequest)initWithPayload:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPServerObjectDatabaseStorePlatformImportRequest;
  return (MPServerObjectDatabaseStorePlatformImportRequest *)[(MPServerObjectDatabaseImportRequest *)&v4 _initWithPayload:a3];
}

+ (id)_entityTypeForObject:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"kind"];
  objc_super v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"song"] & 1) != 0
      || ([v4 isEqualToString:@"musicVideo"] & 1) != 0
      || ([v4 isEqualToString:@"uploadedAudio"] & 1) != 0
      || ([v4 isEqualToString:@"uploadedVideo"] & 1) != 0)
    {
      id v5 = MPModelRelationshipGenericSong;
    }
    else if ([v4 isEqualToString:@"playlist"])
    {
      id v5 = MPModelRelationshipGenericPlaylist;
    }
    else if ([v4 isEqualToString:@"artist"])
    {
      id v5 = MPModelRelationshipGenericArtist;
    }
    else if ([v4 isEqualToString:@"album"])
    {
      id v5 = MPModelRelationshipGenericAlbum;
    }
    else if ([v4 isEqualToString:@"radioStation"])
    {
      id v5 = MPModelRelationshipGenericRadioStation;
    }
    else if ([v4 isEqualToString:@"tvEpisode"])
    {
      id v5 = MPModelRelationshipGenericTVEpisode;
    }
    else if ([v4 isEqualToString:@"tvSeason"])
    {
      id v5 = MPModelRelationshipGenericTVSeason;
    }
    else if ([v4 isEqualToString:@"tvShow"])
    {
      id v5 = MPModelRelationshipGenericTVShow;
    }
    else
    {
      if (![v4 isEqualToString:@"movie"])
      {
        id v6 = 0;
        goto LABEL_8;
      }
      id v5 = MPModelRelationshipGenericMovie;
    }
    id v6 = *v5;
LABEL_8:
    id v7 = +[MPServerObjectDatabaseEntityType entityTypeWithServerEntityType:v4 genericObjectRelationshipKey:v6];

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

+ (id)_childKeyForParentType:(id)a3 type:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"song"])
  {
    if ([v7 isEqualToString:@"album"])
    {
      uint64_t v8 = @"MPModelChildSongAlbum";
LABEL_19:
      v9 = v8;
      goto LABEL_20;
    }
    if ([v7 isEqualToString:@"artist"])
    {
      uint64_t v8 = @"MPModelChildSongArtists";
      goto LABEL_19;
    }
  }
  if ([v6 isEqualToString:@"album"])
  {
    if ([v7 isEqualToString:@"song"])
    {
      uint64_t v8 = @"MPModelChildAlbumSongs";
      goto LABEL_19;
    }
    if ([v7 isEqualToString:@"artist"])
    {
      uint64_t v8 = @"MPModelChildAlbumArtists";
      goto LABEL_19;
    }
    if ([v7 isEqualToString:@"record-labels"])
    {
      uint64_t v8 = @"MPModelChildAlbumRecordLabels";
      goto LABEL_19;
    }
  }
  if ([v6 isEqualToString:@"artist"]
    && [v7 isEqualToString:@"album"])
  {
    uint64_t v8 = @"MPModelChildArtistAlbums";
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"playlist"]
    && [v7 isEqualToString:@"song"])
  {
    uint64_t v8 = @"MPModelChildPlaylistEntries";
    goto LABEL_19;
  }
  id v11 = [a1 _unsupportedParentChildRelationships];
  v19[0] = v6;
  v19[1] = v7;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v13 = [v12 componentsJoinedByString:@"|"];

  if (([v11 containsObject:v13] & 1) == 0)
  {
    [v11 addObject:v13];
    v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "Encountered unexpected store platform relationship parent=%@ type=%@", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v8 = 0;
LABEL_20:

  return v8;
}

+ (id)_unsupportedStorePlatformKinds
{
  if (_unsupportedStorePlatformKinds_onceToken != -1) {
    dispatch_once(&_unsupportedStorePlatformKinds_onceToken, &__block_literal_global_417);
  }
  v2 = (void *)_unsupportedStorePlatformKinds_unsupportedKinds;

  return v2;
}

uint64_t __82__MPServerObjectDatabaseStorePlatformImportRequest__unsupportedStorePlatformKinds__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_unsupportedStorePlatformKinds_unsupportedKinds;
  _unsupportedStorePlatformKinds_unsupportedKinds = (uint64_t)v0;

  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"activity"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"radioStation"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"editorial"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"streaming"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"user"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"artistOnly"];
  [(id)_unsupportedStorePlatformKinds_unsupportedKinds addObject:@"iTunesBrand"];
  v2 = (void *)_unsupportedStorePlatformKinds_unsupportedKinds;

  return [v2 addObject:@"showBrand"];
}

+ (id)_unsupportedParentChildRelationships
{
  if (_unsupportedParentChildRelationships_onceToken_413 != -1) {
    dispatch_once(&_unsupportedParentChildRelationships_onceToken_413, &__block_literal_global_415);
  }
  v2 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships_412;

  return v2;
}

void __88__MPServerObjectDatabaseStorePlatformImportRequest__unsupportedParentChildRelationships__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships_412;
  _unsupportedParentChildRelationships_unsupportedParentChildRelationships_412 = (uint64_t)v0;
}

@end
@interface MPLibraryObjectDatabase
+ (id)relationshipKinds;
- (MPIdentifierSet)_lookupDeviceIdentifiersForIdentifiers:(void *)a3 asRelationship:;
- (MPLibraryObjectDatabase)initWithLibrary:(id)a3;
- (MPMediaLibrary)library;
- (id)identifiersForTokens:(id)a3;
- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5;
- (id)tokenForIdentifiers:(id)a3 propertySet:(id)a4 options:(unint64_t)a5;
- (void)_enumerateRequestsForSupportedTypesWithPropertySet:(id)a3 identifiers:(id)a4 block:(id)a5;
@end

@implementation MPLibraryObjectDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_msvDatabase, 0);
}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (void)_enumerateRequestsForSupportedTypesWithPropertySet:(id)a3 identifiers:(id)a4 block:(id)a5
{
  v36[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a4;
  v25 = (void (**)(id, MPModelLibraryRequest *, unsigned char *))a5;
  v36[0] = @"MPModelRelationshipGenericSong";
  v36[1] = @"MPModelRelationshipGenericAlbum";
  v36[2] = @"MPModelRelationshipGenericPlaylist";
  v36[3] = @"MPModelRelationshipGenericTVEpisode";
  v36[4] = @"MPModelRelationshipGenericMovie";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v12 = [v7 relationships];
        v13 = [v12 objectForKeyedSubscript:v11];
        BOOL v14 = v13 == 0;

        if (!v14)
        {
          v15 = +[MPLibraryObjectDatabase relationshipKinds]();
          v16 = [v15 objectForKeyedSubscript:v11];

          if (v16)
          {
            v17 = -[MPLibraryObjectDatabase _lookupDeviceIdentifiersForIdentifiers:asRelationship:]((uint64_t)self, v28, v11);
            if (v17)
            {
              v18 = objc_alloc_init(MPModelLibraryRequest);
              v19 = NSString;
              v20 = [v28 humanDescription];
              v21 = [v19 stringWithFormat:@"MPLibraryObjectRequest: %@: %@", v11, v20];
              [(MPModelRequest *)v18 setLabel:v21];

              [(MPModelRequest *)v18 setItemKind:v16];
              v22 = [v7 relationships];
              v23 = [v22 objectForKeyedSubscript:v11];
              [(MPModelRequest *)v18 setItemProperties:v23];

              v34 = v17;
              uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
              [(MPModelLibraryRequest *)v18 setAllowedItemIdentifiers:v24];

              [(MPModelLibraryRequest *)v18 setSortUsingAllowedItemIdentifiers:1];
              char v29 = 0;
              v25[2](v25, v18, &v29);
              LOBYTE(v24) = v29 == 0;

              if ((v24 & 1) == 0)
              {

                goto LABEL_15;
              }
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

+ (id)relationshipKinds
{
  self;
  if (+[MPLibraryObjectDatabase relationshipKinds]::onceToken != -1) {
    dispatch_once(&+[MPLibraryObjectDatabase relationshipKinds]::onceToken, &__block_literal_global_12666);
  }
  v0 = (void *)+[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds;

  return v0;
}

- (MPIdentifierSet)_lookupDeviceIdentifiersForIdentifiers:(void *)a3 asRelationship:
{
  v99[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v83 = a3;
  v85 = v6;
  if (a1)
  {
    id v7 = [v6 library];
    uint64_t v8 = [v7 databaseID];
    uint64_t v9 = [*(id *)(a1 + 16) uniqueIdentifier];
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      v12 = v11;
      char v13 = [v10 isEqual:v11];

      if ((v13 & 1) == 0)
      {
        BOOL v14 = +[MPLibraryObjectDatabase relationshipKinds]();
        v84 = [v14 objectForKeyedSubscript:v83];

        v15 = [v6 opaqueID];
        v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [MEMORY[0x1E4F1CA98] null];
        }
        v82 = v17;

        v99[0] = @"MPModelRelationshipGenericSong";
        v99[1] = @"MPModelRelationshipGenericTVEpisode";
        v99[2] = @"MPModelRelationshipGenericMovie";
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
        int v23 = [v22 containsObject:v83];

        if (v23)
        {
          uint64_t v24 = [v6 universalStore];
          uint64_t v25 = [v24 purchasedAdamID];
          if (!v25)
          {
            v26 = [v6 universalStore];
            uint64_t v25 = [v26 adamID];
          }
          v27 = [v6 universalStore];
          uint64_t v28 = [v27 subscriptionAdamID];
          if (!v28)
          {
            char v29 = [v6 universalStore];
            uint64_t v28 = [v29 adamID];
          }
          if (v25)
          {
            uint64_t v30 = [NSNumber numberWithLongLong:v25];
          }
          else
          {
            uint64_t v30 = (uint64_t)v82;
          }
          v98[0] = v30;
          v81 = (void *)v30;
          if (v28)
          {
            uint64_t v39 = [NSNumber numberWithLongLong:v28];
          }
          else
          {
            uint64_t v39 = (uint64_t)v82;
          }
          v80 = (void *)v39;
          v98[1] = v39;
          v40 = [v6 personalizedStore];
          uint64_t v41 = [v40 cloudID];
          if (v41)
          {
            v42 = NSNumber;
            v79 = [v6 personalizedStore];
            v43 = objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v79, "cloudID"));
          }
          else
          {
            v43 = v82;
          }
          v98[2] = v43;
          v44 = [v6 universalStore];
          uint64_t v45 = [v44 universalCloudLibraryID];
          v46 = (void *)v45;
          if (v45) {
            uint64_t v47 = v45;
          }
          else {
            uint64_t v47 = (uint64_t)v82;
          }
          v98[3] = v47;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];

          if (v41)
          {
          }
          if (v28) {

          }
          v48 = @"SELECT item_pid FROM item_store WHERE store_item_id = ? OR subscription_store_item_id = ? OR store_saga_id = ? OR cloud_universal_library_id = ?";
          if (!v25)
          {
LABEL_59:
            if ([v19 count])
            {
              v63 = os_log_create("com.apple.amp.mediaplayer", "Playback");
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v85;
                _os_log_impl(&dword_1952E8000, v63, OS_LOG_TYPE_DEBUG, "XDLib: _lookupDeviceIdentifiersForIdentifiers: %{public}@ [start]", (uint8_t *)&buf, 0xCu);
              }

              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v94 = 0x2020000000;
              uint64_t v95 = 0;
              v64 = [*(id *)(a1 + 8) statementWithString:v48 error:0];
              unint64_t v65 = 0;
              while (v65 < [v19 count])
              {
                v66 = [v19 objectAtIndexedSubscript:v65];
                v67 = [MEMORY[0x1E4F1CA98] null];
                BOOL v68 = v66 == v67;

                if (v68)
                {
                  [v64 bindNullValueToParameterAtIndex:++v65];
                }
                else if (_NSIsNSString())
                {
                  [v64 bindStringValue:v66 toParameterAtIndex:++v65];
                }
                else if (_NSIsNSNumber())
                {
                  objc_msgSend(v64, "bindInt64Value:toParameterAtIndex:", objc_msgSend(v66, "longLongValue"), ++v65);
                }
                else
                {
                  v69 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v69 handleFailureInMethod:sel__lookupDeviceIdentifiersForIdentifiers_asRelationship_, a1, @"MPLibraryObjectDatabase.mm", 253, @"Unexpected param type: %@", objc_opt_class() object file lineNumber description];

                  ++v65;
                }
              }
              v70 = [*(id *)(a1 + 8) resultsForStatement:v64];
              v71 = [v70 nextObject];
              uint64_t v72 = [v71 int64ValueAtColumnIndex:0];
              *(void *)(*((void *)&buf + 1) + 24) = v72;
              [v64 invalidate];
              v73 = os_log_create("com.apple.amp.mediaplayer", "Playback");
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v74 = *(void *)(*((void *)&buf + 1) + 24);
                *(_DWORD *)v89 = 138543618;
                v90 = v85;
                __int16 v91 = 2048;
                uint64_t v92 = v74;
                _os_log_impl(&dword_1952E8000, v73, OS_LOG_TYPE_DEBUG, "XDLib: _lookupDeviceIdentifiersForIdentifiers: %{public}@ [ended] %lld", v89, 0x16u);
              }

              if (*(void *)(*((void *)&buf + 1) + 24))
              {
                v75 = [MPIdentifierSet alloc];
                v76 = [*(id *)(a1 + 16) uniqueIdentifier];
                v77 = [@"Library-MSV-" stringByAppendingString:v76];
                v86[0] = MEMORY[0x1E4F143A8];
                v86[1] = 3221225472;
                v86[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_65;
                v86[3] = &unk_1E57F4260;
                v86[4] = a1;
                v86[5] = &buf;
                v21 = [(MPIdentifierSet *)v75 initWithSource:v77 modelKind:v84 block:v86];
              }
              else
              {
                v21 = 0;
              }

              _Block_object_dispose(&buf, 8);
              goto LABEL_79;
            }
            goto LABEL_76;
          }
LABEL_58:

          goto LABEL_59;
        }
        long long v31 = (__CFString *)v83;
        long long v32 = @"MPModelRelationshipGenericAlbum";
        if (v31 == @"MPModelRelationshipGenericAlbum")
        {
        }
        else
        {
          int v33 = [(__CFString *)v31 isEqual:@"MPModelRelationshipGenericAlbum"];

          if (!v33)
          {
            v34 = v31;
            v35 = @"MPModelRelationshipGenericPlaylist";
            if (v34 == @"MPModelRelationshipGenericPlaylist")
            {
            }
            else
            {
              int v36 = [(__CFString *)v34 isEqual:@"MPModelRelationshipGenericPlaylist"];

              if (!v36)
              {
                v19 = 0;
LABEL_76:
                v21 = 0;
                goto LABEL_79;
              }
            }
            v81 = [v6 personalizedStore];
            uint64_t v52 = [v81 cloudID];
            if (v52)
            {
              v53 = NSNumber;
              v3 = [v6 personalizedStore];
              v54 = objc_msgSend(v53, "numberWithUnsignedLongLong:", objc_msgSend(v3, "cloudID"));
            }
            else
            {
              v54 = v82;
            }
            v96[0] = v54;
            v55 = [v6 universalStore];
            uint64_t v56 = [v55 globalPlaylistID];
            v57 = (void *)v56;
            if (v56) {
              uint64_t v58 = v56;
            }
            else {
              uint64_t v58 = (uint64_t)v82;
            }
            v96[1] = v58;
            v59 = [v6 universalStore];
            uint64_t v60 = [v59 universalCloudLibraryID];
            v61 = (void *)v60;
            if (v60) {
              uint64_t v62 = v60;
            }
            else {
              uint64_t v62 = (uint64_t)v82;
            }
            v96[2] = v62;
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:3];

            if (v52)
            {
            }
            v48 = @"SELECT container_pid FROM container WHERE store_cloud_id = ? OR cloud_global_id = ? OR cloud_universal_library_id = ?";
            goto LABEL_58;
          }
        }
        v37 = [v6 universalStore];
        uint64_t v38 = [v37 subscriptionAdamID];
        if (v38)
        {
        }
        else
        {
          v49 = [v6 universalStore];
          uint64_t v38 = [v49 adamID];

          if (!v38)
          {
            char v51 = 1;
            uint64_t v50 = (uint64_t)v82;
LABEL_42:
            v81 = (void *)v50;
            uint64_t v97 = v50;
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
            v48 = @"SELECT album_pid FROM item JOIN item_store USING (item_pid) WHERE store_playlist_id = ?";
            if (v51) {
              goto LABEL_59;
            }
            goto LABEL_58;
          }
        }
        uint64_t v50 = [NSNumber numberWithLongLong:v38];
        char v51 = 0;
        goto LABEL_42;
      }
    }
    v18 = [MPIdentifierSet alloc];
    v19 = [*(id *)(a1 + 16) uniqueIdentifier];
    v84 = [@"Library-FastPath" stringByAppendingString:v19];
    uint64_t v20 = [v6 modelKind];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke;
    v87[3] = &unk_1E57F95D0;
    v87[4] = a1;
    id v88 = v6;
    v82 = (void *)v20;
    v21 = [(MPIdentifierSet *)v18 initWithSource:v84 modelKind:v20 block:v87];

LABEL_79:
    goto LABEL_80;
  }
  v21 = 0;
LABEL_80:

  return v21;
}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 16) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2;
  v5[3] = &unk_1E57F96A0;
  id v6 = *(id *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 16) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2_66;
  v5[3] = &unk_1E57F4238;
  void v5[4] = *(void *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

uint64_t __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2_66(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) library];
  objc_msgSend(v6, "setPersistentID:", objc_msgSend(v3, "persistentID"));

  v4 = [*(id *)(a1 + 32) library];
  objc_msgSend(v6, "setContainedPersistentID:", objc_msgSend(v4, "containedPersistentID"));

  v5 = [*(id *)(a1 + 32) library];
  objc_msgSend(v6, "setSyncID:", objc_msgSend(v5, "syncID"));
}

void __44__MPLibraryObjectDatabase_relationshipKinds__block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v0 = +[MPModelSong kindWithVariants:7 options:0];
  v1 = +[MPModelAlbum kindWithSongKind:v0];
  v9[0] = v0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v3 = +[MPModelPlaylistEntry kindWithKinds:v2];

  v4 = +[MPModelPlaylist kindWithPlaylistEntryKind:v3 options:0];
  v7[0] = @"MPModelRelationshipGenericSong";
  v7[1] = @"MPModelRelationshipGenericAlbum";
  v8[0] = v0;
  v8[1] = v1;
  v7[2] = @"MPModelRelationshipGenericPlaylist";
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  id v6 = (void *)+[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds;
  +[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds = v5;
}

- (id)identifiersForTokens:(id)a3
{
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, objc_msgSend(v5, "count"));
  id v7 = objc_msgSend(MEMORY[0x1E4F77980], "dictionaryWithDefaultValue:", &__block_literal_global_11, v6);
  id v8 = v5;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2;
  v30[3] = &unk_1E57EF8A0;
  id v9 = v7;
  id v31 = v9;
  id v10 = v6;
  id v32 = v10;
  [v8 enumerateObjectsUsingBlock:v30];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  for (unint64_t i = 0; i < [v8 count]; ++i)
  {
    char v13 = [MEMORY[0x1E4F1CA98] null];
    [v11 addObject:v13];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_3;
  v24[3] = &unk_1E57EF918;
  id v14 = v8;
  id v25 = v14;
  v26 = self;
  id v15 = v10;
  id v27 = v15;
  id v16 = v11;
  id v28 = v16;
  SEL v29 = a2;
  [v9 enumerateKeysAndObjectsUsingBlock:v24];
  id v17 = [v16 indexesOfObjectsPassingTest:&__block_literal_global_38];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_39;
  v22[3] = &unk_1E57F6610;
  id v18 = v16;
  id v23 = v18;
  [v17 enumerateIndexesUsingBlock:v22];
  v19 = v23;
  id v20 = v18;

  return v20;
}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v15 = v5;
  id v7 = [v5 modelKind];
  id v8 = [v6 objectForKeyedSubscript:v7];
  [v8 addIndex:a3];

  id v9 = *(NSMapTable **)(a1 + 40);
  id v10 = [v15 library];
  id v11 = NSMapGet(v9, (const void *)[v10 persistentID]);

  if (!v11)
  {
    v12 = [MEMORY[0x1E4F28E60] indexSet];
    char v13 = *(NSMapTable **)(a1 + 40);
    id v14 = [v15 library];
    NSMapInsert(v13, (const void *)[v14 persistentID], v12);

    id v11 = (void *)v12;
  }
  [v11 addIndex:a3];
}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v23 = a3;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:");
  id v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_msgSend(v6, "msv_compactDescription");
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "XDLib: identifiersForTokens: [start] %{public}@ %{public}@", buf, 0x16u);
  }
  id v9 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  [(MPMediaLibraryEntityTranslationContext *)v9 setMediaLibrary:*(void *)(*(void *)(a1 + 40) + 16)];
  [(MPMediaLibraryEntityTranslationContext *)v9 setModelKind:v5];
  [(MPMediaLibraryEntityTranslationContext *)v9 setAllowedEntityIdentifiers:v6];
  id v10 = [*(id *)(*(void *)(a1 + 40) + 16) userIdentity];
  id v11 = [v10 accountDSID];
  [(MPMediaLibraryEntityTranslationContext *)v9 setPersonID:v11];

  [(MPMediaLibraryEntityTranslationContext *)v9 setSortUsingAllowedEntityIdentifiers:1];
  v12 = [v6 objectAtIndexedSubscript:0];
  char v13 = [v12 modelKind];
  id v14 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v13 modelClass]);

  id v15 = [[MPMediaLibraryView alloc] initWithLibrary:*(void *)(*(void *)(a1 + 40) + 16) filteringOptions:4];
  id v16 = +[MPPropertySet emptyPropertySet];
  if (v14)
  {
    [v14 entityQueryForPropertySet:v16 sortDescriptors:MEMORY[0x1E4F1CBF0] context:v9 view:v15];
  }
  else
  {
    uint64_t v32 = 0;
    int v33 = 0;
  }

  id v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v35 = 0;
  uint64_t v30 = v32;
  id v31 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_20;
  v24[3] = &unk_1E57EF8F0;
  id v18 = v14;
  id v25 = v18;
  v19 = v9;
  v26 = v19;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  SEL v29 = buf;
  [(MPMediaLibraryView *)v15 performCoreQuery:&v30 withCompletion:v24];
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"MPLibraryObjectDatabase.mm" lineNumber:172 description:@"MLCore library queries should be guaranteed no-escape"];
  }
  id v20 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(v17, "msv_compactDescription");
    *(_DWORD *)int v36 = 138543618;
    id v37 = v5;
    __int16 v38 = 2114;
    uint64_t v39 = v21;
    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEBUG, "XDLib: identifiersForTokens: [ended] %{public}@ %{public}@", v36, 0x16u);
  }
  _Block_object_dispose(buf, 8);

  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_39(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[MPIdentifierSet emptyIdentifierSet];
  objc_msgSend(v3, "replaceObjectAtIndex:withObject:", a2);
}

BOOL __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_35(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA98] null];
  BOOL v4 = v3 == v2;

  return v4;
}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  if (!v15)
  {
    id v5 = *(mlcore::EntityQueryResult **)a2;
    if (*(void *)a2)
    {
      id v6 = *(std::__shared_weak_count **)(a2 + 8);
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v7 = 0;
      for (unint64_t i = 0; i < mlcore::EntityQueryResult::entityCount(v5); ++i)
      {
        id v9 = (void *)mlcore::EntityQueryResult::propertyCaches(v5);
        if (0x84BDA12F684BDA13 * ((uint64_t)(v9[1] - *v9) >> 3) <= i) {
          std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
        }
        id v10 = [*(id *)(a1 + 32) identifiersForPropertyCache:*v9 + v7 context:*(void *)(a1 + 40)];
        id v11 = *(NSMapTable **)(a1 + 48);
        v12 = [v10 library];
        char v13 = NSMapGet(v11, (const void *)[v12 persistentID]);

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_21;
        v16[3] = &unk_1E57EF8C8;
        id v17 = *(id *)(a1 + 56);
        id v14 = v10;
        id v18 = v14;
        [v13 enumerateIndexesUsingBlock:v16];

        v7 += 216;
      }
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

uint64_t __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) replaceObjectAtIndex:a2 withObject:*(void *)(a1 + 40)];
}

id __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke()
{
  v0 = [MEMORY[0x1E4F28E60] indexSet];

  return v0;
}

- (id)tokenForIdentifiers:(id)a3 propertySet:(id)a4 options:(unint64_t)a5
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18[0] = @"MPModelRelationshipGenericSong";
  v18[1] = @"MPModelRelationshipGenericAlbum";
  v18[2] = @"MPModelRelationshipGenericPlaylist";
  v18[3] = @"MPModelRelationshipGenericTVEpisode";
  v18[4] = @"MPModelRelationshipGenericMovie";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = -[MPLibraryObjectDatabase _lookupDeviceIdentifiersForIdentifiers:asRelationship:]((uint64_t)self, v6, *(void **)(*((void *)&v13 + 1) + 8 * v10));
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v11 = 0;
  }

  return v11;
}

- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__12696;
  v12 = __Block_byref_object_dispose__12697;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__MPLibraryObjectDatabase_modelObjectMatchingIdentifierSet_propertySet_error___block_invoke;
  void v7[3] = &unk_1E57EF858;
  v7[4] = self;
  v7[5] = &v8;
  [(MPLibraryObjectDatabase *)self _enumerateRequestsForSupportedTypesWithPropertySet:a4 identifiers:a3 block:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __78__MPLibraryObjectDatabase_modelObjectMatchingIdentifierSet_propertySet_error___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v22 = v5;
  if (v6)
  {
    id v7 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    [(MPMediaLibraryEntityTranslationContext *)v7 setMediaLibrary:*(void *)(v6 + 16)];
    uint64_t v8 = [v22 itemKind];
    [(MPMediaLibraryEntityTranslationContext *)v7 setModelKind:v8];

    uint64_t v9 = [v22 allowedItemIdentifiers];
    [(MPMediaLibraryEntityTranslationContext *)v7 setAllowedEntityIdentifiers:v9];

    uint64_t v10 = [*(id *)(v6 + 16) userIdentity];
    id v11 = [v10 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v7 setPersonID:v11];

    v12 = [v22 itemKind];
    id v13 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v12 modelClass]);

    long long v14 = [[MPMediaLibraryView alloc] initWithLibrary:*(void *)(v6 + 16) filteringOptions:4];
    long long v15 = [v22 itemProperties];
    long long v16 = [v22 allowedItemIdentifiers];
    if (v13)
    {
      [v13 propertiesQueryForPropertySet:v15 scopedContainers:MEMORY[0x1E4F1CBF0] allowedItemIdentifiers:v16 view:v14];
    }
    else
    {
      uint64_t v41 = 0;
      v42 = 0;
    }

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__12696;
    id v27 = __Block_byref_object_dispose__12697;
    id v28 = 0;
    uint64_t v37 = 0;
    __int16 v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    uint64_t v35 = v41;
    int v36 = v42;
    if (v42) {
      atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __45__MPLibraryObjectDatabase__runObjectRequest___block_invoke;
    v29[3] = &unk_1E57EF988;
    id v17 = v13;
    id v30 = v17;
    int v33 = &v23;
    id v31 = v22;
    id v18 = v7;
    uint64_t v32 = v18;
    v34 = &v37;
    [(MPMediaLibraryView *)v14 performCoreQuery:&v35 withCompletion:v29];
    if (v36) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
    }
    if (!*((unsigned char *)v38 + 24))
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel__runObjectRequest_ object:v6 file:@"MPLibraryObjectDatabase.mm" lineNumber:368 description:@"MLCore library queries should be guaranteed no-escape"];
    }
    uint64_t v6 = +[MPModelGenericObject genericObjectWithModelObject:v24[5]];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v23, 8);

    if (v42) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
    }
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __45__MPLibraryObjectDatabase__runObjectRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = *(mlcore::PropertiesQueryResult **)a2;
    if (*(void *)a2)
    {
      id v7 = *(std::__shared_weak_count **)(a2 + 8);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v8 = (uint64_t *)mlcore::PropertiesQueryResult::allResults(v6);
      v21 = 0;
      id v22 = 0;
      uint64_t v23 = 0;
      uint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      uint64_t v24 = &v21;
      char v25 = 0;
      if (v10 != v9)
      {
        unint64_t v11 = 0x84BDA12F684BDA13 * ((v10 - v9) >> 3);
        if (v11 >= 0x12F684BDA12F685) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::PropertyCache>>(v11);
        uint64_t v13 = 0;
        v21 = v12;
        id v22 = v12;
        uint64_t v23 = &v12[216 * v14];
        do
        {
          mlcore::PropertyCache::PropertyCache();
          v13 += 216;
        }
        while (v9 + v13 != v10);
        id v22 = &v12[v13];
        if (&v12[v13] != v21)
        {
          uint64_t v15 = [*(id *)(a1 + 32) entityClass];
          long long v16 = *(void **)(a1 + 32);
          id v17 = [*(id *)(a1 + 40) itemProperties];
          if (v22 == v21) {
            std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
          }
          uint64_t v18 = objc_msgSend(v16, "objectForPropertySet:entityClass:propertyCache:context:", v17, v15);
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          id v20 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;
        }
      }
      uint64_t v24 = &v21;
      std::vector<mlcore::PropertyCache>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12696;
  uint64_t v13 = __Block_byref_object_dispose__12697;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__MPLibraryObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke;
  void v8[3] = &unk_1E57EF858;
  v8[4] = self;
  v8[5] = &v9;
  -[MPLibraryObjectDatabase _enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:](self, "_enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:", a4, a3, v8, a6);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __86__MPLibraryObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v27 = v5;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [v27 allowedItemIdentifiers];
      uint64_t v9 = objc_msgSend(v8, "msv_compactDescription");
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "XDLib: _runIdentifiersRequest: [start] %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v10 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    [(MPMediaLibraryEntityTranslationContext *)v10 setMediaLibrary:*(void *)(v6 + 16)];
    uint64_t v11 = [v27 itemKind];
    [(MPMediaLibraryEntityTranslationContext *)v10 setModelKind:v11];

    v12 = [v27 allowedItemIdentifiers];
    [(MPMediaLibraryEntityTranslationContext *)v10 setAllowedEntityIdentifiers:v12];

    uint64_t v13 = [*(id *)(v6 + 16) userIdentity];
    id v14 = [v13 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v10 setPersonID:v14];

    [(MPMediaLibraryEntityTranslationContext *)v10 setSortUsingAllowedEntityIdentifiers:1];
    uint64_t v15 = [v27 itemKind];
    long long v16 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v15 modelClass]);

    id v17 = [[MPMediaLibraryView alloc] initWithLibrary:*(void *)(v6 + 16) filteringOptions:4];
    uint64_t v18 = +[MPPropertySet emptyPropertySet];
    if (v16)
    {
      [v16 entityQueryForPropertySet:v18 sortDescriptors:MEMORY[0x1E4F1CBF0] context:v10 view:v17];
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v41 = 0;
    }

    uint64_t v28 = 0;
    SEL v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__12696;
    uint64_t v32 = __Block_byref_object_dispose__12697;
    id v33 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v34 = v40;
    uint64_t v35 = v41;
    if (v41) {
      atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v45 = __50__MPLibraryObjectDatabase__runIdentifiersRequest___block_invoke;
    v46 = &unk_1E57EF960;
    v49 = &v28;
    id v19 = v16;
    id v47 = v19;
    id v20 = v10;
    v48 = v20;
    uint64_t v50 = &v36;
    [(MPMediaLibraryView *)v17 performCoreQuery:&v34 withCompletion:&buf];
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    if (!*((unsigned char *)v37 + 24))
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel__runIdentifiersRequest_ object:v6 file:@"MPLibraryObjectDatabase.mm" lineNumber:336 description:@"MLCore library queries should be guaranteed no-escape"];
    }
    v21 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = v29[5];
      *(_DWORD *)v42 = 138543362;
      uint64_t v43 = v22;
      _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEBUG, "XDLib: _runIdentifiersRequest: [ended] %{public}@", v42, 0xCu);
    }

    id v23 = (id)v29[5];
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v28, 8);

    if (v41) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v41);
    }
  }
  else
  {
    id v23 = 0;
  }

  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  char v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __50__MPLibraryObjectDatabase__runIdentifiersRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = *(mlcore::EntityQueryResult **)a2;
    if (*(void *)a2)
    {
      id v7 = *(std::__shared_weak_count **)(a2 + 8);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      mlcore::EntityQueryResult::allEntities(v14, v6);
      uint64_t v9 = v14[0];
      uint64_t v8 = v14[1];
      uint64_t v15 = (void **)v14;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v15);
      if (v8 != v9)
      {
        uint64_t v10 = (void *)mlcore::EntityQueryResult::propertyCaches(v6);
        if (v10[1] == *v10) {
          std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "identifiersForPropertyCache:context:");
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (MPLibraryObjectDatabase)initWithLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPLibraryObjectDatabase;
  uint64_t v6 = [(MPLibraryObjectDatabase *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    uint64_t v8 = [v5 msvDatabase];
    msvDatabase = v7->_msvDatabase;
    v7->_msvDatabase = (MSVSQLDatabase *)v8;
  }
  return v7;
}

@end
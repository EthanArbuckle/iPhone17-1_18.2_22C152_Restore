@interface MPStoreModelTVEpisodeBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelTVEpisodeBuilder

+ (id)allSupportedProperties
{
  v25[15] = *MEMORY[0x1E4F143B8];
  v17 = [MPPropertySet alloc];
  v25[0] = @"MPModelPropertyTVEpisodeTitle";
  v25[1] = @"MPModelPropertyTVEpisodeDescriptionText";
  v25[2] = @"MPModelPropertyTVEpisodeDuration";
  v25[3] = @"MPModelPropertyTVEpisodeMusicShow";
  v25[4] = @"MPModelPropertyTVEpisodeNumber";
  v25[5] = @"MPModelPropertyTVEpisodeExplicitRating";
  v25[6] = @"MPModelPropertyTVEpisodeArtwork";
  v25[7] = @"MPModelPropertyTVEpisodeHasCloudSyncSource";
  v25[8] = @"MPModelPropertyTVEpisodeLibraryAdded";
  v25[9] = @"MPModelPropertyTVEpisodeLibraryAddEligible";
  v25[10] = @"MPModelPropertyTVEpisodeKeepLocalEnableState";
  v25[11] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatus";
  v25[12] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason";
  v25[13] = @"MPModelPropertyTVEpisodeKeepLocalConstraints";
  v25[14] = @"MPModelPropertyTVEpisodeStoreCanonicalID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:15];
  v23[0] = @"MPModelRelationshipTVEpisodeShow";
  v3 = [MPPropertySet alloc];
  v22 = @"MPModelPropertyTVShowTitle";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v19[0] = @"MPModelPropertyPersonName";
  v19[1] = @"MPModelPropertyTVShowCreatorArtwork";
  v20 = @"MPModelRelationshipTVShowCreator";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v15 = +[MPPropertySet propertySetWithProperties:v16];
  v21 = v15;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v5 = [(MPPropertySet *)v3 initWithProperties:v14 relationships:v4];
  v24[0] = v5;
  v23[1] = @"MPModelRelationshipTVEpisodeStoreAsset";
  v6 = +[MPStoreModelStoreAssetBuilder allSupportedProperties];
  v24[1] = v6;
  v23[2] = @"MPModelRelationshipTVEpisodeLocalFileAsset";
  v7 = +[MPModelFileAsset allSupportedProperties];
  v24[2] = v7;
  v23[3] = @"MPModelRelationshipTVEpisodeSeason";
  v18[0] = @"MPModelPropertyTVSeasonYear";
  v18[1] = @"MPModelPropertyTVSeasonNumber";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v9 = +[MPPropertySet propertySetWithProperties:v8];
  v24[3] = v9;
  v23[4] = @"MPModelRelationshipTVEpisodePlaybackPosition";
  v10 = +[MPStoreModelPlaybackPositionBuilder allSupportedProperties];
  v24[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  v12 = [(MPPropertySet *)v17 initWithProperties:v2 relationships:v11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);

  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  p_requestedEpisodeProperties = &self->_requestedEpisodeProperties;
  if ((*(unsigned char *)&self->_requestedEpisodeProperties & 1) == 0)
  {
    id v76 = v9;
    id v77 = v10;
    v13 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v14 = [v13 properties];
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeTitle"]) {
      int v15 = 2;
    }
    else {
      int v15 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFFD | v15;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeDescriptionText"]) {
      int v16 = 4;
    }
    else {
      int v16 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFFB | v16;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeDuration"]) {
      int v17 = 8;
    }
    else {
      int v17 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFF7 | v17;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeArtwork"]) {
      int v18 = 16;
    }
    else {
      int v18 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFEF | v18;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeLibraryAdded"]) {
      int v19 = 4096;
    }
    else {
      int v19 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFEFFF | v19;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeKeepLocalEnableState"]) {
      int v20 = 64;
    }
    else {
      int v20 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFBF | v20;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeKeepLocalManagedStatus"]) {
      int v21 = 128;
    }
    else {
      int v21 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFF7F | v21;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"])int v22 = 256; {
    else
    }
      int v22 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFEFF | v22;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeKeepLocalConstraints"]) {
      int v23 = 512;
    }
    else {
      int v23 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFDFF | v23;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeLibraryAddEligible"]) {
      int v24 = 0x2000;
    }
    else {
      int v24 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFDFFF | v24;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeHasCloudSyncSource"]) {
      int v25 = 1024;
    }
    else {
      int v25 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFBFF | v25;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeNumber"]) {
      int v26 = 0x8000;
    }
    else {
      int v26 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFF7FFF | v26;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeMusicShow"]) {
      int v27 = 0x4000;
    }
    else {
      int v27 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFBFFF | v27;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeExplicitRating"]) {
      int v28 = 0x10000;
    }
    else {
      int v28 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFEFFFF | v28;
    if ([v14 containsObject:@"MPModelPropertyTVEpisodeStoreCanonicalID"]) {
      int v29 = 0x20000;
    }
    else {
      int v29 = 0;
    }
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFDFFFF | v29;
    v75 = v13;
    v30 = [v13 relationships];
    v31 = [v30 objectForKey:@"MPModelRelationshipTVEpisodeSeason"];
    v32 = v31;
    id v78 = v8;
    if (v31)
    {
      *(unsigned char *)&self->_requestedEpisodeProperties.season |= 1u;
      v33 = [v31 properties];
      if ([v33 containsObject:@"MPModelPropertyTVSeasonNumber"]) {
        char v34 = 2;
      }
      else {
        char v34 = 0;
      }
      *(unsigned char *)&self->_requestedEpisodeProperties.season = *(unsigned char *)&self->_requestedEpisodeProperties.season & 0xFD | v34;
      if ([v33 containsObject:@"MPModelPropertyTVSeasonYear"]) {
        char v35 = 4;
      }
      else {
        char v35 = 0;
      }
      *(unsigned char *)&self->_requestedEpisodeProperties.season = *(unsigned char *)&self->_requestedEpisodeProperties.season & 0xFB | v35;
      v36 = [v32 relationships];
      v37 = [v36 objectForKey:@"MPModelRelationshipTVSeasonShow"];

      if (v37)
      {
        v38 = [v37 properties];
        *(unsigned char *)&self->_requestedEpisodeProperties.season.show |= 1u;
        if ([v38 containsObject:@"MPModelPropertyTVShowTitle"]) {
          char v39 = 2;
        }
        else {
          char v39 = 0;
        }
        *(unsigned char *)&self->_requestedEpisodeProperties.season.show = *(unsigned char *)&self->_requestedEpisodeProperties.season.show & 0xFD | v39;
        v40 = [v37 relationships];
        v41 = [v40 objectForKey:@"MPModelRelationshipTVShowCreator"];

        if (v41)
        {
          v42 = [v41 properties];
          *(unsigned char *)&self->_requestedEpisodeProperties.season.show.showCreator |= 1u;
          if ([v42 containsObject:@"MPModelPropertyPersonName"]) {
            char v43 = 2;
          }
          else {
            char v43 = 0;
          }
          *(unsigned char *)&self->_requestedEpisodeProperties.season.show.showCreator = *(unsigned char *)&self->_requestedEpisodeProperties.season.show.showCreator & 0xFD | v43;
          if ([v42 containsObject:@"MPModelPropertyTVShowCreatorArtwork"]) {
            char v44 = 4;
          }
          else {
            char v44 = 0;
          }
          *(unsigned char *)&self->_requestedEpisodeProperties.season.show.showCreator = *(unsigned char *)&self->_requestedEpisodeProperties.season.show.showCreator & 0xFB | v44;
        }
        id v8 = v78;
      }
    }
    v45 = [v30 objectForKey:@"MPModelRelationshipTVEpisodeShow"];
    v46 = v45;
    if (v45)
    {
      v47 = [v45 properties];
      *(unsigned char *)&self->_requestedEpisodeProperties.show |= 1u;
      if ([v47 containsObject:@"MPModelPropertyTVShowTitle"]) {
        char v48 = 2;
      }
      else {
        char v48 = 0;
      }
      *(unsigned char *)&self->_requestedEpisodeProperties.show = *(unsigned char *)&self->_requestedEpisodeProperties.show & 0xFD | v48;
      v49 = [v46 relationships];
      v50 = [v49 objectForKey:@"MPModelRelationshipTVShowCreator"];

      if (v50)
      {
        v51 = [v50 properties];
        *(unsigned char *)&self->_requestedEpisodeProperties.show.showCreator |= 1u;
        if ([v51 containsObject:@"MPModelPropertyPersonName"]) {
          char v52 = 2;
        }
        else {
          char v52 = 0;
        }
        *(unsigned char *)&self->_requestedEpisodeProperties.show.showCreator = *(unsigned char *)&self->_requestedEpisodeProperties.show.showCreator & 0xFD | v52;
        if ([v51 containsObject:@"MPModelPropertyTVShowCreatorArtwork"]) {
          char v53 = 4;
        }
        else {
          char v53 = 0;
        }
        *(unsigned char *)&self->_requestedEpisodeProperties.show.showCreator = *(unsigned char *)&self->_requestedEpisodeProperties.show.showCreator & 0xFB | v53;
      }
      id v8 = v78;
    }
    v54 = [v30 objectForKey:@"MPModelRelationshipTVEpisodeStoreAsset"];
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v54;

    v56 = [v30 objectForKey:@"MPModelRelationshipTVEpisodeLocalFileAsset"];
    if (v56) {
      *(_DWORD *)p_requestedEpisodeProperties |= 0x800u;
    }
    v57 = [v30 objectForKey:@"MPModelRelationshipTVEpisodePlaybackPosition"];
    if (v57)
    {
      v58 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaybackPositionBuilder alloc] initWithRequestedPropertySet:v57];
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v58;
    }
    *(_DWORD *)p_requestedEpisodeProperties |= 1u;

    id v9 = v76;
    v11 = v77;
  }
  char v60 = [v8 hasSubscriptionOffer];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v84[3] = &unk_1E57FA3B8;
  id v61 = v8;
  id v85 = v61;
  v62 = (void *)MEMORY[0x19971E0F0](v84);
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v79[3] = &unk_1E57F3970;
  v79[4] = self;
  id v63 = v61;
  id v80 = v63;
  id v64 = v9;
  id v81 = v64;
  id v65 = v11;
  id v82 = v65;
  char v83 = v60;
  v66 = (void *)MEMORY[0x19971E0F0](v79);
  if (v64)
  {
    v67 = [v64 identifiers];
    v68 = (MPIdentifierSet *)[v67 copyWithSource:@"StorePlatform" block:v62];
    uint64_t v69 = [v64 copyWithIdentifiers:v68 block:v66];
  }
  else
  {
    v70 = [MPModelTVEpisode alloc];
    v71 = [MPIdentifierSet alloc];
    v67 = +[MPModelTVEpisodeKind identityKind];
    v68 = [(MPIdentifierSet *)v71 initWithSource:@"StorePlatform" modelKind:v67 block:v62];
    uint64_t v69 = [(MPModelObject *)v70 initWithIdentifiers:v68 block:v66];
  }
  v72 = (void *)v69;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v73 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v73 addStoreItemMetadata:v63];
  }

  return v72;
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v13[3] = &unk_1E57F9580;
  id v4 = v3;
  id v14 = v4;
  id v15 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v13];
  v5 = [v4 personalizedStore];
  v6 = [v5 personID];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB87B8] activeAccount];
    id v8 = [v9 accountDSID];
  }
  if ([v8 length])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v10[3] = &unk_1E57F95A8;
    id v11 = v4;
    id v12 = *(id *)(a1 + 32);
    [v11 setPersonalStoreIdentifiersWithPersonID:v8 block:v10];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeTitle"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setTitle:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeDescriptionText"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) descriptionText];
    [v4 setDescriptionText:v6];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeDuration"] & 1) == 0)
  {
    [*(id *)(a1 + 40) duration];
    objc_msgSend(v4, "setDuration:");
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 40);
  if (!v8 && (*(unsigned char *)(v7 + 49) & 0x20) == 0)
  {
    id v9 = 0;
    goto LABEL_30;
  }
  id v10 = *(void **)(v7 + 32);
  if (!v10)
  {
    if ((*(unsigned char *)(v7 + 49) & 0x20) != 0)
    {
      v68[0] = @"MPModelPropertyStoreAssetRedownloadable";
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
      id v12 = +[MPPropertySet propertySetWithProperties:v13];

      id v14 = *(id *)(*(void *)(a1 + 32) + 40);
      if (v14)
      {
        id v15 = v14;
        if (v12)
        {
          uint64_t v16 = [v14 propertySetByCombiningWithPropertySet:v12];

          id v15 = (void *)v16;
        }
        goto LABEL_22;
      }
    }
    else
    {
      id v11 = v8;
      id v12 = 0;
      if (v8)
      {
LABEL_21:
        id v15 = v11;
LABEL_22:
        int v17 = [(MPStoreModelObjectBuilder *)[MPStoreModelStoreAssetBuilder alloc] initWithRequestedPropertySet:v15];
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = *(void **)(v18 + 32);
        *(void *)(v18 + 32) = v17;

        id v10 = *(void **)(*(void *)(a1 + 32) + 32);
        goto LABEL_23;
      }
    }
    id v11 = v12;
    id v12 = v11;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v20 = *(void *)(a1 + 40);
  int v21 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipTVEpisodeStoreAsset"];
  if (v21)
  {
    int v22 = [*(id *)(a1 + 48) storeAsset];
  }
  else
  {
    int v22 = 0;
  }
  id v9 = [v10 modelObjectWithStoreItemMetadata:v20 sourceModelObject:v22 userIdentity:*(void *)(a1 + 56)];
  if (v21) {

  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 40))
  {
    [v4 setStoreAsset:v9];
    uint64_t v7 = *(void *)(a1 + 32);
  }
LABEL_30:
  if ((*(unsigned char *)(v7 + 49) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeLibraryAddEligible"] & 1) == 0)
  {
    int v23 = [*(id *)(a1 + 40) videoSubtype];
    int v24 = [v23 isEqualToString:@"tvtrailer"];

    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v9, "isRedownloadable") & (v24 ^ 1));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeLibraryAdded"] & 1) == 0)
  {
    [v4 setLibraryAdded:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeHasCloudSyncSource"] & 1) == 0)
  {
    [v4 setHasCloudSyncSource:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeKeepLocalEnableState"] & 1) == 0)
  {
    [v4 setKeepLocalEnableState:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatus"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatus:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatusReason:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeKeepLocalConstraints"] & 1) == 0)
  {
    [v4 setKeepLocalConstraints:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelRelationshipTVEpisodeLocalFileAsset"] & 1) == 0)
  {
    [v4 setLocalFileAsset:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeArtwork"] & 1) == 0)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v66[3] = &unk_1E57F3860;
    id v67 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v66];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeMusicShow"] & 1) == 0)
  {
    [v4 setMusicShow:1];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeNumber"] & 1) == 0)
  {
    objc_msgSend(v4, "setEpisodeNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyTVEpisodeExplicitRating"] & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitRating:", objc_msgSend(*(id *)(a1 + 40), "explicitRating"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 2) != 0
    && ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelPropertyTVEpisodeStoreCanonicalID"] & 1) == 0)
  {
    [v4 setStoreCanonicalID:&stru_1EE680640];
  }
  uint64_t v25 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v25 + 64))
  {
    int v26 = [*(id *)(a1 + 40) artistStoreID];
    uint64_t v27 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v26);

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v64[3] = &__block_descriptor_41_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v64[4] = v27;
    char v65 = *(unsigned char *)(a1 + 64);
    int v28 = (void *)MEMORY[0x19971E0F0](v64);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v62[3] = &unk_1E57F38D0;
    int v29 = *(void **)(a1 + 40);
    v62[4] = *(void *)(a1 + 32);
    id v63 = v29;
    v30 = (void *)MEMORY[0x19971E0F0](v62);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipTVEpisodeShow"])
    {
      v31 = [*(id *)(a1 + 48) show];
      v32 = [v31 identifiers];
      id v33 = [(MPIdentifierSet *)v32 copyWithSource:@"StorePlatform" block:v28];
      char v34 = (MPModelTVShow *)[v31 copyWithIdentifiers:v33 block:v30];
    }
    else
    {
      char v35 = [MPModelTVShow alloc];
      v36 = [MPIdentifierSet alloc];
      v31 = +[MPModelTVShowKind identityKind];
      v32 = [(MPIdentifierSet *)v36 initWithSource:@"StorePlatform" modelKind:v31 block:v28];
      char v34 = [(MPModelObject *)v35 initWithIdentifiers:v32 block:v30];
    }

    [v4 setShow:v34];
    uint64_t v25 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v25 + 52))
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v58[3] = &unk_1E57F3920;
    id v59 = *(id *)(a1 + 40);
    char v61 = *(unsigned char *)(a1 + 64);
    id v60 = *(id *)(a1 + 56);
    v37 = (void *)MEMORY[0x19971E0F0](v58);
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    char v53 = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12;
    v54 = &unk_1E57F3948;
    v38 = *(void **)(a1 + 40);
    uint64_t v55 = *(void *)(a1 + 32);
    id v56 = v38;
    char v57 = *(unsigned char *)(a1 + 64);
    char v39 = (void *)MEMORY[0x19971E0F0](&v51);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", @"MPModelRelationshipTVEpisodeSeason", v51, v52, v53, v54, v55))
    {
      v40 = [*(id *)(a1 + 48) season];
      v41 = [v40 identifiers];
      id v42 = [(MPIdentifierSet *)v41 copyWithSource:@"StorePlatform" block:v37];
      char v43 = (MPModelTVSeason *)[v40 copyWithIdentifiers:v42 block:v39];
    }
    else
    {
      char v44 = [MPModelTVSeason alloc];
      v45 = [MPIdentifierSet alloc];
      v40 = +[MPModelTVSeasonKind identityKind];
      v41 = [(MPIdentifierSet *)v45 initWithSource:@"StorePlatform" modelKind:v40 block:v37];
      char v43 = [(MPModelObject *)v44 initWithIdentifiers:v41 block:v39];
    }

    [v4 setSeason:v43];
    uint64_t v25 = *(void *)(a1 + 32);
  }
  v46 = *(void **)(v25 + 24);
  if (v46)
  {
    uint64_t v47 = *(void *)(a1 + 40);
    int v48 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipTVEpisodePlaybackPosition"];
    if (v48)
    {
      v49 = [*(id *)(a1 + 48) playbackPosition];
    }
    else
    {
      v49 = 0;
    }
    v50 = [v46 modelObjectWithStoreItemMetadata:v47 sourceModelObject:v49 userIdentity:*(void *)(a1 + 56)];
    [v4 setPlaybackPosition:v50];

    if (v48) {
  }
    }
}

MPArtworkCatalog *__96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestTokenForScreenshotArtwork];
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    id v4 = [(MPArtworkCatalog *)v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
  v6[3] = &unk_1E57F3888;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  char v9 = *(unsigned char *)(a1 + 40);
  id v5 = v3;
  [v5 setUniversalStoreIdentifiersWithBlock:v6];
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 64) & 2) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) artistName];
    [v5 setTitle:v4];

    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v3 + 68)) {
    [v5 setCreator:0];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
  v13 = &unk_1E57F38F8;
  id v14 = *(id *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 48);
  [v3 setUniversalStoreIdentifiersWithBlock:&v10];
  uint64_t v4 = objc_msgSend(v3, "personalizedStore", v10, v11, v12, v13);
  id v5 = [v4 personID];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    char v9 = [v8 DSIDForUserIdentity:*(void *)(a1 + 40) outError:0];
    id v7 = [v9 stringValue];
  }
  if ([v7 length]) {
    [v3 setPersonalStoreIdentifiersWithPersonID:v7 block:&__block_literal_global_28804];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(v4 + 52);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v3, "setNumber:", objc_msgSend(*(id *)(a1 + 40), "seasonNumber"));
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(unsigned char *)(v4 + 52);
  }
  if ((v5 & 4) != 0)
  {
    v6 = [*(id *)(a1 + 40) releaseDate];
    if (v6)
    {
      id v7 = +[MPStoreItemMetadata storeServerCalendar];
      uint64_t v8 = [v7 component:4 fromDate:v6];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v3 setYear:v8];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v4 + 56))
  {
    char v9 = [*(id *)(a1 + 40) artistStoreID];
    uint64_t v10 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v9);

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
    v26[3] = &__block_descriptor_41_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v26[4] = v10;
    char v27 = *(unsigned char *)(a1 + 48);
    uint64_t v11 = (void *)MEMORY[0x19971E0F0](v26);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    int v22 = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15;
    int v23 = &unk_1E57F38D0;
    id v12 = *(void **)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    id v25 = v12;
    v13 = (void *)MEMORY[0x19971E0F0](&v20);
    if (objc_msgSend(v3, "hasLoadedValueForKey:", @"MPModelRelationshipTVSeasonShow", v20, v21, v22, v23, v24))
    {
      id v14 = [v3 show];
      char v15 = [v14 identifiers];
      id v16 = [(MPIdentifierSet *)v15 copyWithSource:@"StorePlatform" block:v11];
      int v17 = (MPModelTVShow *)[v14 copyWithIdentifiers:v16 block:v13];
    }
    else
    {
      uint64_t v18 = [MPModelTVShow alloc];
      int v19 = [MPIdentifierSet alloc];
      id v14 = +[MPModelTVShowKind identityKind];
      char v15 = [(MPIdentifierSet *)v19 initWithSource:@"StorePlatform" modelKind:v14 block:v11];
      int v17 = [(MPModelObject *)v18 initWithIdentifiers:v15 block:v13];
    }

    if (*(unsigned char *)(*(void *)(a1 + 32) + 64)) {
      [v3 setShow:v17];
    }
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
  v6[3] = &unk_1E57F3888;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  char v9 = *(unsigned char *)(a1 + 40);
  id v5 = v3;
  [v5 setUniversalStoreIdentifiersWithBlock:v6];
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 56) & 2) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) artistName];
    [v5 setTitle:v4];

    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v3 + 60)) {
    [v5 setCreator:0];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4) {
    [v7 setAdamID:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) universalStore];
    uint64_t v6 = [v5 subscriptionAdamID];

    if (!v6) {
      [v7 setSubscriptionAdamID:*(void *)(a1 + 40)];
    }
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) collectionStoreID];
  uint64_t v4 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v3);

  [v5 setAdamID:v4];
  if (*(unsigned char *)(a1 + 40)) {
    [v5 setSubscriptionAdamID:v4];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4) {
    [v7 setAdamID:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) universalStore];
    uint64_t v6 = [v5 subscriptionAdamID];

    if (!v6) {
      [v7 setSubscriptionAdamID:*(void *)(a1 + 40)];
    }
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 40) storeID];
    [v13 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v5)];
  }
  uint64_t v6 = [*(id *)(a1 + 32) universalStore];
  uint64_t v7 = [v6 subscriptionAdamID];

  if (!v7) {
    objc_msgSend(v13, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 40), "subscriptionAdamID"));
  }
  uint64_t v8 = [*(id *)(a1 + 32) universalStore];
  uint64_t v9 = [v8 purchasedAdamID];

  if (!v9) {
    objc_msgSend(v13, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 40), "purchasedAdamID"));
  }
  uint64_t v10 = [*(id *)(a1 + 32) universalStore];
  uint64_t v11 = [v10 universalCloudLibraryID];

  if (!v11)
  {
    id v12 = [*(id *)(a1 + 40) cloudUniversalLibraryID];
    [v13 setUniversalCloudLibraryID:v12];
  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) personalizedStore];
  uint64_t v4 = [v3 cloudID];

  if (!v4) {
    objc_msgSend(v8, "setCloudID:", objc_msgSend(*(id *)(a1 + 40), "cloudID"));
  }
  id v5 = [*(id *)(a1 + 32) personalizedStore];
  uint64_t v6 = [v5 cloudAlbumID];

  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) cloudAlbumID];
    [v8 setCloudAlbumID:v7];
  }
}

@end
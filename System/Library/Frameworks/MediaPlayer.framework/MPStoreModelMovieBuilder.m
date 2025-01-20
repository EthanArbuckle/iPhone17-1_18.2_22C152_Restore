@interface MPStoreModelMovieBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelMovieBuilder

+ (id)allSupportedProperties
{
  v13[16] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v13[0] = @"MPModelPropertyMovieTitle";
  v13[1] = @"MPModelPropertyMovieDescriptionText";
  v13[2] = @"MPModelPropertyMovieDuration";
  v13[3] = @"MPModelPropertyMovieReleaseDate";
  v13[4] = @"MPModelPropertyMovieExplicitRating";
  v13[5] = @"MPModelPropertyMovieTagline";
  v13[6] = @"MPModelPropertyMovieArtwork";
  v13[7] = @"MPModelPropertyMovieEditorialArtwork";
  v13[8] = @"MPModelPropertyMovieHasCloudSyncSource";
  v13[9] = @"MPModelPropertyMovieLibraryAdded";
  v13[10] = @"MPModelPropertyMovieLibraryAddEligible";
  v13[11] = @"MPModelPropertyMovieKeepLocalEnableState";
  v13[12] = @"MPModelPropertyMovieKeepLocalManagedStatus";
  v13[13] = @"MPModelPropertyMovieKeepLocalManagedStatusReason";
  v13[14] = @"MPModelPropertyMovieKeepLocalConstraints";
  v13[15] = @"MPModelPropertyMovieStoreCanonicalID";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:16];
  v11[0] = @"MPModelRelationshipMovieClips";
  v4 = +[MPStoreModelMovieMediaClipBuilder allSupportedProperties];
  v12[0] = v4;
  v11[1] = @"MPModelRelationshipMovieStoreAsset";
  v5 = +[MPStoreModelStoreAssetBuilder allSupportedProperties];
  v12[1] = v5;
  v11[2] = @"MPModelRelationshipMovieLocalFileAsset";
  v6 = +[MPModelFileAsset allSupportedProperties];
  v12[2] = v6;
  v11[3] = @"MPModelRelationshipMoviePlaybackPosition";
  v7 = +[MPStoreModelPlaybackPositionBuilder allSupportedProperties];
  v12[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
  objc_storeStrong((id *)&self->_mediaClipBuilder, 0);

  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(unsigned char *)&self->_requestedMovieProperties & 1) == 0)
  {
    id v54 = v9;
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyMovieTitle"]) {
      int v13 = 2;
    }
    else {
      int v13 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFFD | v13);
    if ([v12 containsObject:@"MPModelPropertyMovieDescriptionText"]) {
      int v14 = 4;
    }
    else {
      int v14 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFFB | v14);
    if ([v12 containsObject:@"MPModelPropertyMovieDuration"]) {
      int v15 = 8;
    }
    else {
      int v15 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFF7 | v15);
    if ([v12 containsObject:@"MPModelPropertyMovieReleaseDate"]) {
      int v16 = 16;
    }
    else {
      int v16 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFEF | v16);
    if ([v12 containsObject:@"MPModelPropertyMovieExplicitRating"]) {
      int v17 = 32;
    }
    else {
      int v17 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFDF | v17);
    if ([v12 containsObject:@"MPModelPropertyMovieTagline"]) {
      int v18 = 64;
    }
    else {
      int v18 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFBF | v18);
    if ([v12 containsObject:@"MPModelPropertyMovieArtwork"]) {
      int v19 = 128;
    }
    else {
      int v19 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFF7F | v19);
    if ([v12 containsObject:@"MPModelPropertyMovieEditorialArtwork"]) {
      int v20 = 256;
    }
    else {
      int v20 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFEFF | v20);
    if ([v12 containsObject:@"MPModelPropertyMovieLibraryAdded"]) {
      int v21 = 0x8000;
    }
    else {
      int v21 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFF7FFF | v21);
    if ([v12 containsObject:@"MPModelPropertyMovieKeepLocalEnableState"]) {
      int v22 = 512;
    }
    else {
      int v22 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFDFF | v22);
    if ([v12 containsObject:@"MPModelPropertyMovieKeepLocalManagedStatus"]) {
      int v23 = 1024;
    }
    else {
      int v23 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFBFF | v23);
    if ([v12 containsObject:@"MPModelPropertyMovieKeepLocalManagedStatusReason"]) {
      int v24 = 2048;
    }
    else {
      int v24 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFF7FF | v24);
    if ([v12 containsObject:@"MPModelPropertyMovieKeepLocalConstraints"]) {
      int v25 = 4096;
    }
    else {
      int v25 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFEFFF | v25);
    if ([v12 containsObject:@"MPModelPropertyMovieLibraryAddEligible"]) {
      int v26 = 0x10000;
    }
    else {
      int v26 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFEFFFF | v26);
    if ([v12 containsObject:@"MPModelPropertyMovieHasCloudSyncSource"]) {
      int v27 = 0x2000;
    }
    else {
      int v27 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFDFFF | v27);
    if ([v12 containsObject:@"MPModelPropertyMovieStoreCanonicalID"]) {
      int v28 = 0x20000;
    }
    else {
      int v28 = 0;
    }
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFDFFFF | v28);
    v29 = [v11 relationships];
    v30 = [v29 objectForKey:@"MPModelRelationshipMovieStoreAsset"];
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v30;

    v32 = [v29 objectForKey:@"MPModelRelationshipMovieLocalFileAsset"];
    if (v32) {
      *(_DWORD *)&self->_requestedMovieProperties |= 0x4000u;
    }
    v33 = [v29 objectForKey:@"MPModelRelationshipMoviePlaybackPosition"];
    if (v33)
    {
      v34 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaybackPositionBuilder alloc] initWithRequestedPropertySet:v33];
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v34;
    }
    v36 = [v29 objectForKey:@"MPModelRelationshipMovieClips"];
    if (v36)
    {
      v37 = [(MPStoreModelObjectBuilder *)[MPStoreModelMovieMediaClipBuilder alloc] initWithRequestedPropertySet:v36];
      mediaClipBuilder = self->_mediaClipBuilder;
      self->_mediaClipBuilder = v37;
    }
    *(_DWORD *)&self->_requestedMovieProperties |= 1u;

    id v9 = v54;
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v59[3] = &unk_1E57F95D0;
  id v39 = v8;
  id v60 = v39;
  id v40 = v10;
  id v61 = v40;
  v41 = (void *)MEMORY[0x19971E0F0](v59);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v55[3] = &unk_1E57F9630;
  v55[4] = self;
  id v42 = v39;
  id v56 = v42;
  id v43 = v9;
  id v57 = v43;
  id v44 = v40;
  id v58 = v44;
  v45 = (void *)MEMORY[0x19971E0F0](v55);
  if (v43)
  {
    v46 = [v43 identifiers];
    v47 = (MPIdentifierSet *)[v46 copyWithSource:@"StorePlatform" block:v41];
    uint64_t v48 = [v43 copyWithIdentifiers:v47 block:v45];
  }
  else
  {
    v49 = [MPModelMovie alloc];
    v50 = [MPIdentifierSet alloc];
    v46 = +[MPModelMovieKind identityKind];
    v47 = [(MPIdentifierSet *)v50 initWithSource:@"StorePlatform" modelKind:v46 block:v41];
    uint64_t v48 = [(MPModelObject *)v49 initWithIdentifiers:v47 block:v45];
  }
  v51 = (void *)v48;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v52 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v52 addStoreItemMetadata:v42];
  }

  return v51;
}

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v14[3] = &unk_1E57F9580;
  id v4 = v3;
  id v15 = v4;
  id v16 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v14];
  v5 = [v4 personalizedStore];
  v6 = [v5 personID];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    id v10 = [v9 DSIDForUserIdentity:*(void *)(a1 + 40) outError:0];
    id v8 = [v10 stringValue];
  }
  if ([v8 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v11[3] = &unk_1E57F95A8;
    id v12 = v4;
    id v13 = *(id *)(a1 + 32);
    [v12 setPersonalStoreIdentifiersWithPersonID:v8 block:v11];
  }
}

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyMovieTitle"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setTitle:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieDescriptionText"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) descriptionText];
    [v4 setDescriptionText:v6];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieDuration"] & 1) == 0)
  {
    [*(id *)(a1 + 40) duration];
    objc_msgSend(v4, "setDuration:");
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieReleaseDate"] & 1) == 0)
  {
    v7 = [*(id *)(a1 + 40) releaseDate];
    [v4 setReleaseDate:v7];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieExplicitRating"] & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitRating:", objc_msgSend(*(id *)(a1 + 40), "explicitRating"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieTagline"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) editorNotesWithStyle:@"tagline"];
    [v4 setTagline:v8];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 58) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieStoreCanonicalID"] & 1) == 0)
  {
    [v4 setStoreCanonicalID:&stru_1EE680640];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  if (!v10 && (*(unsigned char *)(v9 + 58) & 1) == 0)
  {
    v11 = 0;
    goto LABEL_42;
  }
  id v12 = *(void **)(v9 + 40);
  if (!v12)
  {
    if (*(unsigned char *)(v9 + 58))
    {
      v47[0] = @"MPModelPropertyStoreAssetRedownloadable";
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      id v14 = +[MPPropertySet propertySetWithProperties:v15];

      id v16 = *(id *)(*(void *)(a1 + 32) + 48);
      if (v16)
      {
        int v17 = v16;
        if (v14)
        {
          uint64_t v18 = [v16 propertySetByCombiningWithPropertySet:v14];

          int v17 = (void *)v18;
        }
        goto LABEL_34;
      }
    }
    else
    {
      id v13 = v10;
      id v14 = 0;
      if (v10)
      {
LABEL_33:
        int v17 = v13;
LABEL_34:
        int v19 = [(MPStoreModelObjectBuilder *)[MPStoreModelStoreAssetBuilder alloc] initWithRequestedPropertySet:v17];
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        id v12 = *(void **)(*(void *)(a1 + 32) + 40);
        goto LABEL_35;
      }
    }
    id v13 = v14;
    id v14 = v13;
    goto LABEL_33;
  }
LABEL_35:
  uint64_t v22 = *(void *)(a1 + 40);
  int v23 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipMovieStoreAsset"];
  if (v23)
  {
    int v24 = [*(id *)(a1 + 48) storeAsset];
  }
  else
  {
    int v24 = 0;
  }
  v11 = [v12 modelObjectWithStoreItemMetadata:v22 sourceModelObject:v24 userIdentity:*(void *)(a1 + 56)];
  if (v23) {

  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 48))
  {
    [v4 setStoreAsset:v11];
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_42:
  if ((*(unsigned char *)(v9 + 58) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieLibraryAddEligible"] & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v11, "isRedownloadable"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieLibraryAdded"] & 1) == 0)
  {
    [v4 setLibraryAdded:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieHasCloudSyncSource"] & 1) == 0)
  {
    [v4 setHasCloudSyncSource:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieKeepLocalEnableState"] & 1) == 0)
  {
    [v4 setKeepLocalEnableState:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieKeepLocalManagedStatus"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatus:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieKeepLocalManagedStatusReason"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatusReason:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieKeepLocalConstraints"] & 1) == 0)
  {
    [v4 setKeepLocalConstraints:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelRelationshipMovieLocalFileAsset"] & 1) == 0)
  {
    [v4 setLocalFileAsset:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieArtwork"] & 1) == 0)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v44[3] = &unk_1E57F9608;
    id v45 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v44];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 57) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyMovieEditorialArtwork"] & 1) == 0)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v42[3] = &unk_1E57F9608;
    id v43 = *(id *)(a1 + 40);
    [v4 setEditorialArtworkCatalogBlock:v42];
  }
  int v25 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v25)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    int v27 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipMoviePlaybackPosition"];
    if (v27)
    {
      int v28 = [*(id *)(a1 + 48) playbackPosition];
    }
    else
    {
      int v28 = 0;
    }
    v29 = [v25 modelObjectWithStoreItemMetadata:v26 sourceModelObject:v28 userIdentity:*(void *)(a1 + 56)];
    [v4 setPlaybackPosition:v29];

    if (v27) {
  }
    }
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v37 = v11;
    [*(id *)(a1 + 40) movieClips];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      v33 = 0;
      uint64_t v34 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(v30);
          }
          v36 = [*(id *)(*(void *)(a1 + 32) + 32) mediaClipWithStoreItemMetadata:*(void *)(a1 + 40) storeItemMovieClip:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v36)
          {
            if (!v33) {
              v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v30, "count"));
            }
            [v33 addObject:v36];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v32);
    }
    else
    {
      v33 = 0;
    }

    [v4 setClips:v33];
    v11 = v37;
  }
}

MPArtworkCatalog *__92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
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

MPArtworkCatalog *__92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) movieArtworkRequestToken];
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

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4)
  {
    v5 = [*(id *)(a1 + 40) storeID];
    [v13 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v5)];
  }
  v6 = [*(id *)(a1 + 32) universalStore];
  uint64_t v7 = [v6 subscriptionAdamID];

  if (!v7) {
    objc_msgSend(v13, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 40), "subscriptionAdamID"));
  }
  id v8 = [*(id *)(a1 + 32) universalStore];
  uint64_t v9 = [v8 purchasedAdamID];

  if (!v9) {
    objc_msgSend(v13, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 40), "purchasedAdamID"));
  }
  id v10 = [*(id *)(a1 + 32) universalStore];
  v11 = [v10 universalCloudLibraryID];

  if (!v11)
  {
    id v12 = [*(id *)(a1 + 40) cloudUniversalLibraryID];
    [v13 setUniversalCloudLibraryID:v12];
  }
}

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) personalizedStore];
  uint64_t v4 = [v3 cloudID];

  if (!v4) {
    objc_msgSend(v8, "setCloudID:", objc_msgSend(*(id *)(a1 + 40), "cloudID"));
  }
  v5 = [*(id *)(a1 + 32) personalizedStore];
  v6 = [v5 cloudAlbumID];

  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) cloudAlbumID];
    [v8 setCloudAlbumID:v7];
  }
}

@end
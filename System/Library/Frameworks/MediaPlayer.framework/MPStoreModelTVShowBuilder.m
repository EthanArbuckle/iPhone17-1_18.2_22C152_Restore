@interface MPStoreModelTVShowBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelTVShowBuilder

+ (id)allSupportedProperties
{
  v5[9] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyTVShowTitle";
  v5[1] = @"MPModelPropertyTVShowShortTitle";
  v5[2] = @"MPModelPropertyTVShowEditorNotes";
  v5[3] = @"MPModelPropertyTVShowShortEditorNotes";
  v5[4] = @"MPModelPropertyTVShowArtwork";
  v5[5] = @"MPModelPropertyTVShowEditorialArtwork";
  v5[6] = @"MPModelPropertyTVShowEpisodeCount";
  v5[7] = @"MPModelPropertyTVShowTagline";
  v5[8] = @"MPModelPropertyTVShowStoreCanonicalID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:9];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);

  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(_WORD *)&self->_requestedTVShowProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyTVShowTitle"]) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFFD | v13;
    if ([v12 containsObject:@"MPModelPropertyTVShowShortTitle"]) {
      __int16 v14 = 4;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFFB | v14;
    if ([v12 containsObject:@"MPModelPropertyTVShowArtwork"]) {
      __int16 v15 = 64;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFBF | v15;
    if ([v12 containsObject:@"MPModelPropertyTVShowEditorialArtwork"]) {
      __int16 v16 = 32;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFDF | v16;
    if ([v12 containsObject:@"MPModelPropertyTVShowEditorNotes"]) {
      __int16 v17 = 8;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFF7 | v17;
    if ([v12 containsObject:@"MPModelPropertyTVShowShortEditorNotes"]) {
      __int16 v18 = 16;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFEF | v18;
    if ([v12 containsObject:@"MPModelPropertyTVShowTagline"]) {
      __int16 v19 = 256;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFEFF | v19;
    if ([v12 containsObject:@"MPModelPropertyTVShowEpisodeCount"]) {
      __int16 v20 = 128;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFF7F | v20;
    if ([v12 containsObject:@"MPModelPropertyTVShowStoreCanonicalID"]) {
      __int16 v21 = 513;
    }
    else {
      __int16 v21 = 1;
    }
    *(_WORD *)&self->_requestedTVShowProperties = v21 | *(_WORD *)&self->_requestedTVShowProperties & 0xFDFE;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v43[3] = &unk_1E57FA3B8;
  id v22 = v8;
  id v44 = v22;
  v23 = (void *)MEMORY[0x19971E0F0](v43);
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v39 = &unk_1E57EEC20;
  v40 = self;
  id v24 = v9;
  id v41 = v24;
  id v25 = v22;
  id v42 = v25;
  v26 = (void *)MEMORY[0x19971E0F0](&v36);
  if (v24)
  {
    v27 = objc_msgSend(v24, "identifiers", v36, v37, v38, v39, v40, v41);
    v28 = (MPIdentifierSet *)[v27 copyWithSource:@"StorePlatform" block:v23];
    uint64_t v29 = [v24 copyWithIdentifiers:v28 block:v26];
  }
  else
  {
    v30 = +[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", 2, v36, v37, v38, v39, v40, v41);
    v31 = +[MPModelTVSeason kindWithEpisodeKind:v30];
    v27 = +[MPModelTVShow kindWithSeasonKind:v31];

    v32 = [MPModelTVShow alloc];
    v28 = [[MPIdentifierSet alloc] initWithSource:@"StorePlatform" modelKind:v27 block:v23];
    uint64_t v29 = [(MPModelObject *)v32 initWithIdentifiers:v28 block:v26];
  }
  v33 = (void *)v29;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v34 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v34 addStoreItemMetadata:v25];
  }

  return v33;
}

void __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 storeID];
  uint64_t v5 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v4);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v6[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v6[4] = v5;
  [v3 setUniversalStoreIdentifiersWithBlock:v6];
}

void __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 2) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowTitle"] & 1) == 0)
  {
    v4 = [*(id *)(a1 + 48) name];
    [v3 setTitle:v4];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 4) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowShortTitle"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 48) shortName];
    [v3 setShortTitle:v5];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 0x80) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowEpisodeCount"] & 1) == 0)
  {
    objc_msgSend(v3, "setEpisodesCount:", objc_msgSend(*(id *)(a1 + 48), "episodeCount"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 0x100) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowTagline"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 48) editorNotesWithStyle:@"tagline"];
    [v3 setTagline:v6];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 0x200) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowStoreCanonicalID"] & 1) == 0)
  {
    [v3 setStoreCanonicalID:&stru_1EE680640];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 0x40) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowArtwork"] & 1) == 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v9[3] = &unk_1E57EEBF8;
    id v10 = *(id *)(a1 + 48);
    [v3 setArtworkCatalogBlock:v9];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 40) & 0x20) != 0
    && ([*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyTVShowEditorialArtwork"] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v7[3] = &unk_1E57EEBF8;
    id v8 = *(id *)(a1 + 48);
    [v3 setEditorialArtworkCatalogBlock:v7];
  }
}

MPArtworkCatalog *__93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    v4 = [(MPArtworkCatalog *)v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

MPArtworkCatalog *__93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) tvShowArtworkRequestToken];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:@"fc"];
    id v3 = [MPArtworkCatalog alloc];
    v4 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    uint64_t v5 = [(MPArtworkCatalog *)v3 initWithToken:v2 dataSource:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAdamID:*(void *)(a1 + 32)];
}

@end
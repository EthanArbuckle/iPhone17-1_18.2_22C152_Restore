@interface MPStoreModelArtistBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelArtistBuilder

+ (id)allSupportedProperties
{
  v12[10] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v12[0] = @"MPModelPropertyPersonName";
  v12[1] = @"MPModelPropertyArtistHasBiography";
  v12[2] = @"MPModelPropertyPersonHasSocialPosts";
  v12[3] = @"MPModelPropertyArtistArtwork";
  v12[4] = @"MPModelPropertyArtistEditorialArtwork";
  v12[5] = @"MPModelPropertyArtistClassicalExperienceAvailable";
  v12[6] = @"MPModelPropertyArtistIsFavorite";
  v12[7] = @"MPModelPropertyArtistIsDisliked";
  v12[8] = @"MPModelPropertyArtistDateFavorited";
  v12[9] = @"MPModelPropertyArtistLibraryAdded";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:10];
  v9 = @"MPModelPropertyGenreName";
  v10 = @"MPModelRelationshipArtistGenre";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v6];

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_requestedArtistProperties = &self->_requestedArtistProperties;
  if ((*(_WORD *)&self->_requestedArtistProperties & 1) == 0)
  {
    v12 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v13 = [v12 properties];
    if ([v13 containsObject:@"MPModelPropertyPersonName"]) {
      __int16 v14 = 2;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFFD | v14;
    if ([v13 containsObject:@"MPModelPropertyArtistHasBiography"]) {
      __int16 v15 = 4;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFFB | v15;
    if ([v13 containsObject:@"MPModelPropertyPersonHasSocialPosts"]) {
      __int16 v16 = 8;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFF7 | v16;
    if ([v13 containsObject:@"MPModelPropertyArtistArtwork"]) {
      __int16 v17 = 16;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFEF | v17;
    if ([v13 containsObject:@"MPModelPropertyArtistEditorialArtwork"]) {
      __int16 v18 = 32;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFDF | v18;
    if ([v13 containsObject:@"MPModelPropertyArtistClassicalExperienceAvailable"]) {
      __int16 v19 = 64;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFBF | v19;
    if ([v13 containsObject:@"MPModelPropertyArtistIsFavorite"]) {
      __int16 v20 = 128;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFF7F | v20;
    if ([v13 containsObject:@"MPModelPropertyArtistIsDisliked"]) {
      __int16 v21 = 256;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFEFF | v21;
    if ([v13 containsObject:@"MPModelPropertyArtistDateFavorited"]) {
      __int16 v22 = 512;
    }
    else {
      __int16 v22 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFDFF | v22;
    if ([v13 containsObject:@"MPModelPropertyArtistLibraryAdded"]) {
      __int16 v23 = 1024;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFBFF | v23;
    v24 = [v12 relationships];
    v25 = [v24 objectForKey:@"MPModelRelationshipArtistGenre"];
    v26 = v25;
    if (v25)
    {
      v27 = [v25 properties];
      *(unsigned char *)&self->_requestedArtistProperties.genre |= 1u;
      if ([v27 containsObject:@"MPModelPropertyGenreName"]) {
        char v28 = 2;
      }
      else {
        char v28 = 0;
      }
      *(unsigned char *)&self->_requestedArtistProperties.genre = *(unsigned char *)&self->_requestedArtistProperties.genre & 0xFD | v28;
    }
    *(_WORD *)p_requestedArtistProperties |= 1u;
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v46[3] = &unk_1E57F95D0;
  id v29 = v8;
  id v47 = v29;
  id v30 = v10;
  id v48 = v30;
  v31 = (void *)MEMORY[0x19971E0F0](v46);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v43[3] = &unk_1E57F0AA0;
  v43[4] = self;
  id v32 = v29;
  id v44 = v32;
  id v33 = v9;
  id v45 = v33;
  v34 = (void *)MEMORY[0x19971E0F0](v43);
  if (v33)
  {
    v35 = [v33 identifiers];
    v36 = (MPIdentifierSet *)[v35 copyWithSource:@"StorePlatform" block:v31];
    uint64_t v37 = [v33 copyWithIdentifiers:v36 block:v34];
  }
  else
  {
    v38 = [MPModelArtist alloc];
    v39 = [MPIdentifierSet alloc];
    v35 = +[MPModelArtistKind identityKind];
    v36 = [(MPIdentifierSet *)v39 initWithSource:@"StorePlatform" modelKind:v35 block:v31];
    uint64_t v37 = [(MPModelObject *)v38 initWithIdentifiers:v36 block:v34];
  }
  v40 = (void *)v37;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v41 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v41 addStoreItemMetadata:v32];
  }

  return v40;
}

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v11[3] = &unk_1E57FA390;
    id v12 = *(id *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v11];
  }
  v6 = [v3 personalizedStore];
  v7 = [v6 personID];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) accountDSID];
  }
  id v10 = v9;

  if ([v10 length]) {
    [v3 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_17173];
  }
}

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyArtistHasBiography"] & 1) == 0)
  {
    objc_msgSend(v4, "setHasBiography:", objc_msgSend(*(id *)(a1 + 40), "hasArtistBiography"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPersonHasSocialPosts"] & 1) == 0)
  {
    objc_msgSend(v4, "setHasSocialPosts:", objc_msgSend(*(id *)(a1 + 40), "hasSocialPosts"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyArtistArtwork"] & 1) == 0)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v25[3] = &unk_1E57F0A70;
    id v26 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v25];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyArtistEditorialArtwork"] & 1) == 0)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v23[3] = &unk_1E57F0A70;
    id v24 = *(id *)(a1 + 40);
    [v4 setEditorialArtworkCatalogBlock:v23];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 28))
  {
    v7 = [*(id *)(a1 + 40) genreNames];
    id v8 = [v7 firstObject];

    if (v8)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      __int16 v19 = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
      __int16 v20 = &unk_1E57F88E0;
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = v8;
      id v9 = (void *)MEMORY[0x19971E0F0](&v17);
      if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", @"MPModelRelationshipArtistGenre", v17, v18, v19, v20, v21)&& (objc_msgSend(*(id *)(a1 + 48), "genre"), (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v10;
        id v12 = [v10 identifiers];
        v13 = (MPModelGenre *)[v11 copyWithIdentifiers:v12 block:v9];
      }
      else
      {
        __int16 v14 = [MPModelGenre alloc];
        v11 = +[MPIdentifierSet emptyIdentifierSet];
        v13 = [(MPModelObject *)v14 initWithIdentifiers:v11 block:v9];
      }
    }
    else
    {
      v13 = 0;
    }
    [v4 setGenre:v13];

    uint64_t v6 = *(void *)(a1 + 32);
  }
  __int16 v15 = *(_WORD *)(v6 + 24);
  if ((v15 & 0x40) != 0)
  {
    __int16 v16 = [*(id *)(a1 + 40) classicalURL];
    [v4 setClassicalExperienceAvailable:v16 != 0];

    __int16 v15 = *(_WORD *)(*(void *)(a1 + 32) + 24);
    if ((v15 & 0x80) == 0)
    {
LABEL_27:
      if ((v15 & 0x100) == 0) {
        goto LABEL_28;
      }
      goto LABEL_34;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_27;
  }
  [v4 setIsFavorite:0];
  __int16 v15 = *(_WORD *)(*(void *)(a1 + 32) + 24);
  if ((v15 & 0x100) == 0)
  {
LABEL_28:
    if ((v15 & 0x200) == 0) {
      goto LABEL_29;
    }
LABEL_35:
    [v4 setDateFavorited:0];
    if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x400) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_34:
  [v4 setIsDisliked:0];
  __int16 v15 = *(_WORD *)(*(void *)(a1 + 32) + 24);
  if ((v15 & 0x200) != 0) {
    goto LABEL_35;
  }
LABEL_29:
  if ((v15 & 0x400) != 0) {
LABEL_30:
  }
    [v4 setLibraryAdded:0];
LABEL_31:
}

MPArtworkCatalog *__93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

MPArtworkCatalog *__93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestTokenForEditorialArtworkKind:@"bannerUber"];
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

uint64_t __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t result, void *a2)
{
  if ((*(unsigned char *)(*(void *)(result + 32) + 28) & 2) != 0) {
    return [a2 setName:*(void *)(result + 40)];
  }
  return result;
}

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 storeID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

@end
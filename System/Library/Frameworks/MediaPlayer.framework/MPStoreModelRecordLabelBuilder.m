@interface MPStoreModelRecordLabelBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelRecordLabelBuilder

+ (id)allSupportedProperties
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v6[0] = @"MPModelPropertyRecordLabelName";
  v6[1] = @"MPModelPropertyRecordLabelDescriptionText";
  v6[2] = @"MPModelPropertyRecordLabelShortDescriptionText";
  v6[3] = @"MPModelPropertyRecordLabelArtwork";
  v6[4] = @"MPModelPropertyRecordLabelEditorialArtwork";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v4 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:0];

  return v4;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(unsigned char *)&self->_requestedRecordLabelProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyRecordLabelName"]) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_requestedRecordLabelProperties = *(unsigned char *)&self->_requestedRecordLabelProperties & 0xFD | v13;
    if ([v12 containsObject:@"MPModelPropertyRecordLabelDescriptionText"]) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&self->_requestedRecordLabelProperties = *(unsigned char *)&self->_requestedRecordLabelProperties & 0xFB | v14;
    if ([v12 containsObject:@"MPModelPropertyRecordLabelShortDescriptionText"]) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *(unsigned char *)&self->_requestedRecordLabelProperties = *(unsigned char *)&self->_requestedRecordLabelProperties & 0xF7 | v15;
    if ([v12 containsObject:@"MPModelPropertyRecordLabelArtwork"]) {
      char v16 = 16;
    }
    else {
      char v16 = 0;
    }
    *(unsigned char *)&self->_requestedRecordLabelProperties = *(unsigned char *)&self->_requestedRecordLabelProperties & 0xEF | v16;
    if ([v12 containsObject:@"MPModelPropertyRecordLabelEditorialArtwork"]) {
      char v17 = 33;
    }
    else {
      char v17 = 1;
    }
    *(unsigned char *)&self->_requestedRecordLabelProperties = v17 | *(unsigned char *)&self->_requestedRecordLabelProperties & 0xDE;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v37[3] = &unk_1E57F95D0;
  id v18 = v8;
  id v38 = v18;
  id v19 = v10;
  id v39 = v19;
  v20 = (void *)MEMORY[0x19971E0F0](v37);
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v34 = &unk_1E57F3330;
  v35 = self;
  id v21 = v18;
  id v36 = v21;
  v22 = (void *)MEMORY[0x19971E0F0](&v31);
  if (v9)
  {
    v23 = objc_msgSend(v9, "identifiers", v31, v32, v33, v34, v35);
    v24 = (MPIdentifierSet *)[v23 copyWithSource:@"StorePlatform" block:v20];
    uint64_t v25 = [v9 copyWithIdentifiers:v24 block:v22];
  }
  else
  {
    v26 = [MPModelRecordLabel alloc];
    v27 = [MPIdentifierSet alloc];
    v23 = +[MPModelArtistKind identityKind];
    v24 = [(MPIdentifierSet *)v27 initWithSource:@"StorePlatform" modelKind:v23 block:v20];
    uint64_t v25 = [(MPModelObject *)v26 initWithIdentifiers:v24 block:v22];
  }
  v28 = (void *)v25;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v29 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v29 addStoreItemMetadata:v21];
  }

  return v28;
}

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
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
    [v3 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_26896];
  }
}

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyRecordLabelName"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRecordLabelDescriptionText"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) descriptionText];
    [v4 setDescriptionText:v6];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRecordLabelShortDescriptionText"] & 1) == 0)
  {
    v7 = [*(id *)(a1 + 40) shortDescriptionText];
    [v4 setShortDescriptionText:v7];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRecordLabelArtwork"] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v10[3] = &unk_1E57F3308;
    id v11 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v10];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRecordLabelEditorialArtwork"] & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v8[3] = &unk_1E57F3308;
    id v9 = *(id *)(a1 + 40);
    [v4 setEditorialArtworkCatalogBlock:v8];
  }
}

MPArtworkCatalog *__98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

MPArtworkCatalog *__98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
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

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 storeID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

@end
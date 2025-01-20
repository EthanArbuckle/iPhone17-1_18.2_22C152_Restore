@interface MPStoreModelCreditsArtistBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelCreditsArtistBuilder

+ (id)allSupportedProperties
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v12[0] = @"MPModelPropertyPersonName";
  v12[1] = @"MPModelPropertyCreditsArtistArtwork";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v9 = @"MPModelPropertyPersonName";
  v10 = @"MPModelRelationshipCreditsArtistRelatedArtist";
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
  if ((*(unsigned char *)&self->_requestedCreditsArtistProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyPersonName"]) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_requestedCreditsArtistProperties = *(unsigned char *)&self->_requestedCreditsArtistProperties & 0xFD | v13;
    if ([v12 containsObject:@"MPModelPropertyCreditsArtistArtwork"]) {
      char v14 = 5;
    }
    else {
      char v14 = 1;
    }
    *(unsigned char *)&self->_requestedCreditsArtistProperties = v14 | *(unsigned char *)&self->_requestedCreditsArtistProperties & 0xFA;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v34[3] = &unk_1E57F95D0;
  id v15 = v8;
  id v35 = v15;
  id v16 = v10;
  id v36 = v16;
  v17 = (void *)MEMORY[0x19971E0F0](v34);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v31 = &unk_1E57F6EC8;
  v32 = self;
  id v18 = v15;
  id v33 = v18;
  v19 = (void *)MEMORY[0x19971E0F0](&v28);
  if (v9)
  {
    v20 = objc_msgSend(v9, "identifiers", v28, v29, v30, v31, v32);
    v21 = (MPIdentifierSet *)[v20 copyWithSource:@"StorePlatform" block:v17];
    uint64_t v22 = [v9 copyWithIdentifiers:v21 block:v19];
  }
  else
  {
    v23 = [MPModelCreditsArtist alloc];
    v24 = [MPIdentifierSet alloc];
    v20 = +[MPModelArtistKind identityKind];
    v21 = [(MPIdentifierSet *)v24 initWithSource:@"StorePlatform" modelKind:v20 block:v17];
    uint64_t v22 = [(MPModelObject *)v23 initWithIdentifiers:v21 block:v19];
  }
  v25 = (void *)v22;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v26 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v26 addStoreItemMetadata:v18];
  }

  return v25;
}

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
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
    [v3 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_43573];
  }
}

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyCreditsArtistArtwork"] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v6[3] = &unk_1E57F6EA0;
    id v7 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v6];
  }
}

MPArtworkCatalog *__100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 storeID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

@end
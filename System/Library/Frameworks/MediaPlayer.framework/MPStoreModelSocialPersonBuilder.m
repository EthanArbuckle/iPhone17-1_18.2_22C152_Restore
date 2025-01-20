@interface MPStoreModelSocialPersonBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelSocialPersonBuilder

+ (id)allSupportedProperties
{
  v5[8] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPersonName";
  v5[1] = @"MPModelPropertySocialPersonUncensoredName";
  v5[2] = @"MPModelPropertySocialPersonHandle";
  v5[3] = @"MPModelPropertySocialPersonBiography";
  v5[4] = @"MPModelPropertySocialPersonArtwork";
  v5[5] = @"MPModelPropertySocialPersonIsPrivate";
  v5[6] = @"MPModelPropertySocialPersonIsVerified";
  v5[7] = @"MPModelPropertySocialPersonHasLightweightProfile";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(_WORD *)&self->_requestedSocialPersonProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyPersonName"]) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFFD | v13;
    if ([v12 containsObject:@"MPModelPropertySocialPersonUncensoredName"]) {
      __int16 v14 = 4;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFFB | v14;
    if ([v12 containsObject:@"MPModelPropertySocialPersonHandle"]) {
      __int16 v15 = 8;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFF7 | v15;
    if ([v12 containsObject:@"MPModelPropertySocialPersonBiography"]) {
      __int16 v16 = 16;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFEF | v16;
    if ([v12 containsObject:@"MPModelPropertySocialPersonArtwork"]) {
      __int16 v17 = 32;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFDF | v17;
    if ([v12 containsObject:@"MPModelPropertySocialPersonIsPrivate"]) {
      __int16 v18 = 128;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFF7F | v18;
    if ([v12 containsObject:@"MPModelPropertySocialPersonIsVerified"]) {
      __int16 v19 = 64;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFBF | v19;
    if ([v12 containsObject:@"MPModelPropertySocialPersonHasLightweightProfile"]) {
      __int16 v20 = 257;
    }
    else {
      __int16 v20 = 1;
    }
    *(_WORD *)&self->_requestedSocialPersonProperties = v20 | *(_WORD *)&self->_requestedSocialPersonProperties & 0xFEFE;
  }
  v21 = [v8 storeID];
  v22 = MPStoreItemMetadataStringNormalizeStoreIDValue(v21);

  if (![v22 length])
  {
    v23 = [v8 socialProfileID];
    uint64_t v24 = MPStoreItemMetadataStringNormalizeStoreIDValue(v23);

    v22 = (void *)v24;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v38[3] = &unk_1E57FA3B8;
  id v25 = v22;
  id v39 = v25;
  v26 = (void *)MEMORY[0x19971E0F0](v38);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v36[3] = &unk_1E57FA408;
  v36[4] = self;
  id v27 = v8;
  id v37 = v27;
  v28 = (void *)MEMORY[0x19971E0F0](v36);
  if (v9)
  {
    v29 = [v9 identifiers];
    v30 = (MPIdentifierSet *)[v29 copyWithSource:@"StorePlatform" block:v26];
    uint64_t v31 = [v9 copyWithIdentifiers:v30 block:v28];
  }
  else
  {
    v32 = [MPModelSocialPerson alloc];
    v33 = [MPIdentifierSet alloc];
    v29 = +[MPModelSocialPerson kind];
    v30 = [(MPIdentifierSet *)v33 initWithSource:@"StorePlatform" modelKind:v29 block:v26];
    uint64_t v31 = [(MPModelObject *)v32 initWithIdentifiers:v30 block:v28];
  }
  v34 = (void *)v31;

  return v34;
}

void __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  v5 = [v4 socialProfileID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v6[3] = &unk_1E57FA390;
    id v7 = *(id *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v6];
  }
}

void __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonUncensoredName"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) nameRaw];
    [v4 setUncensoredName:v6];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonHandle"] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 40) handle];
    [v4 setHandle:v7];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonArtwork"] & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v8[3] = &unk_1E57FA3E0;
    id v9 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v8];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonIsPrivate"] & 1) == 0)
  {
    objc_msgSend(v4, "setPrivatePerson:", objc_msgSend(*(id *)(a1 + 40), "isPrivatePerson"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonIsVerified"] & 1) == 0)
  {
    objc_msgSend(v4, "setVerified:", objc_msgSend(*(id *)(a1 + 40), "isVerifiedPerson"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x100) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySocialPersonHasLightweightProfile"] & 1) == 0)
  {
    objc_msgSend(v4, "setHasLightweightProfile:", objc_msgSend(*(id *)(a1 + 40), "isOnboardedPerson") ^ 1);
  }
}

MPArtworkCatalog *__99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) avatarArtworkRequestToken];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:@"sr"];
    id v3 = [MPArtworkCatalog alloc];
    v4 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    v5 = [(MPArtworkCatalog *)v3 initWithToken:v2 dataSource:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSocialProfileID:*(void *)(a1 + 32)];
}

@end
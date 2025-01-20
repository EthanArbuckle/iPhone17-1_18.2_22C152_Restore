@interface MPStoreModelRadioStationBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelRadioStationBuilder

+ (id)allSupportedProperties
{
  v5[15] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyRadioStationBeats1";
  v5[1] = @"MPModelPropertyRadioStationName";
  v5[2] = @"MPModelPropertyRadioStationEditorNotes";
  v5[3] = @"MPModelPropertyRadioStationShortEditorNotes";
  v5[4] = @"MPModelPropertyRadioStationHasExplicitContent";
  v5[5] = @"MPModelPropertyRadioStationType";
  v5[6] = @"MPModelPropertyRadioStationSubtype";
  v5[7] = @"MPModelPropertyRadioStationStartingAirDate";
  v5[8] = @"MPModelPropertyRadioStationEndingAirDate";
  v5[9] = @"MPModelPropertyRadioStationArtwork";
  v5[10] = @"MPModelPropertyRadioStationGlyph";
  v5[11] = @"MPModelPropertyRadioStationAttributionLabel";
  v5[12] = @"MPModelPropertyRadioStationProviderName";
  v5[13] = @"MPModelPropertyRadioStationLive";
  v5[14] = @"MPModelPropertyRadioStationSubscriptionRequired";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:15];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(_WORD *)&self->_requestedRadioStationProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyRadioStationBeats1"]) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFFD | v13;
    if ([v12 containsObject:@"MPModelPropertyRadioStationName"]) {
      __int16 v14 = 4;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFFB | v14;
    if ([v12 containsObject:@"MPModelPropertyRadioStationEditorNotes"]) {
      __int16 v15 = 8;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFF7 | v15;
    if ([v12 containsObject:@"MPModelPropertyRadioStationShortEditorNotes"]) {
      __int16 v16 = 16;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFEF | v16;
    if ([v12 containsObject:@"MPModelPropertyRadioStationHasExplicitContent"]) {
      __int16 v17 = 32;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFDF | v17;
    if ([v12 containsObject:@"MPModelPropertyRadioStationType"]) {
      __int16 v18 = 64;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFBF | v18;
    if ([v12 containsObject:@"MPModelPropertyRadioStationSubtype"]) {
      __int16 v19 = 128;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFF7F | v19;
    if ([v12 containsObject:@"MPModelPropertyRadioStationArtwork"]) {
      __int16 v20 = 256;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFEFF | v20;
    if ([v12 containsObject:@"MPModelPropertyRadioStationGlyph"]) {
      __int16 v21 = 512;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFDFF | v21;
    if ([v12 containsObject:@"MPModelPropertyRadioStationAttributionLabel"]) {
      __int16 v22 = 1024;
    }
    else {
      __int16 v22 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFBFF | v22;
    if ([v12 containsObject:@"MPModelPropertyRadioStationProviderName"]) {
      __int16 v23 = 2048;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xF7FF | v23;
    if ([v12 containsObject:@"MPModelPropertyRadioStationLive"]) {
      __int16 v24 = 4096;
    }
    else {
      __int16 v24 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xEFFF | v24;
    if ([v12 containsObject:@"MPModelPropertyRadioStationStartingAirDate"]) {
      __int16 v25 = 0x2000;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xDFFF | v25;
    if ([v12 containsObject:@"MPModelPropertyRadioStationEndingAirDate"]) {
      __int16 v26 = 0x4000;
    }
    else {
      __int16 v26 = 0;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xBFFF | v26;
    if ([v12 containsObject:@"MPModelPropertyRadioStationSubscriptionRequired"]) {
      __int16 v27 = -32767;
    }
    else {
      __int16 v27 = 1;
    }
    *(_WORD *)&self->_requestedRadioStationProperties = v27 | *(_WORD *)&self->_requestedRadioStationProperties & 0x7FFE;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v42[3] = &unk_1E57FA3B8;
  id v28 = v8;
  id v43 = v28;
  v29 = (void *)MEMORY[0x19971E0F0](v42);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v40[3] = &unk_1E57EEDB0;
  v40[4] = self;
  id v30 = v28;
  id v41 = v30;
  v31 = (void *)MEMORY[0x19971E0F0](v40);
  if (v9)
  {
    v32 = [v9 identifiers];
    v33 = (MPIdentifierSet *)[v32 copyWithSource:@"StorePlatform" block:v29];
    uint64_t v34 = [v9 copyWithIdentifiers:v33 block:v31];
  }
  else
  {
    v35 = [MPModelRadioStation alloc];
    v36 = [MPIdentifierSet alloc];
    v32 = +[MPModelRadioStationKind identityKind];
    v33 = [(MPIdentifierSet *)v36 initWithSource:@"StorePlatform" modelKind:v32 block:v29];
    uint64_t v34 = [(MPModelObject *)v35 initWithIdentifiers:v33 block:v31];
  }
  v37 = (void *)v34;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v38 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v38 addStoreItemMetadata:v30];
  }

  return v37;
}

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 radio];
  v5 = [v4 stationStringID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v6[3] = &unk_1E57F96F0;
    id v7 = *(id *)(a1 + 32);
    [v3 setRadioIdentifiersWithBlock:v6];
  }
}

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyRadioStationBeats1"] & 1) == 0)
  {
    objc_msgSend(v4, "setBeats1:", objc_msgSend(*(id *)(a1 + 40), "isBeats1"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationName"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationEditorNotes"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) editorNotes];
    [v4 setEditorNotes:v6];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationShortEditorNotes"] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 40) shortEditorNotes];
    [v4 setShortEditorNotes:v7];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationHasExplicitContent"] & 1) == 0)
  {
    objc_msgSend(v4, "setHasExplicitContent:", objc_msgSend(*(id *)(a1 + 40), "isExplicitContent"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x800) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationProviderName"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) radioStationProviderName];
    [v4 setProviderName:v8];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x1000) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationLive"] & 1) == 0)
  {
    objc_msgSend(v4, "setLive:", objc_msgSend(*(id *)(a1 + 40), "isLive"));
  }
  if (*(__int16 *)(*(void *)(a1 + 32) + 24) < 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationSubscriptionRequired"] & 1) == 0)
  {
    objc_msgSend(v4, "setSubscriptionRequired:", objc_msgSend(*(id *)(a1 + 40), "radioStationIsSubscriptionOnly"));
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationType"] & 1) == 0)
  {
    unint64_t v9 = [*(id *)(a1 + 40) radioStationTypeID] - 1;
    if (v9 > 9) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_195689FF8[v9];
    }
    [v4 setType:v10];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationSubtype"] & 1) == 0)
  {
    v11 = [*(id *)(a1 + 40) radioStationSubtype];
    if ([v11 isEqualToString:@"Episode"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"Shoutcast"])
    {
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 0;
    }
    [v4 setSubtype:v12];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x100) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationArtwork"] & 1) == 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v21[3] = &unk_1E57EED88;
    id v22 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v21];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x200) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationGlyph"] & 1) == 0)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    __int16 v18 = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    __int16 v19 = &unk_1E57EED88;
    id v20 = *(id *)(a1 + 40);
    [v4 setStationGlyphBlock:&v16];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x400) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationAttributionLabel"] & 1) == 0)
  {
    [v4 setAttributionLabel:0];
  }
  if ((objc_msgSend(v4, "hasLoadedValueForKey:", @"MPModelPropertyRadioStationEvents", v16, v17, v18, v19) & 1) == 0)
  {
    __int16 v13 = [*(id *)(a1 + 40) radioStationEvents];
    [v4 setStationEvents:v13];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x2000) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationStartingAirDate"] & 1) == 0)
  {
    __int16 v14 = [*(id *)(a1 + 40) startingAirDate];
    [v4 setStartingAirDate:v14];
  }
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 0x4000) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyRadioStationEndingAirDate"] & 1) == 0)
  {
    __int16 v15 = [*(id *)(a1 + 40) endingAirDate];
    [v4 setEndingAirDate:v15];
  }
  [v4 setContainsVideo:0];
}

MPArtworkCatalog *__99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:*MEMORY[0x1E4FB8478]];
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

MPArtworkCatalog *__99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) stationGlyphRequestToken];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:*MEMORY[0x1E4FB8478]];
    [v2 setFormat:*MEMORY[0x1E4FB8498]];
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

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 storeID];
  v4 = MPStoreItemMetadataStringNormalizeStoreIDValue(v5);
  [v3 setStationStringID:v4];
}

@end
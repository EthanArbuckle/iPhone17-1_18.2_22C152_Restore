@interface MPStoreModelPlaybackPositionBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelPlaybackPositionBuilder

+ (id)allSupportedProperties
{
  v5[7] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPlaybackPositionBookmarkTime";
  v5[1] = @"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime";
  v5[2] = @"MPModelPropertyPlaybackPositionHasBeenPlayed";
  v5[3] = @"MPModelPropertyPlaybackPositionStartTime";
  v5[4] = @"MPModelPropertyPlaybackPositionStopTime";
  v5[5] = @"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier";
  v5[6] = @"MPModelPropertyPlaybackPositionUserPlayCount";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(unsigned char *)&self->_requestedPlaybackPositionProperties & 1) == 0)
  {
    v11 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v12 = [v11 properties];
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionBookmarkTime"]) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xFD | v13;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"])char v14 = 4; {
    else
    }
      char v14 = 0;
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xFB | v14;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionHasBeenPlayed"]) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xF7 | v15;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionStartTime"]) {
      char v16 = 16;
    }
    else {
      char v16 = 0;
    }
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xEF | v16;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionStopTime"]) {
      char v17 = 32;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xDF | v17;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"])char v18 = 64; {
    else
    }
      char v18 = 0;
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0xBF | v18;
    if ([v12 containsObject:@"MPModelPropertyPlaybackPositionUserPlayCount"]) {
      char v19 = -127;
    }
    else {
      char v19 = 1;
    }
    *(unsigned char *)&self->_requestedPlaybackPositionProperties = v19 | *(unsigned char *)&self->_requestedPlaybackPositionProperties & 0x7E;
  }
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __103__MPStoreModelPlaybackPositionBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v30 = &unk_1E57F32A0;
  id v20 = v8;
  id v31 = v20;
  v32 = self;
  v21 = (void *)MEMORY[0x19971E0F0](&v27);
  if (v9)
  {
    v22 = objc_msgSend(v9, "identifiers", v27, v28, v29, v30);
    uint64_t v23 = [v9 copyWithIdentifiers:v22 block:v21];
  }
  else
  {
    v24 = [MPModelPlaybackPosition alloc];
    v22 = +[MPIdentifierSet emptyIdentifierSet];
    uint64_t v23 = [(MPModelObject *)v24 initWithIdentifiers:v22 block:v21];
  }
  v25 = (void *)v23;

  return v25;
}

void __103__MPStoreModelPlaybackPositionBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [*(id *)(a1 + 32) itemKind];
  int v4 = [v3 isEqualToString:@"tvEpisode"];
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v5 BOOLForKey:@"MusicShouldFakeTVEpisodes"] & 1) == 0)
  {

    if ((v4 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 1;
    goto LABEL_6;
  }
  int v6 = [v3 isEqualToString:@"musicVideo"];

  if ((v6 | v4)) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = [v3 isEqualToString:@"movie"];
LABEL_6:
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 2) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionBookmarkTime"] & 1) == 0)
  {
    [v14 setBookmarkTime:0.0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 4) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 32) shouldBookmarkPlayPosition];
    id v9 = v8;
    if (v8) {
      uint64_t v7 = [v8 BOOLValue];
    }
    [v14 setShouldRememberBookmarkTime:v7];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 8) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionHasBeenPlayed"] & 1) == 0)
  {
    [v14 setHasBeenPlayed:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x10) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionStartTime"] & 1) == 0)
  {
    [v14 setStartTime:0.0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x20) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionStopTime"] & 1) == 0)
  {
    [v14 setStopTime:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x40) != 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"] & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 32) storeID];
    v11 = v10;
    if (v10 && (uint64_t v12 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v10)) != 0)
    {
      char v13 = +[MPUbiquitousPlaybackPositionEntity ubiquitousIdentifierWithStoreAdamID:v12];
      [v14 setStoreUbiquitousIdentifier:v13];
    }
    else
    {
      [v14 setStoreUbiquitousIdentifier:0];
    }
  }
  if (*(char *)(*(void *)(a1 + 40) + 24) < 0
    && ([v14 hasLoadedValueForKey:@"MPModelPropertyPlaybackPositionUserPlayCount"] & 1) == 0)
  {
    [v14 setUserPlayCount:0];
  }
}

@end
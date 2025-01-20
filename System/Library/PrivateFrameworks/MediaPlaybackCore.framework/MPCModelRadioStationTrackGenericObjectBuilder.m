@interface MPCModelRadioStationTrackGenericObjectBuilder
- (MPCModelRadioStationTrackGenericObjectBuilder)initWithRequestedProperties:(id)a3;
- (MPPropertySet)requestedProperties;
- (id)genericObjectForRadioStationTrack:(id)a3 radioStationContainsVideo:(BOOL)a4 containerUniqueID:(id)a5 userIdentity:(id)a6;
@end

@implementation MPCModelRadioStationTrackGenericObjectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);

  objc_storeStrong((id *)&self->_storePlatformBuilder, 0);
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (id)genericObjectForRadioStationTrack:(id)a3 radioStationContainsVideo:(BOOL)a4 containerUniqueID:(id)a5 userIdentity:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_storePlatformBuilder)
  {
    id v13 = objc_alloc(MEMORY[0x263F12070]);
    v14 = [(MPCModelRadioStationTrackGenericObjectBuilder *)self requestedProperties];
    v15 = (MPModelStorePlatformMetadataGenericObjectBuilder *)[v13 initWithRequestedProperties:v14];
    storePlatformBuilder = self->_storePlatformBuilder;
    self->_storePlatformBuilder = v15;
  }
  if ((*(unsigned char *)&self->_requestedSongProperties & 1) == 0)
  {
    v17 = [(MPCModelRadioStationTrackGenericObjectBuilder *)self requestedProperties];
    v18 = [v17 relationships];
    v19 = [v18 objectForKey:*MEMORY[0x263F11A18]];

    v20 = [v19 properties];
    if ([v20 containsObject:*MEMORY[0x263F11888]]) {
      char v21 = 2;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&self->_requestedSongProperties = *(unsigned char *)&self->_requestedSongProperties & 0xFD | v21;

    v22 = [v19 properties];
    if ([v22 containsObject:*MEMORY[0x263F12380]]) {
      char v23 = 4;
    }
    else {
      char v23 = 0;
    }
    *(unsigned char *)&self->_requestedSongProperties = *(unsigned char *)&self->_requestedSongProperties & 0xFB | v23;

    v24 = [v19 relationships];
    v25 = [v24 objectForKey:*MEMORY[0x263F11AD0]];
    v26 = v25;
    if (v25)
    {
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition |= 1u;
      v27 = [v25 properties];
      if ([v27 containsObject:*MEMORY[0x263F11600]]) {
        char v28 = 2;
      }
      else {
        char v28 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xFD | v28;
      if ([v27 containsObject:*MEMORY[0x263F11610]]) {
        char v29 = 4;
      }
      else {
        char v29 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xFB | v29;
      if ([v27 containsObject:*MEMORY[0x263F11608]]) {
        char v30 = 8;
      }
      else {
        char v30 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xF7 | v30;
      if ([v27 containsObject:*MEMORY[0x263F11618]]) {
        char v31 = 16;
      }
      else {
        char v31 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xEF | v31;
      if ([v27 containsObject:*MEMORY[0x263F11620]]) {
        char v32 = 32;
      }
      else {
        char v32 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xDF | v32;
      if ([v27 containsObject:*MEMORY[0x263F11628]]) {
        char v33 = 64;
      }
      else {
        char v33 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0xBF | v33;
      if ([v27 containsObject:*MEMORY[0x263F11630]]) {
        char v34 = 0x80;
      }
      else {
        char v34 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.playbackPosition = v34 & 0x80 | *(unsigned char *)&self->_requestedSongProperties.playbackPosition & 0x7F;
    }
    *(unsigned char *)&self->_requestedSongProperties |= 1u;
  }
  v35 = [v10 storePlatformMetadata];
  if (v35)
  {
    v36 = [(MPModelStorePlatformMetadataGenericObjectBuilder *)self->_storePlatformBuilder genericObjectForStorePlatformMetadata:v35 radioStationContainsVideo:v8 userIdentity:v12];
  }
  else
  {
    v36 = 0;
  }
  if ([v36 type] == 1 && (*(unsigned char *)&self->_requestedSongProperties.playbackPosition & 1) != 0)
  {
    v37 = [v36 song];
    v38 = [v37 identifiers];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke;
    v47[3] = &unk_2643BFC18;
    id v48 = v11;
    id v39 = v10;
    id v49 = v39;
    id v50 = v35;
    id v51 = v12;
    v40 = (void *)[v38 copyWithSource:@"RadioStationTrack" block:v47];

    v41 = [v36 song];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_4;
    v45[3] = &unk_2643BFC68;
    v45[4] = self;
    id v46 = v39;
    v42 = (void *)[v41 copyWithIdentifiers:v40 block:v45];

    uint64_t v43 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v42];

    v36 = (void *)v43;
  }

  return v36;
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setContainerUniqueID:*(void *)(a1 + 32)];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  BOOL v8 = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_2;
  v9 = &unk_2643BFBF0;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v3 setUniversalStoreIdentifiersWithBlock:&v6];
  v4 = objc_msgSend(*(id *)(a1 + 56), "accountDSID", v6, v7, v8, v9);

  if (v4)
  {
    v5 = [*(id *)(a1 + 56) accountDSID];
    [v3 setPersonalStoreIdentifiersWithPersonID:v5 block:&__block_literal_global_3960];
  }
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  char v5 = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  if ((v5 & 2) != 0)
  {
    [v3 setTrackNumber:0];
    char v5 = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  }
  if ((v5 & 4) != 0) {
    [v4 setTrackCount:0];
  }
  id v6 = objc_alloc(MEMORY[0x263F11F90]);
  uint64_t v7 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_5;
  id v13 = &unk_2643BFC40;
  BOOL v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  v9 = (void *)[v6 initWithIdentifiers:v7 block:&v10];

  objc_msgSend(v4, "setPlaybackPosition:", v9, v10, v11, v12, v13, v14);
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  if ((v3 & 2) != 0)
  {
    [*(id *)(a1 + 40) startTime];
    objc_msgSend(v4, "setBookmarkTime:");
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 32) + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  [v4 setHasBeenPlayed:0];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v4 setShouldRememberBookmarkTime:0];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v4 setUserPlayCount:0];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v4 setStartTime:0.0];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  [v4 setStopTime:0];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 20) & 0x40) != 0) {
LABEL_8:
  }
    [v4 setStoreUbiquitousIdentifier:0];
LABEL_9:
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) storeAdamID];
  [v6 setAdamID:v3];
  id v4 = [*(id *)(a1 + 40) formerStoreAdamIDs];
  if ([v4 count]) {
    [v6 setFormerAdamIDs:v4];
  }
  char v5 = [*(id *)(a1 + 40) offerWithType:*MEMORY[0x263F89020]];

  if (v5) {
    [v6 setSubscriptionAdamID:v3];
  }
}

- (MPCModelRadioStationTrackGenericObjectBuilder)initWithRequestedProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioStationTrackGenericObjectBuilder;
  char v5 = [(MPCModelRadioStationTrackGenericObjectBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;
  }
  return v5;
}

@end
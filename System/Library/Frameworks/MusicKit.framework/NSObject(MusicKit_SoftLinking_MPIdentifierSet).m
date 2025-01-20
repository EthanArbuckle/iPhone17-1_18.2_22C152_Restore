@interface NSObject(MusicKit_SoftLinking_MPIdentifierSet)
- (BOOL)musicKit_hasValidIdentifier;
- (MusicKit_SoftLinking_CatalogID)musicKit_catalogID;
- (MusicKit_SoftLinking_DeviceLocalID)musicKit_containedDeviceLocalID;
- (MusicKit_SoftLinking_DeviceLocalID)musicKit_deviceLocalID;
- (id)_musicKit_self_identifierSet;
- (id)archivedDataWithError:()MusicKit_SoftLinking_MPIdentifierSet;
- (id)musicKit_cloudAlbumLibraryID;
- (id)musicKit_formerIDs;
- (id)musicKit_identifierSetSources;
- (id)musicKit_libraryID;
- (id)musicKit_modelKind;
- (id)musicKit_occurrenceID;
- (id)musicKit_playbackID;
- (id)unionSet:()MusicKit_SoftLinking_MPIdentifierSet;
- (uint64_t)intersectsSet:()MusicKit_SoftLinking_MPIdentifierSet;
- (uint64_t)musicKit_assetAdamID;
- (uint64_t)musicKit_cloudID;
- (uint64_t)musicKit_purchasedAdamID;
- (uint64_t)musicKit_reportingAdamID;
- (uint64_t)musicKit_syncID;
@end

@implementation NSObject(MusicKit_SoftLinking_MPIdentifierSet)

- (id)musicKit_identifierSetSources
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 sources];

  return v2;
}

- (id)musicKit_modelKind
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 modelKind];

  if (v2) {
    id v3 = [[MusicKit_SoftLinking_MPModelKind alloc] _initWithUnderlyingKind:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)musicKit_occurrenceID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 containerUniqueID];

  return v2;
}

- (id)musicKit_playbackID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 contentItemID];

  return v2;
}

- (uint64_t)musicKit_reportingAdamID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 universalStore];

  uint64_t v3 = [v2 reportingAdamID];
  return v3;
}

- (id)musicKit_formerIDs
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 universalStore];
  uint64_t v3 = [v2 formerAdamIDs];
  v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_2);

  return v4;
}

- (uint64_t)musicKit_purchasedAdamID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 universalStore];

  uint64_t v3 = [v2 purchasedAdamID];
  return v3;
}

- (BOOL)musicKit_hasValidIdentifier
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 radio];
  uint64_t v3 = [v2 stationStringID];
  uint64_t v4 = [v3 length];

  if (v4) {
    goto LABEL_8;
  }
  v5 = [v1 universalStore];
  v6 = [v5 globalPlaylistID];
  uint64_t v7 = [v6 length];

  if (v7) {
    goto LABEL_8;
  }
  v8 = [v1 universalStore];
  v9 = [v8 socialProfileID];
  uint64_t v10 = [v9 length];

  if (v10) {
    goto LABEL_8;
  }
  v11 = [v1 universalStore];
  uint64_t v12 = [v11 subscriptionAdamID];

  if (v12) {
    goto LABEL_8;
  }
  v13 = [v1 universalStore];
  uint64_t v14 = [v13 adamID];

  if (v14) {
    goto LABEL_8;
  }
  v15 = [v1 universalStore];
  uint64_t v16 = [v15 assetAdamID];

  if (v16
    || ([v1 universalStore],
        v17 = objc_claimAutoreleasedReturnValue(),
        [v17 universalCloudLibraryID],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 length],
        v18,
        v17,
        v19))
  {
LABEL_8:
    BOOL v20 = 1;
  }
  else
  {
    v22 = [v1 library];
    BOOL v20 = [v22 persistentID] != 0;
  }
  return v20;
}

- (id)musicKit_libraryID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 universalStore];

  uint64_t v3 = [v2 universalCloudLibraryID];

  return v3;
}

- (uint64_t)musicKit_cloudID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 personalizedStore];

  uint64_t v3 = [v2 cloudID];
  return v3;
}

- (MusicKit_SoftLinking_DeviceLocalID)musicKit_containedDeviceLocalID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 library];

  if (v2)
  {
    uint64_t v3 = (MusicKit_SoftLinking_DeviceLocalID *)[v2 containedPersistentID];
    if (v3)
    {
      uint64_t v4 = [MusicKit_SoftLinking_DeviceLocalID alloc];
      v5 = [v2 databaseID];
      uint64_t v3 = [(MusicKit_SoftLinking_DeviceLocalID *)v4 initWithValue:v3 databaseID:v5];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)musicKit_syncID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 library];

  uint64_t v3 = [v2 syncID];
  return v3;
}

- (MusicKit_SoftLinking_DeviceLocalID)musicKit_deviceLocalID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 library];

  if (v2)
  {
    uint64_t v3 = (MusicKit_SoftLinking_DeviceLocalID *)[v2 persistentID];
    if (v3)
    {
      uint64_t v4 = [MusicKit_SoftLinking_DeviceLocalID alloc];
      v5 = [v2 databaseID];
      uint64_t v3 = [(MusicKit_SoftLinking_DeviceLocalID *)v4 initWithValue:v3 databaseID:v5];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)musicKit_cloudAlbumLibraryID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  v2 = [v1 personalizedStore];

  uint64_t v3 = [v2 cloudAlbumID];

  return v3;
}

- (id)_musicKit_self_identifierSet
{
  getMPIdentifierSetClass();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (MusicKit_SoftLinking_CatalogID)musicKit_catalogID
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  id v2 = [v1 modelKind];
  uint64_t v3 = [v2 identityKind];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  uint64_t v4 = (void *)getMPModelRadioStationKindClass_softClass;
  uint64_t v38 = getMPModelRadioStationKindClass_softClass;
  if (!getMPModelRadioStationKindClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getMPModelRadioStationKindClass_block_invoke;
    v42 = &unk_26443F950;
    v43 = &v35;
    __getMPModelRadioStationKindClass_block_invoke((uint64_t)&v39);
    uint64_t v4 = (void *)v36[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v35, 8);
  v6 = objc_msgSend(v5, "identityKind", v35);
  int v7 = [v3 isEqual:v6];

  if (v7)
  {
    v8 = [v1 radio];
    v9 = [v8 stationStringID];

    uint64_t v10 = 3;
    goto LABEL_32;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v11 = (void *)getMPModelPlaylistKindClass_softClass;
  uint64_t v38 = getMPModelPlaylistKindClass_softClass;
  if (!getMPModelPlaylistKindClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getMPModelPlaylistKindClass_block_invoke;
    v42 = &unk_26443F950;
    v43 = &v35;
    __getMPModelPlaylistKindClass_block_invoke((uint64_t)&v39);
    v11 = (void *)v36[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v35, 8);
  v13 = objc_msgSend(v12, "identityKind", v35);
  int v14 = [v3 isEqual:v13];

  if (v14)
  {
    v15 = [v1 universalStore];
    v9 = [v15 globalPlaylistID];

    uint64_t v10 = 2;
    goto LABEL_32;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  uint64_t v16 = (void *)getMPModelSocialPersonKindClass_softClass;
  uint64_t v38 = getMPModelSocialPersonKindClass_softClass;
  if (!getMPModelSocialPersonKindClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getMPModelSocialPersonKindClass_block_invoke;
    v42 = &unk_26443F950;
    v43 = &v35;
    __getMPModelSocialPersonKindClass_block_invoke((uint64_t)&v39);
    uint64_t v16 = (void *)v36[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v35, 8);
  v18 = objc_msgSend(v17, "identityKind", v35);
  int v19 = [v3 isEqual:v18];

  if (v19)
  {
    BOOL v20 = [v1 universalStore];
    v9 = [v20 socialProfileID];

    uint64_t v10 = 5;
    goto LABEL_32;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v21 = (void *)getMPModelForYouRecommendationGroupKindClass_softClass;
  uint64_t v38 = getMPModelForYouRecommendationGroupKindClass_softClass;
  if (!getMPModelForYouRecommendationGroupKindClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getMPModelForYouRecommendationGroupKindClass_block_invoke;
    v42 = &unk_26443F950;
    v43 = &v35;
    __getMPModelForYouRecommendationGroupKindClass_block_invoke((uint64_t)&v39);
    v21 = (void *)v36[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v35, 8);
  v23 = objc_msgSend(v22, "identityKind", v35);
  int v24 = [v3 isEqual:v23];

  if (v24)
  {
    v25 = [v1 personalizedStore];
    v9 = [v25 recommendationID];

    uint64_t v10 = 4;
    goto LABEL_32;
  }
  v26 = [v1 universalStore];
  uint64_t v27 = [v26 subscriptionAdamID];
  if (v27)
  {
    uint64_t v10 = 6;
    goto LABEL_23;
  }
  uint64_t v27 = [v26 adamID];
  if (v27)
  {
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  uint64_t v27 = [v26 assetAdamID];
  if (v27)
  {
    uint64_t v10 = 1;
LABEL_23:

    v28 = (UInt8 *)&v41 + 7;
    uint64_t quot = v27;
    do
    {
      lldiv_t v30 = lldiv(quot, 10);
      uint64_t quot = v30.quot;
      if (v30.rem >= 0) {
        LOBYTE(v31) = v30.rem;
      }
      else {
        uint64_t v31 = -v30.rem;
      }
      *v28-- = v31 + 48;
    }
    while (v30.quot);
    if (v27 < 0) {
      UInt8 *v28 = 45;
    }
    else {
      ++v28;
    }
    v9 = (void *)CFStringCreateWithBytes(0, v28, (char *)&v42 - (char *)v28, 0x8000100u, 0);
    goto LABEL_32;
  }
  v9 = [v26 globalPlaylistID];
  if (v9)
  {
    uint64_t v10 = 2;
  }
  else
  {
    v9 = [v26 socialProfileID];
    uint64_t v10 = 5;
  }
  if (!v9)
  {
    v34 = [v1 radio];
    v9 = [v34 stationStringID];

    uint64_t v10 = 3;
  }
  if (!v9)
  {
    v9 = [v26 socialProfileID];
    uint64_t v10 = 5;
  }

LABEL_32:
  if (v9) {
    v32 = [[MusicKit_SoftLinking_CatalogID alloc] initWithValue:v9 kind:v10];
  }
  else {
    v32 = 0;
  }

  return v32;
}

- (uint64_t)musicKit_assetAdamID
{
  v1 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  id v2 = [v1 universalStore];

  uint64_t v3 = [v2 assetAdamID];
  return v3;
}

- (uint64_t)intersectsSet:()MusicKit_SoftLinking_MPIdentifierSet
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  getMPIdentifierSetClass();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v5 intersectsSet:v4];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)unionSet:()MusicKit_SoftLinking_MPIdentifierSet
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  getMPIdentifierSetClass();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 unionSet:v4];
  }
  else
  {
    id v6 = v5;
  }
  int v7 = v6;

  return v7;
}

- (id)archivedDataWithError:()MusicKit_SoftLinking_MPIdentifierSet
{
  id v4 = objc_msgSend(a1, "_musicKit_self_identifierSet");
  id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:a3];

  return v5;
}

@end
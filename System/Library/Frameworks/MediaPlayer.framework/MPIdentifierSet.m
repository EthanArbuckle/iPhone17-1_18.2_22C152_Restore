@interface MPIdentifierSet
+ (BOOL)supportsSecureCoding;
+ (MPIdentifierSet)emptyIdentifierSet;
- (BOOL)hasCommonIdentifierWithIdentifierSet:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)shouldExcludeFromShuffle;
- (MPIdentifierSet)initWithBlock:(id)a3;
- (MPIdentifierSet)initWithCoder:(id)a3;
- (MPIdentifierSet)initWithModelKind:(id)a3 block:(id)a4;
- (MPIdentifierSet)initWithModelKind:(id)a3 musicKitBlock:(id)a4;
- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 block:(id)a5;
- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 musicKitBlock:(id)a5;
- (MPLocalLibraryIdentifiers)library;
- (MPModelKind)modelKind;
- (MPPersonalStoreIdentifiers)personalizedStore;
- (MPRadioIdentifiers)radio;
- (MPUniversalStoreIdentifiers)universalStore;
- (NSArray)formerAdamIDs;
- (NSArray)formerStoreAdamIDs;
- (NSArray)sources;
- (NSString)cloudAlbumID;
- (NSString)cloudArtistID;
- (NSString)cloudUniversalLibraryID;
- (NSString)containerUniqueID;
- (NSString)contentItemID;
- (NSString)databaseID;
- (NSString)description;
- (NSString)globalPlaylistID;
- (NSString)handoffCorrelationID;
- (NSString)humanDescription;
- (NSString)informalMediaClipID;
- (NSString)informalStaticAssetID;
- (NSString)lyricsID;
- (NSString)opaqueID;
- (NSString)personID;
- (NSString)radioStationHash;
- (NSString)radioStationStringID;
- (NSString)recommendationID;
- (NSString)socialProfileID;
- (NSString)stationEventID;
- (NSString)stationHash;
- (NSString)stationStringID;
- (NSString)storeCloudAlbumID;
- (NSString)storeRecommendationID;
- (NSString)universalCloudLibraryID;
- (NSString)vendorID;
- (NSString)versionHash;
- (id)_copyWithSources:(id)a3 block:(id)a4;
- (id)_initWithSources:(id)a3 modelKind:(id)a4 block:(id)a5;
- (id)_stateDumpObject;
- (id)copyWithBlock:(id)a3;
- (id)copyWithMusicKitBlock:(id)a3;
- (id)copyWithSource:(id)a3 block:(id)a4;
- (id)copyWithSource:(id)a3 musicKitBlock:(id)a4;
- (id)identifierDescriptions:(BOOL)a3;
- (id)preferredStoreStringIdentifierForPersonID:(id)a3;
- (id)prioritizedStoreStringIdentifiersForPersonID:(id)a3;
- (id)storeCloudArtistID;
- (id)unionSet:(id)a3;
- (id)unionSet:(id)a3 block:(id)a4;
- (int64_t)adamID;
- (int64_t)assetAdamID;
- (int64_t)containedPersistentID;
- (int64_t)deviceLibraryPersistentID;
- (int64_t)lyricsAdamID;
- (int64_t)musicKit_possibleLibraryPersistentID;
- (int64_t)persistentID;
- (int64_t)purchasedAdamID;
- (int64_t)radioStationID;
- (int64_t)reportingAdamID;
- (int64_t)stationID;
- (int64_t)storeAdamID;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (int64_t)subscriptionAdamID;
- (int64_t)syncID;
- (unint64_t)cloudID;
- (unint64_t)hash;
- (unint64_t)storeCloudID;
- (void)_setDefaultDatabaseIDIfNeeded;
- (void)_setDefaultPersonIDIfNeeded;
- (void)clearLibraryIdentifiers;
- (void)clearPersonalStoreIdentifiers;
- (void)clearRadioIdentifiers;
- (void)clearUniversalStoreIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)musicKit_setPossibleLibraryPersistentID:(int64_t)a3;
- (void)setAdamID:(int64_t)a3;
- (void)setAssetAdamID:(int64_t)a3;
- (void)setCloudAlbumID:(id)a3;
- (void)setCloudArtistID:(id)a3;
- (void)setCloudID:(unint64_t)a3;
- (void)setCloudUniversalLibraryID:(id)a3;
- (void)setContainedPersistentID:(int64_t)a3;
- (void)setContainerUniqueID:(id)a3;
- (void)setContentItemID:(id)a3;
- (void)setDeviceLibraryPersistentID:(int64_t)a3;
- (void)setFormerAdamIDs:(id)a3;
- (void)setFormerStoreAdamIDs:(id)a3;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setHandoffCorrelationID:(id)a3;
- (void)setInformalMediaClipID:(id)a3;
- (void)setInformalStaticAssetID:(id)a3;
- (void)setLibraryIdentifiersWithDatabaseID:(id)a3 block:(id)a4;
- (void)setLyricsAdamID:(int64_t)a3;
- (void)setLyricsID:(id)a3;
- (void)setModelKind:(id)a3;
- (void)setOpaqueID:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPersonalStoreIdentifiersWithPersonID:(id)a3 block:(id)a4;
- (void)setPlaceholder:(BOOL)a3;
- (void)setPurchasedAdamID:(int64_t)a3;
- (void)setRadioIdentifiersWithBlock:(id)a3;
- (void)setRadioStationHash:(id)a3;
- (void)setRadioStationID:(int64_t)a3;
- (void)setRadioStationStringID:(id)a3;
- (void)setRecommendationID:(id)a3;
- (void)setReportingAdamID:(int64_t)a3;
- (void)setShouldExcludeFromShuffle:(BOOL)a3;
- (void)setSocialProfileID:(id)a3;
- (void)setStationEventID:(id)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
- (void)setStoreAdamID:(int64_t)a3;
- (void)setStoreCloudAlbumID:(id)a3;
- (void)setStoreCloudArtistID:(id)a3;
- (void)setStoreCloudID:(unint64_t)a3;
- (void)setStorePurchasedAdamID:(int64_t)a3;
- (void)setStoreRecommendationID:(id)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
- (void)setSubscriptionAdamID:(int64_t)a3;
- (void)setSyncID:(int64_t)a3;
- (void)setUniversalCloudLibraryID:(id)a3;
- (void)setUniversalStoreIdentifiersWithBlock:(id)a3;
- (void)setVendorID:(id)a3;
- (void)setVersionHash:(id)a3;
@end

@implementation MPIdentifierSet

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int64_t)assetAdamID
{
  return self->_assetAdamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_modelKind, 0);
  objc_storeStrong((id *)&self->_versionHash, 0);
  objc_storeStrong((id *)&self->_opaqueID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_handoffCorrelationID, 0);
  objc_storeStrong((id *)&self->_containerUniqueID, 0);
  objc_storeStrong((id *)&self->_stationEventID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_informalStaticAssetID, 0);
  objc_storeStrong((id *)&self->_informalMediaClipID, 0);
  objc_storeStrong((id *)&self->_socialProfileID, 0);
  objc_storeStrong((id *)&self->_universalCloudLibraryID, 0);
  objc_storeStrong((id *)&self->_formerAdamIDs, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_recommendationID, 0);
  objc_storeStrong((id *)&self->_cloudArtistID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_personID, 0);

  objc_storeStrong((id *)&self->_databaseID, 0);
}

- (MPLocalLibraryIdentifiers)library
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_databaseID length])
  {
    v3 = self;
  }
  else
  {
    if (self->_persistentID || self->_containedPersistentID || self->_syncID)
    {
      v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 138543362;
        v7 = self;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Omitting library IDs [missing databaseID] identifierSet=%{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    v3 = 0;
  }

  return (MPLocalLibraryIdentifiers *)v3;
}

- (MPPersonalStoreIdentifiers)personalizedStore
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_personID length])
  {
    v3 = self;
  }
  else if (self->_cloudID {
         || [(NSString *)self->_cloudAlbumID length]
  }
         || [(NSString *)self->_cloudArtistID length]
         || (v3 = [(NSString *)self->_recommendationID length]) != 0)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Omitting personalizedStore IDs [missing databaseID] identifierSet=%{public}@", (uint8_t *)&v6, 0xCu);
    }

    v3 = 0;
  }

  return (MPPersonalStoreIdentifiers *)v3;
}

- (MPUniversalStoreIdentifiers)universalStore
{
  if ([(NSString *)self->_globalPlaylistID length]
    || self->_adamID
    || [(NSArray *)self->_formerAdamIDs count]
    || [(NSString *)self->_universalCloudLibraryID length]
    || self->_purchasedAdamID
    || self->_subscriptionAdamID
    || [(NSString *)self->_socialProfileID length]
    || [(NSString *)self->_informalMediaClipID length]
    || [(NSString *)self->_informalStaticAssetID length]
    || self->_reportingAdamID
    || self->_assetAdamID
    || self->_lyricsAdamID)
  {
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return (MPUniversalStoreIdentifiers *)v3;
}

- (NSString)socialProfileID
{
  return self->_socialProfileID;
}

- (int64_t)syncID
{
  return self->_syncID;
}

- (int64_t)containedPersistentID
{
  return self->_containedPersistentID;
}

- (void)setLibraryIdentifiersWithDatabaseID:(id)a3 block:(id)a4
{
  v14 = (NSString *)a3;
  v7 = (void (**)(id, MPIdentifierSet *))a4;
  if (![(NSString *)v14 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPIdentifierSet.m", 849, @"Invalid parameter not satisfying: %@", @"databaseID.length > 0" object file lineNumber description];
  }
  uint64_t v8 = self->_databaseID;
  if (v8 == v14)
  {
  }
  else
  {
    v9 = v8;
    char v10 = [(NSString *)v8 isEqual:v14];

    if ((v10 & 1) == 0) {
      [(MPIdentifierSet *)self clearLibraryIdentifiers];
    }
  }
  v11 = (NSString *)[(NSString *)v14 copy];
  databaseID = self->_databaseID;
  self->_databaseID = v11;

  v7[2](v7, self);
}

- (void)clearLibraryIdentifiers
{
  databaseID = self->_databaseID;
  self->_databaseID = 0;

  self->_persistentID = 0;
  self->_containedPersistentID = 0;
  self->_syncID = 0;
}

- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 musicKitBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v15 count:1];

  v13 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", v12, v10, v9, v15, v16);
  return v13;
}

- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 block:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v15 count:1];

  v13 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", v12, v10, v9, v15, v16);
  return v13;
}

- (id)_initWithSources:(id)a3 modelKind:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, MPIdentifierSet *))a5;
  v16.receiver = self;
  v16.super_class = (Class)MPIdentifierSet;
  id v11 = [(MPIdentifierSet *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sources = v11->_sources;
    v11->_sources = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_modelKind, a4);
    formerAdamIDs = v11->_formerAdamIDs;
    v11->_formerAdamIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    v10[2](v10, v11);
  }

  return v11;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (MPRadioIdentifiers)radio
{
  if ([(NSString *)self->_stationStringID length]
    || self->_stationID
    || [(NSString *)self->_stationHash length]
    || (v3 = [(NSString *)self->_stationEventID length]) != 0)
  {
    v3 = self;
  }

  return (MPRadioIdentifiers *)v3;
}

- (NSArray)sources
{
  return self->_sources;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)cloudID
{
  return self->_cloudID;
}

- (BOOL)shouldExcludeFromShuffle
{
  return self->_shouldExcludeFromShuffle;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v3, "decodeInt64ForKey:", @"MPIdentifierSetDeviceLibraryPersistentID"));
  objc_msgSend(v4, "setContainedPersistentID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetDeviceLibraryContainedPersistentID"));
  objc_msgSend(v4, "setSyncID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetSyncID"));
}

- (void)setContainedPersistentID:(int64_t)a3
{
  self->_containedPersistentID = a3;
}

- (void)setSyncID:(int64_t)a3
{
  self->_syncID = a3;
}

- (void)_setDefaultDatabaseIDIfNeeded
{
  if (![(NSString *)self->_databaseID length])
  {
    id v6 = [MEMORY[0x1E4FB87B8] activeAccount];
    v3 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v6];
    id v4 = [v3 uniqueIdentifier];
    databaseID = self->_databaseID;
    self->_databaseID = v4;
  }
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (void)setUniversalStoreIdentifiersWithBlock:(id)a3
{
}

- (void)setVendorID:(id)a3
{
}

- (void)setContentItemID:(id)a3
{
}

- (void)setContainerUniqueID:(id)a3
{
}

- (void)setAdamID:(int64_t)a3
{
  self->_adamID = a3;
}

- (void)setUniversalCloudLibraryID:(id)a3
{
}

- (void)setSubscriptionAdamID:(int64_t)a3
{
  self->_subscriptionAdamID = a3;
}

- (void)setReportingAdamID:(int64_t)a3
{
  self->_reportingAdamID = a3;
}

- (void)setPurchasedAdamID:(int64_t)a3
{
  self->_purchasedAdamID = a3;
}

- (void)setLyricsAdamID:(int64_t)a3
{
  self->_lyricsAdamID = a3;
}

- (NSString)recommendationID
{
  return self->_recommendationID;
}

- (NSString)personID
{
  return self->_personID;
}

- (MPIdentifierSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetCodingKeyModelKind"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPIdentifierSetCodingKeySources"];

  id v10 = [v9 arrayByAddingObject:@"Decoded"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__MPIdentifierSet_initWithCoder___block_invoke;
  v14[3] = &unk_1E57FA3B8;
  id v15 = v4;
  id v11 = v4;
  uint64_t v12 = [(MPIdentifierSet *)self _initWithSources:v10 modelKind:v5 block:v14];

  return v12;
}

void __33__MPIdentifierSet_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetContainerUniqueID"];
  [v3 setContainerUniqueID:v4];

  v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetHandoffCorrelationID"];
  [v3 setHandoffCorrelationID:v5];

  id v6 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetContentItemID"];
  [v3 setContentItemID:v6];

  uint64_t v7 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetLyricsID"];
  [v3 setLyricsID:v7];

  objc_msgSend(v3, "setShouldExcludeFromShuffle:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"MPIdentifierSetShouldExcludeFromShuffle"));
  objc_msgSend(v3, "setPlaceholder:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"MPIdentifierSetIsPlaceholder"));
  id v8 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetVendorID"];
  [v3 setVendorID:v8];

  objc_msgSend(v3, "musicKit_setPossibleLibraryPersistentID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"_MPIdentifierSetCodingKeyMusicKitPossibleLibraryPersistentID"));
  id v9 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetOpaqueID"];
  [v3 setOpaqueID:v9];

  id v10 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetVersionHash"];
  [v3 setVersionHash:v10];

  id v11 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetCodingKeyDatabaseID"];
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_2;
    v19[3] = &unk_1E57F96A0;
    id v20 = *(id *)(a1 + 32);
    [v3 setLibraryIdentifiersWithDatabaseID:v11 block:v19];
  }
  uint64_t v12 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetCodingKeyPersonID"];
  if (v12)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_3;
    v17[3] = &unk_1E57F96C8;
    id v18 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v12 block:v17];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_4;
  v15[3] = &unk_1E57FA390;
  id v16 = *(id *)(a1 + 32);
  [v3 setUniversalStoreIdentifiersWithBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_5;
  v13[3] = &unk_1E57F96F0;
  id v14 = *(id *)(a1 + 32);
  [v3 setRadioIdentifiersWithBlock:v13];
}

- (void)setVersionHash:(id)a3
{
}

- (void)setOpaqueID:(id)a3
{
}

- (void)setLyricsID:(id)a3
{
}

- (void)setHandoffCorrelationID:(id)a3
{
}

- (void)setPersonalStoreIdentifiersWithPersonID:(id)a3 block:(id)a4
{
  id v14 = (NSString *)a3;
  uint64_t v7 = (void (**)(id, MPIdentifierSet *))a4;
  if (![(NSString *)v14 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPIdentifierSet.m", 865, @"Invalid parameter not satisfying: %@", @"personID.length > 0" object file lineNumber description];
  }
  id v8 = self->_personID;
  if (v8 == v14)
  {
  }
  else
  {
    id v9 = v8;
    char v10 = [(NSString *)v8 isEqual:v14];

    if ((v10 & 1) == 0) {
      [(MPIdentifierSet *)self clearPersonalStoreIdentifiers];
    }
  }
  id v11 = (NSString *)[(NSString *)v14 copy];
  personID = self->_personID;
  self->_personID = v11;

  v7[2](v7, self);
}

- (void)clearPersonalStoreIdentifiers
{
  personID = self->_personID;
  self->_personID = 0;

  cloudAlbumID = self->_cloudAlbumID;
  self->_cloudID = 0;
  self->_cloudAlbumID = 0;

  cloudArtistID = self->_cloudArtistID;
  self->_cloudArtistID = 0;

  recommendationID = self->_recommendationID;
  self->_recommendationID = 0;
}

- (void)setShouldExcludeFromShuffle:(BOOL)a3
{
  self->_shouldExcludeFromShuffle = a3;
}

- (int64_t)adamID
{
  return self->_adamID;
}

- (void)setAssetAdamID:(int64_t)a3
{
  self->_assetAdamID = a3;
}

- (BOOL)intersectsSet:(id)a3
{
  id v4 = (MPIdentifierSet *)a3;
  v5 = v4;
  if (self != v4)
  {
    if (!self->_modelKind) {
      goto LABEL_15;
    }
    id v6 = [(MPIdentifierSet *)v4 modelKind];

    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = [(MPModelKind *)self->_modelKind modelClass];
    if (v7 == (objc_class *)objc_opt_class()) {
      goto LABEL_15;
    }
    id v8 = [(MPModelKind *)self->_modelKind modelClass];
    if (v8 == (objc_class *)objc_opt_class()) {
      goto LABEL_15;
    }
    id v9 = [(MPModelKind *)self->_modelKind modelClass];
    if (v9 == (objc_class *)objc_opt_class()) {
      goto LABEL_15;
    }
    char v10 = [(MPIdentifierSet *)v5 modelKind];
    uint64_t v11 = [v10 modelClass];
    if (v11 != objc_opt_class())
    {
      uint64_t v12 = [(MPIdentifierSet *)v5 modelKind];
      uint64_t v13 = [v12 modelClass];
      if (v13 != objc_opt_class())
      {
        id v14 = [(MPIdentifierSet *)v5 modelKind];
        uint64_t v15 = [v14 modelClass];
        uint64_t v16 = objc_opt_class();

        if (v15 != v16)
        {
          v17 = [(MPModelKind *)self->_modelKind identityKind];
          id v18 = [(MPIdentifierSet *)v5 modelKind];
          v19 = [v18 identityKind];
          char v20 = [v17 isEqual:v19];

          if ((v20 & 1) == 0) {
            goto LABEL_27;
          }
        }
LABEL_15:
        uint64_t v21 = [(MPIdentifierSet *)self containerUniqueID];
        if (v21)
        {
          v22 = (void *)v21;
          v23 = [(MPIdentifierSet *)v5 containerUniqueID];

          if (v23)
          {
            v24 = [(MPIdentifierSet *)self containerUniqueID];
            v25 = [(MPIdentifierSet *)v5 containerUniqueID];
            int v26 = [v24 isEqualToString:v25];

            if (!v26)
            {
LABEL_27:
              LOBYTE(self) = 0;
              goto LABEL_42;
            }
          }
        }
        uint64_t v27 = [(MPIdentifierSet *)self handoffCorrelationID];
        if (v27)
        {
          v28 = (void *)v27;
          v29 = [(MPIdentifierSet *)v5 handoffCorrelationID];

          if (v29)
          {
            v30 = [(MPIdentifierSet *)self handoffCorrelationID];
            uint64_t v31 = [(MPIdentifierSet *)v5 handoffCorrelationID];
LABEL_40:
            v48 = (void *)v31;
            LOBYTE(self) = [v30 isEqualToString:v31];
LABEL_41:

            goto LABEL_42;
          }
        }
        uint64_t v32 = [(MPIdentifierSet *)self contentItemID];
        if (v32)
        {
          v33 = (void *)v32;
          v34 = [(MPIdentifierSet *)v5 contentItemID];

          if (v34)
          {
            v30 = [(MPIdentifierSet *)self contentItemID];
            uint64_t v31 = [(MPIdentifierSet *)v5 contentItemID];
            goto LABEL_40;
          }
        }
        uint64_t v35 = [(MPIdentifierSet *)self lyricsID];
        if (v35)
        {
          v36 = (void *)v35;
          v37 = [(MPIdentifierSet *)v5 lyricsID];

          if (v37)
          {
            v30 = [(MPIdentifierSet *)self lyricsID];
            uint64_t v31 = [(MPIdentifierSet *)v5 lyricsID];
            goto LABEL_40;
          }
        }
        uint64_t v38 = [(MPIdentifierSet *)self vendorID];
        if (v38)
        {
          v39 = (void *)v38;
          v40 = [(MPIdentifierSet *)v5 vendorID];

          if (v40)
          {
            v30 = [(MPIdentifierSet *)self vendorID];
            uint64_t v31 = [(MPIdentifierSet *)v5 vendorID];
            goto LABEL_40;
          }
        }
        if ([(MPIdentifierSet *)self musicKit_possibleLibraryPersistentID]
          && [(MPIdentifierSet *)v5 musicKit_possibleLibraryPersistentID])
        {
          int64_t v41 = [(MPIdentifierSet *)self musicKit_possibleLibraryPersistentID];
          LOBYTE(self) = v41 == [(MPIdentifierSet *)v5 musicKit_possibleLibraryPersistentID];
          goto LABEL_42;
        }
        uint64_t v42 = [(MPIdentifierSet *)self opaqueID];
        if (v42)
        {
          v43 = (void *)v42;
          v44 = [(MPIdentifierSet *)v5 opaqueID];

          if (v44)
          {
            v30 = [(MPIdentifierSet *)self opaqueID];
            uint64_t v31 = [(MPIdentifierSet *)v5 opaqueID];
            goto LABEL_40;
          }
        }
        uint64_t v45 = [(MPIdentifierSet *)self versionHash];
        if (v45)
        {
          v46 = (void *)v45;
          v47 = [(MPIdentifierSet *)v5 versionHash];

          if (v47)
          {
            v30 = [(MPIdentifierSet *)self versionHash];
            uint64_t v31 = [(MPIdentifierSet *)v5 versionHash];
            goto LABEL_40;
          }
        }
        v30 = [(MPIdentifierSet *)self library];
        uint64_t v50 = [(MPIdentifierSet *)v5 library];
        v48 = (void *)v50;
        if (v30)
        {
          if (v50)
          {
            v51 = [v30 databaseID];
            v52 = [v48 databaseID];
            int v53 = [v51 isEqual:v52];

            if (v53)
            {
              if ([v30 persistentID] && objc_msgSend(v48, "persistentID"))
              {
                self = (MPIdentifierSet *)[v30 persistentID];
                v54 = (MPIdentifierSet *)[v48 persistentID];
LABEL_55:
                LOBYTE(self) = self == v54;
                goto LABEL_41;
              }
              if ([v30 containedPersistentID] && objc_msgSend(v48, "containedPersistentID"))
              {
                self = (MPIdentifierSet *)[v30 containedPersistentID];
                v54 = (MPIdentifierSet *)[v48 containedPersistentID];
                goto LABEL_55;
              }
              if ([v30 syncID] && objc_msgSend(v48, "syncID"))
              {
                self = (MPIdentifierSet *)[v30 syncID];
                v54 = (MPIdentifierSet *)[v48 syncID];
                goto LABEL_55;
              }
            }
          }
        }
        v55 = [(MPIdentifierSet *)self personalizedStore];
        uint64_t v56 = [(MPIdentifierSet *)v5 personalizedStore];
        v57 = (void *)v56;
        if (v55)
        {
          if (v56)
          {
            v58 = [v55 personID];
            v59 = [v57 personID];
            int v60 = [v58 isEqual:v59];

            if (v60)
            {
              if ([v55 cloudID] && objc_msgSend(v57, "cloudID"))
              {
                self = (MPIdentifierSet *)[v55 cloudID];
                LOBYTE(self) = self == (MPIdentifierSet *)[v57 cloudID];
LABEL_137:

                goto LABEL_41;
              }
              uint64_t v61 = [v55 cloudAlbumID];
              if (v61)
              {
                v62 = (void *)v61;
                v63 = [v57 cloudAlbumID];

                if (v63)
                {
                  v64 = [v55 cloudAlbumID];
                  uint64_t v65 = [v57 cloudAlbumID];
LABEL_71:
                  v72 = (void *)v65;
                  LOBYTE(self) = [v64 isEqualToString:v65];
LABEL_136:

                  goto LABEL_137;
                }
              }
              uint64_t v66 = [v55 recommendationID];
              if (v66)
              {
                v67 = (void *)v66;
                v68 = [v57 recommendationID];

                if (v68)
                {
                  v64 = [v55 recommendationID];
                  uint64_t v65 = [v57 recommendationID];
                  goto LABEL_71;
                }
              }
              uint64_t v69 = [v55 cloudArtistID];
              if (v69)
              {
                v70 = (void *)v69;
                v71 = [v57 cloudArtistID];

                if (v71)
                {
                  v64 = [v55 cloudArtistID];
                  uint64_t v65 = [v57 cloudArtistID];
                  goto LABEL_71;
                }
              }
            }
          }
        }
        v64 = [(MPIdentifierSet *)self universalStore];
        uint64_t v73 = [(MPIdentifierSet *)v5 universalStore];
        v72 = (void *)v73;
        if (v64 && v73)
        {
          uint64_t v74 = [v64 globalPlaylistID];
          if (v74)
          {
            v75 = (void *)v74;
            v76 = [v72 globalPlaylistID];

            if (v76)
            {
              v77 = [v64 globalPlaylistID];
              uint64_t v78 = [v72 globalPlaylistID];
LABEL_89:
              v91 = (void *)v78;
              LOBYTE(self) = [v77 isEqualToString:v78];
LABEL_135:

              goto LABEL_136;
            }
          }
          uint64_t v79 = [v64 universalCloudLibraryID];
          if (v79)
          {
            v80 = (void *)v79;
            v81 = [v72 universalCloudLibraryID];

            if (v81)
            {
              v77 = [v64 universalCloudLibraryID];
              uint64_t v78 = [v72 universalCloudLibraryID];
              goto LABEL_89;
            }
          }
          uint64_t v82 = [v64 socialProfileID];
          if (v82)
          {
            v83 = (void *)v82;
            v84 = [v72 socialProfileID];

            if (v84)
            {
              v77 = [v64 socialProfileID];
              uint64_t v78 = [v72 socialProfileID];
              goto LABEL_89;
            }
          }
          uint64_t v85 = [v64 informalMediaClipID];
          if (v85)
          {
            v86 = (void *)v85;
            v87 = [v72 informalMediaClipID];

            if (v87)
            {
              v77 = [v64 informalMediaClipID];
              uint64_t v78 = [v72 informalMediaClipID];
              goto LABEL_89;
            }
          }
          uint64_t v88 = [v64 informalStaticAssetID];
          if (v88)
          {
            v89 = (void *)v88;
            v90 = [v72 informalStaticAssetID];

            if (v90)
            {
              v77 = [v64 informalStaticAssetID];
              uint64_t v78 = [v72 informalStaticAssetID];
              goto LABEL_89;
            }
          }
          v126 = v57;
          v92 = (void *)MEMORY[0x1E4F1CA80];
          v93 = objc_msgSend(v64, "formerAdamIDs", v48);
          v77 = objc_msgSend(v92, "setWithCapacity:", objc_msgSend(v93, "count") + 6);

          v94 = [v64 formerAdamIDs];
          [v77 addObjectsFromArray:v94];

          if ([v64 subscriptionAdamID])
          {
            v95 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "subscriptionAdamID"));
            [v77 addObject:v95];
          }
          if ([v64 purchasedAdamID])
          {
            v96 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "purchasedAdamID"));
            [v77 addObject:v96];
          }
          if ([v64 adamID])
          {
            v97 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "adamID"));
            [v77 addObject:v97];
          }
          if ([v64 reportingAdamID])
          {
            v98 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "reportingAdamID"));
            [v77 addObject:v98];
          }
          if ([v64 assetAdamID])
          {
            v99 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "assetAdamID"));
            [v77 addObject:v99];
          }
          if ([v64 lyricsAdamID])
          {
            v100 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v64, "lyricsAdamID"));
            [v77 addObject:v100];
          }
          v101 = (void *)MEMORY[0x1E4F1CA80];
          v102 = [v72 formerAdamIDs];
          v91 = objc_msgSend(v101, "setWithCapacity:", objc_msgSend(v102, "count") + 6);

          v103 = [v72 formerAdamIDs];
          [v91 addObjectsFromArray:v103];

          if ([v72 subscriptionAdamID])
          {
            v104 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "subscriptionAdamID"));
            [v91 addObject:v104];
          }
          v57 = v126;
          if ([v72 purchasedAdamID])
          {
            v105 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "purchasedAdamID"));
            [v91 addObject:v105];
          }
          if ([v72 adamID])
          {
            v106 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "adamID"));
            [v91 addObject:v106];
          }
          if ([v72 reportingAdamID])
          {
            v107 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "reportingAdamID"));
            [v91 addObject:v107];
          }
          if ([v72 assetAdamID])
          {
            v108 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "assetAdamID"));
            [v91 addObject:v108];
          }
          if ([v72 lyricsAdamID])
          {
            v109 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v72, "lyricsAdamID"));
            [v91 addObject:v109];
          }
          if ([v77 count] && objc_msgSend(v91, "count"))
          {
            LOBYTE(self) = [v77 intersectsSet:v91];
LABEL_134:
            v48 = v125;
            goto LABEL_135;
          }

          v48 = v125;
        }
        v77 = [(MPIdentifierSet *)self radio];
        uint64_t v110 = [(MPIdentifierSet *)v5 radio];
        v91 = (void *)v110;
        LOBYTE(self) = 0;
        if (!v77 || !v110) {
          goto LABEL_135;
        }
        v125 = v48;
        v127 = v57;
        uint64_t v111 = [v77 stationStringID];
        if (v111
          && (v112 = (void *)v111,
              [v91 stationStringID],
              v113 = objc_claimAutoreleasedReturnValue(),
              v113,
              v112,
              v113))
        {
          v114 = [v77 stationStringID];
          v115 = [v91 stationStringID];
          LOBYTE(self) = [v114 isEqualToString:v115];
        }
        else
        {
          uint64_t v116 = [v77 stationHash];
          if (v116
            && (v117 = (void *)v116,
                [v91 stationHash],
                v118 = objc_claimAutoreleasedReturnValue(),
                v118,
                v117,
                v118))
          {
            v119 = [v77 stationHash];
            v120 = [v91 stationHash];
            LOBYTE(self) = [v119 isEqualToString:v120];
          }
          else
          {
            if (![v77 stationID] || !objc_msgSend(v91, "stationID"))
            {
              self = [v77 stationEventID];
              v57 = v127;
              if (self)
              {
                v122 = [v91 stationEventID];

                if (v122)
                {
                  v123 = [v77 stationEventID];
                  v124 = [v91 stationEventID];
                  LOBYTE(self) = [v123 isEqualToString:v124];

                  v57 = v127;
                }
                else
                {
                  LOBYTE(self) = 0;
                }
              }
              goto LABEL_134;
            }
            uint64_t v121 = [v77 stationID];
            LOBYTE(self) = v121 == [v91 stationID];
          }
        }
        v48 = v125;
        v57 = v127;
        goto LABEL_135;
      }
    }
    goto LABEL_15;
  }
  LOBYTE(self) = 1;
LABEL_42:

  return (char)self;
}

- (MPModelKind)modelKind
{
  return self->_modelKind;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (NSString)containerUniqueID
{
  return self->_containerUniqueID;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (NSString)versionHash
{
  return self->_versionHash;
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (NSString)opaqueID
{
  return self->_opaqueID;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (NSString)handoffCorrelationID
{
  return self->_handoffCorrelationID;
}

- (int64_t)musicKit_possibleLibraryPersistentID
{
  return self->_musicKit_possibleLibraryPersistentID;
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetRadioStationStringID"];
  [v4 setStationStringID:v5];

  id v6 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetRadioStationHash"];
  [v4 setStationHash:v6];

  objc_msgSend(v4, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetRadioStationID"));
  id v7 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetRadioStationEventID"];
  [v4 setStationEventID:v7];
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v14 = a2;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetGlobalPlaylistID"];
  [v14 setGlobalPlaylistID:v4];

  objc_msgSend(v14, "setAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetStoreAdamID"));
  v5 = *(void **)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"MPIdentifierSetFormerStoreAdamIDs"];
  [v14 setFormerAdamIDs:v9];

  char v10 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetCloudUniversalLibraryID"];
  [v14 setUniversalCloudLibraryID:v10];

  objc_msgSend(v14, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetStorePurchasedAdamID"));
  objc_msgSend(v14, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetStoreSubscriptionAdamID"));
  uint64_t v11 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetSocialProfileID"];
  [v14 setSocialProfileID:v11];

  uint64_t v12 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetInformalMediaClipID"];
  [v14 setInformalMediaClipID:v12];

  uint64_t v13 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetInformalStaticAssetID"];
  [v14 setInformalStaticAssetID:v13];

  objc_msgSend(v14, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetReportingAdamID"));
  objc_msgSend(v14, "setAssetAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetAssetAdamID"));
  objc_msgSend(v14, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"MPIdentifierSetLyricsAdamID"));
}

- (void)setGlobalPlaylistID:(id)a3
{
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v3, "decodeInt64ForKey:", @"MPIdentifierSetStoreCloudID"));
  v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetStoreCloudAlbumID"];
  [v4 setCloudAlbumID:v5];

  id v6 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetStoreCloudArtistID"];
  [v4 setCloudArtistID:v6];

  id v7 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"MPIdentifierSetStoreRecommendationID"];
  [v4 setRecommendationID:v7];
}

- (void)setRecommendationID:(id)a3
{
}

- (void)setCloudAlbumID:(id)a3
{
}

- (void)setCloudID:(unint64_t)a3
{
  self->_cloudID = a3;
}

- (void)setCloudArtistID:(id)a3
{
}

- (void)setStationStringID:(id)a3
{
}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (void)setStationHash:(id)a3
{
}

- (void)setStationEventID:(id)a3
{
}

- (void)setSocialProfileID:(id)a3
{
}

- (void)setRadioIdentifiersWithBlock:(id)a3
{
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setInformalStaticAssetID:(id)a3
{
}

- (void)setInformalMediaClipID:(id)a3
{
}

- (void)setFormerAdamIDs:(id)a3
{
}

- (void)musicKit_setPossibleLibraryPersistentID:(int64_t)a3
{
  self->_musicKit_possibleLibraryPersistentID = a3;
}

- (NSString)universalCloudLibraryID
{
  return self->_universalCloudLibraryID;
}

- (int64_t)purchasedAdamID
{
  return self->_purchasedAdamID;
}

- (NSArray)formerAdamIDs
{
  return self->_formerAdamIDs;
}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (NSString)description
{
  id v3 = +[MPIdentifierSet emptyIdentifierSet];

  if (v3 == self)
  {
    char v10 = @"<MPIdentifierSet EMPTY>";
  }
  else
  {
    id v4 = [(MPIdentifierSet *)self identifierDescriptions:0];
    uint64_t v5 = [v4 count];
    id v6 = NSString;
    if (v5)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = [(NSArray *)self->_sources msv_compactDescription];
      id v9 = [v4 componentsJoinedByString:@"; "];
      [v6 stringWithFormat:@"<%@ sources=[%@] %@>", v7, v8, v9];
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = [(NSArray *)self->_sources msv_compactDescription];
      [v6 stringWithFormat:@"<MPIdentifierSet EMPTY (not-singleton) sources=[%@]>", v8];
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v10;
}

- (NSString)humanDescription
{
  id v3 = +[MPIdentifierSet emptyIdentifierSet];

  if (v3 == self)
  {
    id v9 = @"<MPIdentifierSet EMPTY>";
  }
  else
  {
    id v4 = [(MPIdentifierSet *)self identifierDescriptions:1];
    uint64_t v5 = [v4 count];
    id v6 = NSString;
    if (v5)
    {
      uint64_t v7 = [v4 componentsJoinedByString:@" "];
      id v8 = [(NSArray *)self->_sources msv_compactDescription];
      id v9 = [v6 stringWithFormat:@"(%@) from [%@]", v7, v8];
    }
    else
    {
      uint64_t v7 = [(NSArray *)self->_sources msv_compactDescription];
      [v6 stringWithFormat:@"<MPIdentifierSet EMPTY (not-singleton) sources=[%@]>", v7];
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v9;
}

+ (MPIdentifierSet)emptyIdentifierSet
{
  if (emptyIdentifierSet_sOnceToken != -1) {
    dispatch_once(&emptyIdentifierSet_sOnceToken, &__block_literal_global_53789);
  }
  v2 = (void *)emptyIdentifierSet_sEmptyIdentifierSet;

  return (MPIdentifierSet *)v2;
}

- (id)identifierDescriptions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  id v6 = v5;
  if (self->_placeholder) {
    [v5 addObject:@"placeholder=YES"];
  }
  if ([(NSString *)self->_databaseID length])
  {
    uint64_t v7 = [NSString stringWithFormat:@"databaseID=\"%@\"", self->_databaseID];
    [v6 addObject:v7];
  }
  if ([(NSString *)self->_personID length])
  {
    id v8 = [NSString stringWithFormat:@"personID=\"%@\"", self->_personID];
    [v6 addObject:v8];
  }
  if (self->_persistentID)
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"persistentID=%lld", self->_persistentID);
    [v6 addObject:v9];
  }
  if (self->_containedPersistentID)
  {
    char v10 = objc_msgSend(NSString, "stringWithFormat:", @"containedPersistentID=%lld", self->_containedPersistentID);
    [v6 addObject:v10];
  }
  if (self->_musicKit_possibleLibraryPersistentID)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"musicKit_possibleLibraryPersistentID=%lld", self->_musicKit_possibleLibraryPersistentID);
    [v6 addObject:v11];
  }
  if (self->_adamID)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"storeAdamID=%lld", self->_adamID);
    [v6 addObject:v12];
  }
  if ([(NSString *)self->_cloudAlbumID length])
  {
    uint64_t v13 = [NSString stringWithFormat:@"storeCloudAlbumID=\"%@\"", self->_cloudAlbumID];
    [v6 addObject:v13];
  }
  if ([(NSString *)self->_cloudArtistID length])
  {
    id v14 = [NSString stringWithFormat:@"storeCloudArtistID=\"%@\"", self->_cloudArtistID];
    [v6 addObject:v14];
  }
  if (self->_cloudID)
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"storeCloudID=%lld", self->_cloudID);
    [v6 addObject:v15];
  }
  if ([(NSString *)self->_universalCloudLibraryID length])
  {
    uint64_t v16 = [NSString stringWithFormat:@"cloudUniversalLibraryID=\"%@\"", self->_universalCloudLibraryID];
    [v6 addObject:v16];
  }
  if (self->_purchasedAdamID)
  {
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"storePurchasedAdamID=%lld", self->_purchasedAdamID);
    [v6 addObject:v17];
  }
  if ([(NSArray *)self->_formerAdamIDs count])
  {
    id v18 = NSString;
    v19 = [(NSArray *)self->_formerAdamIDs componentsJoinedByString:@", "];
    char v20 = [v18 stringWithFormat:@"formerStoreAdamIDs=[%@]", v19];
    [v6 addObject:v20];
  }
  if (self->_subscriptionAdamID)
  {
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"storeSubscriptionAdamID=%lld", self->_subscriptionAdamID);
    [v6 addObject:v21];
  }
  if ([(NSString *)self->_stationStringID length])
  {
    v22 = [NSString stringWithFormat:@"radioStationStringID=\"%@\"", self->_stationStringID];
    [v6 addObject:v22];
  }
  if (self->_stationID)
  {
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"radioStationID=%lld", self->_stationID);
    [v6 addObject:v23];
  }
  if ([(NSString *)self->_stationHash length])
  {
    v24 = [NSString stringWithFormat:@"radioStationHash=\"%@\"", self->_stationHash];
    [v6 addObject:v24];
  }
  if ([(NSString *)self->_stationEventID length])
  {
    v25 = [NSString stringWithFormat:@"radioStationEventID=\"%@\"", self->_stationEventID];
    [v6 addObject:v25];
  }
  if ([(NSString *)self->_globalPlaylistID length])
  {
    int v26 = [NSString stringWithFormat:@"globalPlaylistID=\"%@\"", self->_globalPlaylistID];
    [v6 addObject:v26];
  }
  if ([(NSString *)self->_recommendationID length])
  {
    uint64_t v27 = [NSString stringWithFormat:@"storeRecommendationID=\"%@\"", self->_recommendationID];
    [v6 addObject:v27];
  }
  if ([(NSString *)self->_containerUniqueID length])
  {
    v28 = [NSString stringWithFormat:@"containerUniqueID=\"%@\"", self->_containerUniqueID];
    [v6 addObject:v28];
  }
  if ([(NSString *)self->_handoffCorrelationID length])
  {
    v29 = [NSString stringWithFormat:@"handoffCorrelationID=\"%@\"", self->_handoffCorrelationID];
    [v6 addObject:v29];
  }
  if ([(NSString *)self->_contentItemID length])
  {
    v30 = [NSString stringWithFormat:@"contentItemID=\"%@\"", self->_contentItemID];
    [v6 addObject:v30];
  }
  if ([(NSString *)self->_lyricsID length])
  {
    uint64_t v31 = [NSString stringWithFormat:@"lyricsID=\"%@\"", self->_lyricsID];
    [v6 addObject:v31];
  }
  if (self->_shouldExcludeFromShuffle) {
    [v6 addObject:@"shouldExcludeFromShuffle=YES"];
  }
  if ([(NSString *)self->_vendorID length])
  {
    uint64_t v32 = [NSString stringWithFormat:@"vendorID=\"%@\"", self->_vendorID];
    [v6 addObject:v32];
  }
  if ([(NSString *)self->_opaqueID length])
  {
    v33 = [NSString stringWithFormat:@"opaqueID=\"%@\"", self->_opaqueID];
    [v6 addObject:v33];
  }
  if ([(NSString *)self->_versionHash length])
  {
    v34 = [NSString stringWithFormat:@"versionHash=\"%@\"", self->_versionHash];
    [v6 addObject:v34];
  }
  if ([(NSString *)self->_informalMediaClipID length])
  {
    uint64_t v35 = [NSString stringWithFormat:@"informalMediaClipID=\"%@\"", self->_informalMediaClipID];
    [v6 addObject:v35];
  }
  if ([(NSString *)self->_informalStaticAssetID length])
  {
    v36 = [NSString stringWithFormat:@"informalStaticAssetID=\"%@\"", self->_informalStaticAssetID];
    [v6 addObject:v36];
  }
  if (self->_reportingAdamID)
  {
    v37 = objc_msgSend(NSString, "stringWithFormat:", @"reportingAdamID=%lld", self->_reportingAdamID);
    [v6 addObject:v37];
  }
  if (self->_assetAdamID)
  {
    uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"assetAdamID=%lld", self->_assetAdamID);
    [v6 addObject:v38];
  }
  if (self->_lyricsAdamID)
  {
    v39 = objc_msgSend(NSString, "stringWithFormat:", @"lyricsAdamID=%lld", self->_lyricsAdamID);
    [v6 addObject:v39];
  }
  if ([(NSString *)self->_socialProfileID length])
  {
    v40 = [NSString stringWithFormat:@"socialProfileID=\"%@\"", self->_socialProfileID];
    [v6 addObject:v40];
  }
  if (self->_syncID)
  {
    int64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"syncID=%lld", self->_syncID);
    [v6 addObject:v41];
  }
  if ([v6 count])
  {
    uint64_t v42 = NSString;
    modelKind = self->_modelKind;
    if (v3)
    {
      modelKind = [modelKind humanDescription];
    }
    v44 = [v42 stringWithFormat:@"kind=%@", modelKind];
    [v6 addObject:v44];

    if (v3) {
  }
    }
  id v45 = v6;

  return v45;
}

void __37__MPIdentifierSet_emptyIdentifierSet__block_invoke()
{
  v0 = [MPIdentifierSet alloc];
  id v3 = +[MPModelKind unknownKind];
  uint64_t v1 = [(MPIdentifierSet *)v0 _initWithSources:&unk_1EE6EE300 modelKind:v3 block:&__block_literal_global_8_53792];
  v2 = (void *)emptyIdentifierSet_sEmptyIdentifierSet;
  emptyIdentifierSet_sEmptyIdentifierSet = v1;
}

- (NSString)stationEventID
{
  return self->_stationEventID;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

- (NSString)informalStaticAssetID
{
  return self->_informalStaticAssetID;
}

- (NSString)informalMediaClipID
{
  return self->_informalMediaClipID;
}

- (NSString)cloudArtistID
{
  return self->_cloudArtistID;
}

- (void)_setDefaultPersonIDIfNeeded
{
  if (![(NSString *)self->_personID length])
  {
    id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
    id v3 = [v5 accountDSID];
    personID = self->_personID;
    self->_personID = v3;
  }
}

- (id)prioritizedStoreStringIdentifiersForPersonID:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:10];
  id v6 = [(MPIdentifierSet *)self universalStore];
  uint64_t v7 = [v6 globalPlaylistID];

  if ([v7 length]) {
    [v5 addObject:v7];
  }
  id v8 = [(MPIdentifierSet *)self radio];
  id v9 = [v8 stationStringID];

  if ([v9 length]) {
    [v5 addObject:v9];
  }
  char v10 = [(MPIdentifierSet *)self radio];
  uint64_t v11 = [v10 stationEventID];

  if ([v11 length]) {
    [v5 addObject:v11];
  }
  uint64_t v12 = [(MPIdentifierSet *)self universalStore];
  uint64_t v13 = [v12 socialProfileID];

  if ([v13 length]) {
    [v5 addObject:v13];
  }
  id v14 = [(MPIdentifierSet *)self personalizedStore];
  uint64_t v15 = [v14 personID];

  if ([v4 length]
    && [v15 length]
    && [v4 isEqualToString:v15])
  {
    uint64_t v16 = [(MPIdentifierSet *)self universalStore];
    v17 = [v16 universalCloudLibraryID];

    if ([v17 length]) {
      [v5 addObject:v17];
    }
  }
  v47 = v4;
  id v18 = [(MPIdentifierSet *)self universalStore];
  uint64_t v19 = [v18 subscriptionAdamID];

  if (v19)
  {
    char v20 = (char *)&v48 + 1;
    uint64_t quot = v19;
    do
    {
      lldiv_t v22 = lldiv(quot, 10);
      uint64_t quot = v22.quot;
      if (v22.rem >= 0) {
        LOBYTE(v23) = v22.rem;
      }
      else {
        uint64_t v23 = -v22.rem;
      }
      *(v20 - 2) = v23 + 48;
      v24 = (const UInt8 *)(v20 - 2);
      --v20;
    }
    while (v22.quot);
    if (v19 < 0)
    {
      *(v20 - 2) = 45;
      v24 = (const UInt8 *)(v20 - 2);
    }
    v25 = (__CFString *)CFStringCreateWithBytes(0, v24, (char *)&v48 - (char *)v24, 0x8000100u, 0);
    [v5 addObject:v25];
  }
  int v26 = [(MPIdentifierSet *)self universalStore];
  uint64_t v27 = [v26 adamID];

  if (v27 && v27 != v19)
  {
    v28 = (char *)&v48 + 1;
    uint64_t v29 = v27;
    do
    {
      lldiv_t v30 = lldiv(v29, 10);
      uint64_t v29 = v30.quot;
      if (v30.rem >= 0) {
        LOBYTE(v31) = v30.rem;
      }
      else {
        uint64_t v31 = -v30.rem;
      }
      *(v28 - 2) = v31 + 48;
      uint64_t v32 = (const UInt8 *)(v28 - 2);
      --v28;
    }
    while (v30.quot);
    if (v27 < 0)
    {
      *(v28 - 2) = 45;
      uint64_t v32 = (const UInt8 *)(v28 - 2);
    }
    v33 = (__CFString *)CFStringCreateWithBytes(0, v32, (char *)&v48 - (char *)v32, 0x8000100u, 0);
    [v5 addObject:v33];
  }
  v34 = [(MPIdentifierSet *)self universalStore];
  uint64_t v35 = [v34 purchasedAdamID];

  if (v35 && v35 != v27 && v35 != v19)
  {
    v36 = (char *)&v48 + 1;
    uint64_t v37 = v35;
    do
    {
      lldiv_t v38 = lldiv(v37, 10);
      uint64_t v37 = v38.quot;
      if (v38.rem >= 0) {
        LOBYTE(v39) = v38.rem;
      }
      else {
        uint64_t v39 = -v38.rem;
      }
      *(v36 - 2) = v39 + 48;
      v40 = (const UInt8 *)(v36 - 2);
      --v36;
    }
    while (v38.quot);
    if (v35 < 0)
    {
      *(v36 - 2) = 45;
      v40 = (const UInt8 *)(v36 - 2);
    }
    int64_t v41 = (__CFString *)CFStringCreateWithBytes(0, v40, (char *)&v48 - (char *)v40, 0x8000100u, 0);
    [v5 addObject:v41];
  }
  uint64_t v42 = [(MPIdentifierSet *)self opaqueID];
  if ([v42 length]) {
    [v5 addObject:v42];
  }
  v43 = [v5 array];
  v44 = (void *)[v43 copy];

  return v44;
}

- (id)preferredStoreStringIdentifierForPersonID:(id)a3
{
  id v3 = [(MPIdentifierSet *)self prioritizedStoreStringIdentifiersForPersonID:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)_stateDumpObject
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[MPIdentifierSet emptyIdentifierSet];

  if (v3 == self)
  {
    id v8 = @"<EMPTY>";
  }
  else
  {
    id v4 = [(MPIdentifierSet *)self identifierDescriptions:0];
    sources = self->_sources;
    v10[0] = @"sources";
    v10[1] = @"identifiers";
    v11[0] = sources;
    uint64_t v6 = [(__CFString *)v4 count];
    uint64_t v7 = @"@";
    if (v6) {
      uint64_t v7 = v4;
    }
    v11[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }

  return v8;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_subscriptionAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_purchasedAdamID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_purchasedAdamID;
}

- (void)setStoreRecommendationID:(id)a3
{
  id v4 = a3;
  [(MPIdentifierSet *)self _setDefaultPersonIDIfNeeded];
  id v5 = (NSString *)[v4 copy];

  recommendationID = self->_recommendationID;
  self->_recommendationID = v5;
}

- (NSString)storeRecommendationID
{
  return self->_recommendationID;
}

- (void)setStoreCloudArtistID:(id)a3
{
  id v4 = a3;
  [(MPIdentifierSet *)self _setDefaultPersonIDIfNeeded];
  id v5 = (NSString *)[v4 copy];

  cloudArtistID = self->_cloudArtistID;
  self->_cloudArtistID = v5;
}

- (id)storeCloudArtistID
{
  return self->_cloudArtistID;
}

- (void)setStoreCloudAlbumID:(id)a3
{
  id v4 = a3;
  [(MPIdentifierSet *)self _setDefaultPersonIDIfNeeded];
  id v5 = (NSString *)[v4 copy];

  cloudAlbumID = self->_cloudAlbumID;
  self->_cloudAlbumID = v5;
}

- (NSString)storeCloudAlbumID
{
  return self->_cloudAlbumID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  universalCloudLibraryID = self->_universalCloudLibraryID;
  self->_universalCloudLibraryID = v4;
}

- (NSString)cloudUniversalLibraryID
{
  return self->_universalCloudLibraryID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_cloudID = a3;
}

- (unint64_t)storeCloudID
{
  return self->_cloudID;
}

- (void)setFormerStoreAdamIDs:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  formerAdamIDs = self->_formerAdamIDs;
  self->_formerAdamIDs = v4;
}

- (NSArray)formerStoreAdamIDs
{
  return self->_formerAdamIDs;
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_adamID = a3;
}

- (int64_t)storeAdamID
{
  return self->_adamID;
}

- (void)setRadioStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (int64_t)radioStationID
{
  return self->_stationID;
}

- (void)setRadioStationHash:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  stationHash = self->_stationHash;
  self->_stationHash = v4;
}

- (NSString)radioStationHash
{
  return self->_stationHash;
}

- (void)setRadioStationStringID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  stationStringID = self->_stationStringID;
  self->_stationStringID = v4;
}

- (NSString)radioStationStringID
{
  return self->_stationStringID;
}

- (void)setDeviceLibraryPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (int64_t)deviceLibraryPersistentID
{
  return self->_persistentID;
}

- (void)clearRadioIdentifiers
{
  stationStringID = self->_stationStringID;
  self->_stationStringID = 0;

  stationHash = self->_stationHash;
  self->_stationHash = 0;

  stationEventID = self->_stationEventID;
  self->_stationID = 0;
  self->_stationEventID = 0;
}

- (void)setModelKind:(id)a3
{
  id v4 = (MPModelKind *)[a3 copy];
  modelKind = self->_modelKind;
  self->_modelKind = v4;
}

- (void)clearUniversalStoreIdentifiers
{
  globalPlaylistID = self->_globalPlaylistID;
  self->_globalPlaylistID = 0;

  formerAdamIDs = self->_formerAdamIDs;
  id v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  self->_adamID = 0;
  self->_formerAdamIDs = v5;

  universalCloudLibraryID = self->_universalCloudLibraryID;
  self->_universalCloudLibraryID = 0;

  self->_purchasedAdamID = 0;
  self->_subscriptionAdamID = 0;
  socialProfileID = self->_socialProfileID;
  self->_socialProfileID = 0;

  informalMediaClipID = self->_informalMediaClipID;
  self->_informalMediaClipID = 0;

  informalStaticAssetID = self->_informalStaticAssetID;
  self->_informalStaticAssetID = 0;

  self->_reportingAdamID = 0;
  self->_assetAdamID = 0;
  self->_lyricsAdamID = 0;
}

- (id)unionSet:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
LABEL_10:
    v17 = self;
    goto LABEL_11;
  }
  id v8 = +[MPIdentifierSet emptyIdentifierSet];
  if (v8 == self)
  {
  }
  else
  {
    id v9 = v8;
    BOOL v10 = [(MPIdentifierSet *)self isEqual:v8];

    if (!v10)
    {
      id v11 = +[MPIdentifierSet emptyIdentifierSet];
      if (v11 == v6)
      {
      }
      else
      {
        uint64_t v12 = v11;
        int v13 = [v6 isEqual:v11];

        if (!v13)
        {
          id v14 = [v6 sources];
          uint64_t v15 = [&unk_1EE6EE390 arrayByAddingObjectsFromArray:v14];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __34__MPIdentifierSet_unionSet_block___block_invoke;
          v19[3] = &unk_1E57F9678;
          id v20 = v6;
          id v21 = v7;
          uint64_t v16 = [(MPIdentifierSet *)self _copyWithSources:v15 block:v19];

          goto LABEL_12;
        }
      }
      goto LABEL_10;
    }
  }
  v17 = (MPIdentifierSet *)v6;
LABEL_11:
  uint64_t v16 = v17;
LABEL_12:

  return v16;
}

void __34__MPIdentifierSet_unionSet_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 280);
  if (v4)
  {
    id v5 = +[MPModelKind unknownKind];
    if (v4 == v5)
    {
    }
    else
    {
      id v6 = v5;
      char v7 = [v4 isEqual:v5];

      if ((v7 & 1) == 0) {
        objc_storeStrong(v3 + 35, *(id *)(*(void *)(a1 + 32) + 280));
      }
    }
  }
  id v8 = [*(id *)(a1 + 32) containerUniqueID];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) containerUniqueID];
    [v3 setContainerUniqueID:v9];
  }
  BOOL v10 = [*(id *)(a1 + 32) handoffCorrelationID];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) handoffCorrelationID];
    [v3 setHandoffCorrelationID:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) contentItemID];

  if (v12)
  {
    int v13 = [*(id *)(a1 + 32) contentItemID];
    [v3 setContentItemID:v13];
  }
  id v14 = [*(id *)(a1 + 32) lyricsID];

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 32) lyricsID];
    [v3 setLyricsID:v15];
  }
  uint64_t v16 = [*(id *)(a1 + 32) vendorID];

  if (v16)
  {
    v17 = [*(id *)(a1 + 32) vendorID];
    [v3 setVendorID:v17];
  }
  id v18 = [*(id *)(a1 + 32) opaqueID];

  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 32) opaqueID];
    [v3 setOpaqueID:v19];
  }
  id v20 = [*(id *)(a1 + 32) versionHash];

  if (v20)
  {
    id v21 = [*(id *)(a1 + 32) versionHash];
    [v3 setVersionHash:v21];
  }
  if (objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID")) {
    objc_msgSend(v3, "musicKit_setPossibleLibraryPersistentID:", objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID"));
  }
  if ([v3 shouldExcludeFromShuffle]) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = [*(id *)(a1 + 32) shouldExcludeFromShuffle];
  }
  [v3 setShouldExcludeFromShuffle:v22];
  if ([v3 isPlaceholder]) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = [*(id *)(a1 + 32) isPlaceholder];
  }
  [v3 setPlaceholder:v23];
  v24 = [*(id *)(a1 + 32) library];
  v25 = v24;
  if (v24)
  {
    int v26 = [v24 databaseID];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_2;
    v42[3] = &unk_1E57F96A0;
    id v43 = v25;
    [v3 setLibraryIdentifiersWithDatabaseID:v26 block:v42];
  }
  uint64_t v27 = [*(id *)(a1 + 32) personalizedStore];
  v28 = v27;
  if (v27)
  {
    uint64_t v29 = [v27 personID];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_3;
    v40[3] = &unk_1E57F96C8;
    id v41 = v28;
    [v3 setPersonalStoreIdentifiersWithPersonID:v29 block:v40];
  }
  lldiv_t v30 = [*(id *)(a1 + 32) universalStore];
  uint64_t v31 = v30;
  if (v30)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_4;
    v38[3] = &unk_1E57FA390;
    id v39 = v30;
    [v3 setUniversalStoreIdentifiersWithBlock:v38];
  }
  uint64_t v32 = [*(id *)(a1 + 32) radio];
  uint64_t v35 = v32;
  if (v32)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_5;
    v36[3] = &unk_1E57F96F0;
    id v37 = v32;
    [v3 setRadioIdentifiersWithBlock:v36];
  }
  (*(void (**)(void, id *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v33, v34);
}

void __34__MPIdentifierSet_unionSet_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) persistentID]) {
    objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  }
  if ([*(id *)(a1 + 32) containedPersistentID]) {
    objc_msgSend(v3, "setContainedPersistentID:", objc_msgSend(*(id *)(a1 + 32), "containedPersistentID"));
  }
  if ([*(id *)(a1 + 32) syncID]) {
    objc_msgSend(v3, "setSyncID:", objc_msgSend(*(id *)(a1 + 32), "syncID"));
  }
}

void __34__MPIdentifierSet_unionSet_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) cloudID]) {
    objc_msgSend(v9, "setCloudID:", objc_msgSend(*(id *)(a1 + 32), "cloudID"));
  }
  id v3 = [*(id *)(a1 + 32) cloudAlbumID];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) cloudAlbumID];
    [v9 setCloudAlbumID:v4];
  }
  id v5 = [*(id *)(a1 + 32) cloudArtistID];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) cloudArtistID];
    [v9 setCloudArtistID:v6];
  }
  char v7 = [*(id *)(a1 + 32) recommendationID];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) recommendationID];
    [v9 setRecommendationID:v8];
  }
}

void __34__MPIdentifierSet_unionSet_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = [*(id *)(a1 + 32) globalPlaylistID];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) globalPlaylistID];
    [v20 setGlobalPlaylistID:v4];
  }
  if ([*(id *)(a1 + 32) adamID]) {
    objc_msgSend(v20, "setAdamID:", objc_msgSend(*(id *)(a1 + 32), "adamID"));
  }
  id v5 = [*(id *)(a1 + 32) formerAdamIDs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    char v7 = (void *)MEMORY[0x1E4F1CA80];
    id v8 = [v20 formerAdamIDs];
    id v9 = [v7 setWithArray:v8];

    BOOL v10 = [*(id *)(a1 + 32) formerAdamIDs];
    [v9 addObjectsFromArray:v10];

    id v11 = [v9 allObjects];
    [v20 setFormerAdamIDs:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) universalCloudLibraryID];

  if (v12)
  {
    int v13 = [*(id *)(a1 + 32) universalCloudLibraryID];
    [v20 setUniversalCloudLibraryID:v13];
  }
  if ([*(id *)(a1 + 32) purchasedAdamID]) {
    objc_msgSend(v20, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
  }
  if ([*(id *)(a1 + 32) subscriptionAdamID]) {
    objc_msgSend(v20, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "subscriptionAdamID"));
  }
  id v14 = [*(id *)(a1 + 32) socialProfileID];

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 32) socialProfileID];
    [v20 setSocialProfileID:v15];
  }
  uint64_t v16 = [*(id *)(a1 + 32) informalMediaClipID];

  if (v16)
  {
    v17 = [*(id *)(a1 + 32) informalMediaClipID];
    [v20 setInformalMediaClipID:v17];
  }
  id v18 = [*(id *)(a1 + 32) informalStaticAssetID];

  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 32) informalStaticAssetID];
    [v20 setInformalStaticAssetID:v19];
  }
  if ([*(id *)(a1 + 32) reportingAdamID]) {
    objc_msgSend(v20, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"));
  }
  if ([*(id *)(a1 + 32) assetAdamID]) {
    objc_msgSend(v20, "setAssetAdamID:", objc_msgSend(*(id *)(a1 + 32), "assetAdamID"));
  }
  if ([*(id *)(a1 + 32) lyricsAdamID]) {
    objc_msgSend(v20, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "lyricsAdamID"));
  }
}

void __34__MPIdentifierSet_unionSet_block___block_invoke_5(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) stationStringID];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) stationStringID];
    [v9 setStationStringID:v4];
  }
  id v5 = [*(id *)(a1 + 32) stationHash];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) stationHash];
    [v9 setStationHash:v6];
  }
  if ([*(id *)(a1 + 32) stationID]) {
    objc_msgSend(v9, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "stationID"));
  }
  char v7 = [*(id *)(a1 + 32) stationEventID];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) stationEventID];
    [v9 setStationEventID:v8];
  }
}

- (id)unionSet:(id)a3
{
  return [(MPIdentifierSet *)self unionSet:a3 block:&__block_literal_global_181_53588];
}

- (BOOL)hasCommonIdentifierWithIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int64_t persistentID = self->_persistentID;
  if (persistentID)
  {
    char v7 = [v4 library];
    uint64_t v8 = [v7 persistentID];

    if (persistentID == v8) {
      goto LABEL_49;
    }
  }
  int64_t adamID = self->_adamID;
  if (adamID)
  {
    BOOL v10 = [v5 universalStore];
    uint64_t v11 = [v10 adamID];

    if (adamID == v11) {
      goto LABEL_49;
    }
  }
  int64_t purchasedAdamID = self->_purchasedAdamID;
  if (purchasedAdamID)
  {
    int v13 = [v5 universalStore];
    uint64_t v14 = [v13 purchasedAdamID];

    if (purchasedAdamID == v14) {
      goto LABEL_49;
    }
  }
  int64_t subscriptionAdamID = self->_subscriptionAdamID;
  if (subscriptionAdamID)
  {
    uint64_t v16 = [v5 universalStore];
    uint64_t v17 = [v16 subscriptionAdamID];

    if (subscriptionAdamID == v17) {
      goto LABEL_49;
    }
  }
  unint64_t cloudID = self->_cloudID;
  if (cloudID)
  {
    uint64_t v19 = [v5 personalizedStore];
    uint64_t v20 = [v19 cloudID];

    if (cloudID == v20) {
      goto LABEL_49;
    }
  }
  universalCloudLibraryID = self->_universalCloudLibraryID;
  if (universalCloudLibraryID)
  {
    uint64_t v22 = [v5 universalStore];
    uint64_t v23 = [v22 universalCloudLibraryID];
    BOOL v24 = [(NSString *)universalCloudLibraryID isEqualToString:v23];

    if (v24) {
      goto LABEL_49;
    }
  }
  int64_t stationID = self->_stationID;
  if (stationID)
  {
    int v26 = [v5 radio];
    uint64_t v27 = [v26 stationID];

    if (stationID == v27) {
      goto LABEL_49;
    }
  }
  stationStringID = self->_stationStringID;
  if (stationStringID)
  {
    uint64_t v29 = [v5 radio];
    lldiv_t v30 = [v29 stationStringID];
    BOOL v31 = [(NSString *)stationStringID isEqualToString:v30];

    if (v31) {
      goto LABEL_49;
    }
  }
  stationEventID = self->_stationEventID;
  if (stationEventID)
  {
    uint64_t v33 = [v5 radio];
    uint64_t v34 = [v33 stationEventID];
    BOOL v35 = [(NSString *)stationEventID isEqualToString:v34];

    if (v35) {
      goto LABEL_49;
    }
  }
  stationHash = self->_stationHash;
  if (stationHash)
  {
    id v37 = [v5 radio];
    lldiv_t v38 = [v37 stationHash];
    BOOL v39 = [(NSString *)stationHash isEqualToString:v38];

    if (v39) {
      goto LABEL_49;
    }
  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID)
  {
    id v41 = [v5 universalStore];
    uint64_t v42 = [v41 globalPlaylistID];
    BOOL v43 = [(NSString *)globalPlaylistID isEqualToString:v42];

    if (v43) {
      goto LABEL_49;
    }
  }
  contentItemID = self->_contentItemID;
  if (contentItemID)
  {
    id v45 = [v5 contentItemID];
    BOOL v46 = [(NSString *)contentItemID isEqualToString:v45];

    if (v46) {
      goto LABEL_49;
    }
  }
  lyricsID = self->_lyricsID;
  if (lyricsID)
  {
    uint64_t v48 = [v5 lyricsID];
    BOOL v49 = [(NSString *)lyricsID isEqualToString:v48];

    if (v49) {
      goto LABEL_49;
    }
  }
  vendorID = self->_vendorID;
  if (vendorID)
  {
    v51 = [v5 vendorID];
    BOOL v52 = [(NSString *)vendorID isEqualToString:v51];

    if (v52) {
      goto LABEL_49;
    }
  }
  opaqueID = self->_opaqueID;
  if (opaqueID)
  {
    v54 = [v5 opaqueID];
    BOOL v55 = [(NSString *)opaqueID isEqualToString:v54];

    if (v55) {
      goto LABEL_49;
    }
  }
  versionHash = self->_versionHash;
  if (versionHash)
  {
    v57 = [v5 versionHash];
    BOOL v58 = [(NSString *)versionHash isEqualToString:v57];

    if (v58) {
      goto LABEL_49;
    }
  }
  informalMediaClipID = self->_informalMediaClipID;
  if (informalMediaClipID)
  {
    int v60 = [v5 universalStore];
    uint64_t v61 = [v60 informalMediaClipID];
    BOOL v62 = [(NSString *)informalMediaClipID isEqualToString:v61];

    if (v62) {
      goto LABEL_49;
    }
  }
  informalStaticAssetID = self->_informalStaticAssetID;
  if (informalStaticAssetID)
  {
    v64 = [v5 universalStore];
    uint64_t v65 = [v64 informalStaticAssetID];
    BOOL v66 = [(NSString *)informalStaticAssetID isEqualToString:v65];

    if (v66) {
      goto LABEL_49;
    }
  }
  int64_t reportingAdamID = self->_reportingAdamID;
  if (reportingAdamID)
  {
    v68 = [v5 universalStore];
    uint64_t v69 = [v68 reportingAdamID];

    if (reportingAdamID == v69) {
      goto LABEL_49;
    }
  }
  int64_t assetAdamID = self->_assetAdamID;
  if (assetAdamID)
  {
    v71 = [v5 universalStore];
    uint64_t v72 = [v71 assetAdamID];

    if (assetAdamID == v72) {
      goto LABEL_49;
    }
  }
  int64_t lyricsAdamID = self->_lyricsAdamID;
  if (lyricsAdamID)
  {
    uint64_t v74 = [v5 universalStore];
    uint64_t v75 = [v74 lyricsAdamID];

    if (lyricsAdamID == v75) {
      goto LABEL_49;
    }
  }
  socialProfileID = self->_socialProfileID;
  if (socialProfileID)
  {
    v77 = [v5 universalStore];
    uint64_t v78 = [v77 socialProfileID];
    BOOL v79 = [(NSString *)socialProfileID isEqualToString:v78];

    if (v79) {
      goto LABEL_49;
    }
  }
  if ([(NSArray *)self->_formerAdamIDs count])
  {
    formerAdamIDs = self->_formerAdamIDs;
    v81 = [v5 universalStore];
    uint64_t v82 = [v81 formerAdamIDs];
    LOBYTE(formerAdamIDs) = [(NSArray *)formerAdamIDs isEqualToArray:v82];

    if (formerAdamIDs) {
      goto LABEL_49;
    }
  }
  int64_t syncID = self->_syncID;
  if (syncID
    && ([v5 library],
        v84 = objc_claimAutoreleasedReturnValue(),
        uint64_t v85 = [v84 syncID],
        v84,
        syncID == v85))
  {
LABEL_49:
    LOBYTE(musicKit_possibleLibraryPersistentID) = 1;
  }
  else
  {
    int64_t musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
    if (musicKit_possibleLibraryPersistentID) {
      LOBYTE(musicKit_possibleLibraryPersistentID) = musicKit_possibleLibraryPersistentID == objc_msgSend(v5, "musicKit_possibleLibraryPersistentID");
    }
  }

  return musicKit_possibleLibraryPersistentID;
}

- (void)encodeWithCoder:(id)a3
{
  modelKind = self->_modelKind;
  id v5 = a3;
  [v5 encodeObject:modelKind forKey:@"MPIdentifierSetCodingKeyModelKind"];
  [v5 encodeObject:self->_sources forKey:@"MPIdentifierSetCodingKeySources"];
  [v5 encodeObject:self->_databaseID forKey:@"MPIdentifierSetCodingKeyDatabaseID"];
  [v5 encodeInt64:self->_persistentID forKey:@"MPIdentifierSetDeviceLibraryPersistentID"];
  [v5 encodeInt64:self->_containedPersistentID forKey:@"MPIdentifierSetDeviceLibraryContainedPersistentID"];
  [v5 encodeInt64:self->_syncID forKey:@"MPIdentifierSetSyncID"];
  [v5 encodeInt64:self->_musicKit_possibleLibraryPersistentID forKey:@"_MPIdentifierSetCodingKeyMusicKitPossibleLibraryPersistentID"];
  [v5 encodeObject:self->_personID forKey:@"MPIdentifierSetCodingKeyPersonID"];
  [v5 encodeInt64:self->_cloudID forKey:@"MPIdentifierSetStoreCloudID"];
  [v5 encodeObject:self->_cloudAlbumID forKey:@"MPIdentifierSetStoreCloudAlbumID"];
  [v5 encodeObject:self->_cloudArtistID forKey:@"MPIdentifierSetStoreCloudArtistID"];
  [v5 encodeObject:self->_recommendationID forKey:@"MPIdentifierSetStoreRecommendationID"];
  [v5 encodeObject:self->_globalPlaylistID forKey:@"MPIdentifierSetGlobalPlaylistID"];
  [v5 encodeInt64:self->_adamID forKey:@"MPIdentifierSetStoreAdamID"];
  [v5 encodeObject:self->_formerAdamIDs forKey:@"MPIdentifierSetFormerStoreAdamIDs"];
  [v5 encodeObject:self->_universalCloudLibraryID forKey:@"MPIdentifierSetCloudUniversalLibraryID"];
  [v5 encodeInt64:self->_purchasedAdamID forKey:@"MPIdentifierSetStorePurchasedAdamID"];
  [v5 encodeInt64:self->_subscriptionAdamID forKey:@"MPIdentifierSetStoreSubscriptionAdamID"];
  [v5 encodeObject:self->_socialProfileID forKey:@"MPIdentifierSetSocialProfileID"];
  [v5 encodeObject:self->_informalMediaClipID forKey:@"MPIdentifierSetInformalMediaClipID"];
  [v5 encodeObject:self->_informalStaticAssetID forKey:@"MPIdentifierSetInformalStaticAssetID"];
  [v5 encodeInt64:self->_reportingAdamID forKey:@"MPIdentifierSetReportingAdamID"];
  [v5 encodeInt64:self->_assetAdamID forKey:@"MPIdentifierSetAssetAdamID"];
  [v5 encodeInt64:self->_lyricsAdamID forKey:@"MPIdentifierSetLyricsAdamID"];
  [v5 encodeObject:self->_stationStringID forKey:@"MPIdentifierSetRadioStationStringID"];
  [v5 encodeObject:self->_stationHash forKey:@"MPIdentifierSetRadioStationHash"];
  [v5 encodeInt64:self->_stationID forKey:@"MPIdentifierSetRadioStationID"];
  [v5 encodeObject:self->_stationEventID forKey:@"MPIdentifierSetRadioStationEventID"];
  [v5 encodeObject:self->_containerUniqueID forKey:@"MPIdentifierSetContainerUniqueID"];
  [v5 encodeObject:self->_handoffCorrelationID forKey:@"MPIdentifierSetHandoffCorrelationID"];
  [v5 encodeObject:self->_contentItemID forKey:@"MPIdentifierSetContentItemID"];
  [v5 encodeObject:self->_lyricsID forKey:@"MPIdentifierSetLyricsID"];
  [v5 encodeBool:self->_shouldExcludeFromShuffle forKey:@"MPIdentifierSetShouldExcludeFromShuffle"];
  [v5 encodeBool:self->_placeholder forKey:@"MPIdentifierSetIsPlaceholder"];
  [v5 encodeObject:self->_vendorID forKey:@"MPIdentifierSetVendorID"];
  [v5 encodeObject:self->_opaqueID forKey:@"MPIdentifierSetOpaqueID"];
  [v5 encodeObject:self->_versionHash forKey:@"MPIdentifierSetVersionHash"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPIdentifierSet *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (![(MPIdentifierSet *)v4 isMemberOfClass:objc_opt_class()]) {
      goto LABEL_89;
    }
    modelKind = self->_modelKind;
    uint64_t v6 = [(MPIdentifierSet *)v4 modelKind];
    LODWORD(modelKind) = [(MPModelKind *)modelKind isEqual:v6];

    if (!modelKind) {
      goto LABEL_89;
    }
    databaseID = self->_databaseID;
    uint64_t v8 = [(MPIdentifierSet *)v4 databaseID];
    if (databaseID == (NSString *)v8)
    {
    }
    else
    {
      id v9 = (void *)v8;
      BOOL v10 = self->_databaseID;
      uint64_t v11 = [(MPIdentifierSet *)v4 databaseID];
      LODWORD(v10) = [(NSString *)v10 isEqual:v11];

      if (!v10) {
        goto LABEL_89;
      }
    }
    int64_t persistentID = self->_persistentID;
    if (persistentID != [(MPIdentifierSet *)v4 persistentID]) {
      goto LABEL_89;
    }
    int64_t containedPersistentID = self->_containedPersistentID;
    if (containedPersistentID != [(MPIdentifierSet *)v4 containedPersistentID]) {
      goto LABEL_89;
    }
    int64_t syncID = self->_syncID;
    if (syncID != [(MPIdentifierSet *)v4 syncID]) {
      goto LABEL_89;
    }
    personID = self->_personID;
    uint64_t v17 = [(MPIdentifierSet *)v4 personID];
    if (personID == (NSString *)v17)
    {
    }
    else
    {
      id v18 = (void *)v17;
      uint64_t v19 = self->_personID;
      uint64_t v20 = [(MPIdentifierSet *)v4 personID];
      LODWORD(v19) = [(NSString *)v19 isEqual:v20];

      if (!v19) {
        goto LABEL_89;
      }
    }
    unint64_t cloudID = self->_cloudID;
    if (cloudID != [(MPIdentifierSet *)v4 cloudID]) {
      goto LABEL_89;
    }
    cloudAlbumID = self->_cloudAlbumID;
    uint64_t v23 = [(MPIdentifierSet *)v4 cloudAlbumID];
    if (cloudAlbumID == (NSString *)v23)
    {
    }
    else
    {
      BOOL v24 = (void *)v23;
      v25 = self->_cloudAlbumID;
      int v26 = [(MPIdentifierSet *)v4 cloudAlbumID];
      LODWORD(v25) = [(NSString *)v25 isEqual:v26];

      if (!v25) {
        goto LABEL_89;
      }
    }
    cloudArtistID = self->_cloudArtistID;
    uint64_t v28 = [(MPIdentifierSet *)v4 cloudArtistID];
    if (cloudArtistID == (NSString *)v28)
    {
    }
    else
    {
      uint64_t v29 = (void *)v28;
      lldiv_t v30 = self->_cloudArtistID;
      BOOL v31 = [(MPIdentifierSet *)v4 cloudArtistID];
      LODWORD(v30) = [(NSString *)v30 isEqual:v31];

      if (!v30) {
        goto LABEL_89;
      }
    }
    recommendationID = self->_recommendationID;
    uint64_t v33 = [(MPIdentifierSet *)v4 recommendationID];
    if (recommendationID == (NSString *)v33)
    {
    }
    else
    {
      uint64_t v34 = (void *)v33;
      BOOL v35 = self->_recommendationID;
      v36 = [(MPIdentifierSet *)v4 recommendationID];
      LODWORD(v35) = [(NSString *)v35 isEqual:v36];

      if (!v35) {
        goto LABEL_89;
      }
    }
    int64_t musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
    if (musicKit_possibleLibraryPersistentID != [(MPIdentifierSet *)v4 musicKit_possibleLibraryPersistentID])goto LABEL_89; {
    globalPlaylistID = self->_globalPlaylistID;
    }
    if (globalPlaylistID != v4->_globalPlaylistID && !-[NSString isEqual:](globalPlaylistID, "isEqual:")) {
      goto LABEL_89;
    }
    int64_t adamID = self->_adamID;
    if (adamID != [(MPIdentifierSet *)v4 adamID]) {
      goto LABEL_89;
    }
    formerAdamIDs = self->_formerAdamIDs;
    uint64_t v41 = [(MPIdentifierSet *)v4 formerAdamIDs];
    if (formerAdamIDs == (NSArray *)v41)
    {
    }
    else
    {
      uint64_t v42 = (void *)v41;
      BOOL v43 = self->_formerAdamIDs;
      v44 = [(MPIdentifierSet *)v4 formerAdamIDs];
      LODWORD(v43) = [(NSArray *)v43 isEqual:v44];

      if (!v43) {
        goto LABEL_89;
      }
    }
    universalCloudLibraryID = self->_universalCloudLibraryID;
    uint64_t v46 = [(MPIdentifierSet *)v4 universalCloudLibraryID];
    if (universalCloudLibraryID == (NSString *)v46)
    {
    }
    else
    {
      v47 = (void *)v46;
      uint64_t v48 = self->_universalCloudLibraryID;
      BOOL v49 = [(MPIdentifierSet *)v4 universalCloudLibraryID];
      LODWORD(v48) = [(NSString *)v48 isEqual:v49];

      if (!v48) {
        goto LABEL_89;
      }
    }
    int64_t purchasedAdamID = self->_purchasedAdamID;
    if (purchasedAdamID != [(MPIdentifierSet *)v4 purchasedAdamID]) {
      goto LABEL_89;
    }
    int64_t subscriptionAdamID = self->_subscriptionAdamID;
    if (subscriptionAdamID != [(MPIdentifierSet *)v4 subscriptionAdamID]) {
      goto LABEL_89;
    }
    socialProfileID = self->_socialProfileID;
    if (socialProfileID != v4->_socialProfileID && !-[NSString isEqual:](socialProfileID, "isEqual:")) {
      goto LABEL_89;
    }
    informalMediaClipID = self->_informalMediaClipID;
    if (informalMediaClipID != v4->_informalMediaClipID
      && !-[NSString isEqual:](informalMediaClipID, "isEqual:"))
    {
      goto LABEL_89;
    }
    informalStaticAssetID = self->_informalStaticAssetID;
    if (informalStaticAssetID != v4->_informalStaticAssetID
      && !-[NSString isEqual:](informalStaticAssetID, "isEqual:"))
    {
      goto LABEL_89;
    }
    if (self->_reportingAdamID != v4->_reportingAdamID
      || self->_assetAdamID != v4->_assetAdamID
      || self->_lyricsAdamID != v4->_lyricsAdamID)
    {
      goto LABEL_89;
    }
    stationStringID = self->_stationStringID;
    uint64_t v56 = [(MPIdentifierSet *)v4 stationStringID];
    if (stationStringID == (NSString *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      BOOL v58 = self->_stationStringID;
      v59 = [(MPIdentifierSet *)v4 stationStringID];
      LODWORD(v58) = [(NSString *)v58 isEqual:v59];

      if (!v58) {
        goto LABEL_89;
      }
    }
    stationHash = self->_stationHash;
    uint64_t v61 = [(MPIdentifierSet *)v4 stationHash];
    if (stationHash == (NSString *)v61)
    {
    }
    else
    {
      BOOL v62 = (void *)v61;
      v63 = self->_stationHash;
      v64 = [(MPIdentifierSet *)v4 stationHash];
      LODWORD(v63) = [(NSString *)v63 isEqual:v64];

      if (!v63) {
        goto LABEL_89;
      }
    }
    int64_t stationID = self->_stationID;
    if (stationID != [(MPIdentifierSet *)v4 stationID])
    {
LABEL_89:
      char v12 = 0;
      goto LABEL_90;
    }
    stationEventID = self->_stationEventID;
    uint64_t v67 = [(MPIdentifierSet *)v4 stationEventID];
    if (stationEventID == (NSString *)v67)
    {
    }
    else
    {
      v68 = (void *)v67;
      uint64_t v69 = self->_stationEventID;
      v70 = [(MPIdentifierSet *)v4 stationEventID];
      LODWORD(v69) = [(NSString *)v69 isEqual:v70];

      if (!v69) {
        goto LABEL_89;
      }
    }
    containerUniqueID = self->_containerUniqueID;
    uint64_t v72 = [(MPIdentifierSet *)v4 containerUniqueID];
    if (containerUniqueID == (NSString *)v72)
    {
    }
    else
    {
      uint64_t v73 = (void *)v72;
      uint64_t v74 = self->_containerUniqueID;
      uint64_t v75 = [(MPIdentifierSet *)v4 containerUniqueID];
      LODWORD(v74) = [(NSString *)v74 isEqual:v75];

      if (!v74) {
        goto LABEL_89;
      }
    }
    handoffCorrelationID = self->_handoffCorrelationID;
    uint64_t v77 = [(MPIdentifierSet *)v4 handoffCorrelationID];
    if (handoffCorrelationID == (NSString *)v77)
    {
    }
    else
    {
      uint64_t v78 = (void *)v77;
      BOOL v79 = self->_handoffCorrelationID;
      v80 = [(MPIdentifierSet *)v4 handoffCorrelationID];
      LODWORD(v79) = [(NSString *)v79 isEqual:v80];

      if (!v79) {
        goto LABEL_89;
      }
    }
    contentItemID = self->_contentItemID;
    uint64_t v82 = [(MPIdentifierSet *)v4 contentItemID];
    if (contentItemID == (NSString *)v82)
    {
    }
    else
    {
      v83 = (void *)v82;
      v84 = self->_contentItemID;
      uint64_t v85 = [(MPIdentifierSet *)v4 contentItemID];
      LODWORD(v84) = [(NSString *)v84 isEqual:v85];

      if (!v84) {
        goto LABEL_89;
      }
    }
    lyricsID = self->_lyricsID;
    uint64_t v87 = [(MPIdentifierSet *)v4 lyricsID];
    if (lyricsID == (NSString *)v87)
    {
    }
    else
    {
      uint64_t v88 = (void *)v87;
      v89 = self->_lyricsID;
      v90 = [(MPIdentifierSet *)v4 lyricsID];
      LODWORD(v89) = [(NSString *)v89 isEqual:v90];

      if (!v89) {
        goto LABEL_89;
      }
    }
    BOOL shouldExcludeFromShuffle = self->_shouldExcludeFromShuffle;
    if (shouldExcludeFromShuffle != [(MPIdentifierSet *)v4 shouldExcludeFromShuffle]) {
      goto LABEL_89;
    }
    BOOL placeholder = self->_placeholder;
    if (placeholder != [(MPIdentifierSet *)v4 isPlaceholder]) {
      goto LABEL_89;
    }
    vendorID = self->_vendorID;
    uint64_t v94 = [(MPIdentifierSet *)v4 vendorID];
    if (vendorID == (NSString *)v94)
    {
    }
    else
    {
      v95 = (void *)v94;
      v96 = self->_vendorID;
      v97 = [(MPIdentifierSet *)v4 vendorID];
      LODWORD(v96) = [(NSString *)v96 isEqual:v97];

      if (!v96) {
        goto LABEL_89;
      }
    }
    opaqueID = self->_opaqueID;
    v99 = [(MPIdentifierSet *)v4 opaqueID];
    if (opaqueID == v99)
    {
    }
    else
    {
      v100 = v99;
      int v101 = [(NSString *)opaqueID isEqual:v99];

      if (!v101) {
        goto LABEL_89;
      }
    }
    versionHash = self->_versionHash;
    v104 = [(MPIdentifierSet *)v4 versionHash];
    if (versionHash == v104) {
      char v12 = 1;
    }
    else {
      char v12 = [(NSString *)versionHash isEqual:v104];
    }
  }
LABEL_90:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  id v9 = self->_modelKind;
  uint64_t v10 = [(MPModelKind *)v9 hash];
  uint64_t v11 = v5 ^ 0x7465646279746573 ^ v10;
  uint64_t v12 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v13 = v8 + v11;
  uint64_t v14 = (v8 + v11) ^ __ROR8__(v11, 48);
  uint64_t v15 = __ROR8__(v6 + v7, 32) + v14;
  uint64_t v16 = v13 + v12;
  uint64_t v191 = __ROR8__(v16, 32);
  uint64_t v200 = v15 ^ __ROR8__(v14, 43);
  uint64_t v165 = v15 ^ v10;
  uint64_t v178 = v16 ^ __ROR8__(v12, 47);

  uint64_t v17 = self->_databaseID;
  [(NSString *)v17 UTF8String];
  [(NSString *)v17 length];

  int64_t persistentID = self->_persistentID;
  uint64_t v19 = (v165 + v178) ^ __ROR8__(v178, 51);
  uint64_t v20 = v191 + (v200 ^ persistentID);
  uint64_t v21 = __ROR8__(v200 ^ persistentID, 48);
  uint64_t v22 = __ROR8__(v165 + v178, 32) + (v20 ^ v21);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  int64_t v166 = v22 ^ persistentID;
  uint64_t v179 = v24 ^ __ROR8__(v19, 47);
  int64_t containedPersistentID = self->_containedPersistentID;
  int64_t v26 = (v166 + v179) ^ __ROR8__(v179, 51);
  int64_t v27 = __ROR8__(v24, 32) + (v23 ^ containedPersistentID);
  uint64_t v28 = __ROR8__(v23 ^ containedPersistentID, 48);
  int64_t v29 = __ROR8__(v166 + v179, 32) + (v27 ^ v28);
  int64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  int64_t v31 = v27 + v26;
  uint64_t v192 = __ROR8__(v31, 32);
  uint64_t v201 = v30;
  int64_t v167 = v29 ^ containedPersistentID;
  uint64_t v180 = v31 ^ __ROR8__(v26, 47);
  uint64_t v32 = self->_personID;
  [(NSString *)v32 UTF8String];
  [(NSString *)v32 length];

  unint64_t cloudID = self->_cloudID;
  int64_t v34 = (v167 + v180) ^ __ROR8__(v180, 51);
  uint64_t v35 = v192 + (v201 ^ cloudID);
  uint64_t v36 = __ROR8__(v201 ^ cloudID, 48);
  uint64_t v37 = (v35 ^ v36) + __ROR8__(v167 + v180, 32);
  uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  uint64_t v39 = v35 + v34;
  uint64_t v193 = __ROR8__(v39, 32);
  uint64_t v202 = v38;
  unint64_t v168 = v37 ^ cloudID;
  uint64_t v181 = v39 ^ __ROR8__(v34, 47);
  v40 = self->_cloudAlbumID;
  [(NSString *)v40 UTF8String];
  [(NSString *)v40 length];

  uint64_t v41 = self->_cloudArtistID;
  [(NSString *)v41 UTF8String];
  [(NSString *)v41 length];

  uint64_t v42 = self->_recommendationID;
  [(NSString *)v42 UTF8String];
  [(NSString *)v42 length];

  int64_t musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
  unint64_t v44 = (v168 + v181) ^ __ROR8__(v181, 51);
  uint64_t v45 = v193 + (v202 ^ musicKit_possibleLibraryPersistentID);
  uint64_t v46 = __ROR8__(v202 ^ musicKit_possibleLibraryPersistentID, 48);
  uint64_t v47 = (v45 ^ v46) + __ROR8__(v168 + v181, 32);
  uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  uint64_t v49 = v45 + v44;
  uint64_t v194 = __ROR8__(v49, 32);
  uint64_t v203 = v48;
  int64_t v169 = v47 ^ musicKit_possibleLibraryPersistentID;
  uint64_t v182 = v49 ^ __ROR8__(v44, 47);
  uint64_t v50 = self->_globalPlaylistID;
  [(NSString *)v50 UTF8String];
  [(NSString *)v50 length];

  int64_t adamID = self->_adamID;
  int64_t v52 = (v169 + v182) ^ __ROR8__(v182, 51);
  uint64_t v53 = v194 + (v203 ^ adamID);
  uint64_t v54 = __ROR8__(v203 ^ adamID, 48);
  uint64_t v55 = (v53 ^ v54) + __ROR8__(v169 + v182, 32);
  uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
  uint64_t v57 = v53 + v52;
  uint64_t v195 = __ROR8__(v57, 32);
  uint64_t v204 = v56;
  int64_t v170 = v55 ^ adamID;
  uint64_t v183 = v57 ^ __ROR8__(v52, 47);
  BOOL v58 = self->_formerAdamIDs;
  uint64_t v59 = [(NSArray *)v58 hash];
  int64_t v60 = (v170 + v183) ^ __ROR8__(v183, 51);
  uint64_t v61 = v195 + (v204 ^ v59);
  uint64_t v62 = __ROR8__(v204 ^ v59, 48);
  uint64_t v63 = (v61 ^ v62) + __ROR8__(v170 + v183, 32);
  uint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
  uint64_t v65 = v61 + v60;
  uint64_t v196 = __ROR8__(v65, 32);
  uint64_t v205 = v64;
  uint64_t v171 = v63 ^ v59;
  uint64_t v184 = v65 ^ __ROR8__(v60, 47);

  BOOL v66 = self->_universalCloudLibraryID;
  [(NSString *)v66 UTF8String];
  [(NSString *)v66 length];

  int64_t purchasedAdamID = self->_purchasedAdamID;
  uint64_t v68 = (v171 + v184) ^ __ROR8__(v184, 51);
  uint64_t v69 = v196 + (v205 ^ purchasedAdamID);
  uint64_t v70 = __ROR8__(v205 ^ purchasedAdamID, 48);
  uint64_t v71 = (v69 ^ v70) + __ROR8__(v171 + v184, 32);
  uint64_t v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
  uint64_t v73 = v69 + v68;
  int64_t v172 = v71 ^ purchasedAdamID;
  uint64_t v185 = v73 ^ __ROR8__(v68, 47);
  int64_t subscriptionAdamID = self->_subscriptionAdamID;
  int64_t v75 = (v172 + v185) ^ __ROR8__(v185, 51);
  int64_t v76 = __ROR8__(v73, 32) + (v72 ^ subscriptionAdamID);
  uint64_t v77 = __ROR8__(v72 ^ subscriptionAdamID, 48);
  int64_t v78 = (v76 ^ v77) + __ROR8__(v172 + v185, 32);
  int64_t v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  int64_t v80 = v76 + v75;
  uint64_t v197 = __ROR8__(v80, 32);
  uint64_t v206 = v79;
  int64_t v173 = v78 ^ subscriptionAdamID;
  uint64_t v186 = v80 ^ __ROR8__(v75, 47);
  v81 = self->_socialProfileID;
  [(NSString *)v81 UTF8String];
  [(NSString *)v81 length];

  uint64_t v82 = self->_informalMediaClipID;
  [(NSString *)v82 UTF8String];
  [(NSString *)v82 length];

  v83 = self->_informalStaticAssetID;
  [(NSString *)v83 UTF8String];
  [(NSString *)v83 length];

  int64_t reportingAdamID = self->_reportingAdamID;
  int64_t v85 = (v173 + v186) ^ __ROR8__(v186, 51);
  uint64_t v86 = v197 + (v206 ^ reportingAdamID);
  uint64_t v87 = __ROR8__(v206 ^ reportingAdamID, 48);
  uint64_t v88 = (v86 ^ v87) + __ROR8__(v173 + v186, 32);
  uint64_t v89 = v88 ^ __ROR8__(v86 ^ v87, 43);
  uint64_t v90 = v86 + v85;
  int64_t v174 = v88 ^ reportingAdamID;
  uint64_t v187 = v90 ^ __ROR8__(v85, 47);
  int64_t assetAdamID = self->_assetAdamID;
  int64_t v92 = (v174 + v187) ^ __ROR8__(v187, 51);
  int64_t v93 = __ROR8__(v90, 32) + (v89 ^ assetAdamID);
  uint64_t v94 = __ROR8__(v89 ^ assetAdamID, 48);
  int64_t v95 = (v93 ^ v94) + __ROR8__(v174 + v187, 32);
  int64_t v96 = v95 ^ __ROR8__(v93 ^ v94, 43);
  int64_t v97 = v93 + v92;
  int64_t v175 = v95 ^ assetAdamID;
  uint64_t v188 = v97 ^ __ROR8__(v92, 47);
  int64_t lyricsAdamID = self->_lyricsAdamID;
  int64_t v99 = (v175 + v188) ^ __ROR8__(v188, 51);
  int64_t v100 = __ROR8__(v97, 32) + (v96 ^ lyricsAdamID);
  uint64_t v101 = __ROR8__(v96 ^ lyricsAdamID, 48);
  int64_t v102 = (v100 ^ v101) + __ROR8__(v175 + v188, 32);
  int64_t v103 = v102 ^ __ROR8__(v100 ^ v101, 43);
  int64_t v104 = v100 + v99;
  uint64_t v198 = __ROR8__(v104, 32);
  uint64_t v207 = v103;
  int64_t v176 = v102 ^ lyricsAdamID;
  uint64_t v189 = v104 ^ __ROR8__(v99, 47);
  v105 = self->_stationStringID;
  [(NSString *)v105 UTF8String];
  [(NSString *)v105 length];

  v106 = self->_stationHash;
  [(NSString *)v106 UTF8String];
  [(NSString *)v106 length];

  int64_t stationID = self->_stationID;
  int64_t v108 = (v176 + v189) ^ __ROR8__(v189, 51);
  uint64_t v109 = v198 + (v207 ^ stationID);
  uint64_t v110 = __ROR8__(v207 ^ stationID, 48);
  uint64_t v111 = (v109 ^ v110) + __ROR8__(v176 + v189, 32);
  uint64_t v112 = v111 ^ __ROR8__(v109 ^ v110, 43);
  uint64_t v113 = v109 + v108;
  uint64_t v199 = __ROR8__(v113, 32);
  uint64_t v208 = v112;
  int64_t v177 = v111 ^ stationID;
  uint64_t v190 = v113 ^ __ROR8__(v108, 47);
  v114 = self->_stationEventID;
  [(NSString *)v114 UTF8String];
  [(NSString *)v114 length];

  v115 = self->_containerUniqueID;
  [(NSString *)v115 UTF8String];
  [(NSString *)v115 length];

  uint64_t v116 = self->_handoffCorrelationID;
  [(NSString *)v116 UTF8String];
  [(NSString *)v116 length];

  v117 = self->_contentItemID;
  [(NSString *)v117 UTF8String];
  [(NSString *)v117 length];

  v118 = self->_lyricsID;
  [(NSString *)v118 UTF8String];
  [(NSString *)v118 length];

  uint64_t placeholder = self->_placeholder;
  uint64_t v120 = (self->_shouldExcludeFromShuffle | 0x6800000000000000) + 0x400000000000000;
  uint64_t v209 = v120;
  if ((v120 & 0x400000000000000) != 0)
  {
    if ((v120 & 0x300000000000000) != 0)
    {
      v163 = [MEMORY[0x1E4F28B00] currentHandler];
      v164 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v163, "handleFailureInFunction:file:lineNumber:description:", v164, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v209);

      uint64_t v120 = v209;
    }
    uint64_t v122 = v120 & 0xFFFFFFFFFFFFFFLL | (placeholder << 32);
    int64_t v123 = (v177 + v190) ^ __ROR8__(v190, 51);
    uint64_t v124 = v199 + (v122 ^ v208);
    uint64_t v125 = __ROR8__(v122 ^ v208, 48);
    uint64_t v126 = (v124 ^ v125) + __ROR8__(v177 + v190, 32);
    uint64_t v127 = v126 ^ __ROR8__(v124 ^ v125, 43);
    uint64_t v128 = v124 + v123;
    uint64_t v199 = __ROR8__(v128, 32);
    uint64_t v208 = v127;
    int64_t v177 = v126 ^ v122;
    uint64_t v190 = v128 ^ __ROR8__(v123, 47);
    unint64_t v121 = v120 & 0xFF00000000000000;
  }
  else
  {
    if ((v120 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v161 = [MEMORY[0x1E4F28B00] currentHandler];
      v162 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v161 handleFailureInFunction:v162, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v209 file lineNumber description];

      uint64_t v120 = v209;
    }
    unint64_t v121 = v120 | placeholder;
  }
  unint64_t v210 = v121 + 0x400000000000000;
  v129 = self->_vendorID;
  [(NSString *)v129 UTF8String];
  [(NSString *)v129 length];

  v130 = self->_opaqueID;
  [(NSString *)v130 UTF8String];
  [(NSString *)v130 length];

  v131 = self->_versionHash;
  [(NSString *)v131 UTF8String];
  [(NSString *)v131 length];

  int64_t v132 = (v177 + v190) ^ __ROR8__(v190, 51);
  uint64_t v133 = v199 + (v208 ^ v210);
  uint64_t v134 = __ROR8__(v208 ^ v210, 48);
  uint64_t v135 = (v133 ^ v134) + __ROR8__(v177 + v190, 32);
  uint64_t v136 = v135 ^ __ROR8__(v133 ^ v134, 43);
  uint64_t v137 = v133 + v132;
  uint64_t v138 = v137 ^ __ROR8__(v132, 47);
  unint64_t v139 = (v135 ^ v210) + v138;
  uint64_t v140 = v139 ^ __ROR8__(v138, 51);
  uint64_t v141 = (__ROR8__(v137, 32) ^ 0xFFLL) + v136;
  uint64_t v142 = __ROR8__(v136, 48);
  uint64_t v143 = __ROR8__(v139, 32) + (v141 ^ v142);
  uint64_t v144 = v143 ^ __ROR8__(v141 ^ v142, 43);
  uint64_t v145 = v140 + v141;
  uint64_t v146 = v145 ^ __ROR8__(v140, 47);
  uint64_t v147 = v146 + v143;
  uint64_t v148 = v147 ^ __ROR8__(v146, 51);
  uint64_t v149 = __ROR8__(v145, 32) + v144;
  uint64_t v150 = __ROR8__(v144, 48);
  uint64_t v151 = __ROR8__(v147, 32) + (v149 ^ v150);
  uint64_t v152 = v151 ^ __ROR8__(v149 ^ v150, 43);
  uint64_t v153 = v148 + v149;
  uint64_t v154 = v153 ^ __ROR8__(v148, 47);
  uint64_t v155 = v154 + v151;
  uint64_t v156 = v155 ^ __ROR8__(v154, 51);
  uint64_t v157 = __ROR8__(v153, 32) + v152;
  uint64_t v158 = __ROR8__(v152, 48);
  uint64_t v159 = __ROR8__(v155, 32) + (v157 ^ v158);
  return (v156 + v157) ^ __ROR8__(v156, 47) ^ v159 ^ __ROR8__(v156 + v157, 32) ^ v159 ^ __ROR8__(v157 ^ v158, 43);
}

- (id)_copyWithSources:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  id v9 = [(MPIdentifierSet *)self sources];
  uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v7];

  uint64_t v11 = [(MPIdentifierSet *)self modelKind];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__MPIdentifierSet__copyWithSources_block___block_invoke;
  v15[3] = &unk_1E57F9678;
  void v15[4] = self;
  id v16 = v6;
  id v12 = v6;
  uint64_t v13 = (void *)[v8 _initWithSources:v10 modelKind:v11 block:v15];

  return v13;
}

void __42__MPIdentifierSet__copyWithSources_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v40 = a2;
  uint64_t v4 = [v3 modelKind];
  uint64_t v5 = (void *)*((void *)v40 + 35);
  *((void *)v40 + 35) = v4;

  uint64_t v6 = [*(id *)(a1 + 32) databaseID];
  id v7 = (void *)*((void *)v40 + 2);
  *((void *)v40 + 2) = v6;

  *((void *)v40 + 3) = [*(id *)(a1 + 32) persistentID];
  *((void *)v40 + 4) = [*(id *)(a1 + 32) containedPersistentID];
  *((void *)v40 + 5) = *(void *)(*(void *)(a1 + 32) + 40);
  *((void *)v40 + 34) = objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID");
  uint64_t v8 = [*(id *)(a1 + 32) personID];
  id v9 = (void *)*((void *)v40 + 6);
  *((void *)v40 + 6) = v8;

  *((void *)v40 + 7) = [*(id *)(a1 + 32) cloudID];
  uint64_t v10 = [*(id *)(a1 + 32) cloudAlbumID];
  uint64_t v11 = (void *)*((void *)v40 + 8);
  *((void *)v40 + 8) = v10;

  uint64_t v12 = [*(id *)(a1 + 32) cloudArtistID];
  uint64_t v13 = (void *)*((void *)v40 + 9);
  *((void *)v40 + 9) = v12;

  uint64_t v14 = [*(id *)(a1 + 32) recommendationID];
  uint64_t v15 = (void *)*((void *)v40 + 10);
  *((void *)v40 + 10) = v14;

  objc_storeStrong((id *)v40 + 11, *(id *)(*(void *)(a1 + 32) + 88));
  *((void *)v40 + 12) = [*(id *)(a1 + 32) adamID];
  uint64_t v16 = [*(id *)(a1 + 32) formerAdamIDs];
  uint64_t v17 = (void *)*((void *)v40 + 13);
  *((void *)v40 + 13) = v16;

  uint64_t v18 = [*(id *)(a1 + 32) universalCloudLibraryID];
  uint64_t v19 = (void *)*((void *)v40 + 14);
  *((void *)v40 + 14) = v18;

  *((void *)v40 + 15) = [*(id *)(a1 + 32) purchasedAdamID];
  *((void *)v40 + 16) = [*(id *)(a1 + 32) subscriptionAdamID];
  objc_storeStrong((id *)v40 + 17, *(id *)(*(void *)(a1 + 32) + 136));
  objc_storeStrong((id *)v40 + 18, *(id *)(*(void *)(a1 + 32) + 144));
  objc_storeStrong((id *)v40 + 19, *(id *)(*(void *)(a1 + 32) + 152));
  *((void *)v40 + 20) = *(void *)(*(void *)(a1 + 32) + 160);
  *((void *)v40 + 21) = *(void *)(*(void *)(a1 + 32) + 168);
  *((void *)v40 + 22) = *(void *)(*(void *)(a1 + 32) + 176);
  uint64_t v20 = [*(id *)(a1 + 32) stationStringID];
  uint64_t v21 = (void *)*((void *)v40 + 23);
  *((void *)v40 + 23) = v20;

  uint64_t v22 = [*(id *)(a1 + 32) stationHash];
  uint64_t v23 = (void *)*((void *)v40 + 24);
  *((void *)v40 + 24) = v22;

  *((void *)v40 + 25) = [*(id *)(a1 + 32) stationID];
  uint64_t v24 = [*(id *)(a1 + 32) stationEventID];
  v25 = (void *)*((void *)v40 + 26);
  *((void *)v40 + 26) = v24;

  uint64_t v26 = [*(id *)(a1 + 32) containerUniqueID];
  int64_t v27 = (void *)*((void *)v40 + 27);
  *((void *)v40 + 27) = v26;

  uint64_t v28 = [*(id *)(a1 + 32) handoffCorrelationID];
  int64_t v29 = (void *)*((void *)v40 + 28);
  *((void *)v40 + 28) = v28;

  uint64_t v30 = [*(id *)(a1 + 32) contentItemID];
  int64_t v31 = (void *)*((void *)v40 + 29);
  *((void *)v40 + 29) = v30;

  uint64_t v32 = [*(id *)(a1 + 32) lyricsID];
  uint64_t v33 = (void *)*((void *)v40 + 30);
  *((void *)v40 + 30) = v32;

  *((unsigned char *)v40 + 8) = [*(id *)(a1 + 32) shouldExcludeFromShuffle];
  *((unsigned char *)v40 + 9) = [*(id *)(a1 + 32) isPlaceholder];
  uint64_t v34 = [*(id *)(a1 + 32) vendorID];
  uint64_t v35 = (void *)*((void *)v40 + 31);
  *((void *)v40 + 31) = v34;

  uint64_t v36 = [*(id *)(a1 + 32) opaqueID];
  uint64_t v37 = (void *)*((void *)v40 + 32);
  *((void *)v40 + 32) = v36;

  uint64_t v38 = [*(id *)(a1 + 32) versionHash];
  uint64_t v39 = (void *)*((void *)v40 + 33);
  *((void *)v40 + 33) = v38;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)copyWithSource:(id)a3 musicKitBlock:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", v9, v7, v12, v13);
  return v10;
}

- (id)copyWithMusicKitBlock:(id)a3
{
  return [(MPIdentifierSet *)self _copyWithSources:&unk_1EE6EE378 block:a3];
}

- (id)copyWithSource:(id)a3 block:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", v9, v7, v12, v13);
  return v10;
}

- (id)copyWithBlock:(id)a3
{
  return [(MPIdentifierSet *)self _copyWithSources:&unk_1EE6EE360 block:a3];
}

- (MPIdentifierSet)initWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MPModelKind unknownKind];
  uint64_t v6 = [(MPIdentifierSet *)self _initWithSources:&unk_1EE6EE348 modelKind:v5 block:v4];

  return v6;
}

- (MPIdentifierSet)initWithModelKind:(id)a3 musicKitBlock:(id)a4
{
  return (MPIdentifierSet *)[(MPIdentifierSet *)self _initWithSources:&unk_1EE6EE330 modelKind:a3 block:a4];
}

- (MPIdentifierSet)initWithModelKind:(id)a3 block:(id)a4
{
  return (MPIdentifierSet *)[(MPIdentifierSet *)self _initWithSources:&unk_1EE6EE318 modelKind:a3 block:a4];
}

@end
@interface MPModelTVEpisode
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__descriptionText_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__duration_KEY;
+ (id)__episodeNumber_KEY;
+ (id)__episodeTypeDisplayName_KEY;
+ (id)__episodeType_KEY;
+ (id)__explicitRating_KEY;
+ (id)__hasCloudSyncSource_KEY;
+ (id)__keepLocalConstraints_KEY;
+ (id)__keepLocalEnableState_KEY;
+ (id)__keepLocalManagedStatusReason_KEY;
+ (id)__keepLocalManagedStatus_KEY;
+ (id)__lastDevicePlaybackDate_KEY;
+ (id)__libraryAddEligible_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__libraryAdded_KEY;
+ (id)__localFileAsset_KEY;
+ (id)__musicShow_KEY;
+ (id)__playbackPosition_KEY;
+ (id)__releaseDate_KEY;
+ (id)__season_KEY;
+ (id)__show_KEY;
+ (id)__storeAsset_KEY;
+ (id)__storeCanonicalID_KEY;
+ (id)__title_KEY;
+ (id)kindWithVariants:(unint64_t)a3;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyTVEpisodeArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeExplicitRating__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeHasCloudSyncSource__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeKeepLocalConstraints__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeKeepLocalEnableState__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatusReason__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeLastDevicePlaybackDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeLibraryAddEligible__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeMusicShow__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeReleaseDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeStoreCanonicalID__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeTypeDisplayName__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVEpisodeType__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVEpisodeLocalFileAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVEpisodePlaybackPosition__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVEpisodeSeason__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVEpisodeShow__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVEpisodeStoreAsset__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)humanDescription;
- (id)mediaItemPropertyValues;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (int64_t)libraryRemovalSupportedOptions;
@end

@implementation MPModelTVEpisode

+ (id)__title_KEY
{
  return @"MPModelPropertyTVEpisodeTitle";
}

+ (id)__storeCanonicalID_KEY
{
  return @"MPModelPropertyTVEpisodeStoreCanonicalID";
}

+ (id)__storeAsset_KEY
{
  return @"MPModelRelationshipTVEpisodeStoreAsset";
}

+ (id)__show_KEY
{
  return @"MPModelRelationshipTVEpisodeShow";
}

+ (id)__season_KEY
{
  return @"MPModelRelationshipTVEpisodeSeason";
}

+ (id)__releaseDate_KEY
{
  return @"MPModelPropertyTVEpisodeReleaseDate";
}

+ (id)__playbackPosition_KEY
{
  return @"MPModelRelationshipTVEpisodePlaybackPosition";
}

+ (id)__musicShow_KEY
{
  return @"MPModelPropertyTVEpisodeMusicShow";
}

+ (id)__localFileAsset_KEY
{
  return @"MPModelRelationshipTVEpisodeLocalFileAsset";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyTVEpisodeLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyTVEpisodeLibraryAddedDate";
}

+ (id)__libraryAddEligible_KEY
{
  return @"MPModelPropertyTVEpisodeLibraryAddEligible";
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return @"MPModelPropertyTVEpisodeLastDevicePlaybackDate";
}

+ (id)__keepLocalManagedStatus_KEY
{
  return @"MPModelPropertyTVEpisodeKeepLocalManagedStatus";
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return @"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason";
}

+ (id)__keepLocalEnableState_KEY
{
  return @"MPModelPropertyTVEpisodeKeepLocalEnableState";
}

+ (id)__keepLocalConstraints_KEY
{
  return @"MPModelPropertyTVEpisodeKeepLocalConstraints";
}

+ (id)__hasCloudSyncSource_KEY
{
  return @"MPModelPropertyTVEpisodeHasCloudSyncSource";
}

+ (id)__explicitRating_KEY
{
  return @"MPModelPropertyTVEpisodeExplicitRating";
}

+ (id)__episodeType_KEY
{
  return @"MPModelPropertyTVEpisodeType";
}

+ (id)__episodeTypeDisplayName_KEY
{
  return @"MPModelPropertyTVEpisodeTypeDisplayName";
}

+ (id)__episodeNumber_KEY
{
  return @"MPModelPropertyTVEpisodeNumber";
}

+ (id)__duration_KEY
{
  return @"MPModelPropertyTVEpisodeDuration";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertyTVEpisodeDownloadedDate";
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyTVEpisodeDescriptionText";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyTVEpisodeArtwork";
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)[a1 kindWithVariants:a3 options:0];
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelTVEpisodeKind kindWithVariants:a3 options:a4];
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyTVEpisodeLibraryAddEligible";
  v5[1] = @"MPModelPropertyTVEpisodeHasCloudSyncSource";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelTVEpisode *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelTVEpisode *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(MPModelObject *)self identifiers];
  v5 = [v4 humanDescription];
  v6 = [v3 stringWithFormat:@"TV episode %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyTVEpisodeTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelTVEpisode *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyTVEpisodeDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:130 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeDownloadedDate"];
}

+ (void)__MPModelPropertyTVEpisodeArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:129 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeArtwork"];
}

+ (void)__MPModelPropertyTVEpisodeKeepLocalConstraints__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:128 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalConstraints"];
}

+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:127 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"];
}

+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:126 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalManagedStatus"];
}

+ (void)__MPModelPropertyTVEpisodeKeepLocalEnableState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:125 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalEnableState"];
}

+ (void)__MPModelPropertyTVEpisodeLibraryAddEligible__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:124 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAddEligible"];
}

+ (void)__MPModelPropertyTVEpisodeLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:123 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeLastDevicePlaybackDate"];
}

+ (void)__MPModelPropertyTVEpisodeLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:122 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAddedDate"];
}

+ (void)__MPModelPropertyTVEpisodeLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:121 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAdded"];
}

+ (void)__MPModelPropertyTVEpisodeTypeDisplayName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:120 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeTypeDisplayName"];
}

+ (void)__MPModelPropertyTVEpisodeType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:119 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeType"];
}

+ (void)__MPModelPropertyTVEpisodeReleaseDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:118 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeReleaseDate"];
}

+ (void)__MPModelPropertyTVEpisodeStoreCanonicalID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:116 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeStoreCanonicalID"];
}

+ (void)__MPModelRelationshipTVEpisodeShow__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:115 description:@"Translator was missing mapping for MPModelRelationshipTVEpisodeShow"];
}

+ (void)__MPModelRelationshipTVEpisodeSeason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:114 description:@"Translator was missing mapping for MPModelRelationshipTVEpisodeSeason"];
}

+ (void)__MPModelRelationshipTVEpisodeStoreAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:113 description:@"Translator was missing mapping for MPModelRelationshipTVEpisodeStoreAsset"];
}

+ (void)__MPModelRelationshipTVEpisodePlaybackPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:112 description:@"Translator was missing mapping for MPModelRelationshipTVEpisodePlaybackPosition"];
}

+ (void)__MPModelRelationshipTVEpisodeLocalFileAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:111 description:@"Translator was missing mapping for MPModelRelationshipTVEpisodeLocalFileAsset"];
}

+ (void)__MPModelPropertyTVEpisodeExplicitRating__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:110 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeExplicitRating"];
}

+ (void)__MPModelPropertyTVEpisodeNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:109 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeNumber"];
}

+ (void)__MPModelPropertyTVEpisodeMusicShow__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:108 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeMusicShow"];
}

+ (void)__MPModelPropertyTVEpisodeHasCloudSyncSource__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:107 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeHasCloudSyncSource"];
}

+ (void)__MPModelPropertyTVEpisodeDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:106 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeDuration"];
}

+ (void)__MPModelPropertyTVEpisodeDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:105 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeDescriptionText"];
}

+ (void)__MPModelPropertyTVEpisodeTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVEpisode.m" lineNumber:104 description:@"Translator was missing mapping for MPModelPropertyTVEpisodeTitle"];
}

- (id)mediaItemPropertyValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MPModelTVEpisode_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __67__MPModelTVEpisode_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
{
  id v26 = [*(id *)(a1 + 32) title];
  if ([v26 length]) {
    [*(id *)(a1 + 40) setObject:v26 forKey:@"title"];
  }
  [*(id *)(a1 + 32) duration];
  [*(id *)(a1 + 32) duration];
  if (v2 > 0.0)
  {
    id v3 = NSNumber;
    id v4 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) duration];
    v5 = objc_msgSend(v3, "numberWithDouble:");
    [v4 setObject:v5 forKey:@"playbackDuration"];
  }
  id v6 = [*(id *)(a1 + 32) show];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 identifiers];
    id v9 = [v8 personalizedStore];
    uint64_t v10 = [v9 cloudID];

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      v12 = [NSNumber numberWithLongLong:v10];
      [v11 setObject:v12 forKey:@"storeArtistAdamID"];
    }
    v13 = [v7 title];
    if ([v13 length]) {
      [*(id *)(a1 + 40) setObject:v13 forKey:@"artist"];
    }
  }
  v14 = [*(id *)(a1 + 32) season];
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 number];
    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      v18 = [NSNumber numberWithInteger:v16];
      [v17 setObject:v18 forKey:@"seasonNumber"];
    }
  }
  v19 = [*(id *)(a1 + 32) identifiers];
  v20 = [v19 universalStore];
  uint64_t v21 = [v20 subscriptionAdamID];

  if (v21)
  {
    v22 = *(void **)(a1 + 40);
    v23 = [NSNumber numberWithLongLong:v21];
    [v22 setObject:v23 forKey:@"storeItemAdamID"];
  }
  if (MPModelTVEpisodeIsRestricted(*(void **)(a1 + 32)))
  {
    v24 = *(void **)(a1 + 40);
    v25 = [NSNumber numberWithBool:1];
    [v24 setObject:v25 forKey:@"isExplicit"];
  }
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  BOOL IsRestricted = MPModelTVEpisodeIsRestricted(self);
  int v4 = [(MPModelTVEpisode *)self isLibraryAdded];
  int v5 = [(MPModelTVEpisode *)self isLibraryAddEligible];
  uint64_t v6 = 0x100000000;
  if (!v5) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 256;
  if (!v4) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 65537;
  if (IsRestricted) {
    uint64_t v8 = 16777217;
  }
  return (MPLibraryAddStatusObserverConfiguration)(v8 | v7 | v6);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyTVEpisodeExplicitRating";
  v5[1] = @"MPModelPropertyTVEpisodeLibraryAdded";
  v5[2] = @"MPModelPropertyTVEpisodeLibraryAddEligible";
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  id v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3 = [(MPModelTVEpisode *)self keepLocalManagedStatus];
  int v4 = [(MPModelTVEpisode *)self isLibraryAdded];
  int v5 = [(MPModelTVEpisode *)self localFileAsset];
  uint64_t v6 = [(MPModelTVEpisode *)self storeAsset];
  int64_t v7 = _MPModelLibraryRemovalSupportedOptionsForIndividualItemProperties(v3, v4, v5, v6);

  return v7;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

+ (id)requiredLibraryRemovalProperties
{
  v15[4] = *MEMORY[0x1E4F143B8];
  double v2 = [MPPropertySet alloc];
  v15[0] = @"MPModelPropertyTVEpisodeLibraryAdded";
  v15[1] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertyTVEpisodeKeepLocalConstraints";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipTVEpisodeLocalFileAsset";
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipTVEpisodeStoreAsset";
  v14[0] = v5;
  v11 = @"MPModelPropertyStoreAssetRedownloadable";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  int64_t v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  uint64_t v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  int v4 = [(MPModelTVEpisode *)self localFileAsset];
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", [v4 isNonPurgeable]);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setIdentifyingModelObject:self];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setEnableState:[(MPModelTVEpisode *)self keepLocalEnableState]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setManagedStatus:[(MPModelTVEpisode *)self keepLocalManagedStatus]];
  int v5 = [(MPModelTVEpisode *)self storeAsset];
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", [v5 isRedownloadable]);

  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  v15[4] = *MEMORY[0x1E4F143B8];
  double v2 = [MPPropertySet alloc];
  v15[0] = @"MPModelPropertyTVEpisodeKeepLocalEnableState";
  v15[1] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertyTVEpisodeKeepLocalConstraints";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipTVEpisodeLocalFileAsset";
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipTVEpisodeStoreAsset";
  v14[0] = v5;
  v11 = @"MPModelPropertyStoreAssetRedownloadable";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  int64_t v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

+ (int64_t)genericObjectType
{
  return 6;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

@end
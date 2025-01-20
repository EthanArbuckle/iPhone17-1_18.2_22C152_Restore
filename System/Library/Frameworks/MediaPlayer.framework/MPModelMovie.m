@interface MPModelMovie
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__clips_KEY;
+ (id)__descriptionText_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__duration_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
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
+ (id)__movieInfoDictionary_KEY;
+ (id)__playbackPosition_KEY;
+ (id)__releaseDate_KEY;
+ (id)__storeAsset_KEY;
+ (id)__storeCanonicalID_KEY;
+ (id)__tagline_KEY;
+ (id)__title_KEY;
+ (id)classesForSecureCoding;
+ (id)kindWithVariants:(unint64_t)a3;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyMovieArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieExplicitRating__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieHasCloudSyncSource__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieInfoDictionary__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieKeepLocalConstraints__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieKeepLocalEnableState__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieKeepLocalManagedStatusReason__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieKeepLocalManagedStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieLastDevicePlaybackDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieLibraryAddEligible__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieReleaseDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieStoreCanonicalID__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieTagline__MAPPING_MISSING__;
+ (void)__MPModelPropertyMovieTitle__MAPPING_MISSING__;
+ (void)__MPModelRelationshipMovieClips__MAPPING_MISSING__;
+ (void)__MPModelRelationshipMovieLocalFileAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipMoviePlaybackPosition__MAPPING_MISSING__;
+ (void)__MPModelRelationshipMovieStoreAsset__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)editorialArtworkCatalog;
- (id)humanDescription;
- (id)mediaItemPropertyValues;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (int64_t)libraryRemovalSupportedOptions;
@end

@implementation MPModelMovie

+ (id)__title_KEY
{
  return @"MPModelPropertyMovieTitle";
}

+ (id)__tagline_KEY
{
  return @"MPModelPropertyMovieTagline";
}

+ (id)__storeCanonicalID_KEY
{
  return @"MPModelPropertyMovieStoreCanonicalID";
}

+ (id)__storeAsset_KEY
{
  return @"MPModelRelationshipMovieStoreAsset";
}

+ (id)__releaseDate_KEY
{
  return @"MPModelPropertyMovieReleaseDate";
}

+ (id)__playbackPosition_KEY
{
  return @"MPModelRelationshipMoviePlaybackPosition";
}

+ (id)__movieInfoDictionary_KEY
{
  return @"MPModelPropertyMovieInfoDictionary";
}

+ (id)__localFileAsset_KEY
{
  return @"MPModelRelationshipMovieLocalFileAsset";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyMovieLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyMovieLibraryAddedDate";
}

+ (id)__libraryAddEligible_KEY
{
  return @"MPModelPropertyMovieLibraryAddEligible";
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return @"MPModelPropertyMovieLastDevicePlaybackDate";
}

+ (id)__keepLocalManagedStatus_KEY
{
  return @"MPModelPropertyMovieKeepLocalManagedStatus";
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return @"MPModelPropertyMovieKeepLocalManagedStatusReason";
}

+ (id)__keepLocalEnableState_KEY
{
  return @"MPModelPropertyMovieKeepLocalEnableState";
}

+ (id)__keepLocalConstraints_KEY
{
  return @"MPModelPropertyMovieKeepLocalConstraints";
}

+ (id)__hasCloudSyncSource_KEY
{
  return @"MPModelPropertyMovieHasCloudSyncSource";
}

+ (id)__explicitRating_KEY
{
  return @"MPModelPropertyMovieExplicitRating";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyMovieEditorialArtwork";
}

+ (id)__duration_KEY
{
  return @"MPModelPropertyMovieDuration";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertyMovieDownloadedDate";
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyMovieDescriptionText";
}

+ (id)__clips_KEY
{
  return @"MPModelRelationshipMovieClips";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyMovieArtwork";
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)[a1 kindWithVariants:a3 options:0];
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelMovieKind kindWithVariants:a3 options:a4];
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyMovieLibraryAddEligible";
  v5[1] = @"MPModelPropertyMovieHasCloudSyncSource";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)mediaItemPropertyValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MPModelMovie_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __63__MPModelMovie_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) title];
  if ([v13 length]) {
    [*(id *)(a1 + 40) setObject:v13 forKey:@"title"];
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
  id v6 = [*(id *)(a1 + 32) identifiers];
  v7 = [v6 universalStore];
  uint64_t v8 = [v7 subscriptionAdamID];

  if (v8)
  {
    id v9 = *(void **)(a1 + 40);
    v10 = [NSNumber numberWithLongLong:v8];
    [v9 setObject:v10 forKey:@"storeItemAdamID"];
  }
  if (MPModelMovieIsRestricted(*(void **)(a1 + 32)))
  {
    v11 = *(void **)(a1 + 40);
    v12 = [NSNumber numberWithBool:1];
    [v11 setObject:v12 forKey:@"isExplicit"];
  }
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelMovie *)self editorialArtworkCatalogBlock];
  id v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelMovie *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelMovie *)self artworkCatalogBlock];
  id v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelMovie *))(v3 + 16))(v3, self);
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
  id v4 = [(MPModelObject *)self identifiers];
  v5 = [v4 humanDescription];
  id v6 = [v3 stringWithFormat:@"mediaClip %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyMovieTitle"])
  {
    v7 = NSString;
    uint64_t v8 = [(MPModelMovie *)self title];
    id v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyMovieStoreCanonicalID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:146 description:@"Translator was missing mapping for MPModelPropertyMovieStoreCanonicalID"];
}

+ (void)__MPModelPropertyMovieDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:145 description:@"Translator was missing mapping for MPModelPropertyMovieDownloadedDate"];
}

+ (void)__MPModelPropertyMovieKeepLocalConstraints__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:144 description:@"Translator was missing mapping for MPModelPropertyMovieKeepLocalConstraints"];
}

+ (void)__MPModelPropertyMovieKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:143 description:@"Translator was missing mapping for MPModelPropertyMovieKeepLocalManagedStatusReason"];
}

+ (void)__MPModelPropertyMovieKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:142 description:@"Translator was missing mapping for MPModelPropertyMovieKeepLocalManagedStatus"];
}

+ (void)__MPModelPropertyMovieKeepLocalEnableState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:141 description:@"Translator was missing mapping for MPModelPropertyMovieKeepLocalEnableState"];
}

+ (void)__MPModelPropertyMovieLibraryAddEligible__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:140 description:@"Translator was missing mapping for MPModelPropertyMovieLibraryAddEligible"];
}

+ (void)__MPModelPropertyMovieLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:139 description:@"Translator was missing mapping for MPModelPropertyMovieLastDevicePlaybackDate"];
}

+ (void)__MPModelPropertyMovieLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:138 description:@"Translator was missing mapping for MPModelPropertyMovieLibraryAddedDate"];
}

+ (void)__MPModelPropertyMovieLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:137 description:@"Translator was missing mapping for MPModelPropertyMovieLibraryAdded"];
}

+ (void)__MPModelPropertyMovieHasCloudSyncSource__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:136 description:@"Translator was missing mapping for MPModelPropertyMovieHasCloudSyncSource"];
}

+ (void)__MPModelPropertyMovieDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:135 description:@"Translator was missing mapping for MPModelPropertyMovieDuration"];
}

+ (void)__MPModelPropertyMovieEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:134 description:@"Translator was missing mapping for MPModelPropertyMovieEditorialArtwork"];
}

+ (void)__MPModelPropertyMovieArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:133 description:@"Translator was missing mapping for MPModelPropertyMovieArtwork"];
}

+ (void)__MPModelRelationshipMovieStoreAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:132 description:@"Translator was missing mapping for MPModelRelationshipMovieStoreAsset"];
}

+ (void)__MPModelRelationshipMoviePlaybackPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:131 description:@"Translator was missing mapping for MPModelRelationshipMoviePlaybackPosition"];
}

+ (void)__MPModelRelationshipMovieLocalFileAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:130 description:@"Translator was missing mapping for MPModelRelationshipMovieLocalFileAsset"];
}

+ (void)__MPModelPropertyMovieReleaseDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:129 description:@"Translator was missing mapping for MPModelPropertyMovieReleaseDate"];
}

+ (void)__MPModelRelationshipMovieClips__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:128 description:@"Translator was missing mapping for MPModelRelationshipMovieClips"];
}

+ (void)__MPModelPropertyMovieInfoDictionary__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:127 description:@"Translator was missing mapping for MPModelPropertyMovieInfoDictionary"];
}

+ (void)__MPModelPropertyMovieTagline__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:126 description:@"Translator was missing mapping for MPModelPropertyMovieTagline"];
}

+ (void)__MPModelPropertyMovieExplicitRating__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:125 description:@"Translator was missing mapping for MPModelPropertyMovieExplicitRating"];
}

+ (void)__MPModelPropertyMovieDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:124 description:@"Translator was missing mapping for MPModelPropertyMovieDescriptionText"];
}

+ (void)__MPModelPropertyMovieTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMovie.m" lineNumber:123 description:@"Translator was missing mapping for MPModelPropertyMovieTitle"];
}

+ (id)classesForSecureCoding
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];

  return v2;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  BOOL IsRestricted = MPModelMovieIsRestricted(self);
  int v4 = [(MPModelMovie *)self isLibraryAdded];
  int v5 = [(MPModelMovie *)self isLibraryAddEligible];
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
  v5[0] = @"MPModelPropertyMovieExplicitRating";
  v5[1] = @"MPModelPropertyMovieLibraryAdded";
  v5[2] = @"MPModelPropertyMovieLibraryAddEligible";
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3 = [(MPModelMovie *)self keepLocalManagedStatus];
  int v4 = [(MPModelMovie *)self isLibraryAdded];
  int v5 = [(MPModelMovie *)self localFileAsset];
  uint64_t v6 = [(MPModelMovie *)self storeAsset];
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
  v15[0] = @"MPModelPropertyMovieLibraryAdded";
  v15[1] = @"MPModelPropertyMovieKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertyMovieKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertyMovieKeepLocalConstraints";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipMovieLocalFileAsset";
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipMovieStoreAsset";
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
  int v4 = [(MPModelMovie *)self localFileAsset];
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", [v4 isNonPurgeable]);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setIdentifyingModelObject:self];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setEnableState:[(MPModelMovie *)self keepLocalEnableState]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setManagedStatus:[(MPModelMovie *)self keepLocalManagedStatus]];
  int v5 = [(MPModelMovie *)self storeAsset];
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
  v15[0] = @"MPModelPropertyMovieKeepLocalEnableState";
  v15[1] = @"MPModelPropertyMovieKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertyMovieKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertyMovieKeepLocalConstraints";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipMovieLocalFileAsset";
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipMovieStoreAsset";
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
  return 9;
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
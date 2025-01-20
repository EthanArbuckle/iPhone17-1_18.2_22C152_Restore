@interface MPModelAlbum
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)__artist_KEY;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__classicalExperienceAvailable_KEY;
+ (id)__classical_KEY;
+ (id)__compilation_KEY;
+ (id)__copyrightText_KEY;
+ (id)__dateFavorited_KEY;
+ (id)__discCount_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__editorNotes_KEY;
+ (id)__genre_KEY;
+ (id)__hasCleanContent_KEY;
+ (id)__hasExplicitContent_KEY;
+ (id)__isDisliked_KEY;
+ (id)__isFavorite_KEY;
+ (id)__keepLocalConstraints_KEY;
+ (id)__keepLocalEnableState_KEY;
+ (id)__keepLocalManagedStatusReason_KEY;
+ (id)__keepLocalManagedStatus_KEY;
+ (id)__lastDevicePlaybackDate_KEY;
+ (id)__libraryAddEligible_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__libraryAdded_KEY;
+ (id)__maximumItemTrackNumber_KEY;
+ (id)__preorder_KEY;
+ (id)__releaseDateComponents_KEY;
+ (id)__representativeSong_KEY;
+ (id)__shortEditorNotes_KEY;
+ (id)__songPopularityBlock_KEY;
+ (id)__storeRedownloadable_KEY;
+ (id)__title_KEY;
+ (id)__trackCount_KEY;
+ (id)__traits_KEY;
+ (id)__versionHash_KEY;
+ (id)__volumeNormalization_KEY;
+ (id)__year_KEY;
+ (id)kindWithSongKind:(id)a3;
+ (id)kindWithSongKind:(id)a3 options:(unint64_t)a4;
+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4;
+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyAlbumArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumClassicalExperienceAvailable__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumCopyrightText__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumDateFavorited__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumDiscCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumHasCleanContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumHasExplicitContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumIsClassical__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumIsCompilation__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumIsDisliked__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumIsFavorite__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumIsStoreRedownloadable__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumKeepLocalConstraints__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumKeepLocalEnableState__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumKeepLocalManagedStatusReason__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumKeepLocalManagedStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumLastDevicePlaybackDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumLibraryAddEligible__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumMaximumItemTrackNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumPreorder__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumReleaseDateComponents__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumShortEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumSongPopularity__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumTrackCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumTraits__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumVersionHash__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumVolumeNormalization__MAPPING_MISSING__;
+ (void)__MPModelPropertyAlbumYear__MAPPING_MISSING__;
+ (void)__MPModelRelationshipAlbumArtist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipAlbumGenre__MAPPING_MISSING__;
+ (void)__MPModelRelationshipAlbumRepresentativeSong__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)contentItemCollectionInfo;
- (id)humanDescription;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)songPopularityForIdentifiers:(id)a3;
- (int64_t)libraryRemovalSupportedOptions;
@end

@implementation MPModelAlbum

+ (id)__year_KEY
{
  return @"MPModelPropertyAlbumYear";
}

+ (id)__volumeNormalization_KEY
{
  return @"MPModelPropertyAlbumVolumeNormalization";
}

+ (id)__versionHash_KEY
{
  return @"MPModelPropertyAlbumVersionHash";
}

+ (id)__traits_KEY
{
  return @"MPModelPropertyAlbumTraits";
}

+ (id)__trackCount_KEY
{
  return @"MPModelPropertyAlbumTrackCount";
}

+ (id)__title_KEY
{
  return @"MPModelPropertyAlbumTitle";
}

+ (id)__storeRedownloadable_KEY
{
  return @"MPModelPropertyAlbumIsStoreRedownloadable";
}

+ (id)__songPopularityBlock_KEY
{
  return @"MPModelPropertyAlbumSongPopularity";
}

+ (id)__shortEditorNotes_KEY
{
  return @"MPModelPropertyAlbumShortEditorNotes";
}

+ (id)__representativeSong_KEY
{
  return @"MPModelRelationshipAlbumRepresentativeSong";
}

+ (id)__releaseDateComponents_KEY
{
  return @"MPModelPropertyAlbumReleaseDateComponents";
}

+ (id)__preorder_KEY
{
  return @"MPModelPropertyAlbumPreorder";
}

+ (id)__maximumItemTrackNumber_KEY
{
  return @"MPModelPropertyAlbumMaximumItemTrackNumber";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyAlbumLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyAlbumLibraryAddedDate";
}

+ (id)__libraryAddEligible_KEY
{
  return @"MPModelPropertyAlbumLibraryAddEligible";
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return @"MPModelPropertyAlbumLastDevicePlaybackDate";
}

+ (id)__keepLocalManagedStatus_KEY
{
  return @"MPModelPropertyAlbumKeepLocalManagedStatus";
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return @"MPModelPropertyAlbumKeepLocalManagedStatusReason";
}

+ (id)__keepLocalEnableState_KEY
{
  return @"MPModelPropertyAlbumKeepLocalEnableState";
}

+ (id)__keepLocalConstraints_KEY
{
  return @"MPModelPropertyAlbumKeepLocalConstraints";
}

+ (id)__isFavorite_KEY
{
  return @"MPModelPropertyAlbumIsFavorite";
}

+ (id)__isDisliked_KEY
{
  return @"MPModelPropertyAlbumIsDisliked";
}

+ (id)__hasExplicitContent_KEY
{
  return @"MPModelPropertyAlbumHasExplicitContent";
}

+ (id)__hasCleanContent_KEY
{
  return @"MPModelPropertyAlbumHasCleanContent";
}

+ (id)__genre_KEY
{
  return @"MPModelRelationshipAlbumGenre";
}

+ (id)__editorNotes_KEY
{
  return @"MPModelPropertyAlbumEditorNotes";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertyAlbumDownloadedDate";
}

+ (id)__discCount_KEY
{
  return @"MPModelPropertyAlbumDiscCount";
}

+ (id)__dateFavorited_KEY
{
  return @"MPModelPropertyAlbumDateFavorited";
}

+ (id)__copyrightText_KEY
{
  return @"MPModelPropertyAlbumCopyrightText";
}

+ (id)__compilation_KEY
{
  return @"MPModelPropertyAlbumIsCompilation";
}

+ (id)__classical_KEY
{
  return @"MPModelPropertyAlbumIsClassical";
}

+ (id)__classicalExperienceAvailable_KEY
{
  return @"MPModelPropertyAlbumClassicalExperienceAvailable";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyAlbumArtwork";
}

+ (id)__artist_KEY
{
  return @"MPModelRelationshipAlbumArtist";
}

+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5
{
  return +[MPModelAlbumKind kindWithVariants:a3 songKind:a4 options:a5];
}

+ (id)kindWithSongKind:(id)a3
{
  return (id)[a1 kindWithVariants:3 songKind:a3 options:0];
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyAlbumLibraryAddEligible";
  v5[1] = @"MPModelPropertyAlbumIsFavorite";
  v5[2] = @"MPModelPropertyAlbumIsDisliked";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelAlbum *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelAlbum *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentItemCollectionInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"_MPNowPlayingCollectionInfoCollectionTypeAlbum" forKey:@"_MPNowPlayingCollectionInfoKeyCollectionType"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__MPModelAlbum_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __65__MPModelAlbum_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) identifiers];
  v2 = [*(id *)(a1 + 32) title];
  if ([v2 length]) {
    [*(id *)(a1 + 40) setObject:v2 forKey:@"_MPNowPlayingCollectionInfoKeyTitle"];
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v9 universalStore];
  uint64_t v5 = [v4 adamID];

  if (v5) {
    goto LABEL_6;
  }
  id v6 = [v9 universalStore];
  uint64_t v5 = [v6 purchasedAdamID];

  if (v5
    || ([v9 universalStore],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v7 subscriptionAdamID],
        v7,
        v5))
  {
LABEL_6:
    v8 = [NSNumber numberWithLongLong:v5];
    [v3 setObject:v8 forKey:@"_MPNowPlayingInfoPropertyAlbumiTunesStoreAdamIdentifier"];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 40) setObject:v3 forKey:@"_MPNowPlayingCollectionInfoKeyIdentifiers"];
  }
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3 = [(MPModelAlbum *)self isLibraryAdded];
  int v4 = [(MPModelAlbum *)self hasCleanContent];
  int v5 = [(MPModelAlbum *)self hasExplicitContent];
  int v6 = [(MPModelAlbum *)self isLibraryAddEligible];
  uint64_t v7 = 0x100000000;
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 0x1000000;
  if (!v5) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = 0x10000;
  if (!v4) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 257;
  if (!v3) {
    uint64_t v10 = 1;
  }
  return (MPLibraryAddStatusObserverConfiguration)(v10 | v9 | v8 | v7);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyAlbumHasCleanContent";
  v5[1] = @"MPModelPropertyAlbumHasExplicitContent";
  v5[2] = @"MPModelPropertyAlbumLibraryAddEligible";
  v5[3] = @"MPModelPropertyAlbumLibraryAdded";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  int v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  if ([(MPModelAlbum *)self isLibraryAdded]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 | ([(MPModelAlbum *)self keepLocalManagedStatus] == 2);
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

+ (id)requiredLibraryRemovalProperties
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyAlbumLibraryAdded";
  v5[1] = @"MPModelPropertyAlbumKeepLocalManagedStatus";
  v5[2] = @"MPModelPropertyAlbumKeepLocalManagedStatusReason";
  v5[3] = @"MPModelPropertyAlbumKeepLocalConstraints";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  uint64_t v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setIdentifyingModelObject:self];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setManagedStatus:[(MPModelAlbum *)self keepLocalManagedStatus]];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setEnableState:[(MPModelAlbum *)self keepLocalEnableState]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setCollectionType:1];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setStoreRedownloadable:[(MPModelAlbum *)self isStoreRedownloadable]];
  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyAlbumKeepLocalManagedStatus";
  v5[1] = @"MPModelPropertyAlbumKeepLocalManagedStatusReason";
  v5[2] = @"MPModelPropertyAlbumKeepLocalEnableState";
  v5[3] = @"MPModelPropertyAlbumKeepLocalConstraints";
  void v5[4] = @"MPModelPropertyAlbumIsStoreRedownloadable";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (int64_t)genericObjectType
{
  return 2;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

- (id)songPopularityForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPModelAlbum *)self songPopularityBlock];
  int v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = (*(void (**)(uint64_t, MPModelAlbum *, id))(v5 + 16))(v5, self, v4);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(MPModelObject *)self identifiers];
  uint64_t v5 = [v4 humanDescription];
  int v6 = [v3 stringWithFormat:@"album %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyAlbumTitle"])
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [(MPModelAlbum *)self title];
    uint64_t v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyAlbumIsStoreRedownloadable__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:155 description:@"Translator was missing mapping for MPModelPropertyAlbumIsStoreRedownloadable"];
}

+ (void)__MPModelPropertyAlbumDateFavorited__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:154 description:@"Translator was missing mapping for MPModelPropertyAlbumDateFavorited"];
}

+ (void)__MPModelPropertyAlbumIsDisliked__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:153 description:@"Translator was missing mapping for MPModelPropertyAlbumIsDisliked"];
}

+ (void)__MPModelPropertyAlbumIsFavorite__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:152 description:@"Translator was missing mapping for MPModelPropertyAlbumIsFavorite"];
}

+ (void)__MPModelPropertyAlbumVersionHash__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:151 description:@"Translator was missing mapping for MPModelPropertyAlbumVersionHash"];
}

+ (void)__MPModelPropertyAlbumClassicalExperienceAvailable__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:150 description:@"Translator was missing mapping for MPModelPropertyAlbumClassicalExperienceAvailable"];
}

+ (void)__MPModelPropertyAlbumTraits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:149 description:@"Translator was missing mapping for MPModelPropertyAlbumTraits"];
}

+ (void)__MPModelPropertyAlbumDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:148 description:@"Translator was missing mapping for MPModelPropertyAlbumDownloadedDate"];
}

+ (void)__MPModelPropertyAlbumSongPopularity__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:147 description:@"Translator was missing mapping for MPModelPropertyAlbumSongPopularity"];
}

+ (void)__MPModelPropertyAlbumShortEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:146 description:@"Translator was missing mapping for MPModelPropertyAlbumShortEditorNotes"];
}

+ (void)__MPModelPropertyAlbumEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:145 description:@"Translator was missing mapping for MPModelPropertyAlbumEditorNotes"];
}

+ (void)__MPModelPropertyAlbumPreorder__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:144 description:@"Translator was missing mapping for MPModelPropertyAlbumPreorder"];
}

+ (void)__MPModelPropertyAlbumLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:143 description:@"Translator was missing mapping for MPModelPropertyAlbumLastDevicePlaybackDate"];
}

+ (void)__MPModelPropertyAlbumLibraryAddEligible__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:142 description:@"Translator was missing mapping for MPModelPropertyAlbumLibraryAddEligible"];
}

+ (void)__MPModelPropertyAlbumKeepLocalConstraints__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:141 description:@"Translator was missing mapping for MPModelPropertyAlbumKeepLocalConstraints"];
}

+ (void)__MPModelPropertyAlbumKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:140 description:@"Translator was missing mapping for MPModelPropertyAlbumKeepLocalManagedStatusReason"];
}

+ (void)__MPModelPropertyAlbumKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:139 description:@"Translator was missing mapping for MPModelPropertyAlbumKeepLocalManagedStatus"];
}

+ (void)__MPModelPropertyAlbumKeepLocalEnableState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:138 description:@"Translator was missing mapping for MPModelPropertyAlbumKeepLocalEnableState"];
}

+ (void)__MPModelPropertyAlbumVolumeNormalization__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:137 description:@"Translator was missing mapping for MPModelPropertyAlbumVolumeNormalization"];
}

+ (void)__MPModelPropertyAlbumLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:136 description:@"Translator was missing mapping for MPModelPropertyAlbumLibraryAdded"];
}

+ (void)__MPModelPropertyAlbumYear__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:135 description:@"Translator was missing mapping for MPModelPropertyAlbumYear"];
}

+ (void)__MPModelPropertyAlbumLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:134 description:@"Translator was missing mapping for MPModelPropertyAlbumLibraryAddedDate"];
}

+ (void)__MPModelPropertyAlbumCopyrightText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:133 description:@"Translator was missing mapping for MPModelPropertyAlbumCopyrightText"];
}

+ (void)__MPModelPropertyAlbumArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:132 description:@"Translator was missing mapping for MPModelPropertyAlbumArtwork"];
}

+ (void)__MPModelPropertyAlbumReleaseDateComponents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:131 description:@"Translator was missing mapping for MPModelPropertyAlbumReleaseDateComponents"];
}

+ (void)__MPModelPropertyAlbumIsClassical__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:130 description:@"Translator was missing mapping for MPModelPropertyAlbumIsClassical"];
}

+ (void)__MPModelPropertyAlbumIsCompilation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:129 description:@"Translator was missing mapping for MPModelPropertyAlbumIsCompilation"];
}

+ (void)__MPModelPropertyAlbumHasExplicitContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:128 description:@"Translator was missing mapping for MPModelPropertyAlbumHasExplicitContent"];
}

+ (void)__MPModelPropertyAlbumHasCleanContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:127 description:@"Translator was missing mapping for MPModelPropertyAlbumHasCleanContent"];
}

+ (void)__MPModelPropertyAlbumDiscCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:126 description:@"Translator was missing mapping for MPModelPropertyAlbumDiscCount"];
}

+ (void)__MPModelPropertyAlbumMaximumItemTrackNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:125 description:@"Translator was missing mapping for MPModelPropertyAlbumMaximumItemTrackNumber"];
}

+ (void)__MPModelPropertyAlbumTrackCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:124 description:@"Translator was missing mapping for MPModelPropertyAlbumTrackCount"];
}

+ (void)__MPModelRelationshipAlbumRepresentativeSong__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:123 description:@"Translator was missing mapping for MPModelRelationshipAlbumRepresentativeSong"];
}

+ (void)__MPModelRelationshipAlbumGenre__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:122 description:@"Translator was missing mapping for MPModelRelationshipAlbumGenre"];
}

+ (void)__MPModelRelationshipAlbumArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:121 description:@"Translator was missing mapping for MPModelRelationshipAlbumArtist"];
}

+ (void)__MPModelPropertyAlbumTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelAlbum.m" lineNumber:120 description:@"Translator was missing mapping for MPModelPropertyAlbumTitle"];
}

+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4
{
  return (id)[a1 kindWithVariants:a3 songKind:a4 options:0];
}

+ (id)kindWithSongKind:(id)a3 options:(unint64_t)a4
{
  return (id)[a1 kindWithVariants:3 songKind:a3 options:a4];
}

@end
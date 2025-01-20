@interface MPModelSong
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)__album_KEY;
+ (id)__artistUploadedContent_KEY;
+ (id)__artist_KEY;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__beatsPerMinute_KEY;
+ (id)__classicalMovementCount_KEY;
+ (id)__classicalMovementNumber_KEY;
+ (id)__classicalMovement_KEY;
+ (id)__classicalWork_KEY;
+ (id)__cloudStatus_KEY;
+ (id)__composer_KEY;
+ (id)__copyrightText_KEY;
+ (id)__dateFavorited_KEY;
+ (id)__discNumber_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__duration_KEY;
+ (id)__explicitSong_KEY;
+ (id)__gaplessInfo_KEY;
+ (id)__genre_KEY;
+ (id)__grouping_KEY;
+ (id)__hasCloudSyncSource_KEY;
+ (id)__hasCredits_KEY;
+ (id)__hasVideo_KEY;
+ (id)__homeSharingAsset_KEY;
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
+ (id)__localFileAsset_KEY;
+ (id)__lyrics_KEY;
+ (id)__playCount_KEY;
+ (id)__playbackPosition_KEY;
+ (id)__previewAsset_KEY;
+ (id)__shouldShowComposer_KEY;
+ (id)__skipCount_KEY;
+ (id)__storeAsset_KEY;
+ (id)__supportsExtendedLyricsAttribute_KEY;
+ (id)__title_KEY;
+ (id)__trackCount_KEY;
+ (id)__trackNumber_KEY;
+ (id)__traits_KEY;
+ (id)__userRating_KEY;
+ (id)__volumeAdjustment_KEY;
+ (id)__volumeNormalization_KEY;
+ (id)__year_KEY;
+ (id)kindWithVariants:(unint64_t)a3;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertySongArtistUploadedContent__MAPPING_MISSING__;
+ (void)__MPModelPropertySongArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertySongBeatsPerMinute__MAPPING_MISSING__;
+ (void)__MPModelPropertySongClassicalMovementCount__MAPPING_MISSING__;
+ (void)__MPModelPropertySongClassicalMovementNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertySongClassicalMovement__MAPPING_MISSING__;
+ (void)__MPModelPropertySongClassicalWork__MAPPING_MISSING__;
+ (void)__MPModelPropertySongCloudStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertySongCopyrightText__MAPPING_MISSING__;
+ (void)__MPModelPropertySongDateFavorited__MAPPING_MISSING__;
+ (void)__MPModelPropertySongDiscNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertySongDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertySongDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertySongExplicit__MAPPING_MISSING__;
+ (void)__MPModelPropertySongGaplessInfo__MAPPING_MISSING__;
+ (void)__MPModelPropertySongGrouping__MAPPING_MISSING__;
+ (void)__MPModelPropertySongHasCloudSyncSource__MAPPING_MISSING__;
+ (void)__MPModelPropertySongHasCredits__MAPPING_MISSING__;
+ (void)__MPModelPropertySongHasVideo__MAPPING_MISSING__;
+ (void)__MPModelPropertySongIsDisliked__MAPPING_MISSING__;
+ (void)__MPModelPropertySongIsFavorite__MAPPING_MISSING__;
+ (void)__MPModelPropertySongKeepLocalConstraints__MAPPING_MISSING__;
+ (void)__MPModelPropertySongKeepLocalEnableState__MAPPING_MISSING__;
+ (void)__MPModelPropertySongKeepLocalManagedStatusReason__MAPPING_MISSING__;
+ (void)__MPModelPropertySongKeepLocalManagedStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertySongLastDevicePlaybackDate__MAPPING_MISSING__;
+ (void)__MPModelPropertySongLibraryAddEligible__MAPPING_MISSING__;
+ (void)__MPModelPropertySongLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertySongLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertySongPlayCount__MAPPING_MISSING__;
+ (void)__MPModelPropertySongShouldShowComposer__MAPPING_MISSING__;
+ (void)__MPModelPropertySongSkipCount__MAPPING_MISSING__;
+ (void)__MPModelPropertySongSupportsExtendedLyricsAttribute__MAPPING_MISSING__;
+ (void)__MPModelPropertySongTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertySongTrackNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertySongTraits__MAPPING_MISSING__;
+ (void)__MPModelPropertySongUserRating__MAPPING_MISSING__;
+ (void)__MPModelPropertySongVolumeAdjustment__MAPPING_MISSING__;
+ (void)__MPModelPropertySongVolumeNormalization__MAPPING_MISSING__;
+ (void)__MPModelPropertySongYear__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongAlbum__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongArtist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongComposer__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongGenre__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongHomeSharingAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongLocalFileAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongLyrics__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongPlaybackPosition__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongPreviewAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipSongStoreAsset__MAPPING_MISSING__;
+ (void)___MPModelPropertySongTrackCount__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)humanDescription;
- (id)mediaItemPropertyValues;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (int64_t)libraryRemovalSupportedOptions;
@end

@implementation MPModelSong

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)[a1 kindWithVariants:a3 options:0];
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelSongKind kindWithVariants:a3 options:a4];
}

+ (id)__year_KEY
{
  return @"MPModelPropertySongYear";
}

+ (id)__volumeNormalization_KEY
{
  return @"MPModelPropertySongVolumeNormalization";
}

+ (id)__volumeAdjustment_KEY
{
  return @"MPModelPropertySongVolumeAdjustment";
}

+ (id)__userRating_KEY
{
  return @"MPModelPropertySongUserRating";
}

+ (id)__traits_KEY
{
  return @"MPModelPropertySongTraits";
}

+ (id)__trackNumber_KEY
{
  return @"MPModelPropertySongTrackNumber";
}

+ (id)__trackCount_KEY
{
  return @"_MPModelPropertySongTrackCount";
}

+ (id)__title_KEY
{
  return @"MPModelPropertySongTitle";
}

+ (id)__supportsExtendedLyricsAttribute_KEY
{
  return @"MPModelPropertySongSupportsExtendedLyricsAttribute";
}

+ (id)__storeAsset_KEY
{
  return @"MPModelRelationshipSongStoreAsset";
}

+ (id)__skipCount_KEY
{
  return @"MPModelPropertySongSkipCount";
}

+ (id)__shouldShowComposer_KEY
{
  return @"MPModelPropertySongShouldShowComposer";
}

+ (id)__previewAsset_KEY
{
  return @"MPModelRelationshipSongPreviewAsset";
}

+ (id)__playbackPosition_KEY
{
  return @"MPModelRelationshipSongPlaybackPosition";
}

+ (id)__playCount_KEY
{
  return @"MPModelPropertySongPlayCount";
}

+ (id)__lyrics_KEY
{
  return @"MPModelRelationshipSongLyrics";
}

+ (id)__localFileAsset_KEY
{
  return @"MPModelRelationshipSongLocalFileAsset";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertySongLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertySongLibraryAddedDate";
}

+ (id)__libraryAddEligible_KEY
{
  return @"MPModelPropertySongLibraryAddEligible";
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return @"MPModelPropertySongLastDevicePlaybackDate";
}

+ (id)__keepLocalManagedStatus_KEY
{
  return @"MPModelPropertySongKeepLocalManagedStatus";
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return @"MPModelPropertySongKeepLocalManagedStatusReason";
}

+ (id)__keepLocalEnableState_KEY
{
  return @"MPModelPropertySongKeepLocalEnableState";
}

+ (id)__keepLocalConstraints_KEY
{
  return @"MPModelPropertySongKeepLocalConstraints";
}

+ (id)__isFavorite_KEY
{
  return @"MPModelPropertySongIsFavorite";
}

+ (id)__isDisliked_KEY
{
  return @"MPModelPropertySongIsDisliked";
}

+ (id)__homeSharingAsset_KEY
{
  return @"MPModelRelationshipSongHomeSharingAsset";
}

+ (id)__hasVideo_KEY
{
  return @"MPModelPropertySongHasVideo";
}

+ (id)__hasCredits_KEY
{
  return @"MPModelPropertySongHasCredits";
}

+ (id)__hasCloudSyncSource_KEY
{
  return @"MPModelPropertySongHasCloudSyncSource";
}

+ (id)__grouping_KEY
{
  return @"MPModelPropertySongGrouping";
}

+ (id)__genre_KEY
{
  return @"MPModelRelationshipSongGenre";
}

+ (id)__gaplessInfo_KEY
{
  return @"MPModelPropertySongGaplessInfo";
}

+ (id)__explicitSong_KEY
{
  return @"MPModelPropertySongExplicit";
}

+ (id)__duration_KEY
{
  return @"MPModelPropertySongDuration";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertySongDownloadedDate";
}

+ (id)__discNumber_KEY
{
  return @"MPModelPropertySongDiscNumber";
}

+ (id)__dateFavorited_KEY
{
  return @"MPModelPropertySongDateFavorited";
}

+ (id)__copyrightText_KEY
{
  return @"MPModelPropertySongCopyrightText";
}

+ (id)__composer_KEY
{
  return @"MPModelRelationshipSongComposer";
}

+ (id)__cloudStatus_KEY
{
  return @"MPModelPropertySongCloudStatus";
}

+ (id)__classicalWork_KEY
{
  return @"MPModelPropertySongClassicalWork";
}

+ (id)__classicalMovement_KEY
{
  return @"MPModelPropertySongClassicalMovement";
}

+ (id)__classicalMovementNumber_KEY
{
  return @"MPModelPropertySongClassicalMovementNumber";
}

+ (id)__classicalMovementCount_KEY
{
  return @"MPModelPropertySongClassicalMovementCount";
}

+ (id)__beatsPerMinute_KEY
{
  return @"MPModelPropertySongBeatsPerMinute";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertySongArtwork";
}

+ (id)__artist_KEY
{
  return @"MPModelRelationshipSongArtist";
}

+ (id)__artistUploadedContent_KEY
{
  return @"MPModelPropertySongArtistUploadedContent";
}

+ (id)__album_KEY
{
  return @"MPModelRelationshipSongAlbum";
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertySongLibraryAddEligible";
  v5[1] = @"MPModelPropertySongHasCloudSyncSource";
  v5[2] = @"MPModelPropertySongLibraryAdded";
  v5[3] = @"MPModelPropertySongIsFavorite";
  v5[4] = @"MPModelPropertySongIsDisliked";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelSong *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelSong *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3 = [(MPModelSong *)self isExplicitSong];
  char v4 = ~[(MPModelSong *)self isArtistUploadedContent];
  int v5 = [(MPModelSong *)self isLibraryAdded];
  int v6 = [(MPModelSong *)self isLibraryAddEligible];
  uint64_t v7 = 0x100000000;
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 256;
  if (!v5) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = 0x10000;
  if (v3) {
    uint64_t v9 = 0x1000000;
  }
  return (MPLibraryAddStatusObserverConfiguration)(v9 & 0xFFFFFFFFFFFFFFFELL | v4 & 1 | v8 | v7);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertySongExplicit";
  v5[1] = @"MPModelPropertySongArtistUploadedContent";
  v5[2] = @"MPModelPropertySongLibraryAdded";
  v5[3] = @"MPModelPropertySongLibraryAddEligible";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  int v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (id)requiredLibraryRemovalProperties
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v15[0] = @"MPModelPropertySongLibraryAdded";
  v15[1] = @"MPModelPropertySongKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertySongKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertySongKeepLocalConstraints";
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipSongLocalFileAsset";
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipSongStoreAsset";
  v14[0] = v5;
  v11 = @"MPModelPropertyStoreAssetRedownloadable";
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  uint64_t v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v15[0] = @"MPModelPropertySongKeepLocalEnableState";
  v15[1] = @"MPModelPropertySongKeepLocalManagedStatus";
  v15[2] = @"MPModelPropertySongKeepLocalManagedStatusReason";
  v15[3] = @"MPModelPropertySongKeepLocalConstraints";
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v12 = @"MPModelPropertyFileAssetNonPurgeable";
  v13[0] = @"MPModelRelationshipSongLocalFileAsset";
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipSongStoreAsset";
  v14[0] = v5;
  v11 = @"MPModelPropertyStoreAssetRedownloadable";
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  uint64_t v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

- (id)humanDescription
{
  int v3 = @"song";
  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertySongHasVideo"]
    && [(MPModelSong *)self hasVideo])
  {
    int v3 = @"musicVideo";
  }
  char v4 = (void *)MEMORY[0x1E4F28E78];
  int v5 = [(MPModelObject *)self identifiers];
  int v6 = [v5 humanDescription];
  uint64_t v7 = [v4 stringWithFormat:@"%@ %@", v3, v6];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertySongTitle"])
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [(MPModelSong *)self title];
    v10 = [v8 stringWithFormat:@"“%@” ", v9];

    [v7 insertString:v10 atIndex:0];
  }

  return v7;
}

+ (void)__MPModelPropertySongHasCredits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:161 description:@"Translator was missing mapping for MPModelPropertySongHasCredits"];
}

+ (void)__MPModelPropertySongSupportsExtendedLyricsAttribute__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:160 description:@"Translator was missing mapping for MPModelPropertySongSupportsExtendedLyricsAttribute"];
}

+ (void)__MPModelPropertySongDateFavorited__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:159 description:@"Translator was missing mapping for MPModelPropertySongDateFavorited"];
}

+ (void)__MPModelPropertySongIsDisliked__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:158 description:@"Translator was missing mapping for MPModelPropertySongIsDisliked"];
}

+ (void)__MPModelPropertySongIsFavorite__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:157 description:@"Translator was missing mapping for MPModelPropertySongIsFavorite"];
}

+ (void)__MPModelPropertySongTraits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:156 description:@"Translator was missing mapping for MPModelPropertySongTraits"];
}

+ (void)__MPModelPropertySongDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:155 description:@"Translator was missing mapping for MPModelPropertySongDownloadedDate"];
}

+ (void)__MPModelRelationshipSongPlaybackPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:154 description:@"Translator was missing mapping for MPModelRelationshipSongPlaybackPosition"];
}

+ (void)__MPModelPropertySongVolumeAdjustment__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:153 description:@"Translator was missing mapping for MPModelPropertySongVolumeAdjustment"];
}

+ (void)__MPModelPropertySongGaplessInfo__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:152 description:@"Translator was missing mapping for MPModelPropertySongGaplessInfo"];
}

+ (void)__MPModelPropertySongCloudStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:151 description:@"Translator was missing mapping for MPModelPropertySongCloudStatus"];
}

+ (void)__MPModelPropertySongUserRating__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:150 description:@"Translator was missing mapping for MPModelPropertySongUserRating"];
}

+ (void)__MPModelRelationshipSongPreviewAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:149 description:@"Translator was missing mapping for MPModelRelationshipSongPreviewAsset"];
}

+ (void)__MPModelRelationshipSongStoreAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:148 description:@"Translator was missing mapping for MPModelRelationshipSongStoreAsset"];
}

+ (void)__MPModelRelationshipSongHomeSharingAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:147 description:@"Translator was missing mapping for MPModelRelationshipSongHomeSharingAsset"];
}

+ (void)__MPModelPropertySongYear__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:146 description:@"Translator was missing mapping for MPModelPropertySongYear"];
}

+ (void)__MPModelPropertySongClassicalMovementNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:145 description:@"Translator was missing mapping for MPModelPropertySongClassicalMovementNumber"];
}

+ (void)__MPModelPropertySongClassicalMovementCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:144 description:@"Translator was missing mapping for MPModelPropertySongClassicalMovementCount"];
}

+ (void)__MPModelPropertySongClassicalMovement__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:143 description:@"Translator was missing mapping for MPModelPropertySongClassicalMovement"];
}

+ (void)__MPModelPropertySongClassicalWork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:142 description:@"Translator was missing mapping for MPModelPropertySongClassicalWork"];
}

+ (void)__MPModelPropertySongHasCloudSyncSource__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:141 description:@"Translator was missing mapping for MPModelPropertySongHasCloudSyncSource"];
}

+ (void)__MPModelPropertySongLibraryAddEligible__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:140 description:@"Translator was missing mapping for MPModelPropertySongLibraryAddEligible"];
}

+ (void)__MPModelPropertySongLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:139 description:@"Translator was missing mapping for MPModelPropertySongLastDevicePlaybackDate"];
}

+ (void)__MPModelPropertySongLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:138 description:@"Translator was missing mapping for MPModelPropertySongLibraryAddedDate"];
}

+ (void)__MPModelPropertySongLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:137 description:@"Translator was missing mapping for MPModelPropertySongLibraryAdded"];
}

+ (void)__MPModelPropertySongKeepLocalConstraints__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:136 description:@"Translator was missing mapping for MPModelPropertySongKeepLocalConstraints"];
}

+ (void)__MPModelPropertySongKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:135 description:@"Translator was missing mapping for MPModelPropertySongKeepLocalManagedStatusReason"];
}

+ (void)__MPModelPropertySongKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:134 description:@"Translator was missing mapping for MPModelPropertySongKeepLocalManagedStatus"];
}

+ (void)__MPModelPropertySongKeepLocalEnableState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:133 description:@"Translator was missing mapping for MPModelPropertySongKeepLocalEnableState"];
}

+ (void)__MPModelRelationshipSongLocalFileAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:132 description:@"Translator was missing mapping for MPModelRelationshipSongLocalFileAsset"];
}

+ (void)__MPModelPropertySongArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:131 description:@"Translator was missing mapping for MPModelPropertySongArtwork"];
}

+ (void)__MPModelPropertySongVolumeNormalization__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:130 description:@"Translator was missing mapping for MPModelPropertySongVolumeNormalization"];
}

+ (void)__MPModelPropertySongShouldShowComposer__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:129 description:@"Translator was missing mapping for MPModelPropertySongShouldShowComposer"];
}

+ (void)__MPModelRelationshipSongLyrics__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:128 description:@"Translator was missing mapping for MPModelRelationshipSongLyrics"];
}

+ (void)__MPModelPropertySongBeatsPerMinute__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:127 description:@"Translator was missing mapping for MPModelPropertySongBeatsPerMinute"];
}

+ (void)__MPModelPropertySongHasVideo__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:126 description:@"Translator was missing mapping for MPModelPropertySongHasVideo"];
}

+ (void)__MPModelPropertySongArtistUploadedContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:125 description:@"Translator was missing mapping for MPModelPropertySongArtistUploadedContent"];
}

+ (void)__MPModelPropertySongExplicit__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:124 description:@"Translator was missing mapping for MPModelPropertySongExplicit"];
}

+ (void)__MPModelPropertySongSkipCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:123 description:@"Translator was missing mapping for MPModelPropertySongSkipCount"];
}

+ (void)__MPModelPropertySongPlayCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:122 description:@"Translator was missing mapping for MPModelPropertySongPlayCount"];
}

+ (void)__MPModelPropertySongDiscNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:121 description:@"Translator was missing mapping for MPModelPropertySongDiscNumber"];
}

+ (void)__MPModelPropertySongTrackNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:120 description:@"Translator was missing mapping for MPModelPropertySongTrackNumber"];
}

+ (void)___MPModelPropertySongTrackCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:119 description:@"Translator was missing mapping for _MPModelPropertySongTrackCount"];
}

+ (void)__MPModelPropertySongDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:118 description:@"Translator was missing mapping for MPModelPropertySongDuration"];
}

+ (void)__MPModelPropertySongCopyrightText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:117 description:@"Translator was missing mapping for MPModelPropertySongCopyrightText"];
}

+ (void)__MPModelPropertySongGrouping__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:116 description:@"Translator was missing mapping for MPModelPropertySongGrouping"];
}

+ (void)__MPModelRelationshipSongComposer__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:115 description:@"Translator was missing mapping for MPModelRelationshipSongComposer"];
}

+ (void)__MPModelRelationshipSongGenre__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:114 description:@"Translator was missing mapping for MPModelRelationshipSongGenre"];
}

+ (void)__MPModelRelationshipSongArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:113 description:@"Translator was missing mapping for MPModelRelationshipSongArtist"];
}

+ (void)__MPModelRelationshipSongAlbum__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:112 description:@"Translator was missing mapping for MPModelRelationshipSongAlbum"];
}

+ (void)__MPModelPropertySongTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSong.m" lineNumber:111 description:@"Translator was missing mapping for MPModelPropertySongTitle"];
}

- (id)mediaItemPropertyValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MPModelSong_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

void __62__MPModelSong_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
{
  id v56 = [*(id *)(a1 + 32) title];
  if ([v56 length]) {
    [*(id *)(a1 + 40) setObject:v56 forKey:@"title"];
  }
  [*(id *)(a1 + 32) duration];
  [*(id *)(a1 + 32) duration];
  if (v2 > 0.0)
  {
    id v3 = NSNumber;
    id v4 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) duration];
    int v5 = objc_msgSend(v3, "numberWithDouble:");
    [v4 setObject:v5 forKey:@"playbackDuration"];
  }
  id v6 = [*(id *)(a1 + 32) artist];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 identifiers];
    id v9 = [v8 personalizedStore];
    uint64_t v10 = [v9 cloudID];

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      v12 = [NSNumber numberWithLongLong:v10];
      [v11 setObject:v12 forKey:@"storeArtistAdamID"];
    }
    v13 = [v7 name];
    if ([v13 length]) {
      [*(id *)(a1 + 40) setObject:v13 forKey:@"artist"];
    }
  }
  v14 = [*(id *)(a1 + 32) album];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 title];
    if ([v16 length]) {
      [*(id *)(a1 + 40) setObject:v16 forKey:@"albumTitle"];
    }
    uint64_t v17 = [v15 discCount];
    if (v17 >= 1)
    {
      v18 = *(void **)(a1 + 40);
      v19 = [NSNumber numberWithInteger:v17];
      [v18 setObject:v19 forKey:@"discCount"];
    }
    v20 = [v15 releaseDateComponents];
    if (v20)
    {
      v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v22 = [v21 dateFromComponents:v20];

      if (v22) {
        [*(id *)(a1 + 40) setObject:v22 forKey:@"releaseDate"];
      }
    }
    uint64_t v23 = [v15 trackCount];
    if (v23 >= 1)
    {
      v24 = *(void **)(a1 + 40);
      v25 = [NSNumber numberWithInteger:v23];
      [v24 setObject:v25 forKey:@"albumTrackCount"];
    }
  }
  v26 = [*(id *)(a1 + 32) identifiers];
  v27 = [v26 library];
  uint64_t v28 = [v27 persistentID];

  if (v28)
  {
    v29 = *(void **)(a1 + 40);
    v30 = [NSNumber numberWithLongLong:v28];
    [v29 setObject:v30 forKey:@"persistentID"];
  }
  v31 = [*(id *)(a1 + 32) identifiers];
  v32 = [v31 universalStore];
  uint64_t v33 = [v32 subscriptionAdamID];

  if (v33)
  {
    v34 = *(void **)(a1 + 40);
    v35 = [NSNumber numberWithLongLong:v33];
    [v34 setObject:v35 forKey:@"storeItemAdamID"];

    v36 = *(void **)(a1 + 40);
    v37 = [NSNumber numberWithLongLong:v33];
    [v36 setObject:v37 forKey:@"subscriptionStoreItemAdamID"];

    v38 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", v33);
    [*(id *)(a1 + 40) setObject:v38 forKey:@"playbackStoreID"];
  }
  v39 = [*(id *)(a1 + 32) copyrightText];
  if ([v39 length]) {
    [*(id *)(a1 + 40) setObject:v39 forKey:@"copyright"];
  }
  uint64_t v40 = [*(id *)(a1 + 32) discNumber];
  if (v40 >= 1)
  {
    v41 = *(void **)(a1 + 40);
    v42 = [NSNumber numberWithInteger:v40];
    [v41 setObject:v42 forKey:@"discNumber"];
  }
  v43 = [*(id *)(a1 + 32) genre];
  v44 = [v43 name];
  if ([v44 length]) {
    [*(id *)(a1 + 40) setObject:v44 forKey:@"genre"];
  }
  if ([*(id *)(a1 + 32) hasVideo]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKey:@"isMusicVideo"];
  }
  if ([*(id *)(a1 + 32) isExplicitSong])
  {
    v45 = *(void **)(a1 + 40);
    v46 = [NSNumber numberWithBool:1];
    [v45 setObject:v46 forKey:@"isExplicit"];
  }
  uint64_t v47 = [*(id *)(a1 + 32) trackNumber];
  if (v47 >= 1)
  {
    v48 = *(void **)(a1 + 40);
    v49 = [NSNumber numberWithInteger:v47];
    [v48 setObject:v49 forKey:@"albumTrackNumber"];
  }
  if ([*(id *)(a1 + 32) supportsExtendedLyricsAttribute]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKey:@"storeExtendedLyricsAttribute"];
  }
  v50 = [*(id *)(a1 + 32) localFileAsset];
  v51 = v50;
  if (v50 && ![v50 protectionType])
  {
    v52 = [v51 filePath];
    v53 = [v52 pathExtension];

    uint64_t v54 = [v53 length];
    if (v28 && v54)
    {
      v55 = objc_msgSend(MEMORY[0x1E4F1CB10], "msv_urlForMediaAssetWithPersistentID:pathExtension:", v28, v53);
      [*(id *)(a1 + 40) setObject:v55 forKey:@"assetURL"];
    }
  }
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3 = [(MPModelSong *)self keepLocalManagedStatus];
  int v4 = [(MPModelSong *)self isLibraryAdded];
  int v5 = [(MPModelSong *)self localFileAsset];
  id v6 = [(MPModelSong *)self storeAsset];
  int64_t v7 = _MPModelLibraryRemovalSupportedOptionsForIndividualItemProperties(v3, v4, v5, v6);

  return v7;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  uint64_t v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  int v4 = [(MPModelSong *)self localFileAsset];
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", [v4 isNonPurgeable]);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setIdentifyingModelObject:self];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setEnableState:[(MPModelSong *)self keepLocalEnableState]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setManagedStatus:[(MPModelSong *)self keepLocalManagedStatus]];
  int v5 = [(MPModelSong *)self storeAsset];
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", [v5 isRedownloadable]);

  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (int64_t)genericObjectType
{
  return 1;
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
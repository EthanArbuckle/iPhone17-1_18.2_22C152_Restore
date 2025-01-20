@interface MPMediaRemoteEntityTranslator
+ (void)buildSchemaIfNeeded;
- (id)identifiersForContentItem:(id)a3;
- (id)objectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5;
- (id)sectionObjectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5;
- (void)_mapPropertyKey:(uint64_t)a3 toKeyPath:;
- (void)mapArtworkPropertyKey:(id)a3;
- (void)mapIdentifierCreationBlock:(id)a3;
- (void)mapPropertyKey:(id)a3 toDeviceSpecificUserInfoKey:(id)a4;
- (void)mapPropertyKey:(id)a3 toMPContentItemSelector:(SEL)a4;
- (void)mapPropertyKey:(id)a3 toUserInfoKey:(id)a4;
- (void)mapPropertyKey:(id)a3 toValueTransformer:(id)a4;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4;
@end

@implementation MPMediaRemoteEntityTranslator

MPIdentifierSet *__60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MPIdentifierSet alloc];
  v5 = +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", [*(id *)(a1 + 32) MPModelClass]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke_2;
  v10[3] = &unk_1E57F9678;
  id v6 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  v8 = [(MPIdentifierSet *)v4 initWithSource:@"MediaRemote" modelKind:v5 block:v10];

  return v8;
}

uint64_t __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken != -1) {
    dispatch_once(&buildSchemaIfNeeded_onceToken, &__block_literal_global_3910);
  }
}

- (id)objectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (id)sectionObjectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  id v11 = a3;
  if (self)
  {
    if ([v10 mediaType] == 2)
    {
      id v12 = @"MPModelRelationshipGenericPodcast";
      v13 = @"MPModelRelationshipGenericPodcast";
    }
    else
    {
      v14 = [v10 collectionInfo];
      v15 = [v14 objectForKeyedSubscript:@"_MPNowPlayingCollectionInfoKeyCollectionType"];
      if ([v15 isEqualToString:@"_MPNowPlayingCollectionInfoCollectionTypePlaylist"])
      {
        v16 = MPModelRelationshipGenericPlaylist;
      }
      else if ([v15 isEqualToString:@"_MPNowPlayingCollectionInfoCollectionTypeAlbum"])
      {
        v16 = MPModelRelationshipGenericAlbum;
      }
      else
      {
        if (([v15 isEqualToString:@"_MPNowPlayingCollectionInfoCollectionTypeRadio"] & 1) == 0)
        {

          id v12 = 0;
          goto LABEL_18;
        }
        v16 = MPModelRelationshipGenericRadioStation;
      }
      id v12 = *v16;

      if (!v12)
      {
LABEL_18:
        v28 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v17 = [v11 relationships];
    v18 = [v17 objectForKeyedSubscript:v12];

    if (v18)
    {
      v32 = self;
      id v33 = v9;
      id v31 = v11;
      v19 = [v11 relationships];
      v20 = [v19 objectForKeyedSubscript:v12];

      v21 = +[MPModelGenericObject requiredStoreLibraryPersonalizationProperties];
      v22 = [MPPropertySet alloc];
      v34 = v12;
      v23 = [v21 relationships];
      v24 = [v23 objectForKeyedSubscript:v12];
      v25 = v24;
      if (!v24)
      {
        v25 = +[MPPropertySet emptyPropertySet];
      }
      v26 = [v20 propertySetByCombiningWithPropertySet:v25];
      v35[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      v28 = [(MPPropertySet *)v22 initWithProperties:0 relationships:v27];

      if (!v24) {
      self = v32;
      }
      id v9 = v33;
      id v11 = v31;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v28 = 0;
LABEL_20:

  if (v28)
  {
    v29 = [(MPMediaRemoteEntityTranslator *)self objectForPropertySet:v28 contentItem:v10 context:v9];
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

id __55__MPMediaRemoteEntityTranslator_mapArtworkPropertyKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 artworkGenerator];
  id v6 = [v5 artworkCatalogBlockForContentItem:v4];

  return v6;
}

void __52__MPMediaRemoteEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  v0 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v0 mapIdentifierCreationBlock:&__block_literal_global_16163];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericSong" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericAlbum" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericArtist" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericPlaylist" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericPlaylistEntry" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericTVEpisode" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericTVSeason" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericTVShow" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericMovie" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericPodcast" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericPodcastEpisode" toModelClass:objc_opt_class()];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericRadioStation" toModelClass:objc_opt_class()];

  v1 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v1 mapIdentifierCreationBlock:&__block_literal_global_15];
  [v1 mapPropertyKey:@"MPModelPropertySongTitle" toValueTransformer:&__block_literal_global_21];
  [v1 mapPropertyKey:@"MPModelPropertySongHasCredits" toValueTransformer:&__block_literal_global_31_16164];
  [v1 mapPropertyKey:@"_MPModelPropertySongTrackCount" toMPContentItemSelector:sel_totalTrackCount];
  [v1 mapPropertyKey:@"MPModelPropertySongTrackNumber" toMPContentItemSelector:sel_trackNumber];
  [v1 mapPropertyKey:@"MPModelPropertySongDiscNumber" toMPContentItemSelector:sel_discNumber];
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", @"MPModelPropertySongExplicit");
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", @"MPModelPropertySongDuration");
  [v1 mapPropertyKey:@"MPModelPropertySongHasVideo" toValueTransformer:&__block_literal_global_41];
  [v1 mapPropertyKey:@"MPModelPropertySongShouldShowComposer" toUserInfoKey:@"shComp"];
  [v1 mapPropertyKey:@"MPModelPropertySongArtistUploadedContent" toUserInfoKey:@"arUp"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongHasCloudSyncSource"];
  [v1 mapArtworkPropertyKey:@"MPModelPropertySongArtwork"];
  [v1 mapPropertyKey:@"MPModelPropertySongKeepLocalEnableState" toDeviceSpecificUserInfoKey:@"klEnable"];
  [v1 mapPropertyKey:@"MPModelPropertySongKeepLocalManagedStatus" toDeviceSpecificUserInfoKey:@"klStatus"];
  [v1 mapPropertyKey:@"MPModelPropertySongLibraryAdded" toDeviceSpecificUserInfoKey:@"libAdded"];
  [v1 mapPropertyKey:@"MPModelPropertySongLibraryAddEligible" toValueTransformer:&__block_literal_global_44];
  [v1 mapPropertyKey:@"MPModelPropertySongUserRating" toDeviceSpecificUserInfoKey:@"rating"];
  [v1 mapPropertyKey:@"MPModelPropertySongIsDisliked" toDeviceSpecificUserInfoKey:@"isDisliked"];
  [v1 mapPropertyKey:@"MPModelPropertySongIsFavorite" toDeviceSpecificUserInfoKey:@"isFav"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongCloudStatus"];
  [v1 mapPropertyKey:@"MPModelPropertySongTraits" toMPContentItemSelector:sel_songTraits];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalConstraints"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalManagedStatusReason"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongDateFavorited"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongSupportsExtendedLyricsAttribute"];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongArtist" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongAlbum" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongComposer" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongGenre" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongLyrics" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongLocalFileAsset" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongStoreAsset" toModelClass:objc_opt_class()];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongPlaybackPosition" toModelClass:objc_opt_class()];

  v2 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v2 mapIdentifierCreationBlock:&__block_literal_global_55];
  [v2 mapPropertyKey:@"MPModelPropertyFileAssetNonPurgeable" toDeviceSpecificUserInfoKey:@"nonPurge"];
  [v2 mapPropertyKey:@"MPModelPropertyFileAssetProtectionType" toDeviceSpecificUserInfoKey:@"procType"];

  id v3 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v3 mapIdentifierCreationBlock:&__block_literal_global_57];
  [v3 mapPropertyKey:@"MPModelPropertyStoreAssetRedownloadable" toUserInfoKey:@"rdwn"];
  [v3 mapPropertyKey:@"MPModelPropertyStoreAssetEndpointType" toValueTransformer:&__block_literal_global_59_16165];
  [v3 mapPropertyKey:@"MPModelPropertyStoreAssetSubscriptionRequired" toUserInfoKey:@"subReq"];

  id v4 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v4 mapIdentifierCreationBlock:&__block_literal_global_61_16166];
  [v4 mapPropertyKey:@"MPModelPropertyLyricsHasStoreLyrics" toUserInfoKey:@"hsStLy"];
  [v4 mapPropertyKey:@"MPModelPropertyLyricsHasLibraryLyrics" toDeviceSpecificUserInfoKey:@"hsLibLy"];
  [v4 mapPropertyKey:@"MPModelPropertyLyricsHasTimeSyncedLyrics" toUserInfoKey:@"hsTSL"];
  [v4 mapPropertyKey:@"MPModelPropertyLyricsText" toValueTransformer:&__block_literal_global_63_16167];

  v5 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v5 mapIdentifierCreationBlock:&__block_literal_global_66];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumTitle" toMPContentItemSelector:sel_albumName];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumLibraryAdded" toValueTransformer:&__block_literal_global_70];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumLibraryAddEligible" toValueTransformer:&__block_literal_global_72];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumTrackCount" toMPContentItemSelector:sel_totalTrackCount];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumDiscCount" toMPContentItemSelector:sel_totalDiscCount];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumYear" toMPContentItemSelector:sel_albumYear];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumTraits" toMPContentItemSelector:sel_albumTraits];
  [v5 mapPropertyKey:@"MPModelPropertyAlbumReleaseDateComponents" toValueTransformer:&__block_literal_global_80];
  [v5 mapArtworkPropertyKey:@"MPModelPropertyAlbumArtwork"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsFavorite"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsDisliked"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumDateFavorited"];
  [v5 mapRelationshipKey:@"MPModelRelationshipAlbumGenre" toModelClass:objc_opt_class()];
  [v5 mapRelationshipKey:@"MPModelRelationshipAlbumArtist" toModelClass:objc_opt_class()];
  [v5 mapRelationshipKey:@"MPModelRelationshipAlbumRepresentativeSong" toModelClass:objc_opt_class()];

  id v6 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v6 mapIdentifierCreationBlock:&__block_literal_global_83_16168];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistName" toValueTransformer:&__block_literal_global_85];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistLibraryAdded" toValueTransformer:&__block_literal_global_87];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistType" toValueTransformer:&__block_literal_global_89];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistTraits" toMPContentItemSelector:sel_playlistTraits];
  [v6 mapArtworkPropertyKey:@"MPModelPropertyPlaylistArtwork"];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistIsCollaborative" toValueTransformer:&__block_literal_global_95_16169];
  [v6 mapPropertyKey:@"MPModelPropertyPlaylistCollaboratorStatus" toValueTransformer:&__block_literal_global_98];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavorite"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsDisliked"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistDateFavorited"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavoriteSongsPlaylist"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCoverArtworkRecipe"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationSharingMode"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationMode"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaboratorPermissions"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationInvitationURL"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationJoinRequestIsPending"];

  id v7 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v7 mapIdentifierCreationBlock:&__block_literal_global_100];
  [v7 mapPropertyKey:@"MPModelPropertyPersonName" toValueTransformer:&__block_literal_global_102];
  [v7 mapRelationshipKey:@"MPModelRelationshipArtistGenre" toModelClass:objc_opt_class()];

  id v8 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v8 mapIdentifierCreationBlock:&__block_literal_global_104];
  [v8 mapPropertyKey:@"MPModelPropertyPersonName" toValueTransformer:&__block_literal_global_106_16170];
  [v8 mapRelationshipKey:@"MPModelRelationshipArtistGenre" toModelClass:objc_opt_class()];

  id v9 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v9 mapIdentifierCreationBlock:&__block_literal_global_108_16171];
  [v9 mapPropertyKey:@"MPModelPropertyPersonName" toMPContentItemSelector:sel_composerName];

  id v10 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v10 mapIdentifierCreationBlock:&__block_literal_global_112];
  [v10 mapPropertyKey:@"MPModelPropertyGenreName" toMPContentItemSelector:sel_genreName];

  id v11 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v11 mapIdentifierCreationBlock:&__block_literal_global_116];
  [v11 mapRelationshipKey:@"MPModelRelationshipPlaylistEntrySong" toModelClass:objc_opt_class()];
  [v11 mapRelationshipKey:@"MPModelRelationshipPlaylistEntryTVEpisode" toModelClass:objc_opt_class()];
  [v11 mapRelationshipKey:@"MPModelRelationshipPlaylistEntryMovie" toModelClass:objc_opt_class()];

  id v12 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v12 mapIdentifierCreationBlock:&__block_literal_global_118_16172];
  [v12 mapPropertyKey:@"MPModelPropertyMovieTitle" toValueTransformer:&__block_literal_global_120_16173];
  [v12 mapPropertyKey:@"MPModelPropertyMovieDuration" toMPContentItemSelector:sel_duration];
  [v12 mapPropertyKey:@"MPModelPropertyMovieKeepLocalEnableState" toValueTransformer:&__block_literal_global_122_16174];
  [v12 mapPropertyKey:@"MPModelPropertyMovieKeepLocalManagedStatus" toValueTransformer:&__block_literal_global_124];
  [v12 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalManagedStatusReason"];
  [v12 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalConstraints"];
  [v12 mapPropertyKey:@"MPModelPropertyMovieLibraryAdded" toValueTransformer:&__block_literal_global_126];
  [v12 mapPropertyKey:@"MPModelPropertyMovieLibraryAddEligible" toValueTransformer:&__block_literal_global_128];
  [v12 mapPropertyKey:@"MPModelPropertyMovieHasCloudSyncSource" toValueTransformer:&__block_literal_global_130_16175];
  [v12 mapArtworkPropertyKey:@"MPModelPropertyMovieArtwork"];
  [v12 mapUnsupportedPropertyKey:@"MPModelPropertyMovieStoreCanonicalID"];
  [v12 mapRelationshipKey:@"MPModelRelationshipMovieLocalFileAsset" toModelClass:objc_opt_class()];
  [v12 mapRelationshipKey:@"MPModelRelationshipMovieStoreAsset" toModelClass:objc_opt_class()];

  v13 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v13 mapIdentifierCreationBlock:&__block_literal_global_132];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeTitle" toValueTransformer:&__block_literal_global_134];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeNumber" toMPContentItemSelector:sel_episodeNumber];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeDuration" toMPContentItemSelector:sel_duration];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeType" toValueTransformer:&__block_literal_global_138_16176];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalEnableState" toValueTransformer:&__block_literal_global_140];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatus" toValueTransformer:&__block_literal_global_142];
  [v13 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"];
  [v13 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalConstraints"];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeLibraryAdded" toValueTransformer:&__block_literal_global_144];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeLibraryAddEligible" toValueTransformer:&__block_literal_global_146];
  [v13 mapPropertyKey:@"MPModelPropertyTVEpisodeHasCloudSyncSource" toValueTransformer:&__block_literal_global_148_16177];
  [v13 mapArtworkPropertyKey:@"MPModelPropertyTVEpisodeArtwork"];
  [v13 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeStoreCanonicalID"];
  [v13 mapRelationshipKey:@"MPModelRelationshipTVEpisodeSeason" toModelClass:objc_opt_class()];
  [v13 mapRelationshipKey:@"MPModelRelationshipTVEpisodeShow" toModelClass:objc_opt_class()];
  [v13 mapRelationshipKey:@"MPModelRelationshipTVEpisodeLocalFileAsset" toModelClass:objc_opt_class()];
  [v13 mapRelationshipKey:@"MPModelRelationshipTVEpisodeStoreAsset" toModelClass:objc_opt_class()];

  v14 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v14 mapIdentifierCreationBlock:&__block_literal_global_150];
  [v14 mapPropertyKey:@"MPModelPropertyTVSeasonNumber" toMPContentItemSelector:sel_seasonNumber];
  [v14 mapArtworkPropertyKey:@"MPModelPropertyTVSeasonArtwork"];
  [v14 mapRelationshipKey:@"MPModelRelationshipTVSeasonShow" toModelClass:objc_opt_class()];

  v15 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v15 mapIdentifierCreationBlock:&__block_literal_global_154];
  [v15 mapPropertyKey:@"MPModelPropertyTVShowTitle" toMPContentItemSelector:sel_trackArtistName];
  [v15 mapArtworkPropertyKey:@"MPModelPropertyTVShowArtwork"];
  [v15 mapUnsupportedPropertyKey:@"MPModelPropertyTVShowStoreCanonicalID"];

  v16 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v16 mapIdentifierCreationBlock:&__block_literal_global_158];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationName" toMPContentItemSelector:sel_radioStationName];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationAttributionLabel" toValueTransformer:&__block_literal_global_163];
  [v16 mapArtworkPropertyKey:@"MPModelPropertyRadioStationArtwork"];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationType" toValueTransformer:&__block_literal_global_165];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationSubtype" toValueTransformer:&__block_literal_global_167];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationProviderUniversalLink" toValueTransformer:&__block_literal_global_169];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationProviderBundleIdentifier" toValueTransformer:&__block_literal_global_172];
  [v16 mapPropertyKey:@"MPModelPropertyRadioStationProviderID" toValueTransformer:&__block_literal_global_174];

  v17 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v17 mapIdentifierCreationBlock:&__block_literal_global_176];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime" toValueTransformer:&__block_literal_global_178_16178];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionHasBeenPlayed" toValueTransformer:&__block_literal_global_180];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionStartTime" toValueTransformer:&__block_literal_global_182];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionStopTime" toValueTransformer:&__block_literal_global_185];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier" toValueTransformer:&__block_literal_global_188];
  [v17 mapPropertyKey:@"MPModelPropertyPlaybackPositionUserPlayCount" toValueTransformer:&__block_literal_global_191];

  v18 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v18 mapIdentifierCreationBlock:&__block_literal_global_196];
  [v18 mapPropertyKey:@"MPModelPropertyPodcastTitle" toMPContentItemSelector:sel_albumName];
  [v18 mapPropertyKey:@"MPModelPropertyPodcastFeedURL" toValueTransformer:&__block_literal_global_198];
  [v18 mapPropertyKey:@"MPModelPropertyPodcastShareURL" toValueTransformer:&__block_literal_global_200];
  [v18 mapPropertyKey:@"MPModelPropertyPodcastSupportsSubscription" toValueTransformer:&__block_literal_global_202];
  [v18 mapPropertyKey:@"MPModelPropertyPodcastSortType" toValueTransformer:&__block_literal_global_204];
  [v18 mapArtworkPropertyKey:@"MPModelPropertyPodcastArtwork"];
  [v18 mapRelationshipKey:@"MPModelRelationshipPodcastAuthor" toModelClass:objc_opt_class()];

  v19 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v19 mapIdentifierCreationBlock:&__block_literal_global_210];
  [v19 mapPropertyKey:@"MPModelPropertyPersonName" toMPContentItemSelector:sel_albumArtistName];

  v20 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v20 mapIdentifierCreationBlock:&__block_literal_global_214];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeTitle" toValueTransformer:&__block_literal_global_216];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeDuration" toMPContentItemSelector:sel_duration];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeExplicit" toMPContentItemSelector:sel_isExplicitItem];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeNumber" toMPContentItemSelector:sel_episodeNumber];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeSeasonNumber" toMPContentItemSelector:sel_seasonNumber];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeDescriptionText" toMPContentItemSelector:sel_info];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeTranscriptAlignments" toValueTransformer:&__block_literal_global_220];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeReleaseDateComponents" toValueTransformer:&__block_literal_global_225];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeHasVideo" toValueTransformer:&__block_literal_global_227];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeUserRating" toValueTransformer:&__block_literal_global_229];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeStreamURL" toValueTransformer:&__block_literal_global_231];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeShareURL" toValueTransformer:&__block_literal_global_233];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeType" toValueTransformer:&__block_literal_global_235];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeShowArtworkTemplateURL" toUserInfoKey:@"podArtURL"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeArtworkInfo" toUserInfoKey:@"podArtInfo"];
  [v20 mapArtworkPropertyKey:@"MPModelPropertyPodcastEpisodeArtwork"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodePriceType" toUserInfoKey:@"podEpPrTy"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeTranscriptIdentifier" toUserInfoKey:@"podEpTrId"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeTranscriptSource" toUserInfoKey:@"podEpTrSrc"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeShouldShowChapterArtwork" toUserInfoKey:@"podShoChapArt"];
  [v20 mapPropertyKey:@"MPModelPropertyPodcastEpisodeChapters" toValueTransformer:&__block_literal_global_237];
  [v20 mapRelationshipKey:@"MPModelRelationshipPodcastEpisodeAuthor" toModelClass:objc_opt_class()];
  [v20 mapRelationshipKey:@"MPModelRelationshipPodcastEpisodePodcast" toModelClass:objc_opt_class()];
  [v20 mapRelationshipKey:@"MPModelRelationshipPodcastEpisodeLocalFileAsset" toModelClass:objc_opt_class()];
  [v20 mapRelationshipKey:@"MPModelRelationshipPodcastEpisodePlaybackPosition" toModelClass:objc_opt_class()];

  v21 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v21 mapIdentifierCreationBlock:&__block_literal_global_244];
  [v21 mapPropertyKey:@"MPModelPropertyPersonName" toMPContentItemSelector:sel_trackArtistName];

  id v22 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v22 mapIdentifierCreationBlock:&__block_literal_global_246];
  [v22 mapPropertyKey:@"MPModelPropertyPodcastChapterTitle" toMPContentItemSelector:sel_title];
  [v22 mapPropertyKey:@"MPModelPropertyPodcastChapterDuration" toMPContentItemSelector:sel_duration];
  [v22 mapPropertyKey:@"MPModelPropertyPodcastChapterStartTime" toMPContentItemSelector:sel_startTime];
}

- (void)mapPropertyKey:(id)a3 toValueTransformer:(id)a4
{
  id v6 = a3;
  id v7 = +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:a4];
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v6, v7);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4
{
  id v6 = a3;
  id v7 = [[_MPBaseEntityRelationshipTranslator alloc] initWithRelatedMPModelClass:a4];
  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v6, v7);
}

- (void)mapPropertyKey:(id)a3 toMPContentItemSelector:(SEL)a4
{
  id v6 = a3;
  NSStringFromSelector(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);
}

- (void)_mapPropertyKey:(uint64_t)a3 toKeyPath:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = +[_MPMediaRemoteEntityPropertyTranslator translatorWithKeyPath:a3];
    -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:](a1, v5, v6);
  }
}

- (void)mapIdentifierCreationBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke;
  v7[3] = &unk_1E57EE5D8;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:v7];
  -[MPBaseEntityTranslator mapIdentifiersToPropertyTranslator:]((id *)&self->super.super.isa, v6);
}

- (void)mapPropertyKey:(id)a3 toUserInfoKey:(id)a4
{
  id v6 = a3;
  id v7 = [@"userInfo." stringByAppendingString:a4];
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);
}

- (void)mapArtworkPropertyKey:(id)a3
{
  id v4 = a3;
  id v5 = +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:&__block_literal_global_81];
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v4, v5);
}

- (void)mapPropertyKey:(id)a3 toDeviceSpecificUserInfoKey:(id)a4
{
  id v6 = a3;
  id v7 = [@"deviceSpecificUserInfo." stringByAppendingString:a4];
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);
}

- (id)identifiersForContentItem:(id)a3
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, 0);
}

@end
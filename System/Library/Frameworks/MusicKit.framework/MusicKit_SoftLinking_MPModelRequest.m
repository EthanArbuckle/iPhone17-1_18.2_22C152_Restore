@interface MusicKit_SoftLinking_MPModelRequest
+ (MusicKit_SoftLinking_MPModelRequest)defaultUnpersonalizedRequest;
+ (id)_albumSupportedProperties;
+ (id)_albumSupportedPropertiesForPlayback;
+ (id)_artistSupportedProperties;
+ (id)_composerSupportedProperties;
+ (id)_curatorSupportedProperties;
+ (id)_genreSupportedProperties;
+ (id)_localFileAssetSupportedProperties;
+ (id)_lyricsSupportedProperties;
+ (id)_movieSupportedProperties;
+ (id)_movieSupportedPropertiesForPlayback;
+ (id)_playbackItemSupportedProperties;
+ (id)_playbackPositionSupportedProperties;
+ (id)_playbackSectionSupportedProperties;
+ (id)_playlistAuthorSupportedProperties;
+ (id)_playlistEntryReactionSupportedProperties;
+ (id)_playlistEntrySupportedProperties;
+ (id)_playlistEntrySupportedPropertiesForPlayback;
+ (id)_playlistSupportedProperties;
+ (id)_playlistSupportedPropertiesForPlayback;
+ (id)_propertySetForRawProperties:(id)a3 relationships:(id)a4;
+ (id)_radioStationSupportedPropertiesForPlayback;
+ (id)_recentlyAddedObjectSupportedProperties;
+ (id)_representativeSongSupportedProperties;
+ (id)_socialPersonSupportedProperties;
+ (id)_songSupportedProperties;
+ (id)_songSupportedPropertiesForPlayback;
+ (id)_storeAssetSupportedProperties;
+ (id)_supportedPropertiesForModelObjectType:(int64_t)a3;
+ (id)_tvEpisodeSupportedProperties;
+ (id)_tvEpisodeSupportedPropertiesForPlayback;
+ (id)_tvSeasonSupportedProperties;
+ (id)_tvSeasonSupportedPropertiesForPlayback;
+ (id)_tvShowSupportedProperties;
- (MPModelRequest)_underlyingRequest;
- (id)_initWithUnderlyingRequest:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelRequest

- (void).cxx_destruct
{
}

+ (id)_albumSupportedPropertiesForPlayback
{
  v27[9] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  v23 = getMPModelPropertyAlbumArtwork();
  v27[0] = v23;
  v3 = getMPModelPropertyAlbumLibraryAdded();
  v27[1] = v3;
  v4 = getMPModelPropertyAlbumLibraryAddEligible();
  v27[2] = v4;
  v5 = getMPModelPropertyAlbumIsFavorite();
  v27[3] = v5;
  v6 = getMPModelPropertyAlbumDateFavorited();
  v27[4] = v6;
  v7 = getMPModelPropertyAlbumTitle();
  v27[5] = v7;
  v8 = getMPModelPropertyAlbumTrackCount();
  v27[6] = v8;
  v9 = getMPModelPropertyAlbumTraits();
  v27[7] = v9;
  v10 = getMPModelPropertyAlbumYear();
  v27[8] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:9];
  v12 = (void *)[v2 initWithArray:v11];

  if (_os_feature_enabled_impl())
  {
    v13 = getMPModelPropertyAlbumIsDisliked();
    [v12 addObject:v13];
  }
  id v14 = objc_alloc((Class)getMPPropertySetClass());
  v15 = getMPModelRelationshipAlbumArtist();
  v25 = v15;
  id MPPropertySetClass = getMPPropertySetClass();
  v17 = getMPModelPropertyArtistName();
  v24 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v19 = [MPPropertySetClass propertySetWithProperties:v18];
  v26 = v19;
  v20 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v21 = (void *)[v14 initWithProperties:v12 relationships:v20];

  return v21;
}

+ (id)_songSupportedProperties
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v119 = objc_alloc(MEMORY[0x263EFF980]);
  v117 = getMPModelPropertySongTitle();
  v135[0] = v117;
  v115 = getMPModelPropertySongDuration();
  v135[1] = v115;
  v113 = get_MPModelPropertySongTrackCount();
  v135[2] = v113;
  v111 = getMPModelPropertySongTrackNumber();
  v135[3] = v111;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  id v2 = (id *)getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongDiscNumberSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v3, "MPModelPropertySongDiscNumber");
    getMPModelPropertySongDiscNumberSymbolLoc_ptr = v122[3];
    id v2 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v2) {
    goto LABEL_54;
  }
  id v85 = *v2;
  v135[4] = v85;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v4 = (id *)getMPModelPropertySongGroupingSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongGroupingSymbolLoc_ptr;
  if (!getMPModelPropertySongGroupingSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v5, "MPModelPropertySongGrouping");
    getMPModelPropertySongGroupingSymbolLoc_ptr = v122[3];
    v4 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v4) {
    goto LABEL_54;
  }
  id v83 = *v4;
  v135[5] = v83;
  v109 = getMPModelPropertySongExplicit();
  v135[6] = v109;
  v107 = getMPModelPropertySongArtistUploadedContent();
  v135[7] = v107;
  v105 = getMPModelPropertySongHasVideo();
  v135[8] = v105;
  v103 = getMPModelPropertySongArtwork();
  v135[9] = v103;
  v101 = getMPModelPropertySongShouldShowComposer();
  v135[10] = v101;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v6 = (id *)getMPModelPropertySongCopyrightTextSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongCopyrightTextSymbolLoc_ptr;
  if (!getMPModelPropertySongCopyrightTextSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v7, "MPModelPropertySongCopyrightText");
    getMPModelPropertySongCopyrightTextSymbolLoc_ptr = v122[3];
    v6 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v6) {
    goto LABEL_54;
  }
  id v81 = *v6;
  v135[11] = v81;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v8 = (id *)getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr;
  if (!getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v9, "MPModelPropertySongVolumeNormalization");
    getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr = v122[3];
    v8 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v8) {
    goto LABEL_54;
  }
  id v79 = *v8;
  v135[12] = v79;
  v99 = getMPModelPropertySongIsFavorite();
  v135[13] = v99;
  v97 = getMPModelPropertySongDateFavorited();
  v135[14] = v97;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v10 = (id *)getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v11, "MPModelPropertySongLastDevicePlaybackDate");
    getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr = v122[3];
    v10 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v10) {
    goto LABEL_54;
  }
  id v77 = *v10;
  v135[15] = v77;
  v95 = getMPModelPropertySongLibraryAdded();
  v135[16] = v95;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v12 = (id *)getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v13, "MPModelPropertySongLibraryAddedDate");
    getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr = v122[3];
    v12 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v12) {
    goto LABEL_54;
  }
  id v75 = *v12;
  v135[17] = v75;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  id v14 = (id *)getMPModelPropertySongPlayCountSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongPlayCountSymbolLoc_ptr;
  if (!getMPModelPropertySongPlayCountSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v15, "MPModelPropertySongPlayCount");
    getMPModelPropertySongPlayCountSymbolLoc_ptr = v122[3];
    id v14 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v14) {
    goto LABEL_54;
  }
  id v73 = *v14;
  v135[18] = v73;
  v93 = getMPModelPropertySongKeepLocalEnableState();
  v135[19] = v93;
  v91 = getMPModelPropertySongKeepLocalManagedStatus();
  v135[20] = v91;
  v89 = getMPModelPropertySongKeepLocalManagedStatusReason();
  v135[21] = v89;
  v87 = getMPModelPropertySongLibraryAddEligible();
  v135[22] = v87;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v16 = (id *)getMPModelPropertySongClassicalMovementSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongClassicalMovementSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v17, "MPModelPropertySongClassicalMovement");
    getMPModelPropertySongClassicalMovementSymbolLoc_ptr = v122[3];
    v16 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v16) {
    goto LABEL_54;
  }
  id v71 = *v16;
  v135[23] = v71;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v18 = (id *)getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v19, "MPModelPropertySongClassicalMovementCount");
    getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr = v122[3];
    v18 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v18) {
    goto LABEL_54;
  }
  id v69 = *v18;
  v135[24] = v69;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v20 = (id *)getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr)
  {
    v21 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v21, "MPModelPropertySongClassicalMovementNumber");
    getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr = v122[3];
    v20 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v20) {
    goto LABEL_54;
  }
  id v22 = *v20;
  v135[25] = v22;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v23 = (id *)getMPModelPropertySongClassicalWorkSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongClassicalWorkSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalWorkSymbolLoc_ptr)
  {
    v24 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v24, "MPModelPropertySongClassicalWork");
    getMPModelPropertySongClassicalWorkSymbolLoc_ptr = v122[3];
    v23 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v23) {
    goto LABEL_54;
  }
  id v25 = *v23;
  v135[26] = v25;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v26 = (id *)getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr;
  if (!getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr)
  {
    v27 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v27, "MPModelPropertySongHasCloudSyncSource");
    getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr = v122[3];
    v26 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v26) {
    goto LABEL_54;
  }
  id v28 = *v26;
  v135[27] = v28;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v29 = (id *)getMPModelPropertySongYearSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongYearSymbolLoc_ptr;
  if (!getMPModelPropertySongYearSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v30, "MPModelPropertySongYear");
    getMPModelPropertySongYearSymbolLoc_ptr = v122[3];
    v29 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v29) {
    goto LABEL_54;
  }
  id v31 = *v29;
  v135[28] = v31;
  v32 = getMPModelPropertySongUserRating();
  v135[29] = v32;
  v33 = getMPModelPropertySongCloudStatus();
  v135[30] = v33;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v34 = (id *)getMPModelPropertySongGaplessInfoSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongGaplessInfoSymbolLoc_ptr;
  if (!getMPModelPropertySongGaplessInfoSymbolLoc_ptr)
  {
    v35 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v35, "MPModelPropertySongGaplessInfo");
    getMPModelPropertySongGaplessInfoSymbolLoc_ptr = v122[3];
    v34 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v34) {
    goto LABEL_54;
  }
  id v36 = *v34;
  v135[31] = v36;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v37 = (id *)getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr;
  uint64_t v124 = getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr;
  if (!getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr)
  {
    v38 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v38, "MPModelPropertySongVolumeAdjustment");
    getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr = v122[3];
    v37 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v37) {
    goto LABEL_54;
  }
  id v136 = *v37;
  id v39 = v136;
  v40 = getMPModelPropertySongTraits();
  v137 = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:34];
  v120 = (void *)[v119 initWithArray:v41];

  if (_os_feature_enabled_impl())
  {
    v42 = getMPModelPropertySongIsDisliked();
    [v120 addObject:v42];
  }
  id v63 = objc_alloc((Class)getMPPropertySetClass());
  v118 = getMPModelRelationshipSongAlbum();
  v132[0] = v118;
  id MPPropertySetClass = getMPPropertySetClass();
  v116 = getMPModelPropertyAlbumTitle();
  v131[0] = v116;
  v114 = getMPModelPropertyAlbumReleaseDateComponents();
  v131[1] = v114;
  v112 = getMPModelPropertyAlbumYear();
  v131[2] = v112;
  v110 = getMPModelPropertyAlbumTrackCount();
  v131[3] = v110;
  v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:4];
  v106 = [MPPropertySetClass propertySetWithProperties:v108];
  v134[0] = v106;
  v104 = getMPModelRelationshipSongArtist();
  v132[1] = v104;
  id v44 = getMPPropertySetClass();
  v102 = getMPModelPropertyArtistName();
  v130 = v102;
  v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v130 count:1];
  v98 = [v44 propertySetWithProperties:v100];
  v134[1] = v98;
  v96 = getMPModelRelationshipSongLocalFileAsset();
  v132[2] = v96;
  id v45 = getMPPropertySetClass();
  v94 = getMPModelPropertyFileAssetNonPurgeable();
  v129[0] = v94;
  v92 = getMPModelPropertyFileAssetProtectionType();
  v129[1] = v92;
  v90 = getMPModelPropertyFileAssetTraits();
  v129[2] = v90;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:3];
  v86 = [v45 propertySetWithProperties:v88];
  v134[2] = v86;
  v84 = getMPModelRelationshipSongStoreAsset();
  v132[3] = v84;
  id v46 = getMPPropertySetClass();
  v82 = getMPModelPropertyStoreAssetRedownloadable();
  v128[0] = v82;
  v80 = getMPModelPropertyStoreAssetSubscriptionRequired();
  v128[1] = v80;
  v78 = getMPModelPropertyStoreAssetNeedsUserUpload();
  v128[2] = v78;
  v76 = getMPModelPropertyStoreAssetEndpointType();
  v128[3] = v76;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:4];
  v72 = [v46 propertySetWithProperties:v74];
  v134[3] = v72;
  v70 = getMPModelRelationshipSongHomeSharingAsset();
  v132[4] = v70;
  id v47 = getMPPropertySetClass();
  v68 = getMPModelPropertyHomeSharingAssetAvailable();
  v127 = v68;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];
  v66 = [v47 propertySetWithProperties:v67];
  v134[4] = v66;
  v65 = getMPModelRelationshipSongComposer();
  v132[5] = v65;
  id v48 = getMPPropertySetClass();
  v49 = getMPModelPropertyComposerName();
  v126 = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
  v51 = [v48 propertySetWithProperties:v50];
  v134[5] = v51;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  v52 = (id *)getMPModelRelationshipSongLyricsSymbolLoc_ptr;
  uint64_t v124 = getMPModelRelationshipSongLyricsSymbolLoc_ptr;
  if (!getMPModelRelationshipSongLyricsSymbolLoc_ptr)
  {
    v53 = (void *)MediaPlayerLibrary_6();
    v122[3] = (uint64_t)dlsym(v53, "MPModelRelationshipSongLyrics");
    getMPModelRelationshipSongLyricsSymbolLoc_ptr = v122[3];
    v52 = (id *)v122[3];
  }
  _Block_object_dispose(&v121, 8);
  if (!v52)
  {
LABEL_54:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v133 = *v52;
  id v54 = v133;
  id v55 = getMPPropertySetClass();
  v56 = getMPModelPropertyLyricsHasLibraryLyrics();
  v125[0] = v56;
  v57 = getMPModelPropertyLyricsHasStoreLyrics();
  v125[1] = v57;
  v58 = getMPModelPropertyLyricsHasTimeSyncedLyrics();
  v125[2] = v58;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:3];
  v60 = [v55 propertySetWithProperties:v59];
  v134[6] = v60;
  v61 = [NSDictionary dictionaryWithObjects:v134 forKeys:v132 count:7];
  id v64 = (id)[v63 initWithProperties:v120 relationships:v61];

  return v64;
}

+ (id)_songSupportedPropertiesForPlayback
{
  v47[16] = *MEMORY[0x263EF8340];
  id v40 = objc_alloc(MEMORY[0x263EFF980]);
  v38 = getMPModelPropertySongArtistUploadedContent();
  v47[0] = v38;
  id v36 = getMPModelPropertySongArtwork();
  v47[1] = v36;
  v34 = getMPModelPropertySongCloudStatus();
  v47[2] = v34;
  v32 = getMPModelPropertySongDuration();
  v47[3] = v32;
  v30 = getMPModelPropertySongExplicit();
  v47[4] = v30;
  getMPModelPropertySongHasVideo();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  v47[5] = v27;
  v26 = getMPModelPropertySongIsFavorite();
  v47[6] = v26;
  id v2 = getMPModelPropertySongDateFavorited();
  v47[7] = v2;
  v3 = getMPModelPropertySongLibraryAdded();
  v47[8] = v3;
  v4 = getMPModelPropertySongLibraryAddEligible();
  v47[9] = v4;
  v5 = getMPModelPropertySongShouldShowComposer();
  v47[10] = v5;
  v6 = getMPModelPropertySongTitle();
  v47[11] = v6;
  v7 = get_MPModelPropertySongTrackCount();
  v47[12] = v7;
  v8 = getMPModelPropertySongTrackNumber();
  v47[13] = v8;
  v9 = getMPModelPropertySongTraits();
  v47[14] = v9;
  v10 = getMPModelPropertySongUserRating();
  v47[15] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:16];
  v41 = (void *)[v40 initWithArray:v11];

  if (_os_feature_enabled_impl())
  {
    v12 = getMPModelPropertySongIsDisliked();
    [v41 addObject:v12];
  }
  id v28 = objc_alloc((Class)getMPPropertySetClass());
  id v39 = getMPModelRelationshipSongComposer();
  v45[0] = v39;
  id MPPropertySetClass = getMPPropertySetClass();
  v37 = getMPModelPropertyComposerName();
  id v44 = v37;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  v33 = [MPPropertySetClass propertySetWithProperties:v35];
  v46[0] = v33;
  id v31 = getMPModelRelationshipSongAlbum();
  v45[1] = v31;
  id v14 = getMPPropertySetClass();
  v15 = getMPModelPropertyAlbumTitle();
  v43[0] = v15;
  v16 = getMPModelPropertyAlbumYear();
  v43[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
  v18 = [v14 propertySetWithProperties:v17];
  v46[1] = v18;
  v19 = getMPModelRelationshipSongArtist();
  v45[2] = v19;
  id v20 = getMPPropertySetClass();
  v21 = getMPModelPropertyArtistName();
  v42 = v21;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  v23 = [v20 propertySetWithProperties:v22];
  v46[2] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  id v29 = (id)[v28 initWithProperties:v41 relationships:v24];

  return v29;
}

+ (id)_playbackSectionSupportedProperties
{
  v24[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  v4 = getMPModelRelationshipGenericAlbum();
  v21[0] = v4;
  v5 = [a1 _albumSupportedPropertiesForPlayback];
  v24[0] = v5;
  v6 = getMPModelRelationshipGenericPlaylist();
  v21[1] = v6;
  v7 = [a1 _playlistSupportedPropertiesForPlayback];
  v24[1] = v7;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v8 = (id *)getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  uint64_t v20 = getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericRadioStationSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v18[3] = (uint64_t)dlsym(v9, "MPModelRelationshipGenericRadioStation");
    getMPModelRelationshipGenericRadioStationSymbolLoc_ptr = v18[3];
    v8 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v22 = *v8;
  id v10 = v22;
  v11 = [a1 _radioStationSupportedPropertiesForPlayback];
  v24[2] = v11;
  v12 = getMPModelRelationshipGenericTVSeason();
  v23 = v12;
  v13 = [a1 _tvSeasonSupportedPropertiesForPlayback];
  v24[3] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v21 count:4];
  v15 = (void *)[v3 initWithProperties:MEMORY[0x263EFFA68] relationships:v14];

  return v15;
}

+ (id)_tvSeasonSupportedPropertiesForPlayback
{
  v20[5] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  v16 = getMPModelPropertyTVSeasonArtwork();
  v20[0] = v16;
  v15 = getMPModelPropertyTVSeasonEpisodesCount();
  v20[1] = v15;
  id v3 = getMPModelPropertyTVSeasonLibraryAdded();
  v20[2] = v3;
  v4 = getMPModelPropertyTVSeasonLibraryAddEligible();
  v20[3] = v4;
  v5 = getMPModelPropertyTVSeasonNumber();
  v20[4] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];
  v7 = getMPModelRelationshipTVSeasonShow();
  v18 = v7;
  id MPPropertySetClass = getMPPropertySetClass();
  v9 = getMPModelPropertyTVShowTitle();
  uint64_t v17 = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v11 = [MPPropertySetClass propertySetWithProperties:v10];
  uint64_t v19 = v11;
  v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v13 = (void *)[v2 initWithProperties:v6 relationships:v12];

  return v13;
}

+ (id)_tvSeasonSupportedProperties
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v33 = objc_alloc((Class)getMPPropertySetClass());
  v38 = getMPModelPropertyTVSeasonArtwork();
  v46[0] = v38;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v2 = (id *)getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr)
  {
    id v3 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v3, "MPModelPropertyTVSeasonDownloadedDate");
    getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr = v40[3];
    id v2 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v2) {
    goto LABEL_25;
  }
  id v32 = *v2;
  v46[1] = v32;
  v37 = getMPModelPropertyTVSeasonEpisodesCount();
  v46[2] = v37;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v4 = (id *)getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v5, "MPModelPropertyTVSeasonHasCleanContent");
    getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr = v40[3];
    v4 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v4) {
    goto LABEL_25;
  }
  id v31 = *v4;
  void v46[3] = v31;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v6 = (id *)getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v7, "MPModelPropertyTVSeasonHasExplicitContent");
    getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr = v40[3];
    v6 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v6) {
    goto LABEL_25;
  }
  id v30 = *v6;
  v46[4] = v30;
  id v36 = getMPModelPropertyTVSeasonLibraryAdded();
  v46[5] = v36;
  v35 = getMPModelPropertyTVSeasonLibraryAddEligible();
  v46[6] = v35;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v8 = (id *)getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v9, "MPModelPropertyTVSeasonLibraryAddedDate");
    getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr = v40[3];
    v8 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v8) {
    goto LABEL_25;
  }
  id v29 = *v8;
  v46[7] = v29;
  v34 = getMPModelPropertyTVSeasonNumber();
  v46[8] = v34;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v10 = (id *)getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v11, "MPModelPropertyTVSeasonSortType");
    getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr = v40[3];
    id v10 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v10) {
    goto LABEL_25;
  }
  id v12 = *v10;
  v46[9] = v12;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v13 = (id *)getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr)
  {
    id v14 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v14, "MPModelPropertyTVSeasonDescriptionText");
    getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr = v40[3];
    v13 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v13) {
    goto LABEL_25;
  }
  id v15 = *v13;
  v46[10] = v15;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonYearSymbolLoc_ptr;
  uint64_t v42 = getMPModelPropertyTVSeasonYearSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonYearSymbolLoc_ptr)
  {
    uint64_t v17 = (void *)MediaPlayerLibrary_6();
    v40[3] = (uint64_t)dlsym(v17, "MPModelPropertyTVSeasonYear");
    getMPModelPropertyTVSeasonYearSymbolLoc_ptr = v40[3];
    v16 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v16)
  {
LABEL_25:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v47 = *v16;
  v18 = (void *)MEMORY[0x263EFF8C0];
  id v19 = v47;
  uint64_t v20 = [v18 arrayWithObjects:v46 count:12];
  v21 = getMPModelRelationshipTVSeasonShow();
  id v44 = v21;
  id MPPropertySetClass = getMPPropertySetClass();
  v23 = getMPModelPropertyTVShowTitle();
  v43 = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  id v25 = [MPPropertySetClass propertySetWithProperties:v24];
  id v45 = v25;
  v26 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  id v27 = (void *)[v33 initWithProperties:v20 relationships:v26];

  return v27;
}

+ (id)_playlistSupportedProperties
{
  v132[37] = *MEMORY[0x263EF8340];
  id v118 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v124 = getMPModelPropertyPlaylistName();
  v132[0] = v124;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v2 = (id *)getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr)
  {
    id v3 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v3, "MPModelPropertyPlaylistEditorNotes");
    getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr = v126[3];
    id v2 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v2) {
    goto LABEL_99;
  }
  id v4 = *v2;
  v132[1] = v4;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v5 = (id *)getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v6, "MPModelPropertyPlaylistShortEditorNotes");
    getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr = v126[3];
    v5 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v5) {
    goto LABEL_99;
  }
  id v7 = *v5;
  v132[2] = v7;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v8 = (id *)getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v9, "MPModelPropertyPlaylistReleaseDateComponents");
    getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr = v126[3];
    v8 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v8) {
    goto LABEL_99;
  }
  id v10 = *v8;
  v132[3] = v10;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v11 = (id *)getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr)
  {
    id v12 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v12, "MPModelPropertyPlaylistLastModifiedDateComponents");
    getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr = v126[3];
    v11 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v11) {
    goto LABEL_99;
  }
  v115 = v7;
  v116 = v10;
  v114 = v4;
  id v117 = *v11;
  v132[4] = v117;
  uint64_t v123 = getMPModelPropertyPlaylistArtwork();
  v132[5] = v123;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v13 = (id *)getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr)
  {
    id v14 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v14, "MPModelPropertyPlaylistCoverArtworkRecipe");
    getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr = v126[3];
    v13 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v13) {
    goto LABEL_99;
  }
  id v15 = *v13;
  void v132[6] = v15;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v16 = (id *)getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr)
  {
    uint64_t v17 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v17, "MPModelPropertyPlaylistEditorialArtwork");
    getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr = v126[3];
    v16 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v16) {
    goto LABEL_99;
  }
  id v18 = *v16;
  v132[7] = v18;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v19 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr)
  {
    uint64_t v20 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v20, "MPModelPropertyPlaylistTracksTiledArtwork");
    getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr = v126[3];
    id v19 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v19) {
    goto LABEL_99;
  }
  id v21 = *v19;
  v132[8] = v21;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v22 = (id *)getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr)
  {
    v23 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v23, "MPModelPropertyPlaylistHasCleanContent");
    getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr = v126[3];
    id v22 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v22) {
    goto LABEL_99;
  }
  id v113 = *v22;
  v132[9] = v113;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v24 = (id *)getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr)
  {
    id v25 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v25, "MPModelPropertyPlaylistHasExplicitContent");
    getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr = v126[3];
    v24 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v24) {
    goto LABEL_99;
  }
  v110 = v18;
  v111 = v21;
  v109 = v15;
  id v112 = *v24;
  v132[10] = v112;
  v122 = getMPModelPropertyPlaylistType();
  v132[11] = v122;
  uint64_t v121 = getMPModelPropertyPlaylistIsFavorite();
  v132[12] = v121;
  v120 = getMPModelPropertyPlaylistDateFavorited();
  v132[13] = v120;
  id v119 = getMPModelPropertyPlaylistLibraryAdded();
  v132[14] = v119;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v26 = (id *)getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr)
  {
    id v27 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v27, "MPModelPropertyPlaylistLibraryAddedDate");
    getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr = v126[3];
    v26 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v26) {
    goto LABEL_99;
  }
  id v28 = *v26;
  v132[15] = v28;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v29 = (id *)getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr)
  {
    id v30 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v30, "MPModelPropertyPlaylistDownloadedDate");
    getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr = v126[3];
    id v29 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v29) {
    goto LABEL_99;
  }
  id v31 = *v29;
  v132[16] = v31;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v32 = (id *)getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr)
  {
    id v33 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v33, "MPModelPropertyPlaylistLastDevicePlaybackDate");
    getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr = v126[3];
    id v32 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v32) {
    goto LABEL_99;
  }
  id v108 = *v32;
  v132[17] = v108;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v34 = (id *)getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr)
  {
    v35 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v35, "MPModelPropertyPlaylistKeepLocalEnableState");
    getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr = v126[3];
    v34 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v34) {
    goto LABEL_99;
  }
  id v107 = *v34;
  v132[18] = v107;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v36 = (id *)getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr)
  {
    v37 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v37, "MPModelPropertyPlaylistKeepLocalManagedStatus");
    getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr = v126[3];
    id v36 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v36) {
    goto LABEL_99;
  }
  id v106 = *v36;
  v132[19] = v106;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v38 = (id *)getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    uint64_t v39 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v39, "MPModelPropertyPlaylistKeepLocalManagedStatusReason");
    getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr = v126[3];
    v38 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v38) {
    goto LABEL_99;
  }
  id v105 = *v38;
  v132[20] = v105;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v40 = (id *)getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr)
  {
    uint64_t v41 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v41, "MPModelPropertyPlaylistIsOwner");
    getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr = v126[3];
    id v40 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v40) {
    goto LABEL_99;
  }
  id v104 = *v40;
  v132[21] = v104;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  uint64_t v42 = (id *)getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr)
  {
    v43 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v43, "MPModelPropertyPlaylistIsCollaborative");
    getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr = v126[3];
    uint64_t v42 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v42) {
    goto LABEL_99;
  }
  id v103 = *v42;
  v132[22] = v103;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v44 = (id *)getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr)
  {
    id v45 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v45, "MPModelPropertyPlaylistCuratorPlaylist");
    getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr = v126[3];
    id v44 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v44) {
    goto LABEL_99;
  }
  id v102 = *v44;
  v132[23] = v102;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v46 = (id *)getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr)
  {
    id v47 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v47, "MPModelPropertyPlaylistPublicPlaylist");
    getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr = v126[3];
    id v46 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v46) {
    goto LABEL_99;
  }
  id v101 = *v46;
  v132[24] = v101;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  uint64_t v48 = (id *)getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr)
  {
    v49 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v49, "MPModelPropertyPlaylistVisiblePlaylist");
    getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr = v126[3];
    uint64_t v48 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v48) {
    goto LABEL_99;
  }
  id v100 = *v48;
  v132[25] = v100;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v50 = (id *)getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr)
  {
    v51 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v51, "MPModelPropertyPlaylistSubscribed");
    getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr = v126[3];
    v50 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v50) {
    goto LABEL_99;
  }
  id v99 = *v50;
  v132[26] = v99;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v52 = (id *)getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr)
  {
    v53 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v53, "MPModelPropertyPlaylistUserEditableComponents");
    getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr = v126[3];
    v52 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v52) {
    goto LABEL_99;
  }
  id v98 = *v52;
  v132[27] = v98;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v54 = (id *)getMPModelPropertyPlaylistShareURLSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistShareURLSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistShareURLSymbolLoc_ptr)
  {
    id v55 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v55, "MPModelPropertyPlaylistShareURL");
    getMPModelPropertyPlaylistShareURLSymbolLoc_ptr = v126[3];
    id v54 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v54) {
    goto LABEL_99;
  }
  id v97 = *v54;
  v132[28] = v97;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v56 = (id *)getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr)
  {
    v57 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v57, "MPModelPropertyPlaylistDescriptionText");
    getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr = v126[3];
    v56 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v56) {
    goto LABEL_99;
  }
  id v58 = *v56;
  v132[29] = v58;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v59 = (id *)getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr)
  {
    v60 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v60, "MPModelPropertyPlaylistCloudVersionHash");
    getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr = v126[3];
    v59 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v59) {
    goto LABEL_99;
  }
  v95 = v28;
  v96 = v31;
  id v61 = *v59;
  v132[30] = v61;
  v62 = getMPModelPropertyPlaylistTraits();
  v132[31] = v62;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v63 = (id *)getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr)
  {
    id v64 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v64, "MPModelPropertyPlaylistCollaborationInvitationURL");
    getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr = v126[3];
    id v63 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v63) {
    goto LABEL_99;
  }
  id v65 = *v63;
  v132[32] = v65;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v66 = (id *)getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr)
  {
    v67 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v67, "MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate");
    getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr = v126[3];
    v66 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v66) {
    goto LABEL_99;
  }
  id v68 = *v66;
  v132[33] = v68;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v69 = (id *)getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr)
  {
    v70 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v70, "MPModelPropertyPlaylistCollaboratorStatus");
    getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr = v126[3];
    id v69 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v69) {
    goto LABEL_99;
  }
  id v71 = *v69;
  v132[34] = v71;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v72 = (id *)getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr)
  {
    id v73 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v73, "MPModelPropertyPlaylistCollaborationSharingMode");
    getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr = v126[3];
    v72 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v72) {
    goto LABEL_99;
  }
  id v74 = *v72;
  v132[35] = v74;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  id v75 = (id *)getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr;
  uint64_t v128 = getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr)
  {
    v76 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v76, "MPModelPropertyPlaylistParentPersistentID");
    getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr = v126[3];
    id v75 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v75) {
    goto LABEL_99;
  }
  id v77 = *v75;
  v132[36] = v77;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:37];
  id v79 = (void *)[v118 initWithArray:v78];

  if (_os_feature_enabled_impl())
  {
    v80 = getMPModelPropertyPlaylistIsDisliked();
    [v79 addObject:v80];
  }
  id v81 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  v82 = (id *)getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr;
  uint64_t v128 = getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr)
  {
    id v83 = (void *)MediaPlayerLibrary_6();
    v126[3] = (uint64_t)dlsym(v83, "MPModelRelationshipPlaylistCurator");
    getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr = v126[3];
    v82 = (id *)v126[3];
  }
  _Block_object_dispose(&v125, 8);
  if (!v82)
  {
LABEL_99:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v84 = *v82;
  id v130 = v84;
  id v85 = objc_alloc((Class)getMPPropertySetClass());
  v86 = getMPModelPropertyCuratorName();
  v129[0] = v86;
  v87 = getMPModelPropertyCuratorKind();
  v129[1] = v87;
  v88 = getMPModelPropertyCuratorSubKind();
  v129[2] = v88;
  v89 = getMPModelPropertyCuratorHandle();
  void v129[3] = v89;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:4];
  v91 = (void *)[v85 initWithProperties:v90 relationships:MEMORY[0x263EFFA78]];
  v131 = v91;
  v92 = [NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  v93 = (void *)[v81 initWithProperties:v79 relationships:v92];

  return v93;
}

+ (id)_radioStationSupportedPropertiesForPlayback
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyRadioStationNameSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationNameSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationNameSymbolLoc_ptr)
  {
    id v4 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v4, "MPModelPropertyRadioStationName");
    getMPModelPropertyRadioStationNameSymbolLoc_ptr = v32[3];
    id v3 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v3) {
    goto LABEL_28;
  }
  id v5 = *v3;
  v35[0] = v5;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v6 = (id *)getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v7, "MPModelPropertyRadioStationAttributionLabel");
    getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr = v32[3];
    v6 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v6) {
    goto LABEL_28;
  }
  id v8 = *v6;
  v35[1] = v8;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v9 = (id *)getMPModelPropertyRadioStationTypeSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationTypeSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationTypeSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v10, "MPModelPropertyRadioStationType");
    getMPModelPropertyRadioStationTypeSymbolLoc_ptr = v32[3];
    v9 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v9) {
    goto LABEL_28;
  }
  id v11 = *v9;
  v35[2] = v11;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v12 = (id *)getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v13, "MPModelPropertyRadioStationSubtype");
    getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr = v32[3];
    id v12 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v12) {
    goto LABEL_28;
  }
  id v14 = *v12;
  v35[3] = v14;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v15 = (id *)getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v16, "MPModelPropertyRadioStationProviderUniversalLink");
    getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr = v32[3];
    id v15 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v15) {
    goto LABEL_28;
  }
  id v17 = *v15;
  v35[4] = v17;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v18 = (id *)getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr)
  {
    id v19 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v19, "MPModelPropertyRadioStationProviderBundleIdentifier");
    getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr = v32[3];
    id v18 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v18) {
    goto LABEL_28;
  }
  id v20 = *v18;
  v35[5] = v20;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v21 = (id *)getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr)
  {
    id v22 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v22, "MPModelPropertyRadioStationProviderID");
    getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr = v32[3];
    id v21 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v21) {
    goto LABEL_28;
  }
  id v23 = *v21;
  v35[6] = v23;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v24 = (id *)getMPModelPropertyRadioStationArtworkSymbolLoc_ptr;
  uint64_t v34 = getMPModelPropertyRadioStationArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationArtworkSymbolLoc_ptr)
  {
    id v25 = (void *)MediaPlayerLibrary_6();
    v32[3] = (uint64_t)dlsym(v25, "MPModelPropertyRadioStationArtwork");
    getMPModelPropertyRadioStationArtworkSymbolLoc_ptr = v32[3];
    v24 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v24)
  {
LABEL_28:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v36 = *v24;
  v26 = (void *)MEMORY[0x263EFF8C0];
  id v27 = v36;
  id v28 = [v26 arrayWithObjects:v35 count:8];

  id v29 = (void *)[v2 initWithProperties:v28 relationships:MEMORY[0x263EFFA78]];

  return v29;
}

+ (id)_playlistSupportedPropertiesForPlayback
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = getMPModelPropertyPlaylistArtwork();
  id v15 = v3;
  id v4 = getMPModelPropertyPlaylistName();
  v16 = v4;
  id v5 = getMPModelPropertyPlaylistType();
  id v17 = v5;
  v6 = getMPModelPropertyPlaylistLibraryAdded();
  id v18 = v6;
  id v7 = getMPModelPropertyPlaylistTraits();
  id v19 = v7;
  id v8 = getMPModelPropertyPlaylistIsFavorite();
  id v20 = v8;
  v9 = getMPModelPropertyPlaylistDateFavorited();
  id v21 = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:7];
  id v11 = objc_msgSend(v2, "initWithArray:", v10, v15, v16, v17, v18, v19, v20);

  if (_os_feature_enabled_impl())
  {
    id v12 = getMPModelPropertyPlaylistIsDisliked();
    [v11 addObject:v12];
  }
  v13 = (void *)[objc_alloc((Class)getMPPropertySetClass()) initWithProperties:v11 relationships:MEMORY[0x263EFFA78]];

  return v13;
}

+ (id)_albumSupportedProperties
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v90 = objc_alloc(MEMORY[0x263EFF980]);
  id v100 = getMPModelPropertyAlbumTitle();
  v109[0] = v100;
  id v99 = getMPModelPropertyAlbumTrackCount();
  v109[1] = v99;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v2 = (id *)getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr)
  {
    id v3 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v3, "MPModelPropertyAlbumMaximumItemTrackNumber");
    getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr = v102[3];
    id v2 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v2) {
    goto LABEL_66;
  }
  id v4 = *v2;
  v109[2] = v4;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v5 = (id *)getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v6, "MPModelPropertyAlbumHasCleanContent");
    getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr = v102[3];
    id v5 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v5) {
    goto LABEL_66;
  }
  id v7 = *v5;
  v109[3] = v7;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v8 = (id *)getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v9, "MPModelPropertyAlbumHasExplicitContent");
    getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr = v102[3];
    id v8 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v8) {
    goto LABEL_66;
  }
  id v10 = *v8;
  v109[4] = v10;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v11 = (id *)getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr)
  {
    id v12 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v12, "MPModelPropertyAlbumIsCompilation");
    getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr = v102[3];
    id v11 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v11) {
    goto LABEL_66;
  }
  id v13 = *v11;
  v109[5] = v13;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v14 = (id *)getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr)
  {
    id v15 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v15, "MPModelPropertyAlbumIsClassical");
    getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr = v102[3];
    id v14 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v14) {
    goto LABEL_66;
  }
  v87 = v10;
  v88 = v13;
  id v85 = v4;
  v86 = v7;
  id v89 = *v14;
  v109[6] = v89;
  id v98 = getMPModelPropertyAlbumIsFavorite();
  v109[7] = v98;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  v16 = (id *)getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr)
  {
    id v17 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v17, "MPModelPropertyAlbumClassicalExperienceAvailable");
    getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr = v102[3];
    v16 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v16) {
    goto LABEL_66;
  }
  id v84 = *v16;
  v109[8] = v84;
  id v97 = getMPModelPropertyAlbumDateFavorited();
  v109[9] = v97;
  v96 = getMPModelPropertyAlbumReleaseDateComponents();
  v109[10] = v96;
  v95 = getMPModelPropertyAlbumArtwork();
  v109[11] = v95;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v18 = (id *)getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr)
  {
    id v19 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v19, "MPModelPropertyAlbumLastDevicePlaybackDate");
    getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr = v102[3];
    id v18 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v18) {
    goto LABEL_66;
  }
  id v83 = *v18;
  v109[12] = v83;
  v94 = getMPModelPropertyAlbumLibraryAddEligible();
  v109[13] = v94;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v20 = (id *)getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr)
  {
    id v21 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v21, "MPModelPropertyAlbumDownloadedDate");
    getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr = v102[3];
    id v20 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v20) {
    goto LABEL_66;
  }
  id v82 = *v20;
  v109[14] = v82;
  v93 = getMPModelPropertyAlbumYear();
  v109[15] = v93;
  v92 = getMPModelPropertyAlbumLibraryAdded();
  v109[16] = v92;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v22 = (id *)getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr)
  {
    id v23 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v23, "MPModelPropertyAlbumLibraryAddedDate");
    getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr = v102[3];
    uint64_t v22 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v22) {
    goto LABEL_66;
  }
  id v24 = *v22;
  v109[17] = v24;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v25 = (id *)getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr)
  {
    v26 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v26, "MPModelPropertyAlbumKeepLocalEnableState");
    getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr = v102[3];
    id v25 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v25) {
    goto LABEL_66;
  }
  id v81 = *v25;
  v109[18] = v81;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v27 = (id *)getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr)
  {
    id v28 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v28, "MPModelPropertyAlbumKeepLocalManagedStatus");
    getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr = v102[3];
    id v27 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v27) {
    goto LABEL_66;
  }
  id v29 = *v27;
  v109[19] = v29;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v30 = (id *)getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    uint64_t v31 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v31, "MPModelPropertyAlbumKeepLocalManagedStatusReason");
    getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr = v102[3];
    id v30 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v30) {
    goto LABEL_66;
  }
  id v32 = *v30;
  v109[20] = v32;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v33 = (id *)getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr)
  {
    uint64_t v34 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v34, "MPModelPropertyAlbumCopyrightText");
    getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr = v102[3];
    uint64_t v33 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v33) {
    goto LABEL_66;
  }
  id v35 = *v33;
  v109[21] = v35;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v36 = (id *)getMPModelPropertyAlbumPreorderSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumPreorderSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumPreorderSymbolLoc_ptr)
  {
    uint64_t v37 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v37, "MPModelPropertyAlbumPreorder");
    getMPModelPropertyAlbumPreorderSymbolLoc_ptr = v102[3];
    id v36 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v36) {
    goto LABEL_66;
  }
  v80 = v24;
  id v38 = *v36;
  v109[22] = v38;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v39 = (id *)getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr)
  {
    id v40 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v40, "MPModelPropertyAlbumEditorNotes");
    getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr = v102[3];
    uint64_t v39 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v39) {
    goto LABEL_66;
  }
  id v41 = *v39;
  v109[23] = v41;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v42 = (id *)getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr)
  {
    v43 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v43, "MPModelPropertyAlbumShortEditorNotes");
    getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr = v102[3];
    uint64_t v42 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v42) {
    goto LABEL_66;
  }
  id v44 = *v42;
  v109[24] = v44;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v45 = (id *)getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr)
  {
    id v46 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v46, "MPModelPropertyAlbumVolumeNormalization");
    getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr = v102[3];
    id v45 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v45) {
    goto LABEL_66;
  }
  id v47 = *v45;
  v109[25] = v47;
  uint64_t v48 = getMPModelPropertyAlbumTraits();
  v109[26] = v48;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  v49 = (id *)getMPModelPropertyAlbumIsStoreRedownloadableSymbolLoc_ptr;
  uint64_t v104 = getMPModelPropertyAlbumIsStoreRedownloadableSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumIsStoreRedownloadableSymbolLoc_ptr)
  {
    v50 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v50, "MPModelPropertyAlbumIsStoreRedownloadable");
    getMPModelPropertyAlbumIsStoreRedownloadableSymbolLoc_ptr = v102[3];
    v49 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v49) {
    goto LABEL_66;
  }
  id v110 = *v49;
  v51 = (void *)MEMORY[0x263EFF8C0];
  id v52 = v110;
  v53 = [v51 arrayWithObjects:v109 count:28];

  id v54 = (void *)[v90 initWithArray:v53];
  id v55 = objc_alloc(MEMORY[0x263EFF980]);
  v56 = getMPModelPropertyArtistName();
  v108[0] = v56;
  v57 = getMPModelPropertyArtistSongCount();
  v108[1] = v57;
  id v58 = getMPModelPropertyArtistAlbumCount();
  v108[2] = v58;
  v59 = getMPModelPropertyArtistLibraryAddedDate();
  v108[3] = v59;
  v60 = getMPModelPropertyArtistIsFavorite();
  v108[4] = v60;
  id v61 = getMPModelPropertyArtistDateFavorited();
  v108[5] = v61;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:6];
  id v63 = (void *)[v55 initWithArray:v62];

  if (_os_feature_enabled_impl())
  {
    id v64 = getMPModelPropertyAlbumIsDisliked();
    [v54 addObject:v64];

    id v65 = getMPModelPropertyArtistIsDisliked();
    [v63 addObject:v65];
  }
  id v66 = objc_alloc((Class)getMPPropertySetClass());
  v67 = getMPModelRelationshipAlbumArtist();
  v105[0] = v67;
  id v68 = [getMPPropertySetClass() propertySetWithProperties:v63];
  v107[0] = v68;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v69 = (id *)getMPModelRelationshipAlbumGenreSymbolLoc_ptr;
  uint64_t v104 = getMPModelRelationshipAlbumGenreSymbolLoc_ptr;
  if (!getMPModelRelationshipAlbumGenreSymbolLoc_ptr)
  {
    v70 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v70, "MPModelRelationshipAlbumGenre");
    getMPModelRelationshipAlbumGenreSymbolLoc_ptr = v102[3];
    id v69 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v69) {
    goto LABEL_66;
  }
  id v71 = *v69;
  v105[1] = v71;
  v72 = [a1 _genreSupportedProperties];
  v107[1] = v72;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v73 = (id *)getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr;
  uint64_t v104 = getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr;
  if (!getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr)
  {
    id v74 = (void *)MediaPlayerLibrary_6();
    v102[3] = (uint64_t)dlsym(v74, "MPModelRelationshipAlbumRepresentativeSong");
    getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr = v102[3];
    id v73 = (id *)v102[3];
  }
  _Block_object_dispose(&v101, 8);
  if (!v73)
  {
LABEL_66:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v106 = *v73;
  id v75 = v106;
  v76 = [a1 _representativeSongSupportedProperties];
  v107[2] = v76;
  id v77 = [NSDictionary dictionaryWithObjects:v107 forKeys:v105 count:3];
  v78 = (void *)[v66 initWithProperties:v54 relationships:v77];

  return v78;
}

+ (id)_representativeSongSupportedProperties
{
  v60[19] = *MEMORY[0x263EF8340];
  id v52 = objc_alloc(MEMORY[0x263EFF980]);
  v50 = getMPModelPropertySongArtistUploadedContent();
  v60[0] = v50;
  uint64_t v48 = getMPModelPropertySongArtwork();
  v60[1] = v48;
  id v46 = getMPModelPropertySongCloudStatus();
  v60[2] = v46;
  id v44 = getMPModelPropertySongDuration();
  v60[3] = v44;
  uint64_t v42 = getMPModelPropertySongExplicit();
  v60[4] = v42;
  id v40 = getMPModelPropertySongHasVideo();
  v60[5] = v40;
  id v38 = getMPModelPropertySongIsFavorite();
  v60[6] = v38;
  id v36 = getMPModelPropertySongDateFavorited();
  v60[7] = v36;
  getMPModelPropertySongKeepLocalEnableState();
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  v60[8] = v33;
  uint64_t v31 = getMPModelPropertySongKeepLocalManagedStatus();
  v60[9] = v31;
  id v2 = getMPModelPropertySongKeepLocalManagedStatusReason();
  v60[10] = v2;
  id v3 = getMPModelPropertySongLibraryAdded();
  v60[11] = v3;
  id v4 = getMPModelPropertySongLibraryAddEligible();
  v60[12] = v4;
  id v5 = getMPModelPropertySongShouldShowComposer();
  v60[13] = v5;
  v6 = getMPModelPropertySongTitle();
  v60[14] = v6;
  id v7 = get_MPModelPropertySongTrackCount();
  v60[15] = v7;
  id v8 = getMPModelPropertySongTrackNumber();
  v60[16] = v8;
  v9 = getMPModelPropertySongTraits();
  v60[17] = v9;
  id v10 = getMPModelPropertySongUserRating();
  v60[18] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:19];
  v53 = (void *)[v52 initWithArray:v11];

  if (_os_feature_enabled_impl())
  {
    id v12 = getMPModelPropertySongIsDisliked();
    [v53 addObject:v12];
  }
  id v34 = objc_alloc((Class)getMPPropertySetClass());
  v51 = getMPModelRelationshipSongLocalFileAsset();
  v58[0] = v51;
  id MPPropertySetClass = getMPPropertySetClass();
  v49 = getMPModelPropertyFileAssetNonPurgeable();
  v57[0] = v49;
  id v47 = getMPModelPropertyFileAssetProtectionType();
  v57[1] = v47;
  id v45 = getMPModelPropertyFileAssetTraits();
  v57[2] = v45;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
  id v41 = [MPPropertySetClass propertySetWithProperties:v43];
  v59[0] = v41;
  uint64_t v39 = getMPModelRelationshipSongStoreAsset();
  v58[1] = v39;
  id v14 = getMPPropertySetClass();
  uint64_t v37 = getMPModelPropertyStoreAssetRedownloadable();
  v56[0] = v37;
  id v32 = getMPModelPropertyStoreAssetSubscriptionRequired();
  v56[1] = v32;
  id v30 = getMPModelPropertyStoreAssetNeedsUserUpload();
  v56[2] = v30;
  id v29 = getMPModelPropertyStoreAssetEndpointType();
  v56[3] = v29;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
  id v27 = [v14 propertySetWithProperties:v28];
  v59[1] = v27;
  id v15 = getMPModelRelationshipSongHomeSharingAsset();
  v58[2] = v15;
  id v16 = getMPPropertySetClass();
  id v17 = getMPModelPropertyHomeSharingAssetAvailable();
  id v55 = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  id v19 = [v16 propertySetWithProperties:v18];
  v59[2] = v19;
  id v20 = getMPModelRelationshipSongArtist();
  v58[3] = v20;
  id v21 = getMPPropertySetClass();
  uint64_t v22 = getMPModelPropertyArtistName();
  id v54 = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  id v24 = [v21 propertySetWithProperties:v23];
  v59[3] = v24;
  id v25 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
  id v35 = (id)[v34 initWithProperties:v53 relationships:v25];

  return v35;
}

+ (id)_storeAssetSupportedProperties
{
  v10[4] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyStoreAssetRedownloadable();
  v10[0] = v3;
  id v4 = getMPModelPropertyStoreAssetSubscriptionRequired();
  v10[1] = v4;
  id v5 = getMPModelPropertyStoreAssetNeedsUserUpload();
  v10[2] = v5;
  v6 = getMPModelPropertyStoreAssetEndpointType();
  v10[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  id v8 = (void *)[v2 initWithProperties:v7 relationships:MEMORY[0x263EFFA78]];

  return v8;
}

+ (id)_localFileAssetSupportedProperties
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyFileAssetNonPurgeable();
  v9 = v3;
  id v4 = getMPModelPropertyFileAssetProtectionType();
  id v10 = v4;
  id v5 = getMPModelPropertyFileAssetTraits();
  id v11 = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:3];
  id v7 = objc_msgSend(v2, "initWithProperties:relationships:", v6, MEMORY[0x263EFFA78], v9, v10);

  return v7;
}

+ (id)_genreSupportedProperties
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyGenreNameSymbolLoc_ptr;
  uint64_t v16 = getMPModelPropertyGenreNameSymbolLoc_ptr;
  if (!getMPModelPropertyGenreNameSymbolLoc_ptr)
  {
    id v4 = (void *)MediaPlayerLibrary_6();
    v14[3] = (uint64_t)dlsym(v4, "MPModelPropertyGenreName");
    getMPModelPropertyGenreNameSymbolLoc_ptr = v14[3];
    id v3 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v3) {
    goto LABEL_10;
  }
  id v5 = *v3;
  id v17 = v5;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v6 = (id *)getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr;
  uint64_t v16 = getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v14[3] = (uint64_t)dlsym(v7, "MPModelPropertyGenreLibraryAddedDate");
    getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr = v14[3];
    v6 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
LABEL_10:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v18 = *v6;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = v18;
  id v10 = [v8 arrayWithObjects:&v17 count:2];

  id v11 = (void *)[v2 initWithProperties:v10 relationships:MEMORY[0x263EFFA78]];

  return v11;
}

+ (id)_artistSupportedProperties
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = getMPModelPropertyArtistName();
  v24[0] = v3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  id v4 = (id *)getMPModelPropertyArtistArtworkSymbolLoc_ptr;
  uint64_t v23 = getMPModelPropertyArtistArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyArtistArtworkSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v21[3] = (uint64_t)dlsym(v5, "MPModelPropertyArtistArtwork");
    getMPModelPropertyArtistArtworkSymbolLoc_ptr = v21[3];
    id v4 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = *v4;
  v24[1] = v6;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr;
  uint64_t v23 = getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr;
  if (!getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    v21[3] = (uint64_t)dlsym(v8, "MPModelPropertyArtistClassicalExperienceAvailable");
    getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr = v21[3];
    id v7 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
LABEL_12:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v25 = *v7;
  id v9 = v25;
  id v10 = getMPModelPropertyArtistSongCount();
  v26 = v10;
  id v11 = getMPModelPropertyArtistAlbumCount();
  id v27 = v11;
  uint64_t v12 = getMPModelPropertyArtistLibraryAddedDate();
  id v28 = v12;
  uint64_t v13 = getMPModelPropertyArtistIsFavorite();
  id v29 = v13;
  id v14 = getMPModelPropertyArtistDateFavorited();
  id v30 = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:8];
  uint64_t v16 = (void *)[v2 initWithArray:v15];

  if (_os_feature_enabled_impl())
  {
    id v17 = getMPModelPropertyArtistIsDisliked();
    [v16 addObject:v17];
  }
  id v18 = (void *)[objc_alloc((Class)getMPPropertySetClass()) initWithProperties:v16 relationships:MEMORY[0x263EFFA78]];

  return v18;
}

+ (MusicKit_SoftLinking_MPModelRequest)defaultUnpersonalizedRequest
{
  v68[1] = *MEMORY[0x263EF8340];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2050000000;
  id v3 = (void *)getMPModelRequestClass_softClass;
  uint64_t v64 = getMPModelRequestClass_softClass;
  if (!getMPModelRequestClass_softClass)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelRequestClass_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    __getMPModelRequestClass_block_invoke((uint64_t)&v56);
    id v3 = (void *)v62[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v61, 8);
  id v55 = objc_alloc_init(v4);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2050000000;
  id v5 = (void *)getMPModelKindClass_softClass;
  uint64_t v64 = getMPModelKindClass_softClass;
  if (!getMPModelKindClass_softClass)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelKindClass_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    __getMPModelKindClass_block_invoke((uint64_t)&v56);
    id v5 = (void *)v62[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v61, 8);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2050000000;
  id v7 = (void *)getMPModelStoreBrowseContentItemClass_softClass_0;
  uint64_t v64 = getMPModelStoreBrowseContentItemClass_softClass_0;
  if (!getMPModelStoreBrowseContentItemClass_softClass_0)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemClass_block_invoke_0;
    v59 = &unk_26443F950;
    v60 = &v61;
    __getMPModelStoreBrowseContentItemClass_block_invoke_0((uint64_t)&v56);
    id v7 = (void *)v62[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v61, 8);
  id v9 = [v6 kindWithModelClass:v8];
  [v55 setItemKind:v9];

  id v50 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  id v10 = (id *)getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    id v11 = (void *)MediaPlayerLibrary_6();
    uint64_t v12 = dlsym(v11, "MPModelStoreBrowseContentItemPropertyItemType");
    *(void *)(v60[1] + 24) = v12;
    getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr = *(void *)(v60[1] + 24);
    id v10 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v10) {
    goto LABEL_34;
  }
  id v49 = *v10;
  v68[0] = v49;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v13 = (id *)getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    id v14 = (void *)MediaPlayerLibrary_6();
    uint64_t v15 = dlsym(v14, "MPModelStoreBrowseContentItemRelationshipAlbum");
    *(void *)(v60[1] + 24) = v15;
    getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr = *(void *)(v60[1] + 24);
    uint64_t v13 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v13) {
    goto LABEL_34;
  }
  id v48 = *v13;
  v65[0] = v48;
  id v54 = [a1 _albumSupportedProperties];
  v67[0] = v54;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v16 = (id *)getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    id v17 = (void *)MediaPlayerLibrary_6();
    id v18 = dlsym(v17, "MPModelStoreBrowseContentItemRelationshipArtist");
    *(void *)(v60[1] + 24) = v18;
    getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr = *(void *)(v60[1] + 24);
    uint64_t v16 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v16) {
    goto LABEL_34;
  }
  id v47 = *v16;
  v65[1] = v47;
  v53 = [a1 _artistSupportedProperties];
  v67[1] = v53;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v19 = (id *)getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    uint64_t v20 = (void *)MediaPlayerLibrary_6();
    id v21 = dlsym(v20, "MPModelStoreBrowseContentItemRelationshipSong");
    *(void *)(v60[1] + 24) = v21;
    getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr = *(void *)(v60[1] + 24);
    uint64_t v19 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v19) {
    goto LABEL_34;
  }
  id v46 = *v19;
  v65[2] = v46;
  id v52 = [a1 _songSupportedProperties];
  v67[2] = v52;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v22 = (id *)getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    uint64_t v23 = (void *)MediaPlayerLibrary_6();
    id v24 = dlsym(v23, "MPModelStoreBrowseContentItemRelationshipMovie");
    *(void *)(v60[1] + 24) = v24;
    getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr = *(void *)(v60[1] + 24);
    uint64_t v22 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v22) {
    goto LABEL_34;
  }
  id v45 = *v22;
  v65[3] = v45;
  id v25 = [a1 _movieSupportedProperties];
  v67[3] = v25;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  v26 = (id *)getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    id v27 = (void *)MediaPlayerLibrary_6();
    id v28 = dlsym(v27, "MPModelStoreBrowseContentItemRelationshipPlaylist");
    *(void *)(v60[1] + 24) = v28;
    getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr = *(void *)(v60[1] + 24);
    v26 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v26) {
    goto LABEL_34;
  }
  id v29 = *v26;
  v65[4] = v29;
  id v30 = [a1 _playlistSupportedProperties];
  v67[4] = v30;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v31 = (id *)getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    id v32 = (void *)MediaPlayerLibrary_6();
    id v33 = dlsym(v32, "MPModelStoreBrowseContentItemRelationshipTVEpisode");
    *(void *)(v60[1] + 24) = v33;
    getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr = *(void *)(v60[1] + 24);
    uint64_t v31 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v31) {
    goto LABEL_34;
  }
  id v34 = *v31;
  v65[5] = v34;
  id v35 = [a1 _tvEpisodeSupportedProperties];
  v67[5] = v35;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  id v36 = (id *)getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr;
  uint64_t v64 = getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr)
  {
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    id v58 = __getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_block_invoke;
    v59 = &unk_26443F950;
    v60 = &v61;
    uint64_t v37 = (void *)MediaPlayerLibrary_6();
    id v38 = dlsym(v37, "MPModelStoreBrowseContentItemRelationshipTVSeason");
    *(void *)(v60[1] + 24) = v38;
    getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr = *(void *)(v60[1] + 24);
    id v36 = (id *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v36)
  {
LABEL_34:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v66 = *v36;
  id v39 = v66;
  id v40 = [a1 _tvSeasonSupportedProperties];
  v67[6] = v40;
  id v41 = [NSDictionary dictionaryWithObjects:v67 forKeys:v65 count:7];
  uint64_t v42 = (void *)[v50 initWithProperties:v51 relationships:v41];
  [v55 setItemProperties:v42];

  v43 = (void *)[objc_alloc((Class)a1) _initWithUnderlyingRequest:v55];

  return (MusicKit_SoftLinking_MPModelRequest *)v43;
}

- (MPModelRequest)_underlyingRequest
{
  return self->_underlyingRequest;
}

- (id)_initWithUnderlyingRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelRequest;
  id v6 = [(MusicKit_SoftLinking_MPModelRequest *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingRequest, a3);
  }

  return v7;
}

+ (id)_playbackItemSupportedProperties
{
  v27[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v4 = (id *)getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr;
  uint64_t v24 = getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v22[3] = (uint64_t)dlsym(v5, "MPModelRelationshipGenericPlaylistEntry");
    getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr = v22[3];
    id v4 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = *v4;
  v25[0] = v6;
  id v7 = [a1 _playlistEntrySupportedPropertiesForPlayback];
  v27[0] = v7;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v8 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr_0;
  uint64_t v24 = getMPModelRelationshipGenericSongSymbolLoc_ptr_0;
  if (!getMPModelRelationshipGenericSongSymbolLoc_ptr_0)
  {
    objc_super v9 = (void *)MediaPlayerLibrary_6();
    v22[3] = (uint64_t)dlsym(v9, "MPModelRelationshipGenericSong");
    getMPModelRelationshipGenericSongSymbolLoc_ptr_0 = v22[3];
    id v8 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v8) {
    goto LABEL_13;
  }
  id v10 = *v8;
  v25[1] = v10;
  id v11 = [a1 _songSupportedPropertiesForPlayback];
  v27[1] = v11;
  uint64_t v12 = getMPModelRelationshipGenericMovie();
  v25[2] = v12;
  uint64_t v13 = [a1 _movieSupportedPropertiesForPlayback];
  v27[2] = v13;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v14 = (id *)getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0;
  uint64_t v24 = getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0;
  if (!getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0)
  {
    uint64_t v15 = (void *)MediaPlayerLibrary_6();
    v22[3] = (uint64_t)dlsym(v15, "MPModelRelationshipGenericTVEpisode");
    getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0 = v22[3];
    id v14 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
LABEL_13:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v26 = *v14;
  id v16 = v26;
  id v17 = [a1 _tvEpisodeSupportedPropertiesForPlayback];
  v27[3] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v25 count:4];
  uint64_t v19 = (void *)[v3 initWithProperties:MEMORY[0x263EFFA68] relationships:v18];

  return v19;
}

+ (id)_playlistEntrySupportedPropertiesForPlayback
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  id v4 = getMPModelRelationshipPlaylistEntrySong();
  v13[0] = v4;
  id v5 = [a1 _songSupportedPropertiesForPlayback];
  v14[0] = v5;
  id v6 = getMPModelRelationshipPlaylistEntryMovie();
  v13[1] = v6;
  id v7 = [a1 _movieSupportedPropertiesForPlayback];
  v14[1] = v7;
  id v8 = getMPModelRelationshipPlaylistEntryTVEpisode();
  v13[2] = v8;
  objc_super v9 = [a1 _tvEpisodeSupportedPropertiesForPlayback];
  v14[2] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v11 = (void *)[v3 initWithProperties:MEMORY[0x263EFFA68] relationships:v10];

  return v11;
}

+ (id)_movieSupportedProperties
{
  v63[16] = *MEMORY[0x263EF8340];
  id v50 = objc_alloc((Class)getMPPropertySetClass());
  id v55 = getMPModelPropertyMovieArtwork();
  v63[0] = v55;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr)
  {
    id v4 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v4, "MPModelPropertyMovieDownloadedDate");
    getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr = v57[3];
    id v3 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v3) {
    goto LABEL_43;
  }
  id v49 = *v3;
  v63[1] = v49;
  id v54 = getMPModelPropertyMovieDuration();
  v63[2] = v54;
  v53 = getMPModelPropertyMovieHasCloudSyncSource();
  v63[3] = v53;
  id v52 = getMPModelPropertyMovieLibraryAdded();
  v63[4] = v52;
  v51 = getMPModelPropertyMovieLibraryAddEligible();
  v63[5] = v51;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v5 = (id *)getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr)
  {
    id v6 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v6, "MPModelPropertyMovieKeepLocalEnableState");
    getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr = v57[3];
    id v5 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v5) {
    goto LABEL_43;
  }
  id v48 = *v5;
  v63[6] = v48;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v8, "MPModelPropertyMovieKeepLocalManagedStatus");
    getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr = v57[3];
    id v7 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v7) {
    goto LABEL_43;
  }
  id v47 = *v7;
  v63[7] = v47;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  objc_super v9 = (id *)getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v10, "MPModelPropertyMovieKeepLocalManagedStatusReason");
    getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr = v57[3];
    objc_super v9 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v9) {
    goto LABEL_43;
  }
  id v46 = *v9;
  v63[8] = v46;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v11 = (id *)getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr)
  {
    uint64_t v12 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v12, "MPModelPropertyMovieLastDevicePlaybackDate");
    getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr = v57[3];
    id v11 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v11) {
    goto LABEL_43;
  }
  id v45 = *v11;
  v63[9] = v45;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v13 = (id *)getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr)
  {
    id v14 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v14, "MPModelPropertyMovieLibraryAddedDate");
    getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr = v57[3];
    uint64_t v13 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v13) {
    goto LABEL_43;
  }
  id v44 = *v13;
  v63[10] = v44;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v15 = (id *)getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr;
  if (!getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr)
  {
    id v16 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v16, "MPModelPropertyMovieInfoDictionary");
    getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr = v57[3];
    uint64_t v15 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v15) {
    goto LABEL_43;
  }
  id v43 = *v15;
  v63[11] = v43;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v17 = (id *)getMPModelPropertyMovieReleaseDateSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieReleaseDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieReleaseDateSymbolLoc_ptr)
  {
    id v18 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v18, "MPModelPropertyMovieReleaseDate");
    getMPModelPropertyMovieReleaseDateSymbolLoc_ptr = v57[3];
    id v17 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v17) {
    goto LABEL_43;
  }
  id v42 = *v17;
  v63[12] = v42;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v19 = (id *)getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr)
  {
    uint64_t v20 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v20, "MPModelPropertyMovieDescriptionText");
    getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr = v57[3];
    uint64_t v19 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v19) {
    goto LABEL_43;
  }
  id v41 = *v19;
  v63[13] = v41;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v21 = (id *)getMPModelPropertyMovieTaglineSymbolLoc_ptr;
  uint64_t v59 = getMPModelPropertyMovieTaglineSymbolLoc_ptr;
  if (!getMPModelPropertyMovieTaglineSymbolLoc_ptr)
  {
    uint64_t v22 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v22, "MPModelPropertyMovieTagline");
    getMPModelPropertyMovieTaglineSymbolLoc_ptr = v57[3];
    uint64_t v21 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v21) {
    goto LABEL_43;
  }
  id v40 = *v21;
  v63[14] = v40;
  uint64_t v23 = getMPModelPropertyMovieTitle();
  v63[15] = v23;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:16];
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v25 = (id *)getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr;
  uint64_t v59 = getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr;
  if (!getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr)
  {
    id v26 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v26, "MPModelRelationshipMoviePlaybackPosition");
    getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr = v57[3];
    id v25 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v25) {
    goto LABEL_43;
  }
  id v27 = *v25;
  v60[0] = v27;
  id v28 = [a1 _playbackPositionSupportedProperties];
  v62[0] = v28;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v29 = (id *)getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr;
  uint64_t v59 = getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr)
  {
    id v30 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v30, "MPModelRelationshipMovieLocalFileAsset");
    getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr = v57[3];
    id v29 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v29) {
    goto LABEL_43;
  }
  id v31 = *v29;
  v60[1] = v31;
  id v32 = [a1 _localFileAssetSupportedProperties];
  v62[1] = v32;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  id v33 = (id *)getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr;
  uint64_t v59 = getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr)
  {
    id v34 = (void *)MediaPlayerLibrary_6();
    void v57[3] = (uint64_t)dlsym(v34, "MPModelRelationshipMovieStoreAsset");
    getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr = v57[3];
    id v33 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v33)
  {
LABEL_43:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v61 = *v33;
  id v35 = v61;
  id v36 = [a1 _storeAssetSupportedProperties];
  v62[2] = v36;
  uint64_t v37 = [NSDictionary dictionaryWithObjects:v62 forKeys:v60 count:3];
  id v38 = (void *)[v50 initWithProperties:v24 relationships:v37];

  return v38;
}

+ (id)_movieSupportedPropertiesForPlayback
{
  v12[6] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyMovieArtwork();
  v12[0] = v3;
  id v4 = getMPModelPropertyMovieDuration();
  v12[1] = v4;
  id v5 = getMPModelPropertyMovieHasCloudSyncSource();
  v12[2] = v5;
  id v6 = getMPModelPropertyMovieLibraryAdded();
  v12[3] = v6;
  id v7 = getMPModelPropertyMovieLibraryAddEligible();
  v12[4] = v7;
  id v8 = getMPModelPropertyMovieTitle();
  v12[5] = v8;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
  id v10 = (void *)[v2 initWithProperties:v9 relationships:MEMORY[0x263EFFA78]];

  return v10;
}

+ (id)_tvEpisodeSupportedProperties
{
  v83[19] = *MEMORY[0x263EF8340];
  id v60 = objc_alloc((Class)getMPPropertySetClass());
  v72 = getMPModelPropertyTVEpisodeArtwork();
  v83[0] = v72;
  id v71 = getMPModelPropertyTVEpisodeDuration();
  v83[1] = v71;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr)
  {
    id v4 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v4, "MPModelPropertyTVEpisodeTypeDisplayName");
    getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr = v74[3];
    id v3 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v3) {
    goto LABEL_49;
  }
  id v59 = *v3;
  v83[2] = v59;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v5 = (id *)getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr)
  {
    id v6 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v6, "MPModelPropertyTVEpisodeDownloadedDate");
    getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr = v74[3];
    id v5 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v5) {
    goto LABEL_49;
  }
  id v58 = *v5;
  v83[3] = v58;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v8, "MPModelPropertyTVEpisodeExplicitRating");
    getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr = v74[3];
    id v7 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v7) {
    goto LABEL_49;
  }
  id v57 = *v7;
  v83[4] = v57;
  v70 = getMPModelPropertyTVEpisodeHasCloudSyncSource();
  v83[5] = v70;
  id v69 = getMPModelPropertyTVEpisodeLibraryAdded();
  v83[6] = v69;
  id v68 = getMPModelPropertyTVEpisodeLibraryAddEligible();
  v83[7] = v68;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  objc_super v9 = (id *)getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v10, "MPModelPropertyTVEpisodeMusicShow");
    getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr = v74[3];
    objc_super v9 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v9) {
    goto LABEL_49;
  }
  id v56 = *v9;
  v83[8] = v56;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v11 = (id *)getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr)
  {
    uint64_t v12 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v12, "MPModelPropertyTVEpisodeKeepLocalEnableState");
    getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr = v74[3];
    id v11 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v11) {
    goto LABEL_49;
  }
  id v55 = *v11;
  v83[9] = v55;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v13 = (id *)getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr)
  {
    id v14 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v14, "MPModelPropertyTVEpisodeKeepLocalManagedStatus");
    getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr = v74[3];
    uint64_t v13 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v13) {
    goto LABEL_49;
  }
  id v54 = *v13;
  v83[10] = v54;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v15 = (id *)getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    id v16 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v16, "MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
    getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr = v74[3];
    uint64_t v15 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v15) {
    goto LABEL_49;
  }
  id v53 = *v15;
  v83[11] = v53;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v17 = (id *)getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr)
  {
    id v18 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v18, "MPModelPropertyTVEpisodeLastDevicePlaybackDate");
    getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr = v74[3];
    id v17 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v17) {
    goto LABEL_49;
  }
  id v52 = *v17;
  v83[12] = v52;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v19 = (id *)getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr)
  {
    uint64_t v20 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v20, "MPModelPropertyTVEpisodeLibraryAddedDate");
    getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr = v74[3];
    uint64_t v19 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v19) {
    goto LABEL_49;
  }
  id v51 = *v19;
  v83[13] = v51;
  v67 = getMPModelPropertyTVEpisodeNumber();
  v83[14] = v67;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v21 = (id *)getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr)
  {
    uint64_t v22 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v22, "MPModelPropertyTVEpisodeReleaseDate");
    getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr = v74[3];
    uint64_t v21 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v21) {
    goto LABEL_49;
  }
  id v50 = *v21;
  v83[15] = v50;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v23 = (id *)getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr;
  uint64_t v76 = getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr)
  {
    uint64_t v24 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v24, "MPModelPropertyTVEpisodeDescriptionText");
    getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr = v74[3];
    uint64_t v23 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v23) {
    goto LABEL_49;
  }
  id v49 = *v23;
  v83[16] = v49;
  id v66 = getMPModelPropertyTVEpisodeTitle();
  v83[17] = v66;
  id v65 = getMPModelPropertyTVEpisodeType();
  v83[18] = v65;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:19];
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v25 = (id *)getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr;
  uint64_t v76 = getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr)
  {
    id v26 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v26, "MPModelRelationshipTVEpisodePlaybackPosition");
    getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr = v74[3];
    id v25 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v25) {
    goto LABEL_49;
  }
  id v48 = *v25;
  v79[0] = v48;
  uint64_t v64 = [a1 _playbackPositionSupportedProperties];
  v82[0] = v64;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v27 = (id *)getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr;
  uint64_t v76 = getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr)
  {
    id v28 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v28, "MPModelRelationshipTVEpisodeStoreAsset");
    getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr = v74[3];
    id v27 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v27) {
    goto LABEL_49;
  }
  id v47 = *v27;
  v79[1] = v47;
  uint64_t v63 = [a1 _storeAssetSupportedProperties];
  v82[1] = v63;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v29 = (id *)getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr;
  uint64_t v76 = getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr)
  {
    id v30 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v30, "MPModelRelationshipTVEpisodeLocalFileAsset");
    getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr = v74[3];
    id v29 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v29) {
    goto LABEL_49;
  }
  id v31 = *v29;
  v79[2] = v31;
  id v32 = [a1 _localFileAssetSupportedProperties];
  v82[2] = v32;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  id v33 = (id *)getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr;
  uint64_t v76 = getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr)
  {
    id v34 = (void *)MediaPlayerLibrary_6();
    v74[3] = (uint64_t)dlsym(v34, "MPModelRelationshipTVEpisodeSeason");
    getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr = v74[3];
    id v33 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v33)
  {
LABEL_49:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v80 = *v33;
  id v46 = v80;
  id MPPropertySetClass = getMPPropertySetClass();
  id v36 = getMPModelPropertyTVSeasonNumber();
  v78 = v36;
  uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  id v38 = [MPPropertySetClass propertySetWithProperties:v37];
  v82[3] = v38;
  id v39 = getMPModelRelationshipTVEpisodeShow();
  id v81 = v39;
  id v40 = getMPPropertySetClass();
  id v41 = getMPModelPropertyTVShowTitle();
  id v77 = v41;
  id v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  id v43 = [v40 propertySetWithProperties:v42];
  v82[4] = v43;
  id v44 = [NSDictionary dictionaryWithObjects:v82 forKeys:v79 count:5];
  id v61 = (id)[v60 initWithProperties:v62 relationships:v44];

  return v61;
}

+ (id)_playbackPositionSupportedProperties
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr)
  {
    id v4 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v4, "MPModelPropertyPlaybackPositionBookmarkTime");
    getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr = v26[3];
    id v3 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v3) {
    goto LABEL_22;
  }
  id v5 = *v3;
  v29[0] = v5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v6 = (id *)getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v7, "MPModelPropertyPlaybackPositionShouldRememberBookmarkTime");
    getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr = v26[3];
    id v6 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v6) {
    goto LABEL_22;
  }
  id v8 = *v6;
  v29[1] = v8;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  objc_super v9 = (id *)getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v10, "MPModelPropertyPlaybackPositionHasBeenPlayed");
    getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr = v26[3];
    objc_super v9 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v9) {
    goto LABEL_22;
  }
  id v11 = *v9;
  v29[2] = v11;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v12 = (id *)getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr)
  {
    uint64_t v13 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v13, "MPModelPropertyPlaybackPositionUserPlayCount");
    getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr = v26[3];
    uint64_t v12 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v12) {
    goto LABEL_22;
  }
  id v14 = *v12;
  v29[3] = v14;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v15 = (id *)getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr)
  {
    id v16 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v16, "MPModelPropertyPlaybackPositionStartTime");
    getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr = v26[3];
    uint64_t v15 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v15) {
    goto LABEL_22;
  }
  id v17 = *v15;
  v29[4] = v17;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v18 = (id *)getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr)
  {
    uint64_t v19 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v19, "MPModelPropertyPlaybackPositionStopTime");
    getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr = v26[3];
    id v18 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v18)
  {
LABEL_22:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v30 = *v18;
  uint64_t v20 = (void *)MEMORY[0x263EFF8C0];
  id v21 = v30;
  uint64_t v22 = [v20 arrayWithObjects:v29 count:6];

  uint64_t v23 = (void *)[v2 initWithProperties:v22 relationships:MEMORY[0x263EFFA78]];

  return v23;
}

+ (id)_tvEpisodeSupportedPropertiesForPlayback
{
  v23[8] = *MEMORY[0x263EF8340];
  id v14 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v19 = getMPModelPropertyTVEpisodeArtwork();
  v23[0] = v19;
  id v18 = getMPModelPropertyTVEpisodeDuration();
  v23[1] = v18;
  id v17 = getMPModelPropertyTVEpisodeHasCloudSyncSource();
  v23[2] = v17;
  id v16 = getMPModelPropertyTVEpisodeLibraryAdded();
  v23[3] = v16;
  uint64_t v15 = getMPModelPropertyTVEpisodeLibraryAddEligible();
  v23[4] = v15;
  id v2 = getMPModelPropertyTVEpisodeNumber();
  v23[5] = v2;
  id v3 = getMPModelPropertyTVEpisodeTitle();
  v23[6] = v3;
  id v4 = getMPModelPropertyTVEpisodeType();
  v23[7] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:8];
  id v6 = getMPModelRelationshipTVEpisodeShow();
  id v21 = v6;
  id MPPropertySetClass = getMPPropertySetClass();
  id v8 = getMPModelPropertyTVShowTitle();
  uint64_t v20 = v8;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  id v10 = [MPPropertySetClass propertySetWithProperties:v9];
  uint64_t v22 = v10;
  id v11 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  uint64_t v12 = (void *)[v14 initWithProperties:v5 relationships:v11];

  return v12;
}

+ (id)_supportedPropertiesForModelObjectType:(int64_t)a3
{
  id v3 = 0;
  v16[1] = *(id *)MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      uint64_t v4 = [a1 _albumSupportedProperties];
      goto LABEL_22;
    case 2:
      uint64_t v4 = [a1 _artistSupportedProperties];
      goto LABEL_22;
    case 3:
      uint64_t v4 = [a1 _composerSupportedProperties];
      goto LABEL_22;
    case 5:
      uint64_t v4 = [a1 _curatorSupportedProperties];
      goto LABEL_22;
    case 9:
      uint64_t v4 = [a1 _genreSupportedProperties];
      goto LABEL_22;
    case 12:
      uint64_t v4 = [a1 _lyricsSupportedProperties];
      goto LABEL_22;
    case 13:
      uint64_t v4 = [a1 _movieSupportedProperties];
      goto LABEL_22;
    case 14:
    case 26:
    case 30:
    case 34:
    case 35:
      uint64_t v4 = [a1 _songSupportedProperties];
      goto LABEL_22;
    case 15:
    case 19:
    case 20:
      uint64_t v4 = [a1 _playlistSupportedProperties];
      goto LABEL_22;
    case 16:
      uint64_t v4 = [a1 _playlistAuthorSupportedProperties];
      goto LABEL_22;
    case 17:
      uint64_t v4 = [a1 _playlistEntrySupportedProperties];
      goto LABEL_22;
    case 18:
      uint64_t v4 = [a1 _playlistEntryReactionSupportedProperties];
      goto LABEL_22;
    case 23:
      uint64_t v4 = [a1 _recentlyAddedObjectSupportedProperties];
      goto LABEL_22;
    case 29:
      id v5 = objc_alloc((Class)getMPPropertySetClass());
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      id v6 = (id *)getMPModelPropertySectionTitleSymbolLoc_ptr;
      uint64_t v15 = getMPModelPropertySectionTitleSymbolLoc_ptr;
      if (!getMPModelPropertySectionTitleSymbolLoc_ptr)
      {
        id v7 = (void *)MediaPlayerLibrary_6();
        void v13[3] = (uint64_t)dlsym(v7, "MPModelPropertySectionTitle");
        getMPModelPropertySectionTitleSymbolLoc_ptr = v13[3];
        id v6 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (!v6)
      {
        +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
        __break(1u);
      }
      v16[0] = *v6;
      id v8 = (void *)MEMORY[0x263EFF8C0];
      id v9 = v16[0];
      id v10 = [v8 arrayWithObjects:v16 count:1];

      id v3 = (void *)[v5 initWithProperties:v10 relationships:MEMORY[0x263EFFA78]];
      break;
    case 31:
      uint64_t v4 = [a1 _tvEpisodeSupportedProperties];
      goto LABEL_22;
    case 32:
      uint64_t v4 = [a1 _tvSeasonSupportedProperties];
      goto LABEL_22;
    case 33:
      uint64_t v4 = [a1 _tvShowSupportedProperties];
LABEL_22:
      id v3 = (void *)v4;
      break;
    default:
      break;
  }

  return v3;
}

+ (id)_propertySetForRawProperties:(id)a3 relationships:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __82__MusicKit_SoftLinking_MPModelRequest__propertySetForRawProperties_relationships___block_invoke;
  id v17 = &unk_2644400E8;
  id v18 = v9;
  id v19 = a1;
  id v10 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:&v14];

  id v11 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v12 = objc_msgSend(v11, "initWithProperties:relationships:", v8, v10, v14, v15, v16, v17);

  return v12;
}

+ (id)_curatorSupportedProperties
{
  v10[4] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyCuratorHandle();
  v10[0] = v3;
  uint64_t v4 = getMPModelPropertyCuratorKind();
  v10[1] = v4;
  id v5 = getMPModelPropertyCuratorSubKind();
  v10[2] = v5;
  id v6 = getMPModelPropertyCuratorName();
  v10[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  id v8 = (void *)[v2 initWithProperties:v7 relationships:MEMORY[0x263EFFA78]];

  return v8;
}

+ (id)_composerSupportedProperties
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyComposerName();
  uint64_t v15 = v3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v4 = (id *)getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr;
  uint64_t v14 = getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v12[3] = (uint64_t)dlsym(v5, "MPModelPropertyComposerLibraryAddedDate");
    getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr = v12[3];
    uint64_t v4 = (id *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v16 = *v4;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = v16;
  id v8 = [v6 arrayWithObjects:&v15 count:2];

  id v9 = (void *)[v2 initWithProperties:v8 relationships:MEMORY[0x263EFFA78]];

  return v9;
}

+ (id)_lyricsSupportedProperties
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id MPPropertySetClass = getMPPropertySetClass();
  id v3 = getMPModelPropertyLyricsHasLibraryLyrics();
  v17[0] = v3;
  uint64_t v4 = getMPModelPropertyLyricsHasStoreLyrics();
  v17[1] = v4;
  id v5 = getMPModelPropertyLyricsHasTimeSyncedLyrics();
  v17[2] = v5;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v6 = (id *)getMPModelPropertyLyricsTextSymbolLoc_ptr;
  uint64_t v16 = getMPModelPropertyLyricsTextSymbolLoc_ptr;
  if (!getMPModelPropertyLyricsTextSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v14[3] = (uint64_t)dlsym(v7, "MPModelPropertyLyricsText");
    getMPModelPropertyLyricsTextSymbolLoc_ptr = v14[3];
    id v6 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v18 = *v6;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = v18;
  id v10 = [v8 arrayWithObjects:v17 count:4];

  uint64_t v11 = [MPPropertySetClass propertySetWithProperties:v10];

  return v11;
}

+ (id)_playlistAuthorSupportedProperties
{
  void v24[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v4 = (id *)getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr;
  uint64_t v21 = getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v5, "MPModelPropertyPlaylistAuthorIsPendingApproval");
    getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr = v19[3];
    uint64_t v4 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = *v4;
  v24[0] = v6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr;
  uint64_t v21 = getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v8, "MPModelPropertyPlaylistAuthorRole");
    getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr = v19[3];
    id v7 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v7) {
    goto LABEL_13;
  }
  id v9 = *v7;
  v24[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v11 = (id *)getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr;
  uint64_t v21 = getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr)
  {
    uint64_t v12 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v12, "MPModelRelationshipPlaylistAuthorSocialProfile");
    getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr = v19[3];
    uint64_t v11 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_13:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v22 = *v11;
  id v13 = v22;
  uint64_t v14 = [a1 _socialPersonSupportedProperties];
  uint64_t v23 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  uint64_t v16 = (void *)[v3 initWithProperties:v10 relationships:v15];

  return v16;
}

+ (id)_playlistEntrySupportedProperties
{
  v35[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v4 = (id *)getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr;
  uint64_t v31 = getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v29[3] = (uint64_t)dlsym(v5, "MPModelPropertyPlaylistEntryPosition");
    getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr = v29[3];
    uint64_t v4 = (id *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v4) {
    goto LABEL_16;
  }
  id v26 = *v4;
  v35[0] = v26;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  id v6 = (id *)getMPModelPropertyPlaylistEntryPositionUniversalIdentifierSymbolLoc_ptr;
  uint64_t v31 = getMPModelPropertyPlaylistEntryPositionUniversalIdentifierSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryPositionUniversalIdentifierSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v29[3] = (uint64_t)dlsym(v7, "MPModelPropertyPlaylistEntryPositionUniversalIdentifier");
    getMPModelPropertyPlaylistEntryPositionUniversalIdentifierSymbolLoc_ptr = v29[3];
    id v6 = (id *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v6) {
    goto LABEL_16;
  }
  id v25 = *v6;
  v35[1] = v25;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  id v8 = (id *)getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr;
  uint64_t v31 = getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr)
  {
    id v9 = (void *)MediaPlayerLibrary_6();
    v29[3] = (uint64_t)dlsym(v9, "MPModelPropertyPlaylistEntryUniversalIdentifier");
    getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr = v29[3];
    id v8 = (id *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v24 = v3;
  id v23 = *v8;
  v35[2] = v23;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
  id v10 = getMPModelRelationshipPlaylistEntrySong();
  v32[0] = v10;
  uint64_t v11 = [a1 _songSupportedProperties];
  v34[0] = v11;
  uint64_t v12 = getMPModelRelationshipPlaylistEntryMovie();
  v32[1] = v12;
  id v13 = [a1 _movieSupportedProperties];
  v34[1] = v13;
  uint64_t v14 = getMPModelRelationshipPlaylistEntryTVEpisode();
  v32[2] = v14;
  uint64_t v15 = [a1 _tvEpisodeSupportedProperties];
  v34[2] = v15;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v16 = (id *)getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr;
  uint64_t v31 = getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr)
  {
    uint64_t v17 = (void *)MediaPlayerLibrary_6();
    v29[3] = (uint64_t)dlsym(v17, "MPModelRelationshipPlaylistEntrySocialContributor");
    getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr = v29[3];
    uint64_t v16 = (id *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v16)
  {
LABEL_16:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v33 = *v16;
  id v18 = v33;
  uint64_t v19 = [a1 _socialPersonSupportedProperties];
  v34[3] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:v32 count:4];
  uint64_t v21 = (void *)[v24 initWithProperties:v27 relationships:v20];

  return v21;
}

+ (id)_playlistEntryReactionSupportedProperties
{
  void v24[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v4 = (id *)getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr;
  uint64_t v21 = getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v5, "MPModelPropertyPlaylistEntryReactionText");
    getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr = v19[3];
    uint64_t v4 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = *v4;
  v24[0] = v6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr;
  uint64_t v21 = getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v8, "MPModelPropertyPlaylistEntryReactionDate");
    getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr = v19[3];
    id v7 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v7) {
    goto LABEL_13;
  }
  id v9 = *v7;
  v24[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v11 = (id *)getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr;
  uint64_t v21 = getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr)
  {
    uint64_t v12 = (void *)MediaPlayerLibrary_6();
    v19[3] = (uint64_t)dlsym(v12, "MPModelRelationshipPlaylistEntryReactionSocialProfile");
    getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr = v19[3];
    uint64_t v11 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_13:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v22 = *v11;
  id v13 = v22;
  uint64_t v14 = [a1 _socialPersonSupportedProperties];
  id v23 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  uint64_t v16 = (void *)[v3 initWithProperties:v10 relationships:v15];

  return v16;
}

+ (id)_recentlyAddedObjectSupportedProperties
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v4 = getMPModelRelationshipGenericAlbum();
  v15[0] = v4;
  id v5 = [a1 _albumSupportedProperties];
  v16[0] = v5;
  id v6 = getMPModelRelationshipGenericMovie();
  v15[1] = v6;
  id v7 = [a1 _movieSupportedProperties];
  v16[1] = v7;
  id v8 = getMPModelRelationshipGenericPlaylist();
  v15[2] = v8;
  id v9 = [a1 _playlistSupportedProperties];
  id v16[2] = v9;
  id v10 = getMPModelRelationshipGenericTVSeason();
  v15[3] = v10;
  uint64_t v11 = [a1 _tvSeasonSupportedProperties];
  v16[3] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  id v13 = (void *)[v3 initWithProperties:MEMORY[0x263EFFA68] relationships:v12];

  return v13;
}

+ (id)_socialPersonSupportedProperties
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v3 = (id *)getMPModelPropertySocialPersonArtworkSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonArtworkSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonArtworkSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v4, "MPModelPropertySocialPersonArtwork");
    getMPModelPropertySocialPersonArtworkSymbolLoc_ptr = v26[3];
    id v3 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v3) {
    goto LABEL_22;
  }
  id v5 = *v3;
  v29[0] = v5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v6 = (id *)getMPModelPropertySocialPersonHandleSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonHandleSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonHandleSymbolLoc_ptr)
  {
    id v7 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v7, "MPModelPropertySocialPersonHandle");
    getMPModelPropertySocialPersonHandleSymbolLoc_ptr = v26[3];
    id v6 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v6) {
    goto LABEL_22;
  }
  id v8 = *v6;
  v29[1] = v8;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v9 = (id *)getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v10, "MPModelPropertySocialPersonHasLightweightProfile");
    getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr = v26[3];
    id v9 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v9) {
    goto LABEL_22;
  }
  id v11 = *v9;
  v29[2] = v11;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v12 = (id *)getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr)
  {
    id v13 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v13, "MPModelPropertySocialPersonIsPrivate");
    getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr = v26[3];
    uint64_t v12 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v12) {
    goto LABEL_22;
  }
  id v14 = *v12;
  v29[3] = v14;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v15 = (id *)getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr)
  {
    uint64_t v16 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v16, "MPModelPropertySocialPersonIsVerified");
    getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr = v26[3];
    uint64_t v15 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v15) {
    goto LABEL_22;
  }
  id v17 = *v15;
  v29[4] = v17;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v18 = (id *)getMPModelPropertySocialPersonNameSymbolLoc_ptr;
  uint64_t v28 = getMPModelPropertySocialPersonNameSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonNameSymbolLoc_ptr)
  {
    uint64_t v19 = (void *)MediaPlayerLibrary_6();
    v26[3] = (uint64_t)dlsym(v19, "MPModelPropertySocialPersonName");
    getMPModelPropertySocialPersonNameSymbolLoc_ptr = v26[3];
    uint64_t v18 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v18)
  {
LABEL_22:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v30 = *v18;
  uint64_t v20 = (void *)MEMORY[0x263EFF8C0];
  id v21 = v30;
  id v22 = [v20 arrayWithObjects:v29 count:6];

  id v23 = (void *)[v2 initWithProperties:v22 relationships:MEMORY[0x263EFFA78]];

  return v23;
}

+ (id)_tvShowSupportedProperties
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  id v3 = getMPModelPropertyTVShowTitle();
  v18[0] = v3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v4 = (id *)getMPModelPropertyTVShowArtworkSymbolLoc_ptr;
  uint64_t v17 = getMPModelPropertyTVShowArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyTVShowArtworkSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlayerLibrary_6();
    v15[3] = (uint64_t)dlsym(v5, "MPModelPropertyTVShowArtwork");
    getMPModelPropertyTVShowArtworkSymbolLoc_ptr = v15[3];
    uint64_t v4 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v4) {
    goto LABEL_10;
  }
  id v6 = *v4;
  v18[1] = v6;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v7 = (id *)getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr;
  uint64_t v17 = getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr;
  if (!getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr)
  {
    id v8 = (void *)MediaPlayerLibrary_6();
    v15[3] = (uint64_t)dlsym(v8, "MPModelPropertyTVShowEpisodeCount");
    getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr = v15[3];
    id v7 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v7)
  {
LABEL_10:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v19 = *v7;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = v19;
  id v11 = [v9 arrayWithObjects:v18 count:3];

  uint64_t v12 = (void *)[v2 initWithProperties:v11 relationships:MEMORY[0x263EFFA78]];

  return v12;
}

@end
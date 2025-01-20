@interface MusicKit_SoftLinking_MPModelKind
+ (BOOL)shouldShowAllExtendedVideoContent;
+ (id)_curatorKindForVariants:(unint64_t)a3;
+ (id)_defaultAlbumKind;
+ (id)_defaultAlbumKindForTracks;
+ (id)_defaultArtistKind;
+ (id)_defaultComposerKind;
+ (id)_defaultCreditArtistKind;
+ (id)_defaultCuratorKind;
+ (id)_defaultFileAssetKind;
+ (id)_defaultGenreKind;
+ (id)_defaultLyricsKind;
+ (id)_defaultMovieKind;
+ (id)_defaultPlaylistAuthorKind;
+ (id)_defaultPlaylistEntryKind;
+ (id)_defaultPlaylistEntryKindForMusicVideos;
+ (id)_defaultPlaylistEntryKindForSongs;
+ (id)_defaultPlaylistEntryKindForTracks;
+ (id)_defaultPlaylistEntryReactionKind;
+ (id)_defaultPlaylistFolderItemKind;
+ (id)_defaultPlaylistFolderKind;
+ (id)_defaultPlaylistKind;
+ (id)_defaultPlaylistKindExcludingEmpty;
+ (id)_defaultRadioStationKind;
+ (id)_defaultRecentlyAddedObjectKind;
+ (id)_defaultRecordLabelKind;
+ (id)_defaultSocialPersonKind;
+ (id)_defaultSongKind;
+ (id)_defaultSongKindForAudioOnly;
+ (id)_defaultSongKindForTracks;
+ (id)_defaultTVEpisodeKind;
+ (id)_defaultTVSeasonKind;
+ (id)_defaultTVShowKind;
+ (id)_modelKindForModelObjectType:(int64_t)a3;
+ (id)_sanitizeKind:(id)a3;
+ (id)_sanitizePlaylistEntryKind:(id)a3;
+ (id)_sanitizeSongKind:(id)a3;
+ (id)_songKindForVariants:(unint64_t)a3;
+ (id)_songKindForVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (id)playlistEntryKindWithKinds:(id)a3;
- (MPModelKind)_underlyingKind;
- (id)_initWithUnderlyingKind:(id)a3;
- (int64_t)modelObjectType;
@end

@implementation MusicKit_SoftLinking_MPModelKind

- (id)_initWithUnderlyingKind:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelKind;
  v6 = [(MusicKit_SoftLinking_MPModelKind *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingKind, a3);
  }

  return v7;
}

+ (id)_modelKindForModelObjectType:(int64_t)a3
{
  v4 = 0;
  switch(a3)
  {
    case 0:
      v4 = [a1 _defaultAlbumKind];
      break;
    case 1:
      id v5 = a1;
      uint64_t v6 = 1;
      goto LABEL_22;
    case 2:
      v4 = [a1 _defaultArtistKind];
      break;
    case 3:
      v4 = [a1 _defaultComposerKind];
      break;
    case 4:
      v4 = [a1 _defaultCreditArtistKind];
      break;
    case 5:
      id v5 = a1;
      uint64_t v6 = 8;
      goto LABEL_22;
    case 6:
      id v5 = a1;
      uint64_t v6 = 2;
      goto LABEL_22;
    case 7:
      id v5 = a1;
      uint64_t v6 = 32;
      goto LABEL_22;
    case 8:
      v4 = [a1 _defaultFileAssetKind];
      break;
    case 9:
      v4 = [a1 _defaultGenreKind];
      break;
    case 12:
      v4 = [a1 _defaultLyricsKind];
      break;
    case 13:
      v4 = [a1 _defaultMovieKind];
      break;
    case 14:
      id v7 = a1;
      uint64_t v8 = 2;
      goto LABEL_34;
    case 15:
      v4 = [a1 _defaultPlaylistKind];
      break;
    case 16:
      v4 = [a1 _defaultPlaylistAuthorKind];
      break;
    case 17:
      v4 = [a1 _defaultPlaylistEntryKind];
      break;
    case 18:
      v4 = [a1 _defaultPlaylistEntryReactionKind];
      break;
    case 19:
      v4 = [a1 _defaultPlaylistFolderKind];
      break;
    case 20:
      v4 = [a1 _defaultPlaylistFolderItemKind];
      break;
    case 22:
      id v5 = a1;
      uint64_t v6 = 4;
LABEL_22:
      v4 = [v5 _curatorKindForVariants:v6];
      break;
    case 23:
      v4 = [a1 _defaultRecentlyAddedObjectKind];
      break;
    case 24:
      v4 = [a1 _defaultRecordLabelKind];
      break;
    case 25:
      v4 = [a1 _defaultSocialPersonKind];
      break;
    case 26:
      id v7 = a1;
      uint64_t v8 = 1;
      goto LABEL_34;
    case 27:
      v4 = [a1 _defaultRadioStationKind];
      break;
    case 30:
      id v7 = a1;
      uint64_t v8 = 3;
      goto LABEL_34;
    case 31:
      v4 = [a1 _defaultTVEpisodeKind];
      break;
    case 32:
      v4 = [a1 _defaultTVSeasonKind];
      break;
    case 33:
      v4 = [a1 _defaultTVShowKind];
      break;
    case 34:
      id v7 = a1;
      uint64_t v8 = 4;
      goto LABEL_34;
    case 35:
      id v7 = a1;
      uint64_t v8 = 6;
LABEL_34:
      v4 = [v7 _songKindForVariants:v8];
      break;
    default:
      break;
  }

  return v4;
}

+ (id)_defaultPlaylistKind
{
  id MPModelPlaylistClass = getMPModelPlaylistClass();
  v4 = [a1 _defaultPlaylistEntryKind];
  id v5 = [MPModelPlaylistClass kindWithVariants:215 playlistEntryKind:v4 options:0];

  return v5;
}

+ (id)_defaultPlaylistEntryKind
{
  v10[3] = *MEMORY[0x263EF8340];
  id MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  v4 = [a1 _defaultSongKind];
  id v5 = objc_msgSend(a1, "_defaultTVEpisodeKind", v4);
  v10[1] = v5;
  uint64_t v6 = [a1 _defaultMovieKind];
  v10[2] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
  uint64_t v8 = [MPModelPlaylistEntryClass kindWithKinds:v7];

  return v8;
}

+ (id)_defaultAlbumKind
{
  id MPModelAlbumClass = getMPModelAlbumClass();
  v4 = [a1 _defaultSongKind];
  id v5 = [MPModelAlbumClass kindWithSongKind:v4];

  return v5;
}

+ (id)_songKindForVariants:(unint64_t)a3
{
  id MPModelSongClass = getMPModelSongClass();

  return (id)[MPModelSongClass kindWithVariants:a3];
}

+ (id)_defaultSongKind
{
  return (id)[a1 _songKindForVariants:7];
}

+ (id)_defaultMovieKind
{
  int v2 = [a1 shouldShowAllExtendedVideoContent];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMPModelMovieClass_softClass_0;
  uint64_t v12 = getMPModelMovieClass_softClass_0;
  if (!getMPModelMovieClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMPModelMovieClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelMovieClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  if (v2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = v3;
  _Block_object_dispose(&v9, 8);
  uint64_t v6 = [v5 kindWithVariants:v4];

  return v6;
}

+ (id)_defaultTVEpisodeKind
{
  int v2 = [a1 shouldShowAllExtendedVideoContent];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMPModelTVEpisodeClass_softClass_0;
  uint64_t v12 = getMPModelTVEpisodeClass_softClass_0;
  if (!getMPModelTVEpisodeClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMPModelTVEpisodeClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelTVEpisodeClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  if (v2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = v3;
  _Block_object_dispose(&v9, 8);
  uint64_t v6 = [v5 kindWithVariants:v4];

  return v6;
}

+ (BOOL)shouldShowAllExtendedVideoContent
{
  int v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 valueForKey:@"showAllTVShows"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
}

- (MPModelKind)_underlyingKind
{
  return self->_underlyingKind;
}

- (int64_t)modelObjectType
{
  v3 = [(MPModelKind *)self->_underlyingKind identityKind];
  char v4 = [getMPModelPlaylistKindClass() identityKind];
  int v5 = [v3 isEqual:v4];

  if (!v5) {
    return 15;
  }
  uint64_t v6 = [(MPModelKind *)self->_underlyingKind variants];
  int64_t v7 = 20;
  if ((v6 & 8) == 0) {
    int64_t v7 = 15;
  }
  if (v6 == 8) {
    return 19;
  }
  else {
    return v7;
  }
}

+ (id)_defaultAlbumKindForTracks
{
  id MPModelAlbumClass = getMPModelAlbumClass();
  char v4 = [a1 _defaultSongKindForTracks];
  int v5 = [MPModelAlbumClass kindWithSongKind:v4];

  return v5;
}

+ (id)_defaultArtistKind
{
  id MPModelArtistClass = getMPModelArtistClass();
  char v4 = [a1 _defaultAlbumKind];
  int v5 = [MPModelArtistClass kindWithAlbumKind:v4];

  return v5;
}

+ (id)_defaultComposerKind
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)getMPModelComposerClass_softClass_0;
  uint64_t v14 = getMPModelComposerClass_softClass_0;
  if (!getMPModelComposerClass_softClass_0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getMPModelComposerClass_block_invoke_0;
    v10[3] = &unk_26443F950;
    void v10[4] = &v11;
    __getMPModelComposerClass_block_invoke_0((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v11, 8);
  id MPModelAlbumClass = getMPModelAlbumClass();
  uint64_t v6 = [a1 _defaultSongKind];
  int64_t v7 = [MPModelAlbumClass kindWithVariants:3 songKind:v6 options:0];
  uint64_t v8 = [v4 kindWithAlbumKind:v7];

  return v8;
}

+ (id)_defaultCreditArtistKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelCreditsArtistClass_softClass_0;
  uint64_t v10 = getMPModelCreditsArtistClass_softClass_0;
  if (!getMPModelCreditsArtistClass_softClass_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelCreditsArtistClass_block_invoke_0;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelCreditsArtistClass_block_invoke_0((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultCuratorKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelCuratorActualKindClass_softClass;
  uint64_t v10 = getMPModelCuratorActualKindClass_softClass;
  if (!getMPModelCuratorActualKindClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelCuratorActualKindClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelCuratorActualKindClass_block_invoke((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultFileAssetKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelFileAssetClass_softClass_0;
  uint64_t v10 = getMPModelFileAssetClass_softClass_0;
  if (!getMPModelFileAssetClass_softClass_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelFileAssetClass_block_invoke_0;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelFileAssetClass_block_invoke_0((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultRecentlyAddedObjectKind
{
  v16[4] = *MEMORY[0x263EF8340];
  id MPModelGenericObjectClass_1 = getMPModelGenericObjectClass_1();
  id v4 = getMPModelRelationshipGenericAlbum_0();
  v15[0] = v4;
  int v5 = [a1 _defaultAlbumKindForTracks];
  v16[0] = v5;
  uint64_t v6 = getMPModelRelationshipGenericMovie_0();
  v15[1] = v6;
  uint64_t v7 = [a1 _defaultMovieKind];
  v16[1] = v7;
  uint64_t v8 = getMPModelRelationshipGenericPlaylist_0();
  v15[2] = v8;
  uint64_t v9 = [a1 _defaultPlaylistKind];
  v16[2] = v9;
  uint64_t v10 = getMPModelRelationshipGenericTVSeason_0();
  v15[3] = v10;
  uint64_t v11 = [a1 _defaultTVSeasonKind];
  v16[3] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  uint64_t v13 = [MPModelGenericObjectClass_1 kindWithRelationshipKinds:v12];

  return v13;
}

+ (id)_defaultGenreKind
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v3 = (void *)getMPModelGenreClass_softClass_0;
  uint64_t v12 = getMPModelGenreClass_softClass_0;
  if (!getMPModelGenreClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMPModelGenreClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelGenreClass_block_invoke_0((uint64_t)v8);
    id v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  int v5 = [a1 _defaultAlbumKind];
  uint64_t v6 = [v4 kindWithAlbumKind:v5];

  return v6;
}

+ (id)_defaultLyricsKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelLyricsClass_softClass_0;
  uint64_t v10 = getMPModelLyricsClass_softClass_0;
  if (!getMPModelLyricsClass_softClass_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelLyricsClass_block_invoke_0;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelLyricsClass_block_invoke_0((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultPlaylistKindExcludingEmpty
{
  id MPModelPlaylistClass = getMPModelPlaylistClass();
  id v4 = [a1 _defaultPlaylistEntryKind];
  int v5 = [MPModelPlaylistClass kindWithVariants:215 playlistEntryKind:v4 options:4];

  return v5;
}

+ (id)_defaultPlaylistAuthorKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelPlaylistAuthorKindClass_softClass;
  uint64_t v10 = getMPModelPlaylistAuthorKindClass_softClass;
  if (!getMPModelPlaylistAuthorKindClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelPlaylistAuthorKindClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelPlaylistAuthorKindClass_block_invoke((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultPlaylistEntryReactionKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelPlaylistEntryReactionKindClass_softClass;
  uint64_t v10 = getMPModelPlaylistEntryReactionKindClass_softClass;
  if (!getMPModelPlaylistEntryReactionKindClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelPlaylistEntryReactionKindClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelPlaylistEntryReactionKindClass_block_invoke((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultPlaylistEntryKindForTracks
{
  v8[1] = *MEMORY[0x263EF8340];
  id MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  id v4 = [a1 _defaultSongKindForTracks];
  v8[0] = v4;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = [MPModelPlaylistEntryClass kindWithKinds:v5];

  return v6;
}

+ (id)_defaultPlaylistEntryKindForSongs
{
  v8[1] = *MEMORY[0x263EF8340];
  id MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  id v4 = [a1 _songKindForVariants:1];
  v8[0] = v4;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = [MPModelPlaylistEntryClass kindWithKinds:v5];

  return v6;
}

+ (id)_defaultPlaylistEntryKindForMusicVideos
{
  v8[1] = *MEMORY[0x263EF8340];
  id MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  id v4 = [a1 _songKindForVariants:2];
  v8[0] = v4;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = [MPModelPlaylistEntryClass kindWithKinds:v5];

  return v6;
}

+ (id)_defaultPlaylistFolderKind
{
  id MPModelPlaylistClass = getMPModelPlaylistClass();
  id v4 = [a1 _defaultPlaylistEntryKind];
  int v5 = [MPModelPlaylistClass kindWithVariants:8 playlistEntryKind:v4 options:0];

  return v5;
}

+ (id)_defaultPlaylistFolderItemKind
{
  id MPModelPlaylistClass = getMPModelPlaylistClass();
  id v4 = [a1 _defaultPlaylistEntryKind];
  int v5 = [MPModelPlaylistClass kindWithVariants:95 playlistEntryKind:v4 options:0];

  return v5;
}

+ (id)_defaultRadioStationKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelRadioStationKindClass_softClass_0;
  uint64_t v10 = getMPModelRadioStationKindClass_softClass_0;
  if (!getMPModelRadioStationKindClass_softClass_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelRadioStationKindClass_block_invoke_0;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelRadioStationKindClass_block_invoke_0((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultRecordLabelKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelRecordLabelKindClass_softClass;
  uint64_t v10 = getMPModelRecordLabelKindClass_softClass;
  if (!getMPModelRecordLabelKindClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelRecordLabelKindClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelRecordLabelKindClass_block_invoke((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 identityKind];

  return v4;
}

+ (id)_defaultSocialPersonKind
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  int v2 = (void *)getMPModelSocialPersonClass_softClass_0;
  uint64_t v10 = getMPModelSocialPersonClass_softClass_0;
  if (!getMPModelSocialPersonClass_softClass_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPModelSocialPersonClass_block_invoke_0;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPModelSocialPersonClass_block_invoke_0((uint64_t)v6);
    int v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 kind];

  return v4;
}

+ (id)_defaultSongKindForAudioOnly
{
  return (id)[a1 _songKindForVariants:1];
}

+ (id)_defaultSongKindForTracks
{
  return (id)[a1 _songKindForVariants:3];
}

+ (id)_defaultTVSeasonKind
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v3 = (void *)getMPModelTVSeasonClass_softClass_0;
  uint64_t v12 = getMPModelTVSeasonClass_softClass_0;
  if (!getMPModelTVSeasonClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __getMPModelTVSeasonClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelTVSeasonClass_block_invoke_0((uint64_t)v8);
    id v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  int v5 = [a1 _defaultTVEpisodeKind];
  uint64_t v6 = [v4 kindWithEpisodeKind:v5];

  return v6;
}

+ (id)_defaultTVShowKind
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v3 = (void *)getMPModelTVShowClass_softClass_0;
  uint64_t v12 = getMPModelTVShowClass_softClass_0;
  if (!getMPModelTVShowClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __getMPModelTVShowClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelTVShowClass_block_invoke_0((uint64_t)v8);
    id v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  int v5 = [a1 _defaultTVSeasonKind];
  uint64_t v6 = [v4 kindWithSeasonKind:v5];

  return v6;
}

+ (id)playlistEntryKindWithKinds:(id)a3
{
  id v3 = a3;
  id v4 = [getMPModelPlaylistEntryClass() kindWithKinds:v3];

  return v4;
}

+ (id)_curatorKindForVariants:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getMPModelCuratorClass_softClass_0;
  uint64_t v12 = getMPModelCuratorClass_softClass_0;
  if (!getMPModelCuratorClass_softClass_0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __getMPModelCuratorClass_block_invoke_0;
    v8[3] = &unk_26443F950;
    v8[4] = &v9;
    __getMPModelCuratorClass_block_invoke_0((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  uint64_t v6 = [v5 kindWithVariants:a3];

  return v6;
}

+ (id)_songKindForVariants:(unint64_t)a3 options:(unint64_t)a4
{
  id MPModelSongClass = getMPModelSongClass();

  return (id)[MPModelSongClass kindWithVariants:a3 options:a4];
}

+ (id)_sanitizeKind:(id)a3
{
  id v3 = a3;
  if (_sanitizeKind__sOnceToken != -1) {
    dispatch_once(&_sanitizeKind__sOnceToken, &__block_literal_global_9);
  }
  id v4 = v3;
  id v5 = v4;
  uint64_t v6 = v4;
  if (_sanitizeKind__isNanoMusicProcess)
  {
    uint64_t v7 = [v4 identityKind];
    uint64_t v8 = [getMPModelSongKindClass() identityKind];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = +[MusicKit_SoftLinking_MPModelKind _sanitizeSongKind:v5];
LABEL_6:
      uint64_t v6 = (void *)v10;
LABEL_7:

LABEL_13:
      goto LABEL_14;
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    uint64_t v11 = (void *)getMPModelAlbumKindClass_softClass_0;
    uint64_t v47 = getMPModelAlbumKindClass_softClass_0;
    if (!getMPModelAlbumKindClass_softClass_0)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      v41 = __getMPModelAlbumKindClass_block_invoke_0;
      v42 = &unk_26443F950;
      v43 = &v44;
      __getMPModelAlbumKindClass_block_invoke_0((uint64_t)&v39);
      uint64_t v11 = (void *)v45[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v44, 8);
    uint64_t v13 = [v12 identityKind];
    int v14 = [v7 isEqual:v13];

    if (v14)
    {
      id v15 = v5;
      v16 = [v15 songKind];
      v17 = +[MusicKit_SoftLinking_MPModelKind _sanitizeSongKind:v16];

      id MPModelAlbumClass = getMPModelAlbumClass();
      uint64_t v19 = [v15 variants];
      uint64_t v20 = [v15 options];

      uint64_t v21 = [MPModelAlbumClass kindWithVariants:v19 songKind:v17 options:v20];
    }
    else
    {
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2050000000;
      v23 = (void *)getMPModelPlaylistEntryKindClass_softClass;
      uint64_t v47 = getMPModelPlaylistEntryKindClass_softClass;
      if (!getMPModelPlaylistEntryKindClass_softClass)
      {
        uint64_t v39 = MEMORY[0x263EF8330];
        uint64_t v40 = 3221225472;
        v41 = __getMPModelPlaylistEntryKindClass_block_invoke;
        v42 = &unk_26443F950;
        v43 = &v44;
        __getMPModelPlaylistEntryKindClass_block_invoke((uint64_t)&v39);
        v23 = (void *)v45[3];
      }
      id v24 = v23;
      _Block_object_dispose(&v44, 8);
      v25 = [v24 identityKind];
      int v26 = [v7 isEqual:v25];

      if (v26)
      {
        uint64_t v10 = +[MusicKit_SoftLinking_MPModelKind _sanitizePlaylistEntryKind:v5];
        goto LABEL_6;
      }
      v27 = [getMPModelPlaylistKindClass() identityKind];
      int v28 = [v7 isEqual:v27];

      if (!v28)
      {
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2050000000;
        v33 = (void *)getMPModelGenericObjectKindClass_softClass;
        uint64_t v47 = getMPModelGenericObjectKindClass_softClass;
        if (!getMPModelGenericObjectKindClass_softClass)
        {
          uint64_t v39 = MEMORY[0x263EF8330];
          uint64_t v40 = 3221225472;
          v41 = __getMPModelGenericObjectKindClass_block_invoke;
          v42 = &unk_26443F950;
          v43 = &v44;
          __getMPModelGenericObjectKindClass_block_invoke((uint64_t)&v39);
          v33 = (void *)v45[3];
        }
        id v34 = v33;
        _Block_object_dispose(&v44, 8);
        v35 = [v34 identityKind];
        int v36 = [v7 isEqual:v35];

        uint64_t v6 = v5;
        if (!v36) {
          goto LABEL_13;
        }
        v37 = [v5 relationshipKinds];
        v38 = objc_msgSend(v37, "msv_mapKeysAndValues:", &__block_literal_global_11);

        uint64_t v6 = [getMPModelGenericObjectClass_1() kindWithRelationshipKinds:v38];

        goto LABEL_7;
      }
      id v15 = v5;
      v29 = [v15 playlistEntryKind];
      v17 = +[MusicKit_SoftLinking_MPModelKind _sanitizePlaylistEntryKind:v29];

      id MPModelPlaylistClass = getMPModelPlaylistClass();
      uint64_t v31 = [v15 variants];
      uint64_t v32 = [v15 options];

      uint64_t v21 = [MPModelPlaylistClass kindWithVariants:v31 playlistEntryKind:v17 options:v32];
    }
    uint64_t v6 = (void *)v21;

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

+ (id)_sanitizeSongKind:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 variants] & 0xFFFFFFFFFFFFFFFDLL;
  id MPModelSongClass = getMPModelSongClass();
  uint64_t v6 = [v3 options];

  return (id)[MPModelSongClass kindWithVariants:v4 options:v6];
}

+ (id)_sanitizePlaylistEntryKind:(id)a3
{
  id v3 = [a3 kinds];
  unint64_t v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_14);

  id v5 = [getMPModelPlaylistEntryClass() kindWithKinds:v4];

  return v5;
}

@end
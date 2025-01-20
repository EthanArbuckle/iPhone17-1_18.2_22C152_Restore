@interface MusicKit_SoftLinking_MPModelRecentlyAddedKind
- (BOOL)includeOnlyDownloadedContent;
- (MusicKit_SoftLinking_MPModelRecentlyAddedKind)initWithIncludeOnlyDownloadedContent:(BOOL)a3;
@end

@implementation MusicKit_SoftLinking_MPModelRecentlyAddedKind

- (MusicKit_SoftLinking_MPModelRecentlyAddedKind)initWithIncludeOnlyDownloadedContent:(BOOL)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  id MPModelGenericObjectClass_1 = getMPModelGenericObjectClass_1();
  v4 = getMPModelRelationshipGenericAlbum_0();
  v20[0] = v4;
  v5 = +[MusicKit_SoftLinking_MPModelKind _defaultAlbumKind];
  v21[0] = v5;
  v6 = getMPModelRelationshipGenericMovie_0();
  v20[1] = v6;
  v7 = +[MusicKit_SoftLinking_MPModelKind _defaultMovieKind];
  v21[1] = v7;
  v8 = getMPModelRelationshipGenericPlaylist_0();
  v20[2] = v8;
  v9 = +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistKindExcludingEmpty];
  v21[2] = v9;
  v10 = getMPModelRelationshipGenericTVSeason_0();
  v20[3] = v10;
  v11 = +[MusicKit_SoftLinking_MPModelKind _defaultTVSeasonKind];
  v21[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  v13 = [MPModelGenericObjectClass_1 kindWithRelationshipKinds:v12];

  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPModelRecentlyAddedKind;
  v14 = [(MusicKit_SoftLinking_MPModelKind *)&v19 _initWithUnderlyingKind:v13];
  v15 = v14;
  if (v14) {
    v14->_includeOnlyDownloadedContent = a3;
  }

  return v15;
}

- (BOOL)includeOnlyDownloadedContent
{
  return self->_includeOnlyDownloadedContent;
}

@end
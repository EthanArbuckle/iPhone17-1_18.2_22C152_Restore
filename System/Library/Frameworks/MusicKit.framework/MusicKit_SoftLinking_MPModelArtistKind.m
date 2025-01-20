@interface MusicKit_SoftLinking_MPModelArtistKind
- (MusicKit_SoftLinking_MPModelAlbumKind)albumKind;
- (MusicKit_SoftLinking_MPModelArtistKind)init;
- (MusicKit_SoftLinking_MPModelArtistKind)initWithAlbumKind:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelArtistKind

- (MusicKit_SoftLinking_MPModelArtistKind)init
{
  v3 = +[MusicKit_SoftLinking_MPModelKind _defaultArtistKind];
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelArtistKind;
  v4 = [(MusicKit_SoftLinking_MPModelKind *)&v6 _initWithUnderlyingKind:v3];

  return v4;
}

- (MusicKit_SoftLinking_MPModelArtistKind)initWithAlbumKind:(id)a3
{
  id v4 = a3;
  id MPModelArtistClass = getMPModelArtistClass();
  objc_super v6 = [v4 _underlyingKind];

  v7 = [MPModelArtistClass kindWithAlbumKind:v6];

  v10.receiver = self;
  v10.super_class = (Class)MusicKit_SoftLinking_MPModelArtistKind;
  v8 = [(MusicKit_SoftLinking_MPModelKind *)&v10 _initWithUnderlyingKind:v7];

  return v8;
}

- (MusicKit_SoftLinking_MPModelAlbumKind)albumKind
{
  return self->_albumKind;
}

- (void).cxx_destruct
{
}

@end
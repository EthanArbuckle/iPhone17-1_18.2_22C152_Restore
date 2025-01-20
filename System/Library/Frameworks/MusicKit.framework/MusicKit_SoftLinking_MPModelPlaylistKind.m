@interface MusicKit_SoftLinking_MPModelPlaylistKind
- (MusicKit_SoftLinking_MPModelPlaylistKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4;
- (unint64_t)_underlyingOptionsFromOptions:(unint64_t)a3;
- (unint64_t)_underlyingVariantsFromVariants:(unint64_t)a3;
- (unint64_t)options;
- (unint64_t)variants;
@end

@implementation MusicKit_SoftLinking_MPModelPlaylistKind

- (MusicKit_SoftLinking_MPModelPlaylistKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v7 = -[MusicKit_SoftLinking_MPModelPlaylistKind _underlyingVariantsFromVariants:](self, "_underlyingVariantsFromVariants:");
  unint64_t v8 = [(MusicKit_SoftLinking_MPModelPlaylistKind *)self _underlyingOptionsFromOptions:a4];
  id MPModelPlaylistClass = getMPModelPlaylistClass();
  v10 = +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForTracks];
  v11 = [MPModelPlaylistClass kindWithVariants:v7 playlistEntryKind:v10 options:v8];

  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPModelPlaylistKind;
  v12 = [(MusicKit_SoftLinking_MPModelKind *)&v15 _initWithUnderlyingKind:v11];
  v13 = v12;
  if (v12)
  {
    v12->_options = a4;
    v12->_variants = a3;
  }

  return v13;
}

- (unint64_t)_underlyingVariantsFromVariants:(unint64_t)a3
{
  return a3;
}

- (unint64_t)_underlyingOptionsFromOptions:(unint64_t)a3
{
  return a3 & 7;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (unint64_t)options
{
  return self->_options;
}

@end
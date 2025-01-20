@interface MusicKit_SoftLinking_MPModelAlbumKind
- (MusicKit_SoftLinking_MPModelAlbumKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4;
- (unint64_t)_underlyingOptionsFromOptions:(unint64_t)a3;
- (unint64_t)_underlyingVariantsFromVariants:(unint64_t)a3;
- (unint64_t)options;
- (unint64_t)variants;
@end

@implementation MusicKit_SoftLinking_MPModelAlbumKind

- (MusicKit_SoftLinking_MPModelAlbumKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v7 = -[MusicKit_SoftLinking_MPModelAlbumKind _underlyingVariantsFromVariants:](self, "_underlyingVariantsFromVariants:");
  unint64_t v8 = [(MusicKit_SoftLinking_MPModelAlbumKind *)self _underlyingOptionsFromOptions:a4];
  v9 = objc_opt_class();
  if ((a4 & 2) != 0) {
    [v9 _defaultSongKind];
  }
  else {
  v10 = [v9 _defaultSongKindForAudioOnly];
  }
  v11 = [getMPModelAlbumClass() kindWithVariants:v7 songKind:v10 options:v8];
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPModelAlbumKind;
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
  return a3 & 3;
}

- (unint64_t)_underlyingOptionsFromOptions:(unint64_t)a3
{
  return a3 & 1;
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
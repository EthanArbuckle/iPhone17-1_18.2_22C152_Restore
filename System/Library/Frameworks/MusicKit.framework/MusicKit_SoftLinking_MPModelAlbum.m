@interface MusicKit_SoftLinking_MPModelAlbum
+ (id)trackPopularityForIdentifiers:(id)a3 underlyingModelAlbum:(id)a4 tracksPopularityBlock:(id)a5;
@end

@implementation MusicKit_SoftLinking_MPModelAlbum

+ (id)trackPopularityForIdentifiers:(id)a3 underlyingModelAlbum:(id)a4 tracksPopularityBlock:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void (**)(void *, id, id))_Block_copy(a5);
  v10 = v9[2](v9, v7, v8);

  return v10;
}

@end
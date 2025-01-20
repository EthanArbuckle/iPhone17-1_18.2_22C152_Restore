@interface MKArtworkDataSourceCache
+ (MKArtworkDataSourceCache)sharedInstance;
- (MKArtworkDataSourceCache)initWithArtworkManager:(id)a3;
- (MKTransitArtworkManager)artworkManager;
- (id)_lookupArtworkInCacheWithKey:(id)a3;
- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7;
- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8;
- (id)imageForSizedArtwork:(id)a3 scale:(double)a4 nightMode:(BOOL)a5;
- (void)_setArtworkImageInCache:(id)a3 forKey:(id)a4;
- (void)purge;
@end

@implementation MKArtworkDataSourceCache

+ (MKArtworkDataSourceCache)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MKArtworkDataSourceCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315D60 != -1) {
    dispatch_once(&qword_1EB315D60, block);
  }
  v2 = (void *)_MergedGlobals_140;

  return (MKArtworkDataSourceCache *)v2;
}

void __42__MKArtworkDataSourceCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[MKTransitArtworkManager sharedInstance];
  uint64_t v2 = [v1 initWithArtworkManager:v4];
  v3 = (void *)_MergedGlobals_140;
  _MergedGlobals_140 = v2;
}

- (MKArtworkDataSourceCache)initWithArtworkManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKArtworkDataSourceCache;
  v6 = [(MKArtworkDataSourceCache *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_artworkManager, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    artworkImageCache = v7->_artworkImageCache;
    v7->_artworkImageCache = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__shieldPackDidUpdate name:*MEMORY[0x1E4F64258] object:0];
  }
  return v7;
}

- (void)purge
{
  v3 = [(MKArtworkDataSourceCache *)self artworkManager];
  [v3 purge];

  artworkImageCache = self->_artworkImageCache;

  [(NSCache *)artworkImageCache removeAllObjects];
}

- (id)imageForSizedArtwork:(id)a3 scale:(double)a4 nightMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [v8 artwork];
  v10 = -[MKArtworkDataSourceCache imageForArtwork:size:featureType:scale:nightMode:](self, "imageForArtwork:size:featureType:scale:nightMode:", v9, [v8 shieldSize], 2, v5, a4);

  if (!v10)
  {
    uint64_t v11 = [v8 fallbackShieldSize];
    if (v11 == [v8 shieldSize])
    {
      v10 = 0;
    }
    else
    {
      objc_super v12 = [v8 artwork];
      v10 = -[MKArtworkDataSourceCache imageForArtwork:size:featureType:scale:nightMode:](self, "imageForArtwork:size:featureType:scale:nightMode:", v12, [v8 fallbackShieldSize], 2, v5, a4);
    }
  }

  return v10;
}

- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  return [(MKArtworkDataSourceCache *)self imageForArtwork:a3 size:a4 featureType:a5 scale:a7 nightMode:a6 widthPaddingMultiple:1.0];
}

- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v15 = [v14 shieldDataSource];
  unsigned int ShouldBeFlipped = ImageForShieldDataSourceTypeShouldBeFlipped([v15 shieldType]);

  v17 = MKKeyForTransitArtwork(v14, a4, a5, ShouldBeFlipped, v9, a8, a6);
  v18 = [(MKArtworkDataSourceCache *)self _lookupArtworkInCacheWithKey:v17];
  if (!v18)
  {
    v19 = [(MKArtworkDataSourceCache *)self artworkManager];
    v18 = [v19 transitArtworkImageWithDataSource:v14 size:a4 featureType:a5 scale:v9 nightMode:a6 withWidthPaddingMultiple:a8];

    if (ShouldBeFlipped)
    {
      uint64_t v20 = [v18 imageFlippedForRightToLeftLayoutDirection];

      v18 = (void *)v20;
    }
    if (v18) {
      [(MKArtworkDataSourceCache *)self _setArtworkImageInCache:v18 forKey:v17];
    }
  }

  return v18;
}

- (id)_lookupArtworkInCacheWithKey:(id)a3
{
  return [(NSCache *)self->_artworkImageCache objectForKey:a3];
}

- (void)_setArtworkImageInCache:(id)a3 forKey:(id)a4
{
}

- (MKTransitArtworkManager)artworkManager
{
  return self->_artworkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkManager, 0);

  objc_storeStrong((id *)&self->_artworkImageCache, 0);
}

@end
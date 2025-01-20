@interface ALAssetsFilter
+ (ALAssetsFilter)allAssets;
+ (ALAssetsFilter)allPhotos;
+ (ALAssetsFilter)allVideos;
- (ALAssetsFilter)init;
- (ALAssetsFilterInternal)internal;
- (int)_filter;
- (void)_setFilter:(int)a3;
- (void)dealloc;
- (void)setInternal:(id)a3;
@end

@implementation ALAssetsFilter

- (void)setInternal:(id)a3
{
}

- (ALAssetsFilterInternal)internal
{
  return (ALAssetsFilterInternal *)self->_internal;
}

- (void)_setFilter:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ALAssetsFilter *)self internal];

  [(ALAssetsFilterInternal *)v4 setFilter:v3];
}

- (int)_filter
{
  v2 = [(ALAssetsFilter *)self internal];

  return [(ALAssetsFilterInternal *)v2 filter];
}

- (void)dealloc
{
  [(ALAssetsFilter *)self setInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsFilter;
  [(ALAssetsFilter *)&v3 dealloc];
}

- (ALAssetsFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)ALAssetsFilter;
  v2 = [(ALAssetsFilter *)&v5 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(ALAssetsFilterInternal);
    [(ALAssetsFilter *)v2 setInternal:v3];
  }
  return v2;
}

+ (ALAssetsFilter)allAssets
{
  v2 = objc_alloc_init(ALAssetsFilter);
  [(ALAssetsFilter *)v2 _setFilter:0];
  return v2;
}

+ (ALAssetsFilter)allVideos
{
  v2 = objc_alloc_init(ALAssetsFilter);
  [(ALAssetsFilter *)v2 _setFilter:2];
  return v2;
}

+ (ALAssetsFilter)allPhotos
{
  v2 = objc_alloc_init(ALAssetsFilter);
  [(ALAssetsFilter *)v2 _setFilter:1];
  return v2;
}

@end
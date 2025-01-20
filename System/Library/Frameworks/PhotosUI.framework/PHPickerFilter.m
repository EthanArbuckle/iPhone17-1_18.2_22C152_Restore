@interface PHPickerFilter
+ (PHPickerFilter)_stickersFilter;
+ (PHPickerFilter)_styleabilityFilter;
+ (PHPickerFilter)allFilterMatchingSubfilters:(NSArray *)subfilters;
+ (PHPickerFilter)anyFilterMatchingSubfilters:(NSArray *)subfilters;
+ (PHPickerFilter)burstsFilter;
+ (PHPickerFilter)cinematicVideosFilter;
+ (PHPickerFilter)depthEffectPhotosFilter;
+ (PHPickerFilter)imagesFilter;
+ (PHPickerFilter)livePhotosFilter;
+ (PHPickerFilter)notFilterOfSubfilter:(PHPickerFilter *)subfilter;
+ (PHPickerFilter)panoramasFilter;
+ (PHPickerFilter)playbackStyleFilter:(PHAssetPlaybackStyle)playbackStyle;
+ (PHPickerFilter)screenRecordingsFilter;
+ (PHPickerFilter)screenshotsFilter;
+ (PHPickerFilter)slomoVideosFilter;
+ (PHPickerFilter)spatialMediaFilter;
+ (PHPickerFilter)timelapseVideosFilter;
+ (PHPickerFilter)videosFilter;
+ (id)_itemIdentifiersFilter:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PHPickerFilter)init;
- (PUPickerFilter)_puPickerFilter;
- (id)_initWithPUPickerFilter:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PHPickerFilter

- (void).cxx_destruct
{
}

- (PUPickerFilter)_puPickerFilter
{
  return self->__puPickerFilter;
}

- (id)_initWithPUPickerFilter:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)PHPickerFilter;
    v7 = [(PHPickerFilter *)&v13 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->__puPickerFilter, a3);
    }

    return v8;
  }
  else
  {
    v10 = (PHPickerFilter *)_PFAssertFailHandler();
    return [(PHPickerFilter *)v10 copyWithZone:v12];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [PHPickerFilter alloc];
  v6 = (void *)[(PUPickerFilter *)self->__puPickerFilter copyWithZone:a3];
  id v7 = [(PHPickerFilter *)v5 _initWithPUPickerFilter:v6];

  return v7;
}

- (unint64_t)hash
{
  return [(PUPickerFilter *)self->__puPickerFilter hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHPickerFilter *)a3;
  if (self == v4)
  {
    char v7 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v7 = 0;
    goto LABEL_8;
  }
  id v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      char v7 = [(PUPickerFilter *)self->__puPickerFilter isEqual:v5->__puPickerFilter];

LABEL_8:
      return v7;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  SEL v11 = (PHPickerFilter *)_PFAssertFailHandler();
  return [(PHPickerFilter *)v11 init];
}

- (PHPickerFilter)init
{
  v2 = (void *)_PFAssertFailHandler();
  return (PHPickerFilter *)+[PHPickerFilter _itemIdentifiersFilter:v4];
}

+ (id)_itemIdentifiersFilter:(id)a3
{
  id v3 = a3;
  id v4 = [[PUPickerItemIdentifiersFilter alloc] initWithItemIdentifiers:v3];

  id v5 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v4];

  return v5;
}

+ (PHPickerFilter)_styleabilityFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:4];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)_stickersFilter
{
  v2 = [[PUPickerOtherFilter alloc] initWithFilterType:0];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)notFilterOfSubfilter:(PHPickerFilter *)subfilter
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = subfilter;
  if (!v3) {
    _PFAssertFailHandler();
  }
  id v4 = v3;
  id v5 = [PUPickerCompoundFilter alloc];
  v6 = [(PHPickerFilter *)v4 _puPickerFilter];
  v11[0] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [(PUPickerCompoundFilter *)v5 initWithFilterType:2 subfilters:v7];

  id v9 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v8];

  return (PHPickerFilter *)v9;
}

+ (PHPickerFilter)allFilterMatchingSubfilters:(NSArray *)subfilters
{
  id v3 = subfilters;
  if (!v3)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  id v4 = v3;
  if (![(NSArray *)v3 count])
  {
LABEL_7:
    uint64_t v9 = _PFAssertFailHandler();
    return (PHPickerFilter *)__46__PHPickerFilter_allFilterMatchingSubfilters___block_invoke(v9);
  }
  id v5 = PFMap();
  v6 = [[PUPickerCompoundFilter alloc] initWithFilterType:1 subfilters:v5];
  id v7 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v6];

  return (PHPickerFilter *)v7;
}

uint64_t __46__PHPickerFilter_allFilterMatchingSubfilters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _puPickerFilter];
}

+ (PHPickerFilter)anyFilterMatchingSubfilters:(NSArray *)subfilters
{
  id v3 = subfilters;
  if (!v3)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  id v4 = v3;
  if (![(NSArray *)v3 count])
  {
LABEL_7:
    uint64_t v9 = _PFAssertFailHandler();
    return (PHPickerFilter *)__46__PHPickerFilter_anyFilterMatchingSubfilters___block_invoke(v9);
  }
  id v5 = PFMap();
  v6 = [[PUPickerCompoundFilter alloc] initWithFilterType:0 subfilters:v5];
  id v7 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v6];

  return (PHPickerFilter *)v7;
}

uint64_t __46__PHPickerFilter_anyFilterMatchingSubfilters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _puPickerFilter];
}

+ (PHPickerFilter)playbackStyleFilter:(PHAssetPlaybackStyle)playbackStyle
{
  if (playbackStyle <= 0)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  if ((unint64_t)playbackStyle >= 6)
  {
LABEL_7:
    v6 = (void *)_PFAssertFailHandler();
    return +[PHPickerFilter spatialMediaFilter];
  }
  id v3 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:playbackStyle];
  id v4 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v3];

  return (PHPickerFilter *)v4;
}

+ (PHPickerFilter)spatialMediaFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:10];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)cinematicVideosFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:9];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)timelapseVideosFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:7];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)slomoVideosFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:6];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)screenRecordingsFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:8];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)screenshotsFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:1];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)panoramasFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:0];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)burstsFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:3];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)depthEffectPhotosFilter
{
  v2 = [[PUPickerAssetMediaSubtypeFilter alloc] initWithFilterType:2];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)livePhotosFilter
{
  v2 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:3];
  id v3 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v2];

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)videosFilter
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:4];
  v8[0] = v2;
  id v3 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:5];
  v8[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  id v5 = [[PUPickerCompoundFilter alloc] initWithFilterType:0 subfilters:v4];
  id v6 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v5];

  return (PHPickerFilter *)v6;
}

+ (PHPickerFilter)imagesFilter
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:1];
  id v3 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 2, v2);
  v9[1] = v3;
  id v4 = [[PUPickerAssetPlaybackStyleFilter alloc] initWithPlaybackStyle:3];
  v9[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];

  id v6 = [[PUPickerCompoundFilter alloc] initWithFilterType:0 subfilters:v5];
  id v7 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v6];

  return (PHPickerFilter *)v7;
}

@end
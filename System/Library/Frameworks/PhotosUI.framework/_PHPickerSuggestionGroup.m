@interface _PHPickerSuggestionGroup
+ (BOOL)supportsSecureCoding;
+ (_PHPickerSuggestionGroup)deviceOwnerSuggestionGroup;
+ (_PHPickerSuggestionGroup)generativeSuggestionGroup;
+ (_PHPickerSuggestionGroup)livePhotoWallpaperSuggestionGroup;
+ (_PHPickerSuggestionGroup)portraitWallpaperSuggestionGroup;
+ (_PHPickerSuggestionGroup)retailExperienceSuggestionGroup;
+ (_PHPickerSuggestionGroup)shuffleWallpaperSuggestionGroup;
+ (_PHPickerSuggestionGroup)stickersSuggestionGroup;
+ (_PHPickerSuggestionGroup)styleabilitySuggestionGroup;
+ (_PHPickerSuggestionGroup)wallpaperSuggestionGroup;
+ (_PHPickerSuggestionGroup)watchWallpaperSuggestionGroup;
+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3;
+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3 allowSettlingEffectSuggestions:(BOOL)a4;
+ (id)assetCollectionSuggestionGroup:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForWallpaper;
- (NSArray)suggestions;
- (_PHPickerSuggestionGroup)init;
- (_PHPickerSuggestionGroup)initWithCoder:(id)a3;
- (id)_initWithSuggestions:(id)a3 defaultSuggestionIndex:(int64_t)a4 isForWallpaper:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultSuggestion;
- (int64_t)defaultSuggestionIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PHPickerSuggestionGroup

- (void).cxx_destruct
{
}

- (BOOL)isForWallpaper
{
  return self->_isForWallpaper;
}

- (int64_t)defaultSuggestionIndex
{
  return self->_defaultSuggestionIndex;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (id)defaultSuggestion
{
  unint64_t defaultSuggestionIndex = self->_defaultSuggestionIndex;
  if ((defaultSuggestionIndex & 0x8000000000000000) != 0
    || defaultSuggestionIndex >= [(NSArray *)self->_suggestions count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_suggestions objectAtIndexedSubscript:self->_defaultSuggestionIndex];
  }

  return v4;
}

- (id)_initWithSuggestions:(id)a3 defaultSuggestionIndex:(int64_t)a4 isForWallpaper:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    v9 = v8;
    v17.receiver = self;
    v17.super_class = (Class)_PHPickerSuggestionGroup;
    v10 = [(_PHPickerSuggestionGroup *)&v17 init];
    if (v10)
    {
      uint64_t v11 = [v9 copy];
      suggestions = v10->_suggestions;
      v10->_suggestions = (NSArray *)v11;

      v10->_unint64_t defaultSuggestionIndex = a4;
      v10->_isForWallpaper = a5;
    }

    return v10;
  }
  else
  {
    v14 = (_PHPickerSuggestionGroup *)_PFAssertFailHandler();
    [(_PHPickerSuggestionGroup *)v14 encodeWithCoder:v16];
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  suggestions = self->_suggestions;
  id v5 = a3;
  [v5 encodeObject:suggestions forKey:@"PHPickerSuggestionGroupCoderSuggestionsKey"];
  [v5 encodeInteger:self->_defaultSuggestionIndex forKey:@"PHPickerSuggestionGroupCoderDefaultSuggestionIndexKey"];
  [v5 encodeBool:self->_isForWallpaper forKey:@"PHPickerSuggestionGroupCoderIsForWallpaperKey"];
}

- (_PHPickerSuggestionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[PUPickerSuggestionAvailableClasses all];
  v6 = [v4 decodeArrayOfObjectsOfClasses:v5 forKey:@"PHPickerSuggestionGroupCoderSuggestionsKey"];

  uint64_t v7 = [v4 decodeIntegerForKey:@"PHPickerSuggestionGroupCoderDefaultSuggestionIndexKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"PHPickerSuggestionGroupCoderIsForWallpaperKey"];

  if (v6) {
    self = [(_PHPickerSuggestionGroup *)self _initWithSuggestions:v6 defaultSuggestionIndex:v7 isForWallpaper:v8];
  }

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_PHPickerSuggestionGroup alloc];
  suggestions = self->_suggestions;
  int64_t defaultSuggestionIndex = self->_defaultSuggestionIndex;
  BOOL isForWallpaper = self->_isForWallpaper;

  return [(_PHPickerSuggestionGroup *)v4 _initWithSuggestions:suggestions defaultSuggestionIndex:defaultSuggestionIndex isForWallpaper:isForWallpaper];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_suggestions hash];
  int64_t v4 = self->_defaultSuggestionIndex - v3 + 32 * v3;
  return self->_isForWallpaper - v4 + 32 * v4 + 29791;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (_PHPickerSuggestionGroup *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
LABEL_15:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      suggestions = self->_suggestions;
      uint64_t v8 = v5->_suggestions;
      if (suggestions == v8)
      {
      }
      else
      {
        v9 = v8;
        v10 = suggestions;
        int v11 = [(NSArray *)v10 isEqual:v9];

        if (!v11) {
          goto LABEL_13;
        }
      }
      if (self->_defaultSuggestionIndex == v5->_defaultSuggestionIndex)
      {
        BOOL v12 = self->_isForWallpaper == v5->_isForWallpaper;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    objc_claimAutoreleasedReturnValue();
    SEL v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  id v16 = (_PHPickerSuggestionGroup *)_PFAssertFailHandler();
  return [(_PHPickerSuggestionGroup *)v16 init];
}

- (_PHPickerSuggestionGroup)init
{
  v2 = (void *)_PFAssertFailHandler();
  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:v4 allowSettlingEffectSuggestions:v5];
}

+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3 allowSettlingEffectSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = objc_alloc_init(PUPickerSuggestionAll);
  [v6 addObject:v7];

  uint64_t v8 = [[PUPickerWallpaperSuggestion alloc] initWithMode:0];
  [v6 addObject:v8];

  if (PFPosterEnableSettlingEffect() && v4)
  {
    v9 = objc_alloc_init(PUPickerLivePhotoWithPossibleMotionEffectSuggestion);
    [v6 addObject:v9];
  }
  v10 = [[PUPickerWallpaperSuggestion alloc] initWithMode:1];
  [v6 addObject:v10];

  int v11 = [[PUPickerWallpaperSuggestion alloc] initWithMode:2];
  [v6 addObject:v11];

  BOOL v12 = [[PUPickerWallpaperSuggestion alloc] initWithMode:3];
  [v6 addObject:v12];

  v13 = [[PUPickerWallpaperSuggestion alloc] initWithMode:4];
  [v6 addObject:v13];

  id v14 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v6 defaultSuggestionIndex:a3 isForWallpaper:1];

  return v14;
}

+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3
{
  return +[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:a3 allowSettlingEffectSuggestions:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)assetCollectionSuggestionGroup:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v13[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(PUPickerSuggestionAll);
  v13[0] = v8;
  v9 = [[PUPickerAssetCollectionSuggestion alloc] initWithLocalIdentifier:v7 extendedCuratedAssetsOnly:v6 shouldReverseSortOrder:v5];

  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  id v11 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v10 defaultSuggestionIndex:1 isForWallpaper:0];

  return v11;
}

+ (_PHPickerSuggestionGroup)retailExperienceSuggestionGroup
{
  uint64_t v2 = PLIsFeaturedContentAllowed();
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = objc_alloc_init(PUPickerSuggestionAll);
  [v3 addObject:v4];

  BOOL v5 = objc_alloc_init(PUPickerSpatialSuggestion);
  [v3 addObject:v5];

  BOOL v6 = objc_alloc_init(PUPickerPanoramasSuggestion);
  [v3 addObject:v6];

  id v7 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v3 defaultSuggestionIndex:v2 isForWallpaper:0];

  return (_PHPickerSuggestionGroup *)v7;
}

+ (_PHPickerSuggestionGroup)generativeSuggestionGroup
{
  v13[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = PLIsFeaturedContentAllowed();
  id v3 = objc_alloc_init(PUPickerSuggestionAll);
  BOOL v4 = objc_alloc_init(PUPickerGenerativeFeaturedSuggestion);
  BOOL v5 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 11, v3, v4);
  v13[2] = v5;
  BOOL v6 = [[PUPickerWallpaperSuggestion alloc] initWithMode:12];
  void v13[3] = v6;
  id v7 = [[PUPickerWallpaperSuggestion alloc] initWithMode:13];
  v13[4] = v7;
  uint64_t v8 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:7];
  v13[5] = v8;
  v9 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:8];
  v13[6] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];

  id v11 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v10 defaultSuggestionIndex:v2 isForWallpaper:0];

  return (_PHPickerSuggestionGroup *)v11;
}

+ (_PHPickerSuggestionGroup)styleabilitySuggestionGroup
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(PUPickerSuggestionAll);
  [v2 addObject:v3];

  BOOL v4 = [[PUPickerStyleablePhotoSuggestion alloc] initWithMode:0];
  [v2 addObject:v4];

  BOOL v5 = [[PUPickerStyleablePhotoSuggestion alloc] initWithMode:1];
  [v2 addObject:v5];

  BOOL v6 = [[PUPickerStyleablePhotoSuggestion alloc] initWithMode:2];
  [v2 addObject:v6];

  id v7 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v2 defaultSuggestionIndex:1 isForWallpaper:0];

  return (_PHPickerSuggestionGroup *)v7;
}

+ (_PHPickerSuggestionGroup)watchWallpaperSuggestionGroup
{
  v12[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = PLIsFeaturedContentAllowed();
  id v3 = objc_alloc_init(PUPickerSuggestionAll);
  v12[0] = v3;
  BOOL v4 = [[PUPickerWallpaperSuggestion alloc] initWithMode:6];
  v12[1] = v4;
  BOOL v5 = [[PUPickerWallpaperSuggestion alloc] initWithMode:7];
  v12[2] = v5;
  BOOL v6 = [[PUPickerWallpaperSuggestion alloc] initWithMode:8];
  v12[3] = v6;
  id v7 = [[PUPickerWallpaperSuggestion alloc] initWithMode:9];
  v12[4] = v7;
  uint64_t v8 = [[PUPickerWallpaperSuggestion alloc] initWithMode:10];
  v12[5] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];

  id v10 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v9 defaultSuggestionIndex:v2 isForWallpaper:0];

  return (_PHPickerSuggestionGroup *)v10;
}

+ (_PHPickerSuggestionGroup)stickersSuggestionGroup
{
  v28[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(PUPickerSuggestionAll);
  v28[0] = v3;
  BOOL v4 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:6];
  v28[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  BOOL v6 = (void *)[v2 initWithArray:v5];

  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v8 = [v7 BOOLForKey:@"UseSearchBasedPeopleSuggestionForStickersSuggestionGroup"];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  if (v8) {
    id v10 = off_2642C4BE0;
  }
  else {
    id v10 = &off_2642C4BF0;
  }
  id v11 = (void *)[objc_alloc(*v10) initWithMode:v9];
  [v6 addObject:v11];

  BOOL v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v13 = [v12 BOOLForKey:@"UseWallpaperSuggestionBasedAnimalsSuggestionForStickersSuggestionGroup"];

  if (v13) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v13) {
    SEL v15 = &off_2642C4BF0;
  }
  else {
    SEL v15 = off_2642C4BE0;
  }
  id v16 = (void *)[objc_alloc(*v15) initWithMode:v14];
  [v6 addObject:v16];

  SEL v17 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:0];
  v27[0] = v17;
  v18 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:5];
  v27[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  [v6 addObjectsFromArray:v19];

  v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LODWORD(v18) = [v20 BOOLForKey:@"ShowProductsForStickersSuggestionGroup"];

  if (v18)
  {
    v21 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:3];
    [v6 addObject:v21];
  }
  v22 = [[PUPickerSearchBasedSuggestion alloc] initWithMode:4];
  v26 = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v6 addObjectsFromArray:v23];

  id v24 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v6 defaultSuggestionIndex:0 isForWallpaper:0];

  return (_PHPickerSuggestionGroup *)v24;
}

+ (_PHPickerSuggestionGroup)deviceOwnerSuggestionGroup
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = PLIsFeaturedContentAllowed();
  id v3 = objc_alloc_init(PUPickerSuggestionAll);
  v8[0] = v3;
  BOOL v4 = [[PUPickerWallpaperSuggestion alloc] initWithMode:5];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  id v6 = [[_PHPickerSuggestionGroup alloc] _initWithSuggestions:v5 defaultSuggestionIndex:v2 isForWallpaper:1];

  return (_PHPickerSuggestionGroup *)v6;
}

+ (_PHPickerSuggestionGroup)livePhotoWallpaperSuggestionGroup
{
  if (PLIsFeaturedContentAllowed()) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 0;
  }

  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:v2];
}

+ (_PHPickerSuggestionGroup)portraitWallpaperSuggestionGroup
{
  if (PLIsFeaturedContentAllowed())
  {
    if (PFPosterEnableSettlingEffect()) {
      uint64_t v2 = 3;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:v2];
}

+ (_PHPickerSuggestionGroup)shuffleWallpaperSuggestionGroup
{
  uint64_t v2 = PLIsFeaturedContentAllowed();

  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:v2 allowSettlingEffectSuggestions:0];
}

+ (_PHPickerSuggestionGroup)wallpaperSuggestionGroup
{
  uint64_t v2 = PLIsFeaturedContentAllowed();

  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:v2];
}

@end
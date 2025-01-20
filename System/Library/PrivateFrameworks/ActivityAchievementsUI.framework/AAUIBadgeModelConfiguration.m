@interface AAUIBadgeModelConfiguration
- (AAUIBadgeModelConfiguration)init;
- (AAUIBadgeModelConfiguration)initWithModelPaths:(id)a3 texturePaths:(id)a4 shapeName:(id)a5 metalColor:(id)a6 useFullColorEnamel:(BOOL)a7 modelEnamelColor:(id)a8 unearnedUsesTwoToneEnamel:(BOOL)a9 faceHasMetalInlay:(BOOL)a10 enamelTricolors:(id)a11 glyphTexturePath:(id)a12 glyphTextureScale:(double)a13 glyphPositionOffset:(CGPoint)a14;
- (BOOL)faceHasMetalInlay;
- (BOOL)unearnedUsesTwoToneEnamel;
- (BOOL)useFullColorEnamel;
- (CGPoint)glyphPositionOffset;
- (NSArray)badgeModelPaths;
- (NSArray)badgeTexturePaths;
- (NSArray)enamelTriColors;
- (NSString)glyphTexturePath;
- (NSString)shapeName;
- (UIColor)metalColor;
- (UIColor)modelEnamelColor;
- (double)glyphTextureScale;
- (unint64_t)badgeShape;
- (void)setBadgeModelPaths:(id)a3;
- (void)setBadgeTexturePaths:(id)a3;
- (void)setEnamelTriColors:(id)a3;
- (void)setFaceHasMetalInlay:(BOOL)a3;
- (void)setGlyphPositionOffset:(CGPoint)a3;
- (void)setGlyphTexturePath:(id)a3;
- (void)setGlyphTextureScale:(double)a3;
- (void)setMetalColor:(id)a3;
- (void)setModelEnamelColor:(id)a3;
- (void)setShapeName:(id)a3;
- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3;
- (void)setUseFullColorEnamel:(BOOL)a3;
@end

@implementation AAUIBadgeModelConfiguration

- (AAUIBadgeModelConfiguration)initWithModelPaths:(id)a3 texturePaths:(id)a4 shapeName:(id)a5 metalColor:(id)a6 useFullColorEnamel:(BOOL)a7 modelEnamelColor:(id)a8 unearnedUsesTwoToneEnamel:(BOOL)a9 faceHasMetalInlay:(BOOL)a10 enamelTricolors:(id)a11 glyphTexturePath:(id)a12 glyphTextureScale:(double)a13 glyphPositionOffset:(CGPoint)a14
{
  CGFloat y = a14.y;
  CGFloat x = a14.x;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v36 = a4;
  id v47 = a4;
  id v37 = a5;
  id v46 = a5;
  id v38 = a6;
  id v45 = a6;
  id v40 = a8;
  id v44 = a8;
  id v43 = a11;
  id v42 = a12;
  v22 = [MEMORY[0x263EFF960] currentLocale];
  int v23 = [v22 usesMetricSystem];

  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v21;
  uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v30 = [v29 componentsSeparatedByString:@"/"];
        v31 = [v30 lastObject];

        if (([v31 containsString:@"Kilometer"] & v23 & 1) != 0
          || ([v31 containsString:@"Mile"] ^ 1 | v23) != 1
          || ([v31 containsString:@"Mile"] & 1) == 0
          && ([v31 containsString:@"Kilometer"] & 1) == 0)
        {
          [v24 addObject:v29];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v26);
  }

  v49.receiver = self;
  v49.super_class = (Class)AAUIBadgeModelConfiguration;
  v32 = [(AAUIBadgeModelConfiguration *)&v49 init];
  if (v32)
  {
    uint64_t v33 = [v24 copy];
    badgeModelPaths = v32->_badgeModelPaths;
    v32->_badgeModelPaths = (NSArray *)v33;

    objc_storeStrong((id *)&v32->_badgeTexturePaths, v36);
    objc_storeStrong((id *)&v32->_glyphTexturePath, a12);
    objc_storeStrong((id *)&v32->_shapeName, v37);
    objc_storeStrong((id *)&v32->_metalColor, v38);
    v32->_useFullColorEnamel = a7;
    objc_storeStrong((id *)&v32->_modelEnamelColor, v40);
    v32->_unearnedUsesTwoToneEnamel = a9;
    v32->_faceHasMetalInlaCGFloat y = a10;
    objc_storeStrong((id *)&v32->_enamelTriColors, a11);
    v32->_glyphTextureScale = a13;
    v32->_glyphPositionOffset.CGFloat x = x;
    v32->_glyphPositionOffset.CGFloat y = y;
  }

  return v32;
}

- (NSArray)badgeTexturePaths
{
  return self->_badgeTexturePaths;
}

- (NSArray)badgeModelPaths
{
  return self->_badgeModelPaths;
}

- (BOOL)useFullColorEnamel
{
  return self->_useFullColorEnamel;
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (UIColor)metalColor
{
  return self->_metalColor;
}

- (NSString)glyphTexturePath
{
  return self->_glyphTexturePath;
}

- (BOOL)faceHasMetalInlay
{
  return self->_faceHasMetalInlay;
}

- (NSArray)enamelTriColors
{
  return self->_enamelTriColors;
}

- (AAUIBadgeModelConfiguration)init
{
  return 0;
}

- (unint64_t)badgeShape
{
  v2 = [(AAUIBadgeModelConfiguration *)self shapeName];
  if (AAUIBadgeShapeFromName_onceToken != -1) {
    dispatch_once(&AAUIBadgeShapeFromName_onceToken, &__block_literal_global_3);
  }
  v3 = [(id)AAUIBadgeShapeFromName_shapeNameMappings objectForKeyedSubscript:v2];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setBadgeModelPaths:(id)a3
{
}

- (void)setBadgeTexturePaths:(id)a3
{
}

- (void)setGlyphTexturePath:(id)a3
{
}

- (NSString)shapeName
{
  return self->_shapeName;
}

- (void)setShapeName:(id)a3
{
}

- (void)setMetalColor:(id)a3
{
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (void)setGlyphTextureScale:(double)a3
{
  self->_glyphTextureScale = a3;
}

- (CGPoint)glyphPositionOffset
{
  double x = self->_glyphPositionOffset.x;
  double y = self->_glyphPositionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGlyphPositionOffset:(CGPoint)a3
{
  self->_glyphPositionOffset = a3;
}

- (void)setUseFullColorEnamel:(BOOL)a3
{
  self->_useFullColorEnamel = a3;
}

- (UIColor)modelEnamelColor
{
  return self->_modelEnamelColor;
}

- (void)setModelEnamelColor:(id)a3
{
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  self->_faceHasMetalInladouble y = a3;
}

- (void)setEnamelTriColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enamelTriColors, 0);
  objc_storeStrong((id *)&self->_modelEnamelColor, 0);
  objc_storeStrong((id *)&self->_metalColor, 0);
  objc_storeStrong((id *)&self->_shapeName, 0);
  objc_storeStrong((id *)&self->_glyphTexturePath, 0);
  objc_storeStrong((id *)&self->_badgeTexturePaths, 0);
  objc_storeStrong((id *)&self->_badgeModelPaths, 0);
}

@end
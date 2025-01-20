@interface AVTColorPreset
+ (id)_colorPresetsForCategory:(int64_t)a3 palette:(id)a4;
+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4;
+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 colorIndex:(unint64_t)a5 variation:(float)a6;
+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5;
+ (id)colorPresetsForCategory:(int64_t)a3;
+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
+ (id)fallbackColorPresetForNilPresetAndCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
+ (id)secondaryColorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5;
+ (id)secondaryColorPresetsForCategory:(int64_t)a3;
- (AVTColorPreset)colorPresetWithVariation:(float)a3;
- (AVTColorPreset)initWithCategory:(int64_t)a3 description:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLipsColor;
- (BOOL)shouldBlendWithSkinColor;
- (NSString)localizedName;
- (NSString)name;
- (UIImage)thumbnail;
- (float)variation;
- (id)baseColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)derivedColorNameForPresetCategory:(int64_t)a3;
- (id)description;
- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4;
- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4 withSkinColor:(id)a5;
- (id)makeMaterial;
- (id)previewAccentColor;
- (id)previewColor;
- (int64_t)category;
- (void)enumerateDerivedColorPresetsUsingBlock:(id)a3;
- (void)renderColorIntoCALayer:(id)a3 withSkinColor:(id)a4;
@end

@implementation AVTColorPreset

- (NSString)localizedName
{
  return (NSString *)AVTLocalizedPaletteString(self->_category, self->_name);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5
{
  return (id)objc_msgSend(a1, "colorPresetWithName:category:colorIndex:variation:", a3, a4, 0);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 colorIndex:(unint64_t)a5 variation:(float)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  +[AVTPreset colorPresetsForCategory:a4 colorIndex:a5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "name", (void)v21);
        int v16 = [v15 isEqualToString:v9];

        if (v16)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a6 == 0.0)
  {
    id v18 = v11;
  }
  else
  {
    *(float *)&double v17 = a6;
    id v18 = [v11 colorPresetWithVariation:v17];
  }
  v19 = v18;

  return v19;
}

+ (id)secondaryColorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5
{
  return (id)objc_msgSend(a1, "colorPresetWithName:category:colorIndex:variation:", a3, a4, 1);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4
{
  return (id)[a1 colorPresetWithName:a3 category:a4 variation:0.0];
}

+ (id)_colorPresetsForCategory:(int64_t)a3 palette:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = AVTPresetCategoryToColorCategoryString(a3);
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v15 = [AVTColorPreset alloc];
          int v16 = -[AVTColorPreset initWithCategory:description:](v15, "initWithCategory:description:", a3, v14, (void)v18);
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AVTColorPreset_colorPresetsForCategory_colorIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorPresetsForCategory_colorIndex__onceToken != -1) {
    dispatch_once(&colorPresetsForCategory_colorIndex__onceToken, block);
  }
  v6 = (void *)colorPresetsForCategory_colorIndex__colorPresets[3 * a3 + a4];
  return v6;
}

void __53__AVTColorPreset_colorPresetsForCategory_colorIndex___block_invoke(uint64_t a1)
{
  v2 = &colorPresetsForCategory_colorIndex__colorPresets;
  v3 = AVTPrecompiledMemojiColorPalettes();
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = v3;
    id v12 = v5;
    if (i == 1)
    {
      v7 = @"secondaryColors";
      goto LABEL_6;
    }
    v6 = v5;
    if (i == 2)
    {
      v7 = @"tertiaryColors";
LABEL_6:
      v6 = [v5 objectForKeyedSubscript:v7];
    }
    uint64_t v8 = 0;
    id v9 = (void **)v2;
    do
    {
      uint64_t v10 = [*(id *)(a1 + 32) _colorPresetsForCategory:v8 palette:v6];
      uint64_t v11 = *v9;
      *id v9 = (void *)v10;
      v9 += 3;

      ++v8;
    }
    while (v8 != 40);

    ++v2;
  }
}

+ (id)colorPresetsForCategory:(int64_t)a3
{
  return (id)[a1 colorPresetsForCategory:a3 colorIndex:0];
}

+ (id)secondaryColorPresetsForCategory:(int64_t)a3
{
  return (id)[a1 colorPresetsForCategory:a3 colorIndex:1];
}

+ (id)fallbackColorPresetForNilPresetAndCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  if (a4 >= 3) {
    +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:]();
  }
  if (!a4) {
    goto LABEL_10;
  }
  if (a4 != 2)
  {
    if ((unint64_t)a3 <= 0x22 && ((1 << a3) & 0x400000090) != 0)
    {
      v4 = 0;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v4 = 0;
  if (a3 != 4 && a3 != 34)
  {
    a4 = 2;
LABEL_10:
    id v5 = +[AVTPreset colorPresetsForCategory:a3 colorIndex:a4];
    v4 = [v5 firstObject];
  }
LABEL_11:
  return v4;
}

- (AVTColorPreset)initWithCategory:(int64_t)a3 description:(id)a4
{
  id v6 = a4;
  v59.receiver = self;
  v59.super_class = (Class)AVTColorPreset;
  v7 = [(AVTColorPreset *)&v59 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"name"];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"derived"];
    derivedColors = v7->_derivedColors;
    v7->_derivedColors = (NSDictionary *)v10;

    v7->_category = a3;
    id v12 = [v6 objectForKeyedSubscript:@"colors"];
    v13 = [v6 objectForKeyedSubscript:@"variations-min"];
    uint64_t v14 = [v6 objectForKeyedSubscript:@"variations-max"];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __47__AVTColorPreset_initWithCategory_description___block_invoke;
    v55[3] = &unk_2640205F8;
    int v16 = v15;
    v56 = v16;
    id v57 = v13;
    id v58 = v14;
    id v17 = v14;
    id v18 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:v55];
    propertyColors = v7->_propertyColors;
    v7->_propertyColors = v16;
    long long v20 = v16;

    long long v21 = [v6 objectForKeyedSubscript:@"preview"];
    if (v21)
    {
      long long v22 = objc_alloc_init(AVTVaryingColor);
      previewColor = v7->_previewColor;
      v7->_previewColor = v22;

      uint64_t v53 = 0;
      uint64_t v54 = 0;
      long long v24 = [v21 objectForKeyedSubscript:@"color"];
      _scanColor(v24, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      uint64_t v26 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
      v27 = v7->_previewColor;
      if (v27) {
        objc_setProperty_atomic(v27, v25, v26, 8);
      }

      v28 = [v21 objectForKeyedSubscript:@"variation-min"];
      _scanColor(v28, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      v30 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
      v31 = v7->_previewColor;
      if (v31) {
        objc_setProperty_atomic(v31, v29, v30, 16);
      }

      v32 = [v21 objectForKeyedSubscript:@"variation-max"];
      _scanColor(v32, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      v34 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
      v35 = v7->_previewColor;
      if (v35) {
        objc_setProperty_atomic(v35, v33, v34, 24);
      }

      v36 = [v21 objectForKeyedSubscript:@"accent"];
      if (v36)
      {
        v37 = objc_alloc_init(AVTVaryingColor);
        previewAccentColor = v7->_previewAccentColor;
        v7->_previewAccentColor = v37;

        v39 = [v36 objectForKeyedSubscript:@"color"];
        _scanColor(v39, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        v41 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
        v42 = v7->_previewAccentColor;
        if (v42) {
          objc_setProperty_atomic(v42, v40, v41, 8);
        }

        v43 = [v36 objectForKeyedSubscript:@"variation-min"];
        _scanColor(v43, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        v45 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
        v46 = v7->_previewAccentColor;
        if (v46) {
          objc_setProperty_atomic(v46, v44, v45, 16);
        }

        v47 = [v36 objectForKeyedSubscript:@"variation-max"];
        _scanColor(v47, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        v49 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v54 + 1) green:*(float *)&v54 blue:*((float *)&v53 + 1) alpha:*(float *)&v53];
        v50 = v7->_previewAccentColor;
        if (v50) {
          objc_setProperty_atomic(v50, v48, v49, 24);
        }

        v51 = [v36 objectForKeyedSubscript:@"type"];
        v7->_previewAccentType = [v51 isEqualToString:@"soft"];
      }
    }
  }
  return v7;
}

void __47__AVTColorPreset_initWithCategory_description___block_invoke(id *a1, void *a2, void *a3)
{
  id v31 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(AVTVaryingColor);
  [a1[4] setObject:v6 forKeyedSubscript:v31];
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  _scanColor(v5, (float *)&v35 + 1, (float *)&v35, (float *)&v34 + 1, (float *)&v34);

  double v7 = *((float *)&v35 + 1);
  double v8 = *(float *)&v35;
  double v9 = *((float *)&v34 + 1);
  double v10 = *(float *)&v34;
  id v12 = [MEMORY[0x263F1C550] colorWithRed:*((float *)&v35 + 1) green:*(float *)&v35 blue:*((float *)&v34 + 1) alpha:*(float *)&v34];
  if (v6) {
    objc_setProperty_atomic(v6, v11, v12, 8);
  }

  v13 = [a1[5] objectForKeyedSubscript:v31];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    _scanColor(v13, (float *)&v33 + 1, (float *)&v33, (float *)&v32 + 1, (float *)&v32);
    v15 = (void *)MEMORY[0x263F1C550];
    double v16 = *((float *)&v33 + 1);
    double v17 = *(float *)&v33;
    double v18 = *((float *)&v32 + 1);
    double v19 = *(float *)&v32;
  }
  else
  {
    v15 = (void *)MEMORY[0x263F1C550];
    double v16 = v7 * 0.5;
    double v17 = v8 * 0.5;
    double v18 = v9 * 0.5;
    double v19 = v10;
  }
  long long v21 = [v15 colorWithRed:v16 green:v17 blue:v18 alpha:v19];
  if (v6) {
    objc_setProperty_atomic(v6, v20, v21, 16);
  }

  long long v22 = [a1[6] objectForKeyedSubscript:v31];
  uint64_t v23 = v22;
  if (v22)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    _scanColor(v22, (float *)&v33 + 1, (float *)&v33, (float *)&v32 + 1, (float *)&v32);
    long long v24 = (void *)MEMORY[0x263F1C550];
    double v25 = *((float *)&v33 + 1);
    double v26 = *(float *)&v33;
    double v27 = *((float *)&v32 + 1);
    double v28 = *(float *)&v32;
  }
  else
  {
    long long v24 = (void *)MEMORY[0x263F1C550];
    double v25 = v7 * 1.5;
    double v26 = v8 * 1.5;
    double v27 = v9 * 1.5;
    double v28 = v10;
  }
  v30 = [v24 colorWithRed:v25 green:v26 blue:v27 alpha:v28];
  if (v6) {
    objc_setProperty_atomic(v6, v29, v30, 24);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVTColorPreset);
  objc_storeStrong((id *)&v4->_material, self->_material);
  objc_storeStrong((id *)&v4->_name, self->_name);
  v4->_category = self->_category;
  objc_storeStrong((id *)&v4->_propertyColors, self->_propertyColors);
  objc_storeStrong((id *)&v4->_derivedColors, self->_derivedColors);
  objc_storeStrong((id *)&v4->_previewColor, self->_previewColor);
  objc_storeStrong((id *)&v4->_previewAccentColor, self->_previewAccentColor);
  v4->_previewAccentType = self->_previewAccentType;
  v4->_variation = self->_variation;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    double v8 = [v7 name];
    int v9 = [v8 isEqualToString:self->_name];

    if (v9 && [v7 category] == self->_category)
    {
      [v7 variation];
      BOOL v6 = v10 == self->_variation;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (BOOL)isNaturalLipsColor
{
  if ([(AVTColorPreset *)self category] != 10) {
    return 0;
  }
  v3 = [(AVTColorPreset *)self name];
  char v4 = [v3 containsString:@"Natural"];

  return v4;
}

- (BOOL)shouldBlendWithSkinColor
{
  unint64_t v2 = [(AVTColorPreset *)self category];
  return (v2 < 0x1E) & (0x29C00000u >> v2);
}

- (UIImage)thumbnail
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  char v4 = CGBitmapContextCreate(0, 0x78uLL, 0x78uLL, 8uLL, 0x1E0uLL, DeviceRGB, 1u);
  CFRelease(DeviceRGB);
  v16.size.width = 120.0;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.height = 120.0;
  CGContextAddEllipseInRect(v4, v16);
  CGContextClip(v4);
  id v5 = [(AVTColorPreset *)self previewColor];
  *(double *)&long long v7 = AVTGetColorComponents(v5, v6);
  long long v12 = v7;

  float v8 = 1.0;
  if (*((float *)&v12 + 3) != 0.0) {
    float v8 = *((float *)&v12 + 3);
  }
  CGContextSetRGBFillColor(v4, *(float *)&v12, *((float *)&v12 + 1), *((float *)&v12 + 2), v8);
  if (*((float *)&v12 + 3) == 0.0)
  {
    *(_OWORD *)lengths = xmmword_20B890190;
    CGContextSetLineWidth(v4, 10.0);
    CGContextSetLineDash(v4, 0.0, lengths, 2uLL);
    v17.size.width = 120.0;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.height = 120.0;
    CGContextStrokeEllipseInRect(v4, v17);
  }
  else
  {
    v18.size.width = 120.0;
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.height = 120.0;
    CGContextFillRect(v4, v18);
  }
  CGImageRef Image = CGBitmapContextCreateImage(v4);
  CFRelease(v4);
  float v10 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image];
  CFRelease(Image);
  return (UIImage *)v10;
}

- (id)baseColor
{
  unint64_t v2 = [(AVTColorPreset *)self makeMaterial];
  v3 = [v2 baseColor];

  return v3;
}

- (id)previewColor
{
  if (self->_previewColor)
  {
    *(float *)&double v2 = self->_variation;
    [(AVTVaryingColor *)self->_previewColor colorByApplyingVariation:v2];
  }
  else
  {
    [(AVTColorPreset *)self baseColor];
  v3 = };
  return v3;
}

- (id)previewAccentColor
{
  previewAccentColor = self->_previewAccentColor;
  if (previewAccentColor)
  {
    *(float *)&double v2 = self->_variation;
    previewAccentColor = [previewAccentColor colorByApplyingVariation:v2];
  }
  return previewAccentColor;
}

- (id)makeMaterial
{
  material = self->_material;
  if (!material)
  {
    char v4 = objc_alloc_init(AVTMaterial);
    id v5 = self->_material;
    self->_material = v4;

    BOOL v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_propertyColors, "count"));
    propertyColors = self->_propertyColors;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __30__AVTColorPreset_makeMaterial__block_invoke;
    v13 = &unk_264020620;
    uint64_t v14 = self;
    id v15 = v6;
    id v8 = v6;
    [(NSDictionary *)propertyColors enumerateKeysAndObjectsUsingBlock:&v10];
    -[AVTMaterial setAdditionalPropertyColors:](self->_material, "setAdditionalPropertyColors:", v8, v10, v11, v12, v13, v14);

    material = self->_material;
  }
  return material;
}

void __30__AVTColorPreset_makeMaterial__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  long long v7 = v5;
  if (*(float *)(*(void *)(a1 + 32) + 64) == 0.0)
  {
    if (v5) {
      id Property = objc_getProperty(v5, v6, 8, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = Property;
  }
  else
  {
    objc_msgSend(v5, "colorByApplyingVariation:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;
  if ([v11 isEqualToString:@"diffuse"]) {
    [*(id *)(*(void *)(a1 + 32) + 72) setBaseColor:v10];
  }
  else {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

- (void)enumerateDerivedColorPresetsUsingBlock:(id)a3
{
  id v4 = a3;
  derivedColors = self->_derivedColors;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AVTColorPreset_enumerateDerivedColorPresetsUsingBlock___block_invoke;
  v7[3] = &unk_264020648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)derivedColors enumerateKeysAndObjectsUsingBlock:v7];
}

void __57__AVTColorPreset_enumerateDerivedColorPresetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = AVTPresetCategoryFromString(a2);
  LODWORD(v7) = *(_DWORD *)(*(void *)(a1 + 32) + 64);
  id v9 = +[AVTColorPreset colorPresetWithName:v5 category:v6 variation:v7];

  id v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v8 = v9;
  }
}

- (id)derivedColorNameForPresetCategory:(int64_t)a3
{
  id v4 = AVTPresetCategoryToColorCategoryString(a3);
  id v5 = [(NSDictionary *)self->_derivedColors objectForKeyedSubscript:v4];

  return v5;
}

- (int64_t)category
{
  return self->_category;
}

- (AVTColorPreset)colorPresetWithVariation:(float)a3
{
  if (self->_variation == a3)
  {
    id v4 = self;
  }
  else
  {
    id v4 = (AVTColorPreset *)[(AVTColorPreset *)self copy];
    v4->_variation = a3;
    material = v4->_material;
    v4->_material = 0;
  }
  return v4;
}

- (float)variation
{
  return self->_variation;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  name = self->_name;
  double v7 = AVTPresetCategoryToString(self->_category);
  id v8 = [v3 stringWithFormat:@"<%@: %p> name:%@ category:%@ variation:%f ", v5, self, name, v7, self->_variation];

  return v8;
}

- (void)renderColorIntoCALayer:(id)a3 withSkinColor:(id)a4
{
  v41[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  if ([(AVTColorPreset *)self isNaturalLipsColor])
  {
    id v8 = [v7 baseColor];
    *(double *)v10.i64 = AVTGetColorComponents(v8, v9);
    float32x4_t v11 = vsubq_f32((float32x4_t)xmmword_20B890180, v10);
    float32x4_t v12 = vaddq_f32(v10, v11);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    float32x4_t v37 = vmlaq_f32(v10, (float32x4_t)0, v11);
    float32x4_t v38 = vmlaq_f32(v10, v13, v11);
    uint64_t v14 = [MEMORY[0x263F1C550] colorWithRed:v12.f32[0] green:v12.f32[1] blue:v12.f32[2] alpha:1.0];
    id v15 = [MEMORY[0x263F1C550] colorWithRed:v37.f32[0] green:v37.f32[1] blue:v37.f32[2] alpha:1.0];
    CGRect v16 = [MEMORY[0x263F1C550] colorWithRed:v38.f32[0] green:v38.f32[1] blue:v38.f32[2] alpha:1.0];
    *(float *)&double v17 = self->_variation;
    AVTColorApplyVariation(v16, v14, v15, v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

LABEL_16:
    goto LABEL_17;
  }
  double v19 = [(AVTColorPreset *)self previewColor];
  *(double *)v21.i64 = AVTGetColorComponents(v19, v20);
  float32x4_t v39 = v21;

  double v22 = COERCE_DOUBLE(__PAIR64__(v39.u32[1], v39.u32[3]));
  if (v39.f32[3] < 1.0
    && [(AVTColorPreset *)self shouldBlendWithSkinColor])
  {
    uint64_t v23 = [v7 previewColor];
    *(double *)v25.i64 = AVTGetColorComponents(v23, v24);
    float32x4_t v37 = v25;

    float32x4_t v26 = vmlaq_laneq_f32(v37, vsubq_f32(v39, v37), v39, 3);
    double v27 = [MEMORY[0x263F1C550] colorWithRed:v26.f32[0] green:v26.f32[1] blue:v26.f32[2] alpha:1.0];
  }
  else
  {
    double v27 = [(AVTColorPreset *)self previewColor];
  }
  id v28 = v27;
  uint64_t v29 = [v28 CGColor];

  [v6 setBackgroundColor:v29];
  id v30 = [(AVTColorPreset *)self previewAccentColor];
  uint64_t v31 = [v30 CGColor];

  uint64_t v32 = [v6 sublayers];
  uint64_t v33 = [v32 firstObject];
  id v8 = v33;
  if (v31)
  {

    if (!v8)
    {
      id v8 = [MEMORY[0x263F157D0] layer];
      [v6 bounds];
      objc_msgSend(v8, "setFrame:");
      [v6 addSublayer:v8];
    }
    unint64_t previewAccentType = self->_previewAccentType;
    if (previewAccentType == 1)
    {
      v40[0] = v29;
      v40[1] = v31;
      uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
      v36 = &unk_26C00C6C0;
    }
    else
    {
      if (previewAccentType) {
        goto LABEL_16;
      }
      v41[0] = v31;
      v41[1] = v29;
      v41[2] = v31;
      uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];
      v36 = &unk_26C00C6A8;
    }
    objc_msgSend(v8, "setColors:", v35, *(_OWORD *)&v37);

    [v8 setLocations:v36];
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v8, "setEndPoint:", 1.0, 1.0);
    [v8 setType:*MEMORY[0x263F15DD0]];
    goto LABEL_16;
  }
  [v33 removeFromSuperlayer];

LABEL_17:
  objc_msgSend(MEMORY[0x263F158F8], "commit", *(_OWORD *)&v37);
}

- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4
{
  return -[AVTColorPreset gradientLayerWithRangeMin:max:withSkinColor:](self, "gradientLayerWithRangeMin:max:withSkinColor:", 0);
}

- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4 withSkinColor:(id)a5
{
  v35[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  if ([(AVTColorPreset *)self isNaturalLipsColor])
  {
    float32x4_t v10 = [v8 baseColor];
    *(double *)v12.i64 = AVTGetColorComponents(v10, v11);
    float32x4_t v13 = vsubq_f32((float32x4_t)xmmword_20B890180, v12);
    float32x4_t v14 = vaddq_f32(v12, v13);
    v15.i64[0] = 0x3F0000003F000000;
    v15.i64[1] = 0x3F0000003F000000;
    float32x4_t v32 = vmlaq_f32(v12, v15, v13);
    float32x4_t v33 = vmlaq_f32(v12, (float32x4_t)0, v13);
    CGRect v16 = [MEMORY[0x263F1C550] colorWithRed:v14.f32[0] green:v14.f32[1] blue:v14.f32[2] alpha:1.0];
    double v17 = [MEMORY[0x263F1C550] colorWithRed:v32.f32[0] green:v32.f32[1] blue:v32.f32[2] alpha:1.0];
    id v18 = [MEMORY[0x263F1C550] colorWithRed:v33.f32[0] green:v33.f32[1] blue:v33.f32[2] alpha:1.0];
    double v19 = [MEMORY[0x263F157D0] layer];
    id v20 = v16;
    v35[0] = [v20 CGColor];
    id v21 = v17;
    v35[1] = [v21 CGColor];
    id v22 = v18;
    v35[2] = [v22 CGColor];
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    [v19 setColors:v23];

    objc_msgSend(v19, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v19, "setEndPoint:", 1.0, 0.5);
  }
  else
  {
    *(float *)&double v9 = a3;
    float32x4_t v10 = [(AVTColorPreset *)self colorPresetWithVariation:v9];
    *(float *)&double v24 = a4;
    id v20 = [(AVTColorPreset *)self colorPresetWithVariation:v24];
    float32x4_t v25 = [v10 previewColor];
    float32x4_t v26 = [(AVTColorPreset *)self previewColor];
    double v27 = [v20 previewColor];
    double v19 = [MEMORY[0x263F157D0] layer];
    if (v8 && [(AVTColorPreset *)self shouldBlendWithSkinColor])
    {
      id v28 = [v8 previewColor];
      objc_msgSend(v19, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));
    }
    id v21 = v25;
    v34[0] = [v21 CGColor];
    id v22 = v26;
    v34[1] = [v22 CGColor];
    id v29 = v27;
    v34[2] = [v29 CGColor];
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
    [v19 setColors:v30];

    objc_msgSend(v19, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v19, "setEndPoint:", 1.0, 0.5);
  }
  return v19;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_material, 0);
  objc_storeStrong((id *)&self->_previewAccentColor, 0);
  objc_storeStrong((id *)&self->_previewColor, 0);
  objc_storeStrong((id *)&self->_derivedColors, 0);
  objc_storeStrong((id *)&self->_propertyColors, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)fallbackColorPresetForNilPresetAndCategory:colorIndex:.cold.1()
{
}

@end
@interface HFColorPalette
+ (HFColorPaletteColor)warmWhiteColor;
+ (id)_defaultColorsOfType:(unint64_t)a3;
+ (id)_defaultRGBColors;
+ (id)_defaultTemperatureColors;
+ (id)defaultColorPaletteOfType:(unint64_t)a3;
- (BOOL)_isNaturalLightPalette;
- (BOOL)isEqual:(id)a3;
- (HFColorPalette)init;
- (HFColorPalette)initWithColors:(id)a3 type:(unint64_t)a4;
- (HFColorPalette)initWithDawnColorPickerFavorites:(id)a3 type:(unint64_t)a4;
- (HFColorPalette)initWithSerializedRepresentation:(id)a3 type:(unint64_t)a4;
- (NSArray)colors;
- (NSArray)rawColors;
- (id)colorPaletteByAdjustingForColorProfile:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (unint64_t)paletteType;
- (void)setRawColors:(id)a3;
@end

@implementation HFColorPalette

+ (HFColorPaletteColor)warmWhiteColor
{
  v2 = [HFRGBColor alloc];
  LODWORD(v3) = 1063295210;
  LODWORD(v4) = 1061494456;
  LODWORD(v5) = 1.0;
  v6 = [(HFRGBColor *)v2 initWithRed:v5 green:v3 blue:v4];
  v7 = [HFTemperatureColor alloc];
  LODWORD(v8) = 1136066560;
  v9 = [(HFTemperatureColor *)v7 initWithTemperatureInMired:v8];
  v10 = [HFColorCollection alloc];
  v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v6, v9, 0);
  v12 = [(HFColorCollection *)v10 initWithPrimitiveColors:v11];

  v13 = [[HFColorPaletteColor alloc] initWithColorCollection:v12];
  return v13;
}

+ (id)_defaultRGBColors
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__HFColorPalette__defaultRGBColors__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __35__HFColorPalette__defaultRGBColors__block_invoke((uint64_t)v4);
  return v2;
}

id __35__HFColorPalette__defaultRGBColors__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HFColorPalette__defaultRGBColors__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_MergedGlobals_284 != -1) {
    dispatch_once(&_MergedGlobals_284, block);
  }
  v1 = (void *)qword_26AB2F868;
  return v1;
}

void __35__HFColorPalette__defaultRGBColors__block_invoke_2(uint64_t a1)
{
  v30[6] = *MEMORY[0x263EF8340];
  v2 = [HFColorPaletteColor alloc];
  LODWORD(v3) = 1061966242;
  LODWORD(v4) = 1062994089;
  LODWORD(v5) = 1.0;
  v6 = [(HFColorPaletteColor *)v2 initWithRed:v3 green:v4 blue:v5];
  v30[0] = v6;
  v7 = [HFColorPaletteColor alloc];
  LODWORD(v8) = 1064668145;
  LODWORD(v9) = 1064514355;
  LODWORD(v10) = 1.0;
  v11 = [(HFColorPaletteColor *)v7 initWithRed:v8 green:v9 blue:v10];
  v30[1] = v11;
  v12 = [*(id *)(a1 + 32) warmWhiteColor];
  v30[2] = v12;
  v13 = [HFColorPaletteColor alloc];
  LODWORD(v14) = 1061300772;
  LODWORD(v15) = 1057278939;
  LODWORD(v16) = 1.0;
  v17 = [(HFColorPaletteColor *)v13 initWithRed:v16 green:v14 blue:v15];
  v30[3] = v17;
  v18 = [HFColorPaletteColor alloc];
  LODWORD(v19) = 1059695018;
  LODWORD(v20) = 1051372202;
  LODWORD(v21) = 1.0;
  v22 = [(HFColorPaletteColor *)v18 initWithRed:v21 green:v19 blue:v20];
  v30[4] = v22;
  v23 = [HFColorPaletteColor alloc];
  LODWORD(v24) = 1056629064;
  LODWORD(v25) = 1050924810;
  LODWORD(v26) = 1.0;
  v27 = [(HFColorPaletteColor *)v23 initWithRed:v24 green:v25 blue:v26];
  v30[5] = v27;
  uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:6];
  v29 = (void *)qword_26AB2F868;
  qword_26AB2F868 = v28;
}

+ (id)_defaultTemperatureColors
{
  if (qword_26AB2F870 != -1) {
    dispatch_once(&qword_26AB2F870, &__block_literal_global_9_6);
  }
  v2 = (void *)qword_26AB2F878;
  return v2;
}

uint64_t __43__HFColorPalette__defaultTemperatureColors__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(&unk_26C0F8248, "na_map:", &__block_literal_global_27_8);
  uint64_t v1 = qword_26AB2F878;
  qword_26AB2F878 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

HFColorPaletteColor *__43__HFColorPalette__defaultTemperatureColors__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [HFTemperatureColor alloc];
  [v2 floatValue];
  int v5 = v4;

  LODWORD(v6) = v5;
  v7 = [(HFTemperatureColor *)v3 initWithTemperatureInKelvin:v6];
  double v8 = [[HFColorCollection alloc] initWithPrimitiveColor:v7];
  double v9 = [[HFColorPaletteColor alloc] initWithColorCollection:v8];

  return v9;
}

+ (id)_defaultColorsOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      int v5 = objc_msgSend(a1, "_defaultRGBColors", v3);
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      int v5 = objc_msgSend(a1, "_defaultTemperatureColors", v3);
LABEL_4:
      break;
    default:
      int v5 = 0;
      break;
  }
  return v5;
}

+ (id)defaultColorPaletteOfType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)a1);
  double v6 = [a1 _defaultColorsOfType:a3];
  v7 = (void *)[v5 initWithColors:v6 type:a3];

  return v7;
}

- (HFColorPalette)initWithColors:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFColorPalette;
  double v8 = [(HFColorPalette *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    v8->_paletteType = a4;
    objc_storeStrong((id *)&v8->_rawColors, a3);
  }

  return v9;
}

- (HFColorPalette)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithColors_type_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFColorPalette.m", 102, @"%s is unavailable; use %@ instead",
    "-[HFColorPalette init]",
    v5);

  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v4 = [(HFColorPalette *)self colors];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HFColorPalette alloc];
  id v5 = [(HFColorPalette *)self rawColors];
  double v6 = [(HFColorPalette *)v4 initWithColors:v5 type:[(HFColorPalette *)self paletteType]];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HFMutableColorPalette alloc];
  id v5 = [(HFColorPalette *)self rawColors];
  double v6 = [(HFColorPalette *)v4 initWithColors:v5 type:[(HFColorPalette *)self paletteType]];

  return v6;
}

- (HFColorPalette)initWithSerializedRepresentation:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(id)objc_opt_class() _defaultColorsOfType:a4];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke;
    v12[3] = &unk_264097B50;
    double v14 = v15;
    id v8 = v7;
    id v13 = v8;
    double v9 = objc_msgSend(v6, "na_map:", v12);
    self = [(HFColorPalette *)self initWithColors:v9 type:a4];

    _Block_object_dispose(v15, 8);
    double v10 = self;
  }
  else
  {
    NSLog(&cfstr_InvalidReprese.isa, v6);
    double v10 = 0;
  }

  return v10;
}

HFColorPaletteColor *__56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke_2;
  aBlock[3] = &unk_264097B28;
  aBlock[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[HFColorPaletteColor alloc] initWithDictionaryRepresentation:v3];
    if (v5)
    {
LABEL_5:
      if (!v4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 < [*(id *)(a1 + 32) count])
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    goto LABEL_5;
  }
  id v5 = 0;
  if (v4) {
LABEL_6:
  }
    v4[2](v4);
LABEL_7:

  return v5;
}

uint64_t __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke_2(uint64_t result)
{
  return result;
}

- (id)serializedRepresentation
{
  id v3 = [(HFColorPalette *)self rawColors];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HFColorPalette_serializedRepresentation__block_invoke;
  v6[3] = &unk_264097B78;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

id __42__HFColorPalette_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "dictionaryRepresentationWithPreferredPaletteType:", objc_msgSend(v2, "paletteType"));

  return v4;
}

- (HFColorPalette)initWithDawnColorPickerFavorites:(id)a3 type:(unint64_t)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v44 = HFLogForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v6;
      _os_log_error_impl(&dword_20B986000, v44, OS_LOG_TYPE_ERROR, "Invalid color picker favorites %@", buf, 0xCu);
    }
    v52 = 0;
  }
  else
  {
    v56 = self;
    v54 = [(id)objc_opt_class() _defaultColorsOfType:a4];
    id v7 = [MEMORY[0x263EFF980] array];
    unint64_t v57 = a4;
    id v8 = &off_26408A000;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      double v9 = [[HFColorPaletteColor alloc] initWithNaturalLightColor];
      [v7 addObject:v9];
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v55 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v60 = *(void *)v66;
      id v58 = v10;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v66 != v60) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v65 + 1) + 8 * v13);
        if ((unint64_t)[v7 count] > 5) {
          goto LABEL_30;
        }
        double v15 = [v14 objectForKeyedSubscript:@"temperature"];
        if (v15) {
          break;
        }
        if ((v57 & 0xFFFFFFFFFFFFFFFDLL) != 1)
        {
          v18 = [v14 objectForKeyedSubscript:@"hue"];
          uint64_t v19 = [v14 objectForKeyedSubscript:@"saturation"];
          if (v18) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          v59 = (void *)v19;
          if (v20)
          {
            v17 = 0;
          }
          else
          {
            double v21 = (void *)v19;
            v22 = [HFRGBColor alloc];
            [v18 floatValue];
            int v24 = v23;
            [v21 floatValue];
            LODWORD(v26) = v25;
            LODWORD(v27) = 1.0;
            LODWORD(v28) = v24;
            v29 = [(HFRGBColor *)v22 initWithHue:v28 saturation:v26 brightness:v27];
            v17 = (HFTemperatureColor *)[objc_alloc((Class)v8[501]) initWithColorPrimitive:v29];
          }
          v30 = [v14 objectForKeyedSubscript:@"r"];
          v31 = [v14 objectForKeyedSubscript:@"g"];
          uint64_t v32 = [v14 objectForKeyedSubscript:@"b"];
          v33 = (void *)v32;
          if (v30 && v31 && v32)
          {
            id v34 = objc_alloc((Class)v8[501]);
            [v30 floatValue];
            int v36 = v35;
            [v31 floatValue];
            int v38 = v37;
            [v33 floatValue];
            LODWORD(v40) = v39;
            LODWORD(v41) = v36;
            LODWORD(v42) = v38;
            uint64_t v43 = [v34 initWithRed:v41 green:v42 blue:v40];

            v17 = (HFTemperatureColor *)v43;
          }
          if (v17) {
            [v7 addObject:v17];
          }

          id v8 = &off_26408A000;
          id v10 = v58;
          goto LABEL_27;
        }
LABEL_28:

        if (v12 == ++v13)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v65 objects:v70 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_30;
        }
      }
      double v16 = [HFTemperatureColor alloc];
      [v15 floatValue];
      v17 = -[HFTemperatureColor initWithTemperatureInMired:](v16, "initWithTemperatureInMired:");
      v18 = (void *)[objc_alloc((Class)v8[501]) initWithColorPrimitive:v17];
      [v7 addObject:v18];
LABEL_27:

      goto LABEL_28;
    }
LABEL_30:

    v44 = v54;
    if ((unint64_t)[v7 count] <= 5)
    {
      uint64_t v45 = [v7 count];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v46 = v54;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = 6 - v45;
        uint64_t v50 = *(void *)v62;
LABEL_33:
        uint64_t v51 = 0;
        while (1)
        {
          if (*(void *)v62 != v50) {
            objc_enumerationMutation(v46);
          }
          if (v49 == v51) {
            break;
          }
          [v7 addObject:*(void *)(*((void *)&v61 + 1) + 8 * v51++)];
          if (v48 == v51)
          {
            uint64_t v48 = [v46 countByEnumeratingWithState:&v61 objects:v69 count:16];
            v49 -= v51;
            if (v48) {
              goto LABEL_33;
            }
            break;
          }
        }
      }
    }
    self = [(HFColorPalette *)v56 initWithColors:v7 type:v57];

    v52 = self;
    id v6 = v55;
  }

  return v52;
}

- (BOOL)_isNaturalLightPalette
{
  return [(HFColorPalette *)self paletteType] == 2
      || [(HFColorPalette *)self paletteType] == 3;
}

- (NSArray)colors
{
  id v3 = [(HFColorPalette *)self rawColors];
  if ([(HFColorPalette *)self _isNaturalLightPalette])
  {
    uint64_t v4 = (void *)[v3 mutableCopy];
    id v5 = [[HFColorPaletteColor alloc] initWithNaturalLightColor];
    [v4 replaceObjectAtIndex:0 withObject:v5];
  }
  else
  {
    uint64_t v4 = (void *)[v3 copy];
  }

  return (NSArray *)v4;
}

- (id)colorPaletteByAdjustingForColorProfile:(id)a3
{
  id v4 = a3;
  id v5 = [(HFColorPalette *)self colors];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__HFColorPalette_colorPaletteByAdjustingForColorProfile___block_invoke;
  v10[3] = &unk_264097BA0;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_map:", v10);

  id v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColors:type:", v7, -[HFColorPalette paletteType](self, "paletteType"));
  return v8;
}

uint64_t __57__HFColorPalette_colorPaletteByAdjustingForColorProfile___block_invoke(uint64_t a1, void *a2)
{
  return [a2 colorByAdjustingToColorProfile:*(void *)(a1 + 32)];
}

- (unint64_t)hash
{
  id v2 = [(HFColorPalette *)self colors];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HFColorPalette *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HFColorPalette *)self colors];
      id v6 = [(HFColorPalette *)v4 colors];
      char v7 = [v5 isEqualToArray:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)paletteType
{
  return self->_paletteType;
}

- (NSArray)rawColors
{
  return self->_rawColors;
}

- (void)setRawColors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
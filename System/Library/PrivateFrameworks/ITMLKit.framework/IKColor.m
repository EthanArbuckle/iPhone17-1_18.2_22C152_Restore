@interface IKColor
+ (id)colorMap;
+ (void)registerColorNameMap:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IKColor)initWithColor:(id)a3;
- (IKColor)initWithColorMapKey:(id)a3;
- (NSArray)gradientColors;
- (NSArray)gradientPoints;
- (NSString)colorMapKey;
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)colorType;
- (int64_t)gradientDirectionType;
- (int64_t)gradientType;
- (void)setColor:(id)a3;
- (void)setColorMapKey:(id)a3;
- (void)setColorType:(int64_t)a3;
- (void)setGradientColors:(id)a3;
- (void)setGradientColors:(id)a3 andPoints:(id)a4;
- (void)setGradientDirectionType:(int64_t)a3;
- (void)setGradientType:(int64_t)a3;
@end

@implementation IKColor

+ (id)colorMap
{
  if (colorMap_onceToken != -1) {
    dispatch_once(&colorMap_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)colorMap_sCSSColorNameMap;
  return v2;
}

+ (void)registerColorNameMap:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() colorMap];
  [v4 addEntriesFromDictionary:v3];
}

void __19__IKColor_colorMap__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)colorMap_sCSSColorNameMap;
  colorMap_sCSSColorNameMap = (uint64_t)v0;

  v21 = (void *)colorMap_sCSSColorNameMap;
  v20 = (void *)MEMORY[0x1E4F1C9E8];
  v56 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v55 = [MEMORY[0x1E4F428B8] colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
  v46 = [MEMORY[0x1E4F428B8] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  v54 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v43 = [MEMORY[0x1E4F428B8] colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
  v53 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
  v39 = [MEMORY[0x1E4F428B8] colorWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];
  v52 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
  v51 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
  v50 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
  v49 = [MEMORY[0x1E4F428B8] colorWithRed:0.5 green:0.5 blue:0.0 alpha:1.0];
  v33 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
  v48 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.5 alpha:1.0];
  v47 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
  v45 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.5 blue:0.5 alpha:1.0];
  v44 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
  v42 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v41 = [MEMORY[0x1E4F428B8] systemRedColor];
  v40 = [MEMORY[0x1E4F428B8] systemGreenColor];
  v38 = [MEMORY[0x1E4F428B8] systemBlueColor];
  v37 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v36 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v35 = [MEMORY[0x1E4F428B8] systemPinkColor];
  v28 = [MEMORY[0x1E4F428B8] systemPurpleColor];
  v34 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v32 = [MEMORY[0x1E4F428B8] systemBrownColor];
  v31 = [MEMORY[0x1E4F428B8] systemTealColor];
  v30 = [MEMORY[0x1E4F428B8] systemIndigoColor];
  v29 = [MEMORY[0x1E4F428B8] labelColor];
  v27 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v26 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  v24 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
  v23 = [MEMORY[0x1E4F428B8] linkColor];
  v19 = [MEMORY[0x1E4F428B8] placeholderTextColor];
  v25 = [MEMORY[0x1E4F428B8] separatorColor];
  v18 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
  v17 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v16 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  v12 = [MEMORY[0x1E4F428B8] tertiarySystemBackgroundColor];
  v22 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  v11 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  v9 = [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
  v8 = [MEMORY[0x1E4F428B8] systemFillColor];
  v10 = [MEMORY[0x1E4F428B8] secondarySystemFillColor];
  v7 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  v2 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
  v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
  id v3 = [MEMORY[0x1E4F428B8] systemGray2Color];
  v13 = [MEMORY[0x1E4F428B8] systemGray3Color];
  v15 = [MEMORY[0x1E4F428B8] systemGray4Color];
  v14 = [MEMORY[0x1E4F428B8] systemGray5Color];
  v5 = [MEMORY[0x1E4F428B8] systemGray6Color];
  objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v56, @"black", v55, @"silver", v46, @"gray", v54, @"white", v43, @"maroon", v53, @"red", v39, @"purple", v52, @"fuchsia", v51,
    @"green",
    v50,
    @"lime",
    v49,
    @"olive",
    v33,
    @"yellow",
    v48,
    @"navy",
    v47,
    @"blue",
    v45,
    @"teal",
    v44,
    @"aqua",
    v42,
    @"transparent",
    v41,
    @"systemred",
    v40,
    @"systemgreen",
    v38,
    @"systemblue",
    v37,
    @"systemorange",
    v36,
    @"systemyellow",
    v35,
    @"systempink",
    v28,
    @"systempurple",
    v34,
    @"systemgray",
    v32,
    @"systembrown",
    v31,
    @"systemteal",
    v30,
    @"systemindigo",
    v29,
    @"label",
    v27,
    @"secondarylabel",
  id v4 = v26);
  [v21 addEntriesFromDictionary:v4];
}

- (IKColor)initWithColorMapKey:(id)a3
{
  id v4 = a3;
  v5 = [(IKColor *)self initWithColor:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    colorMapKey = v5->_colorMapKey;
    v5->_colorMapKey = (NSString *)v6;
  }
  return v5;
}

- (IKColor)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKColor;
  uint64_t v6 = [(IKColor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (void)setColorMapKey:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_colorMapKey, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    colorMapKey = self->_colorMapKey;
    self->_colorMapKey = v4;

    color = self->_color;
    self->_color = 0;
  }
}

- (void)setColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_color = &self->_color;
  if (self->_color != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_color, a3);
    colorMapKey = self->_colorMapKey;
    self->_colorMapKey = 0;

    id v5 = v8;
  }
  MEMORY[0x1F41817F8](p_color, v5);
}

- (UIColor)color
{
  if (self->_colorMapKey)
  {
    id v3 = [(id)objc_opt_class() colorMap];
    id v4 = [v3 objectForKey:self->_colorMapKey];
  }
  else
  {
    id v4 = self->_color;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(UIColor *)self->_color copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 48), self->_colorMapKey);
  *(void *)(v5 + 24) = self->_colorType;
  *(void *)(v5 + 32) = self->_gradientType;
  uint64_t v8 = [(NSArray *)self->_gradientPoints copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  *(void *)(v5 + 40) = self->_gradientDirectionType;
  uint64_t v10 = [(NSArray *)self->_gradientColors copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (void)setGradientColors:(id)a3
{
}

- (void)setGradientColors:(id)a3 andPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = [v7 count];
    if (v8 != [v6 count])
    {
      objc_super v9 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[IKColor setGradientColors:andPoints:](v9);
      }

      id v7 = 0;
    }
  }
  if (![v7 count] && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v11 = [v6 count];
    if ([v6 count])
    {
      unint64_t v12 = 0;
      double v13 = 1.0 / (double)(unint64_t)(v11 - 1);
      double v14 = 0.0;
      do
      {
        v15 = [NSNumber numberWithDouble:v14];
        [v10 addObject:v15];

        ++v12;
        double v14 = v13 + v14;
      }
      while (v12 < [v6 count]);
    }
    uint64_t v16 = [v10 copy];

    id v7 = (id)v16;
  }
  v17 = (NSArray *)[v6 copy];
  gradientColors = self->_gradientColors;
  self->_gradientColors = v17;

  v19 = (NSArray *)[v7 copy];
  gradientPoints = self->_gradientPoints;
  self->_gradientPoints = v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IKColor *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4) {
    goto LABEL_22;
  }
  if (self == v4)
  {
    char v10 = 1;
    goto LABEL_28;
  }
  int64_t colorType = self->_colorType;
  if (colorType == 3)
  {
    if (self->_gradientType == v4->_gradientType && self->_gradientDirectionType == v4->_gradientDirectionType)
    {
      uint64_t v8 = v4->_gradientColors;
      id v11 = p_isa[7];
      uint64_t v12 = [(NSArray *)v8 count];
      if (v12 == [(NSArray *)self->_gradientColors count])
      {
        uint64_t v13 = [v11 count];
        if (v13 == [(NSArray *)self->_gradientPoints count])
        {
          if (![(NSArray *)self->_gradientColors count])
          {
LABEL_17:
            if ([(NSArray *)self->_gradientPoints count])
            {
              unint64_t v20 = 0;
              do
              {
                v21 = [(NSArray *)self->_gradientPoints objectAtIndex:v20];
                v22 = [v11 objectAtIndex:v20];
                char v10 = [v21 isEqualToNumber:v22];

                if ((v10 & 1) == 0) {
                  break;
                }
                ++v20;
              }
              while ([(NSArray *)self->_gradientPoints count] > v20);
            }
            else
            {
              char v10 = 1;
            }
            goto LABEL_26;
          }
          uint64_t v14 = 0;
          while (1)
          {
            v15 = [(NSArray *)self->_gradientColors objectAtIndex:v14];
            uint64_t v16 = [(NSArray *)v8 objectAtIndex:v14];
            id v17 = v15;
            v18 = (CGColor *)[v17 CGColor];
            id v19 = v16;
            LOBYTE(v18) = CGColorEqualToColor(v18, (CGColorRef)[v19 CGColor]);

            if ((v18 & 1) == 0) {
              break;
            }
            if ([(NSArray *)self->_gradientColors count] <= ++v14) {
              goto LABEL_17;
            }
          }
        }
      }
      char v10 = 0;
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
LABEL_22:
    char v10 = 0;
    goto LABEL_28;
  }
  if (!colorType)
  {
    colorMapKey = self->_colorMapKey;
    uint64_t v8 = [(IKColor *)v4 colorMapKey];
    char v10 = [(NSString *)colorMapKey isEqualToString:v8]
       || (color = self->_color, color == p_isa[1])
       || CGColorEqualToColor(-[UIColor CGColor](color, "CGColor"), (CGColorRef)[p_isa[1] CGColor]);
    goto LABEL_27;
  }
  char v10 = colorType == v4->_colorType;
LABEL_28:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(IKColor *)self color];
  uint64_t v5 = [(IKColor *)self colorMapKey];
  int64_t v6 = [(IKColor *)self colorType];
  int64_t v7 = [(IKColor *)self gradientType];
  int64_t v8 = [(IKColor *)self gradientDirectionType];
  objc_super v9 = [(IKColor *)self gradientColors];
  char v10 = [v3 stringWithFormat:@"IKColor color: %@ colorKey: %@ colorType:%ld gradientType:%ld gradientDirectionType:%ld gradientColors:%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)colorMapKey
{
  return self->_colorMapKey;
}

- (int64_t)colorType
{
  return self->_colorType;
}

- (void)setColorType:(int64_t)a3
{
  self->_int64_t colorType = a3;
}

- (NSArray)gradientPoints
{
  return self->_gradientPoints;
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (int64_t)gradientType
{
  return self->_gradientType;
}

- (void)setGradientType:(int64_t)a3
{
  self->_gradientType = a3;
}

- (int64_t)gradientDirectionType
{
  return self->_gradientDirectionType;
}

- (void)setGradientDirectionType:(int64_t)a3
{
  self->_gradientDirectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientPoints, 0);
  objc_storeStrong((id *)&self->_colorMapKey, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)setGradientColors:(os_log_t)log andPoints:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_ERROR, "Gradient not set with consistent points", v1, 2u);
}

@end
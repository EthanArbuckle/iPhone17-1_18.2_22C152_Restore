@interface LNSnippetEnvironment
+ (BOOL)supportsSecureCoding;
- (BOOL)accessibilityDifferentiateWithoutColor;
- (BOOL)accessibilityInvertColors;
- (BOOL)accessibilityReduceMotion;
- (BOOL)accessibilityReduceTransparency;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (LNSnippetEnvironment)initWithCoder:(id)a3;
- (LNSnippetEnvironment)initWithSize:(CGSize)a3 locale:(id)a4 dynamicTypeSize:(int64_t)a5 legibilityWeight:(int64_t)a6 layoutDirection:(int64_t)a7 colorScheme:(int64_t)a8 colorSchemeContrast:(int64_t)a9 displayScale:(double)a10 displayGamut:(int64_t)a11 accessibilityDifferentiateWithoutColor:(BOOL)a12 accessibilityInvertColors:(BOOL)a13 accessibilityReduceMotion:(BOOL)a14 accessibilityReduceTransparency:(BOOL)a15;
- (NSLocale)locale;
- (double)displayScale;
- (int64_t)colorScheme;
- (int64_t)colorSchemeContrast;
- (int64_t)displayGamut;
- (int64_t)dynamicTypeSize;
- (int64_t)layoutDirection;
- (int64_t)legibilityWeight;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSnippetEnvironment

- (void).cxx_destruct
{
}

- (BOOL)accessibilityReduceTransparency
{
  return self->_accessibilityReduceTransparency;
}

- (BOOL)accessibilityReduceMotion
{
  return self->_accessibilityReduceMotion;
}

- (BOOL)accessibilityInvertColors
{
  return self->_accessibilityInvertColors;
}

- (BOOL)accessibilityDifferentiateWithoutColor
{
  return self->_accessibilityDifferentiateWithoutColor;
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)colorSchemeContrast
{
  return self->_colorSchemeContrast;
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)legibilityWeight
{
  return self->_legibilityWeight;
}

- (int64_t)dynamicTypeSize
{
  return self->_dynamicTypeSize;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  [(LNSnippetEnvironment *)self size];
  objc_msgSend(v4, "lns_valueWithCGSize:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"size"];
  v6 = [(LNSnippetEnvironment *)self locale];
  [v5 encodeObject:v6 forKey:@"locale"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment dynamicTypeSize](self, "dynamicTypeSize"), @"dynamicTypeSize");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment legibilityWeight](self, "legibilityWeight"), @"legibilityWeight");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment layoutDirection](self, "layoutDirection"), @"layoutDirection");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment colorScheme](self, "colorScheme"), @"colorScheme");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment colorSchemeContrast](self, "colorSchemeContrast"), @"colorSchemeContrast");
  [(LNSnippetEnvironment *)self displayScale];
  objc_msgSend(v5, "encodeDouble:forKey:", @"displayScale");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment displayGamut](self, "displayGamut"), @"displayGamut");
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityDifferentiateWithoutColor](self, "accessibilityDifferentiateWithoutColor"), @"accessibilityDifferentiateWithoutColor");
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityInvertColors](self, "accessibilityInvertColors"), @"accessibilityInvertColors");
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityReduceMotion](self, "accessibilityReduceMotion"), @"accessibilityReduceMotion");
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityReduceTransparency](self, "accessibilityReduceTransparency"), @"accessibilityReduceTransparency");
}

- (LNSnippetEnvironment)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lns_CGSizeValue");
    double v8 = v7;
    double v10 = v9;
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    uint64_t v25 = [v4 decodeIntegerForKey:@"dynamicTypeSize"];
    uint64_t v24 = [v4 decodeIntegerForKey:@"legibilityWeight"];
    uint64_t v23 = [v4 decodeIntegerForKey:@"layoutDirection"];
    [v4 decodeDoubleForKey:@"displayScale"];
    double v13 = v12;
    uint64_t v14 = [v4 decodeIntegerForKey:@"displayGamut"];
    uint64_t v15 = [v4 decodeIntegerForKey:@"colorScheme"];
    uint64_t v16 = [v4 decodeIntegerForKey:@"colorSchemeContrast"];
    char v17 = [v4 decodeBoolForKey:@"accessibilityDifferentiateWithoutColor"];
    char v18 = [v4 decodeBoolForKey:@"accessibilityInvertColors"];
    char v19 = [v4 decodeBoolForKey:@"accessibilityReduceMotion"];
    BYTE3(v22) = [v4 decodeBoolForKey:@"accessibilityReduceTransparency"];
    BYTE2(v22) = v19;
    BYTE1(v22) = v18;
    LOBYTE(v22) = v17;
    self = -[LNSnippetEnvironment initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:](self, "initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:", v11, v25, v24, v23, v15, v16, v8, v10, v13, v14, v22);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNSnippetEnvironment *)a3;
  id v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(LNSnippetEnvironment *)self size];
        double v8 = v7;
        [(LNSnippetEnvironment *)v6 size];
        if (v8 != v9
          || ([(LNSnippetEnvironment *)self size], double v11 = v10,
                                                          [(LNSnippetEnvironment *)v6 size],
                                                          v11 != v12))
        {
          LOBYTE(v19) = 0;
LABEL_31:

          goto LABEL_32;
        }
        double v13 = [(LNSnippetEnvironment *)self locale];
        uint64_t v14 = [(LNSnippetEnvironment *)v6 locale];
        uint64_t v15 = v13;
        uint64_t v16 = v14;
        char v17 = v16;
        if (v15 == v16)
        {
        }
        else
        {
          if (!v15 || !v16)
          {

            goto LABEL_28;
          }
          BOOL v18 = [(LNSnippetEnvironment *)v15 isEqual:v16];

          if (!v18) {
            goto LABEL_28;
          }
        }
        int64_t v20 = [(LNSnippetEnvironment *)self dynamicTypeSize];
        if (v20 == [(LNSnippetEnvironment *)v6 dynamicTypeSize])
        {
          int64_t v21 = [(LNSnippetEnvironment *)self legibilityWeight];
          if (v21 == [(LNSnippetEnvironment *)v6 legibilityWeight])
          {
            int64_t v22 = [(LNSnippetEnvironment *)self layoutDirection];
            if (v22 == [(LNSnippetEnvironment *)v6 layoutDirection])
            {
              int64_t v23 = [(LNSnippetEnvironment *)self colorScheme];
              if (v23 == [(LNSnippetEnvironment *)v6 colorScheme])
              {
                int64_t v24 = [(LNSnippetEnvironment *)self colorSchemeContrast];
                if (v24 == [(LNSnippetEnvironment *)v6 colorSchemeContrast])
                {
                  [(LNSnippetEnvironment *)self displayScale];
                  double v26 = v25;
                  [(LNSnippetEnvironment *)v6 displayScale];
                  if (v26 == v27)
                  {
                    int64_t v28 = [(LNSnippetEnvironment *)self displayGamut];
                    if (v28 == [(LNSnippetEnvironment *)v6 displayGamut])
                    {
                      BOOL v29 = [(LNSnippetEnvironment *)self accessibilityDifferentiateWithoutColor];
                      if (v29 == [(LNSnippetEnvironment *)v6 accessibilityDifferentiateWithoutColor])
                      {
                        BOOL v30 = [(LNSnippetEnvironment *)self accessibilityInvertColors];
                        if (v30 == [(LNSnippetEnvironment *)v6 accessibilityInvertColors])
                        {
                          BOOL v31 = [(LNSnippetEnvironment *)self accessibilityReduceMotion];
                          if (v31 == [(LNSnippetEnvironment *)v6 accessibilityReduceMotion])
                          {
                            BOOL v32 = [(LNSnippetEnvironment *)self accessibilityReduceTransparency];
                            BOOL v19 = v32 ^ [(LNSnippetEnvironment *)v6 accessibilityReduceTransparency] ^ 1;
LABEL_29:

                            goto LABEL_30;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_28:
        LOBYTE(v19) = 0;
        goto LABEL_29;
      }
      LOBYTE(v19) = 0;
      uint64_t v15 = v6;
      v6 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      LOBYTE(v19) = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  LOBYTE(v19) = 1;
LABEL_32:

  return v19;
}

- (LNSnippetEnvironment)initWithSize:(CGSize)a3 locale:(id)a4 dynamicTypeSize:(int64_t)a5 legibilityWeight:(int64_t)a6 layoutDirection:(int64_t)a7 colorScheme:(int64_t)a8 colorSchemeContrast:(int64_t)a9 displayScale:(double)a10 displayGamut:(int64_t)a11 accessibilityDifferentiateWithoutColor:(BOOL)a12 accessibilityInvertColors:(BOOL)a13 accessibilityReduceMotion:(BOOL)a14 accessibilityReduceTransparency:(BOOL)a15
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v25 = a4;
  v30.receiver = self;
  v30.super_class = (Class)LNSnippetEnvironment;
  double v26 = [(LNSnippetEnvironment *)&v30 init];
  double v27 = v26;
  if (v26)
  {
    v26->_size.CGFloat width = width;
    v26->_size.CGFloat height = height;
    objc_storeStrong((id *)&v26->_locale, a4);
    v27->_dynamicTypeSize = a5;
    v27->_legibilityWeight = a6;
    v27->_layoutDirection = a7;
    v27->_colorScheme = a8;
    v27->_colorSchemeContrast = a9;
    v27->_displayScale = a10;
    v27->_displayGamut = a11;
    v27->_accessibilityDifferentiateWithoutColor = a12;
    v27->_accessibilityInvertColors = a13;
    v27->_accessibilityReduceMotion = a14;
    v27->_accessibilityReduceTransparency = a15;
    int64_t v28 = v27;
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
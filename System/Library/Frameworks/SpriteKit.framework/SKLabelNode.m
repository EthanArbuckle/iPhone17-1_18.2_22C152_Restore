@interface SKLabelNode
+ (BOOL)supportsSecureCoding;
+ (SKLabelNode)labelNodeWithAttributedText:(NSAttributedString *)attributedText;
+ (SKLabelNode)labelNodeWithFontNamed:(NSString *)fontName;
+ (SKLabelNode)labelNodeWithText:(NSString *)text;
+ (id)_labelNodeWithFontNamed:(id)a3;
+ (id)_labelNodeWithFontTexture:(id)a3 fontDataString:(id)a4;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable;
- (BOOL)isEqualToNode:(id)a3;
- (CGFloat)colorBlendFactor;
- (CGFloat)fontSize;
- (CGFloat)preferredMaxLayoutWidth;
- (CGRect)frame;
- (NSAttributedString)attributedText;
- (NSInteger)numberOfLines;
- (NSLineBreakMode)lineBreakMode;
- (NSString)fontName;
- (NSString)text;
- (SKBlendMode)blendMode;
- (SKLabelHorizontalAlignmentMode)horizontalAlignmentMode;
- (SKLabelNode)init;
- (SKLabelNode)initWithCoder:(id)a3;
- (SKLabelNode)initWithFontNamed:(NSString *)fontName;
- (SKLabelVerticalAlignmentMode)verticalAlignmentMode;
- (UIColor)color;
- (UIColor)fontColor;
- (id)_getTextSprites;
- (id)attributedString;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setBlendMode:(SKBlendMode)blendMode;
- (void)setColor:(UIColor *)color;
- (void)setColorBlendFactor:(CGFloat)colorBlendFactor;
- (void)setFont:(__CTFont *)a3;
- (void)setFontColor:(UIColor *)fontColor;
- (void)setFontName:(NSString *)fontName;
- (void)setFontSize:(CGFloat)fontSize;
- (void)setHorizontalAlignmentMode:(SKLabelHorizontalAlignmentMode)horizontalAlignmentMode;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setNumberOfLines:(NSInteger)numberOfLines;
- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth;
- (void)setText:(NSString *)text;
- (void)setUIFont:(id)a3;
- (void)setVerticalAlignmentMode:(SKLabelVerticalAlignmentMode)verticalAlignmentMode;
@end

@implementation SKLabelNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_getTextSprites
{
  return *((id *)self->_skcLabelNode + 70);
}

- (void)setFont:(__CTFont *)a3
{
}

- (void)setUIFont:(id)a3
{
  id v7 = a3;
  v4 = [v7 fontName];
  [v7 pointSize];
  CTFontRef v6 = CTFontCreateWithName(v4, v5, 0);

  SKCLabelNode::setFont((SKCLabelNode *)self->_skcLabelNode, v6);
  CFRelease(v6);
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKLabelNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcLabelNode = [(SKNode *)self _backingNode];
}

- (SKLabelNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKLabelNode;
  v2 = [(SKNode *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(SKLabelNode *)v2 _initialize];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKLabelNode;
  [(SKNode *)&v22 encodeWithCoder:v4];
  objc_super v5 = [(SKLabelNode *)self fontName];
  [v4 encodeObject:v5 forKey:@"_fontName"];

  CTFontRef v6 = [(SKLabelNode *)self text];
  [v4 encodeObject:v6 forKey:@"_text"];

  id v7 = [(SKLabelNode *)self attributedText];
  [v4 encodeObject:v7 forKey:@"_attributedText"];

  [v4 encodeObject:MEMORY[0x263EFFA68] forKey:@"_textSprites"];
  [v4 encodeObject:0 forKey:@"_textSprite"];
  v8 = [(SKLabelNode *)self fontColor];
  [v8 red];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_fontColorR");

  v9 = [(SKLabelNode *)self fontColor];
  [v9 green];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_fontColorG");

  v10 = [(SKLabelNode *)self fontColor];
  [v10 blue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_fontColorB");

  v11 = [(SKLabelNode *)self fontColor];
  [v11 alpha];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_fontColorA");

  v12 = [(SKLabelNode *)self color];
  [v12 red];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_colorR");

  v13 = [(SKLabelNode *)self color];
  [v13 green];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_colorG");

  v14 = [(SKLabelNode *)self color];
  [v14 blue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_colorB");

  v15 = [(SKLabelNode *)self color];
  [v15 alpha];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_colorA");

  [(SKLabelNode *)self fontSize];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_fontSize");
  [(SKLabelNode *)self colorBlendFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_labelColorBlend");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKLabelNode blendMode](self, "blendMode"), @"_labelBlendMode");
  v16 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[SKLabelNode horizontalAlignmentMode](self, "horizontalAlignmentMode"));
  [v4 encodeObject:v16 forKey:@"_horizontalAlignmentMode"];

  v17 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[SKLabelNode verticalAlignmentMode](self, "verticalAlignmentMode"));
  [v4 encodeObject:v17 forKey:@"_verticalAlignmentMode"];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKLabelNode numberOfLines](self, "numberOfLines"));
  [v4 encodeObject:v18 forKey:@"_numberOfLines"];

  v19 = NSNumber;
  [(SKLabelNode *)self preferredMaxLayoutWidth];
  *(float *)&double v20 = v20;
  v21 = [v19 numberWithFloat:v20];
  [v4 encodeObject:v21 forKey:@"_preferredMaxLayoutWidth"];
}

- (SKLabelNode)initWithCoder:(id)a3
{
  v42[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SKLabelNode;
  objc_super v5 = [(SKNode *)&v41 initWithCoder:v4];
  if (v5)
  {
    CTFontRef v6 = (void *)MEMORY[0x263EFFA08];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    v42[3] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_textSprites"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textSprite"];
    if ([v9 count]) {
      [(SKNode *)v5 removeChildrenInArray:v9];
    }
    if (v10 && (!v9 || ([v9 containsObject:v10] & 1) == 0)) {
      [(SKNode *)v5 removeChild:v10];
    }
    [v4 decodeDoubleForKey:@"_fontSize"];
    -[SKLabelNode setFontSize:](v5, "setFontSize:");
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fontName"];
    [(SKLabelNode *)v5 setFontName:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    [(SKLabelNode *)v5 setText:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attributedText"];
    [(SKLabelNode *)v5 setAttributedText:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_horizontalAlignmentMode"];
    -[SKLabelNode setHorizontalAlignmentMode:](v5, "setHorizontalAlignmentMode:", (int)[v14 intValue]);

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_verticalAlignmentMode"];
    -[SKLabelNode setVerticalAlignmentMode:](v5, "setVerticalAlignmentMode:", (int)[(id)v15 intValue]);

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numberOfLines"];
    LOBYTE(v15) = v16 == 0;

    if ((v15 & 1) == 0)
    {
      v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numberOfLines"];
      -[SKLabelNode setNumberOfLines:](v5, "setNumberOfLines:", (int)[v17 intValue]);
    }
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredMaxLayoutWidth"];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      double v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredMaxLayoutWidth"];
      [v20 floatValue];
      [(SKLabelNode *)v5 setPreferredMaxLayoutWidth:v21];
    }
    -[SKLabelNode setBlendMode:](v5, "setBlendMode:", [v4 decodeIntegerForKey:@"_labelBlendMode"]);
    [v4 decodeDoubleForKey:@"_labelColorBlend"];
    -[SKLabelNode setColorBlendFactor:](v5, "setColorBlendFactor:");
    objc_super v22 = (void *)MEMORY[0x263F1C550];
    [v4 decodeDoubleForKey:@"_fontColorR"];
    double v24 = v23;
    [v4 decodeDoubleForKey:@"_fontColorG"];
    double v26 = v25;
    [v4 decodeDoubleForKey:@"_fontColorB"];
    double v28 = v27;
    [v4 decodeDoubleForKey:@"_fontColorA"];
    v30 = [v22 colorWithRed:v24 green:v26 blue:v28 alpha:v29];
    [(SKLabelNode *)v5 setFontColor:v30];

    v31 = (void *)MEMORY[0x263F1C550];
    [v4 decodeDoubleForKey:@"_colorR"];
    double v33 = v32;
    [v4 decodeDoubleForKey:@"_colorG"];
    double v35 = v34;
    [v4 decodeDoubleForKey:@"_colorB"];
    double v37 = v36;
    [v4 decodeDoubleForKey:@"_colorA"];
    v39 = [v31 colorWithRed:v33 green:v35 blue:v37 alpha:v38];
    [(SKLabelNode *)v5 setColor:v39];
  }
  return v5;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKLabelNode *)a3;
  if (self == v4)
  {
    BOOL v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v34.receiver = self;
      v34.super_class = (Class)SKLabelNode;
      if ([(SKNode *)&v34 isEqualToNode:v5])
      {
        CTFontRef v6 = [(SKLabelNode *)self text];
        id v7 = [(SKLabelNode *)v5 text];
        if ([v6 isEqualToString:v7])
        {
          id v8 = [(SKLabelNode *)self fontColor];
          v9 = (CGColor *)[v8 CGColor];
          id v10 = [(SKLabelNode *)v5 fontColor];
          if (CGColorEqualToColor(v9, (CGColorRef)[v10 CGColor]))
          {
            v11 = [(SKLabelNode *)self fontName];
            v12 = [(SKLabelNode *)v5 fontName];
            if ([v11 isEqualToString:v12]
              && ([(SKLabelNode *)self fontSize],
                  double v14 = v13,
                  [(SKLabelNode *)v5 fontSize],
                  float v15 = v14,
                  *(float *)&double v16 = v16,
                  (COERCE_UNSIGNED_INT(v15 - *(float *)&v16) & 0x60000000) == 0)
              && (SKLabelVerticalAlignmentMode v17 = [(SKLabelNode *)self verticalAlignmentMode],
                  v17 == [(SKLabelNode *)v5 verticalAlignmentMode])
              && (SKLabelHorizontalAlignmentMode v18 = [(SKLabelNode *)self horizontalAlignmentMode],
                  v18 == [(SKLabelNode *)v5 horizontalAlignmentMode]))
            {
              id v33 = [(SKLabelNode *)self color];
              BOOL v19 = (CGColor *)[v33 CGColor];
              id v32 = [(SKLabelNode *)v5 color];
              if (CGColorEqualToColor(v19, (CGColorRef)[v32 CGColor])
                && ([(SKLabelNode *)self colorBlendFactor],
                    double v21 = v20,
                    [(SKLabelNode *)v5 colorBlendFactor],
                    float v22 = v21,
                    *(float *)&double v23 = v23,
                    (COERCE_UNSIGNED_INT(v22 - *(float *)&v23) & 0x60000000) == 0)
                && (SKBlendMode v24 = [(SKLabelNode *)self blendMode], v24 == [(SKLabelNode *)v5 blendMode])
                && (NSInteger v25 = [(SKLabelNode *)self numberOfLines],
                    v25 == [(SKLabelNode *)v5 numberOfLines]))
              {
                [(SKLabelNode *)self preferredMaxLayoutWidth];
                double v27 = v26;
                [(SKLabelNode *)v5 preferredMaxLayoutWidth];
                float v28 = v27;
                *(float *)&double v29 = v29;
                BOOL v30 = (COERCE_UNSIGNED_INT(v28 - *(float *)&v29) & 0x60000000) == 0;
              }
              else
              {
                BOOL v30 = 0;
              }
            }
            else
            {
              BOOL v30 = 0;
            }
          }
          else
          {
            BOOL v30 = 0;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (SKLabelNode)initWithFontNamed:(NSString *)fontName
{
  id v4 = fontName;
  objc_super v5 = [(SKLabelNode *)self init];
  CTFontRef v6 = v5;
  if (v5) {
    [(SKLabelNode *)v5 setFontName:v4];
  }

  return v6;
}

+ (SKLabelNode)labelNodeWithText:(NSString *)text
{
  objc_super v3 = text;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setText:v3];

  return (SKLabelNode *)v4;
}

+ (SKLabelNode)labelNodeWithAttributedText:(NSAttributedString *)attributedText
{
  objc_super v3 = attributedText;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAttributedText:v3];

  return (SKLabelNode *)v4;
}

+ (SKLabelNode)labelNodeWithFontNamed:(NSString *)fontName
{
  objc_super v3 = fontName;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFontNamed:v3];

  return (SKLabelNode *)v4;
}

- (SKLabelVerticalAlignmentMode)verticalAlignmentMode
{
  return *((void *)self->_skcLabelNode + 82);
}

- (void)setVerticalAlignmentMode:(SKLabelVerticalAlignmentMode)verticalAlignmentMode
{
  skcLabelNode = self->_skcLabelNode;
  skcLabelNode[82] = verticalAlignmentMode;
  *((unsigned char *)skcLabelNode + 712) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (SKLabelHorizontalAlignmentMode)horizontalAlignmentMode
{
  return *((void *)self->_skcLabelNode + 81);
}

- (void)setHorizontalAlignmentMode:(SKLabelHorizontalAlignmentMode)horizontalAlignmentMode
{
  skcLabelNode = self->_skcLabelNode;
  skcLabelNode[81] = horizontalAlignmentMode;
  *((unsigned char *)skcLabelNode + 712) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (NSInteger)numberOfLines
{
  return *((int *)self->_skcLabelNode + 166);
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
}

- (NSLineBreakMode)lineBreakMode
{
  return *((void *)self->_skcLabelNode + 84);
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
}

- (CGFloat)preferredMaxLayoutWidth
{
  return *((float *)self->_skcLabelNode + 170);
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  float v3 = preferredMaxLayoutWidth;
  SKCLabelNode::setPreferredMaxLayoutWidth((SKCNode *)self->_skcLabelNode, v3);
}

- (NSString)fontName
{
  return (NSString *)*((id *)self->_skcLabelNode + 73);
}

- (void)setFontName:(NSString *)fontName
{
}

- (void)setFontSize:(CGFloat)fontSize
{
  skcLabelNode = (float *)self->_skcLabelNode;
  float v4 = fontSize;
  skcLabelNode[148] = v4;
  *((unsigned char *)skcLabelNode + 713) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (CGFloat)fontSize
{
  return *((float *)self->_skcLabelNode + 148);
}

- (void)setFontColor:(UIColor *)fontColor
{
  double v14 = fontColor;
  [(UIColor *)v14 red];
  float64_t v13 = v4;
  [(UIColor *)v14 green];
  float64_t v12 = v5;
  [(UIColor *)v14 blue];
  float64_t v11 = v6;
  [(UIColor *)v14 alpha];
  v7.f64[0] = v11;
  v7.f64[1] = v8;
  v9.f64[0] = v13;
  v9.f64[1] = v12;
  skcLabelNode = (float32x4_t *)self->_skcLabelNode;
  skcLabelNode[38] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7);
  skcLabelNode[44].i8[8] = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (UIColor)fontColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithRed:*((float *)self->_skcLabelNode + 152) green:*((float *)self->_skcLabelNode + 153) blue:*((float *)self->_skcLabelNode + 154) alpha:*((float *)self->_skcLabelNode + 155)];
}

- (void)setText:(NSString *)text
{
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)*((id *)self->_skcLabelNode + 72);
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
}

- (void)setColor:(UIColor *)color
{
  double v4 = color;
  [(UIColor *)v4 componentRGBA];
  skcLabelNode = self->_skcLabelNode;
  DWORD1(v7) = v6;
  *((void *)&v7 + 1) = __PAIR64__(v9, v8);
  long long v10 = v7;
  (*(void (**)(void *, long long *))(*(void *)skcLabelNode + 184))(skcLabelNode, &v10);
}

- (UIColor)color
{
  skcLabelNode = self->_skcLabelNode;
  LODWORD(v2) = skcLabelNode[76];
  LODWORD(v3) = skcLabelNode[77];
  LODWORD(v4) = skcLabelNode[78];
  LODWORD(v5) = skcLabelNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  skcLabelNode = self->_skcLabelNode;
  float v4 = colorBlendFactor;
  float v5 = v4;
  (*(void (**)(void *, float *))(*(void *)skcLabelNode + 192))(skcLabelNode, &v5);
}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcLabelNode + 80);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
}

- (SKBlendMode)blendMode
{
  return *((void *)self->super._skcNode + 36);
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKLabelNode *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SKLabelNode;
  id v4 = [(SKNode *)&v11 copyWithZone:a3];
  float v5 = [(SKLabelNode *)self text];
  [v4 setText:v5];

  int v6 = [(SKLabelNode *)self attributedText];
  [v4 setAttributedText:v6];

  long long v7 = [(SKLabelNode *)self fontName];
  [v4 setFontName:v7];

  unsigned int v8 = [(SKLabelNode *)self fontColor];
  [v4 setFontColor:v8];

  [(SKLabelNode *)self fontSize];
  objc_msgSend(v4, "setFontSize:");
  objc_msgSend(v4, "setHorizontalAlignmentMode:", -[SKLabelNode horizontalAlignmentMode](self, "horizontalAlignmentMode"));
  objc_msgSend(v4, "setVerticalAlignmentMode:", -[SKLabelNode verticalAlignmentMode](self, "verticalAlignmentMode"));
  unsigned int v9 = [(SKLabelNode *)self color];
  [v4 setColor:v9];

  [(SKLabelNode *)self colorBlendFactor];
  objc_msgSend(v4, "setColorBlendFactor:");
  objc_msgSend(v4, "setBlendMode:", -[SKLabelNode blendMode](self, "blendMode"));
  objc_msgSend(v4, "setNumberOfLines:", -[SKLabelNode numberOfLines](self, "numberOfLines"));
  [(SKLabelNode *)self preferredMaxLayoutWidth];
  objc_msgSend(v4, "setPreferredMaxLayoutWidth:");
  return v4;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)SKLabelNode;
  [(SKNode *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)text
{
  return (NSString *)*((id *)self->_skcLabelNode + 71);
}

- (id)attributedString
{
  return 0;
}

- (id)description
{
  double v3 = NSString;
  double v4 = [(SKNode *)self name];
  double v5 = [(SKLabelNode *)self text];
  objc_super v6 = [(SKLabelNode *)self fontName];
  [(SKNode *)self position];
  long long v7 = NSStringFromCGPoint(v11);
  unsigned int v8 = [v3 stringWithFormat:@"<SKLabelNode> name:'%@' text:'%@' fontName:'%@' position:%@", v4, v5, v6, v7];

  return v8;
}

+ (id)debugHierarchyPropertyDescriptions
{
  v32[15] = *MEMORY[0x263EF8340];
  double v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  double v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"attributedText");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSAttributedString");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeAttributedString");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"attrStr");
  BOOL v30 = Mutable;
  v32[0] = Mutable;
  double v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"color");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  double v29 = v5;
  v32[1] = v5;
  objc_super v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"colorBlendFactor");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  float v28 = v6;
  v32[2] = v6;
  long long v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"fontColor");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v7, @"propertyFormat", @"color");
  double v27 = v7;
  v32[3] = v7;
  unsigned int v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"fontName");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  unsigned int v9 = (const void *)*MEMORY[0x263F01AF0];
  if (*MEMORY[0x263F01AF0]) {
    CFDictionaryAddValue(v8, @"propertyFormat", (const void *)*MEMORY[0x263F01AF0]);
  }
  double v26 = v8;
  v32[4] = v8;
  long long v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"fontSize");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf");
  NSInteger v25 = v10;
  v32[5] = v10;
  CGPoint v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"numberOfLines");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  v32[6] = v11;
  float64_t v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v12, @"propertyName", @"preferredMaxLayoutWidth");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v12, @"propertyFormat", @"CGf");
  v32[7] = v12;
  float64_t v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v13, @"propertyName", @"text");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  if (v9) {
    CFDictionaryAddValue(v13, @"propertyFormat", v9);
  }
  v32[8] = v13;
  double v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v14, @"propertyName", @"blendMode");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v14, @"propertyFormat", @"integer");
  v32[9] = v14;
  float v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v15, @"propertyName", @"horizontalAlignmentMode");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"SKLabelHorizontalAlignmentMode");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v15, @"propertyFormat", @"integer");
  v32[10] = v15;
  double v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v16, @"propertyName", @"lineBreakMode");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"NSLineBreakMode");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v16, @"propertyFormat", @"uinteger");
  v32[11] = v16;
  SKLabelVerticalAlignmentMode v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v17, @"propertyName", @"verticalAlignmentMode");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"SKLabelVerticalAlignmentMode");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v17, @"propertyFormat", @"integer");
  v32[12] = v17;
  SKLabelHorizontalAlignmentMode v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v18, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v18, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, @"visibility", v19);
  CFRelease(v19);
  uint64_t valuePtr = 1;
  CFNumberRef v20 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, @"propertyOptions", v20);
  CFRelease(v20);
  v32[13] = v18;
  double v21 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v21, @"propertyName", @"visualRepresentationOffset");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v21, @"propertyFormat", @"CGf, CGf");
  uint64_t valuePtr = 8;
  CFNumberRef v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v21, @"visibility", v22);
  CFRelease(v22);
  v32[14] = v21;
  double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:15];

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v78 = a4;
  if ([v9 isEqualToString:@"visualRepresentation"])
  {
    Mutable = [v78 createDebugHierarchyVisualRepresentation];
    v79 = @"propertyFormat";
    uint64_t v80 = *MEMORY[0x263F01AE0];
    *a5 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    goto LABEL_101;
  }
  if ([v9 isEqualToString:@"visualRepresentationOffset"])
  {
    [v78 _untransformedBounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v78 _anchorPoint];
    double v82 = v11 + floor(v15 * v18);
    double v83 = v13 + floor(v17 * v19);
    CFNumberRef v20 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    uint64_t v21 = 0;
    char v22 = 1;
    do
    {
      char v23 = v22;
      CFNumberRef v24 = CFNumberCreate(0, kCFNumberCGFloatType, &v82 + v21);
      char v22 = 0;
      v20[v21] = v24;
      uint64_t v21 = 1;
    }
    while ((v23 & 1) != 0);
    Mutable = (id *)CFArrayCreate(0, v20, 2, MEMORY[0x263EFFF70]);
    CFRelease(*v20);
    CFRelease(v20[1]);
    free(v20);
    goto LABEL_101;
  }
  if ([v9 isEqualToString:@"color"])
  {
    id v25 = [v78 color];
    double v26 = (CGColor *)[v25 CGColor];
    if (v26)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      space = CGColorGetColorSpace(v26);
      CFStringRef value = CGColorSpaceCopyName(space);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v26);
      uint64_t v28 = NumberOfComponents << 32;
      CFIndex v29 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        BOOL v30 = CFStringCreateMutable(0, 0);
        id v72 = v25;
        CFIndex v31 = v29 - 1;
        if ((unint64_t)v29 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v29;
        }
        do
        {
          CFStringAppend(v30, @"CGf");
          if (v31) {
            CFStringAppend(v30, @", ");
          }
          --v31;
          --v32;
        }
        while (v32);
        id v25 = v72;
      }
      else
      {
        BOOL v30 = &stru_26BEEFD10;
      }
      Components = CGColorGetComponents(v26);
      v43 = (const void **)malloc_type_malloc(v28 >> 29, 0x6004044C4A2DFuLL);
      v44 = v43;
      if (v28 >= 1)
      {
        if (v29 <= 1) {
          uint64_t v45 = 1;
        }
        else {
          uint64_t v45 = v29;
        }
        v46 = (CFNumberRef *)v43;
        do
        {
          *v46++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v45;
        }
        while (v45);
      }
      CFArrayRef v47 = CFArrayCreate(0, v44, v29, MEMORY[0x263EFFF70]);
      if (v28 >= 1)
      {
        if (v29 <= 1) {
          uint64_t v48 = 1;
        }
        else {
          uint64_t v48 = v29;
        }
        v49 = v44;
        do
        {
          CFRelease(*v49++);
          --v48;
        }
        while (v48);
      }
      free(v44);
      CGColorSpaceGetModel(space);
      if (v47) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v47);
      }
      if (v30) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v30);
      }
      if (value) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", value);
      }
      if (v47) {
        CFRelease(v47);
      }
      if (value) {
        CFRelease(value);
      }
      if (!v30) {
        goto LABEL_83;
      }
      goto LABEL_82;
    }
    goto LABEL_27;
  }
  if ([v9 isEqualToString:@"fontColor"])
  {
    id v25 = [v78 fontColor];
    id v33 = (CGColor *)[v25 CGColor];
    if (v33)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      spacea = CGColorGetColorSpace(v33);
      CFStringRef valuea = CGColorSpaceCopyName(spacea);
      size_t v34 = CGColorGetNumberOfComponents(v33);
      uint64_t v35 = v34 << 32;
      CFIndex v36 = (int)v34;
      if (v34 << 32)
      {
        BOOL v30 = CFStringCreateMutable(0, 0);
        id v73 = v25;
        CFIndex v37 = v36 - 1;
        if ((unint64_t)v36 <= 1) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = v36;
        }
        do
        {
          CFStringAppend(v30, @"CGf");
          if (v37) {
            CFStringAppend(v30, @", ");
          }
          --v37;
          --v38;
        }
        while (v38);
        id v25 = v73;
      }
      else
      {
        BOOL v30 = &stru_26BEEFD10;
      }
      v54 = CGColorGetComponents(v33);
      v55 = (const void **)malloc_type_malloc(v35 >> 29, 0x6004044C4A2DFuLL);
      v56 = v55;
      if (v35 >= 1)
      {
        if (v36 <= 1) {
          uint64_t v57 = 1;
        }
        else {
          uint64_t v57 = v36;
        }
        v58 = (CFNumberRef *)v55;
        do
        {
          *v58++ = CFNumberCreate(0, kCFNumberCGFloatType, v54++);
          --v57;
        }
        while (v57);
      }
      CFArrayRef v59 = CFArrayCreate(0, v56, v36, MEMORY[0x263EFFF70]);
      if (v35 >= 1)
      {
        if (v36 <= 1) {
          uint64_t v60 = 1;
        }
        else {
          uint64_t v60 = v36;
        }
        v61 = v56;
        do
        {
          CFRelease(*v61++);
          --v60;
        }
        while (v60);
      }
      free(v56);
      CGColorSpaceGetModel(spacea);
      if (v59) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v59);
      }
      if (v30) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v30);
      }
      if (valuea) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", valuea);
      }
      if (v59) {
        CFRelease(v59);
      }
      if (valuea) {
        CFRelease(valuea);
      }
      if (!v30) {
        goto LABEL_83;
      }
LABEL_82:
      CFRelease(v30);
      goto LABEL_83;
    }
LABEL_27:
    Mutable = 0;
LABEL_83:

    goto LABEL_101;
  }
  id v39 = v78;
  id v40 = v9;
  if (![v40 length]) {
    goto LABEL_91;
  }
  NSSelectorFromString((NSString *)v40);
  if (objc_opt_respondsToSelector())
  {
    objc_super v41 = (NSString *)v40;
  }
  else
  {
    if ((unint64_t)[v40 length] < 2)
    {
      v53 = [v40 uppercaseString];
    }
    else
    {
      v50 = [v40 substringToIndex:1];
      v51 = [v50 uppercaseString];
      v52 = [v40 substringFromIndex:1];
      v53 = [v51 stringByAppendingString:v52];
    }
    v62 = [@"is" stringByAppendingString:v53];
    NSSelectorFromString(v62);
    objc_super v41 = (objc_opt_respondsToSelector() & 1) != 0 ? v62 : 0;
  }
  if (v41)
  {
    Mutable = [v39 valueForKey:v41];
  }
  else
  {
LABEL_91:
    if (Mutable)
    {
      id v63 = v39;
      v64 = (__CFString *)v40;
      if (v63)
      {
        *(double *)&v65 = [NSString stringWithFormat:@"%@", v63];
      }
      else
      {
        *(double *)&v65 = COERCE_DOUBLE(&stru_26BEEFD10);
      }
      if (v64) {
        v66 = v64;
      }
      else {
        v66 = &stru_26BEEFD10;
      }
      *(double *)&v67 = COERCE_DOUBLE(v66);
      v81[0] = @"propertyName";
      v81[1] = @"objectDescription";
      double v82 = *(double *)&v67;
      double v83 = *(double *)&v65;
      v81[2] = @"errorDescription";
      v84 = &stru_26BEEFD10;
      v68 = [NSDictionary dictionaryWithObjects:&v82 forKeys:v81 count:3];
      v69 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v68];

      id v70 = v69;
      __CFDictionary *Mutable = v70;

      objc_super v41 = 0;
      Mutable = 0;
    }
    else
    {
      objc_super v41 = 0;
    }
  }

LABEL_101:

  return Mutable;
}

+ (id)_labelNodeWithFontNamed:(id)a3
{
  id v3 = objc_alloc_init((Class)objc_opt_class());

  return v3;
}

+ (id)_labelNodeWithFontTexture:(id)a3 fontDataString:(id)a4
{
  id v4 = objc_alloc_init((Class)objc_opt_class());

  return v4;
}

@end
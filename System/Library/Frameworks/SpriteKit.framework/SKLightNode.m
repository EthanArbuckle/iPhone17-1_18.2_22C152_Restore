@interface SKLightNode
+ (BOOL)supportsSecureCoding;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)isEnabled;
- (BOOL)isEqualToNode:(id)a3;
- (CGFloat)falloff;
- (SKLightNode)init;
- (SKLightNode)initWithCoder:(id)a3;
- (UIColor)ambientColor;
- (UIColor)lightColor;
- (UIColor)shadowColor;
- (id)copyWithZone:(_NSZone *)a3;
- (uint32_t)categoryBitMask;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientColor:(UIColor *)ambientColor;
- (void)setCategoryBitMask:(uint32_t)categoryBitMask;
- (void)setEnabled:(BOOL)enabled;
- (void)setFalloff:(CGFloat)falloff;
- (void)setLightColor:(UIColor *)lightColor;
- (void)setShadowColor:(UIColor *)shadowColor;
@end

@implementation SKLightNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  self->_skcLightNode = [(SKNode *)self _backingNode];
}

- (SKLightNode)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKLightNode;
  v2 = [(SKNode *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(SKLightNode *)v2 commonInit];
    [(SKLightNode *)v3 setEnabled:1];
    v4 = [MEMORY[0x263F1C550] whiteColor];
    [(SKLightNode *)v3 setLightColor:v4];

    v5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    [(SKLightNode *)v3 setShadowColor:v5];

    v6 = [MEMORY[0x263F1C550] blackColor];
    [(SKLightNode *)v3 setAmbientColor:v6];

    [(SKLightNode *)v3 setFalloff:1.0];
    [(SKLightNode *)v3 setLightCategoryBitMask:1];
  }
  return v3;
}

- (SKLightNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SKLightNode;
  v5 = [(SKNode *)&v35 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(SKLightNode *)v5 commonInit];
    -[SKLightNode setEnabled:](v6, "setEnabled:", [v4 decodeBoolForKey:@"enabled"]);
    [v4 decodeDoubleForKey:@"lightDecay"];
    -[SKLightNode setLightDecay:](v6, "setLightDecay:");
    v7 = (void *)MEMORY[0x263F1C550];
    [v4 decodeDoubleForKey:@"lightColor.redComponent"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"lightColor.greenComponent"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"lightColor.blueComponent"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"lightColor.alphaComponent"];
    v15 = [v7 colorWithRed:v9 green:v11 blue:v13 alpha:v14];
    [(SKLightNode *)v6 setLightColor:v15];

    v16 = (void *)MEMORY[0x263F1C550];
    [v4 decodeDoubleForKey:@"ambientColor.redComponent"];
    double v18 = v17;
    [v4 decodeDoubleForKey:@"ambientColor.greenComponent"];
    double v20 = v19;
    [v4 decodeDoubleForKey:@"ambientColor.blueComponent"];
    double v22 = v21;
    [v4 decodeDoubleForKey:@"ambientColor.alphaComponent"];
    v24 = [v16 colorWithRed:v18 green:v20 blue:v22 alpha:v23];
    [(SKLightNode *)v6 setAmbientColor:v24];

    v25 = (void *)MEMORY[0x263F1C550];
    [v4 decodeDoubleForKey:@"shadowColor.redComponent"];
    double v27 = v26;
    [v4 decodeDoubleForKey:@"shadowColor.greenComponent"];
    double v29 = v28;
    [v4 decodeDoubleForKey:@"shadowColor.blueComponent"];
    double v31 = v30;
    [v4 decodeDoubleForKey:@"shadowColor.alphaComponent"];
    v33 = [v25 colorWithRed:v27 green:v29 blue:v31 alpha:v32];
    [(SKLightNode *)v6 setShadowColor:v33];

    -[SKLightNode setLightCategoryBitMask:](v6, "setLightCategoryBitMask:", [v4 decodeInt32ForKey:@"lightCategoryBitMask"]);
  }

  return v6;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKLightNode *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v23.receiver = self;
      v23.super_class = (Class)SKLightNode;
      if ([(SKNode *)&v23 isEqualToNode:v5]
        && (BOOL v6 = [(SKLightNode *)self isEnabled], v6 == [(SKLightNode *)v5 isEnabled])
        && (uint32_t v7 = [(SKLightNode *)self categoryBitMask],
            v7 == [(SKLightNode *)v5 categoryBitMask]))
      {
        id v8 = [(SKLightNode *)self ambientColor];
        double v9 = (CGColor *)[v8 CGColor];
        id v10 = [(SKLightNode *)v5 ambientColor];
        if (CGColorEqualToColor(v9, (CGColorRef)[v10 CGColor]))
        {
          id v11 = [(SKLightNode *)self lightColor];
          double v12 = (CGColor *)[v11 CGColor];
          id v13 = [(SKLightNode *)v5 lightColor];
          if (CGColorEqualToColor(v12, (CGColorRef)[v13 CGColor]))
          {
            id v14 = [(SKLightNode *)self shadowColor];
            v15 = (CGColor *)[v14 CGColor];
            id v16 = [(SKLightNode *)v5 shadowColor];
            if (CGColorEqualToColor(v15, (CGColorRef)[v16 CGColor]))
            {
              [(SKLightNode *)self falloff];
              double v18 = v17;
              [(SKLightNode *)v5 falloff];
              float v19 = v18;
              *(float *)&double v20 = v20;
              BOOL v21 = (COERCE_UNSIGNED_INT(v19 - *(float *)&v20) & 0x60000000) == 0;
            }
            else
            {
              BOOL v21 = 0;
            }
          }
          else
          {
            BOOL v21 = 0;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SKLightNode;
  [(SKNode *)&v32 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[SKLightNode isEnabled](self, "isEnabled"), @"enabled");
  [(SKLightNode *)self lightDecay];
  objc_msgSend(v4, "encodeDouble:forKey:", @"lightDecay");
  v5 = [(SKLightNode *)self lightColor];
  [v5 componentRGBA];
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  float v13 = v12;

  [v4 encodeDouble:@"lightColor.redComponent" forKey:v7];
  [v4 encodeDouble:@"lightColor.greenComponent" forKey:v9];
  [v4 encodeDouble:@"lightColor.blueComponent" forKey:v11];
  [v4 encodeDouble:@"lightColor.alphaComponent" forKey:v13];
  id v14 = [(SKLightNode *)self ambientColor];
  [v14 componentRGBA];
  float v16 = v15;
  float v18 = v17;
  float v20 = v19;
  float v22 = v21;

  [v4 encodeDouble:@"ambientColor.redComponent" forKey:v16];
  [v4 encodeDouble:@"ambientColor.greenComponent" forKey:v18];
  [v4 encodeDouble:@"ambientColor.blueComponent" forKey:v20];
  [v4 encodeDouble:@"ambientColor.alphaComponent" forKey:v22];
  objc_super v23 = [(SKLightNode *)self shadowColor];
  [v23 componentRGBA];
  float v25 = v24;
  float v27 = v26;
  float v29 = v28;
  float v31 = v30;

  [v4 encodeDouble:@"shadowColor.redComponent" forKey:v25];
  [v4 encodeDouble:@"shadowColor.greenComponent" forKey:v27];
  [v4 encodeDouble:@"shadowColor.blueComponent" forKey:v29];
  [v4 encodeDouble:@"shadowColor.alphaComponent" forKey:v31];
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKLightNode lightCategoryBitMask](self, "lightCategoryBitMask"), @"lightCategoryBitMask");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKLightNode;
  id v4 = [(SKNode *)&v9 copyWithZone:a3];
  objc_msgSend(v4, "setLightCategoryBitMask:", -[SKLightNode lightCategoryBitMask](self, "lightCategoryBitMask"));
  v5 = [(SKLightNode *)self lightColor];
  [v4 setLightColor:v5];

  float v6 = [(SKLightNode *)self ambientColor];
  [v4 setAmbientColor:v6];

  float v7 = [(SKLightNode *)self shadowColor];
  [v4 setShadowColor:v7];

  objc_msgSend(v4, "setEnabled:", -[SKLightNode isEnabled](self, "isEnabled"));
  [(SKLightNode *)self lightDecay];
  objc_msgSend(v4, "setLightDecay:");
  return v4;
}

- (CGFloat)falloff
{
  return *((float *)self->_skcLightNode + 160);
}

- (void)setFalloff:(CGFloat)falloff
{
  float v3 = falloff;
  *((float *)self->_skcLightNode + 160) = v3;
}

- (uint32_t)categoryBitMask
{
  return *((_DWORD *)self->_skcLightNode + 161);
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
  *((_DWORD *)self->_skcLightNode + 161) = categoryBitMask;
}

- (UIColor)lightColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithVectorRGBA:*((double *)self->_skcLightNode + 74)];
}

- (void)setLightColor:(UIColor *)lightColor
{
  id v4 = lightColor;
  skcLightNode = self->_skcLightNode;
  float v7 = v4;
  [(UIColor *)v4 vectorRGBA];
  skcLightNode[37] = v6;
}

- (UIColor)ambientColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithVectorRGBA:*((double *)self->_skcLightNode + 76)];
}

- (void)setAmbientColor:(UIColor *)ambientColor
{
  id v4 = ambientColor;
  skcLightNode = self->_skcLightNode;
  float v7 = v4;
  [(UIColor *)v4 vectorRGBA];
  skcLightNode[38] = v6;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
  id v4 = shadowColor;
  skcLightNode = self->_skcLightNode;
  float v7 = v4;
  [(UIColor *)v4 vectorRGBA];
  skcLightNode[39] = v6;
}

- (UIColor)shadowColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithVectorRGBA:*((double *)self->_skcLightNode + 78)];
}

- (void)setEnabled:(BOOL)enabled
{
  *((unsigned char *)self->_skcLightNode + 584) = enabled;
}

- (BOOL)isEnabled
{
  return *((unsigned char *)self->_skcLightNode + 584);
}

+ (id)debugHierarchyPropertyDescriptions
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  float v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"ambientColor");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"color");
  v12[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"categoryBitMask");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v5, @"propertyFormat", @"ul");
  v12[1] = v5;
  long long v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"enabled");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v12[2] = v6;
  float v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"falloff");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v7, @"propertyFormat", @"CGf");
  v12[3] = v7;
  float v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"lightColor");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v8, @"propertyFormat", @"color");
  v12[4] = v8;
  objc_super v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"shadowColor");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v9, @"propertyFormat", @"color");
  v12[5] = v9;
  float v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];

  return v10;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  v82[3] = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v79 = a4;
  if ([v78 isEqualToString:@"ambientColor"])
  {
    id v8 = [v79 ambientColor];
    objc_super v9 = (CGColor *)[v8 CGColor];
    if (v9)
    {
      theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      ColorSpace = CGColorGetColorSpace(v9);
      CFStringRef v11 = CGColorSpaceCopyName(ColorSpace);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v9);
      uint64_t v13 = NumberOfComponents << 32;
      CFIndex v14 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        Mutable = CFStringCreateMutable(0, 0);
        id v76 = v8;
        CFIndex v16 = v14 - 1;
        if ((unint64_t)v14 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v14;
        }
        do
        {
          CFStringAppend(Mutable, @"CGf");
          if (v16) {
            CFStringAppend(Mutable, @", ");
          }
          --v16;
          --v17;
        }
        while (v17);
        id v8 = v76;
      }
      else
      {
        Mutable = &stru_26BEEFD10;
      }
      Components = CGColorGetComponents(v9);
      v39 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
      v40 = v39;
      if (v13 >= 1)
      {
        if (v14 <= 1) {
          uint64_t v41 = 1;
        }
        else {
          uint64_t v41 = v14;
        }
        v42 = (CFNumberRef *)v39;
        do
        {
          *v42++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v41;
        }
        while (v41);
      }
      CFArrayRef v43 = CFArrayCreate(0, v40, v14, MEMORY[0x263EFFF70]);
      if (v13 >= 1)
      {
        if (v14 <= 1) {
          uint64_t v44 = 1;
        }
        else {
          uint64_t v44 = v14;
        }
        v45 = v40;
        do
        {
          CFRelease(*v45++);
          --v44;
        }
        while (v44);
      }
      free(v40);
      CGColorSpaceGetModel(ColorSpace);
      if (v43) {
        CFDictionaryAddValue(theDict, @"componentValues", v43);
      }
      if (Mutable) {
        CFDictionaryAddValue(theDict, @"componentValuesFormat", Mutable);
      }
      if (v11) {
        CFDictionaryAddValue(theDict, @"colorSpaceName", v11);
      }
      if (v43) {
        CFRelease(v43);
      }
      if (v11) {
        CFRelease(v11);
      }
      if (!Mutable) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    goto LABEL_31;
  }
  if (![v78 isEqualToString:@"lightColor"])
  {
    if ([v78 isEqualToString:@"shadowColor"])
    {
      id v8 = [v79 shadowColor];
      float v27 = (CGColor *)[v8 CGColor];
      if (v27)
      {
        theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
        float v28 = CGColorGetColorSpace(v27);
        CFStringRef v29 = CGColorSpaceCopyName(v28);
        size_t v30 = CGColorGetNumberOfComponents(v27);
        uint64_t v31 = v30 << 32;
        CFIndex v32 = (int)v30;
        if (v30 << 32)
        {
          Mutable = CFStringCreateMutable(0, 0);
          CFIndex v33 = v32 - 1;
          if ((unint64_t)v32 <= 1) {
            uint64_t v34 = 1;
          }
          else {
            uint64_t v34 = v32;
          }
          do
          {
            CFStringAppend(Mutable, @"CGf");
            if (v33) {
              CFStringAppend(Mutable, @", ");
            }
            --v33;
            --v34;
          }
          while (v34);
        }
        else
        {
          Mutable = &stru_26BEEFD10;
        }
        v58 = CGColorGetComponents(v27);
        v59 = (const void **)malloc_type_malloc(v31 >> 29, 0x6004044C4A2DFuLL);
        v60 = v59;
        if (v31 >= 1)
        {
          if (v32 <= 1) {
            uint64_t v61 = 1;
          }
          else {
            uint64_t v61 = v32;
          }
          v62 = (CFNumberRef *)v59;
          do
          {
            *v62++ = CFNumberCreate(0, kCFNumberCGFloatType, v58++);
            --v61;
          }
          while (v61);
        }
        CFArrayRef v63 = CFArrayCreate(0, v60, v32, MEMORY[0x263EFFF70]);
        if (v31 >= 1)
        {
          if (v32 <= 1) {
            uint64_t v64 = 1;
          }
          else {
            uint64_t v64 = v32;
          }
          v65 = v60;
          do
          {
            CFRelease(*v65++);
            --v64;
          }
          while (v64);
        }
        free(v60);
        CGColorSpaceGetModel(v28);
        if (v63) {
          CFDictionaryAddValue(theDict, @"componentValues", v63);
        }
        if (Mutable) {
          CFDictionaryAddValue(theDict, @"componentValuesFormat", Mutable);
        }
        if (v29) {
          CFDictionaryAddValue(theDict, @"colorSpaceName", v29);
        }
        if (v63) {
          CFRelease(v63);
        }
        if (v29) {
          CFRelease(v29);
        }
        if (!Mutable) {
          goto LABEL_61;
        }
LABEL_60:
        CFRelease(Mutable);
        goto LABEL_61;
      }
LABEL_31:
      theDict = 0;
LABEL_61:

      goto LABEL_131;
    }
    id v35 = v79;
    v36 = (NSString *)v78;
    if ([(NSString *)v36 length])
    {
      NSSelectorFromString(v36);
      if (objc_opt_respondsToSelector())
      {
        v37 = v36;
        if (v37)
        {
LABEL_35:
          theDict = [v35 valueForKey:v37];
LABEL_130:

          goto LABEL_131;
        }
      }
      else
      {
        if ([(NSString *)v36 length] < 2)
        {
          v57 = [(NSString *)v36 uppercaseString];
        }
        else
        {
          v54 = [(NSString *)v36 substringToIndex:1];
          v55 = [v54 uppercaseString];
          v56 = [(NSString *)v36 substringFromIndex:1];
          v57 = [v55 stringByAppendingString:v56];
        }
        v66 = [@"is" stringByAppendingString:v57];
        NSSelectorFromString(v66);
        if (objc_opt_respondsToSelector()) {
          v37 = v66;
        }
        else {
          v37 = 0;
        }

        if (v37) {
          goto LABEL_35;
        }
      }
    }
    if (a6)
    {
      id v67 = v35;
      v68 = v36;
      if (v67)
      {
        v69 = [NSString stringWithFormat:@"%@", v67];
      }
      else
      {
        v69 = &stru_26BEEFD10;
      }
      if (v68) {
        v70 = v68;
      }
      else {
        v70 = &stru_26BEEFD10;
      }
      v71 = v70;
      v81[0] = @"propertyName";
      v81[1] = @"objectDescription";
      v82[0] = v71;
      v82[1] = v69;
      v81[2] = @"errorDescription";
      v82[2] = &stru_26BEEFD10;
      v72 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];
      v73 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v72];

      id v74 = v73;
      *a6 = v74;
    }
    v37 = 0;
    theDict = 0;
    goto LABEL_130;
  }
  id v77 = [v79 lightColor];
  float v18 = (CGColor *)[v77 CGColor];
  if (v18)
  {
    theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    float v19 = CGColorGetColorSpace(v18);
    CFStringRef v20 = CGColorSpaceCopyName(v19);
    size_t v21 = CGColorGetNumberOfComponents(v18);
    uint64_t v22 = v21 << 32;
    CFIndex v23 = (int)v21;
    if (v21 << 32)
    {
      float v24 = CFStringCreateMutable(0, 0);
      CFIndex v25 = v23 - 1;
      if ((unint64_t)v23 <= 1) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = v23;
      }
      do
      {
        CFStringAppend(v24, @"CGf");
        if (v25) {
          CFStringAppend(v24, @", ");
        }
        --v25;
        --v26;
      }
      while (v26);
    }
    else
    {
      float v24 = &stru_26BEEFD10;
    }
    v46 = CGColorGetComponents(v18);
    v47 = (const void **)malloc_type_malloc(v22 >> 29, 0x6004044C4A2DFuLL);
    v48 = v47;
    if (v22 >= 1)
    {
      if (v23 <= 1) {
        uint64_t v49 = 1;
      }
      else {
        uint64_t v49 = v23;
      }
      v50 = (CFNumberRef *)v47;
      do
      {
        *v50++ = CFNumberCreate(0, kCFNumberCGFloatType, v46++);
        --v49;
      }
      while (v49);
    }
    CFArrayRef v51 = CFArrayCreate(0, v48, v23, MEMORY[0x263EFFF70]);
    if (v22 >= 1)
    {
      if (v23 <= 1) {
        uint64_t v52 = 1;
      }
      else {
        uint64_t v52 = v23;
      }
      v53 = v48;
      do
      {
        CFRelease(*v53++);
        --v52;
      }
      while (v52);
    }
    free(v48);
    CGColorSpaceGetModel(v19);
    if (v51) {
      CFDictionaryAddValue(theDict, @"componentValues", v51);
    }
    if (v24) {
      CFDictionaryAddValue(theDict, @"componentValuesFormat", v24);
    }
    if (v20) {
      CFDictionaryAddValue(theDict, @"colorSpaceName", v20);
    }
    if (v51) {
      CFRelease(v51);
    }
    if (v20) {
      CFRelease(v20);
    }
    if (v24) {
      CFRelease(v24);
    }
  }
  else
  {
    theDict = 0;
  }

LABEL_131:

  return theDict;
}

@end
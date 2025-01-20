@interface CLKFullColorSymbolImageProvider
+ (BOOL)supportsSecureCoding;
+ (id)_symbolImageProviderWithSystemName:(id)a3;
+ (id)symbolImageProviderWithSystemName:(id)a3;
- (BOOL)_isHierarchicalSymbol;
- (BOOL)ignoreHierarchicalLayers;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersFilterOverTransition;
- (CLKFullColorSymbolImageProvider)initWithCoder:(id)a3;
- (CLKFullColorSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (CLKFullColorSymbolImageProvider)initWithSystemName:(id)a3;
- (NSNumber)overridePointSize;
- (NSNumber)pointSize;
- (NSString)systemName;
- (UIColor)secondaryTintColor;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)_initWithSystemName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createSymbolImage;
- (int64_t)weight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 cornerRadius:(double)a7;
- (void)setIgnoreHierarchicalLayers:(BOOL)a3;
- (void)setOverridePointSize:(id)a3;
- (void)setSecondaryTintColor:(id)a3;
@end

@implementation CLKFullColorSymbolImageProvider

- (CLKFullColorSymbolImageProvider)initWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F827E8] systemImageNamed:v4];
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;

  v7 = self->_symbolImage;
  v13.receiver = self;
  v13.super_class = (Class)CLKFullColorSymbolImageProvider;
  v8 = [(CLKFullColorImageProvider *)&v13 initWithFullColorImage:v7];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    systemName = v8->_systemName;
    v8->_systemName = (NSString *)v9;

    v11 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:v4];
    [(CLKFullColorImageProvider *)v8 setTintedImageProvider:v11];
  }
  return v8;
}

- (id)_initWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F827E8] _systemImageNamed:v4];
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;

  v7 = self->_symbolImage;
  v13.receiver = self;
  v13.super_class = (Class)CLKFullColorSymbolImageProvider;
  v8 = [(CLKFullColorImageProvider *)&v13 initWithFullColorImage:v7];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    privateSystemName = v8->_privateSystemName;
    v8->_privateSystemName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_systemName, v8->_privateSystemName);
    v11 = +[CLKSymbolImageProvider _symbolImageProviderWithSystemName:v4];
    [(CLKFullColorImageProvider *)v8 setTintedImageProvider:v11];
  }
  return v8;
}

- (BOOL)_isHierarchicalSymbol
{
  return [(UIImage *)self->_symbolImage _isHierarchicalColorSymbolImage];
}

+ (id)symbolImageProviderWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSystemName:v4];

  return v5;
}

+ (id)_symbolImageProviderWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithSystemName:v4];

  return v5;
}

- (BOOL)prefersFilterOverTransition
{
  return 0;
}

- (void)setOverridePointSize:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_overridePointSize, a3);
  v5 = [(CLKFullColorImageProvider *)self tintedImageProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    [v7 setOverridePointSize:v8];
  }
}

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 cornerRadius:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  id v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLKFullColorSymbolImageProvider;
  -[CLKFullColorImageProvider finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:](&v20, sel_finalizeWithMaxSDKSize_maxDeviceSize_cornerRadius_, v11, v10, width, height, a7);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
    v16 = [(CLKFullColorSymbolImageProvider *)self createSymbolImage];
    [(CLKFullColorImageProvider *)self setImage:v16];

    v17 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v19 = [(CLKFullColorImageProvider *)self tintedImageProvider];
      objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:cornerRadius:", v15, a4, v11, v10, width, height, a7);
    }
  }
}

- (void)setIgnoreHierarchicalLayers:(BOOL)a3
{
  BOOL v3 = a3;
  self->_ignoreHierarchicalLayers = a3;
  v5 = [(CLKFullColorImageProvider *)self tintedImageProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    [v7 setIgnoreHierarchicalLayers:v3];
  }
}

- (id)createSymbolImage
{
  v25[2] = *MEMORY[0x263EF8340];
  if (self->_overridePointSize)
  {
    BOOL v3 = +[CLKDevice currentDevice];
    id v4 = +[CLKDeviceMetrics metricsWithDevice:v3 identitySizeClass:2];

    [(NSNumber *)self->_overridePointSize doubleValue];
    objc_msgSend(v4, "scaledValue:");
    v5 = objc_msgSend(MEMORY[0x263F82818], "configurationWithPointSize:weight:", self->_weight);
  }
  else
  {
    pointSize = self->_pointSize;
    id v7 = (void *)MEMORY[0x263F82818];
    if (pointSize)
    {
      [(NSNumber *)pointSize doubleValue];
      objc_msgSend(v7, "configurationWithPointSize:weight:", self->_weight);
    }
    else
    {
      [MEMORY[0x263F82818] configurationWithWeight:self->_weight];
    v5 = };
  }
  id v8 = [(CLKFullColorImageProvider *)self tintColor];
  uint64_t v9 = v8;
  if (v8 && !self->_ignoreHierarchicalLayers)
  {
    BOOL v16 = [(CLKFullColorSymbolImageProvider *)self _isHierarchicalSymbol];

    if (v16)
    {
      secondaryTintColor = self->_secondaryTintColor;
      if (secondaryTintColor)
      {
        v18 = secondaryTintColor;
      }
      else
      {
        v18 = [MEMORY[0x263F825C8] whiteColor];
      }
      v19 = v18;
      objc_super v20 = (void *)MEMORY[0x263F82818];
      v25[0] = v18;
      v21 = [(CLKFullColorImageProvider *)self tintColor];
      v25[1] = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      v23 = [v20 _configurationWithHierarchicalColors:v22];

      uint64_t v24 = [v5 configurationByApplyingConfiguration:v23];

      v5 = (void *)v24;
    }
  }
  else
  {
  }
  privateSystemName = self->_privateSystemName;
  if (privateSystemName) {
    [MEMORY[0x263F827E8] _systemImageNamed:privateSystemName withConfiguration:v5];
  }
  else {
  double v11 = [MEMORY[0x263F827E8] systemImageNamed:self->_systemName withConfiguration:v5];
  }
  v12 = [(CLKFullColorImageProvider *)self tintColor];

  if (!v12)
  {
    uint64_t v13 = [v11 imageWithRenderingMode:1];

    double v11 = (void *)v13;
  }
  v14 = [(CLKFullColorImageProvider *)self accessibilityLabel];
  [v11 setAccessibilityLabel:v14];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKFullColorSymbolImageProvider;
  id v4 = a3;
  [(CLKFullColorImageProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemName, @"SystemName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_privateSystemName forKey:@"PrivateSystemName"];
  [v4 encodeObject:self->_pointSize forKey:@"PointSize"];
  [v4 encodeObject:self->_overridePointSize forKey:@"OverridePointSize"];
  [v4 encodeInteger:self->_weight forKey:@"Weight"];
  [v4 encodeObject:self->_secondaryTintColor forKey:@"SecondaryTintColor"];
  [v4 encodeBool:self->_ignoreHierarchicalLayers forKey:@"IgnoreHierarchicalLayers"];
}

- (CLKFullColorSymbolImageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKFullColorSymbolImageProvider;
  objc_super v5 = [(CLKFullColorImageProvider *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SystemName"];
    systemName = v5->_systemName;
    v5->_systemName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivateSystemName"];
    privateSystemName = v5->_privateSystemName;
    v5->_privateSystemName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PointSize"];
    pointSize = v5->_pointSize;
    v5->_pointSize = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OverridePointSize"];
    overridePointSize = v5->_overridePointSize;
    v5->_overridePointSize = (NSNumber *)v12;

    v5->_weight = [v4 decodeIntegerForKey:@"Weight"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SecondaryTintColor"];
    secondaryTintColor = v5->_secondaryTintColor;
    v5->_secondaryTintColor = (UIColor *)v14;

    v5->_ignoreHierarchicalLayers = [v4 decodeBoolForKey:@"IgnoreHierarchicalLayers"];
    if (v5->_privateSystemName) {
      objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:");
    }
    else {
    BOOL v16 = [MEMORY[0x263F827E8] systemImageNamed:v5->_systemName];
    }
    objc_storeStrong((id *)&v5->_symbolImage, v16);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)CLKFullColorSymbolImageProvider,
        [(CLKFullColorImageProvider *)&v7 isEqual:v4])
    && CLKEqualObjects(self->_systemName, v4[14])
    && CLKEqualObjects(self->_privateSystemName, v4[10])
    && CLKEqualObjects(self->_pointSize, v4[15])
    && CLKEqualObjects(self->_overridePointSize, v4[13])
    && (void *)self->_weight == v4[16]
    && CLKEqualObjects(self->_secondaryTintColor, v4[17])
    && self->_ignoreHierarchicalLayers == *((unsigned __int8 *)v4 + 96);

  return v5;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)CLKFullColorSymbolImageProvider;
  id v3 = [(CLKFullColorImageProvider *)&v12 hash];
  NSUInteger v4 = (NSUInteger)v3 + 2 * [(NSString *)self->_systemName hash];
  NSUInteger v5 = v4 + 4 * [(NSNumber *)self->_pointSize hash];
  uint64_t v6 = v5 + 8 * [(NSNumber *)self->_overridePointSize hash] + 16 * self->_weight;
  NSUInteger v7 = v6 + 32 * [(NSString *)self->_privateSystemName hash];
  NSUInteger v8 = v7 + ([(UIColor *)self->_secondaryTintColor hash] << 6);
  uint64_t v9 = [NSNumber numberWithBool:self->_ignoreHierarchicalLayers];
  unint64_t v10 = v8 + ([v9 hash] << 7);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CLKFullColorSymbolImageProvider;
  NSUInteger v5 = -[CLKFullColorImageProvider copyWithZone:](&v17, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_systemName copyWithZone:a3];
  NSUInteger v7 = (void *)v5[14];
  v5[14] = v6;

  uint64_t v8 = [(NSString *)self->_privateSystemName copyWithZone:a3];
  uint64_t v9 = (void *)v5[10];
  v5[10] = v8;

  uint64_t v10 = [(NSNumber *)self->_pointSize copyWithZone:a3];
  double v11 = (void *)v5[15];
  v5[15] = v10;

  uint64_t v12 = [(NSNumber *)self->_overridePointSize copyWithZone:a3];
  uint64_t v13 = (void *)v5[13];
  v5[13] = v12;

  v5[16] = self->_weight;
  uint64_t v14 = [(UIColor *)self->_secondaryTintColor copyWithZone:a3];
  id v15 = (void *)v5[17];
  v5[17] = v14;

  *((unsigned char *)v5 + 96) = self->_ignoreHierarchicalLayers;
  return v5;
}

- (CLKFullColorSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CLKFullColorSymbolImageProvider;
  NSUInteger v7 = [(CLKFullColorImageProvider *)&v25 initWithJSONObjectRepresentation:v6 bundle:a4];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"SystemName"];
    systemName = v7->_systemName;
    v7->_systemName = (NSString *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"PrivateSystemName"];
    privateSystemName = v7->_privateSystemName;
    v7->_privateSystemName = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"PointSize"];
    pointSize = v7->_pointSize;
    v7->_pointSize = (NSNumber *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:@"OverridePointSize"];
    overridePointSize = v7->_overridePointSize;
    v7->_overridePointSize = (NSNumber *)v14;

    BOOL v16 = [v6 objectForKeyedSubscript:@"Weight"];
    v7->_weight = [v16 integerValue];

    objc_super v17 = [v6 objectForKeyedSubscript:@"SecondaryTintColor"];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F825C8]);
      v19 = [v6 objectForKeyedSubscript:@"SecondaryTintColor"];
      uint64_t v20 = [v18 initWithJSONObjectRepresentation:v19];
      secondaryTintColor = v7->_secondaryTintColor;
      v7->_secondaryTintColor = (UIColor *)v20;
    }
    v22 = [v6 objectForKeyedSubscript:@"IgnoreHierarchicalLayers"];
    v7->_ignoreHierarchicalLayers = [v22 BOOLValue];

    if (v7->_privateSystemName) {
      objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:");
    }
    else {
    v23 = [MEMORY[0x263F827E8] systemImageNamed:v7->_systemName];
    }
    objc_storeStrong((id *)&v7->_symbolImage, v23);
  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLKFullColorSymbolImageProvider;
  NSUInteger v4 = [(CLKFullColorImageProvider *)&v15 JSONObjectRepresentationWritingResourcesToBundlePath:a3];
  NSUInteger v5 = (void *)[v4 mutableCopy];

  systemName = self->_systemName;
  if (systemName) {
    [v5 setObject:systemName forKeyedSubscript:@"SystemName"];
  }
  privateSystemName = self->_privateSystemName;
  if (privateSystemName) {
    [v5 setObject:privateSystemName forKeyedSubscript:@"PrivateSystemName"];
  }
  pointSize = self->_pointSize;
  if (pointSize) {
    [v5 setObject:pointSize forKeyedSubscript:@"PointSize"];
  }
  overridePointSize = self->_overridePointSize;
  if (overridePointSize) {
    [v5 setObject:overridePointSize forKeyedSubscript:@"OverridePointSize"];
  }
  uint64_t v10 = [NSNumber numberWithInteger:self->_weight];
  [v5 setObject:v10 forKeyedSubscript:@"Weight"];

  secondaryTintColor = self->_secondaryTintColor;
  if (secondaryTintColor)
  {
    uint64_t v12 = [(UIColor *)secondaryTintColor JSONObjectRepresentation];
    [v5 setObject:v12 forKeyedSubscript:@"SecondaryTintColor"];
  }
  uint64_t v13 = [NSNumber numberWithBool:self->_ignoreHierarchicalLayers];
  [v5 setObject:v13 forKeyedSubscript:@"IgnoreHierarchicalLayers"];

  return v5;
}

- (NSNumber)overridePointSize
{
  return self->_overridePointSize;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSNumber)pointSize
{
  return self->_pointSize;
}

- (int64_t)weight
{
  return self->_weight;
}

- (BOOL)ignoreHierarchicalLayers
{
  return self->_ignoreHierarchicalLayers;
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (void)setSecondaryTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_pointSize, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_overridePointSize, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);

  objc_storeStrong((id *)&self->_privateSystemName, 0);
}

@end
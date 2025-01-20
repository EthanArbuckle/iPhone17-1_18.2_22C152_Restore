@interface CLKSymbolImageProvider
+ (BOOL)supportsSecureCoding;
+ (id)_symbolImageProviderWithSystemName:(id)a3;
+ (id)symbolImageProviderWithSystemName:(id)a3;
- (BOOL)ignoreHierarchicalLayers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTwoPiece;
- (CLKSymbolImageProvider)initWithCoder:(id)a3;
- (CLKSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (CLKSymbolImageProvider)initWithSystemName:(id)a3;
- (NSNumber)overridePointSize;
- (NSNumber)pointSize;
- (NSString)systemName;
- (UIColor)secondaryTintColor;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)_configuration;
- (id)_createSymbolImageWithConfiguration:(id)a3;
- (id)_createSymbolImageWithForeground:(id)a3 background:(id)a4;
- (id)_initWithSystemName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createSymbolImage;
- (id)createSymbolImageForType:(int64_t)a3 color:(id)a4;
- (int64_t)weight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 cornerRadius:(double)a7;
- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 maskToCircle:(BOOL)a7;
- (void)setIgnoreHierarchicalLayers:(BOOL)a3;
- (void)setOverridePointSize:(id)a3;
- (void)setSecondaryTintColor:(id)a3;
@end

@implementation CLKSymbolImageProvider

- (CLKSymbolImageProvider)initWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F827E8] systemImageNamed:v4];
  if (!v5)
  {
    v6 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CLKSymbolImageProvider initWithSystemName:]((uint64_t)v4, v6);
    }
  }
  self->_hierarchicalSymbol = [v5 _isHierarchicalColorSymbolImage];
  v11.receiver = self;
  v11.super_class = (Class)CLKSymbolImageProvider;
  v7 = [(CLKImageProvider *)&v11 initWithOnePieceImage:v5];
  if (v7)
  {
    uint64_t v8 = [v4 copy];
    systemName = v7->_systemName;
    v7->_systemName = (NSString *)v8;
  }
  return v7;
}

- (id)_initWithSystemName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F827E8] _systemImageNamed:v4];
  if (!v5)
  {
    v6 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CLKSymbolImageProvider _initWithSystemName:]((uint64_t)v4, v6);
    }
  }
  self->_hierarchicalSymbol = [v5 _isHierarchicalColorSymbolImage];
  v11.receiver = self;
  v11.super_class = (Class)CLKSymbolImageProvider;
  v7 = [(CLKImageProvider *)&v11 initWithOnePieceImage:v5];
  if (v7)
  {
    uint64_t v8 = [v4 copy];
    privateSystemName = v7->_privateSystemName;
    v7->_privateSystemName = (NSString *)v8;

    objc_storeStrong((id *)&v7->_systemName, v7->_privateSystemName);
  }

  return v7;
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

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 maskToCircle:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  id v15 = a3;
  if (!self->_finalized)
  {
    v16 = [(CLKSymbolImageProvider *)self createSymbolImage];
    [(CLKImageProvider *)self setOnePieceImage:v16];

    if ([(CLKSymbolImageProvider *)self isTwoPiece])
    {
      v17 = [MEMORY[0x263F825C8] whiteColor];
      v18 = [(CLKSymbolImageProvider *)self createSymbolImageForType:3 color:v17];
      [(CLKImageProvider *)self setTwoPieceImageBackground:v18];

      v19 = [MEMORY[0x263F825C8] whiteColor];
      v20 = [(CLKSymbolImageProvider *)self createSymbolImageForType:2 color:v19];
      [(CLKImageProvider *)self setTwoPieceImageForeground:v20];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CLKSymbolImageProvider;
  -[CLKImageProvider finalizeWithMaxSDKSize:maxDeviceSize:maskToCircle:](&v21, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, v7, v11, v10, width, height);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
  }
}

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 cornerRadius:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  id v15 = a3;
  if (!self->_finalized)
  {
    v16 = [(CLKSymbolImageProvider *)self createSymbolImage];
    [(CLKImageProvider *)self setOnePieceImage:v16];

    if ([(CLKSymbolImageProvider *)self isTwoPiece])
    {
      v17 = [MEMORY[0x263F825C8] whiteColor];
      v18 = [(CLKSymbolImageProvider *)self createSymbolImageForType:3 color:v17];
      [(CLKImageProvider *)self setTwoPieceImageBackground:v18];

      v19 = [MEMORY[0x263F825C8] whiteColor];
      v20 = [(CLKSymbolImageProvider *)self createSymbolImageForType:2 color:v19];
      [(CLKImageProvider *)self setTwoPieceImageForeground:v20];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CLKSymbolImageProvider;
  -[CLKImageProvider finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:](&v21, sel_finalizeWithMaxSDKSize_maxDeviceSize_cornerRadius_, v11, v10, width, height, a7);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
  }
}

- (BOOL)isTwoPiece
{
  return self->_hierarchicalSymbol && !self->_ignoreHierarchicalLayers;
}

- (id)_configuration
{
  if (self->_overridePointSize)
  {
    v3 = +[CLKDevice currentDevice];
    id v4 = +[CLKDeviceMetrics metricsWithDevice:v3 identitySizeClass:2];

    [(NSNumber *)self->_overridePointSize doubleValue];
    objc_msgSend(v4, "scaledValue:");
    v5 = objc_msgSend(MEMORY[0x263F82818], "configurationWithPointSize:weight:", self->_weight);
  }
  else
  {
    pointSize = self->_pointSize;
    BOOL v7 = (void *)MEMORY[0x263F82818];
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

  return v5;
}

- (id)_createSymbolImageWithConfiguration:(id)a3
{
  privateSystemName = self->_privateSystemName;
  if (privateSystemName) {
    [MEMORY[0x263F827E8] _systemImageNamed:privateSystemName withConfiguration:a3];
  }
  else {
  v6 = [MEMORY[0x263F827E8] systemImageNamed:self->_systemName withConfiguration:a3];
  }
  BOOL v7 = [(CLKImageProvider *)self accessibilityLabel];
  [v6 setAccessibilityLabel:v7];

  return v6;
}

- (id)_createSymbolImageWithForeground:(id)a3 background:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CLKSymbolImageProvider *)self _configuration];
  v9 = (void *)MEMORY[0x263F82818];
  v16[0] = v7;
  v16[1] = v6;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  double v11 = [v9 configurationWithPaletteColors:v10];

  v12 = [v8 configurationByApplyingConfiguration:v11];

  v13 = [(CLKSymbolImageProvider *)self _createSymbolImageWithConfiguration:v12];
  [v13 size];
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v13, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v14 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return v14;
}

- (id)createSymbolImage
{
  v3 = [(CLKSymbolImageProvider *)self _configuration];
  id v4 = [(CLKSymbolImageProvider *)self _createSymbolImageWithConfiguration:v3];

  return v4;
}

- (id)createSymbolImageForType:(int64_t)a3 color:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
    case 1:
      self = [(CLKSymbolImageProvider *)self createSymbolImage];
      break;
    case 2:
      id v7 = [MEMORY[0x263F825C8] clearColor];
      uint64_t v8 = self;
      id v9 = v6;
      id v10 = v7;
      goto LABEL_5;
    case 3:
      id v7 = [MEMORY[0x263F825C8] clearColor];
      uint64_t v8 = self;
      id v9 = v7;
      id v10 = v6;
LABEL_5:
      self = [(CLKSymbolImageProvider *)v8 _createSymbolImageWithForeground:v9 background:v10];

      break;
    default:
      break;
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKSymbolImageProvider;
  id v4 = a3;
  [(CLKImageProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemName, @"SystemName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_privateSystemName forKey:@"PrivateSystemName"];
  [v4 encodeObject:self->_pointSize forKey:@"PointSize"];
  [v4 encodeObject:self->_overridePointSize forKey:@"OverridePointSize"];
  [v4 encodeInteger:self->_weight forKey:@"Weight"];
  [v4 encodeObject:self->_secondaryTintColor forKey:@"SecondaryTintColor"];
  [v4 encodeBool:self->_ignoreHierarchicalLayers forKey:@"IgnoreHierarchicalLayers"];
  [v4 encodeBool:self->_hierarchicalSymbol forKey:@"HierarchicalSymbol"];
}

- (CLKSymbolImageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLKSymbolImageProvider;
  objc_super v5 = [(CLKImageProvider *)&v17 initWithCoder:v4];
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
    v5->_hierarchicalSymbol = [v4 decodeBoolForKey:@"HierarchicalSymbol"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)CLKSymbolImageProvider,
        [(CLKImageProvider *)&v7 isEqual:v4])
    && CLKEqualObjects(self->_systemName, v4[16])
    && CLKEqualObjects(self->_privateSystemName, v4[13])
    && CLKEqualObjects(self->_pointSize, v4[17])
    && CLKEqualObjects(self->_overridePointSize, v4[15])
    && (void *)self->_weight == v4[18]
    && CLKEqualObjects(self->_secondaryTintColor, v4[19])
    && self->_ignoreHierarchicalLayers == *((unsigned __int8 *)v4 + 113);

  return v5;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)CLKSymbolImageProvider;
  id v3 = [(CLKImageProvider *)&v12 hash];
  NSUInteger v4 = (NSUInteger)v3 + 2 * [(NSString *)self->_systemName hash];
  NSUInteger v5 = v4 + 4 * [(NSNumber *)self->_pointSize hash];
  uint64_t v6 = v5 + 8 * [(NSNumber *)self->_overridePointSize hash] + 16 * self->_weight;
  NSUInteger v7 = v6 + 32 * [(NSString *)self->_privateSystemName hash];
  NSUInteger v8 = v7 + ([(UIColor *)self->_secondaryTintColor hash] << 6);
  id v9 = [NSNumber numberWithBool:self->_ignoreHierarchicalLayers];
  unint64_t v10 = v8 + ([v9 hash] << 7);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CLKSymbolImageProvider;
  NSUInteger v5 = -[CLKImageProvider copyWithZone:](&v17, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_systemName copyWithZone:a3];
  NSUInteger v7 = (void *)v5[16];
  v5[16] = v6;

  uint64_t v8 = [(NSString *)self->_privateSystemName copyWithZone:a3];
  id v9 = (void *)v5[13];
  v5[13] = v8;

  uint64_t v10 = [(NSNumber *)self->_pointSize copyWithZone:a3];
  double v11 = (void *)v5[17];
  v5[17] = v10;

  uint64_t v12 = [(NSNumber *)self->_overridePointSize copyWithZone:a3];
  v13 = (void *)v5[15];
  v5[15] = v12;

  v5[18] = self->_weight;
  uint64_t v14 = [(UIColor *)self->_secondaryTintColor copyWithZone:a3];
  id v15 = (void *)v5[19];
  v5[19] = v14;

  *((unsigned char *)v5 + 113) = self->_ignoreHierarchicalLayers;
  *((unsigned char *)v5 + 112) = self->_hierarchicalSymbol;
  return v5;
}

- (CLKSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CLKSymbolImageProvider;
  NSUInteger v7 = [(CLKImageProvider *)&v25 initWithJSONObjectRepresentation:v6 bundle:a4];
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

    v16 = [v6 objectForKeyedSubscript:@"Weight"];
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

    v23 = [v6 objectForKeyedSubscript:@"HierarchicalSymbol"];
    v7->_hierarchicalSymbol = [v23 BOOLValue];
  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CLKSymbolImageProvider;
  NSUInteger v4 = [(CLKImageProvider *)&v16 JSONObjectRepresentationWritingResourcesToBundlePath:a3];
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
  v13 = [NSNumber numberWithBool:self->_ignoreHierarchicalLayers];
  [v5 setObject:v13 forKeyedSubscript:@"IgnoreHierarchicalLayers"];

  uint64_t v14 = [NSNumber numberWithBool:self->_hierarchicalSymbol];
  [v5 setObject:v14 forKeyedSubscript:@"HierarchicalSymbol"];

  return v5;
}

- (NSNumber)overridePointSize
{
  return self->_overridePointSize;
}

- (void)setOverridePointSize:(id)a3
{
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

- (void)setIgnoreHierarchicalLayers:(BOOL)a3
{
  self->_ignoreHierarchicalLayers = a3;
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

  objc_storeStrong((id *)&self->_privateSystemName, 0);
}

- (void)initWithSystemName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Attempted to create symbol image provider with invalid symbol \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithSystemName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Attempted to create private symbol image provider with invalid symbol \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end
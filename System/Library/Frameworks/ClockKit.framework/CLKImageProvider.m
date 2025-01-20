@interface CLKImageProvider
+ (BOOL)supportsSecureCoding;
+ (CLKImageProvider)imageProviderWithImageViewCreationHandler:(id)a3;
+ (CLKImageProvider)imageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
+ (CLKImageProvider)imageProviderWithLayerMaskImage:(id)a3;
+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage;
+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground;
+ (CLKImageProvider)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegroundAccentImageTinted;
- (BOOL)useOnePieceAsLayerMask;
- (BOOL)validate;
- (CGSize)maxSize;
- (CLKImageProvider)initWithCoder:(id)a3;
- (CLKImageProvider)initWithForegroundAccentImage:(id)a3;
- (CLKImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage;
- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground;
- (NSString)accessibilityLabel;
- (UIColor)foregroundAccentImageColor;
- (UIColor)tintColor;
- (UIImage)foregroundAccentImage;
- (UIImage)onePieceImage;
- (UIImage)twoPieceImageBackground;
- (UIImage)twoPieceImageForeground;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageViewCreationHandler;
- (id)initPrivate;
- (unint64_t)hash;
- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andCornerRadius:(double)a4;
- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andMaskToCircle:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5;
- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 maskToCircle:(BOOL)a5;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setForegroundAccentImage:(id)a3;
- (void)setForegroundAccentImageColor:(id)a3;
- (void)setForegroundAccentImageTinted:(BOOL)a3;
- (void)setImageViewCreationHandler:(id)a3;
- (void)setOnePieceImage:(UIImage *)onePieceImage;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTwoPieceImageBackground:(UIImage *)twoPieceImageBackground;
- (void)setTwoPieceImageForeground:(UIImage *)twoPieceImageForeground;
- (void)setUseOnePieceAsLayerMask:(BOOL)a3;
- (void)validate;
@end

@implementation CLKImageProvider

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)CLKImageProvider;
  id result = [(CLKImageProvider *)&v3 init];
  if (result) {
    *((unsigned char *)result + 10) = 1;
  }
  return result;
}

+ (CLKImageProvider)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKImageProvider;
  return (CLKImageProvider *)objc_msgSendSuper2(&v3, "new");
}

- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage
{
  return [(CLKImageProvider *)self initWithOnePieceImage:onePieceImage twoPieceImageBackground:0 twoPieceImageForeground:0];
}

- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  v8 = onePieceImage;
  v9 = twoPieceImageBackground;
  v10 = twoPieceImageForeground;
  v11 = [(CLKImageProvider *)self initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKImageProvider *)v11 setOnePieceImage:v8];
    [(CLKImageProvider *)v12 setTwoPieceImageBackground:v9];
    [(CLKImageProvider *)v12 setTwoPieceImageForeground:v10];
  }

  return v12;
}

- (CLKImageProvider)initWithForegroundAccentImage:(id)a3
{
  id v4 = a3;
  v5 = [(CLKImageProvider *)self initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKImageProvider *)v5 setForegroundAccentImage:v4];
  }

  return v6;
}

+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage
{
  return (CLKImageProvider *)[a1 imageProviderWithOnePieceImage:onePieceImage twoPieceImageBackground:0 twoPieceImageForeground:0];
}

+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  v8 = twoPieceImageForeground;
  v9 = twoPieceImageBackground;
  v10 = onePieceImage;
  v11 = (void *)[objc_alloc((Class)a1) initWithOnePieceImage:v10 twoPieceImageBackground:v9 twoPieceImageForeground:v8];

  return (CLKImageProvider *)v11;
}

+ (CLKImageProvider)imageProviderWithImageViewCreationHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initPrivate];
  [v5 setImageViewCreationHandler:v4];

  return (CLKImageProvider *)v5;
}

+ (CLKImageProvider)imageProviderWithLayerMaskImage:(id)a3
{
  objc_super v3 = [a1 imageProviderWithOnePieceImage:a3];
  [v3 setUseOnePieceAsLayerMask:1];

  return (CLKImageProvider *)v3;
}

- (BOOL)validate
{
  if (self->_imageViewCreationHandler) {
    return 1;
  }
  if (!self->_onePieceImage)
  {
    v5 = CLKLoggingObjectForDomain(10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(CLKImageProvider *)(uint64_t)self validate];
    }
    goto LABEL_13;
  }
  twoPieceImageForeground = self->_twoPieceImageForeground;
  if (!self->_twoPieceImageBackground)
  {
    if (twoPieceImageForeground)
    {
      v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CLKImageProvider validate]();
      }
      goto LABEL_13;
    }
    return 1;
  }
  if (twoPieceImageForeground) {
    return 1;
  }
  v5 = CLKLoggingObjectForDomain(10);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[CLKImageProvider validate]();
  }
LABEL_13:

  return 0;
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 maskToCircle:(BOOL)a5
{
  if (!self->_finalized)
  {
    self->_maxSize = a4;
    -[CLKImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:andMaskToCircle:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:andMaskToCircle:", a5, a3.width, a3.height);
    self->_finalized = 1;
  }
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  if (!self->_finalized)
  {
    self->_maxSize = a4;
    -[CLKImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:andCornerRadius:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:andCornerRadius:", a3.width, a3.height, a5);
    self->_finalized = 1;
  }
}

- (void)setOnePieceImage:(UIImage *)onePieceImage
{
  v6 = onePieceImage;
  if (([(UIImage *)v6 isEqual:self->_onePieceImage] & 1) == 0)
  {
    id v4 = [(UIImage *)v6 _imageThatSuppressesAccessibilityHairlineThickening];
    v5 = self->_onePieceImage;
    self->_onePieceImage = v4;
  }
}

- (void)setTwoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  v6 = twoPieceImageForeground;
  if (([(UIImage *)v6 isEqual:self->_twoPieceImageForeground] & 1) == 0)
  {
    id v4 = [(UIImage *)v6 _imageThatSuppressesAccessibilityHairlineThickening];
    v5 = self->_twoPieceImageForeground;
    self->_twoPieceImageForeground = v4;
  }
}

- (void)setTwoPieceImageBackground:(UIImage *)twoPieceImageBackground
{
  v6 = twoPieceImageBackground;
  if (([(UIImage *)v6 isEqual:self->_twoPieceImageBackground] & 1) == 0)
  {
    id v4 = [(UIImage *)v6 _imageThatSuppressesAccessibilityHairlineThickening];
    v5 = self->_twoPieceImageBackground;
    self->_twoPieceImageBackground = v4;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  onePieceImage = self->_onePieceImage;
  id v5 = a3;
  [v5 encodeObject:onePieceImage forKey:@"OnePieceImage"];
  [v5 encodeObject:self->_twoPieceImageBackground forKey:@"TwoPieceImageBackground"];
  [v5 encodeObject:self->_twoPieceImageForeground forKey:@"TwoPieceImageForeground"];
  [v5 encodeObject:self->_tintColor forKey:@"TintColor"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"AccessibilityLabel"];
  [v5 encodeObject:self->_foregroundAccentImage forKey:@"ForegroundAccentImageKey"];
  [v5 encodeBool:self->_foregroundAccentImageTinted forKey:@"ForegroundAccentImageTintedKey"];
  [v5 encodeBool:self->_finalized forKey:@"Finalized"];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"MaxSize", self->_maxSize.width, self->_maxSize.height);
  [v5 encodeBool:self->_useOnePieceAsLayerMask forKey:@"UseOnePieceAsLayerMask"];
}

- (CLKImageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKImageProvider *)self initPrivate];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OnePieceImage"];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    onePieceImage = v5->_onePieceImage;
    v5->_onePieceImage = (UIImage *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TwoPieceImageBackground"];
    uint64_t v10 = [v9 _imageThatSuppressesAccessibilityHairlineThickening];
    twoPieceImageBackground = v5->_twoPieceImageBackground;
    v5->_twoPieceImageBackground = (UIImage *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TwoPieceImageForeground"];
    uint64_t v13 = [v12 _imageThatSuppressesAccessibilityHairlineThickening];
    twoPieceImageForeground = v5->_twoPieceImageForeground;
    v5->_twoPieceImageForeground = (UIImage *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessibilityLabel"];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ForegroundAccentImageKey"];
    foregroundAccentImage = v5->_foregroundAccentImage;
    v5->_foregroundAccentImage = (UIImage *)v19;

    v5->_foregroundAccentImageTinted = [v4 decodeBoolForKey:@"ForegroundAccentImageTintedKey"];
    v5->_finalized = [v4 decodeBoolForKey:@"Finalized"];
    if ([v4 containsValueForKey:@"MaxSize"])
    {
      [v4 decodeCGSizeForKey:@"MaxSize"];
      v5->_maxSize.width = v21;
      v5->_maxSize.height = v22;
    }
    v5->_useOnePieceAsLayerMask = [v4 decodeBoolForKey:@"UseOnePieceAsLayerMask"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    onePieceImage = self->_onePieceImage;
    v6 = [v4 onePieceImage];
    if (CLKEqualObjects(onePieceImage, v6))
    {
      twoPieceImageBackground = self->_twoPieceImageBackground;
      v8 = [v4 twoPieceImageBackground];
      if (CLKEqualObjects(twoPieceImageBackground, v8))
      {
        twoPieceImageForeground = self->_twoPieceImageForeground;
        uint64_t v10 = [v4 twoPieceImageForeground];
        if (CLKEqualObjects(twoPieceImageForeground, v10))
        {
          tintColor = self->_tintColor;
          v12 = [v4 tintColor];
          if (CLKEqualObjects(tintColor, v12))
          {
            foregroundAccentImage = self->_foregroundAccentImage;
            v14 = [v4 foregroundAccentImage];
            if (CLKEqualObjects(foregroundAccentImage, v14)
              && (int foregroundAccentImageTinted = self->_foregroundAccentImageTinted,
                  foregroundAccentImageTinted == [v4 isForegroundAccentImageTinted]))
            {
              accessibilityLabel = self->_accessibilityLabel;
              uint64_t v17 = [v4 accessibilityLabel];
              if (CLKEqualObjects(accessibilityLabel, v17))
              {
                int useOnePieceAsLayerMask = self->_useOnePieceAsLayerMask;
                BOOL v19 = useOnePieceAsLayerMask == [v4 useOnePieceAsLayerMask];
              }
              else
              {
                BOOL v19 = 0;
              }
            }
            else
            {
              BOOL v19 = 0;
            }
          }
          else
          {
            BOOL v19 = 0;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  LOBYTE(v2) = self->_foregroundAccentImageTinted;
  double v4 = (double)(unint64_t)[(UIImage *)self->_foregroundAccentImage hash] * 10000000.0
     + (double)v2 * 100000000.0;
  double v5 = v4 + (double)(unint64_t)[(UIImage *)self->_onePieceImage hash] * 1000000.0;
  double v6 = v5 + (double)(unint64_t)[(UIImage *)self->_twoPieceImageBackground hash] * 100000.0;
  double v7 = v6 + (double)(unint64_t)[(UIImage *)self->_twoPieceImageForeground hash] * 10000.0;
  double v8 = v7 + (double)(unint64_t)[(UIColor *)self->_tintColor hash] * 1000.0;
  unint64_t v9 = [(NSString *)self->_accessibilityLabel hash];
  unint64_t v10 = 0x4059000000000000;
  LOBYTE(v10) = self->_useOnePieceAsLayerMask;
  return (unint64_t)(v8 + (double)v9 * 100.0 + (double)v10 * 10.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    [v4 setOnePieceImage:self->_onePieceImage];
    [v4 setTwoPieceImageBackground:self->_twoPieceImageBackground];
    [v4 setTwoPieceImageForeground:self->_twoPieceImageForeground];
    [v4 setTintColor:self->_tintColor];
    [v4 setAccessibilityLabel:self->_accessibilityLabel];
    [v4 setImageViewCreationHandler:self->_imageViewCreationHandler];
    [v4 setForegroundAccentImage:self->_foregroundAccentImage];
    [v4 setForegroundAccentImageTinted:self->_foregroundAccentImageTinted];
    [v4 setUseOnePieceAsLayerMask:self->_useOnePieceAsLayerMask];
    return v4;
  }
}

+ (CLKImageProvider)imageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (imageProviderWithJSONObjectRepresentation_bundle__onceToken != -1) {
    dispatch_once(&imageProviderWithJSONObjectRepresentation_bundle__onceToken, &__block_literal_global_3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v5 format];
  }
  uint64_t v7 = objc_opt_class();
  double v8 = [v5 objectForKeyedSubscript:@"class"];
  unint64_t v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  Class v10 = NSClassFromString(v8);
  if (!v10
    || (v11 = v10,
        ([(id)imageProviderWithJSONObjectRepresentation_bundle__allowedClasses containsObject:v10] & 1) == 0))
  {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"invalid CLKFullColorImageProvider subclass: %@", v9 format];
LABEL_9:
    v11 = (objc_class *)v7;
  }
  v12 = (void *)[[v11 alloc] initWithJSONObjectRepresentation:v5 bundle:v6];

  return (CLKImageProvider *)v12;
}

void __69__CLKImageProvider_imageProviderWithJSONObjectRepresentation_bundle___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)imageProviderWithJSONObjectRepresentation_bundle__allowedClasses;
  imageProviderWithJSONObjectRepresentation_bundle__allowedClasses = v2;
}

- (CLKImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CLKImageProvider *)self initPrivate];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v6 format];
    }
    unint64_t v9 = [v6 objectForKeyedSubscript:@"onePieceImage"];
    Class v10 = [MEMORY[0x263F827E8] imageWithJSONObjectRepresentation:v9 bundle:v7];
    uint64_t v11 = [v10 _imageThatSuppressesAccessibilityHairlineThickening];
    onePieceImage = v8->_onePieceImage;
    v8->_onePieceImage = (UIImage *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"twoPieceImageBackground"];
    uint64_t v14 = [v6 objectForKeyedSubscript:@"twoPieceImageForeground"];
    uint64_t v15 = (void *)v14;
    if (v13 && v14)
    {
      v16 = [MEMORY[0x263F827E8] imageWithJSONObjectRepresentation:v13 bundle:v7];
      uint64_t v17 = [v16 _imageThatSuppressesAccessibilityHairlineThickening];
      twoPieceImageBackground = v8->_twoPieceImageBackground;
      v8->_twoPieceImageBackground = (UIImage *)v17;

      BOOL v19 = [MEMORY[0x263F827E8] imageWithJSONObjectRepresentation:v15 bundle:v7];
      uint64_t v20 = [v19 _imageThatSuppressesAccessibilityHairlineThickening];
      twoPieceImageForeground = v8->_twoPieceImageForeground;
      v8->_twoPieceImageForeground = (UIImage *)v20;
    }
    CGFloat v22 = [v6 objectForKeyedSubscript:@"tintColor"];
    if (v22)
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x263F825C8]) initWithJSONObjectRepresentation:v22];
      tintColor = v8->_tintColor;
      v8->_tintColor = (UIColor *)v23;
    }
    v25 = [v6 objectForKeyedSubscript:@"accessibilityLabel"];
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"accessibilityLabel", v25 format];
      }
      objc_storeStrong((id *)&v8->_accessibilityLabel, v25);
    }
  }
  return v8;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(UIImage *)self->_onePieceImage JSONObjectRepresentationWritingResourcesToBundlePath:v4];
  [v5 setObject:v6 forKeyedSubscript:@"onePieceImage"];

  twoPieceImageBackground = self->_twoPieceImageBackground;
  if (twoPieceImageBackground && self->_twoPieceImageForeground)
  {
    double v8 = [(UIImage *)twoPieceImageBackground JSONObjectRepresentationWritingResourcesToBundlePath:v4];
    [v5 setObject:v8 forKeyedSubscript:@"twoPieceImageBackground"];

    unint64_t v9 = [(UIImage *)self->_twoPieceImageForeground JSONObjectRepresentationWritingResourcesToBundlePath:v4];
    [v5 setObject:v9 forKeyedSubscript:@"twoPieceImageForeground"];
  }
  [v5 setObject:self->_accessibilityLabel forKeyedSubscript:@"accessibilityLabel"];
  Class v10 = [(UIColor *)self->_tintColor JSONObjectRepresentation];
  [v5 setObject:v10 forKeyedSubscript:@"tintColor"];

  uint64_t v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  [v5 setObject:v12 forKeyedSubscript:@"class"];

  return v5;
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andMaskToCircle:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self->_onePieceImage size];
  double v9 = v8;
  double v11 = v10;
  [(UIImage *)self->_twoPieceImageBackground size];
  double v13 = v12;
  double v15 = v14;
  [(UIImage *)self->_twoPieceImageForeground size];
  double v18 = 1.0;
  if (v13 > width) {
    double v18 = fmin(width / v13, 1.0);
  }
  if (v16 > width)
  {
    double v19 = width / v16;
    if (v18 > v19) {
      double v18 = v19;
    }
  }
  if (v15 > height && v18 > height / v15) {
    double v18 = height / v15;
  }
  if (v17 > height && v18 > height / v17) {
    double v18 = height / v17;
  }
  BOOL v20 = v9 <= width && v11 <= height;
  double v21 = 1.0;
  if (!v20)
  {
    if (width / v9 <= height / v11) {
      double v21 = width / v9;
    }
    else {
      double v21 = height / v11;
    }
  }
  BOOL v22 = CLKSizeEqualsSize(self->_maxSize.width, self->_maxSize.height, width, height);
  int v23 = !v22;
  if (v18 < 1.0 || v21 < 1.0 || v23)
  {
    double v24 = 1.0;
    if (!v22)
    {
      if (self->_maxSize.width / width <= self->_maxSize.height / height) {
        double v24 = self->_maxSize.width / width;
      }
      else {
        double v24 = self->_maxSize.height / height;
      }
    }
    v25 = +[CLKTreatedImageCache sharedInstance];
    if (v18 < 1.0) {
      int v26 = 1;
    }
    else {
      int v26 = v23;
    }
    id v35 = v25;
    if (v26 == 1)
    {
      double v27 = fmin(v18, 1.0);
      v28 = [v25 imageForRawImage:self->_twoPieceImageBackground scale:v4 sdkDeviceScale:v27 maskMode:v24];
      twoPieceImageBackground = self->_twoPieceImageBackground;
      self->_twoPieceImageBackground = v28;

      v30 = [v35 imageForRawImage:self->_twoPieceImageForeground scale:v4 sdkDeviceScale:v27 maskMode:v24];
      twoPieceImageForeground = self->_twoPieceImageForeground;
      self->_twoPieceImageForeground = v30;

      v25 = v35;
    }
    if (v21 < 1.0) {
      int v32 = 1;
    }
    else {
      int v32 = v23;
    }
    if (v32 == 1)
    {
      objc_msgSend(v35, "imageForRawImage:scale:sdkDeviceScale:maskMode:", self->_onePieceImage, v4, fmin(v21, 1.0), v24);
      v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
      onePieceImage = self->_onePieceImage;
      self->_onePieceImage = v33;

      v25 = v35;
    }
  }
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andCornerRadius:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v14 = +[CLKTreatedImageCache sharedInstance];
  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_onePieceImage, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  double v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  onePieceImage = self->_onePieceImage;
  self->_onePieceImage = v8;

  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_twoPieceImageBackground, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  double v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  twoPieceImageBackground = self->_twoPieceImageBackground;
  self->_twoPieceImageBackground = v10;

  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_twoPieceImageForeground, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  double v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  twoPieceImageForeground = self->_twoPieceImageForeground;
  self->_twoPieceImageForeground = v12;
}

- (UIImage)onePieceImage
{
  return self->_onePieceImage;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
}

- (UIImage)twoPieceImageBackground
{
  return self->_twoPieceImageBackground;
}

- (UIImage)twoPieceImageForeground
{
  return self->_twoPieceImageForeground;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)imageViewCreationHandler
{
  return self->_imageViewCreationHandler;
}

- (void)setImageViewCreationHandler:(id)a3
{
}

- (BOOL)useOnePieceAsLayerMask
{
  return self->_useOnePieceAsLayerMask;
}

- (void)setUseOnePieceAsLayerMask:(BOOL)a3
{
  self->_int useOnePieceAsLayerMask = a3;
}

- (UIImage)foregroundAccentImage
{
  return self->_foregroundAccentImage;
}

- (void)setForegroundAccentImage:(id)a3
{
}

- (UIColor)foregroundAccentImageColor
{
  return self->_foregroundAccentImageColor;
}

- (void)setForegroundAccentImageColor:(id)a3
{
}

- (BOOL)isForegroundAccentImageTinted
{
  return self->_foregroundAccentImageTinted;
}

- (void)setForegroundAccentImageTinted:(BOOL)a3
{
  self->_int foregroundAccentImageTinted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundAccentImageColor, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImage, 0);
  objc_storeStrong(&self->_imageViewCreationHandler, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_twoPieceImageForeground, 0);
  objc_storeStrong((id *)&self->_twoPieceImageBackground, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_onePieceImage, 0);
}

- (void)validate
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_0_2(&dword_21C599000, v2, v3, "Property '%@' is not set on %@. Two-piece images require both 'twoPieceImageBackground' and 'twoPieceImageForeground' to be set.", v4, v5, v6, v7, 2u);
}

@end
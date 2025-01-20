@interface CLKFullColorImageProvider
+ (BOOL)supportsSecureCoding;
+ (CLKFullColorImageProvider)fullColorImageProviderWithImageViewClass:(Class)a3;
+ (CLKFullColorImageProvider)fullColorImageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
+ (CLKFullColorImageProvider)new;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5;
+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersFilterOverTransition;
- (BOOL)tritium_isTritiumInactiveFullColorImageProvider;
- (BOOL)validate;
- (CLKFullColorImageProvider)initWithCoder:(id)a3;
- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image;
- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider;
- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4;
- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4;
- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5;
- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5;
- (CLKFullColorImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (CLKImageProvider)tintedImageProvider;
- (Class)ImageViewClass;
- (NSDictionary)metadata;
- (NSString)accessibilityLabel;
- (UIColor)tintColor;
- (UIImage)image;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrivate;
- (int64_t)monochromeFilterType;
- (unint64_t)hash;
- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setImage:(UIImage *)image;
- (void)setMetadata:(id)a3;
- (void)setMonochromeFilterType:(int64_t)a3;
- (void)setPrefersFilterOverTransition:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTintedImageProvider:(CLKImageProvider *)tintedImageProvider;
- (void)validate;
@end

@implementation CLKFullColorImageProvider

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)CLKFullColorImageProvider;
  id result = [(CLKFullColorImageProvider *)&v3 init];
  if (result)
  {
    *((void *)result + 8) = 0;
    *((unsigned char *)result + 16) = 1;
  }
  return result;
}

+ (CLKFullColorImageProvider)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKFullColorImageProvider;
  return (CLKFullColorImageProvider *)objc_msgSendSuper2(&v3, "new");
}

- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image
{
  return [(CLKFullColorImageProvider *)self initWithFullColorImage:image monochromeFilterType:0 applyScalingAndCircularMasking:1];
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image
{
  return (CLKFullColorImageProvider *)[a1 providerWithFullColorImage:image monochromeFilterType:0 applyScalingAndCircularMasking:1];
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4
{
  return [(CLKFullColorImageProvider *)self initWithFullColorImage:a3 monochromeFilterType:a4 applyScalingAndCircularMasking:1];
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4
{
  return (CLKFullColorImageProvider *)[a1 providerWithFullColorImage:a3 monochromeFilterType:a4 applyScalingAndCircularMasking:1];
}

- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  return [(CLKFullColorImageProvider *)self initWithFullColorImage:image tintedImageProvider:tintedImageProvider applyScalingAndCircularMasking:1];
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  return (CLKFullColorImageProvider *)[a1 providerWithFullColorImage:image tintedImageProvider:tintedImageProvider applyScalingAndCircularMasking:1];
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4
{
  return [(CLKFullColorImageProvider *)self initWithFullColorImage:a3 monochromeFilterType:0 applyScalingAndCircularMasking:a4];
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4
{
  return (CLKFullColorImageProvider *)[a1 providerWithFullColorImage:a3 monochromeFilterType:0 applyScalingAndCircularMasking:a4];
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  id v9 = a3;
  v10 = [(CLKFullColorImageProvider *)self initPrivate];
  v11 = (CLKFullColorImageProvider *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 3, a3);
    v11->_applyScalingAndCircularMasking = a5;
    v11->_monochromeFilterType = a4;
  }

  return v11;
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)a1) initWithFullColorImage:v8 monochromeFilterType:a4 applyScalingAndCircularMasking:v5];

  return (CLKFullColorImageProvider *)v9;
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(CLKFullColorImageProvider *)self initPrivate];
  v12 = (CLKFullColorImageProvider *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 3, a3);
    v12->_applyScalingAndCircularMasking = a5;
    objc_storeStrong((id *)&v12->_tintedImageProvider, a4);
  }

  return v12;
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithFullColorImage:v9 tintedImageProvider:v8 applyScalingAndCircularMasking:v5];

  return (CLKFullColorImageProvider *)v10;
}

+ (CLKFullColorImageProvider)fullColorImageProviderWithImageViewClass:(Class)a3
{
  v4 = (id *)[objc_alloc((Class)a1) initPrivate];
  objc_storeStrong(v4 + 6, a3);

  return (CLKFullColorImageProvider *)v4;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_storeStrong((id *)&self->_accessibilityLabel, accessibilityLabel);
  BOOL v5 = accessibilityLabel;
  id v6 = [(CLKFullColorImageProvider *)self tintedImageProvider];
  [v6 setAccessibilityLabel:v5];
}

- (void)setTintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  id v6 = tintedImageProvider;
  objc_storeStrong((id *)&self->_tintedImageProvider, tintedImageProvider);
  BOOL v5 = [(CLKImageProvider *)v6 accessibilityLabel];

  if (!v5) {
    [(CLKImageProvider *)v6 setAccessibilityLabel:self->_accessibilityLabel];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tintColor = self->_tintColor;
  id v5 = a3;
  [v5 encodeObject:tintColor forKey:@"_tintColorKey"];
  [v5 encodeObject:self->_image forKey:@"_ImageKey"];
  [v5 encodeBool:self->_applyScalingAndCircularMasking forKey:@"_ApplyScalingAndCircularMaskingKey"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"AccessibilityLabel"];
  [v5 encodeBool:self->_finalized forKey:@"Finalized"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
  [v5 encodeObject:self->_tintedImageProvider forKey:@"TintedImageProvider"];
  [v5 encodeInteger:self->_monochromeFilterType forKey:@"MonochromeFilterType"];
  [v5 encodeBool:self->_prefersFilterOverTransition forKey:@"PrefersFilterOverTransitionKey"];
}

- (CLKFullColorImageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKFullColorImageProvider *)self initPrivate];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tintColorKey"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ImageKey"];
    image = v5->_image;
    v5->_image = (UIImage *)v8;

    v5->_applyScalingAndCircularMasking = [v4 decodeBoolForKey:@"_ApplyScalingAndCircularMaskingKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessibilityLabel"];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v10;

    v5->_finalized = [v4 decodeBoolForKey:@"Finalized"];
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"Metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TintedImageProvider"];
    tintedImageProvider = v5->_tintedImageProvider;
    v5->_tintedImageProvider = (CLKImageProvider *)v21;

    v5->_monochromeFilterType = [v4 decodeIntegerForKey:@"MonochromeFilterType"];
    v5->_prefersFilterOverTransition = [v4 decodeBoolForKey:@"PrefersFilterOverTransitionKey"];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_applyScalingAndCircularMasking == v4[16])
  {
    tintColor = self->_tintColor;
    uint64_t v6 = [v4 tintColor];
    if (CLKEqualObjects(tintColor, v6))
    {
      accessibilityLabel = self->_accessibilityLabel;
      uint64_t v8 = [v4 accessibilityLabel];
      if (CLKEqualObjects(accessibilityLabel, v8))
      {
        image = self->_image;
        uint64_t v10 = [v4 image];
        if (CLKEqualObjects(image, v10))
        {
          metadata = self->_metadata;
          v12 = [v4 metadata];
          if (CLKEqualObjects(metadata, v12))
          {
            tintedImageProvider = self->_tintedImageProvider;
            uint64_t v14 = [v4 tintedImageProvider];
            if (CLKEqualObjects(tintedImageProvider, v14)
              && self->_monochromeFilterType == *((void *)v4 + 8)
              && self->_prefersFilterOverTransition == v4[19])
            {
              Class ImageViewClass = self->_ImageViewClass;
              BOOL v16 = ImageViewClass == (Class)[v4 ImageViewClass];
            }
            else
            {
              BOOL v16 = 0;
            }
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  objc_super v3 = [NSNumber numberWithBool:self->_prefersFilterOverTransition];
  double v4 = (double)(unint64_t)[v3 hash];
  id v5 = [NSNumber numberWithInteger:self->_monochromeFilterType];
  double v6 = (double)(unint64_t)[v5 hash] * 1000000000.0 + v4 * 1.0e11;
  double v7 = v6 + (double)[(CLKImageProvider *)self->_tintedImageProvider hash] * 100000000.0;
  uint64_t v8 = [NSNumber numberWithBool:self->_applyScalingAndCircularMasking];
  double v9 = v7 + (double)(unint64_t)[v8 hash] * 10000000.0;
  double v10 = v9 + (double)(unint64_t)[(UIImage *)self->_image hash] * 1000000.0;
  double v11 = v10 + (double)(unint64_t)[(UIColor *)self->_tintColor hash] * 100000.0;
  double v12 = v11 + (double)[(NSString *)self->_accessibilityLabel hash] * 10000.0;
  double v13 = v12 + (double)(unint64_t)[(NSDictionary *)self->_metadata hash] * 1000.0;
  unint64_t v14 = (unint64_t)(v13 + (double)(unint64_t)[(objc_class *)self->_ImageViewClass hash] * 100.0);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    [(id)v4 setImage:self->_image];
    objc_storeStrong((id *)(v4 + 8), self->_tintColor);
    *(unsigned char *)(v4 + 16) = self->_applyScalingAndCircularMasking;
    objc_storeStrong((id *)(v4 + 40), self->_accessibilityLabel);
    objc_storeStrong((id *)(v4 + 48), self->_ImageViewClass);
    uint64_t v5 = [(NSDictionary *)self->_metadata copy];
    double v6 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v5;

    uint64_t v7 = [(CLKImageProvider *)self->_tintedImageProvider copy];
    uint64_t v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    *(void *)(v4 + 64) = self->_monochromeFilterType;
    *(unsigned char *)(v4 + 19) = self->_prefersFilterOverTransition;
    return (id)v4;
  }
}

+ (CLKFullColorImageProvider)fullColorImageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (fullColorImageProviderWithJSONObjectRepresentation_bundle__onceToken != -1) {
    dispatch_once(&fullColorImageProviderWithJSONObjectRepresentation_bundle__onceToken, &__block_literal_global_8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v5 format];
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v5 objectForKeyedSubscript:@"class"];
  double v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  Class v10 = NSClassFromString(v8);
  if (!v10
    || (double v11 = v10,
        ([(id)fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses containsObject:v10] & 1) == 0))
  {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"invalid CLKFullColorImageProvider subclass: %@", v9 format];
LABEL_9:
    double v11 = (objc_class *)v7;
  }
  double v12 = (void *)[[v11 alloc] initWithJSONObjectRepresentation:v5 bundle:v6];

  return (CLKFullColorImageProvider *)v12;
}

void __87__CLKFullColorImageProvider_fullColorImageProviderWithJSONObjectRepresentation_bundle___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses;
  fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses = v2;
}

- (CLKFullColorImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CLKFullColorImageProvider *)self initPrivate];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v6 format];
    }
    double v9 = [v6 objectForKeyedSubscript:@"applyScalingAndCircularMask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8->_applyScalingAndCircularMasking = [v9 BOOLValue];
    }
    else {
      [MEMORY[0x263EFF940] raise:@"applyScalingAndCircularMask", @"value for key '%@' must be a number - invalid value: %@", @"applyScalingAndCircularMask", v9 format];
    }
    Class v10 = [v6 objectForKeyedSubscript:@"fullColorImage"];
    objc_opt_class();
    id v23 = v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [MEMORY[0x263F827E8] imageWithJSONObjectRepresentation:v10 bundle:v7];
      image = v8->_image;
      v8->_image = (UIImage *)v11;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value in key '%@' must be a dictionary - invalid value: %@", @"fullColorImage", v10 format];
    }
    double v13 = [v6 objectForKeyedSubscript:@"tintColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x263F825C8]) initWithJSONObjectRepresentation:v13];
      tintColor = v8->_tintColor;
      v8->_tintColor = (UIColor *)v14;
    }
    else if (v13)
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value in key '%@' must be a dictionary - invalid value: %@", @"tintColor", v13 format];
    }
    BOOL v16 = [v6 objectForKeyedSubscript:@"accessibilityLabel"];
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"accessibilityLabel", v16 format];
      }
      objc_storeStrong((id *)&v8->_accessibilityLabel, v16);
    }
    uint64_t v17 = [v6 objectForKeyedSubscript:@"tintedImageProvider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[CLKImageProvider alloc] initWithJSONObjectRepresentation:v17 bundle:v23];
      tintedImageProvider = v8->_tintedImageProvider;
      v8->_tintedImageProvider = v18;
    }
    else if (v17)
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value in key '%@' must be a dictionary - invalid value: %@", @"tintedImageProvider", v17 format];
    }
    v20 = [v6 objectForKeyedSubscript:@"monochromeFilterType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8->_monochromeFilterType = [v20 integerValue];
    }
    else {
      [MEMORY[0x263EFF940] raise:@"monochromeFilterType", @"value for key '%@' must be a number - invalid value: %@", @"monochromeFilterType", v20 format];
    }
    uint64_t v21 = [v6 objectForKeyedSubscript:@"prefersFilterOverTransition"];
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x263EFF940] raise:@"prefersFilterOverTransition", @"value for key '%@' must be a number - invalid value: %@", @"prefersFilterOverTransition", v21 format];
    }
    else {
      v8->_prefersFilterOverTransition = [v21 BOOLValue];
    }

    id v7 = v23;
  }

  return v8;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(UIImage *)self->_image JSONObjectRepresentationWritingResourcesToBundlePath:v4];
  [v5 setObject:v6 forKeyedSubscript:@"fullColorImage"];

  id v7 = [NSNumber numberWithBool:self->_applyScalingAndCircularMasking];
  [v5 setObject:v7 forKeyedSubscript:@"applyScalingAndCircularMask"];

  uint64_t v8 = [(UIColor *)self->_tintColor JSONObjectRepresentation];
  [v5 setObject:v8 forKeyedSubscript:@"tintColor"];

  double v9 = [(CLKImageProvider *)self->_tintedImageProvider JSONObjectRepresentationWritingResourcesToBundlePath:v4];

  [v5 setObject:v9 forKeyedSubscript:@"tintedImageProvider"];
  Class v10 = [NSNumber numberWithInteger:self->_monochromeFilterType];
  [v5 setObject:v10 forKeyedSubscript:@"monochromeFilterType"];

  uint64_t v11 = [NSNumber numberWithBool:self->_prefersFilterOverTransition];
  [v5 setObject:v11 forKeyedSubscript:@"prefersFilterOverTransition"];

  [v5 setObject:self->_accessibilityLabel forKeyedSubscript:@"accessibilityLabel"];
  double v12 = (objc_class *)objc_opt_class();
  double v13 = NSStringFromClass(v12);
  [v5 setObject:v13 forKeyedSubscript:@"class"];

  return v5;
}

- (BOOL)validate
{
  if (self->_image) {
    return 1;
  }
  Class ImageViewClass = self->_ImageViewClass;
  if (ImageViewClass)
  {
    if (ImageViewClass != (Class)objc_opt_class()) {
      return 1;
    }
  }
  id v5 = CLKLoggingObjectForDomain(10);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    [(CLKFullColorImageProvider *)(uint64_t)self validate];
  }

  return 0;
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  if (!self->_finalized)
  {
    if (self->_applyScalingAndCircularMasking) {
      -[CLKFullColorImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:maxDeviceSize:cornerRadius:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:maxDeviceSize:cornerRadius:", a3.width, a3.height, a4.width, a4.height, a5);
    }
    self->_finalized = 1;
  }
  if ([(CLKFullColorImageProvider *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    objc_msgSend(v11, "finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:", v9, v8, width, height, a5);
  }
  double v12 = [(CLKFullColorImageProvider *)self tintedImageProvider];

  if (v12)
  {
    double v13 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    uint64_t v14 = [v13 foregroundAccentImage];

    uint64_t v15 = [(CLKFullColorImageProvider *)self tintedImageProvider];
    BOOL v16 = v15;
    if (v14)
    {
      uint64_t v17 = [v15 foregroundAccentImage];
    }
    else
    {
      v20 = [v15 twoPieceImageBackground];
      if (v20)
      {

        id v23 = 0;
        goto LABEL_16;
      }
      uint64_t v21 = [(CLKFullColorImageProvider *)self tintedImageProvider];
      v22 = [v21 twoPieceImageForeground];

      if (v22)
      {
        v18 = 0;
        goto LABEL_18;
      }
      BOOL v16 = [(CLKFullColorImageProvider *)self tintedImageProvider];
      uint64_t v17 = [v16 onePieceImage];
    }
    id v23 = (id)v17;

    v18 = v23;
    if (!v23)
    {
LABEL_18:

      return;
    }
    id v19 = [(CLKFullColorImageProvider *)self image];
    [(CLKFullColorImageProvider *)self setPrefersFilterOverTransition:v19 == v23];

    if ([(CLKFullColorImageProvider *)self prefersFilterOverTransition])
    {
LABEL_17:
      v18 = v23;
      goto LABEL_18;
    }
    BOOL v16 = [(CLKFullColorImageProvider *)self image];
    -[CLKFullColorImageProvider setPrefersFilterOverTransition:](self, "setPrefersFilterOverTransition:", [v16 isEqual:v23]);
LABEL_16:

    goto LABEL_17;
  }
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  id v13 = +[CLKTreatedImageCache sharedInstance];
  objc_msgSend(v13, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_image, v9, v8, width, height, a5);
  uint64_t v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v11;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
}

- (CLKImageProvider)tintedImageProvider
{
  return self->_tintedImageProvider;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (Class)ImageViewClass
{
  return self->_ImageViewClass;
}

- (BOOL)tritium_isTritiumInactiveFullColorImageProvider
{
  return self->_tritium_inactiveFullColorImageProvider;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)monochromeFilterType
{
  return self->_monochromeFilterType;
}

- (void)setMonochromeFilterType:(int64_t)a3
{
  self->_monochromeFilterType = a3;
}

- (BOOL)prefersFilterOverTransition
{
  return self->_prefersFilterOverTransition;
}

- (void)setPrefersFilterOverTransition:(BOOL)a3
{
  self->_prefersFilterOverTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_ImageViewClass, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_tintedImageProvider, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (void)validate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_class();
  id v4 = v3;
  int v6 = 138412802;
  id v7 = @"image";
  __int16 v8 = 2112;
  double v9 = v3;
  __int16 v10 = 2112;
  id v11 = (id)objc_opt_class();
  id v5 = v11;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);
}

@end
@interface CLKComplicationTemplateCircularSmallStackImage
+ (CLKComplicationTemplateCircularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (CLKComplicationTemplateCircularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKImageProvider)line1ImageProvider;
- (CLKTextProvider)line2TextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setLine1ImageProvider:(CLKImageProvider *)line1ImageProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateCircularSmallStackImage

- (CLKComplicationTemplateCircularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateCircularSmallStackImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateCircularSmallStackImage *)v8 setLine1ImageProvider:v6];
    [(CLKComplicationTemplateCircularSmallStackImage *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateCircularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1ImageProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateCircularSmallStackImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"line2TextProvider", 0, 1, &v3);
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  char v9 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"line1ImageProvider", 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  double v8 = +[CLKRenderingContext sharedRenderingContext];
  id obj = [v8 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock);
  id WeakRetained = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    id v11 = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice);
    if (obj == v11)
    {
      uint64_t v12 = [obj version];
      uint64_t v13 = _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion;

      if (v12 == v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v14 = objc_storeWeak(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice, obj);
  _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion = [obj version];

  __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(v15, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock);
  if (a4) {
    *a4 = (CGSize)xmmword_267C8B0B0;
  }
  if (a3) {
    *a3 = *(CGSize *)&_imageSDKSize_deviceSize_forSDKVersion___imageSize[2 * a5];
  }
}

void __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  *(void *)&xmmword_267C8B0B0 = __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2((uint64_t)v4, v4);
  *((void *)&xmmword_267C8B0B0 + 1) = v2;
  _imageSDKSize_deviceSize_forSDKVersion___imageSize = __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  *(void *)algn_267C8B0A8 = v3;
}

double __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26CCDB6C8;
  v8[1] = &unk_26CCDB6E0;
  v9[0] = &unk_26CCDC268;
  v9[1] = &unk_26CCDC298;
  uint64_t v2 = NSDictionary;
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v3 scaledValue:v4 withOverrides:17.0];
  double v6 = v5;

  [v3 scaledValue:0 withOverride:8.0 forSizeClass:7.0];
  return v6;
}

- (CLKImageProvider)line1ImageProvider
{
  return self->_line1ImageProvider;
}

- (void)setLine1ImageProvider:(CLKImageProvider *)line1ImageProvider
{
}

- (CLKTextProvider)line2TextProvider
{
  return self->_line2TextProvider;
}

- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);

  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end
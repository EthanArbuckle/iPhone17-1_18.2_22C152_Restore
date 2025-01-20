@interface CLKComplicationTemplateModularSmallStackImage
+ (CLKComplicationTemplateModularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (BOOL)highlightLine2;
- (CLKComplicationTemplateModularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKImageProvider)line1ImageProvider;
- (CLKTextProvider)line2TextProvider;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (int64_t)compatibleFamily;
- (unint64_t)highlightMode;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setHighlightLine2:(BOOL)highlightLine2;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setLine1ImageProvider:(CLKImageProvider *)line1ImageProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateModularSmallStackImage

- (CLKComplicationTemplateModularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateModularSmallStackImage *)v8 setLine1ImageProvider:v6];
    [(CLKComplicationTemplateModularSmallStackImage *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateModularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1ImageProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateModularSmallStackImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 0;
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
  objc_msgSend((id)objc_opt_class(), "imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"line1ImageProvider", 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"highlightMode", 0, &__block_literal_global_437, &v3);
}

BOOL __80__CLKComplicationTemplateModularSmallStackImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)highlightLine2
{
}

- (BOOL)highlightLine2
{
  return [(CLKComplicationTemplateModularSmallStackImage *)self highlightMode] != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  id v7 = [(CLKComplicationTemplate *)&v10 initPrivateWithJSONObjectRepresentation:v6 bundle:a4];
  if (v7)
  {
    double v8 = [v6 objectForKeyedSubscript:@"highlightLine2"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"highlightLine2", v8 format];
      }
      objc_msgSend(v7, "setHighlightLine2:", objc_msgSend(v8, "BOOLValue"));
    }
  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  id v4 = [(CLKComplicationTemplate *)&v7 JSONObjectRepresentationWritingResourcesToBundlePath:a3 purpose:0];
  double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CLKComplicationTemplateModularSmallStackImage highlightLine2](self, "highlightLine2"));
  [v4 setObject:v5 forKeyedSubscript:@"highlightLine2"];

  return v4;
}

+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  double v8 = +[CLKRenderingContext sharedRenderingContext];
  char v9 = [v8 device];
  id v14 = +[CLKDeviceMetrics metricsWithDevice:v9 identitySizeClass:2];

  if (a4)
  {
    a4->width = __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(v10, v14);
    a4->height = v11;
  }
  if (a3)
  {
    v12 = v14;
    if (!a5)
    {
      uint64_t v10 = [v14 setNewestAllowedSizeClass:&unk_26CCDB6E0];
      v12 = v14;
    }
    a3->width = __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(v10, v12);
    a3->height = v13;
  }
}

double __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = &unk_26CCDB6C8;
  v2 = (void *)MEMORY[0x263F08D40];
  id v3 = a2;
  id v4 = objc_msgSend(v2, "valueWithCGSize:", 26.0, 14.0);
  v10[1] = &unk_26CCDB6E0;
  v11[0] = v4;
  double v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 32.0, 17.0);
  v11[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v6, 29.0, 15.0);
  double v8 = v7;

  return v8;
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

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);

  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end
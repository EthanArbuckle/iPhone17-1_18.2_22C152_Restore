@interface CLKComplicationTemplateExtraLargeStackImage
+ (CLKComplicationTemplateExtraLargeStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (BOOL)highlightLine2;
- (CLKComplicationTemplateExtraLargeStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
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

@implementation CLKComplicationTemplateExtraLargeStackImage

- (CLKComplicationTemplateExtraLargeStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateExtraLargeStackImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateExtraLargeStackImage *)v8 setLine1ImageProvider:v6];
    [(CLKComplicationTemplateExtraLargeStackImage *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateExtraLargeStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1ImageProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateExtraLargeStackImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 7;
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
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"highlightMode", 0, &__block_literal_global_974, &v3);
}

BOOL __78__CLKComplicationTemplateExtraLargeStackImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)highlightLine2
{
}

- (BOOL)highlightLine2
{
  return [(CLKComplicationTemplateExtraLargeStackImage *)self highlightMode] != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateExtraLargeStackImage;
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
  v7.super_class = (Class)CLKComplicationTemplateExtraLargeStackImage;
  id v4 = [(CLKComplicationTemplate *)&v7 JSONObjectRepresentationWritingResourcesToBundlePath:a3 purpose:0];
  double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CLKComplicationTemplateExtraLargeStackImage highlightLine2](self, "highlightLine2"));
  [v4 setObject:v5 forKeyedSubscript:@"highlightLine2"];

  return v4;
}

+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  __asm { FMOV            V0.2D, #3.0 }
  if (a3) {
    *(float64x2_t *)a3 = vmulq_f64(*(float64x2_t *)a3, _Q0);
  }
  if (a4) {
    *(float64x2_t *)a4 = vmulq_f64(*(float64x2_t *)a4, _Q0);
  }
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
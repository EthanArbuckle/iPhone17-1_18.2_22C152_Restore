@interface CLKComplicationTemplateUtilitarianLargeFlat
+ (CLKComplicationTemplateUtilitarianLargeFlat)templateWithTextProvider:(CLKTextProvider *)textProvider;
+ (CLKComplicationTemplateUtilitarianLargeFlat)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider;
- (CLKComplicationTemplateUtilitarianLargeFlat)initWithTextProvider:(CLKTextProvider *)textProvider;
- (CLKComplicationTemplateUtilitarianLargeFlat)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider;
- (CLKImageProvider)imageProvider;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKImageProvider *)imageProvider;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateUtilitarianLargeFlat

- (CLKComplicationTemplateUtilitarianLargeFlat)initWithTextProvider:(CLKTextProvider *)textProvider
{
  return [(CLKComplicationTemplateUtilitarianLargeFlat *)self initWithTextProvider:textProvider imageProvider:0];
}

- (CLKComplicationTemplateUtilitarianLargeFlat)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  v6 = textProvider;
  v7 = imageProvider;
  v8 = [(CLKComplicationTemplate *)self initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateUtilitarianLargeFlat *)v8 setTextProvider:v6];
    [(CLKComplicationTemplateUtilitarianLargeFlat *)v9 setImageProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateUtilitarianLargeFlat)templateWithTextProvider:(CLKTextProvider *)textProvider
{
  v4 = textProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v4];

  return (CLKComplicationTemplateUtilitarianLargeFlat *)v5;
}

+ (CLKComplicationTemplateUtilitarianLargeFlat)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateUtilitarianLargeFlat *)v8;
}

- (int64_t)compatibleFamily
{
  return 3;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  char v9 = 0;
  long long v8 = 0uLL;
  long long v7 = 0uLL;
  id v4 = a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  v6 = [v5 device];
  _UtilitarianFlatImageSizeForDevice(v6, [(CLKComplicationTemplate *)self sdkVersion], &v8, &v7);

  (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 1, 1, 0, 5, 0, &v9, *(double *)&v8, *((double *)&v8 + 1), *(double *)&v7, *((double *)&v7 + 1));
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);

  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
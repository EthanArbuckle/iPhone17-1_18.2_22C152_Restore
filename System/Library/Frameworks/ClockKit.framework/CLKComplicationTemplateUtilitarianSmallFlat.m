@interface CLKComplicationTemplateUtilitarianSmallFlat
+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider;
+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider;
- (BOOL)isCompatibleWithFamily:(int64_t)a3;
- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider;
- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider;
- (CLKImageProvider)imageProvider;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKImageProvider *)imageProvider;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateUtilitarianSmallFlat

- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider
{
  return [(CLKComplicationTemplateUtilitarianSmallFlat *)self initWithTextProvider:textProvider imageProvider:0];
}

- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  v6 = textProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateUtilitarianSmallFlat;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateUtilitarianSmallFlat *)v8 setTextProvider:v6];
    [(CLKComplicationTemplateUtilitarianSmallFlat *)v9 setImageProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider
{
  v4 = textProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v4];

  return (CLKComplicationTemplateUtilitarianSmallFlat *)v5;
}

+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateUtilitarianSmallFlat *)v8;
}

- (BOOL)isCompatibleWithFamily:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateUtilitarianSmallFlat;
  BOOL result = -[CLKComplicationTemplate isCompatibleWithFamily:](&v5, sel_isCompatibleWithFamily_);
  if (a3 == 6) {
    return 1;
  }
  return result;
}

- (int64_t)compatibleFamily
{
  return 2;
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
  objc_super v5 = +[CLKRenderingContext sharedRenderingContext];
  v6 = [v5 device];
  _UtilitarianFlatImageSizeForDevice(v6, [(CLKComplicationTemplate *)self sdkVersion], &v8, &v7);

  (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 1, 1, 0, 4, 0, &v9, *(double *)&v8, *((double *)&v8 + 1), *(double *)&v7, *((double *)&v7 + 1));
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
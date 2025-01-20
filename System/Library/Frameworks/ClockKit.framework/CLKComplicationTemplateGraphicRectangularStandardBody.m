@interface CLKComplicationTemplateGraphicRectangularStandardBody
+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (CLKFullColorImageProvider)headerImageProvider;
- (CLKTextProvider)body1TextProvider;
- (CLKTextProvider)body2TextProvider;
- (CLKTextProvider)headerTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider;
- (void)setBody2TextProvider:(CLKTextProvider *)body2TextProvider;
- (void)setHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider;
- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider;
@end

@implementation CLKComplicationTemplateGraphicRectangularStandardBody

- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return [(CLKComplicationTemplateGraphicRectangularStandardBody *)self initWithHeaderTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:0];
}

- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  return [(CLKComplicationTemplateGraphicRectangularStandardBody *)self initWithHeaderImageProvider:0 headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:body2TextProvider];
}

- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return [(CLKComplicationTemplateGraphicRectangularStandardBody *)self initWithHeaderImageProvider:headerImageProvider headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:0];
}

- (CLKComplicationTemplateGraphicRectangularStandardBody)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v10 = headerImageProvider;
  v11 = headerTextProvider;
  v12 = body1TextProvider;
  v13 = body2TextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicRectangularStandardBody;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicRectangularStandardBody *)v14 setHeaderImageProvider:v10];
    [(CLKComplicationTemplateGraphicRectangularStandardBody *)v15 setHeaderTextProvider:v11];
    [(CLKComplicationTemplateGraphicRectangularStandardBody *)v15 setBody1TextProvider:v12];
    [(CLKComplicationTemplateGraphicRectangularStandardBody *)v15 setBody2TextProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  v6 = body1TextProvider;
  v7 = headerTextProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v7 body1TextProvider:v6];

  return (CLKComplicationTemplateGraphicRectangularStandardBody *)v8;
}

+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v8 = body2TextProvider;
  v9 = body1TextProvider;
  v10 = headerTextProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v10 body1TextProvider:v9 body2TextProvider:v8];

  return (CLKComplicationTemplateGraphicRectangularStandardBody *)v11;
}

+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  v8 = body1TextProvider;
  v9 = headerTextProvider;
  v10 = headerImageProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v10 headerTextProvider:v9 body1TextProvider:v8];

  return (CLKComplicationTemplateGraphicRectangularStandardBody *)v11;
}

+ (CLKComplicationTemplateGraphicRectangularStandardBody)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v10 = body2TextProvider;
  v11 = body1TextProvider;
  v12 = headerTextProvider;
  v13 = headerImageProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v13 headerTextProvider:v12 body1TextProvider:v11 body2TextProvider:v10];

  return (CLKComplicationTemplateGraphicRectangularStandardBody *)v14;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"headerTextProvider", 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, @"body1TextProvider", 0, 1, &v4);
    if (!v4) {
      v3[2](v3, @"body2TextProvider", 1, 1, &v4);
    }
  }
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  char v4 = (void (**)(id, __CFString *, uint64_t, uint64_t, void *, uint64_t, unsigned char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1499);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1500);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1500);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1500, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1501 = [v6 version];

    __103__CLKComplicationTemplateGraphicRectangularStandardBody__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1501;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1499);
  double v14 = *(double *)&qword_267C8B3E0;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1497[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1498];
  v4[2](v4, @"headerImageProvider", 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);
}

void __103__CLKComplicationTemplateGraphicRectangularStandardBody__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:12.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1498 = v2;
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  qword_267C8B3E0 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1497 = v4;
}

- (CLKFullColorImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider
{
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider
{
}

- (CLKTextProvider)body2TextProvider
{
  return self->_body2TextProvider;
}

- (void)setBody2TextProvider:(CLKTextProvider *)body2TextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body2TextProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
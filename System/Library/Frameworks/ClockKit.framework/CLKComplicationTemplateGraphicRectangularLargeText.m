@interface CLKComplicationTemplateGraphicRectangularLargeText
+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5;
+ (id)templateWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4;
- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5;
- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4;
- (CLKFullColorImageProvider)headerImageProvider;
- (CLKTextProvider)bodyTextProvider;
- (CLKTextProvider)headerTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBodyTextProvider:(id)a3;
- (void)setHeaderImageProvider:(id)a3;
- (void)setHeaderTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicRectangularLargeText

- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4
{
  return [(CLKComplicationTemplateGraphicRectangularLargeText *)self initWithHeaderImageProvider:0 headerTextProvider:a3 bodyTextProvider:a4];
}

- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicRectangularLargeText;
  v11 = [(CLKComplicationTemplate *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKComplicationTemplateGraphicRectangularLargeText *)v11 setHeaderImageProvider:v8];
    [(CLKComplicationTemplateGraphicRectangularLargeText *)v12 setHeaderTextProvider:v9];
    [(CLKComplicationTemplateGraphicRectangularLargeText *)v12 setBodyTextProvider:v10];
  }

  return v12;
}

+ (id)templateWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v7 bodyTextProvider:v6];

  return v8;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v10 headerTextProvider:v9 bodyTextProvider:v8];

  return v11;
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
  if (!v4) {
    v3[2](v3, @"bodyTextProvider", 0, 1, &v4);
  }
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  char v4 = (void (**)(id, __CFString *, uint64_t, uint64_t, void *, uint64_t, unsigned char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1534);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1535);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1535);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1535, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1536 = [v6 version];

    __100__CLKComplicationTemplateGraphicRectangularLargeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1536;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1534);
  double v14 = *(double *)&qword_267C8B440;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1532[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1533];
  v4[2](v4, @"headerImageProvider", 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);
}

void __100__CLKComplicationTemplateGraphicRectangularLargeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:12.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1533 = v2;
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  qword_267C8B440 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1532 = v4;
}

- (CLKFullColorImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(id)a3
{
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
}

- (CLKTextProvider)bodyTextProvider
{
  return self->_bodyTextProvider;
}

- (void)setBodyTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
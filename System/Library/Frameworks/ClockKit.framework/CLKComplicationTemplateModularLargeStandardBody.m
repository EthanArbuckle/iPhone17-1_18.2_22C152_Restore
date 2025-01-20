@interface CLKComplicationTemplateModularLargeStandardBody
+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (BOOL)shouldTruncateHeaderLeadingLabelFirst;
- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider;
- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider;
- (CLKImageProvider)body1ImageProvider;
- (CLKImageProvider)headerImageProvider;
- (CLKTextProvider)body1TextProvider;
- (CLKTextProvider)body2TextProvider;
- (CLKTextProvider)headerTextProvider;
- (CLKTextProvider)headerTrailingTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateBOOLKeysWithBlock:(id)a3;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBody1ImageProvider:(id)a3;
- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider;
- (void)setBody2TextProvider:(CLKTextProvider *)body2TextProvider;
- (void)setHeaderImageProvider:(CLKImageProvider *)headerImageProvider;
- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider;
- (void)setHeaderTrailingTextProvider:(id)a3;
- (void)setShouldTruncateHeaderLeadingLabelFirst:(BOOL)a3;
@end

@implementation CLKComplicationTemplateModularLargeStandardBody

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return [(CLKComplicationTemplateModularLargeStandardBody *)self initWithHeaderImageProvider:0 headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:0];
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return [(CLKComplicationTemplateModularLargeStandardBody *)self initWithHeaderImageProvider:headerImageProvider headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:0];
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  return [(CLKComplicationTemplateModularLargeStandardBody *)self initWithHeaderImageProvider:0 headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider body2TextProvider:body2TextProvider];
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v10 = headerImageProvider;
  v11 = headerTextProvider;
  v12 = body1TextProvider;
  v13 = body2TextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateModularLargeStandardBody;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateModularLargeStandardBody *)v14 setHeaderImageProvider:v10];
    [(CLKComplicationTemplateModularLargeStandardBody *)v15 setHeaderTextProvider:v11];
    [(CLKComplicationTemplateModularLargeStandardBody *)v15 setBody1TextProvider:v12];
    [(CLKComplicationTemplateModularLargeStandardBody *)v15 setBody2TextProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  v6 = body1TextProvider;
  v7 = headerTextProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v7 body1TextProvider:v6];

  return (CLKComplicationTemplateModularLargeStandardBody *)v8;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  v8 = body1TextProvider;
  v9 = headerTextProvider;
  v10 = headerImageProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v10 headerTextProvider:v9 body1TextProvider:v8];

  return (CLKComplicationTemplateModularLargeStandardBody *)v11;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v8 = body2TextProvider;
  v9 = body1TextProvider;
  v10 = headerTextProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v10 body1TextProvider:v9 body2TextProvider:v8];

  return (CLKComplicationTemplateModularLargeStandardBody *)v11;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  v10 = body2TextProvider;
  v11 = body1TextProvider;
  v12 = headerTextProvider;
  v13 = headerImageProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v13 headerTextProvider:v12 body1TextProvider:v11 body2TextProvider:v10];

  return (CLKComplicationTemplateModularLargeStandardBody *)v14;
}

- (int64_t)compatibleFamily
{
  return 1;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"headerTextProvider", 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, @"headerTrailingTextProvider", 1, 1, &v4);
    if (!v4)
    {
      v3[2](v3, @"body1TextProvider", 0, 1, &v4);
      if (!v4) {
        v3[2](v3, @"body2TextProvider", 1, 1, &v4);
      }
    }
  }
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  char v9 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  _ModularLargeImageSize([(CLKComplicationTemplate *)self sdkVersion], (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"headerImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  if (!v9) {
    (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
  }
     + 2))(v4, @"body1ImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, char *))a3 + 2))(a3, @"shouldTruncateHeaderLeadingLabelFirst", 0, &v3);
}

- (CLKImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKImageProvider *)headerImageProvider
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

- (CLKImageProvider)body1ImageProvider
{
  return self->_body1ImageProvider;
}

- (void)setBody1ImageProvider:(id)a3
{
}

- (CLKTextProvider)headerTrailingTextProvider
{
  return self->_headerTrailingTextProvider;
}

- (void)setHeaderTrailingTextProvider:(id)a3
{
}

- (BOOL)shouldTruncateHeaderLeadingLabelFirst
{
  return self->_shouldTruncateHeaderLeadingLabelFirst;
}

- (void)setShouldTruncateHeaderLeadingLabelFirst:(BOOL)a3
{
  self->_shouldTruncateHeaderLeadingLabelFirst = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTrailingTextProvider, 0);
  objc_storeStrong((id *)&self->_body1ImageProvider, 0);
  objc_storeStrong((id *)&self->_body2TextProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
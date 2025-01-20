@interface CLKComplicationTemplateModularLargeTallBody
+ (CLKComplicationTemplateModularLargeTallBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider;
+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5;
- (BOOL)shouldTruncateHeaderLeadingLabelFirst;
- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5;
- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider;
- (CLKImageProvider)headerImageProvider;
- (CLKTextProvider)bodyTextProvider;
- (CLKTextProvider)headerTextProvider;
- (CLKTextProvider)headerTrailingTextProvider;
- (NSDate)contentDate;
- (NSDictionary)additionalContentAttributes;
- (int64_t)compatibleFamily;
- (void)_enumerateBOOLKeysWithBlock:(id)a3;
- (void)_enumerateDateKeysWithBlock:(id)a3;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setAdditionalContentAttributes:(id)a3;
- (void)setBodyTextProvider:(CLKTextProvider *)bodyTextProvider;
- (void)setContentDate:(id)a3;
- (void)setHeaderImageProvider:(id)a3;
- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider;
- (void)setHeaderTrailingTextProvider:(id)a3;
- (void)setShouldTruncateHeaderLeadingLabelFirst:(BOOL)a3;
@end

@implementation CLKComplicationTemplateModularLargeTallBody

- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider
{
  v6 = headerTextProvider;
  v7 = bodyTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateModularLargeTallBody;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateModularLargeTallBody *)v8 setHeaderTextProvider:v6];
    [(CLKComplicationTemplateModularLargeTallBody *)v9 setBodyTextProvider:v7];
  }

  return v9;
}

- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateModularLargeTallBody;
  objc_super v11 = [(CLKComplicationTemplate *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKComplicationTemplateModularLargeTallBody *)v11 setHeaderImageProvider:v8];
    [(CLKComplicationTemplateModularLargeTallBody *)v12 setHeaderTextProvider:v9];
    [(CLKComplicationTemplateModularLargeTallBody *)v12 setBodyTextProvider:v10];
  }

  return v12;
}

+ (CLKComplicationTemplateModularLargeTallBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider
{
  v6 = bodyTextProvider;
  v7 = headerTextProvider;
  id v8 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v7 bodyTextProvider:v6];

  return (CLKComplicationTemplateModularLargeTallBody *)v8;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v10 headerTextProvider:v9 bodyTextProvider:v8];

  return v11;
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
    if (!v4) {
      v3[2](v3, @"bodyTextProvider", 0, 1, &v4);
    }
  }
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, char *))a3 + 2))(a3, @"shouldTruncateHeaderLeadingLabelFirst", 0, &v3);
}

- (void)_enumerateDateKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, char *))a3 + 2))(a3, @"contentDate", 0, &v3);
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  char v9 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  id v4 = a3;
  _ModularLargeImageSize([(CLKComplicationTemplate *)self sdkVersion], (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"headerImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
}

- (NSDate)contentDate
{
  v2 = [(CLKComplicationTemplateModularLargeTallBody *)self additionalContentAttributes];
  char v3 = [v2 objectForKeyedSubscript:@"NTKUpNextEventBeginDateKey"];

  return (NSDate *)v3;
}

- (void)setContentDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLKComplicationTemplateModularLargeTallBody *)self additionalContentAttributes];
  double v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x263EFFA78];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  id v11 = (id)[v8 mutableCopy];
  char v9 = (void *)[v4 copy];

  [v11 setObject:v9 forKeyedSubscript:@"NTKUpNextEventBeginDateKey"];
  id v10 = (void *)[v11 copy];
  [(CLKComplicationTemplateModularLargeTallBody *)self setAdditionalContentAttributes:v10];
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
}

- (CLKTextProvider)bodyTextProvider
{
  return self->_bodyTextProvider;
}

- (void)setBodyTextProvider:(CLKTextProvider *)bodyTextProvider
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

- (NSDictionary)additionalContentAttributes
{
  return self->_additionalContentAttributes;
}

- (void)setAdditionalContentAttributes:(id)a3
{
}

- (CLKImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
  objc_storeStrong((id *)&self->_additionalContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerTrailingTextProvider, 0);
  objc_storeStrong((id *)&self->_bodyTextProvider, 0);

  objc_storeStrong((id *)&self->_headerTextProvider, 0);
}

@end
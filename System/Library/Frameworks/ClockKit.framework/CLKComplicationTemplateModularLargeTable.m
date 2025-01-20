@interface CLKComplicationTemplateModularLargeTable
+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (BOOL)useNoColumnPadding;
- (CLKComplicationColumnAlignment)column2Alignment;
- (CLKComplicationTemplateModularLargeTable)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (CLKComplicationTemplateModularLargeTable)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (CLKImageProvider)headerImageProvider;
- (CLKTextProvider)headerTextProvider;
- (CLKTextProvider)row1Column1TextProvider;
- (CLKTextProvider)row1Column2TextProvider;
- (CLKTextProvider)row2Column1TextProvider;
- (CLKTextProvider)row2Column2TextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment;
- (void)setHeaderImageProvider:(CLKImageProvider *)headerImageProvider;
- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider;
- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider;
- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider;
- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider;
- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (void)setUseNoColumnPadding:(BOOL)a3;
@end

@implementation CLKComplicationTemplateModularLargeTable

- (CLKComplicationTemplateModularLargeTable)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  return [(CLKComplicationTemplateModularLargeTable *)self initWithHeaderImageProvider:0 headerTextProvider:headerTextProvider row1Column1TextProvider:row1Column1TextProvider row1Column2TextProvider:row1Column2TextProvider row2Column1TextProvider:row2Column1TextProvider row2Column2TextProvider:row2Column2TextProvider];
}

- (CLKComplicationTemplateModularLargeTable)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  v14 = headerImageProvider;
  v15 = headerTextProvider;
  v16 = row1Column1TextProvider;
  v17 = row1Column2TextProvider;
  v18 = row2Column1TextProvider;
  v19 = row2Column2TextProvider;
  v23.receiver = self;
  v23.super_class = (Class)CLKComplicationTemplateModularLargeTable;
  v20 = [(CLKComplicationTemplate *)&v23 initPrivate];
  v21 = v20;
  if (v20)
  {
    [(CLKComplicationTemplateModularLargeTable *)v20 setHeaderImageProvider:v14];
    [(CLKComplicationTemplateModularLargeTable *)v21 setHeaderTextProvider:v15];
    [(CLKComplicationTemplateModularLargeTable *)v21 setRow1Column1TextProvider:v16];
    [(CLKComplicationTemplateModularLargeTable *)v21 setRow1Column2TextProvider:v17];
    [(CLKComplicationTemplateModularLargeTable *)v21 setRow2Column1TextProvider:v18];
    [(CLKComplicationTemplateModularLargeTable *)v21 setRow2Column2TextProvider:v19];
  }

  return v21;
}

+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  v12 = row2Column2TextProvider;
  v13 = row2Column1TextProvider;
  v14 = row1Column2TextProvider;
  v15 = row1Column1TextProvider;
  v16 = headerTextProvider;
  v17 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v16 row1Column1TextProvider:v15 row1Column2TextProvider:v14 row2Column1TextProvider:v13 row2Column2TextProvider:v12];

  return (CLKComplicationTemplateModularLargeTable *)v17;
}

+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  v14 = row2Column2TextProvider;
  v15 = row2Column1TextProvider;
  v16 = row1Column2TextProvider;
  v17 = row1Column1TextProvider;
  v18 = headerTextProvider;
  v19 = headerImageProvider;
  v20 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v19 headerTextProvider:v18 row1Column1TextProvider:v17 row1Column2TextProvider:v16 row2Column1TextProvider:v15 row2Column2TextProvider:v14];

  return (CLKComplicationTemplateModularLargeTable *)v20;
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
    v3[2](v3, @"row1Column1TextProvider", 0, 1, &v4);
    if (!v4)
    {
      v3[2](v3, @"row1Column2TextProvider", 0, 1, &v4);
      if (!v4)
      {
        v3[2](v3, @"row2Column1TextProvider", 0, 1, &v4);
        if (!v4) {
          v3[2](v3, @"row2Column2TextProvider", 0, 1, &v4);
        }
      }
    }
  }
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

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"column2Alignment", 1, &__block_literal_global_670, &v3);
}

BOOL __75__CLKComplicationTemplateModularLargeTable__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
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

- (CLKTextProvider)row1Column1TextProvider
{
  return self->_row1Column1TextProvider;
}

- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider
{
}

- (CLKTextProvider)row1Column2TextProvider
{
  return self->_row1Column2TextProvider;
}

- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider
{
}

- (CLKTextProvider)row2Column1TextProvider
{
  return self->_row2Column1TextProvider;
}

- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider
{
}

- (CLKTextProvider)row2Column2TextProvider
{
  return self->_row2Column2TextProvider;
}

- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
}

- (CLKComplicationColumnAlignment)column2Alignment
{
  return self->_column2Alignment;
}

- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment
{
  self->_column2Alignment = column2Alignment;
}

- (BOOL)useNoColumnPadding
{
  return self->_useNoColumnPadding;
}

- (void)setUseNoColumnPadding:(BOOL)a3
{
  self->_useNoColumnPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
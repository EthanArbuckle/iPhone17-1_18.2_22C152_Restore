@interface CLKComplicationTemplateModularSmallColumnsText
+ (CLKComplicationTemplateModularSmallColumnsText)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (BOOL)highlightColumn2;
- (CLKComplicationColumnAlignment)column2Alignment;
- (CLKComplicationTemplateModularSmallColumnsText)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (CLKTextProvider)row1Column1TextProvider;
- (CLKTextProvider)row1Column2TextProvider;
- (CLKTextProvider)row2Column1TextProvider;
- (CLKTextProvider)row2Column2TextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateBOOLKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment;
- (void)setHighlightColumn2:(BOOL)highlightColumn2;
- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider;
- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider;
- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider;
- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
@end

@implementation CLKComplicationTemplateModularSmallColumnsText

- (CLKComplicationTemplateModularSmallColumnsText)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  v10 = row1Column1TextProvider;
  v11 = row1Column2TextProvider;
  v12 = row2Column1TextProvider;
  v13 = row2Column2TextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateModularSmallColumnsText;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateModularSmallColumnsText *)v14 setRow1Column1TextProvider:v10];
    [(CLKComplicationTemplateModularSmallColumnsText *)v15 setRow1Column2TextProvider:v11];
    [(CLKComplicationTemplateModularSmallColumnsText *)v15 setRow2Column1TextProvider:v12];
    [(CLKComplicationTemplateModularSmallColumnsText *)v15 setRow2Column2TextProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateModularSmallColumnsText)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  v10 = row2Column2TextProvider;
  v11 = row2Column1TextProvider;
  v12 = row1Column2TextProvider;
  v13 = row1Column1TextProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithRow1Column1TextProvider:v13 row1Column2TextProvider:v12 row2Column1TextProvider:v11 row2Column2TextProvider:v10];

  return (CLKComplicationTemplateModularSmallColumnsText *)v14;
}

- (int64_t)compatibleFamily
{
  return 0;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
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

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"column2Alignment", 1, &__block_literal_global_478, &v3);
}

BOOL __81__CLKComplicationTemplateModularSmallColumnsText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, char *))a3 + 2))(a3, @"highlightColumn2", 1, &v3);
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

- (BOOL)highlightColumn2
{
  return self->_highlightColumn2;
}

- (void)setHighlightColumn2:(BOOL)highlightColumn2
{
  self->_highlightColumn2 = highlightColumn2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);

  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);
}

@end
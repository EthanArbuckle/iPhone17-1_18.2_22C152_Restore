@interface CLKComplicationTemplateModularLargeColumns
+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider;
+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider;
- (BOOL)useNoColumnPadding;
- (CLKComplicationColumnAlignment)column2Alignment;
- (CLKComplicationTemplateModularLargeColumns)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider;
- (CLKComplicationTemplateModularLargeColumns)initWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider;
- (CLKImageProvider)row1ImageProvider;
- (CLKImageProvider)row2ImageProvider;
- (CLKImageProvider)row3ImageProvider;
- (CLKTextProvider)row1Column1TextProvider;
- (CLKTextProvider)row1Column2TextProvider;
- (CLKTextProvider)row2Column1TextProvider;
- (CLKTextProvider)row2Column2TextProvider;
- (CLKTextProvider)row3Column1TextProvider;
- (CLKTextProvider)row3Column2TextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment;
- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider;
- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider;
- (void)setRow1ImageProvider:(CLKImageProvider *)row1ImageProvider;
- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider;
- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider;
- (void)setRow2ImageProvider:(CLKImageProvider *)row2ImageProvider;
- (void)setRow3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider;
- (void)setRow3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider;
- (void)setRow3ImageProvider:(CLKImageProvider *)row3ImageProvider;
- (void)setUseNoColumnPadding:(BOOL)a3;
@end

@implementation CLKComplicationTemplateModularLargeColumns

- (CLKComplicationTemplateModularLargeColumns)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  return [(CLKComplicationTemplateModularLargeColumns *)self initWithRow1ImageProvider:0 row1Column1TextProvider:row1Column1TextProvider row1Column2TextProvider:row1Column2TextProvider row2ImageProvider:0 row2Column1TextProvider:row2Column1TextProvider row2Column2TextProvider:row2Column2TextProvider row3ImageProvider:0 row3Column1TextProvider:row3Column1TextProvider row3Column2TextProvider:row3Column2TextProvider];
}

- (CLKComplicationTemplateModularLargeColumns)initWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  v17 = row1ImageProvider;
  v18 = row1Column1TextProvider;
  v19 = row1Column2TextProvider;
  v20 = row2ImageProvider;
  v21 = row2Column1TextProvider;
  v22 = row2Column2TextProvider;
  v23 = row3ImageProvider;
  v24 = row3Column1TextProvider;
  v25 = row3Column2TextProvider;
  v29.receiver = self;
  v29.super_class = (Class)CLKComplicationTemplateModularLargeColumns;
  v26 = [(CLKComplicationTemplate *)&v29 initPrivate];
  v27 = v26;
  if (v26)
  {
    [(CLKComplicationTemplateModularLargeColumns *)v26 setRow1ImageProvider:v17];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow1Column1TextProvider:v18];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow1Column2TextProvider:v19];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow2ImageProvider:v20];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow2Column1TextProvider:v21];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow2Column2TextProvider:v22];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow3ImageProvider:v23];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow3Column1TextProvider:v24];
    [(CLKComplicationTemplateModularLargeColumns *)v27 setRow3Column2TextProvider:v25];
  }

  return v27;
}

+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  v14 = row3Column2TextProvider;
  v15 = row3Column1TextProvider;
  v16 = row2Column2TextProvider;
  v17 = row2Column1TextProvider;
  v18 = row1Column2TextProvider;
  v19 = row1Column1TextProvider;
  v20 = (void *)[objc_alloc((Class)a1) initWithRow1Column1TextProvider:v19 row1Column2TextProvider:v18 row2Column1TextProvider:v17 row2Column2TextProvider:v16 row3Column1TextProvider:v15 row3Column2TextProvider:v14];

  return (CLKComplicationTemplateModularLargeColumns *)v20;
}

+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  v18 = row3Column2TextProvider;
  v19 = row3Column1TextProvider;
  v20 = row3ImageProvider;
  v21 = row2Column2TextProvider;
  v22 = row2Column1TextProvider;
  v23 = row2ImageProvider;
  v24 = row1Column2TextProvider;
  v25 = row1Column1TextProvider;
  v26 = row1ImageProvider;
  v27 = (void *)[objc_alloc((Class)a1) initWithRow1ImageProvider:v26 row1Column1TextProvider:v25 row1Column2TextProvider:v24 row2ImageProvider:v23 row2Column1TextProvider:v22 row2Column2TextProvider:v21 row3ImageProvider:v20 row3Column1TextProvider:v19 row3Column2TextProvider:v18];

  return (CLKComplicationTemplateModularLargeColumns *)v27;
}

- (int64_t)compatibleFamily
{
  return 1;
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
      if (!v4)
      {
        v3[2](v3, @"row2Column2TextProvider", 0, 1, &v4);
        if (!v4)
        {
          v3[2](v3, @"row3Column1TextProvider", 0, 1, &v4);
          if (!v4) {
            v3[2](v3, @"row3Column2TextProvider", 0, 1, &v4);
          }
        }
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
   + 2))(v4, @"row1ImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  if (!v9)
  {
    (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
     + 2))(v4, @"row2ImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
    if (!v9) {
      (*((void (**)(id, __CFString *, uint64_t, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
    }
       + 2))(v4, @"row3ImageProvider", 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  }
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"column2Alignment", 1, &__block_literal_global_704, &v3);
}

BOOL __77__CLKComplicationTemplateModularLargeColumns__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
}

- (CLKImageProvider)row1ImageProvider
{
  return self->_row1ImageProvider;
}

- (void)setRow1ImageProvider:(CLKImageProvider *)row1ImageProvider
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

- (CLKImageProvider)row2ImageProvider
{
  return self->_row2ImageProvider;
}

- (void)setRow2ImageProvider:(CLKImageProvider *)row2ImageProvider
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

- (CLKImageProvider)row3ImageProvider
{
  return self->_row3ImageProvider;
}

- (void)setRow3ImageProvider:(CLKImageProvider *)row3ImageProvider
{
}

- (CLKTextProvider)row3Column1TextProvider
{
  return self->_row3Column1TextProvider;
}

- (void)setRow3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider
{
}

- (CLKTextProvider)row3Column2TextProvider
{
  return self->_row3Column2TextProvider;
}

- (void)setRow3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
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
  objc_storeStrong((id *)&self->_row3Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row3Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row3ImageProvider, 0);
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row2ImageProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);

  objc_storeStrong((id *)&self->_row1ImageProvider, 0);
}

@end
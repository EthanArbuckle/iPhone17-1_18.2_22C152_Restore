@interface CLKOverrideTextProvider
+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4;
+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4 weight:(double)a5;
+ (id)textProviderWithText:(id)a3 overrideBlock:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)overrideBlock;
- (unint64_t)hash;
- (void)setOverrideBlock:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CLKOverrideTextProvider

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6 = a4;
  overrideBlock = (void (**)(id, NSString *, unint64_t, id))self->_overrideBlock;
  if (overrideBlock)
  {
    v8 = overrideBlock[2](overrideBlock, self->_text, a3, v6);
  }
  else
  {
    v8 = 0;
  }
  v9 = [v8 _attributedStringWithOtherAttributesFromStyle:v6];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKOverrideTextProvider;
  if ([(CLKTextProvider *)&v9 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(CLKOverrideTextProvider *)self text];
    id v6 = [v4 text];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CLKOverrideTextProvider;
  id v3 = [(CLKTextProvider *)&v7 hash];
  id v4 = [(CLKOverrideTextProvider *)self text];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLKOverrideTextProvider;
  id v4 = [(CLKTextProvider *)&v8 copyWithZone:a3];
  if (v4 != self)
  {
    unint64_t v5 = [(CLKOverrideTextProvider *)self text];
    [(CLKOverrideTextProvider *)v4 setText:v5];

    id v6 = [(CLKOverrideTextProvider *)self overrideBlock];
    [(CLKOverrideTextProvider *)v4 setOverrideBlock:v6];
  }
  return v4;
}

+ (id)textProviderWithText:(id)a3 overrideBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = (void *)[objc_alloc((Class)objc_opt_class()) initPrivate];
  [v7 setOverrideBlock:v5];

  [v7 setText:v6];

  return v7;
}

+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4
{
  return (id)[a1 _dashTrackingTextProviderWithDashes:a3 tracking:a4 weight:1.79769313e308];
}

+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4 weight:(double)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__CLKOverrideTextProvider__dashTrackingTextProviderWithDashes_tracking_weight___block_invoke;
  v7[3] = &__block_descriptor_48_e66___NSAttributedString_32__0__NSString_8Q16__CLKTextProviderStyle_24l;
  *(double *)&v7[4] = a5;
  *(double *)&v7[5] = a4;
  id v5 = +[CLKOverrideTextProvider textProviderWithText:a3 overrideBlock:v7];

  return v5;
}

id __79__CLKOverrideTextProvider__dashTrackingTextProviderWithDashes_tracking_weight___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  objc_super v8 = 0;
  if (a2 && !a3)
  {
    id v9 = a2;
    v10 = [v7 font];
    v11 = [v10 CLKFontWithAlternativePunctuation];

    if (*(double *)(a1 + 32) != 1.79769313e308)
    {
      v12 = [v7 font];
      [v12 pointSize];
      v13 = +[CLKFont systemFontOfSize:weight:](CLKFont, "systemFontOfSize:weight:");

      v14 = [v13 fontDescriptor];
      uint64_t v15 = *MEMORY[0x263F83520];
      v16 = [v14 objectForKey:*MEMORY[0x263F83520]];
      v17 = [v11 fontDescriptor];
      uint64_t v28 = v15;
      v29[0] = v16;
      v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      v19 = [v17 fontDescriptorByAddingAttributes:v18];

      uint64_t v20 = +[CLKFont fontWithDescriptor:v19 size:0.0];

      v11 = (void *)v20;
    }
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
    uint64_t v21 = [v9 length];

    double v22 = *(double *)(a1 + 40);
    v23 = [v7 font];
    double v24 = CLKKernValueForDesignSpecTrackingValue(v23, v22);

    uint64_t v25 = *MEMORY[0x263F82288];
    v26 = [NSNumber numberWithDouble:v24];
    objc_msgSend(v8, "addAttribute:value:range:", v25, v26, 0, v21);

    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F82270], v11, 0, v21);
  }

  return v8;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (id)overrideBlock
{
  return self->_overrideBlock;
}

- (void)setOverrideBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overrideBlock, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end
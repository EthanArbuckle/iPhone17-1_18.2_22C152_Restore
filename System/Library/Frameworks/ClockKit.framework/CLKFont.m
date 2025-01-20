@interface CLKFont
+ (id)compactSoftFontOfSize:(double)a3 weight:(double)a4;
+ (id)fontWithDescriptor:(id)a3 size:(double)a4;
+ (id)fontWithName:(id)a3 size:(double)a4;
+ (id)nonAccessibleCompactSoftFontOfSize:(double)a3 weight:(double)a4;
+ (id)nonAccessibleSystemFontOfSize:(double)a3 weight:(double)a4;
+ (id)systemFontOfSize:(double)a3;
+ (id)systemFontOfSize:(double)a3 weight:(double)a4;
+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5;
- (CLKFont)fontWithSize:(double)a3;
@end

@implementation CLKFont

+ (id)systemFontOfSize:(double)a3
{
  return (id)[a1 systemFontOfSize:a3 weight:*MEMORY[0x263F83640]];
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  uint64_t v4 = *MEMORY[0x263F83568];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CLKFont;
  v5 = objc_msgSendSuper2(&v7, sel_systemFontOfSize_weight_design_, v4, a3, a4);

  return v5;
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CLKFont;
  v5 = objc_msgSendSuper2(&v7, sel_systemFontOfSize_weight_design_, a5, a3, a4);

  return v5;
}

+ (id)fontWithDescriptor:(id)a3 size:(double)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CLKFont;
  uint64_t v4 = objc_msgSendSuper2(&v6, sel_fontWithDescriptor_size_, a3, a4);

  return v4;
}

+ (id)fontWithName:(id)a3 size:(double)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CLKFont;
  uint64_t v4 = objc_msgSendSuper2(&v6, sel_fontWithName_size_, a3, a4);

  return v4;
}

+ (id)compactSoftFontOfSize:(double)a3 weight:(double)a4
{
  return (id)[a1 systemFontOfSize:*MEMORY[0x263F03B78] weight:a3 design:a4];
}

+ (id)nonAccessibleSystemFontOfSize:(double)a3 weight:(double)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v6 = [a1 systemFontOfSize:a3 weight:a4];
  objc_super v7 = [v6 fontDescriptor];
  uint64_t v13 = *MEMORY[0x263F03AC0];
  v14[0] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v9 = [v7 fontDescriptorByAddingAttributes:v8];

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLKFont;
  v10 = objc_msgSendSuper2(&v12, sel_fontWithDescriptor_size_, v9, a3);

  return v10;
}

+ (id)nonAccessibleCompactSoftFontOfSize:(double)a3 weight:(double)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v6 = [a1 compactSoftFontOfSize:a3 weight:a4];
  objc_super v7 = [v6 fontDescriptor];
  uint64_t v13 = *MEMORY[0x263F03AC0];
  v14[0] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v9 = [v7 fontDescriptorByAddingAttributes:v8];

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLKFont;
  v10 = objc_msgSendSuper2(&v12, sel_fontWithDescriptor_size_, v9, a3);

  return v10;
}

- (CLKFont)fontWithSize:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKFont;
  v3 = [(CLKFont *)&v5 fontWithSize:a3];

  return (CLKFont *)v3;
}

@end
@interface NSParagraphStyle(DC)
+ (BOOL)dc_isRTL;
+ (id)dc_mutableDefaultParagraphStyle;
@end

@implementation NSParagraphStyle(DC)

+ (BOOL)dc_isRTL
{
  return [a1 defaultWritingDirectionForLanguage:0] == 1;
}

+ (id)dc_mutableDefaultParagraphStyle
{
  v0 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  v1 = (void *)[v0 mutableCopy];

  v2 = [v1 tabStops];
  unint64_t v3 = [v2 count];

  if (v3 < 2)
  {
    [v1 setDefaultTabInterval:28.0];
  }
  else
  {
    v4 = [v1 tabStops];
    v5 = [v4 objectAtIndexedSubscript:1];
    [v5 location];
    double v7 = v6;
    v8 = [v1 tabStops];
    v9 = [v8 objectAtIndexedSubscript:0];
    [v9 location];
    [v1 setDefaultTabInterval:v7 - v10];
  }
  v11 = [MEMORY[0x263EFF8C0] array];
  [v1 setTabStops:v11];

  return v1;
}

@end
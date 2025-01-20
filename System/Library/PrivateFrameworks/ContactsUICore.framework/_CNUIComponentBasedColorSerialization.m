@interface _CNUIComponentBasedColorSerialization
+ (CGColorSpace)_createColorSpaceWithName:(id)a3;
+ (id)colorFromDictionary:(id)a3;
+ (id)dictionaryForColor:(id)a3;
+ (void)parseString:(id)a3 forComponents:(double *)a4 count:(int64_t *)a5;
@end

@implementation _CNUIComponentBasedColorSerialization

+ (id)dictionaryForColor:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:&unk_26BFD9C10 forKeyedSubscript:@"type"];
  v5 = objc_opt_new();
  id v6 = v3;
  size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[v6 CGColor]);
  id v8 = v6;
  Components = CGColorGetComponents((CGColorRef)[v8 CGColor]);
  if (NumberOfComponents)
  {
    v10 = (double *)Components;
    do
    {
      double v11 = *v10++;
      objc_msgSend(v5, "appendFormat:", @"%02x", (int)(v11 * 255.0));
      --NumberOfComponents;
    }
    while (NumberOfComponents);
  }
  id v12 = v8;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v12 CGColor]);
  v14 = CGColorSpaceGetName(ColorSpace);
  v15 = [v5 uppercaseString];
  [v4 setObject:v15 forKeyedSubscript:@"hexComponents"];

  [v4 setObject:v14 forKeyedSubscript:@"colorSpaceName"];
  return v4;
}

+ (id)colorFromDictionary:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F33678]);
  id v6 = [v4 objectForKeyedSubscript:@"hexComponents"];
  if (v6)
  {
    uint64_t v21 = 0;
    [a1 parseString:v6 forComponents:components count:&v21];
    v7 = [v4 objectForKeyedSubscript:@"colorSpaceName"];
    id v8 = (CGColorSpace *)[a1 _createColorSpaceWithName:v7];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61___CNUIComponentBasedColorSerialization_colorFromDictionary___block_invoke;
    v20[3] = &__block_descriptor_40_e5_v8__0l;
    v20[4] = v8;
    v9 = (void *)[v20 copy];
    v10 = self;
    double v11 = _Block_copy(v10);
    [v5 push:v11];

    CGColorRef v12 = CGColorCreate(v8, components);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __61___CNUIComponentBasedColorSerialization_colorFromDictionary___block_invoke_2;
    v19[3] = &__block_descriptor_40_e5_v8__0l;
    v19[4] = v12;
    v13 = (void *)[v19 copy];
    v14 = self;
    v15 = _Block_copy(v14);
    [v5 push:v15];

    v16 = [MEMORY[0x263F1C550] colorWithCGColor:v12];
  }
  else
  {
    v16 = 0;
  }

  [v5 popAllWithHandler:&__block_literal_global_73];
  id v17 = self;

  return v16;
}

+ (CGColorSpace)_createColorSpaceWithName:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3)
  {
    if (![(__CFString *)v3 length] || (id v5 = CGColorSpaceCreateWithName(v4)) == 0)
    {
      id v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      if ([(__CFString *)v4 length])
      {
        id v6 = +[CNUICoreLogProvider color_os_log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          +[_CNUIComponentBasedColorSerialization _createColorSpaceWithName:]((uint64_t)v4, v6);
        }
      }
    }
  }
  else
  {
    id v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  }

  return v5;
}

+ (void)parseString:(id)a3 forComponents:(double *)a4 count:(int64_t *)a5
{
  id v7 = a3;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v7];
  if (*a5 <= 3)
  {
    do
    {
      char v11 = 0;
      if ((objc_msgSend(v8, "_cn_scanHexChar:", &v11) & 1) == 0) {
        break;
      }
      LOBYTE(v9) = v11;
      int64_t v10 = *a5;
      a4[*a5] = (double)v9 / 255.0;
      *a5 = v10 + 1;
    }
    while (v10 < 3);
  }
}

+ (void)_createColorSpaceWithName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "Could not create colorSpace from name '%@'; will fall back to using sRGB",
    (uint8_t *)&v2,
    0xCu);
}

@end
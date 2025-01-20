@interface CNUIColorSerialization
+ (id)colorFromData:(id)a3;
+ (id)colorFromDictionary:(id)a3;
+ (id)colorFromString:(id)a3;
+ (id)colorsFromDictionaries:(id)a3;
+ (id)colorsFromString:(id)a3;
+ (id)dataForColor:(id)a3;
+ (id)dictionariesForColors:(id)a3;
+ (id)dictionaryForColor:(id)a3;
+ (id)stringForColor:(id)a3;
+ (id)stringForColors:(id)a3;
@end

@implementation CNUIColorSerialization

+ (id)stringForColors:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F334F0];
  v4 = [a1 dictionariesForColors:a3];
  v5 = (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

+ (id)colorsFromString:(id)a3
{
  v4 = (*(void (**)(void))(*MEMORY[0x263F33510] + 16))();
  v5 = [a1 colorsFromDictionaries:v4];

  return v5;
}

+ (id)dictionariesForColors:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__CNUIColorSerialization_dictionariesForColors___block_invoke;
  v5[3] = &__block_descriptor_40_e31___NSDictionary_16__0__UIColor_8l;
  v5[4] = a1;
  uint64_t v3 = objc_msgSend(a3, "_cn_map:", v5);
  return v3;
}

uint64_t __48__CNUIColorSerialization_dictionariesForColors___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dictionaryForColor:a2];
}

+ (id)colorsFromDictionaries:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CNUIColorSerialization_colorsFromDictionaries___block_invoke;
  v5[3] = &__block_descriptor_40_e31___UIColor_16__0__NSDictionary_8l;
  v5[4] = a1;
  uint64_t v3 = objc_msgSend(a3, "_cn_compactMap:", v5);
  return v3;
}

uint64_t __49__CNUIColorSerialization_colorsFromDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) colorFromDictionary:a2];
}

+ (id)stringForColor:(id)a3
{
  uint64_t v3 = [a1 dictionaryForColor:a3];
  v4 = (*(void (**)(void))(*MEMORY[0x263F334F0] + 16))();

  return v4;
}

+ (id)colorFromString:(id)a3
{
  v4 = (*(void (**)(void))(*MEMORY[0x263F33510] + 16))();
  v5 = [a1 colorFromDictionary:v4];

  return v5;
}

+ (id)dataForColor:(id)a3
{
  uint64_t v3 = [a1 dictionaryForColor:a3];
  v4 = [MEMORY[0x263F33638] dataWithObject:v3 error:0];

  return v4;
}

+ (id)colorFromData:(id)a3
{
  v4 = [MEMORY[0x263F33638] objectWithData:a3 error:0];
  if (v4)
  {
    v5 = [a1 colorFromDictionary:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)dictionaryForColor:(id)a3
{
  return +[_CNUIComponentBasedColorSerialization dictionaryForColor:a3];
}

+ (id)colorFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"type"];
  v5 = v4;
  if (v4)
  {
    if ([v4 integerValue])
    {
      id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"unsupported color type" userInfo:0];
      objc_exception_throw(v8);
    }
    v6 = +[_CNUIComponentBasedColorSerialization colorFromDictionary:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
@interface FedStatsCategoricalTypeCharacterTokenizer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (id)tokenize:(id)a3;
@end

@implementation FedStatsCategoricalTypeCharacterTokenizer

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v4 = objc_alloc_init((Class)a1);
  return v4;
}

- (id)tokenize:(id)a3
{
  if (a3)
  {
    v3 = [NSString stringWithFormat:@"%@", a3];
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "length"));
    v5 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    v6 = (void *)[v5 mutableCopy];

    [v6 addCharactersInString:@"%"];
    if ([v3 length])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = objc_msgSend(v3, "substringWithRange:", v7, 1);
        uint64_t v9 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v6];

        if (v9) {
          v10 = (__CFString *)v9;
        }
        else {
          v10 = &stru_270008ED0;
        }
        [v4 addObject:v10];

        ++v7;
      }
      while (v7 < [v3 length]);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

@end
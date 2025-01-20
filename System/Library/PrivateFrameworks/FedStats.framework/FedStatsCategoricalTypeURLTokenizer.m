@interface FedStatsCategoricalTypeURLTokenizer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (id)tokenize:(id)a3;
@end

@implementation FedStatsCategoricalTypeURLTokenizer

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v4 = objc_alloc_init(FedStatsCategoricalTypeURLTokenizer);
  return v4;
}

- (id)tokenize:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = NSURL;
    v4 = [NSString stringWithFormat:@"%@", a3];
    v5 = [v3 URLWithString:v4];

    if (v5)
    {
      v6 = [v5 host];
      uint64_t v7 = [v5 path];
      v8 = (void *)v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        v13 = 0;
      }
      else
      {
        v10 = +[FedStatsCategoricalTypeCharacterTokenizer instanceWithParameters:MEMORY[0x263EFFA78] error:0];
        v11 = [v10 tokenize:v8];
        v15[0] = v6;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
        v13 = [v12 arrayByAddingObjectsFromArray:v11];
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

@end
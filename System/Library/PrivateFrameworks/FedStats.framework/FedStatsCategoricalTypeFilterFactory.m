@interface FedStatsCategoricalTypeFilterFactory
+ (id)filterForVariant:(id)a3 parameters:(id)a4 error:(id *)a5;
+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5;
+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7;
+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4;
@end

@implementation FedStatsCategoricalTypeFilterFactory

+ (id)filterForVariant:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([@"denyList" isEqual:v7])
  {
    v9 = FedStatsCategoricalTypeDenyList;
LABEL_5:
    a5 = [(__objc2_class *)v9 instanceWithParameters:v8 error:a5];
    goto LABEL_6;
  }
  if ([@"bloom" isEqual:v7])
  {
    v9 = FedStatsCategoricalTypeBloomFilter;
    goto LABEL_5;
  }
  if (a5) {
    v11 = {;
  }
    *a5 = +[FedStatsError errorWithCode:900 description:v11];

    a5 = 0;
  }
LABEL_6:

  return a5;
}

+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([@"denyList" isEqual:v7])
  {
    v10 = FedStatsCategoricalTypeDenyList;
    uint64_t v19 = MEMORY[0x263EFFA68];
    v11 = (id *)&v19;
    v12 = &v19;
LABEL_5:
    id v15 = (id)-[__objc2_class mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:](v10, "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v8, v9, 0, 0, v12, 0, v18, v19);
    id v16 = *v11;
    v14 = v16;
    goto LABEL_7;
  }
  int v13 = [@"bloom" isEqual:v7];
  v14 = (void *)MEMORY[0x263EFFA68];
  if (v13)
  {
    v10 = FedStatsCategoricalTypeBloomFilter;
    uint64_t v18 = MEMORY[0x263EFFA68];
    v11 = (id *)&v18;
    v12 = &v18;
    goto LABEL_5;
  }
  id v16 = 0;
LABEL_7:

  return v16;
}

+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([@"denyList" isEqual:v5])
  {
    id v7 = FedStatsCategoricalTypeDenyList;
    uint64_t v16 = MEMORY[0x263EFFA68];
    id v8 = (id *)&v16;
    id v9 = &v16;
LABEL_5:
    id v12 = (id)-[__objc2_class mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:](v7, "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v6, 0, 0, v9, 0, 0, v15, v16);
    id v13 = *v8;
    v11 = v13;
    goto LABEL_7;
  }
  int v10 = [@"bloom" isEqual:v5];
  v11 = (void *)MEMORY[0x263EFFA68];
  if (v10)
  {
    id v7 = FedStatsCategoricalTypeBloomFilter;
    uint64_t v15 = MEMORY[0x263EFFA68];
    id v8 = (id *)&v15;
    id v9 = &v15;
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_7:

  return v13;
}

+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([@"denyList" isEqual:v11])
  {
    uint64_t v15 = FedStatsCategoricalTypeDenyList;
LABEL_5:
    a7 = [(__objc2_class *)v15 mutateParameters:v12 usingFieldValues:v13 assetURLs:v14 requiredFields:0 assetNames:0 error:a7];
    goto LABEL_6;
  }
  if ([@"bloom" isEqual:v11])
  {
    uint64_t v15 = FedStatsCategoricalTypeBloomFilter;
    goto LABEL_5;
  }
  if (a7) {
    v17 = {;
  }
    *a7 = +[FedStatsError errorWithCode:900 description:v17];

    a7 = 0;
  }
LABEL_6:

  return a7;
}

@end
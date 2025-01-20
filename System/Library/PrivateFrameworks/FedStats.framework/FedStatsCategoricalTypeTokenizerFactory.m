@interface FedStatsCategoricalTypeTokenizerFactory
+ (Class)stringToTokenizerClass:(id)a3 error:(id *)a4;
+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5;
+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7;
+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4;
+ (id)tokenizerForVariant:(id)a3 parameters:(id)a4 error:(id *)a5;
@end

@implementation FedStatsCategoricalTypeTokenizerFactory

+ (Class)stringToTokenizerClass:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9 = @"character";
  uint64_t v14 = objc_opt_class();
  v10 = @"delimited";
  uint64_t v15 = objc_opt_class();
  v11 = @"url";
  uint64_t v16 = objc_opt_class();
  v12 = @"ngram";
  uint64_t v17 = objc_opt_class();
  v13 = @"charactersFromUnknownSample";
  uint64_t v18 = objc_opt_class();
  v6 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v9 count:5];
  if ([v6 objectForKeyedSubscript:v5])
  {
    a4 = [v6 objectForKeyedSubscript:v5];
  }
  else if (a4) {
    v7 = {;
  }
    *a4 = +[FedStatsError errorWithCode:900 description:v7];

    a4 = 0;
  }

  return (Class)a4;
}

+ (id)tokenizerForVariant:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = objc_msgSend((id)objc_msgSend(a1, "stringToTokenizerClass:error:", a3, a5), "instanceWithParameters:error:", v8, a5);

  return v9;
}

+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a1, "stringToTokenizerClass:error:", a3, a7), "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v14, v13, v12, 0, 0, a7);

  return v15;
}

+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[a1 stringToTokenizerClass:a3 error:0];
  id v14 = (id)MEMORY[0x263EFFA68];
  id v11 = (id)[v10 mutateParameters:v8 usingFieldValues:v9 assetURLs:0 requiredFields:0 assetNames:&v14 error:0];
  id v12 = v14;

  return v12;
}

+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a1 stringToTokenizerClass:a3 error:0];
  id v11 = (id)MEMORY[0x263EFFA68];
  id v8 = (id)[v7 mutateParameters:v6 usingFieldValues:0 assetURLs:0 requiredFields:&v11 assetNames:0 error:0];
  id v9 = v11;

  return v9;
}

@end
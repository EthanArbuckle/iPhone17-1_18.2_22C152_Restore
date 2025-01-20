@interface FedStatsCategoricalTypeSampleTokenizer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeSampleTokenizer)initWithKnownListDB:(id)a3;
- (FedStatsSQLiteDenyListDatabase)knownListDB;
- (id)tokenize:(id)a3;
@end

@implementation FedStatsCategoricalTypeSampleTokenizer

- (FedStatsCategoricalTypeSampleTokenizer)initWithKnownListDB:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalTypeSampleTokenizer;
  v6 = [(FedStatsCategoricalTypeSampleTokenizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_knownListDB, a3);
  }

  return v7;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 objectForKey:@"fileName"];
  if (v7)
  {
    v8 = [v6 objectForKey:@"tableName"];
    objc_super v9 = [v6 objectForKey:@"columnName"];
    id v14 = 0;
    v10 = +[FedStatsSQLiteDenyListDatabase databaseWithFileURL:v7 tableName:v8 columnName:v9 error:&v14];
    id v11 = v14;
    if (v10)
    {
      v12 = (void *)[objc_alloc((Class)a1) initWithKnownListDB:v10];
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:101 underlyingError:v11 description:@"The URL cannot be loaded as a database"];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = (void *)[objc_alloc((Class)a1) initWithKnownListDB:0];
  }

  return v12;
}

- (id)tokenize:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F089C0] punctuationCharacterSet];
  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  v22 = v4;
  v7 = [v4 componentsSeparatedByCharactersInSet:v5];
  v8 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 length])
        {
          v15 = [(FedStatsCategoricalTypeSampleTokenizer *)self knownListDB];
          char v16 = [v15 isInDenyList:v14 partialMatch:0];

          if ((v16 & 1) == 0) {
            [v8 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    v17 = objc_msgSend(v8, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v8, "count")));
    v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "length"));
    if ([v17 length])
    {
      unint64_t v19 = 0;
      do
      {
        v20 = objc_msgSend(v17, "substringWithRange:", v19, 1);
        [v18 addObject:v20];

        ++v19;
      }
      while (v19 < [v17 length]);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  char v16 = [v13 objectForKey:@"fileName"];

  if (v16)
  {
    id v17 = +[FedStatsCategoricalTypeAssetSpecifier mutateParameters:v13 forKey:@"fileName" usingFieldValues:v14 assetURLs:v15 requiredFields:a6 assetNames:a7 error:a8];
  }
  else
  {
    id v17 = v13;
  }
  v18 = v17;

  return v18;
}

- (FedStatsSQLiteDenyListDatabase)knownListDB
{
  return self->_knownListDB;
}

- (void).cxx_destruct
{
}

@end
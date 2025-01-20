@interface FedStatsCategoricalTypeAssetSpecifier
+ (id)assetSpecifierWithKey:(id)a3 requiredForCollectionKey:(BOOL)a4 error:(id *)a5;
+ (id)mutateParameters:(id)a3 forKey:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 requiredFields:(id *)a7 assetNames:(id *)a8 error:(id *)a9;
- (BOOL)isDynamic;
- (BOOL)isRequiredForCollectionKey;
- (FedStatsCategoricalTypeAssetSpecifier)initWithAssetSpecifierKey:(id)a3 dynamic:(BOOL)a4 requiredForCollectionKey:(BOOL)a5;
- (NSRegularExpression)regex;
- (NSString)assetSpecifierKey;
- (id)assetSpecifierValueForDataPoint:(id)a3 error:(id *)a4;
- (id)parameters;
@end

@implementation FedStatsCategoricalTypeAssetSpecifier

- (FedStatsCategoricalTypeAssetSpecifier)initWithAssetSpecifierKey:(id)a3 dynamic:(BOOL)a4 requiredForCollectionKey:(BOOL)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FedStatsCategoricalTypeAssetSpecifier;
  v10 = [(FedStatsCategoricalTypeAssetSpecifier *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetSpecifierKey, a3);
    v11->_isDynamic = a4;
    v11->_isRequiredForCollectionKey = a5;
    v12 = [NSString stringWithFormat:@"\\{%@+\\}", @"[0-9A-Za-z_]"];
    uint64_t v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v12 options:16 error:0];
    regex = v11->_regex;
    v11->_regex = (NSRegularExpression *)v13;
  }
  return v11;
}

+ (id)assetSpecifierWithKey:(id)a3 requiredForCollectionKey:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [NSString stringWithFormat:@"^(%@*(\\{%@+\\})*)*%@*$", @"[0-9A-Za-z_]", @"[0-9A-Za-z_]", @"[0-9A-Za-z_]"];
  id v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v8 options:16 error:0];
  v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length"));
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 range];
    v14 = objc_msgSend(v7, "substringWithRange:", v12, v13);
    if ([v14 isEqualToString:v7])
    {
      int v15 = 0;
    }
    else
    {
      if (a5)
      {
        *a5 = +[FedStatsError errorWithCode:302 description:@"The asset provider key is malformed"];
      }
      int v15 = 1;
    }
  }
  else
  {
    if (a5)
    {
      *a5 = +[FedStatsError errorWithCode:302 description:@"The asset provider key is malformed"];
    }
    int v15 = 1;
  }

  if (v15)
  {
    objc_super v16 = 0;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"^%@+$", @"[0-9A-Za-z_]"];
    v18 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v17 options:16 error:0];
    v19 = objc_msgSend(v18, "firstMatchInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length"));
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = [v19 range];
      v23 = objc_msgSend(v7, "substringWithRange:", v21, v22);
      int v24 = [v7 isEqualToString:v23];

      uint64_t v25 = v24 ^ 1u;
    }
    else
    {
      uint64_t v25 = 1;
    }

    objc_super v16 = [[FedStatsCategoricalTypeAssetSpecifier alloc] initWithAssetSpecifierKey:v7 dynamic:v25 requiredForCollectionKey:v6];
  }

  return v16;
}

+ (id)mutateParameters:(id)a3 forKey:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 requiredFields:(id *)a7 assetNames:(id *)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = [v14 objectForKey:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v14;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = v17;
    id v36 = 0;
    v20 = +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:v18 requiredForCollectionKey:0 error:&v36];
    id v21 = v36;
    uint64_t v22 = v21;
    if (v20)
    {
      if (v16)
      {
        id v35 = v21;
        v23 = [v20 assetSpecifierValueForDataPoint:v16 error:&v35];
        id v33 = v35;

        if (v23)
        {
          id v17 = v34;
          if (!v34)
          {
            if (a8)
            {
              *a8 = [*a8 arrayByAddingObject:v23];
            }
            id v19 = v14;
            goto LABEL_31;
          }
          int v24 = [v34 objectForKey:v23];
          if (v24)
          {
            id v19 = (id)[v14 mutableCopy];
            [v19 setObject:v24 forKey:v15];
          }
          else
          {
            if (a9)
            {
              v31 = [NSString stringWithFormat:@"Missing asset URL for '%@'", v18];
              *a9 = +[FedStatsError errorWithCode:300 description:v31];
            }
            id v19 = 0;
          }
        }
        else
        {
          if (a9)
          {
            v30 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v18];
            v29 = v33;
            *a9 = +[FedStatsError errorWithCode:300 underlyingError:v33 description:v30];

            id v19 = 0;
            id v17 = v34;
LABEL_32:

            goto LABEL_33;
          }
          id v19 = 0;
        }
        id v17 = v34;
LABEL_31:
        v29 = v33;
        goto LABEL_32;
      }
      if (a7)
      {
        id v27 = *a7;
        v28 = [v20 parameters];
        *a7 = [v27 arrayByAddingObjectsFromArray:v28];
      }
      id v19 = v14;
    }
    else
    {
      if (a9)
      {
        v26 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v18];
        *a9 = +[FedStatsError errorWithCode:300 underlyingError:v22 description:v26];
      }
      id v19 = 0;
    }
    v29 = v22;
    id v17 = v34;
LABEL_33:

    goto LABEL_34;
  }
  if (a9)
  {
    uint64_t v25 = [NSString stringWithFormat:@"Value for '%@' must be either a string or URL", v15];
    *a9 = +[FedStatsError errorWithCode:302 description:v25];
  }
  id v19 = 0;
LABEL_34:

  return v19;
}

- (id)assetSpecifierValueForDataPoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [(FedStatsCategoricalTypeAssetSpecifier *)self assetSpecifierKey];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v7 length];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    do
    {
      v11 = [(FedStatsCategoricalTypeAssetSpecifier *)self regex];
      uint64_t v12 = objc_msgSend(v11, "firstMatchInString:options:range:", v7, 16, v10, v9);

      if (!v12) {
        break;
      }
      uint64_t v13 = [v12 range];
      id v15 = objc_msgSend(v7, "substringWithRange:", v13 + 1, v14 - 2);
      uint64_t v16 = [v5 objectForKey:v15];
      if (!v16)
      {
        if (a4)
        {
          *a4 = +[FedStatsError errorWithCode:601 description:@"No value in data to insert into asset specifier"];
        }

        id v22 = 0;
        goto LABEL_10;
      }
      id v17 = (void *)v16;
      v18 = [NSString stringWithFormat:@"%@", v16];
      uint64_t v19 = [v12 range];
      objc_msgSend(v7, "replaceCharactersInRange:withString:", v19, v20, v18);
      uint64_t v21 = [v12 range];
      uint64_t v10 = v21 + [v18 length];
      uint64_t v9 = [v7 length] - v10;
    }
    while (v9);
  }
  id v22 = v7;
LABEL_10:

  return v22;
}

- (id)parameters
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(FedStatsCategoricalTypeAssetSpecifier *)self regex];
  v4 = [(FedStatsCategoricalTypeAssetSpecifier *)self assetSpecifierKey];
  id v5 = [(FedStatsCategoricalTypeAssetSpecifier *)self assetSpecifierKey];
  BOOL v6 = objc_msgSend(v3, "matchesInString:options:range:", v4, 16, 0, objc_msgSend(v5, "length"));

  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [(FedStatsCategoricalTypeAssetSpecifier *)self assetSpecifierKey];
        uint64_t v15 = [v13 range];
        id v17 = objc_msgSend(v14, "substringWithRange:", v15 + 1, v16 - 2);
        [v7 addObject:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (BOOL)isRequiredForCollectionKey
{
  return self->_isRequiredForCollectionKey;
}

- (NSString)assetSpecifierKey
{
  return self->_assetSpecifierKey;
}

- (NSRegularExpression)regex
{
  return (NSRegularExpression *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_assetSpecifierKey, 0);
}

@end
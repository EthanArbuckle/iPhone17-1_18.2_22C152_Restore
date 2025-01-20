@interface FedStatsCategoricalTypeBloomFilter
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeBloomFilter)initWithBloomFilter:(id)a3 transformVariant:(id)a4;
- (NSString)transformVariant;
- (_PASBloomFilter)bloomFilter;
- (id)filter:(id)a3;
@end

@implementation FedStatsCategoricalTypeBloomFilter

- (FedStatsCategoricalTypeBloomFilter)initWithBloomFilter:(id)a3 transformVariant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalTypeBloomFilter;
  v9 = [(FedStatsCategoricalTypeBloomFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bloomFilter, a3);
    objc_storeStrong((id *)&v10->_transformVariant, a4);
  }

  return v10;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"fileName"];
  if (!v6)
  {
    if (a4) {
      v10 = {;
    }
      uint64_t v13 = 100;
LABEL_11:
      +[FedStatsError errorWithCode:v13 description:v10];
      objc_super v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_12:
    objc_super v12 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4) {
      v10 = {;
    }
      uint64_t v13 = 101;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v7 = (void *)MEMORY[0x263F61E00];
  id v8 = [v6 filePathURL];
  v9 = [v8 path];
  v10 = [v7 bloomFilterWithPathToFile:v9];

  if (v10)
  {
    v11 = [v5 objectForKey:@"transformVariant"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a4) {
        v14 = {;
      }
        *a4 = +[FedStatsError errorWithCode:101 description:v14];
      }
      objc_super v12 = 0;
    }
    else
    {
      objc_super v12 = [[FedStatsCategoricalTypeBloomFilter alloc] initWithBloomFilter:v10 transformVariant:v11];
    }
  }
  else
  {
    if (!a4)
    {
      objc_super v12 = 0;
      goto LABEL_19;
    }
    v11 = [NSString stringWithFormat:@"Cannot load Bloom filter at '%@'", v6];
    +[FedStatsError errorWithCode:101 description:v11];
    objc_super v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:
LABEL_20:

  return v12;
}

- (id)filter:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v14 = 0;
    goto LABEL_24;
  }
  id v5 = [NSString stringWithFormat:@"%@", v4];
  v6 = [(FedStatsCategoricalTypeBloomFilter *)self transformVariant];
  int v7 = [v6 isEqualToString:@"extractHost"];

  if (v7)
  {
    id v8 = [NSURL URLWithString:v5];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 host];
      v11 = [v9 host];
      uint64_t v12 = [v11 length];

      if (v10)
      {
        if (v12)
        {
          uint64_t v13 = [v9 host];
LABEL_13:

          id v5 = (void *)v13;
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v15 = [(FedStatsCategoricalTypeBloomFilter *)self transformVariant];
    int v16 = [v15 isEqualToString:@"extractDomain"];

    if (!v16)
    {
LABEL_14:
      v22 = [v5 dataUsingEncoding:4];
      v23 = v22;
      if (v22)
      {
        id v24 = v22;
        CC_SHA256((const void *)[v24 bytes], objc_msgSend(v24, "length"), md);
        uint64_t v25 = *(void *)md;
        if (*(uint64_t *)md < 0) {
          uint64_t v25 = -*(void *)md;
        }
        uint64_t v31 = v25;
        v26 = [MEMORY[0x263EFF8F8] dataWithBytes:&v31 length:8];
        uint64_t v27 = [(FedStatsCategoricalTypeBloomFilter *)self bloomFilter];
        v28 = [(id)v27 computeHashesWithSeed:1 forData:v26 reuse:0];

        v29 = [(FedStatsCategoricalTypeBloomFilter *)self bloomFilter];
        LOBYTE(v27) = [v29 getWithHashes:v28];

        id v14 = 0;
        if ((v27 & 1) == 0) {
          id v14 = v4;
        }
      }
      else
      {
        id v14 = 0;
      }

      goto LABEL_23;
    }
    v17 = [NSURL URLWithString:v5];
    v9 = v17;
    if (v17)
    {
      v18 = [v17 host];
      v19 = [v9 host];
      uint64_t v20 = [v19 length];

      if (v18)
      {
        if (v20)
        {
          v21 = [v9 host];
          uint64_t v13 = objc_msgSend(v21, "safari_highLevelDomainFromHost");

          id v5 = v21;
          goto LABEL_13;
        }
      }
    }
  }

  id v14 = 0;
LABEL_23:

LABEL_24:
  return v14;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return +[FedStatsCategoricalTypeAssetSpecifier mutateParameters:a3 forKey:@"fileName" usingFieldValues:a4 assetURLs:a5 requiredFields:a6 assetNames:a7 error:a8];
}

- (_PASBloomFilter)bloomFilter
{
  return self->_bloomFilter;
}

- (NSString)transformVariant
{
  return self->_transformVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformVariant, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

@end
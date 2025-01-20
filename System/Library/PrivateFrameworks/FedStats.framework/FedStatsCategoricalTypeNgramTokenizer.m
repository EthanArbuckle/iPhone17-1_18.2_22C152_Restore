@interface FedStatsCategoricalTypeNgramTokenizer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (BOOL)removePunctuation;
- (BOOL)tokenizeLocation;
- (BOOL)tokenizeNumber;
- (BOOL)tokenizePerson;
- (FedStatsCategoricalTypeNgramTokenizer)initWithRemovePunctuation:(BOOL)a3 shuffleMethod:(id)a4 popularWordsDB:(id)a5 tokenizePerson:(BOOL)a6 tokenizeLocation:(BOOL)a7 tokenizeNumber:(BOOL)a8;
- (FedStatsSQLiteCategoryDatabase)popularWordsDB;
- (NSString)shuffleMethod;
- (id)tokenize:(id)a3;
- (id)tokenizeSentence:(id)a3;
- (void)shuffleWords:(id)a3;
@end

@implementation FedStatsCategoricalTypeNgramTokenizer

- (FedStatsCategoricalTypeNgramTokenizer)initWithRemovePunctuation:(BOOL)a3 shuffleMethod:(id)a4 popularWordsDB:(id)a5 tokenizePerson:(BOOL)a6 tokenizeLocation:(BOOL)a7 tokenizeNumber:(BOOL)a8
{
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FedStatsCategoricalTypeNgramTokenizer;
  v17 = [(FedStatsCategoricalTypeNgramTokenizer *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_removePunctuation = a3;
    objc_storeStrong((id *)&v17->_shuffleMethod, a4);
    objc_storeStrong((id *)&v18->_popularWordsDB, a5);
    v18->_tokenizePerson = a6;
    v18->_tokenizeLocation = a7;
    v18->_tokenizeNumber = a8;
  }

  return v18;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"shuffleMethod"];
  v7 = v6;
  if (v6)
  {
    if (([v6 isEqualToString:@"popular"] & 1) == 0
      && ([v7 isEqualToString:@"nonPopular"] & 1) == 0)
    {
      if (!a4)
      {
LABEL_15:
        v13 = 0;
        goto LABEL_18;
      v10 = };
      *a4 = +[FedStatsError errorWithCode:101 description:v10];
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v8 = [v5 objectForKey:@"fileName"];
    if (!v8)
    {
      if (a4)
      {
        +[FedStatsError errorWithCode:300 description:@"No popular words downloaded."];
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    v9 = (void *)v8;
    id v23 = 0;
    v10 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v8 minIndex:0x7FFFFFFFFFFFFFFFLL maxIndex:0x7FFFFFFFFFFFFFFFLL checkForPrimaryKey:1 error:&v23];
    id v11 = v23;
    if (v11)
    {
      v12 = v11;
      if (a4)
      {
        *a4 = +[FedStatsError errorWithCode:101 underlyingError:v11 description:@"Load popular words for database failed."];
      }

      goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
  }
  v14 = [v5 objectForKey:@"removePunctuation"];
  uint64_t v15 = [v14 BOOLValue];

  id v16 = [v5 objectForKey:@"tokenizePerson"];
  uint64_t v17 = [v16 BOOLValue];

  v18 = [v5 objectForKey:@"tokenizeLocation"];
  uint64_t v19 = [v18 BOOLValue];

  objc_super v20 = [v5 objectForKey:@"tokenizeNumber"];
  uint64_t v21 = [v20 BOOLValue];

  v13 = [[FedStatsCategoricalTypeNgramTokenizer alloc] initWithRemovePunctuation:v15 shuffleMethod:v7 popularWordsDB:v10 tokenizePerson:v17 tokenizeLocation:v19 tokenizeNumber:v21];
LABEL_18:

  return v13;
}

- (id)tokenizeSentence:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = objc_alloc(MEMORY[0x263F14038]);
    v18[0] = *MEMORY[0x263F13FB8];
    uint64_t v7 = v18[0];
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v9 = (void *)[v6 initWithTagSchemes:v8];

    [v9 setString:v4];
    uint64_t v10 = [v4 length];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__FedStatsCategoricalTypeNgramTokenizer_tokenizeSentence___block_invoke;
    v15[3] = &unk_265311198;
    v15[4] = self;
    id v11 = v5;
    id v16 = v11;
    id v17 = v4;
    objc_msgSend(v9, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v10, 0, v7, 4, v15);
    v12 = v17;
    id v13 = v11;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __58__FedStatsCategoricalTypeNgramTokenizer_tokenizeSentence___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  if ((([v11 isEqualToString:*MEMORY[0x263F13F90]] & 1) != 0
     || [v11 isEqualToString:*MEMORY[0x263F13FC8]])
    && ([*(id *)(a1 + 32) removePunctuation] & 1) != 0)
  {
    goto LABEL_15;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F13F70]]
    && [*(id *)(a1 + 32) tokenizePerson])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = kHuffmanPersonEntity;
LABEL_13:
    [v7 addObject:*v8];
    goto LABEL_15;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F13F78]]
    && [*(id *)(a1 + 32) tokenizeLocation])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = kHuffmanLocationEntity;
    goto LABEL_13;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F13F50]]
    && [*(id *)(a1 + 32) tokenizeNumber])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = kHuffmanNumberEntity;
    goto LABEL_13;
  }
  v9 = *(void **)(a1 + 40);
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a3, a4);
  [v9 addObject:v10];

LABEL_15:
}

- (void)shuffleWords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FedStatsCategoricalTypeNgramTokenizer *)self shuffleMethod];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(FedStatsCategoricalTypeNgramTokenizer *)self popularWordsDB];

    if (v7)
    {
      uint64_t v8 = [(FedStatsCategoricalTypeNgramTokenizer *)self popularWordsDB];
      id v14 = 0;
      v9 = [v8 encodeCategories:v4 error:&v14];
      id v10 = v14;

      if (!v10)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __54__FedStatsCategoricalTypeNgramTokenizer_shuffleWords___block_invoke;
        v11[3] = &unk_2653111C0;
        id v12 = v9;
        id v13 = self;
        [v4 sortUsingComparator:v11];
      }
    }
  }
}

uint64_t __54__FedStatsCategoricalTypeNgramTokenizer_shuffleWords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v5];
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    unint64_t v9 = -1;
  }
  id v10 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) objectForKey:v6];
    unint64_t v12 = [v11 unsignedIntegerValue];
  }
  else
  {
    unint64_t v12 = -1;
  }
  id v13 = [*(id *)(a1 + 40) shuffleMethod];
  int v14 = [v13 isEqualToString:@"popular"];

  if (v9 < v12) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 1;
  }
  if (v9 > v12) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = 1;
  }
  if (v14) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v16;
  }

  return v17;
}

- (id)tokenize:(id)a3
{
  id v4 = [(FedStatsCategoricalTypeNgramTokenizer *)self tokenizeSentence:a3];
  if ([v4 count])
  {
    [(FedStatsCategoricalTypeNgramTokenizer *)self shuffleWords:v4];
    uint64_t v5 = [v4 count];
    uint64_t v6 = v5 - 1;
    if (v5 != 1)
    {
      do
        [v4 insertObject:@"<BT>" atIndex:v6--];
      while (v6);
    }
    uint64_t v7 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = [v13 objectForKey:@"fileName"];

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

- (BOOL)removePunctuation
{
  return self->_removePunctuation;
}

- (NSString)shuffleMethod
{
  return self->_shuffleMethod;
}

- (FedStatsSQLiteCategoryDatabase)popularWordsDB
{
  return self->_popularWordsDB;
}

- (BOOL)tokenizePerson
{
  return self->_tokenizePerson;
}

- (BOOL)tokenizeLocation
{
  return self->_tokenizeLocation;
}

- (BOOL)tokenizeNumber
{
  return self->_tokenizeNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularWordsDB, 0);
  objc_storeStrong((id *)&self->_shuffleMethod, 0);
}

@end
@interface BMBehaviorRetriever
- (BMBehaviorRetriever)init;
- (BMBehaviorRetriever)initWithURL:(id)a3;
- (BMBehaviorRetriever)initWithURL:(id)a3 taskSpecificItemTypes:(id)a4;
- (BMBehaviorStorage)storage;
- (id)retrieveRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 error:(id *)a12;
- (id)retrieveRulesWithFilters:(id)a3;
- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5;
- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6;
- (unint64_t)fetchLimit;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setStorage:(id)a3;
@end

@implementation BMBehaviorRetriever

- (BMBehaviorRetriever)init
{
  v3 = +[BMBehaviorStorage defaultURL];
  v4 = [(BMBehaviorRetriever *)self initWithURL:v3];

  return v4;
}

- (BMBehaviorRetriever)initWithURL:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v6 = [v4 set];
  v7 = [(BMBehaviorRetriever *)self initWithURL:v5 taskSpecificItemTypes:v6];

  return v7;
}

- (BMBehaviorRetriever)initWithURL:(id)a3 taskSpecificItemTypes:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BMBehaviorRetriever;
  v8 = [(BMBehaviorRetriever *)&v21 init];
  if (v8)
  {
    v9 = [[BMBehaviorStorage alloc] initWithURL:v6 readOnly:1];
    storage = v8->_storage;
    v8->_storage = v9;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          +[BMItemType registerItemType:](BMItemType, "registerItemType:", *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }

    v8->_fetchLimit = 2048;
  }

  return v8;
}

- (id)retrieveRulesWithFilters:(id)a3
{
  return [(BMBehaviorRetriever *)self retrieveRulesWithSupport:a3 confidence:0.0 filters:0.0];
}

- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5
{
  if (a5)
  {
    v8 = [(BMBehaviorRetriever *)self retrieveRulesWithSupport:a5 confidence:0 filters:a3 error:a4];
  }
  else
  {
    v9 = [MEMORY[0x263EFFA08] set];
    v8 = [(BMBehaviorRetriever *)self retrieveRulesWithSupport:v9 confidence:0 filters:a3 error:a4];
  }
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v10;

  return v11;
}

- (id)retrieveRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = [(BMBehaviorRetriever *)self storage];
  uint64_t v12 = [v11 fetchRulesWithSupport:v10 confidence:self->_fetchLimit filters:a6 limit:a3 error:a4];

  return v12;
}

- (id)retrieveRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 error:(id *)a12
{
  id v22 = a11;
  uint64_t v23 = [(BMBehaviorRetriever *)self storage];
  v24 = [v23 fetchRulesWithAbsoluteSupport:a3 support:a9 confidence:a10 conviction:v22 lift:self->_fetchLimit rulePowerFactor:a12 uniqueDaysLastWeek:a4 uniqueDaysTotal:a5 filters:a6 limit:a7 error:a8];

  return v24;
}

- (BMBehaviorStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
}

@end
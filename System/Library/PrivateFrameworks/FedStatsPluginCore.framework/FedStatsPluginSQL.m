@interface FedStatsPluginSQL
- (BMSQLDatabase)database;
- (FedStatsPluginSQL)initWithError:(id *)a3;
- (id)runQuery:(id)a3 withError:(id *)a4;
- (void)setDatabase:(id)a3;
@end

@implementation FedStatsPluginSQL

- (FedStatsPluginSQL)initWithError:(id *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)FedStatsPluginSQL;
  v4 = [(FedStatsPluginSQL *)&v28 init];
  if (!v4) {
    goto LABEL_9;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F2A8E0]) initWithPrivileges:0 isColumnAccessLoggingEnabled:1];
  v6 = v5;
  if (!v5)
  {
    if (!a3)
    {
LABEL_15:

      v20 = 0;
      goto LABEL_16;
    }
    v10 = [NSString stringWithFormat:@"Could not create the BIOME database"];
    *a3 = +[FedStatsPluginError errorWithCode:400 description:v10];
LABEL_14:

    goto LABEL_15;
  }
  [v5 resetColumnAccessLog];
  id v27 = 0;
  v7 = @"strip_url";
  char v8 = [v6 registerFunctionWithName:@"strip_url" numArgs:1 function:&__block_literal_global_1 userData:0 error:&v27];
  id v9 = v27;
  v10 = v9;
  if ((v8 & 1) == 0) {
    goto LABEL_10;
  }

  id v26 = 0;
  v7 = @"extract_host";
  char v11 = [v6 registerFunctionWithName:@"extract_host" numArgs:1 function:&__block_literal_global_48 userData:0 error:&v26];
  id v12 = v26;
  v10 = v12;
  if ((v11 & 1) == 0) {
    goto LABEL_10;
  }

  id v25 = 0;
  v7 = @"sha1";
  char v13 = [v6 registerFunctionWithName:@"sha1" numArgs:1 function:&__block_literal_global_50 userData:0 error:&v25];
  id v14 = v25;
  v10 = v14;
  if ((v13 & 1) == 0) {
    goto LABEL_10;
  }

  id v24 = 0;
  v7 = @"bit_string_to_int";
  char v15 = [v6 registerFunctionWithName:@"bit_string_to_int" numArgs:1 function:&__block_literal_global_53 userData:0 error:&v24];
  id v16 = v24;
  v10 = v16;
  if ((v15 & 1) == 0
    || (v16,
        id v23 = 0,
        v7 = @"tokenize_and_sample_unigram_from_ngram",
        char v17 = [v6 registerFunctionWithName:@"tokenize_and_sample_unigram_from_ngram" numArgs:1 function:&__block_literal_global_55 userData:0 error:&v23], v18 = v23, v10 = v18, (v17 & 1) == 0))
  {
LABEL_10:
    if (a3)
    {
      v21 = [NSString stringWithFormat:@"Cannot register UDF '%@' with Biome DB", v7];
      *a3 = +[FedStatsPluginError errorWithCode:300 underlyingError:v10 description:v21];
    }
    goto LABEL_14;
  }

  database = v4->_database;
  v4->_database = (BMSQLDatabase *)v6;

LABEL_9:
  v20 = v4;
LABEL_16:

  return v20;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  v3 = [a2 objectAtIndexedSubscript:0];
  v4 = [v2 stringWithFormat:@"%@", v3];

  v5 = [NSURL URLWithString:v4];
  v6 = NSString;
  v7 = [v5 scheme];
  char v8 = [v5 host];
  id v9 = [v5 path];
  v10 = [v6 stringWithFormat:@"%@://%@%@", v7, v8, v9];

  return v10;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  v3 = [a2 objectAtIndexedSubscript:0];
  v4 = [v2 stringWithFormat:@"%@", v3];

  v5 = [NSURL URLWithString:v4];
  v6 = [v5 host];

  return v6;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = 0;
  if (isKindOfClass)
  {
    v6 = (void *)MEMORY[0x263F3C0E8];
    v7 = [v2 objectAtIndexedSubscript:0];
    v5 = [v6 SHA1AsBitString:v7];
  }
  return v5;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F3C0E8];
  v3 = [a2 objectAtIndexedSubscript:0];
  v4 = [v2 bitStringToInt:v3];

  return v4;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F3C0E8];
  v3 = [a2 objectAtIndexedSubscript:0];
  v4 = [v2 tokenizeAndSampleUnigramFromNgram:v3];

  return v4;
}

- (id)runQuery:(id)a3 withError:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(FedStatsPluginSQL *)self database];
  [v6 resetColumnAccessLog];

  v40 = v5;
  v10 = v9 = char v8 = v7 = (void *)[v5 copy];

  v37 = self;
  char v11 = [(FedStatsPluginSQL *)self database];
  v39 = (void *)v10;
  id v12 = [v11 executeQuery:@"%@", v10];

  v41 = [MEMORY[0x263F3C0D8] samplerWithCount:*MEMORY[0x263F3C0F0]];
  if ([v12 next])
  {
    do
    {
      char v13 = (void *)MEMORY[0x263EFF9A0];
      id v14 = [v12 columns];
      char v15 = objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v16 = [v12 columns];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v48 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v22 = [MEMORY[0x263EFF9D0] null];
            [v15 setObject:v22 forKey:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v18);
      }

      id v23 = [v12 row];
      [v15 addEntriesFromDictionary:v23];

      [v41 addItem:v15];
    }
    while (([v12 next] & 1) != 0);
  }
  id v24 = [v12 error];

  if (!v24)
  {
    id v26 = [v41 getResults];
    if (![v26 count])
    {
      id v27 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24DF73000, v27, OS_LOG_TYPE_INFO, "The returned SQL query result from BIOME is empty", buf, 2u);
      }
    }
    id v25 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    objc_super v28 = [(FedStatsPluginSQL *)v37 database];
    v29 = [v28 accessedColumns];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v42 + 1) + 8 * j) columns];
          [v25 unionSet:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v31);
    }

    if (![v25 count])
    {
      v35 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24DF73000, v35, OS_LOG_TYPE_INFO, "The returned SQL accessed columns from BIOME is empty", buf, 2u);
      }
    }
    goto LABEL_28;
  }
  if (a4)
  {
    id v25 = [v12 error];
    +[FedStatsPluginError errorWithCode:400 underlyingError:v25 description:@"Query execution failed"];
    id v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_30;
  }
  id v26 = 0;
LABEL_30:

  return v26;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
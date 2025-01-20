@interface FedStatsPluginSQLQueryValidator
+ (id)isValidSQLQuery:(id)a3 forNamespaceID:(id)a4 possibleError:(id *)a5;
+ (id)parseQueryPermissionList:(id)a3 error:(id *)a4;
+ (id)sharedInstanceWithError:(id *)a3;
- (FedStatsPluginSQLQueryValidator)initWithAllowList:(id)a3 blockList:(id)a4;
- (NSDictionary)allowList;
- (NSDictionary)blockList;
- (void)setAllowList:(id)a3;
- (void)setBlockList:(id)a3;
@end

@implementation FedStatsPluginSQLQueryValidator

- (FedStatsPluginSQLQueryValidator)initWithAllowList:(id)a3 blockList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsPluginSQLQueryValidator;
  v9 = [(FedStatsPluginSQLQueryValidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allowList, a3);
    objc_storeStrong((id *)&v10->_blockList, a4);
  }

  return v10;
}

+ (id)parseQueryPermissionList:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [NSDictionary dictionaryWithContentsOfURL:v5];
  id v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      +[FedStatsPluginError errorWithCode:300 description:@"Cannot load allow-list from class bundle file"];
      v13 = 0;
      id v14 = 0;
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      id v14 = 0;
      id v28 = 0;
    }
    goto LABEL_34;
  }
  id v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v9 = [v7 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  id v11 = 0;
  objc_super v12 = 0;
  v13 = 0;
  id v14 = 0;
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v15 = *(void *)v47;
  id v34 = v5;
  v39 = v9;
  v40 = a4;
  uint64_t v32 = *(void *)v47;
LABEL_4:
  uint64_t v16 = 0;
  v17 = v12;
  uint64_t v33 = v10;
LABEL_5:
  if (*(void *)v47 != v15)
  {
    uint64_t v18 = v16;
    objc_enumerationMutation(v9);
    uint64_t v16 = v18;
  }
  uint64_t v36 = v16;
  uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * v16);
  v20 = objc_msgSend(v7, "objectForKey:", v19, v32);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = v19;
    objc_super v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v20;
    uint64_t v21 = [v11 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (!v21) {
      goto LABEL_17;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v43;
    v37 = v7;
    v38 = v8;
LABEL_10:
    uint64_t v24 = 0;
    v25 = v13;
    v26 = v14;
    while (1)
    {
      if (*(void *)v43 != v23) {
        objc_enumerationMutation(v11);
      }
      uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v41 = v26;
      v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v27 options:16 error:&v41];
      id v14 = v41;

      if (!v13)
      {
        v29 = v40;
        if (v40)
        {
          v30 = +[FedStatsPluginError errorWithCode:300 underlyingError:v14 description:@"Permission list has a malformed regex value"];
          v25 = 0;
LABEL_26:
          id v5 = v34;
          id v7 = v37;
          v9 = v39;
          id *v29 = v30;
LABEL_31:

          v13 = v25;
          id v8 = v38;
          goto LABEL_32;
        }
        v25 = 0;
LABEL_30:
        id v5 = v34;
        id v7 = v37;
        v9 = v39;
        goto LABEL_31;
      }
      [v12 addObject:v13];
      ++v24;
      v25 = v13;
      v26 = v14;
      if (v22 == v24)
      {
        uint64_t v22 = [v11 countByEnumeratingWithState:&v42 objects:v50 count:16];
        id v7 = v37;
        id v8 = v38;
        if (v22) {
          goto LABEL_10;
        }
LABEL_17:

        [v8 setObject:v12 forKey:v35];
        uint64_t v16 = v36 + 1;
        v17 = v12;
        uint64_t v15 = v32;
        v9 = v39;
        a4 = v40;
        if (v36 + 1 == v33)
        {
          uint64_t v10 = [v39 countByEnumeratingWithState:&v46 objects:v51 count:16];
          id v5 = v34;
          if (!v10)
          {
LABEL_19:

            id v28 = v8;
            v20 = v11;
            goto LABEL_33;
          }
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    v29 = v40;
    if (v40)
    {
      v30 = +[FedStatsPluginError errorWithCode:300 description:@"Permission list value has a non-string item"];
      id v14 = v26;
      goto LABEL_26;
    }
    id v14 = v26;
    goto LABEL_30;
  }
  if (a4)
  {
    *a4 = +[FedStatsPluginError errorWithCode:300 description:@"Permission list has a non-list value"];
  }
  objc_super v12 = v17;
  id v5 = v34;
LABEL_32:

  id v28 = 0;
LABEL_33:

LABEL_34:
  return v28;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FedStatsPluginSQLQueryValidator_sharedInstanceWithError___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceWithError__dispatchToken_0 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&sharedInstanceWithError__dispatchToken_0, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) sharedInstanceWithError__error;
LABEL_4:
  v4 = (void *)sharedInstanceWithError__sharedInstance_0;
  return v4;
}

void __59__FedStatsPluginSQLQueryValidator_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 URLForResource:@"FedStatsPluginSQLQueryAllowList" withExtension:@"plist"];
    if (v4)
    {
      id v20 = 0;
      id v5 = +[FedStatsPluginSQLQueryValidator parseQueryPermissionList:v4 error:&v20];
      id v6 = v20;
      if (v5)
      {
        id v7 = [v3 URLForResource:@"FedStatsPluginSQLQueryBlockList" withExtension:@"plist"];
        if (v7)
        {
          id v19 = v6;
          id v8 = +[FedStatsPluginSQLQueryValidator parseQueryPermissionList:v7 error:&v19];
          id v9 = v19;

          if (v8)
          {
            uint64_t v10 = [objc_alloc(*(Class *)(a1 + 32)) initWithAllowList:v5 blockList:v8];
            id v11 = (void *)sharedInstanceWithError__sharedInstance_0;
            sharedInstanceWithError__sharedInstance_0 = v10;
          }
          else
          {
            uint64_t v18 = +[FedStatsPluginError errorWithCode:300 underlyingError:v9 description:@"Cannot create block-list"];
            id v11 = (void *)sharedInstanceWithError__error;
            sharedInstanceWithError__error = v18;
          }

          id v6 = v9;
        }
        else
        {
          uint64_t v17 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot find block-list from class bundle"];
          id v8 = (void *)sharedInstanceWithError__error;
          sharedInstanceWithError__error = v17;
        }
      }
      else
      {
        uint64_t v16 = +[FedStatsPluginError errorWithCode:300 underlyingError:v6 description:@"Cannot create allow-list"];
        id v7 = (void *)sharedInstanceWithError__error;
        sharedInstanceWithError__error = v16;
      }
    }
    else
    {
      uint64_t v14 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot find allow-list from class bundle"];
      uint64_t v15 = (void *)sharedInstanceWithError__error;
      sharedInstanceWithError__error = v14;
    }
  }
  else
  {
    uint64_t v12 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot load class bundle"];
    v13 = (void *)sharedInstanceWithError__error;
    sharedInstanceWithError__error = v12;
  }
}

+ (id)isValidSQLQuery:(id)a3 forNamespaceID:(id)a4 possibleError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 length])
  {
    if (a5)
    {
      v25 = @"SQL query needs to be a non-empty string";
LABEL_27:
      +[FedStatsPluginError errorWithCode:300 description:v25];
      uint64_t v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_30:
    uint64_t v24 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      v25 = @"Namespace Identifier needs to be a string";
      goto LABEL_27;
    }
    goto LABEL_30;
  }
  id v36 = 0;
  id v9 = +[FedStatsPluginSQLQueryValidator sharedInstanceWithError:&v36];
  id v10 = v36;
  if (!v9)
  {
    if (a5)
    {
      +[FedStatsPluginError errorWithCode:300 underlyingError:v10 description:@"Cannot create SQL query validator"];
      uint64_t v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_37;
  }
  id v11 = [v9 blockList];
  uint64_t v12 = [v11 objectForKey:v8];

  if (v12)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
LABEL_8:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v17), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length")))
        {
          goto LABEL_31;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v15) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
  uint64_t v18 = [v9 allowList];
  id v13 = [v18 objectForKey:v8];

  if (v13)
  {
    id v27 = v10;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          if (objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length")))
          {
            uint64_t v24 = [NSNumber numberWithBool:1];

            goto LABEL_35;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    uint64_t v24 = [NSNumber numberWithBool:0];
LABEL_35:
    id v10 = v27;
    goto LABEL_36;
  }
LABEL_31:
  uint64_t v24 = [NSNumber numberWithBool:0];
LABEL_36:

LABEL_37:
LABEL_38:

  return v24;
}

- (NSDictionary)allowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllowList:(id)a3
{
}

- (NSDictionary)blockList
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBlockList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockList, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end
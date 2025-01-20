@interface FedStatsPluginClientValidator
+ (id)checkClientIdentifier:(id)a3 againstNamespaceIdentifier:(id)a4 error:(id *)a5;
+ (id)sharedInstanceWithError:(id *)a3;
- (FedStatsPluginClientValidator)initWithAssociation:(id)a3;
- (NSDictionary)association;
@end

@implementation FedStatsPluginClientValidator

- (FedStatsPluginClientValidator)initWithAssociation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsPluginClientValidator;
  v6 = [(FedStatsPluginClientValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_association, a3);
  }

  return v7;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceWithError__dispatchToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&sharedInstanceWithError__dispatchToken, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) sharedInstanceWithError__intError;
LABEL_4:
  v4 = (void *)sharedInstanceWithError__sharedInstance;
  return v4;
}

void __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v2)
  {
    uint64_t v19 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot load class bundle"];
    v20 = (void *)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v19;

    goto LABEL_31;
  }
  v3 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke_cold_1(v2, v3);
  }

  v4 = [v2 URLForResource:@"FedStatsPluginClientAssociations" withExtension:@"plist"];
  if (!v4)
  {
    uint64_t v21 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot find associations file from class bundle"];
    id v6 = (id)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v21;
    goto LABEL_30;
  }
  id v5 = [NSDictionary dictionaryWithContentsOfURL:v4];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v22 = +[FedStatsPluginError errorWithCode:300 description:@"Cannot load association file from class bundle file"];
    v18 = (void *)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v22;
    goto LABEL_27;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v35;
  uint64_t v28 = a1;
  uint64_t v29 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = +[FedStatsPluginError errorWithCode:300 description:@"Associations must have strings as keys"];
        id v12 = (id)sharedInstanceWithError__intError;
        sharedInstanceWithError__intError = v25;
LABEL_29:

        goto LABEL_30;
      }
      id v12 = [v6 objectForKey:v11];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v26 = +[FedStatsPluginError errorWithCode:300 description:@"Associations must have arrays of strings as values"];
        v27 = (void *)sharedInstanceWithError__intError;
        sharedInstanceWithError__intError = v26;

        goto LABEL_29;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = v12;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        while (2)
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v23 = +[FedStatsPluginError errorWithCode:300 description:@"Associations must have arrays of strings as values"];
              v24 = (void *)sharedInstanceWithError__intError;
              sharedInstanceWithError__intError = v23;

              goto LABEL_29;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      uint64_t v9 = v29;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    a1 = v28;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_23:

  uint64_t v17 = [objc_alloc(*(Class *)(a1 + 32)) initWithAssociation:v6];
  v18 = (void *)sharedInstanceWithError__sharedInstance;
  sharedInstanceWithError__sharedInstance = v17;
LABEL_27:

LABEL_30:
LABEL_31:
}

+ (id)checkClientIdentifier:(id)a3 againstNamespaceIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
LABEL_10:
      +[FedStatsPluginError errorWithCode:300 description:v14];
      uint64_t v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v9 = +[FedStatsPluginClientValidator sharedInstanceWithError:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 association];
    id v12 = [v11 objectForKey:v8];

    if ([v12 containsObject:v7])
    {
      uint64_t v13 = 1;
    }
    else
    {
      v16 = [v7 stringByReplacingOccurrencesOfString:@"fedstats:" withString:&stru_27000F200];
      uint64_t v13 = [v12 containsObject:v16];
    }
    uint64_t v15 = [NSNumber numberWithBool:v13];
  }
  else
  {
    uint64_t v15 = 0;
  }

LABEL_16:
  return v15;
}

- (NSDictionary)association
{
  return self->_association;
}

- (void).cxx_destruct
{
}

void __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 bundleURL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_24DF73000, a2, OS_LOG_TYPE_DEBUG, "class bundle path = %@", (uint8_t *)&v4, 0xCu);
}

@end
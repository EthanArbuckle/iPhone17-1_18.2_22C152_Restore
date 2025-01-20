@interface FedStatsPluginRecipe
+ (id)recipeWithAssetProvider:(id)a3 error:(id *)a4;
+ (id)recipeWithAssetProvider:(id)a3 recipeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)checkConsentWithError:(id *)a3;
- (BOOL)checkDeviceRegionCodeWithError:(id *)a3;
- (FedStatsPluginAssetProviderProtocol)assetProvider;
- (FedStatsPluginRecipe)initWithAssetProvider:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 dataTypeContent:(id)a7 sqlQuery:(id)a8 cohortNameList:(id)a9;
- (NSArray)cohortNameList;
- (NSDictionary)dataTypeContent;
- (NSDictionary)recordMetadata;
- (NSString)clientIdentifier;
- (NSString)recipeIdentifier;
- (NSString)sqlQuery;
- (id)assetKeysFromCollatedData:(id)a3;
- (id)assetURLsForAssetKeys:(id)a3;
- (id)collateQueryResults:(id)a3;
- (id)evaluateQueryWithError:(id *)a3;
- (id)recordCollatedData:(id)a3 assetURLs:(id)a4;
- (id)runRecipeWithError:(id *)a3;
- (void)setDataTypeContent:(id)a3;
- (void)setRecordMetadata:(id)a3;
- (void)setSqlQuery:(id)a3;
@end

@implementation FedStatsPluginRecipe

- (FedStatsPluginRecipe)initWithAssetProvider:(id)a3 recipeIdentifier:(id)a4 clientIdentifier:(id)a5 recordMetadata:(id)a6 dataTypeContent:(id)a7 sqlQuery:(id)a8 cohortNameList:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FedStatsPluginRecipe;
  v18 = [(FedStatsPluginRecipe *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_assetProvider, a3);
    objc_storeStrong((id *)&v19->_recipeIdentifier, a4);
    objc_storeStrong((id *)&v19->_clientIdentifier, a5);
    objc_storeStrong((id *)&v19->_recordMetadata, a6);
    objc_storeStrong((id *)&v19->_dataTypeContent, a7);
    objc_storeStrong((id *)&v19->_sqlQuery, a8);
    objc_storeStrong((id *)&v19->_cohortNameList, a9);
  }

  return v19;
}

+ (id)recipeWithAssetProvider:(id)a3 recipeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v87 = 0;
  v9 = [v7 recipeDictionaryForRecipe:v8 error:&v87];
  id v10 = v87;
  if (a5 && !v9)
  {
    *a5 = +[FedStatsPluginError errorWithCode:100 underlyingError:v10 description:@"Trial client cannot load the recipe"];
  }
  v11 = [v9 objectForKey:@"clientIdentifier"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 namespaceIdentifierForRecipe:v8];
      v70 = uint64_t v86 = 0;
      v12 = +[FedStatsPluginClientValidator checkClientIdentifier:againstNamespaceIdentifier:error:](FedStatsPluginClientValidator, "checkClientIdentifier:againstNamespaceIdentifier:error:", v11);
      id v13 = 0;
      if (v12)
      {
        if ([v12 BOOLValue])
        {
          uint64_t v14 = [v9 objectForKey:@"dataTypeContent"];
          v15 = (void *)v14;
          if (v14)
          {
            v64 = v12;
            v68 = (void *)v14;
            [MEMORY[0x263F3C0D0] extractRequiredFieldsFrom:v14];
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v83;
              id v66 = v13;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v83 != v18) {
                    objc_enumerationMutation(obj);
                  }
                  if (!+[FedStatsDataCohort checkCohortField:*(void *)(*((void *)&v82 + 1) + 8 * i) forNamespaceID:v70])
                  {
                    if (a5)
                    {
                      +[FedStatsPluginError errorWithCode:100 description:@"Data type content contains required field(s) that are not allowed"];
                      v30 = 0;
                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v30 = 0;
                    }
                    v20 = obj;
                    id v13 = v66;
                    goto LABEL_107;
                  }
                }
                uint64_t v17 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
                id v13 = v66;
              }
              while (v17);
            }

            v20 = [v9 objectForKey:@"cohorts"];
            if (!v20) {
              goto LABEL_29;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a5)
              {
                +[FedStatsPluginError errorWithCode:100 description:@"Cohorts must be a list of strings."];
                v30 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
LABEL_77:
                v30 = 0;
              }
              v12 = v64;
              goto LABEL_107;
            }
            long long v81 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v78 = 0u;
            id v59 = v20;
            uint64_t v21 = [v59 countByEnumeratingWithState:&v78 objects:v93 count:16];
            if (!v21) {
              goto LABEL_28;
            }
            uint64_t v22 = v21;
            uint64_t v61 = *(void *)v79;
            v58 = v20;
LABEL_21:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v79 != v61) {
                objc_enumerationMutation(v59);
              }
              uint64_t v24 = *(void *)(*((void *)&v78 + 1) + 8 * v23);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              if (!+[FedStatsDataCohort checkCohortField:v24 forNamespaceID:v70])
              {
                if (a5)
                {
                  v47 = [NSString stringWithFormat:@"Cohort field '%@' is not allowed for this namespace", v24];
                  *a5 = +[FedStatsPluginError errorWithCode:100 description:v47];
                }
LABEL_76:
                v20 = v59;

                goto LABEL_77;
              }
              if (v22 == ++v23)
              {
                uint64_t v22 = [v59 countByEnumeratingWithState:&v78 objects:v93 count:16];
                v20 = v58;
                if (v22) {
                  goto LABEL_21;
                }
LABEL_28:

LABEL_29:
                id v67 = v13;
                uint64_t v25 = *MEMORY[0x263F3A2F0];
                uint64_t v91 = *MEMORY[0x263F3A2F0];
                v92 = &stru_27000F200;
                objc_super v26 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
                uint64_t v27 = *MEMORY[0x263F3A280];
                uint64_t v28 = [v9 objectForKey:*MEMORY[0x263F3A280]];
                id v60 = (id)v28;
                if (v28)
                {
                  v89[0] = v25;
                  v89[1] = v27;
                  v90[0] = &stru_27000F200;
                  v90[1] = v28;
                  uint64_t v29 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];

                  v56 = (void *)v29;
                }
                else
                {
                  v56 = v26;
                }
                uint64_t v32 = [v9 objectForKey:@"sqlQuery"];
                v12 = v64;
                id v13 = v67;
                v57 = (void *)v32;
                if (v32)
                {
                  v33 = (void *)v32;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v62 = v33;
                    goto LABEL_52;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v76 = 0u;
                    long long v77 = 0u;
                    long long v74 = 0u;
                    long long v75 = 0u;
                    id v55 = v33;
                    uint64_t v44 = [v55 countByEnumeratingWithState:&v74 objects:v88 count:16];
                    if (v44)
                    {
                      uint64_t v45 = v44;
                      uint64_t v63 = *(void *)v75;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v45; ++j)
                        {
                          if (*(void *)v75 != v63) {
                            objc_enumerationMutation(v55);
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (a5)
                            {
                              *a5 = +[FedStatsPluginError errorWithCode:100 description:@"If SQL query is an array, all entries must be strings"];
                            }

                            v30 = 0;
                            v12 = v64;
                            goto LABEL_90;
                          }
                        }
                        uint64_t v45 = [v55 countByEnumeratingWithState:&v74 objects:v88 count:16];
                        if (v45) {
                          continue;
                        }
                        break;
                      }
                    }

                    id v62 = [v55 componentsJoinedByString:@" "];
                    v12 = v64;
LABEL_52:
                    v34 = +[FedStatsPluginLog logger];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                      +[FedStatsPluginRecipe recipeWithAssetProvider:recipeIdentifier:error:]();
                    }

                    id v73 = 0;
                    v35 = +[FedStatsPluginSQLQueryValidator isValidSQLQuery:v62 forNamespaceID:v70 possibleError:&v73];
                    id v36 = v73;
                    v37 = v35;
                    v65 = v36;
                    if (v35)
                    {
                      id v54 = v35;
                      if ([v35 BOOLValue])
                      {
                        if ([&unk_2700127F8 containsObject:v11])
                        {
                          id v72 = 0;
                          char v38 = checkDediscoV2Params(v60, &v72);
                          id v39 = v72;
                          if ((v38 & 1) == 0)
                          {
                            if (a5)
                            {
                              v40 = @"Cannot validate Dedisco V2 config for this use-case.";
                              id v41 = v39;
                              id v42 = v39;
                              goto LABEL_99;
                            }
                            v30 = 0;
LABEL_100:
                            v48 = v56;
                            goto LABEL_103;
                          }
                        }
                        else
                        {
                          id v39 = 0;
                        }
                        v49 = v39;
                        id v71 = v39;
                        char v50 = checkPrivateRelay(v62, v11, v60, &v71);
                        id v53 = v71;

                        if (v50)
                        {
                          v48 = v56;
                          v30 = [[FedStatsPluginRecipe alloc] initWithAssetProvider:v7 recipeIdentifier:v8 clientIdentifier:v11 recordMetadata:v56 dataTypeContent:v68 sqlQuery:v62 cohortNameList:v20];
                          id v13 = v67;
                        }
                        else
                        {
                          id v13 = v67;
                          if (a5)
                          {
                            v40 = @"Cannot validate recipe for Private Relay usage";
                            id v41 = v53;
                            id v42 = v53;
LABEL_99:
                            id v51 = +[FedStatsPluginError errorWithCode:100 underlyingError:v42 description:v40];
                            id v39 = v41;
                            v30 = 0;
                            *a5 = v51;
                            goto LABEL_100;
                          }
                          v30 = 0;
                          v48 = v56;
                        }
                        id v39 = v53;
LABEL_103:
                      }
                      else
                      {
                        if (a5)
                        {
                          +[FedStatsPluginError errorWithCode:100 description:@"SQL query not valid"];
                          v30 = 0;
                          *a5 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v30 = 0;
                        }
                        v48 = v56;
                      }
                      v37 = v54;
                    }
                    else if (a5)
                    {
                      +[FedStatsPluginError errorWithCode:100 underlyingError:v36 description:@"Cannot validate SQL query"];
                      v30 = 0;
                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                      v37 = 0;
                      v48 = v56;
                    }
                    else
                    {
                      v30 = 0;
                      v48 = v56;
                    }

LABEL_106:
LABEL_107:

LABEL_108:
                    v15 = v68;
                    goto LABEL_109;
                  }
                  if (a5)
                  {
                    v43 = @"SQL query should either be an array of strings or a single string";
LABEL_81:
                    +[FedStatsPluginError errorWithCode:100 description:v43];
                    v30 = 0;
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_90:
                    v48 = v56;
                    goto LABEL_106;
                  }
                }
                else if (a5)
                {
                  v43 = @"Recipe is missing SQL query";
                  goto LABEL_81;
                }
                v30 = 0;
                goto LABEL_90;
              }
            }
            if (a5)
            {
              *a5 = +[FedStatsPluginError errorWithCode:100 description:@"Cohorts must be a list of strings."];
            }
            goto LABEL_76;
          }
          if (a5)
          {
            v68 = 0;
            obuint64_t j = [NSString stringWithFormat:@"key %@ missing from recipe", @"dataTypeContent"];
            +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100);
            v30 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_108;
          }
          v30 = 0;
LABEL_109:

          goto LABEL_110;
        }
        if (a5)
        {
          v31 = [NSString stringWithFormat:@"The client identifier \"%@\" is not allowed for the namespace \"%@\"", v11, v70];
          *a5 = +[FedStatsPluginError errorWithCode:100 description:v31];
        }
      }
      else if (a5)
      {
        +[FedStatsPluginError errorWithCode:100 underlyingError:v13 description:@"Cannot perform recipe ID check"];
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:

        goto LABEL_111;
      }
      v30 = 0;
      goto LABEL_110;
    }
  }
  if (a5)
  {
    +[FedStatsPluginError errorWithCode:100 description:@"Recipe is missing client identifier string"];
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_111:

  return v30;
}

+ (id)recipeWithAssetProvider:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 recipeIdentifiers];
  if ([v7 count] == 1)
  {
    id v8 = [v7 firstObject];
    v9 = [a1 recipeWithAssetProvider:v6 recipeIdentifier:v8 error:a4];
  }
  else if (a4)
  {
    +[FedStatsPluginError errorWithCode:100 description:@"Asset provider should have a single recipe for this call"];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)checkConsentWithError:(id *)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  v5 = objc_alloc_init(FedStatsPluginDnUConsentChecker);
  v33[0] = v5;
  id v6 = objc_alloc_init(FedStatsPluginLocationServiceConsentChecker);
  v33[1] = v6;
  id v7 = objc_alloc_init(FedStatsPluginUserProofingConsentChecker);
  v33[2] = v7;
  id v8 = objc_alloc_init(FedStatsPluginIHAConsentChecker);
  v33[3] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v10)
  {
    BOOL v22 = 1;
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v29;
  uint64_t v24 = a3;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      v15 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[FedStatsPluginRecipe checkConsentWithError:]();
      }

      uint64_t v16 = [(FedStatsPluginRecipe *)self clientIdentifier];
      id v27 = 0;
      uint64_t v17 = [v14 checkConsentForClientIdentifier:v16 error:&v27];
      id v18 = v27;

      if (!v17)
      {
        if (v24)
        {
          *uint64_t v24 = +[FedStatsPluginError errorWithCode:400 underlyingError:v18 description:@"Cannot run consent check"];
        }
        goto LABEL_21;
      }
      char v19 = [v17 BOOLValue];
      v20 = +[FedStatsPluginLog logger];
      uint64_t v21 = v20;
      if ((v19 & 1) == 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24DF73000, v21, OS_LOG_TYPE_INFO, "Plugin not consented to run for the use-case", buf, 2u);
        }

LABEL_21:
        BOOL v22 = 0;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[FedStatsPluginRecipe checkConsentWithError:]();
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    BOOL v22 = 1;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_22:

  return v22;
}

- (BOOL)checkDeviceRegionCodeWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v5 = [(FedStatsPluginRecipe *)self assetProvider];
  id v6 = [(FedStatsPluginRecipe *)self recipeIdentifier];
  id v34 = 0;
  id v7 = [v5 recipeDictionaryForRecipe:v6 error:&v34];
  id v8 = v34;

  if (v7)
  {
    v9 = [v7 objectForKey:@"allowedRegions"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a3)
        {
          char v21 = 0;
          goto LABEL_39;
        }
        id v10 = [NSString stringWithFormat:@"'%@' key should have an array of strings as value", @"allowedRegions"];
        +[FedStatsPluginError errorWithCode:100 description:v10];
        char v21 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (v12) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        if (!a3) {
          goto LABEL_37;
        }
        v20 = [NSString stringWithFormat:@"'%@' key should have an array of strings as value", @"allowedRegions"];
        goto LABEL_34;
      }
LABEL_12:
    }
    id v10 = [v7 objectForKey:@"deniedRegions"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          BOOL v22 = [NSString stringWithFormat:@"'%@' key should have an array of strings as value", @"deniedRegions"];
          *a3 = +[FedStatsPluginError errorWithCode:100 description:v22];
        }
        goto LABEL_37;
      }
      id v25 = v8;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a3)
              {
                uint64_t v24 = [NSString stringWithFormat:@"'%@' key should have an array of strings as value", @"deniedRegions"];
                *a3 = +[FedStatsPluginError errorWithCode:100 description:v24];
              }
              char v21 = 0;
              id v8 = v25;
              goto LABEL_38;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v8 = v25;
      if (v9)
      {
        if (!a3)
        {
LABEL_37:
          char v21 = 0;
          goto LABEL_38;
        }
        v20 = [NSString stringWithFormat:@"The recipe cannot have both '%@' and '%@' keys", @"allowedRegions", @"deniedRegions"];
LABEL_34:
        *a3 = +[FedStatsPluginError errorWithCode:100 description:v20];

        goto LABEL_37;
      }
    }
    char v21 = [MEMORY[0x263F3C0E8] checkDeviceRegionCodeRestrictionForAllowedRegions:v9 deniedRegions:v10];
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (a3)
  {
    +[FedStatsPluginError errorWithCode:100 underlyingError:v8 description:@"Cannot load the recipe dictionary from asset provider"];
    char v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v21 = 0;
  }
LABEL_40:

  return v21;
}

- (id)evaluateQueryWithError:(id *)a3
{
  id v13 = 0;
  v5 = [[FedStatsPluginSQL alloc] initWithError:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = [(FedStatsPluginRecipe *)self sqlQuery];
    id v12 = v6;
    id v8 = [(FedStatsPluginSQL *)v5 runQuery:v7 withError:&v12];
    id v9 = v12;

    if (v8)
    {
      id v10 = v8;
    }
    else if (a3)
    {
      *a3 = +[FedStatsPluginError errorWithCode:400 underlyingError:v9 description:@"SQL Query Running Error"];
    }
  }
  else
  {
    if (a3)
    {
      +[FedStatsPluginError errorWithCode:400 underlyingError:v6 description:@"SQL Constructor Error"];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    id v9 = v6;
  }

  return v8;
}

- (id)collateQueryResults:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F3C0D0];
  id v6 = [(FedStatsPluginRecipe *)self dataTypeContent];
  id v7 = [v5 extractRequiredFieldsFrom:v6];

  id v8 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FedStatsPluginRecipe collateQueryResults:](v7, v8);
  }

  id v9 = [FedStatsCollectionKeyGenerator alloc];
  id v10 = [(FedStatsPluginRecipe *)self clientIdentifier];
  uint64_t v11 = [(FedStatsPluginRecipe *)self cohortNameList];
  id v12 = [(FedStatsPluginRecipe *)self assetProvider];
  id v13 = [(FedStatsPluginRecipe *)self recipeIdentifier];
  v43 = v7;
  uint64_t v14 = [(FedStatsCollectionKeyGenerator *)v9 initWithPrefix:v10 cohortKeys:v11 requiredFields:v7 assetProvider:v12 recipeIdentifier:v13];

  id v15 = v4;
  uint64_t v16 = v14;
  uint64_t v17 = [MEMORY[0x263EFF980] array];
  uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v15;
  uint64_t v19 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v49 = 0;
        uint64_t v24 = [(FedStatsCollectionKeyGenerator *)v16 generateCollectionKeyForDataPoint:v23 error:&v49];
        id v25 = v49;
        if (v24)
        {
          long long v26 = [v18 objectForKey:v24];
          long long v27 = v26;
          if (v26)
          {
            [v26 arrayByAddingObject:v23];
          }
          else
          {
            uint64_t v55 = v23;
            [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
          long long v29 = };
          [v18 setObject:v29 forKey:v24];
        }
        else
        {
          if (v17)
          {
            long long v28 = +[FedStatsPluginError errorWithCode:300 underlyingError:v25 description:@"Cannot generate collection key"];
            [v17 addObject:v28];
          }
          long long v27 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v25;
            _os_log_error_impl(&dword_24DF73000, v27, OS_LOG_TYPE_ERROR, "Cannot generate collection key. Error: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v20);
  }

  if ([v17 count])
  {
    id v30 = +[FedStatsPluginError errorWithCode:300 underlyingErrors:v17 description:@"Some collection keys cannot be generated"];
  }
  else
  {
    id v30 = 0;
  }

  id v31 = v30;
  long long v32 = v43;
  if (v31)
  {
    long long v33 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[FedStatsPluginRecipe collateQueryResults:]();
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v42 = v31;
    id v34 = [v31 describe];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          v40 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v58 = 138412290;
            uint64_t v59 = v39;
            _os_log_debug_impl(&dword_24DF73000, v40, OS_LOG_TYPE_DEBUG, "%@", v58, 0xCu);
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v36);
    }

    id v31 = v42;
    long long v32 = v43;
  }

  return v18;
}

- (id)assetKeysFromCollatedData:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[FedStatsCollectionKeyGenerator extractCohortKeyValuesFrom:](FedStatsCollectionKeyGenerator, "extractCohortKeyValuesFrom:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        id v12 = (void *)MEMORY[0x263F3C0D0];
        id v13 = [(FedStatsPluginRecipe *)self dataTypeContent];
        uint64_t v14 = [v12 extractAssetNamesFrom:v13 usingFieldValues:v11];

        [v5 addObjectsFromArray:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v15 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FedStatsPluginRecipe assetKeysFromCollatedData:](v5, v15);
  }

  uint64_t v16 = [v5 allObjects];

  return v16;
}

- (id)assetURLsForAssetKeys:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v4;
  uint64_t v27 = [v5 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v27)
  {
    uint64_t v6 = *(void *)v35;
    uint64_t v24 = self;
    obuint64_t j = v5;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * v7);
        uint64_t v9 = [(FedStatsPluginRecipe *)self assetProvider];
        id v10 = [(FedStatsPluginRecipe *)self recipeIdentifier];
        id v33 = 0;
        uint64_t v11 = [v9 assetURLForRecipe:v10 forKey:v8 error:&v33];
        id v28 = v33;

        if (v11)
        {
          [v26 setObject:v11 forKey:v8];
        }
        else
        {
          id v12 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v8;
            _os_log_error_impl(&dword_24DF73000, v12, OS_LOG_TYPE_ERROR, "Cannot download asset \"%@\".", buf, 0xCu);
          }

          id v13 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v8;
            _os_log_debug_impl(&dword_24DF73000, v13, OS_LOG_TYPE_DEBUG, "Cannot download asset \"%@\". Error:", buf, 0xCu);
          }

          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v14 = [v28 describe];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v30;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v30 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * v18);
                long long v20 = +[FedStatsPluginLog logger];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v40 = v19;
                  _os_log_debug_impl(&dword_24DF73000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
            }
            while (v16);
          }

          uint64_t v6 = v23;
          self = v24;
          uint64_t v11 = 0;
        }

        ++v7;
      }
      while (v7 != v27);
      id v5 = obj;
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v27);
  }

  long long v21 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[FedStatsPluginRecipe assetURLsForAssetKeys:]();
  }

  return v26;
}

- (id)recordCollatedData:(id)a3 assetURLs:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v5;
  uint64_t v49 = [v5 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v49)
  {
    uint64_t v47 = 0;
    uint64_t v48 = *(void *)v77;
    long long v46 = v63;
    id v52 = v6;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v77 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v9 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = (uint64_t)v8;
          _os_log_debug_impl(&dword_24DF73000, v9, OS_LOG_TYPE_DEBUG, "collectionKey = %@", buf, 0xCu);
        }

        id v10 = +[FedStatsCollectionKeyGenerator extractCohortKeyValuesFrom:v8];
        uint64_t v11 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = (uint64_t)v10;
          _os_log_debug_impl(&dword_24DF73000, v11, OS_LOG_TYPE_DEBUG, "fieldValues = %@", buf, 0xCu);
        }

        id v12 = (void *)MEMORY[0x263F3C0D0];
        id v13 = [(FedStatsPluginRecipe *)self dataTypeContent];
        id v75 = 0;
        uint64_t v14 = [v12 mutateDataTypeContent:v13 usingFieldValues:v10 assetURLs:v6 error:&v75];
        id v57 = v75;

        uint64_t v15 = +[FedStatsPluginLog logger];
        uint64_t v16 = v15;
        v56 = (void *)v14;
        if (v14)
        {
          id v54 = v10;
          uint64_t v51 = i;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v81 = v14;
            _os_log_debug_impl(&dword_24DF73000, v16, OS_LOG_TYPE_DEBUG, "dataTypeContent = %@", buf, 0xCu);
          }

          uint64_t v17 = (void *)MEMORY[0x263F3C0D0];
          uint64_t v18 = [obj objectForKey:v8];
          uint64_t v19 = [(FedStatsPluginRecipe *)self recordMetadata];
          id v66 = 0;
          long long v20 = v17;
          long long v21 = (void *)v14;
          BOOL v22 = [v20 encodeDataArrayAndRecord:v18 dataTypeContent:v14 metadata:v19 baseKey:v8 errorOut:&v66];
          id v23 = v66;

          uint64_t v24 = +[FedStatsPluginLog logger];
          id v25 = v24;
          id v6 = v52;
          if (v22)
          {
            uint64_t i = v51;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v42 = [v22 unsignedIntegerValue];
              *(_DWORD *)buf = 134218242;
              uint64_t v81 = v42;
              __int16 v82 = 2112;
              long long v83 = v8;
              _os_log_debug_impl(&dword_24DF73000, v25, OS_LOG_TYPE_DEBUG, "Recorded %lu data for collection key '%@'", buf, 0x16u);
            }

            v47 += [v22 unsignedIntegerValue];
          }
          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[FedStatsPluginRecipe recordCollatedData:assetURLs:].cold.5(&v64, v65);
            }

            long long v34 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              -[FedStatsPluginRecipe recordCollatedData:assetURLs:].cold.4(&v62, v46);
            }

            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v35 = [v23 describe];
            uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v84 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v59;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v59 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  uint64_t v40 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                  id v41 = +[FedStatsPluginLog logger];
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v81 = v40;
                    _os_log_debug_impl(&dword_24DF73000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v84 count:16];
              }
              while (v37);
            }

            uint64_t i = v51;
            id v6 = v52;
            long long v21 = v56;
            BOOL v22 = 0;
          }

          id v10 = v54;
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[FedStatsPluginRecipe recordCollatedData:assetURLs:](&v73, v74);
          }

          id v26 = +[FedStatsPluginLog logger];
          id v6 = v52;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[FedStatsPluginRecipe recordCollatedData:assetURLs:](&v71, v72);
          }

          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v23 = [v57 describe];
          uint64_t v27 = [v23 countByEnumeratingWithState:&v67 objects:v85 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v55 = v10;
            uint64_t v29 = i;
            uint64_t v30 = *(void *)v68;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v68 != v30) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v32 = *(void *)(*((void *)&v67 + 1) + 8 * k);
                id v33 = +[FedStatsPluginLog logger];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v81 = v32;
                  _os_log_debug_impl(&dword_24DF73000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
              uint64_t v28 = [v23 countByEnumeratingWithState:&v67 objects:v85 count:16];
            }
            while (v28);
            id v6 = v52;
            uint64_t i = v29;
            id v10 = v55;
          }
          long long v21 = 0;
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v49);
  }
  else
  {
    uint64_t v47 = 0;
  }
  v43 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[FedStatsPluginRecipe recordCollatedData:assetURLs:](obj, v47, v43);
  }

  uint64_t v44 = [NSNumber numberWithUnsignedInteger:v47];

  return v44;
}

- (id)runRecipeWithError:(id *)a3
{
  if (-[FedStatsPluginRecipe checkConsentWithError:](self, "checkConsentWithError:")
    && [(FedStatsPluginRecipe *)self checkDeviceRegionCodeWithError:a3])
  {
    id v5 = [(FedStatsPluginRecipe *)self evaluateQueryWithError:a3];
    id v6 = v5;
    if (v5)
    {
      if ([v5 count])
      {
        uint64_t v7 = [(FedStatsPluginRecipe *)self collateQueryResults:v6];
        uint64_t v8 = [(FedStatsPluginRecipe *)self assetKeysFromCollatedData:v7];
        uint64_t v9 = [(FedStatsPluginRecipe *)self assetURLsForAssetKeys:v8];
        id v10 = [(FedStatsPluginRecipe *)self recordCollatedData:v7 assetURLs:v9];
        uint64_t v11 = [(FedStatsPluginRecipe *)self assetProvider];
        [v11 removeAssets];
      }
      else
      {
        id v12 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[FedStatsPluginRecipe runRecipeWithError:]();
        }

        id v10 = &unk_270012828;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = &unk_270012828;
  }
  return v10;
}

- (FedStatsPluginAssetProviderProtocol)assetProvider
{
  return self->_assetProvider;
}

- (NSString)recipeIdentifier
{
  return self->_recipeIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDictionary)recordMetadata
{
  return self->_recordMetadata;
}

- (void)setRecordMetadata:(id)a3
{
}

- (NSDictionary)dataTypeContent
{
  return self->_dataTypeContent;
}

- (void)setDataTypeContent:(id)a3
{
}

- (NSString)sqlQuery
{
  return self->_sqlQuery;
}

- (void)setSqlQuery:(id)a3
{
}

- (NSArray)cohortNameList
{
  return self->_cohortNameList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortNameList, 0);
  objc_storeStrong((id *)&self->_sqlQuery, 0);
  objc_storeStrong((id *)&self->_dataTypeContent, 0);
  objc_storeStrong((id *)&self->_recordMetadata, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeIdentifier, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
}

+ (void)recipeWithAssetProvider:recipeIdentifier:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_24DF73000, v0, v1, "SQL Query: \"%@\"", v2);
}

- (void)checkConsentWithError:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  *uint64_t v1 = 138412290;
  void *v0 = v3;
  OUTLINED_FUNCTION_5(&dword_24DF73000, v4, v5, "Consent check passed for class %@");
}

- (void)checkConsentWithError:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  *uint64_t v1 = 138412290;
  void *v0 = v3;
  OUTLINED_FUNCTION_5(&dword_24DF73000, v4, v5, "Running consent check for class %@");
}

- (void)collateQueryResults:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_24DF73000, v0, v1, "Error while collating data...", v2, v3, v4, v5, v6);
}

- (void)collateQueryResults:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_24DF73000, a2, v4, "requiredFields = ['%@']", v5);
}

- (void)assetKeysFromCollatedData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 allObjects];
  uint64_t v4 = [v3 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_24DF73000, a2, v5, "requiredAssets = {'%@'}", v6);
}

- (void)assetURLsForAssetKeys:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_24DF73000, v0, v1, "assetURLs = %@", v2);
}

- (void)recordCollatedData:(NSObject *)a3 assetURLs:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 count];
  _os_log_debug_impl(&dword_24DF73000, a3, OS_LOG_TYPE_DEBUG, "Recorded %lu data for %lu collection keys", (uint8_t *)&v4, 0x16u);
}

- (void)recordCollatedData:(unsigned char *)a1 assetURLs:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  _os_log_debug_impl(&dword_24DF73000, v2, OS_LOG_TYPE_DEBUG, "Cannot fill in URLs for the data-type-content. Error: ", v3, 2u);
}

- (void)recordCollatedData:(unsigned char *)a1 assetURLs:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  _os_log_error_impl(&dword_24DF73000, v2, OS_LOG_TYPE_ERROR, "Cannot fill in URLs for the data-type-content.", v3, 2u);
}

- (void)recordCollatedData:(unsigned char *)a1 assetURLs:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  _os_log_debug_impl(&dword_24DF73000, v2, OS_LOG_TYPE_DEBUG, "Cannot decode and record some data. Error:", v3, 2u);
}

- (void)recordCollatedData:(unsigned char *)a1 assetURLs:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  _os_log_error_impl(&dword_24DF73000, v2, OS_LOG_TYPE_ERROR, "Cannot decode and record some data.", v3, 2u);
}

- (void)runRecipeWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_24DF73000, v0, v1, "Nothing to record ¯\\_(ツ)_/¯", v2, v3, v4, v5, v6);
}

@end
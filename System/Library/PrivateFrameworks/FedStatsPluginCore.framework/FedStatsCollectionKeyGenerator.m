@interface FedStatsCollectionKeyGenerator
+ (id)extractCohortKeyValuesFrom:(id)a3;
- (FedStatsCollectionKeyGenerator)initWithPrefix:(id)a3 cohortKeys:(id)a4 requiredFields:(id)a5 assetProvider:(id)a6 recipeIdentifier:(id)a7;
- (NSArray)cohortKeys;
- (NSArray)requiredFields;
- (NSArray)unifiedFields;
- (NSString)deploymentIdentifier;
- (NSString)experimentIdentifier;
- (NSString)namespaceIdentifier;
- (NSString)prefix;
- (NSString)treatmentIdentifier;
- (id)generateCollectionKeyForDataPoint:(id)a3 error:(id *)a4;
@end

@implementation FedStatsCollectionKeyGenerator

- (FedStatsCollectionKeyGenerator)initWithPrefix:(id)a3 cohortKeys:(id)a4 requiredFields:(id)a5 assetProvider:(id)a6 recipeIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)FedStatsCollectionKeyGenerator;
  v17 = [(FedStatsCollectionKeyGenerator *)&v37 init];
  if (v17)
  {
    unint64_t v18 = [v12 length];
    if (v18 >= [@"fedstats:" length]
      && ([v12 substringToIndex:objc_msgSend(@"fedstats:", "length")],
          v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 isEqualToString:@"fedstats:"],
          v19,
          (v20 & 1) != 0))
    {
      v21 = (NSString *)v12;
    }
    else
    {
      v21 = [@"fedstats:" stringByAppendingString:v12];
    }
    prefix = v17->_prefix;
    v17->_prefix = v21;

    objc_storeStrong((id *)&v17->_cohortKeys, a4);
    objc_storeStrong((id *)&v17->_requiredFields, a5);
    uint64_t v23 = [v15 namespaceIdentifierForRecipe:v16];
    namespaceIdentifier = v17->_namespaceIdentifier;
    v17->_namespaceIdentifier = (NSString *)v23;

    uint64_t v25 = [v15 experimentIdentifierForRecipe:v16];
    experimentIdentifier = v17->_experimentIdentifier;
    v17->_experimentIdentifier = (NSString *)v25;

    if (!v17->_experimentIdentifier)
    {
      v17->_experimentIdentifier = (NSString *)@"N/A";
    }
    uint64_t v27 = [v15 deploymentIdentifierForRecipe:v16];
    deploymentIdentifier = v17->_deploymentIdentifier;
    v17->_deploymentIdentifier = (NSString *)v27;

    if (!v17->_deploymentIdentifier)
    {
      v17->_deploymentIdentifier = (NSString *)@"N/A";
    }
    uint64_t v29 = [v15 treatmentIdentifierForRecipe:v16];
    treatmentIdentifier = v17->_treatmentIdentifier;
    v17->_treatmentIdentifier = (NSString *)v29;

    if (!v17->_treatmentIdentifier)
    {
      v17->_treatmentIdentifier = (NSString *)@"N/A";
    }
    v31 = [MEMORY[0x263EFFA08] setWithArray:v17->_requiredFields];
    v32 = [v31 setByAddingObjectsFromArray:v17->_cohortKeys];
    v33 = [v32 allObjects];
    uint64_t v34 = [v33 sortedArrayUsingSelector:sel_localizedCompare_];
    unifiedFields = v17->_unifiedFields;
    v17->_unifiedFields = (NSArray *)v34;
  }
  return v17;
}

- (id)generateCollectionKeyForDataPoint:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = [(FedStatsCollectionKeyGenerator *)self requiredFields];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [v6 allKeys];
        char v14 = [v13 containsObject:v12];

        if ((v14 & 1) == 0)
        {
          if (a4)
          {
            char v20 = (void *)MEMORY[0x263F3C0E0];
            v21 = [NSString stringWithFormat:@"The data-point does not contain the required field '%@'", v12];
            *a4 = [v20 errorWithCode:401 description:v21];
          }
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = [(FedStatsCollectionKeyGenerator *)self unifiedFields];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    id v7 = (id)MEMORY[0x263EFFA68];
    goto LABEL_16;
  }
  v17 = [(FedStatsCollectionKeyGenerator *)self unifiedFields];
  unint64_t v18 = [(FedStatsCollectionKeyGenerator *)self namespaceIdentifier];
  id v38 = 0;
  uint64_t v19 = +[FedStatsDataCohort keysForCohorts:v17 namespaceID:v18 parameters:v6 possibleError:&v38];
  id v7 = v38;

  if (v19)
  {

    id v7 = (id)v19;
LABEL_16:
    unint64_t v23 = 0x263EFF000uLL;
    if ([v7 count])
    {
      v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      if ([v7 count])
      {
        unint64_t v25 = 0;
        do
        {
          v26 = [(FedStatsCollectionKeyGenerator *)self unifiedFields];
          uint64_t v27 = [v26 objectAtIndex:v25];

          v28 = [v7 objectAtIndex:v25];
          uint64_t v29 = [NSString stringWithFormat:@"%@%@%@", v27, @"=", v28];
          [v24 addObject:v29];

          ++v25;
        }
        while (v25 < [v7 count]);
        unint64_t v23 = 0x263EFF000;
      }
    }
    else
    {
      v44 = @"N/A";
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      v24 = (void *)[v30 mutableCopy];
    }
    v31 = [(FedStatsCollectionKeyGenerator *)self prefix];
    v43[0] = v31;
    v32 = [v24 componentsJoinedByString:@"|"];
    v43[1] = v32;
    v33 = [(FedStatsCollectionKeyGenerator *)self experimentIdentifier];
    v43[2] = v33;
    uint64_t v34 = [(FedStatsCollectionKeyGenerator *)self deploymentIdentifier];
    v43[3] = v34;
    v35 = [(FedStatsCollectionKeyGenerator *)self treatmentIdentifier];
    v43[4] = v35;
    v36 = [*(id *)(v23 + 2240) arrayWithObjects:v43 count:5];
    v22 = [v36 componentsJoinedByString:@":"];

    goto LABEL_23;
  }
  if (a4)
  {
    [MEMORY[0x263F3C0E0] errorWithCode:401 underlyingError:v7 description:@"Cannot validate and retrieve cohort values"];
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_14:
    v22 = 0;
  }
LABEL_23:

  return v22;
}

+ (id)extractCohortKeyValuesFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v3 length] >= 3)
  {
    id v6 = [v4 objectAtIndex:2];
    id v7 = [v6 componentsSeparatedByString:@"|"];

    if ([v7 count] == 1
      && ([v7 firstObject],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isEqual:@"N/A"],
          v8,
          (v9 & 1) != 0))
    {
      v5 = (void *)MEMORY[0x263EFFA78];
    }
    else
    {
      char v20 = v4;
      id v21 = v3;
      v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v16 = [v15 componentsSeparatedByString:@"="];
            if ([v16 count] == 2)
            {
              v17 = [v16 lastObject];
              unint64_t v18 = [v16 firstObject];
              [v5 setObject:v17 forKey:v18];
            }
            else
            {
              v17 = +[FedStatsPluginLog logger];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v27 = v15;
                _os_log_error_impl(&dword_24DF73000, v17, OS_LOG_TYPE_ERROR, "Cannot separate cohort key and value for '%@'", buf, 0xCu);
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v12);
      }

      v4 = v20;
      id v3 = v21;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA78];
  }

  return v5;
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)cohortKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)requiredFields
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)unifiedFields
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)namespaceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)experimentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)treatmentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)deploymentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentIdentifier, 0);
  objc_storeStrong((id *)&self->_treatmentIdentifier, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_unifiedFields, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_cohortKeys, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
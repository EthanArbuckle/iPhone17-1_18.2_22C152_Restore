@interface FHExperiment
- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4;
- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4 setRefresh:(BOOL)a5 delegate:(id)a6;
- (FHExperiment)initWithNamespaceName:(id)a3;
- (FHTRIClientUpdateDelegate)delegate;
- (id)getDirectoryForFactor:(id)a3;
- (id)getFactorMetadata:(id)a3;
- (id)getFilePathForFactor:(id)a3;
- (id)getLevelForFactor:(id)a3;
- (id)getTrialIdForFactor:(id)a3;
- (void)refresh;
- (void)setDelegate:(id)a3;
@end

@implementation FHExperiment

- (FHExperiment)initWithNamespaceName:(id)a3
{
  return [(FHExperiment *)self initWithClient:0 namespaceName:a3 setRefresh:0 delegate:0];
}

- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4
{
  return [(FHExperiment *)self initWithClient:a3 namespaceName:a4 setRefresh:0 delegate:0];
}

- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4 setRefresh:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FHExperiment;
  v13 = [(FHExperiment *)&v27 init];
  if (v13)
  {
    if (v10)
    {
      v14 = (TRIClient *)v10;
    }
    else
    {
      v14 = [MEMORY[0x263F80E18] clientWithIdentifier:326];
    }
    triClient = v13->_triClient;
    v13->_triClient = v14;

    uint64_t v16 = [v11 copy];
    namespaceName = v13->_namespaceName;
    v13->_namespaceName = (NSString *)v16;

    v18 = (NSDictionary *)objc_alloc_init(NSDictionary);
    factorMetadatas = v13->_factorMetadatas;
    v13->_factorMetadatas = v18;

    objc_storeWeak((id *)&v13->_delegate, v12);
    if (v7)
    {
      objc_initWeak(&location, v13);
      v20 = v13->_triClient;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __65__FHExperiment_initWithClient_namespaceName_setRefresh_delegate___block_invoke;
      v23[3] = &unk_265314CB8;
      objc_copyWeak(&v25, &location);
      id v24 = v11;
      id v21 = (id)[(TRIClient *)v20 addUpdateHandlerForNamespaceName:v24 usingBlock:v23];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

void __65__FHExperiment_initWithClient_namespaceName_setRefresh_delegate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 136315394;
    id v11 = "-[FHExperiment initWithClient:namespaceName:setRefresh:delegate:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_24E029000, v3, OS_LOG_TYPE_DEBUG, "%s Trial update for namespace: %@", (uint8_t *)&v10, 0x16u);
  }

  if (WeakRetained)
  {
    [WeakRetained refresh];
    uint64_t v5 = [WeakRetained delegate];
    if (v5)
    {
      v6 = (void *)v5;
      BOOL v7 = [WeakRetained delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        v9 = [WeakRetained delegate];
        [v9 updateFactors];
      }
    }
  }
}

- (void)refresh
{
}

- (id)getLevelForFactor:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:self->_namespaceName];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:self->_factorMetadatas];
  BOOL v7 = v6;
  if (v5)
  {
    char v8 = [(TRIClient *)self->_triClient experimentIdentifiersWithNamespaceName:self->_namespaceName];
    v9 = [v8 copy];

    int v10 = [(TRIClient *)self->_triClient rolloutIdentifiersWithNamespaceName:self->_namespaceName];
    id v11 = (void *)[v10 copy];

    __int16 v12 = [v5 metadata];
    uint64_t v13 = v12;
    if (v9
      && ([v12 objectForKey:@"factorType"],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 isEqualToString:@"exp"],
          v14,
          v15))
    {
      v31 = v11;
      uint64_t v16 = NSString;
      v17 = [v9 experimentId];
      v18 = [v9 treatmentId];
      v19 = [v16 stringWithFormat:@"e:%@:%@", v17, v18];
    }
    else
    {
      if (!v11)
      {
        v19 = &stru_27001CD40;
LABEL_14:
        [v13 setObject:v19 forKey:@"trialId"];
        v26 = (void *)[v13 copy];
        [v7 setObject:v26 forKey:v4];

        objc_super v27 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v33 = "-[FHExperiment getLevelForFactor:]";
          __int16 v34 = 2112;
          id v35 = v4;
          __int16 v36 = 2112;
          v37 = (NSString *)v5;
          _os_log_impl(&dword_24E029000, v27, OS_LOG_TYPE_DEBUG, "%s Factor %@ level %@", buf, 0x20u);
        }

        goto LABEL_17;
      }
      v31 = v11;
      v20 = [v5 metadata];
      id v21 = [v20 objectForKey:@"factorType"];
      int v22 = [v21 isEqualToString:@"rollout"];

      if (!v22)
      {
        v19 = &stru_27001CD40;
        goto LABEL_13;
      }
      v23 = NSString;
      v17 = [v31 rolloutId];
      v18 = [v31 factorPackId];
      id v24 = [v31 rampId];
      v19 = [v23 stringWithFormat:@"r:%@:%@:%@", v17, v18, v24];
    }
LABEL_13:
    id v11 = v31;
    goto LABEL_14;
  }
  [v6 removeObjectForKey:v4];
  v9 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    namespaceName = self->_namespaceName;
    *(_DWORD *)buf = 136315650;
    v33 = "-[FHExperiment getLevelForFactor:]";
    __int16 v34 = 2112;
    id v35 = v4;
    __int16 v36 = 2112;
    v37 = namespaceName;
    _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_DEBUG, "%s No level found for factor %@ in namespace %@", buf, 0x20u);
  }
LABEL_17:

  v28 = (NSDictionary *)[v7 copy];
  factorMetadatas = self->_factorMetadatas;
  self->_factorMetadatas = v28;

  return v5;
}

- (id)getTrialIdForFactor:(id)a3
{
  v3 = [(NSDictionary *)self->_factorMetadatas objectForKey:a3];
  id v4 = [v3 objectForKey:@"trialId"];

  return v4;
}

- (id)getFactorMetadata:(id)a3
{
  return [(NSDictionary *)self->_factorMetadatas objectForKey:a3];
}

- (id)getFilePathForFactor:(id)a3
{
  v3 = [(FHExperiment *)self getLevelForFactor:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 fileValue];
    v6 = [v5 path];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getDirectoryForFactor:(id)a3
{
  v3 = [(FHExperiment *)self getLevelForFactor:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 directoryValue];
    v6 = [v5 path];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (FHTRIClientUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FHTRIClientUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_factorMetadatas, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

@end
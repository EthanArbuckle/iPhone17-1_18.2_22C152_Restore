@interface NLParameterTuner
+ (id)parameterTunerWithParameters:(id)a3 options:(id)a4 delegate:(id)a5;
+ (id)tunedParameterBundleWithParameters:(id)a3 options:(id)a4 delegate:(id)a5 error:(id *)a6;
- (NLParameterTuner)initWithParameters:(id)a3 options:(id)a4 delegate:(id)a5;
- (NLParameterTuningDelegate)delegate;
- (NSArray)parameterNames;
- (NSArray)parameters;
- (NSDictionary)options;
- (id)_hyperTuneParameterArray;
- (id)tunedParameterBundleWithError:(id *)a3;
@end

@implementation NLParameterTuner

+ (id)tunedParameterBundleWithParameters:(id)a3 options:(id)a4 delegate:(id)a5 error:(id *)a6
{
  v7 = [a1 parameterTunerWithParameters:a3 options:a4 delegate:a5];
  v8 = [v7 tunedParameterBundleWithError:a6];

  return v8;
}

+ (id)parameterTunerWithParameters:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithParameters:v10 options:v9 delegate:v8];

  return v11;
}

- (NLParameterTuner)initWithParameters:(id)a3 options:(id)a4 delegate:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)NLParameterTuner;
  v11 = [(NLParameterTuner *)&v35 init];
  if (v11)
  {
    v29 = v9;
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v30 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v19 = [v18 name];
          BOOL v20 = [(NSArray *)v12 containsObject:v19];

          if (!v20)
          {
            v21 = [v18 name];
            [(NSArray *)v12 addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }

    uint64_t v22 = [v13 copy];
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v22;

    parameterNames = v11->_parameterNames;
    v11->_parameterNames = v12;
    v25 = v12;

    id v9 = v29;
    uint64_t v26 = [v29 copy];
    options = v11->_options;
    v11->_options = (NSDictionary *)v26;

    objc_storeWeak((id *)&v11->_delegate, v10);
    id v8 = v30;
  }

  return v11;
}

- (id)_hyperTuneParameterArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NLParameterTuner *)self parameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) _hyperTuneDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)tunedParameterBundleWithError:(id *)a3
{
  v50[5] = *MEMORY[0x1E4F143B8];
  v40 = [(NLParameterTuner *)self _hyperTuneParameterArray];
  v4 = [(NLParameterTuner *)self options];
  v38 = [v4 objectForKey:@"Metadata"];
  v39 = [(NLParameterTuner *)self delegate];
  objc_opt_respondsToSelector();
  id v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v50[0] = @"Algorithm";
  v50[1] = @"MaximumIterations";
  v50[2] = @"PreferLowerScore";
  v50[3] = @"RandomSeed";
  v50[4] = @"Metadata";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (([v7 containsObject:v13] & 1) == 0)
        {
          long long v14 = [v8 objectForKey:v13];
          [v6 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [v8 objectForKey:@"Algorithm"];
  uint64_t v16 = v15;
  if (v15)
  {
    int v17 = [v15 isEqual:@"Random"];
    v18 = (void *)MEMORY[0x1E4F78E48];
    if (!v17) {
      v18 = (void *)MEMORY[0x1E4F78E38];
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F78E38];
  }
  [v6 setObject:*v18 forKey:*MEMORY[0x1E4F78E40]];
  int v19 = BOOLForKey(v8, @"PreferLowerScore", 0);
  BOOL v20 = (void *)MEMORY[0x1E4F78E68];
  if (!v19) {
    BOOL v20 = (void *)MEMORY[0x1E4F78E60];
  }
  [v6 setObject:*v20 forKey:*MEMORY[0x1E4F78E58]];
  uint64_t v21 = [v8 objectForKey:@"MaximumIterations"];
  if (v21) {
    uint64_t v22 = (void *)v21;
  }
  else {
    uint64_t v22 = &unk_1EFB3A9D0;
  }
  [v6 setObject:v22 forKey:*MEMORY[0x1E4F78EB0]];
  v23 = [v8 objectForKey:@"RandomSeed"];
  if (v23) {
    [v6 setObject:v23 forKey:*MEMORY[0x1E4F78EA8]];
  }
  v24 = [v8 objectForKey:@"InitialParameterValues"];
  if (v24) {
    [v6 setObject:v24 forKey:*MEMORY[0x1E4F78E50]];
  }

  id v25 = v6;
  id v41 = v38;
  id v42 = v39;
  id v26 = v41;
  id v27 = v42;
  uint64_t v28 = HTTuneParameters();
  if (v28)
  {
    v29 = (void *)v28;
    id v30 = [(NLParameterTuner *)self parameters];
    long long v31 = _parameterValuesForHyperTuneValues(v29);
    long long v32 = +[NLParameterBundle parameterBundleWithParameters:v30 values:v31 metadata:v26];

    CFRelease(v29);
  }
  else
  {
    if (a3)
    {
      long long v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = @"Failed to tune parameter bundle";
      long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v35 = [v33 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:9 userInfo:v34];
      *a3 = v35;
    }
    long long v32 = 0;
  }

  return v32;
}

double __50__NLParameterTuner_tunedParameterBundleWithError___block_invoke(uint64_t a1, void *a2)
{
  v4 = [*(id *)(a1 + 32) parameters];
  id v5 = _parameterValuesForHyperTuneValues(a2);
  uint64_t v6 = +[NLParameterBundle parameterBundleWithParameters:v4 values:v5 metadata:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) parameterTuner:*(void *)(a1 + 32) scoreForBundle:v6];
  double v8 = v7;

  return v8;
}

void __50__NLParameterTuner_tunedParameterBundleWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4, double a5)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v10 = [*(id *)(a1 + 32) parameters];
    uint64_t v11 = _parameterValuesForHyperTuneValues(a3);
    long long v12 = +[NLParameterBundle parameterBundleWithParameters:v10 values:v11 metadata:*(void *)(a1 + 40)];

    LODWORD(a2) = [*(id *)(a1 + 48) parameterTuner:*(void *)(a1 + 32) shouldStopWithTunedBundle:v12 score:a2 iterationNumber:a5];
    if (a2) {
      *a4 = 1;
    }
  }
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NLParameterTuningDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NLParameterTuningDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
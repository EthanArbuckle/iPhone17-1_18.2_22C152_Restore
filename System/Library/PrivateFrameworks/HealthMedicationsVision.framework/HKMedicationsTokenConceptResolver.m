@interface HKMedicationsTokenConceptResolver
- (HKMedicationsAssetInterface)assetInterface;
- (HKMedicationsTokenConceptResolver)initWithAssetInterface:(id)a3;
- (HKMedicationsTokenizer)tokenizer;
- (double)_tokenMatchScoreForMedication:(id)a3 usingTokens:(id)a4;
- (id)_collectAllMedicationCandidatesUsingTokens:(id)a3;
- (id)_expandedMedicationsFromCandidates:(id)a3;
- (id)rankMedicationsUsingTokens:(id)a3 candidates:(id)a4;
- (id)recognizedMedicationsFromTextBlock:(id)a3;
- (id)recognizedMedicationsFromTranscript:(id)a3;
- (id)removeMedicationsFromNoisyTokensUsingTokens:(id)a3 candidates:(id)a4;
- (id)removeStowawayIngredientsUsingTokens:(id)a3 candidates:(id)a4;
- (void)setAssetInterface:(id)a3;
- (void)setTokenizer:(id)a3;
@end

@implementation HKMedicationsTokenConceptResolver

- (HKMedicationsTokenConceptResolver)initWithAssetInterface:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsTokenConceptResolver;
  v5 = [(HKMedicationsTokenConceptResolver *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(HKMedicationsTokenConceptResolver *)v5 setAssetInterface:v4];
    v7 = objc_alloc_init(HKMedicationsTokenizer);
    [(HKMedicationsTokenConceptResolver *)v6 setTokenizer:v7];
  }
  return v6;
}

- (id)recognizedMedicationsFromTextBlock:(id)a3
{
  id v4 = [a3 getTranscript];
  v5 = [(HKMedicationsTokenConceptResolver *)self recognizedMedicationsFromTranscript:v4];

  return v5;
}

- (id)recognizedMedicationsFromTranscript:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FCFA10]();
  if ([v4 length])
  {
    v6 = [(HKMedicationsTokenConceptResolver *)self tokenizer];
    v7 = [v6 wordsFromTranscript:v4];

    v8 = [(HKMedicationsTokenConceptResolver *)self _collectAllMedicationCandidatesUsingTokens:v7];
    objc_super v9 = [(HKMedicationsTokenConceptResolver *)self _expandedMedicationsFromCandidates:v8];
    v10 = [(HKMedicationsTokenConceptResolver *)self removeMedicationsFromNoisyTokensUsingTokens:v7 candidates:v9];
    v11 = [(HKMedicationsTokenConceptResolver *)self removeStowawayIngredientsUsingTokens:v7 candidates:v10];
    v12 = [(HKMedicationsTokenConceptResolver *)self rankMedicationsUsingTokens:v7 candidates:v11];
    v13 = [v12 array];
  }
  else
  {
    v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (id)_collectAllMedicationCandidatesUsingTokens:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  context = (void *)MEMORY[0x230FCFA10]();
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        id v10 = objc_alloc(MEMORY[0x263EFFA08]);
        v11 = [(HKMedicationsTokenConceptResolver *)self assetInterface];
        uint64_t v30 = v9;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        id v21 = 0;
        v13 = [v11 genericMedicationsFromTokens:v12 error:&v21];
        id v14 = v21;
        v15 = (void *)[v10 initWithArray:v13];

        if (v14)
        {
          _HKInitializeLogging();
          v16 = HKLogMedication();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v27 = self;
            __int16 v28 = 2114;
            id v29 = v14;
            _os_log_error_impl(&dword_230F1A000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error searching generic medication: %{public}@", buf, 0x16u);
          }
        }
        else if ([v15 count])
        {
          [v19 setObject:v15 forKeyedSubscript:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v6);
  }

  return v19;
}

- (id)_expandedMedicationsFromCandidates:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  context = (void *)MEMORY[0x230FCFA10]();
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = v4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v4 allKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v24)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * v5);
        uint64_t v26 = v5;
        uint64_t v6 = [v23 objectForKeyedSubscript:context];
        id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v29;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
              id v14 = [(HKMedicationsTokenConceptResolver *)self assetInterface];
              id v27 = 0;
              v15 = [v14 expandedGenericMedicationSearchResult:v13 error:&v27];
              id v16 = v27;

              if (v16)
              {
                _HKInitializeLogging();
                v17 = HKLogMedication();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v37 = self;
                  __int16 v38 = 2112;
                  id v39 = v16;
                  _os_log_error_impl(&dword_230F1A000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error expanding generic medication: %@{public}@", buf, 0x16u);
                }
              }
              else
              {
                [v7 addObject:v15];
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v10);
        }

        [v22 setObject:v7 forKeyedSubscript:v25];
        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v24);
  }

  return v22;
}

- (id)removeMedicationsFromNoisyTokensUsingTokens:(id)a3 candidates:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v41 = a4;
  context = (void *)MEMORY[0x230FCFA10]();
  id v40 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v5;
  uint64_t v38 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v67;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v67 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v6;
        objc_msgSend(v41, "objectForKeyedSubscript:", *(void *)(*((void *)&v66 + 1) + 8 * v6), context);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v46 = [v43 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v46)
          {
            uint64_t v45 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v63 != v45) {
                  objc_enumerationMutation(v43);
                }
                id v8 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                uint64_t v10 = [v8 ingredients];
                uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v72 count:16];
                if (v11)
                {
                  uint64_t v12 = v11;
                  v44 = v8;
                  uint64_t v47 = i;
                  id v48 = v10;
                  uint64_t v13 = *(void *)v59;
                  double v14 = 0.0;
                  do
                  {
                    for (uint64_t j = 0; j != v12; ++j)
                    {
                      if (*(void *)v59 != v13) {
                        objc_enumerationMutation(v48);
                      }
                      id v16 = [*(id *)(*((void *)&v58 + 1) + 8 * j) ingredientName];
                      v17 = [(HKMedicationsTokenConceptResolver *)self tokenizer];
                      v18 = [v17 wordsFromTranscript:v16];

                      long long v56 = 0u;
                      long long v57 = 0u;
                      long long v54 = 0u;
                      long long v55 = 0u;
                      id v19 = v18;
                      uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v71 count:16];
                      if (v20)
                      {
                        uint64_t v21 = v20;
                        uint64_t v22 = *(void *)v55;
                        do
                        {
                          for (uint64_t k = 0; k != v21; ++k)
                          {
                            if (*(void *)v55 != v22) {
                              objc_enumerationMutation(v19);
                            }
                            uint64_t v24 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                            [v9 addObject:v24];
                            double v14 = v14 + (double)(unint64_t)[v24 length];
                          }
                          uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v71 count:16];
                        }
                        while (v21);
                      }
                    }
                    uint64_t v12 = [v48 countByEnumeratingWithState:&v58 objects:v72 count:16];
                  }
                  while (v12);

                  uint64_t i = v47;
                  if (v14 > 0.0)
                  {
                    [v9 intersectSet:obj];
                    long long v52 = 0u;
                    long long v53 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    id v25 = v9;
                    uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v70 count:16];
                    if (v26)
                    {
                      uint64_t v27 = v26;
                      uint64_t v28 = *(void *)v51;
                      double v29 = 0.0;
                      do
                      {
                        for (uint64_t m = 0; m != v27; ++m)
                        {
                          if (*(void *)v51 != v28) {
                            objc_enumerationMutation(v25);
                          }
                          double v29 = v29
                              + (double)(unint64_t)[*(id *)(*((void *)&v50 + 1) + 8 * m) length];
                        }
                        uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v70 count:16];
                      }
                      while (v27);
                    }
                    else
                    {
                      double v29 = 0.0;
                    }

                    uint64_t v31 = [v25 count];
                    if (v29 / v14 >= 0.5)
                    {
                      uint64_t v32 = v31;
                      long long v33 = objc_msgSend(v41, "allKeys", v29 / v14);
                      uint64_t v34 = [v33 count];

                      if (v32 == v34) {
                        [v40 addObject:v44];
                      }
                    }
                  }
                }
                else
                {
                }
              }
              uint64_t v46 = [v43 countByEnumeratingWithState:&v62 objects:v73 count:16];
            }
            while (v46);
          }
        }

        uint64_t v6 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v38);
  }

  return v40;
}

- (id)removeStowawayIngredientsUsingTokens:(id)a3 candidates:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v5 = a4;
  context = (void *)MEMORY[0x230FCFA10]();
  id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v8 = [v7 ingredients];
        uint64_t v31 = [v8 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (!v31)
        {

LABEL_25:
          [v23 addObject:v7];
          continue;
        }
        uint64_t v26 = v7;
        uint64_t v27 = i;
        char v9 = 0;
        uint64_t v30 = *(void *)v37;
        id v28 = v8;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(v28);
            }
            uint64_t v11 = [*(id *)(*((void *)&v36 + 1) + 8 * j) ingredientName];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v12 = v29;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              char v15 = 0;
              uint64_t v16 = *(void *)v33;
              do
              {
                for (uint64_t k = 0; k != v14; ++k)
                {
                  if (*(void *)v33 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * k);
                  id v19 = [v11 lowercaseString];
                  LOBYTE(v18) = [v19 containsString:v18];

                  v15 |= v18;
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
              }
              while (v14);

              v9 |= v15 ^ 1;
            }
            else
            {

              char v9 = 1;
            }
          }
          uint64_t v31 = [v28 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v31);

        id v7 = v26;
        uint64_t i = v27;
        if ((v9 & 1) == 0) {
          goto LABEL_25;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v25);
  }

  return v23;
}

- (id)rankMedicationsUsingTokens:(id)a3 candidates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FCFA10]();
  char v9 = [v7 allObjects];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __75__HKMedicationsTokenConceptResolver_rankMedicationsUsingTokens_candidates___block_invoke;
  uint64_t v18 = &unk_264BC37F8;
  id v19 = self;
  id v10 = v6;
  id v20 = v10;
  uint64_t v11 = [v9 sortedArrayUsingComparator:&v15];

  id v12 = objc_alloc(MEMORY[0x263EFF9D8]);
  uint64_t v13 = objc_msgSend(v12, "initWithArray:", v11, v15, v16, v17, v18, v19);

  return v13;
}

uint64_t __75__HKMedicationsTokenConceptResolver_rankMedicationsUsingTokens_candidates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _tokenMatchScoreForMedication:v5 usingTokens:*(void *)(a1 + 40)];
  double v8 = v7;
  [*(id *)(a1 + 32) _tokenMatchScoreForMedication:v6 usingTokens:*(void *)(a1 + 40)];
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v11 = [v5 genericMedicationName];
      id v12 = [v6 genericMedicationName];
      uint64_t v10 = [v11 caseInsensitiveCompare:v12];
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (double)_tokenMatchScoreForMedication:(id)a3 usingTokens:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x230FCFA10]();
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v23 = v6;
  double v9 = [v6 ingredients];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        uint64_t v15 = [(HKMedicationsTokenConceptResolver *)self tokenizer];
        uint64_t v16 = [v14 ingredientName];
        v17 = [v15 wordsFromTranscript:v16];
        [v8 unionSet:v17];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  uint64_t v18 = (void *)[v8 mutableCopy];
  [v18 intersectSet:v7];
  unint64_t v19 = [v18 count];
  unint64_t v20 = [v8 count];

  return (double)v19 / (double)v20;
}

- (HKMedicationsAssetInterface)assetInterface
{
  return self->_assetInterface;
}

- (void)setAssetInterface:(id)a3
{
}

- (HKMedicationsTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_assetInterface, 0);
}

@end
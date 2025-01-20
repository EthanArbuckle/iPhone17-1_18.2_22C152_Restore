@interface EMFIndexStrategySingleStemmedIndexOnly
- (id)_calculateDocumentWeightsForQueryTokenCounts:(id)a3;
- (id)_commonDocumentsForTerms:(id)a3;
- (id)_postingsForTerm:(id)a3;
- (id)_postingsForTerms:(id)a3;
- (id)_termWeightForTerm:(id)a3 inDocument:(id)a4;
- (id)_termsForDocument:(id)a3;
- (id)postingsForTerm:(id)a3;
- (id)termWeightForTerm:(id)a3 inDocument:(id)a4;
- (id)termsForDocument:(id)a3;
@end

@implementation EMFIndexStrategySingleStemmedIndexOnly

- (id)postingsForTerm:(id)a3
{
  v3 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _postingsForTerm:a3];
  v4 = [v3 objectForKeyedSubscript:@"postings"];

  return v4;
}

- (id)termsForDocument:(id)a3
{
  v4 = [a3 stringValue];
  v5 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _termsForDocument:v4];

  return v5;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  v7 = [a4 stringValue];
  v8 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _termWeightForTerm:v6 inDocument:v7];

  return v8;
}

- (id)_postingsForTerm:(id)a3
{
  id v4 = a3;
  v5 = [(EMFAbstractIndexStrategy *)self termIndex];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_postingsForTerms:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = -[EMFIndexStrategySingleStemmedIndexOnly _postingsForTerm:](self, "_postingsForTerm:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];
  return v13;
}

- (id)_termsForDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(EMFAbstractIndexStrategy *)self documentIndex];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _termsForDocument:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKey:v6];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKey:@"weight_norm"];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_commonDocumentsForTerms:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _postingsForTerms:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        v13 = [v12 objectForKeyedSubscript:@"postings"];
        v14 = [v13 allKeys];

        if (v9)
        {
          long long v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
          [v6 intersectSet:v15];
        }
        else
        {
          [v6 addObjectsFromArray:v14];
        }

        char v9 = 1;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v16 = (void *)[v6 copy];
  return v16;
}

- (id)_calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v4 = [v30 allKeys];
  id v5 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _commonDocumentsForTerms:v4];

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v30;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
          double v14 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              long long v17 = [v10 objectForKeyedSubscript:v16];
              [v17 doubleValue];
              double v19 = v18;
              long long v20 = [(EMFIndexStrategySingleStemmedIndexOnly *)self _termWeightForTerm:v16 inDocument:v9];
              long long v21 = v20;
              if (v20) {
                [v20 doubleValue];
              }
              else {
                double v22 = 0.0;
              }
              double v14 = v14 + v22 * v19;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v12);
        }
        else
        {
          double v14 = 0.0;
        }

        v23 = [NSNumber numberWithDouble:v14];
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue"));
        [v29 setObject:v23 forKey:v24];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  v25 = (void *)[v29 copy];
  return v25;
}

@end
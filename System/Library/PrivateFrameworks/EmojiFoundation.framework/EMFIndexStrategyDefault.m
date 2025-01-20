@interface EMFIndexStrategyDefault
- (double)_calculateCumulativeTermWeightForQueryTokenCounts:(id)a3 inDocumentID:(id)a4;
- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3;
- (id)commonDocumentsForTerms:(id)a3;
- (id)postingsForTerm:(id)a3;
- (id)termWeightForTerm:(id)a3 inDocument:(id)a4;
- (id)termsForDocument:(id)a3;
@end

@implementation EMFIndexStrategyDefault

- (id)postingsForTerm:(id)a3
{
  id v4 = a3;
  v5 = [(EMFAbstractIndexStrategy *)self termIndex];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)termsForDocument:(id)a3
{
  id v4 = a3;
  v5 = [(EMFAbstractIndexStrategy *)self documentIndex];
  v6 = [v4 stringValue];

  v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  v7 = [(EMFIndexStrategyDefault *)self termsForDocument:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKey:v6];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 objectForKey:@"w"];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)commonDocumentsForTerms:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = -[EMFIndexStrategyDefault postingsForTerm:](self, "postingsForTerm:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v9)
        {
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
          [v5 intersectSet:v13];
        }
        else
        {
          [v5 addObjectsFromArray:v12];
        }

        char v9 = 1;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = [(EMFIndexStrategyDefault *)self commonDocumentsForTerms:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        -[EMFIndexStrategyDefault _calculateCumulativeTermWeightForQueryTokenCounts:inDocumentID:](self, "_calculateCumulativeTermWeightForQueryTokenCounts:inDocumentID:", v4, v13, (void)v17);
        v14 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v7 setObject:v14 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v7 copy];
  return v15;
}

- (double)_calculateCumulativeTermWeightForQueryTokenCounts:(id)a3 inDocumentID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [v6 objectForKeyedSubscript:v13];
        [v14 doubleValue];
        double v16 = v15;
        long long v17 = [(EMFIndexStrategyDefault *)self termWeightForTerm:v13 inDocument:v7];
        long long v18 = v17;
        if (v17) {
          [v17 doubleValue];
        }
        else {
          double v19 = 0.0;
        }
        double v11 = v11 + v19 * v16;
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

@end
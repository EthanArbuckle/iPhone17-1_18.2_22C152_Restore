@interface SGMINaiveBayesModelQueryResult
- (NSArray)bigramQueriedTokensCount;
- (NSArray)unigramQueriedTokensCount;
- (SGMINaiveBayesModelQueryResult)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramQueriedTokensCount:(id)a6 bigramQueriedTokensCount:(id)a7 oldestTokenAge:(double)a8;
- (SGMITokenCounts)bigramTokenCounts;
- (SGMITokenCounts)mailCount;
- (SGMITokenCounts)unigramTokenCounts;
- (double)oldestTokenAge;
- (id)inferProbability;
@end

@implementation SGMINaiveBayesModelQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bigramQueriedTokensCount, 0);
  objc_storeStrong((id *)&self->_unigramQueriedTokensCount, 0);
  objc_storeStrong((id *)&self->_bigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_unigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);
}

- (double)oldestTokenAge
{
  return self->_oldestTokenAge;
}

- (NSArray)bigramQueriedTokensCount
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)unigramQueriedTokensCount
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (SGMITokenCounts)bigramTokenCounts
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 24, 1);
}

- (SGMITokenCounts)unigramTokenCounts
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 16, 1);
}

- (SGMITokenCounts)mailCount
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 8, 1);
}

- (id)inferProbability
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v3 = [(SGMITokenCounts *)self->_mailCount salientCount];
  [v3 doubleValue];
  long double v5 = v4;

  v6 = [(SGMITokenCounts *)self->_mailCount regularCount];
  [v6 doubleValue];
  long double v8 = v7;

  if (v5 + v8 < 0.00001) {
    goto LABEL_2;
  }
  v10 = [(SGMITokenCounts *)self->_unigramTokenCounts salientCount];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 >= 0.00001)
  {
    if (![(NSArray *)self->_unigramQueriedTokensCount count])
    {
LABEL_2:
      v9 = &unk_1F2536330;
      goto LABEL_30;
    }
    double v13 = log(v5 + v8);
    double v14 = log(v5);
    double v15 = log(v8);
    unint64_t v16 = [(NSArray *)self->_unigramQueriedTokensCount count];
    double v17 = (double)v16;
    double v18 = -(double)v16;
    v19 = [(SGMITokenCounts *)self->_unigramTokenCounts salientCount];
    [v19 doubleValue];
    double v21 = log(v20 + 0.00001);
    double v22 = v21;
    if (v16 <= 1)
    {
      double v25 = v21 * v18;
    }
    else
    {
      v23 = [(SGMITokenCounts *)self->_bigramTokenCounts salientCount];
      [v23 doubleValue];
      double v25 = v18 * v22 - (v17 + -1.0) * log(v24 + 0.00001);
    }
    v26 = [(SGMITokenCounts *)self->_unigramTokenCounts regularCount];
    [v26 doubleValue];
    double v28 = log(v27 + 0.00001);
    double v29 = v28;
    if (v16 <= 1)
    {
      double v32 = v28 * v18;
    }
    else
    {
      v30 = [(SGMITokenCounts *)self->_bigramTokenCounts regularCount];
      [v30 doubleValue];
      double v32 = v18 * v29 - (v17 + -1.0) * log(v31 + 0.00001);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v33 = self->_unigramQueriedTokensCount;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v39 = [v38 salientCount];
          [v39 doubleValue];
          double v25 = v25 + log(v40 + 0.00001);

          v41 = [v38 regularCount];
          [v41 doubleValue];
          double v32 = v32 + log(v42 + 0.00001);
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v35);
    }
    double v43 = v14 - v13;
    double v44 = v15 - v13;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v45 = self->_bigramQueriedTokensCount;
    uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v63 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          v51 = objc_msgSend(v50, "salientCount", (void)v62);
          [v51 doubleValue];
          double v25 = v25 + log(v52 + 0.00001);

          v53 = [v50 regularCount];
          [v53 doubleValue];
          double v32 = v32 + log(v54 + 0.00001);
        }
        uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v47);
    }

    double v55 = v43 + v25;
    double v56 = v44 + v32;
    if (v55 >= v44 + v32) {
      double v57 = v55;
    }
    else {
      double v57 = v44 + v32;
    }
    double v58 = exp(v55 - v57);
    long double v59 = exp(v56 - v57);
    long double v60 = log(v58 + v59);
    v9 = [NSNumber numberWithDouble:(double)exp(v55 - (v57 + v60))];
  }
  else
  {
    v9 = &unk_1F25366B8;
  }
LABEL_30:
  return v9;
}

- (SGMINaiveBayesModelQueryResult)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramQueriedTokensCount:(id)a6 bigramQueriedTokensCount:(id)a7 oldestTokenAge:(double)a8
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SGMINaiveBayesModelQueryResult;
  v19 = [(SGMINaiveBayesModelQueryResult *)&v23 init];
  double v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mailCount, a3);
    objc_storeStrong((id *)&v20->_unigramTokenCounts, a4);
    objc_storeStrong((id *)&v20->_bigramTokenCounts, a5);
    objc_storeStrong((id *)&v20->_unigramQueriedTokensCount, a6);
    objc_storeStrong((id *)&v20->_bigramQueriedTokensCount, a7);
    v20->_oldestTokenAge = a8;
  }

  return v20;
}

@end
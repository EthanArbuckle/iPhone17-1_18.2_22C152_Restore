@interface _CDPPredictionResult
- (NSMutableDictionary)scoresForMembers;
- (_CDPPredictionResult)initWithMembers:(id)a3 andScores:(id)a4;
- (double)weight;
- (id)initByMergingPredictionResults:(id)a3;
- (id)rankedMembers;
- (id)rankedMembers:(id)a3;
- (id)rankedMembersPassingThreshold:(double)a3;
- (void)commonInit;
- (void)setScoresForMembers:(id)a3;
- (void)setWeight:(double)a3;
@end

@implementation _CDPPredictionResult

- (void)commonInit
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(_CDPPredictionResult *)self setScoresForMembers:v3];

  [(_CDPPredictionResult *)self setWeight:1.0];
}

- (_CDPPredictionResult)initWithMembers:(id)a3 andScores:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CDPPredictionResult;
  v8 = [(_CDPPredictionResult *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(_CDPPredictionResult *)v8 commonInit];
    uint64_t v10 = [v6 count];
    if (v10 >= 1)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        scoresForMembers = v9->_scoresForMembers;
        v14 = [v7 objectAtIndexedSubscript:i];
        v15 = [v6 objectAtIndexedSubscript:i];
        [(NSMutableDictionary *)scoresForMembers setObject:v14 forKey:v15];
      }
    }
  }

  return v9;
}

- (id)initByMergingPredictionResults:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)_CDPPredictionResult;
  v44 = [(_CDPPredictionResult *)&v67 init];
  if (v44)
  {
    [(_CDPPredictionResult *)v44 commonInit];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (!v6)
    {
LABEL_43:

      goto LABEL_44;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v64;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * i) weight];
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v7);

    if (v9 > 0.0)
    {
      id v42 = v4;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = v5;
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v60 != v15) {
              objc_enumerationMutation(obj);
            }
            objc_super v17 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            v18 = [v17 scoresForMembers];
            v19 = [v18 allKeys];

            uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v70 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v56;
              do
              {
                for (uint64_t k = 0; k != v21; ++k)
                {
                  if (*(void *)v56 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v55 + 1) + 8 * k);
                  if ([v24 length]) {
                    [v12 addObject:v24];
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v55 objects:v70 count:16];
              }
              while (v21);
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
        }
        while (v14);
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v5 = v12;
      uint64_t v45 = [v5 countByEnumeratingWithState:&v51 objects:v69 count:16];
      if (v45)
      {
        uint64_t v43 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(v5);
            }
            uint64_t v26 = *(void *)(*((void *)&v51 + 1) + 8 * m);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v27 = obj;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v68 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v48;
              double v31 = 0.0;
              do
              {
                for (uint64_t n = 0; n != v29; ++n)
                {
                  if (*(void *)v48 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v33 = *(void **)(*((void *)&v47 + 1) + 8 * n);
                  v34 = [v33 scoresForMembers];
                  v35 = [v34 objectForKeyedSubscript:v26];
                  [v35 doubleValue];
                  double v37 = v36;
                  [v33 weight];
                  double v31 = v31 + v37 * v38;
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v68 count:16];
              }
              while (v29);
            }
            else
            {
              double v31 = 0.0;
            }

            scoresForMembers = v44->_scoresForMembers;
            v40 = [NSNumber numberWithDouble:v31 / v9];
            [(NSMutableDictionary *)scoresForMembers setObject:v40 forKey:v26];
          }
          uint64_t v45 = [v5 countByEnumeratingWithState:&v51 objects:v69 count:16];
        }
        while (v45);
      }

      id v4 = v42;
      goto LABEL_43;
    }
  }
LABEL_44:

  return v44;
}

- (id)rankedMembers:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___CDPPredictionResult_rankedMembers___block_invoke;
  v5[3] = &unk_1E560E428;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

- (id)rankedMembers
{
  rankedMembers = self->_rankedMembers;
  if (!rankedMembers)
  {
    id v4 = [(NSMutableDictionary *)self->_scoresForMembers allKeys];
    id v5 = [(_CDPPredictionResult *)self rankedMembers:v4];
    uint64_t v6 = self->_rankedMembers;
    self->_rankedMembers = v5;

    rankedMembers = self->_rankedMembers;
  }
  return rankedMembers;
}

- (id)rankedMembersPassingThreshold:(double)a3
{
  id v5 = [(NSMutableDictionary *)self->_scoresForMembers allKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___CDPPredictionResult_rankedMembersPassingThreshold___block_invoke;
  v10[3] = &unk_1E560E450;
  v10[4] = self;
  *(double *)&v10[5] = a3;
  uint64_t v6 = [v5 indexesOfObjectsPassingTest:v10];
  uint64_t v7 = [v5 objectsAtIndexes:v6];
  uint64_t v8 = [(_CDPPredictionResult *)self rankedMembers:v7];

  return v8;
}

- (NSMutableDictionary)scoresForMembers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScoresForMembers:(id)a3
{
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedMembers, 0);
  objc_storeStrong((id *)&self->_scoresForMembers, 0);
}

@end
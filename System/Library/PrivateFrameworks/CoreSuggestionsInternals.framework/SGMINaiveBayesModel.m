@interface SGMINaiveBayesModel
- (NSMutableDictionary)bigramTokensCount;
- (NSMutableDictionary)unigramTokensCount;
- (SGMINaiveBayesModel)init;
- (SGMINaiveBayesModel)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramTokensCount:(id)a6 bigramTokensCount:(id)a7;
- (SGMITokenCounts)bigramTokenCounts;
- (SGMITokenCounts)mailCount;
- (SGMITokenCounts)unigramTokenCounts;
- (void)ingestUnigramTokens:(id)a3 bigramTokens:(id)a4 asSalient:(BOOL)a5;
@end

@implementation SGMINaiveBayesModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bigramTokensCount, 0);
  objc_storeStrong((id *)&self->_unigramTokensCount, 0);
  objc_storeStrong((id *)&self->_bigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_unigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);
}

- (NSMutableDictionary)bigramTokensCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)unigramTokensCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
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

- (void)ingestUnigramTokens:(id)a3 bigramTokens:(id)a4 asSalient:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(SGMITokenCounts *)self->_mailCount newByAdding:&unk_1F2536348 asSalient:v5];
  mailCount = self->_mailCount;
  self->_mailCount = v10;

  unigramTokenCounts = self->_unigramTokenCounts;
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v14 = [(SGMITokenCounts *)unigramTokenCounts newByAdding:v13 asSalient:v5];
  v15 = self->_unigramTokenCounts;
  self->_unigramTokenCounts = v14;

  bigramTokenCounts = self->_bigramTokenCounts;
  v40 = v9;
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v18 = [(SGMITokenCounts *)bigramTokenCounts newByAdding:v17 asSalient:v5];
  v19 = self->_bigramTokenCounts;
  self->_bigramTokenCounts = v18;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v26 = [(NSMutableDictionary *)self->_unigramTokensCount objectForKeyedSubscript:v25];
        v27 = v26;
        if (v26) {
          v28 = (SGMITokenCounts *)[v26 newByAdding:&unk_1F2536348 asSalient:v5];
        }
        else {
          v28 = [[SGMITokenCounts alloc] initWithCount:&unk_1F2536348 asSalient:v5 token:v25];
        }
        v29 = v28;
        [(NSMutableDictionary *)self->_unigramTokensCount setObject:v28 forKeyedSubscript:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v22);
  }
  v41 = v20;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v30 = v40;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v42 + 1) + 8 * j);
        v36 = [(NSMutableDictionary *)self->_bigramTokensCount objectForKeyedSubscript:v35];
        v37 = v36;
        if (v36) {
          v38 = (SGMITokenCounts *)[v36 newByAdding:&unk_1F2536348 asSalient:v5];
        }
        else {
          v38 = [[SGMITokenCounts alloc] initWithCount:&unk_1F2536348 asSalient:v5 token:v35];
        }
        v39 = v38;
        [(NSMutableDictionary *)self->_bigramTokensCount setObject:v38 forKeyedSubscript:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v32);
  }
}

- (SGMINaiveBayesModel)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramTokensCount:(id)a6 bigramTokensCount:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SGMINaiveBayesModel;
  v18 = [(SGMINaiveBayesModel *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mailCount, a3);
    objc_storeStrong((id *)&v19->_unigramTokenCounts, a4);
    objc_storeStrong((id *)&v19->_bigramTokenCounts, a5);
    uint64_t v20 = [v16 mutableCopy];
    unigramTokensCount = v19->_unigramTokensCount;
    v19->_unigramTokensCount = (NSMutableDictionary *)v20;

    uint64_t v22 = [v17 mutableCopy];
    bigramTokensCount = v19->_bigramTokensCount;
    v19->_bigramTokensCount = (NSMutableDictionary *)v22;
  }
  return v19;
}

- (SGMINaiveBayesModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)SGMINaiveBayesModel;
  v2 = [(SGMINaiveBayesModel *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mailCount = v2->_mailCount;
    v2->_mailCount = (SGMITokenCounts *)v3;

    uint64_t v5 = objc_opt_new();
    unigramTokenCounts = v2->_unigramTokenCounts;
    v2->_unigramTokenCounts = (SGMITokenCounts *)v5;

    uint64_t v7 = objc_opt_new();
    bigramTokenCounts = v2->_bigramTokenCounts;
    v2->_bigramTokenCounts = (SGMITokenCounts *)v7;

    uint64_t v9 = objc_opt_new();
    unigramTokensCount = v2->_unigramTokensCount;
    v2->_unigramTokensCount = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    bigramTokensCount = v2->_bigramTokensCount;
    v2->_bigramTokensCount = (NSMutableDictionary *)v11;
  }
  return v2;
}

@end
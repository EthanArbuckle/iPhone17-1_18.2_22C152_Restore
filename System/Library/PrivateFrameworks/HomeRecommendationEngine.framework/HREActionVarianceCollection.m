@interface HREActionVarianceCollection
+ (id)varianceRuleCollectionWithRules:(id)a3;
- (BOOL)anyRulePassesForAction:(id)a3;
- (HREActionVarianceCollection)initWithRules:(id)a3;
- (NSMutableDictionary)rules;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setRules:(id)a3;
@end

@implementation HREActionVarianceCollection

- (HREActionVarianceCollection)initWithRules:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionVarianceCollection;
  v5 = [(HREActionVarianceCollection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    rules = v5->_rules;
    v5->_rules = (NSMutableDictionary *)v6;
  }
  return v5;
}

+ (id)varianceRuleCollectionWithRules:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_9);

  v7 = (void *)[v5 initWithRules:v6];

  return v7;
}

uint64_t __63__HREActionVarianceCollection_varianceRuleCollectionWithRules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

- (BOOL)anyRulePassesForAction:(id)a3
{
  id v4 = a3;
  id v5 = +[HREActionVariance varianceKeyForAction:v4];
  if (v5)
  {
    uint64_t v6 = [(HREActionVarianceCollection *)self rules];
    v7 = [v6 objectForKeyedSubscript:v5];

    if (v7) {
      char v8 = [v7 passesForAction:v4];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(HREActionVarianceCollection *)self rules];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HREActionVarianceCollection *)self rules];
  [v8 setObject:v7 forKey:v6];
}

- (NSMutableDictionary)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface ATXImmutableCandidateRelevanceModelFeaturizer
+ (BOOL)supportsSecureCoding;
- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithCoder:(id)a3;
- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithFeatureValueNames:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXImmutableCandidateRelevanceModelFeaturizer:(id)a3;
- (NSArray)featureValueNames;
- (id)featureVectorForContext:(id)a3 candidate:(id)a4;
- (unint64_t)dimensions;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureValueNames:(id)a3;
@end

@implementation ATXImmutableCandidateRelevanceModelFeaturizer

- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithFeatureValueNames:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXImmutableCandidateRelevanceModelFeaturizer;
  v6 = [(ATXImmutableCandidateRelevanceModelFeaturizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureValueNames, a3);
  }

  return v7;
}

- (unint64_t)dimensions
{
  return [(NSArray *)self->_featureValueNames count];
}

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXImmutableCandidateRelevanceModelFeaturizer *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXImmutableCandidateRelevanceModelFeaturizer *)self isEqualToATXImmutableCandidateRelevanceModelFeaturizer:v5];

  return v6;
}

- (BOOL)isEqualToATXImmutableCandidateRelevanceModelFeaturizer:(id)a3
{
  v4 = a3;
  unint64_t v5 = [(ATXImmutableCandidateRelevanceModelFeaturizer *)self dimensions];
  BOOL v6 = v5 == [v4 dimensions]
    && [(NSArray *)self->_featureValueNames isEqualToArray:v4[1]];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  BOOL v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = __atxlog_handle_relevance_model();
  v11 = [v5 robustDecodeObjectOfClasses:v9 forKey:@"featureValueNames" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXImmutableCandidateRelevanceModelFeaturizer" errorCode:-1 logHandle:v10];

  if (v11)
  {
    self = [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:v11];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)featureValueNames
{
  return self->_featureValueNames;
}

- (void)setFeatureValueNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
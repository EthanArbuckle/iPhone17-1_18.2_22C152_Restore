@interface ATXSearchResult
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestion)proactiveSuggestion;
- (ATXResponse)response;
- (ATXScoredPrediction)scoredBundleId;
- (ATXSearchResult)initWithCoder:(id)a3;
- (ATXSearchResult)initWithScoredBundleId:(id)a3 response:(id)a4 proactiveSuggestion:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSearchResult

- (ATXSearchResult)initWithScoredBundleId:(id)a3 response:(id)a4 proactiveSuggestion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXSearchResult;
  v12 = [(ATXSearchResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scoredBundleId, a3);
    objc_storeStrong((id *)&v13->_response, a4);
    objc_storeStrong((id *)&v13->_proactiveSuggestion, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSearchResult;
  v5 = [(ATXSearchResult *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scoredBundleId"];
    scoredBundleId = v5->_scoredBundleId;
    v5->_scoredBundleId = (ATXScoredPrediction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
    response = v5->_response;
    v5->_response = (ATXResponse *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proactiveSuggestion"];
    proactiveSuggestion = v5->_proactiveSuggestion;
    v5->_proactiveSuggestion = (ATXProactiveSuggestion *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  scoredBundleId = self->_scoredBundleId;
  id v5 = a3;
  [v5 encodeObject:scoredBundleId forKey:@"scoredBundleId"];
  [v5 encodeObject:self->_response forKey:@"response"];
  [v5 encodeObject:self->_proactiveSuggestion forKey:@"proactiveSuggestion"];
  v6.receiver = self;
  v6.super_class = (Class)ATXSearchResult;
  [(ATXSearchResult *)&v6 encodeWithCoder:v5];
}

- (ATXResponse)response
{
  return self->_response;
}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (ATXScoredPrediction)scoredBundleId
{
  return self->_scoredBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_scoredBundleId, 0);
}

@end
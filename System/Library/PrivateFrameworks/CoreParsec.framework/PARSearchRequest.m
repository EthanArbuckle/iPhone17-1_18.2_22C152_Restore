@interface PARSearchRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)completionCacheSuggestions;
- (NSArray)localContextualSuggestions;
- (NSDictionary)topics;
- (NSString)l2version;
- (NSString)l3version;
- (NSString)previouslyEngagedQuery;
- (NSString)queryString;
- (PARSearchRequest)initWithCoder:(id)a3;
- (SFSearchSuggestion)engagedSuggestion;
- (int64_t)exp;
- (int64_t)type;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionCacheSuggestions:(id)a3;
- (void)setEngagedSuggestion:(id)a3;
- (void)setExp:(int64_t)a3;
- (void)setL2version:(id)a3;
- (void)setL3version:(id)a3;
- (void)setLocalContextualSuggestions:(id)a3;
- (void)setPreviouslyEngagedQuery:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setTopics:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PARSearchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyEngagedQuery, 0);
  objc_storeStrong((id *)&self->_completionCacheSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestion, 0);
  objc_storeStrong((id *)&self->_localContextualSuggestions, 0);
  objc_storeStrong((id *)&self->_l3version, 0);
  objc_storeStrong((id *)&self->_l2version, 0);
  objc_storeStrong((id *)&self->_topics, 0);

  objc_storeStrong((id *)&self->_queryString, 0);
}

- (void)setPreviouslyEngagedQuery:(id)a3
{
}

- (NSString)previouslyEngagedQuery
{
  return self->_previouslyEngagedQuery;
}

- (void)setCompletionCacheSuggestions:(id)a3
{
}

- (NSArray)completionCacheSuggestions
{
  return self->_completionCacheSuggestions;
}

- (void)setEngagedSuggestion:(id)a3
{
}

- (SFSearchSuggestion)engagedSuggestion
{
  return self->_engagedSuggestion;
}

- (void)setExp:(int64_t)a3
{
  self->_exp = a3;
}

- (int64_t)exp
{
  return self->_exp;
}

- (void)setLocalContextualSuggestions:(id)a3
{
}

- (NSArray)localContextualSuggestions
{
  return self->_localContextualSuggestions;
}

- (void)setL3version:(id)a3
{
}

- (NSString)l3version
{
  return self->_l3version;
}

- (void)setL2version:(id)a3
{
}

- (NSString)l2version
{
  return self->_l2version;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setTopics:(id)a3
{
}

- (NSDictionary)topics
{
  return self->_topics;
}

- (void)setQueryString:(id)a3
{
}

- (NSString)queryString
{
  return self->_queryString;
}

- (unsigned)nwActivityLabel
{
  return 3;
}

- (PARSearchRequest)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PARSearchRequest;
  v5 = [(PARRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"topics"];
    topics = v5->_topics;
    v5->_topics = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engagedSuggestion"];
    engagedSuggestion = v5->_engagedSuggestion;
    v5->_engagedSuggestion = (SFSearchSuggestion *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v17 = [v15 setWithArray:v16];

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"localContextualSuggestions"];
    localContextualSuggestions = v5->_localContextualSuggestions;
    v5->_localContextualSuggestions = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l2version"];
    l2version = v5->_l2version;
    v5->_l2version = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l3version"];
    l3version = v5->_l3version;
    v5->_l3version = (NSString *)v22;

    v5->_type = [v4 decodeIntegerForKey:@"requestType"];
    v5->_exp = [v4 decodeIntegerForKey:@"exp"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARSearchRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryString, @"query", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_topics forKey:@"topics"];
  [v4 encodeObject:self->_engagedSuggestion forKey:@"engagedSuggestion"];
  [v4 encodeObject:self->_localContextualSuggestions forKey:@"localContextualSuggestions"];
  [v4 encodeObject:self->_l2version forKey:@"l2version"];
  [v4 encodeObject:self->_l3version forKey:@"l3version"];
  [v4 encodeInteger:self->_type forKey:@"requestType"];
  [v4 encodeInteger:self->_exp forKey:@"exp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
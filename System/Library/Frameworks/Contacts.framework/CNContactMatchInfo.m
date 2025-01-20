@interface CNContactMatchInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)matchedNameProperty;
- (CNContactMatchInfo)initWithCoder:(id)a3;
- (CNPromise)excerpt;
- (NSDictionary)matchedProperties;
- (NSNumber)relevanceScore;
- (NSSet)matchedTerms;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExcerpt:(id)a3;
- (void)setMatchedNameProperty:(BOOL)a3;
- (void)setMatchedProperties:(id)a3;
- (void)setMatchedTerms:(id)a3;
- (void)setRelevanceScore:(id)a3;
@end

@implementation CNContactMatchInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactMatchInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CNContactMatchInfo;
  v5 = [(CNContactMatchInfo *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relevanceScore"];
    uint64_t v7 = [v6 copy];
    relevanceScore = v5->_relevanceScore;
    v5->_relevanceScore = (NSNumber *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_matchedProperties"];
    uint64_t v14 = [v13 copy];
    matchedProperties = v5->_matchedProperties;
    v5->_matchedProperties = (NSDictionary *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_excerpt"];
    uint64_t v17 = [v16 copy];
    excerpt = v5->_excerpt;
    v5->_excerpt = (CNPromise *)v17;

    v5->_matchedNameProperty = [v4 decodeBoolForKey:@"_matchedNameProperty"];
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_matchedTerms"];
    uint64_t v23 = [v22 copy];
    matchedTerms = v5->_matchedTerms;
    v5->_matchedTerms = (NSSet *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  relevanceScore = self->_relevanceScore;
  id v5 = a3;
  [v5 encodeObject:relevanceScore forKey:@"_relevanceScore"];
  [v5 encodeObject:self->_matchedProperties forKey:@"_matchedProperties"];
  [v5 encodeObject:self->_excerpt forKey:@"_excerpt"];
  [v5 encodeObject:self->_matchedTerms forKey:@"_matchedTerms"];
  [v5 encodeBool:self->_matchedNameProperty forKey:@"_matchedNameProperty"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNContactMatchInfo);
  id v5 = [(CNContactMatchInfo *)self excerpt];
  v6 = (void *)[v5 copy];
  [(CNContactMatchInfo *)v4 setExcerpt:v6];

  uint64_t v7 = [(CNContactMatchInfo *)self relevanceScore];
  [(CNContactMatchInfo *)v4 setRelevanceScore:v7];

  v8 = [(CNContactMatchInfo *)self matchedProperties];
  v9 = (void *)[v8 copy];
  [(CNContactMatchInfo *)v4 setMatchedProperties:v9];

  uint64_t v10 = [(CNContactMatchInfo *)self matchedTerms];
  uint64_t v11 = (void *)[v10 copy];
  [(CNContactMatchInfo *)v4 setMatchedTerms:v11];

  [(CNContactMatchInfo *)v4 setMatchedNameProperty:[(CNContactMatchInfo *)self matchedNameProperty]];
  return v4;
}

- (NSNumber)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(id)a3
{
}

- (NSDictionary)matchedProperties
{
  return self->_matchedProperties;
}

- (void)setMatchedProperties:(id)a3
{
}

- (NSSet)matchedTerms
{
  return self->_matchedTerms;
}

- (void)setMatchedTerms:(id)a3
{
}

- (CNPromise)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
}

- (BOOL)matchedNameProperty
{
  return self->_matchedNameProperty;
}

- (void)setMatchedNameProperty:(BOOL)a3
{
  self->_matchedNameProperty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_matchedTerms, 0);
  objc_storeStrong((id *)&self->_matchedProperties, 0);

  objc_storeStrong((id *)&self->_relevanceScore, 0);
}

@end
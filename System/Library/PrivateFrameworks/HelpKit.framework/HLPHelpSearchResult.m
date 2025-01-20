@interface HLPHelpSearchResult
- (NSString)identifier;
- (double)relevanceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)matchCount;
- (int64_t)weight;
- (void)setIdentifier:(id)a3;
- (void)setMatchCount:(int64_t)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation HLPHelpSearchResult

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(HLPHelpSearchResult *)self identifier];
  [v4 setIdentifier:v5];

  objc_msgSend(v4, "setWeight:", -[HLPHelpSearchResult weight](self, "weight"));
  objc_msgSend(v4, "setMatchCount:", -[HLPHelpSearchResult matchCount](self, "matchCount"));
  [(HLPHelpSearchResult *)self relevanceScore];
  objc_msgSend(v4, "setRelevanceScore:");
  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(HLPHelpSearchResult *)self identifier];
  int64_t v5 = [(HLPHelpSearchResult *)self weight];
  int64_t v6 = [(HLPHelpSearchResult *)self matchCount];
  [(HLPHelpSearchResult *)self relevanceScore];
  v8 = [v3 stringWithFormat:@"identifier: %@, weight: %ld matchCount: %ld relevanceScore %f", v4, v5, v6, v7];

  return v8;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (int64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(int64_t)a3
{
  self->_matchCount = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
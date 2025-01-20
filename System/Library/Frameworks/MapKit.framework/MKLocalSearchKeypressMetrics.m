@interface MKLocalSearchKeypressMetrics
- (MKLocalSearchKeypressMetrics)initWithQuery:(id)a3 queryTokens:(id)a4 suggestionEntries:(id)a5;
- (NSArray)queryTokens;
- (NSArray)suggestionEntries;
- (NSString)query;
- (void)submitWithStatus:(unint64_t)a3;
@end

@implementation MKLocalSearchKeypressMetrics

- (MKLocalSearchKeypressMetrics)initWithQuery:(id)a3 queryTokens:(id)a4 suggestionEntries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKLocalSearchKeypressMetrics;
  v11 = [(MKLocalSearchKeypressMetrics *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    query = v11->_query;
    v11->_query = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    queryTokens = v11->_queryTokens;
    v11->_queryTokens = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_suggestionEntries, a5);
  }

  return v11;
}

- (void)submitWithStatus:(unint64_t)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (NSArray)queryTokens
{
  return self->_queryTokens;
}

- (NSArray)suggestionEntries
{
  return self->_suggestionEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntries, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end
@interface _CNAutocompleteCoreDuetPredictionSearchStrategy
- (NSString)descriptionForLogging;
- (_CNAutocompleteCoreDuetPredictionSearchStrategy)initWithContactStore:(id)a3;
- (id)searchResultsForFetchRequest:(id)a3;
@end

@implementation _CNAutocompleteCoreDuetPredictionSearchStrategy

- (_CNAutocompleteCoreDuetPredictionSearchStrategy)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteCoreDuetPredictionSearchStrategy;
  v6 = [(_CNAutocompleteCoreDuetPredictionSearchStrategy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)descriptionForLogging
{
  return (NSString *)@"CoreDuet";
}

- (id)searchResultsForFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNAutocompleteCoreDuetPredictionSearchStrategyTask alloc] initWithRequest:v4 contactStore:self->_contactStore];

  v6 = [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)v5 run:0];

  return v6;
}

- (void).cxx_destruct
{
}

@end
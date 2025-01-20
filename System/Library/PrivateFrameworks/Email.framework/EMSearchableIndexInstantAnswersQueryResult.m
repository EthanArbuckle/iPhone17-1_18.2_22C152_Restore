@interface EMSearchableIndexInstantAnswersQueryResult
- (EMSearchableIndexInstantAnswersQueryResult)initWithInstantAnswersSuggestions:(id)a3;
- (NSArray)instantAnswersSuggestions;
@end

@implementation EMSearchableIndexInstantAnswersQueryResult

- (EMSearchableIndexInstantAnswersQueryResult)initWithInstantAnswersSuggestions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndexInstantAnswersQueryResult;
  v5 = [(EMSearchableIndexInstantAnswersQueryResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    instantAnswersSuggestions = v5->_instantAnswersSuggestions;
    v5->_instantAnswersSuggestions = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)instantAnswersSuggestions
{
  return self->_instantAnswersSuggestions;
}

- (void).cxx_destruct
{
}

@end
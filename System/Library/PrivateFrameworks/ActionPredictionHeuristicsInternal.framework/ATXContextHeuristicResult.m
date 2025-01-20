@interface ATXContextHeuristicResult
- (ATXContextHeuristicResult)init;
- (ATXContextHeuristicResult)initWithSuggestions:(id)a3 additionalRefreshTriggers:(id)a4;
- (NSArray)suggestions;
- (NSSet)additionalRefreshTriggers;
@end

@implementation ATXContextHeuristicResult

- (ATXContextHeuristicResult)init
{
  v3 = [MEMORY[0x1E4F1C978] array];
  v4 = [MEMORY[0x1E4F1CAD0] set];
  v5 = [(ATXContextHeuristicResult *)self initWithSuggestions:v3 additionalRefreshTriggers:v4];

  return v5;
}

- (ATXContextHeuristicResult)initWithSuggestions:(id)a3 additionalRefreshTriggers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXContextHeuristicResult;
  v8 = [(ATXContextHeuristicResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    additionalRefreshTriggers = v8->_additionalRefreshTriggers;
    v8->_additionalRefreshTriggers = (NSSet *)v11;
  }
  return v8;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSSet)additionalRefreshTriggers
{
  return self->_additionalRefreshTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRefreshTriggers, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
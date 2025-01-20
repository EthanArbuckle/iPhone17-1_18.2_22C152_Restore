@interface MapsSuggestionsHasBudgetCondition
- (BOOL)isTrue;
- (MapsSuggestionsHasBudgetCondition)initWithBudget:(id)a3;
@end

@implementation MapsSuggestionsHasBudgetCondition

- (MapsSuggestionsHasBudgetCondition)initWithBudget:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsHasBudgetCondition;
  v6 = [(MapsSuggestionsBaseCondition *)&v9 initWithName:@"MapsSuggestionsHasBudgetCondition"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_budget, a3);
  }

  return v7;
}

- (BOOL)isTrue
{
  return [(MapsSuggestionsBudget *)self->_budget hasBudgetLeft];
}

- (void).cxx_destruct
{
}

@end
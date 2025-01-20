@interface MapsSuggestionsAirportArrivalBudget
- (MapsSuggestionsAirportArrivalBudget)init;
- (id)readBudgetState;
- (void)writeBudgetState:(id)a3;
@end

@implementation MapsSuggestionsAirportArrivalBudget

- (MapsSuggestionsAirportArrivalBudget)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsAirportArrivalBudget;
  v2 = [(MapsSuggestionsBudget *)&v5 initWithDelegate:self name:@"MapsSuggestionsAirportArrivalBudget"];
  if (v2)
  {
    uint64_t Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    -[MapsSuggestionsBudget addRollingWindowOfCount:perTimeInterval:name:](v2, "addRollingWindowOfCount:perTimeInterval:name:", Integer, @"window");
  }
  return v2;
}

- (id)readBudgetState
{
  return (id)MEMORY[0x1F411C088](GEOConfigMapsSuggestionsAirportArrivalAnnouncerBudgetState, off_1E96EDE48);
}

- (void)writeBudgetState:(id)a3
{
}

@end
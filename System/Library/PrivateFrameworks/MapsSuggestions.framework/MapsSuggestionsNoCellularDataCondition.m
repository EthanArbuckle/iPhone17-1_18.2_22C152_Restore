@interface MapsSuggestionsNoCellularDataCondition
- (BOOL)isTrue;
- (MapsSuggestionsNoCellularDataCondition)init;
@end

@implementation MapsSuggestionsNoCellularDataCondition

- (MapsSuggestionsNoCellularDataCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsNoCellularDataCondition;
  return [(MapsSuggestionsBaseCondition *)&v3 initWithName:@"MapsSuggestionsNoCellularDataCondition"];
}

- (BOOL)isTrue
{
  v2 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  char v3 = [v2 isCellConnection] ^ 1;

  return v3;
}

@end
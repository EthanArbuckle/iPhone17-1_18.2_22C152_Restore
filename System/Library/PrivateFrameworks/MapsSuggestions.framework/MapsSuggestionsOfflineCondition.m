@interface MapsSuggestionsOfflineCondition
- (BOOL)isTrue;
- (MapsSuggestionsOfflineCondition)init;
@end

@implementation MapsSuggestionsOfflineCondition

- (MapsSuggestionsOfflineCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsOfflineCondition;
  return [(MapsSuggestionsBaseCondition *)&v3 initWithName:@"MapsSuggestionsOfflineCondition"];
}

- (BOOL)isTrue
{
  v2 = [MEMORY[0x1E4F647B8] shared];
  char v3 = [v2 isUsingOffline];

  return v3;
}

@end
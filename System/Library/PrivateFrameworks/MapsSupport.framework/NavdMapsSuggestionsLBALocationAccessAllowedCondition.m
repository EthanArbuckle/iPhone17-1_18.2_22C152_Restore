@interface NavdMapsSuggestionsLBALocationAccessAllowedCondition
- (BOOL)isTrue;
- (NavdMapsSuggestionsLBALocationAccessAllowedCondition)init;
@end

@implementation NavdMapsSuggestionsLBALocationAccessAllowedCondition

- (NavdMapsSuggestionsLBALocationAccessAllowedCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)NavdMapsSuggestionsLBALocationAccessAllowedCondition;
  return [(NavdMapsSuggestionsLBALocationAccessAllowedCondition *)&v3 initWithName:@"NavdMapsSuggestionsLBALocationAccessAllowedCondition"];
}

- (BOOL)isTrue
{
  v2 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  unsigned __int8 v3 = [v2 hasLocationAccess];

  return v3;
}

@end
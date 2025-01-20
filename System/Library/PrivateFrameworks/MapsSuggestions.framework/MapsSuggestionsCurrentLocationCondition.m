@interface MapsSuggestionsCurrentLocationCondition
- (BOOL)isTrue;
- (MapsSuggestionsCurrentLocationCondition)init;
@end

@implementation MapsSuggestionsCurrentLocationCondition

- (MapsSuggestionsCurrentLocationCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsCurrentLocationCondition;
  return [(MapsSuggestionsBaseCondition *)&v3 initWithName:@"MapsSuggestionsCurrentLocationCondition"];
}

- (BOOL)isTrue
{
  v2 = MapsSuggestionsCurrentBestLocation();
  BOOL v3 = v2 != 0;

  return v3;
}

@end
@interface MapsSuggestionsContactActivityImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
- (_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover)init;
@end

@implementation MapsSuggestionsContactActivityImprover

- (BOOL)improveEntry:(id)a3
{
  v4 = (MapsSuggestionsEntry *)a3;
  v5 = self;
  LOBYTE(self) = MapsSuggestionsContactActivityImprover.improve(_:)(v4);

  return self & 1;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsContactActivityImprover();
  return [(MapsSuggestionsContactActivityImprover *)&v3 init];
}

@end
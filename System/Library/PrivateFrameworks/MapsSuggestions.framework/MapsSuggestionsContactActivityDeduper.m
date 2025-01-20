@interface MapsSuggestionsContactActivityDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
- (_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper)init;
@end

@implementation MapsSuggestionsContactActivityDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = _s15MapsSuggestions0aB22ContactActivityDeduperC6dedupe16byEnrichingEntry4withSbSo0abI0C_AHtF_0(v6, v7);

  return v9 & 1;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsContactActivityDeduper();
  return [(MapsSuggestionsContactActivityDeduper *)&v3 init];
}

@end
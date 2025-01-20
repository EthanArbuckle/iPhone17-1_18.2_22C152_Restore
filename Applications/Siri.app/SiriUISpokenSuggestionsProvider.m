@interface SiriUISpokenSuggestionsProvider
+ (void)fetchTopSpokenSuggestionFrom:(id)a3 completion:(id)a4;
- (_TtC4Siri31SiriUISpokenSuggestionsProvider)init;
@end

@implementation SiriUISpokenSuggestionsProvider

+ (void)fetchTopSpokenSuggestionFrom:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = a3;
  sub_10009BA30(v6, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (_TtC4Siri31SiriUISpokenSuggestionsProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriUISpokenSuggestionsProvider();
  return [(SiriUISpokenSuggestionsProvider *)&v3 init];
}

@end
@interface DOCGoToSuggestionsViewController.SuggestionCell
- (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell)initWithCoder:(id)a3;
- (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004CCB30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CCAF0();
  v8 = self;
  sub_1000C3ACC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell *)sub_1000C3F38(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC14RecentsAvocado32DOCGoToSuggestionsViewControllerP33_7DC32410FCC7E2C44CD79C3659C3C01714SuggestionCell *)sub_1000C3FC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end
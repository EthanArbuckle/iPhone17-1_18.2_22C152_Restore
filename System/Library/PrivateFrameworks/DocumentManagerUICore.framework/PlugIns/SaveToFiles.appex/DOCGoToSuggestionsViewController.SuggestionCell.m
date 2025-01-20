@interface DOCGoToSuggestionsViewController.SuggestionCell
- (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell)initWithCoder:(id)a3;
- (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004D0230();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004D01F0();
  v8 = self;
  sub_1000B02E8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell *)sub_1000B0754(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC11SaveToFiles32DOCGoToSuggestionsViewControllerP33_32266292FA5847E2461A0795D9E35D8714SuggestionCell *)sub_1000B07E4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end
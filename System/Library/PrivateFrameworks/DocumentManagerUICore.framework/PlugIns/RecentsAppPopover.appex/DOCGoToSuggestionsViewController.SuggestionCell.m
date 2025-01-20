@interface DOCGoToSuggestionsViewController.SuggestionCell
- (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell)initWithCoder:(id)a3;
- (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004BDB00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BDAC0();
  v8 = self;
  sub_100270844((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell *)sub_100270CB0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC17RecentsAppPopover32DOCGoToSuggestionsViewControllerP33_9F35ECC802DE21947247D0C4143E541B14SuggestionCell *)sub_100270D40(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end
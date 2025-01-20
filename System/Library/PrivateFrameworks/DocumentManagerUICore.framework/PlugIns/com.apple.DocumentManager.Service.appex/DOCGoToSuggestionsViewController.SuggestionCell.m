@interface DOCGoToSuggestionsViewController.SuggestionCell
- (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell)initWithCoder:(id)a3;
- (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004CC2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CC2A0();
  v8 = self;
  sub_1000F336C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell *)sub_1000F37D8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC33com_apple_DocumentManager_Service32DOCGoToSuggestionsViewControllerP33_16BA7D74683FD3942AE7E13AFB21BBDC14SuggestionCell *)sub_1000F3868(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end
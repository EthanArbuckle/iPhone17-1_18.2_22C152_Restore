@interface OnboardingFriendsSuggestionsViewController.FriendRecommendationsDataUpdateDelegate
- (_TtCC12GameCenterUI42OnboardingFriendsSuggestionsViewControllerP33_48F72ACA40F78B09E808C26EC55289D339FriendRecommendationsDataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation OnboardingFriendsSuggestionsViewController.FriendRecommendationsDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = sub_1AF7ADFE0();
  v7 = self;
  sub_1AF3B8CD0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1AF3B8D94();
}

- (void).cxx_destruct
{
}

- (_TtCC12GameCenterUI42OnboardingFriendsSuggestionsViewControllerP33_48F72ACA40F78B09E808C26EC55289D339FriendRecommendationsDataUpdateDelegate)init
{
}

@end
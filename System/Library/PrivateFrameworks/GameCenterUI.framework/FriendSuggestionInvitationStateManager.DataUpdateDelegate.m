@interface FriendSuggestionInvitationStateManager.DataUpdateDelegate
- (_TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)refreshFromFriendRecommendationsNotification:(id)a3;
- (void)refreshFromMessageBasedFriendRequestSent:(id)a3;
@end

@implementation FriendSuggestionInvitationStateManager.DataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  sub_1AF7ADFE0();
  v6 = self;
  sub_1AF564220(v4);

  swift_bridgeObjectRelease();
}

- (void)refreshFromFriendRecommendationsNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF564350(v4, 4);
}

- (void)refreshFromMessageBasedFriendRequestSent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF564350(v4, 21);
}

- (void)dealloc
{
  v2 = self;
  sub_1AF3B8D94();
}

- (void).cxx_destruct
{
}

- (_TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate)init
{
}

@end
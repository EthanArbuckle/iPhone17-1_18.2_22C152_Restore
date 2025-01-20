@interface GameCenterObjcHelper
+ (void)fetchRecommendedFriendsWithCompletionHandler:(id)a3;
+ (void)fetchSuggestedFriendsWithCompletionHandler:(id)a3;
+ (void)sendFriendInvitationViaPushWithContactID:(id)a3 contactAssociationID:(id)a4 completionHandler:(id)a5;
- (_TtC12GameCenterUI20GameCenterObjcHelper)init;
@end

@implementation GameCenterObjcHelper

+ (void)fetchRecommendedFriendsWithCompletionHandler:(id)a3
{
}

+ (void)fetchSuggestedFriendsWithCompletionHandler:(id)a3
{
}

+ (void)sendFriendInvitationViaPushWithContactID:(id)a3 contactAssociationID:(id)a4 completionHandler:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = sub_1AF7AE0E0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1AF7AE0E0();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v5;
  static GameCenterObjcHelper.sendFriendInvitationViaPush(contactID:contactAssociationID:completionHandler:)(v6, v8, v9, v11, (uint64_t)sub_1AF758708, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC12GameCenterUI20GameCenterObjcHelper)init
{
  return (_TtC12GameCenterUI20GameCenterObjcHelper *)GameCenterObjcHelper.init()();
}

@end
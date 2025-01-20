@interface GKFriendingViewControllers
+ (id)inviteFriendsWithContainerViewController:(id)a3;
- (GKFriendingViewControllers)init;
@end

@implementation GKFriendingViewControllers

+ (id)inviteFriendsWithContainerViewController:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static FriendingViewControllers.inviteFriends(containedIn:)(v4);

  return v5;
}

- (GKFriendingViewControllers)init
{
  return (GKFriendingViewControllers *)FriendingViewControllers.init()();
}

@end
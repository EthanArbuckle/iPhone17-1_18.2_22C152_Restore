@interface GameCenterFriendRequestCoordinator
- (_TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator)init;
- (void)accountsDidChangeWithNotification:(id)a3;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation GameCenterFriendRequestCoordinator

- (_TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator)init
{
  result = (_TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for GameCenterFriendRequestCoordinator();
  [(GameCenterFriendRequestCoordinator *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)accountsDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E18AE958(v4);
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v5 = self;
  sub_1E18AF6C4(a3);
}

@end
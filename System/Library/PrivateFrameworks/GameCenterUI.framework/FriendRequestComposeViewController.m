@interface FriendRequestComposeViewController
- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithRootViewController:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FriendRequestComposeViewController

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF684F3C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF684FD0(a3);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1AF685110(v6, a4);
}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  sub_1AF68597C();
}

- (_TtC12GameCenterUI34FriendRequestComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  sub_1AF6859C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
@interface NavigationController
- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithCoder:(id)a3;
- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithRootViewController:(id)a3;
@end

@implementation NavigationController

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithCoder:(id)a3
{
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  sub_22ED3F6C4();
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22EE7F9E0();
  }
  id v5 = a4;
  sub_22ED3F708();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC17_StoreKit_SwiftUI20NavigationController_url;
  uint64_t v3 = sub_22EE7C2B0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end
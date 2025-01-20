@interface ActivityBannerSceneDelegate
- (_TtC10ChronoCore27ActivityBannerSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation ActivityBannerSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1DA9F5880(v8);
}

- (_TtC10ChronoCore27ActivityBannerSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityBannerSceneDelegate();
  return [(SingleActivitySceneDelegate *)&v3 init];
}

@end
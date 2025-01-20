@interface HeartAppDelegate
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (Class)makeDataListDataProviderClassForDisplayType:(id)a3;
- (_TtC5Heart16HeartAppDelegate)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation HeartAppDelegate

- (_TtC5Heart16HeartAppDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Heart16HeartAppDelegate____lazy_storage___articleIdentifiersByUrl) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(HeartAppDelegate *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (Class)makeDataListDataProviderClassForDisplayType:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_240B07724(v4);

  return 0;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = sub_240BB6DE0();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = sub_240BB6D30();
LABEL_4:
  id v11 = a3;
  v12 = self;
  char v13 = sub_240B6DEB8(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end
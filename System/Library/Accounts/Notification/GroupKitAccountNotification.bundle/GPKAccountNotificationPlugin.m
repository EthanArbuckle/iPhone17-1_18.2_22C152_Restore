@interface GPKAccountNotificationPlugin
- (_TtC27GroupKitAccountNotification28GPKAccountNotificationPlugin)init;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation GPKAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a6;
  v10 = self;
  GPKAccountNotificationPlugin.account(_:didChangeWith:in:oldAccount:)();
}

- (_TtC27GroupKitAccountNotification28GPKAccountNotificationPlugin)init
{
  return (_TtC27GroupKitAccountNotification28GPKAccountNotificationPlugin *)GPKAccountNotificationPlugin.init()();
}

@end
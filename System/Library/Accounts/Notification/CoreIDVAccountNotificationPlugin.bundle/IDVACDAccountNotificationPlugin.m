@interface IDVACDAccountNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (_TtC32CoreIDVAccountNotificationPlugin31IDVACDAccountNotificationPlugin)init;
@end

@implementation IDVACDAccountNotificationPlugin

- (_TtC32CoreIDVAccountNotificationPlugin31IDVACDAccountNotificationPlugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDVACDAccountNotificationPlugin();
  return [(IDVACDAccountNotificationPlugin *)&v3 init];
}

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  LOBYTE(a6) = sub_240580828(a3, a4, a6);

  return a6 & 1;
}

@end
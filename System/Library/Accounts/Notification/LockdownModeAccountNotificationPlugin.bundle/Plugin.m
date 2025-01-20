@interface Plugin
- (_TtC37LockdownModeAccountNotificationPlugin6Plugin)init;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation Plugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_24277321C(a3, a4, a6);
}

- (_TtC37LockdownModeAccountNotificationPlugin6Plugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Plugin();
  return [(Plugin *)&v3 init];
}

@end
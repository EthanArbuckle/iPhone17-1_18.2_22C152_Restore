@interface PDSNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (_TtC28ASDAccountNotificationPlugin21PDSNotificationPlugin)init;
@end

@implementation PDSNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  return sub_23F0(a4) & 1;
}

- (_TtC28ASDAccountNotificationPlugin21PDSNotificationPlugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PDSNotificationPlugin();
  return [(PDSNotificationPlugin *)&v3 init];
}

@end
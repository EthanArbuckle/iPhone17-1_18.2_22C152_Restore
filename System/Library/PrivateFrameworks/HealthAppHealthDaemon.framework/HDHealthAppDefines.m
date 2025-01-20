@interface HDHealthAppDefines
+ (NSString)sharingReminderNotificationIdentifier;
- (_TtC21HealthAppHealthDaemon18HDHealthAppDefines)init;
@end

@implementation HDHealthAppDefines

+ (NSString)sharingReminderNotificationIdentifier
{
  v2 = (void *)sub_250D5DFF0();
  return (NSString *)v2;
}

- (_TtC21HealthAppHealthDaemon18HDHealthAppDefines)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HDHealthAppDefines();
  return [(HDHealthAppDefines *)&v3 init];
}

@end
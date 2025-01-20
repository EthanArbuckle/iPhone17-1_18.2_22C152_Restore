@interface NSNotification
+ (id)PHAlertInvoked;
@end

@implementation NSNotification

+ (id)PHAlertInvoked
{
  static NSNotification.PHAlertInvoked.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

@end
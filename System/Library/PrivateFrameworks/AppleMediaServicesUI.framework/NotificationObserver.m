@interface NotificationObserver
+ (void)handleNFCNotification:(id)a3;
- (_TtC14amsengagementd20NotificationObserver)init;
- (void)handleNFCNotification:(id)a3;
- (void)timezoneChanged;
@end

@implementation NotificationObserver

- (_TtC14amsengagementd20NotificationObserver)init
{
  return (_TtC14amsengagementd20NotificationObserver *)sub_10014E604();
}

- (void)timezoneChanged
{
  v2 = self;
  sub_10014FD18();
}

- (void)handleNFCNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001507C4(v4);
}

+ (void)handleNFCNotification:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_100150BB4(v4);
}

- (void).cxx_destruct
{
}

@end
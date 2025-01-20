@interface CLBNotificationsManager
+ (CLBNotificationsManager)shared;
- (CLBNotificationsManager)init;
- (CLBNotificationsManagerDelegate)bulletinDelegate;
- (void)addBulletinNotificationItem:(id)a3 dndBehavior:(unint64_t)a4 window:(id)a5;
- (void)removeBulletinNotificationItem:(id)a3;
- (void)setBulletinDelegate:(id)a3;
@end

@implementation CLBNotificationsManager

+ (CLBNotificationsManager)shared
{
  if (qword_10017B570 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100186480;

  return (CLBNotificationsManager *)v2;
}

- (CLBNotificationsManagerDelegate)bulletinDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CLBNotificationsManagerDelegate *)Strong;
}

- (void)setBulletinDelegate:(id)a3
{
}

- (CLBNotificationsManager)init
{
  return (CLBNotificationsManager *)sub_10002E5E8();
}

- (void)addBulletinNotificationItem:(id)a3 dndBehavior:(unint64_t)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  sub_10002E768(v8, a4, v9);
}

- (void)removeBulletinNotificationItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002EFB0(v4);
}

- (void).cxx_destruct
{
  sub_1000327D8((uint64_t)self + OBJC_IVAR___CLBNotificationsManager_bulletinDelegate);
  v3 = (char *)self + OBJC_IVAR___CLBNotificationsManager__notifications;
  uint64_t v4 = sub_100029F90(&qword_10017BDB8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end
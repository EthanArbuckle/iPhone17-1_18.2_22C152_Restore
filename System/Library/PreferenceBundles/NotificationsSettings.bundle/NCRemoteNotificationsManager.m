@interface NCRemoteNotificationsManager
+ (BOOL)featureIsAvailable;
+ (NCRemoteNotificationsManager)sharedInstance;
+ (void)addObserver:(id)a3;
+ (void)removeObserver:(id)a3;
- (BOOL)featureIsAvailable;
- (NCRemoteNotificationsManager)init;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NCRemoteNotificationsManager

+ (void)addObserver:(id)a3
{
}

+ (void)removeObserver:(id)a3
{
}

+ (BOOL)featureIsAvailable
{
  return _s21NotificationsSettings06RemoteA7ManagerC18featureIsAvailableSbvgZ_0() & 1;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)featureIsAvailable
{
  v3 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable);
  swift_beginAccess();
  v4 = *v3;
  v5 = *v3 + 4;
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 5);
  sub_24C54(v5, &v8);
  os_unfair_lock_unlock(v4 + 5);
  LOBYTE(v5) = v8;

  swift_release();
  return (char)v5;
}

+ (NCRemoteNotificationsManager)sharedInstance
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (NCRemoteNotificationsManager *)(id)qword_50480;
}

- (NCRemoteNotificationsManager)init
{
  return (NCRemoteNotificationsManager *)sub_253F4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NCRemoteNotificationsManager_queue);
}

@end
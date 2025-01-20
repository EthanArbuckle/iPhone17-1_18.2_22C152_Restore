@interface NotificationAgent
- (_TtC8SOSBuddy17NotificationAgent)init;
- (void)dealloc;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NotificationAgent

- (_TtC8SOSBuddy17NotificationAgent)init
{
  return (_TtC8SOSBuddy17NotificationAgent *)sub_1000884A0();
}

- (void)dealloc
{
  v2 = self;
  sub_100088798();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent);
  uint64_t v4 = *(void *)&self->didFinishPostNotificationRequest[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent];
  uint64_t v5 = *(void *)&self->didReceiveAction[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent];
  uint64_t v6 = *(void *)&self->_currentNotifications[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent];

  sub_10002D394(v3, v4, v5, v6);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10008B5B4(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10008B7C4(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

@end
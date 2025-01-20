@interface NotificationsManager
- (_TtC13lockdownmoded20NotificationsManager)init;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5;
@end

@implementation NotificationsManager

- (_TtC13lockdownmoded20NotificationsManager)init
{
  return (_TtC13lockdownmoded20NotificationsManager *)sub_1000071B0();
}

- (void).cxx_destruct
{
  sub_10000B14C((uint64_t)self + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_delegate, &qword_1000423F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_queue);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  sub_100005E0C(&qword_1000423A0);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000423B0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000423C0;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_10000A600((uint64_t)v10, (uint64_t)&unk_1000423D0, (uint64_t)v15);
  swift_release();
}

@end
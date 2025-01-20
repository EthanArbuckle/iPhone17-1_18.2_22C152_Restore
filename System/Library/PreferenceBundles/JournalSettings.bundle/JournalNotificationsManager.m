@interface JournalNotificationsManager
- (_TtC15JournalSettings27JournalNotificationsManager)init;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 willPresentNotification:(UNNotification *)a4 withCompletionHandler:(id)a5;
@end

@implementation JournalNotificationsManager

- (_TtC15JournalSettings27JournalNotificationsManager)init
{
  return (_TtC15JournalSettings27JournalNotificationsManager *)sub_21C94();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  uint64_t v9 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_19C218;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_19C220;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_25AA0((uint64_t)v11, (uint64_t)&unk_19C228, (uint64_t)v16);
  swift_release();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 willPresentNotification:(UNNotification *)a4 withCompletionHandler:(id)a5
{
  uint64_t v9 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_19C1D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_19BFC8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_25AA0((uint64_t)v11, (uint64_t)&unk_19BFD0, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings27JournalNotificationsManager_promptManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings27JournalNotificationsManager_notificationCenter));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15JournalSettings27JournalNotificationsManager_actionHandler);

  sub_278A8(v3);
}

@end
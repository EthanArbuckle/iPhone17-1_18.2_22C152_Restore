@interface ProfilesAppDelegate
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (_TtC8Profiles19ProfilesAppDelegate)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ProfilesAppDelegate

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_241766DF8((uint64_t (*)(void))sub_241768224, v9);

  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_2417673F0(v11, (uint64_t (*)(uint64_t))sub_241766DE8, v9);

  swift_release();
}

- (_TtC8Profiles19ProfilesAppDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_summarySharingEntryStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthSharingNotificationSyncStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_cancellables) = (Class)MEMORY[0x263F8EE88];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfilesAppDelegate();
  return [(ProfilesAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthSharingNotificationSyncStore));

  swift_bridgeObjectRelease();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  sub_2417D48A0();
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = sub_2417D47E0();
LABEL_4:
  id v8 = a3;
  uint64_t v9 = self;
  char v10 = sub_2417B2D18((uint64_t)a3, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

@end
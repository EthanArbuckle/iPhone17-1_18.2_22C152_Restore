@interface PendingReminderTracker
- (_TtC21CalendarUIKitInternal22PendingReminderTracker)init;
- (_TtC21CalendarUIKitInternal22PendingReminderTracker)initWithEventStore:(id)a3;
- (id)optimisticReminderFor:(id)a3;
- (void)addPendingWithEvent:(id)a3 sequenceNumber:(int)a4;
- (void)eventStoreDidChange:(id)a3;
- (void)revertPendingWithEvent:(id)a3 sendNotification:(BOOL)a4;
- (void)setOptimisticReminderWithEvent:(id)a3 sequenceNumber:(int)a4 optimisticReminder:(id)a5;
@end

@implementation PendingReminderTracker

- (_TtC21CalendarUIKitInternal22PendingReminderTracker)initWithEventStore:(id)a3
{
  return (_TtC21CalendarUIKitInternal22PendingReminderTracker *)PendingReminderTracker.init(eventStore:)(a3);
}

- (void)addPendingWithEvent:(id)a3 sequenceNumber:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_2496F4370(v6, a4, 1, (uint64_t)v7);
  id v8 = objc_msgSend(v6, sel_objectID);
  if (v8)
  {
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2496FA8E0;
    *(void *)(v10 + 32) = v9;
    uint64_t v12 = v10;
    sub_2496F99B0();
    id v11 = v9;
    sub_2496F5BF8(v12);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)setOptimisticReminderWithEvent:(id)a3 sequenceNumber:(int)a4 optimisticReminder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_2496F81F8(v8, a4, 1, (uint64_t)v10, v8, v9);
}

- (id)optimisticReminderFor:(id)a3
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = a3;
  v5 = self;
  sub_2496F4E3C(v4, 0, 0, (uint64_t)v5, (uint64_t)&v9);
  long long v6 = v9;
  v7 = (void *)*((void *)&v10 + 1);

  if ((void)v6)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)revertPendingWithEvent:(id)a3 sendNotification:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_2496F3D94(v6, a4);
}

- (void)eventStoreDidChange:(id)a3
{
  uint64_t v4 = sub_2496F93B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496F9390();
  id v8 = self;
  sub_2496F5E50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC21CalendarUIKitInternal22PendingReminderTracker)init
{
  result = (_TtC21CalendarUIKitInternal22PendingReminderTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore));
  swift_bridgeObjectRelease();
}

@end
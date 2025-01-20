@interface ThreadsafeHKCalendarCache
- (_TtC16HealthExperience25ThreadsafeHKCalendarCache)init;
- (id)calendarForTimeZone:(id)a3;
- (id)currentCalendar;
@end

@implementation ThreadsafeHKCalendarCache

- (id)calendarForTimeZone:(id)a3
{
  uint64_t v4 = sub_1C28CC5C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C28CC580();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C28CC5A0();
  v12 = self;
  sub_1C28CC9C0();
  v13 = (void *)sub_1C28CC590();
  v14 = (objc_class *)type metadata accessor for ThreadsafeHKCalendarCache();
  v18.receiver = v12;
  v18.super_class = v14;
  id v15 = [(HKCalendarCache *)&v18 calendarForTimeZone:v13];

  sub_1C28CC500();
  sub_1C28CC9D0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = (void *)sub_1C28CC4F0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v16;
}

- (id)currentCalendar
{
  uint64_t v3 = sub_1C28CC580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1C28CC9C0();
  uint64_t v8 = (objc_class *)type metadata accessor for ThreadsafeHKCalendarCache();
  v12.receiver = v7;
  v12.super_class = v8;
  id v9 = [(HKCalendarCache *)&v12 currentCalendar];
  sub_1C28CC500();

  sub_1C28CC9D0();
  uint64_t v10 = (void *)sub_1C28CC4F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v10;
}

- (_TtC16HealthExperience25ThreadsafeHKCalendarCache)init
{
  uint64_t v3 = OBJC_IVAR____TtC16HealthExperience25ThreadsafeHKCalendarCache_lock;
  sub_1C28CC9F0();
  swift_allocObject();
  uint64_t v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1C28CC9E0();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ThreadsafeHKCalendarCache();
  return [(HKCalendarCache *)&v6 init];
}

- (void).cxx_destruct
{
}

@end
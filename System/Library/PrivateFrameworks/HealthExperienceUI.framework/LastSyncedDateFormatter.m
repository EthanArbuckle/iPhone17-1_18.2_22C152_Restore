@interface LastSyncedDateFormatter
- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)init;
- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)initWithCoder:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation LastSyncedDateFormatter

- (id)stringForObjectValue:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AD7404B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  sub_1AD33C0D4((uint64_t)v10);
  uint64_t v7 = v6;

  sub_1AD1F65C4((uint64_t)v10);
  if (v7)
  {
    v8 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)init
{
  sub_1AD73A740();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LastSyncedDateFormatter();
  return [(LastSyncedDateFormatter *)&v4 init];
}

- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_1AD73A740();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LastSyncedDateFormatter();
  v5 = [(LastSyncedDateFormatter *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23LastSyncedDateFormatter_calendar;
  uint64_t v3 = sub_1AD73A770();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
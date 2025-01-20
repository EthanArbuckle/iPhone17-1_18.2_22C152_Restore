@interface DateRangeRelevanceProvider
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC18HealthPlatformCore26DateRangeRelevanceProvider)init;
- (int64_t)hash;
@end

@implementation DateRangeRelevanceProvider

- (_TtC18HealthPlatformCore26DateRangeRelevanceProvider)init
{
  uint64_t v3 = sub_1C1EAD318();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1C1EAD0E8();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1C1EADDD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1C1EAD308();
  sub_1C1EAD0B8();
  sub_1C1EADDB8();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v9 + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval, v8, v5);

  v10 = (objc_class *)type metadata accessor for DateRangeRelevanceProvider();
  v12.receiver = v9;
  v12.super_class = v10;
  result = [(RERelevanceProvider *)&v12 init];
  if (!result) {
    __break(1u);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1C1EAF318();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  unsigned __int8 v6 = sub_1C1E7FF28((uint64_t)v8);

  sub_1C1E60B10((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DateRangeRelevanceProvider();
  id v2 = v6.receiver;
  unint64_t v3 = [(RERelevanceProvider *)&v6 hash];
  uint64_t v4 = sub_1C1EADDC8();

  return v4 ^ v3;
}

- (NSString)description
{
  id v2 = self;
  sub_1C1E80654();

  unint64_t v3 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval;
  uint64_t v3 = sub_1C1EADDD8();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
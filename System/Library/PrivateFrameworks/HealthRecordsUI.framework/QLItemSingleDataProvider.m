@interface QLItemSingleDataProvider
- (_TtC15HealthRecordsUI24QLItemSingleDataProvider)init;
- (id)provideDataForItem:(id)a3;
@end

@implementation QLItemSingleDataProvider

- (id)provideDataForItem:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data);
  unint64_t v4 = *(void *)&self->data[OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data];
  sub_1C2205E14(v3, v4);
  v5 = (void *)sub_1C254C930();
  sub_1C2205E6C(v3, v4);
  return v5;
}

- (_TtC15HealthRecordsUI24QLItemSingleDataProvider)init
{
  result = (_TtC15HealthRecordsUI24QLItemSingleDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
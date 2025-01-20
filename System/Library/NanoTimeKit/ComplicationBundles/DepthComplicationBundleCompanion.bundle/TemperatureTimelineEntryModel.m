@interface TemperatureTimelineEntryModel
- (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel)init;
- (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel)initWithCoder:(id)a3;
@end

@implementation TemperatureTimelineEntryModel

- (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel)initWithCoder:(id)a3
{
  result = (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel *)sub_371D8();
  __break(1u);
  return result;
}

- (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel)init
{
  result = (_TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_entryDate;
  uint64_t v4 = sub_366B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature;
  uint64_t v6 = sub_36B88();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end
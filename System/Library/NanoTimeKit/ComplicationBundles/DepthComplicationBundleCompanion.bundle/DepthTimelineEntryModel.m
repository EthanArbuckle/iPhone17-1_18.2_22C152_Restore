@interface DepthTimelineEntryModel
- (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel)init;
- (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel)initWithCoder:(id)a3;
@end

@implementation DepthTimelineEntryModel

- (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel)initWithCoder:(id)a3
{
  result = (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel *)sub_371D8();
  __break(1u);
  return result;
}

- (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel)init
{
  result = (_TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate;
  uint64_t v4 = sub_366B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_13640((uint64_t)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, type metadata accessor for DepthComplicationMetrics);
}

@end
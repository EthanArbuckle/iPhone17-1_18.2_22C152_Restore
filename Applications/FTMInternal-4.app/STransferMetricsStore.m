@interface STransferMetricsStore
- (NSString)description;
- (_TtC13FTMInternal_421STransferMetricsStore)init;
@end

@implementation STransferMetricsStore

- (NSString)description
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  type metadata accessor for STransferMetrics();
  Dictionary.description.getter();

  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC13FTMInternal_421STransferMetricsStore)init
{
  return (_TtC13FTMInternal_421STransferMetricsStore *)sub_100174318();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_421STransferMetricsStore__metrics;
  uint64_t v4 = sub_100157064(&qword_1002D8AA8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13FTMInternal_421STransferMetricsStore____lazy_storage___queue);
}

@end
@interface CNMetricsAnalyzerEngine
- (_TtC21contactsdonationagent23CNMetricsAnalyzerEngine)init;
@end

@implementation CNMetricsAnalyzerEngine

- (_TtC21contactsdonationagent23CNMetricsAnalyzerEngine)init
{
  v2 = self;
  Logger.init(subsystem:category:)();
  v3 = (objc_class *)[objc_allocWithZone((Class)CNContactStore) init];
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore) = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CNMetricsAnalyzerEngine();
  return [(CNMetricsAnalyzerEngine *)&v5 init];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore);
}

@end
@interface JSMetricsIdentifiersObject
- (NSString)currentTopic;
- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)init;
- (id)getIdentifierForContext:(id)a3;
- (id)getIdentifierForContextSync:(id)a3;
- (id)getMetricsFieldsForContexts:(id)a3;
@end

@implementation JSMetricsIdentifiersObject

- (NSString)currentTopic
{
  v2 = self;
  MetricsTopicProvider.currentMetricsTopic.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)getIdentifierForContext:(id)a3
{
  return sub_1000EEE14(self, (uint64_t)a2, a3);
}

- (id)getIdentifierForContextSync:(id)a3
{
  sub_10002EE34(0, &qword_1001A4098);
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v8;
}

- (id)getMetricsFieldsForContexts:(id)a3
{
  return sub_1000EEE14(self, (uint64_t)a2, a3);
}

- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)init
{
  result = (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore);
  swift_unknownObjectRelease();

  v4 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsTopicProvider;

  sub_1000D8CD4((uint64_t)v4);
}

@end
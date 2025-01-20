@interface JSMetricsIdentifiersObject
- (NSString)currentTopic;
- (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject)init;
- (id)getIdentifierForContext:(id)a3;
- (id)getIdentifierForContextSync:(id)a3;
- (id)getMetricsFieldsForContexts:(id)a3;
@end

@implementation JSMetricsIdentifiersObject

- (id)getMetricsFieldsForContexts:(id)a3
{
  return sub_1E15E9D3C(self, (uint64_t)a2, a3);
}

- (id)getIdentifierForContext:(id)a3
{
  return sub_1E15E9D3C(self, (uint64_t)a2, a3);
}

- (NSString)currentTopic
{
  MetricsTopicProvider.currentMetricsTopic.getter();
  v2 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)getIdentifierForContextSync:(id)a3
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1E1D5CC88();
  v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject)init
{
  result = (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
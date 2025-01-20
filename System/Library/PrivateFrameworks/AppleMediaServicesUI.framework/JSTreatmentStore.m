@interface JSTreatmentStore
- (_TtC14amsengagementd16JSTreatmentStore)init;
- (id)fetchNamespaceAreas:(id)a3;
- (id)fetchTopicAreas:(id)a3;
- (id)fetchTreatmentSets:(id)a3 :(id)a4;
- (id)fetchTreatments:(id)a3;
- (id)generateExperimentData:(id)a3;
- (id)generatePayload:(id)a3;
- (id)synchronize;
@end

@implementation JSTreatmentStore

- (_TtC14amsengagementd16JSTreatmentStore)init
{
  return (_TtC14amsengagementd16JSTreatmentStore *)sub_100007240();
}

- (id)fetchNamespaceAreas:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000FEE28();

  return v6;
}

- (id)fetchTopicAreas:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000FEE28();

  return v6;
}

- (id)fetchTreatments:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000FEE28();

  return v6;
}

- (id)fetchTreatmentSets:(id)a3 :(id)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_100100AFC();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)generateExperimentData:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_1000FEE28();

  return v6;
}

- (id)generatePayload:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_1000FEE28();

  return v6;
}

- (id)synchronize
{
  v2 = self;
  v3 = (void *)sub_1001036E8();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd16JSTreatmentStore____lazy_storage___dateFormatter));
}

@end
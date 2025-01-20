@interface JSTreatmentStore
- (_TtC19AppStoreKitInternal16JSTreatmentStore)init;
- (id)treatmentForArea:(id)a3;
- (id)treatmentsForAreas:(id)a3;
@end

@implementation JSTreatmentStore

- (id)treatmentsForAreas:(id)a3
{
  sub_1E1D5C248();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v4 = self;
  v5 = (void *)sub_1E1D5CC88();
  v6 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal16JSTreatmentStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSTreatmentStore *)&v3 init];
}

- (id)treatmentForArea:(id)a3
{
  sub_1E1D5BE58();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v4 = self;
  v5 = (void *)sub_1E1D5CC88();
  v6 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
  return v6;
}

@end
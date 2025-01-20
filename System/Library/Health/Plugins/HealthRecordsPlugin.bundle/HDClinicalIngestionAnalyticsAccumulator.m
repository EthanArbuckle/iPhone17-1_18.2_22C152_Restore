@interface HDClinicalIngestionAnalyticsAccumulator
- (HDClinicalIngestionAnalyticsAccumulator)init;
- (void)accumulateIngestionAnalyticsFromTaskStates:(id)a3 gateway:(id)a4 completion:(id)a5;
- (void)consumeMetricsFromHandler:(id)a3 completion:(id)a4;
- (void)enumerateForCoreAnalyticsAndResetWithBlock:(id)a3 completion:(id)a4;
@end

@implementation HDClinicalIngestionAnalyticsAccumulator

- (HDClinicalIngestionAnalyticsAccumulator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_B58A0();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator) = (Class)sub_B5890();

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(HDClinicalIngestionAnalyticsAccumulator *)&v6 init];
}

- (void)accumulateIngestionAnalyticsFromTaskStates:(id)a3 gateway:(id)a4 completion:(id)a5
{
  sub_A9724(0, &qword_137118, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  v10 = (char *)&v20 - v9;
  v11 = _Block_copy(a5);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_AA208;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_B5930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = v11;
  v14[8] = v12;
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  id v18 = v15;
  id v19 = v16;
  sub_AA1E8((uint64_t)v11);
  sub_A8628((uint64_t)v10, (uint64_t)&unk_137170, (uint64_t)v14);
  swift_release();
  sub_AA1F8((uint64_t)v11);
}

- (void)consumeMetricsFromHandler:(id)a3 completion:(id)a4
{
  sub_A9724(0, &qword_137118, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  v8 = (char *)&v17 - v7;
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_B5930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = sub_A9F54;
  v12[7] = v10;
  id v13 = a3;
  v14 = self;
  id v15 = v13;
  id v16 = v14;
  swift_retain();
  sub_A8628((uint64_t)v8, (uint64_t)&unk_137160, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)enumerateForCoreAnalyticsAndResetWithBlock:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a3);
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = self;
  sub_A8F58((uint64_t)sub_A9708, v8, (uint64_t)sub_A9710, v9);

  swift_release();

  swift_release();
}

- (void).cxx_destruct
{
}

@end
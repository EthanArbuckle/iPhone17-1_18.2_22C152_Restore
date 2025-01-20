@interface ClinicalSharingServer
- (_TtC19HealthRecordsDaemon21ClinicalSharingServer)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5;
- (void)remote_scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4;
- (void)remote_shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6;
- (void)remote_submitDailyAnalyticsWithCompletion:(id)a3;
- (void)remote_submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation ClinicalSharingServer

- (_TtC19HealthRecordsDaemon21ClinicalSharingServer)init
{
  result = (_TtC19HealthRecordsDaemon21ClinicalSharingServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19HealthRecordsDaemon21ClinicalSharingServer_contextProvider);

  swift_bridgeObjectRelease();
}

- (void)remote_shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6
{
  sub_22D0DCC44(0, &qword_26AEC0F48, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v18 - v12;
  v14 = _Block_copy(a6);
  if (a5)
  {
    sub_22D2BBC00();
    uint64_t v15 = sub_22D2BBC30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_22D2BBC30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  _Block_copy(v14);
  v17 = self;
  sub_22D0DBAF4(a3, a4, (uint64_t)v13, v17, v14);
  _Block_release(v14);
  _Block_release(v14);

  sub_22D0DCBC0((uint64_t)v13, &qword_26AEC0F48, MEMORY[0x263F07490]);
}

- (void)remote_scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_22D0DC170(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)remote_gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_22D2BBC30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_22D2BBC00();
  _Block_copy(v12);
  v13 = self;
  sub_22D0DC590(a3, (uint64_t)v11, (char *)v13, (void (**)(void, void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)remote_submitDailyAnalyticsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_22D0DA6C0((uint64_t)sub_22D0DCD28, v5);

  swift_release();
}

- (void)remote_submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_22D2BCBD0();
  unint64_t v9 = v8;
  uint64_t v10 = sub_22D2BCBD0();
  unint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  uint64_t v14 = self;
  sub_22D0DAD90(v7, v9, v10, v12, (uint64_t)sub_22D0DB8C0, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)exportedInterface
{
  id v2 = (id)HKClinicalSharingServerInterface();
  return v2;
}

- (id)remoteInterface
{
  return 0;
}

@end
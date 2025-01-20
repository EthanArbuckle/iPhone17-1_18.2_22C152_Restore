@interface ClinicalSharingSyncObserverServer
- (_TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)remote_startObservingSyncStatusWithCompletion:(id)a3;
@end

@implementation ClinicalSharingSyncObserverServer

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_lock;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_lock);
  sub_22D0DE988(0, &qword_26AEC1F40, (uint64_t (*)(uint64_t))type metadata accessor for os_unfair_lock_s, MEMORY[0x263F8D8D0]);
  sub_22D086B58();
  v4 = self;
  sub_22D2BBEE0();
  MEMORY[0x230F7BDF0](*(Class *)((char *)&self->super.isa + v3), -1, -1);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for ClinicalSharingSyncObserverServer();
  [(ClinicalSharingSyncObserverServer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_client));
  swift_release();
  swift_release();
}

- (_TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer)init
{
  result = (_TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)remote_startObservingSyncStatusWithCompletion:(id)a3
{
  v4 = (void (**)(void *, uint64_t, void))_Block_copy(a3);
  objc_super v5 = self;
  sub_22D0DDC28();
  v4[2](v4, 1, 0);
  _Block_release(v4);
}

- (id)exportedInterface
{
  id v2 = (id)HKClinicalSharingSyncObserverServerInterface();
  return v2;
}

- (id)remoteInterface
{
  id v2 = (id)HKClinicalSharingSyncObserverClientInterface();
  return v2;
}

- (void)connectionInvalidated
{
  sub_22D0DE988(0, &qword_26AEC1F40, (uint64_t (*)(uint64_t))type metadata accessor for os_unfair_lock_s, MEMORY[0x263F8D8D0]);
  sub_22D086B58();
  uint64_t v3 = self;
  sub_22D2BBEE0();
}

@end
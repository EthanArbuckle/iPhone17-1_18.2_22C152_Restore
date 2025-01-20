@interface ASDDeviceAppFetcher.QueryObservation
- (NSString)description;
- (_TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation ASDDeviceAppFetcher.QueryObservation

- (NSString)description
{
  v2 = self;
  sub_2307EE0A4();

  v3 = (void *)sub_230812438();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BF0);
  uint64_t v6 = sub_230812518();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler), *(void *)&self->taskScheduler[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler+ 8]);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer);
  uint64_t v7 = *(void *)&self->appQuery[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer];
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v7;
  v9[4] = v6;
  id v10 = a3;
  v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2308121C8();

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation)init
{
  result = (_TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler);
  swift_release();
}

@end
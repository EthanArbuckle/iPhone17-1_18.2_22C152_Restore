@interface HomeIntelligence.ActivityLogger.MicroLocation.Adapter
- (_TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter)init;
- (void)connection:(id)a3 didUpdatePrediction:(id)a4;
- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4;
- (void)dealloc;
@end

@implementation HomeIntelligence.ActivityLogger.MicroLocation.Adapter

- (_TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter)init
{
  return (_TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter *)sub_22F5F4B10();
}

- (void)dealloc
{
  v2 = self;
  sub_22F5F4EE4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_events;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D8940);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_22F54F3D4((uint64_t)self+ OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_continuation, &qword_2686D8920);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_ulConnection);
}

- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22F5F557C(a4);
}

- (void)connection:(id)a3 didUpdatePrediction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22F5F57CC(a4);
}

@end
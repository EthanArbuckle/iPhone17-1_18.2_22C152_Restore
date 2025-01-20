@interface CoreMLPerfRunnerService
+ (void)registerCapabilities:(id)a3;
- (_TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService)init;
- (_TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService)initWithChannel:(id)a3;
- (void)dealloc;
- (void)messageReceived:(id)a3;
@end

@implementation CoreMLPerfRunnerService

+ (void)registerCapabilities:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = (id)sub_23093F278();
  [v4 publishCapability:v5 withVersion:4 forClass:swift_getObjCClassFromMetadata()];
}

- (_TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService)initWithChannel:(id)a3
{
  uint64_t v4 = qword_268707918;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_268709100;
  type metadata accessor for CoreMLPerfRunnerServiceMessageHandler();
  v8 = (objc_class *)swift_allocObject();
  *((void *)v8 + 5) = type metadata accessor for CoreMLPerfCoordinator();
  *((void *)v8 + 6) = &protocol witness table for CoreMLPerfCoordinator;
  *((void *)v8 + 2) = v7;
  *((void *)v8 + 7) = v5;
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService_messageHandler) = v8;
  id v9 = v5;
  swift_retain();

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for CoreMLPerfRunnerService();
  v10 = [(DTXService *)&v12 initWithChannel:v9];

  return v10;
}

- (void)messageReceived:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CoreMLPerfRunnerService();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DTXService *)&v6 messageReceived:v4];
  sub_23093A008(v4);
}

- (void)dealloc
{
  uint64_t v2 = qword_2687078E0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_23093F1E8();
  sub_23091D0F8(v4, (uint64_t)qword_2687078E8);
  os_log_type_t v5 = sub_23093F328();
  objc_super v6 = sub_23093F1C8();
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23087D000, v6, v5, "PerfRunnerService - deinit invoked", v7, 2u);
    MEMORY[0x230FC2BD0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CoreMLPerfRunnerService();
  [(CoreMLPerfRunnerService *)&v8 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService)init
{
  result = (_TtC24DVTInstrumentsFoundation23CoreMLPerfRunnerService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
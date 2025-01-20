@interface RemoteExecutionService.ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate)init;
- (void)remote_runWithWorkPlan:(id)a3 provider:(id)a4 executor:(id)a5 with:(id)a6;
@end

@implementation RemoteExecutionService.ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_27020EC48);
  objc_msgSend(v9, sel_setExportedInterface_, v11);

  objc_msgSend(v9, sel_setExportedObject_, v10);
  objc_msgSend(v9, sel_resume);

  return 1;
}

- (void)remote_runWithWorkPlan:(id)a3 provider:(id)a4 executor:(id)a5 with:(id)a6
{
  id v8 = _Block_copy(a6);
  uint64_t v9 = sub_2511C94B0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2511C94B0();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_25118CE10;
  *(void *)(v16 + 24) = v15;
  v17 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate_engine);
  v20[0] = v9;
  v20[1] = v11;
  v20[2] = v12;
  v20[3] = v14;
  v20[4] = 0;
  v20[5] = 0;
  id v18 = a3;
  v19 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25119E210((uint64_t)v18, v20, v17, (void (*)(void))sub_25118CE5C, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_release();
}

- (_TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate)init
{
  result = (_TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
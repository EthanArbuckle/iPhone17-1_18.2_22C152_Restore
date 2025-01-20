@interface APExtensionMonitorClient
- (_TtC13AppProtection24APExtensionMonitorClient)init;
- (void)beginMonitoringForExtensionUUID:(id)a3 monitorUUID:(id)a4;
- (void)endMonitoringForMonitorUUID:(id)a3;
@end

@implementation APExtensionMonitorClient

- (void)beginMonitoringForExtensionUUID:(id)a3 monitorUUID:(id)a4
{
  uint64_t v5 = sub_247DD28F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  v10 = ((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8, v11);
  v13 = (char *)&v16 - v12;
  sub_247DD28D0();
  sub_247DD28D0();
  v14 = self;
  sub_247DB4B6C((uint64_t)v13, v10);

  v15 = *(void (**)(NSObject *, uint64_t))(v6 + 8);
  v15(v10, v5);
  v15(v13, v5);
}

- (void)endMonitoringForMonitorUUID:(id)a3
{
  uint64_t v4 = sub_247DD28F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247DD28D0();
  uint64_t v9 = self;
  sub_247DB56CC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC13AppProtection24APExtensionMonitorClient)init
{
  result = (_TtC13AppProtection24APExtensionMonitorClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  sub_247D53450((uint64_t)self + OBJC_IVAR____TtC13AppProtection24APExtensionMonitorClient_delegate);

  swift_bridgeObjectRelease();
}

@end
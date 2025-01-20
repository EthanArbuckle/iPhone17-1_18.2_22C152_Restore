@interface MetricsInspectorScanner
- (_TtC9JetEngine23MetricsInspectorScanner)init;
- (uint64_t)netServiceBrowserDidStopSearch:;
- (uint64_t)netServiceBrowserWillSearch:;
- (void)dealloc;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidResolveAddress:(id)a3;
@end

@implementation MetricsInspectorScanner

- (void)dealloc
{
  v2 = self;
  sub_19EF78454();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  sub_19EEBDC10(0, (unint64_t *)&qword_1EB3929E0);
  uint64_t v6 = sub_19F1DBB3C();
  id v7 = a3;
  v8 = self;
  sub_19EF794A8(v6);

  swift_bridgeObjectRelease();
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  swift_getObjectType();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine23MetricsInspectorScanner_stateLock);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  objc_msgSend(v8, sel_lock);
  sub_19EF78968(v10, (uint64_t)v11);
  objc_msgSend(v8, sel_unlock);
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine23MetricsInspectorScanner_stateLock);
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_msgSend(v7, sel_lock);
  sub_19EF78D80((uint64_t)v10, v9);
  objc_msgSend(v7, sel_unlock);
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19EF79690(v4);
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  sub_19EEBDC10(0, (unint64_t *)&qword_1EB3929E0);
  uint64_t v6 = sub_19F1DBB3C();
  id v7 = a3;
  id v8 = self;
  sub_19EF79888(v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC9JetEngine23MetricsInspectorScanner)init
{
  result = (_TtC9JetEngine23MetricsInspectorScanner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)netServiceBrowserWillSearch:
{
  if (qword_1EB393168 != -1) {
    swift_once();
  }
  v0 = (void *)qword_1EB393080;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB393150);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19F24EAD0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB393250);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x1E4FBB1A0];
  *(_OWORD *)(v2 + 16) = xmmword_19F24EAD0;
  v9[3] = v3;
  v9[0] = 0xD000000000000037;
  v9[1] = 0x800000019F26A520;
  long long v7 = 0u;
  long long v8 = 0u;
  id v4 = v0;
  sub_19EEC3E70((uint64_t)v9, (uint64_t)&v7);
  *(unsigned char *)(v2 + 64) = 0;
  long long v5 = v8;
  *(_OWORD *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 48) = v5;
  *(void *)(v1 + 32) = v2;
  *(void *)&long long v7 = v4;
  LOBYTE(v9[0]) = 3;
  OSLogger.log(contentsOf:withLevel:)((Swift::OpaquePointer)v1, (JetEngine::LogMessageLevel)v9);

  return swift_bridgeObjectRelease();
}

- (uint64_t)netServiceBrowserDidStopSearch:
{
  if (qword_1EB393168 != -1) {
    swift_once();
  }
  v0 = (void *)qword_1EB393080;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB393150);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19F24EAD0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB393250);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x1E4FBB1A0];
  *(_OWORD *)(v2 + 16) = xmmword_19F24EAD0;
  v9[3] = v3;
  v9[0] = 0xD000000000000037;
  v9[1] = 0x800000019F26A4E0;
  long long v7 = 0u;
  long long v8 = 0u;
  id v4 = v0;
  sub_19EEC3E70((uint64_t)v9, (uint64_t)&v7);
  *(unsigned char *)(v2 + 64) = 0;
  long long v5 = v8;
  *(_OWORD *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 48) = v5;
  *(void *)(v1 + 32) = v2;
  *(void *)&long long v7 = v4;
  LOBYTE(v9[0]) = 3;
  OSLogger.log(contentsOf:withLevel:)((Swift::OpaquePointer)v1, (JetEngine::LogMessageLevel)v9);

  return swift_bridgeObjectRelease();
}

@end
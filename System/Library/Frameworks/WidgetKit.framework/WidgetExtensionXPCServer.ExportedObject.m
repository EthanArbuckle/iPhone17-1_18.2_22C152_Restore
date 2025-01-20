@interface WidgetExtensionXPCServer.ExportedObject
- (_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject)init;
- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5;
- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4;
- (void)getAllCurrentDescriptorsWithCompletion:(id)a3;
- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3;
- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4;
- (void)getCurrentDescriptorsWithCompletion:(id)a3;
- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4;
- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5;
- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4;
- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)performCleanup;
- (void)pushTokensDidChange:(id)a3 completion:(id)a4;
- (void)setControlState:(id)a3 completion:(id)a4;
@end

@implementation WidgetExtensionXPCServer.ExportedObject

- (void)performCleanup
{
}

- (void)invalidate
{
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_191CF5338();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_191B02A9C(v6, v8, (uint64_t)sub_191B173B4, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for PlaceholderRequest();
  uint64_t v6 = sub_191CF5538();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_191B11800(v6, (uint64_t)sub_191B17A64, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = _Block_copy(a5);
  type metadata accessor for TimelineRequest();
  unint64_t v8 = sub_191CF5538();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  sub_191B054AC(v8, v5, 0, (uint64_t)sub_191B17A64, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  BOOL v5 = self;
  sub_191B14564((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_191B146BC(v8, (uint64_t)sub_191B179FC, v7);

  swift_release();
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_191CF5338();
  unint64_t v10 = v9;
  _Block_copy(v7);
  swift_unknownObjectRetain();
  v11 = self;
  sub_191B149A0(v8, v10, (uint64_t)a4, (uint64_t)v11, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject)init
{
  result = (_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject_xpcConnection));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject__queue);
}

- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  type metadata accessor for ControlTemplateRequest();
  unint64_t v6 = sub_191CF5538();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_191B083B8(v6, 0, (uint64_t)sub_191B160E8, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)pushTokensDidChange:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF18);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_191CF56B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_191CF5698();
  id v13 = a3;
  v14 = self;
  swift_retain();
  uint64_t v15 = sub_191CF5688();
  v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x1E4FBCFD8];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v13;
  v16[5] = sub_191B17A64;
  v16[6] = v11;
  sub_191B0B438((uint64_t)v9, (uint64_t)&unk_1E92E3000, (uint64_t)v16);
  swift_release();
  sub_191B01770((uint64_t)v9, &qword_1EB44AF18);

  swift_release();
}

- (void)setControlState:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF18);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_191CF56B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_191CF5698();
  id v13 = a3;
  v14 = self;
  id v15 = v13;
  swift_retain();
  uint64_t v16 = sub_191CF5688();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x1E4FBCFD8];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  v17[5] = v15;
  v17[6] = sub_191B17A64;
  v17[7] = v11;
  sub_191B0B438((uint64_t)v9, (uint64_t)&unk_1E92E2FD0, (uint64_t)v17);
  swift_release();
  sub_191B01770((uint64_t)v9, &qword_1EB44AF18);

  swift_release();
}

- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  type metadata accessor for ActivityWidgetRequest(0);
  unint64_t v6 = sub_191CF5538();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_191B0D2E4(v6, 0, (uint64_t)sub_191B0D9C4, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

@end
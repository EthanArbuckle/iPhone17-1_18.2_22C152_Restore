@interface ISStreamsProvider
- (ISStreamsProvider)init;
- (id)connectedComponentGroupsWithWindowLength:(double)a3;
- (id)eventGraphs;
- (id)eventGraphsWithWindowLength:(double)a3;
- (id)events;
- (id)siriConversations;
- (id)siriTurns;
- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 completionHandler:(id)a4;
- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 windowLength:(double)a4 completionHandler:(id)a5;
@end

@implementation ISStreamsProvider

- (id)events
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FDE0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  uint64_t v22 = v4;
  MEMORY[0x270FA5388](v3, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FDE8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v13 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v14);
  v15 = *(void (**)(uint64_t, uint64_t))(v13 + 128);
  v20 = self;
  v15(v14, v13);
  type metadata accessor for TimestampedEventBridge();
  sub_22A75F23C();
  sub_22AEA9408();
  uint64_t v16 = v21;
  v17 = (void *)sub_22AEA93C8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

  return v17;
}

- (id)eventGraphsWithWindowLength:(double)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD70228);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v11 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v10);
  v12 = *(void (**)(uint64_t, uint64_t, double))(v11 + 136);
  uint64_t v13 = self;
  v12(v10, v11, a3);
  uint64_t v14 = (void *)sub_22AEA9428();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

- (id)eventGraphs
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD70228);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v9 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  uint64_t v10 = self;
  InstrumentationStreamsProviderProtocol.eventGraphs()(v8, v9);
  uint64_t v11 = (void *)sub_22AEA9428();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v11;
}

- (id)connectedComponentGroupsWithWindowLength:(double)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD70228);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v10 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v9);
  uint64_t v11 = self;
  InstrumentationStreamsProviderProtocol.connectedComponentGroups(windowLength:)(v9, v10);
  v12 = (void *)sub_22AEA9428();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v12;
}

- (id)siriTurns
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v9 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 144);
  uint64_t v11 = self;
  v10(v8, v9);
  v12 = (void *)sub_22AEA9428();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v12;
}

- (id)siriConversations
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26837FE08);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  uint64_t v9 = *(void *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 152);
  uint64_t v11 = self;
  v10(v8, v9);
  v12 = (void *)sub_22AEA9428();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v12;
}

- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 windowLength:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(double *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = self;
  uint64_t v15 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26837FE60;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26837FE68;
  v17[5] = v16;
  v18 = a3;
  uint64_t v19 = self;
  sub_22A792170((uint64_t)v12, (uint64_t)&unk_26837FE70, (uint64_t)v17);
  swift_release();
}

- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26837FE40;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26837FE48;
  v15[5] = v14;
  uint64_t v16 = a3;
  v17 = self;
  sub_22A792170((uint64_t)v10, (uint64_t)&unk_26837FE50, (uint64_t)v15);
  swift_release();
}

- (ISStreamsProvider)init
{
  result = (ISStreamsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
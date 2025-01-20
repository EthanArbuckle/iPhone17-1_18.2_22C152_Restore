@interface BERenderingProcess
+ (void)renderingProcessWithBundleID:(id)a3 interruptionHandler:(id)a4 completion:(id)a5;
+ (void)renderingProcessWithInterruptionHandler:(id)a3 completion:(id)a4;
- (BERenderingProcess)init;
- (id)createVisibilityPropagationInteraction;
- (id)grantCapability:(id)a3 error:(id *)a4;
- (id)grantCapability:(id)a3 error:(id *)a4 invalidationHandler:(id)a5;
- (id)makeLibXPCConnectionError:(id *)a3;
- (void)invalidate;
@end

@implementation BERenderingProcess

+ (void)renderingProcessWithBundleID:(id)a3 interruptionHandler:(id)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v12 = sub_243259A90();
    a3 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v12;
  v17[5] = a3;
  v17[6] = sub_24325423C;
  v17[7] = v14;
  v17[8] = sub_243240720;
  v17[9] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24323B154((uint64_t)v9, (uint64_t)&unk_268D8F760, (uint64_t)v17);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (id)grantCapability:(id)a3 error:(id *)a4 invalidationHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  v10 = self;
  v11 = (void *)sub_24323EBD8((uint64_t)v9, (uint64_t)sub_24323E440, v8, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_26F88F3D8, type metadata accessor for RenderingProcess);
  swift_release();

  return v11;
}

- (id)createVisibilityPropagationInteraction
{
  return sub_24323D6A8(self);
}

- (id)makeLibXPCConnectionError:(id *)a3
{
  return sub_24323B0B4(self);
}

+ (void)renderingProcessWithInterruptionHandler:(id)a3 completion:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a3);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  uint64_t v13 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = sub_24325423C;
  v14[5] = v11;
  v14[6] = sub_2432404CC;
  v14[7] = v12;
  swift_retain();
  swift_retain();
  sub_24323B154((uint64_t)v8, (uint64_t)&unk_268D8F768, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)invalidate
{
  v2 = self;
  sub_243251DC8();
}

- (BERenderingProcess)init
{
  result = (BERenderingProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)grantCapability:(id)a3 error:(id *)a4
{
  return sub_2432565EC(self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_26F88F3D8, type metadata accessor for RenderingProcess);
}

@end
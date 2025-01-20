@interface CIDVUIInternalProofingFlowManager
- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)init;
- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)initWithDelegate:(id)a3 externalProofingFlowManager:(id)a4;
- (id)proofingFlowViewController;
- (uint64_t)proofingEligibilityStatus;
- (void)dealloc;
- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3;
- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5;
- (void)startProofingWithConfiguration:(CIDVUIProofingConfiguration *)a3 completionHandler:(id)a4;
@end

@implementation CIDVUIInternalProofingFlowManager

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)initWithDelegate:(id)a3 externalProofingFlowManager:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  v6 = (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *)sub_21F4BBAB0();

  swift_unknownObjectRelease();
  return v6;
}

- (void)startProofingWithConfiguration:(CIDVUIProofingConfiguration *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267EDF448;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267EDF450;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_21F5285E4((uint64_t)v9, (uint64_t)&unk_267EDF458, (uint64_t)v14);
  swift_release();
}

- (id)proofingFlowViewController
{
  v2 = self;
  id v3 = sub_21F4B924C();

  return v3;
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDF420;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDF428;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDF430, (uint64_t)v12);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267EDF400;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267EDF408;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_21F5285E4((uint64_t)v11, (uint64_t)&unk_267EDF410, (uint64_t)v16);
  swift_release();
}

- (void)dealloc
{
  v2 = self;
  CIDVUIInternalProofingFlowManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_configuration));
  swift_unknownObjectWeakDestroy();
  id v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_delegate;

  sub_21F4BD3D8((uint64_t)v3);
}

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)init
{
  result = (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)proofingEligibilityStatus
{
  sub_21F54F050();
  swift_allocObject();
  sub_21F54F040();
  if (sub_21F54F010())
  {
    swift_release();
    return 0;
  }
  else if (UIAccessibilityIsSwitchControlRunning() || _AXSAssistiveTouchEnabled())
  {
    swift_release();
    return 1;
  }
  else
  {
    int v1 = _AXSCommandAndControlEnabled();
    swift_release();
    if (v1) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

@end
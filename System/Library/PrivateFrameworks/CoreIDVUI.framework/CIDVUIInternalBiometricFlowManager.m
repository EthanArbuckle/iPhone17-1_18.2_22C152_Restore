@interface CIDVUIInternalBiometricFlowManager
- (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager)init;
- (void)deleteBoundACLWithCompletionHandler:(id)a3;
- (void)evaluateBoundACLWithCompletionHandler:(id)a3;
- (void)fetchBiometricBindingDetailsWithCompletionHandler:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3;
@end

@implementation CIDVUIInternalBiometricFlowManager

- (void)evaluateBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDF818;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDF820;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDF828, (uint64_t)v12);
  swift_release();
}

- (void)deleteBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDF7F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDF800;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDF808, (uint64_t)v12);
  swift_release();
}

- (void)fetchBiometricBindingDetailsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDF7D8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDF7E0;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDF7E8, (uint64_t)v12);
  swift_release();
}

- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDF7C8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDF408;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDF410, (uint64_t)v12);
  swift_release();
}

- (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager)init
{
  return (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager *)CIDVUIInternalBiometricFlowManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager_viewController));

  swift_release();
}

@end
@interface CIDVUIInternalBiometricReplacementFlowManager
- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)init;
- (void)beginBiometricReplacementForTarget:(int64_t)a3 withAuthHandler:(id)a4 andCompletionHandler:(id)a5;
@end

@implementation CIDVUIInternalBiometricReplacementFlowManager

- (void)beginBiometricReplacementForTarget:(int64_t)a3 withAuthHandler:(id)a4 andCompletionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  if (v13)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v13;
    v13 = sub_21F4D6628;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = sub_21F4D64CC;
  v17[6] = v14;
  v17[7] = a3;
  v17[8] = v13;
  v17[9] = v15;
  v18 = self;
  swift_retain();
  sub_21F47F790((uint64_t)v13);
  sub_21F47D908((uint64_t)v11, (uint64_t)&unk_267EDF740, (uint64_t)v17);
  swift_release();
  sub_21F47D8F8((uint64_t)v13);
  swift_release();
}

- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)init
{
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager_completion);
  v4 = (objc_class *)type metadata accessor for CIDVUIInternalBiometricReplacementFlowManager();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CIDVUIInternalBiometricFlowManager *)&v6 init];
}

- (void).cxx_destruct
{
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager_completion));
}

@end
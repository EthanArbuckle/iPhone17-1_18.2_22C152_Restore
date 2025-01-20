@interface CIDVUIInternalIdentityProofingDataSharingFlowManager
- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)init;
- (void)checkUserConsentWithCompletionHandler:(id)a3;
- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4;
- (void)fetchUserConsentWithCompletionHandler:(id)a3;
@end

@implementation CIDVUIInternalIdentityProofingDataSharingFlowManager

- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)init
{
  id v3 = objc_allocWithZone((Class)sub_21F5502E0());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  type metadata accessor for IdentityProofingDataSharingFlowManager();
  uint64_t v6 = swift_allocObject();
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager_dataSharingFlowManager) = (Class)sub_21F52895C((uint64_t)v5, v6);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return [(CIDVUIInternalIdentityProofingDataSharingFlowManager *)&v8 init];
}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EE0410;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EE0418;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EE0420, (uint64_t)v12);
  swift_release();
}

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EE03E0;
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

- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = self;
    uint64_t v10 = sub_21F550400();
    if (v11) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_21F47EF74;
    *(void *)(v13 + 24) = v8;
    swift_retain();
    sub_21F498678(v12, (uint64_t)sub_21F52908C, v13);

    swift_release();
    swift_release();
  }
}

- (void).cxx_destruct
{
}

@end
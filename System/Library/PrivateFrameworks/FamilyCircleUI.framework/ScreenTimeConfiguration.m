@interface ScreenTimeConfiguration
- (BOOL)isRestrictedForFeature:(id)a3;
- (_TtC14FamilyCircleUI23ScreenTimeConfiguration)init;
- (void)isContentPrivacyEnabledForDSID:(NSNumber *)a3 completionHandler:(id)a4;
@end

@implementation ScreenTimeConfiguration

- (_TtC14FamilyCircleUI23ScreenTimeConfiguration)init
{
  uint64_t v3 = OBJC_IVAR____TtC14FamilyCircleUI23ScreenTimeConfiguration_stManagementState;
  id v4 = objc_allocWithZone(MEMORY[0x263F671E0]);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ScreenTimeConfiguration();
  return [(ScreenTimeConfiguration *)&v7 init];
}

- (void)isContentPrivacyEnabledForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BEB518;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF290;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8C80, (uint64_t)v14);
  swift_release();
}

- (BOOL)isRestrictedForFeature:(id)a3
{
  sub_218CAEE38();
  id v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedConnection);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)sub_218CAEDF8();
    unsigned int v9 = objc_msgSend(v7, sel_BOOLRestrictionForFeature_, v8);

    swift_bridgeObjectRelease();
    LOBYTE(v6) = v9 == 2;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI23ScreenTimeConfiguration_stManagementState));
}

@end
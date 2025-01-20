@interface GMSpecifierController
- (BOOL)featureOptInStatus;
- (BOOL)gmFFEnabled;
- (BOOL)hasEngagedCFU;
- (GMSpecifierController)init;
- (_TtP24AssistantSettingsSupport29GMSpecifierControllerDelegate_)delegate;
- (void)clearCFUWithCompletionHandler:(id)a3;
- (void)enrollWithCompletionHandler:(id)a3;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)fetchStatusWithForceDownloadIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFeatureOptInStatusWithEnabled:(BOOL)a3;
@end

@implementation GMSpecifierController

- (_TtP24AssistantSettingsSupport29GMSpecifierControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x223C72420](v2);

  return (_TtP24AssistantSettingsSupport29GMSpecifierControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (GMSpecifierController)init
{
  return (GMSpecifierController *)GMSpecifierController.init()();
}

- (BOOL)gmFFEnabled
{
  return sub_220C747D0() & 1;
}

- (void)enrollWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F2C0E8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267F2C0F0;
  v12[5] = v11;
  v13 = self;
  sub_220C6CDD8((uint64_t)v7, (uint64_t)&unk_267F2C0F8, (uint64_t)v12);
  swift_release();
}

- (void)fetchStatusWithForceDownloadIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267F2C0C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267F2C0D0;
  v14[5] = v13;
  v15 = self;
  sub_220C6CDD8((uint64_t)v9, (uint64_t)&unk_267F2C0D8, (uint64_t)v14);
  swift_release();
}

- (void)fetchStatusWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F2C0A8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a0E;
  v12[5] = v11;
  v13 = self;
  sub_220C6CDD8((uint64_t)v7, (uint64_t)&unk_267F2C0B8, (uint64_t)v12);
  swift_release();
}

- (BOOL)featureOptInStatus
{
  uint64_t v3 = (uint64_t)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  sub_220C6EAD4(v3, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);

  return v3 & 1;
}

- (void)setFeatureOptInStatusWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 16);
  uint64_t v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (void)clearCFUWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F2C068;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = aHE;
  v12[5] = v11;
  v13 = self;
  sub_220C6CDD8((uint64_t)v7, (uint64_t)&unk_267F2C088, (uint64_t)v12);
  swift_release();
}

- (BOOL)hasEngagedCFU
{
  return sub_220C748C0() & 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GMSpecifierController_availabilityProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GMSpecifierController_enrollmentProvider);

  sub_220C6EAAC((uint64_t)self + OBJC_IVAR___GMSpecifierController_delegate);
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR___GMSpecifierController_availability;
  uint64_t v4 = sub_220C74760();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
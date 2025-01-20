@interface CSFTicketManager
+ (void)getWaitlistStatusWithFeatureID:(NSString *)a3 completionHandler:(id)a4;
+ (void)signupForWaitlistWithFeatureID:(NSString *)a3 completionHandler:(id)a4;
- (CSFTicketManager)init;
- (void)getWaitlistStatusWithFeatureID:(NSString *)a3 completionHandler:(id)a4;
- (void)signupForWaitlistWithFeatureID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation CSFTicketManager

+ (void)signupForWaitlistWithFeatureID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = a1;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979EDD0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979EDD8;
  v15[5] = v14;
  v16 = a3;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979EDE0, (uint64_t)v15);
  swift_release();
}

+ (void)getWaitlistStatusWithFeatureID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = a1;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979EDB0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979EDB8;
  v15[5] = v14;
  v16 = a3;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979EDC0, (uint64_t)v15);
  swift_release();
}

- (void)signupForWaitlistWithFeatureID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979ED90;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979ED98;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979EDA0, (uint64_t)v15);
  swift_release();
}

- (void)getWaitlistStatusWithFeatureID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979ED70;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979ED78;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979ED80, (uint64_t)v15);
  swift_release();
}

- (CSFTicketManager)init
{
  result = (CSFTicketManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CSFTicketManager_provider);
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___CSFTicketManager_signposter;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end
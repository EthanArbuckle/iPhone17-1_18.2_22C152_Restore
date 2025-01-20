@interface XPCConnectionManager
- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 completionHandler:(id)a4;
- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5;
- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 completionHandler:(id)a4;
- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5;
@end

@implementation XPCConnectionManager

- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268754A80;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268754A88;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_232E52FC8((uint64_t)v9, (uint64_t)&unk_268754A90, (uint64_t)v14);
  swift_release();
}

- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268754A60;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268754A68;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_232E52FC8((uint64_t)v11, (uint64_t)&unk_268754A70, (uint64_t)v16);
  swift_release();
}

- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268754DF0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268754DF8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_232E52FC8((uint64_t)v9, (uint64_t)&unk_268754E00, (uint64_t)v14);
  swift_release();
}

- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268754DC0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268754A68;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_232E52FC8((uint64_t)v11, (uint64_t)&unk_268754A70, (uint64_t)v16);
  swift_release();
}

@end
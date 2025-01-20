@interface Server
- (void)screenTimeDidReceiveAnswer:(_TtC5AskTo14ATAnswerChoice *)a3 forRequestWithID:(NSString *)a4 responderDSID:(NSString *)a5 completionHandler:(id)a6;
- (void)sendResponse:(_TtC9AskToCore9ATPayload *)a3 to:(NSArray *)a4 completionHandler:(id)a5;
- (void)sendWithQuestion:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5;
@end

@implementation Server

- (void)sendWithQuestion:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(_WORD *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_2487A6548();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269327758;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269327760;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_24878998C((uint64_t)v11, (uint64_t)&unk_269327768, (uint64_t)v16);
  swift_release();
}

- (void)sendResponse:(_TtC9AskToCore9ATPayload *)a3 to:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2487A6548();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269327720;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269327728;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_24878998C((uint64_t)v11, (uint64_t)&unk_269327730, (uint64_t)v16);
  swift_release();
}

- (void)screenTimeDidReceiveAnswer:(_TtC5AskTo14ATAnswerChoice *)a3 forRequestWithID:(NSString *)a4 responderDSID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2487A6548();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2693276D8;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2693276E8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_24878998C((uint64_t)v13, (uint64_t)&unk_2693276F8, (uint64_t)v18);
  swift_release();
}

@end
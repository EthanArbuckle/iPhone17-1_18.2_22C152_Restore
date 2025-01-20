@interface CredentialSession
- (void)installationCompletedWithCredentials:(NSArray *)a3 completionHandler:(id)a4;
- (void)presentmentAssertionTimeoutWithError:(NSError *)a3 completionHandler:(id)a4;
- (void)receivedHciDataWithData:(NSData *)a3 appletIdentifier:(NSData *)a4 completionHandler:(id)a5;
- (void)rfFieldChanged:(BOOL)a3 completionHandler:(id)a4;
- (void)sessionEndedWithError:(id)a3;
- (void)sessionErrorEventWithReason:(NSError *)a3 completionHandler:(id)a4;
@end

@implementation CredentialSession

- (void)presentmentAssertionTimeoutWithError:(NSError *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ECBA58;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECBA60;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2451B6790((uint64_t)v9, (uint64_t)&unk_268ECBA68, (uint64_t)v14);
  swift_release();
}

- (void)installationCompletedWithCredentials:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ECBA10;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECBA18;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2451B6790((uint64_t)v9, (uint64_t)&unk_268ECBA20, (uint64_t)v14);
  swift_release();
}

- (void)receivedHciDataWithData:(NSData *)a3 appletIdentifier:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ECB9D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ECB9E0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2451B6790((uint64_t)v11, (uint64_t)&unk_268ECB9E8, (uint64_t)v16);
  swift_release();
}

- (void)rfFieldChanged:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ECB9A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECB9A8;
  v14[5] = v13;
  swift_retain();
  sub_2451B6790((uint64_t)v9, (uint64_t)&unk_268ECB9B0, (uint64_t)v14);
  swift_release();
}

- (void)sessionErrorEventWithReason:(NSError *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_24519E6AC(&qword_268ECB7C8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2451BEEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ECB940;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECB950;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2451B6790((uint64_t)v9, (uint64_t)&unk_268ECB960, (uint64_t)v14);
  swift_release();
}

- (void)sessionEndedWithError:(id)a3
{
  swift_retain();
  id v4 = a3;
  sub_2451B5E94(a3);
  swift_release();
}

@end
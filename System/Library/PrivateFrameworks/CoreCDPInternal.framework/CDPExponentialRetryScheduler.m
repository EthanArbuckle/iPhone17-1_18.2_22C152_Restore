@interface CDPExponentialRetryScheduler
- (_TtC15CoreCDPInternal28CDPExponentialRetryScheduler)init;
- (void)retryFetchAccountInfo:(SecureBackup *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5;
- (void)retryFetchAllEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5;
- (void)retryFetchEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5;
- (void)retrySilentAuthWithAuthContext:(AKAppleIDAuthenticationContext *)a3 completionHandler:(id)a4;
@end

@implementation CDPExponentialRetryScheduler

- (void)retryFetchEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2186D1B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267BD7DA8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267BD7DB0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2186BB540((uint64_t)v11, (uint64_t)&unk_267BD7DB8, (uint64_t)v16);
  swift_release();
}

- (void)retryFetchAllEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2186D1B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267BD7D80;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267BD7D88;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2186BB540((uint64_t)v11, (uint64_t)&unk_267BD7D90, (uint64_t)v16);
  swift_release();
}

- (void)retryFetchAccountInfo:(SecureBackup *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2186D1B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267BD7D60;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267BD7D68;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2186BB540((uint64_t)v11, (uint64_t)&unk_267BD7D70, (uint64_t)v16);
  swift_release();
}

- (void)retrySilentAuthWithAuthContext:(AKAppleIDAuthenticationContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2186D1B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BD7D18;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BD7C98;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2186BB540((uint64_t)v9, (uint64_t)&unk_267BD7CA0, (uint64_t)v14);
  swift_release();
}

- (_TtC15CoreCDPInternal28CDPExponentialRetryScheduler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return [(CDPExponentialRetryScheduler *)&v3 init];
}

@end
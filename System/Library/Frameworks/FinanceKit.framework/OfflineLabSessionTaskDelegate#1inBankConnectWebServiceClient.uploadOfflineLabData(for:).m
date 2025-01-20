@interface OfflineLabSessionTaskDelegate#1inBankConnectWebServiceClient.uploadOfflineLabData(for:)
- (_TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate)init;
- (void)URLSession:()for: task:didCompleteWithError:;
- (void)URLSession:()for: task:needNewBodyStream:;
@end

@implementation OfflineLabSessionTaskDelegate#1inBankConnectWebServiceClient.uploadOfflineLabData(for:)

- (void)URLSession:()for: task:didCompleteWithError:
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_2438DCACC(v9, a5);
}

- (void)URLSession:()for: task:needNewBodyStream:
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268DA2C48;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268DA2C50;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_243937CA0((uint64_t)v11, (uint64_t)&unk_268D9CA90, (uint64_t)v16);
  swift_release();
}

- (_TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate)init
{
  result = (_TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate_inputStream));
  v3 = (char *)self
     + OBJC_IVAR____TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268DA2C60);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
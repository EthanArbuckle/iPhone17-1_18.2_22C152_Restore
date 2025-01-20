@interface BankConnectMerchantLookupRequestSource
- (BOOL)containsSensitiveData;
- (BOOL)isRefund;
- (BOOL)isSettlement;
- (_TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource)init;
- (id)identifier;
- (id)mapsMerchantLookupRequest;
- (id)mapsURL;
- (int64_t)type;
@end

@implementation BankConnectMerchantLookupRequestSource

- (id)mapsMerchantLookupRequest
{
  v2 = self;
  v3 = (void *)sub_243AA8858();

  return v3;
}

- (id)mapsURL
{
  return 0;
}

- (BOOL)isSettlement
{
  uint64_t v3 = sub_243DF9660();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_243DF9B20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = self;
  sub_243DFA9D0();
  sub_243DF9B00();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v15 == *MEMORY[0x263F05938] || v15 == *MEMORY[0x263F05940] || v15 == *MEMORY[0x263F05950])
  {
LABEL_12:
    BOOL v18 = 0;
    goto LABEL_13;
  }
  if (v15 != *MEMORY[0x263F05948])
  {
    if (v15 != *MEMORY[0x263F05958]) {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    goto LABEL_12;
  }
  BOOL v18 = 1;
LABEL_13:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);

  return v18;
}

- (BOOL)isRefund
{
  return 0;
}

- (BOOL)containsSensitiveData
{
  return 1;
}

- (id)identifier
{
  uint64_t v3 = sub_243DFBEF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243DF9B20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  sub_243DFA9D0();
  sub_243DF9AD0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_243DFBE90();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  uint64_t v12 = (void *)sub_243DFE8E0();
  swift_bridgeObjectRelease();

  return v12;
}

- (int64_t)type
{
  return 0;
}

- (_TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource)init
{
  result = (_TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_input;
  uint64_t v4 = sub_243DFAA30();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_piiProcessor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12FinanceKitUI38BankConnectMerchantLookupRequestSource_deviceIdentityProvider);

  swift_release();
}

@end
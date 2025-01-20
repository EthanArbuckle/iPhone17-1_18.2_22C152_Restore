@interface BankConnectAuthorizationViewControllerProvider
+ (id)makeAuthorizationViewControllerFor:(id)a3 completion:(id)a4;
+ (id)makeConsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 completion:(id)a5;
+ (id)makeMismatchedAccountViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
+ (id)makeReconsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
- (_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider)init;
@end

@implementation BankConnectAuthorizationViewControllerProvider

+ (id)makeConsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for BankConnectAuthorizationFlowConfig(0);
  v9 = (int *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v28 - v13;
  v15 = _Block_copy(a5);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a3;
  id v18 = a4;
  sub_243DFED70();
  v19 = &v14[v9[8]];
  uint64_t v20 = sub_243DFAE90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  v21 = &v14[v9[9]];
  uint64_t v22 = *MEMORY[0x263F05E28];
  uint64_t v23 = sub_243DFAFE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v21, v22, v23);
  *(void *)&v14[v9[7]] = v17;
  sub_243AB4BD4((uint64_t)v14, (uint64_t)v12, type metadata accessor for BankConnectAuthorizationFlowConfig);
  id v24 = objc_allocWithZone((Class)type metadata accessor for BankConnectAuthorizationViewController(0));
  id v25 = v17;
  swift_retain();
  v26 = (void *)sub_243AB339C((uint64_t)v12, (uint64_t)sub_243AB4C9C, v16);
  swift_release();
  sub_243AB4C3C((uint64_t)v14, type metadata accessor for BankConnectAuthorizationFlowConfig);

  swift_release();

  return v26;
}

+ (id)makeReconsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  uint64_t v10 = type metadata accessor for BankConnectAuthorizationFlowConfig(0);
  uint64_t v11 = (int *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - v15;
  id v17 = _Block_copy(a6);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  sub_243DFED70();
  uint64_t v22 = &v16[v11[8]];
  uint64_t v23 = sub_243DFAE90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  id v24 = &v16[v11[9]];
  sub_243DFBED0();
  uint64_t v25 = *MEMORY[0x263F05E30];
  uint64_t v26 = sub_243DFAFE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v24, v25, v26);
  *(void *)&v16[v11[7]] = a3;
  sub_243AB4BD4((uint64_t)v16, (uint64_t)v14, type metadata accessor for BankConnectAuthorizationFlowConfig);
  id v27 = objc_allocWithZone((Class)type metadata accessor for BankConnectAuthorizationViewController(0));
  id v28 = v19;
  swift_retain();
  v29 = (void *)sub_243AB339C((uint64_t)v14, (uint64_t)sub_243AB4C9C, v18);
  swift_release();
  sub_243AB4C3C((uint64_t)v16, type metadata accessor for BankConnectAuthorizationFlowConfig);

  swift_release();

  return v29;
}

+ (id)makeMismatchedAccountViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void *)sub_243AB35B0(v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)sub_243AB4C9C, v10);

  swift_release();

  return v14;
}

+ (id)makeAuthorizationViewControllerFor:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  uint64_t v8 = (void *)sub_243AB3784(v7, (uint64_t)sub_243AB4AD8, v6);

  swift_release();

  return v8;
}

- (_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAuthorizationViewControllerProvider();
  return [(BankConnectAuthorizationViewControllerProvider *)&v3 init];
}

@end
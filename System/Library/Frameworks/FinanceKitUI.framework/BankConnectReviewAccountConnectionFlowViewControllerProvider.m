@interface BankConnectReviewAccountConnectionFlowViewControllerProvider
+ (id)makeViewControllerWithInstitution:(id)a3 paymentPass:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
- (_TtC12FinanceKitUI60BankConnectReviewAccountConnectionFlowViewControllerProvider)init;
@end

@implementation BankConnectReviewAccountConnectionFlowViewControllerProvider

+ (id)makeViewControllerWithInstitution:(id)a3 paymentPass:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  uint64_t v10 = type metadata accessor for BankConnectReviewAccountConnectionFlowView();
  v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_243DFBEF0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a6);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  sub_243DFBED0();
  objc_allocWithZone((Class)type metadata accessor for BankConnectReviewAccountConnectionFlowViewController());
  id v20 = a4;
  id v21 = a3;
  id v26 = a5;
  swift_retain();
  sub_243DFED70();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(&v13[v11[7]], v17, v14);
  *(void *)&v13[v11[8]] = v20;
  v22 = (uint64_t (**)(char))&v13[v11[9]];
  *v22 = sub_243A81A6C;
  v22[1] = (uint64_t (*)(char))v19;
  v23 = (void *)sub_243DFD060();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

  swift_release();

  return v23;
}

- (_TtC12FinanceKitUI60BankConnectReviewAccountConnectionFlowViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectReviewAccountConnectionFlowViewControllerProvider();
  return [(BankConnectReviewAccountConnectionFlowViewControllerProvider *)&v3 init];
}

@end
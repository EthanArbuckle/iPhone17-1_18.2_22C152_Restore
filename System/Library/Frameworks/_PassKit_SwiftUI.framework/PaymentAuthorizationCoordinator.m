@interface PaymentAuthorizationCoordinator
- (_TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator)init;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didChangeCouponCode:(NSString *)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didRequestMerchantSessionUpdate:(id)a4;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectPaymentMethod:(PKPaymentMethod *)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingContact:(PKContact *)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingMethod:(PKShippingMethod *)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)paymentAuthorizationControllerWillAuthorizePayment:(id)a3;
@end

@implementation PaymentAuthorizationCoordinator

- (_TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator)init
{
  result = (_TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request));
  swift_release();
  sub_23CA25258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested));
  sub_23CA25258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator);
}

- (void)paymentAuthorizationControllerWillAuthorizePayment:(id)a3
{
  v4 = *(void (**)(void *))((char *)&self->super.isa
                                       + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  memset(v7, 0, sizeof(v7));
  id v5 = a3;
  v6 = self;
  v4(v7);
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = *(void (**)(void *))((char *)&self->super.isa
                                        + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  v14[0] = a4;
  v14[1] = sub_23CA38B4C;
  v14[2] = v9;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v10(v14);

  swift_release();
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23CA33CD0();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didRequestMerchantSessionUpdate:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268BC3550;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  void v14[3] = 0;
  v14[4] = &unk_268BC3558;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23CA37854((uint64_t)v9, (uint64_t)&unk_268BC3560, (uint64_t)v14);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectPaymentMethod:(PKPaymentMethod *)a4 handler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268BC3528;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268BC3530;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23CA37854((uint64_t)v11, (uint64_t)&unk_268BC3538, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingContact:(PKContact *)a4 handler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268BC3500;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268BC3508;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23CA37854((uint64_t)v11, (uint64_t)&unk_268BC3510, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingMethod:(PKShippingMethod *)a4 handler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268BC34D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268BC34E0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23CA37854((uint64_t)v11, (uint64_t)&unk_268BC34E8, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didChangeCouponCode:(NSString *)a4 handler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268BC3458;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268BC3468;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23CA37854((uint64_t)v11, (uint64_t)&unk_268BC3478, (uint64_t)v16);
  swift_release();
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow));
}

@end
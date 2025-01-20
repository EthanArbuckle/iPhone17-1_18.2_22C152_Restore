@interface IMBApplePayManager
- (BCApplePayManagerDelegate)delegate;
- (_TtC8Business18IMBApplePayManager)init;
- (id)message;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (int64_t)applePayStatus;
- (void)extendApplePayTimeout;
- (void)handlePaymentAuthorizationRetryWithTimer:(id)a3;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)presentApplePayWithWindow:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IMBApplePayManager

- (BCApplePayManagerDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BCApplePayManagerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (id)message
{
  v2 = self;
  id v3 = IMBApplePayManager.message()();

  return v3;
}

- (int64_t)applePayStatus
{
  v2 = self;
  int64_t v3 = IMBApplePayManager.applePayStatus()();

  return v3;
}

- (void)presentApplePayWithWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.super.isa = (Class)a3;
  IMBApplePayManager.presentApplePay(with:)(v9);
}

- (void)extendApplePayTimeout
{
  v2 = self;
  sub_100025E2C();
}

- (void)handlePaymentAuthorizationRetryWithTimer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100025FB8(v4);
}

- (_TtC8Business18IMBApplePayManager)init
{
  result = (_TtC8Business18IMBApplePayManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate);
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_httpClientFactory);
  swift_release();

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business18IMBApplePayManager_authorizePaymentRetryTimer));
  sub_10002A810(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Business18IMBApplePayManager_paymentAuthorizedCompletion));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business18IMBApplePayManager_paymentAuthorizationController));
  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business18IMBApplePayManager_window);
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  IMBApplePayManager.paymentAuthorizationControllerDidFinish(_:)((PKPaymentAuthorizationController)v4);
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10002750C(v9, v10, (char *)v11, v8);
  _Block_release(v8);
}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Business18IMBApplePayManager_window));
}

@end
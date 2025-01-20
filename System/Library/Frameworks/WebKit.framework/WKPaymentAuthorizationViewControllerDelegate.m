@interface WKPaymentAuthorizationViewControllerDelegate
- (WKPaymentAuthorizationViewControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4;
- (void)_getPaymentServicesMerchantURL:(id)a3;
- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewController:(id)a3 didRequestMerchantSession:(id)a4;
- (void)paymentAuthorizationViewController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewController:(id)a3 willFinishWithError:(id)a4;
@end

@implementation WKPaymentAuthorizationViewControllerDelegate

- (WKPaymentAuthorizationViewControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WKPaymentAuthorizationViewControllerDelegate;
  return (WKPaymentAuthorizationViewControllerDelegate *)[(WKPaymentAuthorizationDelegate *)&v5 _initWithRequest:a3 presenter:a4];
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
  objc_super v5 = (void *)((uint64_t (*)(WKPaymentAuthorizationViewControllerDelegate *, SEL))*MEMORY[0x1E4FB6450])(self, a2);
  uint64_t v6 = [self->super._request.m_ptr APIType];

  [v5 paymentServicesMerchantURLForAPIType:v6 completion:a3];
}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationViewController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationViewController:(id)a3 willFinishWithError:(id)a4
{
}

- (void)paymentAuthorizationViewController:(id)a3 didRequestMerchantSession:(id)a4
{
}

@end
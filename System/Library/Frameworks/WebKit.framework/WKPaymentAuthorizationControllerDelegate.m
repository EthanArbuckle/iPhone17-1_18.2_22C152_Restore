@interface WKPaymentAuthorizationControllerDelegate
- (WKPaymentAuthorizationControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (void)_getPaymentServicesMerchantURL:(id)a3;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didRequestMerchantSession:(id)a4;
- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4;
@end

@implementation WKPaymentAuthorizationControllerDelegate

- (WKPaymentAuthorizationControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WKPaymentAuthorizationControllerDelegate;
  v5 = -[WKPaymentAuthorizationDelegate _initWithRequest:presenter:](&v8, sel__initWithRequest_presenter_, a3);
  if (v5)
  {
    v6 = (void *)(*(uint64_t (**)(void, void *))(**((void **)a4 + 2) + 72))(*((void *)a4 + 2), a4);
    objc_storeWeak((id *)&v5->_presentingWindow, v6);
  }
  return v5;
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
  v5 = (uint64_t (**)(void))MEMORY[0x1E4FB6428];
  ((void (*)(WKPaymentAuthorizationControllerDelegate *, SEL))*MEMORY[0x1E4FB6428])(self, a2);
  char v6 = objc_opt_respondsToSelector();
  v7 = (uint64_t (**)(void))MEMORY[0x1E4FB6450];
  if (v6) {
    v7 = v5;
  }
  objc_super v8 = (void *)(*v7)();
  uint64_t v9 = [self->super._request.m_ptr APIType];

  [v8 paymentServicesMerchantURLForAPIType:v9 completion:a3];
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_loadWeak((id *)&self->_presentingWindow);
}

- (void)paymentAuthorizationController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
}

- (void)paymentAuthorizationController:(id)a3 didRequestMerchantSession:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
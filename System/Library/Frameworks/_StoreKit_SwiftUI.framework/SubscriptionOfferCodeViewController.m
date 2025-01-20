@interface SubscriptionOfferCodeViewController
- (SubscriptionOfferCodeViewController)initWithParameters:(id)a3;
- (SubscriptionOfferCodeViewControllerDelegate)delegate;
- (void)_displayOfferViewIfNecessary;
- (void)onDismiss;
- (void)setDelegate:(id)a3;
- (void)showOfferUIWithParameters:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SubscriptionOfferCodeViewController

- (SubscriptionOfferCodeViewController)initWithParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SubscriptionOfferCodeViewController;
  v6 = [(SubscriptionOfferCodeViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v7->_didShowOffer = 0;
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SubscriptionOfferCodeViewController;
  [(SubscriptionOfferCodeViewController *)&v4 viewDidAppear:a3];
  [(SubscriptionOfferCodeViewController *)self _displayOfferViewIfNecessary];
}

- (void)_displayOfferViewIfNecessary
{
  if (!self->_didShowOffer)
  {
    self->_didShowOffer = 1;
    [(SubscriptionOfferCodeViewController *)self showOfferUIWithParameters:self->_parameters];
  }
}

- (void)onDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didDismissOfferSheet];
}

- (SubscriptionOfferCodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SubscriptionOfferCodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)showOfferUIWithParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_22EE7F7F0();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_22ECDE7A8(v4);

  swift_bridgeObjectRelease();
}

@end
@interface AMSPurchaseQueueConfiguration
- (AMSBagProtocol)bag;
- (AMSPurchaseQueueConfiguration)initWithBag:(id)a3;
- (AMSPurchaseResponseProtocol)delegate;
- (Class)purchaseTaskClass;
- (void)setDelegate:(id)a3;
- (void)setPurchaseTaskClass:(Class)a3;
@end

@implementation AMSPurchaseQueueConfiguration

- (AMSPurchaseQueueConfiguration)initWithBag:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseQueueConfiguration;
  v6 = [(AMSPurchaseQueueConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    uint64_t v8 = objc_opt_class();
    Class purchaseTaskClass = v7->_purchaseTaskClass;
    v7->_Class purchaseTaskClass = (Class)v8;
  }
  return v7;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSPurchaseResponseProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (Class)purchaseTaskClass
{
  return self->_purchaseTaskClass;
}

- (void)setPurchaseTaskClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseTaskClass, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
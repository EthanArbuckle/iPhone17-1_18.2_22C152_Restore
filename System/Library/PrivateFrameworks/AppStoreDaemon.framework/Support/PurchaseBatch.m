@interface PurchaseBatch
@end

@implementation PurchaseBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseItems, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
}

@end
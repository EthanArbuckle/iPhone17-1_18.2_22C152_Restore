@interface PurchaseHistoryHideShowRequestContext
@end

@implementation PurchaseHistoryHideShowRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
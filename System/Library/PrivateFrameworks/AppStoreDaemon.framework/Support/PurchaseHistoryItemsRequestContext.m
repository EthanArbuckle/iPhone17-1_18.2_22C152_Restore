@interface PurchaseHistoryItemsRequestContext
@end

@implementation PurchaseHistoryItemsRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_knownApps, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_requestingAccount, 0);
}

@end
@interface PurchaseHistoryUpdateRequestContext
@end

@implementation PurchaseHistoryUpdateRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_requestingAccount, 0);
}

@end
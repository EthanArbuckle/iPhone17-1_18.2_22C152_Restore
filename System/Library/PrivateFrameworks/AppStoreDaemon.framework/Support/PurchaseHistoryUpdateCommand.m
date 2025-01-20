@interface PurchaseHistoryUpdateCommand
@end

@implementation PurchaseHistoryUpdateCommand

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_serverRevision, 0);
  objc_storeStrong((id *)&self->_expectedItemID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
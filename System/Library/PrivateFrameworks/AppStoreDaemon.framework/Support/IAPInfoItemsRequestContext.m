@interface IAPInfoItemsRequestContext
@end

@implementation IAPInfoItemsRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_knownIAPs, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
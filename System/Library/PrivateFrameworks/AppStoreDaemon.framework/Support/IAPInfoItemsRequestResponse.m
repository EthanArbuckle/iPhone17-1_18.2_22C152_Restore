@interface IAPInfoItemsRequestResponse
@end

@implementation IAPInfoItemsRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_removedIAPs, 0);
  objc_storeStrong((id *)&self->_addedIAPs, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
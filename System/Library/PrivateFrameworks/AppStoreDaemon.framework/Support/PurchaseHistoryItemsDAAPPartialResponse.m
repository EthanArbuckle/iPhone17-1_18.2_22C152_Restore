@interface PurchaseHistoryItemsDAAPPartialResponse
@end

@implementation PurchaseHistoryItemsDAAPPartialResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppItemIDs, 0);
  objc_storeStrong((id *)&self->_addedApps, 0);
}

@end
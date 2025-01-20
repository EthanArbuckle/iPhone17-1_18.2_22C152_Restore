@interface StoreItemResponse
@end

@implementation StoreItemResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skanTokenDictionary, 0);
  objc_storeStrong((id *)&self->_installAttributionErrorString, 0);
  objc_storeStrong((id *)&self->_installAttributionPingbackFetchURLString, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clusterMappings, 0);
  objc_storeStrong((id *)&self->_anonymousPings, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_itemErrors, 0);
}

@end
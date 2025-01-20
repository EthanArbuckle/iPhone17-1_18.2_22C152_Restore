@interface GCConfigurationAssetManagementServiceConnection
+ (id)serviceProtocol;
- (id)assets;
- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5;
- (id)currentAsset:(BOOL)a3;
- (id)lastUpdateDate;
@end

@implementation GCConfigurationAssetManagementServiceConnection

+ (id)serviceProtocol
{
  return &unk_26BEE7B48;
}

- (id)assets
{
  return [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:@"Assets" handler:&__block_literal_global_151];
}

void __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke_2;
  v5[3] = &unk_26BEC4908;
  id v6 = a3;
  id v4 = v6;
  [a2 assetsWithReply:v5];
}

uint64_t __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)currentAsset:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke;
  v5[3] = &__block_descriptor_33_e81_v24__0___GCConfigurationAssetManagementServiceXPCInterface__8___v_____NSError__16l;
  BOOL v6 = a3;
  v3 = [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:@"Current Asset" handler:v5];

  return v3;
}

void __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke_2;
  v8[3] = &unk_26BEC4930;
  id v9 = v5;
  id v7 = v5;
  [a2 currentAsset:v6 withReply:v8];
}

uint64_t __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)lastUpdateDate
{
  return [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:@"Last Update Date" handler:&__block_literal_global_162];
}

void __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke_2;
  v5[3] = &unk_26BEC4978;
  id v6 = a3;
  id v4 = v6;
  [a2 lastUpdateDateWithReply:v5];
}

uint64_t __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v10 = [(GCConfigXPCServiceServiceConnection *)self serviceVendor];
  v11 = [v10 checkForNewAssets:v6 forceCatalogRefresh:v5 reply:v8];

  return v11;
}

@end
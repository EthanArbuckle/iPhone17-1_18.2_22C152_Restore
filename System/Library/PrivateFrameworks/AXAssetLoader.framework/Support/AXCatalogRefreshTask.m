@interface AXCatalogRefreshTask
- (AXCatalogRefreshTask)initWithPolicy:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5;
- (NSNumber)overrideTimeout;
- (void)_refreshCatalog:(BOOL)a3;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)setOverrideTimeout:(id)a3;
@end

@implementation AXCatalogRefreshTask

- (AXCatalogRefreshTask)initWithPolicy:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003648;
  v7[3] = &unk_1000207C0;
  BOOL v8 = a4;
  v6.receiver = self;
  v6.super_class = (Class)AXCatalogRefreshTask;
  return [(AXManagedAssetTask *)&v6 initWithName:@"Catalog Refresh" policy:a3 context:a5 block:v7];
}

- (void)_refreshCatalog:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      CFStringRef v6 = @"force-update";
    }
    else {
      CFStringRef v6 = @"attempt to update";
    }
    v7 = [(AXCatalogRefreshTask *)self overrideTimeout];
    int v11 = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCatalogRefreshTask: Will %@ catalog now. timeout=%@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v8 = [(AXManagedAssetTask *)self assetController];
  v9 = [(AXCatalogRefreshTask *)self overrideTimeout];
  [v8 refreshAssetsByForceUpdatingCatalog:v3 updatingCatalogIfNeeded:v3 ^ 1 catalogRefreshOverrideTimeout:v9 completion:0];

  v10 = [(AXManagedAssetTask *)self assetController];
  [v10 addObserver:self];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
}

- (NSNumber)overrideTimeout
{
  return self->_overrideTimeout;
}

- (void)setOverrideTimeout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
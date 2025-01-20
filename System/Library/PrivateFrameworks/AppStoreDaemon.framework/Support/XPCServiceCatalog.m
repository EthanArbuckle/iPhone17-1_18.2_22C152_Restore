@interface XPCServiceCatalog
@end

@implementation XPCServiceCatalog

- (void).cxx_destruct
{
  objc_storeStrong(&self->_UpdatesServiceProvider, 0);
  objc_storeStrong(&self->_TestFlightServiceProvider, 0);
  objc_storeStrong(&self->_StoreKitExternalNotificationServiceProvider, 0);
  objc_storeStrong(&self->_skannerServiceProvider, 0);
  objc_storeStrong(&self->_RestoreServiceProvider, 0);
  objc_storeStrong(&self->_RepairServiceProvider, 0);
  objc_storeStrong(&self->_PurchaseServiceProvider, 0);
  objc_storeStrong(&self->_PurchaseHistoryServiceProvider, 0);
  objc_storeStrong(&self->_PersonalizationServiceProvider, 0);
  objc_storeStrong(&self->_OcelotServiceProvider, 0);
  objc_storeStrong(&self->_ManagedAppServiceProvider, 0);
  objc_storeStrong(&self->_MetricsServiceProvider, 0);
  objc_storeStrong(&self->_libraryServiceProvider, 0);
  objc_storeStrong(&self->_skanInteropServiceProvider, 0);
  objc_storeStrong(&self->_installWebAttributionServiceProvider, 0);
  objc_storeStrong(&self->_installAttributionServiceProvider, 0);
  objc_storeStrong(&self->_installationServiceProvider, 0);
  objc_storeStrong(&self->_IAPHistoryServiceProvider, 0);
  objc_storeStrong(&self->_fairPlayServiceProvider, 0);
  objc_storeStrong(&self->_CrossfireServiceProvider, 0);
  objc_storeStrong(&self->_ClipServiceProvider, 0);
  objc_storeStrong(&self->_appCapabilitiesServiceProvider, 0);
  objc_storeStrong(&self->_diagnosticServiceProvider, 0);
  objc_storeStrong(&self->_AppStoreServiceProvider, 0);
}

@end
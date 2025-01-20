@interface XPCServiceClient
- (AMSProcessInfo)processInfo;
- (ASDSupportedDialogHandlers)supportedDialogHandlers;
- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverNotifications:(id)a3 withBarrierBlock:(id)a4;
- (void)deliverProgress:(id)a3 withBarrierBlock:(id)a4;
- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)getAppCapabilitiesServiceWithReplyHandler:(id)a3;
- (void)getAppStoreServiceWithReplyHandler:(id)a3;
- (void)getClipServiceWithReplyHandler:(id)a3;
- (void)getCrossfireServiceWithReplyHandler:(id)a3;
- (void)getDiagnosticServiceWithReplyHandler:(id)a3;
- (void)getFairPlayServiceWithReplyHandler:(id)a3;
- (void)getIAPHistoryServiceWithReplyHandler:(id)a3;
- (void)getInstallAttributionServiceWithReplyHandler:(id)a3;
- (void)getInstallWebAttributionServiceWithReplyHandler:(id)a3;
- (void)getInstallationServiceWithReplyHandler:(id)a3;
- (void)getLibraryServiceWithReplyHandler:(id)a3;
- (void)getManagedAppServiceWithReplyHandler:(id)a3;
- (void)getMetricsServiceWithReplyHandler:(id)a3;
- (void)getOcelotServiceWithReplyHandler:(id)a3;
- (void)getPersonalizationServiceWithReplyHandler:(id)a3;
- (void)getPurchaseHistoryServiceWithReplyHandler:(id)a3;
- (void)getPurchaseServiceWithReplyHandler:(id)a3;
- (void)getRepairServiceWithReplyHandler:(id)a3;
- (void)getRestoreServiceWithReplyHandler:(id)a3;
- (void)getSKANInteropServiceWithReplyHandler:(id)a3;
- (void)getSkannerServiceWithReplyHandler:(id)a3;
- (void)getStoreKitExternalNotificationServiceWithReplyHandler:(id)a3;
- (void)getTestFlightFeedbackServiceWithReplyHandler:(id)a3;
- (void)getUpdatesServiceWithReplyHandler:(id)a3;
- (void)setSupportedNotificationDelivery:(id)a3;
@end

@implementation XPCServiceClient

- (void)setSupportedNotificationDelivery:(id)a3
{
  v4 = (ASDSupportedDialogHandlers *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedDialogHandlers = obj->_supportedDialogHandlers;
  obj->_supportedDialogHandlers = v4;

  objc_sync_exit(obj);
}

- (void)getPurchaseHistoryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 136, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_100019760((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getLibraryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10000AF5C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getIAPHistoryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 56, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10000B040((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getAppStoreServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 8, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_100013E9C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getUpdatesServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 192, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_1000154DC((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)objc_getProperty(self, a2, 64, 1);
}

- (void)getAppCapabilitiesServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 24, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026B630((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getClipServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026B70C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getDiagnosticServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026B554((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getFairPlayServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026B8C4((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getInstallationServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 64, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BA30((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getInstallAttributionServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BB0C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getInstallWebAttributionServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 80, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BBE8((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getSKANInteropServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BCC4((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getCrossfireServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026B7E8((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getManagedAppServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 112, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BF0C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getOcelotServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 120, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BF58((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getMetricsServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 104, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026BE30((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getPurchaseServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 144, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C1A0((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getRepairServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 152, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C27C((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getRestoreServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 160, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C358((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getSkannerServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 168, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C434((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getStoreKitExternalNotificationServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 176, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C510((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)getTestFlightFeedbackServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 184, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C5EC((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D526C;
  v11[3] = &unk_100521898;
  id v12 = v6;
  id v9 = v6;
  id v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v11];
  [v10 deliverAlertPresentationRequest:v7 resultHandler:v9];
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D5360;
  v11[3] = &unk_100521898;
  id v12 = v6;
  id v9 = v6;
  id v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v11];
  [v10 deliverAuthenticateRequest:v7 withResultHandler:v9];
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D5454;
  v11[3] = &unk_100521898;
  id v12 = v6;
  id v9 = v6;
  id v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v11];
  [v10 deliverDialogRequest:v7 withResultHandler:v9];
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D5548;
  v11[3] = &unk_100521898;
  id v12 = v6;
  id v9 = v6;
  id v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v11];
  [v10 deliverEngagementRequest:v7 withResultHandler:v9];
}

- (void)deliverNotifications:(id)a3 withBarrierBlock:(id)a4
{
  p_connection = &self->_connection;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v9 = [WeakRetained _unboostingRemoteObjectProxy];
  [v9 deliverNotifications:v7];

  id v10 = objc_loadWeakRetained((id *)p_connection);
  [v10 addBarrierBlock:v6];
}

- (void)deliverProgress:(id)a3 withBarrierBlock:(id)a4
{
  p_connection = &self->_connection;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v9 = [WeakRetained _unboostingRemoteObjectProxy];
  [v9 deliverProgress:v7];

  id v10 = objc_loadWeakRetained((id *)p_connection);
  [v10 addBarrierBlock:v6];
}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D5784;
  v11[3] = &unk_100521898;
  id v12 = v6;
  id v9 = v6;
  id v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v11];
  [v10 deliverViewPresentationRequest:v7 resultHandler:v9];
}

- (ASDSupportedDialogHandlers)supportedDialogHandlers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedDialogHandlers;
  objc_sync_exit(v2);

  return v3;
}

- (void)getPersonalizationServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 128, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v8 = (void *)sub_10026C034((uint64_t)self->_catalog);
  sub_100014F54((uint64_t)self, v10, v8, v9, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_supportedDialogHandlers, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_enableDiagnostics, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
}

@end
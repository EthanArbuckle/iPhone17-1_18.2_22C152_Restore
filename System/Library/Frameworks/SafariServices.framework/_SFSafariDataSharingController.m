@interface _SFSafariDataSharingController
+ (id)sharedController;
- (_SFSafariDataSharingController)init;
- (id)systemDataContainerURLWithAppBundleID:(id)a3;
- (void)_loadAppBundlesWithSeparateDataIfNeeded;
- (void)checkInAppBundleIDIfNeeded:(id)a3;
- (void)clearAllWebsitesData;
@end

@implementation _SFSafariDataSharingController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1) {
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_59);
  }
  v2 = (void *)sharedController_sharedController_0;

  return v2;
}

- (_SFSafariDataSharingController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SFSafariDataSharingController;
  v2 = [(_SFSafariDataSharingController *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SafariServices.SafariDataSharing", 0);
    dataSharingQueue = v2->_dataSharingQueue;
    v2->_dataSharingQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)systemDataContainerURLWithAppBundleID:(id)a3
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a3];
  v4 = [v3 dataContainerURL];
  v5 = [v4 URLByAppendingPathComponent:@"/SystemData/com.apple.SafariViewService"];

  return v5;
}

- (void)_loadAppBundlesWithSeparateDataIfNeeded
{
  if (!self->_appBundlesWithSeparateData)
  {
    dispatch_queue_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v4 = [v3 arrayForKey:@"AppBundleIDsWithSeperateData"];
    v5 = (NSMutableArray *)[v4 mutableCopy];
    appBundlesWithSeparateData = self->_appBundlesWithSeparateData;
    self->_appBundlesWithSeparateData = v5;

    if (!self->_appBundlesWithSeparateData)
    {
      objc_super v7 = [MEMORY[0x1E4F1CA48] array];
      v8 = self->_appBundlesWithSeparateData;
      self->_appBundlesWithSeparateData = v7;
    }
  }
}

- (void)checkInAppBundleIDIfNeeded:(id)a3
{
  id v4 = a3;
  dataSharingQueue = self->_dataSharingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke;
  v7[3] = &unk_1E5C72238;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dataSharingQueue, v7);
}

- (void)clearAllWebsitesData
{
  dataSharingQueue = self->_dataSharingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___SFSafariDataSharingController_clearAllWebsitesData__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(dataSharingQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundlesWithSeparateData, 0);

  objc_storeStrong((id *)&self->_dataSharingQueue, 0);
}

@end
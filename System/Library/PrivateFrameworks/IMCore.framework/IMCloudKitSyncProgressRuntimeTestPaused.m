@interface IMCloudKitSyncProgressRuntimeTestPaused
- (void)willUpdateSyncState:(id)a3;
@end

@implementation IMCloudKitSyncProgressRuntimeTestPaused

- (void)willUpdateSyncState:(id)a3
{
  id v9 = a3;
  objc_msgSend_setIMCloudKitSyncDate_(v9, v3, 0, v4);
  objc_msgSend_setIMCloudKitSyncPaused_(v9, v5, 1, v6);
  objc_msgSend_setIMCloudKitIsSyncing_(v9, v7, 0, v8);
}

@end
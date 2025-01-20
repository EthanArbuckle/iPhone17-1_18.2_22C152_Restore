@interface IMCloudKitSyncProgressRuntimeTestDeleting
- (void)willUpdateSyncState:(id)a3;
@end

@implementation IMCloudKitSyncProgressRuntimeTestDeleting

- (void)willUpdateSyncState:(id)a3
{
  id v9 = a3;
  objc_msgSend_setIMCloudKitSyncDate_(v9, v3, 0, v4);
  objc_msgSend_setIMCloudKitSyncControllerSyncState_(v9, v5, 3, v6);
  objc_msgSend_setIMCloudKitSyncControllerSyncRecordType_(v9, v7, 1, v8);
}

@end
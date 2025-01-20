@interface IMCloudKitSyncProgressRuntimeTestUploading
- (void)setUp;
- (void)willUpdateSyncState:(id)a3;
@end

@implementation IMCloudKitSyncProgressRuntimeTestUploading

- (void)setUp
{
  v10.receiver = self;
  v10.super_class = (Class)IMCloudKitSyncProgressRuntimeTestUploading;
  [(IMCloudKitSyncProgressRuntimeTest *)&v10 setUp];
  objc_msgSend_setProgressRescheduleDelay_(self, v3, v4, v5, 0.0);
  objc_msgSend_setProgressCount_(self, v6, 0, v7);
  objc_msgSend_setMaxProgressCount_(self, v8, 5, v9);
}

- (void)willUpdateSyncState:(id)a3
{
  id v9 = a3;
  objc_msgSend_setIMCloudKitSyncDate_(v9, v3, 0, v4);
  objc_msgSend_setIMCloudKitSyncControllerSyncState_(v9, v5, 4, v6);
  objc_msgSend_setIMCloudKitSyncControllerSyncRecordType_(v9, v7, 1, v8);
}

@end
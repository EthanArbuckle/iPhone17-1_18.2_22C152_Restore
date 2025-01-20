@interface IMDCKBackupControllerProxy
+ (id)sharedInstance;
- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3;
- (void)setFirstSyncDateToNow;
- (void)toggleiCloudBackupsIfNeeded:(id)a3;
@end

@implementation IMDCKBackupControllerProxy

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D974B308;
  block[3] = &unk_1E6B72BE8;
  block[4] = a1;
  if (qword_1EBE2BA98 != -1) {
    dispatch_once(&qword_1EBE2BA98, block);
  }
  v2 = (void *)qword_1EBE2B988;

  return v2;
}

- (void)setFirstSyncDateToNow
{
  id v2 = +[IMDCKBackupController sharedInstance];
  [v2 setFirstSyncDateToNow];
}

- (void)toggleiCloudBackupsIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKBackupController sharedInstance];
  [v4 toggleiCloudBackupsIfNeeded:v3];
}

- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKBackupController sharedInstance];
  [v4 sendDeviceIDToCloudKitWithCompletion:v3];
}

@end
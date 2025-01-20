@interface CPSAppClipRecord
- (CPSAppClipRecord)initWithBundleID:(id)a3;
- (CPSAppClipRecord)initWithSQLiteRow:(id)a3 bundleID:(id)a4;
- (NSNumber)locationConfirmationGranted;
- (NSNumber)userNotificationGranted;
- (NSString)bundleID;
- (NSString)fullApplicationCaption;
- (NSString)fullApplicationName;
- (NSURL)fullApplicationStoreURL;
- (double)lastInstallTime;
- (double)lastProxCardLaunchTime;
- (double)lastVersionCheckTime;
- (id)debug_fullApplicationIcon;
- (int64_t)locationConfirmationState;
- (void)debug_setFullApplicationIcon:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setFullApplicationCaption:(id)a3;
- (void)setFullApplicationName:(id)a3;
- (void)setFullApplicationStoreURL:(id)a3;
- (void)setLastInstallTime:(double)a3;
- (void)setLastProxCardLaunchTime:(double)a3;
- (void)setLastVersionCheckTime:(double)a3;
- (void)setLocationConfirmationGranted:(id)a3;
- (void)setLocationConfirmationState:(int64_t)a3;
- (void)setUserNotificationGranted:(id)a3;
@end

@implementation CPSAppClipRecord

- (CPSAppClipRecord)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppClipRecord;
  v5 = [(CPSAppClipRecord *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CPSAppClipRecord)initWithSQLiteRow:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  v7 = [(CPSAppClipRecord *)self initWithBundleID:a4];
  if (v7)
  {
    v8 = [v6 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v7->_userNotificationGranted, v8);
    }
    v9 = [v6 objectAtIndex:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v7->_locationConfirmationGranted, v9);
    }
    v7->_locationConfirmationState = (int)[v6 intAtIndex:2];
    [v6 doubleAtIndex:3];
    v7->_lastProxCardLaunchTime = v10;
    [v6 doubleAtIndex:4];
    v7->_lastVersionCheckTime = v11;
    [v6 doubleAtIndex:5];
    v7->_lastInstallTime = v12;
    uint64_t v13 = [v6 stringAtIndex:6];
    fullApplicationName = v7->_fullApplicationName;
    v7->_fullApplicationName = (NSString *)v13;

    uint64_t v15 = [v6 stringAtIndex:7];
    fullApplicationCaption = v7->_fullApplicationCaption;
    v7->_fullApplicationCaption = (NSString *)v15;

    v17 = [v6 stringAtIndex:8];
    if (v17)
    {
      uint64_t v18 = [NSURL URLWithString:v17];
      fullApplicationStoreURL = v7->_fullApplicationStoreURL;
      v7->_fullApplicationStoreURL = (NSURL *)v18;
    }
    v20 = v7;
  }
  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)userNotificationGranted
{
  return self->_userNotificationGranted;
}

- (void)setUserNotificationGranted:(id)a3
{
}

- (NSNumber)locationConfirmationGranted
{
  return self->_locationConfirmationGranted;
}

- (void)setLocationConfirmationGranted:(id)a3
{
}

- (int64_t)locationConfirmationState
{
  return self->_locationConfirmationState;
}

- (void)setLocationConfirmationState:(int64_t)a3
{
  self->_locationConfirmationState = a3;
}

- (double)lastProxCardLaunchTime
{
  return self->_lastProxCardLaunchTime;
}

- (void)setLastProxCardLaunchTime:(double)a3
{
  self->_lastProxCardLaunchTime = a3;
}

- (double)lastVersionCheckTime
{
  return self->_lastVersionCheckTime;
}

- (void)setLastVersionCheckTime:(double)a3
{
  self->_lastVersionCheckTime = a3;
}

- (double)lastInstallTime
{
  return self->_lastInstallTime;
}

- (void)setLastInstallTime:(double)a3
{
  self->_lastInstallTime = a3;
}

- (NSString)fullApplicationName
{
  return self->_fullApplicationName;
}

- (void)setFullApplicationName:(id)a3
{
}

- (NSString)fullApplicationCaption
{
  return self->_fullApplicationCaption;
}

- (void)setFullApplicationCaption:(id)a3
{
}

- (NSURL)fullApplicationStoreURL
{
  return self->_fullApplicationStoreURL;
}

- (void)setFullApplicationStoreURL:(id)a3
{
}

- (id)debug_fullApplicationIcon
{
  return self->_debug_fullApplicationIcon;
}

- (void)debug_setFullApplicationIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debug_fullApplicationIcon, 0);
  objc_storeStrong((id *)&self->_fullApplicationStoreURL, 0);
  objc_storeStrong((id *)&self->_fullApplicationCaption, 0);
  objc_storeStrong((id *)&self->_fullApplicationName, 0);
  objc_storeStrong((id *)&self->_locationConfirmationGranted, 0);
  objc_storeStrong((id *)&self->_userNotificationGranted, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
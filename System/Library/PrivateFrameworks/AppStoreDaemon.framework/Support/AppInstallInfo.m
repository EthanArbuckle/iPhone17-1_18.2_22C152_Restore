@interface AppInstallInfo
- (AppInstallInfo)init;
- (void)dealloc;
@end

@implementation AppInstallInfo

- (AppInstallInfo)init
{
  return (AppInstallInfo *)sub_10041E360(self, &off_10054D290, &__NSDictionary0__struct);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AppInstallInfo;
  [(AppInstallInfo *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_terminationAssertion, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_coordinatorID, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_assetPromise, 0);
}

@end
@interface _CPLCloudKitUnregisteredClient
- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4;
- (NSString)cloudKitClientIdentifier;
- (NSString)defaultSourceBundleIdentifier;
- (_CPLCloudKitUnregisteredClient)initWithCloudKitClientIdentifier:(id)a3 defaultSourceBundleIdentifier:(id)a4;
- (id)interestingZoneIDsForCoordinator:(id)a3;
- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8;
- (void)coordinatorDidReceiveAPushNotification:(id)a3;
@end

@implementation _CPLCloudKitUnregisteredClient

- (_CPLCloudKitUnregisteredClient)initWithCloudKitClientIdentifier:(id)a3 defaultSourceBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CPLCloudKitUnregisteredClient;
  v8 = [(_CPLCloudKitUnregisteredClient *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@ (unregistered)", v6];
    cloudKitClientIdentifier = v8->_cloudKitClientIdentifier;
    v8->_cloudKitClientIdentifier = v9;

    v11 = (NSString *)[v7 copy];
    defaultSourceBundleIdentifier = v8->_defaultSourceBundleIdentifier;
    v8->_defaultSourceBundleIdentifier = v11;
  }
  return v8;
}

- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = +[NSAssertionHandler currentHandler];
  v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitCoordinator.m"];
  uint64_t v23 = objc_opt_class();
  v24 = NSStringFromSelector(a2);
  [v21 handleFailureInMethod:a2, self, v22, 786, @"-[%@ %@] should never be called", v23, v24 object file lineNumber description];

  abort();
}

- (void)coordinatorDidReceiveAPushNotification:(id)a3
{
  id v5 = a3;
  id v6 = +[NSAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitCoordinator.m"];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 790, @"-[%@ %@] should never be called", v8, v9 object file lineNumber description];

  abort();
}

- (id)interestingZoneIDsForCoordinator:(id)a3
{
  id v5 = a3;
  id v6 = +[NSAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitCoordinator.m"];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 794, @"-[%@ %@] should never be called", v8, v9 object file lineNumber description];

  abort();
}

- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSAssertionHandler currentHandler];
  v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitCoordinator.m"];
  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, v10, 798, @"-[%@ %@] should never be called", v11, v12 object file lineNumber description];

  abort();
}

- (NSString)cloudKitClientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)defaultSourceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudKitClientIdentifier, 0);
}

@end
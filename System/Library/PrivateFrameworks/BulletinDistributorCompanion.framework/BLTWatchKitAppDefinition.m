@interface BLTWatchKitAppDefinition
- (BLTWatchKitAppDefinition)initWithContainerBundleID:(id)a3 watchKitAppBundleID:(id)a4 isInstalled:(BOOL)a5 runsIndependently:(BOOL)a6;
- (BOOL)isInstalled;
- (BOOL)runsIndependently;
- (NSString)containerBundleID;
- (NSString)watchKitAppBundleID;
@end

@implementation BLTWatchKitAppDefinition

- (BLTWatchKitAppDefinition)initWithContainerBundleID:(id)a3 watchKitAppBundleID:(id)a4 isInstalled:(BOOL)a5 runsIndependently:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BLTWatchKitAppDefinition;
  v12 = [(BLTWatchKitAppDefinition *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    containerBundleID = v12->_containerBundleID;
    v12->_containerBundleID = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    watchKitAppBundleID = v12->_watchKitAppBundleID;
    v12->_watchKitAppBundleID = (NSString *)v15;

    v12->_isInstalled = a5;
    v12->_runsIndependently = a6;
  }

  return v12;
}

- (NSString)containerBundleID
{
  return self->_containerBundleID;
}

- (NSString)watchKitAppBundleID
{
  return self->_watchKitAppBundleID;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)runsIndependently
{
  return self->_runsIndependently;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchKitAppBundleID, 0);
  objc_storeStrong((id *)&self->_containerBundleID, 0);
}

@end
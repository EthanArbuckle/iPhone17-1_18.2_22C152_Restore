@interface DMCApplicationProxy
+ (BOOL)supportsSecureCoding;
+ (id)_allApplications;
+ (id)_bundlePathsForApplications:(id)a3;
+ (id)blockedApplications;
+ (id)bookIconForVariant:(unint64_t)a3;
+ (id)userApplications;
- (BOOL)_canNotBeHidden;
- (BOOL)_canNotBeLocked;
- (BOOL)_hasAppCellularSlice;
- (BOOL)_hasAppContentFilter;
- (BOOL)_hasAppDNSProxy;
- (BOOL)_hasAppRelay;
- (BOOL)_hasAppVPN;
- (BOOL)_hasAssociatedDomains;
- (BOOL)_hasManagedRestrictions;
- (BOOL)_isExcludedFromBackup;
- (BOOL)_isExcludedFromCloudSync;
- (BOOL)_isNotRemovable;
- (BOOL)_isTapToPayScreenLock;
- (BOOL)_isUnableToExportToUnmanaged;
- (BOOL)_isUnableToImportFromUnmanaged;
- (BOOL)_isUnableToUseCellData;
- (BOOL)_isUnableToUseRoamingCellData;
- (BOOL)_isUninstalledOnMDMRemoval;
- (BOOL)checkIsBlocked;
- (BOOL)isBetaApp;
- (BOOL)isBlocked;
- (BOOL)isInstalled;
- (BOOL)isUserApp;
- (DMCApplicationProxy)initWithBundleID:(id)a3 dataSource:(unint64_t)a4;
- (DMCApplicationProxy)initWithCoder:(id)a3;
- (DMCApplicationProxy)initWithLSApplicationProxy:(id)a3 dataSource:(unint64_t)a4;
- (DMCApplicationProxy)initWithLSApplicationRecord:(id)a3 dataSource:(unint64_t)a4;
- (LSApplicationProxy)lsApp;
- (NSData)misCDHash;
- (NSNumber)misHashType;
- (NSString)appIDEntitlement;
- (NSString)bundleID;
- (NSString)bundlePath;
- (NSString)cachedManagedAppConfigurationInfo;
- (NSString)name;
- (NSString)signerID;
- (id)_bridgeIconForVariant:(unint64_t)a3;
- (id)_circularImageFromImage:(id)a3 variant:(int)a4;
- (id)_lsIconDataForVariant:(unint64_t)a3 scale:(double)a4;
- (id)_managedAppAttribute:(id)a3;
- (id)iconForVariant:(unint64_t)a3;
- (id)managedAppConfigurationInfo;
- (id)misStateString;
- (unint64_t)dataSource;
- (unint64_t)misStateIncludingPending:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBlockedInfo:(id)a3;
- (void)setCachedManagedAppConfigurationInfo:(id)a3;
- (void)setDataSource:(unint64_t)a3;
- (void)setLsApp:(id)a3;
@end

@implementation DMCApplicationProxy

- (DMCApplicationProxy)initWithBundleID:(id)a3 dataSource:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v12 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to create LSApplicationRecord for bundleID %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  v10 = [(DMCApplicationProxy *)self initWithLSApplicationRecord:v7 dataSource:a4];

  return v10;
}

- (DMCApplicationProxy)initWithLSApplicationRecord:(id)a3 dataSource:(unint64_t)a4
{
  id v6 = [a3 compatibilityObject];
  v7 = [(DMCApplicationProxy *)self initWithLSApplicationProxy:v6 dataSource:a4];

  return v7;
}

- (DMCApplicationProxy)initWithLSApplicationProxy:(id)a3 dataSource:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DMCApplicationProxy;
  id v8 = [(DMCApplicationProxy *)&v26 init];
  if (v8)
  {
    uint64_t v9 = [v7 localizedName];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 bundleIdentifier];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;

    v13 = [v7 bundleURL];
    uint64_t v14 = [v13 path];
    bundlePath = v8->_bundlePath;
    v8->_bundlePath = (NSString *)v14;

    uint64_t v16 = [v7 signerIdentity];
    signerID = v8->_signerID;
    v8->_signerID = (NSString *)v16;

    uint64_t v18 = [v7 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
    appIDEntitlement = v8->_appIDEntitlement;
    v8->_appIDEntitlement = (NSString *)v18;

    v20 = [v7 appState];
    v8->_isInstalled = [v20 isInstalled];

    v8->_isBetaApp = [v7 isBetaApp];
    v21 = [v7 applicationType];
    v8->_isUserApp = [v21 isEqualToString:@"User"];

    objc_storeStrong((id *)&v8->_lsApp, a3);
    if (!v8->_bundleID)
    {
      v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v7;
        _os_log_impl(&dword_221CC5000, v22, OS_LOG_TYPE_ERROR, "DMCApplicationProxy encountered an LSApplicationProxy with no bundle ID: %{public}@", buf, 0xCu);
      }
    }
    v8->_dataSource = a4;
    if (a4 == 1)
    {
      uint64_t v23 = [(DMCApplicationProxy *)v8 managedAppConfigurationInfo];
      cachedManagedAppConfigurationInfo = v8->_cachedManagedAppConfigurationInfo;
      v8->_cachedManagedAppConfigurationInfo = (NSString *)v23;
    }
  }

  return v8;
}

+ (id)_allApplications
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [[DMCApplicationProxy alloc] initWithLSApplicationRecord:*(void *)(*((void *)&v10 + 1) + 8 * i) dataSource:0];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)_bundlePathsForApplications:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundlePath", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)blockedApplications
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [a1 _allApplications];
  uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
  id v26 = 0;
  id v5 = [a1 _bundlePathsForApplications:v3];
  id v25 = 0;
  char v6 = [v4 getAreBundlesBlocked:&v26 bundlePaths:v5 outError:&v25];
  id v7 = v26;
  id v8 = v25;

  if (v6)
  {
    id v20 = v8;
    uint64_t v9 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = [v15 bundlePath];
          uint64_t v17 = [v7 objectForKeyedSubscript:v16];
          [v15 setBlockedInfo:v17];

          if ([v15 isBlocked]) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v12);
    }

    id v8 = v20;
  }
  else
  {
    uint64_t v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v8;
      _os_log_impl(&dword_221CC5000, v18, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to check profiled if bundle paths are blocked by MIS with error: %{public}@", buf, 0xCu);
    }
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

+ (id)userApplications
{
  v2 = [a1 _allApplications];
  id v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  uint64_t v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __39__DMCApplicationProxy_userApplications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isUserApp];
}

- (id)iconForVariant:(unint64_t)a3
{
  if ([(DMCApplicationProxy *)self dataSource] == 1)
  {
    id v5 = [(DMCApplicationProxy *)self _bridgeIconForVariant:a3];
    goto LABEL_10;
  }
  char v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v7;

  if (v8 < 1.0)
  {
LABEL_7:
    id v10 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v9 = [(DMCApplicationProxy *)self _lsIconDataForVariant:a3 scale:v8];
      id v10 = (void *)v9;
      if (v9 || v8 <= 1.0) {
        break;
      }
      double v8 = v8 + -1.0;
      if (v8 < 1.0) {
        goto LABEL_7;
      }
    }
    if (v9)
    {
      uint64_t v12 = (CGImage *)LICreateIconFromCachedBitmap();
      if (v12)
      {
        id v5 = [MEMORY[0x263F1C6B0] imageWithCGImage:v12 scale:0 orientation:v8];
      }
      else
      {
        id v5 = 0;
      }
      CGImageRelease(v12);
      goto LABEL_9;
    }
  }
  id v5 = 0;
LABEL_9:

LABEL_10:
  return v5;
}

- (id)_lsIconDataForVariant:(unint64_t)a3 scale:(double)a4
{
  double v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (a4 == 3.0)
  {
    BOOL v9 = a3 == 0;
    unsigned int v10 = 32;
    unsigned int v11 = 34;
LABEL_10:
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    uint64_t v13 = [(DMCApplicationProxy *)self lsApp];
    long long v14 = [v13 iconDataForVariant:v12];

    goto LABEL_14;
  }
  if (a4 == 2.0)
  {
    if (v8 == 1) {
      unsigned int v10 = 24;
    }
    else {
      unsigned int v10 = 15;
    }
    BOOL v9 = a3 == 0;
    unsigned int v11 = 17;
    goto LABEL_10;
  }
  if (a4 == 1.0)
  {
    unsigned int v10 = v8 == 1;
    BOOL v9 = a3 == 0;
    unsigned int v11 = 4;
    goto LABEL_10;
  }
  long long v14 = 0;
LABEL_14:
  return v14;
}

+ (id)bookIconForVariant:(unint64_t)a3
{
  uint64_t v4 = [[DMCApplicationProxy alloc] initWithBundleID:@"com.apple.iBooks" dataSource:0];
  id v5 = [(DMCApplicationProxy *)v4 iconForVariant:a3];

  return v5;
}

- (id)_bridgeIconForVariant:(unint64_t)a3
{
  id v5 = [MEMORY[0x263F1C920] mainScreen];
  char v6 = [v5 traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (a3) {
    unsigned int v9 = 42;
  }
  else {
    unsigned int v9 = 48;
  }
  if (a3) {
    unsigned int v10 = 42;
  }
  else {
    unsigned int v10 = 47;
  }
  if (v8 <= 2.0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  id v19 = 0;
  uint64_t v12 = [MEMORY[0x263F57788] sharedInstance];
  uint64_t v13 = [(DMCApplicationProxy *)self bundleID];
  [v12 getCachedIconForBundleID:v13 iconVariant:v11 outIconImage:&v19 updateBlock:0];

  if (v19)
  {
    long long v14 = [(DMCApplicationProxy *)self _circularImageFromImage:v19 variant:v11];
  }
  else
  {
    long long v15 = [(DMCApplicationProxy *)self bundleID];
    uint64_t v16 = dispatch_get_global_queue(0, 0);
    [v12 getIconForBundleID:v15 iconVariant:v11 queue:v16 block:&__block_literal_global_19 timeout:10.0];

    uint64_t v17 = PSBlankIconImage();
    long long v14 = [(DMCApplicationProxy *)self _circularImageFromImage:v17 variant:v11];
  }
  return v14;
}

void __45__DMCApplicationProxy__bridgeIconForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"kMCUIBridgeIconLoadedNotification" object:0 userInfo:0];
  }
}

- (id)_circularImageFromImage:(id)a3 variant:(int)a4
{
  id v5 = a3;
  if (a4 == 42) {
    double v6 = 57.0;
  }
  else {
    double v6 = 29.0;
  }
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", v6, v6);
  double v8 = (void *)MEMORY[0x263F1C6B0];
  id v9 = v5;
  uint64_t v10 = [v9 CGImage];
  [v9 scale];
  uint64_t v11 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v10, 0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __55__DMCApplicationProxy__circularImageFromImage_variant___block_invoke;
  v20[3] = &unk_2645E8F18;
  double v22 = v6;
  double v23 = v6;
  id v12 = v11;
  id v21 = v12;
  uint64_t v13 = [v7 imageWithActions:v20];
  long long v14 = v13;
  if (!v13)
  {
    long long v15 = *(NSObject **)DMCLogObjects();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    uint64_t v13 = v9;
    if (v16)
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to create circular Bridge app icon", v19, 2u);
      uint64_t v13 = v9;
    }
  }
  id v17 = v13;

  return v17;
}

void __55__DMCApplicationProxy__circularImageFromImage_variant___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", *MEMORY[0x263F00148], v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v3, (CGPathRef)[v8 CGPath]);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5, v6, v7);
}

- (void)setBlockedInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F53DE0]];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_isBlocked = [v6 BOOLValue];
      }
      else
      {
        id v9 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138543362;
          long long v15 = v6;
          _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app isBlockedInfo as NSNumber: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F53DD0]];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&self->_misCDHash, v10);
      }
      else
      {
        uint64_t v11 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138543362;
          long long v15 = v10;
          _os_log_impl(&dword_221CC5000, v11, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app hash info as NSData: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    id v12 = [v5 objectForKeyedSubscript:*MEMORY[0x263F53DD8]];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&self->_misHashType, v12);
      }
      else
      {
        uint64_t v13 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138543362;
          long long v15 = v12;
          _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app hash type as NSNumber: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  else
  {
    self->_isBlocked = 0;
    misCDHash = self->_misCDHash;
    self->_misCDHash = 0;

    misHashType = self->_misHashType;
    self->_misHashType = 0;
  }
}

- (BOOL)checkIsBlocked
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(DMCApplicationProxy *)self bundlePath];

  if (!v3) {
    return 0;
  }
  BOOL v20 = 0;
  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  double v5 = [(DMCApplicationProxy *)self bundlePath];
  id v18 = 0;
  id v19 = 0;
  id v17 = 0;
  int v6 = [v4 getIsBundleBlocked:&v20 bundlePath:v5 outHash:&v19 outHashType:&v18 outError:&v17];
  id v7 = v19;
  id v8 = v19;
  id v9 = v18;
  id v10 = v18;
  id v11 = v17;

  if (v6)
  {
    self->_isBlocked = v20;
    objc_storeStrong((id *)&self->_misCDHash, v7);
    objc_storeStrong((id *)&self->_misHashType, v9);
  }
  else
  {
    uint64_t v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = v13;
      long long v15 = [(DMCApplicationProxy *)self bundlePath];
      *(_DWORD *)buf = 138543618;
      double v22 = v15;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl(&dword_221CC5000, v14, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to check profiled if bundle path '%{public}@' is blocked by MIS with error: %{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = v20;

  return v12;
}

- (unint64_t)misStateIncludingPending:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v5 = [(DMCApplicationProxy *)self bundlePath];

  if (v5)
  {
    int v6 = [(DMCApplicationProxy *)self bundlePath];
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, *MEMORY[0x263F8C568]);
    int v14 = v7;
    [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unint64_t v8 = MISAppApprovalState();

    if (v8 > 5) {
      return 4;
    }
    else {
      return qword_221D0E8A0[v8];
    }
  }
  else
  {
    id v10 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = v10;
      BOOL v12 = [(DMCApplicationProxy *)self bundleID];
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_221CC5000, v11, OS_LOG_TYPE_ERROR, "DMCApplicationProxy MIS validator failed to find bundle for app: %{public}@", buf, 0xCu);
    }
    return 0;
  }
}

- (id)misStateString
{
  unint64_t v2 = [(DMCApplicationProxy *)self misStateIncludingPending:0] - 2;
  if (v2 > 3) {
    BOOL v3 = @"DMC_MIS_NOT_VERIFIED_APP";
  }
  else {
    BOOL v3 = off_2645E8F38[v2];
  }
  id v4 = DMCEnrollmentLocalizedString(v3);
  return v4;
}

- (id)managedAppConfigurationInfo
{
  BOOL v3 = [(DMCApplicationProxy *)self cachedManagedAppConfigurationInfo];

  if (v3)
  {
    uint64_t v4 = [(DMCApplicationProxy *)self cachedManagedAppConfigurationInfo];
LABEL_40:
    __int16 v23 = (void *)v4;
    goto LABEL_41;
  }
  if (![(DMCApplicationProxy *)self _hasManagedRestrictions])
  {
    uint64_t v4 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_HAS_NO_RESTRICTIONS");
    goto LABEL_40;
  }
  double v5 = objc_opt_new();
  if ([(DMCApplicationProxy *)self _isUninstalledOnMDMRemoval])
  {
    int v6 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_WILL_BE_REMOVED");
    [v5 addObject:v6];
  }
  if ([(DMCApplicationProxy *)self _isExcludedFromBackup])
  {
    id v7 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_BACKUP");
    [v5 addObject:v7];
  }
  if ([(DMCApplicationProxy *)self _isUnableToExportToUnmanaged])
  {
    unint64_t v8 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_EXPORT_DATA_TO_UNMANAGED");
    [v5 addObject:v8];
  }
  if ([(DMCApplicationProxy *)self _isUnableToImportFromUnmanaged])
  {
    id v9 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_IMPORT_UNMANAGED_DATA");
    [v5 addObject:v9];
  }
  if ([(DMCApplicationProxy *)self _isExcludedFromCloudSync])
  {
    id v10 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_CLOUD_SYNC");
    [v5 addObject:v10];
  }
  if ([(DMCApplicationProxy *)self _isUnableToUseCellData])
  {
    id v11 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_USE_CELL_DATA");
    [v5 addObject:v11];
  }
  if ([(DMCApplicationProxy *)self _isUnableToUseRoamingCellData])
  {
    BOOL v12 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_USE_ROAMING_CELL_DATA");
    [v5 addObject:v12];
  }
  if ([(DMCApplicationProxy *)self _hasAppVPN])
  {
    uint64_t v13 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_USES_VPN");
    [v5 addObject:v13];
  }
  if ([(DMCApplicationProxy *)self _hasAppCellularSlice])
  {
    int v14 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_USES_CELLULAR_SLICE");
    [v5 addObject:v14];
  }
  if ([(DMCApplicationProxy *)self _hasAppContentFilter])
  {
    long long v15 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_USES_CONTENT_FILTER");
    [v5 addObject:v15];
  }
  if ([(DMCApplicationProxy *)self _hasAppDNSProxy])
  {
    uint64_t v16 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_USES_DNS_PROXY");
    [v5 addObject:v16];
  }
  if ([(DMCApplicationProxy *)self _hasAppRelay])
  {
    uint64_t v17 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_USES_RELAY");
    [v5 addObject:v17];
  }
  if ([(DMCApplicationProxy *)self _hasAssociatedDomains])
  {
    id v18 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_ADDS_ASSOCIATED_DOMAINS");
    [v5 addObject:v18];
  }
  if ([(DMCApplicationProxy *)self _isNotRemovable])
  {
    id v19 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_BE_REMOVED");
    [v5 addObject:v19];
  }
  if ([(DMCApplicationProxy *)self _canNotBeHidden])
  {
    BOOL v20 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_BE_HIDDEN");
    [v5 addObject:v20];
  }
  if ([(DMCApplicationProxy *)self _canNotBeLocked])
  {
    id v21 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_CANNOT_BE_LOCKED");
    [v5 addObject:v21];
  }
  if ([(DMCApplicationProxy *)self _isTapToPayScreenLock])
  {
    double v22 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APP_TAP_TO_SCREEN_LOCK_ENABLED");
    [v5 addObject:v22];
  }
  __int16 v23 = [v5 componentsJoinedByString:@"\n\n"];

LABEL_41:
  return v23;
}

- (BOOL)_hasManagedRestrictions
{
  if ([(DMCApplicationProxy *)self _isUninstalledOnMDMRemoval]
    || [(DMCApplicationProxy *)self _isExcludedFromBackup]
    || [(DMCApplicationProxy *)self _isExcludedFromCloudSync]
    || [(DMCApplicationProxy *)self _isUnableToImportFromUnmanaged]
    || [(DMCApplicationProxy *)self _isUnableToExportToUnmanaged]
    || [(DMCApplicationProxy *)self _isUnableToUseCellData]
    || [(DMCApplicationProxy *)self _isUnableToUseRoamingCellData]
    || [(DMCApplicationProxy *)self _hasAppVPN]
    || [(DMCApplicationProxy *)self _hasAppCellularSlice]
    || [(DMCApplicationProxy *)self _hasAppContentFilter]
    || [(DMCApplicationProxy *)self _hasAppDNSProxy]
    || [(DMCApplicationProxy *)self _hasAppRelay]
    || [(DMCApplicationProxy *)self _hasAssociatedDomains]
    || [(DMCApplicationProxy *)self _isNotRemovable]
    || [(DMCApplicationProxy *)self _isTapToPayScreenLock]
    || [(DMCApplicationProxy *)self _canNotBeHidden])
  {
    return 1;
  }
  return [(DMCApplicationProxy *)self _canNotBeLocked];
}

- (BOOL)_isUninstalledOnMDMRemoval
{
  BOOL v3 = [MEMORY[0x263F52840] managedAppIDsWithFlags:1];
  uint64_t v4 = [(DMCApplicationProxy *)self bundleID];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)_isExcludedFromBackup
{
  BOOL v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v4 = [v3 doNotBackupAppIDs];

  char v5 = [(DMCApplicationProxy *)self bundleID];
  LOBYTE(v3) = [v4 containsObject:v5];

  return (char)v3;
}

- (BOOL)_isExcludedFromCloudSync
{
  unint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53968]] == 2;

  return v3;
}

- (BOOL)_isUnableToImportFromUnmanaged
{
  unint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F539D0]] == 2;

  return v3;
}

- (BOOL)_isUnableToExportToUnmanaged
{
  unint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F539C8]] == 2;

  return v3;
}

- (BOOL)_isUnableToUseCellData
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)[MEMORY[0x263F145F0] copyAggregatePathRules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "matchSigningIdentifier", (void)v14);
        id v10 = [(DMCApplicationProxy *)self bundleID];
        char v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          int v12 = [v8 supportsCellularBehavior:0] ^ 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v12) = 0;
LABEL_11:

  return v12;
}

- (BOOL)_isUnableToUseRoamingCellData
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)[MEMORY[0x263F145F0] copyAggregatePathRules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      unint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = objc_msgSend(v8, "matchSigningIdentifier", (void)v14);
      id v10 = [(DMCApplicationProxy *)self bundleID];
      int v11 = [v9 isEqualToString:v10];

      if (v11) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if ([v8 supportsCellularBehavior:0]
      && ![v8 supportsCellularBehavior:2])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)_managedAppAttribute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F52840] attributesByAppID];
  uint64_t v6 = [(DMCApplicationProxy *)self bundleID];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    unint64_t v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_hasAppVPN
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A80]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppCellularSlice
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A50]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppContentFilter
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A58]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppDNSProxy
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A60]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppRelay
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A68]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAssociatedDomains
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A40]];
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 count] != 0;

  return v3;
}

- (BOOL)_isNotRemovable
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_isTapToPayScreenLock
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F52A78]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_canNotBeHidden
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F529A0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_canNotBeLocked
{
  unint64_t v2 = [(DMCApplicationProxy *)self _managedAppAttribute:*MEMORY[0x263F529A8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  id v4 = [(DMCApplicationProxy *)self name];
  [v18 encodeObject:v4 forKey:@"name"];

  uint64_t v5 = [(DMCApplicationProxy *)self bundleID];
  [v18 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = [(DMCApplicationProxy *)self bundlePath];
  [v18 encodeObject:v6 forKey:@"bundlePath"];

  uint64_t v7 = [(DMCApplicationProxy *)self signerID];
  [v18 encodeObject:v7 forKey:@"signerID"];

  unint64_t v8 = [(DMCApplicationProxy *)self appIDEntitlement];
  [v18 encodeObject:v8 forKey:@"appIDEntitlement"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCApplicationProxy isInstalled](self, "isInstalled"));
  [v18 encodeObject:v9 forKey:@"isInstalled"];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCApplicationProxy isBetaApp](self, "isBetaApp"));
  [v18 encodeObject:v10 forKey:@"isBetaApp"];

  int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCApplicationProxy isUserApp](self, "isUserApp"));
  [v18 encodeObject:v11 forKey:@"isUserApp"];

  BOOL v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCApplicationProxy isBlocked](self, "isBlocked"));
  [v18 encodeObject:v12 forKey:@"isBlocked"];

  uint64_t v13 = [(DMCApplicationProxy *)self misCDHash];
  [v18 encodeObject:v13 forKey:@"misCDHash"];

  long long v14 = [(DMCApplicationProxy *)self misHashType];
  [v18 encodeObject:v14 forKey:@"misHashType"];

  long long v15 = [(DMCApplicationProxy *)self cachedManagedAppConfigurationInfo];
  [v18 encodeObject:v15 forKey:@"cachedManagedAppConfigurationInfo"];

  long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMCApplicationProxy dataSource](self, "dataSource"));
  [v18 encodeObject:v16 forKey:@"dataSource"];

  if (self->_dataSource != 1)
  {
    long long v17 = [(DMCApplicationProxy *)self lsApp];
    [v18 encodeObject:v17 forKey:@"lsApp"];
  }
}

- (DMCApplicationProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)DMCApplicationProxy;
  uint64_t v5 = [(DMCApplicationProxy *)&v39 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    BOOL v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"bundlePath"];
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v13;

    long long v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"signerID"];
    signerID = v5->_signerID;
    v5->_signerID = (NSString *)v16;

    id v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"appIDEntitlement"];
    appIDEntitlement = v5->_appIDEntitlement;
    v5->_appIDEntitlement = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInstalled"];
    v5->_isInstalled = [v21 BOOLValue];

    double v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBetaApp"];
    v5->_isBetaApp = [v22 BOOLValue];

    __int16 v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isUserApp"];
    v5->_isUserApp = [v23 BOOLValue];

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBlocked"];
    v5->_isBlocked = [v24 BOOLValue];

    uint64_t v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"misCDHash"];
    misCDHash = v5->_misCDHash;
    v5->_misCDHash = (NSData *)v26;

    id v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"misHashType"];
    misHashType = v5->_misHashType;
    v5->_misHashType = (NSNumber *)v29;

    v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"cachedManagedAppConfigurationInfo"];
    cachedManagedAppConfigurationInfo = v5->_cachedManagedAppConfigurationInfo;
    v5->_cachedManagedAppConfigurationInfo = (NSString *)v32;

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataSource"];
    v5->_dataSource = [v34 unsignedIntegerValue];

    if (v5->_dataSource != 1)
    {
      v35 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"lsApp"];
      lsApp = v5->_lsApp;
      v5->_lsApp = (LSApplicationProxy *)v36;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)signerID
{
  return self->_signerID;
}

- (NSString)appIDEntitlement
{
  return self->_appIDEntitlement;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)isUserApp
{
  return self->_isUserApp;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (NSData)misCDHash
{
  return self->_misCDHash;
}

- (NSNumber)misHashType
{
  return self->_misHashType;
}

- (LSApplicationProxy)lsApp
{
  return self->_lsApp;
}

- (void)setLsApp:(id)a3
{
}

- (NSString)cachedManagedAppConfigurationInfo
{
  return self->_cachedManagedAppConfigurationInfo;
}

- (void)setCachedManagedAppConfigurationInfo:(id)a3
{
}

- (unint64_t)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(unint64_t)a3
{
  self->_dataSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedManagedAppConfigurationInfo, 0);
  objc_storeStrong((id *)&self->_lsApp, 0);
  objc_storeStrong((id *)&self->_misHashType, 0);
  objc_storeStrong((id *)&self->_misCDHash, 0);
  objc_storeStrong((id *)&self->_appIDEntitlement, 0);
  objc_storeStrong((id *)&self->_signerID, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
@interface MPRestrictionsMonitor
+ (MPRestrictionsMonitor)sharedRestrictionsMonitor;
- (BOOL)_isRunningInStoreDemoMode;
- (BOOL)allowsAccountModification;
- (BOOL)allowsDeletion;
- (BOOL)allowsExplicitContent;
- (BOOL)allowsMusicSubscription;
- (BOOL)allowsMusicVideos;
- (BOOL)allowsRadioPurchases;
- (BOOL)allowsRadioService;
- (BOOL)allowsStorePurchases;
- (BOOL)hasRestrictionsPasscode;
- (MPRestrictionsMonitor)init;
- (id)effectiveValueForSetting:(id)a3;
- (int64_t)maximumMovieRating;
- (int64_t)maximumMovieRatingForAgeGate;
- (int64_t)maximumTVShowRating;
- (int64_t)maximumTVShowRatingForAgeGate;
- (void)_cacheValue:(id)a3 forSetting:(id)a4;
- (void)_updateWithCanPostNotifications:(BOOL)a3;
- (void)dealloc;
- (void)handleAllowExplicitSettingDidChangeNotification:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setMaximumMovieRatingForAgeGate:(int64_t)a3;
- (void)setMaximumTVShowRatingForAgeGate:(int64_t)a3;
@end

@implementation MPRestrictionsMonitor

- (void)setMaximumTVShowRatingForAgeGate:(int64_t)a3
{
  self->_maximumTVShowRatingForAgeGate = a3;
}

- (void)setMaximumMovieRatingForAgeGate:(int64_t)a3
{
  self->_maximumMovieRatingForAgeGate = a3;
}

uint64_t __50__MPRestrictionsMonitor__isRunningInStoreDemoMode__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
  _isRunningInStoreDemoMode___isRunningInStoreDemoMode = result;
  return result;
}

- (BOOL)allowsAccountModification
{
  return self->_allowsAccountModification;
}

+ (MPRestrictionsMonitor)sharedRestrictionsMonitor
{
  if (sharedRestrictionsMonitor___once != -1) {
    dispatch_once(&sharedRestrictionsMonitor___once, &__block_literal_global_54962);
  }
  v2 = (void *)sharedRestrictionsMonitor___sharedInstance;

  return (MPRestrictionsMonitor *)v2;
}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (int64_t)maximumTVShowRating
{
  v2 = [(MPRestrictionsMonitor *)self effectiveValueForSetting:*MEMORY[0x1E4F740C8]];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 1000;
  }

  return v4;
}

- (id)effectiveValueForSetting:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_cachedSettings objectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    v5 = [(MCProfileConnection *)self->_connection effectiveValueForSetting:v4];
    os_unfair_lock_lock(&self->_lock);
    [(MPRestrictionsMonitor *)self _cacheValue:v5 forSetting:v4];
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  v6 = [MEMORY[0x1E4F1CA98] null];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
LABEL_5:

    v5 = 0;
  }

  return v5;
}

- (int64_t)maximumMovieRating
{
  v2 = [(MPRestrictionsMonitor *)self effectiveValueForSetting:*MEMORY[0x1E4F740C0]];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 1000;
  }

  return v4;
}

- (BOOL)allowsMusicVideos
{
  return self->_allowsMusicVideos;
}

- (void)_cacheValue:(id)a3 forSetting:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v7 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  id v9 = (id)v7;
  [(NSMutableDictionary *)self->_cachedSettings setObject:v7 forKey:v6];
}

void __50__MPRestrictionsMonitor_sharedRestrictionsMonitor__block_invoke()
{
  v0 = objc_alloc_init(MPRestrictionsMonitor);
  v1 = (void *)sharedRestrictionsMonitor___sharedInstance;
  sharedRestrictionsMonitor___sharedInstance = (uint64_t)v0;
}

- (MPRestrictionsMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)MPRestrictionsMonitor;
  v2 = [(MPRestrictionsMonitor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    int64_t v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    *((_DWORD *)v2 + 2) = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v2 selector:sel_handleAllowExplicitSettingDidChangeNotification_ name:@"MPHomeUserObserverUserAllowExplicitSettingsDidChangeNotification" object:0];
    }
    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x3E8uLL);
    [*((id *)v2 + 3) registerObserver:v2];
    [v2 _updateWithCanPostNotifications:0];
  }
  return (MPRestrictionsMonitor *)v2;
}

- (void)_updateWithCanPostNotifications:(BOOL)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v6 = [(MPRestrictionsMonitor *)self _isRunningInStoreDemoMode];
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138543874;
    v101 = self;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)connection;
    __int16 v104 = 1024;
    LODWORD(v105) = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Beginning update for properties of %{public}@. _connection = %{public}@, isRunningInStoreDemoMode = %{BOOL}u", buf, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  int v9 = !v6;
  v10 = "Unchanged";
  if (self->_allowsDeletion != !v6)
  {
    self->_allowsDeletion = v9;
    [v5 addObject:@"allowsDeletion"];
    v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsDeletionDidChangeNotification" object:self];
    [v4 addObject:v11];

    v10 = "Updated";
  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v10;
    __int16 v102 = 1024;
    LODWORD(v103) = v9;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s allowsDeletion = %{BOOL}u.", buf, 0x12u);
  }

  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    BOOL v13 = +[MPHomeUserMonitor isExplicitSettingEnabledForCurrentUser];
    if (self->_allowsExplicitContent == v13)
    {
LABEL_12:
      int v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v15 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F73FE8];
    unsigned int v16 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE8]];
    v17 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (v16 > 2) {
        v18 = @"????";
      }
      else {
        v18 = off_1E57F99E8[v16];
      }
      *(_DWORD *)buf = 138543618;
      v101 = v15;
      __int16 v102 = 2114;
      uint64_t v103 = (uint64_t)v18;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureExplicitContentAllowed (%{public}@) = %{public}@.", buf, 0x16u);
    }

    BOOL v13 = v16 == 1;
    if (self->_allowsExplicitContent == v13) {
      goto LABEL_12;
    }
  }
  self->_allowsExplicitContent = v13;
  [v5 addObject:@"allowsExplicitContent"];
  v19 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification" object:self];
  [v4 addObject:v19];

  int v14 = 1;
LABEL_20:
  v20 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = "Updated";
    if (!v14) {
      v21 = "Unchanged";
    }
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v21;
    __int16 v102 = 1024;
    LODWORD(v103) = v13;
    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s allowsExplicitContent = %{BOOL}u.", buf, 0x12u);
  }

  v22 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F73ED0];
  unsigned int v23 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]];
  v24 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v23 > 2) {
      v25 = @"????";
    }
    else {
      v25 = off_1E57F99E8[v23];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v22;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v25;
    _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureAccountModificationAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  BOOL v26 = v23 != 2;
  if (self->_allowsAccountModification == v26)
  {
    v27 = "Unchanged";
  }
  else
  {
    self->_allowsAccountModification = v26;
    [v5 addObject:@"allowsAccountModification"];
    v28 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsAccountModificationDidChangeNotification" object:self];
    [v4 addObject:v28];

    v27 = "Updated";
  }
  v29 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v27;
    __int16 v102 = 1024;
    LODWORD(v103) = v26;
    _os_log_impl(&dword_1952E8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s allowsAccountModification = %{BOOL}u.", buf, 0x12u);
  }

  v30 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F740E0];
  unsigned int v31 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F740E0]];
  v32 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if (v31 > 2) {
      v33 = @"????";
    }
    else {
      v33 = off_1E57F99E8[v31];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v30;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v33;
    _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureMusicServiceAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  BOOL v34 = v31 != 2;
  if (self->_allowsMusicSubscription == v34)
  {
    v35 = "Unchanged";
  }
  else
  {
    self->_allowsMusicSubscription = v34;
    [v5 addObject:@"allowsMusicSubscription"];
    v36 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorMusicSubscriptionDidChangeNotification" object:self];
    [v4 addObject:v36];

    v35 = "Updated";
  }
  v37 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v35;
    __int16 v102 = 1024;
    LODWORD(v103) = v34;
    _os_log_impl(&dword_1952E8000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s allowsMusicSubscription = %{BOOL}u.", buf, 0x12u);
  }

  v38 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F74078];
  unsigned int v39 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F74078]];
  v40 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (v39 > 2) {
      v41 = @"????";
    }
    else {
      v41 = off_1E57F99E8[v39];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v38;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v41;
    _os_log_impl(&dword_1952E8000, v40, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureITunesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v42 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F74098];
  unsigned int v43 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F74098]];
  v44 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    if (v43 > 2) {
      v45 = @"????";
    }
    else {
      v45 = off_1E57F99E8[v43];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v42;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v45;
    _os_log_impl(&dword_1952E8000, v44, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureInAppPurchasesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  if (v39 == 1 && v43 == 1) {
    BOOL v47 = v9;
  }
  else {
    BOOL v47 = 0;
  }
  if (self->_allowsStorePurchases != v47)
  {
    self->_allowsStorePurchases = v47;
    [v5 addObject:@"allowStorePurchases"];
    v48 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsStorePurchasesDidChangeNotification" object:self];
    [v4 addObject:v48];
  }
  v49 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)"Updated";
    __int16 v102 = 1024;
    LODWORD(v103) = v47;
    _os_log_impl(&dword_1952E8000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s allowStorePurchases = %{BOOL}u.", buf, 0x12u);
  }

  unsigned int v50 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:v42];
  v51 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v50 > 2) {
      v52 = @"????";
    }
    else {
      v52 = off_1E57F99E8[v50];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v42;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v52;
    _os_log_impl(&dword_1952E8000, v51, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureInAppPurchasesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  BOOL v54 = v50 == 1 && v39 == 1;
  if (self->_allowsRadioPurchases == v54)
  {
    v55 = "Unchanged";
  }
  else
  {
    self->_allowsRadioPurchases = v54;
    [v5 addObject:@"allowsRadioPurchases"];
    v56 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsRadioPurchasesDidChangeNotification" object:self];
    [v4 addObject:v56];

    v55 = "Updated";
  }
  v57 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v55;
    __int16 v102 = 1024;
    LODWORD(v103) = v54;
    _os_log_impl(&dword_1952E8000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s allowsRadioPurchases = %{BOOL}u.", buf, 0x12u);
  }

  v58 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F74118];
  unsigned int v59 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F74118]];
  v60 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    if (v59 > 2) {
      v61 = @"????";
    }
    else {
      v61 = off_1E57F99E8[v59];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v58;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v61;
    _os_log_impl(&dword_1952E8000, v60, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureRadioServiceAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  BOOL v62 = v59 == 1;
  if (self->_allowsRadioService == v62)
  {
    v63 = "Unchanged";
  }
  else
  {
    self->_allowsRadioService = v62;
    [v5 addObject:@"allowsRadioService"];
    v64 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsRadioServiceDidChangeNotification" object:self];
    [v4 addObject:v64];

    v63 = "Updated";
  }
  v65 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v63;
    __int16 v102 = 1024;
    LODWORD(v103) = v62;
    _os_log_impl(&dword_1952E8000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s allowsRadioService = %{BOOL}u.", buf, 0x12u);
  }

  v66 = (MPRestrictionsMonitor *)*MEMORY[0x1E4F740E8];
  unsigned int v67 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:*MEMORY[0x1E4F740E8]];
  v68 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    if (v67 > 2) {
      v69 = @"????";
    }
    else {
      v69 = off_1E57F99E8[v67];
    }
    *(_DWORD *)buf = 138543618;
    v101 = v66;
    __int16 v102 = 2114;
    uint64_t v103 = (uint64_t)v69;
    _os_log_impl(&dword_1952E8000, v68, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureMusicVideosAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  BOOL v70 = v67 == 1;
  if (self->_allowsMusicVideos == v70)
  {
    v71 = "Unchanged";
  }
  else
  {
    self->_allowsMusicVideos = v70;
    [v5 addObject:@"allowsMusicVideos"];
    v72 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification" object:self];
    [v4 addObject:v72];

    v71 = "Updated";
  }
  v73 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v101 = (MPRestrictionsMonitor *)v71;
    __int16 v102 = 1024;
    LODWORD(v103) = v70;
    _os_log_impl(&dword_1952E8000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s allowsMusicVideos = %{BOOL}u.", buf, 0x12u);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v74 = (void *)[(NSMutableDictionary *)self->_cachedSettings copy];
  uint64_t v75 = [v74 countByEnumeratingWithState:&v96 objects:v108 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        if (*(void *)v97 != v77) {
          objc_enumerationMutation(v74);
        }
        uint64_t v79 = *(void *)(*((void *)&v96 + 1) + 8 * i);
        v80 = [(MCProfileConnection *)self->_connection effectiveValueForSetting:v79];
        [(MPRestrictionsMonitor *)self _cacheValue:v80 forSetting:v79];
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v96 objects:v108 count:16];
    }
    while (v76);
  }

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v81 = [v5 count];
  v82 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
  if (v81)
  {
    if (!v83) {
      goto LABEL_115;
    }
    v84 = "properties";
    *(_DWORD *)buf = 138544130;
    __int16 v102 = 2048;
    v101 = self;
    if (v81 == 1) {
      v84 = "property";
    }
    uint64_t v103 = v81;
    __int16 v104 = 2082;
    v105 = v84;
    __int16 v106 = 2114;
    id v107 = v5;
    v85 = "Completed update for properties of %{public}@. %lu %{public}s updated: %{public}@";
    v86 = v82;
    uint32_t v87 = 42;
  }
  else
  {
    if (!v83) {
      goto LABEL_115;
    }
    *(_DWORD *)buf = 138543362;
    v101 = self;
    v85 = "Completed update for properties of %{public}@. All properties remained unchanged.";
    v86 = v82;
    uint32_t v87 = 12;
  }
  _os_log_impl(&dword_1952E8000, v86, OS_LOG_TYPE_DEFAULT, v85, buf, v87);
LABEL_115:

  uint64_t v88 = [v4 count];
  v89 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
  if (!v88)
  {
    if (a3)
    {
      if (!v90) {
        goto LABEL_125;
      }
      *(_DWORD *)buf = 138543362;
      v101 = self;
      v92 = "%{public}@ : Completed posting notifications because there were no notifications to post.";
    }
    else
    {
      if (!v90) {
        goto LABEL_125;
      }
      *(_DWORD *)buf = 138543362;
      v101 = self;
      v92 = "%{public}@ : Skipping posting notifications because canPostNotifications = NO";
    }
    _os_log_impl(&dword_1952E8000, v89, OS_LOG_TYPE_DEFAULT, v92, buf, 0xCu);
    goto LABEL_125;
  }
  if (v90)
  {
    *(_DWORD *)buf = 138543618;
    v101 = self;
    __int16 v102 = 2048;
    uint64_t v103 = v88;
    _os_log_impl(&dword_1952E8000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ : Posting %lu notifications", buf, 0x16u);
  }

  v91 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MPRestrictionsMonitor__updateWithCanPostNotifications___block_invoke;
  block[3] = &unk_1E57F9EA8;
  v95 = v4;
  dispatch_async(v91, block);

  v89 = v95;
LABEL_125:
}

- (BOOL)_isRunningInStoreDemoMode
{
  if (_isRunningInStoreDemoMode___once != -1) {
    dispatch_once(&_isRunningInStoreDemoMode___once, &__block_literal_global_33_54934);
  }
  return _isRunningInStoreDemoMode___isRunningInStoreDemoMode;
}

- (BOOL)allowsMusicSubscription
{
  return self->_allowsMusicSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

- (int64_t)maximumMovieRatingForAgeGate
{
  return self->_maximumMovieRatingForAgeGate;
}

- (int64_t)maximumTVShowRatingForAgeGate
{
  return self->_maximumTVShowRatingForAgeGate;
}

- (BOOL)allowsRadioService
{
  return self->_allowsRadioService;
}

- (BOOL)allowsRadioPurchases
{
  return self->_allowsRadioPurchases;
}

- (BOOL)allowsStorePurchases
{
  return self->_allowsStorePurchases;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

void __57__MPRestrictionsMonitor__updateWithCanPostNotifications___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v8);
        [v7 postNotification:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    long long v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling effective settings changed notification for %{public}@ with user info: %{public}@.", (uint8_t *)&v9, 0x20u);
  }

  [(MPRestrictionsMonitor *)self _updateWithCanPostNotifications:1];
}

- (void)handleAllowExplicitSettingDidChangeNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling allow explicit setting did change notification for home monitor: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [(MPRestrictionsMonitor *)self _updateWithCanPostNotifications:1];
}

- (BOOL)hasRestrictionsPasscode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)getSFRestrictionsPasscodeControllerClass_softClass;
  uint64_t v9 = getSFRestrictionsPasscodeControllerClass_softClass;
  if (!getSFRestrictionsPasscodeControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getSFRestrictionsPasscodeControllerClass_block_invoke;
    v5[3] = &unk_1E57FA300;
    v5[4] = &v6;
    __getSFRestrictionsPasscodeControllerClass_block_invoke((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 settingEnabled];
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_connection unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MPRestrictionsMonitor;
  [(MPRestrictionsMonitor *)&v3 dealloc];
}

@end
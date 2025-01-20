@interface HDGymKitSettings
- (BOOL)fitnessTrackingEnabled;
- (BOOL)isLowPowerModeEnabled;
- (HDGymKitSettings)initWithProfile:(id)a3;
- (HDGymKitSettingsDelegate)delegate;
- (unint64_t)nfcPermission;
- (void)_setNFCAlwaysOnPreferenceIfNecessary;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setDelegate:(id)a3;
- (void)unitTest_simulateNRDeviceUpdate;
@end

@implementation HDGymKitSettings

- (HDGymKitSettings)initWithProfile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDGymKitSettings;
  v5 = [(HDGymKitSettings *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_nfcPermission = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_hasRunProtectedDataCheck = 0;
    sub_12484((uint64_t)v6);
    sub_12758((uint64_t)v6);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  int privacyNotificationToken = self->_privacyNotificationToken;
  if (privacyNotificationToken != -1) {
    notify_cancel(privacyNotificationToken);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"HDConnectedGymPreferencesChanged" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:HDUserCharacteristicsDidChangeNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:NSProcessInfoPowerStateDidChangeNotification object:0];

  currentDevice = self->_currentDevice;
  uint64_t v10 = NRDevicePropertyIsAltAccount;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [(NRDevice *)currentDevice removePropertyObserver:self forPropertyChanges:v8];

  sub_12970((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)HDGymKitSettings;
  [(HDGymKitSettings *)&v9 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [a3 database];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_12ABC;
  v5[3] = &unk_60820;
  v5[4] = self;
  [v4 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:0 block:v5];
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id obj = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, obj);
  unint64_t nfcPermission = self->_nfcPermission;
  os_unfair_lock_unlock(p_lock);
  [obj gymKitSettings:self didChangeFromNFCPermission:0 toNFCPermission:nfcPermission];
}

- (unint64_t)nfcPermission
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t nfcPermission = self->_nfcPermission;
  os_unfair_lock_unlock(p_lock);
  return nfcPermission;
}

- (BOOL)fitnessTrackingEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 persistentDomainForName:kHKPrivacyPreferencesDomain];

  id v4 = [v3 objectForKeyedSubscript:kHKPrivacyPreferencesKeyEnableFitnessTracking];
  v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && !self->_hasRunProtectedDataCheck)
  {
    self->_hasRunProtectedDataCheck = 1;
    id v7 = v6;
    [(HDGymKitSettings *)self _setNFCAlwaysOnPreferenceIfNecessary];
    [v7 removeProtectedDataObserver:self];
    id v6 = v7;
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  if ((sub_12E28((id *)&self->super.isa) & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v5;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v12 = [v11 sampleType];
          v13 = +[HKObjectType workoutType];
          unsigned int v14 = [v12 isEqual:v13];

          if (v14)
          {
            v15 = [v11 _source];
            unsigned __int8 v16 = [v15 _isAppleWatch];

            if (v16)
            {

              sub_12E90((uint64_t)self, 1);
              sub_12F00((uint64_t)self, 1);
              sub_12970((uint64_t)self);
              goto LABEL_13;
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

LABEL_13:
    id v5 = v17;
  }
}

- (void)unitTest_simulateNRDeviceUpdate
{
  currentDevice = self->_currentDevice;
  uint64_t v4 = NRDevicePropertyIsAltAccount;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  id v6 = [v5 behavior];
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 tinkerModeEnabled] ^ 1);
  [(HDGymKitSettings *)self device:currentDevice propertyDidChange:v4 fromValue:v7];
}

- (BOOL)isLowPowerModeEnabled
{
  v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)_setNFCAlwaysOnPreferenceIfNecessary
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_13540;
  v8[3] = &unk_60D88;
  v8[4] = self;
  v8[5] = &v9;
  sub_13588((uint64_t)self, v8);
  if (!*((unsigned char *)v10 + 24))
  {
    if ([(HDGymKitSettings *)self isLowPowerModeEnabled])
    {
      sub_12F00((uint64_t)self, 0);
      sub_12970((uint64_t)self);
      goto LABEL_17;
    }
    unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
    uint64_t v4 = [v3 persistentDomainForName:kHKConnectedGymPreferencesDomain];

    _HKInitializeLogging();
    id v5 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v14 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "GymKit preferences: %{public}@", buf, 0xCu);
    }
    id v6 = [v4 objectForKeyedSubscript:kHKConnectedGymPreferencesNFCAlwaysOn];
    id v7 = v6;
    if (v6)
    {
      sub_12F00((uint64_t)self, (char)[v6 BOOLValue]);
      sub_12970((uint64_t)self);
    }
    else
    {
      id v7 = [v4 objectForKeyedSubscript:kHKConnectedGymPreferencesDefaultNFCAlwaysOn];
      if (sub_12E28((id *)&self->super.isa))
      {
        sub_12F00((uint64_t)self, 0);
        if (!v7 || [v7 BOOLValue]) {
          sub_12E90((uint64_t)self, 0);
        }
      }
      else if ([v7 BOOLValue])
      {
        sub_12F00((uint64_t)self, 1);
      }
      else if (([v7 BOOLValue] & 1) == 0)
      {
        sub_13754((uint64_t)self);
        goto LABEL_16;
      }
      sub_12970((uint64_t)self);
    }
LABEL_16:
  }
LABEL_17:
  _Block_object_dispose(&v9, 8);
}

- (HDGymKitSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDGymKitSettingsDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDevice, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end
@interface WOWorkoutHealthProfileExtension
+ (BOOL)_isOldWatchSeries:(id)a3;
- (HDProfile)profile;
- (HDXPCListener)listener;
- (WOWorkoutHealthProfileExtension)initWithProfile:(id)a3;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (id)listenerEndpointForClient:(id)a3 error:(id *)a4;
- (void)setListener:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation WOWorkoutHealthProfileExtension

- (WOWorkoutHealthProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WOWorkoutHealthProfileExtension;
  v5 = [(WOWorkoutHealthProfileExtension *)&v24 init];
  v6 = v5;
  if (v5)
  {
    [(WOWorkoutHealthProfileExtension *)v5 setProfile:v4];
    v7 = +[_HKBehavior sharedBehavior];
    v8 = [v7 currentDeviceProductType];

    unsigned int v9 = +[WOWorkoutHealthProfileExtension _isOldWatchSeries:v8];
    id v10 = objc_alloc((Class)NSUserDefaults);
    uint64_t v11 = kHKConnectedGymPreferencesDomain;
    id v12 = [v10 initWithSuiteName:kHKConnectedGymPreferencesDomain];
    unsigned int v13 = [v12 BOOLForKey:@"ConnectedGymDebugDisableGymKitNFCSwitchOnAllHardware"];

    _HKInitializeLogging();
    v14 = HKLogWorkouts;
    BOOL v15 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0 || v9)
    {
      if (v15)
      {
        CFStringRef v16 = @"NO";
        if (v9) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        if (v13) {
          CFStringRef v16 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v26 = v17;
        __int16 v27 = 2112;
        CFStringRef v28 = v16;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[WorkoutGymKitNFC] Initializing WOWorkoutGymKitNFCManager, disableGymKitNFCSwitch (oldHardware: %@ || allHardware: %@)", buf, 0x16u);
      }
      +[WOWorkoutGymKitNFCManager disableGymKitNFCSwitchOnOldHardwareIfNeeded];
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v26 = @"NO";
      __int16 v27 = 2112;
      CFStringRef v28 = @"NO";
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      CFStringRef v32 = @"ConnectedGymDebugDisableGymKitNFCSwitchOnAllHardware";
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[WorkoutGymKitNFC] Not initializing WOWorkoutGymKitNFCManager, disableGymKitNFCSwitch (oldHardware: %@ || allHardware: %@), for testing on all hardware: defaults write %@ %@ 1", buf, 0x2Au);
    }
    id v18 = [objc_alloc((Class)HDXPCListener) initWithLabel:@"WorkoutHealthPlugin"];
    [(WOWorkoutHealthProfileExtension *)v6 setListener:v18];

    v19 = [(WOWorkoutHealthProfileExtension *)v6 listener];
    [v19 setDelegate:v6];

    v20 = [(WOWorkoutHealthProfileExtension *)v6 listener];
    [v20 resume];

    id v21 = +[WOWorkoutExternalProviderObserver sharedInstance];
    _HKInitializeLogging();
    v22 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Workout Profile Extension Loaded.", buf, 2u);
    }
  }
  return v6;
}

+ (BOOL)_isOldWatchSeries:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:HKProductTypePrefixAppleWatchFirstGeneration] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatchSeries1Series2] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatchSeries3] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatchSeries4] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatchSeries5] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatch5SENonCellularSmall] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatch5SENonCellularBig] & 1) != 0
    || ([v3 hasPrefix:HKProductTypePrefixAppleWatch5SECellularSmall] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 hasPrefix:HKProductTypePrefixAppleWatch5SECellularBig];
  }

  return v4;
}

- (id)listenerEndpointForClient:(id)a3 error:(id *)a4
{
  unsigned __int8 v4 = [(WOWorkoutHealthProfileExtension *)self listener];
  v5 = [v4 endpoint];

  return v5;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  return +[WOWorkoutQueryServer serverWithClient:a4 profile:self->_profile error:a5];
}

- (HDXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end
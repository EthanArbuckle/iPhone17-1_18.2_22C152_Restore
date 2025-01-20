@interface WOWorkoutGymKitNFCManager
+ (id)_isWorkoutNFCAllDayEnabledString;
+ (void)disableGymKitNFCSwitchOnOldHardwareIfNeeded;
@end

@implementation WOWorkoutGymKitNFCManager

+ (void)disableGymKitNFCSwitchOnOldHardwareIfNeeded
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v2 initWithSuiteName:kHKConnectedGymPreferencesDomain];
  unsigned int v4 = [v3 BOOLForKey:@"ConnectedGymDisableGymKitNFCSwitchOnOldHardwareCompleted"];
  _HKInitializeLogging();
  v5 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    v7 = v5;
    v8 = +[WOWorkoutGymKitNFCManager _isWorkoutNFCAllDayEnabledString];
    int v13 = 138412546;
    CFStringRef v14 = v6;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[WorkoutGymKitNFC] Disable GymKit NFC Switch On Old Hardware Completed: %@, NFC All Day Enabled: %@", (uint8_t *)&v13, 0x16u);
  }
  if (v4)
  {
    _HKInitializeLogging();
    v9 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[WorkoutGymKitNFC] One time Disable GymKit NFC Switch On Old Hardware (all day support) already completed", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    FISetWorkoutNFCAllDayEnabled();
    [v3 setBool:1 forKey:@"ConnectedGymDisableGymKitNFCSwitchOnOldHardwareCompleted"];
    _HKInitializeLogging();
    v10 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = +[WOWorkoutGymKitNFCManager _isWorkoutNFCAllDayEnabledString];
      int v13 = 138412290;
      CFStringRef v14 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[WorkoutGymKitNFC] One time Disable GymKit NFC Switch On Old Hardware (all day support), NFC All Day Enabled: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (id)_isWorkoutNFCAllDayEnabledString
{
  if (FIIsWorkoutNFCAllDayEnabled()) {
    id v2 = @"YES";
  }
  else {
    id v2 = @"NO";
  }

  return v2;
}

@end
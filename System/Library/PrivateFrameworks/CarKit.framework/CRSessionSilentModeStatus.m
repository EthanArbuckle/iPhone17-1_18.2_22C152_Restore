@interface CRSessionSilentModeStatus
- (BOOL)isDeviceSilentModeOn;
- (unint64_t)getCarPlaySilentModePreference;
- (void)setCarPlaySilentModePreference:(unint64_t)a3;
- (void)setDeviceSilentMode:(BOOL)a3 reason:(id)a4;
@end

@implementation CRSessionSilentModeStatus

- (unint64_t)getCarPlaySilentModePreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CRCarPlaySilentModePref", @"com.apple.CarPlayApp");
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setCarPlaySilentModePreference:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(CRSessionSilentModeStatus *)self getCarPlaySilentModePreference] != a3)
  {
    v4 = CarSilentModeLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = @"Unmuted";
      if (a3 == 1) {
        v5 = @"Muted";
      }
      if (!a3) {
        v5 = @"Mirror iPhone";
      }
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay Silent Mode Preference changed: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v6 = [NSNumber numberWithUnsignedInteger:a3];
    CFPreferencesSetAppValue(@"CRCarPlaySilentModePref", v6, @"com.apple.CarPlayApp");
  }
}

- (BOOL)isDeviceSilentModeOn
{
  v2 = [MEMORY[0x1E4F74F68] sharedInstance];
  char v3 = [v2 getSilentMode];

  return v3;
}

- (void)setDeviceSilentMode:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F74F68];
  id v7 = a4;
  v8 = [v6 sharedInstance];
  [v8 setSilentMode:v4 untilTime:0 reason:v7 clientType:8];

  BOOL v9 = [(CRSessionSilentModeStatus *)self isDeviceSilentModeOn];
  v10 = CarSilentModeLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"Unmuted";
    if (v4) {
      v12 = @"Muted";
    }
    else {
      v12 = @"Unmuted";
    }
    if (v9) {
      v11 = @"Muted";
    }
    int v14 = 138543874;
    v15 = v12;
    __int16 v16 = 2114;
    v17 = v11;
    if (v9 != v4) {
      v13 = @"NO";
    }
    else {
      v13 = @"YES";
    }
    __int16 v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "Should have %{public}@ device. Device is %{public}@. Success: %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

@end
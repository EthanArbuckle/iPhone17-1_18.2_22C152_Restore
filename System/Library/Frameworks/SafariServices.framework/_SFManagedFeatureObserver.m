@interface _SFManagedFeatureObserver
+ (id)sharedObserver;
- (BOOL)authenticationRequiredToAutoFill;
- (BOOL)doesUserHavePasscodeSet;
- (BOOL)isUserEnrolledInBiometricAuthentication;
- (_SFManagedFeatureObserver)init;
- (int64_t)biometryTypeCurrentlyAvailableForDevice;
- (void)dealloc;
- (void)isUserEnrolledInBiometricAuthentication;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation _SFManagedFeatureObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedObserver_sharedObserver;

  return v2;
}

- (int64_t)biometryTypeCurrentlyAvailableForDevice
{
  context = self->_context;
  id v8 = 0;
  [(LAContext *)context canEvaluatePolicy:1 error:&v8];
  id v4 = v8;
  v5 = v4;
  if (v4 && (unint64_t)([v4 code] + 7) < 3) {
    LABiometryType v6 = LABiometryTypeNone;
  }
  else {
    LABiometryType v6 = [(LAContext *)self->_context biometryType];
  }

  return v6;
}

- (BOOL)doesUserHavePasscodeSet
{
  context = self->_context;
  id v8 = 0;
  BOOL v3 = [(LAContext *)context canEvaluatePolicy:2 error:&v8];
  id v4 = v8;
  v5 = v4;
  BOOL v6 = v3 || [v4 code] != -5;

  return v6;
}

- (_SFManagedFeatureObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SFManagedFeatureObserver;
  v2 = [(_SFManagedFeatureObserver *)&v8 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
    if (objc_opt_respondsToSelector()) {
      [v3 registerObserver:v2];
    }
    else {
      [v3 addObserver:v2];
    }
    v2->_cachedAuthenticationRequiredToAutoFill = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F58]] == 1;
    id v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    context = v2->_context;
    v2->_context = v4;

    BOOL v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    [v3 unregisterObserver:self];
  }
  else {
    [v3 removeObserver:self];
  }

  v4.receiver = self;
  v4.super_class = (Class)_SFManagedFeatureObserver;
  [(_SFManagedFeatureObserver *)&v4 dealloc];
}

- (BOOL)isUserEnrolledInBiometricAuthentication
{
  context = self->_context;
  id v11 = 0;
  BOOL v3 = [(LAContext *)context canEvaluatePolicy:4 error:&v11];
  id v4 = v11;
  v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      v7 = [v4 domain];
      int v8 = [v7 isEqualToString:*MEMORY[0x1E4F30B38]];

      if (v8)
      {
        BOOL v6 = (unint64_t)([v5 code] + 4) < 0xFFFFFFFFFFFFFFFDLL;
        goto LABEL_9;
      }
      v9 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_SFManagedFeatureObserver *)v9 isUserEnrolledInBiometricAuthentication];
      }
    }
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)authenticationRequiredToAutoFill
{
  return self->_cachedAuthenticationRequiredToAutoFill
      && [(_SFManagedFeatureObserver *)self isUserEnrolledInBiometricAuthentication];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAuthenticationRequiredToAutoFill = [v5 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F58]] == 1;
}

- (void).cxx_destruct
{
}

- (void)isUserEnrolledInBiometricAuthentication
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  BOOL v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Could not get Local Authentication policy information: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
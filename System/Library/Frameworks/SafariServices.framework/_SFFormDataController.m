@interface _SFFormDataController
+ (id)sharedController;
- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3;
- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3;
- (BOOL)contextShouldAllowPasscodeFallback:(id)a3;
- (_SFAuthenticationContext)autoFillAuthenticationContext;
- (_SFFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3;
- (double)invalidationTimeoutIfApplicationEntersBackgroundDuringAuthenticationForContext:(id)a3;
- (id)oneTimeCodeProvider;
@end

@implementation _SFFormDataController

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___SFFormDataController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_2 != -1) {
    dispatch_once(&sharedController_onceToken_2, block);
  }
  v2 = (void *)sharedController_sharedInstance;

  return v2;
}

- (_SFFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFFormDataController;
  v3 = [(WBUFormDataController *)&v8 initWithAggressiveKeychainCaching:a3];
  if (v3)
  {
    v4 = objc_alloc_init(_SFAuthenticationContext);
    autoFillAuthenticationContext = v3->_autoFillAuthenticationContext;
    v3->_autoFillAuthenticationContext = v4;

    [(_SFAuthenticationContext *)v3->_autoFillAuthenticationContext setDelegate:v3];
    v6 = v3;
  }

  return v3;
}

- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowPasscodeFallback:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 0;
}

- (double)invalidationTimeoutIfApplicationEntersBackgroundDuringAuthenticationForContext:(id)a3
{
  return 2.22507386e-308;
}

- (id)oneTimeCodeProvider
{
  oneTimeCodeProvider = self->_oneTimeCodeProvider;
  if (!oneTimeCodeProvider)
  {
    v4 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E4F98200]);
    v5 = self->_oneTimeCodeProvider;
    self->_oneTimeCodeProvider = v4;

    v6 = [(_SFFormDataController *)self autoFillQuirksManager];
    v7 = [v6 associatedDomainsManager];
    [(SFAppAutoFillOneTimeCodeProvider *)self->_oneTimeCodeProvider setAssociatedDomainsManager:v7];

    oneTimeCodeProvider = self->_oneTimeCodeProvider;
  }
  objc_super v8 = oneTimeCodeProvider;

  return v8;
}

- (_SFAuthenticationContext)autoFillAuthenticationContext
{
  return self->_autoFillAuthenticationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillAuthenticationContext, 0);

  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);
}

@end
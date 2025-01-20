@interface BBBiometricResource
- (BBBiometricResource)initWithQueue:(id)a3;
- (BOOL)hasPearlCapability;
- (BOOL)isPearlEnabledAndEnrolled;
- (void)_registerForBKEnrollmentChange;
- (void)_registerForBiometricUnlockAllowedChange;
- (void)_registerForPasscodeChange;
- (void)_unregisterForBKEnrollmentChange;
- (void)_unregisterForBiometricUnlockAllowedChange;
- (void)_updateHasEnrolledPearlIdentities;
- (void)_updateIsBiometricUnlockAllowed;
- (void)_updateIsPasscodeSet;
- (void)dealloc;
@end

@implementation BBBiometricResource

- (BOOL)isPearlEnabledAndEnrolled
{
  return self->_isPasscodeSet && self->_hasEnrolledPearlIdentities && self->_isBiometricUnlockAllowed;
}

- (BOOL)hasPearlCapability
{
  return self->_pearlDevice != 0;
}

- (BBBiometricResource)initWithQueue:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BBBiometricResource;
  v6 = [(BBBiometricResource *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    [(BBBiometricResource *)v7 _updateIsPasscodeSet];
    [(BBBiometricResource *)v7 _updateIsBiometricUnlockAllowed];
    pearlDevice = v7->_pearlDevice;
    v7->_pearlDevice = 0;

    if (__loadBiometricKitIfNecessary_onceToken != -1) {
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_4);
    }
    if (__loadBiometricKitIfNecessary_biometricKit)
    {
      id v22 = v5;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v9 = [NSClassFromString(&cfstr_Bkdevicemanage.isa) availableDevices];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (!v10) {
        goto LABEL_16;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          Class v15 = NSClassFromString(&cfstr_Bkdevice.isa);
          id v23 = 0;
          v16 = [(objc_class *)v15 deviceWithDescriptor:v14 error:&v23];
          id v17 = v23;
          v18 = [v16 descriptor];
          if ([v18 type] == 2)
          {
            NSClassFromString(&cfstr_Bkdevicepearl.isa);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0) {
              goto LABEL_14;
            }
            v20 = v16;
            v18 = v7->_pearlDevice;
            v7->_pearlDevice = v20;
          }

LABEL_14:
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (!v11)
        {
LABEL_16:

          id v5 = v22;
          break;
        }
      }
    }
    [(BBBiometricResource *)v7 _updateHasEnrolledPearlIdentities];
    if (v7->_pearlDevice) {
      [(BBBiometricResource *)v7 _registerForBKEnrollmentChange];
    }
    [(BBBiometricResource *)v7 _registerForBiometricUnlockAllowedChange];
    [(BBBiometricResource *)v7 _registerForPasscodeChange];
  }

  return v7;
}

- (void)dealloc
{
  [(BBBiometricResource *)self _unregisterForBKEnrollmentChange];
  [(BBBiometricResource *)self _unregisterForBiometricUnlockAllowedChange];
  v3.receiver = self;
  v3.super_class = (Class)BBBiometricResource;
  [(BBBiometricResource *)&v3 dealloc];
}

- (void)_registerForBKEnrollmentChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleBKEnrollmentChange, @"com.apple.BiometricKit.enrollmentChanged", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_unregisterForBKEnrollmentChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.BiometricKit.enrollmentChanged", 0);
}

- (void)_registerForBiometricUnlockAllowedChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateIsBiometricUnlockAllowed name:*MEMORY[0x263F536E0] object:0];
}

- (void)_unregisterForBiometricUnlockAllowedChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
}

- (void)_registerForPasscodeChange
{
  int out_token = 0;
  id v3 = (const char *)[(id)*MEMORY[0x263F53B08] cStringUsingEncoding:4];
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__BBBiometricResource__registerForPasscodeChange__block_invoke;
  v5[3] = &unk_264296A70;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, queue, v5);
}

uint64_t __49__BBBiometricResource__registerForPasscodeChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIsPasscodeSet];
}

- (void)_updateIsPasscodeSet
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  self->_isPasscodeSet = [v3 isPasscodeSet];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"BBBiometricResourceStateChanged" object:self userInfo:0];
}

- (void)_updateIsBiometricUnlockAllowed
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BBBiometricResource__updateIsBiometricUnlockAllowed__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__BBBiometricResource__updateIsBiometricUnlockAllowed__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v2 isFingerprintUnlockAllowed];

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"BBBiometricResourceStateChanged" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_updateHasEnrolledPearlIdentities
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BBBiometricResource__updateHasEnrolledPearlIdentities__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__BBBiometricResource__updateHasEnrolledPearlIdentities__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    id v6 = 0;
    id v3 = [v2 identitiesWithError:&v6];
    id v4 = v6;
    if ([v3 count]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
    }
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"BBBiometricResourceStateChanged" object:*(void *)(a1 + 32) userInfo:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

@end
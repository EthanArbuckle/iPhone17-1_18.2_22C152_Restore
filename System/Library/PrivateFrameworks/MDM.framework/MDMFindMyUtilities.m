@interface MDMFindMyUtilities
+ (BOOL)isActivationLockOn;
+ (BOOL)isManagedLostModeActive;
+ (id)lockDeviceWithMessage:(id)a3 phoneNumber:(id)a4;
+ (void)enableActivationLockWithCompletion:(id)a3;
+ (void)enableManagedLostModeWithMessage:(id)a3 phoneNumber:(id)a4 footnoteText:(id)a5 completion:(id)a6;
+ (void)lockDevice;
@end

@implementation MDMFindMyUtilities

+ (void)lockDevice
{
  SBSSpringBoardServerPort();
  JUMPOUT(0x230FC5DA0);
}

+ (id)lockDeviceWithMessage:(id)a3 phoneNumber:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  [a1 lockDevice];
  v8 = [MEMORY[0x263F841B0] sharedManager];
  char v9 = [v8 isMultiUser];

  if ((v9 & 1) != 0 || !(v6 | v7))
  {
    v16 = @"Success";
  }
  else
  {
    v10 = objc_opt_new();
    [v10 setMessage:v6];
    [v10 setPhoneNumber:v7];
    [v10 setLostModeEnabled:1];
    v11 = [MEMORY[0x263F3CC60] sharedInstance];
    v12 = [v11 enableLostModeWithInfo:v10];

    if (v12)
    {
      v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        v15 = [v12 DMCVerboseDescription];
        int v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "MDMFindMyUtilities failed to set lock screen message with error: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      if ([v12 code] == 7)
      {
        v16 = @"NoPasscodeSet";
      }
      else if ([v12 code] == 8)
      {
        v16 = @"DeviceInLostMode";
      }
      else
      {
        v16 = @"Unknown";
      }
    }
    else
    {
      v16 = @"Success";
    }
  }
  return v16;
}

+ (BOOL)isManagedLostModeActive
{
  v2 = [MEMORY[0x263F3CC60] sharedInstance];
  char v3 = [v2 isManagedLostModeActive];

  return v3;
}

+ (void)enableManagedLostModeWithMessage:(id)a3 phoneNumber:(id)a4 footnoteText:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x263F3CC60];
  v14 = (void (**)(id, void))a6;
  v15 = [v13 sharedInstance];
  int v16 = [v15 isManagedLostModeActive];

  if (v16)
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_DEFAULT, "MDMFindMyUtilities ignoring MDM Lost Mode request because Lost Mode is already enabled", v20, 2u);
    }
    v14[2](v14, 0);
  }
  else
  {
    [a1 lockDevice];
    int v18 = objc_opt_new();
    [v18 setLostModeEnabled:1];
    [v18 setMessage:v10];
    [v18 setPhoneNumber:v11];
    [v18 setFootnoteText:v12];
    [v18 setDisableSlideToUnlock:1];
    v19 = [MEMORY[0x263F3CC60] sharedInstance];
    [v19 enableManagedLostModeWithInfo:v18 completion:v14];
  }
}

+ (BOOL)isActivationLockOn
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  char v3 = [MEMORY[0x263F3CC60] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__MDMFindMyUtilities_isActivationLockOn__block_invoke;
  v6[3] = &unk_264B9D480;
  v8 = &v9;
  v4 = v2;
  unint64_t v7 = v4;
  [v3 isActivationLockedWithCompletion:v6];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __40__MDMFindMyUtilities_isActivationLockOn__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    unint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "MDMFindMyUtilities failed to get activation lock state with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)enableActivationLockWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F3CC60] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke;
  v6[3] = &unk_264B9D4D0;
  id v7 = v3;
  id v5 = v3;
  [v4 fmipStateWithCompletion:v6];
}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    unint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "Could not get device locator state. Error: %{public}@", buf, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_10:
    v7();
    goto LABEL_11;
  }
  if (a2 >= 2)
  {
    uint64_t v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "FindMy is off. returning...", buf, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_10;
  }
  id v8 = [MEMORY[0x263F3CC60] sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_13;
  v10[3] = &unk_264B9D2A8;
  id v11 = *(id *)(a1 + 32);
  [v8 isActivationLockedWithCompletion:v10];

LABEL_11:
}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "Could not get activation lock state. Error: %{public}@", buf, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Device is activation locked already. Returning...", buf, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Enabling activation lock...", buf, 2u);
  }
  uint64_t v9 = [MEMORY[0x263F3CC60] sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_14;
  v10[3] = &unk_264B9D4A8;
  id v11 = *(id *)(a1 + 32);
  [v9 enableActivationLockWithCompletion:v10];

LABEL_10:
}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Could not enable activation lock. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  id v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Activation lock enabled.", (uint8_t *)&v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
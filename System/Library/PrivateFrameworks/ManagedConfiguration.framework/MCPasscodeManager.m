@interface MCPasscodeManager
+ (BOOL)_passcodeCharacteristics:(id)a3 creationDate:(id)a4 compliesWithPolicyFromRestrictions:(id)a5 outError:(id *)a6;
+ (BOOL)isDeviceUnlocked;
+ (BOOL)passcode:(id)a3 compliesWithPolicyFromRestrictions:(id)a4 checkHistory:(BOOL)a5 outError:(id *)a6;
+ (BOOL)restrictionsEnforcePasscodePolicy:(id)a3;
+ (id)_localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3 shouldBeDefault:(BOOL)a4;
+ (id)characteristicsDictionaryFromPasscode:(id)a3;
+ (id)deviceLockedError;
+ (id)generateSalt;
+ (id)hashForPasscode:(id)a3 usingMethod:(int)a4 salt:(id)a5 customIterations:(unsigned int)a6;
+ (id)localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:(id)a3;
+ (id)localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3;
+ (id)sharedManager;
+ (int)defaultNewPasscodeEntrySimplePasscodeType;
+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3;
+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3 outSimplePasscodeType:(int *)a4;
+ (int)unlockScreenTypeForRestrictions:(id)a3;
+ (int)unlockScreenTypeForRestrictions:(id)a3 outSimplePasscodeType:(int *)a4;
- (BOOL)_checkPasscode:(id)a3 againstHistoryWithRestrictions:(id)a4 outError:(id *)a5;
- (BOOL)currentPasscodeCompliesWithPolicyFromRestrictions:(id)a3 outError:(id *)a4;
- (BOOL)isCurrentPasscodeCompliantOutError:(id *)a3;
- (BOOL)isDeviceLocked;
- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4;
- (BOOL)isPasscodeSet;
- (BOOL)passcode:(id)a3 compliesWithPolicyCheckHistory:(BOOL)a4 outError:(id *)a5;
- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4;
- (id)_currentPublicPasscodeDict;
- (id)_filterPasscodeCharacteristics:(id)a3 forGeneration:(id)a4;
- (id)_filterPublicPasscodeDict:(id)a3 forGeneration:(id)a4;
- (id)_fixUpPasscodeCharacteristics:(id)a3;
- (id)_fixUpPublicPasscodeDict:(id)a3;
- (id)_privatePasscodeDictWithOutError:(id *)a3;
- (id)_publicPasscodeDictForUser:(id)a3;
- (id)_wrongPasscodeError;
- (id)localizedDescriptionOfDefaultNewPasscodePolicy;
- (id)localizedDescriptionOfPasscodePolicy;
- (id)passcodeCreationDate;
- (id)passcodeExpiryDate;
- (id)recoveryPasscodeExpiryDate;
- (int)_minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)_newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3 shouldBeMinimum:(BOOL)a4;
- (int)currentUnlockScreenType;
- (int)currentUnlockSimplePasscodeType;
- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)newPasscodeEntryScreenType;
- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)recoveryPasscodeUnlockScreenType;
- (int)recoveryPasscodeUnlockSimplePasscodeType;
- (int)unlockScreenTypeForUser:(id)a3;
- (int)unlockScreenTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4;
- (int)unlockSimplePasscodeTypeForUser:(id)a3;
- (int)unlockSimplePasscodeTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4;
- (void)lockDevice;
- (void)lockDeviceImmediately:(BOOL)a3;
@end

@implementation MCPasscodeManager

+ (int)unlockScreenTypeForRestrictions:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v5 = a3;
  int v6 = +[MCRestrictionManager restrictedBoolForFeature:@"requireAlphanumeric" withRestrictionsDictionary:v5];
  v7 = +[MCRestrictionManager valueForFeature:@"minComplexChars" withRestrictionsDictionary:v5];
  int v8 = [v7 unsignedIntValue];

  v9 = +[MCRestrictionManager valueForFeature:@"minLength" withRestrictionsDictionary:v5];

  if (v6 == 1 || v8 != 0)
  {
    int v11 = 2;
LABEL_6:
    int v12 = -1;
    goto LABEL_12;
  }
  if (!v9 || (int v13 = [v9 unsignedIntValue], v13 == 4))
  {
    int v12 = 0;
    int v11 = 0;
  }
  else
  {
    if (v13 != 6)
    {
      int v11 = 1;
      goto LABEL_6;
    }
    int v11 = 0;
    int v12 = 1;
  }
LABEL_12:
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

+ (int)unlockScreenTypeForRestrictions:(id)a3
{
  return +[MCPasscodeManager unlockScreenTypeForRestrictions:a3 outSimplePasscodeType:0];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_46);
  }
  v2 = (void *)sharedManager_obj_0;
  return v2;
}

- (BOOL)isPasscodeSet
{
  return MKBGetDeviceLockState() != 3;
}

- (BOOL)isDeviceLocked
{
  return !+[MCPasscodeManager isDeviceUnlocked];
}

+ (BOOL)isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return v2 == 3 || v2 == 0;
}

uint64_t __34__MCPasscodeManager_sharedManager__block_invoke()
{
  v0 = NSClassFromString(&cfstr_Mcpasscodemana.isa);
  if (!v0) {
    v0 = (objc_class *)MCPasscodeManager;
  }
  sharedManager_obj_0 = (uint64_t)objc_alloc_init(v0);
  return MEMORY[0x1F41817F8]();
}

+ (id)deviceLockedError
{
  int v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = MCErrorArrayByDevice(@"PASSCODE_ERROR_DEVICE_CPLOCKED", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v10 = [v8 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5010 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (id)_currentPublicPasscodeDict
{
  uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v4 = [v3 currentUser];
  uint64_t v5 = [(MCPasscodeManager *)self _publicPasscodeDictForUser:v4];

  return v5;
}

- (id)_publicPasscodeDictForUser:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v6 = [MEMORY[0x1E4F73168] sharedConfiguration];
  if ([v6 userMode] == 1) {
    int v7 = [v5 isSharedIPad];
  }
  else {
    int v7 = 0;
  }

  id v17 = 0;
  int v8 = [v5 keybagOpaqueDataForUser:v4 withError:&v17];
  id v9 = v17;
  if (v9)
  {
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Cannot read public passcode metadata for current user: %{public}@", buf, 0xCu);
    }
  }
  if (![v8 length] || (-[MCPasscodeManager isPasscodeSet](self, "isPasscodeSet") | v7) != 1)
  {
    int v11 = 0;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v16 = 0;
  int v11 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v8 options:0 format:0 error:&v16];
  id v12 = v16;
  if (v12)
  {
    int v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v12;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Cannot read public passcode metadata: %{public}@", buf, 0xCu);
    }
  }

  if (v7)
  {
LABEL_15:
    if (![v11 count])
    {
      uint64_t v14 = +[MCPasscodeUtilities defaultPublicDictionaryForUMUserPasscodeType:](MCPasscodeUtilities, "defaultPublicDictionaryForUMUserPasscodeType:", [v4 passcodeType]);

      int v11 = (void *)v14;
    }
  }
LABEL_17:

  return v11;
}

- (id)_filterPublicPasscodeDict:(id)a3 forGeneration:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F73168] sharedConfiguration];
  if ([v8 userMode] == 1)
  {
    id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    char v10 = [v9 isSharedIPad] ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  if MCGestaltHasSEP() && (v10)
  {
    if (v7)
    {
      int v11 = [v7 stringValue];
      uint64_t v12 = [v6 objectForKeyedSubscript:v11];
      id v13 = (id)v12;
      if (v6 && !v12)
      {
        uint64_t v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138543362;
          id v18 = v7;
          _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "Missing data for passcode generation %{public}@. Attempting to recover data", (uint8_t *)&v17, 0xCu);
        }
        v15 = [(MCPasscodeManager *)self _fixUpPublicPasscodeDict:v6];
        id v13 = [v15 objectForKeyedSubscript:v11];
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (id)_fixUpPublicPasscodeDict:(id)a3
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 || ![(MCPasscodeManager *)self isPasscodeSet])
  {
    id v9 = 0;
    goto LABEL_38;
  }
  uint64_t v5 = [MEMORY[0x1E4F73168] sharedConfiguration];
  if ([v5 userMode] == 1)
  {
    id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v7 = [v6 isSharedIPad];

    int v8 = v7 ^ 1;
  }
  else
  {
    int v8 = 1;
  }

  int v10 = MCGestaltHasSEP() & v8;
  int v11 = MCKeybagCurrentPasscodeGeneration();
  uint64_t v12 = v11;
  if (v10 == 1 && !v11)
  {
    id v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Unable to determine current passcode generation", buf, 2u);
    }
    id v9 = v4;
    goto LABEL_37;
  }
  uint64_t v14 = [v11 stringValue];
  v15 = [v4 objectForKeyedSubscript:v14];

  if (!v15)
  {
    uint64_t v16 = [v4 objectForKeyedSubscript:@"keyboardType"];
    int v17 = (void *)v16;
    id v18 = &unk_1EF4D0B20;
    if (v16) {
      id v18 = (void *)v16;
    }
    id v19 = v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"simpleType"];
    v21 = (void *)v20;
    v22 = &unk_1EF4D0B38;
    if (v20) {
      v22 = (void *)v20;
    }
    id v23 = v22;

    v24 = [v4 objectForKeyedSubscript:@"creationDate"];
    if (v24) {
      goto LABEL_27;
    }
    v25 = [(MCPasscodeManager *)self _privatePasscodeDictWithOutError:0];
    if (v25)
    {
      v26 = v25;
      v27 = [v25 objectForKeyedSubscript:@"characteristics"];
      if (v27)
      {
        v28 = v27;
        v29 = [v27 objectForKeyedSubscript:v14];
        id v30 = v23;
        v31 = v29;
        if (!v29) {
          v29 = v28;
        }
        v24 = [v29 objectForKeyedSubscript:@"timestamp"];

        id v23 = v30;
        if (v24) {
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
    v24 = [MEMORY[0x1E4F1C9C8] date];
LABEL_27:
    id v9 = (id)objc_opt_new();
    v53[0] = @"keyboardType";
    v53[1] = @"simpleType";
    v54[0] = v19;
    v54[1] = v23;
    v49 = v23;
    v53[2] = @"creationDate";
    v54[2] = v24;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
    v33 = v32;
    if (v10)
    {
      [v9 setObject:v32 forKeyedSubscript:v14];
      v34 = MCKeybagMementoPasscodeGeneration();
      v35 = v34;
      if (v34)
      {
        v47 = [v34 stringValue];
        uint64_t v36 = [v4 objectForKeyedSubscript:@"recoveryKeyboardType"];
        id v48 = v19;
        v37 = (void *)v36;
        v38 = &unk_1EF4D0B20;
        if (v36) {
          v38 = (void *)v36;
        }
        id v45 = v38;

        uint64_t v39 = [v4 objectForKeyedSubscript:@"recoverySimpleType"];
        v40 = (void *)v39;
        v41 = &unk_1EF4D0B38;
        if (v39) {
          v41 = (void *)v39;
        }
        id v42 = v41;

        v46 = [MEMORY[0x1E4F1C9C8] date];
        v51[0] = @"keyboardType";
        v51[1] = @"simpleType";
        v52[0] = v45;
        v52[1] = v42;
        v51[2] = @"creationDate";
        v52[2] = v46;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];

        [v9 setObject:v43 forKeyedSubscript:v47];
        id v19 = v48;
      }
    }
    else
    {
      v35 = v9;
      id v9 = (id)[v32 mutableCopy];
    }

    goto LABEL_36;
  }
  id v9 = v4;
LABEL_36:

LABEL_37:
LABEL_38:

  return v9;
}

- (id)_privatePasscodeDictWithOutError:(id *)a3
{
  id v20 = 0;
  uint64_t v5 = +[MCKeychain dataFromService:@"com.apple.managedconfiguration" account:@"Private" label:0 description:0 group:0 useSystemKeychain:0 outError:&v20];
  id v6 = v20;
  uint64_t v14 = v6;
  if (a3 && v6)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    MCErrorArray(@"PASSCODE_ERROR_CANNOT_RETRIEVE_CHARACTERISTICS", v7, v8, v9, v10, v11, v12, v13, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [v15 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5020 descriptionArray:v16 underlyingError:v14 errorType:@"MCFatalError"];
    int v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  if (v5)
  {
    id v18 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v5 options:2 format:0 error:0];
    if (v18 && ![(MCPasscodeManager *)self isPasscodeSet]) {
      [v18 setObject:0 forKeyedSubscript:@"characteristics"];
    }
    id v16 = (id)[v18 copy];

    int v17 = v16;
    goto LABEL_9;
  }
  int v17 = 0;
LABEL_10:

  return v17;
}

- (id)_filterPasscodeCharacteristics:(id)a3 forGeneration:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F73168] sharedConfiguration];
  if ([v8 userMode] == 1)
  {
    uint64_t v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v10 = [v9 isSharedIPad] ^ 1;
  }
  else
  {
    int v10 = 1;
  }

  if (MCGestaltHasSEP() && v10)
  {
    if (v7)
    {
      uint64_t v11 = [v7 stringValue];
      uint64_t v12 = [v6 objectForKeyedSubscript:v11];
      id v13 = (id)v12;
      if (v6 && !v12)
      {
        uint64_t v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138543362;
          id v18 = v7;
          _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "Missing characteristics for passcode generation %{public}@. Attempting to recover data", (uint8_t *)&v17, 0xCu);
        }
        v15 = [(MCPasscodeManager *)self _fixUpPasscodeCharacteristics:v6];
        id v13 = [v15 objectForKeyedSubscript:v11];
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (id)_fixUpPasscodeCharacteristics:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(MCPasscodeManager *)self isPasscodeSet])
  {
    uint64_t v5 = [MEMORY[0x1E4F73168] sharedConfiguration];
    if ([v5 userMode] == 1)
    {
      id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
      char v7 = [v6 isSharedIPad] ^ 1;
    }
    else
    {
      char v7 = 1;
    }

    if MCGestaltHasSEP() && (v7)
    {
      int v10 = MCKeybagCurrentPasscodeGeneration();
      uint64_t v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 stringValue];
        id v13 = [v4 objectForKeyedSubscript:v12];

        if (v13)
        {
          id v8 = v4;
        }
        else
        {
          id v16 = (void *)[v4 MCMutableDeepCopy];
          [v16 setObject:0 forKeyedSubscript:@"timestamp"];
          id v18 = v12;
          v19[0] = v16;
          id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        }
      }
      else
      {
        v15 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int v17 = 0;
          _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Unable to determine current passcode generation", v17, 2u);
        }
        id v8 = v4;
      }
    }
    else
    {
      uint64_t v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_DEFAULT, "Passcode generation not supported. Nothing to migrate", v17, 2u);
      }
      id v8 = v4;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)lockDeviceImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = _MCLogObjects;
  BOOL v5 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Locking device immediately.", buf, 2u);
    }
    MKBLockDeviceNow();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Locking device.", v6, 2u);
    }
    MKBLockDevice();
  }
}

- (void)lockDevice
{
}

- (id)_wrongPasscodeError
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"PASSCODE_ERROR_WRONG_PASSCODE", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  int v10 = [v8 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5011 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, "Unlocking device with passcode.", (uint8_t *)&v23, 2u);
  }
  id v8 = [v6 dataUsingEncoding:4];
  if (MKBGetDeviceLockState() == 3)
  {
    uint64_t v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      int v10 = "MobileKeyBag is disabled.";
      uint64_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_15:
      _os_log_impl(&dword_1A13F0000, v11, v12, v10, (uint8_t *)&v23, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  int v13 = MKBUnlockDevice();
  uint64_t v14 = _MCLogObjects;
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      int v10 = "Successfully unlocked device with passcode.";
      uint64_t v11 = v14;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
LABEL_16:

    id v16 = 0;
LABEL_17:
    BOOL v21 = 1;
    goto LABEL_18;
  }
  int v15 = v13;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    int v23 = 67109120;
    LODWORD(v24) = v15;
    _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "Failed to unlock device with passcode with MKB status: %d", (uint8_t *)&v23, 8u);
  }
  id v16 = [(MCPasscodeManager *)self _wrongPasscodeError];

  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v17 = [v6 length];
  id v18 = _MCLogObjects;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v18;
      id v20 = [v16 MCVerboseDescription];
      int v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_ERROR, "Could not unlock device. Error: %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_INFO, "Device is locked with a passcode.", (uint8_t *)&v23, 2u);
  }
  if (a4)
  {
    id v16 = v16;
    BOOL v21 = 0;
    *a4 = v16;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_18:

  return v21;
}

+ (id)generateSalt
{
  uint32_t v4 = arc4random();
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:4];
  return v2;
}

+ (int)defaultNewPasscodeEntrySimplePasscodeType
{
  return 0;
}

- (int)currentUnlockScreenType
{
  uint64_t v2 = self;
  uint64_t v3 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  LODWORD(v2) = [(MCPasscodeManager *)v2 unlockScreenTypeWithPublicPasscodeDict:v3 isRecovery:0];

  return (int)v2;
}

- (int)recoveryPasscodeUnlockScreenType
{
  uint64_t v2 = self;
  uint64_t v3 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  LODWORD(v2) = [(MCPasscodeManager *)v2 unlockScreenTypeWithPublicPasscodeDict:v3 isRecovery:1];

  return (int)v2;
}

- (int)unlockScreenTypeForUser:(id)a3
{
  uint64_t v3 = self;
  uint32_t v4 = [(MCPasscodeManager *)self _publicPasscodeDictForUser:a3];
  LODWORD(v3) = [(MCPasscodeManager *)v3 unlockScreenTypeWithPublicPasscodeDict:v4 isRecovery:0];

  return (int)v3;
}

- (int)unlockScreenTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    MCKeybagMementoPasscodeGeneration();
  }
  else {
  uint64_t v7 = MCKeybagCurrentPasscodeGeneration();
  }
  id v8 = [(MCPasscodeManager *)self _filterPublicPasscodeDict:v6 forGeneration:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"keyboardType"];
  int v10 = v9;
  if (v9) {
    int v11 = [v9 intValue];
  }
  else {
    int v11 = 2;
  }

  return v11;
}

- (int)currentUnlockSimplePasscodeType
{
  uint64_t v2 = self;
  uint64_t v3 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  LODWORD(v2) = [(MCPasscodeManager *)v2 unlockSimplePasscodeTypeWithPublicPasscodeDict:v3 isRecovery:0];

  return (int)v2;
}

- (int)unlockSimplePasscodeTypeForUser:(id)a3
{
  uint64_t v3 = self;
  uint32_t v4 = [(MCPasscodeManager *)self _publicPasscodeDictForUser:a3];
  LODWORD(v3) = [(MCPasscodeManager *)v3 unlockSimplePasscodeTypeWithPublicPasscodeDict:v4 isRecovery:0];

  return (int)v3;
}

- (int)recoveryPasscodeUnlockSimplePasscodeType
{
  uint64_t v2 = self;
  uint64_t v3 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  LODWORD(v2) = [(MCPasscodeManager *)v2 unlockSimplePasscodeTypeWithPublicPasscodeDict:v3 isRecovery:1];

  return (int)v2;
}

- (int)unlockSimplePasscodeTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    MCKeybagMementoPasscodeGeneration();
  }
  else {
  uint64_t v7 = MCKeybagCurrentPasscodeGeneration();
  }
  id v8 = [(MCPasscodeManager *)self _filterPublicPasscodeDict:v6 forGeneration:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"simpleType"];
  int v10 = v9;
  if (v9)
  {
    int v11 = [v9 intValue];
  }
  else if ([(MCPasscodeManager *)self unlockScreenTypeWithPublicPasscodeDict:v6 isRecovery:v4])
  {
    int v11 = -1;
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (int)newPasscodeEntryScreenType
{
  return [(MCPasscodeManager *)self _minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:0];
}

- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  return [(MCPasscodeManager *)self _newPasscodeEntryScreenTypeWithOutSimplePasscodeType:a3 shouldBeMinimum:1];
}

- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  return [(MCPasscodeManager *)self _newPasscodeEntryScreenTypeWithOutSimplePasscodeType:a3 shouldBeMinimum:0];
}

- (int)_newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3 shouldBeMinimum:(BOOL)a4
{
  BOOL v4 = a4;
  int v19 = -1;
  unsigned int v7 = [(MCPasscodeManager *)self _minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v19];
  if (v7)
  {
    if (v4) {
      goto LABEL_18;
    }
  }
  else
  {
    if (v4)
    {
      int v8 = v19;
      if (v8 <= +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType](MCPasscodeManager, "defaultNewPasscodeEntrySimplePasscodeType"))int v9 = +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType]; {
      else
      }
        int v9 = v19;
      unsigned int v7 = 0;
      int v19 = v9;
      goto LABEL_18;
    }
    int HasBiometricCapability = MCGestaltHasBiometricCapability();
    int v11 = v19;
    if (HasBiometricCapability)
    {
      if (v19 <= 1) {
        int v11 = 1;
      }
    }
    else
    {
      int v11 = v19 & ~(v19 >> 31);
    }
    int v19 = v11;
  }
  os_log_type_t v12 = MCKeybagCurrentPasscodeGeneration();
  int v13 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  uint64_t v14 = [(MCPasscodeManager *)self _filterPublicPasscodeDict:v13 forGeneration:v12];

  int v15 = [v14 objectForKeyedSubscript:@"keyboardType"];
  id v16 = v15;
  if (v15)
  {
    unsigned int v17 = [v15 intValue];
    if (v7 <= v17) {
      unsigned int v7 = v17;
    }
  }

LABEL_18:
  if (a3) {
    *a3 = v19;
  }
  return v7;
}

- (int)_minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  BOOL v4 = +[MCRestrictionManager sharedManager];
  uint64_t v5 = [v4 effectiveValueForSetting:@"passcodeKeyboardComplexity"];
  unsigned int v6 = [v5 intValue];

  unsigned int v7 = [v4 currentRestrictions];
  unsigned int v8 = +[MCPasscodeManager unlockScreenTypeForRestrictions:v7 outSimplePasscodeType:a3];

  if (v6 > v8) {
    unsigned int v8 = v6;
  }

  return v8;
}

+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3
{
  return +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:a3 outSimplePasscodeType:0];
}

+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v5 = a3;
  int v6 = +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType];
  unsigned int v7 = [v5 objectForKey:@"length"];
  int v8 = [v7 unsignedIntValue];

  if (v8)
  {
    int v9 = [v5 objectForKey:@"allDigits"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      if (v8 == 4)
      {
        int v6 = 0;
        int v8 = 0;
        goto LABEL_10;
      }
      if (v8 == 6)
      {
        int v8 = 0;
        int v6 = 1;
        goto LABEL_10;
      }
      int v8 = 1;
    }
    else
    {
      int v8 = 2;
    }
    int v6 = -1;
  }
LABEL_10:
  if (a4) {
    *a4 = v6;
  }

  return v8;
}

- (id)localizedDescriptionOfPasscodePolicy
{
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  uint64_t v3 = [v2 currentRestrictions];
  BOOL v4 = +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:v3];

  return v4;
}

- (id)localizedDescriptionOfDefaultNewPasscodePolicy
{
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  uint64_t v3 = [v2 currentRestrictions];
  BOOL v4 = +[MCPasscodeManager localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:v3];

  return v4;
}

+ (id)localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3
{
  return (id)[a1 _localizedDescriptionOfPasscodePolicyFromRestrictions:a3 shouldBeDefault:0];
}

+ (id)localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:(id)a3
{
  return (id)[a1 _localizedDescriptionOfPasscodePolicyFromRestrictions:a3 shouldBeDefault:1];
}

+ (id)_localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3 shouldBeDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v35 = +[MCRestrictionManager valueForFeature:@"minLength" withRestrictionsDictionary:v5];
  [v35 unsignedIntValue];
  int v6 = +[MCRestrictionManager defaultValueForSetting:@"minLength"];
  [v6 unsignedIntValue];

  unsigned int v7 = +[MCRestrictionManager minimumValueForSetting:@"minLength"];
  [v7 unsignedIntValue];

  int v8 = +[MCRestrictionManager restrictedBoolForFeature:@"allowSimple" withRestrictionsDictionary:v5];
  int v9 = +[MCRestrictionManager restrictedBoolForFeature:@"requireAlphanumeric" withRestrictionsDictionary:v5];
  int v10 = +[MCRestrictionManager valueForFeature:@"minComplexChars" withRestrictionsDictionary:v5];

  if (v10) {
    uint64_t v18 = [v10 unsignedIntValue];
  }
  else {
    uint64_t v18 = 0;
  }
  if (v9 == 1)
  {
    if (v8 == 2) {
      MCLocalizedFormat(@"PASSCODE_CHARACTERS_STRONG", v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else {
      MCLocalizedFormat(@"PASSCODE_CHARACTERS", v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_10;
  }
  if (v8 == 2)
  {
    MCLocalizedFormat(@"PASSCODE_DIGITS_STRONG", v11, v12, v13, v14, v15, v16, v17, v18);
    int v19 = LABEL_10:;
    id v20 = v35;
    goto LABEL_22;
  }
  int v36 = 0;
  BOOL v21 = +[MCPasscodeManager sharedManager];
  v22 = v21;
  if (v4) {
    int v23 = [v21 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v36];
  }
  else {
    int v23 = [v21 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v36];
  }
  int v24 = v23;
  id v20 = v35;

  if (!(v18 | v24))
  {
    if (!v36)
    {
      v32 = @"PASSCODE_4_DIGIT";
      goto LABEL_20;
    }
    if (v36 == 1)
    {
      v32 = @"PASSCODE_6_DIGIT";
LABEL_20:
      uint64_t v33 = MCLocalizedString(v32);
      goto LABEL_21;
    }
  }
  uint64_t v33 = MCLocalizedFormat(@"PASSCODE_DIGITS", v25, v26, v27, v28, v29, v30, v31, v18);
LABEL_21:
  int v19 = (void *)v33;
LABEL_22:

  return v19;
}

+ (BOOL)restrictionsEnforcePasscodePolicy:(id)a3
{
  id v3 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowSimple", v3) == 2|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"forcePIN", v3) == 2|| +[MCRestrictionManager restrictedBoolForFeature:@"requireAlphanumeric" withRestrictionsDictionary:v3] == 2)
  {
    BOOL v4 = 1;
  }
  else
  {
    int v6 = +[MCRestrictionManager valueForFeature:@"minLength" withRestrictionsDictionary:v3];
    if ((int)[v6 intValue] <= 4)
    {
      unsigned int v7 = +[MCRestrictionManager valueForFeature:@"pinHistory" withRestrictionsDictionary:v3];
      if (v7)
      {
        BOOL v4 = 1;
      }
      else
      {
        int v8 = +[MCRestrictionManager valueForFeature:@"maxFailedAttempts" withRestrictionsDictionary:v3];
        if (v8)
        {
          BOOL v4 = 1;
        }
        else
        {
          int v9 = +[MCRestrictionManager valueForFeature:@"minComplexChars" withRestrictionsDictionary:v3];
          if (v9)
          {
            BOOL v4 = 1;
          }
          else
          {
            int v10 = +[MCRestrictionManager valueForFeature:@"maxPINAgeInDays" withRestrictionsDictionary:v3];
            BOOL v4 = v10 != 0;
          }
        }
      }
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)passcode:(id)a3 compliesWithPolicyCheckHistory:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  int v8 = +[MCRestrictionManager sharedManager];
  int v9 = [v8 currentRestrictions];

  LOBYTE(a5) = +[MCPasscodeManager passcode:v7 compliesWithPolicyFromRestrictions:v9 checkHistory:v6 outError:a5];
  return (char)a5;
}

+ (BOOL)passcode:(id)a3 compliesWithPolicyFromRestrictions:(id)a4 checkHistory:(BOOL)a5 outError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = +[MCPasscodeManager characteristicsDictionaryFromPasscode:v10];
  int v13 = [a1 _passcodeCharacteristics:v12 creationDate:0 compliesWithPolicyFromRestrictions:v11 outError:a6];
  if (v13) {
    BOOL v14 = !v7;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    uint64_t v15 = +[MCPasscodeManager sharedManager];
    LOBYTE(v13) = [v15 _checkPasscode:v10 againstHistoryWithRestrictions:v11 outError:a6];
  }
  return v13;
}

- (BOOL)currentPasscodeCompliesWithPolicyFromRestrictions:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (+[MCPasscodeManager isDeviceUnlocked]
    || (+[MCPasscodeManager deviceLockedError],
        (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v23 = 0;
    int v8 = [(MCPasscodeManager *)self _privatePasscodeDictWithOutError:&v23];
    id v7 = v23;
    if (v7
      || !+[MCPasscodeManager isDeviceUnlocked]
      && (+[MCPasscodeManager deviceLockedError],
          (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v16 = MCKeybagCurrentPasscodeGeneration();
      uint64_t v17 = [v8 objectForKeyedSubscript:@"characteristics"];
      uint64_t v18 = [(MCPasscodeManager *)self _filterPasscodeCharacteristics:v17 forGeneration:v16];
      int v19 = [(MCPasscodeManager *)self passcodeCreationDate];
      id v22 = 0;
      +[MCPasscodeManager _passcodeCharacteristics:v18 creationDate:v19 compliesWithPolicyFromRestrictions:v6 outError:&v22];
      id v7 = v22;

      if (!v7) {
        goto LABEL_22;
      }
    }
  }
  if (a4) {
    *a4 = v7;
  }
  int v9 = [v7 domain];
  if ([v9 isEqualToString:@"MCPasscodeErrorDomain"])
  {
    uint64_t v10 = [v7 code];

    if (v10 == 5010)
    {
      id v11 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v21 = 0;
        uint64_t v12 = "Device was locked when passcode compliance check was attempted.";
LABEL_16:
        _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_DEFAULT, v12, v21, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v13 = [v7 domain];
  if ([v13 isEqualToString:@"MCPasscodeErrorDomain"])
  {
    uint64_t v14 = [v7 code];

    if (v14 == 5020)
    {
      id v11 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v21 = 0;
        uint64_t v12 = "Unable to retrieve passcode characteristics when compliance check was attempted.";
        goto LABEL_16;
      }
LABEL_22:
      BOOL v15 = 1;
      goto LABEL_23;
    }
  }
  else
  {
  }
  BOOL v15 = 0;
LABEL_23:

  return v15;
}

- (BOOL)isCurrentPasscodeCompliantOutError:(id *)a3
{
  id v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 currentRestrictions];

  LOBYTE(a3) = [(MCPasscodeManager *)self currentPasscodeCompliesWithPolicyFromRestrictions:v6 outError:a3];
  return (char)a3;
}

- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEFAULT, "Checking for passcode compliance against named policy: %@", buf, 0xCu);
  }
  if (+[MCPasscodeManager isDeviceUnlocked]
    || (+[MCPasscodeManager deviceLockedError],
        (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v28 = 0;
    int v9 = [(MCPasscodeManager *)self _privatePasscodeDictWithOutError:&v28];
    id v8 = v28;
    if (!v8)
    {
      if (+[MCPasscodeManager isDeviceUnlocked]
        || (+[MCPasscodeManager deviceLockedError],
            (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        int v13 = MCKeybagCurrentPasscodeGeneration();
        uint64_t v14 = [v9 objectForKeyedSubscript:@"characteristics"];
        id v8 = [(MCPasscodeManager *)self _filterPasscodeCharacteristics:v14 forGeneration:v13];

        BOOL v15 = [MEMORY[0x1E4F1CA60] dictionary];
        if ([v6 isEqualToString:@"ApplePayChinaPasscodePolicy"])
        {
          [v15 MCSetBoolRestriction:@"allowSimple" value:0];
        }
        else if (![v6 isEqualToString:@"AutoUnlockPasscodePolicy"])
        {
          uint64_t v18 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v30 = v6;
            _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "Unknown passcode compliance policy: %{public}@", buf, 0xCu);
          }
          if (a4)
          {
            uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v27 = MCErrorArray(@"PASSCODE_ERROR_UNKNOWN_POLICY_P_POLICY", v19, v20, v21, v22, v23, v24, v25, v6);
            *a4 = [v26 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5019 descriptionArray:v27 errorType:@"MCFatalError"];
          }
          goto LABEL_19;
        }
        [v15 MCSetValueRestriction:@"minLength" value:&unk_1EF4D0B50];
LABEL_19:
        if ([v15 count])
        {
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = [(MCPasscodeManager *)self passcodeCreationDate];
          char v11 = [v16 _passcodeCharacteristics:v8 creationDate:v17 compliesWithPolicyFromRestrictions:v15 outError:0];
        }
        else
        {
          char v11 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  if (a4) {
    *a4 = v8;
  }
  uint64_t v10 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v6;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Unable to check passcode compliance with named policy %{public}@: %{public}@", buf, 0x16u);
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)_passcodeCharacteristics:(id)a3 creationDate:(id)a4 compliesWithPolicyFromRestrictions:(id)a5 outError:(id *)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v77 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = +[MCRestrictionManager valueForFeature:@"minComplexChars" withRestrictionsDictionary:v8];
  unsigned int v75 = [v10 unsignedIntValue];

  char v11 = +[MCRestrictionManager valueForFeature:@"minLength" withRestrictionsDictionary:v8];
  unsigned int v12 = [v11 unsignedIntValue];

  int v74 = +[MCRestrictionManager restrictedBoolForFeature:@"requireAlphanumeric" withRestrictionsDictionary:v8];
  int v13 = +[MCRestrictionManager restrictedBoolForFeature:@"forcePIN" withRestrictionsDictionary:v8];
  int v14 = +[MCRestrictionManager restrictedBoolForFeature:@"allowSimple" withRestrictionsDictionary:v8];
  BOOL v15 = [v9 objectForKey:@"length"];
  unsigned int v16 = [v15 unsignedIntValue];

  uint64_t v17 = [v9 objectForKey:@"hasRepeatingCharacters"];
  int v18 = [v17 BOOLValue];

  uint64_t v19 = [v9 objectForKey:@"hasAscendingDescendingCharacters"];
  int v73 = [v19 BOOLValue];

  uint64_t v20 = [v9 objectForKey:@"hasAlpha"];
  char v72 = [v20 BOOLValue];

  uint64_t v21 = [v9 objectForKey:@"hasNumber"];
  char v71 = [v21 BOOLValue];

  uint64_t v22 = [v9 objectForKey:@"complexCharactersCount"];

  unsigned int v23 = [v22 unsignedIntValue];
  if ((v13 == 1 || v12 || v75 || v74 == 1 || v14 == 2) && !v16) {
    goto LABEL_19;
  }
  __int16 v31 = +[MCRestrictionManager minimumValueForSetting:@"minLength"];
  unsigned int v32 = [v31 unsignedIntValue];

  if (v12) {
    BOOL v33 = 0;
  }
  else {
    BOOL v33 = v13 == 1;
  }
  if (v33) {
    unsigned int v34 = v32;
  }
  else {
    unsigned int v34 = v12;
  }
  if (v34 < v32 && v16 != 0) {
    unsigned int v34 = v32;
  }
  if (v16 < v34)
  {
LABEL_19:
    int v36 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_SHORT", v24, v25, v26, v27, v28, v29, v30, 0);
    v38 = [v36 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5000 descriptionArray:v37 errorType:@"MCFatalError"];
    v40 = a6;
    uint64_t v39 = v77;
    goto LABEL_44;
  }
  if (v14 == 2) {
    int v41 = v18;
  }
  else {
    int v41 = 0;
  }
  uint64_t v39 = v77;
  if (v41 == 1)
  {
    id v42 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_REPEAT", v24, v25, v26, v27, v28, v29, v30, 0);
    v43 = v42;
    uint64_t v44 = 5003;
LABEL_29:
    v38 = [v43 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:v44 descriptionArray:v37 errorType:@"MCFatalError"];
    v40 = a6;
    goto LABEL_44;
  }
  int v45 = v73;
  if (v14 != 2) {
    int v45 = 0;
  }
  if (v45 == 1)
  {
    v46 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_ASCENDING_DESCENDING", v24, v25, v26, v27, v28, v29, v30, 0);
    v43 = v46;
    uint64_t v44 = 5004;
    goto LABEL_29;
  }
  v40 = a6;
  if (v23 < v75)
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_COMPLEX", v24, v25, v26, v27, v28, v29, v30, 0);
    id v48 = v47;
    uint64_t v49 = 5002;
LABEL_43:
    v38 = [v48 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:v49 descriptionArray:v37 errorType:@"MCFatalError"];
    goto LABEL_44;
  }
  char v50 = v72;
  if (v74 != 1) {
    char v50 = 1;
  }
  if ((v50 & 1) == 0)
  {
    v63 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_ALPHA", v24, v25, v26, v27, v28, v29, v30, 0);
    id v48 = v63;
    uint64_t v49 = 5006;
    goto LABEL_43;
  }
  if (!((v74 != 1) | v71 & 1))
  {
    v64 = (void *)MEMORY[0x1E4F28C58];
    v37 = MCErrorArray(@"PASSCODE_QUALITY_NUMBER", v24, v25, v26, v27, v28, v29, v30, 0);
    id v48 = v64;
    uint64_t v49 = 5005;
    goto LABEL_43;
  }
  v51 = +[MCRestrictionManager valueForFeature:@"maxPINAgeInDays" withRestrictionsDictionary:v8];
  v37 = v51;
  v38 = 0;
  if (v77 && v51)
  {
    unsigned int v52 = [v51 unsignedIntValue];
    v53 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v54 = [MEMORY[0x1E4F1C9C8] date];
    v55 = [v53 components:16 fromDate:v77 toDate:v54 options:0];

    if ([v55 day] < 0 || v52 > (unint64_t)objc_msgSend(v55, "day"))
    {
      v38 = 0;
    }
    else
    {
      v69 = (void *)MEMORY[0x1E4F28C58];
      v70 = MCErrorArray(@"PASSCODE_QUALITY_EXPIRED", v56, v57, v58, v59, v60, v61, v62, 0);
      v38 = [v69 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5007 descriptionArray:v70 errorType:@"MCFatalError"];
    }
  }
LABEL_44:

  if (v38)
  {
    v65 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      v67 = [v38 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v79 = v67;
      _os_log_impl(&dword_1A13F0000, v66, OS_LOG_TYPE_DEFAULT, "Passcode does not meet criteria. Error: %{public}@", buf, 0xCu);
    }
    if (v40) {
      id *v40 = v38;
    }
  }

  return v38 == 0;
}

- (BOOL)_checkPasscode:(id)a3 againstHistoryWithRestrictions:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MCRestrictionManager valueForFeature:@"pinHistory" withRestrictionsDictionary:v9];
  int v11 = [v10 unsignedIntValue];
  if (!v11)
  {

    id v14 = 0;
    goto LABEL_45;
  }
  LODWORD(v12) = v11;
  if (!+[MCPasscodeManager isDeviceUnlocked])
  {
    uint64_t v13 = +[MCPasscodeManager deviceLockedError];
    if (v13)
    {
      id v14 = (id)v13;
LABEL_7:

      goto LABEL_8;
    }
  }
  id v62 = 0;
  BOOL v15 = [(MCPasscodeManager *)self _privatePasscodeDictWithOutError:&v62];
  id v14 = v62;
  if (v14
    || !+[MCPasscodeManager isDeviceUnlocked]
    && (+[MCPasscodeManager deviceLockedError],
        (id v14 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_7;
  }
  uint64_t v24 = [v15 objectForKey:@"history"];
  if ([v24 count])
  {
    uint64_t v12 = v12;
    if ([v24 count] < (unint64_t)v12) {
      uint64_t v12 = [v24 count];
    }
    if (v12)
    {
      id v54 = v8;
      unint64_t v55 = v12;
      char v50 = v15;
      v51 = v10;
      unsigned int v52 = a5;
      id v53 = v9;
      uint64_t v25 = 0;
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      uint64_t v26 = 0;
      int v57 = -1;
      BOOL v27 = 1;
      uint64_t v56 = v24;
      do
      {
        uint64_t v28 = [v24 objectAtIndex:v25];
        uint64_t v29 = [v28 objectForKey:@"hash"];
        uint64_t v30 = [v28 objectForKey:@"salt"];
        __int16 v31 = [v28 objectForKey:@"iterations"];
        unsigned int v32 = [v28 objectForKey:@"hashMethod"];
        uint64_t v33 = [v32 intValue];

        if ([v58 isEqualToData:v30]
          && v57 == v33
          && ([v59 isEqualToNumber:v31] & 1) != 0)
        {
          unsigned int v34 = v26;
        }
        else
        {
          uint64_t v35 = +[MCPasscodeManager hashForPasscode:usingMethod:salt:customIterations:](MCPasscodeManager, "hashForPasscode:usingMethod:salt:customIterations:", v54, v33, v30, [v31 intValue]);

          id v36 = v30;
          id v37 = v31;

          unsigned int v34 = (void *)v35;
          uint64_t v58 = v36;
          uint64_t v59 = v37;
          int v57 = v33;
        }
        uint64_t v26 = v34;
        int v38 = [v34 isEqualToData:v29];

        uint64_t v24 = v56;
        if (v38) {
          break;
        }
        BOOL v27 = ++v25 < v55;
      }
      while (v55 != v25);
      a5 = v52;
      id v9 = v53;
      BOOL v15 = v50;
      uint64_t v10 = v51;
      if (v27)
      {
        v46 = (void *)MEMORY[0x1E4F28C58];
        v47 = MCErrorArray(@"PASSCODE_QUALITY_TOORECENT", v39, v40, v41, v42, v43, v44, v45, 0);
        uint64_t v24 = v56;
        id v14 = [v46 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5008 descriptionArray:v47 errorType:@"MCFatalError"];
      }
      else
      {
        id v14 = 0;
      }
      uint64_t v12 = (uint64_t)v58;
      id v48 = v59;
      id v8 = v54;
    }
    else
    {
      id v48 = 0;
      uint64_t v26 = 0;
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  if (!v14) {
    goto LABEL_45;
  }
LABEL_8:
  if (a5) {
    *a5 = v14;
  }
  unsigned int v16 = [v14 domain];
  if ([v16 isEqualToString:@"MCPasscodeErrorDomain"])
  {
    uint64_t v17 = [v14 code];

    if (v17 == 5010)
    {
      int v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v61 = 0;
        uint64_t v19 = "Device was locked when passcode history check was attempted.";
        uint64_t v20 = (uint8_t *)&v61;
LABEL_20:
        _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
        goto LABEL_45;
      }
      goto LABEL_45;
    }
  }
  else
  {
  }
  uint64_t v21 = [v14 domain];
  if ([v21 isEqualToString:@"MCPasscodeErrorDomain"])
  {
    uint64_t v22 = [v14 code];

    if (v22 == 5020)
    {
      int v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "Unable to retrieve passcode characteristics when compliance check was attempted.";
        uint64_t v20 = buf;
        goto LABEL_20;
      }
LABEL_45:
      BOOL v23 = 1;
      goto LABEL_46;
    }
  }
  else
  {
  }
  BOOL v23 = 0;
LABEL_46:

  return v23;
}

- (id)passcodeCreationDate
{
  id v3 = MCKeybagCurrentPasscodeGeneration();
  BOOL v4 = [(MCPasscodeManager *)self _currentPublicPasscodeDict];
  id v5 = [(MCPasscodeManager *)self _filterPublicPasscodeDict:v4 forGeneration:v3];

  id v6 = [v5 objectForKeyedSubscript:@"creationDate"];

  return v6;
}

- (id)passcodeExpiryDate
{
  id v3 = 0;
  if (MKBGetDeviceLockState() != 3)
  {
    BOOL v4 = +[MCRestrictionManager sharedManager];
    id v5 = [v4 valueForFeature:@"maxPINAgeInDays"];

    if (v5)
    {
      [v5 doubleValue];
      double v7 = v6 * 86400.0;
      id v8 = [(MCPasscodeManager *)self passcodeCreationDate];
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v8 sinceDate:v7];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)recoveryPasscodeExpiryDate
{
  if (MCKeybagMementoBlobExists())
  {
    id v3 = [(MCPasscodeManager *)self passcodeCreationDate];
    BOOL v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v3 sinceDate:259200.0];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (id)characteristicsDictionaryFromPasscode:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 length];
    unint64_t v6 = 0x1E4F28000uLL;
    id v8 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 48, 10);
    unint64_t v38 = v5;
    if (v5)
    {
      uint64_t v7 = 0;
      unsigned __int16 v9 = 0;
      int v10 = 0;
      uint64_t v40 = 0;
      char v39 = 0;
      uint64_t v36 = 0;
      id v37 = v4;
      BOOL v11 = 0;
      char v12 = 0;
      unsigned int v13 = 1;
      LODWORD(v14) = 1;
      while (1)
      {
        uint64_t v15 = [v4 characterAtIndex:v7];
        uint64_t v16 = v15;
        if (v13 != 1)
        {
          if (v15 == v9) {
            v12 |= v10++ > 0;
          }
          else {
            int v10 = 0;
          }
          if (v11)
          {
            LODWORD(v36) = 0;
            BOOL v11 = 1;
          }
          else
          {
            uint64_t v17 = [*(id *)(v6 + 2952) alphanumericCharacterSet];
            if ([v17 characterIsMember:v16])
            {
              unint64_t v18 = v6;
              uint64_t v19 = v8;
              uint64_t v20 = [*(id *)(v18 + 2952) alphanumericCharacterSet];
              if ([v20 characterIsMember:v9])
              {

                if (v9 - 1 == v16 || v9 + 1 == v16)
                {
                  BOOL v11 = (int)v36 > 0;
                  LODWORD(v36) = v36 + 1;
LABEL_18:
                  id v8 = v19;
                  unint64_t v6 = 0x1E4F28000uLL;
                  goto LABEL_19;
                }
              }
              else
              {
              }
              LODWORD(v36) = 0;
              BOOL v11 = 0;
              goto LABEL_18;
            }

            LODWORD(v36) = 0;
            BOOL v11 = 0;
          }
        }
LABEL_19:
        int v21 = [v8 characterIsMember:v16];
        [*(id *)(v6 + 2952) letterCharacterSet];
        BOOL v23 = v22 = v8;
        char v24 = [v23 characterIsMember:v16];

        if (v24)
        {
          BYTE4(v36) = 1;
        }
        else
        {
          int v25 = [v22 characterIsMember:v16];
          v39 |= v25;
          v40 += v25 ^ 1u;
        }
        id v8 = v22;
        uint64_t v14 = v21 & v14;
        uint64_t v7 = v13;
        BOOL v4 = v37;
        BOOL v26 = v38 > v13++;
        unsigned __int16 v9 = v16;
        unint64_t v6 = 0x1E4F28000;
        if (!v26) {
          goto LABEL_26;
        }
      }
    }
    char v12 = 0;
    BOOL v11 = 0;
    BYTE4(v36) = 0;
    char v39 = 0;
    uint64_t v40 = 0;
    uint64_t v14 = 1;
LABEL_26:
    BOOL v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v7);
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    [v27 setObject:v28 forKey:@"length"];

    uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithBool:v12 & 1];
    [v27 setObject:v29 forKey:@"hasRepeatingCharacters"];

    uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
    [v27 setObject:v30 forKey:@"hasAscendingDescendingCharacters"];

    __int16 v31 = [MEMORY[0x1E4F28ED0] numberWithBool:BYTE4(v36) & 1];
    [v27 setObject:v31 forKey:@"hasAlpha"];

    unsigned int v32 = [MEMORY[0x1E4F28ED0] numberWithBool:v39 & 1];
    [v27 setObject:v32 forKey:@"hasNumber"];

    uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v40];
    [v27 setObject:v33 forKey:@"complexCharactersCount"];

    unsigned int v34 = [MEMORY[0x1E4F28ED0] numberWithBool:v14];
    [v27 setObject:v34 forKey:@"allDigits"];
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

+ (id)hashForPasscode:(id)a3 usingMethod:(int)a4 salt:(id)a5 customIterations:(unsigned int)a6
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      uint64_t v15 = [v8 hash];
      uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v15 length:8];
      goto LABEL_5;
    case 1:
      uint64_t v10 = [v8 MCSHA256DigestWithPasscodeSalt];
LABEL_5:
      BOOL v11 = (void *)v10;
      break;
    case 2:
      char v12 = [v8 dataUsingEncoding:4];
      BOOL v11 = [MEMORY[0x1E4F1CA58] dataWithLength:20];
      SecKeyFromPassphraseDataHMACSHA1();

      break;
    case 3:
      unsigned int v13 = [v8 dataUsingEncoding:4];
      BOOL v11 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
      SecKeyFromPassphraseDataHMACSHA256();

      break;
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

@end
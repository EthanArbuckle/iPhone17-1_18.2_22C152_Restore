@interface DKPasscodeProvider
- (BOOL)isDevicePasscodeSet;
- (BOOL)isScreenTimePasscodeSet;
- (BOOL)verifyPasscode:(id)a3;
- (BOOL)verifyScreenTimePasscode:(id)a3;
- (int)simplePasscodeType;
- (int)unlockType;
@end

@implementation DKPasscodeProvider

- (BOOL)isDevicePasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (int)unlockType
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 unlockScreenType];

  return v3;
}

- (int)simplePasscodeType
{
  int v4 = 0;
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 unlockScreenTypeWithOutSimplePasscodeType:&v4];

  return v4;
}

- (BOOL)verifyPasscode:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = (void *)MEMORY[0x263F53C50];
  id v5 = a3;
  v6 = [v4 sharedConnection];
  id v14 = 0;
  char v7 = [v6 unlockDeviceWithPasscode:v5 outError:&v14];

  id v8 = v14;
  if ((v7 & 1) == 0)
  {
    v9 = _DKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (_DKIsInternalInstall())
      {
        int v11 = 0;
        v12 = v8;
      }
      else if (v8)
      {
        v13 = NSString;
        int v3 = [v8 domain];
        v12 = [v13 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v8, "code")];
        int v11 = 1;
      }
      else
      {
        int v11 = 0;
        v12 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_error_impl(&dword_237B3F000, v9, OS_LOG_TYPE_ERROR, "Failed to verify passcode: %{public}@", buf, 0xCu);
      if (v11)
      {
      }
    }
  }
  return v7;
}

- (BOOL)isScreenTimePasscodeSet
{
  return [MEMORY[0x263F67F58] settingEnabled];
}

- (BOOL)verifyScreenTimePasscode:(id)a3
{
  return [MEMORY[0x263F67F58] validatePIN:a3];
}

@end
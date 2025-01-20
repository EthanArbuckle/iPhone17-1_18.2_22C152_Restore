@interface LAPSPasscodePersistenceMKBAdapter
- (BOOL)isPasscodeLockedOut;
- (id)_deviceLockStateValueForKey:(id)a3;
- (id)_mementoStateValueForKey:(id)a3;
- (id)_persistenceErrorWithPasscodeVerificationStatus:(int)a3;
- (id)_verifyPasscode:(id)a3 options:(id)a4;
- (id)backoffTimeout;
- (id)failedPasscodeAttempts;
- (id)failedPasscodeRecoveryAttempts;
- (id)maxPasscodeRecoveryAttempts;
- (id)verifyPasscode:(id)a3;
- (id)verifyRecoveryPasscode:(id)a3;
@end

@implementation LAPSPasscodePersistenceMKBAdapter

- (BOOL)isPasscodeLockedOut
{
  v2 = (void *)MKBGetDeviceLockStateInfo();
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F55A48]];
  v4 = (void *)v3;
  v5 = &unk_26F32BBC0;
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  unsigned int v7 = [v6 unsignedIntValue];
  return (v7 >> 3) & 1;
}

- (id)backoffTimeout
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self _deviceLockStateValueForKey:*MEMORY[0x263F55A40]];
}

- (id)failedPasscodeAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self _deviceLockStateValueForKey:*MEMORY[0x263F55A50]];
}

- (id)verifyPasscode:(id)a3
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self _verifyPasscode:a3 options:0];
}

- (id)failedPasscodeRecoveryAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self _mementoStateValueForKey:@"MementoBlobFailedAttempts"];
}

- (id)maxPasscodeRecoveryAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self _mementoStateValueForKey:@"MementoBlobMaxUnlockAttempts"];
}

- (id)verifyRecoveryPasscode:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"UseMementoBlob";
  v10[0] = MEMORY[0x263EFFA88];
  v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  unsigned int v7 = [(LAPSPasscodePersistenceMKBAdapter *)self _verifyPasscode:v5 options:v6];

  return v7;
}

- (id)_verifyPasscode:(id)a3 options:(id)a4
{
  uint64_t v5 = MKBVerifyPasswordWithContext();

  return [(LAPSPasscodePersistenceMKBAdapter *)self _persistenceErrorWithPasscodeVerificationStatus:v5];
}

- (id)_persistenceErrorWithPasscodeVerificationStatus:(int)a3
{
  if (a3)
  {
    if (a3 == -3)
    {
      uint64_t v3 = +[LAPSErrorBuilder invalidPasscodeError];
    }
    else
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"Passcode verification failed (status: %d)", *(void *)&a3);
      uint64_t v3 = +[LAPSErrorBuilder genericErrorWithDebugDescription:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_mementoStateValueForKey:(id)a3
{
  id v3 = a3;
  if (MKBKeyBagMementoGetBlobState())
  {
    v4 = 0;
  }
  else
  {
    v4 = [0 objectForKeyedSubscript:v3];
  }

  return v4;
}

- (id)_deviceLockStateValueForKey:(id)a3
{
  id v3 = a3;
  v4 = (void *)MKBGetDeviceLockStateInfo();
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

@end
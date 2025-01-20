@interface LAPSPasscodePersistenceAdapter
- (BOOL)canChangePasscode;
- (BOOL)canRemovePasscode:(id *)a3;
- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6;
- (BOOL)hasPasscode;
- (BOOL)isPasscodeLockedOut;
- (BOOL)isPasscodeRecoveryAvailable;
- (BOOL)isPasscodeRecoveryEnabled;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRecoverySupported;
- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6;
- (BOOL)verifyFixedLengthNumericPasscodeIsStrong:(id)a3;
- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4;
- (BOOL)verifyVariableLengthAlphanumericPasscodeIsStrong:(id)a3;
- (LAPSPasscodePersistenceAdapter)init;
- (id)backoffTimeout;
- (id)clearRecoveryPasscode;
- (id)defaultNewPasscodeType;
- (id)failedPasscodeAttempts;
- (id)failedPasscodeRecoveryAttempts;
- (id)localizedPasscodeRequirements;
- (id)maxPasscodeRecoveryAttempts;
- (id)passcodeCreationDate;
- (id)passcodeType;
- (id)recoveryPasscodeType;
- (id)setPasscodeRecoveryEnabled:(BOOL)a3;
- (id)simplestAllowedNewPasscodeType;
- (id)verifyPasscode:(id)a3;
- (id)verifyRecoveryPasscode:(id)a3;
- (void)reportPasscodeDidChangeTo:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodePersistenceAdapter

- (LAPSPasscodePersistenceAdapter)init
{
  v14.receiver = self;
  v14.super_class = (Class)LAPSPasscodePersistenceAdapter;
  v2 = [(LAPSPasscodePersistenceAdapter *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(LAPSPasscodePersistenceLAAdapter);
    laAdapter = v2->_laAdapter;
    v2->_laAdapter = v3;

    v5 = objc_alloc_init(LAPSPasscodePersistenceMCAdapter);
    mcAdapter = v2->_mcAdapter;
    v2->_mcAdapter = v5;

    v7 = objc_alloc_init(LAPSPasscodePersistenceCDPAdapter);
    cdpAdapter = v2->_cdpAdapter;
    v2->_cdpAdapter = v7;

    v9 = objc_alloc_init(LAPSPasscodePersistenceMKBAdapter);
    mkbAdapter = v2->_mkbAdapter;
    v2->_mkbAdapter = v9;

    v11 = objc_alloc_init(LAPSPasscodePersistenceSecAdapter);
    secAdapter = v2->_secAdapter;
    v2->_secAdapter = v11;
  }
  return v2;
}

- (BOOL)hasPasscode
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter hasPasscode];
}

- (id)passcodeCreationDate
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter passcodeCreationDate];
}

- (BOOL)canChangePasscode
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter canChangePasscode];
}

- (BOOL)canRemovePasscode:(id *)a3
{
  BOOL v5 = -[LAPSPasscodePersistenceMCAdapter canRemovePasscode:](self->_mcAdapter, "canRemovePasscode:");
  if (v5)
  {
    laAdapter = self->_laAdapter;
    LOBYTE(v5) = [(LAPSPasscodePersistenceLAAdapter *)laAdapter canRemovePasscode:a3];
  }
  return v5;
}

- (id)passcodeType
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter passcodeType];
}

- (id)backoffTimeout
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self->_mkbAdapter backoffTimeout];
}

- (id)failedPasscodeAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self->_mkbAdapter failedPasscodeAttempts];
}

- (id)verifyPasscode:(id)a3
{
  mkbAdapter = self->_mkbAdapter;
  v4 = [a3 data];
  BOOL v5 = [(LAPSPasscodePersistenceMKBAdapter *)mkbAdapter verifyPasscode:v4];

  return v5;
}

- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  mcAdapter = self->_mcAdapter;
  id v10 = a4;
  v11 = [a3 passcode];
  v12 = [v10 passcode];

  LOBYTE(a6) = [(LAPSPasscodePersistenceMCAdapter *)mcAdapter changePasscode:v11 to:v12 enableRecovery:v7 error:a6];
  return (char)a6;
}

- (id)simplestAllowedNewPasscodeType
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter simplestAllowedNewPasscodeType];
}

- (id)defaultNewPasscodeType
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter defaultNewPasscodeType];
}

- (id)localizedPasscodeRequirements
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter localizedPasscodeRequirements];
}

- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4
{
  mcAdapter = self->_mcAdapter;
  v6 = [a3 passcode];
  LOBYTE(a4) = [(LAPSPasscodePersistenceMCAdapter *)mcAdapter verifyNewPasscodeMeetsPlatformRequirements:v6 error:a4];

  return (char)a4;
}

- (BOOL)verifyFixedLengthNumericPasscodeIsStrong:(id)a3
{
  secAdapter = self->_secAdapter;
  v4 = [a3 passcode];
  LOBYTE(secAdapter) = [(LAPSPasscodePersistenceSecAdapter *)secAdapter verifyFixedLengthNumericPasscodeIsStrong:v4];

  return (char)secAdapter;
}

- (BOOL)verifyVariableLengthAlphanumericPasscodeIsStrong:(id)a3
{
  secAdapter = self->_secAdapter;
  v4 = [a3 passcode];
  LOBYTE(secAdapter) = [(LAPSPasscodePersistenceSecAdapter *)secAdapter verifyVariableLengthAlphanumericPasscodeIsStrong:v4];

  return (char)secAdapter;
}

- (void)reportPasscodeDidChangeTo:(id)a3 completion:(id)a4
{
  cdpAdapter = self->_cdpAdapter;
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 passcode];
  v8 = [v7 type];

  [(LAPSPasscodePersistenceCDPAdapter *)cdpAdapter reportPasscodeDidChangeTo:v9 passcodeType:v8 completion:v6];
}

- (id)recoveryPasscodeType
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter recoveryPasscodeType];
}

- (BOOL)isPasscodeRecoveryAvailable
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter isPasscodeRecoveryAvailable];
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter isPasscodeRecoveryEnabled];
}

- (id)setPasscodeRecoveryEnabled:(BOOL)a3
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter setPasscodeRecoveryEnabled:a3];
}

- (BOOL)isPasscodeRecoverySupported
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter isPasscodeRecoverySupported];
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter isPasscodeRecoveryRestricted];
}

- (BOOL)isPasscodeLockedOut
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self->_mkbAdapter isPasscodeLockedOut];
}

- (id)verifyRecoveryPasscode:(id)a3
{
  mkbAdapter = self->_mkbAdapter;
  v4 = [a3 data];
  BOOL v5 = [(LAPSPasscodePersistenceMKBAdapter *)mkbAdapter verifyRecoveryPasscode:v4];

  return v5;
}

- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  mcAdapter = self->_mcAdapter;
  id v10 = a4;
  v11 = [a3 passcode];
  v12 = [v10 passcode];

  LOBYTE(a6) = [(LAPSPasscodePersistenceMCAdapter *)mcAdapter performRecovery:v11 newPasscode:v12 enableRecovery:v7 error:a6];
  return (char)a6;
}

- (id)clearRecoveryPasscode
{
  return [(LAPSPasscodePersistenceMCAdapter *)self->_mcAdapter clearRecoveryPasscode];
}

- (id)failedPasscodeRecoveryAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self->_mkbAdapter failedPasscodeRecoveryAttempts];
}

- (id)maxPasscodeRecoveryAttempts
{
  return [(LAPSPasscodePersistenceMKBAdapter *)self->_mkbAdapter maxPasscodeRecoveryAttempts];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secAdapter, 0);
  objc_storeStrong((id *)&self->_mkbAdapter, 0);
  objc_storeStrong((id *)&self->_cdpAdapter, 0);
  objc_storeStrong((id *)&self->_mcAdapter, 0);

  objc_storeStrong((id *)&self->_laAdapter, 0);
}

@end
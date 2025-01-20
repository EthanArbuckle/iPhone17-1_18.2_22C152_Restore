@interface LAPSPasscodePersistenceMCAdapter
- (BOOL)canChangePasscode;
- (BOOL)canRemovePasscode:(id *)a3;
- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6;
- (BOOL)hasPasscode;
- (BOOL)isPasscodeRecoveryAvailable;
- (BOOL)isPasscodeRecoveryEnabled;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRecoverySupported;
- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6;
- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4;
- (id)_mcProfileConnection;
- (id)_passcodeTypeForQuery:(id)a3;
- (id)clearRecoveryPasscode;
- (id)defaultNewPasscodeType;
- (id)localizedPasscodeRequirements;
- (id)passcodeCreationDate;
- (id)passcodeType;
- (id)recoveryPasscodeType;
- (id)setPasscodeRecoveryEnabled:(BOOL)a3;
- (id)simplestAllowedNewPasscodeType;
@end

@implementation LAPSPasscodePersistenceMCAdapter

- (BOOL)hasPasscode
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (id)passcodeCreationDate
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 passcodeCreationDate];

  return v3;
}

- (BOOL)canChangePasscode
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 isPasscodeModificationAllowed];

  return v3;
}

- (BOOL)canRemovePasscode:(id *)a3
{
  if ([(LAPSPasscodePersistenceMCAdapter *)self canChangePasscode])
  {
    v5 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
    int v6 = [v5 isPasscodeRequired] ^ 1;

    if (!a3) {
      return v6;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
    if (!a3) {
      return v6;
    }
  }
  if ((v6 & 1) == 0)
  {
    *a3 = +[LAPSErrorBuilder deniedByMDMError];
  }
  return v6;
}

- (id)passcodeType
{
  if ([(LAPSPasscodePersistenceMCAdapter *)self hasPasscode])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__LAPSPasscodePersistenceMCAdapter_passcodeType__block_invoke;
    v5[3] = &unk_26506F480;
    v5[4] = self;
    char v3 = [(LAPSPasscodePersistenceMCAdapter *)self _passcodeTypeForQuery:v5];
  }
  else
  {
    char v3 = +[LAPSPasscodeType noneType];
  }

  return v3;
}

uint64_t __48__LAPSPasscodePersistenceMCAdapter_passcodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) _mcProfileConnection];
  uint64_t v4 = [v3 unlockScreenTypeWithOutSimplePasscodeType:a2];

  return v4;
}

- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  LOBYTE(a6) = [v12 changePasscodeFrom:v11 to:v10 skipRecovery:!v7 outError:a6];

  return (char)a6;
}

- (id)simplestAllowedNewPasscodeType
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__LAPSPasscodePersistenceMCAdapter_simplestAllowedNewPasscodeType__block_invoke;
  v4[3] = &unk_26506F480;
  v4[4] = self;
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _passcodeTypeForQuery:v4];

  return v2;
}

uint64_t __66__LAPSPasscodePersistenceMCAdapter_simplestAllowedNewPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) _mcProfileConnection];
  uint64_t v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:a2];

  return v4;
}

- (id)defaultNewPasscodeType
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__LAPSPasscodePersistenceMCAdapter_defaultNewPasscodeType__block_invoke;
  v4[3] = &unk_26506F480;
  v4[4] = self;
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _passcodeTypeForQuery:v4];

  return v2;
}

uint64_t __58__LAPSPasscodePersistenceMCAdapter_defaultNewPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) _mcProfileConnection];
  uint64_t v4 = [v3 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:a2];

  return v4;
}

- (id)localizedPasscodeRequirements
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 localizedDescriptionOfDefaultNewPasscodeConstraints];

  return v3;
}

- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  LOBYTE(a4) = [v7 passcode:v6 meetsCurrentConstraintsOutError:a4];

  return (char)a4;
}

- (id)recoveryPasscodeType
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__LAPSPasscodePersistenceMCAdapter_recoveryPasscodeType__block_invoke;
  v4[3] = &unk_26506F480;
  v4[4] = self;
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _passcodeTypeForQuery:v4];

  return v2;
}

uint64_t __56__LAPSPasscodePersistenceMCAdapter_recoveryPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) _mcProfileConnection];
  uint64_t v4 = [v3 recoveryPasscodeUnlockScreenTypeWithOutSimplePasscodeType:a2];

  return v4;
}

- (BOOL)isPasscodeRecoveryAvailable
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 recoveryPasscodeAvailable];

  return v3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 isPasscodeRecoveryAllowed];

  return v3;
}

- (id)setPasscodeRecoveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = LACLogPasscodeService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    if (v3) {
      v5 = "YES";
    }
    int v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_23F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring request to set passcodeRecoveryEnabled = %s", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)isPasscodeRecoverySupported
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 isPasscodeRecoverySupported];

  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 isPasscodeRecoveryRestricted];

  return v3;
}

- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  LOBYTE(a6) = [v12 changePasscodeWithRecoveryPasscode:v11 to:v10 skipRecovery:!v7 outError:a6];

  return (char)a6;
}

- (id)clearRecoveryPasscode
{
  v2 = [(LAPSPasscodePersistenceMCAdapter *)self _mcProfileConnection];
  char v3 = [v2 clearRecoveryPasscode];

  return v3;
}

- (id)_mcProfileConnection
{
  return (id)[MEMORY[0x263F53C58] sharedConnection];
}

- (id)_passcodeTypeForQuery:(id)a3
{
  int v6 = -1;
  int v3 = (*((uint64_t (**)(id, int *))a3 + 2))(a3, &v6);
  if (v3 == 2) {
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    uint64_t v4 = +[LAPSPasscodeType numericCustomDigitsType];
    goto LABEL_12;
  }
  if (v3)
  {
LABEL_8:
    uint64_t v4 = +[LAPSPasscodeType alphanumericType];
    goto LABEL_12;
  }
  if (v6 == 1)
  {
    uint64_t v4 = +[LAPSPasscodeType numericSixDigitsType];
  }
  else
  {
    if (v6)
    {
      if (v6 == -1)
      {
        uint64_t v4 = +[LAPSPasscodeType noneType];
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    uint64_t v4 = +[LAPSPasscodeType numericFourDigitsType];
  }
LABEL_12:

  return v4;
}

@end
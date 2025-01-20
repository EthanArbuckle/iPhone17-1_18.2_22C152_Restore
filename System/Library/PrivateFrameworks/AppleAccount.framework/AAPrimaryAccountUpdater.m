@interface AAPrimaryAccountUpdater
+ (id)orderedVersions;
- (AAPrimaryAccountUpdater)initWithAccount:(id)a3;
- (BOOL)performVersionUpdate0ToVersion1;
- (BOOL)performVersionUpdate1ToVersion2;
@end

@implementation AAPrimaryAccountUpdater

- (AAPrimaryAccountUpdater)initWithAccount:(id)a3
{
  id v6 = a3;
  if ((objc_msgSend(v6, "aa_isAccountClass:", @"primary") & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"AAPrimaryAccountUpdater.m" lineNumber:28 description:@"Account must be primary AppleAccount!"];
  }
  v7 = objc_msgSend(v6, "_aa_primaryAccountUpdaterVersion");
  uint64_t v8 = [v7 unsignedIntegerValue];

  v13.receiver = self;
  v13.super_class = (Class)AAPrimaryAccountUpdater;
  v9 = [(AAVersionUpdater *)&v13 initWithStartingVersion:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
  }

  return v10;
}

- (BOOL)performVersionUpdate0ToVersion1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F17598];
  if ([(ACAccount *)self->_appleAccount isProvisionedForDataclass:*MEMORY[0x1E4F17598]]&& ([(ACAccount *)self->_appleAccount isEnabledForDataclass:v3] & 1) == 0)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      appleAccount = self->_appleAccount;
      int v11 = 136315394;
      v12 = "-[AAPrimaryAccountUpdater performVersionUpdate0ToVersion1]";
      __int16 v13 = 2112;
      v14 = appleAccount;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "%s enabling Freeform for account %@", (uint8_t *)&v11, 0x16u);
    }

    [(ACAccount *)self->_appleAccount setEnabled:1 forDataclass:v3];
  }
  else
  {
    v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_appleAccount;
      int v11 = 136315394;
      v12 = "-[AAPrimaryAccountUpdater performVersionUpdate0ToVersion1]";
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "%s Freeform is not provisioned for accounts %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = self->_appleAccount;
  v9 = [NSNumber numberWithUnsignedInt:1];
  [(ACAccount *)v8 _aa_setPrimaryAccountUpdaterVersion:v9];

  return 1;
}

- (BOOL)performVersionUpdate1ToVersion2
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[AADeviceModelHelper isDeviceiPad])
  {
    uint64_t v3 = *MEMORY[0x1E4F175A0];
    if ([(ACAccount *)self->_appleAccount isEnabledForDataclass:*MEMORY[0x1E4F175A0]])
    {
      v4 = _AALogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        appleAccount = self->_appleAccount;
        int v9 = 136315394;
        v10 = "-[AAPrimaryAccountUpdater performVersionUpdate1ToVersion2]";
        __int16 v11 = 2112;
        v12 = appleAccount;
        _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Device is an iPad: %s disabling Health for account %@", (uint8_t *)&v9, 0x16u);
      }

      [(ACAccount *)self->_appleAccount setEnabled:0 forDataclass:v3];
    }
  }
  id v6 = self->_appleAccount;
  v7 = [NSNumber numberWithUnsignedInt:2];
  [(ACAccount *)v6 _aa_setPrimaryAccountUpdaterVersion:v7];

  return 1;
}

+ (id)orderedVersions
{
  return &unk_1EF483D80;
}

- (void).cxx_destruct
{
}

@end
@interface CEMSecurityInformationCommand_StatusSecurityInfo
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithHardwareEncryptionCaps:(id)a3 withPasscodePresent:(id)a4 withPasscodeCompliant:(id)a5 withPasscodeCompliantWithProfiles:(id)a6 withPasscodeLockGracePeriod:(id)a7 withPasscodeLockGracePeriodEnforced:(id)a8 withFDEEnabled:(id)a9 withFDEHasPersonalRecoveryKey:(id)a10 withFDEHasInstitutionalRecoveryKey:(id)a11 withFDEPersonalRecoveryKeyCMS:(id)a12 withFDEPersonalRecoveryKeyDeviceKey:(id)a13 withSystemIntegrityProtectionEnabled:(id)a14 withFirewallSettings:(id)a15 withFirmwarePasswordStatus:(id)a16;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings)statusFirewallSettings;
- (CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus)statusFirmwarePasswordStatus;
- (NSData)statusFDEPersonalRecoveryKeyCMS;
- (NSNumber)statusFDEEnabled;
- (NSNumber)statusFDEHasInstitutionalRecoveryKey;
- (NSNumber)statusFDEHasPersonalRecoveryKey;
- (NSNumber)statusHardwareEncryptionCaps;
- (NSNumber)statusPasscodeCompliant;
- (NSNumber)statusPasscodeCompliantWithProfiles;
- (NSNumber)statusPasscodeLockGracePeriod;
- (NSNumber)statusPasscodeLockGracePeriodEnforced;
- (NSNumber)statusPasscodePresent;
- (NSNumber)statusSystemIntegrityProtectionEnabled;
- (NSString)statusFDEPersonalRecoveryKeyDeviceKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusFDEEnabled:(id)a3;
- (void)setStatusFDEHasInstitutionalRecoveryKey:(id)a3;
- (void)setStatusFDEHasPersonalRecoveryKey:(id)a3;
- (void)setStatusFDEPersonalRecoveryKeyCMS:(id)a3;
- (void)setStatusFDEPersonalRecoveryKeyDeviceKey:(id)a3;
- (void)setStatusFirewallSettings:(id)a3;
- (void)setStatusFirmwarePasswordStatus:(id)a3;
- (void)setStatusHardwareEncryptionCaps:(id)a3;
- (void)setStatusPasscodeCompliant:(id)a3;
- (void)setStatusPasscodeCompliantWithProfiles:(id)a3;
- (void)setStatusPasscodeLockGracePeriod:(id)a3;
- (void)setStatusPasscodeLockGracePeriodEnforced:(id)a3;
- (void)setStatusPasscodePresent:(id)a3;
- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3;
@end

@implementation CEMSecurityInformationCommand_StatusSecurityInfo

+ (NSSet)allowedStatusKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HardwareEncryptionCaps";
  v6[1] = @"PasscodePresent";
  v6[2] = @"PasscodeCompliant";
  v6[3] = @"PasscodeCompliantWithProfiles";
  v6[4] = @"PasscodeLockGracePeriod";
  v6[5] = @"PasscodeLockGracePeriodEnforced";
  v6[6] = @"FDE_Enabled";
  v6[7] = @"FDE_HasPersonalRecoveryKey";
  v6[8] = @"FDE_HasInstitutionalRecoveryKey";
  v6[9] = @"FDE_PersonalRecoveryKeyCMS";
  v6[10] = @"FDE_PersonalRecoveryKeyDeviceKey";
  v6[11] = @"SystemIntegrityProtectionEnabled";
  v6[12] = @"FirewallSettings";
  v6[13] = @"FirmwarePasswordStatus";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithHardwareEncryptionCaps:(id)a3 withPasscodePresent:(id)a4 withPasscodeCompliant:(id)a5 withPasscodeCompliantWithProfiles:(id)a6 withPasscodeLockGracePeriod:(id)a7 withPasscodeLockGracePeriodEnforced:(id)a8 withFDEEnabled:(id)a9 withFDEHasPersonalRecoveryKey:(id)a10 withFDEHasInstitutionalRecoveryKey:(id)a11 withFDEPersonalRecoveryKeyCMS:(id)a12 withFDEPersonalRecoveryKeyDeviceKey:(id)a13 withSystemIntegrityProtectionEnabled:(id)a14 withFirewallSettings:(id)a15 withFirmwarePasswordStatus:(id)a16
{
  id v37 = a16;
  id v36 = a15;
  id v19 = a14;
  id v35 = a13;
  id v34 = a12;
  id v33 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = objc_opt_new();
  [v28 setStatusHardwareEncryptionCaps:v27];

  [v28 setStatusPasscodePresent:v26];
  [v28 setStatusPasscodeCompliant:v25];

  [v28 setStatusPasscodeCompliantWithProfiles:v24];
  [v28 setStatusPasscodeLockGracePeriod:v23];

  [v28 setStatusPasscodeLockGracePeriodEnforced:v22];
  [v28 setStatusFDEEnabled:v21];

  [v28 setStatusFDEHasPersonalRecoveryKey:v20];
  [v28 setStatusFDEHasInstitutionalRecoveryKey:v33];

  [v28 setStatusFDEPersonalRecoveryKeyCMS:v34];
  [v28 setStatusFDEPersonalRecoveryKeyDeviceKey:v35];

  [v28 setStatusSystemIntegrityProtectionEnabled:v19];
  [v28 setStatusFirewallSettings:v36];

  [v28 setStatusFirmwarePasswordStatus:v37];

  return v28;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v59[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityInformationCommand_StatusSecurityInfo allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_23;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v59[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v57 = 0;
    v15 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"HardwareEncryptionCaps" isRequired:0 defaultValue:0 error:&v57];
    id v12 = v57;
    statusHardwareEncryptionCaps = self->_statusHardwareEncryptionCaps;
    self->_statusHardwareEncryptionCaps = v15;

    if (!v12)
    {
      id v56 = 0;
      v17 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PasscodePresent" isRequired:0 defaultValue:0 error:&v56];
      id v12 = v56;
      statusPasscodePresent = self->_statusPasscodePresent;
      self->_statusPasscodePresent = v17;

      if (!v12)
      {
        id v55 = 0;
        id v19 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PasscodeCompliant" isRequired:0 defaultValue:0 error:&v55];
        id v12 = v55;
        statusPasscodeCompliant = self->_statusPasscodeCompliant;
        self->_statusPasscodeCompliant = v19;

        if (!v12)
        {
          id v54 = 0;
          id v21 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PasscodeCompliantWithProfiles" isRequired:0 defaultValue:0 error:&v54];
          id v12 = v54;
          statusPasscodeCompliantWithProfiles = self->_statusPasscodeCompliantWithProfiles;
          self->_statusPasscodeCompliantWithProfiles = v21;

          if (!v12)
          {
            id v53 = 0;
            id v23 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"PasscodeLockGracePeriod" isRequired:0 defaultValue:0 error:&v53];
            id v12 = v53;
            statusPasscodeLockGracePeriod = self->_statusPasscodeLockGracePeriod;
            self->_statusPasscodeLockGracePeriod = v23;

            if (!v12)
            {
              id v52 = 0;
              id v25 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"PasscodeLockGracePeriodEnforced" isRequired:0 defaultValue:0 error:&v52];
              id v12 = v52;
              statusPasscodeLockGracePeriodEnforced = self->_statusPasscodeLockGracePeriodEnforced;
              self->_statusPasscodeLockGracePeriodEnforced = v25;

              if (!v12)
              {
                id v51 = 0;
                id v27 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"FDE_Enabled" isRequired:0 defaultValue:0 error:&v51];
                id v12 = v51;
                statusFDEEnabled = self->_statusFDEEnabled;
                self->_statusFDEEnabled = v27;

                if (!v12)
                {
                  id v50 = 0;
                  v29 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"FDE_HasPersonalRecoveryKey" isRequired:0 defaultValue:0 error:&v50];
                  id v12 = v50;
                  statusFDEHasPersonalRecoveryKey = self->_statusFDEHasPersonalRecoveryKey;
                  self->_statusFDEHasPersonalRecoveryKey = v29;

                  if (!v12)
                  {
                    id v49 = 0;
                    v31 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"FDE_HasInstitutionalRecoveryKey" isRequired:0 defaultValue:0 error:&v49];
                    id v12 = v49;
                    statusFDEHasInstitutionalRecoveryKey = self->_statusFDEHasInstitutionalRecoveryKey;
                    self->_statusFDEHasInstitutionalRecoveryKey = v31;

                    if (!v12)
                    {
                      id v48 = 0;
                      id v33 = [(CEMPayloadBase *)self loadDataFromDictionary:v6 withKey:@"FDE_PersonalRecoveryKeyCMS" isRequired:0 defaultValue:0 error:&v48];
                      id v12 = v48;
                      statusFDEPersonalRecoveryKeyCMS = self->_statusFDEPersonalRecoveryKeyCMS;
                      self->_statusFDEPersonalRecoveryKeyCMS = v33;

                      if (!v12)
                      {
                        id v47 = 0;
                        id v35 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"FDE_PersonalRecoveryKeyDeviceKey" isRequired:0 defaultValue:0 error:&v47];
                        id v12 = v47;
                        statusFDEPersonalRecoveryKeyDeviceKey = self->_statusFDEPersonalRecoveryKeyDeviceKey;
                        self->_statusFDEPersonalRecoveryKeyDeviceKey = v35;

                        if (!v12)
                        {
                          id v46 = 0;
                          id v37 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SystemIntegrityProtectionEnabled" isRequired:0 defaultValue:0 error:&v46];
                          id v12 = v46;
                          statusSystemIntegrityProtectionEnabled = self->_statusSystemIntegrityProtectionEnabled;
                          self->_statusSystemIntegrityProtectionEnabled = v37;

                          if (!v12)
                          {
                            id v45 = 0;
                            v39 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"FirewallSettings" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v45];
                            id v12 = v45;
                            statusFirewallSettings = self->_statusFirewallSettings;
                            self->_statusFirewallSettings = v39;

                            if (!v12)
                            {
                              id v44 = 0;
                              v41 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"FirmwarePasswordStatus" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v44];
                              id v12 = v44;
                              statusFirmwarePasswordStatus = self->_statusFirmwarePasswordStatus;
                              self->_statusFirmwarePasswordStatus = v41;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_23:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v3 withKey:@"HardwareEncryptionCaps" withValue:self->_statusHardwareEncryptionCaps isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"PasscodePresent" withValue:self->_statusPasscodePresent isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"PasscodeCompliant" withValue:self->_statusPasscodeCompliant isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"PasscodeCompliantWithProfiles" withValue:self->_statusPasscodeCompliantWithProfiles isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v3 withKey:@"PasscodeLockGracePeriod" withValue:self->_statusPasscodeLockGracePeriod isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v3 withKey:@"PasscodeLockGracePeriodEnforced" withValue:self->_statusPasscodeLockGracePeriodEnforced isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"FDE_Enabled" withValue:self->_statusFDEEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"FDE_HasPersonalRecoveryKey" withValue:self->_statusFDEHasPersonalRecoveryKey isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"FDE_HasInstitutionalRecoveryKey" withValue:self->_statusFDEHasInstitutionalRecoveryKey isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDataIntoDictionary:v3 withKey:@"FDE_PersonalRecoveryKeyCMS" withValue:self->_statusFDEPersonalRecoveryKeyCMS isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"FDE_PersonalRecoveryKeyDeviceKey" withValue:self->_statusFDEPersonalRecoveryKeyDeviceKey isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"SystemIntegrityProtectionEnabled" withValue:self->_statusSystemIntegrityProtectionEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"FirewallSettings" withValue:self->_statusFirewallSettings dictSerializer:&__block_literal_global_147 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"FirmwarePasswordStatus" withValue:self->_statusFirmwarePasswordStatus dictSerializer:&__block_literal_global_149 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CEMSecurityInformationCommand_StatusSecurityInfo;
  v4 = [(CEMPayloadBase *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_statusHardwareEncryptionCaps copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusPasscodePresent copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_statusPasscodeCompliant copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_statusPasscodeCompliantWithProfiles copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_statusPasscodeLockGracePeriod copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_statusPasscodeLockGracePeriodEnforced copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_statusFDEEnabled copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_statusFDEHasPersonalRecoveryKey copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_statusFDEHasInstitutionalRecoveryKey copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSData *)self->_statusFDEPersonalRecoveryKeyCMS copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSString *)self->_statusFDEPersonalRecoveryKeyDeviceKey copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_statusSystemIntegrityProtectionEnabled copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings *)self->_statusFirewallSettings copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus *)self->_statusFirmwarePasswordStatus copy];
  v32 = (void *)v4[15];
  v4[15] = v31;

  return v4;
}

- (NSNumber)statusHardwareEncryptionCaps
{
  return self->_statusHardwareEncryptionCaps;
}

- (void)setStatusHardwareEncryptionCaps:(id)a3
{
}

- (NSNumber)statusPasscodePresent
{
  return self->_statusPasscodePresent;
}

- (void)setStatusPasscodePresent:(id)a3
{
}

- (NSNumber)statusPasscodeCompliant
{
  return self->_statusPasscodeCompliant;
}

- (void)setStatusPasscodeCompliant:(id)a3
{
}

- (NSNumber)statusPasscodeCompliantWithProfiles
{
  return self->_statusPasscodeCompliantWithProfiles;
}

- (void)setStatusPasscodeCompliantWithProfiles:(id)a3
{
}

- (NSNumber)statusPasscodeLockGracePeriod
{
  return self->_statusPasscodeLockGracePeriod;
}

- (void)setStatusPasscodeLockGracePeriod:(id)a3
{
}

- (NSNumber)statusPasscodeLockGracePeriodEnforced
{
  return self->_statusPasscodeLockGracePeriodEnforced;
}

- (void)setStatusPasscodeLockGracePeriodEnforced:(id)a3
{
}

- (NSNumber)statusFDEEnabled
{
  return self->_statusFDEEnabled;
}

- (void)setStatusFDEEnabled:(id)a3
{
}

- (NSNumber)statusFDEHasPersonalRecoveryKey
{
  return self->_statusFDEHasPersonalRecoveryKey;
}

- (void)setStatusFDEHasPersonalRecoveryKey:(id)a3
{
}

- (NSNumber)statusFDEHasInstitutionalRecoveryKey
{
  return self->_statusFDEHasInstitutionalRecoveryKey;
}

- (void)setStatusFDEHasInstitutionalRecoveryKey:(id)a3
{
}

- (NSData)statusFDEPersonalRecoveryKeyCMS
{
  return self->_statusFDEPersonalRecoveryKeyCMS;
}

- (void)setStatusFDEPersonalRecoveryKeyCMS:(id)a3
{
}

- (NSString)statusFDEPersonalRecoveryKeyDeviceKey
{
  return self->_statusFDEPersonalRecoveryKeyDeviceKey;
}

- (void)setStatusFDEPersonalRecoveryKeyDeviceKey:(id)a3
{
}

- (NSNumber)statusSystemIntegrityProtectionEnabled
{
  return self->_statusSystemIntegrityProtectionEnabled;
}

- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3
{
}

- (CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings)statusFirewallSettings
{
  return self->_statusFirewallSettings;
}

- (void)setStatusFirewallSettings:(id)a3
{
}

- (CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus)statusFirmwarePasswordStatus
{
  return self->_statusFirmwarePasswordStatus;
}

- (void)setStatusFirmwarePasswordStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusFirmwarePasswordStatus, 0);
  objc_storeStrong((id *)&self->_statusFirewallSettings, 0);
  objc_storeStrong((id *)&self->_statusSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_statusFDEPersonalRecoveryKeyDeviceKey, 0);
  objc_storeStrong((id *)&self->_statusFDEPersonalRecoveryKeyCMS, 0);
  objc_storeStrong((id *)&self->_statusFDEHasInstitutionalRecoveryKey, 0);
  objc_storeStrong((id *)&self->_statusFDEHasPersonalRecoveryKey, 0);
  objc_storeStrong((id *)&self->_statusFDEEnabled, 0);
  objc_storeStrong((id *)&self->_statusPasscodeLockGracePeriodEnforced, 0);
  objc_storeStrong((id *)&self->_statusPasscodeLockGracePeriod, 0);
  objc_storeStrong((id *)&self->_statusPasscodeCompliantWithProfiles, 0);
  objc_storeStrong((id *)&self->_statusPasscodeCompliant, 0);
  objc_storeStrong((id *)&self->_statusPasscodePresent, 0);

  objc_storeStrong((id *)&self->_statusHardwareEncryptionCaps, 0);
}

@end
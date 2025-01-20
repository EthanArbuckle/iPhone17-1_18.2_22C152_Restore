@interface MCEmailAccountPayloadBase
- (BOOL)SMIMEEnabled;
- (BOOL)SMIMEEncryptByDefaultUserOverrideable;
- (BOOL)SMIMEEncryptionIdentityUserOverrideable;
- (BOOL)SMIMEPerMessageSwitchEnabled;
- (BOOL)SMIMESigningIdentityUserOverrideable;
- (BOOL)SMIMESigningUserOverrideable;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)isMailDropEnabled;
- (BOOL)isRecentsSyncingDisabled;
- (BOOL)preventAppSheet;
- (BOOL)preventMove;
- (MCEmailAccountPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)SMIMEEncryptionIdentityPersistentID;
- (NSData)SMIMESigningIdentityPersistentID;
- (NSNumber)SMIMEEnabledNum;
- (NSNumber)SMIMEEncryptionEnabled;
- (NSNumber)SMIMEPerMessageSwitchEnabledNum;
- (NSNumber)SMIMESigningEnabled;
- (NSNumber)isMailDropEnabledNum;
- (NSNumber)isRecentsSyncingDisabledNum;
- (NSNumber)preventAppSheetNum;
- (NSNumber)preventMoveNum;
- (NSString)SMIMEEncryptionIdentityUUID;
- (NSString)SMIMESigningIdentityUUID;
- (NSString)VPNUUID;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)addSMIMEEncryptionPayloadKeysTo:(id)a3;
- (void)setIsMailDropEnabled:(BOOL)a3;
- (void)setIsMailDropEnabledNum:(id)a3;
- (void)setIsRecentsSyncingDisabled:(BOOL)a3;
- (void)setIsRecentsSyncingDisabledNum:(id)a3;
- (void)setPreventAppSheet:(BOOL)a3;
- (void)setPreventAppSheetNum:(id)a3;
- (void)setPreventMove:(BOOL)a3;
- (void)setPreventMoveNum:(id)a3;
- (void)setSMIMEEnabled:(BOOL)a3;
- (void)setSMIMEEnabledNum:(id)a3;
- (void)setSMIMEEncryptByDefaultUserOverrideable:(BOOL)a3;
- (void)setSMIMEEncryptionEnabled:(id)a3;
- (void)setSMIMEEncryptionIdentityPersistentID:(id)a3;
- (void)setSMIMEEncryptionIdentityUUID:(id)a3;
- (void)setSMIMEEncryptionIdentityUserOverrideable:(BOOL)a3;
- (void)setSMIMEPerMessageSwitchEnabled:(BOOL)a3;
- (void)setSMIMEPerMessageSwitchEnabledNum:(id)a3;
- (void)setSMIMESigningEnabled:(id)a3;
- (void)setSMIMESigningIdentityPersistentID:(id)a3;
- (void)setSMIMESigningIdentityUUID:(id)a3;
- (void)setSMIMESigningIdentityUserOverrideable:(BOOL)a3;
- (void)setSMIMESigningUserOverrideable:(BOOL)a3;
@end

@implementation MCEmailAccountPayloadBase

- (MCEmailAccountPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v77.receiver = self;
  v77.super_class = (Class)MCEmailAccountPayloadBase;
  v9 = [(MCPayload *)&v77 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v76 = 0;
    uint64_t v10 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"PreventMove" isRequired:0 outError:&v76];
    id v11 = v76;
    preventMoveNum = v9->_preventMoveNum;
    v9->_preventMoveNum = (NSNumber *)v10;

    if (v11) {
      goto LABEL_22;
    }
    v9->_preventMove = [(NSNumber *)v9->_preventMoveNum BOOLValue];
    id v75 = 0;
    uint64_t v13 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"PreventAppSheet" isRequired:0 outError:&v75];
    id v11 = v75;
    preventAppSheetNum = v9->_preventAppSheetNum;
    v9->_preventAppSheetNum = (NSNumber *)v13;

    if (v11) {
      goto LABEL_22;
    }
    v9->_preventAppSheet = [(NSNumber *)v9->_preventAppSheetNum BOOLValue];
    id v74 = 0;
    uint64_t v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMESigningEnabled" isRequired:0 outError:&v74];
    id v11 = v74;
    SMIMESigningEnabled = v9->_SMIMESigningEnabled;
    v9->_SMIMESigningEnabled = (NSNumber *)v15;

    if (v11) {
      goto LABEL_22;
    }
    id v73 = 0;
    v17 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMESigningUserOverrideable" isRequired:0 outError:&v73];
    id v11 = v73;
    v9->_SMIMESigningUserOverrideable = [v17 BOOLValue];

    if (v11) {
      goto LABEL_22;
    }
    id v72 = 0;
    uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEncryptByDefault" isRequired:0 outError:&v72];
    id v11 = v72;
    p_SMIMEEncryptionEnabled = (id *)&v9->_SMIMEEncryptionEnabled;
    SMIMEEncryptionEnabled = v9->_SMIMEEncryptionEnabled;
    v9->_SMIMEEncryptionEnabled = (NSNumber *)v18;

    if (v11) {
      goto LABEL_22;
    }
    id v71 = 0;
    id v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEncryptionEnabled" isRequired:0 outError:&v71];
    id v21 = v71;
    if (v21) {
      goto LABEL_21;
    }
    if (!*p_SMIMEEncryptionEnabled) {
      objc_storeStrong((id *)&v9->_SMIMEEncryptionEnabled, v11);
    }
    id v70 = 0;
    v22 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEncryptByDefaultUserOverrideable" isRequired:0 outError:&v70];
    id v21 = v70;
    v9->_SMIMEEncryptByDefaultUserOverrideable = [v22 BOOLValue];

    if (v21) {
      goto LABEL_21;
    }
    id v69 = 0;
    obja = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"disableMailRecentsSyncing" isRequired:0 outError:&v69];
    id v21 = v69;
    isRecentsSyncingDisabledNum = v9->_isRecentsSyncingDisabledNum;
    v9->_isRecentsSyncingDisabledNum = obja;

    if (v21) {
      goto LABEL_21;
    }
    v9->_isRecentsSyncingDisabled = [(NSNumber *)v9->_isRecentsSyncingDisabledNum BOOLValue];
    id v68 = 0;
    objb = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"allowMailDrop" isRequired:0 outError:&v68];
    id v21 = v68;
    isMailDropEnabledNum = v9->_isMailDropEnabledNum;
    v9->_isMailDropEnabledNum = objb;

    if (v21) {
      goto LABEL_21;
    }
    v9->_isMailDropEnabled = [(NSNumber *)v9->_isMailDropEnabledNum BOOLValue];
    id v67 = 0;
    uint64_t v25 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v67];
    id v21 = v67;
    VPNUUID = v9->_VPNUUID;
    v9->_VPNUUID = (NSString *)v25;

    if (v21) {
      goto LABEL_21;
    }
    id v66 = 0;
    uint64_t v27 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEnableEncryptionPerMessageSwitch" isRequired:0 outError:&v66];
    id v21 = v66;
    p_SMIMEPerMessageSwitchEnabledNum = (void **)&v9->_SMIMEPerMessageSwitchEnabledNum;
    SMIMEPerMessageSwitchEnabledNum = v9->_SMIMEPerMessageSwitchEnabledNum;
    v9->_SMIMEPerMessageSwitchEnabledNum = (NSNumber *)v27;

    if (v21)
    {
LABEL_21:

      id v11 = v21;
LABEL_22:
      v33 = -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11, v53);
      v34 = v33;
      if (a5) {
        *a5 = v33;
      }
      v35 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        v37 = objc_opt_class();
        id v38 = v37;
        v39 = [v34 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v79 = v37;
        __int16 v80 = 2114;
        v81 = v39;
        _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v9 = 0;
      goto LABEL_27;
    }
    id v65 = 0;
    id obj = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEnablePerMessageSwitch" isRequired:0 outError:&v65];
    id v21 = v65;
    if (v21) {
      goto LABEL_20;
    }
    v30 = *p_SMIMEPerMessageSwitchEnabledNum;
    if (!*p_SMIMEPerMessageSwitchEnabledNum)
    {
      objc_storeStrong((id *)&v9->_SMIMEPerMessageSwitchEnabledNum, obj);
      v30 = *p_SMIMEPerMessageSwitchEnabledNum;
    }
    v9->_SMIMEPerMessageSwitchEnabled = [v30 BOOLValue];
    id v64 = 0;
    v31 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMESigningCertificateUUIDUserOverrideable" isRequired:0 outError:&v64];
    id v21 = v64;
    v9->_SMIMESigningIdentityUserOverrideable = [v31 BOOLValue];

    if (v21
      || (id v63 = 0,
          [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEncryptionCertificateUUIDUserOverrideable" isRequired:0 outError:&v63], v32 = objc_claimAutoreleasedReturnValue(), id v21 = v63, v9->_SMIMEEncryptionIdentityUserOverrideable = objc_msgSend(v32, "BOOLValue"), v32, v21))
    {
LABEL_20:

      goto LABEL_21;
    }
    v41 = [(MCPayload *)v9 profile];
    int v42 = [v41 isStub];

    if (v42)
    {
      id v62 = 0;
      uint64_t v43 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEnabled" isRequired:0 outError:&v62];
      id v21 = v62;
      SMIMEEnabledNum = v9->_SMIMEEnabledNum;
      v9->_SMIMEEnabledNum = (NSNumber *)v43;

      if (v21) {
        goto LABEL_20;
      }
      v9->_SMIMEEnabled = [(NSNumber *)v9->_SMIMEEnabledNum BOOLValue];
      id v61 = 0;
      uint64_t v45 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMESigningIdentityPersistentID" isRequired:0 outError:&v61];
      id v21 = v61;
      SMIMESigningIdentityPersistentID = v9->_SMIMESigningIdentityPersistentID;
      v9->_SMIMESigningIdentityPersistentID = (NSData *)v45;

      if (v21) {
        goto LABEL_20;
      }
      id v60 = 0;
      uint64_t v47 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SMIMEEncryptionIdentityPersistentID" isRequired:0 outError:&v60];
      id v21 = v60;
      SMIMEEncryptionIdentityPersistentID = v9->_SMIMEEncryptionIdentityPersistentID;
      v9->_SMIMEEncryptionIdentityPersistentID = (NSData *)v47;

      if (v21) {
        goto LABEL_20;
      }
    }
    else
    {
      id v59 = 0;
      uint64_t v49 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SMIMESigningCertificateUUID" isRequired:0 outError:&v59];
      id v21 = v59;
      SMIMESigningIdentityUUID = v9->_SMIMESigningIdentityUUID;
      v9->_SMIMESigningIdentityUUID = (NSString *)v49;

      if (v21) {
        goto LABEL_20;
      }
      id v58 = 0;
      uint64_t v51 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SMIMEEncryptionCertificateUUID" isRequired:0 outError:&v58];
      id v21 = v58;
      SMIMEEncryptionIdentityUUID = v9->_SMIMEEncryptionIdentityUUID;
      uint64_t v53 = 136;
      v9->_SMIMEEncryptionIdentityUUID = (NSString *)v51;

      if (v21) {
        goto LABEL_20;
      }
      if (v9->_SMIMEEncryptionIdentityUUID && !*p_SMIMEEncryptionEnabled)
      {
        id *p_SMIMEEncryptionEnabled = (id)MEMORY[0x1E4F1CC38];
      }
      if ([(NSNumber *)v9->_SMIMESigningEnabled BOOLValue]
        || ([*p_SMIMEEncryptionEnabled BOOLValue] & 1) != 0
        || v9->_SMIMESigningIdentityUUID
        || *(Class *)((char *)&v9->super.super.isa + v54)
        || v9->_SMIMESigningUserOverrideable
        || v9->_SMIMESigningIdentityUserOverrideable
        || v9->_SMIMEEncryptionIdentityUserOverrideable
        || v9->_SMIMEEncryptByDefaultUserOverrideable)
      {
        v9->_SMIMEEnabled = 1;
      }
    }
    v34 = obj;
LABEL_27:
  }
  return v9;
}

- (id)stubDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)MCEmailAccountPayloadBase;
  v3 = [(MCPayload *)&v15 stubDictionary];
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preventMove];
  [v3 setObject:v4 forKey:@"PreventMove"];

  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preventAppSheet];
  [v3 setObject:v5 forKey:@"PreventAppSheet"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMEEnabled];
  [v3 setObject:v6 forKey:@"SMIMEEnabled"];

  [v3 MCSetObjectIfNotNil:self->_SMIMESigningEnabled forKey:@"SMIMESigningEnabled"];
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMESigningUserOverrideable];
  [v3 setObject:v7 forKeyedSubscript:@"SMIMESigningUserOverrideable"];

  [v3 MCSetObjectIfNotNil:self->_SMIMEEncryptionEnabled forKey:@"SMIMEEncryptionEnabled"];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isRecentsSyncingDisabled];
  [v3 setObject:v8 forKey:@"disableMailRecentsSyncing"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMailDropEnabled];
  [v3 setObject:v9 forKey:@"allowMailDrop"];

  [v3 MCSetObjectIfNotNil:self->_VPNUUID forKey:@"VPNUUID"];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMEPerMessageSwitchEnabled];
  [v3 setObject:v10 forKeyedSubscript:@"SMIMEEnablePerMessageSwitch"];

  id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMEEncryptByDefaultUserOverrideable];
  [v3 setObject:v11 forKeyedSubscript:@"SMIMEEncryptByDefaultUserOverrideable"];

  [v3 MCSetObjectIfNotNil:self->_SMIMESigningIdentityPersistentID forKey:@"SMIMESigningIdentityPersistentID"];
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMESigningIdentityUserOverrideable];
  [v3 setObject:v12 forKeyedSubscript:@"SMIMESigningCertificateUUIDUserOverrideable"];

  [v3 MCSetObjectIfNotNil:self->_SMIMEEncryptionIdentityPersistentID forKey:@"SMIMEEncryptionIdentityPersistentID"];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_SMIMEEncryptionIdentityUserOverrideable];
  [v3 setObject:v13 forKeyedSubscript:@"SMIMEEncryptionCertificateUUIDUserOverrideable"];

  return v3;
}

- (id)verboseDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)MCEmailAccountPayloadBase;
  v4 = [(MCPayload *)&v14 verboseDescription];
  v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  v6 = [(MCPayload *)self profile];
  char v7 = [v6 isStub];

  if ((v7 & 1) == 0)
  {
    if (self->_preventMove) {
      [v5 appendFormat:@"Prevent Move             : Yes\n"];
    }
    if (self->_preventAppSheet) {
      [v5 appendFormat:@"Prevent App Sheet        : Yes\n"];
    }
    if (self->_isRecentsSyncingDisabled) {
      [v5 appendFormat:@"Recents sync disabled    : Yes\n"];
    }
    if (self->_isMailDropEnabled) {
      [v5 appendFormat:@"Mail Drop enabled        : Yes\n"];
    }
    if (self->_VPNUUID) {
      [v5 appendFormat:@"VPNUUID                  : %@\n", self->_VPNUUID];
    }
    BOOL v8 = self->_SMIMESigningEnabled
      || self->_SMIMESigningUserOverrideable
      || self->_SMIMESigningIdentityUUID
      || self->_SMIMESigningIdentityPersistentID
      || self->_SMIMESigningIdentityUserOverrideable;
    if (self->_SMIMEEnabled)
    {
      [v5 appendFormat:@"S/MIME\n"];
      if (self->_SMIMEEnabled) {
        [v5 appendFormat:@"  Enabled: Yes\n"];
      }
    }
    if (v8) {
      [v5 appendFormat:@"  Signing\n"];
    }
    SMIMESigningEnabled = self->_SMIMESigningEnabled;
    if (SMIMESigningEnabled)
    {
      if ([(NSNumber *)SMIMESigningEnabled BOOLValue]) {
        uint64_t v10 = @"Yes";
      }
      else {
        uint64_t v10 = @"No";
      }
      [v5 appendFormat:@"    Enabled               : %@\n", v10];
    }
    if (self->_SMIMESigningUserOverrideable) {
      [v5 appendFormat:@"    User Overrideable     : Enabled\n"];
    }
    if (self->_SMIMESigningIdentityUUID) {
      [v5 appendFormat:@"    Cert                  : %@\n", self->_SMIMESigningIdentityUUID];
    }
    if (self->_SMIMESigningIdentityPersistentID) {
      [v5 appendFormat:@"    Cert                  : Present\n"];
    }
    if (self->_SMIMESigningIdentityUserOverrideable) {
      [v5 appendFormat:@"    Cert User Overrideable: Enabled\n"];
    }
    if ([(NSNumber *)self->_SMIMEEncryptionEnabled BOOLValue]
      || self->_SMIMEEncryptionIdentityUUID
      || self->_SMIMEEncryptionIdentityPersistentID
      || self->_SMIMEEncryptionIdentityUserOverrideable
      || self->_SMIMEPerMessageSwitchEnabled
      || self->_SMIMEEncryptByDefaultUserOverrideable)
    {
      [v5 appendFormat:@"  Encryption\n"];
    }
    SMIMEEncryptionEnabled = self->_SMIMEEncryptionEnabled;
    if (SMIMEEncryptionEnabled)
    {
      if ([(NSNumber *)SMIMEEncryptionEnabled BOOLValue]) {
        v12 = @"Yes";
      }
      else {
        v12 = @"No";
      }
      [v5 appendFormat:@"    On by Default            : %@\n", v12];
    }
    if (self->_SMIMEEncryptByDefaultUserOverrideable) {
      [v5 appendFormat:@"    Default user overrideable: Yes\n"];
    }
    if (self->_SMIMEEncryptionIdentityUUID) {
      [v5 appendFormat:@"    Cert                     : %@\n", self->_SMIMEEncryptionIdentityUUID];
    }
    if (self->_SMIMEEncryptionIdentityPersistentID) {
      [v5 appendFormat:@"    Cert                     : Present\n"];
    }
    if (self->_SMIMEEncryptionIdentityUserOverrideable) {
      [v5 appendFormat:@"    Cert User Overrideable   : Enabled\n"];
    }
    if (self->_SMIMEPerMessageSwitchEnabled) {
      [v5 appendFormat:@"    Per-message switch       : Enabled\n"];
    }
  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  if (self->_preventMoveNum)
  {
    v5 = [MCKeyValue alloc];
    v6 = MCLocalizedStringForBool([(NSNumber *)self->_preventMoveNum BOOLValue]);
    char v7 = MCLocalizedString(@"EMAIL_ACCOUNT_PREVENT_MOVE");
    BOOL v8 = [(MCKeyValue *)v5 initWithLocalizedString:v6 localizedKey:v7];
    [v4 addObject:v8];
  }
  if (self->_preventAppSheetNum)
  {
    v9 = [MCKeyValue alloc];
    uint64_t v10 = MCLocalizedStringForBool([(NSNumber *)self->_preventAppSheetNum BOOLValue]);
    id v11 = MCLocalizedString(@"EMAIL_ACCOUNT_PREVENT_APP_SHEET");
    v12 = [(MCKeyValue *)v9 initWithLocalizedString:v10 localizedKey:v11];
    [v4 addObject:v12];
  }
  if (self->_isRecentsSyncingDisabledNum)
  {
    uint64_t v13 = [MCKeyValue alloc];
    objc_super v14 = MCLocalizedStringForBool([(NSNumber *)self->_isRecentsSyncingDisabledNum BOOLValue]);
    objc_super v15 = MCLocalizedString(@"EMAIL_ACCOUNT_RECENTS_SYNC_DISABLED");
    v16 = [(MCKeyValue *)v13 initWithLocalizedString:v14 localizedKey:v15];
    [v4 addObject:v16];
  }
  if (self->_isMailDropEnabledNum)
  {
    v17 = [MCKeyValue alloc];
    uint64_t v18 = MCLocalizedStringForBool([(NSNumber *)self->_isMailDropEnabledNum BOOLValue]);
    v19 = MCLocalizedString(@"EMAIL_ACCOUNT_MAIL_DROP_ENABLED");
    v20 = [(MCKeyValue *)v17 initWithLocalizedString:v18 localizedKey:v19];
    [v4 addObject:v20];
  }
  if (self->_VPNUUID)
  {
    id v21 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    v23 = MCLocalizedString(@"ACCOUNT_VPNUUID");
    v24 = [(MCKeyValue *)v21 initWithLocalizedString:VPNUUID localizedKey:v23];

    [v4 addObject:v24];
  }
  if ([v4 count])
  {
    uint64_t v25 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v25];

    uint64_t v26 = objc_opt_new();
    v4 = (void *)v26;
  }
  if (self->_SMIMEEnabledNum)
  {
    uint64_t v27 = [MCKeyValue alloc];
    v28 = MCLocalizedStringForBool([(NSNumber *)self->_SMIMEEnabledNum BOOLValue]);
    v29 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENABLED");
    v30 = [(MCKeyValue *)v27 initWithLocalizedString:v28 localizedKey:v29];
    [v4 addObject:v30];
  }
  if (self->_SMIMESigningEnabled)
  {
    v31 = [MCKeyValue alloc];
    v32 = MCLocalizedStringForBool([(NSNumber *)self->_SMIMESigningEnabled BOOLValue]);
    v33 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_SIGNING_ENABLED");
    v34 = [(MCKeyValue *)v31 initWithLocalizedString:v32 localizedKey:v33];
    [v4 addObject:v34];
  }
  if (self->_SMIMESigningUserOverrideable)
  {
    v35 = [MCKeyValue alloc];
    v36 = MCLocalizedStringForBool(self->_SMIMESigningUserOverrideable);
    v37 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_SIGNING_USER_OVERRIDEABLE");
    id v38 = [(MCKeyValue *)v35 initWithLocalizedString:v36 localizedKey:v37];
    [v4 addObject:v38];
  }
  if (self->_SMIMESigningIdentityPersistentID)
  {
    v39 = [(MCPayload *)self profile];
    uint64_t v40 = [v39 subjectSummaryFromCertificateWithPersistentID:self->_SMIMESigningIdentityPersistentID];
  }
  else
  {
    if (!self->_SMIMESigningIdentityUUID) {
      goto LABEL_25;
    }
    v39 = [(MCPayload *)self profile];
    uint64_t v40 = [v39 subjectSummaryFromCertificatePayloadWithUUID:self->_SMIMESigningIdentityUUID];
  }
  v41 = (void *)v40;

  if (v41)
  {
    int v42 = [MCKeyValue alloc];
    uint64_t v43 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_SIGNING_IDENTITY");
    v44 = [(MCKeyValue *)v42 initWithLocalizedString:v41 localizedKey:v43];

    [v4 addObject:v44];
  }
LABEL_25:
  if (self->_SMIMESigningIdentityUserOverrideable)
  {
    uint64_t v45 = [MCKeyValue alloc];
    v46 = MCLocalizedStringForBool(self->_SMIMESigningIdentityUserOverrideable);
    uint64_t v47 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_SIGNING_IDENTITY_USER_OVERRIDEABLE");
    v48 = [(MCKeyValue *)v45 initWithLocalizedString:v46 localizedKey:v47];
    [v4 addObject:v48];
  }
  [(MCEmailAccountPayloadBase *)self addSMIMEEncryptionPayloadKeysTo:v4];
  if ([v4 count])
  {
    uint64_t v49 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v49];
  }
  if (![v3 count])
  {

    id v3 = 0;
  }

  return v3;
}

- (void)addSMIMEEncryptionPayloadKeysTo:(id)a3
{
  id v33 = a3;
  int v4 = [(NSNumber *)self->_SMIMEEncryptionEnabled BOOLValue];
  if (self->_SMIMEEncryptionIdentityPersistentID)
  {
    v5 = [(MCPayload *)self profile];
    uint64_t v6 = [v5 subjectSummaryFromCertificateWithPersistentID:self->_SMIMEEncryptionIdentityPersistentID];
  }
  else
  {
    if (!self->_SMIMEEncryptionIdentityUUID)
    {
      uint64_t v7 = 0;
      goto LABEL_6;
    }
    v5 = [(MCPayload *)self profile];
    uint64_t v6 = [v5 subjectSummaryFromCertificatePayloadWithUUID:self->_SMIMEEncryptionIdentityUUID];
  }
  uint64_t v7 = v6;

LABEL_6:
  if ((v4 & 1) == 0 && !self->_SMIMEPerMessageSwitchEnabled)
  {
    if (!((uint64_t)self->_SMIMEEncryptionIdentityUUID | v7))
    {
      if (!self->_SMIMEEncryptByDefaultUserOverrideable) {
        goto LABEL_31;
      }
      goto LABEL_15;
    }
    if (!self->_SMIMEEncryptByDefaultUserOverrideable)
    {
      v9 = [MCKeyValue alloc];
      uint64_t v10 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENCRYPTION_MISCONFIGURED_NOT_ENABLEABLE");
      id v11 = @"EMAIL_ACCOUNT_SMIME_ENCRYPTION_ENABLED";
      goto LABEL_29;
    }
  }
  if (!v7)
  {
LABEL_15:
    if (self->_SMIMEEncryptionIdentityUserOverrideable)
    {
      char v8 = 1;
      goto LABEL_17;
    }
    v9 = [MCKeyValue alloc];
    uint64_t v10 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENCRYPTION_MISCONFIGURED_IDENTITY");
    id v11 = @"EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY";
LABEL_29:
    v32 = MCLocalizedString(v11);
    v29 = [(MCKeyValue *)v9 initWithLocalizedString:v10 localizedKey:v32];

    [v33 addObject:v29];
    goto LABEL_30;
  }
  char v8 = 0;
LABEL_17:
  if (self->_SMIMEEncryptByDefaultUserOverrideable || self->_SMIMEPerMessageSwitchEnabled)
  {
    v12 = [MCKeyValue alloc];
    uint64_t v13 = MCLocalizedStringForBool(v4);
    objc_super v14 = @"EMAIL_ACCOUNT_SMIME_ENCRYPT_BY_DEFAULT";
  }
  else
  {
    v12 = [MCKeyValue alloc];
    uint64_t v13 = MCLocalizedStringForBool(v4);
    objc_super v14 = @"EMAIL_ACCOUNT_SMIME_ENCRYPTION_ENABLED";
  }
  objc_super v15 = MCLocalizedString(v14);
  v16 = [(MCKeyValue *)v12 initWithLocalizedString:v13 localizedKey:v15];

  [v33 addObject:v16];
  if (self->_SMIMEEncryptByDefaultUserOverrideable)
  {
    v17 = [MCKeyValue alloc];
    uint64_t v18 = MCLocalizedStringForBool(self->_SMIMEEncryptByDefaultUserOverrideable);
    v19 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENCRYPT_BY_DEFAULT_USER_OVERRIDEABLE");
    v20 = [(MCKeyValue *)v17 initWithLocalizedString:v18 localizedKey:v19];

    [v33 addObject:v20];
  }
  if (self->_SMIMEPerMessageSwitchEnabled)
  {
    id v21 = [MCKeyValue alloc];
    v22 = MCLocalizedStringForBool(self->_SMIMEPerMessageSwitchEnabled);
    v23 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_PER_MESSAGE_SWITCH_ENABLED");
    v24 = [(MCKeyValue *)v21 initWithLocalizedString:v22 localizedKey:v23];

    [v33 addObject:v24];
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v25 = [MCKeyValue alloc];
    uint64_t v26 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY");
    uint64_t v27 = [(MCKeyValue *)v25 initWithLocalizedString:v7 localizedKey:v26];

    [v33 addObject:v27];
  }
  if (self->_SMIMEEncryptionIdentityUserOverrideable)
  {
    v28 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMEEncryptionIdentityUserOverrideable);
    v29 = (MCKeyValue *)objc_claimAutoreleasedReturnValue();
    v30 = MCLocalizedString(@"EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY_USER_OVERRIDEABLE");
    v31 = [(MCKeyValue *)v28 initWithLocalizedString:v29 localizedKey:v30];
    [v33 addObject:v31];

LABEL_30:
  }
LABEL_31:
}

- (BOOL)containsSensitiveUserInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MCEmailAccountPayloadBase;
  if ([(MCPayload *)&v9 containsSensitiveUserInformation]) {
    return 1;
  }
  int v4 = [(MCEmailAccountPayloadBase *)self SMIMESigningIdentityUUID];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(MCEmailAccountPayloadBase *)self SMIMEEncryptionIdentityUUID];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v6 = [(MCEmailAccountPayloadBase *)self SMIMESigningIdentityPersistentID];
      if (v6)
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v7 = [(MCEmailAccountPayloadBase *)self SMIMEEncryptionIdentityPersistentID];
        BOOL v3 = v7 != 0;
      }
    }
  }
  return v3;
}

- (BOOL)preventMove
{
  return self->_preventMove;
}

- (void)setPreventMove:(BOOL)a3
{
  self->_preventMove = a3;
}

- (BOOL)preventAppSheet
{
  return self->_preventAppSheet;
}

- (void)setPreventAppSheet:(BOOL)a3
{
  self->_preventAppSheet = a3;
}

- (BOOL)SMIMEEnabled
{
  return self->_SMIMEEnabled;
}

- (void)setSMIMEEnabled:(BOOL)a3
{
  self->_SMIMEEnabled = a3;
}

- (BOOL)isRecentsSyncingDisabled
{
  return self->_isRecentsSyncingDisabled;
}

- (void)setIsRecentsSyncingDisabled:(BOOL)a3
{
  self->_isRecentsSyncingDisabled = a3;
}

- (BOOL)isMailDropEnabled
{
  return self->_isMailDropEnabled;
}

- (void)setIsMailDropEnabled:(BOOL)a3
{
  self->_isMailDropEnabled = a3;
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (NSNumber)SMIMESigningEnabled
{
  return self->_SMIMESigningEnabled;
}

- (void)setSMIMESigningEnabled:(id)a3
{
}

- (BOOL)SMIMESigningUserOverrideable
{
  return self->_SMIMESigningUserOverrideable;
}

- (void)setSMIMESigningUserOverrideable:(BOOL)a3
{
  self->_SMIMESigningUserOverrideable = a3;
}

- (NSString)SMIMESigningIdentityUUID
{
  return self->_SMIMESigningIdentityUUID;
}

- (void)setSMIMESigningIdentityUUID:(id)a3
{
}

- (BOOL)SMIMESigningIdentityUserOverrideable
{
  return self->_SMIMESigningIdentityUserOverrideable;
}

- (void)setSMIMESigningIdentityUserOverrideable:(BOOL)a3
{
  self->_SMIMESigningIdentityUserOverrideable = a3;
}

- (NSNumber)SMIMEEncryptionEnabled
{
  return self->_SMIMEEncryptionEnabled;
}

- (void)setSMIMEEncryptionEnabled:(id)a3
{
}

- (BOOL)SMIMEEncryptByDefaultUserOverrideable
{
  return self->_SMIMEEncryptByDefaultUserOverrideable;
}

- (void)setSMIMEEncryptByDefaultUserOverrideable:(BOOL)a3
{
  self->_SMIMEEncryptByDefaultUserOverrideable = a3;
}

- (NSString)SMIMEEncryptionIdentityUUID
{
  return self->_SMIMEEncryptionIdentityUUID;
}

- (void)setSMIMEEncryptionIdentityUUID:(id)a3
{
}

- (BOOL)SMIMEEncryptionIdentityUserOverrideable
{
  return self->_SMIMEEncryptionIdentityUserOverrideable;
}

- (void)setSMIMEEncryptionIdentityUserOverrideable:(BOOL)a3
{
  self->_SMIMEEncryptionIdentityUserOverrideable = a3;
}

- (NSData)SMIMESigningIdentityPersistentID
{
  return self->_SMIMESigningIdentityPersistentID;
}

- (void)setSMIMESigningIdentityPersistentID:(id)a3
{
}

- (NSData)SMIMEEncryptionIdentityPersistentID
{
  return self->_SMIMEEncryptionIdentityPersistentID;
}

- (void)setSMIMEEncryptionIdentityPersistentID:(id)a3
{
}

- (BOOL)SMIMEPerMessageSwitchEnabled
{
  return self->_SMIMEPerMessageSwitchEnabled;
}

- (void)setSMIMEPerMessageSwitchEnabled:(BOOL)a3
{
  self->_SMIMEPerMessageSwitchEnabled = a3;
}

- (NSNumber)preventMoveNum
{
  return self->_preventMoveNum;
}

- (void)setPreventMoveNum:(id)a3
{
}

- (NSNumber)preventAppSheetNum
{
  return self->_preventAppSheetNum;
}

- (void)setPreventAppSheetNum:(id)a3
{
}

- (NSNumber)SMIMEEnabledNum
{
  return self->_SMIMEEnabledNum;
}

- (void)setSMIMEEnabledNum:(id)a3
{
}

- (NSNumber)isRecentsSyncingDisabledNum
{
  return self->_isRecentsSyncingDisabledNum;
}

- (void)setIsRecentsSyncingDisabledNum:(id)a3
{
}

- (NSNumber)isMailDropEnabledNum
{
  return self->_isMailDropEnabledNum;
}

- (void)setIsMailDropEnabledNum:(id)a3
{
}

- (NSNumber)SMIMEPerMessageSwitchEnabledNum
{
  return self->_SMIMEPerMessageSwitchEnabledNum;
}

- (void)setSMIMEPerMessageSwitchEnabledNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SMIMEPerMessageSwitchEnabledNum, 0);
  objc_storeStrong((id *)&self->_isMailDropEnabledNum, 0);
  objc_storeStrong((id *)&self->_isRecentsSyncingDisabledNum, 0);
  objc_storeStrong((id *)&self->_SMIMEEnabledNum, 0);
  objc_storeStrong((id *)&self->_preventAppSheetNum, 0);
  objc_storeStrong((id *)&self->_preventMoveNum, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityPersistentID, 0);
  objc_storeStrong((id *)&self->_SMIMESigningIdentityPersistentID, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityUUID, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionEnabled, 0);
  objc_storeStrong((id *)&self->_SMIMESigningIdentityUUID, 0);
  objc_storeStrong((id *)&self->_SMIMESigningEnabled, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

@end
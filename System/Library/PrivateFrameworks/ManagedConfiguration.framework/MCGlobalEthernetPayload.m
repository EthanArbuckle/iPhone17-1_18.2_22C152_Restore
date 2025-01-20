@interface MCGlobalEthernetPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)nonPrivateEAPKeys;
+ (id)typeStrings;
- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4;
- (BOOL)_payloadIsValid:(id)a3 error:(id *)a4;
- (BOOL)isSystemMode;
- (BOOL)passwordRequired;
- (BOOL)usernameRequired;
- (MCGlobalEthernetPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)eapTypes;
- (NSArray)payloadCertificateAnchorUUIDs;
- (NSArray)setupModes;
- (NSDictionary)eapClientConfiguration;
- (NSString)certificateUUID;
- (NSString)interface;
- (NSString)password;
- (NSString)username;
- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4;
- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4;
- (id)eapSettingsSection;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setCertificateUUID:(id)a3;
- (void)setEapClientConfiguration:(id)a3;
- (void)setEapTypes:(id)a3;
- (void)setInterface:(id)a3;
- (void)setIsSystemMode:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordRequired:(BOOL)a3;
- (void)setPayloadCertificateAnchorUUIDs:(id)a3;
- (void)setSetupModes:(id)a3;
- (void)setUsername:(id)a3;
- (void)setUsernameRequired:(BOOL)a3;
@end

@implementation MCGlobalEthernetPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.globalethernet.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(@"GLOBAL_ETHERNET_SINGULAR_FORMAT");
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(@"GLOBAL_ETHERNET_PLURAL_FORMAT");
}

- (MCGlobalEthernetPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MCGlobalEthernetPayload;
  v9 = [(MCPayload *)&v40 initWithDictionary:v8 profile:a4 outError:a5];
  v10 = v9;
  if (v9)
  {
    id v39 = 0;
    [(MCGlobalEthernetPayload *)v9 _payloadIsValid:v8 error:&v39];
    id v11 = v39;
    if (v11)
    {
      id v12 = v11;
      v13 = 0;
    }
    else
    {
      id v38 = 0;
      v13 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPClientConfiguration" isRequired:1 outError:&v38];
      id v12 = v38;
      if (!v12)
      {
        if (v13)
        {
          id v37 = 0;
          BOOL v14 = [(MCGlobalEthernetPayload *)v10 _eapConfigIsValid:v13 error:&v37];
          id v12 = v37;
          if (v14)
          {
            uint64_t v15 = [(MCGlobalEthernetPayload *)v10 _eapUsernameFromConfig:v13 isRequired:&v10->_usernameRequired];
            username = v10->_username;
            v10->_username = (NSString *)v15;

            uint64_t v17 = [(MCGlobalEthernetPayload *)v10 _eapPasswordFromConfig:v13 isRequired:&v10->_passwordRequired];
            password = v10->_password;
            v10->_password = (NSString *)v17;

            v19 = (void *)[v13 mutableCopy];
            uint64_t v20 = [v13 objectForKey:@"AcceptEAPTypes"];
            eapTypes = v10->_eapTypes;
            v10->_eapTypes = (NSArray *)v20;

            id v36 = v12;
            uint64_t v22 = [v19 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"PayloadCertificateAnchorUUID" isRequired:0 outError:&v36];
            id v23 = v36;

            payloadCertificateAnchorUUIDs = v10->_payloadCertificateAnchorUUIDs;
            v10->_payloadCertificateAnchorUUIDs = (NSArray *)v22;

            id v12 = v23;
            if (!v23)
            {
              id v35 = 0;
              uint64_t v25 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"PayloadCertificateUUID" isRequired:0 outError:&v35];
              id v12 = v35;
              certificateUUID = v10->_certificateUUID;
              v10->_certificateUUID = (NSString *)v25;

              if (!v12) {
                objc_storeStrong((id *)&v10->_eapClientConfiguration, v19);
              }
            }
          }
        }
      }
      if (!v12) {
        goto LABEL_17;
      }
    }
    v27 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v28 = v27;
    if (a5) {
      *a5 = v27;
    }
    v29 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      v31 = objc_opt_class();
      id v32 = v31;
      v33 = [v28 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v42 = v31;
      __int16 v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
LABEL_17:
    v10 = v10;
  }
  return v10;
}

- (BOOL)_payloadIsValid:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[v6 mutableCopy];
  id v8 = [v7 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Interface" isRequired:1 outError:a4];
  interface = self->_interface;
  self->_interface = v8;

  if (!self->_interface
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ![(NSString *)self->_interface isEqualToString:@"GlobalEthernet"])
  {
    if (a4)
    {
      v16 = +[MCPayload badFieldValueErrorWithField:@"Interface"];
LABEL_10:
      id v15 = v16;
      BOOL v14 = 0;
      goto LABEL_11;
    }
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  v10 = [v6 objectForKey:@"SetupModes"];
  setupModes = self->_setupModes;
  self->_setupModes = v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v16 = +[MCPayload badFieldTypeErrorWithField:@"SetupModes"];
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  self->_BOOL isSystemMode = 0;
  id v12 = self->_setupModes;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__MCGlobalEthernetPayload__payloadIsValid_error___block_invoke;
  v18[3] = &unk_1E5A68078;
  v18[4] = self;
  [(NSArray *)v12 enumerateObjectsUsingBlock:v18];
  BOOL isSystemMode = self->_isSystemMode;
  BOOL v14 = self->_isSystemMode;
  if (a4 && !isSystemMode)
  {
    id v15 = +[MCPayload badFieldValueErrorWithField:@"SetupModes"];
LABEL_11:
    *a4 = v15;
  }
LABEL_15:

  return v14;
}

void __49__MCGlobalEthernetPayload__payloadIsValid_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isEqualToString:@"System"])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 90) = 1;
    *a4 = 1;
  }
}

- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"AcceptEAPTypes"];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
      char v9 = [v7 containsObject:v8];

      if (a4)
      {
        if ((v9 & 1) == 0) {
          *a4 = 1;
        }
      }
    }
    v10 = [v6 objectForKey:@"UserName"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"AcceptEAPTypes"];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
      char v9 = [v7 containsObject:v8];

      if (a4)
      {
        if ((v9 & 1) == 0) {
          *a4 = 1;
        }
      }
    }
    v10 = [v6 objectForKey:@"UserPassword"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[a3 mutableCopy];
  id v62 = 0;
  id v7 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserName" isRequired:0 outError:&v62];
  id v8 = v62;
  if (v8
    || (id v61 = 0,
        v9 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserPassword" isRequired:0 outError:&v61], (id v8 = v61) != 0))
  {
    id v10 = v8;
    BOOL v11 = 0;
    id v12 = 0;
LABEL_4:
    v13 = 0;
LABEL_5:
    uint64_t v14 = 0;
LABEL_6:
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  id v60 = 0;
  id v12 = [v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"AcceptEAPTypes" isRequired:1 outError:&v60];
  id v17 = v60;
  if (v17) {
    goto LABEL_11;
  }
  v18 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF4D0BE0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v12 = v12;
  uint64_t v19 = [v12 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v12);
        }
        if (![v18 containsObject:*(void *)(*((void *)&v56 + 1) + 8 * i)])
        {
          id v10 = +[MCPayload badFieldValueErrorWithField:@"AcceptEAPTypes"];

          uint64_t v15 = 0;
          uint64_t v14 = 0;
          v13 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v20 = [v12 countByEnumeratingWithState:&v56 objects:v69 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v55 = 0;
  id v23 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"PayloadCertificateUUID" isRequired:0 outError:&v55];
  id v17 = v55;
  if (v17) {
    goto LABEL_11;
  }
  id v54 = 0;
  id v24 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"TLSTrustedCertificates" isRequired:0 outError:&v54];
  id v17 = v54;
  if (v17
    || (id v53 = 0,
        v25 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"TLSTrustedServerNames" isRequired:0 outError:&v53], (id v17 = v53) != 0)|| (v52 = 0, v26 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"TLSCertificateIsRequired", 0, &v52), (id v17 = v52) != 0))
  {
LABEL_11:
    id v10 = v17;
    BOOL v11 = 0;
    goto LABEL_4;
  }
  id v51 = 0;
  v13 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TTLSInnerAuthentication" isRequired:0 outError:&v51];
  id v27 = v51;
  if (v27)
  {
    id v10 = v27;
    BOOL v11 = 0;
    goto LABEL_5;
  }
  if (v13)
  {
    v31 = (void *)MEMORY[0x1E4F1CAD0];
    v68[0] = @"PAP";
    v68[1] = @"CHAP";
    v68[2] = @"MSCHAP";
    v68[3] = @"MSCHAPv2";
    v68[4] = @"EAP";
    id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
    v33 = [v31 setWithArray:v32];

    if (![v33 containsObject:v13])
    {
      id v10 = +[MCPayload badFieldValueErrorWithField:@"TTLSInnerAuthentication"];

      uint64_t v15 = 0;
      uint64_t v14 = 0;
      goto LABEL_27;
    }
  }
  id v50 = 0;
  uint64_t v14 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TLSMinimumVersion" isRequired:0 outError:&v50];
  id v34 = v50;
  if (v34)
  {
    id v10 = v34;
    BOOL v11 = 0;
    goto LABEL_6;
  }
  id v49 = 0;
  uint64_t v15 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TLSMaximumVersion" isRequired:0 outError:&v49];
  id v35 = v49;
  if (v35)
  {
LABEL_52:
    id v10 = v35;
    goto LABEL_28;
  }
  if (v14 | v15)
  {
    v67[0] = @"1.0";
    v67[1] = @"1.1";
    v67[2] = @"1.2";
    v67[3] = @"1.3";
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
    v44 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    if (v14 && ([v44 containsObject:v14] & 1) == 0)
    {
      v41 = @"TLSMinimumVersion";
    }
    else
    {
      if (!v15)
      {
LABEL_48:

        goto LABEL_49;
      }
      if ([v44 containsObject:v15])
      {
        if (v14)
        {
          unint64_t v43 = [v36 indexOfObject:v14];
          if (v43 > [v36 indexOfObject:v15])
          {
            uint64_t v37 = +[MCPayload conflictingFieldValueErrorWithUnderlyingError:0, @"TLSMinimumVersion", @"TLSMaximumVersion", v14, v15, 0];
LABEL_56:
            id v10 = (id)v37;

            goto LABEL_27;
          }
        }
        goto LABEL_48;
      }
      v41 = @"TLSMaximumVersion";
    }
    uint64_t v37 = +[MCPayload badFieldValueErrorWithField:v41];
    goto LABEL_56;
  }
LABEL_49:
  id v48 = 0;
  id v38 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OuterIdentity" isRequired:0 outError:&v48];
  id v35 = v48;
  if (v35) {
    goto LABEL_52;
  }
  id v47 = 0;
  id v39 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPFASTUsePAC" isRequired:0 outError:&v47];
  id v35 = v47;
  if (v35) {
    goto LABEL_52;
  }
  id v46 = 0;
  id v40 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPFASTProvisionPAC" isRequired:0 outError:&v46];
  id v35 = v46;
  if (v35) {
    goto LABEL_52;
  }
  id v45 = 0;
  id v42 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPFASTProvisionPACAnonymously" isRequired:0 outError:&v45];
  id v10 = v45;
LABEL_27:
  if (v10)
  {
LABEL_28:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  if ([v6 count])
  {
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = [(MCPayload *)self friendlyName];
      *(_DWORD *)buf = 138543618;
      v64 = v30;
      __int16 v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in EAP Configuration. They are: %{public}@", buf, 0x16u);
    }
  }
  id v10 = 0;
  BOOL v11 = 1;
LABEL_7:
  if (a4) {
    *a4 = v10;
  }

  return v11;
}

- (id)stubDictionary
{
  v17.receiver = self;
  v17.super_class = (Class)MCGlobalEthernetPayload;
  v3 = [(MCPayload *)&v17 stubDictionary];
  v4 = v3;
  interface = self->_interface;
  if (interface) {
    [v3 setObject:interface forKey:@"Interface"];
  }
  setupModes = self->_setupModes;
  if (setupModes) {
    [v4 setObject:setupModes forKey:@"SetupModes"];
  }
  certificateUUID = self->_certificateUUID;
  if (certificateUUID) {
    [v4 setObject:certificateUUID forKey:@"PayloadCertificateUUID"];
  }
  eapClientConfiguration = self->_eapClientConfiguration;
  if (eapClientConfiguration)
  {
    id v9 = (void *)[(NSDictionary *)eapClientConfiguration mutableCopy];
    id v10 = v9;
    payloadCertificateAnchorUUIDs = self->_payloadCertificateAnchorUUIDs;
    if (payloadCertificateAnchorUUIDs) {
      [v9 setObject:payloadCertificateAnchorUUIDs forKeyedSubscript:@"PayloadCertificateAnchorUUID"];
    }
    id v12 = self->_eapClientConfiguration;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__MCGlobalEthernetPayload_stubDictionary__block_invoke;
    v15[3] = &unk_1E5A67DE8;
    id v16 = v10;
    id v13 = v10;
    [(NSDictionary *)v12 enumerateKeysAndObjectsUsingBlock:v15];
    [v4 setObject:v13 forKeyedSubscript:@"EAPClientConfiguration"];
  }
  return v4;
}

void __41__MCGlobalEthernetPayload_stubDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[MCGlobalEthernetPayload nonPrivateEAPKeys];
  char v4 = [v3 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) setObject:@"(present)" forKeyedSubscript:v5];
  }
}

+ (id)nonPrivateEAPKeys
{
  if (nonPrivateEAPKeys_onceToken != -1) {
    dispatch_once(&nonPrivateEAPKeys_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)nonPrivateEAPKeys_keys;
  return v2;
}

void __44__MCGlobalEthernetPayload_nonPrivateEAPKeys__block_invoke()
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"AcceptEAPTypes";
  v4[1] = @"PayloadCertificateAnchorUUID";
  v4[2] = @"TLSTrustedCertificates";
  v4[3] = @"TLSTrustedServerNames";
  v4[4] = @"TLSCertificateIsRequired";
  v4[5] = @"TTLSInnerAuthentication";
  v4[6] = @"TLSMinimumVersion";
  v4[7] = @"TLSMaximumVersion";
  v4[8] = @"EAPFASTUsePAC";
  v4[9] = @"EAPFASTProvisionPAC";
  v4[10] = @"EAPFASTProvisionPACAnonymously";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)nonPrivateEAPKeys_keys;
  nonPrivateEAPKeys_keys = v2;
}

- (id)eapSettingsSection
{
  v3 = objc_opt_new();
  char v4 = [(NSDictionary *)self->_eapClientConfiguration objectForKey:@"UserName"];
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [MCKeyValue alloc];
    id v7 = MCLocalizedString(@"PRESENT");
    id v8 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_USERNAME");
    id v9 = [(MCKeyValue *)v6 initWithLocalizedString:v7 localizedKey:v8];

    [v3 addObject:v9];
  }
  id v10 = [(NSDictionary *)self->_eapClientConfiguration objectForKey:@"UserPassword"];

  if (v10 && [v10 length])
  {
    BOOL v11 = [MCKeyValue alloc];
    id v12 = MCLocalizedString(@"PRESENT");
    id v13 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_PASSWORD");
    uint64_t v14 = [(MCKeyValue *)v11 initWithLocalizedString:v12 localizedKey:v13];

    [v3 addObject:v14];
  }
  uint64_t v15 = [(MCGlobalEthernetPayload *)self certificateUUID];

  if (v15)
  {
    id v16 = [MCKeyValue alloc];
    objc_super v17 = MCLocalizedString(@"PRESENT");
    v18 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_IDENTITY");
    uint64_t v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v3 addObject:v19];
  }
  uint64_t v20 = [(MCGlobalEthernetPayload *)self payloadCertificateAnchorUUIDs];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    uint64_t v22 = [MCKeyValue alloc];
    id v23 = MCLocalizedString(@"PRESENT");
    id v24 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_TRUSTED_SERVER_CERTS");
    id v25 = [(MCKeyValue *)v22 initWithLocalizedString:v23 localizedKey:v24];

    [v3 addObject:v25];
  }
  id v26 = [(NSDictionary *)self->_eapClientConfiguration objectForKey:@"TLSTrustedServerNames"];
  if ([v26 count])
  {
    id v27 = [MCKeyValue alloc];
    v28 = MCLocalizedString(@"PRESENT");
    v29 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_TRUSTED_SERVER_NAMES");
    v30 = [(MCKeyValue *)v27 initWithLocalizedString:v28 localizedKey:v29];

    [v3 addObject:v30];
  }
  v31 = [(NSDictionary *)self->_eapClientConfiguration objectForKey:@"TLSMinimumVersion"];
  if (v31)
  {
    id v32 = [MCKeyValue alloc];
    v33 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_TLS_MIN_VERSION");
    id v34 = [(MCKeyValue *)v32 initWithLocalizedString:v31 localizedKey:v33];

    [v3 addObject:v34];
  }
  id v35 = [(NSDictionary *)self->_eapClientConfiguration objectForKey:@"TLSMaximumVersion"];

  if (v35)
  {
    id v36 = [MCKeyValue alloc];
    uint64_t v37 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_TLS_MAX_VERSION");
    id v38 = [(MCKeyValue *)v36 initWithLocalizedString:v35 localizedKey:v37];

    [v3 addObject:v38];
  }

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  char v4 = objc_opt_new();
  if ([(MCGlobalEthernetPayload *)self isSystemMode])
  {
    id v5 = [MCKeyValue alloc];
    id v6 = MCLocalizedString(@"GLOBAL_ETHERNET_SETUP_MODE");
    id v7 = [(MCKeyValue *)v5 initWithLocalizedString:@"System" localizedKey:v6];

    [v4 addObject:v7];
  }
  eapClientConfiguration = self->_eapClientConfiguration;
  if (eapClientConfiguration)
  {
    id v9 = [(NSDictionary *)eapClientConfiguration allKeys];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      BOOL v11 = [(MCGlobalEthernetPayload *)self eapSettingsSection];
      if ([v11 count]) {
        [v4 addObjectsFromArray:v11];
      }
    }
  }
  if ([v4 count])
  {
    id v12 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v12];
  }
  id v13 = [(MCGlobalEthernetPayload *)self eapTypes];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = [(MCGlobalEthernetPayload *)self eapTypes];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v17) {
      goto LABEL_29;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = [*(id *)(*((void *)&v26 + 1) + 8 * i) intValue];
        if (v21 <= 20)
        {
          uint64_t v22 = @"EAP-TLS";
          if (v21 == 13) {
            goto LABEL_27;
          }
          if (v21 == 17)
          {
            uint64_t v22 = @"LEAP";
            goto LABEL_27;
          }
        }
        else
        {
          switch(v21)
          {
            case 21:
              uint64_t v22 = @"EAP-TTLS";
              goto LABEL_27;
            case 43:
              uint64_t v22 = @"EAP-FAST";
              goto LABEL_27;
            case 25:
              uint64_t v22 = @"PEAP";
              goto LABEL_27;
          }
        }
        uint64_t v22 = @"Unknown";
LABEL_27:
        [v15 addObject:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v18)
      {
LABEL_29:

        id v23 = MCLocalizedString(@"GLOBAL_ETHERNET_EAP_TYPES");
        id v24 = +[MCKeyValueSection sectionWithLocalizedArray:v15 title:v23 footer:0];

        [v3 addObject:v24];
        break;
      }
    }
  }
  if (![v3 count])
  {

    v3 = 0;
  }

  return v3;
}

- (id)verboseDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)MCGlobalEthernetPayload;
  char v4 = [(MCPayload *)&v15 verboseDescription];
  id v5 = [v3 stringWithString:v4];

  if ([(MCGlobalEthernetPayload *)self isSystemMode]) {
    [v5 appendString:@"Setup Mode : System\n"];
  }
  id v6 = [(MCGlobalEthernetPayload *)self interface];

  if (v6)
  {
    id v7 = [(MCGlobalEthernetPayload *)self interface];
    [v5 appendFormat:@"Interface : %@\n", v7];
  }
  id v8 = [(MCPayload *)self displayName];

  if (v8)
  {
    id v9 = [(MCPayload *)self displayName];
    [v5 appendFormat:@"Display Name : %@\n", v9];
  }
  uint64_t v10 = [(MCPayload *)self description];

  if (v10)
  {
    BOOL v11 = [(MCPayload *)self description];
    [v5 appendFormat:@"Description: %@\n", v11];
  }
  id v12 = [(MCGlobalEthernetPayload *)self eapClientConfiguration];

  if (v12)
  {
    id v13 = [(MCGlobalEthernetPayload *)self eapClientConfiguration];
    [v5 appendFormat:@"EAP Configuration : %@\n", v13];
  }
  return v5;
}

- (NSDictionary)eapClientConfiguration
{
  return self->_eapClientConfiguration;
}

- (void)setEapClientConfiguration:(id)a3
{
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
}

- (NSArray)payloadCertificateAnchorUUIDs
{
  return self->_payloadCertificateAnchorUUIDs;
}

- (void)setPayloadCertificateAnchorUUIDs:(id)a3
{
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (void)setPasswordRequired:(BOOL)a3
{
  self->_passwordRequired = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)usernameRequired
{
  return self->_usernameRequired;
}

- (void)setUsernameRequired:(BOOL)a3
{
  self->_usernameRequired = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NSArray)setupModes
{
  return self->_setupModes;
}

- (void)setSetupModes:(id)a3
{
}

- (BOOL)isSystemMode
{
  return self->_isSystemMode;
}

- (void)setIsSystemMode:(BOOL)a3
{
  self->_BOOL isSystemMode = a3;
}

- (NSArray)eapTypes
{
  return self->_eapTypes;
}

- (void)setEapTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eapTypes, 0);
  objc_storeStrong((id *)&self->_setupModes, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUIDs, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_eapClientConfiguration, 0);
}

@end
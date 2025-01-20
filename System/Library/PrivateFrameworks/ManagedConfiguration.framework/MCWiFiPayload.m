@interface MCWiFiPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4;
- (BOOL)_isEAPSIMConfig:(id)a3;
- (BOOL)_qosMarkingConfigIsValid:(id)a3 error:(id *)a4;
- (BOOL)autoJoin;
- (BOOL)captiveBypass;
- (BOOL)isHidden;
- (BOOL)isHotspot;
- (BOOL)isServiceProviderRoamingEnabled;
- (BOOL)isWEP;
- (BOOL)isWPA;
- (BOOL)passwordRequired;
- (BOOL)proxyPACFallbackAllowed;
- (BOOL)usernameRequired;
- (MCWiFiPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)MCCAndMNCs;
- (NSArray)NAIRealmNames;
- (NSArray)payloadCertificateAnchorUUID;
- (NSArray)roamingConsortiumOIs;
- (NSDictionary)eapClientConfig;
- (NSDictionary)qosMarkingConfig;
- (NSNumber)autoJoinNum;
- (NSNumber)captiveBypassNum;
- (NSNumber)disableAssociationMACRandomization;
- (NSNumber)isFirstAutoJoinRestricted;
- (NSNumber)isHiddenNum;
- (NSNumber)isHotspotNum;
- (NSNumber)proxyPACFallbackAllowedNum;
- (NSNumber)proxyServerPort;
- (NSNumber)serviceProviderRoamingEnabledNum;
- (NSString)HESSID;
- (NSString)certificateUUID;
- (NSString)credentialUUID;
- (NSString)displayedOperatorName;
- (NSString)domainName;
- (NSString)encryptionType;
- (NSString)password;
- (NSString)proxyPACURLString;
- (NSString)proxyPassword;
- (NSString)proxyServer;
- (NSString)proxyUsername;
- (NSString)ssid;
- (NSString)username;
- (id)_createDictionaryWithAllowListKeyMigrated:(id)a3;
- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4;
- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4;
- (id)_localizedEncryptionTypeString;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Label;
- (id)userInputFields;
- (id)verboseDescription;
- (int)proxyType;
- (void)setAutoJoin:(BOOL)a3;
- (void)setAutoJoinNum:(id)a3;
- (void)setCaptiveBypass:(BOOL)a3;
- (void)setCaptiveBypassNum:(id)a3;
- (void)setCertificateUUID:(id)a3;
- (void)setCredentialUUID:(id)a3;
- (void)setDisableAssociationMACRandomization:(id)a3;
- (void)setDisplayedOperatorName:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setEapClientConfig:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setHESSID:(id)a3;
- (void)setIsFirstAutoJoinRestricted:(id)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsHiddenNum:(id)a3;
- (void)setIsHotspot:(BOOL)a3;
- (void)setIsHotspotNum:(id)a3;
- (void)setIsWEP:(BOOL)a3;
- (void)setIsWPA:(BOOL)a3;
- (void)setMCCAndMNCs:(id)a3;
- (void)setNAIRealmNames:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordRequired:(BOOL)a3;
- (void)setPayloadCertificateAnchorUUID:(id)a3;
- (void)setProxyPACFallbackAllowed:(BOOL)a3;
- (void)setProxyPACFallbackAllowedNum:(id)a3;
- (void)setProxyPACURLString:(id)a3;
- (void)setProxyPassword:(id)a3;
- (void)setProxyServer:(id)a3;
- (void)setProxyServerPort:(id)a3;
- (void)setProxyType:(int)a3;
- (void)setProxyUsername:(id)a3;
- (void)setQosMarkingConfig:(id)a3;
- (void)setRoamingConsortiumOIs:(id)a3;
- (void)setServiceProviderRoamingEnabled:(BOOL)a3;
- (void)setServiceProviderRoamingEnabledNum:(id)a3;
- (void)setSsid:(id)a3;
- (void)setUsername:(id)a3;
- (void)setUsernameRequired:(BOOL)a3;
@end

@implementation MCWiFiPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.wifi.managed"];
}

+ (id)localizedSingularForm
{
  v2 = [@"WIFI_NETWORK_DESCRIPTION_SINGULAR_FORMAT" MCAppendGreenteaSuffix];
  v10 = MCLocalizedFormat(v2, v3, v4, v5, v6, v7, v8, v9, v12);

  return v10;
}

+ (id)localizedPluralForm
{
  v2 = [@"WIFI_NETWORK_DESCRIPTION_PLURAL_FORMAT" MCAppendGreenteaSuffix];
  v10 = MCLocalizedFormat(v2, v3, v4, v5, v6, v7, v8, v9, v12);

  return v10;
}

- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a3 mutableCopy];
  id v84 = 0;
  id v7 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserName" isRequired:0 outError:&v84];
  id v8 = v84;
  if (v8
    || (id v83 = 0,
        v9 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserPassword" isRequired:0 outError:&v83], (id v8 = v83) != 0))
  {
    v10 = v8;
    BOOL v11 = 0;
    id v12 = 0;
LABEL_4:
    v13 = 0;
LABEL_5:
    v14 = 0;
    uint64_t v15 = 0;
LABEL_6:
    uint64_t v16 = 0;
    goto LABEL_7;
  }
  id v82 = 0;
  id v12 = [v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"AcceptEAPTypes" isRequired:1 outError:&v82];
  id v18 = v82;
  if (v18) {
    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF4D0BC8];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v12 = v12;
  uint64_t v20 = [v12 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v79;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v79 != v22) {
          objc_enumerationMutation(v12);
        }
        if (![v19 containsObject:*(void *)(*((void *)&v78 + 1) + 8 * i)])
        {
          v10 = +[MCPayload badFieldValueErrorWithField:@"AcceptEAPTypes"];

          uint64_t v16 = 0;
          uint64_t v15 = 0;
          v14 = 0;
          v13 = 0;
          goto LABEL_29;
        }
      }
      uint64_t v21 = [v12 countByEnumeratingWithState:&v78 objects:v91 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  id v77 = 0;
  id v24 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"PayloadCertificateAnchorUUID" isRequired:0 outError:&v77];
  id v18 = v77;
  if (v18) {
    goto LABEL_11;
  }
  id v76 = 0;
  id v25 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"TLSTrustedCertificates" isRequired:0 outError:&v76];
  id v18 = v76;
  if (v18) {
    goto LABEL_11;
  }
  id v75 = 0;
  id v26 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"TLSTrustedServerCommonNames" isRequired:0 outError:&v75];
  id v18 = v75;
  if (v18) {
    goto LABEL_11;
  }
  id v74 = 0;
  id v27 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"TLSTrustedServerNames" isRequired:0 outError:&v74];
  id v18 = v74;
  if (v18
    || (id v73 = 0,
        v28 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"TLSAllowTrustExceptions" isRequired:0 outError:&v73], (id v18 = v73) != 0)|| (v72 = 0, v29 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"TLSCertificateIsRequired", 0, &v72), (id v18 = v72) != 0))
  {
LABEL_11:
    v10 = v18;
    BOOL v11 = 0;
    goto LABEL_4;
  }
  id v71 = 0;
  v13 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TTLSInnerAuthentication" isRequired:0 outError:&v71];
  id v30 = v71;
  if (v30)
  {
    v10 = v30;
    BOOL v11 = 0;
    goto LABEL_5;
  }
  if (!v13)
  {
LABEL_38:
    id v70 = 0;
    uint64_t v15 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TLSMinimumVersion" isRequired:0 outError:&v70];
    id v37 = v70;
    if (v37)
    {
      v10 = v37;
      BOOL v11 = 0;
      v14 = 0;
      goto LABEL_6;
    }
    id v69 = 0;
    uint64_t v16 = [v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TLSMaximumVersion" isRequired:0 outError:&v69];
    id v38 = v69;
    if (v38) {
      goto LABEL_56;
    }
    if (!(v15 | v16)) {
      goto LABEL_52;
    }
    v89[0] = @"1.0";
    v89[1] = @"1.1";
    v89[2] = @"1.2";
    v89[3] = @"1.3";
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
    v56 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    if (v15 && ([v56 containsObject:v15] & 1) == 0)
    {
      v45 = @"TLSMinimumVersion";
    }
    else
    {
      if (!v16)
      {
LABEL_51:

LABEL_52:
        id v68 = 0;
        id v41 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OuterIdentity" isRequired:0 outError:&v68];
        id v38 = v68;
        if (v38) {
          goto LABEL_56;
        }
        id v67 = 0;
        id v42 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPFASTUsePAC" isRequired:0 outError:&v67];
        id v38 = v67;
        if (v38
          || (id v66 = 0,
              v43 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPFASTProvisionPAC" isRequired:0 outError:&v66], (id v38 = v66) != 0)|| (v65 = 0, v44 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"EAPFASTProvisionPACAnonymously", 0, &v65), (id v38 = v65) != 0))
        {
LABEL_56:
          v10 = v38;
          BOOL v11 = 0;
          v14 = 0;
          goto LABEL_7;
        }
        id v64 = 0;
        v14 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPSIMNumberOfRANDs" isRequired:0 outError:&v64];
        id v46 = v64;
        if (!v46)
        {
          if (!v14
            || [v14 intValue] == 2
            || [v14 intValue] == 3)
          {
            id v63 = 0;
            id v47 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OneTimeUserPassword" isRequired:0 outError:&v63];
            id v46 = v63;
            if (v46) {
              goto LABEL_71;
            }
            id v62 = 0;
            id v48 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPSIMAKAConservativePeer" isRequired:0 outError:&v62];
            id v46 = v62;
            if (v46) {
              goto LABEL_71;
            }
            id v61 = 0;
            id v49 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPSIMAKAPseudonymIdentityLifetimeHours" isRequired:0 outError:&v61];
            id v46 = v61;
            if (v46) {
              goto LABEL_71;
            }
            id v60 = 0;
            id v50 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPSIMAKAEncryptedIdentityEnabled" isRequired:0 outError:&v60];
            id v46 = v60;
            if (v46) {
              goto LABEL_71;
            }
            id v59 = 0;
            id v51 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPSIMAKARealm" isRequired:0 outError:&v59];
            id v46 = v59;
            if (v46) {
              goto LABEL_71;
            }
            id v58 = 0;
            id v52 = (id)[v6 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ExtensibleSSOProvider" isRequired:0 outError:&v58];
            id v46 = v58;
            if (v46) {
              goto LABEL_71;
            }
            id v57 = 0;
            id v54 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"EAPSIMAKANotificationActions" isRequired:0 outError:&v57];
            id v53 = v57;
          }
          else
          {
            id v53 = +[MCPayload badFieldValueErrorWithField:@"EAPSIMNumberOfRANDs"];
          }
          v10 = v53;
          goto LABEL_29;
        }
LABEL_71:
        v10 = v46;
        goto LABEL_30;
      }
      if ([v56 containsObject:v16])
      {
        if (v15)
        {
          unint64_t v55 = [v39 indexOfObject:v15];
          if (v55 > [v39 indexOfObject:v16])
          {
            uint64_t v40 = +[MCPayload conflictingFieldValueErrorWithUnderlyingError:0, @"TLSMinimumVersion", @"TLSMaximumVersion", v15, v16, 0];
LABEL_60:
            v10 = (void *)v40;

            goto LABEL_41;
          }
        }
        goto LABEL_51;
      }
      v45 = @"TLSMaximumVersion";
    }
    uint64_t v40 = +[MCPayload badFieldValueErrorWithField:v45];
    goto LABEL_60;
  }
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  v90[0] = @"PAP";
  v90[1] = @"CHAP";
  v90[2] = @"MSCHAP";
  v90[3] = @"MSCHAPv2";
  v90[4] = @"EAP";
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:5];
  v36 = [v34 setWithArray:v35];

  if ([v36 containsObject:v13])
  {

    goto LABEL_38;
  }
  v10 = +[MCPayload badFieldValueErrorWithField:@"TTLSInnerAuthentication"];

  uint64_t v16 = 0;
  uint64_t v15 = 0;
LABEL_41:
  v14 = 0;
LABEL_29:
  if (v10)
  {
LABEL_30:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  if ([v6 count])
  {
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = [(MCPayload *)self friendlyName];
      *(_DWORD *)buf = 138543618;
      v86 = v33;
      __int16 v87 = 2114;
      v88 = v6;
      _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in EAP Configuration. They are: %{public}@", buf, 0x16u);
    }
  }
  v10 = 0;
  BOOL v11 = 1;
LABEL_7:
  if (a4) {
    *a4 = v10;
  }

  return v11;
}

- (BOOL)_qosMarkingConfigIsValid:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a3 mutableCopy];
  id v23 = 0;
  id v7 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"QoSMarkingWhitelistedAppIdentifiers" isRequired:0 allowZeroLengthString:0 outError:&v23];
  id v8 = v23;
  if (v8) {
    goto LABEL_6;
  }
  id v22 = 0;
  id v9 = (id)[v6 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"QoSMarkingAllowListAppIdentifiers" isRequired:0 allowZeroLengthString:0 outError:&v22];
  id v8 = v22;
  if (v8) {
    goto LABEL_6;
  }
  id v21 = 0;
  id v10 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"QoSMarkingAppleAudioVideoCalls" isRequired:0 outError:&v21];
  id v8 = v21;
  if (v8
    || (id v20 = 0,
        v11 = (id)[v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"QoSMarkingEnabled" isRequired:0 outError:&v20], (id v8 = v20) != 0)|| (v19 = 0, v12 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"QoSMarkingURL", 0, &v19), (id v8 = v19) != 0))
  {
LABEL_6:
    v13 = v8;
    BOOL v14 = 0;
    if (a4) {
LABEL_7:
    }
      *a4 = v13;
  }
  else
  {
    if ([v6 count])
    {
      uint64_t v16 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        id v18 = [(MCPayload *)self friendlyName];
        *(_DWORD *)buf = 138543618;
        id v25 = v18;
        __int16 v26 = 2114;
        id v27 = v6;
        _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in QoS Marking Configuration. They are: %{public}@", buf, 0x16u);
      }
    }
    v13 = 0;
    BOOL v14 = 1;
    if (a4) {
      goto LABEL_7;
    }
  }

  return v14;
}

- (id)_createDictionaryWithAllowListKeyMigrated:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"QoSMarkingAllowListAppIdentifiers"];

  if (v4)
  {
    uint64_t v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"QoSMarkingAllowListAppIdentifiers"];
    [v5 setObject:v6 forKeyedSubscript:@"QoSMarkingWhitelistedAppIdentifiers"];

    [v5 setObject:0 forKeyedSubscript:@"QoSMarkingAllowListAppIdentifiers"];
    id v7 = (id)[v5 copy];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"AcceptEAPTypes"];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
      if (![v7 containsObject:v8])
      {
        id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:18];
        if (![v7 containsObject:v9])
        {
          id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:23];
          char v13 = [v7 containsObject:v12];

          if (a4 && (v13 & 1) == 0) {
            *a4 = 1;
          }
          goto LABEL_7;
        }
      }
    }
LABEL_7:
    id v10 = [v6 objectForKey:@"UserName"];

    goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"AcceptEAPTypes"];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
      if (![v7 containsObject:v8])
      {
        id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:18];
        if (![v7 containsObject:v9])
        {
          id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:23];
          char v13 = [v7 containsObject:v12];

          if (a4 && (v13 & 1) == 0) {
            *a4 = 1;
          }
          goto LABEL_7;
        }
      }
    }
LABEL_7:
    id v10 = [v6 objectForKey:@"UserPassword"];

    goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)_isEAPSIMConfig:(id)a3
{
  id v3 = [a3 objectForKey:@"AcceptEAPTypes"];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:18];
    char v5 = [v3 containsObject:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (MCWiFiPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v169.receiver = self;
  v169.super_class = (Class)MCWiFiPayload;
  id v10 = [(MCPayload *)&v169 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_44;
  }
  id v168 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IsHotspot" isRequired:0 outError:&v168];
  id v12 = v168;
  isHotspotNum = v10->_isHotspotNum;
  v10->_isHotspotNum = (NSNumber *)v11;

  if (v12) {
    goto LABEL_35;
  }
  v10->_isHotspot = [(NSNumber *)v10->_isHotspotNum BOOLValue];
  id v167 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ServiceProviderRoamingEnabled" isRequired:0 outError:&v167];
  id v12 = v167;
  serviceProviderRoamingEnabledNum = v10->_serviceProviderRoamingEnabledNum;
  v10->_serviceProviderRoamingEnabledNum = (NSNumber *)v14;

  if (v12) {
    goto LABEL_35;
  }
  v10->_serviceProviderRoamingEnabled = [(NSNumber *)v10->_serviceProviderRoamingEnabledNum BOOLValue];
  id v166 = 0;
  uint64_t v16 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyPACFallbackAllowed" isRequired:0 outError:&v166];
  id v12 = v166;
  proxyPACFallbackAllowedNum = v10->_proxyPACFallbackAllowedNum;
  v10->_proxyPACFallbackAllowedNum = (NSNumber *)v16;

  if (v12) {
    goto LABEL_35;
  }
  v10->_proxyPACFallbackAllowed = [(NSNumber *)v10->_proxyPACFallbackAllowedNum BOOLValue];
  id v165 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DomainName" isRequired:0 outError:&v165];
  id v12 = v165;
  domainName = v10->_domainName;
  v10->_domainName = (NSString *)v18;

  if (v12) {
    goto LABEL_35;
  }
  id v164 = 0;
  uint64_t v20 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"HESSID" isRequired:0 outError:&v164];
  id v12 = v164;
  HESSID = v10->_HESSID;
  v10->_HESSID = (NSString *)v20;

  if (v12) {
    goto LABEL_35;
  }
  id v163 = 0;
  uint64_t v22 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"RoamingConsortiumOIs" isRequired:0 outError:&v163];
  id v12 = v163;
  roamingConsortiumOIs = v10->_roamingConsortiumOIs;
  v10->_roamingConsortiumOIs = (NSArray *)v22;

  if (v12) {
    goto LABEL_35;
  }
  id v162 = 0;
  uint64_t v24 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"NAIRealmNames" isRequired:0 outError:&v162];
  id v12 = v162;
  NAIRealmNames = v10->_NAIRealmNames;
  v10->_NAIRealmNames = (NSArray *)v24;

  if (v12) {
    goto LABEL_35;
  }
  id v161 = 0;
  uint64_t v26 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"MCCAndMNCs" isRequired:0 outError:&v161];
  id v12 = v161;
  MCCAndMNCs = v10->_MCCAndMNCs;
  v10->_MCCAndMNCs = (NSArray *)v26;

  if (v12) {
    goto LABEL_35;
  }
  id v160 = 0;
  uint64_t v28 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DisplayedOperatorName" isRequired:0 outError:&v160];
  id v12 = v160;
  displayedOperatorName = v10->_displayedOperatorName;
  v10->_displayedOperatorName = (NSString *)v28;

  if (v12) {
    goto LABEL_35;
  }
  id v159 = 0;
  uint64_t v30 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"HIDDEN_NETWORK" isRequired:0 outError:&v159];
  id v12 = v159;
  isHiddenNum = v10->_isHiddenNum;
  v10->_isHiddenNum = (NSNumber *)v30;

  if (v12) {
    goto LABEL_35;
  }
  v10->_isHidden = [(NSNumber *)v10->_isHiddenNum BOOLValue];
  id v158 = 0;
  uint64_t v32 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SSID_STR" isRequired:0 outError:&v158];
  id v12 = v158;
  ssid = v10->_ssid;
  v10->_ssid = (NSString *)v32;

  if (v12) {
    goto LABEL_35;
  }
  id v157 = 0;
  uint64_t v34 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EncryptionType" isRequired:0 outError:&v157];
  id v12 = v157;
  encryptionType = v10->_encryptionType;
  v10->_encryptionType = (NSString *)v34;

  if (v12) {
    goto LABEL_35;
  }
  if (!v10->_encryptionType)
  {
    v10->_encryptionType = (NSString *)@"Any";
  }
  if ([v9 isStub])
  {
    id v156 = 0;
    uint64_t v36 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CredentialUUID" isRequired:0 outError:&v156];
    id v12 = v156;
    credentialUUID = v10->_credentialUUID;
    v10->_credentialUUID = (NSString *)v36;

    if (v12)
    {
LABEL_35:
      id v52 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      id v53 = v52;
      if (a5) {
        *a5 = v52;
      }
      id v54 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        unint64_t v55 = v54;
        v56 = objc_opt_class();
        id v57 = v56;
        id v58 = [v53 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v171 = v56;
        __int16 v172 = 2114;
        id v173 = v58;
        _os_log_impl(&dword_1A13F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_40;
    }
    id v155 = 0;
    v127 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyType" isRequired:0 outError:&v155];
    id v38 = v155;
    if (v38) {
      goto LABEL_33;
    }
    int v39 = [v127 intValue];
    v10->_proxyType = v39;
    if (v39 == 1)
    {
      id v150 = 0;
      uint64_t v47 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPACURL" isRequired:0 outError:&v150];
      id v48 = v150;
      uint64_t v49 = 216;
      goto LABEL_63;
    }
    if (v39 != 2) {
      goto LABEL_65;
    }
    id v154 = 0;
    uint64_t v40 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyServer" isRequired:0 outError:&v154];
    id v41 = v154;
    proxyServer = v10->_proxyServer;
    v10->_proxyServer = (NSString *)v40;

    if (!v41)
    {
      id v153 = 0;
      uint64_t v43 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyServerPort" isRequired:0 outError:&v153];
      id v41 = v153;
      proxyServerPort = v10->_proxyServerPort;
      v10->_proxyServerPort = (NSNumber *)v43;

      if (!v41)
      {
        id v152 = 0;
        uint64_t v45 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyUsername" isRequired:0 outError:&v152];
        id v41 = v152;
        proxyUsername = v10->_proxyUsername;
        v10->_proxyUsername = (NSString *)v45;

        if (!v41)
        {
          id v151 = 0;
          uint64_t v47 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPassword" isRequired:0 outError:&v151];
          id v48 = v151;
          uint64_t v49 = 208;
LABEL_63:
          long long v80 = *(Class *)((char *)&v10->super.super.isa + v49);
          *(Class *)((char *)&v10->super.super.isa + v49) = (Class)v47;

          goto LABEL_64;
        }
      }
    }
LABEL_92:
    uint64_t v51 = (uint64_t)v41;
    goto LABEL_34;
  }
  if ([(NSString *)v10->_encryptionType isEqualToString:@"Any"]) {
    char v50 = 1;
  }
  else {
    char v50 = [(NSString *)v10->_encryptionType isEqualToString:@"WEP"];
  }
  v10->_isWEP = v50;
  if ([(NSString *)v10->_encryptionType isEqualToString:@"Any"]
    || [(NSString *)v10->_encryptionType isEqualToString:@"WPA"]
    || [(NSString *)v10->_encryptionType isEqualToString:@"WPA2"])
  {
    v10->_isWPA = 1;
    goto LABEL_32;
  }
  BOOL v78 = [(NSString *)v10->_encryptionType isEqualToString:@"WPA3"];
  v10->_isWPA = v78;
  if (v10->_isWEP || v78)
  {
LABEL_32:
    id v149 = 0;
    v127 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EAPClientConfiguration" isRequired:0 outError:&v149];
    id v38 = v149;
    if (v38)
    {
LABEL_33:
      uint64_t v51 = (uint64_t)v38;
LABEL_34:

      id v12 = (id)v51;
      goto LABEL_35;
    }
    if (v127)
    {
      id v148 = 0;
      BOOL v63 = [(MCWiFiPayload *)v10 _eapConfigIsValid:v127 error:&v148];
      id v64 = v148;
      if (v63)
      {
        uint64_t v65 = [(MCWiFiPayload *)v10 _eapUsernameFromConfig:v127 isRequired:&v10->_usernameRequired];
        username = v10->_username;
        v10->_username = (NSString *)v65;

        uint64_t v67 = [(MCWiFiPayload *)v10 _eapPasswordFromConfig:v127 isRequired:&v10->_passwordRequired];
        password = v10->_password;
        v10->_password = (NSString *)v67;

        id v147 = v64;
        v125 = (void *)[v127 mutableCopy];
        uint64_t v69 = [v125 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"PayloadCertificateAnchorUUID" isRequired:0 outError:&v147];
        id v70 = v147;

        payloadCertificateAnchorUUID = v10->_payloadCertificateAnchorUUID;
        v10->_payloadCertificateAnchorUUID = (NSArray *)v69;

        uint64_t v51 = (uint64_t)v70;
        if (v70) {
          goto LABEL_49;
        }
        id v146 = 0;
        uint64_t v72 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"PayloadCertificateUUID" isRequired:0 outError:&v146];
        id v73 = v146;
        certificateUUID = v10->_certificateUUID;
        v10->_certificateUUID = (NSString *)v72;

        uint64_t v51 = (uint64_t)v73;
        if (v73)
        {
LABEL_49:

          goto LABEL_34;
        }
        [(MCWiFiPayload *)v10 setEapClientConfig:v125];

        goto LABEL_57;
      }
    }
    else
    {
      id v64 = 0;
    }
    id v145 = v64;
    uint64_t v75 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Password" isRequired:0 outError:&v145];
    id v76 = v145;

    id v77 = v10->_password;
    v10->_password = (NSString *)v75;

    if (v76)
    {
      uint64_t v51 = (uint64_t)v76;
      goto LABEL_34;
    }
    v10->_passwordRequired = 1;
LABEL_57:
  }
  id v144 = 0;
  v127 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyType" isRequired:0 outError:&v144];
  id v38 = v144;
  if (v38) {
    goto LABEL_33;
  }
  if (v127)
  {
    if ([v127 isEqualToString:@"None"])
    {
      uint64_t v79 = 0;
LABEL_83:
      [(MCWiFiPayload *)v10 setProxyType:v79];
      goto LABEL_84;
    }
    if ([v127 isEqualToString:@"Manual"])
    {
      uint64_t v79 = 2;
      goto LABEL_83;
    }
    if ([v127 isEqualToString:@"Auto"])
    {
      uint64_t v79 = 1;
      goto LABEL_83;
    }
    id v38 = +[MCPayload badFieldValueErrorWithField:@"ProxyType"];
    if (v38) {
      goto LABEL_33;
    }
  }
LABEL_84:
  if ([(MCWiFiPayload *)v10 proxyType] == 2)
  {
    id v143 = 0;
    uint64_t v92 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyServer" isRequired:1 outError:&v143];
    id v41 = v143;
    v93 = v10->_proxyServer;
    v10->_proxyServer = (NSString *)v92;

    if (v41) {
      goto LABEL_92;
    }
    id v142 = 0;
    uint64_t v94 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyServerPort" isRequired:0 outError:&v142];
    id v41 = v142;
    v95 = v10->_proxyServerPort;
    v10->_proxyServerPort = (NSNumber *)v94;

    if (v41) {
      goto LABEL_92;
    }
    id v141 = 0;
    uint64_t v96 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyUsername" isRequired:0 outError:&v141];
    id v41 = v141;
    v97 = v10->_proxyUsername;
    v10->_proxyUsername = (NSString *)v96;

    if (v41) {
      goto LABEL_92;
    }
    id v140 = 0;
    uint64_t v98 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPassword" isRequired:0 outError:&v140];
    id v41 = v140;
    uint64_t v99 = 208;
  }
  else
  {
    if (v10->_proxyType != 1) {
      goto LABEL_93;
    }
    id v139 = 0;
    uint64_t v98 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPACURL" isRequired:0 outError:&v139];
    id v41 = v139;
    uint64_t v99 = 216;
  }
  v100 = *(Class *)((char *)&v10->super.super.isa + v99);
  *(Class *)((char *)&v10->super.super.isa + v99) = (Class)v98;

  if (v41) {
    goto LABEL_92;
  }
LABEL_93:
  v101 = [(MCWiFiPayload *)v10 ssid];
  uint64_t v102 = [v101 length];

  if (!v102)
  {
    if (![(MCWiFiPayload *)v10 isHotspot]
      || ([(MCWiFiPayload *)v10 domainName],
          v103 = objc_claimAutoreleasedReturnValue(),
          uint64_t v104 = [v103 length],
          v103,
          !v104))
    {
      uint64_t v51 = +[MCPayload badFieldTypeErrorWithField:@"SSID_STR"];
      goto LABEL_99;
    }
    v105 = NSString;
    v106 = [(MCWiFiPayload *)v10 domainName];
    v107 = [NSString MCMakeUUID];
    uint64_t v108 = [v105 stringWithFormat:@"%@-%@", v106, v107];
    v109 = v10->_ssid;
    v10->_ssid = (NSString *)v108;
  }
  uint64_t v51 = 0;
LABEL_99:
  v110 = [(MCWiFiPayload *)v10 roamingConsortiumOIs];
  uint64_t v111 = [v110 count];

  if (!v111) {
    [(MCWiFiPayload *)v10 setRoamingConsortiumOIs:0];
  }
  if (v51) {
    goto LABEL_34;
  }
  v112 = [(MCWiFiPayload *)v10 NAIRealmNames];
  uint64_t v113 = [v112 count];

  if (!v113) {
    [(MCWiFiPayload *)v10 setNAIRealmNames:0];
  }
  v114 = [(MCWiFiPayload *)v10 MCCAndMNCs];
  uint64_t v115 = [v114 count];

  if (!v115)
  {
    [(MCWiFiPayload *)v10 setMCCAndMNCs:0];
    goto LABEL_65;
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id obj = [(MCWiFiPayload *)v10 MCCAndMNCs];
  uint64_t v122 = [obj countByEnumeratingWithState:&v135 objects:v174 count:16];
  if (!v122)
  {
LABEL_123:

    goto LABEL_65;
  }
  uint64_t v123 = *(void *)v136;
  while (1)
  {
    uint64_t v126 = 0;
LABEL_108:
    if (*(void *)v136 != v123) {
      objc_enumerationMutation(obj);
    }
    v116 = *(void **)(*((void *)&v135 + 1) + 8 * v126);
    objc_opt_class();
    v117 = v116;
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v116 length] != 6) {
      break;
    }
    v128 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
    for (uint64_t i = 0; i != 6; ++i)
    {
      uint64_t v119 = [v117 characterAtIndex:i];
      char v120 = [v128 characterIsMember:v119];
      if (i == 3)
      {
        if (v119 == 70) {
          char v121 = 1;
        }
        else {
          char v121 = v120;
        }
        if ((v121 & 1) == 0)
        {
LABEL_127:

          goto LABEL_128;
        }
      }
      else if ((v120 & 1) == 0)
      {
        goto LABEL_127;
      }
    }

    if (++v126 != v122) {
      goto LABEL_108;
    }
    uint64_t v122 = [obj countByEnumeratingWithState:&v135 objects:v174 count:16];
    if (!v122) {
      goto LABEL_123;
    }
  }
LABEL_128:
  id v48 = +[MCPayload badFieldTypeErrorWithField:@"MCCAndMNCs"];

LABEL_64:
  uint64_t v51 = (uint64_t)v48;
  if (v48) {
    goto LABEL_34;
  }
LABEL_65:

  id v134 = 0;
  uint64_t v81 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AutoJoin" isRequired:0 outError:&v134];
  id v12 = v134;
  autoJoinNum = v10->_autoJoinNum;
  v10->_autoJoinNum = (NSNumber *)v81;

  if (v12) {
    goto LABEL_35;
  }
  id v83 = v10->_autoJoinNum;
  BOOL v84 = !v83 || [(NSNumber *)v83 BOOLValue];
  v10->_autoJoin = v84;
  id v133 = 0;
  uint64_t v85 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"FirstAutoJoinRestricted" isRequired:0 outError:&v133];
  id v12 = v133;
  isFirstAutoJoinRestricted = v10->_isFirstAutoJoinRestricted;
  v10->_isFirstAutoJoinRestricted = (NSNumber *)v85;

  if (v12) {
    goto LABEL_35;
  }
  id v132 = 0;
  uint64_t v87 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CaptiveBypass" isRequired:0 outError:&v132];
  id v12 = v132;
  captiveBypassNum = v10->_captiveBypassNum;
  v10->_captiveBypassNum = (NSNumber *)v87;

  if (v12) {
    goto LABEL_35;
  }
  v89 = v10->_captiveBypassNum;
  if (v89) {
    LOBYTE(v89) = [(NSNumber *)v89 BOOLValue];
  }
  v10->_captiveBypass = (char)v89;
  id v131 = 0;
  uint64_t v90 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"DisableAssociationMACRandomization" isRequired:0 outError:&v131];
  id v12 = v131;
  disableAssociationMACRandomization = v10->_disableAssociationMACRandomization;
  v10->_disableAssociationMACRandomization = (NSNumber *)v90;

  if (v12) {
    goto LABEL_35;
  }
  id v130 = 0;
  v127 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"QoSMarkingPolicy" isRequired:0 outError:&v130];
  id v38 = v130;
  if (v38) {
    goto LABEL_33;
  }
  if (!v127)
  {
    id v53 = 0;
    goto LABEL_130;
  }
  id v129 = 0;
  [(MCWiFiPayload *)v10 _qosMarkingConfigIsValid:v127 error:&v129];
  id v38 = v129;
  if (v38) {
    goto LABEL_33;
  }
  id v53 = [(MCWiFiPayload *)v10 _createDictionaryWithAllowListKeyMigrated:v127];

LABEL_130:
  [(MCWiFiPayload *)v10 setQosMarkingConfig:v53];
  id v12 = 0;
LABEL_40:

  if ([v8 count])
  {
    id v59 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      id v60 = v59;
      id v61 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v171 = v61;
      __int16 v172 = 2114;
      id v173 = v8;
      _os_log_impl(&dword_1A13F0000, v60, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_44:
  return v10;
}

- (id)stubDictionary
{
  v39.receiver = self;
  v39.super_class = (Class)MCWiFiPayload;
  id v3 = [(MCPayload *)&v39 stubDictionary];
  uint64_t v4 = v3;
  ssid = self->_ssid;
  if (ssid) {
    [v3 setObject:ssid forKey:@"SSID_STR"];
  }
  encryptionType = self->_encryptionType;
  if (encryptionType) {
    [v4 setObject:encryptionType forKey:@"EncryptionType"];
  }
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_autoJoin];
  [v4 setObject:v7 forKey:@"AutoJoin"];

  isFirstAutoJoinRestricted = self->_isFirstAutoJoinRestricted;
  if (isFirstAutoJoinRestricted) {
    [v4 setObject:isFirstAutoJoinRestricted forKey:@"FirstAutoJoinRestricted"];
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_captiveBypass];
  [v4 setObject:v9 forKey:@"CaptiveBypass"];

  disableAssociationMACRandomization = self->_disableAssociationMACRandomization;
  if (disableAssociationMACRandomization) {
    [v4 setObject:disableAssociationMACRandomization forKey:@"DisableAssociationMACRandomization"];
  }
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_proxyType];
  [v4 setObject:v11 forKey:@"ProxyType"];

  proxyServer = self->_proxyServer;
  if (proxyServer) {
    [v4 setObject:proxyServer forKey:@"ProxyServer"];
  }
  proxyServerPort = self->_proxyServerPort;
  if (proxyServerPort) {
    [v4 setObject:proxyServerPort forKey:@"ProxyServerPort"];
  }
  proxyPACURLString = self->_proxyPACURLString;
  if (proxyPACURLString) {
    [v4 setObject:proxyPACURLString forKey:@"ProxyPACURL"];
  }
  credentialUUID = self->_credentialUUID;
  if (credentialUUID) {
    [v4 setObject:credentialUUID forKey:@"CredentialUUID"];
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWiFiPayload isHotspot](self, "isHotspot"));
  [v4 setObject:v16 forKeyedSubscript:@"IsHotspot"];

  v17 = [(MCWiFiPayload *)self HESSID];

  if (v17)
  {
    uint64_t v18 = [(MCWiFiPayload *)self HESSID];
    [v4 setObject:v18 forKeyedSubscript:@"HESSID"];
  }
  id v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWiFiPayload isServiceProviderRoamingEnabled](self, "isServiceProviderRoamingEnabled"));
  [v4 setObject:v19 forKeyedSubscript:@"ServiceProviderRoamingEnabled"];

  uint64_t v20 = [(MCWiFiPayload *)self roamingConsortiumOIs];

  if (v20)
  {
    id v21 = [(MCWiFiPayload *)self roamingConsortiumOIs];
    [v4 setObject:v21 forKeyedSubscript:@"RoamingConsortiumOIs"];
  }
  uint64_t v22 = [(MCWiFiPayload *)self NAIRealmNames];

  if (v22)
  {
    id v23 = [(MCWiFiPayload *)self NAIRealmNames];
    [v4 setObject:v23 forKeyedSubscript:@"NAIRealmNames"];
  }
  uint64_t v24 = [(MCWiFiPayload *)self MCCAndMNCs];

  if (v24)
  {
    id v25 = [(MCWiFiPayload *)self MCCAndMNCs];
    [v4 setObject:v25 forKeyedSubscript:@"MCCAndMNCs"];
  }
  uint64_t v26 = [(MCWiFiPayload *)self displayedOperatorName];

  if (v26)
  {
    id v27 = [(MCWiFiPayload *)self displayedOperatorName];
    [v4 setObject:v27 forKeyedSubscript:@"DisplayedOperatorName"];
  }
  uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_proxyPACFallbackAllowed];
  [v4 setObject:v28 forKeyedSubscript:@"ProxyPACFallbackAllowed"];

  id v29 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isHidden];
  [v4 setObject:v29 forKeyedSubscript:@"HIDDEN_NETWORK"];

  uint64_t v30 = [(MCWiFiPayload *)self qosMarkingConfig];

  if (v30)
  {
    v31 = [(MCWiFiPayload *)self qosMarkingConfig];
    [v4 setObject:v31 forKeyedSubscript:@"QoSMarkingPolicy"];
  }
  eapClientConfig = self->_eapClientConfig;
  if (eapClientConfig)
  {
    v33 = (void *)[(NSDictionary *)eapClientConfig mutableCopy];
    uint64_t v34 = self->_eapClientConfig;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __31__MCWiFiPayload_stubDictionary__block_invoke;
    v37[3] = &unk_1E5A67DE8;
    id v38 = v33;
    id v35 = v33;
    [(NSDictionary *)v34 enumerateKeysAndObjectsUsingBlock:v37];
    [v4 setObject:v35 forKeyedSubscript:@"EAPClientConfiguration"];
  }
  return v4;
}

void __31__MCWiFiPayload_stubDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (_nonPrivacySensitiveEAPKeys_onceToken != -1) {
    dispatch_once(&_nonPrivacySensitiveEAPKeys_onceToken, &__block_literal_global_19);
  }
  if (([(id)_nonPrivacySensitiveEAPKeys_keys containsObject:v6] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:@"(present)" forKeyedSubscript:v6];
  }
}

- (id)subtitle1Label
{
  v2 = [(MCWiFiPayload *)self ssid];
  if (v2) {
    id v3 = @"NETWORK_COLON";
  }
  else {
    id v3 = @"NETWORK_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  v2 = [(MCWiFiPayload *)self ssid];
  if (v2)
  {
    id v3 = MCLocalizedString(@"ENCRYPTION_COLON");
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_localizedEncryptionTypeString
{
  id v3 = [(MCWiFiPayload *)self encryptionType];
  uint64_t v4 = [(MCWiFiPayload *)self ssid];

  if (v4)
  {
    if (v3)
    {
      if (![v3 isEqualToString:@"Any"])
      {
        id v6 = v3;
        goto LABEL_8;
      }
      id v5 = @"ANY_ENCRYPTION";
    }
    else
    {
      id v5 = @"NONE";
    }
    MCLocalizedString(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    uint64_t v4 = v6;
  }

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  if ([(MCWiFiPayload *)self isHotspot])
  {
    id v5 = [MCKeyValue alloc];
    id v6 = MCLocalizedStringForBool(1);
    id v7 = MCLocalizedString(@"WIFI_HOTSPOT");
    id v8 = [(MCKeyValue *)v5 initWithLocalizedString:v6 localizedKey:v7];

    [v4 addObject:v8];
  }
  id v9 = [(MCWiFiPayload *)self ssid];

  if (v9)
  {
    id v10 = [MCKeyValue alloc];
    uint64_t v11 = [(MCWiFiPayload *)self ssid];
    id v12 = MCLocalizedString(@"WIFI_SSID");
    char v13 = [(MCKeyValue *)v10 initWithLocalizedString:v11 localizedKey:v12];

    [v4 addObject:v13];
  }
  uint64_t v14 = [(MCWiFiPayload *)self HESSID];

  if (v14)
  {
    uint64_t v15 = [MCKeyValue alloc];
    uint64_t v16 = [(MCWiFiPayload *)self HESSID];
    v17 = MCLocalizedString(@"WIFI_HESSID");
    uint64_t v18 = [(MCKeyValue *)v15 initWithLocalizedString:v16 localizedKey:v17];

    [v4 addObject:v18];
  }
  id v19 = [(MCWiFiPayload *)self displayedOperatorName];

  if (v19)
  {
    uint64_t v20 = [MCKeyValue alloc];
    id v21 = [(MCWiFiPayload *)self displayedOperatorName];
    uint64_t v22 = MCLocalizedString(@"WIFI_OPERATOR");
    id v23 = [(MCKeyValue *)v20 initWithLocalizedString:v21 localizedKey:v22];

    [v4 addObject:v23];
  }
  uint64_t v24 = [(MCWiFiPayload *)self domainName];

  if (v24)
  {
    id v25 = [MCKeyValue alloc];
    uint64_t v26 = [(MCWiFiPayload *)self domainName];
    id v27 = MCLocalizedString(@"WIFI_DOMAIN");
    uint64_t v28 = [(MCKeyValue *)v25 initWithLocalizedString:v26 localizedKey:v27];

    [v4 addObject:v28];
  }
  id v29 = [(MCWiFiPayload *)self isHiddenNum];

  if (v29)
  {
    uint64_t v30 = [MCKeyValue alloc];
    v31 = MCLocalizedStringForBool([(NSNumber *)self->_isHiddenNum BOOLValue]);
    uint64_t v32 = MCLocalizedString(@"WIFI_HIDDEN");
    v33 = [(MCKeyValue *)v30 initWithLocalizedString:v31 localizedKey:v32];

    [v4 addObject:v33];
  }
  uint64_t v34 = [(MCWiFiPayload *)self _localizedEncryptionTypeString];
  if (v34)
  {
    id v35 = [MCKeyValue alloc];
    uint64_t v36 = MCLocalizedString(@"WIFI_ENCRYPTION");
    id v37 = [(MCKeyValue *)v35 initWithLocalizedString:v34 localizedKey:v36];
    [v4 addObject:v37];
  }
  id v38 = [(MCWiFiPayload *)self autoJoinNum];

  if (v38)
  {
    objc_super v39 = [MCKeyValue alloc];
    uint64_t v40 = MCLocalizedStringForBool([(NSNumber *)self->_autoJoinNum BOOLValue]);
    id v41 = MCLocalizedString(@"WIFI_AUTOJOIN");
    id v42 = [(MCKeyValue *)v39 initWithLocalizedString:v40 localizedKey:v41];

    [v4 addObject:v42];
  }
  if ([(MCWiFiPayload *)self captiveBypass])
  {
    uint64_t v43 = [MCKeyValue alloc];
    id v44 = MCLocalizedStringForBool([(NSNumber *)self->_captiveBypassNum BOOLValue]);
    uint64_t v45 = MCLocalizedString(@"WIFI_CAPTIVEBYPASS");
    id v46 = [(MCKeyValue *)v43 initWithLocalizedString:v44 localizedKey:v45];

    [v4 addObject:v46];
  }
  uint64_t v47 = [(MCWiFiPayload *)self disableAssociationMACRandomization];

  if (v47)
  {
    id v48 = [MCKeyValue alloc];
    uint64_t v49 = MCLocalizedStringForBool([(NSNumber *)self->_disableAssociationMACRandomization BOOLValue]);
    char v50 = MCLocalizedString(@"WIFI_ASSOCIATIONMACRANDOMIZATIONDISABLED");
    uint64_t v51 = [(MCKeyValue *)v48 initWithLocalizedString:v49 localizedKey:v50];

    [v4 addObject:v51];
  }
  id v52 = [(MCWiFiPayload *)self password];

  if (v52)
  {
    id v53 = [MCKeyValue alloc];
    id v54 = MCLocalizedString(@"PRESENT");
    unint64_t v55 = MCLocalizedString(@"PASSWORD");
    v56 = [(MCKeyValue *)v53 initWithLocalizedString:v54 localizedKey:v55];

    [v4 addObject:v56];
  }
  id v57 = [(MCWiFiPayload *)self eapClientConfig];

  if (v57)
  {
    id v58 = [MCKeyValue alloc];
    id v59 = MCLocalizedString(@"PRESENT");
    id v60 = MCLocalizedString(@"WIFI_EAP_CONFIGURATION");
    id v61 = [(MCKeyValue *)v58 initWithLocalizedString:v59 localizedKey:v60];

    [v4 addObject:v61];
  }
  if ([v4 count])
  {
    id v62 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v62];

    uint64_t v63 = objc_opt_new();
    uint64_t v4 = (void *)v63;
  }
  unsigned int v64 = [(MCWiFiPayload *)self proxyType];
  if (v64 > 2) {
    uint64_t v65 = @"WIFI_PROXY_TYPE_UNKNOWN";
  }
  else {
    uint64_t v65 = off_1E5A67E08[v64];
  }
  uint64_t v66 = MCLocalizedString(v65);
  uint64_t v67 = [MCKeyValue alloc];
  id v68 = MCLocalizedString(@"PROXY");
  id v152 = (void *)v66;
  uint64_t v69 = [(MCKeyValue *)v67 initWithLocalizedString:v66 localizedKey:v68];
  [v4 addObject:v69];

  id v70 = [(MCWiFiPayload *)self proxyServer];

  if (v70)
  {
    id v71 = [MCKeyValue alloc];
    uint64_t v72 = [(MCWiFiPayload *)self proxyServer];
    id v73 = MCLocalizedString(@"SERVER");
    id v74 = [(MCKeyValue *)v71 initWithLocalizedString:v72 localizedKey:v73];

    [v4 addObject:v74];
  }
  uint64_t v75 = [(MCWiFiPayload *)self proxyServerPort];

  if (v75)
  {
    id v76 = NSString;
    id v77 = [(MCWiFiPayload *)self proxyServerPort];
    BOOL v78 = [v76 stringWithFormat:@"%@", v77];

    uint64_t v79 = [MCKeyValue alloc];
    long long v80 = MCLocalizedString(@"PORT");
    uint64_t v81 = [(MCKeyValue *)v79 initWithLocalizedString:v78 localizedKey:v80];

    [v4 addObject:v81];
  }
  id v82 = [(MCWiFiPayload *)self proxyUsername];

  id v83 = &off_1E5A65000;
  if (v82)
  {
    BOOL v84 = [MCKeyValue alloc];
    uint64_t v85 = [(MCWiFiPayload *)self proxyUsername];
    v86 = MCLocalizedString(@"USERNAME");
    uint64_t v87 = [(MCKeyValue *)v84 initWithLocalizedString:v85 localizedKey:v86];

    [v4 addObject:v87];
  }
  v88 = [(MCWiFiPayload *)self proxyPassword];

  if (v88)
  {
    v89 = [MCKeyValue alloc];
    uint64_t v90 = MCLocalizedString(@"PRESENT");
    v91 = MCLocalizedString(@"PASSWORD");
    uint64_t v92 = [(MCKeyValue *)v89 initWithLocalizedString:v90 localizedKey:v91];

    [v4 addObject:v92];
  }
  v93 = [(MCWiFiPayload *)self proxyPACURLString];

  if (v93)
  {
    uint64_t v94 = [MCKeyValue alloc];
    v95 = [(MCWiFiPayload *)self proxyPACURLString];
    uint64_t v96 = MCLocalizedString(@"WIFI_PROXY_PAC_URL");
    v97 = [(MCKeyValue *)v94 initWithLocalizedString:v95 localizedKey:v96];

    [v4 addObject:v97];
  }
  if ([(MCWiFiPayload *)self proxyType] == 1)
  {
    uint64_t v98 = [MCKeyValue alloc];
    uint64_t v99 = MCLocalizedStringForBool([(MCWiFiPayload *)self proxyPACFallbackAllowed]);
    v100 = MCLocalizedString(@"WIFI_PROXY_PAC_FALLBACK");
    v101 = [(MCKeyValue *)v98 initWithLocalizedString:v99 localizedKey:v100];

    [v4 addObject:v101];
  }
  if ([v4 count])
  {
    uint64_t v102 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v102];
  }
  v103 = [(MCWiFiPayload *)self roamingConsortiumOIs];
  uint64_t v104 = [v103 count];

  if (v104)
  {
    v105 = [(MCWiFiPayload *)self roamingConsortiumOIs];
    v106 = MCLocalizedString(@"WIFI_ROAMING_CONSORTIUM_OIS");
    v107 = +[MCKeyValueSection sectionWithLocalizedArray:v105 title:v106 footer:0];

    [v3 addObject:v107];
  }
  uint64_t v108 = [(MCWiFiPayload *)self NAIRealmNames];
  uint64_t v109 = [v108 count];

  if (v109)
  {
    v110 = [(MCWiFiPayload *)self NAIRealmNames];
    uint64_t v111 = MCLocalizedString(@"WIFI_NAI_REALM_NAMES");
    v112 = +[MCKeyValueSection sectionWithLocalizedArray:v110 title:v111 footer:0];

    [v3 addObject:v112];
  }
  uint64_t v113 = [(MCWiFiPayload *)self MCCAndMNCs];
  uint64_t v114 = [v113 count];

  if (v114)
  {
    uint64_t v115 = [(MCWiFiPayload *)self MCCAndMNCs];
    v116 = MCLocalizedString(@"WIFI_MCC_AND_MNCS");
    v117 = +[MCKeyValueSection sectionWithLocalizedArray:v115 title:v116 footer:0];

    [v3 addObject:v117];
  }
  v118 = [(MCWiFiPayload *)self qosMarkingConfig];
  uint64_t v119 = [v118 count];

  if (v119)
  {
    id v150 = v34;
    id v151 = v3;
    id v120 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v121 = [(MCWiFiPayload *)self qosMarkingConfig];
    uint64_t v122 = [v121 objectForKeyedSubscript:@"QoSMarkingEnabled"];

    if (v122)
    {
      uint64_t v123 = [MCKeyValue alloc];
      v124 = MCLocalizedStringForBool([v122 BOOLValue]);
      v125 = MCLocalizedString(@"WIFI_QOS_MARKING_ENABLED");
      uint64_t v126 = [(MCKeyValue *)v123 initWithLocalizedString:v124 localizedKey:v125];

      [v120 addObject:v126];
    }
    v127 = [(MCWiFiPayload *)self qosMarkingConfig];
    v128 = [v127 objectForKeyedSubscript:@"QoSMarkingAppleAudioVideoCalls"];

    if (v128)
    {
      id v129 = [MCKeyValue alloc];
      id v130 = MCLocalizedStringForBool([v128 BOOLValue]);
      id v131 = MCLocalizedString(@"WIFI_QOS_APPLE_AUDIO_VIDEO_CALLS");
      id v132 = [(MCKeyValue *)v129 initWithLocalizedString:v130 localizedKey:v131];

      [v120 addObject:v132];
    }
    id v133 = [(MCWiFiPayload *)self qosMarkingConfig];
    id v134 = [v133 objectForKeyedSubscript:@"QoSMarkingURL"];

    if (v134)
    {
      long long v135 = [MCKeyValue alloc];
      long long v136 = MCLocalizedString(@"WIFI_QOS_MARKING_URL");
      long long v137 = [(MCKeyValue *)v135 initWithLocalizedString:v134 localizedKey:v136];

      [v120 addObject:v137];
    }
    long long v138 = [(MCWiFiPayload *)self qosMarkingConfig];
    id v139 = [v138 objectForKeyedSubscript:@"QoSMarkingAllowListAppIdentifiers"];
    id v140 = v139;
    if (v139)
    {
      id v141 = v139;
    }
    else
    {
      id v142 = [(MCWiFiPayload *)self qosMarkingConfig];
      id v141 = [v142 objectForKeyedSubscript:@"QoSMarkingWhitelistedAppIdentifiers"];

      id v83 = &off_1E5A65000;
    }

    if ([v141 count])
    {
      id v143 = [MCKeyValue alloc];
      id v144 = MCLocalizedString(@"WIFI_QOS_MARKED_APP_IDS");
      id v145 = [(MCKeyValue *)v143 initWithLocalizedArray:v141 localizedKey:v144];

      id v83 = &off_1E5A65000;
      [v120 addObject:v145];
    }
    id v3 = v151;
    if ([v120 count])
    {
      id v146 = [v83[73] sectionWithKeyValues:v120];
      id v147 = MCLocalizedString(@"WIFI_QOS_MARKING_POLICY");
      [v146 setSectionTitle:v147];

      [v151 addObject:v146];
    }

    uint64_t v34 = v150;
  }
  if (![v3 count])
  {

    id v3 = 0;
  }
  id v148 = v3;

  return v148;
}

- (id)verboseDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v45.receiver = self;
  v45.super_class = (Class)MCWiFiPayload;
  uint64_t v4 = [(MCPayload *)&v45 verboseDescription];
  id v5 = [v3 stringWithString:v4];

  if ([(MCWiFiPayload *)self isHotspot]) {
    [v5 appendString:@"IsHotspot   : Yes\n"];
  }
  id v6 = [(MCWiFiPayload *)self ssid];

  if (v6)
  {
    id v7 = [(MCWiFiPayload *)self ssid];
    [v5 appendFormat:@"SSID        : %@\n", v7];
  }
  id v8 = [(MCWiFiPayload *)self HESSID];

  if (v8)
  {
    id v9 = [(MCWiFiPayload *)self HESSID];
    [v5 appendFormat:@"HESSID      : %@\n", v9];
  }
  id v10 = [(MCWiFiPayload *)self roamingConsortiumOIs];

  if (v10)
  {
    uint64_t v11 = [(MCWiFiPayload *)self roamingConsortiumOIs];
    [v5 appendFormat:@"Roaming Consortium OIs:\n%@\n", v11];
  }
  id v12 = [(MCWiFiPayload *)self NAIRealmNames];

  if (v12)
  {
    char v13 = [(MCWiFiPayload *)self NAIRealmNames];
    [v5 appendFormat:@"NAI Realm Names:\n%@\n", v13];
  }
  uint64_t v14 = [(MCWiFiPayload *)self MCCAndMNCs];

  if (v14)
  {
    uint64_t v15 = [(MCWiFiPayload *)self MCCAndMNCs];
    [v5 appendFormat:@"MCC and MNCs:\n%@\n", v15];
  }
  uint64_t v16 = [(MCWiFiPayload *)self displayedOperatorName];

  if (v16)
  {
    v17 = [(MCWiFiPayload *)self displayedOperatorName];
    [v5 appendFormat:@"Operator    : %@\n", v17];
  }
  uint64_t v18 = [(MCWiFiPayload *)self domainName];

  if (v18)
  {
    id v19 = [(MCWiFiPayload *)self domainName];
    [v5 appendFormat:@"Domain      : %@\n", v19];
  }
  uint64_t v20 = MCStringForBool(self->_isHidden);
  [v5 appendFormat:@"Hidden      : %@\n", v20];

  id v21 = [(MCWiFiPayload *)self encryptionType];
  [v5 appendFormat:@"Encryption  : %@\n", v21];

  uint64_t v22 = MCStringForBool(self->_autoJoin);
  [v5 appendFormat:@"Autojoin    : %@\n", v22];

  id v23 = [(MCWiFiPayload *)self isFirstAutoJoinRestricted];

  if (v23)
  {
    uint64_t v24 = [(MCWiFiPayload *)self isFirstAutoJoinRestricted];
    id v25 = MCStringForBool([v24 BOOLValue]);
    [v5 appendFormat:@"First Autojoin Restricted: %@\n", v25];
  }
  uint64_t v26 = [(MCWiFiPayload *)self password];

  if (v26) {
    [v5 appendFormat:@"Password    : (present)\n"];
  }
  id v27 = [(MCWiFiPayload *)self eapClientConfig];

  if (v27) {
    [v5 appendFormat:@"EAP Config  : (present)\n"];
  }
  uint64_t v28 = [(MCWiFiPayload *)self qosMarkingConfig];

  if (v28) {
    [v5 appendFormat:@"QoS Marking Policy Config  : (present)\n"];
  }
  id v29 = [(MCWiFiPayload *)self disableAssociationMACRandomization];

  if (v29)
  {
    uint64_t v30 = [(MCWiFiPayload *)self disableAssociationMACRandomization];
    v31 = MCStringForBool([v30 BOOLValue] ^ 1);
    [v5 appendFormat:@"Randomization: %@\n", v31];
  }
  unsigned int v32 = [(MCWiFiPayload *)self proxyType];
  if (v32 > 2) {
    v33 = @"Unknown";
  }
  else {
    v33 = off_1E5A67E20[v32];
  }
  [v5 appendFormat:@"Proxy       : %@\n", v33];
  uint64_t v34 = [(MCWiFiPayload *)self proxyServer];

  if (v34)
  {
    id v35 = [(MCWiFiPayload *)self proxyServer];
    [v5 appendFormat:@"  Server    : %@\n", v35];
  }
  uint64_t v36 = [(MCWiFiPayload *)self proxyServerPort];

  if (v36)
  {
    id v37 = [(MCWiFiPayload *)self proxyServerPort];
    [v5 appendFormat:@"  Port      : %@\n", v37];
  }
  id v38 = [(MCWiFiPayload *)self proxyUsername];

  if (v38)
  {
    objc_super v39 = [(MCWiFiPayload *)self proxyUsername];
    [v5 appendFormat:@"  Username  : %@\n", v39];
  }
  uint64_t v40 = [(MCWiFiPayload *)self proxyPassword];

  if (v40) {
    [v5 appendFormat:@"  Password  : (present)\n"];
  }
  id v41 = [(MCWiFiPayload *)self proxyPACURLString];

  if (v41)
  {
    id v42 = [(MCWiFiPayload *)self proxyPACURLString];
    [v5 appendFormat:@"  PAC URL   : %@\n", v42];
  }
  if ([(MCWiFiPayload *)self proxyType] == 1)
  {
    uint64_t v43 = MCStringForBool([(MCWiFiPayload *)self proxyPACFallbackAllowed]);
    [v5 appendFormat:@"   fallback : %@\n", v43];
  }
  return v5;
}

- (id)installationWarnings
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([(MCWiFiPayload *)self proxyType])
  {
    id v3 = +[MCHacks sharedHacks];
    if ([v3 isGreenTea]) {
      uint64_t v4 = @"INSTALL_WARNING_WLAN";
    }
    else {
      uint64_t v4 = @"INSTALL_WARNING_WIFI";
    }
    id v5 = MCLocalizedStringByDevice(v4);
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(MCWiFiPayload *)self disableAssociationMACRandomization];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v10 = 0;
    BOOL v11 = v5 != 0;
LABEL_15:
    if (v11) {
      char v13 = v5;
    }
    else {
      char v13 = v10;
    }
    id v12 = v13;
    goto LABEL_19;
  }
  id v8 = +[MCHacks sharedHacks];
  if ([v8 isGreenTea]) {
    id v9 = @"INSTALL_WARNING_WLAN_RANDOMIZATION";
  }
  else {
    id v9 = @"INSTALL_WARNING_WIFI_RANDOMIZATION";
  }
  id v10 = MCLocalizedStringByDevice(v9);

  BOOL v11 = v5 != 0;
  if (!v5 || !v10) {
    goto LABEL_15;
  }
  id v12 = [v5 stringByAppendingFormat:@" %@", v10];
LABEL_19:
  uint64_t v14 = v12;
  if (v12)
  {
    uint64_t v15 = +[MCHacks sharedHacks];
    if ([v15 isGreenTea]) {
      uint64_t v16 = @"INSTALL_WARNING_WLAN_TITLE";
    }
    else {
      uint64_t v16 = @"INSTALL_WARNING_WIFI_TITLE";
    }
    v17 = MCLocalizedString(v16);

    uint64_t v18 = +[MCProfileWarning warningWithLocalizedTitle:v17 localizedBody:v14 isLongForm:1];
    v21[0] = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)userInputFields
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(MCWiFiPayload *)self username];
  if (!v4 && [(MCWiFiPayload *)self usernameRequired])
  {
    id v5 = MCLocalizedString(@"USERNAME_PROMPT_TITLE");
    id v6 = NSString;
    char v7 = [@"WIFI_USERNAME_PROMPT_DESCRIPTION" MCAppendGreenteaSuffix];
    id v8 = MCLocalizedString(v7);
    id v9 = [(MCWiFiPayload *)self ssid];
    id v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
    BOOL v11 = +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCPayloadUserPromptUtilities, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"UsernameUserInputKey", v5, v10, 0, 0, 0, 0, 0, 0x100000000);
    [v3 addObject:v11];
  }
  id v12 = [(MCWiFiPayload *)self password];
  if (!v12)
  {
    if (![(MCWiFiPayload *)self passwordRequired]) {
      goto LABEL_11;
    }
    uint64_t v13 = [v4 length];
    uint64_t v14 = NSString;
    if (v13)
    {
      uint64_t v15 = [@"WIFI_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION" MCAppendGreenteaSuffix];
      uint64_t v16 = MCLocalizedString(v15);
      id v12 = objc_msgSend(v14, "stringWithFormat:", v16, v4);
    }
    else
    {
      uint64_t v15 = [@"WIFI_PASSWORD_PROMPT_DESCRIPTION" MCAppendGreenteaSuffix];
      uint64_t v16 = MCLocalizedString(v15);
      v17 = [(MCWiFiPayload *)self ssid];
      id v12 = objc_msgSend(v14, "stringWithFormat:", v16, v17);
    }
    uint64_t v18 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE");
    id v19 = +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCPayloadUserPromptUtilities, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"PasswordUserInputKey", v18, v12, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v19];
  }
LABEL_11:

  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = v4;
  if (self->_proxyType)
  {
    [v4 addObject:@"ProxyType"];
    self->_proxyType = 0;
  }
  if (self->_proxyServer)
  {
    [v5 addObject:@"ProxyServer"];
    proxyServer = self->_proxyServer;
    self->_proxyServer = 0;
  }
  if (self->_proxyServerPort)
  {
    [v5 addObject:@"ProxyServerPort"];
    proxyServerPort = self->_proxyServerPort;
    self->_proxyServerPort = 0;
  }
  if (self->_proxyUsername)
  {
    [v5 addObject:@"ProxyUsername"];
    proxyUsername = self->_proxyUsername;
    self->_proxyUsername = 0;
  }
  if (self->_proxyPassword)
  {
    [v5 addObject:@"ProxyPassword"];
    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    if (self->_proxyPassword)
    {
      [v5 addObject:@"ProxyPassword"];
      id v10 = self->_proxyPassword;
      self->_proxyPassword = 0;
    }
  }
  if (self->_proxyPACURLString)
  {
    [v5 addObject:@"ProxyPACURL"];
    proxyPACURLString = self->_proxyPACURLString;
    self->_proxyPACURLString = 0;
  }
  if (self->_proxyPACFallbackAllowed)
  {
    [v5 addObject:@"ProxyPACFallbackAllowed"];
    self->_proxyPACFallbackAllowed = 0;
  }
  if ([v5 count])
  {
    id v12 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v12;
      uint64_t v14 = [(MCPayload *)self friendlyName];
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_INFO, "Payload “%{public}@” has ignored proxy keys. They are: %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }

  return 0;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)captiveBypass
{
  return self->_captiveBypass;
}

- (void)setCaptiveBypass:(BOOL)a3
{
  self->_captiveBypass = a3;
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(id)a3
{
}

- (BOOL)isWEP
{
  return self->_isWEP;
}

- (void)setIsWEP:(BOOL)a3
{
  self->_isWEP = a3;
}

- (BOOL)isWPA
{
  return self->_isWPA;
}

- (void)setIsWPA:(BOOL)a3
{
  self->_isWPA = a3;
}

- (NSDictionary)eapClientConfig
{
  return self->_eapClientConfig;
}

- (void)setEapClientConfig:(id)a3
{
}

- (NSDictionary)qosMarkingConfig
{
  return self->_qosMarkingConfig;
}

- (void)setQosMarkingConfig:(id)a3
{
}

- (NSNumber)disableAssociationMACRandomization
{
  return self->_disableAssociationMACRandomization;
}

- (void)setDisableAssociationMACRandomization:(id)a3
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

- (BOOL)autoJoin
{
  return self->_autoJoin;
}

- (void)setAutoJoin:(BOOL)a3
{
  self->_autoJoin = a3;
}

- (NSNumber)isFirstAutoJoinRestricted
{
  return self->_isFirstAutoJoinRestricted;
}

- (void)setIsFirstAutoJoinRestricted:(id)a3
{
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
}

- (NSArray)payloadCertificateAnchorUUID
{
  return self->_payloadCertificateAnchorUUID;
}

- (void)setPayloadCertificateAnchorUUID:(id)a3
{
}

- (int)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(int)a3
{
  self->_proxyType = a3;
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
}

- (NSNumber)proxyServerPort
{
  return self->_proxyServerPort;
}

- (void)setProxyServerPort:(id)a3
{
}

- (NSString)proxyUsername
{
  return self->_proxyUsername;
}

- (void)setProxyUsername:(id)a3
{
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (void)setProxyPassword:(id)a3
{
}

- (NSString)proxyPACURLString
{
  return self->_proxyPACURLString;
}

- (void)setProxyPACURLString:(id)a3
{
}

- (BOOL)proxyPACFallbackAllowed
{
  return self->_proxyPACFallbackAllowed;
}

- (void)setProxyPACFallbackAllowed:(BOOL)a3
{
  self->_proxyPACFallbackAllowed = a3;
}

- (NSString)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
}

- (BOOL)isHotspot
{
  return self->_isHotspot;
}

- (void)setIsHotspot:(BOOL)a3
{
  self->_isHotspot = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)HESSID
{
  return self->_HESSID;
}

- (void)setHESSID:(id)a3
{
}

- (BOOL)isServiceProviderRoamingEnabled
{
  return self->_serviceProviderRoamingEnabled;
}

- (void)setServiceProviderRoamingEnabled:(BOOL)a3
{
  self->_serviceProviderRoamingEnabled = a3;
}

- (NSArray)roamingConsortiumOIs
{
  return self->_roamingConsortiumOIs;
}

- (void)setRoamingConsortiumOIs:(id)a3
{
}

- (NSArray)NAIRealmNames
{
  return self->_NAIRealmNames;
}

- (void)setNAIRealmNames:(id)a3
{
}

- (NSArray)MCCAndMNCs
{
  return self->_MCCAndMNCs;
}

- (void)setMCCAndMNCs:(id)a3
{
}

- (NSString)displayedOperatorName
{
  return self->_displayedOperatorName;
}

- (void)setDisplayedOperatorName:(id)a3
{
}

- (NSNumber)isHiddenNum
{
  return self->_isHiddenNum;
}

- (void)setIsHiddenNum:(id)a3
{
}

- (NSNumber)autoJoinNum
{
  return self->_autoJoinNum;
}

- (void)setAutoJoinNum:(id)a3
{
}

- (NSNumber)captiveBypassNum
{
  return self->_captiveBypassNum;
}

- (void)setCaptiveBypassNum:(id)a3
{
}

- (NSNumber)proxyPACFallbackAllowedNum
{
  return self->_proxyPACFallbackAllowedNum;
}

- (void)setProxyPACFallbackAllowedNum:(id)a3
{
}

- (NSNumber)isHotspotNum
{
  return self->_isHotspotNum;
}

- (void)setIsHotspotNum:(id)a3
{
}

- (NSNumber)serviceProviderRoamingEnabledNum
{
  return self->_serviceProviderRoamingEnabledNum;
}

- (void)setServiceProviderRoamingEnabledNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderRoamingEnabledNum, 0);
  objc_storeStrong((id *)&self->_isHotspotNum, 0);
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, 0);
  objc_storeStrong((id *)&self->_captiveBypassNum, 0);
  objc_storeStrong((id *)&self->_autoJoinNum, 0);
  objc_storeStrong((id *)&self->_isHiddenNum, 0);
  objc_storeStrong((id *)&self->_displayedOperatorName, 0);
  objc_storeStrong((id *)&self->_MCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_NAIRealmNames, 0);
  objc_storeStrong((id *)&self->_roamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_HESSID, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_proxyPACURLString, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyServerPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_isFirstAutoJoinRestricted, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_disableAssociationMACRandomization, 0);
  objc_storeStrong((id *)&self->_qosMarkingConfig, 0);
  objc_storeStrong((id *)&self->_eapClientConfig, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
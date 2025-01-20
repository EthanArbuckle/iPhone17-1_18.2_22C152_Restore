@interface EMSMIMEUtilities
+ (BOOL)_isICloudAddress:(id)a3;
+ (unint64_t)_encryptionLevelForSender:(id)a3;
+ (unint64_t)_messageSecurityLevelViaOtherDevices;
+ (unint64_t)encryptionLevelForSender:(id)a3 forAdvertisement:(BOOL)a4 useGCM:(BOOL *)a5 encryptSubject:(BOOL *)a6;
@end

@implementation EMSMIMEUtilities

void ___ef_log_EMSMIMEUtilities_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMSMIMEUtilities");
  v1 = (void *)_ef_log_EMSMIMEUtilities_log;
  _ef_log_EMSMIMEUtilities_log = (uint64_t)v0;
}

+ (unint64_t)_messageSecurityLevelViaOtherDevices
{
  v49[1] = *MEMORY[0x1E4F143B8];
  if (!+[EMInternalPreferences preferenceEnabled:31])
  {
    if (sComputedMessageSecurityLevel == 1) {
      return sCurrentSecurityLevel;
    }
    v36 = [MEMORY[0x1E4F179C8] defaultStore];
    v49[0] = *MEMORY[0x1E4F17750];
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    id v44 = 0;
    v4 = [v36 accountsWithAccountTypeIdentifiers:v3 error:&v44];
    id v5 = v44;
    v35 = [v4 firstObject];

    if (v5)
    {
      v6 = _ef_log_EMSMIMEUtilities();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v5;
        _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "Error in getting account: %@\nWill drop to most-compatible", buf, 0xCu);
      }

      unint64_t v2 = 100;
      goto LABEL_17;
    }
    v31 = [MEMORY[0x1E4F4EF40] sharedInstance];
    v34 = [v31 altDSIDForAccount:v35];
    id v33 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    [v33 setAppleIDWithAltDSID:v34 inUse:1 forService:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4F4F018]);
    v8 = objc_msgSend(v35, "aa_altDSID");
    [v7 setAltDSID:v8];

    [v7 setIncludeUntrustedDevices:1];
    uint64_t v48 = *MEMORY[0x1E4F4EF10];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v7 setServices:v9];

    [v7 setOperatingSystems:&unk_1F1A62070];
    v10 = [MEMORY[0x1E4F60E18] promise];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __56__EMSMIMEUtilities__messageSecurityLevelViaOtherDevices__block_invoke;
    v42[3] = &unk_1E63E4358;
    id v11 = v10;
    id v43 = v11;
    v30 = v11;
    [v33 fetchDeviceListWithContext:v7 completion:v42];
    v12 = [v11 future];
    id v41 = 0;
    v32 = [v12 result:&v41];
    id v5 = v41;

    if (v5)
    {
      v13 = _ef_log_EMSMIMEUtilities();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v5;
        _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "Error in getting devices: %@\nWill drop to most-compatible", buf, 0xCu);
      }
LABEL_12:
      int v14 = 0;
LABEL_13:

      v15 = v32;
      goto LABEL_14;
    }
    v15 = v32;
    if (![v32 count])
    {
      int v14 = 1;
LABEL_14:

      if (v14) {
        unint64_t v2 = 200;
      }
      else {
        unint64_t v2 = 100;
      }
LABEL_17:

      sCurrentSecurityLevel = v2;
      sComputedMessageSecurityLevel = 1;

      return v2;
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v13 = v32;
    uint64_t v17 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (!v17)
    {
      int v14 = 1;
      goto LABEL_13;
    }
    uint64_t v18 = *(void *)v38;
LABEL_22:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v38 != v18) {
        objc_enumerationMutation(v13);
      }
      v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
      v21 = [v20 operatingSystemName];
      int v22 = [v21 isEqualToString:@"macOS"];

      if (v22) {
        break;
      }
      v26 = [v20 operatingSystemName];
      int v27 = [v26 isEqualToString:@"iOS"];

      if (v27)
      {
        v28 = [v20 operatingSystemVersion];
        [v28 floatValue];
        BOOL v25 = v29 < 17.0;

LABEL_29:
        if (v25) {
          goto LABEL_12;
        }
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
        int v14 = 1;
        if (!v17) {
          goto LABEL_13;
        }
        goto LABEL_22;
      }
    }
    v23 = [v20 operatingSystemVersion];
    [v23 floatValue];
    BOOL v25 = v24 < 14.0;

    goto LABEL_29;
  }
  return 200;
}

uint64_t __56__EMSMIMEUtilities__messageSecurityLevelViaOtherDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

+ (BOOL)_isICloudAddress:(id)a3
{
  id v3 = a3;
  v4 = [v3 lowercaseString];

  BOOL v5 = ([v4 hasSuffix:@"@icloud.com"] & 1) != 0
    || ([v4 hasSuffix:@"@mac.com"] & 1) != 0
    || [v4 hasSuffix:@"@me.com"];

  return v5;
}

+ (unint64_t)_encryptionLevelForSender:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    && +[EMInternalPreferences preferenceEnabled:29])
  {
    if (v4 && [a1 _isICloudAddress:v4]) {
      unint64_t v5 = [a1 _messageSecurityLevelViaOtherDevices];
    }
    else {
      unint64_t v5 = 200;
    }
  }
  else
  {
    unint64_t v5 = 100;
  }

  return v5;
}

+ (unint64_t)encryptionLevelForSender:(id)a3 forAdvertisement:(BOOL)a4 useGCM:(BOOL *)a5 encryptSubject:(BOOL *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = [a1 _encryptionLevelForSender:a3];
  unint64_t v10 = v9;
  if (a5)
  {
    if (v9 == 200)
    {
      BOOL v11 = 1;
    }
    else
    {
      if (v8) {
        uint64_t v12 = 32;
      }
      else {
        uint64_t v12 = 34;
      }
      BOOL v11 = +[EMInternalPreferences preferenceEnabled:v12];
    }
    *a5 = v11;
  }
  if (a6)
  {
    if (v10 == 200)
    {
      BOOL v13 = 1;
    }
    else
    {
      if (v8) {
        uint64_t v14 = 33;
      }
      else {
        uint64_t v14 = 35;
      }
      BOOL v13 = +[EMInternalPreferences preferenceEnabled:v14];
    }
    *a6 = v13;
  }
  return v10;
}

@end
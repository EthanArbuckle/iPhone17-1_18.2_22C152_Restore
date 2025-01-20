@interface MDMMCInterface
+ (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5;
+ (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5;
+ (BOOL)isAutomaticDateAndTimeForced;
+ (BOOL)isAwaitingDeviceConfigured;
+ (BOOL)isDiagnosticsSubmissionRestricted;
+ (BOOL)isEnterpriseBookBackupAllowed;
+ (BOOL)isLimitedAppsMode;
+ (BOOL)isPasscodeSet;
+ (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4;
+ (BOOL)isProvisioningProfileWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4;
+ (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5;
+ (id)cloudConfigurationDetails;
+ (id)filterMDMRestrictions:(id)a3 acceptingKeysFromDictionary:(id)a4;
+ (id)ipcuProfileList;
+ (id)ipcuRemoveProfileWithIdentifier:(id)a3;
+ (id)managedAppIDs;
+ (id)mdmProfileIdentifier;
+ (id)mdmQueryableRestrictions;
+ (id)profileIdentifierForProfileData:(id)a3 allowEmptyPayload:(BOOL)a4 outIsSupervisionProfile:(BOOL *)a5 outProfileSigner:(__SecCertificate *)a6 outMayInstallCloudProfile:(BOOL *)a7 outError:(id *)a8;
+ (id)profileIdentifiersWithFilterFlags:(int)a3;
+ (id)profileListWithFilterFlags:(int)a3;
+ (id)provisioningProfileUUIDsWithManagedOnly:(BOOL)a3;
+ (int)_mcFilterFlagsForMDMFlags:(int)a3;
+ (void)enrollProvisionallyWithNonce:(id)a3 completion:(id)a4;
+ (void)flush;
+ (void)installStoredProfileDataWithCompletion:(id)a3;
+ (void)profiledCheckIn;
+ (void)retrieveCloudConfigurationDetailsCompletion:(id)a3;
+ (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completion:(id)a7;
+ (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4;
+ (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4;
+ (void)storeProfileData:(id)a3 completion:(id)a4;
+ (void)storedProfileDataWithCompletion:(id)a3;
@end

@implementation MDMMCInterface

+ (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

+ (BOOL)isLimitedAppsMode
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isEffectivelyInAppAllowListMode];

  return v3;
}

+ (BOOL)isAwaitingDeviceConfigured
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isAwaitingDeviceConfigured];

  return v3;
}

+ (id)managedAppIDs
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 managedAppIDs];

  return v3;
}

+ (void)profiledCheckIn
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 checkIn];
}

+ (void)flush
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 flush];
}

+ (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5
{
  v7 = (void *)MEMORY[0x263F53C50];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 sharedConnection];
  LOBYTE(a5) = [v10 clearPasscodeWithEscrowKeybagData:v9 secret:v8 outError:a5];

  return (char)a5;
}

+ (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 storeCertificateData:v7 forHostIdentifier:v6];
}

+ (id)mdmQueryableRestrictions
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v3 = [v2 pathForResource:@"MDMQueryableRestrictionKeys" ofType:@"plist"];

  v4 = [NSDictionary dictionaryWithContentsOfFile:v3];

  return v4;
}

+ (id)filterMDMRestrictions:(id)a3 acceptingKeysFromDictionary:(id)a4
{
  v4 = [MEMORY[0x263F53C70] filterRestrictionDictionary:a3 acceptedKeysDict:a4];
  v5 = (void *)[v4 mutableCopy];

  [v5 MCFixUpRestrictionsDictionaryForMDMReporting];
  return v5;
}

+ (BOOL)isAutomaticDateAndTimeForced
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F537A8]];

  return v3;
}

+ (BOOL)isDiagnosticsSubmissionRestricted
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53878]];

  return v3;
}

+ (BOOL)isEnterpriseBookBackupAllowed
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isEnterpriseBookBackupAllowed];

  return v3;
}

+ (id)profileIdentifierForProfileData:(id)a3 allowEmptyPayload:(BOOL)a4 outIsSupervisionProfile:(BOOL *)a5 outProfileSigner:(__SecCertificate *)a6 outMayInstallCloudProfile:(BOOL *)a7 outError:(id *)a8
{
  v19[1] = *MEMORY[0x263EF8340];
  v12 = [MEMORY[0x263F53C48] profileWithData:a3 fileName:0 allowEmptyPayload:a4 outError:a8];
  v13 = v12;
  if (v12)
  {
    if (a5) {
      *a5 = [v12 isSupervisionProfile];
    }
    if (a7)
    {
      uint64_t v18 = *MEMORY[0x263F53D88];
      v19[0] = MEMORY[0x263EFFA88];
      v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a7 = [v13 mayInstallWithOptions:v14 hasInteractionClient:0 outError:a8];
    }
    uint64_t v15 = [v13 signerCertificate];
    if (a6 && v15) {
      *a6 = (__SecCertificate *)CFRetain((CFTypeRef)[v13 signerCertificate]);
    }
    v16 = [v13 identifier];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)mdmProfileIdentifier
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 installedMDMProfileIdentifier];

  return v3;
}

+ (id)profileIdentifiersWithFilterFlags:(int)a3
{
  uint64_t v3 = [a1 _mcFilterFlagsForMDMFlags:*(void *)&a3];
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  v5 = [v4 installedProfileIdentifiersWithFilterFlags:v3];

  return v5;
}

+ (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  char v9 = [v8 isProfileWithIdentifier:v7 managedByProfileWithIdentifier:v6];

  return v9;
}

+ (id)profileListWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v53 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F53C50] sharedConnection];
  id v6 = objc_msgSend(v5, "installedProfilesWithFilterFlags:", objc_msgSend(a1, "_mcFilterFlagsForMDMFlags:", v3));

  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v46 = *(void *)v49;
    uint64_t v45 = *MEMORY[0x263F52E30];
    uint64_t v44 = *MEMORY[0x263F52DC8];
    uint64_t v43 = *MEMORY[0x263F52E38];
    uint64_t v42 = *MEMORY[0x263F52DB8];
    uint64_t v41 = *MEMORY[0x263F52E08];
    uint64_t v40 = *MEMORY[0x263F52DB0];
    uint64_t v39 = *MEMORY[0x263F52E18];
    uint64_t v38 = *MEMORY[0x263F52DC0];
    uint64_t v37 = *MEMORY[0x263F52DD8];
    uint64_t v9 = *MEMORY[0x263F52DE0];
    uint64_t v10 = *MEMORY[0x263F53DB8];
    uint64_t v33 = *MEMORY[0x263F38BF0];
    uint64_t v32 = *MEMORY[0x263F52E28];
    uint64_t v36 = *MEMORY[0x263F52E20];
    uint64_t v35 = *MEMORY[0x263F52E10];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v13 = objc_opt_new();
        v14 = [v12 UUID];
        [v13 setObject:v14 forKeyedSubscript:v45];

        uint64_t v15 = [v12 identifier];
        [v13 setObject:v15 forKeyedSubscript:v44];

        v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "version"));
        [v13 setObject:v16 forKeyedSubscript:v43];

        v17 = [v12 displayName];
        [v13 setObject:v17 forKeyedSubscript:v42];

        uint64_t v18 = [v12 organization];
        [v13 setObject:v18 forKeyedSubscript:v41];

        v19 = [v12 profileDescription];
        [v13 setObject:v19 forKeyedSubscript:v40];

        v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isLocked"));
        [v13 setObject:v20 forKeyedSubscript:v39];

        v21 = NSNumber;
        v22 = [v12 removalPasscode];
        v23 = [v21 numberWithBool:v22 != 0];
        [v13 setObject:v23 forKeyedSubscript:v38];

        v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isEncrypted"));
        [v13 setObject:v24 forKeyedSubscript:v37];

        v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isManagedByMDM"));
        [v13 setObject:v25 forKeyedSubscript:v9];

        v26 = [v12 installOptions];
        v27 = [v26 objectForKeyedSubscript:v10];
        int v28 = [v27 BOOLValue];

        if (v28) {
          [v13 setObject:v33 forKeyedSubscript:v32];
        }
        v29 = objc_msgSend(v12, "signerCertificatesData", v32, v33);
        if (v29) {
          [v13 setObject:v29 forKeyedSubscript:v36];
        }
        v30 = [v12 payloadsContentInfo];
        if (v30) {
          [v13 setObject:v30 forKeyedSubscript:v35];
        }
        [v47 addObject:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v8);
  }

  return v47;
}

+ (id)provisioningProfileUUIDsWithManagedOnly:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  v5 = [v4 listInstalledProvisioningProfileUUIDsWithManagedOnly:v3];

  return v5;
}

+ (BOOL)isProvisioningProfileWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedConnection];
  char v9 = [v8 isProvisioningProfilesWithUUID:v7 managedByProfileWithIdentifier:v6];

  return v9;
}

+ (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F53C50];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 sharedConnection];
  LOBYTE(a5) = [v10 installProvisioningProfileData:v9 managingProfileIdentifier:v8 outError:a5];

  return (char)a5;
}

+ (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F53C50];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 sharedConnection];
  LOBYTE(a5) = [v10 removeProvisioningProfileWithUUID:v9 managingProfileIdentifier:v8 outError:a5];

  return (char)a5;
}

+ (id)ipcuProfileList
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 installedProfilesWithFilterFlags:69];

  v34 = objc_opt_new();
  uint64_t v33 = objc_opt_new();
  uint64_t v32 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v31 = *(void *)v36;
    uint64_t v30 = *MEMORY[0x263F52DD0];
    uint64_t v29 = *MEMORY[0x263F52DA8];
    uint64_t v28 = *MEMORY[0x263F52E30];
    uint64_t v27 = *MEMORY[0x263F52DB8];
    uint64_t v26 = *MEMORY[0x263F52E08];
    uint64_t v25 = *MEMORY[0x263F52DB0];
    uint64_t v6 = *MEMORY[0x263F52E38];
    uint64_t v7 = *MEMORY[0x263F52E18];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        v11 = objc_opt_new();
        v12 = objc_opt_new();
        [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v30];
        v13 = [v9 displayName];
        [v11 setObject:v13 forKeyedSubscript:v29];

        v14 = [v9 UUID];
        [v12 setObject:v14 forKeyedSubscript:v28];

        uint64_t v15 = [v9 displayName];
        [v12 setObject:v15 forKeyedSubscript:v27];

        v16 = [v9 organization];
        [v12 setObject:v16 forKeyedSubscript:v26];

        v17 = [v9 profileDescription];
        [v12 setObject:v17 forKeyedSubscript:v25];

        uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "version"));
        [v12 setObject:v18 forKeyedSubscript:v6];

        v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isLocked"));
        [v12 setObject:v19 forKeyedSubscript:v7];

        [v34 setObject:v11 forKeyedSubscript:v10];
        [v32 setObject:v12 forKeyedSubscript:v10];
        [v33 addObject:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v5);
  }

  uint64_t v20 = *MEMORY[0x263F52DF0];
  v39[0] = @"Status";
  v39[1] = v20;
  v40[0] = @"Acknowledged";
  v40[1] = v34;
  uint64_t v21 = *MEMORY[0x263F52E00];
  v39[2] = *MEMORY[0x263F52DF8];
  v39[3] = v21;
  v40[2] = v32;
  v40[3] = v33;
  v22 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];

  return v22;
}

+ (id)ipcuRemoveProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  CFTypeRef cf2 = 0;
  uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = 0;
    id v5 = +[MDMMCInterface profileIdentifierForProfileData:v3 allowEmptyPayload:1 outIsSupervisionProfile:0 outProfileSigner:&cf2 outMayInstallCloudProfile:0 outError:&v23];
    id v6 = v23;
    if (v6) {
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F38AB8];
      uint64_t v15 = DMCErrorArray();
      objc_msgSend(v13, "DMCErrorWithDomain:code:descriptionArray:errorType:", v14, 4000, v15, *MEMORY[0x263F38A40], 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = 0;
      goto LABEL_18;
    }
    id v5 = v3;
  }
  uint64_t v7 = [v4 installedProfileIdentifiersWithFilterFlags:69];
  if ([v7 containsObject:v5])
  {
    id v8 = [v4 installedProfileWithIdentifier:v5];
    if ([v8 isLocked]
      && [v8 isSigned]
      && (!cf2 || (id v9 = (const void *)[v8 signerCertificate], !CFEqual(v9, cf2))))
    {
      uint64_t v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F38AB8];
      uint64_t v10 = [v8 friendlyName];
      v11 = DMCErrorArray();
      uint64_t v20 = objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 4008, v11, *MEMORY[0x263F38A40], v10, 0);
      id v6 = (id)[v20 DMCCopyAsPrimaryError];
    }
    else
    {
      uint64_t v10 = objc_opt_new();
      [v10 setType:0];
      [v10 setProfileIdentifier:v5];
      v11 = [MEMORY[0x263F39D18] systemConnection];
      id v21 = 0;
      id v12 = (id)[v11 performRequest:v10 error:&v21];
      id v6 = v21;
    }
  }
  else
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_ERROR, "iPCU tried to uninstall a profile that was not found", buf, 2u);
    }
    id v6 = 0;
  }

LABEL_18:
  if (cf2) {
    CFRelease(cf2);
  }

  return v6;
}

+ (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 storeProfileData:v7 completion:v6];
}

+ (void)storedProfileDataWithCompletion:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 storedProfileDataWithCompletion:v4];
}

+ (void)installStoredProfileDataWithCompletion:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 installStoredProfileDataWithCompletion:v4];
}

+ (id)cloudConfigurationDetails
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [v2 cloudConfigurationDetails];

  return v3;
}

+ (void)retrieveCloudConfigurationDetailsCompletion:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 retrieveCloudConfigurationDetailsCompletionBlock:v4];
}

+ (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completion:(id)a7
{
  v11 = (void *)MEMORY[0x263F53C50];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v11 sharedConnection];
  [v17 retrieveCloudConfigurationFromURL:v16 username:v15 password:v14 anchorCertificates:v13 completionBlock:v12];
}

+ (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 storeCloudConfigurationDetails:v7 completion:v6];
}

+ (void)enrollProvisionallyWithNonce:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 enrollProvisionallyWithNonce:v7 completionBlock:v6];
}

+ (int)_mcFilterFlagsForMDMFlags:(int)a3
{
  char v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3 & 0xFFFFFF80;
  if ((a3 & 0xFFFFFF80) != 0)
  {
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = v4;
      _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_FAULT, "Untranslated profile filter flags will be ignored: %llx", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 & 0x7F;
}

@end
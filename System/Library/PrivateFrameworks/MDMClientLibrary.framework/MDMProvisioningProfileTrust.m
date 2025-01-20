@interface MDMProvisioningProfileTrust
+ (BOOL)_enumerateProvisioningProfileUUIDsWithBlock:(id)a3;
+ (BOOL)_enumerateProvisioningProfilesWithBlock:(id)a3;
+ (BOOL)_isFreeSignedAppDeveloper:(void *)a3;
+ (BOOL)anyUPPExistsForManagedAppSigners;
+ (BOOL)enumerateProvisioningProfilesWithBlock:(id)a3;
+ (BOOL)isTrustedProvisioningProfileUUID:(id)a3;
+ (id)_appSignerIdentitiesFromBundleIDs:(id)a3;
+ (id)_appSignerIdentityForBundleID:(id)a3;
+ (id)_developer:(id)a3 withoutPrefix:(id)a4;
+ (id)_labelForAMFITrust:(unsigned int)a3;
+ (id)_signerIdentitiesFromProvisioningProfile:(void *)a3;
+ (id)allTrustedSignerIdentities;
+ (id)developerFromIdentity:(id)a3 hasFreePP:(BOOL)a4 hasUPP:(BOOL)a5;
+ (id)managedAppSigners;
+ (id)provisioningProfileUUIDsForSignerIdentity:(id)a3;
+ (id)signerIdentitiesFromProvisioningProfileUUID:(id)a3;
+ (void)_setAMFITrust:(unsigned int)a3 uuid:(id)a4 signer:(id)a5;
+ (void)_untrustProvisioningProfileUUID:(id)a3;
+ (void)didEnrollInMDMWithPasscode:(id)a3 duringMigration:(BOOL)a4;
+ (void)didSuperviseThroughADE;
+ (void)didSuperviseThroughConfigurator;
+ (void)didUnenrollFromMDM;
- (MDMProvisioningProfileTrust)initWithValidationQueue:(id)a3;
- (OS_dispatch_queue)misVerificationQueue;
- (id)_descriptionForMISState:(int64_t)a3;
- (void)_presentTrustAlertForDeveloper:(id)a3 restart:(BOOL)a4 completion:(id)a5;
- (void)_uiScheduleTrustForProvisioningProfileUUID:(id)a3 developer:(id)a4 completion:(id)a5;
- (void)_uiSetTrustForProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5;
- (void)_verifyProvisioningProfileUUID:(id)a3 completion:(id)a4;
- (void)setMisVerificationQueue:(id)a3;
- (void)uiTrustAndVerifyProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5;
- (void)uiVerifyProvisioningProfileUUID:(id)a3 completion:(id)a4;
- (void)updateTrustedCodeSigningIdentities:(id)a3 validateBundleIDs:(id)a4 validateManagedApps:(BOOL)a5;
@end

@implementation MDMProvisioningProfileTrust

- (MDMProvisioningProfileTrust)initWithValidationQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMProvisioningProfileTrust;
  v6 = [(MDMProvisioningProfileTrust *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_misVerificationQueue, a3);
  }

  return v7;
}

+ (id)allTrustedSignerIdentities
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MDMProvisioningProfileTrust_allTrustedSignerIdentities__block_invoke;
  v6[3] = &unk_1E6CBC758;
  v6[4] = &v7;
  v6[5] = a1;
  if ([a1 _enumerateProvisioningProfilesWithBlock:v6]) {
    v3 = (void *)v8[5];
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__MDMProvisioningProfileTrust_allTrustedSignerIdentities__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = MISProvisioningProfileGetUUID();
  if (v4 && [*(id *)(a1 + 40) isTrustedProvisioningProfileUUID:v4]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

+ (id)signerIdentitiesFromProvisioningProfileUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v5 = v4;
  v11 = v5;
  if (MISEnumerateInstalledProvisioningProfiles() || !v13[3])
  {
    v6 = (void *)MISCopyErrorStringForErrorCode();
    uint64_t v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust could not find provisioning profile for UUID %{public}@ with error: %{public}@", buf, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "_signerIdentitiesFromProvisioningProfile:", v10, 3221225472, __75__MDMProvisioningProfileTrust_signerIdentitiesFromProvisioningProfileUUID___block_invoke, &unk_1E6CBC780, v5, &v12);
    CFRelease((CFTypeRef)v13[3]);
  }

  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __75__MDMProvisioningProfileTrust_signerIdentitiesFromProvisioningProfileUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = MISProvisioningProfileGetUUID();
  int v5 = [*(id *)(a1 + 32) isEqualToString:v4];
  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }

  return v5 ^ 1u;
}

+ (id)_signerIdentitiesFromProvisioningProfile:(void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  int v5 = MISXMLProvisioningProfileGetDeveloperCertificates();
  v6 = v5;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          CFDataRef v11 = *(const __CFData **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = SecCertificateCreateWithData(0, v11);
          if (v12)
          {
            v13 = v12;
            uint64_t v14 = (__CFString *)SecCertificateCopySubjectSummary(v12);
            if (v14)
            {
              [v4 addObject:v14];
            }
            else
            {
              v16 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v24 = a3;
                __int16 v25 = 2112;
                CFDataRef v26 = v13;
                _os_log_impl(&dword_1DD340000, v16, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot construct identity for profile %{public}@ from cert: %@", buf, 0x16u);
              }
            }
            CFRelease(v13);
          }
          else
          {
            uint64_t v15 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v24 = a3;
              __int16 v25 = 2114;
              CFDataRef v26 = v11;
              _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot construct certificate for profile %{public}@ with cert data: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = a3;
      _os_log_impl(&dword_1DD340000, v17, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot get dev certs from DER-encoded profile: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (id)provisioningProfileUUIDsForSignerIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = (id)objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__MDMProvisioningProfileTrust_provisioningProfileUUIDsForSignerIdentity___block_invoke;
  v9[3] = &unk_1E6CBC7A8;
  id v5 = v4;
  id v10 = v5;
  CFDataRef v11 = &v12;
  if ([a1 _enumerateProvisioningProfilesWithBlock:v9]) {
    v6 = (void *)v13[5];
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __73__MDMProvisioningProfileTrust_provisioningProfileUUIDsForSignerIdentity___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:");
  if (result)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t UUID = MISProvisioningProfileGetUUID();
    return [v3 addObject:UUID];
  }
  return result;
}

+ (BOOL)_enumerateProvisioningProfilesWithBlock:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = MISEnumerateInstalledProvisioningProfiles();
  if (v4)
  {
    id v5 = (void *)MISCopyErrorStringForErrorCode();
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust could not enumerate provisioning profiles with error: %{public}@", buf, 0xCu);
    }
  }
  return v4 == 0;
}

uint64_t __71__MDMProvisioningProfileTrust__enumerateProvisioningProfilesWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1E01B2C10]();
  int v5 = MISProvisioningProfileProvisionsAllDevices();
  char v6 = [*(id *)(a1 + 40) _isFreeSignedAppDeveloper:a2];
  if (v5 || (v6 & 1) != 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 40), "_signerIdentitiesFromProvisioningProfile:", a2, 0);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = MISProvisioningProfileGetUUID();
    uint64_t v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v20 = v7;
      _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_INFO, "MDMProvisioningProfileTrust ignoring provisioning profile: %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

+ (BOOL)_enumerateProvisioningProfileUUIDsWithBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MDMProvisioningProfileTrust__enumerateProvisioningProfileUUIDsWithBlock___block_invoke;
  v7[3] = &unk_1E6CBC7F8;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(a1) = [a1 _enumerateProvisioningProfilesWithBlock:v7];

  return (char)a1;
}

void __75__MDMProvisioningProfileTrust__enumerateProvisioningProfileUUIDsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = MISProvisioningProfileGetUUID();
  id v7 = v6;
  if (v6 && [v6 length])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = a2;
      _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust missing UUID for profile: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (BOOL)enumerateProvisioningProfilesWithBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MDMProvisioningProfileTrust_enumerateProvisioningProfilesWithBlock___block_invoke;
  v7[3] = &unk_1E6CBC7F8;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(a1) = [a1 _enumerateProvisioningProfilesWithBlock:v7];

  return (char)a1;
}

void __70__MDMProvisioningProfileTrust_enumerateProvisioningProfilesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  char v6 = [[MDMProvisioningProfile alloc] initWithProfile:a2];
  (*(void (**)(uint64_t, MDMProvisioningProfile *, id))(v4 + 16))(v4, v6, v5);
}

+ (BOOL)anyUPPExistsForManagedAppSigners
{
  id v3 = +[MDMProvisioningProfileTrust managedAppSigners];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MDMProvisioningProfileTrust_anyUPPExistsForManagedAppSigners__block_invoke;
  v6[3] = &unk_1E6CBC7A8;
  id v4 = v3;
  id v7 = v4;
  id v8 = &v9;
  [a1 _enumerateProvisioningProfilesWithBlock:v6];
  LOBYTE(a1) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)a1;
}

uint64_t __63__MDMProvisioningProfileTrust_anyUPPExistsForManagedAppSigners__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)isTrustedProvisioningProfileUUID:(id)a3
{
  return MEMORY[0x1F4180E28](a3, a2);
}

- (void)uiTrustAndVerifyProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  id v22 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v14 = [v13 uuid];
        uint64_t v15 = [v14 length];

        if (v15)
        {
          long long v16 = [v13 uuid];
          int v17 = AMFIProfileRequiresReboot();

          if (v17)
          {
            __int16 v18 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              long long v19 = v18;
              long long v20 = [v13 uuid];
              *(_DWORD *)buf = 138543618;
              v29 = v20;
              __int16 v30 = 1026;
              int v31 = v17;
              _os_log_impl(&dword_1DD340000, v19, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to reboot check provisioning profile UUID %{public}@ with error: %{public}d", buf, 0x12u);
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  [(MDMProvisioningProfileTrust *)self _uiSetTrustForProvisioningProfiles:v8 developer:v23 completion:v22];
}

- (void)uiVerifyProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__MDMProvisioningProfileTrust_uiVerifyProvisioningProfileUUID_completion___block_invoke;
  v8[3] = &unk_1E6CBC820;
  id v9 = v6;
  id v7 = v6;
  [(MDMProvisioningProfileTrust *)self _verifyProvisioningProfileUUID:a3 completion:v8];
}

uint64_t __74__MDMProvisioningProfileTrust_uiVerifyProvisioningProfileUUID_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    DMCSendUPPVerificationOfflineNotification();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_uiSetTrustForProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__MDMProvisioningProfileTrust__uiSetTrustForProvisioningProfiles_developer_completion___block_invoke;
  v12[3] = &unk_1E6CBC848;
  long long v14 = self;
  id v15 = v9;
  id v13 = v8;
  id v10 = v8;
  id v11 = v9;
  [(MDMProvisioningProfileTrust *)self _presentTrustAlertForDeveloper:a4 restart:0 completion:v12];
}

uint64_t __87__MDMProvisioningProfileTrust__uiSetTrustForProvisioningProfiles_developer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v23;
      *(void *)&long long v5 = 138543362;
      long long v21 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "uuid", v21);
          int v11 = AMFIProfileSetTrust();

          char v12 = *(NSObject **)(DMCLogObjects() + 8);
          if (v11)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              id v13 = v12;
              long long v14 = [v9 uuid];
              *(_DWORD *)buf = 138543618;
              long long v27 = v14;
              __int16 v28 = 1026;
              int v29 = v11;
              _os_log_impl(&dword_1DD340000, v13, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to set manual trust for provisioning profile UUID %{public}@ with error: %{public}d", buf, 0x12u);
            }
            DMCSendUPPTrustFailedNotification();
          }
          else
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = v12;
              long long v16 = [v9 uuid];
              *(_DWORD *)buf = v21;
              long long v27 = v16;
              _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully set manual trust for provisioning profile UUID %{public}@", buf, 0xCu);
            }
            int v17 = *(void **)(a1 + 40);
            __int16 v18 = [v9 uuid];
            [v17 uiVerifyProvisioningProfileUUID:v18 completion:0];
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v6);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    long long v20 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v20();
  }
}

- (void)_uiScheduleTrustForProvisioningProfileUUID:(id)a3 developer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__MDMProvisioningProfileTrust__uiScheduleTrustForProvisioningProfileUUID_developer_completion___block_invoke;
  v12[3] = &unk_1E6CBC870;
  id v13 = v8;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  [(MDMProvisioningProfileTrust *)self _presentTrustAlertForDeveloper:a4 restart:1 completion:v12];
}

uint64_t __95__MDMProvisioningProfileTrust__uiScheduleTrustForProvisioningProfileUUID_developer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v3 = AMFIProfileScheduleTrust();
    uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v10 = 138543618;
        uint64_t v11 = v5;
        __int16 v12 = 1026;
        int v13 = v3;
        _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to schedule trust for provisioning profile UUID %{public}@ with error: %{public}d", (uint8_t *)&v10, 0x12u);
      }
      DMCSendUPPTrustFailedNotification();
      uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully scheduled trust for provisioning profile UUID %{public}@", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    }
    return v6();
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

- (void)_presentTrustAlertForDeveloper:(id)a3 restart:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v7;
    __int16 v24 = 1026;
    BOOL v25 = v6;
    _os_log_impl(&dword_1DD340000, v9, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust presenting trust alert for developer “%{public}@” with restart: %{public}d", buf, 0x12u);
  }
  if (v7) {
    DMCLocalizedFormat();
  }
  else {
  int v10 = DMCLocalizedString();
  }
  uint64_t v11 = @"PROVISIONING_PROFILE_TRUST_ALLOW_RESTART";
  if (!v6) {
    uint64_t v11 = @"PROVISIONING_PROFILE_TRUST_ALLOW";
  }
  __int16 v12 = (void *)MEMORY[0x1E4F5E760];
  int v13 = v11;
  uint64_t v14 = DMCLocalizedStringByDevice();
  id v15 = DMCLocalizedString();
  long long v16 = DMCLocalizedString();

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__MDMProvisioningProfileTrust__presentTrustAlertForDeveloper_restart_completion___block_invoke;
  v19[3] = &unk_1E6CBC898;
  id v20 = v7;
  id v21 = v8;
  id v17 = v7;
  id v18 = v8;
  [v12 displayAlertWithTitle:v10 message:v14 defaultButtonText:v15 altButtonText:v16 destructive:1 completion:v19];
}

uint64_t __81__MDMProvisioningProfileTrust__presentTrustAlertForDeveloper_restart_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust not allowing trust for developer: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)_untrustProvisioningProfileUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = AMFIProfileRemoveTrust();
  uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 67240192;
      LODWORD(v11) = v4;
      uint64_t v6 = "MDMProvisioningProfileTrust AMFI failed to untrust provisioning profile with error: %{public}d";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 8;
LABEL_6:
      _os_log_impl(&dword_1DD340000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v3;
    uint64_t v6 = "MDMProvisioningProfileTrust AMFI succesfully untrusted provisioning profile: %{public}@";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)_verifyProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust verifying provisioning profile UUID %{public}@...", buf, 0xCu);
  }
  int v10 = v5;
  id v8 = v6;
  id v9 = v5;
  MISValidateUPP();
}

uint64_t __73__MDMProvisioningProfileTrust__verifyProvisioningProfileUUID_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2050;
      id v17 = a3;
      _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to verify provisioning profile %{public}@ with error %{public}lld", (uint8_t *)&v14, 0x16u);
    }
    uint64_t result = a1[6];
    if (result)
    {
      id v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      int v10 = (void *)a1[5];
      id v12 = v6;
      uint64_t v13 = [v10 _descriptionForMISState:a2];
      int v14 = 138543874;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v13;
      __int16 v18 = 2050;
      uint64_t v19 = a2;
      _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully verified provisioning profile %{public}@ as %{public}@ (%{public}ld)", (uint8_t *)&v14, 0x20u);
    }
    uint64_t result = a1[6];
    if (result)
    {
      id v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

+ (void)didEnrollInMDMWithPasscode:(id)a3 duringMigration:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  if (a4)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v7 = (void *)getLAContextClass_softClass;
    uint64_t v24 = getLAContextClass_softClass;
    if (!getLAContextClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v26 = __getLAContextClass_block_invoke;
      long long v27 = &unk_1E6CBC960;
      __int16 v28 = &v21;
      __getLAContextClass_block_invoke((uint64_t)&buf);
      uint64_t v7 = (void *)v22[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v21, 8);
    id v6 = objc_opt_new();
    if (v5) {
      id v9 = v5;
    }
    else {
      id v9 = &stru_1F38828A0;
    }
    int v10 = [(__CFString *)v9 dataUsingEncoding:4];
    id v20 = 0;
    char v11 = [v6 setCredential:v10 type:-1 error:&v20];
    id v12 = v20;
    if ((v11 & 1) == 0)
    {
      uint64_t v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1DD340000, v13, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust AMFI failed to set context credential with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  int v14 = AMFIMDMModeEnroll();
  uint64_t v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67240192;
      DWORD1(buf) = v14;
      __int16 v16 = "MDMProvisioningProfileTrust AMFI failed to enroll in MDM with error: %{public}d";
      id v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 8;
LABEL_17:
      _os_log_impl(&dword_1DD340000, v17, v18, v16, (uint8_t *)&buf, v19);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    __int16 v16 = "MDMProvisioningProfileTrust AMFI successfully enrolled in MDM";
    id v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 2;
    goto LABEL_17;
  }
}

+ (void)didUnenrollFromMDM
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = AMFIMDMModeRemove();
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67240192;
      int v13 = v2;
      int v4 = "MDMProvisioningProfileTrust AMFI failed to unenroll from MDM with error: %{public}d";
      id v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      uint32_t v7 = 8;
LABEL_6:
      _os_log_impl(&dword_1DD340000, v5, v6, v4, buf, v7);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    int v4 = "MDMProvisioningProfileTrust AMFI successfully unenrolled from MDM";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
  id v8 = +[MDMProvisioningProfileTrust managedAppSigners];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MDMProvisioningProfileTrust_didUnenrollFromMDM__block_invoke;
  v10[3] = &unk_1E6CBC8E8;
  id v11 = v8;
  id v9 = v8;
  +[MDMProvisioningProfileTrust _enumerateProvisioningProfileUUIDsWithBlock:v10];
}

void __49__MDMProvisioningProfileTrust_didUnenrollFromMDM__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:a3]) {
    +[MDMProvisioningProfileTrust _untrustProvisioningProfileUUID:v5];
  }
}

+ (void)didSuperviseThroughADE
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = AMFISupervisedModeSetState();
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    v8[0] = 67240192;
    v8[1] = v2;
    int v4 = "MDMProvisioningProfileTrust AMFI failed to supervise through ADE with error: %{public}d";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_ERROR;
    uint32_t v7 = 8;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v8[0]) = 0;
    int v4 = "MDMProvisioningProfileTrust AMFI successfully supervised through ADE";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    uint32_t v7 = 2;
  }
  _os_log_impl(&dword_1DD340000, v5, v6, v4, (uint8_t *)v8, v7);
}

+ (void)didSuperviseThroughConfigurator
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = AMFISupervisedModeSetState();
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    v8[0] = 67240192;
    v8[1] = v2;
    int v4 = "MDMProvisioningProfileTrust AMFI failed to supervise through Configurator with error: %{public}d";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_ERROR;
    uint32_t v7 = 8;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v8[0]) = 0;
    int v4 = "MDMProvisioningProfileTrust AMFI successfully supervised through Configurator";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    uint32_t v7 = 2;
  }
  _os_log_impl(&dword_1DD340000, v5, v6, v4, (uint8_t *)v8, v7);
}

- (void)updateTrustedCodeSigningIdentities:(id)a3 validateBundleIDs:(id)a4 validateManagedApps:(BOOL)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v7 = a4;
  id v8 = +[MDMProvisioningProfileTrust managedAppSigners];
  id v66 = v7;
  if (v7)
  {
    v63 = +[MDMProvisioningProfileTrust _appSignerIdentitiesFromBundleIDs:v7];
  }
  else
  {
    v63 = 0;
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v101 = MEMORY[0x1E4F143A8];
  uint64_t v102 = 3221225472;
  v103 = __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke;
  v104 = &unk_1E6CBC910;
  id v70 = v9;
  id v105 = v70;
  MISEnumerateTrustedUPPs();
  int v10 = objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  int v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke_2;
  v91[3] = &unk_1E6CBC938;
  id v15 = v8;
  id v92 = v15;
  id v16 = v10;
  id v93 = v16;
  BOOL v100 = a5;
  id v65 = v12;
  id v94 = v65;
  id v17 = v67;
  id v95 = v17;
  id v69 = v11;
  id v96 = v69;
  id v64 = v63;
  id v97 = v64;
  id v18 = v13;
  id v98 = v18;
  id v19 = v14;
  id v99 = v19;
  if (+[MDMProvisioningProfileTrust _enumerateProvisioningProfileUUIDsWithBlock:v91])
  {
    v59 = v18;
    id v60 = v16;
    id v61 = v17;
    id v62 = v15;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v20 = v16;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v87 objects:v114 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v88 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v87 + 1) + 8 * i);
          [v70 removeObject:v25];
          [v69 removeObject:v25];
          uint64_t v26 = [v19 objectForKeyedSubscript:v25];
          +[MDMProvisioningProfileTrust _setAMFITrust:2 uuid:v25 signer:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v87 objects:v114 count:16];
      }
      while (v22);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v27 = v69;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v83 objects:v113 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v84 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v83 + 1) + 8 * j);
          [v70 removeObject:v32];
          uint64_t v33 = [v19 objectForKeyedSubscript:v32];
          +[MDMProvisioningProfileTrust _setAMFITrust:1 uuid:v32 signer:v33];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v83 objects:v113 count:16];
      }
      while (v29);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v34 = v70;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v112 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v80 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v79 + 1) + 8 * k);
          v40 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v109 = v39;
            _os_log_impl(&dword_1DD340000, v40, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust removing trust for orphaned profile UUID: %{public}@", buf, 0xCu);
          }
          +[MDMProvisioningProfileTrust _untrustProvisioningProfileUUID:v39];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v79 objects:v112 count:16];
      }
      while (v36);
    }

    v41 = *(NSObject **)(DMCLogObjects() + 8);
    v42 = v65;
    id v18 = v59;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v41;
      uint64_t v44 = [v65 count];
      uint64_t v45 = [v59 count];
      *(_DWORD *)long long buf = 134349312;
      uint64_t v109 = v44;
      __int16 v110 = 2050;
      uint64_t v111 = v45;
      _os_log_impl(&dword_1DD340000, v43, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust will verify %{public}lu managed profiles and %{public}lu other profiles", buf, 0x16u);
    }
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v46 = v65;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v107 count:16];
    v48 = v60;
    if (v47)
    {
      uint64_t v49 = v47;
      uint64_t v50 = *(void *)v76;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v76 != v50) {
            objc_enumerationMutation(v46);
          }
          [(MDMProvisioningProfileTrust *)self _verifyProvisioningProfileUUID:*(void *)(*((void *)&v75 + 1) + 8 * m) completion:0];
        }
        uint64_t v49 = [v46 countByEnumeratingWithState:&v75 objects:v107 count:16];
      }
      while (v49);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v52 = v59;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v71 objects:v106 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v72;
      do
      {
        for (uint64_t n = 0; n != v54; ++n)
        {
          if (*(void *)v72 != v55) {
            objc_enumerationMutation(v52);
          }
          [(MDMProvisioningProfileTrust *)self _verifyProvisioningProfileUUID:*(void *)(*((void *)&v71 + 1) + 8 * n) completion:0];
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v71 objects:v106 count:16];
      }
      while (v54);
    }

    v57 = v66;
    id v17 = v61;
    id v15 = v62;
  }
  else
  {
    v58 = *(NSObject **)(DMCLogObjects() + 8);
    v48 = v16;
    v42 = v65;
    v57 = v66;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD340000, v58, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust skipping UPP sync because MIS enumeration failed", buf, 2u);
    }
  }
}

uint64_t __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    [*(id *)(a1 + 40) addObject:v7];
    if (!*(unsigned char *)(a1 + 96)) {
      goto LABEL_7;
    }
    os_log_type_t v6 = (id *)(a1 + 48);
  }
  else
  {
    if (![*(id *)(a1 + 56) containsObject:v5]) {
      goto LABEL_7;
    }
    os_log_type_t v6 = (id *)(a1 + 64);
  }
  [*v6 addObject:v7];
LABEL_7:
  if ([*(id *)(a1 + 72) containsObject:v5]) {
    [*(id *)(a1 + 80) addObject:v7];
  }
  [*(id *)(a1 + 88) setObject:v5 forKeyedSubscript:v7];
}

+ (void)_setAMFITrust:(unsigned int)a3 uuid:(id)a4 signer:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = AMFIProfileSetTrust();
  id v11 = [a1 _labelForAMFITrust:v6];
  id v12 = *(NSObject **)(DMCLogObjects() + 8);
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138544130;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 1026;
      int v24 = v10;
      int v13 = "MDMProvisioningProfileTrust AMFI failed to set %{public}@ trust for signer: '%{public}@' (%{public}@) with e"
            "rror: %{public}d";
      uint64_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 38;
LABEL_6:
      _os_log_impl(&dword_1DD340000, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543874;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v8;
    int v13 = "MDMProvisioningProfileTrust AMFI successfully set %{public}@ trust for signer: '%{public}@' (%{public}@)";
    uint64_t v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 32;
    goto LABEL_6;
  }
}

+ (id)_labelForAMFITrust:(unsigned int)a3
{
  id v3 = @"Invalid";
  if (a3 == 1) {
    id v3 = @"Manual";
  }
  if (a3 == 2) {
    return @"MDM";
  }
  else {
    return v3;
  }
}

+ (BOOL)_isFreeSignedAppDeveloper:(void *)a3
{
  CFBooleanRef Value = (const __CFBoolean *)MISProfileGetValue();
  if (Value)
  {
    CFBooleanRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    LOBYTE(Value) = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  }
  return (char)Value;
}

- (id)_descriptionForMISState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"unknown";
  }
  else {
    return off_1E6CBC9B8[a3];
  }
}

+ (id)managedAppSigners
{
  int v2 = +[MDMManagedMediaReader managedAppIDs];
  id v3 = +[MDMProvisioningProfileTrust _appSignerIdentitiesFromBundleIDs:v2];

  return v3;
}

+ (id)_appSignerIdentitiesFromBundleIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFBooleanRef v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1E01B2C10](v6);
        id v12 = +[MDMProvisioningProfileTrust _appSignerIdentityForBundleID:](MDMProvisioningProfileTrust, "_appSignerIdentityForBundleID:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

+ (id)_appSignerIdentityForBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v10 = 0;
  CFBooleanRef v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
  id v5 = v10;
  if (v4)
  {
    uint64_t v6 = [v4 signerIdentity];
    if (!v6)
    {
      uint64_t v7 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v12 = v3;
        _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_ERROR, "MDMProvisoningProfileTrust could not find signer identity of managed app '%{public}@'", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_ERROR, "MDMProvisoningProfileTrust could not find record of managed app '%{public}@' with error: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)developerFromIdentity:(id)a3 hasFreePP:(BOOL)a4 hasUPP:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v8 = [a1 _developer:a3 withoutPrefix:@"iPhone Distribution: "];
  uint64_t v9 = [a1 _developer:v8 withoutPrefix:@"iPhone Developer: "];

  id v10 = [a1 _developer:v9 withoutPrefix:@"Apple Development: "];

  if (v6 && !a5)
  {
    uint64_t v11 = objc_msgSend(v10, "rangeOfString:", @" (");
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = [v10 substringToIndex:v11];

      id v10 = (void *)v12;
    }
  }

  return v10;
}

+ (id)_developer:(id)a3 withoutPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:v6]
    && (unint64_t v7 = [v5 length], v7 > objc_msgSend(v6, "length")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  uint64_t v9 = v8;

  return v9;
}

- (OS_dispatch_queue)misVerificationQueue
{
  return self->_misVerificationQueue;
}

- (void)setMisVerificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
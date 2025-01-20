@interface MCProfile
+ (BOOL)checkString:(id)a3 isOneOfStrings:(id)a4 key:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7 errorString:(id)a8 outError:(id *)a9;
+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6;
+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 outError:(id *)a5;
+ (MCProfile)profileWithData:(id)a3 options:(id)a4 fileName:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7;
+ (MCProfile)profileWithData:(id)a3 options:(id)a4 outError:(id *)a5;
+ (MCProfile)profileWithData:(id)a3 outError:(id *)a4;
+ (MCProfile)profileWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 fileName:(id)a6 allowEmptyPayload:(BOOL)a7 outError:(id *)a8;
+ (id)_malformedProfileError;
+ (id)_unsupportedEnrollmentServiceProfileError;
+ (id)_unsupportedProfileTypeError;
+ (id)badFieldTypeErrorWithField:(id)a3;
+ (id)dataFromCMSEncodedData:(id)a3 outSignerCertificates:(id *)a4;
+ (id)missingFieldErrorWithField:(id)a3;
+ (id)newProfileSignatureVersion;
+ (id)profileDictionaryFromProfileData:(id)a3 outSignerCerts:(id *)a4 outError:(id *)a5;
+ (id)removeOptionalNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8;
+ (id)removeOptionalObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9;
+ (id)removeRequiredNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10;
+ (id)removeRequiredObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 missingDataCode:(int64_t)a7 missingDataErrorString:(id)a8 invalidDataCode:(int64_t)a9 invalidDataErrorString:(id)a10 outError:(id *)a11;
+ (id)signerSummaryOfCertificate:(__SecCertificate *)a3;
+ (id)stringForDeviceType:(unint64_t)a3;
+ (int)evaluateTrust:(__SecTrust *)a3;
+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4;
+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6;
+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6 outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(BOOL *)a7;
+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToWriteDefaults:(BOOL *)a5;
+ (unint64_t)thisDeviceType;
- (BOOL)containsAnyPayloadOfClasses:(id)a3;
- (BOOL)containsOnlyPayloadsOfClasses:(id)a3;
- (BOOL)containsPayloadOfClass:(Class)a3;
- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3;
- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3 useOriginalCheck:(BOOL)a4;
- (BOOL)isEncrypted;
- (BOOL)isInstalledForSystem;
- (BOOL)isInstalledForUser;
- (BOOL)isLocked;
- (BOOL)isManagedByMDM;
- (BOOL)isManagedByProfileService;
- (BOOL)isProfileUIInstallationEffectivelyAllowed;
- (BOOL)isSigned;
- (BOOL)isStub;
- (BOOL)isSupervisionProfile;
- (BOOL)isUserEnrollmentProfile;
- (BOOL)mayInstallWithOptions:(id)a3 hasInteractionClient:(BOOL)a4 outError:(id *)a5;
- (BOOL)mustInstallNonInteractively;
- (BOOL)needsReboot;
- (BOOL)shouldHaveFullSSLTrust;
- (BOOL)writeStubToDirectory:(id)a3;
- (BOOL)writeStubToPath:(id)a3;
- (MCProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6;
- (NSArray)installationWarnings;
- (NSArray)localizedManagedPayloadSummaryByType;
- (NSArray)localizedPayloadSummaryByType;
- (NSArray)managedPayloads;
- (NSArray)payloads;
- (NSArray)payloadsContentInfo;
- (NSArray)signerCertificates;
- (NSArray)signerCertificatesData;
- (NSDate)earliestCertificateExpiryDate;
- (NSDate)expiryDate;
- (NSDate)installDate;
- (NSDate)removalDate;
- (NSDate)unmodifiedExpiryDate;
- (NSDictionary)installOptions;
- (NSDictionary)localizedManagedProfileConsentTexts;
- (NSString)UUID;
- (NSString)displayName;
- (NSString)friendlyName;
- (NSString)identifier;
- (NSString)localizedConsentText;
- (NSString)managingProfileIdentifier;
- (NSString)organization;
- (NSString)productBuildVersion;
- (NSString)productVersion;
- (NSString)profileDataFileName;
- (NSString)profileDescription;
- (NSString)profileIDHashFileName;
- (NSString)removalPasscode;
- (NSString)signerSummary;
- (NSString)stubFileName;
- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3;
- (__SecCertificate)copyCertificateWithPersistentID:(id)a3;
- (__SecCertificate)signerCertificate;
- (id)appAccessibilityParameters;
- (id)description;
- (id)hasRequiredAppIDForMDM;
- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3;
- (id)loggingID;
- (id)malformedProfileErrorWithError:(id)a3;
- (id)payloadWithUUID:(id)a3;
- (id)payloadsOfKindOfClass:(Class)a3;
- (id)payloadsWithClass:(Class)a3;
- (id)restrictionsWithHeuristicsAppliedOutError:(id *)a3;
- (id)serializedDictionary;
- (id)signatureVersion;
- (id)stubDictionary;
- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3;
- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3;
- (id)verboseDescription;
- (int)trustLevel;
- (int64_t)installType;
- (int64_t)version;
- (unint64_t)countOfPayloadsOfClass:(Class)a3;
- (unint64_t)targetDeviceType;
- (void)evaluateSignerTrust;
- (void)evaluateSignerTrustAsynchronouslyWithCompletion:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEncrypted:(BOOL)a3;
- (void)setInstallDate:(id)a3;
- (void)setInstallOptions:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMustInstallNonInteractively:(BOOL)a3;
- (void)setRemovalPasscode:(id)a3;
- (void)setSignerCertificates:(id)a3;
@end

@implementation MCProfile

- (BOOL)isUserEnrollmentProfile
{
  v2 = [(MCProfile *)self payloadsWithClass:objc_opt_class()];
  v3 = [v2 firstObject];

  if (v3) {
    char v4 = [v3 isUserEnrollment];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSString)removalPasscode
{
  return self->_removalPasscode;
}

- (void)setRemovalPasscode:(id)a3
{
  v5 = (NSString *)a3;
  removalPasscode = self->_removalPasscode;
  p_removalPasscode = &self->_removalPasscode;
  if (removalPasscode != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_removalPasscode, a3);
    v5 = v8;
  }
}

- (id)hasRequiredAppIDForMDM
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MCProfile *)self payloads];
  v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          v8 = [v7 requiredAppIDForMDM];

          if (v8)
          {
            v3 = [v7 requiredAppIDForMDM];

            goto LABEL_13;
          }
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (int)trustLevel
{
  trustEvaluationQueue = self->_trustEvaluationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MCProfile_trustLevel__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(trustEvaluationQueue, block);
  return self->_trustQueueTrustLevel;
}

void __23__MCProfile_trustLevel__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[12])
  {
    v3 = [v2 signerCertificates];
    uint64_t v4 = [*(id *)(a1 + 32) signatureVersion];
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = +[MCProfile evaluateTrustOfCertificateChain:v3 signatureVersion:v4];

    *(unsigned char *)(*(void *)(a1 + 32) + 12) = 1;
  }
}

- (__SecCertificate)signerCertificate
{
  v2 = [(MCProfile *)self signerCertificates];
  if ([v2 count]) {
    v3 = (__SecCertificate *)[v2 firstObject];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSArray)signerCertificates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13;
  long long v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MCProfile_signerCertificates__block_invoke;
  v5[3] = &unk_1E5A65D90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(signerEvaluationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__MCProfile_signerCertificates__block_invoke(uint64_t a1)
{
}

- (NSArray)signerCertificatesData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  id v22 = 0;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MCProfile_signerCertificatesData__block_invoke;
  block[3] = &unk_1E5A65D90;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync(signerEvaluationQueue, block);
  uint64_t v3 = [(id)v18[5] count];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)v18[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t Length = SecCertificateGetLength();
          long long v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", SecCertificateGetBytePtr(), Length, v12);
          [v4 addObject:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return (NSArray *)v4;
}

uint64_t __35__MCProfile_signerCertificatesData__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSString)signerSummary
{
  v2 = [(MCProfile *)self signerCertificates];
  if ([v2 count])
  {
    uint64_t v3 = +[MCProfile signerSummaryOfCertificate:](MCProfile, "signerSummaryOfCertificate:", [v2 firstObject]);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setSignerCertificates:(id)a3
{
  id v4 = a3;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MCProfile_setSignerCertificates___block_invoke;
  v7[3] = &unk_1E5A65E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(signerEvaluationQueue, v7);
}

void __35__MCProfile_setSignerCertificates___block_invoke(uint64_t a1)
{
}

- (NSArray)installationWarnings
{
  return (NSArray *)[(MCProfile *)self installationWarningsIncludeUnsignedProfileWarning:1];
}

- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3 && [(MCProfile *)self trustLevel] != 2)
  {
    if ([(MCProfile *)self isSigned])
    {
      id v6 = MCLocalizedString(@"INSTALL_WARNING_NOT_VERIFIED_TITLE");
      uint64_t v7 = [(MCProfile *)self friendlyName];
      long long v15 = MCLocalizedFormat(@"INSTALL_WARNING_NOT_VERIFIED_P_TITLE", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
      v16 = +[MCProfileWarning warningWithLocalizedTitle:v6 localizedBody:v15 isLongForm:0];
      [v5 addObject:v16];
    }
    else
    {
      id v6 = MCLocalizedString(@"INSTALL_WARNING_NOT_SIGNED_TITLE");
      uint64_t v7 = MCLocalizedString(@"INSTALL_WARNING_NOT_SIGNED");
      long long v15 = +[MCProfileWarning warningWithLocalizedTitle:v6 localizedBody:v7 isLongForm:0];
      [v5 addObject:v15];
    }
  }
  if ([(MCProfile *)self isLocked])
  {
    uint64_t v17 = [(MCProfile *)self removalPasscode];
    uint64_t v18 = [v17 length];

    uint64_t v19 = MCLocalizedString(@"INSTALL_WARNING_NOT_REMOVABLE_TITLE");
    if (v18) {
      v20 = @"INSTALL_WARNING_NOT_REMOVABLE_AUTH";
    }
    else {
      v20 = @"INSTALL_WARNING_NOT_REMOVABLE";
    }
    v21 = MCLocalizedString(v20);
    id v22 = +[MCProfileWarning warningWithLocalizedTitle:v19 localizedBody:v21 isLongForm:0];
    [v5 addObject:v22];
  }
  return v5;
}

- (BOOL)mustInstallNonInteractively
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_mustInstallNonInteractively)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    BOOL v3 = [(MCProfile *)self payloads];
    uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v4 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v7 + 1) + 8 * i) mustInstallNonInteractively])
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v2;
}

+ (MCProfile)profileWithData:(id)a3 outError:(id *)a4
{
  return (MCProfile *)[a1 profileWithData:a3 options:0 fileName:0 allowEmptyPayload:0 outError:a4];
}

+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 outError:(id *)a5
{
  return (MCProfile *)[a1 profileWithData:a3 options:0 fileName:a4 allowEmptyPayload:0 outError:a5];
}

+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  return (MCProfile *)[a1 profileWithData:a3 options:0 fileName:a4 allowEmptyPayload:a5 outError:a6];
}

- (NSArray)payloads
{
  return 0;
}

- (NSArray)payloadsContentInfo
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(MCProfile *)self isEncrypted])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [(MCProfile *)self payloads];
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(obj);
          }
          long long v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v10 = objc_opt_new();
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "version"));
          [v10 setObject:v11 forKeyedSubscript:@"PayloadVersion"];

          uint64_t v12 = [v9 type];

          if (v12)
          {
            uint64_t v13 = [v9 type];
            [v10 setObject:v13 forKeyedSubscript:@"PayloadType"];
          }
          uint64_t v14 = [v9 identifier];

          if (v14)
          {
            long long v15 = [v9 identifier];
            [v10 setObject:v15 forKeyedSubscript:@"PayloadIdentifier"];
          }
          v16 = [v9 UUID];

          if (v16)
          {
            uint64_t v17 = [v9 UUID];
            [v10 setObject:v17 forKeyedSubscript:@"PayloadUUID"];
          }
          uint64_t v18 = [v9 displayName];

          if (v18)
          {
            uint64_t v19 = [v9 displayName];
            [v10 setObject:v19 forKeyedSubscript:@"PayloadDisplayName"];
          }
          v20 = [v9 payloadDescription];

          if (v20)
          {
            v21 = [v9 payloadDescription];
            [v10 setObject:v21 forKeyedSubscript:@"PayloadDescription"];
          }
          id v22 = [v9 organization];

          if (v22)
          {
            v23 = [v9 organization];
            [v10 setObject:v23 forKeyedSubscript:@"PayloadOrganization"];
          }
          [v3 addObject:v10];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)managedPayloads
{
  return 0;
}

- (id)payloadWithUUID:(id)a3
{
  return 0;
}

- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3
{
  return 0;
}

- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3
{
  return 0;
}

- (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  return 0;
}

- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3
{
  return 0;
}

- (BOOL)isSigned
{
  uint64_t v2 = [(MCProfile *)self signerCertificates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)installType
{
  uint64_t v2 = [(MCProfile *)self installOptions];
  BOOL v3 = [v2 objectForKey:@"installationType"];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)isInstalledForSystem
{
  return [(MCProfile *)self installType] != 2;
}

- (BOOL)isInstalledForUser
{
  return [(MCProfile *)self installType] == 2;
}

- (NSString)friendlyName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MCProfile *)self displayName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(MCProfile *)self displayName];
  }
  else
  {
    uint64_t v6 = [(MCProfile *)self identifier];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v5 = [(MCProfile *)self identifier];
    }
    else
    {
      long long v8 = [(MCProfile *)self UUID];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        uint64_t v5 = [(MCProfile *)self UUID];
      }
      else
      {
        long long v10 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = v10;
          int v14 = 138543618;
          id v15 = (id)objc_opt_class();
          __int16 v16 = 2048;
          uint64_t v17 = self;
          id v12 = v15;
          _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_ERROR, "Profile %{public}@ %p has no friendly name.", (uint8_t *)&v14, 0x16u);
        }
        uint64_t v5 = @"Profile";
      }
    }
  }
  return (NSString *)v5;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Profile %@ %p, version %d:\n", objc_opt_class(), self, self->_version];
  if ([(NSString *)self->_displayName length]) {
    [v3 appendFormat:@"Display Name: “%@”\n", self->_displayName];
  }
  if ([(NSString *)self->_profileDescription length]) {
    [v3 appendFormat:@"Description : “%@”\n", self->_profileDescription];
  }
  if ([(NSString *)self->_identifier length]) {
    [v3 appendFormat:@"Identifier  : %@\n", self->_identifier];
  }
  if ([(NSString *)self->_UUID length]) {
    [v3 appendFormat:@"UUID        : %@\n", self->_UUID];
  }
  if ([(NSString *)self->_organization length]) {
    [v3 appendFormat:@"Organization: %@\n", self->_organization];
  }
  if (self->_installDate) {
    [v3 appendFormat:@"Installed   : %@\n", self->_installDate];
  }
  if (self->_installOptions) {
    [v3 appendFormat:@"Install opts: %@\n", self->_installOptions];
  }
  uint64_t v4 = MCStringForBool(self->_isStub);
  [v3 appendFormat:@"Is Stub     : %@\n", v4];

  uint64_t v5 = MCStringForBool(self->_isLocked);
  [v3 appendFormat:@"Locked      : %@\n", v5];

  if (self->_removalPasscode) {
    [v3 appendFormat:@"Removal passcode present\n"];
  }
  uint64_t v6 = MCStringForBool(self->_encrypted);
  [v3 appendFormat:@"Encrypted   : %@\n", v6];

  objc_msgSend(v3, "appendFormat:", @"Trusted     : %d\n", -[MCProfile trustLevel](self, "trustLevel"));
  uint64_t v7 = MCStringForBool([(MCProfile *)self isSigned]);
  [v3 appendFormat:@"Signed      : %@\n", v7];

  uint64_t v8 = [(MCProfile *)self expiryDate];
  uint64_t v9 = (void *)v8;
  if (v8) {
    [v3 appendFormat:@"Expires     : %@\n", v8];
  }
  if ([(MCProfile *)self isManagedByProfileService]) {
    [v3 appendFormat:@"Profile svc : Yes\n"];
  }
  if (self->_removalDate) {
    [v3 appendFormat:@"Remove after: %@\n", self->_removalDate];
  }
  if (self->_localizedConsentText) {
    [v3 appendFormat:@"Consent text: %@\n", self->_localizedConsentText];
  }
  objc_msgSend(v3, "appendFormat:", @"Device Type : %lu\n", self->_targetDeviceType);
  if ([(MCProfile *)self mustInstallNonInteractively]) {
    [v3 appendString:@"Must be installed non-interactively.\n"];
  }
  if (self->_needsReboot) {
    [v3 appendFormat:@"Needs reboot\n"];
  }

  return v3;
}

- (id)verboseDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MCProfile *)self description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCProfile *)self signerCertificates];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [v4 appendFormat:@"Signers     : "];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [(MCProfile *)self signerCertificates];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          int v14 = (void *)MEMORY[0x1A6232D90]();
          id v15 = +[MCProfile signerSummaryOfCertificate:v13];
          if ((v11 & 1) == 0) {
            [v4 appendFormat:@"              "];
          }
          [v4 appendFormat:@"%@\n", v15];

          char v11 = 0;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        char v11 = 0;
      }
      while (v9);
    }
  }
  return v4;
}

- (id)serializedDictionary
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Class"];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_version];
  [v3 setObject:v6 forKeyedSubscript:@"Version"];

  if ([(NSString *)self->_displayName length]) {
    [v3 setObject:self->_displayName forKeyedSubscript:@"Display Name"];
  }
  if ([(NSString *)self->_profileDescription length]) {
    [v3 setObject:self->_profileDescription forKeyedSubscript:@"Description"];
  }
  if ([(NSString *)self->_identifier length]) {
    [v3 setObject:self->_identifier forKeyedSubscript:@"Identifier"];
  }
  if ([(NSString *)self->_UUID length]) {
    [v3 setObject:self->_UUID forKeyedSubscript:@"UUID"];
  }
  if ([(NSString *)self->_organization length]) {
    [v3 setObject:self->_organization forKeyedSubscript:@"Organization"];
  }
  installDate = self->_installDate;
  if (installDate)
  {
    uint64_t v8 = [(NSDate *)installDate description];
    [v3 setObject:v8 forKeyedSubscript:@"Install Date"];
  }
  installOptions = self->_installOptions;
  if (installOptions) {
    [v3 setObject:installOptions forKeyedSubscript:@"Install Options"];
  }
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isStub];
  [v3 setObject:v10 forKeyedSubscript:@"Is Stub"];

  char v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLocked];
  [v3 setObject:v11 forKeyedSubscript:@"Is Locked"];

  if (self->_removalPasscode) {
    [v3 setObject:&unk_1EF4D0B08 forKeyedSubscript:@"Has Removal Passcode"];
  }
  id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_encrypted];
  [v3 setObject:v12 forKeyedSubscript:@"Encrypted"];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MCProfile trustLevel](self, "trustLevel"));
  [v3 setObject:v13 forKeyedSubscript:@"Trusted"];

  int v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCProfile isSigned](self, "isSigned"));
  [v3 setObject:v14 forKeyedSubscript:@"Signed"];

  id v15 = [(MCProfile *)self signerCertificates];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
    long long v18 = [(MCProfile *)self signerCertificates];
    long long v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v20 = [(MCProfile *)self signerCertificates];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          long long v26 = (void *)MEMORY[0x1A6232D90]();
          long long v27 = +[MCProfile signerSummaryOfCertificate:v25];
          [v19 addObject:v27];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"Signers"];
  }
  long long v28 = [(MCProfile *)self expiryDate];
  long long v29 = v28;
  if (v28)
  {
    v30 = [v28 description];
    [v3 setObject:v30 forKeyedSubscript:@"Expiry"];
  }
  if ([(MCProfile *)self isManagedByProfileService]) {
    [v3 setObject:&unk_1EF4D0B08 forKeyedSubscript:@"Profile Service"];
  }
  removalDate = self->_removalDate;
  if (removalDate)
  {
    v32 = [(NSDate *)removalDate description];
    [v3 setObject:v32 forKeyedSubscript:@"Removal Date"];
  }
  localizedConsentText = self->_localizedConsentText;
  if (localizedConsentText) {
    [v3 setObject:localizedConsentText forKeyedSubscript:@"Consent Text"];
  }
  v34 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_targetDeviceType];
  [v3 setObject:v34 forKeyedSubscript:@"Device Type"];

  if ([(MCProfile *)self mustInstallNonInteractively]) {
    [v3 setObject:&unk_1EF4D0B08 forKeyedSubscript:@"Must Install Non-Interactively"];
  }
  if (self->_needsReboot) {
    [v3 setObject:&unk_1EF4D0B08 forKeyedSubscript:@"Needs Reboot"];
  }

  return v3;
}

- (NSArray)localizedPayloadSummaryByType
{
  return 0;
}

- (NSArray)localizedManagedPayloadSummaryByType
{
  return 0;
}

- (NSDate)earliestCertificateExpiryDate
{
  return 0;
}

- (NSDictionary)localizedManagedProfileConsentTexts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_localizedConsentText)
  {
    id v3 = [(MCProfile *)self friendlyName];
    localizedConsentText = self->_localizedConsentText;
    uint64_t v7 = v3;
    v8[0] = localizedConsentText;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v5;
}

- (NSDate)expiryDate
{
  uint64_t v3 = [(MCProfile *)self earliestCertificateExpiryDate];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v3 sinceDate:-1209600.0],
        uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if (self->_expiryDate)
    {
      uint64_t v6 = -[NSDate compare:](v5, "compare:");
      expiryDate = v5;
      if (v6 != -1) {
        expiryDate = self->_expiryDate;
      }
      uint64_t v8 = expiryDate;

      uint64_t v5 = v8;
    }
  }
  else
  {
    uint64_t v5 = self->_expiryDate;
  }
  return v5;
}

- (NSDate)unmodifiedExpiryDate
{
  uint64_t v3 = [(MCProfile *)self earliestCertificateExpiryDate];
  uint64_t v4 = v3;
  if (v3)
  {
    expiryDate = v3;
    if (self->_expiryDate)
    {
      uint64_t v6 = -[NSDate compare:](v3, "compare:");
      expiryDate = v4;
      if (v6 != -1) {
        expiryDate = self->_expiryDate;
      }
    }
  }
  else
  {
    expiryDate = self->_expiryDate;
  }
  uint64_t v7 = expiryDate;

  return v7;
}

- (BOOL)isManagedByProfileService
{
  return 0;
}

- (void)evaluateSignerTrust
{
  [(MCProfile *)self trustLevel];
  id v3 = [(MCProfile *)self signerSummary];
}

- (void)evaluateSignerTrustAsynchronouslyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MCProfile_evaluateSignerTrustAsynchronouslyWithCompletion___block_invoke;
  v7[3] = &unk_1E5A68908;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__MCProfile_evaluateSignerTrustAsynchronouslyWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) evaluateSignerTrust];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  id v4 = a3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MCOriginalSignerCheck", @"com.apple.profiled", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  uint64_t v7 = !v6;
  BOOL v8 = [(MCProfile *)self doesSigningAllowReplacementWithProfile:v4 useOriginalCheck:v7];

  return v8;
}

- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3 useOriginalCheck:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MCProfile *)self signerCertificate];
  if (v7)
  {
    BOOL v8 = v7;
    uint64_t v9 = (const void *)[v6 signerCertificate];
    if (v9)
    {
      if (v4
        && ([(MCProfile *)self installOptions],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            [v10 objectForKeyedSubscript:@"signatureVersion"],
            char v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            !v11))
      {
        [(MCProfile *)self signerCertificates];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(const void **)(*((void *)&v20 + 1) + 8 * i);
              if (v19 && CFEqual(v9, v19))
              {
                LODWORD(v9) = 1;
                goto LABEL_20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
        LODWORD(v9) = 0;
LABEL_20:
      }
      else
      {
        LODWORD(v9) = CFEqual(v9, v8) != 0;
      }
    }
    BOOL v12 = v9 != 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)isProfileUIInstallationEffectivelyAllowed
{
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowUIConfigurationProfileInstallation"];

  return v3 != 2;
}

- (BOOL)mayInstallWithOptions:(id)a3 hasInteractionClient:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6
    && ([(MCProfile *)self mustInstallNonInteractively]
     || ![(MCProfile *)self isProfileUIInstallationEffectivelyAllowed]))
  {
    long long v36 = (void *)MEMORY[0x1E4F28C58];
    long long v37 = MCErrorArray(@"ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION", v9, v10, v11, v12, v13, v14, v15, 0);
    long long v38 = v36;
    uint64_t v39 = 4020;
    goto LABEL_28;
  }
  uint64_t v16 = [v8 objectForKeyedSubscript:@"isCloudProfile"];

  if (!v16)
  {
    id v35 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E4F28C58];
    long long v37 = MCErrorArray(@"ERROR_PROFILE_MUST_BE_CONFIGURATION", v17, v18, v19, v20, v21, v22, v23, 0);
    long long v38 = v40;
    uint64_t v39 = 4011;
LABEL_28:
    id v35 = [v38 MCErrorWithDomain:@"MCInstallationErrorDomain" code:v39 descriptionArray:v37 errorType:@"MCFatalError"];

    if (!a5) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (mayInstallWithOptions_hasInteractionClient_outError__onceToken != -1) {
    dispatch_once(&mayInstallWithOptions_hasInteractionClient_outError__onceToken, &__block_literal_global_40);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v24 = [(MCProfile *)self payloads];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v59;
    v52 = a5;
    id v53 = v8;
    while (1)
    {
      uint64_t v28 = 0;
LABEL_11:
      if (*(void *)v59 != v27) {
        objc_enumerationMutation(v24);
      }
      long long v29 = *(void **)(*((void *)&v58 + 1) + 8 * v28);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v30 = (id)mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (!v31) {
        break;
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v55;
LABEL_15:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v55 != v33) {
          objc_enumerationMutation(v30);
        }
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v32) {
            goto LABEL_15;
          }
          goto LABEL_30;
        }
      }

      if (++v28 != v26) {
        goto LABEL_11;
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v63 count:16];
      id v35 = 0;
      a5 = v52;
      id v8 = v53;
      if (!v26) {
        goto LABEL_32;
      }
    }
LABEL_30:

    uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
    v42 = [v29 type];
    v50 = MCErrorArray(@"ERROR_UNNACEPTABLE_PAYLOAD_P_TYPE", v43, v44, v45, v46, v47, v48, v49, v42);
    id v35 = [v41 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4022 descriptionArray:v50 errorType:@"MCFatalError"];

    a5 = v52;
    id v8 = v53;
  }
  else
  {
    id v35 = 0;
  }
LABEL_32:

  if (a5)
  {
LABEL_33:
    if (v35)
    {
      id v35 = v35;
      *a5 = v35;
    }
  }
LABEL_35:

  return v35 == 0;
}

void __65__MCProfile_mayInstallWithOptions_hasInteractionClient_outError___block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses;
  mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses = v0;
}

- (id)restrictionsWithHeuristicsAppliedOutError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  BOOL v6 = [(MCProfile *)self payloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v39 = self;
    v40 = a3;
    uint64_t v9 = *(void *)v45;
    char v10 = 1;
LABEL_3:
    uint64_t v11 = 0;
    uint64_t v12 = v5;
    while (1)
    {
      if (*(void *)v45 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
      if (v13)
      {
        uint64_t v14 = [*(id *)(*((void *)&v44 + 1) + 8 * v11) restrictions];
        char v15 = [v14 MCValidateRestrictions];
      }
      else
      {
        char v15 = 1;
      }
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v17 = [v13 restrictions];
      uint64_t v18 = [v16 dictionaryWithDictionary:v17];

      if ((v15 & 1) == 0) {
        [v18 MCSanitizeRestrictions];
      }
      v10 &= v15;
      id v43 = 0;
      id v5 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v18 toRestrictionsDictionary:v12 outChangeDetected:0 outError:&v43];
      id v19 = v43;

      if (v19) {
        break;
      }
      ++v11;
      uint64_t v12 = v5;
      if (v8 == v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v10)
    {
      self = v39;
      a3 = v40;
    }
    else
    {
      uint64_t v20 = _MCLogObjects;
      self = v39;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEFAULT, "Profile contains invalid restrictions", buf, 2u);
      }
      a3 = v40;
    }
  }
  else
  {

    id v19 = 0;
  }
  uint64_t v21 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v22 = [v21 isSupervised];

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = +[MCRestrictionManager filterGrandfatheredRestrictionsIfNeededFromRestrictions:v5];
    uint64_t v24 = [v23 mutableCopy];

    id v5 = (id)v24;
  }
  uint64_t v25 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_DEFAULT, "Applying heuristics to restrictions.", buf, 2u);
  }
  uint64_t v26 = +[MCHacks sharedHacks];
  [v26 _applyHeuristicsToRestrictions:v5 forProfile:self ignoresUnrestrictableApps:0];

  if (v19) {
    goto LABEL_26;
  }
  uint64_t v27 = [(MCProfile *)self friendlyName];
  id v35 = MCLocalizedErrorFormatByDevice(@"ENCRYPTION_POLICY_PAYLOAD_FAILURE_TEXT", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);

  long long v36 = +[MCDeviceCapabilities currentDevice];
  id v41 = 0;
  [v36 validateCapabilitiesRequiredByRestrictions:v5 localizedIncompatibilityMessage:v35 outError:&v41];
  id v19 = v41;

  if (v19)
  {
LABEL_26:
    if (a3)
    {
      id v19 = v19;
      id v37 = 0;
      *a3 = v19;
    }
    else
    {
      id v37 = 0;
    }
  }
  else
  {
    id v37 = v5;
  }

  return v37;
}

- (id)appAccessibilityParameters
{
  return 0;
}

- (BOOL)shouldHaveFullSSLTrust
{
  int v3 = [(MCProfile *)self installOptions];
  BOOL v4 = [v3 objectForKey:@"isInstalledByMDM"];
  char v5 = [v4 BOOLValue];

  BOOL v6 = [v3 objectForKey:@"isInstalledInteractively"];
  uint64_t v7 = v6;
  BOOL v8 = (v5 & 1) != 0
    || v6 && ![v6 BOOLValue]
    || [(MCProfile *)self containsPayloadOfClass:objc_opt_class()];

  return v8;
}

- (BOOL)isManagedByMDM
{
  uint64_t v2 = [(MCProfile *)self managingProfileIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)managingProfileIdentifier
{
  BOOL v3 = +[MCDependencyReader sharedReader];
  BOOL v4 = [v3 dependentsOfParent:self->_identifier inDomain:@"ManagedProfileToManagingProfile"];

  char v5 = [v4 firstObject];

  return (NSString *)v5;
}

- (BOOL)isSupervisionProfile
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = objc_opt_class();
  return [(MCProfile *)self containsPayloadOfClass:v3];
}

- (id)payloadsOfKindOfClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = [(MCProfile *)self payloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  return v11;
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (NSString)organization
{
  return self->_organization;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (unint64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)needsReboot
{
  return self->_needsReboot;
}

- (BOOL)isStub
{
  return self->_isStub;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (NSDate)removalDate
{
  return self->_removalDate;
}

- (NSDictionary)installOptions
{
  return self->_installOptions;
}

- (void)setInstallOptions:(id)a3
{
}

- (void)setMustInstallNonInteractively:(BOOL)a3
{
  self->_mustInstallNonInteractively = a3;
}

- (NSString)localizedConsentText
{
  return self->_localizedConsentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedConsentText, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_removalDate, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_removalPasscode, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_signerEvaluationQueue, 0);
  objc_storeStrong((id *)&self->_signerQueueSignerCertificates, 0);
  objc_storeStrong((id *)&self->_signerQueueSignerSummary, 0);
  objc_storeStrong((id *)&self->_trustEvaluationQueue, 0);
}

+ (MCProfile)profileWithData:(id)a3 options:(id)a4 outError:(id *)a5
{
  return (MCProfile *)[a1 profileWithData:a3 options:a4 fileName:0 allowEmptyPayload:0 outError:a5];
}

+ (id)_malformedProfileError
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"MALFORMED_PAYLOAD_ERROR_DESCRIPTION", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)_unsupportedEnrollmentServiceProfileError
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"UNSUPPORTED_PROFILE_TYPE_ERROR_DESCRIPTION", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1016 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)_unsupportedProfileTypeError
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"UNSUPPORTED_PROFILE_TYPE_ERROR_DESCRIPTION", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1017 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)badFieldTypeErrorWithField:(id)a3
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1003 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)missingFieldErrorWithField:(id)a3
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1002 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (MCProfile)profileWithData:(id)a3 options:(id)a4 fileName:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v12 length])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = [a1 _malformedProfileError];
      uint64_t v21 = 0;
      if (!v17)
      {
LABEL_25:
        id v20 = v21;
LABEL_26:

        goto LABEL_27;
      }
LABEL_11:
      if (a7) {
        *a7 = v17;
      }
      uint64_t v22 = [v17 code];
      uint64_t v23 = _MCLogObjects;
      if (v22 == 1005)
      {
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "Empty profile. This is probably not an error.", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = v23;
        uint64_t v25 = [v17 MCVerboseDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v25;
        _os_log_impl(&dword_1A13F0000, v24, OS_LOG_TYPE_ERROR, "Failed to parse profile data. Error: %{public}@", buf, 0xCu);
      }
      id v20 = 0;
      goto LABEL_26;
    }
    id v29 = 0;
    id v30 = 0;
    long long v15 = [a1 profileDictionaryFromProfileData:v12 outSignerCerts:&v30 outError:&v29];
    id v16 = v30;
    id v17 = v29;
    if (v15)
    {
      id v18 = v16;
    }
    else
    {
      id v28 = v16;
      long long v15 = +[MCCertificateWrapperProfile wrapperProfileDictionaryWithCertificateData:v12 fileName:v14 outSignerCerts:&v28];
      id v18 = v28;

      if (!v15)
      {
        uint64_t v21 = 0;
        goto LABEL_24;
      }
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = 0;
      uint64_t v21 = [a1 profileWithDictionary:v15 options:v13 signerCerts:v18 fileName:v14 allowEmptyPayload:v8 outError:&v27];
      id v17 = v27;
    }
    else
    {
      id v17 = [a1 _malformedProfileError];
      uint64_t v21 = 0;
    }

LABEL_24:
    if (!v17) {
      goto LABEL_25;
    }
    goto LABEL_11;
  }
  if (a7)
  {
    *a7 = [a1 _malformedProfileError];
  }
  id v19 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "+[MCProfile(Private) profileWithData:options:fileName:allowEmptyPayload:outError:]";
    _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_ERROR, "%s: Trying to initialize a profile from data with zero bytes", buf, 0xCu);
  }
  id v20 = 0;
LABEL_27:

  return (MCProfile *)v20;
}

+ (id)profileDictionaryFromProfileData:(id)a3 outSignerCerts:(id *)a4 outError:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 length])
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    id v20 = MCErrorArray(@"ERROR_PROFILE_EMPTY", v9, v10, v11, v12, v13, v14, v15, 0);
    id v21 = [v19 MCErrorWithDomain:@"MCProfileErrorDomain" code:1005 descriptionArray:v20 errorType:@"MCFatalError"];

    id v17 = 0;
    goto LABEL_14;
  }
  uint64_t v16 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v8 options:1 format:0 error:0];
  if (v16)
  {
    id v17 = (void *)v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = 0;
      goto LABEL_8;
    }
    id v21 = [a1 _malformedProfileError];
LABEL_14:
    id v18 = 0;
    if (v21) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  id v51 = 0;
  uint64_t v22 = +[MCProfile dataFromCMSEncodedData:v8 outSignerCertificates:&v51];
  id v18 = v51;
  if (!v22)
  {
    id v17 = 0;
LABEL_19:
    id v21 = [a1 _malformedProfileError];
    if (v21) {
      goto LABEL_15;
    }
LABEL_20:
    id v28 = v17;
    goto LABEL_21;
  }
  id v17 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v22 options:1 format:0 error:0];

  if (!v17) {
    goto LABEL_19;
  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v23 = [v17 objectForKeyedSubscript:@"TargetDeviceType"];
  [v23 unsignedIntegerValue];
  if ((unint64_t)[v23 unsignedIntegerValue] >= 8)
  {
    id v21 = [a1 _malformedProfileError];
    goto LABEL_47;
  }
  uint64_t v50 = 0;
  id v49 = 0;
  uint64_t v24 = +[MCProfile removeOptionalObjectInDictionary:v17 key:@"EncryptedPayloadContent" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v49];
  id v21 = v49;
  id v43 = a5;
  if (v24)
  {
    id v48 = v21;
    uint64_t v25 = v24;
    id v26 = +[MCCrypto objectFromEncryptedData:v24 outCertificate:&v50 outError:&v48];
    id v27 = v48;

    if (v27)
    {
      id v21 = v27;
      uint64_t v24 = v25;
LABEL_45:

      a5 = v43;
      goto LABEL_46;
    }
    uint64_t v24 = v25;
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v21 = [a1 _malformedProfileError];
        goto LABEL_45;
      }
      id v30 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = v50;
        uint64_t v32 = v30;
        uint64_t v33 = +[MCProfile signerSummaryOfCertificate:v31];
        *(_DWORD *)buf = 138543362;
        long long v54 = v33;
        _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_INFO, "Decrypted profile with identity: %{public}@", buf, 0xCu);

        uint64_t v24 = v25;
      }
      [v17 setObject:v26 forKey:@"PayloadContent"];
      [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ProfileWasEncrypted"];
    }
    v42 = a4;

    id v21 = 0;
    a5 = v43;
  }
  else
  {
    v42 = a4;
  }
  if ([v18 count])
  {
    v40 = v24;
    id v41 = v23;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v34 = v18;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v34);
          }
          CFDataRef v39 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v44 + 1) + 8 * i));
          if (v39) {
            [v26 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v36);
    }

    if (v42)
    {
      id v26 = v26;
      id *v42 = v26;
    }
    uint64_t v24 = v40;
    uint64_t v23 = v41;
    goto LABEL_45;
  }
LABEL_46:

LABEL_47:
  if (!v21) {
    goto LABEL_20;
  }
LABEL_15:
  id v28 = 0;
  if (a5) {
    *a5 = v21;
  }
LABEL_21:

  return v28;
}

+ (MCProfile)profileWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 fileName:(id)a6 allowEmptyPayload:(BOOL)a7 outError:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = [v13 objectForKey:@"PayloadType"];
  [v13 removeObjectForKey:@"PayloadType"];
  if (v16)
  {
    if ([v16 isEqualToString:@"Configuration"])
    {
      id v17 = [[MCConfigurationProfile alloc] initWithDictionary:v13 options:v14 signerCerts:v15 allowEmptyPayload:v9 outError:a8];
LABEL_12:
      id v19 = v17;
      goto LABEL_19;
    }
    if ([v16 isEqualToString:@"CertificateWrapper"])
    {
      id v20 = MCCertificateWrapperProfile;
LABEL_11:
      id v17 = (MCConfigurationProfile *)[[v20 alloc] initWithDictionary:v13 signerCerts:v15 allowEmptyPayload:v9 outError:a8];
      goto LABEL_12;
    }
    if ([v16 isEqualToString:@"Profile Service"])
    {
      id v20 = MCProfileServiceProfile;
      goto LABEL_11;
    }
    if ([v16 isEqualToString:@"Enrollment Service"])
    {
      if (a8)
      {
        id v18 = [(id)objc_opt_class() _unsupportedEnrollmentServiceProfileError];
        goto LABEL_6;
      }
    }
    else if (a8)
    {
      id v18 = [a1 _unsupportedProfileTypeError];
      goto LABEL_6;
    }
  }
  else if (a8)
  {
    id v18 = [a1 _malformedProfileError];
LABEL_6:
    id v19 = 0;
    *a8 = v18;
    goto LABEL_19;
  }
  id v19 = 0;
LABEL_19:

  return (MCProfile *)v19;
}

- (NSString)stubFileName
{
  uint64_t v2 = [(MCProfile *)self identifier];
  uint64_t v3 = [v2 MCHashedFilenameWithExtension:@"stub"];

  return (NSString *)v3;
}

- (NSString)profileIDHashFileName
{
  uint64_t v2 = [(MCProfile *)self identifier];
  uint64_t v3 = [v2 MCHashedFilenameWithExtension:@"plist"];

  return (NSString *)v3;
}

- (NSString)profileDataFileName
{
  uint64_t v2 = [(MCProfile *)self identifier];
  uint64_t v3 = [v2 MCHashedFilenameWithExtension:@"pdata"];

  return (NSString *)v3;
}

- (MCProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v146.receiver = self;
  v146.super_class = (Class)MCProfile;
  uint64_t v11 = [(MCProfile *)&v146 init];
  if (!v11) {
    goto LABEL_42;
  }
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.managedconfiguration.trustEvaluationQueue", 0);
  trustEvaluationQueue = v11->_trustEvaluationQueue;
  v11->_trustEvaluationQueue = (OS_dispatch_queue *)v12;

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.managedconfiguration.signerEvaluationQueue", 0);
  signerEvaluationQueue = v11->_signerEvaluationQueue;
  v11->_signerEvaluationQueue = (OS_dispatch_queue *)v14;

  id v145 = 0;
  uint64_t v16 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"MCProfileIsRemovalStub" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v145];
  id v17 = (NSString *)v145;
  if (!v17)
  {
    v11->_isStub = [v16 BOOLValue];
    id v144 = 0;
    id v18 = +[MCProfile removeRequiredObjectInDictionary:v9 key:@"PayloadVersion" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v144];
    id v19 = (NSString *)v144;
    if (v19)
    {
      id v17 = v19;

      goto LABEL_5;
    }
    int v28 = [v18 intValue];
    v11->_int64_t version = v28;
    if (v11->_isStub)
    {
      if (v28 >= 3)
      {
        uint64_t v36 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          int64_t version = v11->_version;
          *(_DWORD *)buf = 67109120;
          LODWORD(v148) = version;
          _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_ERROR, "WARNING: profile contains invalid PayloadVersion “%d”.", buf, 8u);
        }
      }
    }
    else if ((v28 - 3) <= 0xFFFFFFFD)
    {
      long long v38 = (void *)MEMORY[0x1E4F28C58];
      CFDataRef v39 = MCErrorArray(@"ERROR_UNSUPPORTED_VERSION", v29, v30, v31, v32, v33, v34, v35, 0);
      v40 = [v38 MCErrorWithDomain:@"MCProfileErrorDomain" code:1001 descriptionArray:v39 errorType:@"MCFatalError"];
      id v17 = (NSString *)[v40 MCCopyAsPrimaryError];
LABEL_40:

LABEL_41:
      if (v17) {
        goto LABEL_6;
      }
LABEL_42:
      id v27 = v11;
      goto LABEL_43;
    }
    id v143 = 0;
    uint64_t v41 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v9 key:@"PayloadIdentifier" errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v143];
    id v17 = (NSString *)v143;
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v41;

    if (!v17)
    {
      id v142 = 0;
      uint64_t v43 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v9 key:@"PayloadUUID" errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v142];
      id v17 = (NSString *)v142;
      UUID = v11->_UUID;
      v11->_UUID = (NSString *)v43;
    }
    CFDataRef v39 = [v9 objectForKey:@"PayloadDescription"];
    if (!v39)
    {
      long long v45 = &off_1E5A65000;
      goto LABEL_28;
    }
    objc_opt_class();
    long long v45 = &off_1E5A65000;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v46 = MCStringFromArrayOfStrings(v39);
      profileDescription = v11->_profileDescription;
      v11->_profileDescription = (NSString *)v46;

      if (v11->_profileDescription) {
        goto LABEL_28;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v39;
        id v49 = v11->_profileDescription;
        v11->_profileDescription = v48;
LABEL_27:

LABEL_28:
        [v9 removeObjectForKey:@"PayloadDescription"];
        if (v17) {
          goto LABEL_41;
        }
        v113 = v39;
        id v51 = v45[91];
        id v141 = 0;
        uint64_t v52 = [v51 removeOptionalNonZeroLengthStringInDictionary:v9 key:@"PayloadDisplayName" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v141];
        id v17 = (NSString *)v141;
        displayName = v11->_displayName;
        v11->_displayName = (NSString *)v52;

        if (!v17)
        {
          id v140 = 0;
          uint64_t v54 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v9 key:@"PayloadOrganization" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v140];
          id v17 = (NSString *)v140;
          organization = v11->_organization;
          v11->_organization = (NSString *)v54;
        }
        long long v56 = [MEMORY[0x1E4F73168] sharedConfiguration];
        int v57 = [v56 isSupervised];

        if (v57)
        {
          if (!v17)
          {
            id v139 = 0;
            v40 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"PayloadRemovalDisallowed" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v139];
            long long v58 = (NSString *)v139;
            if (v58)
            {
LABEL_38:
              id v17 = v58;
              goto LABEL_39;
            }
            v11->_isLocked = [v40 BOOLValue];

LABEL_37:
            id v138 = 0;
            v40 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"PayloadRebootSuggested" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v138];
            long long v58 = (NSString *)v138;
            if (v58) {
              goto LABEL_38;
            }
            v112 = v40;
            v11->_needsReboot = [v40 BOOLValue];
            id v137 = 0;
            uint64_t v60 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"PayloadExpirationDate" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v137];
            id v17 = (NSString *)v137;
            expiryDate = v11->_expiryDate;
            v11->_expiryDate = (NSDate *)v60;

            if (v17) {
              goto LABEL_48;
            }
            id v136 = 0;
            uint64_t v62 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v9 key:@"ProductVersion" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v136];
            id v17 = (NSString *)v136;
            productVersion = v11->_productVersion;
            v11->_productVersion = (NSString *)v62;

            if (v17) {
              goto LABEL_48;
            }
            id v135 = 0;
            uint64_t v64 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v9 key:@"ProductBuildVersion" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v135];
            id v17 = (NSString *)v135;
            productBuildVersion = v11->_productBuildVersion;
            v11->_productBuildVersion = (NSString *)v64;

            if (v17
              || (id v134 = 0,
                  +[MCProfile removeOptionalObjectInDictionary:v9 key:@"RemovalDate" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v134], v66 = objc_claimAutoreleasedReturnValue(), id v17 = (NSString *)v134, removalDate = v11->_removalDate, v11->_removalDate = (NSDate *)v66, removalDate, v17))
            {
LABEL_48:
              v68 = 0;
LABEL_49:
              CFDataRef v39 = v113;
LABEL_50:

              v40 = v112;
              goto LABEL_40;
            }
            id v133 = 0;
            v68 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"TargetDeviceType" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v133];
            v69 = (NSString *)v133;
            if (v69)
            {
              id v17 = v69;
              goto LABEL_49;
            }
            v11->_targetDeviceType = [v68 unsignedIntValue];

            id v132 = 0;
            uint64_t v70 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"DurationUntilRemoval" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v132];
            id v17 = (NSString *)v132;
            v112 = (void *)v70;
            if (v70)
            {
              v71 = (void *)MEMORY[0x1E4F1C9C8];
              [v112 doubleValue];
              objc_msgSend(v71, "dateWithTimeIntervalSinceNow:");
              v97 = (NSDate *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v97 = 0;
            }
            if (!v11->_removalDate || v112 && v97 && -[NSDate compare:](v97, "compare:") == NSOrderedAscending)
            {
              v72 = v97;
              v73 = v11->_removalDate;
              v11->_removalDate = v97;
            }
            if (v17
              || (id v131 = 0,
                  +[MCProfile removeOptionalObjectInDictionary:v9 key:@"ConsentText" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v131], v74 = objc_claimAutoreleasedReturnValue(), id v17 = (NSString *)v131, (v102 = v74) == 0))
            {
              v102 = 0;
            }
            else if ([v74 count])
            {
              uint64_t v75 = [MEMORY[0x1E4F1CA20] preferredLanguages];
              v95 = [v102 allKeys];
              v100 = (void *)v75;
              objc_msgSend(MEMORY[0x1E4F28B50], "preferredLocalizationsFromArray:forPreferences:");
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v99 = [obj countByEnumeratingWithState:&v127 objects:v153 count:16];
              if (v99)
              {
                uint64_t v98 = *(void *)v128;
                while (2)
                {
                  for (id i = 0; i != (id)v99; id i = (char *)i + 1)
                  {
                    if (*(void *)v128 != v98) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v109 = *(void *)(*((void *)&v127 + 1) + 8 * i);
                    long long v123 = 0u;
                    long long v124 = 0u;
                    long long v125 = 0u;
                    long long v126 = 0u;
                    id v105 = v100;
                    uint64_t v76 = [v105 countByEnumeratingWithState:&v123 objects:v152 count:16];
                    if (v76)
                    {
                      uint64_t v77 = v76;
                      uint64_t v107 = *(void *)v124;
LABEL_75:
                      uint64_t v78 = 0;
                      while (1)
                      {
                        if (*(void *)v124 != v107) {
                          objc_enumerationMutation(v105);
                        }
                        if ([*(id *)(*((void *)&v123 + 1) + 8 * v78) hasPrefix:v109]) {
                          break;
                        }
                        if (v77 == ++v78)
                        {
                          uint64_t v77 = [v105 countByEnumeratingWithState:&v123 objects:v152 count:16];
                          if (v77) {
                            goto LABEL_75;
                          }
                          goto LABEL_81;
                        }
                      }

                      uint64_t v79 = [v102 objectForKey:v109];
                      if (!v79) {
                        continue;
                      }
                      v80 = (void *)v79;
                      v81 = obj;
                      goto LABEL_108;
                    }
LABEL_81:
                  }
                  uint64_t v99 = [obj countByEnumeratingWithState:&v127 objects:v153 count:16];
                  if (v99) {
                    continue;
                  }
                  break;
                }
              }

              v80 = [v102 objectForKey:@"default"];
              if (!v80)
              {
                v80 = [v102 objectForKey:@"en"];
                if (!v80)
                {
                  v81 = [v102 allValues];
                  v80 = [v81 firstObject];
LABEL_108:
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_storeStrong((id *)&v11->_localizedConsentText, v80);
              }
              else {
                id v87 = +[MCProfile badFieldTypeErrorWithField:@"ConsentText"];
              }
            }
            if (v11->_isStub)
            {
              if (v17)
              {

LABEL_124:
                CFDataRef v39 = v113;
                v68 = v97;
                goto LABEL_50;
              }
              id v122 = 0;
              id v101 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"SignerCerts" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v122];
              id v17 = (NSString *)v122;
              if (v17)
              {
LABEL_123:

                goto LABEL_124;
              }
            }
            else
            {
              id v101 = v10;
            }
            if ([v101 count])
            {
              objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v101, "count"));
              id v106 = (id)objc_claimAutoreleasedReturnValue();
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              id v104 = v101;
              uint64_t v110 = [v104 countByEnumeratingWithState:&v118 objects:v151 count:16];
              if (v110)
              {
                uint64_t v108 = *(void *)v119;
                do
                {
                  for (uint64_t j = 0; j != v110; ++j)
                  {
                    if (*(void *)v119 != v108) {
                      objc_enumerationMutation(v104);
                    }
                    SecCertificateRef v83 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v118 + 1) + 8 * j));
                    if (v83)
                    {
                      SecCertificateRef v84 = v83;
                      [v106 addObject:v83];
                      CFRelease(v84);
                    }
                  }
                  uint64_t v110 = [v104 countByEnumeratingWithState:&v118 objects:v151 count:16];
                }
                while (v110);
              }
            }
            else
            {
              id v106 = 0;
            }
            objc_storeStrong((id *)&v11->_signerQueueSignerCertificates, v106);
            if (v17)
            {
              v85 = 0;
            }
            else
            {
              id v117 = 0;
              v85 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"ProfileWasEncrypted" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v117];
              v86 = (NSString *)v117;
              if (v86)
              {
                id v17 = v86;
              }
              else
              {
                v11->_encrypted = [v85 BOOLValue];
                [v9 removeObjectForKey:@"ProfileWasTrusted"];
                [v9 removeObjectForKey:@"ProfileWasSigned"];
                [v9 removeObjectForKey:@"ProfileTrustLevel"];
                if (v11->_isStub)
                {
                  id v116 = 0;
                  uint64_t v88 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"InstallDate" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v116];
                  id v17 = (NSString *)v116;
                  installDate = v11->_installDate;
                  v11->_installDate = (NSDate *)v88;

                  if (v17)
                  {
                  }
                  else
                  {
                    id v115 = 0;
                    v111 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"ProfileWasLocked" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v115];
                    v90 = (NSString *)v115;
                    if (v90)
                    {
                      id v17 = v90;
                    }
                    else
                    {
                      v11->_isLocked = [v111 BOOLValue];
                      id v114 = 0;
                      uint64_t v91 = +[MCProfile removeOptionalObjectInDictionary:v9 key:@"InstallOptions" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v114];
                      id v17 = (NSString *)v114;
                      installOptions = v11->_installOptions;
                      v11->_installOptions = (NSDictionary *)v91;

                      if (v11->_isLocked)
                      {
                        uint64_t v93 = +[MCKeychain stringFromService:@"MCProfileRemovalPasscode" account:v11->_UUID label:0 description:0 useSystemKeychain:[(MCProfile *)v11 isInstalledForSystem] outError:0];
                        removalPasscode = v11->_removalPasscode;
                        v11->_removalPasscode = (NSString *)v93;
                      }
                    }
                  }
                }
                else
                {
                  id v17 = 0;
                }
              }
            }

            goto LABEL_123;
          }
        }
        else if (!v17)
        {
          goto LABEL_37;
        }
        v40 = 0;
LABEL_39:
        CFDataRef v39 = v113;
        goto LABEL_40;
      }
    }
    uint64_t v50 = +[MCProfile badFieldTypeErrorWithField:@"PayloadDescription"];
    id v49 = v17;
    id v17 = (NSString *)v50;
    goto LABEL_27;
  }
LABEL_5:

LABEL_6:
  id v20 = v11->_signerEvaluationQueue;
  v11->_signerEvaluationQueue = 0;

  id v21 = v11->_trustEvaluationQueue;
  v11->_trustEvaluationQueue = 0;

  uint64_t v22 = [(MCProfile *)v11 malformedProfileErrorWithError:v17];
  uint64_t v23 = v22;
  if (a6) {
    *a6 = v22;
  }
  uint64_t v24 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = v24;
    id v26 = [v23 MCVerboseDescription];
    *(_DWORD *)buf = 134218242;
    v148 = v11;
    __int16 v149 = 2114;
    v150 = v26;
    _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_ERROR, "%p Can't parse profile: %{public}@", buf, 0x16u);
  }
  id v27 = 0;
LABEL_43:

  return v27;
}

- (id)malformedProfileErrorWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCProfile *)self friendlyName];
  id v13 = v5;
  dispatch_queue_t v14 = (void *)MEMORY[0x1E4F28C58];
  if (v5) {
    MCErrorArray(@"ERROR_PROFILE_MALFORMED_P_ID", v6, v7, v8, v9, v10, v11, v12, v5);
  }
  else {
  id v15 = MCErrorArray(@"MALFORMED_PAYLOAD_ERROR_DESCRIPTION", v6, v7, v8, v9, v10, v11, v12, 0);
  }
  uint64_t v16 = [v14 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v15 underlyingError:v4 errorType:@"MCFatalError"];

  return v16;
}

- (BOOL)writeStubToDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCProfile *)self stubFileName];
  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  LOBYTE(self) = [(MCProfile *)self writeStubToPath:v6];
  return (char)self;
}

- (BOOL)writeStubToPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCProfile *)self stubDictionary];
  char v6 = [v5 MCWriteToBinaryFile:v4];

  return v6;
}

- (id)stubDictionary
{
  v38[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MCProductVersion();
  id v4 = MCProductBuildVersion();
  [0 MCSetObjectIfNotNil:v3 forKey:@"ProductVersion"];
  [0 MCSetObjectIfNotNil:v4 forKey:@"ProductBuildVersion"];
  v37[0] = @"PayloadVersion";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_version];
  identifier = self->_identifier;
  UUID = self->_UUID;
  v38[0] = v5;
  v38[1] = identifier;
  v37[1] = @"PayloadIdentifier";
  v37[2] = @"PayloadUUID";
  v38[2] = UUID;
  v37[3] = @"ProfileWasEncrypted";
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_encrypted];
  v37[4] = @"MCProfileIsRemovalStub";
  v38[3] = v8;
  v38[4] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
  uint64_t v10 = (void *)[v9 mutableCopy];

  removalDate = self->_removalDate;
  if (removalDate) {
    [v10 setObject:removalDate forKeyedSubscript:@"RemovalDate"];
  }
  localizedConsentText = self->_localizedConsentText;
  if (localizedConsentText)
  {
    uint64_t v35 = @"default";
    uint64_t v36 = localizedConsentText;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v10 setObject:v13 forKeyedSubscript:@"ConsentText"];
  }
  [v10 MCSetObjectIfNotNil:self->_displayName forKey:@"PayloadDisplayName"];
  [v10 MCSetObjectIfNotNil:self->_profileDescription forKey:@"PayloadDescription"];
  [v10 MCSetObjectIfNotNil:self->_organization forKey:@"PayloadOrganization"];
  [v10 MCSetObjectIfNotNil:self->_installDate forKey:@"InstallDate"];
  [v10 MCSetObjectIfNotNil:self->_expiryDate forKey:@"PayloadExpirationDate"];
  if (self->_needsReboot)
  {
    dispatch_queue_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v10 MCSetObjectIfNotNil:v14 forKey:@"PayloadRebootSuggested"];
  }
  else
  {
    [v10 MCSetObjectIfNotNil:0 forKey:@"PayloadRebootSuggested"];
  }
  installOptions = self->_installOptions;
  if (installOptions) {
    [v10 setObject:installOptions forKeyedSubscript:@"InstallOptions"];
  }
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_targetDeviceType];
  [v10 setObject:v16 forKeyedSubscript:@"TargetDeviceType"];

  id v17 = [(MCProfile *)self signerCertificates];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4F1CA48];
    id v20 = [(MCProfile *)self signerCertificates];
    id v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v22 = [(MCProfile *)self signerCertificates];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          CFDataRef v27 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v30 + 1) + 8 * i));
          if (v27) {
            [v21 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    [v10 setObject:v21 forKey:@"SignerCerts"];
  }
  if (self->_isLocked)
  {
    int v28 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v10 setObject:v28 forKey:@"ProfileWasLocked"];
  }
  return v10;
}

- (BOOL)containsPayloadOfClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(MCProfile *)self payloads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)containsAnyPayloadOfClasses:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(MCProfile *)self payloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 containsObject:objc_opt_class()])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsOnlyPayloadsOfClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(MCProfile *)self payloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![v4 containsObject:objc_opt_class()])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)countOfPayloadsOfClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(MCProfile *)self payloads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_opt_isKindOfClass() & 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)removeRequiredObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 missingDataCode:(int64_t)a7 missingDataErrorString:(id)a8 invalidDataCode:(int64_t)a9 invalidDataErrorString:(id)a10 outError:(id *)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a10;
  CFDataRef v27 = [v15 objectForKey:v16];
  if (v27)
  {
    if (objc_opt_isKindOfClass())
    {
      [v15 removeObjectForKey:v16];
      id v35 = v27;
      goto LABEL_10;
    }
    if (a11)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = MCErrorArray(v19, v28, v29, v30, v31, v32, v33, v34, v16);
      long long v38 = v41;
      id v39 = v17;
      int64_t v40 = a9;
      goto LABEL_8;
    }
  }
  else if (a11)
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = MCErrorArray(v18, v20, v21, v22, v23, v24, v25, v26, v16);
    long long v38 = v36;
    id v39 = v17;
    int64_t v40 = a7;
LABEL_8:
    *a11 = [v38 MCErrorWithDomain:v39 code:v40 descriptionArray:v37 errorType:@"MCFatalError"];
  }
  id v35 = 0;
LABEL_10:

  return v35;
}

+ (id)removeOptionalObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = [v13 objectForKey:v14];
  if (v17 && ([v13 removeObjectForKey:v14], (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a9)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      CFDataRef v27 = MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
      *a9 = [v26 MCErrorWithDomain:v15 code:a7 descriptionArray:v27 errorType:@"MCFatalError"];
    }
    id v25 = 0;
  }
  else
  {
    id v25 = v17;
  }

  return v25;
}

+ (id)removeRequiredNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  uint64_t v20 = [v15 objectForKey:v16];
  if (v20 && ([v15 removeObjectForKey:v16], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [v15 removeObjectForKey:v16];
    if (a10)
    {
      uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = MCErrorArray(v19, v29, v30, v31, v32, v33, v34, v35, v16);
      long long v38 = v36;
      id v39 = v17;
      int64_t v40 = a8;
LABEL_9:
      *a10 = [v38 MCErrorWithDomain:v39 code:v40 descriptionArray:v37 errorType:@"MCFatalError"];
    }
  }
  else
  {
    if ([v20 length])
    {
      id v28 = v20;
      goto LABEL_11;
    }
    if (a10)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = MCErrorArray(v18, v21, v22, v23, v24, v25, v26, v27, v16);
      long long v38 = v41;
      id v39 = v17;
      int64_t v40 = a6;
      goto LABEL_9;
    }
  }
  id v28 = 0;
LABEL_11:

  return v28;
}

+ (id)removeOptionalNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = [v13 objectForKey:v14];
  if (!v17) {
    goto LABEL_4;
  }
  [v13 removeObjectForKey:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v17 length])
    {
LABEL_4:
      a8 = v17;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a8) {
      goto LABEL_8;
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
    *a8 = [v25 MCErrorWithDomain:v15 code:a6 descriptionArray:v26 errorType:@"MCFatalError"];
  }
  a8 = 0;
LABEL_8:

  return a8;
}

+ (BOOL)checkString:(id)a3 isOneOfStrings:(id)a4 key:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7 errorString:(id)a8 outError:(id *)a9
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  char v17 = [a4 containsObject:a3];
  BOOL v25 = v17;
  if (a9 && (v17 & 1) == 0)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
    *a9 = [v26 MCErrorWithDomain:v15 code:a7 descriptionArray:v27 errorType:@"MCFatalError"];
  }
  return v25;
}

+ (int)evaluateTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(a3) == 1
    && (SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0), SecCertificateIsSelfSignedCA()))
  {
    int v5 = 2;
    if (!+[MCKeychain itemExistsInKeychain:CertificateAtIndex useSystemKeychain:1])
    {
      if (+[MCKeychain itemExistsInKeychain:CertificateAtIndex useSystemKeychain:0])
      {
        return 2;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    CFErrorRef error = 0;
    if (SecTrustEvaluateWithError(a3, &error))
    {
      return 2;
    }
    else
    {
      CFRelease(error);
      return 0;
    }
  }
  return v5;
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4
{
  return [a1 evaluateTrustOfCertificateChain:a3 signatureVersion:a4 outIsAllowedToWriteDefaults:0];
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToWriteDefaults:(BOOL *)a5
{
  return [a1 evaluateTrustOfCertificateChain:a3 signatureVersion:a4 outIsAllowedToInstallUnsupportedPayloads:0 outIsAllowedToWriteDefaults:a5];
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6
{
  return [a1 evaluateTrustOfCertificateChain:a3 signatureVersion:a4 outIsAllowedToInstallUnsupportedPayloads:a5 outIsAllowedToWriteDefaults:a6 outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:0];
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6 outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(BOOL *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  LODWORD(a4) = [a4 intValue];
  uint64_t v12 = [v11 count];
  if ((int)a4 < 2)
  {
    if (v12 == 1)
    {
      [v11 objectAtIndex:0];
      if (SecCertificateIsSelfSignedCA())
      {
        int v16 = 2;
        SecTrustStoreForDomain();
        if (SecTrustStoreContains())
        {
          char v13 = 0;
          char v14 = 0;
          char v15 = 0;
          goto LABEL_33;
        }
      }
    }
LABEL_10:
    char v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if ((SecCertificateIsSelfSignedCA() & 1) == 0) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v20);
    }

    if ([v17 count])
    {
      SecTrustRef trust = 0;
      SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
      if (SecTrustCreateWithCertificates(v17, BasicX509, &trust))
      {
        int v16 = 0;
      }
      else
      {
        int v16 = +[MCProfile evaluateTrust:trust];
        CFRelease(trust);
      }
      CFRelease(BasicX509);
    }
    else
    {
      int v16 = 0;
    }
    if (a6)
    {
      BOOL v25 = +[MCHacks sharedHacks];
      char v14 = [v25 sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:v17];

      if (a5) {
        goto LABEL_27;
      }
    }
    else
    {
      char v14 = 0;
      if (a5)
      {
LABEL_27:
        uint64_t v26 = +[MCHacks sharedHacks];
        char v15 = [v26 sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:v17];

        if (a7)
        {
LABEL_28:
          uint64_t v27 = +[MCHacks sharedHacks];
          char v13 = [v27 sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:v17];

LABEL_32:
          goto LABEL_33;
        }
LABEL_31:
        char v13 = 0;
        goto LABEL_32;
      }
    }
    char v15 = 0;
    if (a7) {
      goto LABEL_28;
    }
    goto LABEL_31;
  }
  if (!v12 || ![v11 objectAtIndex:0] || !SecCertificateIsSelfSignedCA()) {
    goto LABEL_10;
  }
  SecTrustStoreForDomain();
  char v13 = 0;
  char v14 = 0;
  char v15 = 0;
  int v16 = 2 * (SecTrustStoreContains() != 0);
LABEL_33:
  if ([v11 count] && !v16)
  {
    uint64_t v34 = a7;
    char v28 = v14;
    uint64_t v29 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)[v11 objectAtIndex:0]);
    uint64_t v30 = MCHCUCopyHostCertificateForMappedLabel(v29);
    if (!v30)
    {
      int v16 = 0;
LABEL_47:

      char v14 = v28;
      a7 = v34;
      goto LABEL_48;
    }
    uint64_t v31 = v30;
    SecPolicyRef v32 = SecPolicyCreateBasicX509();
    SecTrustRef trust = 0;
    if (!SecTrustCreateWithCertificates(v11, v32, &trust))
    {
      uint64_t v41 = v31;
      if (!SecTrustSetAnchorCertificates(trust, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1])&& !SecTrustSetAnchorCertificatesOnly(trust, 1u))
      {
        CFErrorRef error = 0;
        if (SecTrustEvaluateWithError(trust, &error))
        {
          int v16 = 2;
LABEL_44:
          if (v32) {
            CFRelease(v32);
          }
          CFRelease(v31);
          goto LABEL_47;
        }
        CFRelease(error);
      }
    }
    int v16 = 0;
    goto LABEL_44;
  }
LABEL_48:
  if (a5) {
    *a5 = v15;
  }
  if (a6) {
    *a6 = v14;
  }
  if (a7) {
    *a7 = v13;
  }

  return v16;
}

+ (id)signerSummaryOfCertificate:(__SecCertificate *)a3
{
  CFDataRef v4 = CFDataCreate(0, signerSummaryOfCertificate__emailProtectionOID, 8);
  CFArrayRef v5 = (const __CFArray *)SecCertificateCopyExtendedKeyUsage();
  if (v5)
  {
    CFArrayRef v6 = v5;
    v12.length = CFArrayGetCount(v5);
    v12.location = 0;
    if (CFArrayContainsValue(v6, v12, v4) && (CFArrayRef v7 = (const __CFArray *)SecCertificateCopyRFC822Names()) != 0)
    {
      CFArrayRef v8 = v7;
      if (CFArrayGetCount(v7))
      {
        uint64_t v9 = CFArrayGetValueAtIndex(v8, 0);
      }
      else
      {
        uint64_t v9 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    CFRelease(v6);
    if (v4) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v4) {
LABEL_12:
    }
      CFRelease(v4);
  }
  if (!v9) {
    uint64_t v9 = (void *)SecCertificateCopySubjectSummary(a3);
  }
  return v9;
}

+ (id)dataFromCMSEncodedData:(id)a3 outSignerCertificates:(id *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
    CFArrayRef v7 = 0;
    if (!SecCMSVerifyCopyDataAndAttributes())
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E4F3B928]);
      if (Value)
      {
        CFArrayRef v10 = Value;
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(0, 0);
        CFIndex Count = CFArrayGetCount(v10);
        CFArrayRef v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
        if (Count >= 1)
        {
          unint64_t v13 = Count + 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v13 - 2);
            if (CFEqual(ValueAtIndex, CertificateAtIndex)) {
              [v7 insertObject:ValueAtIndex atIndex:0];
            }
            else {
              [v7 addObject:ValueAtIndex];
            }
            --v13;
          }
          while (v13 > 1);
        }
      }
      else
      {
        CFArrayRef v7 = 0;
      }
    }
    if (BasicX509) {
      CFRelease(BasicX509);
    }
    if (a4) {
      *a4 = v7;
    }
  }
  return 0;
}

- (id)signatureVersion
{
  if ([(MCProfile *)self isStub])
  {
    uint64_t v3 = [(MCProfile *)self installOptions];
    id v4 = [v3 objectForKey:@"signatureVersion"];
  }
  else
  {
    id v4 = +[MCProfile newProfileSignatureVersion];
  }
  return v4;
}

+ (id)newProfileSignatureVersion
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForDeviceType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id result = @"any";
      break;
    case 1uLL:
      id result = @"phone";
      break;
    case 2uLL:
      id result = @"watch";
      break;
    case 3uLL:
      id result = @"homepod";
      break;
    case 4uLL:
      id result = @"tv";
      break;
    case 5uLL:
      id result = @"mac";
      break;
    case 6uLL:
      id result = @"vision";
      break;
    default:
      if (a3 == 99) {
        id result = @"error";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

+ (unint64_t)thisDeviceType
{
  if (MCGestaltIsVisionDevice()) {
    return 6;
  }
  if (MCGestaltIsWatch()) {
    return 2;
  }
  if (MCGestaltIsHomePod()) {
    return 3;
  }
  if (MCGestaltIsAppleTV()) {
    return 4;
  }
  return 1;
}

- (id)loggingID
{
  uint64_t v3 = NSString;
  id v4 = [(MCProfile *)self identifier];
  id v5 = [(MCProfile *)self UUID];
  CFArrayRef v6 = [v3 stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (id)payloadsWithClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCProfile *)self payloads];
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

@end
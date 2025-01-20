@interface MICodeSigningVerifier
+ (BOOL)_validateBundleExecutable:(id)a3 againstStubAt:(id)a4 trustedHashes:(id)a5 sectionName:(id)a6 signingIdentifier:(id)a7 error:(id *)a8;
+ (BOOL)_validateStubSignature:(id)a3 withSigningID:(id)a4 error:(id *)a5;
+ (BOOL)validateWatchKitV1StubExecutableBundle:(id)a3 error:(id *)a4;
+ (BOOL)validateWatchKitV2StubExecutableBundle:(id)a3 error:(id *)a4;
+ (id)_validateSignatureAndCopyInfoForURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
+ (id)codeSigningVerifierForBundle:(id)a3;
- (BOOL)_getMICodeSignerTypeFromMISInfoDict:(id)a3 codeSignerType:(unint64_t *)a4 profileType:(unint64_t *)a5 error:(id *)a6;
- (BOOL)allowAdhocSigning;
- (BOOL)logResourceVerificationErrors;
- (BOOL)performOnlineAuthorization;
- (BOOL)performValidationWithError:(id *)a3;
- (BOOL)skipProfileIDValidation;
- (BOOL)validateResources;
- (BOOL)validateUsingDetachedSignature;
- (BOOL)verifyTrustCachePresence;
- (MICodeSigningInfo)signingInfo;
- (MICodeSigningVerifier)initWithBundle:(id)a3;
- (MIExecutableBundle)bundle;
- (id)_loadSystemDetachedSignatureForBundleID:(id)a3 error:(id *)a4;
- (void)setAllowAdhocSigning:(BOOL)a3;
- (void)setLogResourceVerificationErrors:(BOOL)a3;
- (void)setPerformOnlineAuthorization:(BOOL)a3;
- (void)setSkipProfileIDValidation:(BOOL)a3;
- (void)setValidateResources:(BOOL)a3;
- (void)setValidateUsingDetachedSignature:(BOOL)a3;
- (void)setVerifyTrustCachePresence:(BOOL)a3;
@end

@implementation MICodeSigningVerifier

- (MICodeSigningVerifier)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MICodeSigningVerifier;
  v6 = [(MICodeSigningVerifier *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    v7->_logResourceVerificationErrors = 1;
  }

  return v7;
}

+ (id)codeSigningVerifierForBundle:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundle:v3];

  return v4;
}

+ (id)_validateSignatureAndCopyInfoForURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  MIAssertHighResourceUsage();
  objc_super v9 = (void *)MEMORY[0x1C1878860]();
  v10 = [v7 path];
  uint64_t v11 = MISValidateSignatureAndCopyInfo();

  MIClearResourceAssertion();
  if (v11)
  {
    v22[0] = @"LegacyErrorString";
    v22[1] = @"LibMISErrorNumber";
    v23[0] = @"ApplicationVerificationFailed";
    v12 = [NSNumber numberWithInt:v11];
    v23[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v14 = [v7 path];
    v19 = MIErrorStringForMISError(v11);
    v16 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]", 79, @"MIInstallerErrorDomain", 13, 0, v13, @"Failed to verify code signature of %@ : 0x%08x (%@)", v15, (uint64_t)v14);
  }
  else
  {
    v20[0] = @"LegacyErrorString";
    v20[1] = @"LibMISErrorNumber";
    v21[0] = @"ApplicationVerificationFailed";
    v21[1] = &unk_1F170FA88;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v13 = [v7 path];
    v16 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]", 84, @"MIInstallerErrorDomain", 13, 0, v12, @"Failed to get info dictionary from MISValidateSignatureAndCopyInfo when verifying %@", v18, (uint64_t)v13);
  }

  if (a5) {
    *a5 = v16;
  }

  return 0;
}

- (id)_loadSystemDetachedSignatureForBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[MIDaemonConfiguration sharedInstance];
  id v7 = [v6 systemAppDetachedSignaturesDirectory];
  id v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:0];

  id v15 = 0;
  objc_super v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:3 error:&v15];
  id v10 = v15;
  if (!v9)
  {
    v14 = [v8 path];
    v12 = _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _loadSystemDetachedSignatureForBundleID:error:]", 109, @"MIInstallerErrorDomain", 129, v10, 0, @"Could not load detached signature data for %@ from %@", v11, (uint64_t)v5);

    if (a4)
    {
      id v10 = v12;
      *a4 = v10;
    }
    else
    {
      id v10 = v12;
    }
  }

  return v9;
}

- (BOOL)_getMICodeSignerTypeFromMISInfoDict:(id)a3 codeSignerType:(unint64_t *)a4 profileType:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FBA758]];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13)
  {
    id v14 = v10;
    id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4FBA778]];
    int v16 = MIBooleanValue(v15, 0);

    if (v16)
    {
      v17 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4FBA780]];
      char v18 = MIBooleanValue(v17, 0);

      if (v18)
      {
        unint64_t v19 = 2;
      }
      else
      {
        v24 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4FBA770]];
        int v25 = MIBooleanValue(v24, 0);

        if (v25) {
          unint64_t v19 = 3;
        }
        else {
          unint64_t v19 = 4;
        }
      }
    }
    else
    {
      unint64_t v19 = 1;
    }

    uint64_t v26 = [v13 longValue];
    switch(v26)
    {
      case 0:
      case 1:
      case 2:
      case 4:
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_17;
      case 3:
        if (v19 == 1)
        {
          v20 = [(MICodeSigningVerifier *)self bundle];
          v29 = [v20 identifier];
          _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 245, @"MIInstallerErrorDomain", 4, 0, 0, @"kMISValidationInfoValidatedByProfile was not set for %@ but kMISValidationInfoSignerType was set to MISSignerTypeProfile", v30, (uint64_t)v29);
          id v22 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        uint64_t v26 = 3;
        if (a4) {
LABEL_17:
        }
          *a4 = v26;
LABEL_18:
        id v22 = 0;
        if (a5) {
          *a5 = v19;
        }
        BOOL v23 = 1;
        break;
      case 5:
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 254, @"MIInstallerErrorDomain", 4, 0, 0, @"MISSignerType is MISSignerTypeLegacyVPN which is not supported by MI; returning MICodeSignerTypeUnknown",
          v27,
          v31);
        goto LABEL_23;
      case 6:
        uint64_t v26 = 5;
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_17;
      default:
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 260, @"MIInstallerErrorDomain", 4, 0, 0, @"kMISValidationInfoSignerType was set to unknown value %ld", v27, v26);
LABEL_23:
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        if (!a6) {
          goto LABEL_24;
        }
        goto LABEL_10;
    }
  }
  else
  {
    v20 = [(MICodeSigningVerifier *)self bundle];
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 227, @"MIInstallerErrorDomain", 4, 0, 0, @"kMISValidationInfoSignerType is not set or is not a number for %@", v21, (uint64_t)v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    if (a6)
    {
LABEL_10:
      id v22 = v22;
      BOOL v23 = 0;
      *a6 = v22;
    }
    else
    {
LABEL_24:
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (BOOL)performValidationWithError:(id *)a3
{
  v118[5] = *MEMORY[0x1E4F143B8];
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v4 = [(MICodeSigningVerifier *)self validateResources] ^ 1;
  uint64_t v96 = +[MITestManager sharedInstance];
  if ([(MICodeSigningVerifier *)self verifyTrustCachePresence]) {
    [(MICodeSigningVerifier *)self setAllowAdhocSigning:1];
  }
  if ([(MICodeSigningVerifier *)self validateResources]) {
    uint64_t v4 = [(MICodeSigningVerifier *)self validateUsingDetachedSignature] | v4;
  }
  uint64_t v98 = *MEMORY[0x1E4FBA7E0];
  v117[0] = *MEMORY[0x1E4FBA7E0];
  id v5 = [NSNumber numberWithBool:v4];
  v118[0] = v5;
  uint64_t v92 = *MEMORY[0x1E4FBA7B0];
  v117[1] = *MEMORY[0x1E4FBA7B0];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
  v118[1] = v6;
  uint64_t v89 = *MEMORY[0x1E4FBA788];
  v117[2] = *MEMORY[0x1E4FBA788];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MICodeSigningVerifier allowAdhocSigning](self, "allowAdhocSigning"));
  uint64_t v8 = *MEMORY[0x1E4FBA790];
  v118[2] = v7;
  v118[3] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4FBA7B8];
  uint64_t v88 = v8;
  v117[3] = v8;
  v117[4] = v9;
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MICodeSigningVerifier performOnlineAuthorization](self, "performOnlineAuthorization"));
  v118[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:5];
  id v12 = (void *)[v11 mutableCopy];

  if ([(MICodeSigningVerifier *)self verifyTrustCachePresence]) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FBA7D0]];
  }
  if ([(MICodeSigningVerifier *)self skipProfileIDValidation]) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FBA7C8]];
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v13 = [(MICodeSigningVerifier *)self bundle];
    id v14 = [v13 bundleURL];
    v79 = [v14 path];
    v86 = v12;
    MOLogWrite();
  }
  id v15 = [(MICodeSigningVerifier *)self bundle];
  unint64_t v16 = [v15 estimatedMemoryUsageToValidate];
  v17 = [(MICodeSigningVerifier *)self bundle];
  char v18 = [v17 identifier];
  unint64_t v19 = MIReserveMemoryForValidation(v16, v18);

  v20 = objc_opt_class();
  uint64_t v21 = [(MICodeSigningVerifier *)self bundle];
  id v22 = [v21 bundleURL];
  id v104 = 0;
  BOOL v23 = [v20 _validateSignatureAndCopyInfoForURL:v22 withOptions:v12 error:&v104];
  id v24 = v104;

  MIReturnMemoryUsedForValidation(v19);
  if (!v23)
  {
    v45 = 0;
    v99 = 0;
    id v46 = 0;
    goto LABEL_44;
  }
  if ([(MICodeSigningVerifier *)self validateResources]
    && [(MICodeSigningVerifier *)self validateUsingDetachedSignature])
  {
    int v25 = [(MICodeSigningVerifier *)self bundle];
    uint64_t v26 = [v25 identifier];
    id v103 = v24;
    uint64_t v27 = [(MICodeSigningVerifier *)self _loadSystemDetachedSignatureForBundleID:v26 error:&v103];
    id v28 = v103;

    if (!v27)
    {
      id v93 = 0;
      v99 = 0;
      id v46 = 0;
      v40 = 0;
      v57 = (void *)v96;
LABEL_72:
      v56 = a3;
      goto LABEL_73;
    }
    uint64_t v29 = MEMORY[0x1E4F1CC28];
    v116[0] = MEMORY[0x1E4F1CC28];
    v115[0] = v98;
    v115[1] = v92;
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
    v116[1] = v30;
    v116[2] = v29;
    v115[2] = v89;
    v115[3] = v9;
    uint64_t v31 = *MEMORY[0x1E4FBA7A0];
    v116[3] = v29;
    v116[4] = v27;
    v90 = v27;
    uint64_t v32 = *MEMORY[0x1E4FBA7D8];
    v115[4] = v31;
    v115[5] = v32;
    v115[6] = v88;
    v116[5] = MEMORY[0x1E4F1CC38];
    v116[6] = MEMORY[0x1E4F1CC38];
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:7];

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v34 = [(MICodeSigningVerifier *)self bundle];
      v35 = [v34 bundleURL];
      v80 = [v35 path];
      MOLogWrite();
    }
    v36 = objc_opt_class();
    v37 = [(MICodeSigningVerifier *)self bundle];
    v38 = [v37 bundleURL];
    id v102 = v28;
    [v36 _validateSignatureAndCopyInfoForURL:v38 withOptions:v33 error:&v102];
    v40 = v39 = (void *)v33;
    id v41 = v102;

    if (!v40)
    {
      id v93 = 0;
      v99 = 0;
      id v46 = 0;
      id v28 = v41;
      v56 = a3;
      v57 = (void *)v96;
      uint64_t v27 = v90;
LABEL_73:

      id v24 = v28;
      v45 = v93;
      if (!v56) {
        goto LABEL_74;
      }
      goto LABEL_45;
    }
  }
  else
  {
    id v41 = v24;
  }
  v42 = objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4FBA760], v80);
  objc_opt_class();
  id v43 = v42;
  if (objc_opt_isKindOfClass()) {
    id v44 = v43;
  }
  else {
    id v44 = 0;
  }

  id v93 = v44;
  if (!v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v81 = [(MICodeSigningVerifier *)self bundle];
    MOLogWrite();
  }
  v47 = objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4FBA738], v81);
  objc_opt_class();
  id v48 = v47;
  if (objc_opt_isKindOfClass()) {
    id v49 = v48;
  }
  else {
    id v49 = 0;
  }

  v99 = v49;
  if (!v49 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v82 = [(MICodeSigningVerifier *)self bundle];
    MOLogWrite();
  }
  v50 = objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4FBA740], v82);
  objc_opt_class();
  id v51 = v50;
  if (objc_opt_isKindOfClass()) {
    id v46 = v51;
  }
  else {
    id v46 = 0;
  }
  v45 = v93;

  if (!v46 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v83 = [(MICodeSigningVerifier *)self bundle];
    MOLogWrite();

    v45 = v93;
  }
  id v101 = v41;
  BOOL v52 = -[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:](self, "_getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:", v23, &v105, &v106, &v101, v83);
  id v24 = v101;

  if (!v52)
  {
LABEL_44:
    v40 = 0;
    v56 = a3;
    v57 = (void *)v96;
    if (!a3)
    {
LABEL_74:
      BOOL v58 = 0;
      goto LABEL_75;
    }
LABEL_45:
    id v24 = v24;
    BOOL v58 = 0;
    id *v56 = v24;
    goto LABEL_75;
  }
  v53 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4FBA750]];
  objc_opt_class();
  id v54 = v53;
  if (objc_opt_isKindOfClass()) {
    CFDataRef v55 = (const __CFData *)v54;
  }
  else {
    CFDataRef v55 = 0;
  }

  if (v55)
  {
    v59 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v55);
    if (v59)
    {
      v60 = v59;
      v40 = (void *)SecCertificateCopySubjectSummary(v59);
      uint64_t v27 = (void *)SecCertificateCopyOrganization();
      CFRelease(v60);
      if (v40)
      {
        v57 = (void *)v96;
        if (v27 && [v27 count])
        {
          if ((unint64_t)[v27 count] >= 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
          {
            v84 = [(MICodeSigningVerifier *)self bundle];
            v87 = v27;
            MOLogWrite();
          }
          v95 = objc_msgSend(v27, "objectAtIndexedSubscript:", 0, v84, v87);

          goto LABEL_62;
        }
        v107[0] = @"LegacyErrorString";
        v107[1] = @"LibMISErrorNumber";
        v108[0] = @"ApplicationVerificationFailed";
        v108[1] = &unk_1F170FA88;
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
        uint64_t v67 = [(MICodeSigningVerifier *)self bundle];
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 432, @"MIInstallerErrorDomain", 13, 0, v64, @"Could not extract signer organizations for %@", v68, v67);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v109[0] = @"LegacyErrorString";
        v109[1] = @"LibMISErrorNumber";
        v110[0] = @"ApplicationVerificationFailed";
        v110[1] = &unk_1F170FA88;
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
        uint64_t v67 = [(MICodeSigningVerifier *)self bundle];
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 427, @"MIInstallerErrorDomain", 13, 0, v64, @"Could not extract signer identity for %@", v69, v67);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        v57 = (void *)v96;
      }

      id v24 = (id)v67;
      goto LABEL_71;
    }
    v111[0] = @"LegacyErrorString";
    v111[1] = @"LibMISErrorNumber";
    v112[0] = @"ApplicationVerificationFailed";
    v112[1] = &unk_1F170FA88;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];
    v64 = [(MICodeSigningVerifier *)self bundle];
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 419, @"MIInstallerErrorDomain", 13, 0, v27, @"Could not create certificate from data for %@", v65, (uint64_t)v64);
LABEL_67:
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v57 = (void *)v96;
LABEL_71:

    goto LABEL_72;
  }
  if (![(MICodeSigningVerifier *)self allowAdhocSigning])
  {
    v113[0] = @"LegacyErrorString";
    v113[1] = @"LibMISErrorNumber";
    v114[0] = @"ApplicationVerificationFailed";
    v114[1] = &unk_1F170FA88;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
    v64 = [(MICodeSigningVerifier *)self bundle];
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 413, @"MIInstallerErrorDomain", 13, 0, v27, @"Failed to extract signer identity from %@", v66, (uint64_t)v64);
    goto LABEL_67;
  }
  v95 = 0;
  v40 = 0;
  v57 = (void *)v96;
LABEL_62:
  v61 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4FBA768]];
  objc_opt_class();
  id v62 = v61;
  if (objc_opt_isKindOfClass()) {
    id v63 = v62;
  }
  else {
    id v63 = 0;
  }

  char v100 = 0;
  v71 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4FBA748]];
  objc_opt_class();
  id v72 = v71;
  if (objc_opt_isKindOfClass()) {
    id v73 = v72;
  }
  else {
    id v73 = 0;
  }
  v97 = v12;

  v91 = v63;
  if (v73)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v74 = [(MICodeSigningVerifier *)self bundle];
      v85 = [v74 identifier];
      MOLogWrite();
    }
  }
  else if ([v57 isRunningInTestMode:&v100 outError:0] && v100)
  {
    if ([v57 testFlagsAreSet:32])
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        v78 = [(MICodeSigningVerifier *)self bundle];
        v84 = [v78 identifier];
        MOLogWrite();
      }
      objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", "MOBILEINSTALLATION_TEST_LAUNCH_WARNING_DATA", 43, v84);
      id v73 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v73 = 0;
    }
  }
  v75 = [MICodeSigningInfo alloc];
  v76 = [(MICodeSigningInfo *)v75 initWithSignerIdentity:v40 signerOrganization:v95 codeInfoIdentifier:v93 teamIdentifier:v91 signatureVersion:v99 entitlements:v46 signerType:v105 profileType:v106 signingInfoSource:2 launchWarningData:v73];
  signingInfo = self->_signingInfo;
  self->_signingInfo = v76;

  v45 = v93;
  BOOL v58 = 1;
  id v12 = v97;
LABEL_75:

  return v58;
}

+ (BOOL)validateWatchKitV1StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bundleURL];
  uint64_t v8 = [v7 URLByAppendingPathComponent:@"_WatchKitStub/WK"];

  if (validateWatchKitV1StubExecutableBundle_error__onceToken != -1) {
    dispatch_once(&validateWatchKitV1StubExecutableBundle_error__onceToken, &__block_literal_global_7);
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v9 = [v6 executableURL];
    id v12 = [v9 path];
    MOLogWrite();
  }
  char v10 = objc_msgSend(a1, "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:", v6, v8, validateWatchKitV1StubExecutableBundle_error__trustedHashes, @"__watchkit", @"com.apple.WK", a4, v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV1StubExecutableBundle_error___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"fApr4oevAMrl65iFf3wAhUqJIOk=" options:0];
  v1 = +[MISignatureAgnosticHasher packedNumberForCPUType:12 subtype:12];
  uint64_t v4 = v1;
  v5[0] = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (void *)validateWatchKitV1StubExecutableBundle_error__trustedHashes;
  validateWatchKitV1StubExecutableBundle_error__trustedHashes = v2;
}

+ (BOOL)validateWatchKitV2StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bundleURL];
  uint64_t v8 = [v7 URLByAppendingPathComponent:@"_WatchKitStub/WK"];

  if (validateWatchKitV2StubExecutableBundle_error__onceToken != -1) {
    dispatch_once(&validateWatchKitV2StubExecutableBundle_error__onceToken, &__block_literal_global_87);
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v9 = [v6 executableURL];
    id v12 = [v9 path];
    MOLogWrite();
  }
  char v10 = objc_msgSend(a1, "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:", v6, v8, validateWatchKitV2StubExecutableBundle_error__trustedHashes, @"__watchkit", @"com.apple.WK", a4, v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV2StubExecutableBundle_error___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"gMfFfUYLxpniCKUmtjSz0XLrXGs=" options:0];
  v1 = +[MISignatureAgnosticHasher packedNumberForCPUType:12 subtype:12];
  uint64_t v4 = v1;
  v5[0] = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (void *)validateWatchKitV2StubExecutableBundle_error__trustedHashes;
  validateWatchKitV2StubExecutableBundle_error__trustedHashes = v2;
}

+ (BOOL)_validateBundleExecutable:(id)a3 againstStubAt:(id)a4 trustedHashes:(id)a5 sectionName:(id)a6 signingIdentifier:(id)a7 error:(id *)a8
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v63 = v17;
  if (!v14)
  {
    id v21 = 0;
    goto LABEL_14;
  }
  id v18 = v17;
  unint64_t v19 = +[MIFileManager defaultManager];
  int v20 = [v19 itemExistsAtURL:v14];

  id v21 = 0;
  if (!v18 || !v20)
  {
LABEL_14:
    id v28 = [MISignatureAgnosticHasher alloc];
    uint64_t v29 = [v13 executableURL];
    uint64_t v30 = [(MISignatureAgnosticHasher *)v28 initWithExecutable:v29 searchForSectionNamed:0];

    id v60 = v16;
    if (v30)
    {
      id v69 = v21;
      BOOL v31 = [(MISignatureAgnosticHasher *)v30 performHashWithError:&v69];
      id v23 = v69;

      if (v31)
      {
        uint64_t v32 = [(MISignatureAgnosticHasher *)v30 hashes];
        v61 = v32;
        if (v32)
        {
          uint64_t v33 = v32;
          if ([v32 count])
          {
            id v58 = v14;
            v59 = v13;
            v34 = (void *)[v33 mutableCopy];
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v15 = v15;
            uint64_t v35 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v66;
              while (2)
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v66 != v37) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                  v40 = [v34 objectForKeyedSubscript:v39];
                  if (v40)
                  {
                    id v41 = [v15 objectForKeyedSubscript:v39];
                    if (![v41 isEqualToData:v40])
                    {
                      uint64_t v64 = 0;
                      +[MISignatureAgnosticHasher unpackPackedCpuTypeAndSubType:v39 cputype:(char *)&v64 + 4 subtype:&v64];
                      id v13 = v59;
                      v50 = [v59 executableURL];
                      id v51 = [v50 path];
                      uint64_t v43 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 572, @"MIInstallerErrorDomain", 72, 0, &unk_1F170F840, @"Executable at %@ did not match stub hash for cputype %d cpusubtype %d: %@ != %@", v52, (uint64_t)v51);

                      id v23 = v41;
                      int v25 = v15;
                      goto LABEL_42;
                    }
                    [v34 removeObjectForKey:v39];
                  }
                }
                uint64_t v36 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }

            if (![v34 count])
            {
              BOOL v47 = 1;
              id v14 = v58;
              id v13 = v59;
              id v16 = v60;
              v45 = v61;
              goto LABEL_39;
            }
            id v13 = v59;
            int v25 = [v59 executableURL];
            v40 = [v25 path];
            _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 581, @"MIInstallerErrorDomain", 72, 0, &unk_1F170F868, @"Did not validate all slice hashes on executable %@; unchecked hashes: %@",
              v42,
            uint64_t v43 = (uint64_t)v40);
LABEL_42:
            id v14 = v58;
LABEL_37:
            id v46 = a8;

            id v23 = (id)v43;
            id v16 = v60;
            v45 = v61;
            if (a8) {
              goto LABEL_38;
            }
            goto LABEL_34;
          }
        }
        int v25 = [v13 executableURL];
        v40 = [v25 path];
        uint64_t v43 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 560, @"MIInstallerErrorDomain", 72, v23, &unk_1F170F818, @"Unable to get hashes for executable %@", v48, (uint64_t)v40);
LABEL_36:
        v34 = 0;
        goto LABEL_37;
      }
      id v21 = v23;
    }
    else
    {
      id v23 = v21;
    }
    int v25 = [v13 executableURL];
    v40 = [v25 path];
    uint64_t v43 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 554, @"MIInstallerErrorDomain", 72, v21, &unk_1F170F7F0, @"Unable to compute hash for executable %@", v44, (uint64_t)v40);
    v61 = 0;
    goto LABEL_36;
  }
  id v71 = 0;
  int v22 = [a1 _validateStubSignature:v14 withSigningID:v18 error:&v71];
  id v23 = v71;
  if (v22)
  {
    id v24 = [[MISignatureAgnosticHasher alloc] initWithExecutable:v14 searchForSectionNamed:v16];
    int v25 = v24;
    if (v24)
    {
      id v70 = v23;
      BOOL v26 = [(MISignatureAgnosticHasher *)v24 performHashWithError:&v70];
      id v21 = v70;

      if (v26)
      {
        if (v16 && ([v25 hasNamedSection] & 1) == 0)
        {
          uint64_t v54 = [v14 path];
          id v55 = v16;
          v40 = (void *)v54;
          id v60 = v55;
          uint64_t v43 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 542, @"MIInstallerErrorDomain", 72, v21, &unk_1F170F7C8, @"Stub %@ does not have required section %@", v56, v54);
          v61 = 0;
          v34 = 0;
          uint64_t v30 = 0;
          id v23 = v21;
          goto LABEL_37;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v57 = [v14 path];
          MOLogWrite();
        }
        uint64_t v27 = objc_msgSend(v25, "hashes", v57);

        id v15 = (id)v27;
        goto LABEL_14;
      }
      id v60 = v16;
      id v23 = v21;
    }
    else
    {
      id v60 = v16;
    }
    v40 = [v14 path];
    uint64_t v43 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 537, @"MIInstallerErrorDomain", 72, v23, &unk_1F170F7A0, @"Unable to compute hash for stub %@", v53, (uint64_t)v40);
    v61 = 0;
    v34 = 0;
    uint64_t v30 = 0;
    goto LABEL_37;
  }
  v45 = 0;
  v34 = 0;
  uint64_t v30 = 0;
  id v46 = a8;
  if (a8)
  {
LABEL_38:
    id v23 = v23;
    BOOL v47 = 0;
    *id v46 = v23;
    goto LABEL_39;
  }
LABEL_34:
  BOOL v47 = 0;
LABEL_39:

  return v47;
}

+ (BOOL)_validateStubSignature:(id)a3 withSigningID:(id)a4 error:(id *)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4FBA7D8];
  v26[0] = *MEMORY[0x1E4FBA7E0];
  v26[1] = v10;
  v27[0] = MEMORY[0x1E4F1CC38];
  v27[1] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v25 = 0;
  id v12 = [a1 _validateSignatureAndCopyInfoForURL:v8 withOptions:v11 error:&v25];
  id v13 = v25;
  if (v12)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FBA778]];
    int v15 = MIBooleanValue(v14, 0);

    if (v15)
    {
      id v16 = [v8 path];
      uint64_t v18 = _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]", 611, @"MIInstallerErrorDomain", 72, 0, &unk_1F170F890, @"Executable stub at %@ not signed by Apple.", v17, (uint64_t)v16);
      id v19 = 0;
    }
    else
    {
      id v21 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FBA760]];
      objc_opt_class();
      id v22 = v21;
      if (objc_opt_isKindOfClass()) {
        id v19 = v22;
      }
      else {
        id v19 = 0;
      }

      if ([v19 isEqualToString:v9])
      {
        BOOL v20 = 1;
        goto LABEL_14;
      }
      id v16 = [v8 path];
      _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]", 618, @"MIInstallerErrorDomain", 72, 0, &unk_1F170F8B8, @"Executable stub at %@ had unexpected signing identifier '%@'; expected %@.",
        v23,
      uint64_t v18 = (uint64_t)v16);
    }

    id v13 = (id)v18;
    if (a5) {
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = 0;
    if (a5)
    {
LABEL_13:
      id v13 = v13;
      BOOL v20 = 0;
      *a5 = v13;
      goto LABEL_14;
    }
  }
  BOOL v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)allowAdhocSigning
{
  return self->_allowAdhocSigning;
}

- (void)setAllowAdhocSigning:(BOOL)a3
{
  self->_allowAdhocSigning = a3;
}

- (BOOL)logResourceVerificationErrors
{
  return self->_logResourceVerificationErrors;
}

- (void)setLogResourceVerificationErrors:(BOOL)a3
{
  self->_logResourceVerificationErrors = a3;
}

- (BOOL)validateResources
{
  return self->_validateResources;
}

- (void)setValidateResources:(BOOL)a3
{
  self->_validateResources = a3;
}

- (BOOL)performOnlineAuthorization
{
  return self->_performOnlineAuthorization;
}

- (void)setPerformOnlineAuthorization:(BOOL)a3
{
  self->_performOnlineAuthorization = a3;
}

- (BOOL)validateUsingDetachedSignature
{
  return self->_validateUsingDetachedSignature;
}

- (void)setValidateUsingDetachedSignature:(BOOL)a3
{
  self->_validateUsingDetachedSignature = a3;
}

- (BOOL)verifyTrustCachePresence
{
  return self->_verifyTrustCachePresence;
}

- (void)setVerifyTrustCachePresence:(BOOL)a3
{
  self->_verifyTrustCachePresence = a3;
}

- (BOOL)skipProfileIDValidation
{
  return self->_skipProfileIDValidation;
}

- (void)setSkipProfileIDValidation:(BOOL)a3
{
  self->_skipProfileIDValidation = a3;
}

- (MICodeSigningInfo)signingInfo
{
  return self->_signingInfo;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_signingInfo, 0);
}

@end
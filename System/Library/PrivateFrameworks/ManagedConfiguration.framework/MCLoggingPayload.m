@interface MCLoggingPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isAllowedToWriteLogging;
- (MCLoggingPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSDictionary)loggingPayload;
- (id)stubDictionary;
- (id)title;
@end

@implementation MCLoggingPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.system.logging";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"LOGGING_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"LOGGING_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isAllowedToWriteLogging
{
  char v8 = 0;
  uint64_t v3 = [(MCPayload *)self profile];
  uint64_t v4 = [v3 signatureVersion];

  uint64_t v5 = [(MCPayload *)self profile];
  uint64_t v6 = [v5 signerCertificates];
  +[MCProfile evaluateTrustOfCertificateChain:v6 signatureVersion:v4 outIsAllowedToWriteDefaults:&v8];

  LOBYTE(v5) = v8;
  return (char)v5;
}

- (MCLoggingPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v67.receiver = self;
  v67.super_class = (Class)MCLoggingPayload;
  v10 = [(MCPayload *)&v67 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_41;
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v66 = 0;
  v12 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Processes" isRequired:0 outError:&v66];
  id v13 = v66;
  if (v13)
  {
    id v14 = v13;

LABEL_32:
    v49 = [(MCPayload *)v10 malformedPayloadErrorWithError:v14];
    v50 = v49;
    if (a5) {
      *a5 = v49;
    }
    v51 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      v53 = objc_opt_class();
      id v54 = v53;
      v55 = [v50 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v69 = v53;
      __int16 v70 = 2114;
      id v71 = v55;
      _os_log_impl(&dword_1A13F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_37;
  }
  if (v12) {
    [v11 setObject:v12 forKey:@"Processes"];
  }
  v62 = v11;
  id v65 = 0;
  v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Subsystems" isRequired:0 outError:&v65];
  id v14 = v65;
  if (!v14)
  {
    if (v15) {
      [v62 setObject:v15 forKey:@"Subsystems"];
    }
    id v64 = 0;
    v16 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"System" isRequired:0 outError:&v64];
    id v17 = v64;
    if (v17)
    {
      id v14 = v17;
      v18 = v16;
LABEL_30:

      goto LABEL_31;
    }
    v19 = [(MCPayload *)v10 profile];
    char v20 = [v19 isStub];

    if (v20)
    {
      v18 = v16;
    }
    else
    {
      if (v16)
      {
        v21 = (void *)[v16 mutableCopy];
      }
      else
      {
        v21 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v18 = v21;
      v22 = [v21 objectForKey:@"Enable-Logging"];

      if (!v22) {
        [v18 setValue:MEMORY[0x1E4F1CC38] forKey:@"Enable-Logging"];
      }
    }
    if (v18) {
      [v62 setObject:v18 forKey:@"System"];
    }
    v23 = [(MCPayload *)v10 profile];
    char v24 = [v23 isStub];

    if (v24) {
      goto LABEL_22;
    }
    id v63 = 0;
    char v27 = MCOSLogValidateProfilePayload(v62, (uint64_t)&v63);
    loggingPayload = (NSDictionary *)v63;
    if (v27)
    {
      if ([(MCLoggingPayload *)v10 isAllowedToWriteLogging])
      {

LABEL_22:
        uint64_t v25 = [v62 copy];
        id v14 = 0;
        loggingPayload = v10->_loggingPayload;
        v10->_loggingPayload = (NSDictionary *)v25;
LABEL_29:

        goto LABEL_30;
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      v61 = [v9 friendlyName];
      uint64_t v47 = MCErrorArray(@"ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID", v40, v41, v42, v43, v44, v45, v46, v61);
      v48 = v39;
      v38 = (void *)v47;
      v60 = objc_msgSend(v48, "MCErrorWithDomain:code:descriptionArray:errorType:", @"MCLoggingSettingsErrorDomain", 49000);
      id v14 = (id)[v60 MCCopyAsPrimaryError];
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      v61 = [(MCPayload *)v10 identifier];
      uint64_t v36 = MCErrorArray(@"ERROR_LOGGING_INVALID_CONFIGURATION_P_ID", v29, v30, v31, v32, v33, v34, v35, v61);
      v37 = v28;
      v38 = (void *)v36;
      objc_msgSend(v37, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", @"MCLoggingSettingsErrorDomain", 49001);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_29;
  }
LABEL_31:

  if (v14) {
    goto LABEL_32;
  }
LABEL_37:
  if ([v8 count])
  {
    v56 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v57 = v56;
      v58 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v69 = v58;
      __int16 v70 = 2114;
      id v71 = v8;
      _os_log_impl(&dword_1A13F0000, v57, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_41:
  return v10;
}

- (id)stubDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)MCLoggingPayload;
  uint64_t v3 = [(MCPayload *)&v5 stubDictionary];
  [v3 addEntriesFromDictionary:self->_loggingPayload];
  return v3;
}

- (id)title
{
  uint64_t v2 = NSString;
  uint64_t v3 = MCLocalizedString(@"LOGGING_DESCRIPTION_SINGULAR_FORMAT");
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", v3, 0);

  return v4;
}

- (NSDictionary)loggingPayload
{
  return self->_loggingPayload;
}

- (void).cxx_destruct
{
}

@end
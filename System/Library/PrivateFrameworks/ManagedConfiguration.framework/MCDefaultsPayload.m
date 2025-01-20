@interface MCDefaultsPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isAllowedToWriteDefaults;
- (MCDefaultsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (id)defaultsForDomain:(id)a3;
- (id)domains;
- (id)stubDictionary;
- (id)title;
- (id)verboseDescription;
@end

@implementation MCDefaultsPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.defaults.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"DEFAULTS_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"DEFAULTS_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isAllowedToWriteDefaults
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

- (MCDefaultsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v63.receiver = self;
  v63.super_class = (Class)MCDefaultsPayload;
  v10 = [(MCPayload *)&v63 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_51;
  }
  id v62 = 0;
  v11 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v62];
  id v12 = v62;
  if (v12) {
    goto LABEL_42;
  }
  v13 = [(MCPayload *)v10 profile];
  char v14 = [v13 isStub];

  if ((v14 & 1) == 0 && v11 && ![(MCDefaultsPayload *)v10 isAllowedToWriteDefaults])
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    v32 = [v9 friendlyName];
    defaultsByDomain = MCErrorArray(@"ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID", v33, v34, v35, v36, v37, v38, v39, v32);
    v40 = [v31 MCErrorWithDomain:@"MCDefaultsErrorDomain" code:10001 descriptionArray:defaultsByDomain errorType:@"MCFatalError"];
    id v12 = (id)[v40 MCCopyAsPrimaryError];

    v15 = v32;
    goto LABEL_40;
  }
  if ([v11 count]) {
    v15 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  }
  else {
    v15 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    defaultsByDomain = +[MCPayload badFieldTypeErrorWithField:@"DefaultsData"];
    id v12 = (id)[defaultsByDomain MCCopyAsPrimaryError];
    goto LABEL_40;
  }
  id v55 = v9;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v11;
  uint64_t v16 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (!v16)
  {
LABEL_28:

    id v9 = v55;
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v59;
  v54 = v11;
  v57 = v15;
LABEL_12:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v59 != v18) {
      objc_enumerationMutation(obj);
    }
    v20 = *(void **)(*((void *)&v58 + 1) + 8 * v19);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = +[MCPayload badFieldTypeErrorWithField:@"PayloadContent"];
      id v12 = (id)[v21 MCCopyAsPrimaryError];
      goto LABEL_38;
    }
    v21 = [v20 objectForKey:@"DefaultsDomainName"];
    if (!v21)
    {
      v26 = [(MCPayload *)v10 profile];
      char v27 = [v26 isStub];

      if ((v27 & 1) == 0)
      {
        v22 = +[MCPayload missingFieldErrorWithField:@"DefaultsDomainName" underlyingError:0];
        id v12 = (id)[v22 MCCopyAsPrimaryError];
        goto LABEL_37;
      }
      goto LABEL_26;
    }
    v22 = [v20 objectForKey:@"DefaultsData"];
    if (!v22) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v41 = +[MCPayload badFieldTypeErrorWithField:@"DefaultsData"];
      goto LABEL_35;
    }
    v23 = v57;
    v24 = [(NSDictionary *)v57 objectForKey:v21];
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = +[MCPayload badFieldTypeErrorWithField:@"DefaultsData"];
        id v12 = (id)[v42 MCCopyAsPrimaryError];

        goto LABEL_36;
      }
      v25 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v24];
      [v25 addEntriesFromDictionary:v22];

      v22 = v25;
      v23 = v57;
    }
    [(NSDictionary *)v23 setObject:v22 forKey:v21];

LABEL_26:
    if (v17 == ++v19)
    {
      uint64_t v17 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      v11 = v54;
      v15 = v57;
      if (v17) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  v28 = [(MCPayload *)v10 profile];
  char v29 = [v28 isStub];

  if (v29) {
    goto LABEL_26;
  }
  v41 = +[MCPayload missingFieldErrorWithField:@"DefaultsData" underlyingError:0];
LABEL_35:
  v24 = v41;
  id v12 = (id)[v41 MCCopyAsPrimaryError];
LABEL_36:

LABEL_37:
LABEL_38:
  v11 = v54;
  id v9 = v55;
  v15 = v57;

  if (v12) {
    goto LABEL_41;
  }
LABEL_39:
  v15 = v15;
  id v12 = 0;
  defaultsByDomain = v10->_defaultsByDomain;
  v10->_defaultsByDomain = v15;
LABEL_40:

LABEL_41:
  if (v12)
  {
LABEL_42:
    v43 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v44 = v43;
    if (a5) {
      *a5 = v43;
    }
    v45 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v46 = v45;
      v47 = objc_opt_class();
      id v48 = v47;
      v49 = [v44 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v65 = v47;
      __int16 v66 = 2114;
      id v67 = v49;
      _os_log_impl(&dword_1A13F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }
  if ([v8 count])
  {
    v50 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v51 = v50;
      v52 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v65 = v52;
      __int16 v66 = 2114;
      id v67 = v8;
      _os_log_impl(&dword_1A13F0000, v51, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_51:
  return v10;
}

- (id)stubDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MCDefaultsPayload;
  uint64_t v16 = [(MCPayload *)&v21 stubDictionary];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(MCDefaultsPayload *)self domains];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(MCDefaultsPayload *)self domains];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(MCDefaultsPayload *)self defaultsForDomain:v11];
        v13 = (void *)v12;
        if (v12)
        {
          v22[0] = @"DefaultsDomainName";
          v22[1] = @"DefaultsData";
          v23[0] = v11;
          v23[1] = v12;
          char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v8);
  }

  [v16 setObject:v5 forKey:@"PayloadContent"];
  return v16;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCDefaultsPayload;
  uint64_t v3 = [(MCPayload *)&v6 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_defaultsByDomain) {
    [v4 appendFormat:@"\ndefaults: %@", self->_defaultsByDomain];
  }
  return v4;
}

- (id)domains
{
  return [(NSDictionary *)self->_defaultsByDomain allKeys];
}

- (id)defaultsForDomain:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSDictionary objectForKey:](self->_defaultsByDomain, "objectForKey:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)title
{
  uint64_t v2 = NSString;
  uint64_t v3 = MCLocalizedString(@"DEFAULTS_DESCRIPTION_SINGULAR_FORMAT");
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", v3, 0);

  return v4;
}

- (void).cxx_destruct
{
}

@end
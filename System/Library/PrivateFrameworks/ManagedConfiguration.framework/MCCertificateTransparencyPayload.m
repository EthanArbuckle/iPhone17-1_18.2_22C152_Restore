@interface MCCertificateTransparencyPayload
+ (BOOL)isValidDomainRule:(id)a3;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCCertificateTransparencyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)domainRules;
- (NSArray)hashDictionaries;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)verboseDescription;
@end

@implementation MCCertificateTransparencyPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.security.certificatetransparency";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CERTIFICATE_TRANSPARENCY_DESCRIPTION_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CERTIFICATE_TRANSPARENCY_DESCRIPTION_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCertificateTransparencyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MCCertificateTransparencyPayload;
  v10 = [(MCPayload *)&v82 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_54;
  }
  id v71 = [MEMORY[0x1E4F1CA48] array];
  v11 = [MEMORY[0x1E4F1CA48] array];
  id v81 = 0;
  v12 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"DisabledForCerts" isRequired:0 outError:&v81];
  id v13 = v81;
  if (v13) {
    goto LABEL_45;
  }
  if (!v12)
  {
    v27 = 0;
    goto LABEL_30;
  }
  id v63 = v9;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (!v14)
  {
    v27 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v78;
  uint64_t v67 = *MEMORY[0x1E4F3B950];
  uint64_t v66 = *MEMORY[0x1E4F3B958];
  v64 = v12;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v78 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      id v19 = [v18 objectForKeyedSubscript:@"Algorithm"];
      if (!v19)
      {
        uint64_t v28 = [(id)objc_opt_class() missingFieldErrorWithField:@"Algorithm" underlyingError:0];
LABEL_24:
        v27 = (void *)v28;
        v12 = v64;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v28 = +[MCPayload badFieldTypeErrorWithField:@"Algorithm"];
        goto LABEL_24;
      }
      id v19 = v19;
      if ([v19 isEqualToString:@"sha256"])
      {
        v20 = [v18 objectForKeyedSubscript:@"Hash"];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v84[0] = v67;
            v84[1] = v66;
            v85[0] = v19;
            v85[1] = v20;
            v21 = (void *)MEMORY[0x1E4F1C9E8];
            id v22 = v20;
            v23 = [v21 dictionaryWithObjects:v85 forKeys:v84 count:2];

            [v71 addObject:v23];
            goto LABEL_17;
          }
          uint64_t v29 = +[MCPayload badFieldTypeErrorWithField:@"Hash"];
        }
        else
        {
          uint64_t v29 = [(id)objc_opt_class() missingFieldErrorWithField:@"Hash" underlyingError:0];
        }
        v27 = (void *)v29;

        v12 = v64;
LABEL_28:

        goto LABEL_29;
      }
      v24 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138412546;
        v87 = v26;
        __int16 v88 = 2112;
        id v89 = v19;
        _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_DEFAULT, "Payload \"%@\" has an unsupported hash algorithm \"%@\". The hash will be ignored.", buf, 0x16u);
      }
LABEL_17:
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
    v27 = 0;
    v12 = v64;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_29:

  id v9 = v63;
LABEL_30:
  id v76 = v27;
  v30 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"DisabledForDomains" isRequired:0 allowZeroLengthString:0 outError:&v76];
  id v13 = v76;

  if (v13)
  {

    goto LABEL_45;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    v65 = v12;
    uint64_t v34 = *(void *)v73;
    while (2)
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v73 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v72 + 1) + 8 * j);
        if (([(id)objc_opt_class() isValidDomainRule:v36] & 1) == 0)
        {
          id obja = (id)MEMORY[0x1E4F28C58];
          [v9 friendlyName];
          v38 = id v37 = v9;
          v46 = MCErrorArray(@"ERROR_CERTIFICATE_TRANSPARENCY_BAD_DOMAIN", v39, v40, v41, v42, v43, v44, v45, v38);
          v47 = [obja MCErrorWithDomain:@"MCCertificateTransparencyErrorDomain" code:53000 descriptionArray:v46 errorType:@"MCFatalError"];
          id v13 = (id)[v47 MCCopyAsPrimaryError];

          id v9 = v37;
          goto LABEL_42;
        }
        [v11 addObject:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v33) {
        continue;
      }
      break;
    }
    id v13 = 0;
LABEL_42:
    v12 = v65;
  }
  else
  {
    id v13 = 0;
  }

  objc_storeStrong((id *)&v10->_hashDictionaries, v71);
  objc_storeStrong((id *)&v10->_domainRules, v11);

  if (v13)
  {
LABEL_45:
    v48 = [(MCPayload *)v10 malformedPayloadErrorWithError:v13];
    v49 = v48;
    if (a5) {
      *a5 = v48;
    }
    v50 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v51 = v50;
      v52 = objc_opt_class();
      id objb = v52;
      [v49 MCVerboseDescription];
      v53 = v10;
      id v54 = v8;
      v55 = v11;
      v56 = v12;
      v58 = id v57 = v9;
      *(_DWORD *)buf = 138412546;
      v87 = v52;
      __int16 v88 = 2112;
      id v89 = v58;
      _os_log_impl(&dword_1A13F0000, v51, OS_LOG_TYPE_ERROR, "%@ Can't parse payload: %@", buf, 0x16u);

      id v9 = v57;
      v12 = v56;
      v11 = v55;
      id v8 = v54;
      v10 = v53;
    }
    v10 = 0;
  }
  if ([v8 count])
  {
    v59 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v60 = v59;
      v61 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138412546;
      v87 = v61;
      __int16 v88 = 2112;
      id v89 = v8;
      _os_log_impl(&dword_1A13F0000, v60, OS_LOG_TYPE_INFO, "Payload “%@” contains ignored fields. They are: %@", buf, 0x16u);
    }
  }

LABEL_54:
  return v10;
}

+ (BOOL)isValidDomainRule:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"."])
  {
    if ([v3 length] == 1)
    {
      BOOL v4 = 0;
    }
    else
    {
      [v3 substringFromIndex:1];
      BOOL v4 = _CFHostIsDomainTopLevelForCertificatePolicy() == 0;
    }
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)stubDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MCCertificateTransparencyPayload;
  uint64_t v15 = [(MCPayload *)&v21 stubDictionary];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_hashDictionaries, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_hashDictionaries;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F3B950];
    uint64_t v8 = *MEMORY[0x1E4F3B958];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v22[0] = @"Algorithm";
        v11 = [v10 objectForKeyedSubscript:v7];
        v22[1] = @"Hash";
        v23[0] = v11;
        v12 = [v10 objectForKeyedSubscript:v8];
        v23[1] = v12;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        [v3 addObject:v13];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v5);
  }

  [v15 setObject:v3 forKeyedSubscript:@"DisabledForCerts"];
  [v15 setObject:self->_domainRules forKeyedSubscript:@"DisabledForDomains"];

  return v15;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCCertificateTransparencyPayload;
  id v3 = [(MCPayload *)&v6 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_hashDictionaries) {
    [v4 appendFormat:@"\nhashDictionaries:\n%@", self->_hashDictionaries];
  }
  if (self->_domainRules) {
    [v4 appendFormat:@"\ndomainRules:\n%@", self->_domainRules];
  }
  return v4;
}

- (id)subtitle1Label
{
  NSUInteger v3 = [(NSArray *)self->_hashDictionaries count];
  NSUInteger v4 = [(NSArray *)self->_domainRules count] + v3;
  if (v4)
  {
    if (v4 == 1) {
      uint64_t v5 = @"CERTIFICATE_TRANSPARENCY_EXCEPTION_SINGULAR";
    }
    else {
      uint64_t v5 = @"CERTIFICATE_TRANSPARENCY_EXCEPTION_PLURAL";
    }
    objc_super v6 = MCLocalizedString(v5);
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (NSArray)hashDictionaries
{
  return self->_hashDictionaries;
}

- (NSArray)domainRules
{
  return self->_domainRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainRules, 0);
  objc_storeStrong((id *)&self->_hashDictionaries, 0);
}

@end
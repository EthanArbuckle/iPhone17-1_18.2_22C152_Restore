@interface MCSCEPPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isIdentity;
- (BOOL)isRoot;
- (MCSCEPPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)CACaps;
- (NSArray)subject;
- (NSData)CAFingerprint;
- (NSDictionary)subjectAltName;
- (NSString)CAInstanceName;
- (NSString)URLString;
- (NSString)challenge;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (int)usageFlags;
- (unint64_t)keySize;
- (unint64_t)retries;
- (unint64_t)retryDelay;
@end

@implementation MCSCEPPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.security.scep"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SCEP_ENROLLMENT_REQUEST_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SCEP_ENROLLMENT_REQUEST_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (MCSCEPPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v107.receiver = self;
  v107.super_class = (Class)MCSCEPPayload;
  v10 = [(MCCertificatePayload *)&v107 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_48;
  }
  if (([v9 isStub] & 1) == 0)
  {
    id v106 = 0;
    v13 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v106];
    id v12 = v106;
    v14 = (void *)[v13 mutableCopy];
    v15 = v14;
    if (v12)
    {

      goto LABEL_43;
    }
    id v105 = 0;
    uint64_t v16 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v14 key:@"URL" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v105];
    id v12 = v105;
    URLString = v10->_URLString;
    v10->_URLString = (NSString *)v16;

    v94 = v15;
    uint64_t v18 = [v15 objectForKey:@"Keysize"];
    v93 = (void *)v18;
    if (v18)
    {
      v26 = (void *)v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        int v34 = [v26 intValue];
        v10->_keySize = v34;
        if (v34 == 1024)
        {
          v42 = v94;
        }
        else
        {
          v42 = v94;
          if (v34 != 2048 && v34 != 4096)
          {
            v90 = (void *)MEMORY[0x1E4F28C58];
            v43 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD", v35, v36, v37, v38, v39, v40, v41, @"Keysize");
            uint64_t v91 = [v90 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v43 errorType:@"MCFatalError"];

            id v12 = (id)v91;
          }
        }
        if (v12)
        {
          int v51 = 2;
          goto LABEL_38;
        }
        id v104 = 0;
        uint64_t v52 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v42 key:@"Name" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v104];
        id v50 = v104;
        CAInstanceName = v10->_CAInstanceName;
        v10->_CAInstanceName = (NSString *)v52;

        if (!v50)
        {
          id v103 = 0;
          uint64_t v54 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v42 key:@"Challenge" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v103];
          id v50 = v103;
          challenge = v10->_challenge;
          v10->_challenge = (NSString *)v54;

          if (!v50)
          {
            id v102 = 0;
            uint64_t v56 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"Subject" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v102];
            id v50 = v102;
            subject = v10->_subject;
            v10->_subject = (NSArray *)v56;

            if (!v50)
            {
              id v101 = 0;
              uint64_t v58 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"SubjectAltName" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v101];
              id v50 = v101;
              subjectAltName = v10->_subjectAltName;
              v10->_subjectAltName = (NSDictionary *)v58;

              if (!v50)
              {
                id v100 = 0;
                uint64_t v60 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"CAFingerprint" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v100];
                id v50 = v100;
                CAFingerprint = v10->_CAFingerprint;
                v10->_CAFingerprint = (NSData *)v60;

                if (!v50)
                {
                  id v99 = 0;
                  uint64_t v62 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"GetCACaps" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v99];
                  id v50 = v99;
                  CACaps = v10->_CACaps;
                  v10->_CACaps = (NSArray *)v62;

                  if (!v50)
                  {
                    id v98 = 0;
                    v64 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"Key Usage" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v98];
                    id v50 = v98;
                    v92 = v64;
                    if (v64)
                    {
                      int v65 = [v64 unsignedIntValue];
                      v10->_usageFlags = v65;
                      if ((v65 & 0xFFFFFFFA) != 0)
                      {
                        v66 = (void *)MEMORY[0x1E4F28C58];
                        id v12 = [v9 friendlyName];
                        v74 = MCErrorArray(@"SCEP_ERROR_INVALID_USAGE_FLAG_P_FIELD", v67, v68, v69, v70, v71, v72, v73, v12);
                        uint64_t v75 = [v66 MCErrorWithDomain:@"MCSCEPErrorDomain" code:22000 descriptionArray:v74 errorType:@"MCFatalError"];

                        int v51 = 2;
                        id v50 = (id)v75;
                        v42 = v94;
                        goto LABEL_58;
                      }
                      v42 = v94;
                      if (v50) {
                        goto LABEL_27;
                      }
LABEL_33:
                      id v97 = 0;
                      id v12 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"Retries" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v97];
                      id v76 = v97;
                      if (v76)
                      {
                        id v50 = v76;
                        goto LABEL_35;
                      }
                      if (v12) {
                        uint64_t v88 = [v12 unsignedIntValue];
                      }
                      else {
                        uint64_t v88 = 3;
                      }
                      v10->_retries = v88;
                      id v96 = 0;
                      v74 = +[MCProfile removeOptionalObjectInDictionary:v42 key:@"RetryDelay" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v96];
                      id v50 = v96;
                      if (v50)
                      {
                        int v51 = 2;
                      }
                      else
                      {
                        if (v74) {
                          uint64_t v89 = [v74 unsignedIntValue];
                        }
                        else {
                          uint64_t v89 = 10;
                        }
                        int v51 = 0;
                        v10->_retryDelay = v89;
                      }
LABEL_58:

                      goto LABEL_36;
                    }
                    v42 = v94;
                  }
                }
              }
            }
          }
        }
        v92 = 0;
        v10->_usageFlags = 1;
        if (v50)
        {
LABEL_27:
          id v12 = 0;
LABEL_35:
          int v51 = 2;
LABEL_36:
          v47 = v92;
          goto LABEL_37;
        }
        goto LABEL_33;
      }
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD", v27, v28, v29, v30, v31, v32, v33, @"Keysize");
      v46 = v49;
      v47 = (void *)v45;
      uint64_t v48 = 2003;
    }
    else
    {
      v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = MCErrorArray(@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD", v19, v20, v21, v22, v23, v24, v25, @"Keysize");
      v46 = v44;
      v47 = (void *)v45;
      uint64_t v48 = 2002;
    }
    id v50 = [v46 MCErrorWithDomain:@"MCPayloadErrorDomain" code:v48 descriptionArray:v45 errorType:@"MCFatalError"];
    int v51 = 2;
    v42 = v94;
LABEL_37:

    id v12 = v50;
LABEL_38:

    if (v51) {
      goto LABEL_42;
    }
    goto LABEL_39;
  }
  id v95 = 0;
  v11 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Keysize" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v95];
  id v12 = v95;
  v10->_keySize = [v11 unsignedIntValue];

  if (!v12)
  {
LABEL_39:
    if ([v8 count])
    {
      v77 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v78 = v77;
        v79 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v109 = v79;
        __int16 v110 = 2114;
        id v111 = v8;
        _os_log_impl(&dword_1A13F0000, v78, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
      }
    }
LABEL_42:
    if (!v12) {
      goto LABEL_48;
    }
  }
LABEL_43:
  v80 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
  v81 = v80;
  if (a5) {
    *a5 = v80;
  }
  v82 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v83 = v82;
    v84 = objc_opt_class();
    id v85 = v84;
    v86 = [v81 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v109 = v84;
    __int16 v110 = 2114;
    id v111 = v86;
    _os_log_impl(&dword_1A13F0000, v83, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_48:

  return v10;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCSCEPPayload;
  uint64_t v3 = [(MCCertificatePayload *)&v6 stubDictionary];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_keySize];
  [v3 setObject:v4 forKey:@"Keysize"];

  return v3;
}

- (id)verboseDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MCSCEPPayload;
  uint64_t v3 = [(MCCertificatePayload *)&v8 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_URLString) {
    [v4 appendFormat:@"URL         : %@\n", self->_URLString];
  }
  if (self->_CAInstanceName) {
    [v4 appendFormat:@"CA Instance : %@\n", self->_CAInstanceName];
  }
  uint64_t v5 = [(NSData *)self->_CAFingerprint MCHexString];

  if (v5)
  {
    objc_super v6 = [(NSData *)self->_CAFingerprint MCHexString];
    [v4 appendFormat:@"Fingerprint : %@\n", v6];
  }
  if (self->_CACaps) {
    [v4 appendFormat:@"CA Caps     : %@\n", self->_CACaps];
  }
  if (self->_challenge) {
    [v4 appendFormat:@"Challenge   : (present)\n"];
  }
  if (self->_subject) {
    [v4 appendFormat:@"Subject     : %@\n", self->_subject];
  }
  if (self->_subjectAltName) {
    [v4 appendFormat:@"Subject Alt : %@\n", self->_subjectAltName];
  }
  objc_msgSend(v4, "appendFormat:", @"Key size    : %u\n", self->_keySize);
  objc_msgSend(v4, "appendFormat:", @"Retries     : %u\n", self->_retries);
  objc_msgSend(v4, "appendFormat:", @"RetryDelay  : %u\n", self->_retryDelay);
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if (self->_URLString)
  {
    uint64_t v4 = [MCKeyValue alloc];
    URLString = self->_URLString;
    objc_super v6 = MCLocalizedString(@"URL");
    uint64_t v7 = [(MCKeyValue *)v4 initWithLocalizedString:URLString localizedKey:v6];

    [v3 addObject:v7];
  }
  if (self->_CAInstanceName)
  {
    objc_super v8 = [MCKeyValue alloc];
    CAInstanceName = self->_CAInstanceName;
    v10 = MCLocalizedString(@"CA_INSTANCE_NAME");
    v11 = [(MCKeyValue *)v8 initWithLocalizedString:CAInstanceName localizedKey:v10];

    [v3 addObject:v11];
  }
  if (self->_CAFingerprint)
  {
    id v12 = [MCKeyValue alloc];
    CAFingerprint = self->_CAFingerprint;
    v14 = MCLocalizedString(@"CA_FINGERPRINT");
    v15 = [(MCKeyValue *)v12 initWithData:CAFingerprint localizedKey:v14];

    [v3 addObject:v15];
  }
  if (self->_challenge)
  {
    uint64_t v16 = [MCKeyValue alloc];
    v17 = MCLocalizedString(@"PRESENT");
    uint64_t v18 = MCLocalizedString(@"CHALLENGE");
    uint64_t v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v3 addObject:v19];
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_keySize];
  uint64_t v22 = [v20 localizedStringFromNumber:v21 numberStyle:0];

  uint64_t v23 = [MCKeyValue alloc];
  uint64_t v24 = MCLocalizedString(@"KEY_SIZE");
  uint64_t v25 = [(MCKeyValue *)v23 initWithLocalizedString:v22 localizedKey:v24];
  [v3 addObject:v25];

  v26 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v29[0] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

  return v27;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSString)CAInstanceName
{
  return self->_CAInstanceName;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSArray)subject
{
  return self->_subject;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (int)usageFlags
{
  return self->_usageFlags;
}

- (NSData)CAFingerprint
{
  return self->_CAFingerprint;
}

- (NSArray)CACaps
{
  return self->_CACaps;
}

- (NSDictionary)subjectAltName
{
  return self->_subjectAltName;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (unint64_t)retryDelay
{
  return self->_retryDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectAltName, 0);
  objc_storeStrong((id *)&self->_CACaps, 0);
  objc_storeStrong((id *)&self->_CAFingerprint, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_CAInstanceName, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end
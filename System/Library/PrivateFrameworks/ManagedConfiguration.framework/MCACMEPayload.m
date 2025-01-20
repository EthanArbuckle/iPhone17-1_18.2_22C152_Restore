@interface MCACMEPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)attest;
- (BOOL)isHardwareBound;
- (BOOL)isIdentity;
- (BOOL)isRoot;
- (MCACMEPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)extendedKeyUsage;
- (NSArray)subject;
- (NSDictionary)subjectAltName;
- (NSString)clientIdentifier;
- (NSString)directoryURLString;
- (NSString)keyType;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)verboseDescription;
- (unint64_t)keySize;
- (unsigned)usageFlags;
@end

@implementation MCACMEPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.security.acme"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"ACME_REQUEST_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"ACME_REQUEST_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (MCACMEPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v117.receiver = self;
  v117.super_class = (Class)MCACMEPayload;
  v10 = [(MCCertificatePayload *)&v117 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_14;
  }
  id v116 = 0;
  v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"HardwareBound" isRequired:1 outError:&v116];
  id v12 = v116;
  if (v12) {
    goto LABEL_3;
  }
  v10->_isHardwareBound = [v11 BOOLValue];
  if ([v9 isStub])
  {
    id v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  id v115 = 0;
  uint64_t v23 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DirectoryURL" isRequired:1 outError:&v115];
  id v12 = v115;
  directoryURLString = v10->_directoryURLString;
  v10->_directoryURLString = (NSString *)v23;

  if (v12) {
    goto LABEL_3;
  }
  v25 = [MEMORY[0x1E4F1CB10] URLWithString:v10->_directoryURLString];
  v26 = v25;
  if (v25
    && ([v25 scheme],
        v27 = objc_claimAutoreleasedReturnValue(),
        uint64_t v28 = [v27 caseInsensitiveCompare:@"https"],
        v27,
        !v28))
  {
    v29 = 0;
  }
  else
  {
    v29 = +[MCPayload badFieldValueErrorWithField:@"DirectoryURL"];
  }
  id v114 = v29;
  uint64_t v30 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ClientIdentifier" isRequired:1 outError:&v114];
  id v12 = v114;

  clientIdentifier = v10->_clientIdentifier;
  v10->_clientIdentifier = (NSString *)v30;

  if (v12
    || (id v113 = 0,
        [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"KeyType" isRequired:1 outError:&v113], v32 = objc_claimAutoreleasedReturnValue(), id v12 = v113, keyType = v10->_keyType, v10->_keyType = (NSString *)v32, keyType, v12))
  {

LABEL_3:
LABEL_4:
    v13 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v11 = v13;
    if (a5) {
      *a5 = v13;
    }
    v14 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = objc_opt_class();
      id v17 = v16;
      v18 = [v11 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v119 = v16;
      __int16 v120 = 2114;
      id v121 = v18;
      _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_9;
  }
  if (![(NSString *)v10->_keyType isEqualToString:@"RSA"]
    && ![(NSString *)v10->_keyType isEqualToString:@"ECSECPrimeRandom"])
  {
    id v12 = +[MCPayload badFieldTypeErrorWithField:@"KeyType"];
    goto LABEL_87;
  }
  id v112 = 0;
  v34 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"KeySize" isRequired:1 outError:&v112];
  id v12 = v112;
  if (!v12)
  {
    v88 = v34;
    uint64_t v35 = [v34 integerValue];
    if (v35 < 0)
    {
      id v12 = +[MCPayload badFieldValueErrorWithField:@"KeySize"];
LABEL_85:
      v34 = v88;
      goto LABEL_86;
    }
    v10->_unint64_t keySize = v35;
    id v111 = 0;
    uint64_t v36 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Subject" isRequired:1 outError:&v111];
    id v12 = v111;
    subject = v10->_subject;
    v10->_subject = (NSArray *)v36;

    v34 = v88;
    if (!v12)
    {
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      v38 = v10->_subject;
      uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v107 objects:v127 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v108;
        uint64_t v78 = *(void *)v108;
        do
        {
          uint64_t v77 = v39;
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v108 != v40)
            {
              uint64_t v42 = v41;
              objc_enumerationMutation(v38);
              uint64_t v41 = v42;
            }
            uint64_t v82 = v41;
            v43 = *(void **)(*((void *)&v107 + 1) + 8 * v41);
            long long v103 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v44 = v43;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v103 objects:v126 count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v104;
              v79 = v38;
              uint64_t v76 = *(void *)v104;
              obuint64_t j = v44;
              while (2)
              {
                uint64_t v75 = v45;
                uint64_t v47 = 0;
                do
                {
                  if (*(void *)v104 != v46) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v80 = v47;
                  v48 = *(void **)(*((void *)&v103 + 1) + 8 * v47);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    id v12 = +[MCPayload badFieldTypeErrorWithField:@"Subject"];
LABEL_77:

                    goto LABEL_85;
                  }
                  long long v101 = 0u;
                  long long v102 = 0u;
                  long long v99 = 0u;
                  long long v100 = 0u;
                  id v86 = v48;
                  uint64_t v49 = [v86 countByEnumeratingWithState:&v99 objects:v125 count:16];
                  if (v49)
                  {
                    uint64_t v50 = v49;
                    uint64_t v89 = *(void *)v100;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v50; ++i)
                      {
                        if (*(void *)v100 != v89) {
                          objc_enumerationMutation(v86);
                        }
                        v52 = *(void **)(*((void *)&v99 + 1) + 8 * i);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0 || ![v52 length])
                        {
                          id v12 = +[MCPayload badFieldTypeErrorWithField:@"Subject"];

                          goto LABEL_77;
                        }
                      }
                      uint64_t v50 = [v86 countByEnumeratingWithState:&v99 objects:v125 count:16];
                      if (v50) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v47 = v80 + 1;
                  uint64_t v46 = v76;
                }
                while (v80 + 1 != v75);
                id v44 = obj;
                uint64_t v45 = [obj countByEnumeratingWithState:&v103 objects:v126 count:16];
                uint64_t v46 = v76;
                v38 = v79;
                if (v45) {
                  continue;
                }
                break;
              }
            }

            uint64_t v41 = v82 + 1;
            uint64_t v40 = v78;
          }
          while (v82 + 1 != v77);
          uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v107 objects:v127 count:16];
          uint64_t v40 = v78;
        }
        while (v39);
      }

      id v98 = 0;
      v53 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SubjectAltName" isRequired:0 outError:&v98];
      id v12 = v98;
      if (v12) {
        goto LABEL_84;
      }
      id obja = v11;
      id v87 = v53;
      uint64_t v54 = [v53 mutableCopy];
      v123[0] = @"dNSName";
      v124[0] = objc_opt_class();
      v123[1] = @"ntPrincipalName";
      v124[1] = objc_opt_class();
      v123[2] = @"rfc822Name";
      v124[2] = objc_opt_class();
      v123[3] = @"uniformResourceIdentifier";
      v124[3] = objc_opt_class();
      uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:4];
      v97[1] = 0;
      v56 = (void *)v54;
      v57 = (void *)v54;
      v58 = (void *)v55;
      uint64_t v59 = objc_msgSend(v57, "MCMutableDictionaryContainingValidatedKeysAndClasses:removeKeys:outError:");
      id v60 = 0;
      subjectAltName = v10->_subjectAltName;
      v90 = v10;
      v10->_subjectAltName = (NSDictionary *)v59;

      id v62 = v60;
      if (v60)
      {
LABEL_83:

        id v12 = v62;
        v11 = obja;
        v10 = v90;
        v53 = v87;
LABEL_84:

        goto LABEL_85;
      }
      v97[0] = 0;
      v81 = v8;
      v63 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"UsageFlags" isRequired:0 outError:v97];
      id v62 = v97[0];
      if (v62) {
        goto LABEL_82;
      }
      v90->_usageFlags = [v63 unsignedIntValue];
      id v96 = 0;
      uint64_t v64 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"ExtendedKeyUsage" isRequired:0 outError:&v96];
      id v65 = v96;
      extendedKeyUsage = v90->_extendedKeyUsage;
      v90->_extendedKeyUsage = (NSArray *)v64;

      id v62 = v65;
      if (v65)
      {
LABEL_82:

        id v8 = v81;
        goto LABEL_83;
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v67 = v90->_extendedKeyUsage;
      uint64_t v68 = [(NSArray *)v67 countByEnumeratingWithState:&v92 objects:v122 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v83 = *(void *)v93;
        while (2)
        {
          for (uint64_t j = 0; j != v69; ++j)
          {
            if (*(void *)v93 != v83) {
              objc_enumerationMutation(v67);
            }
            if (![*(id *)(*((void *)&v92 + 1) + 8 * j) length])
            {
              id v71 = +[MCPayload badFieldValueErrorWithField:@"ExtendedKeyUsage"];
              goto LABEL_80;
            }
          }
          uint64_t v69 = [(NSArray *)v67 countByEnumeratingWithState:&v92 objects:v122 count:16];
          if (v69) {
            continue;
          }
          break;
        }
      }

      id v91 = 0;
      v67 = [v81 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Attest" isRequired:0 outError:&v91];
      id v71 = v91;
      if (v71) {
        goto LABEL_80;
      }
      v90->_attest = [(NSArray *)v67 BOOLValue];
      if (!v90->_isHardwareBound) {
        goto LABEL_104;
      }
      if (![(NSString *)v90->_keyType isEqualToString:@"ECSECPrimeRandom"])
      {
        v73 = @"KeyType";
        goto LABEL_101;
      }
      if ((v90->_keySize | 0x80) == 0x180)
      {
LABEL_104:
        if ([(NSString *)v90->_keyType isEqualToString:@"RSA"])
        {
          unint64_t keySize = v90->_keySize;
          if ((keySize & 7) != 0 || keySize - 4097 <= 0xFFFFFFFFFFFFF3FELL) {
            goto LABEL_73;
          }
        }
        else if ([(NSString *)v90->_keyType isEqualToString:@"ECSECPrimeRandom"])
        {
          uint64_t v74 = v90->_keySize;
          if (v74 > 383)
          {
            if (v74 != 384 && v74 != 521) {
              goto LABEL_73;
            }
          }
          else if (v74 != 192 && v74 != 256)
          {
            goto LABEL_73;
          }
        }
        if (!v90->_attest || v90->_isHardwareBound)
        {
          id v62 = 0;
          goto LABEL_81;
        }
        v73 = @"Attest";
        goto LABEL_101;
      }
LABEL_73:
      v73 = @"KeySize";
LABEL_101:
      id v71 = +[MCPayload badFieldTypeErrorWithField:v73];
LABEL_80:
      id v62 = v71;
LABEL_81:

      goto LABEL_82;
    }
  }
LABEL_86:

LABEL_87:
  if (v12) {
    goto LABEL_4;
  }
LABEL_10:
  if ([v8 count])
  {
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      v21 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v119 = v21;
      __int16 v120 = 2114;
      id v121 = v8;
      _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_14:
  return v10;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCACMEPayload;
  uint64_t v3 = [(MCCertificatePayload *)&v6 stubDictionary];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isHardwareBound];
  [v3 setObject:v4 forKey:@"HardwareBound"];

  return v3;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCACMEPayload;
  uint64_t v3 = [(MCCertificatePayload *)&v6 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_directoryURLString) {
    [v4 appendFormat:@"DirectoryURL  : %@\n", self->_directoryURLString];
  }
  if (self->_clientIdentifier) {
    [v4 appendFormat:@"Identifier    : %@\n", self->_clientIdentifier];
  }
  if (self->_keyType) {
    [v4 appendFormat:@"KeyType       : %@\n", self->_keyType];
  }
  if (self->_keySize) {
    objc_msgSend(v4, "appendFormat:", @"KeySize       : %lu\n", self->_keySize);
  }
  if (self->_isHardwareBound) {
    objc_msgSend(v4, "appendFormat:", @"HardwareBound : %i\n", 1);
  }
  if (self->_subject) {
    [v4 appendFormat:@"Subject       : %@\n", self->_subject];
  }
  if (self->_subjectAltName) {
    [v4 appendFormat:@"SAN           : %@\n", self->_subjectAltName];
  }
  if (self->_usageFlags) {
    objc_msgSend(v4, "appendFormat:", @"UsageFlags    : %u\n", self->_usageFlags);
  }
  if (self->_extendedKeyUsage) {
    [v4 appendFormat:@"EKU           : %@\n", self->_extendedKeyUsage];
  }
  return v4;
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCCertificatePayload *)self issuer];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(MCPayload *)self profile];
    int v7 = [v6 isStub];

    if (v7) {
      id v8 = @"ISSUED_BY_MISSING";
    }
    else {
      id v8 = @"IDENTITY_INSTALL_DESCRIPTION_UNKNOWN";
    }
    MCLocalizedString(v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v5;

  return v9;
}

- (id)payloadDescriptionKeyValueSections
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCPayload *)self profile];
  char v5 = [v4 isStub];

  if ((v5 & 1) == 0)
  {
    if (self->_directoryURLString)
    {
      objc_super v6 = [MCKeyValue alloc];
      directoryURLString = self->_directoryURLString;
      id v8 = MCLocalizedString(@"URL");
      id v9 = [(MCKeyValue *)v6 initWithLocalizedString:directoryURLString localizedKey:v8];

      [v3 addObject:v9];
    }
    if (self->super.super._identifier)
    {
      v10 = [MCKeyValue alloc];
      v11 = MCLocalizedString(@"PRESENT");
      id v12 = MCLocalizedString(@"CLIENT_IDENTIFIER");
      v13 = [(MCKeyValue *)v10 initWithLocalizedString:v11 localizedKey:v12];

      [v3 addObject:v13];
    }
    if (self->_keyType)
    {
      v14 = [MCKeyValue alloc];
      keyType = self->_keyType;
      v16 = MCLocalizedString(@"KEY_TYPE");
      id v17 = [(MCKeyValue *)v14 initWithLocalizedString:keyType localizedKey:v16];

      [v3 addObject:v17];
    }
    v18 = (void *)MEMORY[0x1E4F28EE0];
    v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_keySize];
    v20 = [v18 localizedStringFromNumber:v19 numberStyle:0];

    v21 = [MCKeyValue alloc];
    v22 = MCLocalizedString(@"KEY_SIZE");
    uint64_t v23 = [(MCKeyValue *)v21 initWithLocalizedString:v20 localizedKey:v22];

    [v3 addObject:v23];
  }
  v24 = [MCKeyValue alloc];
  v25 = MCLocalizedStringForBool(self->_isHardwareBound);
  v26 = MCLocalizedString(@"HARDWARE_BOUND");
  v27 = [(MCKeyValue *)v24 initWithLocalizedString:v25 localizedKey:v26];

  [v3 addObject:v27];
  uint64_t v28 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v31[0] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

  return v29;
}

- (BOOL)isHardwareBound
{
  return self->_isHardwareBound;
}

- (NSString)directoryURLString
{
  return self->_directoryURLString;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (NSArray)subject
{
  return self->_subject;
}

- (NSDictionary)subjectAltName
{
  return self->_subjectAltName;
}

- (unsigned)usageFlags
{
  return self->_usageFlags;
}

- (NSArray)extendedKeyUsage
{
  return self->_extendedKeyUsage;
}

- (BOOL)attest
{
  return self->_attest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_subjectAltName, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_directoryURLString, 0);
}

@end
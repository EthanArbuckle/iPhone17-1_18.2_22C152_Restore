@interface MCSelfSignedCertificatePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isHardwareBound;
- (BOOL)isIdentity;
- (BOOL)isRoot;
- (MCSelfSignedCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)extendedKeyUsage;
- (NSString)keyType;
- (id)persistentResourceID;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)validateExtendedKeyUsage:(id)a3;
- (id)verboseDescription;
- (unint64_t)keySize;
- (unint64_t)lifetime;
- (unsigned)keyUsage;
@end

@implementation MCSelfSignedCertificatePayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.security.selfsignedcertificate"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SELF_SIGNED_CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SELF_SIGNED_CERTIFICATE_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)validateExtendedKeyUsage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v4)
  {
    v16 = 0;
    goto LABEL_29;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v24;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v24 != v6) {
      objc_enumerationMutation(v3);
    }
    v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = +[MCPayload badFieldTypeErrorWithField:@"ExtendedKeyUsage"];
      goto LABEL_29;
    }
    id v9 = v8;
    if (![v9 count]) {
      goto LABEL_32;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    uint64_t v18 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = +[MCPayload badFieldTypeErrorWithField:@"ExtendedKeyUsage"];
LABEL_27:

          goto LABEL_28;
        }
        id v15 = v14;
        if (![v15 length])
        {
          v16 = +[MCPayload badFieldTypeErrorWithField:@"ExtendedKeyUsage"];

          goto LABEL_27;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v6 = v18;
      if (v11) {
        continue;
      }
      break;
    }
LABEL_20:

LABEL_21:
    if (++v7 == v5)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      v16 = 0;
      if (!v5) {
        goto LABEL_29;
      }
      goto LABEL_3;
    }
  }
  id v9 = v8;
  if ([v9 length]) {
    goto LABEL_21;
  }
LABEL_32:
  v16 = +[MCPayload badFieldTypeErrorWithField:@"ExtendedKeyUsage"];
LABEL_28:

LABEL_29:
  return v16;
}

- (MCSelfSignedCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MCSelfSignedCertificatePayload;
  uint64_t v10 = [(MCCertificatePayload *)&v44 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    id v43 = 0;
    uint64_t v11 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"HardwareBound" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v43];
    id v12 = v43;
    if (v12) {
      goto LABEL_3;
    }
    v10->_isHardwareBound = [v11 BOOLValue];
    if ([v9 isStub])
    {
LABEL_9:

      goto LABEL_10;
    }
    id v42 = 0;
    uint64_t v21 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"KeyType" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v42];
    id v12 = v42;
    keyType = v10->_keyType;
    v10->_keyType = (NSString *)v21;

    if (v12)
    {
LABEL_3:

      uint64_t v11 = v12;
LABEL_4:
      v13 = [(MCPayload *)v10 malformedPayloadErrorWithError:v11];
      v14 = v13;
      if (a5) {
        *a5 = v13;
      }
      id v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = objc_opt_class();
        id v18 = v17;
        long long v19 = [v14 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v46 = v17;
        __int16 v47 = 2114;
        id v48 = v19;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    if (![(NSString *)v10->_keyType isEqualToString:@"RSA"]
      && ![(NSString *)v10->_keyType isEqualToString:@"ECSECPrimeRandom"])
    {
      id v24 = +[MCPayload badFieldTypeErrorWithField:@"KeyType"];
LABEL_20:

      uint64_t v11 = v24;
      if (!v24) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
    id v41 = 0;
    long long v23 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"KeySize" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v41];
    id v24 = v41;
    if (v24)
    {
LABEL_18:

      goto LABEL_20;
    }
    v37 = v23;
    v10->_unint64_t keySize = [v23 unsignedIntegerValue];
    id v40 = 0;
    long long v25 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"KeyUsage" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v40];
    id v24 = v40;
    if (v24)
    {
LABEL_17:

      long long v23 = v37;
      goto LABEL_18;
    }
    if (v25)
    {
      unsigned int v26 = [v25 unsignedIntValue];
      v10->_keyUsage = v26;
      if ((v26 & 0xFFFFFFFA) != 0)
      {
        id v24 = +[MCPayload badFieldTypeErrorWithField:@"KeyUsage"];
        goto LABEL_17;
      }
    }
    else
    {
      long long v25 = 0;
      v10->_keyUsage = 1;
    }
    id v39 = 0;
    uint64_t v36 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"ExtendedKeyUsage" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v39];
    id v24 = v39;
    extendedKeyUsage = v10->_extendedKeyUsage;
    v10->_extendedKeyUsage = (NSArray *)v36;

    if (v24) {
      goto LABEL_17;
    }
    id v24 = [(MCSelfSignedCertificatePayload *)v10 validateExtendedKeyUsage:v10->_extendedKeyUsage];
    if (v24) {
      goto LABEL_17;
    }
    id v38 = 0;
    v28 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Lifetime" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v38];
    id v24 = v38;
    if (v24)
    {
LABEL_53:

      goto LABEL_17;
    }
    if (v28) {
      uint64_t v29 = [v28 unsignedIntegerValue];
    }
    else {
      uint64_t v29 = 315576000;
    }
    v10->_lifetime = v29;
    if (v10->_isHardwareBound)
    {
      if (![(NSString *)v10->_keyType isEqualToString:@"ECSECPrimeRandom"])
      {
        v31 = @"KeyType";
        goto LABEL_40;
      }
      if ((v10->_keySize | 0x80) != 0x180)
      {
LABEL_38:
        v31 = @"KeySize";
LABEL_40:
        id v24 = +[MCPayload badFieldTypeErrorWithField:v31];
        goto LABEL_53;
      }
    }
    if ([(NSString *)v10->_keyType isEqualToString:@"RSA"])
    {
      unint64_t keySize = v10->_keySize;
      if ((keySize & 7) != 0 || keySize - 4097 <= 0xFFFFFFFFFFFFF3FELL) {
        goto LABEL_38;
      }
    }
    else if ([(NSString *)v10->_keyType isEqualToString:@"ECSECPrimeRandom"])
    {
      uint64_t v32 = v10->_keySize;
      if (v32 > 383)
      {
        if (v32 == 384 || v32 == 521) {
          goto LABEL_49;
        }
      }
      else if (v32 == 192 || v32 == 256)
      {
        goto LABEL_49;
      }
      id v24 = +[MCPayload badFieldTypeErrorWithField:@"KeySize"];
      if (v24) {
        goto LABEL_53;
      }
    }
LABEL_49:
    if ([v8 count])
    {
      v33 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        v35 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v46 = v35;
        __int16 v47 = 2114;
        id v48 = v8;
        _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
      }
    }
    id v24 = 0;
    goto LABEL_53;
  }
LABEL_10:

  return v10;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCSelfSignedCertificatePayload;
  id v3 = [(MCCertificatePayload *)&v6 stubDictionary];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isHardwareBound];
  [v3 setObject:v4 forKey:@"HardwareBound"];

  return v3;
}

- (id)verboseDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)MCSelfSignedCertificatePayload;
  uint64_t v4 = [(MCCertificatePayload *)&v10 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  if (self->_isHardwareBound) {
    objc_super v6 = @"Yes";
  }
  else {
    objc_super v6 = @"No";
  }
  [v5 appendFormat:@"Hardware bound : %@\n", v6];
  uint64_t v7 = [(MCCertificatePayload *)self copyCertificate];
  if (v7)
  {
    id v8 = v7;
    [v5 appendFormat:@"Identity       : Present\n"];
    CFRelease(v8);
  }
  else
  {
    [v5 appendFormat:@"Identity       : Missing\n"];
  }
  return v5;
}

- (id)subtitle1Description
{
  id v3 = [(MCCertificatePayload *)self issuer];
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

- (id)persistentResourceID
{
  uint64_t v2 = [(MCCertificatePayload *)self certificatePersistentID];
  id v3 = [v2 MCHexString];

  return v3;
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (BOOL)isHardwareBound
{
  return self->_isHardwareBound;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (unsigned)keyUsage
{
  return self->_keyUsage;
}

- (NSArray)extendedKeyUsage
{
  return self->_extendedKeyUsage;
}

- (unint64_t)lifetime
{
  return self->_lifetime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
}

@end
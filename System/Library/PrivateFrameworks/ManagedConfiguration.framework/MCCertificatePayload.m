@interface MCCertificatePayload
- (BOOL)isFullyTrustedRootCert;
- (BOOL)isHardwareBound;
- (BOOL)isIdentity;
- (BOOL)isMDMClientIdentity;
- (BOOL)isRoot;
- (BOOL)isSigned;
- (MCCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)certificatePersistentID;
- (NSDate)expiry;
- (NSString)SMIMEEmailAddress;
- (NSString)installedOnDeviceID;
- (__SecCertificate)copyCertificate;
- (__SecIdentity)copyIdentityFromKeychain;
- (id)certificateSubject;
- (id)issuer;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)title;
- (id)verboseDescription;
- (void)setCertificatePersistentID:(id)a3;
- (void)setInstalledOnDeviceID:(id)a3;
@end

@implementation MCCertificatePayload

- (MCCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MCCertificatePayload;
  v10 = [(MCPayload *)&v49 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10 || ![v9 isStub]) {
    goto LABEL_21;
  }
  v11 = [v8 objectForKey:@"PERSISTENT_REF"];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
    {
      uint64_t v12 = [v11 objectAtIndex:0];

      v11 = (void *)v12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v10->_certificatePersistentID, v11);
      [v8 removeObjectForKey:@"PERSISTENT_REF"];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      v21 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", v13, v14, v15, v16, v17, v18, v19, @"PERSISTENT_REF");
      id v22 = [v20 MCErrorWithDomain:@"MCProfileErrorDomain" code:1003 descriptionArray:v21 errorType:@"MCFatalError"];

      [v8 removeObjectForKey:@"PERSISTENT_REF"];
      if (v22) {
        goto LABEL_15;
      }
    }
  }
  id v48 = 0;
  uint64_t v23 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"UDID" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v48];
  id v22 = v48;
  installedOnDeviceID = v10->_installedOnDeviceID;
  v10->_installedOnDeviceID = (NSString *)v23;

  if (!v22)
  {
    id v47 = 0;
    uint64_t v25 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"IsIdentity" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v47];
    id v22 = v47;
    isIdentity = v10->_isIdentity;
    v10->_isIdentity = (NSNumber *)v25;

    if (!v22)
    {
      id v46 = 0;
      uint64_t v27 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"IsRoot" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v46];
      id v22 = v46;
      isRoot = v10->_isRoot;
      v10->_isRoot = (NSNumber *)v27;

      if (!v22)
      {
        id v45 = 0;
        uint64_t v29 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Expiry" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v45];
        id v22 = v45;
        expiryInterval = v10->_expiryInterval;
        v10->_expiryInterval = (NSNumber *)v29;

        if (!v22)
        {
          id v44 = 0;
          uint64_t v31 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"CertSubject" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v44];
          id v22 = v44;
          certSubject = v10->_certSubject;
          v10->_certSubject = (NSString *)v31;

          if (!v22)
          {
            id v43 = 0;
            uint64_t v41 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Issuer" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v43];
            id v22 = v43;
            certIssuer = v10->_certIssuer;
            v10->_certIssuer = (NSString *)v41;

            if (!v22) {
              goto LABEL_21;
            }
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_15:

LABEL_16:
  v33 = [(MCPayload *)v10 malformedPayloadErrorWithError:v22];
  v34 = v33;
  if (a5) {
    *a5 = v33;
  }
  v35 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v36 = v35;
    v37 = objc_opt_class();
    id v38 = v37;
    v39 = [v34 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v51 = v37;
    __int16 v52 = 2114;
    v53 = v39;
    _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (BOOL)isSigned
{
  return 1;
}

- (id)stubDictionary
{
  v16.receiver = self;
  v16.super_class = (Class)MCCertificatePayload;
  v3 = [(MCPayload *)&v16 stubDictionary];
  [v3 MCSetObjectIfNotNil:self->_certificatePersistentID forKey:@"PERSISTENT_REF"];
  v4 = MCGestaltGetDeviceUUID();
  [v3 setObject:v4 forKey:@"UDID"];

  v5 = [(MCCertificatePayload *)self copyCertificate];
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCCertificatePayload isIdentity](self, "isIdentity"));
  [v3 setObject:v6 forKey:@"IsIdentity"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCCertificatePayload isRoot](self, "isRoot"));
  [v3 setObject:v7 forKey:@"IsRoot"];

  id v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = [(MCCertificatePayload *)self expiry];
  [v9 timeIntervalSinceReferenceDate];
  v10 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v10 forKey:@"Expiry"];

  if (v5)
  {
    v11 = (__CFString *)SecCertificateCopySubjectSummary(v5);
    if (v11)
    {
      [v3 setObject:v11 forKey:@"CertSubject"];
    }
    else
    {
      uint64_t v12 = MCLocalizedString(@"CERTIFICATE_UNKNOWN_SUMMARY");
      [v3 setObject:v12 forKey:@"CertSubject"];
    }
    uint64_t v13 = (void *)SecCertificateCopyIssuerSummary();
    if (v13)
    {
      [v3 setObject:v13 forKey:@"Issuer"];
    }
    else
    {
      uint64_t v14 = MCLocalizedString(@"CERTIFICATE_UNKNOWN_ISSUER");
      [v3 setObject:v14 forKey:@"Issuer"];
    }
    CFRelease(v5);
  }
  return v3;
}

- (__SecCertificate)copyCertificate
{
  certificatePersistentID = self->_certificatePersistentID;
  if (!certificatePersistentID) {
    return 0;
  }
  result = +[MCKeychain copyCertificateWithPersistentID:certificatePersistentID useSystemKeychain:1];
  if (!result)
  {
    v5 = self->_certificatePersistentID;
    return +[MCKeychain copyCertificateWithPersistentID:v5 useSystemKeychain:0];
  }
  return result;
}

- (__SecIdentity)copyIdentityFromKeychain
{
  certificatePersistentID = self->_certificatePersistentID;
  if (!certificatePersistentID) {
    return 0;
  }
  result = +[MCKeychain copyIdentityWithPersistentID:certificatePersistentID useSystemKeychain:1];
  if (!result)
  {
    v5 = self->_certificatePersistentID;
    return +[MCKeychain copyIdentityWithPersistentID:v5 useSystemKeychain:0];
  }
  return result;
}

- (BOOL)isRoot
{
  v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
    isRoot = self->_isRoot;

    if (isRoot)
    {
      v5 = self->_isRoot;
      LOBYTE(v6) = [(NSNumber *)v5 BOOLValue];
      return (char)v6;
    }
  }
  else
  {
  }
  v6 = [(MCCertificatePayload *)self copyCertificate];
  if (v6)
  {
    v7 = v6;
    char IsSelfSignedCA = SecCertificateIsSelfSignedCA();
    CFRelease(v7);
    LOBYTE(v6) = IsSelfSignedCA;
  }
  return (char)v6;
}

- (BOOL)isFullyTrustedRootCert
{
  v2 = [(MCCertificatePayload *)self copyCertificate];
  if (v2)
  {
    v3 = v2;
    if (SecCertificateIsSelfSignedCA())
    {
      SecTrustStoreForDomain();
      SecTrustStoreCopyUsageConstraints();
    }
    CFRelease(v3);
  }
  return 0;
}

- (BOOL)isIdentity
{
  v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
    isIdentity = self->_isIdentity;

    if (isIdentity)
    {
      v5 = self->_isIdentity;
      LOBYTE(v6) = [(NSNumber *)v5 BOOLValue];
      return (char)v6;
    }
  }
  else
  {
  }
  v6 = [(MCCertificatePayload *)self copyIdentityFromKeychain];
  if (v6)
  {
    CFRelease(v6);
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

- (BOOL)isMDMClientIdentity
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(MCPayload *)self profile];
  v4 = [v3 payloads];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v11 = [v9 identityUUID];
          uint64_t v12 = [(MCPayload *)self UUID];
          char v10 = [v11 isEqualToString:v12];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)SMIMEEmailAddress
{
  v2 = [(MCCertificatePayload *)self copyCertificate];
  if (!v2)
  {
    id v9 = 0;
    goto LABEL_16;
  }
  v3 = v2;
  CFDataRef v4 = CFDataCreate(0, SMIMEEmailAddress_emailProtectionOID, 8);
  CFArrayRef v5 = (const __CFArray *)SecCertificateCopyExtendedKeyUsage();
  if (v5)
  {
    CFArrayRef v6 = v5;
    v12.length = CFArrayGetCount(v5);
    v12.location = 0;
    if (CFArrayContainsValue(v6, v12, v4) && (CFArrayRef v7 = (const __CFArray *)SecCertificateCopyRFC822Names()) != 0)
    {
      CFArrayRef v8 = v7;
      if (CFArrayGetCount(v7) == 1)
      {
        id v9 = CFArrayGetValueAtIndex(v8, 0);
      }
      else
      {
        id v9 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      id v9 = 0;
    }
    CFRelease(v6);
    if (!v4) {
      goto LABEL_15;
    }
  }
  else
  {
    id v9 = 0;
    if (!v4) {
      goto LABEL_15;
    }
  }
  CFRelease(v4);
LABEL_15:
  CFRelease(v3);
LABEL_16:
  return (NSString *)v9;
}

- (BOOL)isHardwareBound
{
  return 0;
}

- (id)title
{
  if ([(MCCertificatePayload *)self isIdentity]
    && ([(MCPayload *)self profile],
        v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isStub],
        v3,
        (v4 & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)MCCertificatePayload;
    CFArrayRef v5 = [(MCPayload *)&v7 title];
  }
  else
  {
    CFArrayRef v5 = [(MCCertificatePayload *)self certificateSubject];
  }
  return v5;
}

- (id)subtitle1Label
{
  if ([(MCCertificatePayload *)self isIdentity]
    && ([(MCPayload *)self profile],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isStub],
        v3,
        !v4))
  {
    CFArrayRef v5 = 0;
  }
  else
  {
    CFArrayRef v5 = MCLocalizedString(@"ISSUED_BY_COLON");
  }
  return v5;
}

- (id)subtitle1Description
{
  v3 = [(MCCertificatePayload *)self issuer];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    CFArrayRef v6 = [(MCPayload *)self profile];
    char v7 = [v6 isStub];

    if (v7) {
      CFArrayRef v8 = @"ISSUED_BY_MISSING";
    }
    else {
      CFArrayRef v8 = @"IDENTITY_CERTIFICATE_INSTALL_DESCRIPTION";
    }
    MCLocalizedString(v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v5;

  return v9;
}

- (id)subtitle2Label
{
  if ([(MCCertificatePayload *)self isIdentity]
    && ([(MCPayload *)self profile],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isStub],
        v3,
        !v4))
  {
    char v10 = 0;
  }
  else
  {
    id v5 = [(MCCertificatePayload *)self subtitle2Description];

    if (v5)
    {
      CFArrayRef v6 = [(MCCertificatePayload *)self expiry];
      if (v6)
      {
        char v7 = [MEMORY[0x1E4F1C9C8] date];
        CFArrayRef v8 = [v7 earlierDate:v6];

        if (v8 == v6) {
          id v9 = @"EXPIRED_COLON";
        }
        else {
          id v9 = @"EXPIRES_COLON";
        }
        char v10 = MCLocalizedString(v9);
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = MCLocalizedString(@"EXPIRATION_DATE_MISSING");
    }
  }
  return v10;
}

- (id)subtitle2Description
{
  if ([(MCCertificatePayload *)self isIdentity]
    && ([(MCPayload *)self profile],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isStub],
        v3,
        !v4))
  {
    CFArrayRef v8 = 0;
  }
  else
  {
    id v5 = [(MCCertificatePayload *)self expiry];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      char v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      [v6 setLocale:v7];

      [v6 setDateStyle:3];
      [v6 setTimeStyle:0];
      CFArrayRef v8 = [v6 stringFromDate:v5];
    }
    else
    {
      CFArrayRef v8 = 0;
    }
  }
  return v8;
}

- (id)verboseDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v19.receiver = self;
  v19.super_class = (Class)MCCertificatePayload;
  int v4 = [(MCPayload *)&v19 verboseDescription];
  id v5 = [v3 stringWithString:v4];

  id v6 = [(MCCertificatePayload *)self installedOnDeviceID];

  if (v6)
  {
    char v7 = [(MCCertificatePayload *)self installedOnDeviceID];
    [v5 appendFormat:@"DeviceID    : %@\n", v7];
  }
  CFArrayRef v8 = [(MCCertificatePayload *)self certificatePersistentID];
  id v9 = [v8 MCHexString];

  if (v9)
  {
    char v10 = [(MCCertificatePayload *)self certificatePersistentID];
    v11 = [v10 MCHexString];
    [v5 appendFormat:@"Persist ID  : %@\n", v11];
  }
  CFRange v12 = MCStringForBool([(MCCertificatePayload *)self isIdentity]);
  [v5 appendFormat:@"Is identity : %@\n", v12];

  uint64_t v13 = [(MCCertificatePayload *)self copyIdentityFromKeychain];
  if (v13)
  {
    long long v14 = v13;
    [v5 appendFormat:@"Private key : Present\n"];
    CFRelease(v14);
  }
  long long v15 = MCStringForBool([(MCCertificatePayload *)self isRoot]);
  [v5 appendFormat:@"Is root cert: %@\n", v15];

  long long v16 = [(MCCertificatePayload *)self expiry];

  if (v16)
  {
    long long v17 = [(MCCertificatePayload *)self expiry];
    [v5 appendFormat:@"Expires     : %@\n", v17];
  }
  return v5;
}

- (NSDate)expiry
{
  v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
    expiryInterval = self->_expiryInterval;

    if (expiryInterval)
    {
      id v5 = (void *)MEMORY[0x1E4F1C9C8];
      [(NSNumber *)self->_expiryInterval doubleValue];
      id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v7 = [(MCCertificatePayload *)self copyCertificate];
  if (v7)
  {
    CFArrayRef v8 = v7;
    SecCertificateNotValidAfter();
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    CFRelease(v8);
  }
  else
  {
    id v6 = 0;
  }
LABEL_8:
  return (NSDate *)v6;
}

- (id)certificateSubject
{
  v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
    certSubject = self->_certSubject;

    if (certSubject)
    {
      id v5 = self->_certSubject;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v6 = [(MCCertificatePayload *)self copyCertificate];
  if (v6)
  {
    char v7 = v6;
    id v5 = (__CFString *)SecCertificateCopySubjectSummary(v6);
    CFRelease(v7);
  }
  else
  {
    id v5 = 0;
  }
LABEL_8:
  return v5;
}

- (id)issuer
{
  v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
    certIssuer = self->_certIssuer;

    if (certIssuer)
    {
      id v5 = self->_certIssuer;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v6 = [(MCCertificatePayload *)self copyCertificate];
  if (v6)
  {
    char v7 = v6;
    id v5 = (NSString *)SecCertificateCopyIssuerSummary();
    CFRelease(v7);
  }
  else
  {
    id v5 = 0;
  }
LABEL_8:
  return v5;
}

- (NSData)certificatePersistentID
{
  return self->_certificatePersistentID;
}

- (void)setCertificatePersistentID:(id)a3
{
}

- (NSString)installedOnDeviceID
{
  return self->_installedOnDeviceID;
}

- (void)setInstalledOnDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certIssuer, 0);
  objc_storeStrong((id *)&self->_certSubject, 0);
  objc_storeStrong((id *)&self->_expiryInterval, 0);
  objc_storeStrong((id *)&self->_isRoot, 0);
  objc_storeStrong((id *)&self->_isIdentity, 0);
  objc_storeStrong((id *)&self->_installedOnDeviceID, 0);
  objc_storeStrong((id *)&self->_certificatePersistentID, 0);
}

@end
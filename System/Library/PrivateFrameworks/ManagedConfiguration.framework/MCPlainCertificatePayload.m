@interface MCPlainCertificatePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isIdentity;
- (BOOL)isSigned;
- (MCPlainCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)certificateData;
- (NSString)certificateFileName;
- (NSString)password;
- (__SecCertificate)copyCertificate;
- (id)installationWarnings;
- (id)persistentResourceID;
- (id)verboseDescription;
- (int)dataEncoding;
@end

@implementation MCPlainCertificatePayload

+ (id)typeStrings
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.security.root";
  v4[1] = @"com.apple.security.pkcs12";
  v4[2] = @"com.apple.security.pkcs1";
  v4[3] = @"com.apple.security.pem";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CERTIFICATE_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCPlainCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCPlainCertificatePayload;
  v10 = [(MCCertificatePayload *)&v34 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_19;
  }
  if (![v9 isStub])
  {
    id v33 = 0;
    uint64_t v11 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v33];
    id v12 = v33;
    certificateData = v10->_certificateData;
    v10->_certificateData = (NSData *)v11;

    v14 = [(MCPayload *)v10 type];
    int v15 = [v14 isEqualToString:@"com.apple.security.pkcs12"];

    if (v15)
    {
      v10->_dataEncoding = 1;
      if (v12) {
        goto LABEL_9;
      }
      id v32 = 0;
      uint64_t v16 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Password" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v32];
      id v12 = v32;
      password = v10->_password;
      v10->_password = (NSString *)v16;

      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      v10->_dataEncoding = 0;
      if (v12) {
        goto LABEL_9;
      }
    }
  }
  id v31 = 0;
  uint64_t v18 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PayloadCertificateFileName" errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v31];
  id v12 = v31;
  certificateFileName = v10->_certificateFileName;
  v10->_certificateFileName = (NSString *)v18;

LABEL_9:
  if ([v8 count])
  {
    v20 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      v22 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      __int16 v37 = 2114;
      id v38 = v8;
      _os_log_impl(&dword_1A13F0000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
    }
  }
  if (v12)
  {
    v23 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = objc_opt_class();
      id v28 = v27;
      v29 = [v24 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2114;
      id v38 = v29;
      _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }

LABEL_19:
  return v10;
}

- (BOOL)isSigned
{
  uint64_t v3 = [(MCPayload *)self profile];
  if ([v3 isStub])
  {
  }
  else
  {
    int dataEncoding = self->_dataEncoding;

    if (dataEncoding == 1) {
      return 0;
    }
  }
  return 1;
}

- (id)installationWarnings
{
  if ([(MCCertificatePayload *)self isRoot]
    && (uint64_t v3 = [(MCPlainCertificatePayload *)self copyCertificate]) != 0)
  {
    uint64_t v4 = v3;
    SecTrustStoreForDomain();
    if (SecTrustStoreContains())
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v6 = (void *)SecCertificateCopySubjectSummary(v4);
      if (!v6)
      {
        uint64_t v6 = [(MCPayload *)self friendlyName];
      }
      uint64_t v7 = [(MCPayload *)self profile];
      int v8 = [v7 containsPayloadOfClass:objc_opt_class()];
      id v9 = (void *)MEMORY[0x1E4F1C978];
      if (v8)
      {
        v10 = MCLocalizedString(@"INSTALL_WARNING_ROOT_CERT_TITLE");
        MCLocalizedFormatByDevice(@"INSTALL_WARNING_ROOT_CERT_P_CERT", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6);
      }
      else
      {
        v10 = MCLocalizedString(@"INSTALL_WARNING_UNMANAGED_ROOT_CERT_TITLE");
        MCLocalizedFormatByDevice(@"INSTALL_WARNING_UNMANAGED_ROOT_CERT_P_CERT", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v6);
      v25 = };
      v26 = +[MCProfileWarning warningWithLocalizedTitle:v10 localizedBody:v25 isLongForm:0];
      uint64_t v5 = [v9 arrayWithObject:v26];
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (__SecCertificate)copyCertificate
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MCPlainCertificatePayload;
  result = [(MCCertificatePayload *)&v10 copyCertificate];
  SecCertificateRef certificateRef = result;
  if (!result)
  {
    if (!self->_certificateData) {
      return 0;
    }
    int dataEncoding = self->_dataEncoding;
    if (dataEncoding != 1)
    {
      if (!dataEncoding)
      {
        result = +[MCCrypto copyCertificateRefFromPKCS1Data:](MCCrypto, "copyCertificateRefFromPKCS1Data:");
        if (!result) {
          return +[MCCrypto copyCertificateRefFromPEMData:self->_certificateData];
        }
        return result;
      }
      return 0;
    }
    result = [(NSString *)self->_password length];
    if (result)
    {
      CFArrayRef items = 0;
      password = self->_password;
      uint64_t v12 = *MEMORY[0x1E4F3B9E8];
      v13[0] = password;
      CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      if (!SecPKCS12Import((CFDataRef)self->_certificateData, v6, &items) && CFArrayGetCount(items) == 1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
        Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
        SecIdentityCopyCertificate(Value, &certificateRef);
      }
      if (items) {
        CFRelease(items);
      }

      return certificateRef;
    }
  }
  return result;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)MCPlainCertificatePayload;
  uint64_t v4 = [(MCCertificatePayload *)&v8 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  if (self->_certificateFileName) {
    [v5 appendFormat:@"File name   : %@\n", self->_certificateFileName];
  }
  if (self->_certificateData) {
    [v5 appendFormat:@"Cert data   : Present\n"];
  }
  CFDictionaryRef v6 = MCStringForBool([(MCCertificatePayload *)self isRoot]);
  [v5 appendFormat:@"Is root cert: %@\n", v6];

  return v5;
}

- (id)persistentResourceID
{
  uint64_t v2 = [(MCCertificatePayload *)self certificatePersistentID];
  uint64_t v3 = [v2 MCHexString];

  return v3;
}

- (BOOL)isIdentity
{
  uint64_t v3 = [(MCPayload *)self profile];
  char v4 = [v3 isStub];

  if ((v4 & 1) == 0) {
    return self->_dataEncoding == 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MCPlainCertificatePayload;
  return [(MCCertificatePayload *)&v6 isIdentity];
}

- (NSString)certificateFileName
{
  return self->_certificateFileName;
}

- (int)dataEncoding
{
  return self->_dataEncoding;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);

  objc_storeStrong((id *)&self->_certificateFileName, 0);
}

@end
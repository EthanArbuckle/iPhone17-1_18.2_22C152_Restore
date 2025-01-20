@interface MCWAPIIdentityCertificatePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isIdentity;
- (MCWAPIIdentityCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)pemData;
- (__SecCertificate)copyCertificate;
- (__SecIdentity)copyIdentityFromKeychain;
- (id)verboseDescription;
@end

@implementation MCWAPIIdentityCertificatePayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.security.wapi-identity"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"WAPI_IDENTITY_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"WAPI_IDENTITY_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCWAPIIdentityCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MCWAPIIdentityCertificatePayload;
  v10 = [(MCCertificatePayload *)&v26 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      id v11 = 0;
    }
    else
    {
      id v25 = 0;
      uint64_t v12 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"PEMData" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v25];
      id v11 = v25;
      pemData = v10->_pemData;
      v10->_pemData = (NSData *)v12;
    }
    if ([v8 count])
    {
      v14 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        v16 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v28 = v16;
        __int16 v29 = 2114;
        id v30 = v8;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
      }
    }
    if (v11)
    {
      v17 = [(MCPayload *)v10 malformedPayloadErrorWithError:v11];
      v18 = v17;
      if (a5) {
        *a5 = v17;
      }
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = [v18 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        __int16 v29 = 2114;
        id v30 = v23;
        _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }
  }
  return v10;
}

- (__SecCertificate)copyCertificate
{
  v4.receiver = self;
  v4.super_class = (Class)MCWAPIIdentityCertificatePayload;
  result = [(MCCertificatePayload *)&v4 copyCertificate];
  if (!result)
  {
    if (self->_pemData) {
      return +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:");
    }
    else {
      return 0;
    }
  }
  return result;
}

- (__SecIdentity)copyIdentityFromKeychain
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)MCWAPIIdentityCertificatePayload;
  objc_super v4 = [(MCCertificatePayload *)&v8 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(MCWAPIIdentityCertificatePayload *)self pemData];

  if (v6) {
    [v5 appendFormat:@"PEM Data    : Present\n"];
  }
  return v5;
}

- (NSData)pemData
{
  return self->_pemData;
}

- (void).cxx_destruct
{
}

@end
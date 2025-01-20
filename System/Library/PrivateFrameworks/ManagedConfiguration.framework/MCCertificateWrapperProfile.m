@interface MCCertificateWrapperProfile
+ (id)_basicWrapperProfileDictForCertificateName:(id)a3 fileName:(id)a4 identifier:(id)a5;
+ (id)_identifierHashFromData:(id)a3;
+ (id)_wrapperPayloadDictWithCertData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6 type:(id)a7;
+ (id)_wrapperProfileDictForCertificate:(__SecCertificate *)a3 fileName:(id)a4 certData:(id)a5 type:(id)a6;
+ (id)_wrapperProfileForWAPICertificate:(__SecCertificate *)a3 fileName:(id)a4 PEMData:(id)a5;
+ (id)_wrapperWAPIPayloadDictWithPEMData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6;
+ (id)wrapperProfileDictionaryWithCertificateData:(id)a3 fileName:(id)a4 outSignerCerts:(id *)a5;
- (BOOL)isSigned;
- (MCCertificateWrapperProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6;
- (id)_certificatePayload;
- (id)earliestCertificateExpiryDate;
- (id)stubDictionary;
- (int)trustLevel;
@end

@implementation MCCertificateWrapperProfile

- (id)_certificatePayload
{
  v2 = [(MCConfigurationProfile *)self payloads];
  v3 = [v2 objectAtIndex:0];

  return v3;
}

- (MCCertificateWrapperProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)MCCertificateWrapperProfile;
  v7 = [(MCConfigurationProfile *)&v27 initWithDictionary:a3 options:0 signerCerts:a4 allowEmptyPayload:a5 outError:a6];
  v8 = v7;
  if (v7)
  {
    v9 = [(MCConfigurationProfile *)v7 payloads];
    if ([v9 count] == 1)
    {
      v10 = [(MCConfigurationProfile *)v8 payloads];
      v11 = [v10 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v13 = [(MCConfigurationProfile *)v8 payloads];
        v14 = [v13 objectAtIndexedSubscript:0];

        uint64_t v15 = [v14 copyCertificate];
        if (v15)
        {
          v16 = (const void *)v15;
          v28[0] = v15;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
          [(MCProfile *)v8 setSignerCertificates:v17];

          CFRelease(v16);
        }
LABEL_9:

        return v8;
      }
    }
    else
    {
    }
    if (!a6) {
      return 0;
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    v14 = MCErrorArray(@"MALFORMED_PAYLOAD_ERROR_DESCRIPTION", v18, v19, v20, v21, v22, v23, v24, 0);
    [v25 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v14 errorType:@"MCFatalError"];
    v8 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  return v8;
}

- (id)stubDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)MCCertificateWrapperProfile;
  v2 = [(MCConfigurationProfile *)&v4 stubDictionary];
  [v2 setObject:@"CertificateWrapper" forKey:@"PayloadType"];
  return v2;
}

- (int)trustLevel
{
  v2 = [(MCCertificateWrapperProfile *)self _certificatePayload];
  uint64_t v3 = [v2 copyCertificate];
  if (v3)
  {
    objc_super v4 = (const void *)v3;
    if (SecCertificateIsSelfSignedCA())
    {
      int v5 = 2;
      if (!+[MCKeychain itemExistsInKeychain:v4 useSystemKeychain:1])
      {
        if (+[MCKeychain itemExistsInKeychain:v4 useSystemKeychain:0])
        {
          int v5 = 2;
        }
        else
        {
          int v5 = 0;
        }
      }
    }
    else
    {
      SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
      SecTrustRef trust = 0;
      if (SecTrustCreateWithCertificates((CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObject:v4], BasicX509, &trust))
      {
        int v5 = 0;
      }
      else
      {
        CFTypeRef cf = 0;
        if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
        {
          int v5 = 2;
        }
        else
        {
          CFRelease(cf);
          int v5 = 0;
        }
        if (trust) {
          CFRelease(trust);
        }
      }
      if (BasicX509) {
        CFRelease(BasicX509);
      }
      CFRelease(v4);
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)isSigned
{
  v2 = [(MCCertificateWrapperProfile *)self _certificatePayload];
  char v3 = [v2 isSigned];

  return v3;
}

- (id)earliestCertificateExpiryDate
{
  v2 = [(MCCertificateWrapperProfile *)self _certificatePayload];
  char v3 = [v2 expiry];

  return v3;
}

+ (id)_identifierHashFromData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  objc_super v4 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
  [v4 appendString:@"a"];

  return v4;
}

+ (id)_wrapperPayloadDictWithCertData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6 type:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  v13 = NSString;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  v17 = [v13 MCMakeUUID];
  uint64_t v18 = +[MCPayload wrapperPayloadDictionary];
  [v18 setObject:v14 forKey:@"PayloadType"];

  [v18 setObject:v15 forKey:@"PayloadIdentifier"];
  [v18 setObject:v17 forKey:@"PayloadUUID"];
  [v18 setObject:v12 forKey:@"PayloadDisplayName"];
  if (v11) {
    id v19 = v11;
  }
  else {
    id v19 = v12;
  }
  [v18 setObject:v19 forKey:@"PayloadCertificateFileName"];
  [v18 setObject:v16 forKey:@"PayloadContent"];

  return v18;
}

+ (id)_wrapperWAPIPayloadDictWithPEMData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6
{
  uint64_t v8 = NSString;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v8 MCMakeUUID];
  v13 = +[MCPayload wrapperPayloadDictionary];
  [v13 setObject:@"com.apple.security.wapi-identity" forKey:@"PayloadType"];
  [v13 setObject:v9 forKey:@"PayloadIdentifier"];

  [v13 setObject:v12 forKey:@"PayloadUUID"];
  [v13 setObject:v10 forKey:@"PayloadDisplayName"];

  [v13 setObject:v11 forKey:@"PEMData"];
  return v13;
}

+ (id)_basicWrapperProfileDictForCertificateName:(id)a3 fileName:(id)a4 identifier:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a5;
  id v8 = a3;
  id v9 = [v6 dictionary];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  [v9 setObject:v10 forKey:@"PayloadVersion"];

  [v9 setObject:@"CertificateWrapper" forKey:@"PayloadType"];
  [v9 setObject:v7 forKey:@"PayloadIdentifier"];

  id v11 = [NSString MCMakeUUID];
  [v9 setObject:v11 forKey:@"PayloadUUID"];

  [v9 setObject:v8 forKey:@"PayloadDisplayName"];
  return v9;
}

+ (id)_wrapperProfileDictForCertificate:(__SecCertificate *)a3 fileName:(id)a4 certData:(id)a5 type:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  id v14 = [a1 _identifierHashFromData:v11];
  id v15 = [a1 _basicWrapperProfileDictForCertificateName:v13 fileName:v12 identifier:v14];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  v17 = [a1 _wrapperPayloadDictWithCertData:v11 fileName:v12 name:v13 identifier:v14 type:v10];

  [v16 addObject:v17];
  [v15 setObject:v16 forKey:@"PayloadContent"];

  return v15;
}

+ (id)_wrapperProfileForWAPICertificate:(__SecCertificate *)a3 fileName:(id)a4 PEMData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  id v11 = [a1 _identifierHashFromData:v8];
  id v12 = [a1 _basicWrapperProfileDictForCertificateName:v10 fileName:v9 identifier:v11];
  v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = [a1 _wrapperWAPIPayloadDictWithPEMData:v8 fileName:v9 name:v10 identifier:v11];

  [v13 addObject:v14];
  [v12 setObject:v13 forKey:@"PayloadContent"];

  return v12;
}

+ (id)wrapperProfileDictionaryWithCertificateData:(id)a3 fileName:(id)a4 outSignerCerts:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = +[MCCrypto copyCertificateRefFromPEMData:v8];
    if (v10)
    {
      id v11 = v10;
      id v12 = (void *)[[NSString alloc] initWithData:v8 encoding:1];
      if ([v12 rangeOfString:@"-----BEGIN EC PRIVATE KEY-----"] == 0x7FFFFFFFFFFFFFFFLL) {
        [a1 _wrapperProfileDictForCertificate:v11 fileName:v9 certData:v8 type:@"com.apple.security.pem"];
      }
      else {
      v13 = [a1 _wrapperProfileForWAPICertificate:v11 fileName:v9 PEMData:v8];
      }
      v36[0] = v11;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      CFRelease(v11);
    }
    else
    {
      id v14 = +[MCCrypto copyCertificateRefFromPKCS1Data:v8];
      if (v14)
      {
        id v15 = v14;
        v13 = [a1 _wrapperProfileDictForCertificate:v14 fileName:v9 certData:v8 type:@"com.apple.security.pkcs1"];
        v35 = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        CFRelease(v15);
      }
      else
      {
        if (+[MCCrypto isValidPKCS12Data:v8])
        {
          v25 = MCLocalizedString(@"PKCS12_CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT");
          v26 = [a1 _identifierHashFromData:v8];
          v13 = [a1 _basicWrapperProfileDictForCertificateName:v25 fileName:v9 identifier:v26];
          objc_super v27 = [MEMORY[0x1E4F1CA48] array];
          v28 = [a1 _wrapperPayloadDictWithCertData:v8 fileName:v9 name:v25 identifier:v26 type:@"com.apple.security.pkcs12"];
          [v27 addObject:v28];
          [v13 setObject:v27 forKey:@"PayloadContent"];
        }
        else
        {
          v13 = 0;
        }
        id v16 = 0;
      }
    }
    if ([v16 count])
    {
      v29 = a5;
      v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            CFDataRef v23 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v30 + 1) + 8 * i));
            if (v23) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v20);
      }

      if (v29) {
        id *v29 = v17;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
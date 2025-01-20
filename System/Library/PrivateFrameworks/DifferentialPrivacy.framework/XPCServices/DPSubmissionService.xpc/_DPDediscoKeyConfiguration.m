@interface _DPDediscoKeyConfiguration
+ (id)constructTrust:(id)a3 policy:(__SecPolicy *)a4 overrideVerifyDate:(id)a5;
+ (id)extractCertificatesFromChain:(id)a3;
+ (id)extractPublicKeyFromString:(id)a3;
+ (id)keysFromConfiguration:(id)a3 error:(id *)a4;
+ (id)keysFromConfiguration:(id)a3 error:(id *)a4 overrideVerifyDate:(id)a5;
+ (id)new;
+ (id)verifySignature:(id)a3 data:(id)a4 certificate:(id)a5 overrideVerifyDate:(id)a6 isAppleServer:(BOOL)a7;
- (NSArray)keysMetadataArray;
- (_DPDediscoKeyConfiguration)init;
- (_DPDediscoKeyConfiguration)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4;
- (_DPDediscoKeyConfiguration)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4 keysMetadataArray:(id)a5;
- (id)destinationPublicKey;
- (id)facilitatorPublicKey;
@end

@implementation _DPDediscoKeyConfiguration

+ (id)new
{
  return 0;
}

- (_DPDediscoKeyConfiguration)init
{
  return 0;
}

- (_DPDediscoKeyConfiguration)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4 keysMetadataArray:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_DPDediscoKeyConfiguration;
  v12 = [(_DPDediscoKeyConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_destinationPublicKey, a3);
    objc_storeStrong(&v13->_facilitatorPublicKey, a4);
    objc_storeStrong((id *)&v13->_keysMetadataArray, a5);
  }

  return v13;
}

- (_DPDediscoKeyConfiguration)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4
{
  return [(_DPDediscoKeyConfiguration *)self initWithDestinationKey:a3 facilitatorPublicKey:a4 keysMetadataArray:0];
}

+ (id)keysFromConfiguration:(id)a3 error:(id *)a4
{
  return _[a1 keysFromConfiguration:a3 error:a4 overrideVerifyDate:0];
}

+ (id)keysFromConfiguration:(id)a3 error:(id *)a4 overrideVerifyDate:(id)a5
{
  id v7 = a5;
  id v51 = 0;
  v8 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v51];
  id v9 = v51;
  if (v9)
  {
    id v10 = +[_DPLog service];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100057038();
    }

    if (a4)
    {
      *a4 = +[_DPDediscoError errorWithCode:300 underlyingError:v9 description:@"Failed to deserialize the configuration."];
    }
  }
  id v11 = [v8 objectForKeyedSubscript:@"public-keys"];
  v12 = [v8 objectForKeyedSubscript:@"certificate"];
  uint64_t v13 = [v8 objectForKeyedSubscript:@"signature"];
  v14 = (void *)v13;
  if (v11) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15 || v13 == 0;
  if (!v16
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v17 = [(id)objc_opt_class() verifySignature:v14 data:v11 certificate:v12 overrideVerifyDate:v7 isAppleServer:1];
    v18 = v17;
    if (v17)
    {
      v19 = 0;
      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      id v50 = v9;
      v49 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&v50];
      id v29 = v50;

      id v48 = v29;
      if (v29)
      {
        v30 = +[_DPLog service];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100056F4C();
        }

        if (a4)
        {
          *a4 = +[_DPDediscoError errorWithCode:300 underlyingError:v29 description:@"Failed to deserialize the inner configuration"];
        }
      }
      uint64_t v31 = [v49 objectForKeyedSubscript:@"dsPublicKey"];
      uint64_t v32 = [v49 objectForKeyedSubscript:@"fsPublicKey"];
      v33 = (void *)v32;
      if (v31 && v32)
      {
        v46 = [_DPDediscoKeyConfiguration alloc];
        v34 = [(id)objc_opt_class() extractPublicKeyFromString:v31];
        [(id)objc_opt_class() extractPublicKeyFromString:v33];
        v36 = v35 = v33;
        v19 = [(_DPDediscoKeyConfiguration *)v46 initWithDestinationKey:v34 facilitatorPublicKey:v36];

        v37 = (void *)v31;
        v18 = 0;
        id v9 = v48;
      }
      else
      {
        v38 = +[_DPLog service];
        v18 = 0;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100056ED4(v38, v39, v40, v41, v42, v43, v44, v45);
        }
        v35 = v33;

        if (a4)
        {
          +[_DPDediscoError errorWithCode:300 description:@"Failed to obtain fields from the inner configuration"];
          v19 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        id v9 = v48;
        v37 = v47;
      }
    }
  }
  else
  {
    v20 = +[_DPLog service];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100056FC0(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    if (a4)
    {
      +[_DPDediscoError errorWithCode:300 description:@"Failed to obtain fields from configuration."];
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

+ (id)verifySignature:(id)a3 data:(id)a4 certificate:(id)a5 overrideVerifyDate:(id)a6 isAppleServer:(BOOL)a7
{
  CFDataRef v11 = (const __CFData *)a3;
  CFDataRef v12 = (const __CFData *)a4;
  id v13 = a6;
  v14 = [a1 extractCertificatesFromChain:a5];
  uint64_t ApplePinned = SecPolicyCreateApplePinned();
  if (!ApplePinned)
  {
    v20 = +[_DPDediscoError errorWithCode:301 description:@"Failed to create a certificate policy."];
    goto LABEL_15;
  }
  BOOL v16 = (const void *)ApplePinned;
  v17 = [a1 constructTrust:v14 policy:ApplePinned overrideVerifyDate:v13];
  CFRelease(v16);
  if (v17)
  {
    CFErrorRef error = 0;
    if (!SecTrustEvaluateWithError(v17, &error))
    {
      CFErrorRef v21 = error;
      uint64_t v25 = +[_DPLog service];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100057120();
      }

      CFStringRef v23 = @"Failed to evaluate certificate chain.";
      uint64_t v24 = 301;
      goto LABEL_13;
    }
    v18 = SecTrustCopyKey(v17);
    CFErrorRef error = 0;
    int v19 = SecKeyVerifySignature(v18, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v12, v11, &error);
    CFRelease(v18);
    v20 = 0;
    if (!v19)
    {
      CFErrorRef v21 = error;
      uint64_t v22 = +[_DPLog service];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000570AC();
      }

      CFStringRef v23 = @"Failed to verify configuration signature.";
      uint64_t v24 = 302;
LABEL_13:
      v20 = +[_DPDediscoError errorWithCode:v24 underlyingError:v21 description:v23];
    }
  }
  else
  {
    v20 = +[_DPDediscoError errorWithCode:301 description:@"Failed to create a certificate trust."];
  }

LABEL_15:
  return v20;
}

+ (id)extractCertificatesFromChain:(id)a3
{
  id v3 = a3;
  id v33 = 0;
  v4 = +[NSRegularExpression regularExpressionWithPattern:@"(-----BEGIN CERTIFICATE-----\n[A-Za-z0-9/+\n]+={0,2}\n-----END CERTIFICATE-----\n)" options:0 error:&v33];
  id v5 = v33;
  v6 = v5;
  if (v4)
  {
    id v28 = v5;
    id v7 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    id v8 = [&__NSArray0__struct mutableCopy];
    objc_msgSend(v4, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v3, "length"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) range];
          BOOL v16 = -[NSObject substringWithRange:](v7, "substringWithRange:", v14, v15);
          [v16 dataUsingEncoding:4];
          uint64_t v17 = SecCertificateCreateWithPEM();
          if (!v17)
          {
            v20 = +[_DPLog service];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_100057200(v20);
            }

            id v19 = 0;
            goto LABEL_14;
          }
          v18 = (void *)v17;
          [v8 addObject:v17];
        }
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v19 = v8;
LABEL_14:
    v6 = v28;
  }
  else
  {
    id v7 = +[_DPLog service];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100057194((uint64_t)v6, v7, v21, v22, v23, v24, v25, v26);
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)constructTrust:(id)a3 policy:(__SecPolicy *)a4 overrideVerifyDate:(id)a5
{
  CFDateRef v7 = (const __CFDate *)a5;
  SecTrustRef trust = 0;
  OSStatus v8 = SecTrustCreateWithCertificates(a3, a4, &trust);
  if (v8)
  {
    int v9 = v8;
    id v10 = +[_DPLog service];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100057244(v9, v10);
    }

    SecTrustRef v11 = 0;
  }
  else
  {
    if (v7) {
      SecTrustSetVerifyDate(trust, v7);
    }
    SecTrustRef v11 = trust;
  }

  return v11;
}

+ (id)extractPublicKeyFromString:(id)a3
{
  id v3 = a3;
  CFDataRef v4 = (const __CFData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  if (v4)
  {
    v17[0] = kSecAttrKeyType;
    v17[1] = kSecAttrKeyClass;
    v18[0] = kSecAttrKeyTypeECSECPrimeRandom;
    v18[1] = kSecAttrKeyClassPublic;
    v17[2] = kSecAttrKeySizeInBits;
    v18[2] = &off_1000798E8;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    CFErrorRef v16 = 0;
    SecKeyRef v6 = SecKeyCreateWithData(v4, v5, &v16);
    CFErrorRef v7 = v16;
    if (!v6)
    {
      OSStatus v8 = +[_DPLog service];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100057300((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  else
  {
    CFDictionaryRef v5 = +[_DPLog service];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000572BC((os_log_t)v5);
    }
    SecKeyRef v6 = 0;
  }

  return v6;
}

- (id)destinationPublicKey
{
  return self->_destinationPublicKey;
}

- (id)facilitatorPublicKey
{
  return self->_facilitatorPublicKey;
}

- (NSArray)keysMetadataArray
{
  return self->_keysMetadataArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysMetadataArray, 0);
  objc_storeStrong(&self->_facilitatorPublicKey, 0);
  objc_storeStrong(&self->_destinationPublicKey, 0);
}

@end
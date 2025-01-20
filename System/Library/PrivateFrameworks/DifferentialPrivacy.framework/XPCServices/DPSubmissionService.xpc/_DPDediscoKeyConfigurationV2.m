@interface _DPDediscoKeyConfigurationV2
+ (id)decodeDAPEncodedConfig:(id)a3 withError:(id *)a4;
+ (id)extractPublicKeyFromString:(id)a3;
+ (id)keysFromConfiguration:(id)a3 dediscoServerNames:(id)a4 error:(id *)a5 overrideVerifyDate:(id)a6;
+ (id)verifySignature:(id)a3 data:(id)a4 certificate:(id)a5 overrideVerifyDate:(id)a6 isAppleServer:(BOOL)a7;
- (_DPDediscoKeyConfigurationV2)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4 keysMetadataArray:(id)a5;
- (id)helperURL;
- (id)leaderURL;
- (unsigned)helperHPKEConfigID;
- (unsigned)leaderHPKEConfigID;
@end

@implementation _DPDediscoKeyConfigurationV2

+ (id)keysFromConfiguration:(id)a3 dediscoServerNames:(id)a4 error:(id *)a5 overrideVerifyDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v82 = 0;
  v72 = +[NSPropertyListSerialization propertyListWithData:v9 options:0 format:0 error:&v82];
  id v12 = v82;
  if (v12)
  {
    id v13 = v12;
    v14 = +[_DPLog service];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100057038();
    }

    v15 = a5;
    if (a5)
    {
      +[_DPDediscoError errorWithCode:300 underlyingError:v13 description:@"Failed to deserialize the configuration."];
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_72;
  }
  id v59 = a1;
  id v64 = v11;
  id v62 = v9;
  id v65 = [&__NSArray0__struct mutableCopy];
  v16 = [&off_1000799E8 objectAtIndexedSubscript:0];
  v90[0] = v16;
  v17 = [v10 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationLeader];
  v89 = v17;
  v18 = +[NSArray arrayWithObjects:&v89 count:1];
  v91[0] = v18;
  v19 = [&off_1000799E8 objectAtIndexedSubscript:1];
  v90[1] = v19;
  v20 = [v10 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationHelpers];
  v91[1] = v20;
  v66 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v63 = v10;
  id v60 = [&off_1000799E8 countByEnumeratingWithState:&v78 objects:v88 count:16];
  id v13 = 0;
  if (!v60)
  {
    v49 = v65;
    goto LABEL_64;
  }
  uint64_t v21 = *(void *)v79;
  uint64_t v58 = *(void *)v79;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v79 != v21) {
        objc_enumerationMutation(&off_1000799E8);
      }
      uint64_t v61 = v22;
      uint64_t v23 = *(void *)(*((void *)&v78 + 1) + 8 * v22);
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v70 = v23;
      objc_msgSend(v66, "objectForKeyedSubscript:");
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v69 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
      if (v69)
      {
        uint64_t v68 = *(void *)v75;
        do
        {
          v24 = 0;
          v25 = v13;
          do
          {
            if (*(void *)v75 != v68) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v24);
            v27 = [v72 objectForKeyedSubscript:v70];
            v28 = [v27 objectForKeyedSubscript:v26];

            v29 = [v28 objectForKeyedSubscript:@"config"];
            v30 = [v28 objectForKeyedSubscript:@"certificate"];
            v31 = [v28 objectForKeyedSubscript:@"signature"];
            uint64_t v32 = [v28 objectForKeyedSubscript:@"url"];
            v33 = (void *)v32;
            if (v29) {
              BOOL v34 = v30 == 0;
            }
            else {
              BOOL v34 = 1;
            }
            BOOL v36 = v34 || v31 == 0 || v32 == 0;
            if (v36
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || ![v33 length])
            {
              v38 = +[NSString stringWithFormat:@"Failed to obtain fields from Dedisco V2 configuration file for server %@.", v26];
              v41 = +[_DPLog service];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v84 = v38;
                _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
              }

              v39 = a5;
              if (a5)
              {
                v40 = +[_DPDediscoError errorWithCode:300 description:v38];
LABEL_38:
                id *v39 = v40;
              }
LABEL_39:
              int v42 = 1;
              id v13 = v25;
              goto LABEL_40;
            }
            objc_msgSend((id)objc_opt_class(), "verifySignature:data:certificate:overrideVerifyDate:isAppleServer:", v31, v29, v30, v64, objc_msgSend(v26, "localizedCaseInsensitiveContainsString:", @"apple"));
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v37)
            {
              v39 = a5;
              if (a5)
              {
                v40 = v37;
                v38 = v40;
                goto LABEL_38;
              }
              goto LABEL_39;
            }
            id v73 = v25;
            v57 = [v59 decodeDAPEncodedConfig:v29 withError:&v73];
            id v13 = v73;

            if (!v57 || v13)
            {
              v44 = +[_DPLog service];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v84 = @"Failed to decode the DAP encoded configuration file";
                __int16 v85 = 2112;
                id v86 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@ error: %@", buf, 0x16u);
              }

              if (a5)
              {
                *a5 = +[_DPDediscoError errorWithCode:300 underlyingError:v13 description:@"Failed to decode the DAP encoded configuration file"];
              }
              goto LABEL_56;
            }
            v43 = +[NSURL URLWithString:v33];

            if (!v43)
            {
              uint64_t v56 = +[NSString stringWithFormat:@"The URL %@ provided by server %@ is not valid.", v33, v26];
              v45 = +[_DPLog service];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v84 = (const __CFString *)v56;
                _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "error: %@", buf, 0xCu);
              }

              v46 = (void *)v56;
              if (a5)
              {
                id v47 = +[_DPDediscoError errorWithCode:300 underlyingError:0 description:v56];
                v46 = (void *)v56;
                *a5 = v47;
              }

LABEL_56:
              int v42 = 1;
              goto LABEL_57;
            }
            [v57 setObject:v33 forKeyedSubscript:@"url"];
            [v65 addObject:v57];
            int v42 = 0;
LABEL_57:

LABEL_40:
            if (v42)
            {
              v15 = 0;
              id v9 = v62;
              id v10 = v63;
              goto LABEL_70;
            }
            v24 = (char *)v24 + 1;
            v25 = v13;
          }
          while (v69 != v24);
          id v48 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
          id v69 = v48;
        }
        while (v48);
      }

      uint64_t v22 = v61 + 1;
      id v10 = v63;
      v49 = v65;
      uint64_t v21 = v58;
    }
    while ((id)(v61 + 1) != v60);
    id v60 = [&off_1000799E8 countByEnumeratingWithState:&v78 objects:v88 count:16];
  }
  while (v60);
LABEL_64:
  if ((unint64_t)[v49 count] > 1)
  {
    v51 = [_DPDediscoKeyConfigurationV2 alloc];
    id obj = [v49 objectAtIndexedSubscript:0];
    v52 = [obj objectForKeyedSubscript:@"publicKey"];
    v53 = [v49 objectAtIndexedSubscript:1];
    v54 = [v53 objectForKeyedSubscript:@"publicKey"];
    v15 = [(_DPDediscoKeyConfigurationV2 *)v51 initWithDestinationKey:v52 facilitatorPublicKey:v54 keysMetadataArray:v49];

    id v10 = v63;
    id v9 = v62;
LABEL_70:
    id v11 = v64;
  }
  else
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Found %lu number of leader and helpers; at least one leader and one helper role needs to be provided.",
      [v49 count]);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = +[_DPLog service];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_1000583CC((uint64_t)obj, (uint64_t)v13, v50);
    }

    id v9 = v62;
    id v11 = v64;
    v15 = a5;
    if (a5)
    {
      +[_DPDediscoError errorWithCode:300 underlyingError:v13 description:obj];
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_72:
  return v15;
}

- (_DPDediscoKeyConfigurationV2)initWithDestinationKey:(id)a3 facilitatorPublicKey:(id)a4 keysMetadataArray:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_DPDediscoKeyConfigurationV2;
  return [(_DPDediscoKeyConfiguration *)&v6 initWithDestinationKey:a3 facilitatorPublicKey:a4 keysMetadataArray:a5];
}

+ (id)decodeDAPEncodedConfig:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] > 8)
  {
    id v15 = [&__NSDictionary0__struct mutableCopy];
    id v16 = v5;
    v17 = (char *)[v16 bytes];
    v18 = +[NSNumber numberWithChar:*v17];
    [v15 setObject:v18 forKeyedSubscript:@"id"];

    v19 = +[NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v17 + 1)) >> 16];
    [v15 setObject:v19 forKeyedSubscript:@"kem_id"];

    v20 = +[NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v17 + 3)) >> 16];
    [v15 setObject:v20 forKeyedSubscript:@"kdf_id"];

    uint64_t v21 = +[NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v17 + 5)) >> 16];
    [v15 setObject:v21 forKeyedSubscript:@"aead_id"];

    unsigned int v22 = *(unsigned __int16 *)(v17 + 7);
    uint64_t v23 = [v15 objectForKeyedSubscript:@"kem_id"];
    if ([v23 unsignedShortValue] == 16)
    {
      v24 = [v15 objectForKeyedSubscript:@"kdf_id"];
      if ([v24 unsignedShortValue] == 1)
      {
        v25 = [v15 objectForKeyedSubscript:@"aead_id"];
        unsigned int v26 = [v25 unsignedShortValue];

        if (v26 == 1)
        {
          if (v22)
          {
            uint64_t v27 = __rev16(v22);
            if ([v16 length] == (id)(v27 + 9))
            {
              v28 = +[NSData dataWithBytes:v17 + 9 length:v27];
              [v15 setObject:v28 forKeyedSubscript:@"publicKey"];
              id v14 = v15;

LABEL_29:
              goto LABEL_30;
            }
            v46 = +[_DPLog service];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_100058544(v46, v47, v48, v49, v50, v51, v52, v53);
            }

            if (a4)
            {
              CFStringRef v37 = @"Dedisco V2 config is malformed; buffer length does not match the expected value.";
              goto LABEL_19;
            }
LABEL_28:
            id v14 = 0;
            goto LABEL_29;
          }
          v38 = +[_DPLog service];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_1000584CC(v38, v39, v40, v41, v42, v43, v44, v45);
          }

          if (!a4) {
            goto LABEL_28;
          }
          CFStringRef v37 = @"Dedisco V2 config is malformed; public key length is zero.";
LABEL_19:
          +[_DPDediscoError errorWithCode:300 description:v37];
          id v14 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
LABEL_15:
        v29 = +[_DPLog service];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1000585BC(v29, v30, v31, v32, v33, v34, v35, v36);
        }

        if (!a4) {
          goto LABEL_28;
        }
        CFStringRef v37 = @"Dedisco V2 config is malformed; HPKE configuration is not supported.";
        goto LABEL_19;
      }
    }
    goto LABEL_15;
  }
  objc_super v6 = +[_DPLog service];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100058454(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (a4)
  {
    +[_DPDediscoError errorWithCode:300 description:@"Malformed Dedisco V2 config, the buffer length is lower than the minimum length."];
    id v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
LABEL_30:

  return v14;
}

+ (id)extractPublicKeyFromString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    objc_super v6 = +[_DPLog service];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000572BC(v6);
    }
  }
  return v4;
}

+ (id)verifySignature:(id)a3 data:(id)a4 certificate:(id)a5 overrideVerifyDate:(id)a6 isAppleServer:(BOOL)a7
{
  CFDataRef v11 = (const __CFData *)a3;
  CFDataRef v12 = (const __CFData *)a4;
  id v13 = a6;
  id v14 = [a1 extractCertificatesFromChain:a5];
  uint64_t PPMAggregatorConfigSigning = SecPolicyCreatePPMAggregatorConfigSigning();
  if (!PPMAggregatorConfigSigning)
  {
    v20 = +[_DPDediscoError errorWithCode:301 description:@"Failed to create a certificate policy."];
    goto LABEL_15;
  }
  id v16 = (const void *)PPMAggregatorConfigSigning;
  v17 = [a1 constructTrust:v14 policy:PPMAggregatorConfigSigning overrideVerifyDate:v13];
  CFRelease(v16);
  if (v17)
  {
    CFErrorRef error = 0;
    if (!SecTrustEvaluateWithError(v17, &error))
    {
      CFErrorRef v21 = error;
      v25 = +[_DPLog service];
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
      unsigned int v22 = +[_DPLog service];
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

- (id)leaderURL
{
  v2 = [(_DPDediscoKeyConfiguration *)self keysMetadataArray];
  id v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 objectForKeyedSubscript:@"url"];

  return v4;
}

- (id)helperURL
{
  v2 = [(_DPDediscoKeyConfiguration *)self keysMetadataArray];
  id v3 = [v2 objectAtIndexedSubscript:1];
  id v4 = [v3 objectForKeyedSubscript:@"url"];

  return v4;
}

- (unsigned)leaderHPKEConfigID
{
  v2 = [(_DPDediscoKeyConfiguration *)self keysMetadataArray];
  id v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 objectForKeyedSubscript:@"id"];
  unsigned __int8 v5 = [v4 unsignedCharValue];

  return v5;
}

- (unsigned)helperHPKEConfigID
{
  v2 = [(_DPDediscoKeyConfiguration *)self keysMetadataArray];
  id v3 = [v2 objectAtIndexedSubscript:1];
  id v4 = [v3 objectForKeyedSubscript:@"id"];
  unsigned __int8 v5 = [v4 unsignedCharValue];

  return v5;
}

@end
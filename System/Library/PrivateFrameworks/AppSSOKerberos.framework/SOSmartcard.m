@interface SOSmartcard
+ (BOOL)pollSmartcardForIdentityWithPersistentRef:(id)a3 tokenID:(id)a4;
+ (__SecIdentity)getLocalAuthIdentityForCert:(id)a3 withLAContext:(id)a4;
+ (id)availableSmartCards;
+ (id)searchForCachedIdentityPersistentRef:(id)a3 tokenID:(id)a4;
+ (id)searchForCachedIdentityWithSerial:(__CFData *)a3 withIssuer:(__CFData *)a4 withTokenID:(id)a5;
+ (int)getIdentityForPersistentRef:(__CFData *)a3 identityToReturn:(__SecIdentity *)a4;
+ (void)availableSmartCards;
@end

@implementation SOSmartcard

+ (__SecIdentity)getLocalAuthIdentityForCert:(id)a3 withLAContext:(id)a4
{
  v46[1] = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v35 = a4;
  CFTypeRef result = 0;
  v6 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    __int16 v41 = 2112;
    *(void *)v42 = a1;
    _os_log_impl(&dword_221304000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v7 = 0;
  unsigned int v8 = 0;
  uint64_t v9 = *MEMORY[0x263F16E70];
  uint64_t v32 = *MEMORY[0x263F175B0];
  uint64_t v34 = *MEMORY[0x263F17558];
  uint64_t v33 = *MEMORY[0x263F17530];
  while (1)
  {
    v10 = v7;
    v11 = [NSNumber numberWithInt:2];
    v45 = v11;
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppSSOKerberos"];
    v13 = [v12 localizedStringForKey:@"SIGN_IN_LOWERCASE_TEXT" value:&stru_26D3372C0 table:0];
    v46[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];

    v15 = [v36 objectForKeyedSubscript:v9];
    id v37 = v10;
    id v16 = (id)[v35 evaluateAccessControl:v15 operation:3 options:v14 error:&v37];
    id v7 = v37;

    v17 = SO_LOG_SOSmartcard();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      id v19 = a1;
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
        __int16 v41 = 2112;
        *(void *)v42 = a1;
        _os_log_impl(&dword_221304000, v17, OS_LOG_TYPE_DEFAULT, "%s evaluateAccessControl was successful on %@", buf, 0x16u);
      }

      v43[0] = v32;
      v25 = objc_msgSend(v36, "objectForKeyedSubscript:");
      v44[0] = v25;
      v44[1] = v35;
      v43[1] = v34;
      v43[2] = v33;
      v44[2] = MEMORY[0x263EFFA88];
      CFDictionaryRef v23 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

      OSStatus v26 = SecItemCopyMatching(v23, &result);
      if (v26)
      {
        OSStatus v27 = v26;
        v28 = SO_LOG_SOSmartcard();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
          __int16 v41 = 1024;
          *(_DWORD *)v42 = v27;
          *(_WORD *)&v42[4] = 2112;
          *(void *)&v42[6] = a1;
          _os_log_impl(&dword_221304000, v28, OS_LOG_TYPE_DEFAULT, "%s retrieving identity failed with error %d on %@", buf, 0x1Cu);
        }
      }
      goto LABEL_28;
    }
    id v19 = a1;
    if (v18)
    {
      uint64_t v20 = [v7 code];
      *(_DWORD *)buf = 136315650;
      v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
      __int16 v41 = 2048;
      *(void *)v42 = v20;
      *(_WORD *)&v42[8] = 2112;
      *(void *)&v42[10] = a1;
      _os_log_impl(&dword_221304000, v17, OS_LOG_TYPE_DEFAULT, "%s evaluateAccessControl failed with error %ld on %@", buf, 0x20u);
    }

    uint64_t v21 = [v7 code];
    if (v21 != -1004) {
      break;
    }
    v22 = SO_LOG_SOSmartcard();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
      __int16 v41 = 1026;
      *(_DWORD *)v42 = v8 + 1;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = a1;
      _os_log_impl(&dword_221304000, v22, OS_LOG_TYPE_DEFAULT, "%s Screen may be locked, retry %{public}d on %@", buf, 0x1Cu);
    }

    if (v8 >= 4) {
      goto LABEL_29;
    }
    [MEMORY[0x263F08B88] sleepForTimeInterval:2.0];

    ++v8;
  }
  if (v21 == -7 || v21 == -3)
  {
    SO_LOG_SOSmartcard();
    CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    __int16 v41 = 2112;
    *(void *)v42 = a1;
    v24 = "%s Problem reading the SmartCard on %@";
  }
  else if (v21 == -4)
  {
    SO_LOG_SOSmartcard();
    CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    __int16 v41 = 2112;
    *(void *)v42 = a1;
    v24 = "%s User cancelled PIN prompt on %@";
  }
  else
  {
    SO_LOG_SOSmartcard();
    CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    __int16 v41 = 2112;
    *(void *)v42 = a1;
    v24 = "%s Some other problem occurred on %@";
  }
  _os_log_impl(&dword_221304000, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
LABEL_28:

LABEL_29:
  v29 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    __int16 v41 = 2112;
    *(void *)v42 = v19;
    _os_log_impl(&dword_221304000, v29, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
  }

  v30 = (__SecIdentity *)result;
  return v30;
}

+ (int)getIdentityForPersistentRef:(__CFData *)a3 identityToReturn:(__SecIdentity *)a4
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F175B0];
  v8[0] = *MEMORY[0x263F171B8];
  v8[1] = v5;
  v9[0] = *MEMORY[0x263F171D0];
  v9[1] = a3;
  v8[2] = *MEMORY[0x263F17530];
  v9[2] = *MEMORY[0x263EFFB40];
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  LODWORD(a4) = SecItemCopyMatching(v6, (CFTypeRef *)a4);

  return (int)a4;
}

+ (BOOL)pollSmartcardForIdentityWithPersistentRef:(id)a3 tokenID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "+[SOSmartcard pollSmartcardForIdentityWithPersistentRef:tokenID:]";
    __int16 v16 = 2112;
    id v17 = a1;
    _os_log_impl(&dword_221304000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v14, 0x16u);
  }

  if (v6)
  {
    uint64_t v9 = [a1 searchForCachedIdentityPersistentRef:v6 tokenID:v7];
    v10 = [v9 objectForKey:@"labl"];
    BOOL v11 = [v10 length] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  v12 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "+[SOSmartcard pollSmartcardForIdentityWithPersistentRef:tokenID:]";
    __int16 v16 = 2112;
    id v17 = a1;
    _os_log_impl(&dword_221304000, v12, OS_LOG_TYPE_DEFAULT, "%s finished on %@", (uint8_t *)&v14, 0x16u);
  }

  return v11;
}

+ (id)searchForCachedIdentityWithSerial:(__CFData *)a3 withIssuer:(__CFData *)a4 withTokenID:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "+[SOSmartcard searchForCachedIdentityWithSerial:withIssuer:withTokenID:]";
    __int16 v33 = 2112;
    id v34 = a1;
    _os_log_impl(&dword_221304000, v9, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  CFTypeRef result = 0;
  uint64_t v10 = [v8 length];

  uint64_t v11 = *MEMORY[0x263F171D0];
  uint64_t v12 = *MEMORY[0x263F16E80];
  if (v10)
  {
    v27[0] = *MEMORY[0x263F171B8];
    v27[1] = v12;
    uint64_t v13 = *MEMORY[0x263F16E88];
    v28[0] = v11;
    v28[1] = v13;
    uint64_t v14 = *MEMORY[0x263F16F58];
    v27[2] = *MEMORY[0x263F17080];
    v27[3] = v14;
    v28[2] = a3;
    v28[3] = a4;
    uint64_t v15 = *MEMORY[0x263F17528];
    v27[4] = *MEMORY[0x263F17518];
    v27[5] = v15;
    v28[4] = MEMORY[0x263EFFA88];
    v28[5] = MEMORY[0x263EFFA88];
    __int16 v16 = NSDictionary;
    id v17 = v28;
    uint64_t v18 = v27;
  }
  else
  {
    v29[0] = *MEMORY[0x263F171B8];
    v29[1] = v12;
    v30[0] = v11;
    v30[1] = &stru_26D3372C0;
    uint64_t v19 = *MEMORY[0x263F16F58];
    v29[2] = *MEMORY[0x263F17080];
    v29[3] = v19;
    v30[2] = a3;
    v30[3] = a4;
    uint64_t v20 = *MEMORY[0x263F17528];
    v29[4] = *MEMORY[0x263F17518];
    v29[5] = v20;
    v30[4] = MEMORY[0x263EFFA88];
    v30[5] = MEMORY[0x263EFFA88];
    __int16 v16 = NSDictionary;
    id v17 = v30;
    uint64_t v18 = v29;
  }
  CFDictionaryRef v21 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:6];
  if (SecItemCopyMatching(v21, &result))
  {
    CFTypeRef v22 = [NSDictionary dictionary];
  }
  else
  {
    CFDictionaryRef v23 = SO_LOG_SOSmartcard();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = "+[SOSmartcard searchForCachedIdentityWithSerial:withIssuer:withTokenID:]";
      __int16 v33 = 2112;
      id v34 = a1;
      _os_log_impl(&dword_221304000, v23, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
    }

    CFTypeRef v22 = (id)result;
  }
  v24 = (void *)v22;

  return v24;
}

+ (id)searchForCachedIdentityPersistentRef:(id)a3 tokenID:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOSmartcard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "+[SOSmartcard searchForCachedIdentityPersistentRef:tokenID:]";
    __int16 v32 = 2112;
    id v33 = a1;
    _os_log_impl(&dword_221304000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  CFTypeRef result = 0;
  uint64_t v9 = [v7 length];
  uint64_t v10 = *MEMORY[0x263F171D0];
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F16E80];
    v26[0] = *MEMORY[0x263F171B8];
    v26[1] = v11;
    uint64_t v12 = *MEMORY[0x263F16E88];
    v27[0] = v10;
    v27[1] = v12;
    uint64_t v13 = *MEMORY[0x263F17518];
    v26[2] = *MEMORY[0x263F170D0];
    v26[3] = v13;
    v27[2] = v7;
    v27[3] = MEMORY[0x263EFFA88];
    v26[4] = *MEMORY[0x263F17528];
    v27[4] = MEMORY[0x263EFFA88];
    uint64_t v14 = NSDictionary;
    uint64_t v15 = v27;
    __int16 v16 = v26;
    uint64_t v17 = 5;
  }
  else
  {
    uint64_t v18 = *MEMORY[0x263F175B0];
    v28[0] = *MEMORY[0x263F171B8];
    v28[1] = v18;
    v29[0] = v10;
    v29[1] = v6;
    uint64_t v19 = *MEMORY[0x263F17528];
    v28[2] = *MEMORY[0x263F17518];
    v28[3] = v19;
    v29[2] = MEMORY[0x263EFFA88];
    v29[3] = MEMORY[0x263EFFA88];
    uint64_t v14 = NSDictionary;
    uint64_t v15 = v29;
    __int16 v16 = v28;
    uint64_t v17 = 4;
  }
  CFDictionaryRef v20 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
  if (SecItemCopyMatching(v20, &result))
  {
    CFTypeRef v21 = [NSDictionary dictionary];
  }
  else
  {
    CFTypeRef v22 = SO_LOG_SOSmartcard();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "+[SOSmartcard searchForCachedIdentityPersistentRef:tokenID:]";
      __int16 v32 = 2112;
      id v33 = a1;
      _os_log_impl(&dword_221304000, v22, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
    }

    CFTypeRef v21 = (id)result;
  }
  CFDictionaryRef v23 = (void *)v21;

  return v23;
}

+ (id)availableSmartCards
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v35 = (id)objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v33 = objc_alloc_init(MEMORY[0x263F048F8]);
  v2 = [v33 tokenIDs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v53;
    uint64_t v6 = *MEMORY[0x263F171B8];
    uint64_t v7 = *MEMORY[0x263F171D0];
    uint64_t v8 = *MEMORY[0x263F16E80];
    uint64_t v46 = *MEMORY[0x263F16E88];
    uint64_t v44 = *MEMORY[0x263F17518];
    uint64_t v45 = *MEMORY[0x263F17528];
    uint64_t v42 = *MEMORY[0x263EFFD08];
    uint64_t v43 = *MEMORY[0x263F17418];
    uint64_t v47 = *MEMORY[0x263F170D0];
    uint64_t v40 = *MEMORY[0x263F175B0];
    uint64_t v34 = *MEMORY[0x263F17000];
    v39 = v2;
    uint64_t v41 = *MEMORY[0x263F16E80];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v53 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void *)(*((void *)&v52 + 1) + 8 * v9);
        CFTypeRef result = 0;
        v59[0] = v6;
        v59[1] = v8;
        v60[0] = v7;
        v60[1] = v46;
        v59[2] = v45;
        v59[3] = v44;
        v60[2] = MEMORY[0x263EFFA88];
        v60[3] = MEMORY[0x263EFFA88];
        v59[4] = v43;
        v59[5] = v47;
        v60[4] = v42;
        v60[5] = v10;
        CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:6];
        OSStatus v12 = SecItemCopyMatching(v11, &result);
        if (v12)
        {
          OSStatus v13 = v12;
          uint64_t v14 = SO_LOG_SOSmartcard();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LODWORD(certificateRef[0]) = 67109120;
            HIDWORD(certificateRef[0]) = v13;
            _os_log_error_impl(&dword_221304000, v14, OS_LOG_TYPE_ERROR, "Error querying SmartCards %d", (uint8_t *)certificateRef, 8u);
          }
        }
        else
        {
          certificateRef[0] = 0;
          SecIdentityRef identityRef = 0;
          CFTypeID v15 = CFGetTypeID(result);
          if (v15 == CFDictionaryGetTypeID())
          {
            __int16 v16 = result;
            uint64_t v17 = [(id)result objectForKeyedSubscript:v40];
            int v18 = +[SOSmartcard getIdentityForPersistentRef:v17 identityToReturn:&identityRef];

            if (v18)
            {
              uint64_t v19 = SO_LOG_SOSmartcard();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                int v57 = v18;
                _os_log_error_impl(&dword_221304000, v19, OS_LOG_TYPE_ERROR, "Error getting persistientref %d", buf, 8u);
              }

              v2 = v39;
            }
            else
            {
              OSStatus v20 = SecIdentityCopyCertificate(identityRef, certificateRef);
              CFTypeRef v21 = SO_LOG_SOSmartcard();
              CFTypeRef v22 = v21;
              if (v20)
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  int v57 = v20;
                  _os_log_error_impl(&dword_221304000, v22, OS_LOG_TYPE_ERROR, "Error retrieving certificate %d", buf, 8u);
                }

                v2 = v39;
                if (identityRef)
                {
                  CFRelease(identityRef);
                  SecIdentityRef identityRef = 0;
                }
              }
              else
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_221304000, v22, OS_LOG_TYPE_INFO, "Retrieving Kerberos names from certificate", buf, 2u);
                }

                CFDictionaryRef v23 = (void *)SecCertificateCopyNTPrincipalNames();
                v24 = [v23 objectAtIndex:0];
                uint64_t v25 = SecCertificateCopyIssuerSummary();
                if ([v24 length])
                {
                  uint64_t v37 = v25;
                  OSStatus v26 = objc_opt_new();
                  [v26 setUpn:v24];
                  [v16 objectForKeyedSubscript:v34];
                  OSStatus v27 = v36 = v23;
                  [v26 setCertName:v27];

                  [v26 setIdentity:identityRef];
                  [v26 setAttributes:v16];
                  v28 = [v16 objectForKeyedSubscript:v40];
                  [v26 setPersistientRef:v28];

                  v29 = [v16 objectForKeyedSubscript:v47];
                  [v26 setTokenID:v29];

                  CFDictionaryRef v23 = v36;
                  [v26 setIssuer:v37];
                  [v35 addObject:v26];

                  uint64_t v25 = v37;
                }
                v38 = v24;
                v30 = (void *)v25;
                if (certificateRef[0])
                {
                  CFRelease(certificateRef[0]);
                  certificateRef[0] = 0;
                }
                v2 = v39;
                if (identityRef)
                {
                  CFRelease(identityRef);
                  SecIdentityRef identityRef = 0;
                }
              }
            }
          }
          else
          {
            __int16 v16 = SO_LOG_SOSmartcard();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              +[SOSmartcard availableSmartCards];
            }
          }

          uint64_t v8 = v41;
        }

        ++v9;
      }
      while (v4 != v9);
      uint64_t v31 = [v2 countByEnumeratingWithState:&v52 objects:v61 count:16];
      uint64_t v4 = v31;
    }
    while (v31);
  }

  return v35;
}

+ (void)availableSmartCards
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_221304000, log, OS_LOG_TYPE_ERROR, "unexpected type for SmartCard query", buf, 2u);
}

@end
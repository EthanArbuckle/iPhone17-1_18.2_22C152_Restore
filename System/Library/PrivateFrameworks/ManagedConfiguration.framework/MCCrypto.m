@interface MCCrypto
+ (BOOL)isValidPKCS12Data:(id)a3;
+ (__SecCertificate)copyCertificateRefFromPEMData:(id)a3;
+ (__SecCertificate)copyCertificateRefFromPKCS1Data:(id)a3;
+ (id)_decryptionFailedErrorWithUnderlyingError:(id)a3;
+ (id)createAndStoreNewActivationLockBypassCodeAndHash;
+ (id)createAndStoreNewActivationLockBypassCodeAndHashIfNeeded;
+ (id)objectFromEncryptedData:(id)a3 outCertificate:(__SecCertificate *)a4 outError:(id *)a5;
+ (id)storeActivationLockBypassCode:(id)a3 hash:(id)a4;
+ (id)storedActivationLockBypassCodeHash;
+ (id)storedActivationLockBypassCodeWithOutError:(id *)a3;
+ (void)clearStoredActivationLockBypassCode;
+ (void)clearStoredActivationLockHash;
+ (void)createNewActivationLockBypassCodeOutCode:(char *)a3 outRawBytes:(char *)a4 outHash:(char *)a5;
@end

@implementation MCCrypto

+ (__SecCertificate)copyCertificateRefFromPKCS1Data:(id)a3
{
  return SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)a3);
}

+ (__SecCertificate)copyCertificateRefFromPEMData:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4 encoding:1];

  uint64_t v6 = [v5 rangeOfString:@"-----BEGIN CERTIFICATE-----"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    v8 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = v6 + v7;
  uint64_t v10 = objc_msgSend(v5, "rangeOfString:options:range:", @"-----END CERTIFICATE-----", 0, v9, objc_msgSend(v5, "length") - v9);
  v8 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v10 != v9)
  {
    v12 = objc_msgSend(v5, "substringWithRange:", v9, v10 - v9);
    CFDataRef v13 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:1];

    if (v13)
    {
      v8 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13);

      goto LABEL_9;
    }
    goto LABEL_2;
  }
LABEL_9:

  return v8;
}

+ (BOOL)isValidPKCS12Data:(id)a3
{
  CFArrayRef items = 0;
  return SecPKCS12Import((CFDataRef)a3, MEMORY[0x1E4F1CC08], &items) != -26275;
}

+ (id)_decryptionFailedErrorWithUnderlyingError:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  v12 = MCErrorArray(@"DECRYPTION_FAILED", v5, v6, v7, v8, v9, v10, v11, 0);
  CFDataRef v13 = MCLocalizedErrorString(@"DECRYPTION_FAILED_SUGGESTION");
  v14 = MCUSEnglishErrorString(@"DECRYPTION_FAILED_SUGGESTION");
  v15 = [v3 MCErrorWithDomain:@"MCProfileErrorDomain" code:1006 descriptionArray:v12 suggestion:v13 USEnglishSuggestion:v14 underlyingError:v4 errorType:@"MCFatalError"];

  return v15;
}

+ (id)objectFromEncryptedData:(id)a3 outCertificate:(__SecCertificate *)a4 outError:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA58];
  id v9 = a3;
  uint64_t v10 = [v8 data];
  int v11 = SecCMSDecryptEnvelopedData();

  if (v11)
  {
    v12 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v11;
      _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Decryption failed (CMS error): %d", buf, 8u);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    v14 = (void *)[v13 initWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    v15 = [a1 _decryptionFailedErrorWithUnderlyingError:v14];

LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  if ([v10 length]) {
    BOOL v16 = cf == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    v17 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, "Decryption failed (profile data was empty)", buf, 2u);
    }
    v15 = [a1 _decryptionFailedErrorWithUnderlyingError:0];
    goto LABEL_13;
  }
  id v26 = 0;
  v19 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v10 options:2 format:0 error:&v26];
  id v20 = v26;
  v21 = v20;
  v15 = 0;
  if (!v19)
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      v24 = [v21 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v29 = v24;
      _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "Decryption failed (profile data error): %{public}@", buf, 0xCu);
    }
    v15 = [a1 _decryptionFailedErrorWithUnderlyingError:v21];
  }

LABEL_14:
  if (v15)
  {
    id v18 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = (__SecCertificate *)cf;
    }
    else if (cf)
    {
      CFRelease(cf);
    }
    id v18 = v19;
  }

  return v18;
}

+ (id)createAndStoreNewActivationLockBypassCodeAndHashIfNeeded
{
  v3 = [a1 storedActivationLockBypassCodeHash];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [a1 createAndStoreNewActivationLockBypassCodeAndHash];
  }
  return v4;
}

+ (id)createAndStoreNewActivationLockBypassCodeAndHash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[MCCrypto createNewActivationLockBypassCodeOutCode:v15 outRawBytes:v14 outHash:v13];
  v2 = (void *)[[NSString alloc] initWithBytesNoCopy:v15 length:31 encoding:1 freeWhenDone:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v13 length:32 freeWhenDone:0];
  id v4 = +[MCCrypto storeActivationLockBypassCode:v2 hash:v3];

  memset(v15, 0, sizeof(v15));
  v14[0] = 0;
  v14[1] = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v5 = _MCLogObjects;
  if (v4)
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 138543362;
    v12 = v4;
    uint64_t v6 = "Could not store activation lock bypass code. Error: %{public}@";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    uint64_t v6 = "Successfully created and stored new activation lock bypass code.";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1A13F0000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:
  return v4;
}

+ (void)createNewActivationLockBypassCodeOutCode:(char *)a3 outRawBytes:(char *)a4 outHash:(char *)a5
{
  uint64_t v5 = a4;
  arc4random_buf(a4, 0x10uLL);
  pbkdf2();
  int v7 = 0;
  os_log_type_t v8 = &createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kDashPositions;
  for (int i = 1; i != 26; ++i)
  {
    if (v7 >= 3) {
      unsigned int v10 = 8 - v7;
    }
    else {
      unsigned int v10 = 5;
    }
    int v11 = (*v5 << v7) >> (8 - v10);
    if (v7 <= 2)
    {
      int v12 = 5;
    }
    else
    {
      ++v5;
      int v12 = -3;
    }
    if (v10 <= 4) {
      int v11 = (*v5 >> (v10 + 3)) | (v11 << (5 - v10));
    }
    *a3 = createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kSymbols[v11];
    if (i == *v8)
    {
      ++v8;
      a3[1] = 45;
      a3 += 2;
    }
    else
    {
      ++a3;
    }
    v7 += v12;
  }
  *a3 = createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kSymbols[*v5 & 7];
  a3[1] = 0;
}

+ (id)storeActivationLockBypassCode:(id)a3 hash:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  os_log_type_t v8 = (uint64_t *)MEMORY[0x1E4F3B578];
  if (!v7
    || (uint64_t v9 = *MEMORY[0x1E4F3B578],
        id v15 = 0,
        LOWORD(v13) = 1,
        +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v5, @"com.apple.managedconfiguration.alescrow", @"escrowCode", 0, 0, v9, @"apple", v13, &v15), (id v10 = v15) == 0))
  {
    if (![v6 length]
      || (uint64_t v11 = *v8,
          id v14 = 0,
          LOWORD(v13) = 1,
          +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v6, @"com.apple.managedconfiguration.alescrow", @"escrowHash", 0, 0, v11, @"apple", v13, &v14), (id v10 = v14) == 0))
    {
      MCSendActivationLockBypassCodeWasStoredNotification();
      id v10 = 0;
    }
  }

  return v10;
}

+ (id)storedActivationLockBypassCodeWithOutError:(id *)a3
{
  return +[MCKeychain stringFromService:@"com.apple.managedconfiguration.alescrow" account:@"escrowCode" label:0 description:0 group:@"apple" useSystemKeychain:1 outError:a3];
}

+ (void)clearStoredActivationLockBypassCode
{
}

+ (void)clearStoredActivationLockHash
{
}

+ (id)storedActivationLockBypassCodeHash
{
  return +[MCKeychain dataFromService:@"com.apple.managedconfiguration.alescrow" account:@"escrowHash" label:0 description:0 group:@"apple" useSystemKeychain:1 outError:0];
}

@end
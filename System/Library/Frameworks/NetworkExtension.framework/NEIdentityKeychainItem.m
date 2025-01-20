@interface NEIdentityKeychainItem
+ (id)copyIdentities:(id)a3 fromDomain:(int64_t)a4;
+ (id)importPKCS12Data:(id)a3 passphrase:(id)a4;
+ (uint64_t)copyPropertiesForIdentity:(void *)a3 persistentReference:;
- (NEIdentityKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEIdentityKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (id)copyData;
- (id)copyPassword;
- (id)copyQueryWithReturnTypes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)sync;
@end

@implementation NEIdentityKeychainItem

- (void)sync
{
  v61[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NEKeychainItem *)self persistentReference];
  if (v3)
  {
  }
  else
  {
    v4 = [(NEKeychainItem *)self identifier];

    if (v4)
    {
      id v46 = 0;
      int v5 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](self, 0, 0, &v46);
      id v6 = v46;
      if (v5) {
        [(NEKeychainItem *)self setPersistentReference:v6];
      }
    }
  }
  v7 = [(NEKeychainItem *)self persistentReference];

  if (v7)
  {
    CFTypeRef result = 0;
    v61[0] = *MEMORY[0x1E4F3BC80];
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
    CFDictionaryRef v9 = [(NEIdentityKeychainItem *)self copyQueryWithReturnTypes:v8];

    if (!SecItemCopyMatching(v9, &result))
    {
      CFTypeRef v17 = result;
      CFTypeID TypeID = SecIdentityGetTypeID();
      if (v17)
      {
        if (CFGetTypeID(v17) == TypeID)
        {
          *(void *)buf = 0;
          if (!SecIdentityCopyCertificate((SecIdentityRef)result, (SecCertificateRef *)buf))
          {
            v19 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
            v20 = v19;
            if (self)
            {
              v21 = self;
              objc_sync_enter(v21);
              objc_storeStrong((id *)&v21->super._identifier, v19);
              objc_sync_exit(v21);
            }
            CFRelease(*(CFTypeRef *)buf);
          }
        }
      }
    }
    if (result) {
      CFRelease(result);
    }
    v10 = [(NEKeychainItem *)self accessGroup];

    if (!v10) {
      goto LABEL_40;
    }
    CFTypeRef result = 0;
    uint64_t v60 = *MEMORY[0x1E4F3BC68];
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    CFDictionaryRef v12 = [(NEIdentityKeychainItem *)self copyQueryWithReturnTypes:v11];

    OSStatus v13 = SecItemCopyMatching(v12, &result);
    if (v13)
    {
      OSStatus v14 = v13;
      v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [(NEKeychainItem *)self persistentReference];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v16;
        __int16 v48 = 1024;
        LODWORD(v49) = v14;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Cannot update access group, failed to find item with persistent reference %@: %d", buf, 0x12u);
      }
      goto LABEL_37;
    }
    v15 = (id)result;
    if (isa_nsdictionary(v15))
    {
      uint64_t v22 = *MEMORY[0x1E4F3B828];
      v23 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3B828]];
      if (isa_nsdata(v23))
      {
        uint64_t v25 = *MEMORY[0x1E4F3B980];
        v56[0] = *MEMORY[0x1E4F3B978];
        uint64_t v24 = v56[0];
        v56[1] = v22;
        v58[0] = v25;
        v58[1] = v23;
        uint64_t v57 = *MEMORY[0x1E4F3BD20];
        uint64_t v26 = v57;
        uint64_t v59 = *MEMORY[0x1E4F1CFD0];
        uint64_t v27 = v59;
        CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v56 count:3];
        uint64_t v29 = *MEMORY[0x1E4F3B9A0];
        uint64_t v30 = *MEMORY[0x1E4F3B5D0];
        v54[0] = v24;
        v54[1] = v30;
        v55[0] = v29;
        v55[1] = v23;
        v54[2] = v26;
        v55[2] = v27;
        CFDictionaryRef v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
        uint64_t v52 = *MEMORY[0x1E4F3B550];
        v32 = [(NEKeychainItem *)self accessGroup];
        v53 = v32;
        CFDictionaryRef v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];

        OSStatus v34 = SecItemUpdate(v28, v33);
        if (v34)
        {
          OSStatus v35 = v34;
          v36 = ne_log_obj();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v44 = [(NEKeychainItem *)self accessGroup];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v44;
            __int16 v48 = 2112;
            v49 = v23;
            __int16 v50 = 1024;
            OSStatus v51 = v35;
            v37 = "Failed to update the access group to %@ for certificate %@: %d";
LABEL_45:
            _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x1Cu);
          }
        }
        else
        {
          OSStatus v41 = SecItemUpdate(v31, v33);
          if (!v41)
          {
LABEL_34:

            goto LABEL_35;
          }
          OSStatus v42 = v41;
          v36 = ne_log_obj();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v44 = [(NEKeychainItem *)self accessGroup];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v44;
            __int16 v48 = 2112;
            v49 = v23;
            __int16 v50 = 1024;
            OSStatus v51 = v42;
            v37 = "Failed to update the access group to %@ for key %@: %d";
            goto LABEL_45;
          }
        }

        goto LABEL_34;
      }
      ne_log_obj();
      CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      v38 = "Cannot update access group, identity has no public key hash attribute";
      v39 = v28;
      uint32_t v40 = 2;
    }
    else
    {
      v23 = ne_log_obj();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

LABEL_37:
        [(NEKeychainItem *)self setAccessGroup:0];
        if (result) {
          CFRelease(result);
        }

LABEL_40:
        goto LABEL_41;
      }
      CFDictionaryRef v28 = [(NEKeychainItem *)self persistentReference];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v28;
      v38 = "Cannot update access group, failed to fetch attributes for persistent reference %@";
      v39 = v23;
      uint32_t v40 = 12;
    }
    _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_35;
  }
LABEL_41:
  [(NEKeychainItem *)self setData:0];
  if (self) {
    objc_setProperty_atomic_copy(self, v43, 0, 72);
  }
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(NEKeychainItem *)self persistentReference];

  if (v6)
  {
    if (v4) {
      [v5 setObject:*MEMORY[0x1E4F3B990] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    }
    v7 = [(NEKeychainItem *)self persistentReference];
    v8 = (void *)MEMORY[0x1E4F3BD40];
  }
  else
  {
    CFDictionaryRef v9 = [(NEKeychainItem *)self identifier];

    if (!v9) {
      goto LABEL_8;
    }
    [v5 setObject:*MEMORY[0x1E4F3B990] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    v7 = [(NEKeychainItem *)self identifier];
    v8 = (void *)MEMORY[0x1E4F3B788];
  }
  [v5 setObject:v7 forKeyedSubscript:*v8];

LABEL_8:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  return v5;
}

- (id)copyData
{
  return 0;
}

- (id)copyPassword
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NEKeychainItem *)self persistentReference];
  int64_t v6 = [(NEKeychainItem *)self domain];
  v7 = [(NEKeychainItem *)self accessGroup];
  v8 = (void *)[v4 initWithPersistentReference:v5 domain:v6 accessGroup:v7];

  return v8;
}

- (NEIdentityKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  return 0;
}

- (NEIdentityKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  return 0;
}

+ (id)importPKCS12Data:(id)a3 passphrase:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F3B9E8];
    CFArrayRef items = 0;
    uint64_t v32 = v8;
    v33[0] = v6;
    CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    if (v9 && !SecPKCS12Import(v5, v9, &items))
    {
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFMutableArrayRef v14 = CFArrayCreateMutable(v12, 0, MEMORY[0x1E4F1D510]);
      id v10 = 0;
      theArray = v14;
      if (Mutable) {
        BOOL v15 = v14 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        goto LABEL_5;
      }
      if (CFArrayGetCount(items))
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
        Value = (__SecCertificate *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
        trust = (__SecTrust *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F8]);
        CFIndex CertificateCount = SecTrustGetCertificateCount(trust);
        if (CertificateCount >= 1)
        {
          CFIndex v17 = 0;
          key = (void *)*MEMORY[0x1E4F3BD48];
          long long v18 = (const void *)*MEMORY[0x1E4F3BC78];
          long long v19 = (const void *)*MEMORY[0x1E4F1CFD0];
          long long v20 = (const void *)*MEMORY[0x1E4F3B558];
          v21 = (const void *)*MEMORY[0x1E4F3B570];
          uint64_t v22 = (const void *)*MEMORY[0x1E4F3BD20];
          do
          {
            CFTypeRef result = 0;
            SecCertificateRef CertificateAtIndex = Value;
            if (v17) {
              SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, v17);
            }
            CFDictionarySetValue(Mutable, key, CertificateAtIndex);
            CFDictionarySetValue(Mutable, v18, v19);
            CFDictionarySetValue(Mutable, v20, v21);
            CFDictionarySetValue(Mutable, v22, v19);
            OSStatus v24 = SecItemAdd(Mutable, &result);
            if (v24 == -25299)
            {
              CFDictionaryRemoveValue(Mutable, v20);
              OSStatus v24 = SecItemCopyMatching(Mutable, &result);
            }
            if (!v24 && result)
            {
              CFArrayAppendValue(theArray, result);
              CFRelease(result);
            }
            ++v17;
          }
          while (CertificateCount != v17);
        }
        CFRelease(Mutable);
        CFRelease(items);
        id v10 = theArray;
        goto LABEL_5;
      }
    }
    id v10 = 0;
LABEL_5:

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

+ (id)copyIdentities:(id)a3 fromDomain:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFTypeRef result = 0;
  [v5 setObject:*MEMORY[0x1E4F3B990] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F3BD40];
    v7 = v5;
    id v8 = v4;
  }
  else
  {
    id v8 = (id)*MEMORY[0x1E4F3BB88];
    uint64_t v6 = *MEMORY[0x1E4F3BB80];
    v7 = v5;
  }
  [v7 setObject:v8 forKeyedSubscript:v6];
  [v5 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v9)
  {
    OSStatus v10 = v9;
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v10;
    CFDictionaryRef v31 = "SecItemCopyMatching failed: %d";
    uint64_t v32 = v11;
    uint32_t v33 = 8;
    goto LABEL_35;
  }
  CFTypeRef v14 = result;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v14 && CFGetTypeID(v14) == TypeID)
  {
    id v34 = v4;
    uint64_t v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFIndex v16 = 0;
    id v12 = 0;
    CFArrayRef v17 = (const __CFArray *)result;
    long long v18 = &off_1E598D000;
    while (v16 < CFArrayGetCount(v17))
    {
      CFDictionaryRef ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(v17, v16);
      CFTypeID v20 = SecIdentityGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v20)
      {
        v21 = (void *)+[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]((uint64_t)v18[203], ValueAtIndex, 0);
        uint64_t v22 = v21;
        if (v21)
        {
          v23 = [v21 objectForKeyedSubscript:@"persistent-reference"];
          OSStatus v24 = [v11 objectForKeyedSubscript:v23];

          if (!v24)
          {
            uint64_t v25 = [v22 objectForKeyedSubscript:@"persistent-reference"];
            [v11 setObject:v22 forKeyedSubscript:v25];

            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            objc_msgSend(v12, "addObject:", v22, v34);
            long long v18 = &off_1E598D000;
          }
        }
      }
      ++v16;
    }
    id v4 = v34;
  }
  else
  {
    CFTypeRef v26 = result;
    CFTypeID v27 = SecIdentityGetTypeID();
    if (!v26 || CFGetTypeID(v26) != v27)
    {
      CFTypeRef v28 = result;
      uint64_t v29 = ne_log_obj();
      uint64_t v11 = v29;
      if (!v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_INFO, "SecItemCopyMatching returned NULL while searching for identities", buf, 2u);
        }
        goto LABEL_6;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        id v12 = 0;
        goto LABEL_7;
      }
      CFTypeID v30 = CFGetTypeID(result);
      *(_DWORD *)buf = 134217984;
      CFTypeID v37 = v30;
      CFDictionaryRef v31 = "SecItemCopyMatching returned an unsupported type (%lu) when searching for identities";
      uint64_t v32 = v11;
      uint32_t v33 = 12;
LABEL_35:
      _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      goto LABEL_6;
    }
    uint64_t v11 = +[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]((uint64_t)NEIdentityKeychainItem, (__SecIdentity *)result, v4);
    if (!v11) {
      goto LABEL_6;
    }
    id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
  }
LABEL_7:

  if (result) {
    CFRelease(result);
  }

  return v12;
}

+ (uint64_t)copyPropertiesForIdentity:(void *)a3 persistentReference:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  if (v4) {
    goto LABEL_2;
  }
  self;
  CFTypeRef result = 0;
  OSStatus v10 = (__SecCertificate *)*MEMORY[0x1E4F3BD48];
  certificateRef[0] = *(SecCertificateRef *)MEMORY[0x1E4F3BC78];
  certificateRef[1] = v10;
  *(void *)buf = MEMORY[0x1E4F1CC38];
  *(void *)&buf[8] = a2;
  certificateRef[2] = *(SecCertificateRef *)MEMORY[0x1E4F3BD20];
  *(void *)&buf[16] = *MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:certificateRef count:3];
  if (SecItemCopyMatching(v11, &result)) {
    goto LABEL_19;
  }
  CFTypeRef v12 = result;
  CFTypeID TypeID = CFDataGetTypeID();
  if (!v12)
  {
    id v4 = (id)result;
LABEL_14:
    CFIndex v16 = ne_log_obj();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v17)
      {
        CFTypeID v18 = CFGetTypeID(result);
        *(_DWORD *)CFTypeRef v26 = 134217984;
        CFTypeID v27 = v18;
        long long v19 = "SecItemCopyMatching returned an object with an unexpected type (%lu) when getting an identity's persistent reference";
        CFTypeID v20 = v16;
        uint32_t v21 = 12;
LABEL_25:
        _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, v19, v26, v21);
      }
    }
    else if (v17)
    {
      *(_WORD *)CFTypeRef v26 = 0;
      long long v19 = "SecItemCopyMatching returned NULL when getting an identity's persistent reference";
      CFTypeID v20 = v16;
      uint32_t v21 = 2;
      goto LABEL_25;
    }

LABEL_19:
    if (result) {
      CFRelease(result);
    }

    id v4 = 0;
    goto LABEL_22;
  }
  CFTypeID v14 = TypeID;
  CFTypeID v15 = CFGetTypeID(v12);
  id v4 = (id)result;
  if (v15 != v14) {
    goto LABEL_14;
  }

  if (!v4)
  {
LABEL_22:
    uint64_t v9 = 0;
    goto LABEL_23;
  }
LABEL_2:
  certificateRef[0] = 0;
  OSStatus v6 = SecIdentityCopyCertificate(a2, certificateRef);
  if (v6)
  {
    OSStatus v7 = v6;
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@: failed to get the certificate from an identity: %d", buf, 0x12u);
    }
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = SecCertificateCopyData(certificateRef[0]);
    CFRelease(certificateRef[0]);
    v24[0] = @"persistent-reference";
    v24[1] = @"certificate-data";
    v25[0] = v4;
    v25[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  }

LABEL_23:
  return v9;
}

@end
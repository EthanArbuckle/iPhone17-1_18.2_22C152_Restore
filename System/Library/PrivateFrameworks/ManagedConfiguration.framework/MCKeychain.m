@interface MCKeychain
+ (BOOL)itemExistsInKeychain:(void *)a3;
+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4;
+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 enforcePersonalPersona:(BOOL)a12 outError:(id *)a13;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 outError:(id *)a9;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 outError:(id *)a9;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8;
+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3;
+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4;
+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3;
+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4;
+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (id)canonicalPersistentReferenceForItemWithPersistentReference:(id)a3 inSystemKeychain:(BOOL)a4;
+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 enforcePersonalPersona:(BOOL)a9 outError:(id *)a10;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 accessibility:(__CFString *)a7;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7 accessibility:(__CFString *)a8;
+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8;
+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7;
+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8;
+ (void)copyItemWithPersistentID:(id)a3;
+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4;
+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7;
+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 enforcePersonalPersona:(BOOL)a8 group:(id)a9;
+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 group:(id)a8;
+ (void)removeItemWithPersistentID:(id)a3;
+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4;
+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
@end

@implementation MCKeychain

+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 length])
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v14);
    if ([v15 length]) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v15);
    }
    if ([v16 length]) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], v16);
    }
    if ([v17 length]) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B678], v17);
    }
    if ([v18 length]) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v18);
    }
    if (v9) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD20], MEMORY[0x1E4F1CC38]);
    }
  }
  else
  {
    if (a9)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = MCErrorArray(@"KEYCHAIN_ERROR_CANNOT_CREATE_QUERY", v19, v20, v21, v22, v23, v24, v25, 0);
      *a9 = [v27 MCErrorWithDomain:@"MCKeychainErrorDomain" code:6002 descriptionArray:v28 errorType:@"MCFatalError"];
    }
    Mutable = 0;
  }

  return Mutable;
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8
{
  return (id)[a1 stringFromService:a3 account:a4 label:a5 description:a6 group:0 useSystemKeychain:a7 outError:a8];
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  BOOL v9 = +[MCKeychain dataFromService:a3 account:a4 label:a5 description:a6 group:a7 useSystemKeychain:a8 outError:a9];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v9, "bytes"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  LOBYTE(v10) = a8;
  return [a1 setString:a3 forService:a4 account:a5 label:a6 description:a7 group:0 useSystemKeychain:v10 outError:a9];
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10
{
  LOWORD(v11) = a9;
  return objc_msgSend(a1, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, *MEMORY[0x1E4F3B578], a8, v11, a10);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  uint64_t v22 = [a3 dataUsingEncoding:4];
  LOWORD(v25) = __PAIR16__(a11, a10);
  BOOL v23 = +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v22, v21, v20, v19, v18, a8, v17, v25, a12);

  return v23;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  LOBYTE(v10) = a8;
  return [a1 setData:a3 forService:a4 account:a5 label:a6 description:a7 access:*MEMORY[0x1E4F3B578] useSystemKeychain:v10 outError:a9];
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10
{
  LOWORD(v11) = a9;
  return objc_msgSend(a1, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, 0, v11, a10);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17 = (void *)MEMORY[0x1E4F73170];
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  uint64_t v24 = [v17 sharedConfiguration];
  uint64_t v25 = [v24 personaID];
  BYTE2(v28) = v25 != 0;
  LOWORD(v28) = __PAIR16__(a11, a10);
  BOOL v26 = +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v23, v22, v21, v20, v19, a8, v18, v28, a12);

  return v26;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 enforcePersonalPersona:(BOOL)a12 outError:(id *)a13
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  v57 = v19;
  if ([v18 length])
  {
    id v64 = 0;
    v31 = +[MCKeychain _newQueryWithService:v19 account:v20 label:v21 description:v22 group:v23 useSystemKeychain:a10 outError:&v64];
    id v32 = v64;
    if (v32)
    {
      v33 = v32;
      if (v31) {
        CFRelease(v31);
      }
      goto LABEL_17;
    }
    LOBYTE(v56) = a12;
    v36 = +[MCKeychain dataFromService:v19 account:v20 label:v21 description:v22 group:v23 useSystemKeychain:a10 enforcePersonalPersona:v56 outError:0];
    *(void *)&long long v69 = 0;
    *((void *)&v69 + 1) = &v69;
    uint64_t v70 = 0x2020000000;
    int v71 = 0;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __131__MCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke;
    v58[3] = &unk_1E5A65A28;
    id v37 = v36;
    id v59 = v37;
    id v60 = v18;
    v61 = &v69;
    v62 = a8;
    v63 = v31;
    uint64_t v38 = MEMORY[0x1A6232FE0](v58);
    v39 = (void *)v38;
    if (a12)
    {
      v33 = [MEMORY[0x1E4F5E7B0] performBlockUnderPersonalPersona:v38];
    }
    else
    {
      (*(void (**)(uint64_t))(v38 + 16))(v38);
      v33 = 0;
    }
    CFRelease(v31);
    if (v33)
    {
      v40 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "+[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforceP"
              "ersonalPersona:outError:]";
        __int16 v67 = 2112;
        v68 = v33;
        _os_log_impl(&dword_1A13F0000, v40, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
    else if (*(_DWORD *)(*((void *)&v69 + 1) + 24))
    {
      v41 = (void *)MEMORY[0x1E4F28C58];
      v42 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *(unsigned int *)(*((void *)&v69 + 1) + 24));
      v50 = MCErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE", v43, v44, v45, v46, v47, v48, v49, v42);
      v33 = [v41 MCErrorWithDomain:@"MCKeychainErrorDomain" code:6000 descriptionArray:v50 errorType:@"MCFatalError"];
    }
    else
    {
      v33 = 0;
    }

    _Block_object_dispose(&v69, 8);
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    v35 = MCErrorArray(@"KEYCHAIN_ERROR_EMPTY_DATA", v24, v25, v26, v27, v28, v29, v30, 0);
    v33 = [v34 MCErrorWithDomain:@"MCKeychainErrorDomain" code:6001 descriptionArray:v35 errorType:@"MCFatalError"];
  }
  if (!v33)
  {
    BOOL v54 = 1;
    goto LABEL_23;
  }
LABEL_17:
  if (a13) {
    *a13 = v33;
  }
  v51 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v52 = v51;
    v53 = [v33 MCVerboseDescription];
    LODWORD(v69) = 138543362;
    *(void *)((char *)&v69 + 4) = v53;
    _os_log_impl(&dword_1A13F0000, v52, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", (uint8_t *)&v69, 0xCu);
  }
  BOOL v54 = 0;
LABEL_23:

  return v54;
}

void __131__MCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (([v2 isEqualToData:*(void *)(a1 + 40)] & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *MEMORY[0x1E4F3B558];
      v7[0] = *MEMORY[0x1E4F3BD38];
      v7[1] = v4;
      uint64_t v5 = *(void *)(a1 + 56);
      v8[0] = v3;
      v8[1] = v5;
      CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SecItemUpdate(*(CFDictionaryRef *)(a1 + 64), v6);
    }
  }
  else
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F3BD38], *(const void **)(a1 + 40));
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F3B558], *(const void **)(a1 + 56));
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F3B888], MEMORY[0x1E4F1CC38]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 64), 0);
  }
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8
{
  return (id)[a1 dataFromService:a3 account:a4 label:a5 description:a6 group:0 useSystemKeychain:a7 outError:a8];
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  BOOL v9 = a8;
  v13 = (void *)MEMORY[0x1E4F73170];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v13 sharedConfiguration];
  id v19 = [v18 personaID];
  LOBYTE(v22) = v19 != 0;
  id v20 = +[MCKeychain dataFromService:v17 account:v16 label:v15 description:v14 group:0 useSystemKeychain:v9 enforcePersonalPersona:v22 outError:a9];

  return v20;
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 enforcePersonalPersona:(BOOL)a9 outError:(id *)a10
{
  BOOL v10 = a8;
  v53[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v46 = 0;
  id v20 = +[MCKeychain _newQueryWithService:v15 account:v16 label:v17 description:v18 group:v19 useSystemKeychain:v10 outError:&v46];
  id v21 = v46;
  if (v21)
  {
    uint64_t v22 = v21;
    if (v20)
    {
      CFRelease(v20);
      id v20 = 0;
    }
    goto LABEL_16;
  }
  CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  *(void *)&long long v51 = 0;
  *((void *)&v51 + 1) = &v51;
  uint64_t v52 = 0x2020000000;
  v53[0] = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  if (a9)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __112__MCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke;
    v41[3] = &unk_1E5A65A50;
    v41[5] = &v51;
    v41[6] = v20;
    v41[4] = &v42;
    uint64_t v22 = [MEMORY[0x1E4F5E7B0] performBlockUnderPersonalPersona:v41];
  }
  else
  {
    OSStatus v23 = SecItemCopyMatching(v20, v53);
    uint64_t v22 = 0;
    *((_DWORD *)v43 + 6) = v23;
  }
  CFRelease(v20);
  if (v22)
  {
    uint64_t v24 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "+[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:]";
      __int16 v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1A13F0000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    int v25 = *((_DWORD *)v43 + 6);
    if (v25 == -25300 || !v25)
    {
      uint64_t v22 = 0;
      id v20 = *(__CFDictionary **)(*((void *)&v51 + 1) + 24);
      goto LABEL_15;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *((unsigned int *)v43 + 6));
    v35 = MCErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE", v28, v29, v30, v31, v32, v33, v34, v27);
    uint64_t v22 = [v26 MCErrorWithDomain:@"MCKeychainErrorDomain" code:6000 descriptionArray:v35 errorType:@"MCFatalError"];
  }
  id v20 = 0;
LABEL_15:
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v51, 8);
  if (!v22)
  {
    id v20 = v20;
    v39 = v20;
    goto LABEL_21;
  }
LABEL_16:
  if (a10) {
    *a10 = v22;
  }
  v36 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    id v37 = v36;
    uint64_t v38 = [v22 MCVerboseDescription];
    LODWORD(v51) = 138543362;
    *(void *)((char *)&v51 + 4) = v38;
    _os_log_impl(&dword_1A13F0000, v37, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", (uint8_t *)&v51, 0xCu);
  }
  v39 = 0;
LABEL_21:

  return v39;
}

uint64_t __112__MCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  uint64_t result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 group:(id)a8
{
  BOOL v8 = a7;
  v13 = (void *)MEMORY[0x1E4F73170];
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v20 = [v13 sharedConfiguration];
  id v19 = [v20 personaID];
  +[MCKeychain removeItemForService:v18 account:v17 label:v16 description:v15 useSystemKeychain:v8 enforcePersonalPersona:v19 != 0 group:v14];
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 enforcePersonalPersona:(BOOL)a8 group:(id)a9
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v10 = +[MCKeychain _newQueryWithService:a3 account:a4 label:a5 description:a6 group:a9 useSystemKeychain:a7 outError:0];
  if (v10)
  {
    uint64_t v11 = v10;
    if (a8)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __108__MCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke;
      v15[3] = &__block_descriptor_40_e5_v8__0l;
      v15[4] = v10;
      uint64_t v12 = [MEMORY[0x1E4F5E7B0] performBlockUnderPersonalPersona:v15];
      if (v12)
      {
        v13 = (void *)v12;
        id v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v17 = "+[MCKeychain removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:]";
          __int16 v18 = 2112;
          id v19 = v13;
          _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      SecItemDelete(v10);
    }
    CFRelease(v11);
  }
}

uint64_t __108__MCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke(uint64_t a1)
{
  return SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
}

+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F73170];
  id v6 = a3;
  v7 = [v5 sharedConfiguration];
  BOOL v8 = [v7 personaID];
  BOOL v9 = +[MCKeychain copyItemWithPersistentID:v6 useSystemKeychain:v4 enforcePersonalPersona:v8 != 0];

  return v9;
}

+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v36[2] = *MEMORY[0x1E4F143B8];
  v7 = (char *)a3;
  uint64_t v8 = *MEMORY[0x1E4F3BC80];
  v35[0] = *MEMORY[0x1E4F3BD40];
  v35[1] = v8;
  v36[0] = v7;
  v36[1] = MEMORY[0x1E4F1CC38];
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  BOOL v10 = (void *)[v9 mutableCopy];

  if (v6) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  CFTypeRef v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  if (!v5)
  {
    OSStatus v14 = SecItemCopyMatching((CFDictionaryRef)v10, &v30);
    *((_DWORD *)v24 + 6) = v14;
    goto LABEL_10;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F5E7B0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__MCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v19[3] = &unk_1E5A65A98;
  id v21 = &v23;
  id v20 = v10;
  uint64_t v22 = &v27;
  uint64_t v12 = [v11 performBlockUnderPersonalPersona:v19];

  if (!v12)
  {
    OSStatus v14 = *((_DWORD *)v24 + 6);
LABEL_10:
    if (v14 == -25300)
    {
      id v17 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v7;
        __int16 v33 = 1024;
        LODWORD(v34) = v6;
        _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_DEBUG, "Couldn't get item with ID: %{public}@ system keychain: %d", buf, 0x12u);
      }
    }
    else if (v14)
    {
      id v15 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v7;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Cannot retrieve item with persistent ID %{public}@", buf, 0xCu);
      }
      goto LABEL_14;
    }
    id v16 = (void *)v28[3];
    goto LABEL_18;
  }
  v13 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "+[MCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
    __int16 v33 = 2112;
    uint64_t v34 = v12;
    _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

LABEL_14:
  id v16 = 0;
LABEL_18:
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

uint64_t __80__MCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x1E4F73170];
  id v6 = a3;
  v7 = [v5 sharedConfiguration];
  uint64_t v8 = [v7 personaID];
  BOOL v9 = +[MCKeychain copyCertificateWithPersistentID:v6 useSystemKeychain:v4 enforcePersonalPersona:v8 != 0];

  return v9;
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (char *)a3;
  uint64_t v21 = 0;
  uint64_t v22 = (SecCertificateRef *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  BOOL v9 = (__SecCertificate *)[a1 copyItemWithPersistentID:v8 useSystemKeychain:v6 enforcePersonalPersona:v5];
  BOOL v10 = v9;
  if (v9)
  {
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == SecCertificateGetTypeID())
    {
      v22[3] = v10;
    }
    else
    {
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == SecIdentityGetTypeID())
      {
        if (v5)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __87__MCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
          v20[3] = &unk_1E5A65AC0;
          v20[4] = &v21;
          v20[5] = v10;
          v13 = [MEMORY[0x1E4F5E7B0] performBlockUnderPersonalPersona:v20];
          if (v13)
          {
            OSStatus v14 = _MCLogObjects;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              int v26 = "+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
              __int16 v27 = 2112;
              uint64_t v28 = v13;
              _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          SecIdentityCopyCertificate(v10, v22 + 3);
          v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        id v15 = (id)_MCLogObjects;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          CFTypeID v16 = CFGetTypeID(v10);
          id v17 = (__CFString *)CFCopyTypeIDDescription(v16);
          *(_DWORD *)buf = 138543618;
          int v26 = v8;
          __int16 v27 = 2114;
          uint64_t v28 = v17;
          _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Certificate with persistent ID: %{public}@ has unexpected type: %{public}@", buf, 0x16u);
        }
        CFRelease(v10);
      }
    }
  }
  __int16 v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __87__MCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  return SecIdentityCopyCertificate(*(SecIdentityRef *)(a1 + 40), (SecCertificateRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", *(void *)(*((void *)&v17 + 1) + 8 * v12), v4, (void)v17);
          if (!v13)
          {

            id v15 = 0;
            goto LABEL_14;
          }
          OSStatus v14 = v13;
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  id v7 = v7;
  id v15 = v7;
LABEL_14:

  return v15;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F73170];
  id v6 = a3;
  id v7 = [v5 sharedConfiguration];
  id v8 = [v7 personaID];
  uint64_t v9 = +[MCKeychain copyIdentityWithPersistentID:v6 useSystemKeychain:v4 enforcePersonalPersona:v8 != 0];

  return v9;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (const void *)[a1 copyItemWithPersistentID:v8 useSystemKeychain:v6 enforcePersonalPersona:v5];
  uint64_t v10 = v9;
  if (v9)
  {
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 != SecIdentityGetTypeID())
    {
      uint64_t v12 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        CFTypeID v14 = CFGetTypeID(v10);
        id v15 = (__CFString *)CFCopyTypeIDDescription(v14);
        int v17 = 138543618;
        id v18 = v8;
        __int16 v19 = 2114;
        long long v20 = v15;
        _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Identity with persistent ID: %{public}@ has unexpected type: %{public}@", (uint8_t *)&v17, 0x16u);
      }
      CFRelease(v10);
      uint64_t v10 = 0;
    }
  }

  return (__SecIdentity *)v10;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = (void *)MEMORY[0x1E4F73170];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 sharedConfiguration];
  v13 = [v12 personaID];
  CFTypeID v14 = +[MCKeychain saveItem:a3 withLabel:v11 group:v10 useSystemKeychain:v6 enforcePersonalPersona:v13 != 0];

  return v14;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 accessibility:(__CFString *)a7
{
  BOOL v8 = a6;
  id v11 = (void *)MEMORY[0x1E4F73170];
  id v12 = a5;
  id v13 = a4;
  CFTypeID v14 = [v11 sharedConfiguration];
  id v15 = [v14 personaID];
  CFTypeID v16 = +[MCKeychain saveItem:a3 withLabel:v13 group:v12 useSystemKeychain:v8 enforcePersonalPersona:v15 != 0 accessibility:a7];

  return v16;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = (void *)MEMORY[0x1E4F73170];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 sharedConfiguration];
  CFTypeID v14 = [v13 personaID];
  id v15 = +[MCKeychain saveItem:a3 withLabel:v12 group:v11 useSystemKeychain:v7 enforcePersonalPersona:v14 != 0 accessibility:*MEMORY[0x1E4F3B598]];

  return v15;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7 accessibility:(__CFString *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v51[4] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = *MEMORY[0x1E4F3B550];
  v50[0] = *MEMORY[0x1E4F3BD48];
  v50[1] = v15;
  v51[0] = a3;
  v51[1] = v14;
  uint64_t v16 = *MEMORY[0x1E4F3B558];
  v50[2] = *MEMORY[0x1E4F3BC78];
  v50[3] = v16;
  v51[2] = MEMORY[0x1E4F1CC38];
  v51[3] = a8;
  int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
  id v18 = (void *)[v17 mutableCopy];

  if (v10) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  if (v13) {
    [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  CFTypeRef v30 = __94__MCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility___block_invoke;
  uint64_t v31 = &unk_1E5A65AE8;
  __int16 v33 = &v42;
  id v19 = v18;
  uint64_t v34 = &v36;
  uint64_t v35 = 0;
  id v32 = v19;
  uint64_t v20 = MEMORY[0x1A6232FE0](&v28);
  uint64_t v21 = (void *)v20;
  if (v9)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F5E7B0], "performBlockUnderPersonalPersona:", v20, v28, v29, v30, v31);
    if (v22)
    {
      uint64_t v23 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v47 = "+[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:]";
        __int16 v48 = 2112;
        __int16 v49 = v22;
        _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }

LABEL_14:
      id v26 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v20 + 16))(v20);
  }
  if (*((_DWORD *)v43 + 6))
  {
    uint64_t v24 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v25 = *((_DWORD *)v43 + 6);
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v25;
      _os_log_impl(&dword_1A13F0000, v24, OS_LOG_TYPE_ERROR, "Could not store certificate in keychain. Error: %d", buf, 8u);
    }
    goto LABEL_14;
  }
  id v26 = (id)v37[5];
LABEL_16:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v26;
}

void __94__MCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = *(void *)(a1 + 56);

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -25299)
  {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B558]];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = *(void *)(a1 + 56);

    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -25300)
    {
      [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = *(void *)(a1 + 56);
    }
  }
}

+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x1E4F73170];
  id v6 = a3;
  id v8 = [v5 sharedConfiguration];
  BOOL v7 = [v8 personaID];
  +[MCKeychain removeItemWithPersistentID:v6 useSystemKeychain:v4 enforcePersonalPersona:v7 != 0];
}

+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F3BC68];
  v36[0] = *MEMORY[0x1E4F3BD40];
  v36[1] = v8;
  v37[0] = v7;
  v37[1] = MEMORY[0x1E4F1CC38];
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  BOOL v10 = (void *)[v9 mutableCopy];

  if (v6) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __82__MCKeychain_removeItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  uint64_t v22 = &unk_1E5A65B10;
  id v11 = v10;
  id v23 = v11;
  int v25 = v31;
  id v26 = &v27;
  id v12 = v7;
  id v24 = v12;
  uint64_t v13 = MEMORY[0x1A6232FE0](&v19);
  id v14 = (void *)v13;
  if (v5)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F5E7B0], "performBlockUnderPersonalPersona:", v13, v19, v20, v21, v22, v23);
    if (v15)
    {
      uint64_t v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v33 = "+[MCKeychain removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
        __int16 v34 = 2112;
        uint64_t v35 = v15;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
    uint64_t v15 = 0;
  }
  int v17 = *((_DWORD *)v28 + 6);
  if (v17 != -25300)
  {
    if (v17)
    {
      id v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v33 = (const char *)v12;
        _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "Could not remove identity or certificate with persistent id %{public}@ - error ignored.", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
}

void __82__MCKeychain_removeItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F3B550]];
    if ([v3 isEqualToString:@"lockdown-identities"])
    {
      BOOL v4 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Didn't remove lockdown identity with persistent id %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3BC68]];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
    }
  }
}

+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [MEMORY[0x1E4F73170] sharedConfiguration];
  uint64_t v7 = [v6 personaID];
  LOBYTE(v4) = +[MCKeychain itemExistsInKeychain:a3 useSystemKeychain:v4 enforcePersonalPersona:v7 != 0];

  return v4;
}

+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v30[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F3BC78];
  v29[0] = *MEMORY[0x1E4F3BD48];
  v29[1] = v7;
  v30[0] = a3;
  v30[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  BOOL v9 = (void *)[v8 mutableCopy];

  if (v6) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  CFTypeRef result = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  if (!v5)
  {
    OSStatus v14 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    *((_DWORD *)v21 + 6) = v14;
    if (result) {
      CFRelease(result);
    }
    goto LABEL_10;
  }
  BOOL v10 = (void *)MEMORY[0x1E4F5E7B0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__MCKeychain_itemExistsInKeychain_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v16[3] = &unk_1E5A65B38;
  id v18 = &v20;
  id v17 = v9;
  uint64_t v19 = 0;
  id v11 = [v10 performBlockUnderPersonalPersona:v16];

  if (!v11)
  {
LABEL_10:
    BOOL v13 = *((_DWORD *)v21 + 6) == 0;
    goto LABEL_11;
  }
  id v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "+[MCKeychain itemExistsInKeychain:useSystemKeychain:enforcePersonalPersona:]";
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

  BOOL v13 = 0;
LABEL_11:
  _Block_object_dispose(&v20, 8);

  return v13;
}

uint64_t __76__MCKeychain_itemExistsInKeychain_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7
{
  return +[MCKeychain stringFromService:a3 account:a4 label:a5 description:a6 useSystemKeychain:0 outError:a7];
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8
{
  return +[MCKeychain stringFromService:a3 account:a4 label:a5 description:a6 group:a7 useSystemKeychain:0 outError:a8];
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 outError:(id *)a9
{
  LOBYTE(v10) = 0;
  return +[MCKeychain setString:a3 forService:a4 account:a5 label:a6 description:a7 group:a8 useSystemKeychain:v10 outError:a9];
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10
{
  LOWORD(v11) = 0;
  return +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, a9, v11, a10);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8
{
  return +[MCKeychain setString:a3 forService:a4 account:a5 label:a6 description:a7 useSystemKeychain:0 outError:a8];
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7
{
  return +[MCKeychain dataFromService:a3 account:a4 label:a5 description:a6 useSystemKeychain:0 outError:a7];
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8
{
  return +[MCKeychain dataFromService:a3 account:a4 label:a5 description:a6 group:a7 useSystemKeychain:0 outError:a8];
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8
{
  return +[MCKeychain setData:a3 forService:a4 account:a5 label:a6 description:a7 useSystemKeychain:0 outError:a8];
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 outError:(id *)a9
{
  LOBYTE(v10) = 0;
  return +[MCKeychain setData:a3 forService:a4 account:a5 label:a6 description:a7 access:a8 useSystemKeychain:v10 outError:a9];
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10
{
  LOWORD(v11) = 0;
  return +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, a9, v11, a10);
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7
{
}

+ (void)copyItemWithPersistentID:(id)a3
{
  return +[MCKeychain copyItemWithPersistentID:a3 useSystemKeychain:0];
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  return +[MCKeychain copyCertificateWithPersistentID:a3 useSystemKeychain:0];
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3
{
  return +[MCKeychain copyIdentityWithPersistentID:a3 useSystemKeychain:0];
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5
{
  return +[MCKeychain saveItem:a3 withLabel:a4 group:a5 useSystemKeychain:0];
}

+ (void)removeItemWithPersistentID:(id)a3
{
}

+ (BOOL)itemExistsInKeychain:(void *)a3
{
  return +[MCKeychain itemExistsInKeychain:a3 useSystemKeychain:0];
}

+ (id)canonicalPersistentReferenceForItemWithPersistentReference:(id)a3 inSystemKeychain:(BOOL)a4
{
  BOOL v4 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3BC78];
  v26[0] = *MEMORY[0x1E4F3BD40];
  v26[1] = v6;
  v27[0] = v5;
  v27[1] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (v4) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  uint64_t v10 = (void *)result;
  if (!v9)
  {
    int v14 = [(id)result isEqualToData:v5];
    uint64_t v15 = _MCLogObjects;
    BOOL v16 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v5;
        id v17 = "Persistent reference %{public}@ is canonical!";
        id v18 = v15;
        uint32_t v19 = 12;
LABEL_12:
        _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v5;
      __int16 v24 = 2114;
      int v25 = v10;
      id v17 = "Persistent reference %{public}@ has canonical reference %{public}@";
      id v18 = v15;
      uint32_t v19 = 22;
      goto LABEL_12;
    }
    id v13 = v10;
    goto LABEL_14;
  }
  OSStatus v11 = v9;
  id v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v5;
    __int16 v24 = 1024;
    LODWORD(v25) = v11;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Unable to lookup item with persistent reference: %{public}@. Error: %d", buf, 0x12u);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

@end
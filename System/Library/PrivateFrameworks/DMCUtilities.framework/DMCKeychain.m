@interface DMCKeychain
+ (BOOL)deleteAttestationCertWithGroup:(id)a3 label:(id)a4;
+ (BOOL)deleteAttestationKeyWithGroup:(id)a3 label:(id)a4;
+ (BOOL)deleteAttestationMetadataWithGroup:(id)a3 service:(id)a4;
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 enforcePersonalPersona:(BOOL)a12 outError:(id *)a13;
+ (BOOL)storeAttestationCert:(__SecCertificate *)a3 withGroup:(id)a4 label:(id)a5;
+ (BOOL)storeAttestationKey:(__SecKey *)a3 withGroup:(id)a4 label:(id)a5;
+ (BOOL)storeAttestationMetadata:(id)a3 withGroup:(id)a4 service:(id)a5;
+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (__SecCertificate)retrieveAttestationCertWithGroup:(id)a3 label:(id)a4;
+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (__SecIdentity)retrieveAttestationIdentityWithGroup:(id)a3 label:(id)a4;
+ (__SecKey)retrieveAttestationKeyWithGroup:(id)a3 label:(id)a4;
+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 enforcePersonalPersona:(BOOL)a9 outError:(id *)a10;
+ (id)dataFromString:(id)a3;
+ (id)retrieveAttestationMetadataWithGroup:(id)a3 service:(id)a4;
+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7;
+ (id)stringFromServiceData:(id)a3;
+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5;
+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 enforcePersonalPersona:(BOOL)a8 group:(id)a9;
@end

@implementation DMCKeychain

+ (id)stringFromServiceData:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(a3, "bytes"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)dataFromString:(id)a3
{
  return (id)[a3 dataUsingEncoding:4];
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 enforcePersonalPersona:(BOOL)a12 outError:(id *)a13
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  v56 = v19;
  if ([v18 length])
  {
    id v63 = 0;
    v31 = +[DMCKeychain _newQueryWithService:v19 account:v20 label:v21 description:v22 group:v23 useSystemKeychain:a10 outError:&v63];
    id v32 = v63;
    if (v32)
    {
      v33 = v32;
      if (v31) {
        CFRelease(v31);
      }
      goto LABEL_17;
    }
    LOBYTE(v55) = a12;
    v36 = +[DMCKeychain dataFromService:v19 account:v20 label:v21 description:v22 group:v23 useSystemKeychain:a10 enforcePersonalPersona:v55 outError:0];
    *(void *)&long long v68 = 0;
    *((void *)&v68 + 1) = &v68;
    uint64_t v69 = 0x2020000000;
    int v70 = 0;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __132__DMCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke;
    v57[3] = &unk_1E5CFDE78;
    id v37 = v36;
    id v58 = v37;
    id v59 = v18;
    v60 = &v68;
    v61 = a8;
    v62 = v31;
    uint64_t v38 = MEMORY[0x1AD0D2220](v57);
    v39 = (void *)v38;
    if (a12)
    {
      v33 = +[DMCPersonaHelper performBlockUnderPersonalPersona:v38];
    }
    else
    {
      (*(void (**)(uint64_t))(v38 + 16))(v38);
      v33 = 0;
    }
    CFRelease(v31);
    if (v33)
    {
      v40 = *DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "+[DMCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforce"
              "PersonalPersona:outError:]";
        __int16 v66 = 2112;
        v67 = v33;
        _os_log_impl(&dword_1A7863000, v40, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
    else if (*(_DWORD *)(*((void *)&v68 + 1) + 24))
    {
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *(unsigned int *)(*((void *)&v68 + 1) + 24));
      v49 = DMCErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE_%@", v42, v43, v44, v45, v46, v47, v48, v41);

      v33 = [MEMORY[0x1E4F28C58] DMCErrorWithDomain:@"DMCKeychainErrorDomain" code:6000 descriptionArray:v49 errorType:@"DMCFatalError"];
    }
    else
    {
      v33 = 0;
    }

    _Block_object_dispose(&v68, 8);
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    v35 = DMCErrorArray(@"KEYCHAIN_ERROR_EMPTY_DATA", v24, v25, v26, v27, v28, v29, v30, 0);
    v33 = [v34 DMCErrorWithDomain:@"DMCKeychainErrorDomain" code:6001 descriptionArray:v35 errorType:@"DMCFatalError"];
  }
  if (!v33)
  {
    BOOL v53 = 1;
    goto LABEL_23;
  }
LABEL_17:
  if (a13) {
    *a13 = v33;
  }
  v50 = *DMCLogObjects();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v51 = v50;
    v52 = [v33 DMCVerboseDescription];
    LODWORD(v68) = 138543362;
    *(void *)((char *)&v68 + 4) = v52;
    _os_log_impl(&dword_1A7863000, v51, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", (uint8_t *)&v68, 0xCu);
  }
  BOOL v53 = 0;
LABEL_23:

  return v53;
}

void __132__DMCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
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

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 enforcePersonalPersona:(BOOL)a9 outError:(id *)a10
{
  BOOL v10 = a8;
  v53[2] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v46 = 0;
  id v20 = +[DMCKeychain _newQueryWithService:v15 account:v16 label:v17 description:v18 group:v19 useSystemKeychain:v10 outError:&v46];
  id v21 = v46;
  if (v21)
  {
    id v22 = v21;
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
    v41[2] = __113__DMCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke;
    v41[3] = &unk_1E5CFDEA0;
    v41[5] = &v51;
    v41[6] = v20;
    v41[4] = &v42;
    id v22 = +[DMCPersonaHelper performBlockUnderPersonalPersona:v41];
  }
  else
  {
    OSStatus v23 = SecItemCopyMatching(v20, v53);
    id v22 = 0;
    *((_DWORD *)v43 + 6) = v23;
  }
  CFRelease(v20);
  if (v22)
  {
    uint64_t v24 = *DMCLogObjects();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "+[DMCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:]";
      __int16 v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    int v25 = *((_DWORD *)v43 + 6);
    if (v25 == -25300 || !v25)
    {
      id v22 = 0;
      id v20 = *(__CFDictionary **)(*((void *)&v51 + 1) + 24);
      goto LABEL_15;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *((unsigned int *)v43 + 6));
    v35 = DMCErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE_%@", v28, v29, v30, v31, v32, v33, v34, v27);
    id v22 = [v26 DMCErrorWithDomain:@"DMCKeychainErrorDomain" code:6000 descriptionArray:v35 errorType:@"DMCFatalError"];
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
  v36 = *DMCLogObjects();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    id v37 = v36;
    uint64_t v38 = [v22 DMCVerboseDescription];
    LODWORD(v51) = 138543362;
    *(void *)((char *)&v51 + 4) = v38;
    _os_log_impl(&dword_1A7863000, v37, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", (uint8_t *)&v51, 0xCu);
  }
  v39 = 0;
LABEL_21:

  return v39;
}

uint64_t __113__DMCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  uint64_t result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v50[4] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *MEMORY[0x1E4F3B550];
  v49[0] = *MEMORY[0x1E4F3BD48];
  v49[1] = v13;
  uint64_t v14 = *MEMORY[0x1E4F3B558];
  v49[2] = *MEMORY[0x1E4F3BC78];
  v49[3] = v14;
  v50[0] = a3;
  v50[1] = v12;
  uint64_t v15 = *MEMORY[0x1E4F3B598];
  v50[2] = MEMORY[0x1E4F1CC38];
  v50[3] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
  id v17 = (void *)[v16 mutableCopy];

  if (v8) {
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  if (v11) {
    [v17 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  }
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __81__DMCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona___block_invoke;
  uint64_t v30 = &unk_1E5CFDEC8;
  uint64_t v32 = &v41;
  id v18 = v17;
  uint64_t v33 = &v35;
  uint64_t v34 = 0;
  id v31 = v18;
  uint64_t v19 = MEMORY[0x1AD0D2220](&v27);
  id v20 = (void *)v19;
  if (v7)
  {
    id v21 = +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v19, v27, v28, v29, v30);
    if (v21)
    {
      id v22 = *DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v46 = "+[DMCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:]";
        __int16 v47 = 2112;
        uint64_t v48 = v21;
        _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }

LABEL_14:
      id v25 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  if (*((_DWORD *)v42 + 6))
  {
    OSStatus v23 = *DMCLogObjects();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = *((_DWORD *)v42 + 6);
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v24;
      _os_log_impl(&dword_1A7863000, v23, OS_LOG_TYPE_ERROR, "Could not store item in keychain. Error: %d", buf, 8u);
    }
    goto LABEL_14;
  }
  id v25 = (id)v36[5];
LABEL_16:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __81__DMCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
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
    uint64_t v5 = *(void **)(v4 + 40);
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

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 enforcePersonalPersona:(BOOL)a8 group:(id)a9
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v10 = +[DMCKeychain _newQueryWithService:a3 account:a4 label:a5 description:a6 group:a9 useSystemKeychain:a7 outError:0];
  if (v10)
  {
    id v11 = v10;
    if (a8)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __109__DMCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke;
      v15[3] = &__block_descriptor_40_e5_v8__0l;
      v15[4] = v10;
      uint64_t v12 = +[DMCPersonaHelper performBlockUnderPersonalPersona:v15];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v17 = "+[DMCKeychain removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:]";
          __int16 v18 = 2112;
          uint64_t v19 = v13;
          _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
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

uint64_t __109__DMCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke(uint64_t a1)
{
  return SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
}

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
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = DMCErrorArray(@"KEYCHAIN_ERROR_CANNOT_CREATE_QUERY", v19, v20, v21, v22, v23, v24, v25, 0);
      *a9 = [v27 DMCErrorWithDomain:@"DMCKeychainErrorDomain" code:6002 descriptionArray:v28 errorType:@"DMCFatalError"];
    }
    Mutable = 0;
  }

  return Mutable;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (const void *)[a1 copyItemWithPersistentID:v8 useSystemKeychain:v6 enforcePersonalPersona:v5];
  BOOL v10 = v9;
  if (v9)
  {
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 != SecIdentityGetTypeID())
    {
      uint64_t v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v12;
        CFTypeID v14 = CFGetTypeID(v10);
        id v15 = (__CFString *)CFCopyTypeIDDescription(v14);
        int v17 = 138543618;
        id v18 = v8;
        __int16 v19 = 2114;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "Identity with persistent ID: %{public}@ has unexpected type: %{public}@", (uint8_t *)&v17, 0x16u);
      }
      CFRelease(v10);
      BOOL v10 = 0;
    }
  }

  return (__SecIdentity *)v10;
}

+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v7 = (char *)a3;
  uint64_t v8 = *MEMORY[0x1E4F3BC80];
  v34[0] = *MEMORY[0x1E4F3BD40];
  v34[1] = v8;
  v35[0] = v7;
  v35[1] = MEMORY[0x1E4F1CC38];
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  BOOL v10 = (void *)[v9 mutableCopy];

  if (v6) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  }
  [v10 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F3BC68]];
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  CFTypeRef v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  if (!v5)
  {
    OSStatus v13 = SecItemCopyMatching((CFDictionaryRef)v10, &v29);
    *((_DWORD *)v23 + 6) = v13;
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__DMCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v18[3] = &unk_1E5CFDEF0;
  uint64_t v20 = &v22;
  id v19 = v10;
  uint64_t v21 = &v26;
  CFTypeID v11 = +[DMCPersonaHelper performBlockUnderPersonalPersona:v18];

  if (!v11)
  {
    OSStatus v13 = *((_DWORD *)v23 + 6);
LABEL_10:
    if (v13 == -25300)
    {
      id v16 = *DMCLogObjects();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        id v31 = v7;
        __int16 v32 = 1024;
        LODWORD(v33) = v6;
        _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_DEBUG, "Couldn't get item with ID: %{public}@ system keychain: %d", buf, 0x12u);
      }
    }
    else if (v13)
    {
      CFTypeID v14 = *DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v7;
        _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "Cannot retrieve item with persistent ID %{public}@", buf, 0xCu);
      }
      goto LABEL_14;
    }
    id v15 = (void *)v27[3];
    goto LABEL_18;
  }
  uint64_t v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v31 = "+[DMCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

LABEL_14:
  id v15 = 0;
LABEL_18:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __81__DMCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
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
          v20[2] = __88__DMCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
          v20[3] = &unk_1E5CFDF18;
          v20[4] = &v21;
          v20[5] = v10;
          OSStatus v13 = +[DMCPersonaHelper performBlockUnderPersonalPersona:v20];
          if (v13)
          {
            CFTypeID v14 = *DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v26 = "+[DMCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
              __int16 v27 = 2112;
              uint64_t v28 = v13;
              _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          SecIdentityCopyCertificate(v10, v22 + 3);
          OSStatus v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        id v15 = (id)*DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          CFTypeID v16 = CFGetTypeID(v10);
          int v17 = (__CFString *)CFCopyTypeIDDescription(v16);
          *(_DWORD *)buf = 138543618;
          uint64_t v26 = v8;
          __int16 v27 = 2114;
          uint64_t v28 = v17;
          _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_ERROR, "Certificate with persistent ID: %{public}@ has unexpected type: %{public}@", buf, 0x16u);
        }
        CFRelease(v10);
      }
    }
  }
  id v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __88__DMCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  return SecIdentityCopyCertificate(*(SecIdentityRef *)(a1 + 40), (SecCertificateRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = +[DMCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:](DMCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:", *(void *)(*((void *)&v19 + 1) + 8 * v14), v6, v5, (void)v19);
          if (!v15)
          {

            int v17 = 0;
            goto LABEL_14;
          }
          CFTypeID v16 = v15;
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  id v9 = v9;
  int v17 = v9;
LABEL_14:

  return v17;
}

+ (BOOL)storeAttestationKey:(__SecKey *)a3 withGroup:(id)a4 label:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 dictionary];
  [v10 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  SecAccessControlRef v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B598], 0x40000000uLL, 0);
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B548]];
  CFRelease(v11);
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v12 = SecItemAdd((CFDictionaryRef)v10, 0);
  if (v12)
  {
    uint64_t v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "Could not store attestation key in keychain. Error: %d", (uint8_t *)v15, 8u);
    }
  }

  return v12 == 0;
}

+ (__SecKey)retrieveAttestationKeyWithGroup:(id)a3 label:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    OSStatus v11 = v10;
    OSStatus v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v17 = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation key from keychain. Error: %d", buf, 8u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (__SecKey *)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationKeyWithGroup:(id)a3 label:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    OSStatus v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation key from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

+ (BOOL)storeAttestationCert:(__SecCertificate *)a3 withGroup:(id)a4 label:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a5;
  id v9 = a4;
  OSStatus v10 = [v7 dictionary];
  [v10 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  [v10 setObject:*MEMORY[0x1E4F3B598] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v11 = SecItemAdd((CFDictionaryRef)v10, 0);
  if (v11)
  {
    OSStatus v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not store attestation cert in keychain. Error: %d", (uint8_t *)v14, 8u);
    }
  }

  return v11 == 0;
}

+ (__SecCertificate)retrieveAttestationCertWithGroup:(id)a3 label:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B980] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    OSStatus v11 = v10;
    OSStatus v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v17 = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation cert from keychain. Error: %d", buf, 8u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (__SecCertificate *)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationCertWithGroup:(id)a3 label:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B980] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    OSStatus v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation cert from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

+ (__SecIdentity)retrieveAttestationIdentityWithGroup:(id)a3 label:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B990] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    OSStatus v11 = v10;
    OSStatus v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v17 = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation identity from keychain. Error: %d", buf, 8u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (__SecIdentity *)result;
  }

  return v13;
}

+ (BOOL)storeAttestationMetadata:(id)a3 withGroup:(id)a4 service:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  OSStatus v11 = [v7 dictionary];
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];

  [v11 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v11 setObject:*MEMORY[0x1E4F3B598] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v12 = SecItemAdd((CFDictionaryRef)v11, 0);
  if (v12)
  {
    uint64_t v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "Could not store attestation metadata in keychain. Error: %d", (uint8_t *)v15, 8u);
    }
  }

  return v12 == 0;
}

+ (id)retrieveAttestationMetadataWithGroup:(id)a3 service:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    OSStatus v11 = v10;
    OSStatus v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v17 = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation metadata from keychain. Error: %d", buf, 8u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (id)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationMetadataWithGroup:(id)a3 service:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  OSStatus v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    OSStatus v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation metadata from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

@end
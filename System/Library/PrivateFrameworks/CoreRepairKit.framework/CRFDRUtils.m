@interface CRFDRUtils
+ (BOOL)isDataClassSupported:(id)a3;
+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4;
+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4;
+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4;
+ (BOOL)isDcSignedSealingManifest:(id *)a3;
+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4;
+ (__AMFDR)_createFDRLocal;
+ (id)_getDataClassesFromSealingManifest;
+ (id)_getDataClassesFromSealingMap;
+ (id)_getManifestForDataClass:(id)a3;
+ (id)extractComponentsAndIdentifiers:(id)a3;
+ (id)findUnsealedDataWithError:(id *)a3;
+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4;
+ (id)getData:(id)a3 instance:(id)a4;
+ (id)getDataPayload:(id)a3 instance:(id)a4;
+ (id)getLocalSealingManifest;
+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5;
+ (id)isServicePartWithError:(id *)a3;
+ (id)localManifestProperties;
+ (void)fixUpPseudoMSRk:(id)a3 mesaWithSCKey:(BOOL)a4;
@end

@implementation CRFDRUtils

+ (__AMFDR)_createFDRLocal
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"DataStore";
  v6[0] = @"Local";
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v6, (uint64_t)&v5, 1);
  v3 = (__AMFDR *)AMFDRCreateWithOptions();

  return v3;
}

+ (id)getLocalSealingManifest
{
  objc_msgSend__createFDRLocal(a1, a2, v2, v3);
  v9 = 0;
  uint64_t v10 = 0;
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D9666000, v4, OS_LOG_TYPE_DEFAULT, "Getting local sealing manifest", v8, 2u);
  }

  if (AMFDRSealingMapPopulateSealingManifest())
  {
    v5 = v9;
  }
  else
  {
    v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9672DA4();
    }

    v5 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v5;
}

+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  $203840463D15D3E17BD93E376D41ABE6 v49 = a3;
  id v6 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v48[0] = 0;
  v48[1] = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(v44, 0, sizeof(v44));
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (!sub_1D967253C((unint64_t *)&v49, v44))
  {
    v12 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v9, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
    objc_msgSend_addObject_(v7, v13, (uint64_t)v12, v14);
  }
  if (objc_msgSend_count(v7, v9, v10, v11))
  {
    char v19 = 0;
    *(void *)&long long v18 = 138412290;
    long long v43 = v18;
    while (1)
    {
      v20 = objc_msgSend_objectAtIndex_(v7, v15, 0, v17, v43);
      objc_msgSend_getValue_(v20, v21, (uint64_t)&v45, v22);
      id v23 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v27 = objc_msgSend_initWithBytes_length_(v23, v24, v46, v47);
      if (v45 != a4 || (objc_msgSend_isEqual_(v6, v25, (uint64_t)v27, v26) & 1) == 0) {
        break;
      }
      char v19 = 1;
LABEL_15:
      objc_msgSend_removeObjectAtIndex_(v7, v28, 0, v29);

      if (!objc_msgSend_count(v7, v35, v36, v37)) {
        goto LABEL_20;
      }
    }
    if (v19)
    {
      id v30 = [NSString alloc];
      v32 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v27, 4);
      objc_msgSend_addObject_(v8, v33, (uint64_t)v32, v34);
    }
    else
    {
      if (!sub_1D9672510((unint64_t *)&v46, v48))
      {
        while (!sub_1D967253C(v48, v44))
        {
          v38 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v28, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
          objc_msgSend_addObject_(v7, v39, (uint64_t)v38, v40);
        }
        goto LABEL_14;
      }
      v32 = handleForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v43;
        v51 = v27;
        _os_log_error_impl(&dword_1D9666000, v32, OS_LOG_TYPE_ERROR, "Failed to parse node in cert chain data = %@", buf, 0xCu);
      }
    }

LABEL_14:
    char v19 = 0;
    goto LABEL_15;
  }
LABEL_20:
  v41 = objc_msgSend_copy(v8, v15, v16, v17);

  return v41;
}

+ (id)getData:(id)a3 instance:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x1E4F1CFD0]);
  if (v6) {
    uint64_t v8 = AMFDRSealingMapCopyLocalData();
  }
  else {
    uint64_t v8 = AMFDRSealingManifestCopyLocalDataForClass();
  }
  v9 = (void *)v8;
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x1E4F1CFC8]);
    if (v6) {
      uint64_t v10 = AMFDRSealingMapCopyLocalData();
    }
    else {
      uint64_t v10 = AMFDRSealingManifestCopyLocalDataForClass();
    }
    uint64_t v11 = (void *)v10;
  }
  else
  {

    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9672E0C();
    }

    uint64_t v11 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v11;
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v8 = objc_msgSend_getData_instance_(a1, v7, (uint64_t)v6, (uint64_t)a4);
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    uint64_t v14 = objc_msgSend_bytes(v10, v11, v12, v13);
    uint64_t v18 = objc_msgSend_length(v10, v15, v16, v17);
    sub_1D9671FE8(v14, v18, (uint64_t)v30);
    if (v19)
    {
      int v25 = v19;
      uint64_t v26 = handleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1D9672FC4(v25, v26);
      }
    }
    else
    {
      int v20 = sub_1D9671F78((uint64_t)v30, (uint64_t)&v28);
      if (!v20)
      {
        uint64_t v22 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v21, v28, v29);
        goto LABEL_5;
      }
      int v27 = v20;
      uint64_t v26 = handleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1D9672F4C(v27, v26);
      }
    }
  }
  else
  {
    v24 = handleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1D9672EE4();
    }
  }
  uint64_t v22 = 0;
LABEL_5:

  return v22;
}

+ (BOOL)isDataClassSupported:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9667E5C;
  block[3] = &unk_1E6B6F868;
  block[4] = a1;
  uint64_t v3 = qword_1EA8C4E00;
  id v6 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EA8C4E00, block);
  }
  char v7 = objc_msgSend_containsObject_((void *)qword_1EA8C4DF8, v4, (uint64_t)v6, v5);

  return v7;
}

+ (id)_getDataClassesFromSealingManifest
{
  int v19 = 0;
  v4 = objc_msgSend_getLocalSealingManifest(a1, a2, v2, v3, 0);
  if (v4)
  {
    int v5 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
    AMSupportSafeRelease();
    AMSupportSafeRelease();
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, 0, v7);
        uint64_t v11 = objc_msgSend_setByAddingObject_(v8, v9, @"seal", v10);
        goto LABEL_13;
      }
      uint64_t v8 = handleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1D9673070();
      }
    }
    else
    {
      uint64_t v8 = handleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1D96730A4(&v19, v8, v12, v13, v14, v15, v16, v17);
      }
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D967303C();
    }
    uint64_t v11 = 0;
  }
LABEL_13:

  return v11;
}

+ (id)_getDataClassesFromSealingMap
{
  uint64_t v16 = 0;
  if (AMFDRSealingMapCopyDataClassesWithAttribute()) {
    BOOL v2 = v16 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v10, 0, v11);
      uint64_t v14 = objc_msgSend_setByAddingObject_(v3, v12, @"seal", v13);
      goto LABEL_12;
    }
    uint64_t v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D9673070();
    }
  }
  else
  {
    uint64_t v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D9673120(&v16, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

+ (id)_getManifestForDataClass:(id)a3
{
  id v4 = a3;
  objc_msgSend__createFDRLocal(a1, v5, v6, v7);
  if (!v4)
  {
    uint64_t v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D967319C();
    }
    goto LABEL_14;
  }
  uint64_t v8 = AMFDRSealingManifestCopyInstanceForClass();
  if (!v8)
  {
    uint64_t v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D96731D0();
    }
LABEL_14:

    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = (void *)v8;
  if ((AMFDRDataCopyManifest() & 1) == 0)
  {
    uint64_t v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D9673238();
    }
  }
LABEL_7:
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return 0;
}

+ (BOOL)isDcSignedSealingManifest:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = 0;
  memset(v56, 0, sizeof(v56));
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v6 = objc_msgSend_initWithBytes_length_(v4, v5, (uint64_t)&unk_1D9675510, 3);
  uint64_t v9 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v7, @"SELF MATCHES %@", v8, @"FDR-SS-DC.*");
  uint64_t v13 = objc_msgSend_getLocalSealingManifest(CRFDRUtils, v10, v11, v12);
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v34 = 0;
    long long v43 = @"Cannot copy sealing manifest from device";
    goto LABEL_16;
  }
  id v15 = v13;
  uint64_t v19 = objc_msgSend_bytes(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v15, v20, v21, v22);
  uint64_t v24 = sub_1D96720D8(v19, v23, (uint64_t)v56);
  if (v24)
  {
    objc_msgSend_stringWithFormat_(NSString, v25, @"Failed to parse cert as img4; stat: %d",
      v26,
      v24);
LABEL_14:
    long long v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!v43)
    {
      LOBYTE(a3) = 0;
      uint64_t v34 = 0;
      goto LABEL_9;
    }
    uint64_t v34 = 0;
    goto LABEL_16;
  }
  int v27 = sub_1D9672510((unint64_t *)&v56[18] + 1, (unint64_t *)&v50);
  if (v27)
  {
    objc_msgSend_stringWithFormat_(NSString, v28, @"Failed to parse cert chain; stat: %d",
      v29,
      v27);
    goto LABEL_14;
  }
  id v30 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v28, v50, v51, 6, v6);
  uint64_t v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory();
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v34;
      _os_log_impl(&dword_1D9666000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in seal: %@", buf, 0xCu);
    }

    uint64_t v37 = objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v9, v36);

    v41 = 0;
    LOBYTE(a3) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    uint64_t v34 = v37;
    goto LABEL_9;
  }
  long long v43 = @"Failed to parse cert common name from cert chain";
LABEL_16:
  v44 = handleForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    sub_1D96732A0();
  }

  if (a3)
  {
    uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F5CD48];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    v53 = v43;
    v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)&v53, (uint64_t)&v52, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v46, v49, v47, -42, v48);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
  }
  v41 = v43;
LABEL_9:

  return (char)a3;
}

+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v62 = 0;
  memset(v61, 0, sizeof(v61));
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v8 = objc_msgSend_initWithBytes_length_(v6, v7, (uint64_t)&unk_1D9675510, 3);
  uint64_t v11 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v9, @"SELF MATCHES %@", v10, @"FDR-CA\\d{1,4}-ROOT-DC.*");
  uint64_t v13 = objc_msgSend_getData_instance_(CRFDRUtils, v12, (uint64_t)v5, 0);
  uint64_t v16 = v13;
  if (!v13)
  {
    objc_msgSend_stringWithFormat_(NSString, v14, @"Cannot copy %@ data from device", v15, v5);
LABEL_15:
    long long v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!v43)
    {
      LOBYTE(a4) = 0;
      uint64_t v34 = 0;
      goto LABEL_9;
    }
    uint64_t v34 = 0;
    goto LABEL_17;
  }
  id v17 = v13;
  uint64_t v21 = objc_msgSend_bytes(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_length(v17, v22, v23, v24);
  sub_1D9671FE8(v21, v25, (uint64_t)v61);
  if (v26)
  {
    v44 = NSString;
    uint64_t v52 = v26;
    uint64_t v45 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend_stringWithFormat_(v44, v27, (uint64_t)v45, v28, v52);
    goto LABEL_15;
  }
  uint64_t v29 = sub_1D9672510((unint64_t *)&v61[18] + 1, (unint64_t *)&v53);
  if (v29)
  {
    v44 = NSString;
    uint64_t v52 = v29;
    uint64_t v45 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  id v30 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v27, v53, v54, 6, v8);
  uint64_t v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory();
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v58 = v5;
      __int16 v59 = 2112;
      v60 = v34;
      _os_log_impl(&dword_1D9666000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    uint64_t v37 = objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v11, v36);

    v41 = 0;
    LOBYTE(a4) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    uint64_t v34 = v37;
    goto LABEL_9;
  }
  long long v43 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  uint64_t v46 = handleForCategory();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    sub_1D96732A0();
  }

  if (a4)
  {
    v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F5CD48];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56 = v43;
    uint64_t v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v47, (uint64_t)&v56, (uint64_t)&v55, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v51, v49, -42, v50);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v41 = v43;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v64 = 0;
  memset(v63, 0, sizeof(v63));
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v9 = objc_msgSend_initWithBytes_length_(v7, v8, (uint64_t)&unk_1D9675510, 3);
  uint64_t v12 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v10, @"SELF MATCHES %@", v11, @"FDR-CA\\d{1,4}-ROOT-DC.*");
  uint64_t v15 = objc_msgSend__getManifestForDataClass_(a1, v13, (uint64_t)v6, v14);
  uint64_t v18 = v15;
  if (!v15)
  {
    objc_msgSend_stringWithFormat_(NSString, v16, @"Cannot copy %@ manifest from device", v17, v6);
LABEL_15:
    uint64_t v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v43 = 0;
    if (!v45)
    {
      LOBYTE(a4) = 0;
      uint64_t v36 = 0;
      goto LABEL_9;
    }
    uint64_t v36 = 0;
    goto LABEL_17;
  }
  id v19 = v15;
  uint64_t v23 = objc_msgSend_bytes(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_length(v19, v24, v25, v26);
  uint64_t v28 = sub_1D96720D8(v23, v27, (uint64_t)v63);
  if (v28)
  {
    uint64_t v46 = NSString;
    uint64_t v54 = v28;
    uint64_t v47 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend_stringWithFormat_(v46, v29, (uint64_t)v47, v30, v54);
    goto LABEL_15;
  }
  uint64_t v31 = sub_1D9672510((unint64_t *)&v63[18] + 1, (unint64_t *)&v55);
  if (v31)
  {
    uint64_t v46 = NSString;
    uint64_t v54 = (uint64_t)v31;
    uint64_t v47 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  uint64_t v32 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v29, v55, v56, 6, v9);
  uint64_t v36 = v32;
  if (v32 && objc_msgSend_count(v32, v33, v34, v35))
  {
    handleForCategory();
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = v6;
      __int16 v61 = 2112;
      uint64_t v62 = v36;
      _os_log_impl(&dword_1D9666000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    uint64_t v39 = objc_msgSend_filteredArrayUsingPredicate_(v36, v37, (uint64_t)v12, v38);

    long long v43 = 0;
    LOBYTE(a4) = objc_msgSend_count(v39, v40, v41, v42) != 0;
    uint64_t v36 = v39;
    goto LABEL_9;
  }
  uint64_t v45 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  v48 = handleForCategory();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_1D96732A0();
  }

  if (a4)
  {
    uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F5CD48];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    id v58 = v45;
    uint64_t v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v58, (uint64_t)&v57, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v50, v53, v51, -42, v52);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  long long v43 = v45;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"SrvP";
  switch(a3)
  {
    case 1024:
      id v6 = @"vcrt";
      if (objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"vcrt", (uint64_t)a4)) {
        goto LABEL_15;
      }
      id v6 = @"bcrt";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"bcrt", (uint64_t)a4);
      goto LABEL_14;
    case 1025:
      id v6 = @"tcrt";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"tcrt", (uint64_t)a4);
      goto LABEL_14;
    case 1026:
      id v6 = @"CmCl";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"CmCl", (uint64_t)a4);
      goto LABEL_14;
    case 1027:
      id v6 = @"psd2";
      if (objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"psd2", (uint64_t)a4)) {
        goto LABEL_15;
      }
      id v6 = @"prpc";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"prpc", (uint64_t)a4);
LABEL_14:
      if (isDataClassSupported)
      {
LABEL_15:
        if (objc_msgSend_isEqualToString_(v6, a2, @"CmCl", (uint64_t)a4))
        {
          char isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedCombinedDataClass_error_(CRFDRUtils, v16, (uint64_t)v6, (uint64_t)a4);
        }
        else
        {
          if (objc_msgSend_isEqualToString_(v6, v16, @"SrvP", v17))
          {
            uint64_t v21 = objc_msgSend_isServicePartWithError_(CRFDRUtils, v19, (uint64_t)a4, v20);
            uint64_t v24 = v21;
            if (v21) {
              char isEqual = objc_msgSend_isEqual_(v21, v22, @"0", v23);
            }
            else {
              char isEqual = 0;
            }

            goto LABEL_24;
          }
          char isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedDataClass_error_(CRFDRUtils, v19, (uint64_t)v6, (uint64_t)a4);
        }
        char isEqual = isDcSignedCombinedDataClass_error;
LABEL_24:
        id v14 = 0;
        goto LABEL_25;
      }
LABEL_10:
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CD48];
      uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, a2, @"Component %d is not supported for authorized repair for this device", (uint64_t)a4, v5, *MEMORY[0x1E4F28568]);
      v27[0] = v10;
      uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v27, (uint64_t)&v26, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v13, v9, -72, v12);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      char isEqual = 0;
      if (a4 && v14)
      {
        id v14 = v14;
        char isEqual = 0;
        *a4 = v14;
      }
LABEL_25:

      return isEqual;
    case 1028:
      id v6 = @"hop0";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"hop0", (uint64_t)a4);
      goto LABEL_14;
    case 1029:
      goto LABEL_15;
    case 1030:
      id v6 = @"bCfg";
      if (!objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"bCfg", (uint64_t)a4))goto LABEL_10; {
      goto LABEL_15;
      }
    case 1032:
      id v6 = @"NBCl";
      char isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"NBCl", (uint64_t)a4);
      goto LABEL_14;
    default:
      goto LABEL_10;
  }
}

+ (id)isServicePartWithError:(id *)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  v48 = 0;
  id v49 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v45 = 0;
  id v4 = objc_opt_new();
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (objc_msgSend_isEANSupported(v4, v5, v6, v7))
  {
    if (objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v4, v8, @"seal", (uint64_t)&v49, 1))
    {
      if (v49)
      {
        id v14 = handleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl(&dword_1D9666000, v14, OS_LOG_TYPE_DEFAULT, "Local Sealing manifest fetch sucessful", v44, 2u);
        }

        int v15 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
        uint64_t v12 = 0;
        uint64_t v9 = v45;
        if (v15 && (id v19 = v48) != 0 && v47)
        {
          uint64_t v11 = 0;
          uint64_t v10 = 0;
          if (v46)
          {
            uint64_t v11 = v46;
            uint64_t v12 = v47;
            uint64_t v20 = objc_msgSend_count(v47, v16, v17, v18);
            if (v20 == objc_msgSend_count(v11, v21, v22, v23) && objc_msgSend_count(v19, v24, v25, v26))
            {
              uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v19, v27, @"SrvP", v28);
              uint64_t v10 = v19;
              goto LABEL_27;
            }
            uint64_t v10 = v19;
          }
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v10 = 0;
        }
        uint64_t v36 = handleForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1D967333C();
        }

        if (!v9)
        {
          uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = *MEMORY[0x1E4F5CD48];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          uint64_t v51 = @"DataInstances and Classes count mismatch";
          uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)&v51, (uint64_t)&v50, 1);
          uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v38, v41, v39, -28, v40);
        }
        goto LABEL_26;
      }
      uint64_t v30 = handleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1D9673308();
      }

      uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F5CD48];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53[0] = @"Local Sealing manifest fetch failed";
      uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v53, (uint64_t)&v52, 1);
      uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v35, v32, -28, v34);
    }
    else
    {
      uint64_t v29 = handleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1D9673370();
      }

      uint64_t v9 = 0;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
LABEL_26:
    uint64_t v13 = 0;
  }
LABEL_27:
  if (a3) {
    *a3 = v9;
  }
  id v42 = v13;

  return v42;
}

+ (id)findUnsealedDataWithError:(id *)a3
{
  v64[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, v3);
  uint64_t v53 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v7, v8, v9);
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isDataClassSupported_(CRFDRUtils, v13, @"FSCl", v14))
  {
    uint64_t v63 = @"QueryPath";
    v64[0] = @"QueryPath_Straight";
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v64, (uint64_t)&v63, 1);
    id v19 = (void *)ZhuGeCopyValue();
    if ((objc_msgSend_isEqualToString_(v19, v20, @"ProvisionedUnknownKey", v21) & 1) != 0
      || objc_msgSend_isEqualToString_(v19, v22, @"ProvisionedLockedUnknownKey", v23))
    {
      int isEqualToString = objc_msgSend_isEqualToString_(v19, v22, @"ProvisionedUnknownKey", v23);
      uint64_t v25 = handleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v56) = isEqualToString;
        _os_log_impl(&dword_1D9666000, v25, OS_LOG_TYPE_DEFAULT, "Skip reading unknown Mesa: %d", buf, 8u);
      }

      objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)&unk_1F338D798, @"SkipRecoverDataClasses");
      objc_msgSend_addObjectsFromArray_(v53, v27, (uint64_t)&unk_1F338D798, v28);
    }
  }
  uint64_t v52 = objc_msgSend_getLocalSealingManifest(a1, v15, v16, v17);
  if (v52)
  {
    uint64_t v32 = 0;
    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      id v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F5CD48];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      id v58 = @"Number of data classes and instances mismatches";
      uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v58, (uint64_t)&v57, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v42, v44, v43, -42, v32);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F5CD48];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v38 = objc_msgSend_stringWithFormat_(NSString, v30, @"Failed to decode sealing manifest: %@", v31, 0);
      id v60 = v38;
      uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)&v60, (uint64_t)&v59, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v36, v41, v37, -28, v40);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F5CD48];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    uint64_t v62 = @"Failed to get local sealing manifest";
    uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)&v62, (uint64_t)&v61, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v35, v34, -28, v32);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v45)
  {
    handleForCategory();
    uint64_t v46 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR)) {
      sub_1D96733A4(v45, v46, v47, v48);
    }

    id v49 = (void *)v52;
    if (a3)
    {
      id v45 = v45;
      *a3 = v45;
    }
  }
  else
  {
    id v49 = (void *)v52;
  }
  uint64_t v50 = handleForCategory();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v54;
    _os_log_impl(&dword_1D9666000, v50, OS_LOG_TYPE_DEFAULT, "Unsealed: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  return v54;
}

+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_array(MEMORY[0x1E4F1C978], v6, v7, v8);
  objc_msgSend__createFDRLocal(a1, v10, v11, v12);
  if (!objc_msgSend_containsObject_(&unk_1F338D780, v13, (uint64_t)v5, v14))
  {
    uint64_t v18 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
    if (v18)
    {
      id v19 = AMFDRSealingManifestCopyMultiInstanceForClass();
      if (v19)
      {
        uint64_t v28 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v35, (uint64_t)v18, v36);
        uint64_t v34 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v37, (uint64_t)v19, v38);
        goto LABEL_8;
      }
      id v49 = handleForCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1D96736D0();
      }
    }
    else
    {
      id v19 = handleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1D9673744();
      }
    }
LABEL_22:

    uint64_t v28 = 0;
    uint64_t v34 = 0;
    goto LABEL_23;
  }
  uint64_t v18 = (void *)AMFDRSealingMapCopyPropertyWithTag();
  if (!v18)
  {
    id v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D967365C();
    }
    goto LABEL_22;
  }
  id v19 = objc_msgSend_localManifestProperties(a1, v15, v16, v17);
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v5, v21);
  if (!v23)
  {
    uint64_t v48 = handleForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_1D96735E8();
    }

    goto LABEL_22;
  }
  uint64_t v24 = (void *)MEMORY[0x1E4F1CA80];
  v56[0] = v18;
  uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v56, 1);
  uint64_t v28 = objc_msgSend_setWithArray_(v24, v26, (uint64_t)v25, v27);

  uint64_t v29 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v55 = v23;
  uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)&v55, 1);
  uint64_t v34 = objc_msgSend_setWithArray_(v29, v32, (uint64_t)v31, v33);

LABEL_8:
  objc_msgSend_minusSet_(v28, v39, (uint64_t)v34, v40);
  if (!objc_msgSend_count(v28, v41, v42, v43)) {
    goto LABEL_24;
  }
  v44 = handleForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v5;
    __int16 v53 = 2112;
    id v54 = v28;
    _os_log_impl(&dword_1D9666000, v44, OS_LOG_TYPE_DEFAULT, "Unsealed %@: %@", buf, 0x16u);
  }

  objc_msgSend_allObjects(v28, v45, v46, v47);
  v9 = uint64_t v18 = v9;
LABEL_23:

LABEL_24:
  return v9;
}

+ (void)fixUpPseudoMSRk:(id)a3 mesaWithSCKey:(BOOL)a4
{
  BOOL v4 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!objc_msgSend_isDataClassSupported_(CRFDRUtils, v6, @"FSCl", v7)) {
    goto LABEL_15;
  }
  if (v4)
  {
    uint64_t v10 = handleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v24[0]) = 0;
    uint64_t v11 = "mesa unpaired";
  }
  else
  {
    uint64_t v12 = objc_msgSend_objectForKey_(v5, v8, @"FSCl", v9);

    if (!v12) {
      goto LABEL_15;
    }
    uint64_t v10 = handleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v24[0]) = 0;
    uint64_t v11 = "mesa unsealed";
  }
  _os_log_impl(&dword_1D9666000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v24, 2u);
LABEL_9:

  v24[0] = 0;
  uint64_t v13 = ZhuGeCopyValue();
  int v15 = (void *)v13;
  if (!v13 || v24[0])
  {
    uint64_t v16 = handleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1D96737B8(v24, v16, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    v25[0] = v13;
    uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v25, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, @"MSRk");
  }

LABEL_15:
}

+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = v6;
  if (v5)
  {
    if ((objc_msgSend_isEANSupported(v6, v7, v8, v9) & 1) == 0)
    {
      uint64_t v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1D9673904();
      }
      goto LABEL_25;
    }
    if (objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v10, v11, @"seal", (uint64_t)&v22, 1))BOOL v12 = v22 == 0; {
    else
    }
      BOOL v12 = 1;
    if (v12)
    {
      uint64_t v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1D96738D0();
      }
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend_getLocalSealingManifest(CRFDRUtils, v7, v8, v9);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      uint64_t v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1D96738D0();
      }
      goto LABEL_25;
    }
  }
  if (AMFDRCreateTypeWithOptions())
  {
    AMFDRSetOption();
    char v14 = AMFDRDataCopySealingManifestProperty();
    int v15 = handleForCategory();
    uint64_t v13 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = 0;
        _os_log_impl(&dword_1D9666000, v13, OS_LOG_TYPE_DEFAULT, "SrvT: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1D967389C();
    }
  }
  else
  {
    uint64_t v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9673834();
    }
  }
LABEL_25:

  if (a4)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CD48];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = @"Query staged state failed";
    uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v24, (uint64_t)&v23, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v20, v18, -42, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:
  AMSupportSafeRelease();

  return 0;
}

+ (id)localManifestProperties
{
  if (objc_msgSend__createFDRLocal(a1, a2, v2, v3))
  {
    BOOL v4 = (void *)AMFDRSealingMapCopyManifestProperties();
    if (v4) {
      goto LABEL_9;
    }
    BOOL v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D967396C();
    }
  }
  else
  {
    BOOL v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9673938();
    }
    BOOL v4 = 0;
  }

LABEL_9:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

+ (id)extractComponentsAndIdentifiers:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v56 = (id)objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F28FD8]);
  uint64_t v6 = objc_msgSend_initWithPattern_options_error_(v4, v5, @"([a-zA-Z0-9#]{4})-(.*$)", 0, 0);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v58, (uint64_t)v64, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v59;
    uint64_t v55 = v6;
    do
    {
      uint64_t v15 = 0;
      uint64_t v57 = v13;
      do
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_length(v16, v10, v11, v12);
        uint64_t v19 = objc_msgSend_firstMatchInString_options_range_(v6, v18, (uint64_t)v16, 0, 0, v17);
        uint64_t v20 = handleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = objc_msgSend_numberOfRanges(v19, v21, v22, v23);
          *(_DWORD *)buf = 134217984;
          uint64_t v63 = v24;
          _os_log_impl(&dword_1D9666000, v20, OS_LOG_TYPE_DEFAULT, "number of ranges:%ld", buf, 0xCu);
        }

        if (v19 && (unint64_t)objc_msgSend_numberOfRanges(v19, v25, v26, v27) >= 2)
        {
          uint64_t v30 = objc_msgSend_rangeAtIndex_(v19, v28, 1, v29);
          uint64_t v32 = objc_msgSend_substringWithRange_(v16, v31, v30, (uint64_t)v31);
          uint64_t v35 = objc_msgSend_rangeAtIndex_(v19, v33, 2, v34);
          uint64_t v37 = objc_msgSend_substringWithRange_(v16, v36, v35, (uint64_t)v36);
          uint64_t v38 = (void *)v37;
          if (v32) {
            BOOL v39 = v37 == 0;
          }
          else {
            BOOL v39 = 1;
          }
          if (!v39)
          {
            id v40 = v32;
            uint64_t v41 = objc_opt_new();
            v44 = objc_msgSend_objectForKeyedSubscript_(v56, v42, (uint64_t)v40, v43);
            objc_msgSend_addObjectsFromArray_(v41, v45, (uint64_t)v44, v46);

            objc_msgSend_addObject_(v41, v47, (uint64_t)v38, v48);
            id v52 = objc_msgSend_copy(v41, v49, v50, v51);
            objc_msgSend_setObject_forKeyedSubscript_(v56, v53, (uint64_t)v52, (uint64_t)v40);

            uint64_t v6 = v55;
            uint64_t v13 = v57;
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v58, (uint64_t)v64, 16);
    }
    while (v13);
  }

  return v56;
}

@end
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
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"DataStore";
  v6[0] = @"Local";
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v6, (uint64_t)&v5, 1);
  v3 = (__AMFDR *)AMFDRCreateWithOptions();

  return v3;
}

+ (id)getLocalSealingManifest
{
  objc_msgSend__createFDRLocal(a1, a2, v2, v3);
  v9 = 0;
  uint64_t v10 = 0;
  v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Getting local sealing manifest", v8, 2u);
  }

  if (AMFDRSealingMapPopulateSealingManifest())
  {
    v5 = v9;
  }
  else
  {
    v6 = handleForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21FC62FBC();
    }

    v5 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v5;
}

+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  $203840463D15D3E17BD93E376D41ABE6 v49 = a3;
  id v6 = a5;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v48[0] = 0;
  v48[1] = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(v44, 0, sizeof(v44));
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  while (!sub_21FC536A4((unint64_t *)&v49, v44))
  {
    v12 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v9, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
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
      id v23 = objc_alloc(MEMORY[0x263EFF8F8]);
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
      if (!sub_21FC53678((unint64_t *)&v46, v48))
      {
        while (!sub_21FC536A4(v48, v44))
        {
          v38 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v28, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
          objc_msgSend_addObject_(v7, v39, (uint64_t)v38, v40);
        }
        goto LABEL_14;
      }
      v32 = handleForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v43;
        v51 = v27;
        _os_log_error_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_ERROR, "Failed to parse node in cert chain data = %@", buf, 0xCu);
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
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x263EFFB40]);
  if (v6) {
    uint64_t v8 = AMFDRSealingMapCopyLocalData();
  }
  else {
    uint64_t v8 = AMFDRSealingManifestCopyLocalDataForClass();
  }
  v9 = (void *)v8;
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x263EFFB38]);
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

    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC63024();
    }

    uint64_t v11 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v11;
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
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
    sub_21FC53114(v14, v18, (uint64_t)v30);
    if (v19)
    {
      int v25 = v19;
      uint64_t v26 = handleForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_21FC631DC(v25, v26);
      }
    }
    else
    {
      int v20 = sub_21FC52D5C((uint64_t)v30, (uint64_t)&v28);
      if (!v20)
      {
        uint64_t v22 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, v28, v29);
        goto LABEL_5;
      }
      int v27 = v20;
      uint64_t v26 = handleForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_21FC63164(v27, v26);
      }
    }
  }
  else
  {
    v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC630FC();
    }
  }
  uint64_t v22 = 0;
LABEL_5:

  return v22;
}

+ (BOOL)isDataClassSupported:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC2F604;
  block[3] = &unk_26452A940;
  block[4] = a1;
  uint64_t v3 = qword_26AC13460;
  id v6 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AC13460, block);
  }
  char v7 = objc_msgSend_containsObject_((void *)qword_26AC13468, v4, (uint64_t)v6, v5);

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
        uint64_t v8 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v6, 0, v7);
        uint64_t v11 = objc_msgSend_setByAddingObject_(v8, v9, @"seal", v10);
        goto LABEL_13;
      }
      uint64_t v8 = handleForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_21FC63288();
      }
    }
    else
    {
      uint64_t v8 = handleForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_21FC632BC(&v19, v8, v12, v13, v14, v15, v16, v17);
      }
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC63254();
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
      uint64_t v3 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v10, 0, v11);
      uint64_t v14 = objc_msgSend_setByAddingObject_(v3, v12, @"seal", v13);
      goto LABEL_12;
    }
    uint64_t v3 = handleForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21FC63288();
    }
  }
  else
  {
    uint64_t v3 = handleForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21FC63338(&v16, v3, v4, v5, v6, v7, v8, v9);
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
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC633B4();
    }
    goto LABEL_14;
  }
  uint64_t v8 = AMFDRSealingManifestCopyInstanceForClass();
  if (!v8)
  {
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC633E8();
    }
LABEL_14:

    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = (void *)v8;
  if ((AMFDRDataCopyManifest() & 1) == 0)
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC63450();
    }
  }
LABEL_7:
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return 0;
}

+ (BOOL)isDcSignedSealingManifest:(id *)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v56 = 0;
  memset(v55, 0, sizeof(v55));
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v6 = objc_msgSend_initWithBytes_length_(v4, v5, (uint64_t)&unk_21FC6D3C8, 3);
  uint64_t v9 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v7, @"SELF MATCHES %@", v8, @"FDR-SS-DC.*");
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
  uint64_t v24 = sub_21FC53204(v19, v23, (uint64_t)v55);
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
  int v27 = sub_21FC53678((unint64_t *)&v55[18] + 1, (unint64_t *)&v49);
  if (v27)
  {
    objc_msgSend_stringWithFormat_(NSString, v28, @"Failed to parse cert chain; stat: %d",
      v29,
      v27);
    goto LABEL_14;
  }
  id v30 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v28, v49, v50, 6, v6);
  uint64_t v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory(0);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v34;
      _os_log_impl(&dword_21FBF2000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in seal: %@", buf, 0xCu);
    }

    uint64_t v37 = objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v9, v36);

    v41 = 0;
    LOBYTE(a3) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    uint64_t v34 = v37;
    goto LABEL_9;
  }
  long long v43 = @"Failed to parse cert common name from cert chain";
LABEL_16:
  v44 = handleForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    sub_21FC634B8();
  }

  if (a3)
  {
    uint64_t v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    uint64_t v52 = v43;
    uint64_t v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)&v52, (uint64_t)&v51, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, @"com.apple.corerepair", -42, v47);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
  }
  v41 = v43;
LABEL_9:

  return (char)a3;
}

+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v61 = 0;
  memset(v60, 0, sizeof(v60));
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v8 = objc_msgSend_initWithBytes_length_(v6, v7, (uint64_t)&unk_21FC6D3C8, 3);
  uint64_t v11 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v9, @"SELF MATCHES %@", v10, @"FDR-CA\\d{1,4}-ROOT-DC.*");
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
  sub_21FC53114(v21, v25, (uint64_t)v60);
  if (v26)
  {
    v44 = NSString;
    uint64_t v51 = v26;
    uint64_t v45 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend_stringWithFormat_(v44, v27, (uint64_t)v45, v28, v51);
    goto LABEL_15;
  }
  uint64_t v29 = sub_21FC53678((unint64_t *)&v60[18] + 1, (unint64_t *)&v52);
  if (v29)
  {
    v44 = NSString;
    uint64_t v51 = v29;
    uint64_t v45 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  id v30 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v27, v52, v53, 6, v8);
  uint64_t v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v5;
      __int16 v58 = 2112;
      v59 = v34;
      _os_log_impl(&dword_21FBF2000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    uint64_t v37 = objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v11, v36);

    v41 = 0;
    LOBYTE(a4) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    uint64_t v34 = v37;
    goto LABEL_9;
  }
  long long v43 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  uint64_t v46 = handleForCategory(0);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    sub_21FC634B8();
  }

  if (a4)
  {
    v48 = (void *)MEMORY[0x263F087E8];
    uint64_t v54 = *MEMORY[0x263F08320];
    v55 = v43;
    uint64_t v49 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, (uint64_t)&v55, (uint64_t)&v54, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, @"com.apple.corerepair", -42, v49);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v41 = v43;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v63 = 0;
  memset(v62, 0, sizeof(v62));
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v9 = objc_msgSend_initWithBytes_length_(v7, v8, (uint64_t)&unk_21FC6D3C8, 3);
  uint64_t v12 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v10, @"SELF MATCHES %@", v11, @"FDR-CA\\d{1,4}-ROOT-DC.*");
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
  uint64_t v28 = sub_21FC53204(v23, v27, (uint64_t)v62);
  if (v28)
  {
    uint64_t v46 = NSString;
    uint64_t v53 = v28;
    uint64_t v47 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend_stringWithFormat_(v46, v29, (uint64_t)v47, v30, v53);
    goto LABEL_15;
  }
  uint64_t v31 = sub_21FC53678((unint64_t *)&v62[18] + 1, (unint64_t *)&v54);
  if (v31)
  {
    uint64_t v46 = NSString;
    uint64_t v53 = (uint64_t)v31;
    uint64_t v47 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  uint64_t v32 = objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v29, v54, v55, 6, v9);
  uint64_t v36 = v32;
  if (v32 && objc_msgSend_count(v32, v33, v34, v35))
  {
    handleForCategory(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v6;
      __int16 v60 = 2112;
      uint64_t v61 = v36;
      _os_log_impl(&dword_21FBF2000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    uint64_t v39 = objc_msgSend_filteredArrayUsingPredicate_(v36, v37, (uint64_t)v12, v38);

    long long v43 = 0;
    LOBYTE(a4) = objc_msgSend_count(v39, v40, v41, v42) != 0;
    uint64_t v36 = v39;
    goto LABEL_9;
  }
  uint64_t v45 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  v48 = handleForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_21FC634B8();
  }

  if (a4)
  {
    uint64_t v50 = (void *)MEMORY[0x263F087E8];
    uint64_t v56 = *MEMORY[0x263F08320];
    id v57 = v45;
    uint64_t v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v49, (uint64_t)&v57, (uint64_t)&v56, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, @"com.apple.corerepair", -42, v51);
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
  v26[1] = *MEMORY[0x263EF8340];
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
          char isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedCombinedDataClass_error_(CRFDRUtils, v15, (uint64_t)v6, (uint64_t)a4);
        }
        else
        {
          if (objc_msgSend_isEqualToString_(v6, v15, @"SrvP", v16))
          {
            uint64_t v20 = objc_msgSend_isServicePartWithError_(CRFDRUtils, v18, (uint64_t)a4, v19);
            uint64_t v23 = v20;
            if (v20) {
              char isEqual = objc_msgSend_isEqual_(v20, v21, @"0", v22);
            }
            else {
              char isEqual = 0;
            }

            goto LABEL_24;
          }
          char isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedDataClass_error_(CRFDRUtils, v18, (uint64_t)v6, (uint64_t)a4);
        }
        char isEqual = isDcSignedCombinedDataClass_error;
LABEL_24:
        id v13 = 0;
        goto LABEL_25;
      }
LABEL_10:
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"Component %d is not supported for authorized repair for this device", (uint64_t)a4, v5, *MEMORY[0x263F08320]);
      v26[0] = v9;
      uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v26, (uint64_t)&v25, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v12, @"com.apple.corerepair", -72, v11);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      char isEqual = 0;
      if (a4 && v13)
      {
        id v13 = v13;
        char isEqual = 0;
        *a4 = v13;
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
  v51[1] = *MEMORY[0x263EF8340];
  uint64_t v46 = 0;
  id v47 = 0;
  v44 = 0;
  uint64_t v45 = 0;
  long long v43 = 0;
  id v4 = objc_opt_new();
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v13 = 0;
  if (objc_msgSend_isEANSupported(v4, v5, v6, v7))
  {
    if (objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v4, v8, @"seal", (uint64_t)&v47, 1))
    {
      if (v47)
      {
        uint64_t v14 = handleForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Local Sealing manifest fetch sucessful", v42, 2u);
        }

        int v15 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
        uint64_t v12 = 0;
        uint64_t v9 = v43;
        if (v15 && (uint64_t v19 = v46) != 0 && v45)
        {
          uint64_t v11 = 0;
          uint64_t v10 = 0;
          if (v44)
          {
            uint64_t v11 = v44;
            uint64_t v12 = v45;
            uint64_t v20 = objc_msgSend_count(v45, v16, v17, v18);
            if (v20 == objc_msgSend_count(v11, v21, v22, v23) && objc_msgSend_count(v19, v24, v25, v26))
            {
              id v13 = objc_msgSend_objectForKeyedSubscript_(v19, v27, @"SrvP", v28);
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
        uint64_t v35 = handleForCategory(1uLL);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_21FC63554();
        }

        if (!v9)
        {
          uint64_t v37 = (void *)MEMORY[0x263F087E8];
          uint64_t v48 = *MEMORY[0x263F08320];
          uint64_t v49 = @"DataInstances and Classes count mismatch";
          uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)&v49, (uint64_t)&v48, 1);
          uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, @"com.apple.corerepair", -28, v38);
        }
        goto LABEL_26;
      }
      uint64_t v30 = handleForCategory(1uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21FC63520();
      }

      uint64_t v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      v51[0] = @"Local Sealing manifest fetch failed";
      uint64_t v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)v51, (uint64_t)&v50, 1);
      uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, @"com.apple.corerepair", -28, v33);
    }
    else
    {
      uint64_t v29 = handleForCategory(1uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_21FC63588();
      }

      uint64_t v9 = 0;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
LABEL_26:
    id v13 = 0;
  }
LABEL_27:
  if (a3) {
    *a3 = v9;
  }
  id v40 = v13;

  return v40;
}

+ (id)findUnsealedDataWithError:(id *)a3
{
  v61[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3, v3);
  uint64_t v50 = objc_msgSend_set(MEMORY[0x263EFF9C0], v7, v8, v9);
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11, v12);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isDataClassSupported_(CRFDRUtils, v13, @"FSCl", v14))
  {
    __int16 v60 = @"QueryPath";
    v61[0] = @"QueryPath_Straight";
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v61, (uint64_t)&v60, 1);
    uint64_t v19 = (void *)ZhuGeCopyValue();
    if ((objc_msgSend_isEqualToString_(v19, v20, @"ProvisionedUnknownKey", v21) & 1) != 0
      || objc_msgSend_isEqualToString_(v19, v22, @"ProvisionedLockedUnknownKey", v23))
    {
      int isEqualToString = objc_msgSend_isEqualToString_(v19, v22, @"ProvisionedUnknownKey", v23);
      uint64_t v25 = handleForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = isEqualToString;
        _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "Skip reading unknown Mesa: %d", buf, 8u);
      }

      objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)&unk_26D1638D8, @"SkipRecoverDataClasses");
      objc_msgSend_addObjectsFromArray_(v50, v27, (uint64_t)&unk_26D1638D8, v28);
    }
  }
  uint64_t v49 = objc_msgSend_getLocalSealingManifest(a1, v15, v16, v17);
  if (v49)
  {
    uint64_t v32 = 0;
    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      id v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v54 = *MEMORY[0x263F08320];
      uint64_t v55 = @"Number of data classes and instances mismatches";
      uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v55, (uint64_t)&v54, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v40, v41, @"com.apple.corerepair", -42, v32);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v56 = *MEMORY[0x263F08320];
      uint64_t v36 = objc_msgSend_stringWithFormat_(NSString, v30, @"Failed to decode sealing manifest: %@", v31, 0);
      id v57 = v36;
      uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)&v57, (uint64_t)&v56, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v35, v39, @"com.apple.corerepair", -28, v38);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08320];
    id v59 = @"Failed to get local sealing manifest";
    uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v59, (uint64_t)&v58, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v34, @"com.apple.corerepair", -28, v32);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v42)
  {
    handleForCategory(0);
    long long v43 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
      sub_21FC635BC(v42, v43, v44, v45);
    }

    uint64_t v46 = (void *)v49;
    if (a3)
    {
      id v42 = v42;
      *a3 = v42;
    }
  }
  else
  {
    uint64_t v46 = (void *)v49;
  }
  id v47 = handleForCategory(0);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v51;
    _os_log_impl(&dword_21FBF2000, v47, OS_LOG_TYPE_DEFAULT, "Unsealed: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  return v51;
}

+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7, v8);
  objc_msgSend__createFDRLocal(a1, v10, v11, v12);
  if (!objc_msgSend_containsObject_(&unk_26D1638C0, v13, (uint64_t)v5, v14))
  {
    uint64_t v18 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
    if (v18)
    {
      uint64_t v19 = AMFDRSealingManifestCopyMultiInstanceForClass();
      if (v19)
      {
        uint64_t v28 = objc_msgSend_setWithArray_(MEMORY[0x263EFF9C0], v35, (uint64_t)v18, v36);
        uint64_t v34 = objc_msgSend_setWithArray_(MEMORY[0x263EFF9C0], v37, (uint64_t)v19, v38);
        goto LABEL_8;
      }
      uint64_t v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC638E8();
      }
    }
    else
    {
      uint64_t v19 = handleForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_21FC6395C();
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
    uint64_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC63874();
    }
    goto LABEL_22;
  }
  uint64_t v19 = objc_msgSend_localManifestProperties(a1, v15, v16, v17);
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v5, v21);
  if (!v23)
  {
    uint64_t v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC63800();
    }

    goto LABEL_22;
  }
  uint64_t v24 = (void *)MEMORY[0x263EFF9C0];
  v56[0] = v18;
  uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v56, 1);
  uint64_t v28 = objc_msgSend_setWithArray_(v24, v26, (uint64_t)v25, v27);

  uint64_t v29 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v55 = v23;
  uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, (uint64_t)&v55, 1);
  uint64_t v34 = objc_msgSend_setWithArray_(v29, v32, (uint64_t)v31, v33);

LABEL_8:
  objc_msgSend_minusSet_(v28, v39, (uint64_t)v34, v40);
  if (!objc_msgSend_count(v28, v41, v42, v43)) {
    goto LABEL_24;
  }
  uint64_t v44 = handleForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v5;
    __int16 v53 = 2112;
    uint64_t v54 = v28;
    _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "Unsealed %@: %@", buf, 0x16u);
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
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!objc_msgSend_isDataClassSupported_(CRFDRUtils, v6, @"FSCl", v7)) {
    goto LABEL_15;
  }
  if (v4)
  {
    uint64_t v10 = handleForCategory(0);
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
    uint64_t v10 = handleForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v24[0]) = 0;
    uint64_t v11 = "mesa unsealed";
  }
  _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v24, 2u);
LABEL_9:

  v24[0] = 0;
  uint64_t v13 = ZhuGeCopyValue();
  int v15 = (void *)v13;
  if (!v13 || v24[0])
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC639D0(v24, v16, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    v25[0] = v13;
    uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v25, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, @"MSRk");
  }

LABEL_15:
}

+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v21 = 0;
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = v6;
  if (v5)
  {
    if ((objc_msgSend_isEANSupported(v6, v7, v8, v9) & 1) == 0)
    {
      uint64_t v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC63B1C();
      }
      goto LABEL_25;
    }
    if (objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v10, v11, @"seal", (uint64_t)&v21, 1))BOOL v12 = v21 == 0; {
    else
    }
      BOOL v12 = 1;
    if (v12)
    {
      uint64_t v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC63AE8();
      }
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend_getLocalSealingManifest(CRFDRUtils, v7, v8, v9);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      uint64_t v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC63AE8();
      }
      goto LABEL_25;
    }
  }
  if (AMFDRCreateTypeWithOptions())
  {
    AMFDRSetOption();
    char v14 = AMFDRDataCopySealingManifestProperty();
    int v15 = handleForCategory(0);
    uint64_t v13 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = 0;
        _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "SrvT: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC63AB4();
    }
  }
  else
  {
    uint64_t v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC63A4C();
    }
  }
LABEL_25:

  if (a4)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    uint64_t v23 = @"Query staged state failed";
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)&v23, (uint64_t)&v22, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, @"com.apple.corerepair", -42, v18);
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
    BOOL v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC63B84();
    }
  }
  else
  {
    BOOL v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC63B50();
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
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v56 = (id)objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x263F08AE8]);
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
        uint64_t v20 = handleForCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = objc_msgSend_numberOfRanges(v19, v21, v22, v23);
          *(_DWORD *)buf = 134217984;
          uint64_t v63 = v24;
          _os_log_impl(&dword_21FBF2000, v20, OS_LOG_TYPE_DEFAULT, "number of ranges:%ld", buf, 0xCu);
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
            uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v56, v42, (uint64_t)v40, v43);
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
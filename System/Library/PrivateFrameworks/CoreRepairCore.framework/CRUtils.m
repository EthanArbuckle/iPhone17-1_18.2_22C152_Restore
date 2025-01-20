@interface CRUtils
+ (BOOL)foundInMultiRequestError:(id)a3 dataClass:(id)a4 dataInstance:(id)a5;
+ (BOOL)powerCycleSensor:(id *)a3;
+ (id)getInnermostNSError:(id)a3;
+ (int)getInnermostNSErrorCode:(id)a3;
- (BOOL)currentProcessHasEntitlement:(id)a3;
- (BOOL)hasEntitlementBoolForTag:(unsigned int)a3 inAPTicket:(id)a4;
- (BOOL)isHorizonRamdiskBootInApticket:(id)a3;
- (id)base64Preprocess:(id)a3;
- (id)convertDataToHexInDictionary:(id)a3;
- (id)getAPTicket;
- (id)getPathForApTicketWithError:(id *)a3;
- (id)getPathForBorsFirmwareWithError:(id *)a3;
- (id)getPathForBrunorFirmwareWithError:(id *)a3;
- (id)getPathForSavageFirmwareWithError:(id *)a3;
- (id)getPathForYonkersFirmwareWithError:(id *)a3;
@end

@implementation CRUtils

- (id)getAPTicket
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], a2, v2, v3);
  id v29 = 0;
  v6 = objc_msgSend_copyPathForPersonalizedData_error_(v4, v5, 2, (uint64_t)&v29);
  id v7 = v29;

  v8 = handleForCategory(0);
  v9 = v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC60810((uint64_t)v7, v9, v22, v23, v24, v25, v26, v27);
    }
LABEL_13:

    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
  }

  id v28 = 0;
  v9 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v11, (uint64_t)v6, 2, &v28);
  id v12 = v28;
  id v7 = v12;
  if (!v9 || v12)
  {
    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC6087C((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

- (BOOL)hasEntitlementBoolForTag:(unsigned int)a3 inAPTicket:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  BOOL v28 = 0;
  uint64_t v30 = 0;
  memset(v29, 0, sizeof(v29));
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC60994();
    }

    objc_msgSend_getAPTicket(self, v10, v11, v12);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      BOOL v23 = 0;
      goto LABEL_17;
    }
  }
  id v13 = v8;
  uint64_t v17 = objc_msgSend_bytes(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_length(v13, v18, v19, v20);
  if (sub_21FC53204(v17, v21, (uint64_t)v29))
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC60960();
    }

    BOOL v23 = 0;
  }
  else
  {
    int v24 = sub_21FC52E2C((uint64_t)v29, 0, a3, &v28);
    if (v24)
    {
      int v25 = v24;
      uint64_t v26 = handleForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_21FC608E8(v25, v26);
      }

      BOOL v23 = 0;
      BOOL v28 = 0;
    }
    else
    {
      BOOL v23 = v28;
    }
  }

LABEL_17:
  return v23;
}

- (BOOL)currentProcessHasEntitlement:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  CFErrorRef error = 0;
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v4)
  {
    v5 = v4;
    id v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
    BOOL v10 = v6;
    if (error)
    {
      uint64_t v11 = handleForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_21FC60A84((uint64_t)&error, v11, v12, v13, v14, v15, v16, v17);
      }

      CFRelease(error);
    }
    else
    {
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v18 = objc_msgSend_BOOLValue(v10, v7, v8, v9);
        goto LABEL_13;
      }
      uint64_t v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21FC609FC((uint64_t)v10, (uint64_t)v3, v20);
      }
    }
    char v18 = 0;
LABEL_13:
    CFRelease(v5);
    goto LABEL_14;
  }
  BOOL v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_21FC609C8();
  }
  char v18 = 0;
LABEL_14:

  return v18;
}

- (id)convertDataToHexInDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v7 = v3;
  if (v3)
  {
    uint64_t v8 = objc_msgSend_mutableCopy(v3, v4, v5, v6);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v39 = v7;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v41, (uint64_t)v45, 16);
    if (!v11) {
      goto LABEL_19;
    }
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v42;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        char v18 = objc_msgSend_objectForKey_(v9, v12, v17, v13, v39);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = objc_msgSend_convertToHexString(v18, v19, v20, v21);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = objc_msgSend_convertDataToHexInDictionary_(self, v26, (uint64_t)v18, v27);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_17;
            }
            uint64_t v22 = objc_msgSend_stringValue(v18, v28, v29, v30);
          }
        }
        uint64_t v31 = (void *)v22;
        if (v22)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v8, v23, v22, v17);
        }
        else
        {
          uint64_t v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v23, v24, v25);
          objc_msgSend_setObject_forKeyedSubscript_(v8, v33, (uint64_t)v32, v17);
        }
LABEL_17:
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v41, (uint64_t)v45, 16);
      if (!v14)
      {
LABEL_19:

        v37 = objc_msgSend_copy(v8, v34, v35, v36);
        id v7 = v39;
        goto LABEL_21;
      }
    }
  }
  v37 = 0;
LABEL_21:

  return v37;
}

- (id)base64Preprocess:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v7 = v3;
  if (v3)
  {
    id v33 = v3;
    v34 = objc_msgSend_mutableCopy(v3, v4, v5, v6);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v7;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend_objectForKey_(v8, v11, v16, v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v35 = 0;
            uint64_t v35 = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20);
            uint64_t v25 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, (uint64_t)&v35, 8);
            if (v25)
            {
              objc_msgSend_setObject_forKeyedSubscript_(v34, v22, (uint64_t)v25, v16);
            }
            else
            {
              uint64_t v26 = objc_msgSend_null(MEMORY[0x263EFF9D0], v22, v23, v24);
              objc_msgSend_setObject_forKeyedSubscript_(v34, v27, (uint64_t)v26, v16);
            }
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v13);
    }

    uint64_t v31 = objc_msgSend_copy(v34, v28, v29, v30);
    id v7 = v33;
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

+ (id)getInnermostNSError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v7 = v3;
    id v8 = objc_msgSend_userInfo(v3, v4, v5, v6);
    uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, @"NSUnderlyingError", v10);

    if (v11)
    {
      do
      {
        id v12 = v11;

        uint64_t v16 = objc_msgSend_userInfo(v12, v13, v14, v15);
        uint64_t v11 = objc_msgSend_objectForKey_(v16, v17, @"NSUnderlyingError", v18);

        id v7 = v12;
      }
      while (v11);
    }
    else
    {
      id v12 = v7;
    }
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

+ (int)getInnermostNSErrorCode:(id)a3
{
  v4 = objc_msgSend_getInnermostNSError_(a1, a2, (uint64_t)a3, v3);
  int v8 = objc_msgSend_code(v4, v5, v6, v7);

  return v8;
}

+ (BOOL)foundInMultiRequestError:(id)a3 dataClass:(id)a4 dataInstance:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = v9;
  BOOL v14 = 0;
  if (v7 && v8 && v9)
  {
    if (objc_msgSend_code(v7, v10, v11, v12) == 21)
    {
      uint64_t v18 = objc_msgSend_userInfo(v7, v15, v16, v17);
      uint64_t v21 = v18;
      if (v18)
      {
        uint64_t v22 = objc_msgSend_objectForKey_(v18, v19, @"MultiRequestErrors", v20);
        if (v22)
        {
          FullKey = (void *)AMFDRDataLocalCreateFullKey();
          if (FullKey)
          {
            uint64_t v26 = objc_msgSend_objectForKey_(v22, v23, (uint64_t)FullKey, v24);
            BOOL v14 = v26 != 0;
            if (v26)
            {
              uint64_t v27 = handleForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = 138412546;
                uint64_t v30 = FullKey;
                __int16 v31 = 2112;
                uint64_t v32 = v26;
                _os_log_impl(&dword_21FBF2000, v27, OS_LOG_TYPE_DEFAULT, "Found error in multi request errors: %@ : %@", (uint8_t *)&v29, 0x16u);
              }
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)getPathForApTicketWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v11 = 0;
  v4 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, a2, @"/private/preboot/active", 1, &v11);
  id v7 = v11;
  if (v4)
  {
    id v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"%s/%@/System/Library/Caches/apticket.der", v6, "/private/preboot", v4);
    id v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "APTicket Path: %@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC60AF4((uint64_t)v7, v9);
    }
    id v8 = 0;
  }

  if (a3) {
    *a3 = v7;
  }

  return v8;
}

- (id)getPathForSavageFirmwareWithError:(id *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"/usr/standalone/update/Savage/";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Firmware Path: %@", (uint8_t *)&v5, 0xCu);
  }

  return @"/usr/standalone/update/Savage/";
}

- (id)getPathForBorsFirmwareWithError:(id *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"/usr/standalone/update/Bors/";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Firmware Path: %@", (uint8_t *)&v5, 0xCu);
  }

  return @"/usr/standalone/update/Bors/";
}

- (id)getPathForBrunorFirmwareWithError:(id *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"/usr/standalone/update/Brunor/";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Firmware Path: %@", (uint8_t *)&v5, 0xCu);
  }

  return @"/usr/standalone/update/Brunor/";
}

- (id)getPathForYonkersFirmwareWithError:(id *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"/usr/standalone/update/Sumter/";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Firmware Path: %@", (uint8_t *)&v5, 0xCu);
  }

  return @"/usr/standalone/update/Sumter/";
}

- (BOOL)isHorizonRamdiskBootInApticket:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  int v20 = 0;
  if (!v3)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60B80();
    }
    goto LABEL_10;
  }
  id v5 = v3;
  uint64_t v9 = objc_msgSend_bytes(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_length(v5, v10, v11, v12);
  if (sub_21FC53204(v9, v13, (uint64_t)v23))
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60960();
    }
LABEL_10:

    BOOL v18 = 0;
    goto LABEL_11;
  }
  sub_21FC52E9C((uint64_t)v23, 0, 1869833590, &v20);
  int v16 = v15;
  uint64_t v17 = handleForCategory(0);
  uint64_t v14 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC608E8(v16, v14);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = v20;
    _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "OS environment is %d", buf, 8u);
  }

  BOOL v18 = v20 == 2;
LABEL_11:

  return v18;
}

+ (BOOL)powerCycleSensor:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v18 = "+[CRUtils powerCycleSensor:]";
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "%s: SavageCamInterfaceOpen", buf, 0xCu);
  }

  uint64_t v5 = SavageCamInterfaceOpen();
  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08320];
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"SavageCamInterfaceOpen failed: %d", v8, v5);
  int v16 = v9;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v16, (uint64_t)&v15, 1);
  uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(v6, v12, @"com.apple.corerepair", -42, v11);

  if (a3) {
    *a3 = v13;
  }

  return 0;
}

@end
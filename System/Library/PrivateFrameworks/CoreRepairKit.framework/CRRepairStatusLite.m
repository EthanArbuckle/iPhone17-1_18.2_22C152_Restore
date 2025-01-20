@interface CRRepairStatusLite
+ (BOOL)isDeviceStagedSealed;
+ (BOOL)isVeridianFWUpdateRequired;
+ (BOOL)isVeridianFWUpdateRequiredLite;
+ (id)getData:(id)a3 instance:(id)a4;
+ (id)getDataForDataClass:(id)a3;
+ (id)getDataPayload:(id)a3 instance:(id)a4;
+ (id)getDataPayloadForDataClass:(id)a3;
+ (id)getSsrBootIntentWithError:(id *)a3;
@end

@implementation CRRepairStatusLite

+ (BOOL)isVeridianFWUpdateRequired
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v34 = 0;
  v2 = objc_opt_new();
  int isFirstAuthComplete = objc_msgSend_isFirstAuthComplete(v2, v3, v4, v5);

  if (isFirstAuthComplete)
  {
    v10 = objc_msgSend_sharedDataAccessor(MEMORY[0x1E4F73A28], v7, v8, v9);
    id v33 = 0;
    v12 = objc_msgSend_copyPathForPersonalizedData_error_(v10, v11, 0, (uint64_t)&v33);
    id v13 = v33;

    if (v12) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      v26 = objc_msgSend_componentsSeparatedByString_(v12, v14, @"usr/standalone/firmware", v15);
      v24 = v26;
      if (!MEMORY[0x1E4FBD3B0])
      {
        id v13 = 0;
        BOOL v25 = 1;
        goto LABEL_16;
      }
      objc_msgSend_firstObject(v26, v27, v28, v29);
      int updated = isVeridianUpdateRequired();
      BOOL v25 = updated != 0;
      v17 = handleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v34;
        *(_DWORD *)buf = 138412546;
        v36 = v34;
        __int16 v37 = 1024;
        BOOL v38 = updated != 0;
        _os_log_impl(&dword_1D9666000, v17, OS_LOG_TYPE_DEFAULT, "isVeridianUpdateRequired :%@:%d", buf, 0x12u);
      }
      id v13 = 0;
    }
    else
    {
      v17 = handleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1D9673A4C((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);
      }
      v24 = 0;
      BOOL v25 = 1;
    }
  }
  else
  {
    v24 = 0;
    v12 = 0;
    id v13 = 0;
    BOOL v25 = 0;
  }
LABEL_16:

  return v25;
}

+ (BOOL)isVeridianFWUpdateRequiredLite
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32 = 0;
  v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"%s/active", v2, "/private/preboot");
  id v31 = 0;
  uint64_t v5 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v4, (uint64_t)v3, 1, &v31);
  id v8 = v31;
  if (!v5)
  {
    uint64_t v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1D9673AB8((uint64_t)v3, (uint64_t)v8, v20);
    }
    goto LABEL_12;
  }
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v6, @"/private/preboot/%@", v7, v5);
  v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    _os_log_impl(&dword_1D9666000, v10, OS_LOG_TYPE_DEFAULT, "completeFWPath :%@", buf, 0xCu);
  }

  if (!v9)
  {
    uint64_t v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1D9673B40(v20, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_12:
    v17 = 0;
    uint64_t v9 = 0;
    BOOL v19 = 1;
    goto LABEL_13;
  }
  id v13 = objc_msgSend_componentsSeparatedByString_(v9, v11, @"usr/standalone/firmware", v12);
  v17 = v13;
  if (!MEMORY[0x1E4FBD3B0])
  {
    BOOL v19 = 1;
    goto LABEL_14;
  }
  objc_msgSend_firstObject(v13, v14, v15, v16);
  int updated = isVeridianUpdateRequired();
  BOOL v19 = updated != 0;
  uint64_t v20 = handleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = updated != 0;
    uint64_t v22 = v32;
    *(_DWORD *)buf = 138412546;
    v34 = v32;
    __int16 v35 = 1024;
    BOOL v36 = v21;
    _os_log_impl(&dword_1D9666000, v20, OS_LOG_TYPE_DEFAULT, "isVeridianUpdateRequired :%@:%d", buf, 0x12u);
  }
LABEL_13:

LABEL_14:
  return v19;
}

+ (id)getData:(id)a3 instance:(id)a4
{
  return (id)objc_msgSend_getData_instance_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)a4);
}

+ (id)getDataForDataClass:(id)a3
{
  return (id)objc_msgSend_getData_instance_(CRFDRUtils, a2, (uint64_t)a3, 0);
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  return (id)MEMORY[0x1F4181798](CRFDRUtils, sel_getDataPayload_instance_, a3, a4);
}

+ (id)getDataPayloadForDataClass:(id)a3
{
  return (id)MEMORY[0x1F4181798](CRFDRUtils, sel_getDataPayload_instance_, a3, 0);
}

+ (id)getSsrBootIntentWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v41 = 0;
  uint64_t v4 = objc_msgSend_readNVRAMValueForKey_error_(MEMORY[0x1E4F5CD60], a2, @"diagnostic-boot-intent", (uint64_t)&v41);
  id v5 = v41;
  v6 = handleForCategory();
  uint64_t v7 = v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9673BB0((uint64_t)v5, v7);
    }
LABEL_7:
    uint64_t v9 = 0;
    v10 = 0;
    v11 = 0;
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v4;
    _os_log_impl(&dword_1D9666000, v7, OS_LOG_TYPE_DEFAULT, "readNVRAMValueForKey value: %@", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = 0;
    v11 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v16, (uint64_t)v4, 0, &v40);
    id v5 = v40;
    if (!v11)
    {
      uint64_t v7 = handleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1D9673C3C((uint64_t)v5, v7, v34, v35, v36, v37, v38, v39);
      }
      goto LABEL_7;
    }
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v11, v17, @"purpose", v18);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend_isEqual_(v9, v19, @"self-service-repair", v20))
        {
          uint64_t v12 = objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v12, v21, (uint64_t)v9, @"purpose");
          uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v11, v22, @"wifi-credentials", v23);

          if (!v24)
          {
            v10 = 0;
            uint64_t v4 = 0;
            if (!a3) {
              goto LABEL_27;
            }
            goto LABEL_10;
          }
          id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v7 = objc_msgSend_initWithBase64EncodedString_options_(v25, v26, v24, 0);
          v10 = objc_msgSend_decryptWiFiCredDictFromCredentialsData_(MEMORY[0x1E4F5CD78], v27, (uint64_t)v7, v28);
          if (v10)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend_addEntriesFromDictionary_(v12, v29, (uint64_t)v10, v30);
            }
          }
          uint64_t v4 = (void *)v24;
LABEL_9:

          if (!a3) {
            goto LABEL_27;
          }
LABEL_10:
          if (v5)
          {
            id v5 = v5;
            *a3 = v5;
          }
          goto LABEL_27;
        }
        uint64_t v7 = handleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1D9673CDC();
        }
      }
      else
      {
        uint64_t v7 = handleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1D9673D10();
        }
      }
    }
    else
    {
      uint64_t v7 = handleForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 0;
        uint64_t v12 = 0;
        goto LABEL_9;
      }
      sub_1D9673CA8();
      uint64_t v9 = 0;
    }
    v10 = 0;
    goto LABEL_8;
  }
  id v31 = handleForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1D9673D44();
  }

  uint64_t v12 = 0;
  id v5 = 0;
  v11 = 0;
  v10 = 0;
  uint64_t v9 = 0;
LABEL_27:
  v32 = objc_msgSend_copy(v12, v13, v14, v15);

  return v32;
}

+ (BOOL)isDeviceStagedSealed
{
  return MEMORY[0x1F4181798](CRFDRUtils, sel_queryDeviceStagedSealedFromEAN_error_, 0, 0);
}

@end
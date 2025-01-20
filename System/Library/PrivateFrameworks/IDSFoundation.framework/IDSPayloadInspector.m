@interface IDSPayloadInspector
+ (int64_t)validateData:(id)a3 messageGuid:(id)a4;
+ (int64_t)validateString:(id)a3 messageGuid:(id)a4;
+ (void)enforceSecurityError:(int64_t)a3 messageGuid:(id)a4;
+ (void)inspectPayload:(id)a3 messageGuid:(id)a4;
@end

@implementation IDSPayloadInspector

+ (void)inspectPayload:(id)a3 messageGuid:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  if (!v29) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_validateData_messageGuid_(a1, v7, (uint64_t)v29, v8, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v9 = objc_msgSend_validateString_messageGuid_(a1, v12, (uint64_t)v29, v13, v6);
  }
  objc_msgSend_enforceSecurityError_messageGuid_(a1, v10, v9, v11, v6);
LABEL_7:
  if (objc_opt_respondsToSelector())
  {
    v17 = objc_msgSend_objectEnumerator(v29, v14, v15, v16);
    uint64_t v21 = objc_msgSend_nextObject(v17, v18, v19, v20);
    if (v21)
    {
      v24 = (void *)v21;
      do
      {
        objc_msgSend_inspectPayload_messageGuid_(a1, v22, (uint64_t)v24, v23, v6);
        uint64_t v28 = objc_msgSend_nextObject(v17, v25, v26, v27);

        v24 = (void *)v28;
      }
      while (v28);
    }
  }
LABEL_12:
}

+ (void)enforceSecurityError:(int64_t)a3 messageGuid:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_sharedInstance(IDSServerBag, v6, v7, v8);
  v12 = objc_msgSend_objectForKey_(v9, v10, @"ids-payload-inspector-enable-fault", v11);

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);
      if (a3 == 1)
      {
        if (v16)
        {
          double v20 = objc_msgSend_security(MEMORY[0x1E4F6C350], v17, v18, v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            sub_19DB8272C((uint64_t)v5, v20);
          }
        }
      }
    }
  }
}

+ (int64_t)validateData:(id)a3 messageGuid:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (v6)
  {
    unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
    double v11 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v7, (uint64_t)v6, v9, 0, &v36, 0);
    if (!v11) {
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v14 = objc_msgSend_security(MEMORY[0x1E4F6C350], v10, v13, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "%@ : Found a pList.", buf, 0xCu);
    }

    uint64_t v17 = objc_msgSend_objectForKey_(v11, v15, @"$archiver", v16);
    if (!v17) {
      goto LABEL_11;
    }
    uint64_t v18 = (void *)v17;
    double v19 = objc_msgSend_objectForKey_(v11, v10, @"$objects", v12);

    if (v19)
    {
      getpid();
      double v20 = CUTProcessNameForPid();
      v24 = objc_msgSend_security(MEMORY[0x1E4F6C350], v21, v22, v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        double v27 = objc_msgSend_objectForKey_(v11, v25, @"$archiver", v26);
        *(_DWORD *)buf = 138412802;
        id v38 = v8;
        __int16 v39 = 2112;
        v40 = v27;
        __int16 v41 = 2112;
        v42 = v20;
        _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "Found a serialized pList in message %@ with archiver %@ in process %@", buf, 0x20u);
      }
      int64_t v28 = 1;
    }
    else
    {
LABEL_11:
      double v20 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v10, (uint64_t)v6, v12, 0, 0);
      if (v20)
      {
        v32 = objc_msgSend_security(MEMORY[0x1E4F6C350], v29, v30, v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v8;
          _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "%@ : Found a Json object in NSData object. Proceeding to inspect further.", buf, 0xCu);
        }

        objc_msgSend_inspectPayload_messageGuid_(a1, v33, (uint64_t)v20, v34, v8);
      }
      int64_t v28 = -1;
    }
  }
  else
  {
    int64_t v28 = 0;
  }

  return v28;
}

+ (int64_t)validateString:(id)a3 messageGuid:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    double v12 = objc_msgSend_initWithBase64EncodedString_options_(v8, v9, (uint64_t)v6, v10, 1);
    if (!v12 || (uint64_t v14 = objc_msgSend_validateData_messageGuid_(a1, v11, (uint64_t)v12, v13, v7), v14 == -1))
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28D90];
      double v19 = objc_msgSend_dataUsingEncoding_(v6, v11, 4, v13);
      uint64_t v17 = objc_msgSend_JSONObjectWithData_options_error_(v18, v20, (uint64_t)v19, v21, 0, 0);

      if (v17)
      {
        v25 = objc_msgSend_security(MEMORY[0x1E4F6C350], v22, v23, v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412290;
          id v30 = v7;
          _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "%@ : Found a Json string. Proceeding to inspect further.", (uint8_t *)&v29, 0xCu);
        }

        objc_msgSend_inspectPayload_messageGuid_(a1, v26, (uint64_t)v17, v27, v7);
      }
      int64_t v16 = -1;
    }
    else
    {
      int64_t v16 = v14;
      uint64_t v17 = objc_msgSend_security(MEMORY[0x1E4F6C350], v11, v15, v13);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412546;
        id v30 = v7;
        __int16 v31 = 2048;
        int64_t v32 = v16;
        _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "%@ : Found error code %ld in base64 encoded data string. Proceeding to inspect further.", (uint8_t *)&v29, 0x16u);
      }
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

@end
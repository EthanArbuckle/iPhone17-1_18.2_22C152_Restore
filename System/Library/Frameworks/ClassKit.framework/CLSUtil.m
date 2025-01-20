@interface CLSUtil
+ (BOOL)isAppleInternalInstall;
+ (BOOL)isSystemIntegrityEnabled;
+ (id)dataFromError:(id)a3;
+ (id)dataFromPath:(id)a3 makeBackwardCompatible:(BOOL)a4 error:(id *)a5;
+ (id)dictionaryStrippingNSNullValues:(id)a3;
+ (id)errorFromData:(id)a3;
+ (id)hashArrayOfStrings:(id)a3 lastHash:(id)a4;
+ (id)hashData:(id)a3 lastHash:(id)a4;
+ (id)hashData:(id)a3 lastHashData:(id)a4;
+ (id)mediumDateFormatter;
+ (id)mediumStringFromDate:(id)a3;
+ (id)pathFromData:(id)a3;
+ (id)percentNumberFormatter;
+ (id)percentageStringFromNumber:(id)a3;
+ (id)stringFromTimeInterval:(double)a3;
+ (id)userDefaultsConfigurationDictionaryAndReturnError:(id *)a3;
+ (void)fetchInfoForAppWithBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)postNotification:(char *)a3;
+ (void)postNotificationAsync:(char *)a3;
@end

@implementation CLSUtil

+ (BOOL)isAppleInternalInstall
{
  if (qword_1EB5D4BA0 != -1) {
    dispatch_once(&qword_1EB5D4BA0, &unk_1F37A16B0);
  }
  return byte_1EB5D4B98;
}

+ (BOOL)isSystemIntegrityEnabled
{
  if (qword_1EAA98A98 != -1) {
    dispatch_once(&qword_1EAA98A98, &unk_1F37A0F70);
  }
  return byte_1EAA98900;
}

+ (id)percentageStringFromNumber:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v7 = objc_msgSend_percentNumberFormatter(a1, v5, v6);
    v9 = objc_msgSend_stringFromNumber_(v7, v8, (uint64_t)v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)percentNumberFormatter
{
  v3 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2);
  uint64_t v6 = objc_msgSend_threadDictionary(v3, v4, v5);
  objc_msgSend_objectForKeyedSubscript_(v6, v7, @"kCLSUtilPercentNumberFormatter");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    objc_msgSend_setNumberStyle_(v8, v9, 3);
    objc_msgSend_setUsesGroupingSeparator_(v8, v10, 0);
    v13 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v11, v12);
    v16 = objc_msgSend_threadDictionary(v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v8, @"kCLSUtilPercentNumberFormatter");
  }

  return v8;
}

+ (id)mediumStringFromDate:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_mediumDateFormatter(a1, v5, v6);
  v9 = objc_msgSend_stringFromDate_(v7, v8, (uint64_t)v4);

  return v9;
}

+ (id)stringFromTimeInterval:(double)a3
{
  if (qword_1EB5D4BB0 != -1) {
    dispatch_once(&qword_1EB5D4BB0, &unk_1F37A0FB0);
  }
  uint64_t v4 = qword_1EB5D4BA8;

  return (id)MEMORY[0x1F4181798](v4, sel_stringFromTimeInterval_, v3);
}

+ (id)mediumDateFormatter
{
  if (qword_1EB5D4BC0 != -1) {
    dispatch_once(&qword_1EB5D4BC0, &unk_1F37A0C30);
  }
  uint64_t v2 = (void *)qword_1EB5D4BB8;

  return v2;
}

+ (id)dataFromPath:(id)a3 makeBackwardCompatible:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (!objc_msgSend_count(v7, v8, v9))
  {
    v17 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = objc_msgSend_validatedContextIdentifierPathFromPath_(CLSContext, v10, (uint64_t)v7);

  id v27 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v12, v11, 1, &v27);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v27;
  if (!v14)
  {
    if (v6)
    {
      id v25 = 0;
      uint64_t v26 = 0;
      v18 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v15, (uint64_t)v13, 0, &v26, &v25);
      id v19 = v25;
      if (v19)
      {
        id v16 = v19;
        objc_msgSend_cls_debug_(v19, v20, CLSLogDefault);
        if (a5) {
          *a5 = v16;
        }

        goto LABEL_11;
      }
      id v24 = 0;
      uint64_t v21 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v20, (uint64_t)v18, v26, 0, &v24);
      id v16 = v24;

      if (v16)
      {
        objc_msgSend_cls_debug_(v16, v22, CLSLogDefault);
        if (a5) {
          *a5 = v16;
        }
      }

      id v13 = (id)v21;
    }
    else
    {
      id v16 = 0;
    }
    id v13 = v13;
    v17 = v13;
    goto LABEL_18;
  }
  id v16 = v14;
  objc_msgSend_cls_debug_(v14, v15, CLSLogDefault);
  if (!a5)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_18;
  }
  id v16 = v16;
  v17 = 0;
  *a5 = v16;
LABEL_18:

  id v7 = (id)v11;
LABEL_19:

  return v17;
}

+ (id)pathFromData:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v13, 2);
    uint64_t v9 = objc_msgSend_setWithArray_(v4, v8, (uint64_t)v7);
    uint64_t v11 = objc_msgSend_cls_secureUnarchiveObjectOfClasses_withData_(v3, v10, (uint64_t)v9, v5);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)dataFromError:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    uint64_t v3 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)a3, 1, &v9);
    id v4 = v9;
    BOOL v6 = v4;
    if (v4)
    {
      objc_msgSend_cls_debug_(v4, v5, CLSLogDefault);
      id v7 = 0;
    }
    else
    {
      id v7 = v3;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)errorFromData:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    id v7 = objc_msgSend_cls_secureUnarchiveObjectOfClass_withData_(v3, v6, v5, v4);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)hashData:(id)a3 lastHash:(id)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_dataUsingEncoding_(a4, v7, 4);
  v10 = objc_msgSend_hashData_lastHashData_(a1, v9, (uint64_t)v6, v8);

  return v10;
}

+ (id)hashData:(id)a3 lastHashData:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  memset(&c, 0, sizeof(c));
  CC_SHA224_Init(&c);
  id v7 = v5;
  v10 = (const void *)objc_msgSend_bytes(v7, v8, v9);
  CC_LONG v13 = objc_msgSend_length(v7, v11, v12);
  CC_SHA224_Update(&c, v10, v13);
  if (v6)
  {
    id v14 = v6;
    v17 = (const void *)objc_msgSend_bytes(v14, v15, v16);
    CC_LONG v20 = objc_msgSend_length(v14, v18, v19);
    CC_SHA224_Update(&c, v17, v20);
  }
  CC_SHA224_Final(md, &c);
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  for (uint64_t i = 0; i != 28; ++i)
    objc_msgSend_appendFormat_(v22, v21, @"%02x", md[i]);
  id v25 = objc_msgSend_copy(v22, v21, v24);

  return v25;
}

+ (id)hashArrayOfStrings:(id)a3 lastHash:(id)a4
{
  id v5 = a3;
  v10 = objc_msgSend_firstObject(v5, v6, v7);
  if (v10)
  {
    unint64_t v11 = objc_msgSend_count(v5, v8, v9);
    CC_LONG v13 = objc_msgSend_dataUsingEncoding_(v10, v12, 4);
    uint64_t v15 = objc_msgSend_hashData_lastHash_(a1, v14, (uint64_t)v13, 0);

    if (v11 < 2)
    {
      id v22 = v15;
    }
    else
    {
      for (uint64_t i = 1; i != v11; ++i)
      {
        v18 = objc_msgSend_objectAtIndex_(v5, v16, i);
        CC_LONG v20 = objc_msgSend_dataUsingEncoding_(v18, v19, 4);
        id v22 = objc_msgSend_hashData_lastHash_(a1, v21, (uint64_t)v20, v15);

        uint64_t v15 = v22;
      }
    }
  }
  else
  {
    v23 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v8, v9);
    id v22 = objc_msgSend_hashData_lastHash_(a1, v24, (uint64_t)v23, 0);
  }

  return v22;
}

+ (id)dictionaryStrippingNSNullValues:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, v26, 16);
    uint64_t v9 = v5;
    if (v6)
    {
      uint64_t v10 = v6;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v7, v8);
          v17 = objc_msgSend_objectForKeyedSubscript_(v5, v16, v14);
          int isEqual = objc_msgSend_isEqual_(v15, v18, (uint64_t)v17);

          if (isEqual)
          {
            if (!v11) {
              unint64_t v11 = objc_msgSend_mutableCopy(v5, v7, v8);
            }
            objc_msgSend_setObject_forKeyedSubscript_(v11, v7, 0, v14);
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v22, v26, 16);
      }
      while (v10);
      uint64_t v9 = v5;
      if (v11)
      {
        if (objc_msgSend_count(v11, v7, v8))
        {
          uint64_t v9 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v11);
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (void)postNotification:(char *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint32_t v4 = notify_post(a3);
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v5 = CLSLogDefault;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = a3;
      _os_log_error_impl(&dword_1DC60F000, v5, OS_LOG_TYPE_ERROR, "Notification post failed: '%s'", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = a3;
    _os_log_impl(&dword_1DC60F000, v5, OS_LOG_TYPE_INFO, "Notification posted: '%s'", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)postNotificationAsync:(char *)a3
{
  uint32_t v4 = clsNotificationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC66FCCC;
  block[3] = &unk_1E6C95AC0;
  block[4] = a3;
  dispatch_async(v4, block);
}

+ (id)userDefaultsConfigurationDictionaryAndReturnError:(id *)a3
{
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1DC66FF78;
  v28 = sub_1DC66FF88;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1DC66FF78;
  long long v22 = sub_1DC66FF88;
  id v23 = 0;
  id v5 = objc_msgSend_sharedDefaults(CLSUserDefaults, a2, (uint64_t)a3);
  if (v5)
  {
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1F37A1350);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DC66FF94;
    v14[3] = &unk_1E6C971C8;
    uint64_t v16 = &v18;
    v17 = &v24;
    id v7 = v6;
    id v15 = v7;
    objc_msgSend_userDefaultsConfigurationDictionaryWithCompletion_(v5, v8, (uint64_t)v14);
    dispatch_time_t v9 = dispatch_time(0, 60000000000);
    if (!dispatch_block_wait(v7, v9)) {
      goto LABEL_6;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    uint64_t v10 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CC_LONG v13 = 0;
      _os_log_error_impl(&dword_1DC60F000, v10, OS_LOG_TYPE_ERROR, "Timed out when getting user defaults configuration dictionary!", v13, 2u);
      if (!a3) {
        goto LABEL_8;
      }
    }
    else
    {
LABEL_6:
      if (!a3)
      {
LABEL_8:
        id v11 = (id)v19[5];

        goto LABEL_12;
      }
    }
    *a3 = (id) v25[5];
    goto LABEL_8;
  }
  if (a3)
  {
    objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E4F28C58], v4, 4, @"Not authorized to userDefaultsConfigurationDictionaryAndReturnError");
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_12:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

+ (void)fetchInfoForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v27 = a3;
  id v5 = (void (**)(id, void *, void *, void *))a4;
  dispatch_block_t v6 = (void *)MEMORY[0x1E01A0360]();
  if (objc_msgSend_length(v27, v7, v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v11 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v9, v10, (uint64_t)v27, 0, 0);
    uint64_t v14 = v11;
    if (v11)
    {
      id v15 = objc_msgSend_localizedName(v11, v12, v13);
      uint64_t v18 = objc_msgSend_teamIdentifier(v14, v16, v17);
      uint64_t v21 = objc_msgSend_iTunesMetadata(v14, v19, v20);
      uint64_t v24 = objc_msgSend_storeItemIdentifier(v21, v22, v23);
      if (v24)
      {
        uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v25, @"%lld", v24);
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v18 = 0;
      id v15 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v18 = 0;
    id v15 = 0;
  }
  v5[2](v5, v15, v26, v18);
}

@end
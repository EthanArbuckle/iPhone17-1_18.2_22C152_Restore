@interface CRWiFiCredentials
+ (id)createEncryptedCredentialsDataWithLocale:(id)a3;
+ (id)decryptWiFiCredDictFromCredentialsData:(id)a3;
+ (id)readAccessPointInfo;
@end

@implementation CRWiFiCredentials

+ (id)readAccessPointInfo
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = (const void *)WiFiManagerClientCreate();
  v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Read WiFi access point info", buf, 2u);
  }

  if (v2)
  {
    CFArrayRef v4 = (const __CFArray *)WiFiManagerClientCopyInterfaces();
    CFArrayRef v5 = v4;
    if (v4 && CFArrayGetCount(v4) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      v6 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
      uint64_t v7 = WiFiNetworkGetSSID();
      uint64_t v8 = WiFiNetworkCopyPassword();
      v10 = (void *)v8;
      if (v7)
      {
        v11 = (void *)MEMORY[0x263EFF9A0];
        v28 = @"AccessPoint";
        uint64_t v29 = v7;
        v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)&v29, (uint64_t)&v28, 1);
        v15 = objc_msgSend_dictionaryWithDictionary_(v11, v13, (uint64_t)v12, v14);

        if (!v10) {
          goto LABEL_9;
        }
      }
      else
      {
        v15 = 0;
        if (!v8)
        {
LABEL_9:
          CFRelease(v2);
          if (v6) {
            CFRelease(v6);
          }
LABEL_14:
          CFRelease(v5);
          v20 = v15;
          v21 = v10;
          v22 = (void *)v7;
          goto LABEL_18;
        }
      }
      v26 = @"AccessPointPwd";
      v27 = v10;
      v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)&v27, (uint64_t)&v26, 1);
      objc_msgSend_addEntriesFromDictionary_(v15, v17, (uint64_t)v16, v18);

      goto LABEL_9;
    }
    v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Unable to get wiFi interface information", buf, 2u);
    }

    CFRelease(v2);
    v15 = 0;
    v10 = 0;
    uint64_t v7 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {
    v23 = handleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "+[CRWiFiCredentials readAccessPointInfo]";
      _os_log_impl(&dword_21FBF2000, v23, OS_LOG_TYPE_DEFAULT, "%s :Failed to create WiFiManagerClient", buf, 0xCu);
    }

    v20 = 0;
    v21 = 0;
    v22 = 0;
  }
LABEL_18:
  id v24 = v20;

  return v24;
}

+ (id)createEncryptedCredentialsDataWithLocale:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_readAccessPointInfo(a1, v5, v6, v7);
  v9 = objc_opt_new();
  v13 = v9;
  if (v4) {
    objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v4, @"ActiveLocale");
  }
  if (v8)
  {
    objc_msgSend_addEntriesFromDictionary_(v13, v10, (uint64_t)v8, v12);
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v18 = (const char *)objc_msgSend_UTF8String(@"gs.apple.com", v15, v16, v17);
    v19 = SCNetworkReachabilityCreateWithName(v14, v18);
    if (v19)
    {
      v22 = v19;
      SCNetworkReachabilityFlags flags = 0;
      if (SCNetworkReachabilityGetFlags(v19, &flags)) {
        uint64_t v23 = (flags >> 1) & 1;
      }
      else {
        uint64_t v23 = 0;
      }
      CFRelease(v22);
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v24 = objc_msgSend_numberWithBool_(NSNumber, v20, v23, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, @"HasConnectivityData");
  }
  v26 = (void *)MEMORY[0x263F08900];
  v27 = objc_msgSend_copy(v13, v10, v11, v12);
  LODWORD(v26) = objc_msgSend_isValidJSONObject_(v26, v28, (uint64_t)v27, v29);

  if (!v26)
  {
    id v37 = 0;
    goto LABEL_16;
  }
  v33 = (void *)MEMORY[0x263F08900];
  v34 = objc_msgSend_copy(v13, v30, v31, v32);
  id v44 = 0;
  v36 = objc_msgSend_dataWithJSONObject_options_error_(v33, v35, (uint64_t)v34, 0, &v44);
  id v37 = v44;

  if (!v36)
  {
LABEL_16:
    v42 = handleForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_21FC6403C();
    }
    v36 = 0;
    goto LABEL_19;
  }
  uint64_t v40 = objc_msgSend_encryptUserData_(CRWiFiCredEncryption, v38, (uint64_t)v36, v39);
  if (v40)
  {
    v41 = (void *)v40;
    goto LABEL_20;
  }
  v42 = handleForCategory(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    sub_21FC64070();
  }
LABEL_19:

  v41 = 0;
LABEL_20:

  return v41;
}

+ (id)decryptWiFiCredDictFromCredentialsData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC640A4();
    }
    goto LABEL_12;
  }
  uint64_t v6 = objc_msgSend_decryptUserData_(CRWiFiCredEncryption, v3, (uint64_t)v5, v4);
  if (!v6)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC640D8();
    }
LABEL_12:
    id v10 = 0;
    v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v6;
  id v13 = 0;
  v9 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v7, v6, 0, &v13);
  id v10 = v13;
  uint64_t v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_21FC6410C((uint64_t)v9, v11);
  }
LABEL_5:

  return v9;
}

@end
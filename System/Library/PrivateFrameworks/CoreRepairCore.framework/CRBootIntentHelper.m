@interface CRBootIntentHelper
- (void)clearBootIntent:(id)a3;
- (void)clearRepairBackup:(id)a3;
- (void)getRepairTicket:(id)a3;
- (void)setBootIntentAndRebootToCheckerboardWithLocale:(id)a3 reply:(id)a4;
@end

@implementation CRBootIntentHelper

- (void)setBootIntentAndRebootToCheckerboardWithLocale:(id)a3 reply:(id)a4
{
  v45[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, uint64_t, id))a4;
  v8 = objc_msgSend_createEncryptedCredentialsDataWithLocale_(CRWiFiCredentials, v6, (uint64_t)a3, v7);
  v11 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v9, (uint64_t)&unk_26D163A48, v10);
  v12 = handleForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "Set boot intent and reboot to Checkerboard", buf, 2u);
  }

  if (v8)
  {
    v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "Add encrypted WiFi credentials and locale", buf, 2u);
    }

    v18 = objc_msgSend_base64EncodedStringWithOptions_(v8, v16, 0, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v19, (uint64_t)v18, @"wifi-credentials");
  }
  if (!objc_msgSend_isValidJSONObject_(MEMORY[0x263F08900], v13, (uint64_t)v11, v14))
  {
    id v22 = 0;
    goto LABEL_20;
  }
  id v42 = 0;
  v21 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x263F08900], v20, (uint64_t)v11, 0, &v42);
  id v22 = v42;
  if (!v21)
  {
    v38 = handleForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_21FC62BC8((uint64_t)v22, v38);
    }

    goto LABEL_20;
  }
  id v23 = [NSString alloc];
  v25 = objc_msgSend_initWithData_encoding_(v23, v24, (uint64_t)v21, 4);

  if (!v25)
  {
LABEL_20:
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC62B84(v36);
    }
    v25 = 0;
    goto LABEL_23;
  }
  id v41 = v22;
  char v27 = objc_msgSend_setNVRAMValueForKey_value_error_(CRNVRAMController, v26, @"diagnostic-boot-intent", (uint64_t)v25, &v41);
  id v28 = v41;

  if ((v27 & 1) == 0)
  {
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC62D2C();
    }
LABEL_28:
    id v22 = v28;
    goto LABEL_23;
  }
  id v40 = v28;
  char v30 = objc_msgSend_setNVRAMValueForKey_value_error_(CRNVRAMController, v29, @"one-time-boot-command", @"checkerboard", &v40);
  id v22 = v40;

  if (v30)
  {
    int v31 = reboot3();
    if (!v31)
    {
      uint64_t v39 = 1;
      if (!v5) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    int v32 = v31;
    v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC62C40(v32, v33);
    }

    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45[0] = @"not supported in this mode or device";
    v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v45, (uint64_t)&v44, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v34, v37, @"com.apple.corerepair", -73, v36);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  v36 = handleForCategory(0);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_21FC62CB8();
  }
LABEL_23:

  uint64_t v39 = 0;
  if (v5) {
LABEL_24:
  }
    v5[2](v5, v39, v22);
LABEL_25:
}

- (void)getRepairTicket:(id)a3
{
  v3 = (void (**)(id, uint64_t, id, id))a3;
  uint64_t DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v4, v5, v6);
  id v20 = 0;
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v8, v9, v10)
    && objc_msgSend_enableSSO_(CRPersonalizationManager, v11, DefaultAMAuthInstallRef, v12))
  {
    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC62DA0(v13);
    }

    id v14 = 0;
    id v15 = 0;
    uint64_t RepairTicket_error = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v11, DefaultAMAuthInstallRef, v12);
    id v19 = 0;
    uint64_t RepairTicket_error = objc_msgSend_getRepairTicket_error_(v17, v18, (uint64_t)&v20, (uint64_t)&v19);
    id v15 = v19;

    id v14 = v20;
  }
  v3[2](v3, RepairTicket_error, v14, v15);

  AMSupportSafeRelease();
}

- (void)clearBootIntent:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  id v13 = 0;
  char v5 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v4, @"diagnostic-boot-intent", (uint64_t)&v13);
  id v7 = v13;
  if ((v5 & 1) == 0)
  {
    v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC62E58();
    }
    goto LABEL_9;
  }
  id v12 = v7;
  char v8 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v6, @"one-time-boot-command", (uint64_t)&v12);
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC62DE4();
    }
    id v7 = v9;
LABEL_9:

    uint64_t v10 = 0;
    id v9 = v7;
    goto LABEL_10;
  }
  uint64_t v10 = 1;
LABEL_10:
  v3[2](v3, v10, v9);
}

- (void)clearRepairBackup:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  id v7 = objc_msgSend_sharedSingleton(CRFileSystemController, v4, v5, v6);
  id v12 = 0;
  uint64_t v10 = objc_msgSend_clearRepairBackup_(v7, v8, (uint64_t)&v12, v9);
  id v11 = v12;

  v3[2](v3, v10, v11);
}

@end
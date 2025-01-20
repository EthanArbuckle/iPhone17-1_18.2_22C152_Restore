BOOL sub_240518B14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  BOOL v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v9 = v6;
  if (v6
    && (objc_msgSend_password(v6, v7, v8), v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    v15 = objc_msgSend_mf_legacyPasswordFromKeychain(v5, v11, v12);
    v13 = v15 != 0;
    if (v15)
    {
      objc_msgSend_setPassword_(v9, v14, (uint64_t)v15);
      objc_msgSend_mf_removeLegacyPasswordInKeychain(v5, v16, v17);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_240518BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_240518BD4()
{
  return 0;
}

uint64_t sub_240518BDC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7 = objc_msgSend_mf_accountClass(a1, v5, v6);
  uint64_t v9 = objc_msgSend_migrateCredentialsIfNecessaryWithPersistentAccount_credential_(v7, v8, (uint64_t)a1, v4);

  return v9;
}

void sub_240518C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_240518C34(void *a1, const char *a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x263F55380];
  v5 = objc_msgSend_mf_hostname(a1, a2, a3);
  v8 = objc_msgSend_username(a1, v6, v7);
  uint64_t v11 = objc_msgSend_mf_legacyPortNumberForKeychain(a1, v9, v10);
  uint64_t v14 = objc_msgSend_mf_legacyKeychainProtocol(a1, v12, v13);
  v16 = objc_msgSend_passwordForHost_username_port_keychainProtocol_(v4, v15, (uint64_t)v5, v8, v11, v14);

  return v16;
}

void sub_240518CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_240518CF4(void *a1, const char *a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x263F55380];
  objc_msgSend_mf_hostname(a1, a2, a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_username(a1, v5, v6);
  uint64_t v10 = objc_msgSend_mf_legacyPortNumberForKeychain(a1, v8, v9);
  uint64_t v13 = objc_msgSend_mf_legacyKeychainProtocol(a1, v11, v12);
  objc_msgSend_removePasswordForHost_username_port_keychainProtocol_(v4, v14, (uint64_t)v15, v7, v10, v13);
}

void sub_240518D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_240518DAC(void *a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = 0;
  v3 = objc_msgSend_accountClassForPersistentAccount_error_(MEMORY[0x263F55320], a2, (uint64_t)a1, &v16);
  id v4 = v16;
  v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend_accountType(a1, v8, v9);
      uint64_t v13 = objc_msgSend_identifier(v10, v11, v12);
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_240517000, v7, OS_LOG_TYPE_DEFAULT, "#Warning failed to load class for account of type %@", buf, 0xCu);
    }
  }
  id v14 = v3;

  return v14;
}

void sub_240518ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_240518EFC(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_mf_accountClass(a1, a2, a3);
  uint64_t v7 = objc_msgSend_accountProperties(a1, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x263F552F8]);

  if (!v9 || (objc_opt_respondsToSelector() & 1) == 0 || (uint64_t v12 = objc_msgSend_intValue(v9, v10, v11), !v12))
  {
    if (!objc_msgSend_mf_usesSSL(a1, v10, v11)
      || (uint64_t v12 = objc_msgSend_defaultSecurePortNumber(v4, v10, v13), !v12))
    {
      uint64_t v12 = objc_msgSend_defaultPortNumber(v4, v10, v13);
    }
  }
  if (objc_msgSend_isCommonPortNumber_(v4, v10, v12))
  {
    id v16 = objc_msgSend_accountType(a1, v14, v15);
    uint64_t v19 = objc_msgSend_identifier(v16, v17, v18);
    char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x263EFAF98]);

    if (isEqualToString) {
      uint64_t v12 = 25;
    }
    else {
      uint64_t v12 = objc_msgSend_defaultPortNumber(v4, v22, v23);
    }
  }

  return v12;
}

void sub_240519018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_24051904C(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_mf_accountClass(a1, a2, a3);
  uint64_t v9 = objc_msgSend_hostname(v4, v5, v6);
  if (!v9)
  {
    uint64_t v10 = objc_msgSend_accountProperties(a1, v7, v8);
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263F552F0]);
  }
  return v9;
}

void sub_2405190C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2405190D0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_mf_accountClass(a1, a2, a3);
  return MEMORY[0x270F9A6D0](v3, sel_legacyKeychainProtocol, v4);
}

uint64_t sub_2405190F8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_mf_accountClass(a1, a2, a3);
  if (objc_msgSend_usesSSL(v4, v5, v6)) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_accountProperties(a1, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263F55300]);

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v9 = objc_msgSend_BOOLValue(v12, v13, v14);
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_240519194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051924C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051941C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_240519644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_240519684(void *a1, const char *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v6 = 0;
  objc_msgSend__verifyAccount_error_(v3, a2, v4, &v6);
  id v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_2405196E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_240519790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_240519ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_240519B64(uint64_t a1, const char *a2)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_240519D58;
    v11[3] = &unk_2650BDDC0;
    v11[4] = v7;
    id v12 = *(id *)(a1 + 32);
    char v16 = *(unsigned char *)(a1 + 73);
    id v13 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 56);
    objc_msgSend__showPasswordPromptWithAccount_completionBlock_(v7, v9, v8, v11);

    id v6 = v12;
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 73))
  {
    objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), a2, 1);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_240519D40;
    v17[3] = &unk_2650BDD70;
    id v18 = *(id *)(a1 + 64);
    objc_msgSend_saveAccount_withHandler_(v3, v5, v4, v17);
    id v6 = v18;
LABEL_5:

    return;
  }
  uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  v10();
}

void sub_240519D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_240519D40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240519D58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = v5;
  if (a2 != 3)
  {
    if (a2 == 1)
    {
      id v8 = 0;
      objc_msgSend__logWithAccount_level_reason_message_(*(void **)(a1 + 32), v6, *(void *)(a1 + 40), 1, @"user cancelled credential renewal", 0);
    }
    else if (v5)
    {
      objc_msgSend_setPassword_(*(void **)(a1 + 56), v6, (uint64_t)v5);
      id v13 = *(void **)(a1 + 56);
      id v29 = 0;
      int TokensIfNecessary = objc_msgSend_fetchTokensIfNecessary_(v13, v14, (uint64_t)&v29);
      id v8 = v29;
      if (TokensIfNecessary) {
        objc_msgSend_stringWithFormat_(NSString, v16, @"renewing credentials %s", "succeeded");
      }
      else {
      v17 = objc_msgSend_stringWithFormat_(NSString, v16, @"renewing credentials %s", "failed");
      }
      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      v22 = objc_msgSend_description(v8, v20, v21);
      objc_msgSend__logWithAccount_level_reason_message_(v18, v23, v19, 1, v17, @"%@", v22);

      v24 = (void *)MEMORY[0x263F230F0];
      v27 = objc_msgSend_persistentAccount(*(void **)(a1 + 56), v25, v26);
      objc_msgSend_setCredentialForAccount_(v24, v28, (uint64_t)v27);
    }
    else
    {
      id v8 = 0;
    }
    goto LABEL_13;
  }
  objc_msgSend__logWithAccount_level_reason_message_(*(void **)(a1 + 32), v6, *(void *)(a1 + 40), 1, @"credential renewal was aborted", 0);
  if (!*(unsigned char *)(a1 + 72))
  {
    id v8 = 0;
LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  objc_msgSend_setAuthenticated_(*(void **)(a1 + 40), v9, 1);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_240519FDC;
  v30[3] = &unk_2650BDD98;
  id v31 = *(id *)(a1 + 64);
  uint64_t v32 = 2;
  objc_msgSend_saveAccount_withHandler_(v10, v12, v11, v30);

  id v8 = 0;
LABEL_14:
}

void sub_240519F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_240519FDC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_240519FF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24051A3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051A538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051A614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051A7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24051AA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x270EE54F0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x270F4A6A0]();
}

uint64_t MFLookupLocalizedString()
{
  return MEMORY[0x270F4A650]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

st char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;
  const char *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  void buf[4];
  uint64_t v41;

  buf[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = a3;
  uint64_t v10 = a5;
  uint64_t v11 = a6;
  id v12 = NSString;
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  char v16 = objc_msgSend_stringWithFormat_(v12, v15, @"%@:", v14);
  uint64_t v19 = objc_msgSend_mutableCopy(v16, v17, v18);

  if (objc_msgSend_length(v10, v20, v21)) {
    objc_msgSend_appendFormat_(v19, v22, @" %@", v10);
  }
  if (v9)
  {
    v24 = objc_msgSend_accountDescription(v9, v22, v23);
    v27 = objc_msgSend_identifier(v9, v25, v26);
    v30 = objc_msgSend_accountType(v9, v28, v29);
    v33 = objc_msgSend_identifier(v30, v31, v32);
    objc_msgSend_appendFormat_(v19, v34, @" for account %@ (%@) of type %@", v24, v27, v33);
  }
  if (objc_msgSend_length(v11, v22, v23))
  {
    buf[0] = &v41;
    v35 = [NSString alloc];
    v37 = objc_msgSend_initWithFormat_arguments_(v35, v36, (uint64_t)v11, &v41);
    objc_msgSend_appendString_(v19, v38, (uint64_t)v37);
  }
  v39 = MFLogGeneral();
  if (os_log_type_enabled(v39, (os_log_type_t)a4))
  {
    LODWORD(buf[0]) = 138412290;
    *(void *)((char *)buf + 4) = v19;
    _os_log_impl(&dword_240517000, v39, (os_log_type_t)a4, "%@", (uint8_t *)buf, 0xCu);
  }
}

- (BOOL)_clientIsEntitled:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_hasEntitlement_, *MEMORY[0x263EFB2B0]);
}

@end
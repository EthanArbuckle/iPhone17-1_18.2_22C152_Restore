uint64_t sub_3000()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_C370;
  v5 = qword_C370;
  if (!qword_C370)
  {
    v6 = *(_OWORD *)off_8248;
    v7 = *(_OWORD *)&off_8258;
    v3[3] = _sl_dlopen();
    qword_C370 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_3110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3128(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_C370 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_31B8()
{
  v1 = 0;
  uint64_t result = sub_3000();
  if (!result) {
    sub_5690(&v1);
  }
  return result;
}

uint64_t sub_320C()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_C378;
  uint64_t v6 = qword_C378;
  if (!qword_C378)
  {
    v1 = (void *)sub_31B8();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    qword_C378 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_32E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_32FC(uint64_t a1)
{
  v2 = (void *)sub_31B8();
  uint64_t result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_C378 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_334C()
{
  uint64_t v0 = (uint64_t (*)(void))sub_320C();
  if (!v0) {
    sub_5710();
  }
  return v0();
}

uint64_t sub_337C()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_C380;
  uint64_t v6 = qword_C380;
  if (!qword_C380)
  {
    v1 = (void *)sub_31B8();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    qword_C380 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_3454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_346C(uint64_t a1)
{
  v2 = (void *)sub_31B8();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_C380 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_34BC()
{
  uint64_t v0 = (uint64_t (*)(void))sub_337C();
  if (!v0) {
    sub_5788();
  }
  return v0();
}

id sub_34EC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_C388;
  uint64_t v7 = qword_C388;
  if (!qword_C388)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_35D0;
    v3[3] = &unk_8298;
    v3[4] = &v4;
    sub_35D0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_35B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_35D0(uint64_t a1)
{
  sub_31B8();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5800();
  }
  qword_C388 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_3628()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_C390;
  uint64_t v6 = qword_C390;
  if (!qword_C390)
  {
    id v1 = (void *)sub_31B8();
    v4[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierAppleID");
    qword_C390 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_3700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_3718(uint64_t a1)
{
  v2 = (void *)sub_31B8();
  Class result = dlsym(v2, "BYFlowSkipIdentifierAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_C390 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_3768()
{
  uint64_t v0 = (void **)sub_3628();
  if (!v0) {
    sub_587C();
  }
  id v1 = *v0;
  return v1;
}

id sub_40B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "aa_altDSID");
  unsigned __int8 v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = &dword_0 + 1;
  }
  else
  {
    uint64_t v7 = objc_msgSend(v3, "aa_normalizedPersonID");
    if ([v7 isEqualToString:*(void *)(a1 + 40)]) {
      id v6 = &dword_0 + 1;
    }
    else {
      id v6 = [*(id *)(a1 + 48) _isBenefactorAccount:v3 storedContext:*(void *)(a1 + 56) benefactorUsername:*(void *)(a1 + 64)];
    }
  }
  return v6;
}

id sub_4A3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_5AE0();
  }

  id v5 = [*(id *)(a1 + 32) _isBenefactorAccount:v3 storedContext:*(void *)(a1 + 40) benefactorUsername:*(void *)(a1 + 48)];
  return v5;
}

void sub_5674(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_5690(void *a1)
{
  v2 = +[NSAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AASetupAssistantSoftLink.m", 12, @"%s", *a1);

  __break(1u);
}

void sub_5710()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"BOOL SBYSetupAssistantIsRunningSilentTokenUpgrade(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 13, @"%s", dlerror());

  __break(1u);
}

void sub_5788()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"BOOL SBYSetupAssistantHasCompletedInitialRun(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 14, @"%s", dlerror());

  __break(1u);
}

void sub_5800()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getBYFlowSkipControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 17, @"Unable to find class %s", "BYFlowSkipController");

  __break(1u);
}

void sub_587C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"typeof (((typeof (BYFlowSkipIdentifierAppleID) (*)(void))0)()) getBYFlowSkipIdentifierAppleID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 18, @"%s", dlerror());

  __break(1u);
}

void sub_58F4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DM: Found benefactor DSID. Fetching the username for the benefactor.", v1, 2u);
}

void sub_5938()
{
  sub_5668();
  sub_5674(&dword_0, v0, v1, "DM: Failed to save CloudKit token to child account: %@", v2, v3, v4, v5, v6);
}

void sub_59A0()
{
  sub_5668();
  sub_5674(&dword_0, v0, v1, "DM: Failed to save IDMS account, error: %@", v2, v3, v4, v5, v6);
}

void sub_5A08(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 appleID];
  sub_5668();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "DM: Found an IDMS account (%@).", v4, 0xCu);
}

void sub_5A9C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "######## DM: Error fetching IdMS accounts for the benefactor.", v1, 2u);
}

void sub_5AE0()
{
  sub_5668();
  sub_5674(&dword_0, v0, v1, "######## DM: obj: %@", v2, v3, v4, v5, v6);
}

void sub_5B48()
{
  sub_5668();
  sub_5674(&dword_0, v0, v1, "DM: Error fetching AppleAccounts: %@", v2, v3, v4, v5, v6);
}

void sub_5BB0()
{
  sub_5668();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed to update Apple ID account %@, error: %@", v2, 0x16u);
}

void sub_5C34()
{
  sub_5668();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "DM: Updating altDSID of beneficiary account (%@).", v1, 0xCu);
}

void sub_5CA8()
{
  sub_5668();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "DM: Updating IdMS account (%@) for beneficiary.", v1, 0xCu);
}

void sub_5D1C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Primary AppleAccount matches with the benefactor DSID.", v1, 2u);
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_cloudKitToken(void *a1, const char *a2, ...)
{
  return [a1 cloudKitToken];
}

id objc_msgSend_continuationKey(void *a1, const char *a2, ...)
{
  return [a1 continuationKey];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isBeneficiaryLogin(void *a1, const char *a2, ...)
{
  return [a1 isBeneficiaryLogin];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_passwordResetKey(void *a1, const char *a2, ...)
{
  return [a1 passwordResetKey];
}

id objc_msgSend_rawPassword(void *a1, const char *a2, ...)
{
  return [a1 rawPassword];
}

id objc_msgSend_sharedStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedStorage];
}

id objc_msgSend_storeOriginalUsername(void *a1, const char *a2, ...)
{
  return [a1 storeOriginalUsername];
}

id objc_msgSend_storedContext(void *a1, const char *a2, ...)
{
  return [a1 storedContext];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   [v7 setAccountProperty:&__kCFBooleanTrue forKey:@"beneficiaryAccount"];
    }
  }
  else
  {
  }
  v14 = [v7 username];
  v15 = [v8 appleID];
  v16 = [v14 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
    [v7 storeOriginalUsername];
    v17 = [v8 appleID];
    [v7 setUsername:v17];
  }
  v18 = [v8 rawPassword];

  if (v18)
  {
    v19 = [v7 accountType];
    v20 = [v19 identifier];

    if (([v20 isEqual:ACAccountTypeIdentifierAppleAccount] & 1) != 0
      || [v20 isEqual:ACAccountTypeIdentifierIdentityServices])
    {
      v21 = objc_msgSend(v7, "_aa_rawPassword");
      v22 = [v8 rawPassword];
      v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        objc_msgSend(v7, "_aa_clearRawPassword");
        [v9 saveVerifiedAccount:v7 error:0];
      }
      v24 = [v8 rawPassword];
      objc_msgSend(v7, "_aa_setRawPassword:", v24);
    }
  }
  v25 = [v8 firstName];

  if (v25)
  {
    v26 = [v8 firstName];
    objc_msgSend(v7, "aa_setFirstName:", v26);
  }
  v27 = [v8 middleName];

  if (v27)
  {
    v28 = [v8 middleName];
    objc_msgSend(v7, "aa_setMiddleName:", v28);
  }
  v29 = [v8 lastName];

  if (v29)
  {
    v30 = [v8 lastName];
    objc_msgSend(v7, "aa_setLastName:", v30);
  }
  if ([v8 isBeneficiaryLogin])
  {
    v31 = _AALogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_5C34();
    }

    v32 = [v8 altDSID];
    objc_msgSend(v7, "_aa_setAltDSID:", v32);
  }
  v38 = 0;
  v33 = [v9 saveVerifiedAccount:v7 error:&v38];
  v34 = v38;
  v35 = _AALogSystem();
  v36 = v35;
  if (v33)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Successfully updated Apple ID account!", v37, 2u);
    }
  }
  else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    sub_5BB0();
  }
}

- (id)_benefactorDSIDForContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 DSID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint8_t v6 = [v3 DSID];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if (v7)
    {
      v8 = [v3 DSID];
      uint8_t v6 = [v8 stringValue];
    }
    else
    {
      uint8_t v6 = 0;
    }
  }

  return v6;
}

- (id)_benefactorUsernameFromDSID:(id)a3 appleAccount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_msgSend(v5, "aa_normalizedPersonID");
  unsigned int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_5D1C(v9);
    }

    v10 = [v5 username];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isBenefactorAccount:(id)a3 storedContext:(id)a4 benefactorUsername:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isBeneficiaryLogin])
  {
    v11 = [(MergeBuddyProvisioningResponse *)self _benefactorDSIDForContext:v9];
    v12 = objc_msgSend(v8, "aa_normalizedPersonID");
    if ([v11 isEqualToString:v12])
    {
      unsigned __int8 v13 = 1;
    }
    else
    {
      v14 = [v8 username];
      unsigned __int8 v13 = [v10 isEqualToString:v14];
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)_migrateBenefactorAccount:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "_aa_setBenefactorAccount:", 1);
  uint64_t v4 = ACAccountDataclassDeviceLocator;
  if ([v3 isProvisionedForDataclass:ACAccountDataclassDeviceLocator])
  {
    id v5 = [v3 parentAccount];

    if (!v5)
    {
      [v3 setEnabled:0 forDataclass:v4];
      [v3 setProvisioned:0 forDataclass:v4];
    }
  }

  return 0;
}

@end
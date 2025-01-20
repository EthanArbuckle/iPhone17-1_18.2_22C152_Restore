void sub_6718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_6744(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Siri data sharing acknowledement", v5, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7958(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_7978(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Migrating intelligence presented preference key", v7, 2u);
    }

    v4 = [*(id *)(a1 + 32) buddyPreferencesExcludedFromBackup];
    v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v4 setObject:v5 forKey:@"IntelligencePresented" persistImmediately:1];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_7A40(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7C8C(uint64_t a1, uint64_t a2)
{
  v3 = [[_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider alloc] initWithIsIntelligenceEnabled:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(BuddyCameraControlPresentationProvider *)v3 shouldPresentVisualIntelligencePane];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_813C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_816C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  BOOL v8 = a2 == 2 && v5 == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v11[0] = 67109376;
    v11[1] = v10;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Routine manager supplied state %d (%d)", (uint8_t *)v11, 0xEu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 == 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_8274(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  BOOL v8 = a2 == 2 && v5 == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v11[0] = 67109376;
    v11[1] = v10;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Routine manager supplied state %d (%d)", (uint8_t *)v11, 0xEu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_8970(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKSetupAssistantContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_270D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_15FE0();
    sub_89C8();
  }
}

void sub_89C8()
{
  v1[0] = 0;
  if (!qword_270E0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_8AC4;
    v1[4] = &unk_20988;
    v1[5] = v1;
    long long v2 = off_20970;
    uint64_t v3 = 0;
    qword_270E0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_270E0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_8AC4()
{
  uint64_t result = _sl_dlopen();
  qword_270E0 = result;
  return result;
}

Class sub_8B38(uint64_t a1)
{
  sub_89C8();
  Class result = objc_getClass("PKPaymentSetupAssistantController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_270E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_16008();
    return (Class)sub_8B90(v3);
  }
  return result;
}

Class sub_8B90(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_270F8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_8CD4;
    v4[4] = &unk_20988;
    v4[5] = v4;
    long long v5 = off_209A8;
    uint64_t v6 = 0;
    qword_270F8 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_270F8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ICQOfferManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_16030();
LABEL_8:
    free(v2);
  }
  qword_270F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_8CD4()
{
  uint64_t result = _sl_dlopen();
  qword_270F8 = result;
  return result;
}

Class sub_8D48(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_27108)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_8E8C;
    v4[4] = &unk_20988;
    v4[5] = v4;
    long long v5 = off_209C0;
    uint64_t v6 = 0;
    qword_27108 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_27108)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBBundle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_16058();
LABEL_8:
    free(v2);
  }
  qword_27100 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_8E8C()
{
  uint64_t result = _sl_dlopen();
  qword_27108 = result;
  return result;
}

void sub_8F00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_8FF8(id a1, NSArray *a2, NSError *a3)
{
  if (a3)
  {
    uint64_t v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_16080(v3);
    }
  }
}

id sub_92BC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _attemptPreheat:3];
}

void sub_98F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_9940(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) launchURL];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;

  uint64_t v3 = [*(id *)(a1 + 32) message];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

id sub_99B4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setLaunchURL:*(void *)(a1 + 40)];
}

id sub_99BC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setMessage:*(void *)(a1 + 40)];
}

id sub_99C4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _attemptPreheat:*(void *)(a1 + 40) - 1];
}

id sub_9AA4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _attemptPreheat:1];
}

void sub_9D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9FF8()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_27120;
  uint64_t v7 = qword_27120;
  if (!qword_27120)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_A848;
    v3[3] = &unk_20950;
    v3[4] = &v4;
    sub_A848((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A210(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    v18 = sub_A574();
    v14 = [v5 objectForKeyedSubscript:v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = sub_A574();
      v20 = [v5 objectForKeyedSubscript:v19];

      if (v20)
      {
        id v21 = objc_alloc_init((Class)NSNumberFormatter);
        v22 = [v21 numberFromString:v20];
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v22 unsignedIntegerValue];
      }
      else
      {
        v23 = _BYLoggingFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "No mandatory software update information available (flags are nil)", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      v20 = _BYLoggingFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_16108(v20);
      }
    }

    goto LABEL_22;
  }
  BOOL v8 = [v6 domain];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v9 = (id *)qword_27128;
  uint64_t v27 = qword_27128;
  if (!qword_27128)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v29 = sub_A8A0;
    v30 = &unk_20950;
    v31 = &v24;
    int v10 = (void *)sub_A6D4();
    v11 = dlsym(v10, "SUErrorDomain");
    *(void *)(v31[1] + 24) = v11;
    qword_27128 = *(void *)(v31[1] + 24);
    uint64_t v9 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v9)
  {
    sub_1614C();
    __break(1u);
  }
  id v12 = *v9;
  if (objc_msgSend(v8, "isEqualToString:", v12, v24))
  {
    BOOL v13 = [v7 code] == (char *)&stru_20.vmaddr + 6;

    if (v13)
    {
      v14 = _BYLoggingFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v15 = "No mandatory software update information available";
        v16 = v14;
        uint32_t v17 = 2;
LABEL_15:
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&buf, v17);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  v14 = _BYLoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    v15 = "Unable to get mandatory software update information: %@";
    v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_15;
  }
LABEL_22:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_A554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_A574()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)qword_27130;
  uint64_t v8 = qword_27130;
  if (!qword_27130)
  {
    id v1 = (void *)sub_A6D4();
    v6[3] = (uint64_t)dlsym(v1, "SUMandatoryUpdateFlagsKey");
    qword_27130 = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)sub_1614C();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;

  return v2;
}

Class sub_A67C(uint64_t a1)
{
  sub_A6D4();
  Class result = objc_getClass("SUDownloadPolicyFactory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_27110 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_16170();
    return (Class)sub_A6D4();
  }
  return result;
}

uint64_t sub_A6D4()
{
  v3[0] = 0;
  if (!qword_27118)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_A7D4;
    v3[4] = &unk_20988;
    void v3[5] = v3;
    long long v4 = off_20AE0;
    uint64_t v5 = 0;
    qword_27118 = _sl_dlopen();
  }
  uint64_t v0 = qword_27118;
  id v1 = (void *)v3[0];
  if (!qword_27118)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_A7D4()
{
  uint64_t result = _sl_dlopen();
  qword_27118 = result;
  return result;
}

Class sub_A848(uint64_t a1)
{
  sub_A6D4();
  Class result = objc_getClass("SUManagerClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_27120 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_16198();
    return (Class)sub_A8A0(v3);
  }
  return result;
}

void *sub_A8A0(uint64_t a1)
{
  long long v2 = (void *)sub_A6D4();
  Class result = dlsym(v2, "SUErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_27128 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_A8F0(uint64_t a1)
{
  long long v2 = (void *)sub_A6D4();
  Class result = dlsym(v2, "SUMandatoryUpdateFlagsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_27130 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *Logger.purpleBuddySubsystem.unsafeMutableAddressor()
{
  return &static Logger.purpleBuddySubsystem;
}

unint64_t static Logger.purpleBuddySubsystem.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_CAA8(uint64_t a1)
{
  return sub_CB6C(a1, static Logger.purpleBuddyGeneral);
}

uint64_t Logger.purpleBuddyGeneral.unsafeMutableAddressor()
{
  return sub_CC08(&qword_26D40, (uint64_t)static Logger.purpleBuddyGeneral);
}

uint64_t sub_CAEC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.purpleBuddyGeneral.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_CC80(&qword_26D40, (uint64_t)static Logger.purpleBuddyGeneral, a1);
}

uint64_t sub_CB48(uint64_t a1)
{
  return sub_CB6C(a1, static Logger.purpleBuddyAppearance);
}

uint64_t sub_CB6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_164A0();
  sub_CD28(v3, a2);
  sub_CAEC(v3, (uint64_t)a2);
  return sub_16490();
}

uint64_t Logger.purpleBuddyAppearance.unsafeMutableAddressor()
{
  return sub_CC08(&qword_26D48, (uint64_t)static Logger.purpleBuddyAppearance);
}

uint64_t sub_CC08(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_164A0();

  return sub_CAEC(v3, a2);
}

uint64_t static Logger.purpleBuddyAppearance.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_CC80(&qword_26D48, (uint64_t)static Logger.purpleBuddyAppearance, a1);
}

uint64_t sub_CC80@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_164A0();
  uint64_t v6 = sub_CAEC(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t variable initialization expression of IntelligenceManager.didShowIntelligencePaneThisBuddyRun()
{
  return 0;
}

uint64_t variable initialization expression of IntelligenceAvailabilityProvider.serverBackedValue()
{
  return 2;
}

uint64_t *sub_CD28(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t static GenerativeModelsAvailability.setupAssistantInstance.getter()
{
  uint64_t v0 = sub_16400();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_163F0();
  sub_16430();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void *GenerativeModelsAvailability.unavailabilityReasons.getter()
{
  uint64_t v0 = sub_163E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_163D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_16410();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == enum case for GenerativeModelsAvailability.Availability.unavailable(_:))
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v3, v0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v8 = sub_163C0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return &_swiftEmptySetSingleton;
  }
  return (void *)v8;
}

id IntelligenceStateProvider.__allocating_init(generativeModelProvider:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = sub_EB5C(a1, v4);
  __chkstk_darwin(v6, v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  id v10 = sub_EAAC((uint64_t)v8, v3, v4, v5);
  sub_EBAC(a1);
  return v10;
}

id IntelligenceStateProvider.init(generativeModelProvider:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = sub_EB5C(a1, v3);
  __chkstk_darwin(v5, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  id v9 = sub_EAAC((uint64_t)v7, v1, v3, v4);
  sub_EBAC(a1);
  return v9;
}

uint64_t IntelligenceStateProvider.isIntelligenceEnabled()()
{
  return _swift_task_switch(sub_D264, 0, 0);
}

uint64_t sub_D264()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_D36C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_D508;
  v0[13] = &unk_20D38;
  v0[14] = v2;
  [v1 getGMOptInToggleWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_D36C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 120) = v1;
  if (v1) {
    uint64_t v2 = sub_D498;
  }
  else {
    uint64_t v2 = sub_D47C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_D47C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 128));
}

uint64_t sub_D498()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_D508(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_EC40((uint64_t *)&unk_26E80);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_D724(const void *a1, void *a2)
{
  *(void *)(v2 + 120) = a2;
  *(void *)(v2 + 12_Block_object_dispose(&a9, 8) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_D79C, 0, 0);
}

uint64_t sub_D79C()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_D8A4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_D508;
  v0[13] = &unk_20DD8;
  v0[14] = v2;
  [v1 getGMOptInToggleWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_D8A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_DA38;
  }
  else {
    uint64_t v2 = sub_D9B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_D9B4()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 144);

  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
  _Block_release(*(const void **)(v0 + 128));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_DA38()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 120);
  swift_willThrow();

  uint64_t v3 = (void *)sub_163A0();
  swift_errorRelease();
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);

  _Block_release(*(const void **)(v0 + 128));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

Swift::Bool __swiftcall IntelligenceStateProvider.shouldShowForSummarization()()
{
  return [self shouldShowExperience:0 forClient:0];
}

Swift::Bool __swiftcall IntelligenceStateProvider.canEnableIntelligence()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider + 32);
  sub_EBFC((void *)(v0 + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider), v1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  sub_EC40(&qword_26E20);
  uint64_t v4 = sub_163B0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19370;
  (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7 + v6, enum case for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason.notOptedIn(_:), v4);
  uint64_t v8 = sub_DF18(v7, v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v9 = v8[2];
  swift_release();
  return v9 == 0;
}

id IntelligenceServerControlProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void IntelligenceStateProvider.init()()
{
}

id IntelligenceStateProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceStateProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_DF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_163B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  v38 = (char *)&v33 - v11;
  if (*(void *)(a2 + 16))
  {
    uint64_t v39 = a1;
    unint64_t v12 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (v12)
    {
      unint64_t v13 = 0;
      uint64_t v36 = v5 + 16;
      v37 = (char *)(a2 + 56);
      v14 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v34 = v5;
      uint64_t v35 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      while (1)
      {
        if (v13 >= v12) {
          __break(1u);
        }
        uint64_t v15 = *(void *)(v5 + 72);
        unint64_t v16 = a1
            + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
            + v15 * v13;
        unint64_t v40 = v13 + 1;
        uint32_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        v17(v38, v16, v4);
        sub_EF90(&qword_26E68);
        uint64_t v18 = sub_164B0();
        uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
        unint64_t v20 = v18 & ~v19;
        if ((*(void *)&v37[(v20 >> 3) & 0xFFFFFFFFFFFFFF8] >> v20)) {
          break;
        }
        uint64_t v24 = *v14;
LABEL_11:
        v24(v38, v4);
        a1 = v39;
        unint64_t v13 = v40;
        unint64_t v12 = *(void *)(v39 + 16);
        if (v40 == v12) {
          goto LABEL_12;
        }
      }
      uint64_t v21 = a2;
      uint64_t v22 = ~v19;
      while (1)
      {
        v17(v9, *(void *)(v21 + 48) + v20 * v15, v4);
        sub_EF90(&qword_26E70);
        char v23 = sub_164C0();
        uint64_t v24 = *v14;
        (*v14)(v9, v4);
        if (v23) {
          break;
        }
        unint64_t v20 = (v20 + 1) & v22;
        if (((*(void *)&v37[(v20 >> 3) & 0xFFFFFFFFFFFFFF8] >> v20) & 1) == 0)
        {
          a2 = v21;
          uint64_t v5 = v34;
          goto LABEL_11;
        }
      }
      uint64_t isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v24)(v38, v4);
      char v27 = *(unsigned char *)(v21 + 32);
      unint64_t v28 = (unint64_t)((1 << v27) + 63) >> 6;
      size_t v29 = 8 * v28;
      if ((v27 & 0x3Fu) <= 0xD
        || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
      {
        __chkstk_darwin(isStackAllocationSafe, v26);
        memcpy((char *)&v33 - ((v29 + 15) & 0x3FFFFFFFFFFFFFF0), v37, v29);
        v30 = sub_E364((unint64_t *)((char *)&v33 - ((v29 + 15) & 0x3FFFFFFFFFFFFFF0)), v28, v21, v20, &v39);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        v31 = (void *)swift_slowAlloc();
        memcpy(v31, v37, v29);
        v30 = sub_E364((unint64_t *)v31, v28, v21, v20, &v39);
        swift_release();
        swift_bridgeObjectRelease();
        swift_slowDealloc();
      }
      return v30;
    }
    else
    {
LABEL_12:
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
  return (void *)a2;
}

void *sub_E364(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v10 = sub_163B0();
  uint64_t v12 = __chkstk_darwin(v10, v11);
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v12, v15);
  Class result = (void *)__chkstk_darwin(v16, v17);
  uint64_t v22 = (char *)&v47 - v21;
  uint64_t v23 = *(void *)(a3 + 16);
  uint64_t v24 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v25 = *(unint64_t *)((char *)a1 + v24);
  v48 = a1;
  *(unint64_t *)((char *)a1 + v24) = v25 & ((-1 << a4) - 1);
  uint64_t v26 = v23 - 1;
  uint64_t v27 = *a5;
  unint64_t v28 = a5[1];
  unint64_t v29 = *(void *)(*a5 + 16);
  uint64_t v47 = a2;
  uint64_t v49 = v26;
  if (v28 == v29)
  {
    uint64_t v30 = a3;
LABEL_3:
    swift_retain();
    return (void *)sub_E734(v48, v47, v49, v30);
  }
  else
  {
    v58 = v22;
    uint64_t v57 = v19 + 16;
    uint64_t v52 = v19 + 32;
    uint64_t v53 = v20;
    uint64_t v54 = v19;
    uint64_t v55 = a3 + 56;
    v31 = (void (**)(char *, uint64_t))(v19 + 8);
    uint64_t v30 = a3;
    v32 = a5;
    v50 = a5;
    while (v28 < v29)
    {
      uint64_t v35 = v53;
      uint64_t v34 = v54;
      uint64_t v36 = *(unsigned __int8 *)(v54 + 80);
      uint64_t v56 = *(void *)(v54 + 72);
      v37 = *(void (**)(uint64_t, unint64_t, uint64_t))(v54 + 16);
      v37(v53, v27 + ((v36 + 32) & ~v36) + v56 * v28, v10);
      v32[1] = v28 + 1;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v58, v35, v10);
      sub_EF90(&qword_26E68);
      uint64_t v38 = sub_164B0();
      uint64_t v39 = -1 << *(unsigned char *)(v30 + 32);
      unint64_t v40 = v38 & ~v39;
      if ((*(void *)(v55 + ((v40 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v40))
      {
        uint64_t v51 = (unint64_t)v31 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v41 = v30;
        uint64_t v42 = ~v39;
        while (1)
        {
          v37((uint64_t)v14, *(void *)(v41 + 48) + v40 * v56, v10);
          sub_EF90(&qword_26E70);
          char v43 = sub_164C0();
          uint64_t v33 = *v31;
          (*v31)(v14, v10);
          if (v43) {
            break;
          }
          unint64_t v40 = (v40 + 1) & v42;
          if (((*(void *)(v55 + ((v40 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v40) & 1) == 0)
          {
            uint64_t v30 = v41;
            v32 = v50;
            goto LABEL_7;
          }
        }
        Class result = (void *)((uint64_t (*)(char *, uint64_t))v33)(v58, v10);
        uint64_t v44 = (v40 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v45 = *(unint64_t *)((char *)v48 + v44);
        *(unint64_t *)((char *)v48 + v44) = v45 & ~(1 << v40);
        if ((v45 & (1 << v40)) != 0)
        {
          uint64_t v46 = v49 - 1;
          if (__OFSUB__(v49, 1)) {
            goto LABEL_21;
          }
          uint64_t v30 = v41;
          v32 = v50;
          --v49;
          if (!v46) {
            return &_swiftEmptySetSingleton;
          }
        }
        else
        {
          uint64_t v30 = v41;
          v32 = v50;
        }
      }
      else
      {
        uint64_t v33 = *v31;
LABEL_7:
        Class result = (void *)((uint64_t (*)(char *, uint64_t))v33)(v58, v10);
      }
      uint64_t v27 = *v32;
      unint64_t v28 = v32[1];
      unint64_t v29 = *(void *)(*v32 + 16);
      if (v28 == v29) {
        goto LABEL_3;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
  }
  return result;
}

uint64_t sub_E734(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a1;
  uint64_t v7 = sub_163B0();
  uint64_t v38 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_EC40(&qword_26E78);
  uint64_t result = sub_16570();
  uint64_t v11 = result;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *v35;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 56;
  uint64_t v36 = (uint64_t (**)(unint64_t, char *, uint64_t))(v38 + 32);
  uint64_t v37 = v38 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v14 << 6);
    }
    else
    {
      uint64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v18 >= v34)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      unint64_t v19 = v35[v18];
      ++v14;
      if (!v19)
      {
        uint64_t v14 = v18 + 1;
        if (v18 + 1 >= v34) {
          goto LABEL_37;
        }
        unint64_t v19 = v35[v14];
        if (!v19)
        {
          uint64_t v14 = v18 + 2;
          if (v18 + 2 >= v34) {
            goto LABEL_37;
          }
          unint64_t v19 = v35[v14];
          if (!v19)
          {
            uint64_t v20 = v18 + 3;
            if (v20 >= v34) {
              goto LABEL_37;
            }
            unint64_t v19 = v35[v20];
            if (!v19)
            {
              while (1)
              {
                uint64_t v14 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v14 >= v34) {
                  goto LABEL_37;
                }
                unint64_t v19 = v35[v14];
                ++v20;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v14 = v20;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    uint64_t v21 = a4;
    uint64_t v22 = *(void *)(a4 + 48);
    uint64_t v23 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v10, v22 + v23 * v17, v7);
    sub_EF90(&qword_26E68);
    uint64_t result = sub_164B0();
    uint64_t v24 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v15 + 8 * v26);
      }
      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(void *)(v15 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t result = (*v36)(*(void *)(v11 + 48) + v27 * v23, v10, v7);
    ++*(void *)(v11 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v21;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id sub_EAAC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v11[3] = a3;
  v11[4] = a4;
  uint64_t v7 = sub_EFD4(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v7, a1, a3);
  sub_F038((uint64_t)v11, (uint64_t)a2 + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider);
  v10.receiver = a2;
  v10.super_class = (Class)type metadata accessor for IntelligenceStateProvider();
  id v8 = objc_msgSendSuper2(&v10, "init");
  sub_EBAC((uint64_t)v11);
  return v8;
}

uint64_t sub_EB5C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_EBAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_EBFC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_EC40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for IntelligenceStateProvider()
{
  return self;
}

uint64_t sub_ECA8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_ECE8()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_ED94;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_26E50 + dword_26E50);
  return v5(v2, v3);
}

uint64_t sub_ED94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_EE8C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_F09C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_270B8 + dword_270B8);
  return v6(v2, v3, v4);
}

uint64_t sub_EF50()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_EF90(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_163B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_EFD4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_F038(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id IntelligenceManager.__allocating_init(featureFlags:availabilityProvider:stateProvider:preferences:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = objc_allocWithZone(v4);
  v9[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun] = 0;
  *(void *)&v9[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_featureFlags] = a1;
  *(void *)&v9[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_availabilityProvider] = a2;
  *(void *)&v9[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider] = a3;
  *(void *)&v9[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_preferences] = a4;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, "init");
}

id IntelligenceManager.init(featureFlags:availabilityProvider:stateProvider:preferences:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_featureFlags] = a1;
  *(void *)&v4[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_availabilityProvider] = a2;
  *(void *)&v4[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider] = a3;
  *(void *)&v4[OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_preferences] = a4;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for IntelligenceManager();
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t type metadata accessor for IntelligenceManager()
{
  return self;
}

id IntelligenceManager.__allocating_init(featureFlags:preferences:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return IntelligenceManager.init(featureFlags:preferences:)(a1, a2);
}

id IntelligenceManager.init(featureFlags:preferences:)(uint64_t a1, void *a2)
{
  uint64_t v26 = a1;
  uint64_t v3 = sub_16400();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_16440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_allocWithZone((Class)type metadata accessor for BuddyGMAvailabilityProvider());
  id v14 = a2;
  id v15 = [v13 init];
  id v16 = [objc_allocWithZone((Class)type metadata accessor for IntelligenceServerControlProvider()) init];
  unint64_t v17 = objc_allocWithZone((Class)type metadata accessor for IntelligenceAvailabilityProvider());
  id v18 = sub_11368(v15, v16, a2, v17);

  sub_163F0();
  sub_16430();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  unint64_t v19 = (objc_class *)type metadata accessor for IntelligenceStateProvider();
  id v20 = objc_allocWithZone(v19);
  v29[3] = v8;
  v29[4] = (uint64_t)&protocol witness table for GenerativeModelsAvailability;
  uint64_t v21 = sub_EFD4(v29);
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(v21, v12, v8);
  sub_F038((uint64_t)v29, (uint64_t)v20 + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider);
  v28.receiver = v20;
  v28.super_class = v19;
  id v22 = objc_msgSendSuper2(&v28, "init");
  sub_EBAC((uint64_t)v29);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  id v23 = [v27 initWithFeatureFlags:v26 availabilityProvider:v18 stateProvider:v22 preferences:v14];

  swift_unknownObjectRelease();
  return v23;
}

uint64_t IntelligenceManager.shouldShowIntelligence(withServerCheck:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 40) = a1;
  return _swift_task_switch(sub_F644, 0, 0);
}

uint64_t sub_F644()
{
  if ([*(id *)(v0[2] + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_featureFlags) isIntelligenceEnabled]&& (*(unsigned char *)(v0[2] + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) & 1) == 0)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[3] = v3;
    void *v3 = v0;
    v3[1] = sub_F754;
    v3[15] = v0[2];
    return _swift_task_switch(sub_10048, 0, 0);
  }
  else
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
}

uint64_t sub_F754(char a1)
{
  *(unsigned char *)(*(void *)v1 + 41) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_F854, 0, 0);
}

uint64_t sub_F854()
{
  if (*(unsigned char *)(v0 + 41) == 1)
  {
    if (sub_11138()) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_preferences);
    NSString v2 = sub_164D0();
    LODWORD(v1) = [v1 BOOLForKey:v2];

    if (!v1)
    {
LABEL_13:
      uint64_t v9 = swift_task_alloc();
      *(void *)(v0 + 32) = v9;
      *(void *)uint64_t v9 = v0;
      *(void *)(v9 + _Block_object_dispose(&a9, 8) = sub_FA64;
      char v10 = *(unsigned char *)(v0 + 40);
      *(void *)(v9 + 184) = *(void *)(v0 + 16);
      *(unsigned char *)(v9 + 209) = v10;
      return _swift_task_switch(sub_10838, 0, 0);
    }
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_164A0();
    sub_CAEC(v3, (uint64_t)static Logger.purpleBuddyGeneral);
    uint64_t v4 = sub_16480();
    os_log_type_t v5 = sub_16540();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "Did see intelligence in a previous buddy run", v6, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(0);
}

uint64_t sub_FA64(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_FCD8(char a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a3;
  uint64_t v7 = swift_task_alloc();
  v3[4] = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + _Block_object_dispose(&a9, 8) = sub_FDAC;
  *(void *)(v7 + 16) = v6;
  *(unsigned char *)(v7 + 40) = a1;
  return _swift_task_switch(sub_F644, 0, 0);
}

uint64_t sub_FDAC(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

void sub_FEF4()
{
  uint64_t v1 = v0;
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_164A0();
  sub_CAEC(v2, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v3 = sub_16480();
  os_log_type_t v4 = sub_16540();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "didShowIntelligencePaneThisBuddyRun is set this buddy run.", v5, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v1 + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = 1;
}

uint64_t IntelligenceManager.isIntelligenceEnabled()()
{
  *(void *)(v1 + 120) = v0;
  return _swift_task_switch(sub_10048, 0, 0);
}

uint64_t sub_10048()
{
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_164A0();
  v0[16] = sub_CAEC(v1, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v2 = sub_16480();
  os_log_type_t v3 = sub_16540();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Checking intelligence status", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[15];

  id v6 = *(void **)(v5 + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider);
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_10210;
  uint64_t v7 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_D508;
  v0[13] = &unk_20DF0;
  v0[14] = v7;
  [v6 isIntelligenceEnabledWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10210()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_10424;
  }
  else {
    uint64_t v2 = sub_10320;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10320()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 144);
  uint64_t v2 = sub_16480();
  os_log_type_t v3 = sub_16540();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    *(_DWORD *)(v0 + 80) = v1;
    sub_16550();
    _os_log_impl(&dword_0, v2, v3, "Intelligence status: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v1);
}

uint64_t sub_10424()
{
  swift_willThrow();
  os_log_type_t v1 = sub_16530();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_16480();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v6;
    sub_16550();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Failed to determine intelligence status. Error: %@", v4, 0xCu);
    sub_EC40(&qword_26ED0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(0);
}

uint64_t sub_10750(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_116E0;
  v5[15] = v4;
  return _swift_task_switch(sub_10048, 0, 0);
}

uint64_t sub_10814(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 209) = a1;
  return _swift_task_switch(sub_10838, 0, 0);
}

uint64_t sub_10838()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 144;
  uint64_t v3 = v1 + 208;
  if (*(unsigned char *)(v1 + 209) == 1)
  {
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_164A0();
    *(void *)(v1 + 192) = sub_CAEC(v4, (uint64_t)static Logger.purpleBuddyGeneral);
    uint64_t v5 = sub_16480();
    os_log_type_t v6 = sub_16540();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v5, v6, "Updating intelligence availability", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v1 + 80;
    uint64_t v9 = *(void *)(v1 + 184);

    char v10 = *(void **)(v9 + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_availabilityProvider);
    *(void *)(v1 + 80) = v1;
    *(void *)(v1 + 120) = v3;
    *(void *)(v1 + 8_Block_object_dispose(&a9, 8) = sub_10B60;
    uint64_t v11 = swift_continuation_init();
    *(void *)(v1 + 144) = _NSConcreteStackBlock;
    *(void *)(v1 + 152) = 0x40000000;
    *(void *)(v1 + 160) = sub_D508;
    *(void *)(v1 + 16_Block_object_dispose(&a9, 8) = &unk_20F10;
    *(void *)(v1 + 176) = v11;
    [v10 fetchLatestAvailabilityWithCompletionHandler:v2];
  }
  else
  {
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_164A0();
    sub_CAEC(v12, (uint64_t)static Logger.purpleBuddyGeneral);
    id v13 = sub_16480();
    os_log_type_t v14 = sub_16540();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "Local availability check", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v1 + 16;
    uint64_t v16 = *(void *)(v1 + 184);

    unint64_t v17 = *(void **)(v16 + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_availabilityProvider);
    *(void *)(v1 + 16) = v1;
    *(void *)(v1 + 56) = v3;
    *(void *)(v1 + 24) = sub_10DBC;
    uint64_t v18 = swift_continuation_init();
    *(void *)(v1 + 144) = _NSConcreteStackBlock;
    *(void *)(v1 + 152) = 0x40000000;
    *(void *)(v1 + 160) = sub_116E4;
    *(void *)(v1 + 16_Block_object_dispose(&a9, 8) = &unk_20EF8;
    *(void *)(v1 + 176) = v18;
    [v17 isDeviceEligibleForIntelligenceWithCompletionHandler:v2];
  }
  return _swift_continuation_await(v8);
}

uint64_t sub_10B60()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_10E9C;
  }
  else {
    uint64_t v2 = sub_10C70;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10C70()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 208);
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_164A0();
  sub_CAEC(v2, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v3 = sub_16480();
  os_log_type_t v4 = sub_16540();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    *(_DWORD *)(v0 + 144) = v1;
    sub_16550();
    _os_log_impl(&dword_0, v3, v4, "Intelligence availablility status: %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }

  os_log_type_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v1);
}

uint64_t sub_10DBC()
{
  return _swift_task_switch(sub_116DC, 0, 0);
}

uint64_t sub_10E9C()
{
  swift_willThrow();
  os_log_type_t v1 = sub_16530();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_16480();
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 144) = v5;
    sub_16550();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v1, "Failed to fetch latest availability status with error: %@", v3, 0xCu);
    sub_EC40(&qword_26ED0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_164A0();
  sub_CAEC(v6, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v7 = sub_16480();
  os_log_type_t v8 = sub_16540();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    *(_DWORD *)(v0 + 144) = 0;
    sub_16550();
    _os_log_impl(&dword_0, v7, v8, "Intelligence availablility status: %{BOOL}d", v9, 8u);
    swift_slowDealloc();
  }

  char v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10(0);
}

id sub_11138()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider) shouldShowForSummarization];
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_164A0();
  sub_CAEC(v2, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v3 = sub_16480();
  os_log_type_t v4 = sub_16540();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_16550();
    _os_log_impl(&dword_0, v3, v4, "Should show summarization: %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }

  return v1;
}

void IntelligenceManager.init()()
{
}

id IntelligenceManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_11368(void *a1, void *a2, void *a3, unsigned char *a4)
{
  a4[OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_serverBackedValue] = 2;
  *(void *)&a4[OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_generativeModelsAvailabilityProvider] = a1;
  *(void *)&a4[OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_serverControlProvider] = a2;
  uint64_t v7 = a4;
  id v8 = a1;
  id v9 = a2;
  if (os_variant_has_internal_ui()) {
    id v10 = a3;
  }
  else {
    a3 = 0;
  }
  *(void *)&v7[OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_preferences] = a3;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for IntelligenceAvailabilityProvider();
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t sub_11420()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_11460()
{
  objc_super v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_F09C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_26F08 + dword_26F08);
  return v5(v2, v3);
}

uint64_t sub_11514(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_F09C;
  id v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_270C0 + dword_270C0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_115E0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_11620()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_ED94;
  uint64_t v6 = (uint64_t (*)(char, void *, void *))((char *)&dword_26F28 + dword_26F28);
  return v6(v2, v4, v3);
}

uint64_t sub_116E4(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t IntelligenceAvailabilityProvider.isDeviceEligibleForIntelligence()()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + _Block_object_dispose(&a9, 8) = sub_117B8;
  *(void *)(v2 + 120) = v0;
  *(unsigned char *)(v2 + 137) = 0;
  return _swift_task_switch(sub_1276C, 0, 0);
}

uint64_t sub_117B8(char a1)
{
  *(unsigned char *)(*(void *)v1 + 36) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_118B8, 0, 0);
}

uint64_t sub_118B8()
{
  if (*(unsigned char *)(v0 + 36) == 1)
  {
    id v1 = [*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_generativeModelsAvailabilityProvider) isAvailable];
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_164A0();
    sub_CAEC(v2, (uint64_t)static Logger.purpleBuddyGeneral);
    uint64_t v3 = sub_16480();
    os_log_type_t v4 = sub_16540();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 67109120;
      *(_DWORD *)(v0 + 32) = v1;
      sub_16550();
      _os_log_impl(&dword_0, v3, v4, "Checking intelligence on device availability status: %{BOOL}d", v5, 8u);
      swift_slowDealloc();
    }
  }
  else
  {
    id v1 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(id))(v0 + 8);
  return v6(v1);
}

uint64_t sub_11BA8(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  os_log_type_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_FDAC;
  return IntelligenceAvailabilityProvider.isDeviceEligibleForIntelligence()();
}

uint64_t IntelligenceAvailabilityProvider.fetchLatestAvailability()()
{
  *(void *)(v1 + 120) = v0;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v1 + 12_Block_object_dispose(&a9, 8) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + _Block_object_dispose(&a9, 8) = sub_11D04;
  *(void *)(v2 + 120) = v0;
  *(unsigned char *)(v2 + 137) = 1;
  return _swift_task_switch(sub_1276C, 0, 0);
}

uint64_t sub_11D04(char a1)
{
  *(unsigned char *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_11E04, 0, 0);
}

uint64_t sub_11E04()
{
  if (*(unsigned char *)(v0 + 152) == 1)
  {
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_164A0();
    sub_CAEC(v1, (uint64_t)static Logger.purpleBuddyGeneral);
    uint64_t v2 = sub_16480();
    os_log_type_t v3 = sub_16540();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "Fetching latest Intelligence availability status", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = *(void *)(v0 + 120);

    uint64_t v6 = *(void **)(v5
                  + OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_generativeModelsAvailabilityProvider);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_12000;
    uint64_t v7 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
    *(void *)(v0 + 96) = sub_12310;
    *(void *)(v0 + 104) = &unk_20F28;
    *(void *)(v0 + 112) = v7;
    [v6 fetchLatestAvailabilityStatusWithCompletionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8(0);
  }
}

uint64_t sub_12000()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_122A0;
  }
  else {
    uint64_t v2 = sub_12110;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_12110()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_121A0;
  return IntelligenceAvailabilityProvider.isDeviceEligibleForIntelligence()();
}

uint64_t sub_121A0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_122A0()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_12310(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_EC40((uint64_t *)&unk_26E80);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_12510(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_125B8;
  return IntelligenceAvailabilityProvider.fetchLatestAvailability()();
}

uint64_t sub_125B8(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_163A0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_12748(char a1)
{
  *(void *)(v2 + 120) = v1;
  *(unsigned char *)(v2 + 137) = a1;
  return _swift_task_switch(sub_1276C, 0, 0);
}

uint64_t sub_1276C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_serverBackedValue;
  *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_serverBackedValue;
  int v3 = *(unsigned __int8 *)(v1 + v2);
  if (v3 != 2)
  {
    id v14 = (id)(v3 & 1);
LABEL_13:
    uint64_t v18 = *(uint64_t (**)(id))(v0 + 8);
    return v18(v14);
  }
  if (os_variant_has_internal_ui())
  {
    uint64_t v4 = *(void **)(*(void *)(v0 + 120) + OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_preferences);
    if (v4)
    {
      uint64_t v5 = qword_26D40;
      id v6 = v4;
      if (v5 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_164A0();
      sub_CAEC(v7, (uint64_t)static Logger.purpleBuddyGeneral);
      uint64_t v8 = sub_16480();
      os_log_type_t v9 = sub_16540();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_0, v8, v9, "Checking override flag", v10, 2u);
        swift_slowDealloc();
      }

      NSString v11 = sub_164D0();
      id v12 = [v6 objectForKey:v11];

      if (v12)
      {
        sub_16560();
        swift_unknownObjectRelease();
        sub_12F94(v0 + 80);
        NSString v13 = sub_164D0();
        id v14 = [v6 BOOLForKey:v13];

        id v15 = sub_16480();
        os_log_type_t v16 = sub_16540();
        if (os_log_type_enabled(v15, v16))
        {
          unint64_t v17 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v17 = 67109120;
          *(_DWORD *)(v0 + 80) = v14;
          sub_16550();
          _os_log_impl(&dword_0, v15, v16, "Found intelligence override flag: %{BOOL}d", v17, 8u);
          swift_slowDealloc();
        }

        goto LABEL_13;
      }
      *(_OWORD *)(v0 + 80) = 0u;
      *(_OWORD *)(v0 + 96) = 0u;

      sub_12F94(v0 + 80);
    }
  }
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_164A0();
  sub_CAEC(v20, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v21 = sub_16480();
  os_log_type_t v22 = sub_16540();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v23 = 0;
    _os_log_impl(&dword_0, v21, v22, "Checking intelligence bag", v23, 2u);
    swift_slowDealloc();
  }
  uint64_t v24 = *(void *)(v0 + 120);
  char v25 = *(unsigned char *)(v0 + 137);

  uint64_t v26 = *(void **)(v24 + OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_serverControlProvider);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 136;
  *(void *)(v0 + 24) = sub_12BC4;
  uint64_t v27 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_116E4;
  *(void *)(v0 + 104) = &unk_21030;
  *(void *)(v0 + 112) = v27;
  [v26 isFeatureEnabledFromCache:(v25 & 1) == 0 completionHandler:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_12BC4()
{
  return _swift_task_switch(sub_12CA4, 0, 0);
}

uint64_t sub_12CA4()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);
  if (*(unsigned char *)(v0 + 137) == 1) {
    *(unsigned char *)(*(void *)(v0 + 120) + *(void *)(v0 + 128)) = v1;
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

void IntelligenceAvailabilityProvider.init()()
{
}

id IntelligenceAvailabilityProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceAvailabilityProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntelligenceAvailabilityProvider()
{
  return self;
}

uint64_t sub_12DE8()
{
  objc_super v2 = *(const void **)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_ED94;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_26FB0 + dword_26FB0);
  return v5(v2, v3);
}

uint64_t sub_12EA0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_12EE0()
{
  objc_super v2 = *(const void **)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_F09C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_26FC0 + dword_26FC0);
  return v5(v2, v3);
}

uint64_t sub_12F94(uint64_t a1)
{
  uint64_t v2 = sub_EC40(&qword_26FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t IntelligenceServerControlProvider.isFeatureEnabled(fromCache:)(char a1)
{
  uint64_t v5 = (uint64_t (*)(char))((char *)&dword_26FF0 + dword_26FF0);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1309C;
  return v5(a1);
}

uint64_t sub_1309C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  int v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_13198(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_EC40((uint64_t *)&unk_26E80);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      *((void *)&v12 + 1) = swift_getObjectType();
      *(void *)&long long v11 = a2;
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    sub_14150((uint64_t)&v11, (uint64_t)v13);
    uint64_t v9 = *(void *)(*(void *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    sub_14150((uint64_t)v13, v9);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_13404(char a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (*)(char))((char *)&dword_26FF0 + dword_26FF0);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  void *v4 = v2;
  v4[1] = sub_134B8;
  return v6(a1);
}

uint64_t sub_134B8(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id IntelligenceServerControlProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceServerControlProvider();
  return objc_msgSendSuper2(&v2, "init");
}

id IntelligenceServerControlProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceServerControlProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_13688(char a1)
{
  *(unsigned char *)(v1 + 209) = a1;
  return _swift_task_switch(sub_136A8, 0, 0);
}

uint64_t sub_136A8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 209);
  id v2 = [objc_allocWithZone((Class)AKURLBag) init];
  *(void *)(v0 + 184) = v2;
  NSString v3 = sub_164D0();
  *(void *)(v0 + 192) = v3;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_137FC;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_13198;
  *(void *)(v0 + 104) = &unk_210C0;
  *(void *)(v0 + 112) = v4;
  [v2 configurationValueForKey:v3 fromCache:v1 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_137FC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    id v2 = sub_13C58;
  }
  else {
    id v2 = sub_1390C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1390C()
{
  uint64_t v1 = (id *)(v0 + 120);
  sub_14150(v0 + 120, v0 + 80);
  if (*(void *)(v0 + 104))
  {
    sub_141B8((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 152));
    sub_141C8(v0 + 152, v0 + 80);
    sub_14224(0, &qword_27038);
    if (swift_dynamicCast())
    {
      id v2 = *v1;
      LOBYTE(v1) = [*v1 BOOLValue];

      sub_141C8(v0 + 152, v0 + 80);
      sub_EBAC(v0 + 80);
LABEL_4:
      if (qword_26D40 != -1) {
        swift_once();
      }
      uint64_t v3 = v1 & 1;
      uint64_t v4 = sub_164A0();
      sub_CAEC(v4, (uint64_t)static Logger.purpleBuddyGeneral);
      uint64_t v5 = sub_16480();
      os_log_type_t v6 = sub_16540();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v7 = 67109120;
        *(_DWORD *)(v0 + 80) = v3;
        sub_16550();
        _os_log_impl(&dword_0, v5, v6, "intelligence value in bag: %{BOOL}d", v7, 8u);
        swift_slowDealloc();
      }
      uint64_t v8 = *(void **)(v0 + 184);

      sub_EBAC(v0 + 152);
      goto LABEL_21;
    }
    uint64_t v9 = (unsigned char *)(v0 + 208);
    sub_141C8(v0 + 152, v0 + 80);
    sub_141B8((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 120));
    if (swift_dynamicCast())
    {
      LODWORD(v1) = *v9;
      if (v1 != 2) {
        goto LABEL_4;
      }
    }
    else
    {
      unsigned char *v9 = 2;
    }
    sub_EBAC(v0 + 152);
  }
  else
  {
    sub_12F94(v0 + 80);
  }
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_164A0();
  sub_CAEC(v10, (uint64_t)static Logger.purpleBuddyGeneral);
  os_log_type_t v11 = sub_16530();
  long long v12 = sub_16480();
  BOOL v13 = os_log_type_enabled(v12, v11);
  id v15 = *(void **)(v0 + 184);
  id v14 = *(void **)(v0 + 192);
  if (v13)
  {
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    _os_log_impl(&dword_0, v12, v11, "Invalid bag configuration", v16, 2u);
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v3 = 0;
LABEL_21:
  unint64_t v17 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v17(v3);
}

uint64_t sub_13C58()
{
  id v1 = v0[25];
  swift_willThrow();
  v0[19] = v1;
  id v2 = v0 + 15;
  sub_EC40((uint64_t *)&unk_26E80);
  sub_14224(0, &qword_27030);
  uint64_t result = swift_dynamicCast();
  if (!result) {
    return result;
  }
  id v4 = *v2;
  id v5 = [*v2 domain];
  uint64_t v6 = sub_164E0();
  uint64_t v8 = v7;

  if (v6 == sub_164E0() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v11 = sub_16580();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if ([v4 code] != (id)-7097)
  {
LABEL_15:
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_164A0();
    sub_CAEC(v16, (uint64_t)static Logger.purpleBuddyGeneral);
    os_log_type_t v17 = sub_16530();
    uint64_t v18 = v4;
    id v14 = sub_16480();
    if (os_log_type_enabled(v14, v17))
    {
      id v24 = v4;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      v0[10] = v18;
      uint64_t v21 = v18;
      sub_16550();
      void *v20 = v18;

      id v4 = v24;
      _os_log_impl(&dword_0, v14, v17, "intelligence bag check failed with error: %@", v19, 0xCu);
      sub_EC40(&qword_26ED0);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_19;
    }

    os_log_type_t v22 = v0 + 24;
LABEL_22:
    id v14 = v0[23];
    goto LABEL_23;
  }
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_164A0();
  sub_CAEC(v12, (uint64_t)static Logger.purpleBuddyGeneral);
  os_log_type_t v13 = sub_16530();
  id v14 = sub_16480();
  if (!os_log_type_enabled(v14, v13))
  {
    os_log_type_t v22 = v0 + 24;
    uint64_t v18 = v14;
    goto LABEL_22;
  }
  id v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v15 = 0;
  _os_log_impl(&dword_0, v14, v13, "intelligence bag key not found", v15, 2u);
LABEL_19:
  swift_slowDealloc();
  uint64_t v18 = v0[24];
  os_log_type_t v22 = v0 + 23;
LABEL_23:

  swift_errorRelease();
  id v23 = (uint64_t (*)(void))v0[1];
  return v23(0);
}

uint64_t type metadata accessor for IntelligenceServerControlProvider()
{
  return self;
}

uint64_t sub_14054()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_14094()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_ED94;
  id v5 = (uint64_t (*)(char, void *))((char *)&dword_27020 + dword_27020);
  return v5(v2, v3);
}

uint64_t sub_14150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_EC40(&qword_26FE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_141B8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_141C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_14224(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id BuddyCameraControlPresentationProvider.__allocating_init(isIntelligenceEnabled:)(char a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = [self buddyPreferences];
  id v5 = [v3 initWithIsIntelligenceEnabled:a1 & 1 preferenceController:v4];

  return v5;
}

id BuddyCameraControlPresentationProvider.init(isIntelligenceEnabled:)(char a1)
{
  id v3 = [self buddyPreferences];
  id v4 = [v1 initWithIsIntelligenceEnabled:a1 & 1 preferenceController:v3];

  return v4;
}

id BuddyCameraControlPresentationProvider.__allocating_init(isIntelligenceEnabled:preferenceController:)(char a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  v5[OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled] = a1;
  *(void *)&v5[OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, "init");
}

id BuddyCameraControlPresentationProvider.init(isIntelligenceEnabled:preferenceController:)(char a1, uint64_t a2)
{
  v2[OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled] = a1;
  *(void *)&v2[OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for BuddyCameraControlPresentationProvider();
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t type metadata accessor for BuddyCameraControlPresentationProvider()
{
  return self;
}

Swift::Bool __swiftcall BuddyCameraControlPresentationProvider.shouldPresentCameraControlPane()()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController);
  NSString v2 = sub_164D0();
  unsigned int v3 = [v1 BOOLForKey:v2];

  if (!v3) {
    return 1;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) != 1) {
    return 0;
  }
  NSString v4 = sub_164D0();
  unsigned __int8 v5 = [v1 BOOLForKey:v4];

  return v5 ^ 1;
}

Swift::Bool __swiftcall BuddyCameraControlPresentationProvider.shouldPresentVisualIntelligencePane()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) != 1) {
    return 0;
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController);
  NSString v2 = sub_164D0();
  LOBYTE(v1) = [v1 BOOLForKey:v2];

  return v1 ^ 1;
}

Swift::Void __swiftcall BuddyCameraControlPresentationProvider.updatePaneVisibilityPreferences(newState:)(Swift::Bool newState)
{
  unsigned int v3 = *(void **)(v1 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController);
  Class isa = sub_164F0().super.super.isa;
  NSString v5 = sub_164D0();
  [v3 setObject:isa forKey:v5];

  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) == 1)
  {
    if (qword_26D40 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_164A0();
    sub_CAEC(v6, (uint64_t)static Logger.purpleBuddyGeneral);
    objc_super v7 = sub_16480();
    os_log_type_t v8 = sub_16540();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      sub_16550();
      _os_log_impl(&dword_0, v7, v8, "Update visual intelligence presented to: %{BOOL}d", v9, 8u);
      swift_slowDealloc();
    }

    Class v10 = sub_164F0().super.super.isa;
    NSString v11 = sub_164D0();
    [v3 setObject:v10 forKey:v11];
  }
  else if (!newState)
  {
    Class v12 = sub_164F0().super.super.isa;
    NSString v13 = sub_164D0();
    [v3 setObject:v12 forKey:v13];
  }
}

void BuddyCameraControlPresentationProvider.init()()
{
}

id BuddyCameraControlPresentationProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BuddyCameraControlPresentationProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_14A70()
{
  return BuddyCameraControlPresentationProvider.shouldPresentCameraControlPane()();
}

uint64_t sub_14A98()
{
  if (*(unsigned char *)(*v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) != 1) {
    return 0;
  }
  uint64_t v1 = *(void **)(*v0 + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController);
  NSString v2 = sub_164D0();
  LODWORD(v1) = [v1 BOOLForKey:v2];

  return v1 ^ 1;
}

void sub_14B20(Swift::Bool a1)
{
}

uint64_t BuddyGMAvailabilityProvider.fetchLatestAvailabilityStatus()()
{
  return _swift_task_switch(sub_14B80, 0, 0);
}

uint64_t sub_14B80()
{
  sub_16470();
  swift_allocObject();
  *(void *)(v0 + 16) = sub_16460();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_14C34;
  return AvailabilityClient.updateAll()();
}

uint64_t sub_14C34()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_14D70, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_14D70()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_14F3C(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_14FB4, 0, 0);
}

uint64_t sub_14FB4()
{
  sub_16470();
  swift_allocObject();
  *(void *)(v0 + 32) = sub_16460();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_15068;
  return AvailabilityClient.updateAll()();
}

uint64_t sub_15068()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 4_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_151D4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 24);
    id v4 = *(void **)(v2 + 16);
    swift_release();

    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    _Block_release(*(const void **)(v2 + 24));
    uint64_t v5 = *(uint64_t (**)(void))(v2 + 8);
    return v5();
  }
}

uint64_t sub_151D4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 16);
  swift_release();

  uint64_t v3 = (void *)sub_163A0();
  swift_errorRelease();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

  _Block_release(*(const void **)(v0 + 24));
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id BuddyGMAvailabilityProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BuddyGMAvailabilityProvider();
  return objc_msgSendSuper2(&v2, "init");
}

id BuddyGMAvailabilityProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BuddyGMAvailabilityProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_15324(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_F09C;
  return v6();
}

uint64_t sub_153F0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_F09C;
  return v7();
}

uint64_t sub_154BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_16520();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_16510();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_15AE0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_16500();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_15660(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1573C;
  return v6(a1);
}

uint64_t sub_1573C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s13BuddyMigrator0A22GMAvailabilityProviderC11isAvailableSbyF_0()
{
  char v0 = sub_16420();
  if (qword_26D40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_164A0();
  sub_CAEC(v1, (uint64_t)static Logger.purpleBuddyGeneral);
  uint64_t v2 = sub_16480();
  os_log_type_t v3 = sub_16540();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109376;
    sub_16550();
    *(_WORD *)(v4 + _Block_object_dispose(&a9, 8) = 2048;
    swift_beginAccess();
    sub_16550();
    _os_log_impl(&dword_0, v2, v3, "GM on device status: shouldShow: %{BOOL}d, with availability state: %ld", (uint8_t *)v4, 0x12u);
    swift_slowDealloc();
  }

  return v0 & 1;
}

uint64_t type metadata accessor for BuddyGMAvailabilityProvider()
{
  return self;
}

uint64_t sub_159EC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_15A2C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  os_log_type_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_ED94;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_270A8 + dword_270A8);
  return v5(v2, v3);
}

uint64_t sub_15AE0(uint64_t a1)
{
  uint64_t v2 = sub_EC40(&qword_26F00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_15B40()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_15B78(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_ED94;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_270C8 + dword_270C8);
  return v6(a1, v4);
}

void sub_15C30()
{
  sub_8F1C();
  sub_8F00(&dword_0, v0, v1, "Migrating keys", v2, v3, v4, v5, v6);
}

void sub_15C64()
{
  sub_8F1C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Unexpected migration/restore state when setup has completed initial run; forcibly removing...",
    v1,
    2u);
}

void sub_15CA4(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to read chronicle data; found %@, expected NSDictionary!",
    (uint8_t *)&v5,
    0xCu);
}

void sub_15D40(void *a1, void *a2, NSObject *a3)
{
  uint8_t v6 = objc_msgSend(a1, "aa_altDSID");
  int v7 = _BYIsInternalInstall();
  if ((v7 & 1) == 0)
  {
    uint64_t v3 = [a2 domain];
    a2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v3, [a2 code]);
  }
  *(_DWORD *)long long buf = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  NSString v11 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to get accepted terms info for alt-DSID %@: %{public}@", buf, 0x16u);
  if (!v7)
  {
  }
}

void sub_15E50()
{
  sub_8F1C();
  sub_8F00(&dword_0, v0, v1, "SDP preference post restore migration", v2, v3, v4, v5, v6);
}

void sub_15E84()
{
  sub_8F1C();
  sub_8F00(&dword_0, v0, v1, "SDP preference post SU migration", v2, v3, v4, v5, v6);
}

void sub_15EB8()
{
  sub_8F1C();
  sub_8F00(&dword_0, v0, v1, "No SDP preference migration needed", v2, v3, v4, v5, v6);
}

void sub_15EEC(void *a1, NSObject *a2)
{
  int v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    uint64_t v2 = [a1 domain];
    a1 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v2, [a1 code]);
  }
  *(_DWORD *)long long buf = 138412290;
  int v7 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "BuddyMigrator failed to fetch manatee availability %@", buf, 0xCu);
  if (!v5)
  {
  }
}

uint64_t sub_15FE0()
{
  uint64_t v0 = abort_report_np();
  return sub_16008(v0);
}

uint64_t sub_16008()
{
  uint64_t v0 = abort_report_np();
  return sub_16030(v0);
}

uint64_t sub_16030()
{
  uint64_t v0 = abort_report_np();
  return sub_16058(v0);
}

uint64_t sub_16058()
{
  uint64_t v0 = abort_report_np();
  return sub_16080(v0);
}

void sub_16080(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to register for store account additions for suspend task", v1, 2u);
}

void sub_160C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No further attempts remaining for preheating suspend task", v1, 2u);
}

void sub_16108(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Mandatory software update information is not a string", v1, 2u);
}

uint64_t sub_1614C()
{
  return sub_16170();
}

uint64_t sub_16170()
{
  uint64_t v0 = abort_report_np();
  return sub_16198(v0);
}

uint64_t sub_16198()
{
  uint64_t v0 = abort_report_np();
  return sub_161C0(v0);
}

void sub_161C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_16238(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Missing or corrupt data when restoring backup restore state!", v1, 2u);
}

void sub_1627C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 objectAtIndexedSubscript:2];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Invalid type for snapshot ID when restoring backup restore state: %@", (uint8_t *)&v4, 0xCu);
}

void sub_16318(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Missing or corrupt data when restoring migration state!", v1, 2u);
}

void sub_1635C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "No SDP migration occurred.", v1, 2u);
}

uint64_t sub_163A0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_163B0()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason();
}

uint64_t sub_163C0()
{
  return GenerativeModelsAvailability.Availability.UnavailableInfo.reasons.getter();
}

uint64_t sub_163D0()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo();
}

uint64_t sub_163E0()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t sub_163F0()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifier:)();
}

uint64_t sub_16400()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t sub_16410()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t sub_16420()
{
  return static GenerativeModelsAvailability.shouldBeShown(inSetupAssistantReturning:)();
}

uint64_t sub_16430()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t sub_16440()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t sub_16460()
{
  return AvailabilityClient.init()();
}

uint64_t sub_16470()
{
  return type metadata accessor for AvailabilityClient();
}

uint64_t sub_16480()
{
  return Logger.logObject.getter();
}

uint64_t sub_16490()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_164A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_164B0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_164C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_164D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_164E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_164F0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_16500()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_16510()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_16520()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_16530()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_16540()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_16550()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_16560()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_16570()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_16580()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t BYAssistantFixUpVoiceTriggerStateIfNeeded()
{
  return _BYAssistantFixUpVoiceTriggerStateIfNeeded();
}

uint64_t BYAssistantScreenShouldRunForPHSUpgrade()
{
  return _BYAssistantScreenShouldRunForPHSUpgrade();
}

uint64_t BYIsRunningInStoreDemoMode()
{
  return _BYIsRunningInStoreDemoMode();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t CFCopySystemVersionString()
{
  return _CFCopySystemVersionString();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t _BYIsInternalInstall()
{
  return __BYIsInternalInstall();
}

uint64_t _BYLoggingFacility()
{
  return __BYLoggingFacility();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLForKey_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:account:");
}

id objc_msgSend__applyPreRestoreSettings(void *a1, const char *a2, ...)
{
  return _[a1 _applyPreRestoreSettings];
}

id objc_msgSend__cleanupKeys(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupKeys];
}

id objc_msgSend__clearPreferenceKeyFromSourcePreferences(void *a1, const char *a2, ...)
{
  return _[a1 _clearPreferenceKeyFromSourcePreferences];
}

id objc_msgSend__dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 _dictionaryRepresentation];
}

id objc_msgSend__humanReadableOSVersionWithProductVersion_buildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_humanReadableOSVersionWithProductVersion:buildVersion:");
}

id objc_msgSend__isSignificantLocationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isSignificantLocationsEnabled];
}

id objc_msgSend__loadClassicState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadClassicState:");
}

id objc_msgSend__loadModernState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadModernState:");
}

id objc_msgSend__mandatoryUpdateInformationFromActivation(void *a1, const char *a2, ...)
{
  return _[a1 _mandatoryUpdateInformationFromActivation];
}

id objc_msgSend__migrateChronicle(void *a1, const char *a2, ...)
{
  return _[a1 _migrateChronicle];
}

id objc_msgSend__migrateKeys(void *a1, const char *a2, ...)
{
  return _[a1 _migrateKeys];
}

id objc_msgSend__migratePreferenceKeyIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _migratePreferenceKeyIfNeeded];
}

id objc_msgSend__migrateStolenDeviceProtectionPreferenceKeys(void *a1, const char *a2, ...)
{
  return _[a1 _migrateStolenDeviceProtectionPreferenceKeys];
}

id objc_msgSend__needsAppleIDReauthenticationAfterMigration(void *a1, const char *a2, ...)
{
  return _[a1 _needsAppleIDReauthenticationAfterMigration];
}

id objc_msgSend__needsVoiceTriggerConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 _needsVoiceTriggerConfirmation];
}

id objc_msgSend__performHSA2Migration(void *a1, const char *a2, ...)
{
  return _[a1 _performHSA2Migration];
}

id objc_msgSend__performiOSMigration(void *a1, const char *a2, ...)
{
  return _[a1 _performiOSMigration];
}

id objc_msgSend__shouldOfferPeriocularEnrollment(void *a1, const char *a2, ...)
{
  return _[a1 _shouldOfferPeriocularEnrollment];
}

id objc_msgSend__shouldOfferStolenDeviceProtection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldOfferStolenDeviceProtection];
}

id objc_msgSend__shouldUpsellIntelligence(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUpsellIntelligence];
}

id objc_msgSend__shouldUpsellVisualIntelligence(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUpsellVisualIntelligence];
}

id objc_msgSend__storedBuddyMigratorVersion(void *a1, const char *a2, ...)
{
  return _[a1 _storedBuddyMigratorVersion];
}

id objc_msgSend__storedBuddyVersion(void *a1, const char *a2, ...)
{
  return _[a1 _storedBuddyVersion];
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_accountEligibleForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 accountEligibleForUpdate];
}

id objc_msgSend_accountNeedsSecurityUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 accountNeedsSecurityUpgrade];
}

id objc_msgSend_activeDuration(void *a1, const char *a2, ...)
{
  return _[a1 activeDuration];
}

id objc_msgSend_addBagKey_valueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBagKey:valueType:");
}

id objc_msgSend_addEntry_forFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntry:forFeature:");
}

id objc_msgSend_addEvent_withPayload_persist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvent:withPayload:persist:");
}

id objc_msgSend_addPowerLogEvent_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPowerLogEvent:withPayload:");
}

id objc_msgSend_allowCellularNetwork(void *a1, const char *a2, ...)
{
  return _[a1 allowCellularNetwork];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_applySafeHavenStash(void *a1, const char *a2, ...)
{
  return _[a1 applySafeHavenStash];
}

id objc_msgSend_backgroundDuration(void *a1, const char *a2, ...)
{
  return _[a1 backgroundDuration];
}

id objc_msgSend_backupUDID(void *a1, const char *a2, ...)
{
  return _[a1 backupUDID];
}

id objc_msgSend_backupUUID(void *a1, const char *a2, ...)
{
  return _[a1 backupUUID];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_bagKeySet(void *a1, const char *a2, ...)
{
  return _[a1 bagKeySet];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buddyOfferMightNeedPresenting(void *a1, const char *a2, ...)
{
  return _[a1 buddyOfferMightNeedPresenting];
}

id objc_msgSend_buddyPreferences(void *a1, const char *a2, ...)
{
  return _[a1 buddyPreferences];
}

id objc_msgSend_buddyPreferencesExcludedFromBackup(void *a1, const char *a2, ...)
{
  return _[a1 buddyPreferencesExcludedFromBackup];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_chronicle(void *a1, const char *a2, ...)
{
  return _[a1 chronicle];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentVersion(void *a1, const char *a2, ...)
{
  return _[a1 contentVersion];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 createBagForSubProfile];
}

id objc_msgSend_createdOnCurrentMajorVersion(void *a1, const char *a2, ...)
{
  return _[a1 createdOnCurrentMajorVersion];
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return _[a1 current];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_dataTransferMethod(void *a1, const char *a2, ...)
{
  return _[a1 dataTransferMethod];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_deferDataMigratorExit(void *a1, const char *a2, ...)
{
  return _[a1 deferDataMigratorExit];
}

id objc_msgSend_deviceIsFromFactory(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsFromFactory];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return _[a1 didRestoreFromBackup];
}

id objc_msgSend_didSkipFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSkipFlow:");
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 didUpgrade];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_eligibleForChlorine(void *a1, const char *a2, ...)
{
  return _[a1 eligibleForChlorine];
}

id objc_msgSend_entryForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryForFeature:");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchRoutineStateWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRoutineStateWithHandler:");
}

id objc_msgSend_followUpItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 followUpItemsCount];
}

id objc_msgSend_getAcceptedTermsForAltDSID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAcceptedTermsForAltDSID:withError:");
}

id objc_msgSend_getAppStoreMessage(void *a1, const char *a2, ...)
{
  return _[a1 getAppStoreMessage];
}

id objc_msgSend_getAppStoreURL(void *a1, const char *a2, ...)
{
  return _[a1 getAppStoreURL];
}

id objc_msgSend_getMandatorySoftwareUpdateDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMandatorySoftwareUpdateDictionary:");
}

id objc_msgSend_hasCameraButton(void *a1, const char *a2, ...)
{
  return _[a1 hasCameraButton];
}

id objc_msgSend_hasCompletedInitialSetup(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedInitialSetup];
}

id objc_msgSend_hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment(void *a1, const char *a2, ...)
{
  return _[a1 hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment];
}

id objc_msgSend_hasStateFromPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasStateFromPreferences:");
}

id objc_msgSend_hasSuspendTaskWithBuddyPreferencesExcludedFromBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
}

id objc_msgSend_inAppleStore(void *a1, const char *a2, ...)
{
  return _[a1 inAppleStore];
}

id objc_msgSend_initWithAccountTypes_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountTypes:delegate:");
}

id objc_msgSend_initWithDelegate_clientType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:clientType:");
}

id objc_msgSend_initWithDelegate_queue_clientType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:clientType:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFeatureFlags_preferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureFlags:preferences:");
}

id objc_msgSend_initWithIsIntelligenceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIsIntelligenceEnabled:");
}

id objc_msgSend_initWithMigrationContext_sourcePreferences_targetPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMigrationContext:sourcePreferences:targetPreferences:");
}

id objc_msgSend_initWithPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferences:");
}

id objc_msgSend_initWithProductBuild_backupUDID_backupUUID_snapshotID_snapshotDate_useLatestSnapshot_allowCellularNetwork_persistDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductBuild:backupUDID:backupUUID:snapshotID:snapshotDate:useLatestSnapshot:allowCellularNetwork:persistDate:");
}

id objc_msgSend_initWithProductBuild_intent_persistDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductBuild:intent:persistDate:");
}

id objc_msgSend_initWithProductVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductVersion:");
}

id objc_msgSend_initWithSetupAssistant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSetupAssistant:");
}

id objc_msgSend_initWithSetupAssistantContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSetupAssistantContext:");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _[a1 intent];
}

id objc_msgSend_isAppAnalyticsRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isAppAnalyticsRestricted];
}

id objc_msgSend_isAutomaticDownloadEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticDownloadEnabled];
}

id objc_msgSend_isAutomaticUpdateV2Enabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticUpdateV2Enabled];
}

id objc_msgSend_isDeviceAnalyticsRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceAnalyticsRestricted];
}

id objc_msgSend_isDownloadAllowableForCellular(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadAllowableForCellular];
}

id objc_msgSend_isEqualToAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAnalytics:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFeatureAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isFeatureAvailable];
}

id objc_msgSend_isFeatureEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFeatureEnabled];
}

id objc_msgSend_isFindMyEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFindMyEnabled];
}

id objc_msgSend_isICDPEnabledForDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isICDPEnabledForDSID:");
}

id objc_msgSend_isIntelligenceEnabledWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntelligenceEnabledWithCompletionHandler:");
}

id objc_msgSend_isManateeAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManateeAvailable:");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 isMultiUser];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return _[a1 isPasscodeSet];
}

id objc_msgSend_isSignedIntoAppleID(void *a1, const char *a2, ...)
{
  return _[a1 isSignedIntoAppleID];
}

id objc_msgSend_isStolenDeviceProtectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isStolenDeviceProtectionEnabled];
}

id objc_msgSend_isUpdateRequired(void *a1, const char *a2, ...)
{
  return _[a1 isUpdateRequired];
}

id objc_msgSend_launchURL(void *a1, const char *a2, ...)
{
  return _[a1 launchURL];
}

id objc_msgSend_loadFromPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPreferences:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 locationServicesEnabled];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_migratePreferenceWithSDPEnabledState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePreferenceWithSDPEnabledState:");
}

id objc_msgSend_migrateWithStoredMigratorVersion_userDataDisposition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateWithStoredMigratorVersion:userDataDisposition:");
}

id objc_msgSend_migrationContext(void *a1, const char *a2, ...)
{
  return _[a1 migrationContext];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfPanesPresented(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPanesPresented];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_includeCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:includeCache:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_otherDuration(void *a1, const char *a2, ...)
{
  return _[a1 otherDuration];
}

id objc_msgSend_persist(void *a1, const char *a2, ...)
{
  return _[a1 persist];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return _[a1 preferences];
}

id objc_msgSend_preheatQueue(void *a1, const char *a2, ...)
{
  return _[a1 preheatQueue];
}

id objc_msgSend_primaryAccountNeedsEscrowRecordRepair(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountNeedsEscrowRecordRepair];
}

id objc_msgSend_primaryAccountNeedsEscrowRepair(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountNeedsEscrowRepair];
}

id objc_msgSend_primaryAccountNeedsRepair(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountNeedsRepair];
}

id objc_msgSend_primaryAccountRequiresTermsAcceptance(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountRequiresTermsAcceptance];
}

id objc_msgSend_primaryAuthKitAccount(void *a1, const char *a2, ...)
{
  return _[a1 primaryAuthKitAccount];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return _[a1 privacyFlow];
}

id objc_msgSend_productBuild(void *a1, const char *a2, ...)
{
  return _[a1 productBuild];
}

id objc_msgSend_registerBagKeySet_forProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBagKeySet:forProfile:profileVersion:");
}

id objc_msgSend_registerWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithCompletion:");
}

id objc_msgSend_removeFromDiskWithPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromDiskWithPreferences:");
}

id objc_msgSend_removeFromPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromPreferences:");
}

id objc_msgSend_removeObjectForKey_onlyFromMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:onlyFromMemory:");
}

id objc_msgSend_repairStateForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairStateForAccount:");
}

id objc_msgSend_requestedBuild(void *a1, const char *a2, ...)
{
  return _[a1 requestedBuild];
}

id objc_msgSend_requestedPMV(void *a1, const char *a2, ...)
{
  return _[a1 requestedPMV];
}

id objc_msgSend_requiresAcknowledgementForDataSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresAcknowledgementForDataSharing:");
}

id objc_msgSend_restoreType(void *a1, const char *a2, ...)
{
  return _[a1 restoreType];
}

id objc_msgSend_revisePendingFollowUpsForcingRepost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revisePendingFollowUpsForcingRepost:");
}

id objc_msgSend_saveVerifiedAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveVerifiedAccount:error:");
}

id objc_msgSend_securityLevelForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "securityLevelForAccount:");
}

id objc_msgSend_setActiveDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDuration:");
}

id objc_msgSend_setAuthenticated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticated:");
}

id objc_msgSend_setBackgroundDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundDuration:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setChronicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChronicle:");
}

id objc_msgSend_setDataTransferMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataTransferMethod:");
}

id objc_msgSend_setFollowUpItemsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowUpItemsCount:");
}

id objc_msgSend_setHasCompletedInitialSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCompletedInitialSetup:");
}

id objc_msgSend_setInAppleStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInAppleStore:");
}

id objc_msgSend_setIsSignedIntoAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSignedIntoAppleID:");
}

id objc_msgSend_setMandatorySoftwareUpdateDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMandatorySoftwareUpdateDictionary:");
}

id objc_msgSend_setNotificationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationsEnabled:");
}

id objc_msgSend_setNumberOfPanesPresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfPanesPresented:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_persistImmediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:persistImmediately:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtherDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherDuration:");
}

id objc_msgSend_setSoftwareUpdatePerformed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoftwareUpdatePerformed:");
}

id objc_msgSend_setUsedProximitySetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsedProximitySetup:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupAssistantNeedsToRunReturningRequirements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAssistantNeedsToRunReturningRequirements:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldPresentVisualIntelligencePane(void *a1, const char *a2, ...)
{
  return _[a1 shouldPresentVisualIntelligencePane];
}

id objc_msgSend_shouldShowIntelligenceWithServerCheck_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowIntelligenceWithServerCheck:completionHandler:");
}

id objc_msgSend_shouldUpsellSiri(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpsellSiri];
}

id objc_msgSend_skipSetupKeys(void *a1, const char *a2, ...)
{
  return _[a1 skipSetupKeys];
}

id objc_msgSend_snapshotDate(void *a1, const char *a2, ...)
{
  return _[a1 snapshotDate];
}

id objc_msgSend_snapshotID(void *a1, const char *a2, ...)
{
  return _[a1 snapshotID];
}

id objc_msgSend_softwareUpdatePerformed(void *a1, const char *a2, ...)
{
  return _[a1 softwareUpdatePerformed];
}

id objc_msgSend_sourcePreferences(void *a1, const char *a2, ...)
{
  return _[a1 sourcePreferences];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsApplePay(void *a1, const char *a2, ...)
{
  return _[a1 supportsApplePay];
}

id objc_msgSend_supportsPeriocularFaceID(void *a1, const char *a2, ...)
{
  return _[a1 supportsPeriocularFaceID];
}

id objc_msgSend_targetPreferences(void *a1, const char *a2, ...)
{
  return _[a1 targetPreferences];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_underlyingBag(void *a1, const char *a2, ...)
{
  return _[a1 underlyingBag];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_useLatestSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 useLatestSnapshot];
}

id objc_msgSend_usedProximitySetup(void *a1, const char *a2, ...)
{
  return _[a1 usedProximitySetup];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return _[a1 userDataDisposition];
}

id objc_msgSend_userDownloadPolicyForDescriptor_existingPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDownloadPolicyForDescriptor:existingPolicy:");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}
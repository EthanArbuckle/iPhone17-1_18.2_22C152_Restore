void sub_2352C861C(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = objc_alloc_init(MEMORY[0x263F64820]);
  v3 = [*(id *)(a1 + 32) incomingCall];
  if (v3
    || ([*(id *)(a1 + 32) incomingVideoCall], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2352C7000, v4, OS_LOG_TYPE_DEFAULT, "An incoming call exists. Answering it and returning success", v9, 2u);
    }

    [*(id *)(a1 + 32) answerCall:v3];
    v5 = objc_alloc_init(MEMORY[0x263F64830]);
  }
  else
  {
    v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2352CD360(v8);
    }

    v5 = (id)[objc_alloc(MEMORY[0x263F64820]) initWithReason:@"No call to answer"];
    v3 = v2;
  }

  v6 = *(void *)(a1 + 40);
  v7 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void sub_2352C88F4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F64820]);
  v3 = [*(id *)(a1 + 32) incomingCall];
  if (v3
    || ([*(id *)(a1 + 32) incomingVideoCall], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_2352C7000, v4, OS_LOG_TYPE_DEFAULT, "An incoming call exists. Declining it and returning success: %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 32) disconnectCall:v3 withReason:2];
    id v5 = objc_alloc_init(MEMORY[0x263F64830]);
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) hasCurrentCalls];
    v9 = PHDefaultLog();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_2352C7000, v10, OS_LOG_TYPE_DEFAULT, "At least one call exists. Hanging up and returning success", (uint8_t *)&v12, 2u);
      }

      [*(id *)(a1 + 32) disconnectCurrentCallAndActivateHeld];
      id v11 = objc_alloc_init(MEMORY[0x263F64830]);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_2352CD3A4(v10);
      }

      id v11 = (id)[objc_alloc(MEMORY[0x263F64820]) initWithReason:@"No call to hang up"];
    }
    id v5 = v11;
    v3 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  v7 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void sub_2352CA984(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2352CD7D4(a1, (uint64_t)v4, v5);
    }

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F64820]) initWithReason:@"Unable to open url"];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F64B48] callStarted];
    [v6 setPhoneLogId:*(void *)(a1 + 32)];
    v7 = [*(id *)(a1 + 40) provider];
    int v8 = [v7 isTelephonyProvider];

    if (v8)
    {
      v9 = [*(id *)(a1 + 40) handle];
      TUGreenTeaLogOutgoingSiriCallToHandle();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_2352CAC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2352CAC58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2352CAC68(uint64_t a1)
{
}

void sub_2352CAC70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frontmostAudioOrVideoCall];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 callStatus];
    if (v4 == 3)
    {
      int v8 = PHDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2352C7000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing call exists. Returning failure", buf, 2u);
      }

      id v6 = objc_alloc(MEMORY[0x263F64820]);
      v7 = (void *)MEMORY[0x263F65A78];
    }
    else
    {
      if (v4 != 4) {
        goto LABEL_11;
      }
      id v5 = PHDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2352C7000, v5, OS_LOG_TYPE_DEFAULT, "Incoming call exists. Returning failure", buf, 2u);
      }

      id v6 = objc_alloc(MEMORY[0x263F64820]);
      v7 = (void *)MEMORY[0x263F65A70];
    }
    uint64_t v9 = [v6 initWithErrorCode:*v7];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
LABEL_11:
  int v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v12)
  {
    v15 = [*(id *)(a1 + 40) peerInfoForCurrentCommand];
    uint64_t v14 = [v15 idsIdentifier];

    v16 = [*(id *)(a1 + 48) appPunchOutDialRequestWithEndpointIDSDestinationURI:v14];
    uint64_t v18 = *(void *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_2352CAE90;
    v19[3] = &unk_264C4CF20;
    id v20 = *(id *)(a1 + 56);
    [v17 _performAppPunchOutWithDialRequest:v16 withServiceHelper:v18 completion:v19];

    goto LABEL_15;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13)
  {
    uint64_t v14 = [v12 dictionary];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
LABEL_15:
  }
}

void sub_2352CAE90(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2352C7000, v4, OS_LOG_TYPE_DEFAULT, "appPunchOutResult: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [v3 dictionary];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void sub_2352CB058(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2352CB080(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id PHDefaultLog()
{
  if (qword_2687F59E0 != -1) {
    dispatch_once(&qword_2687F59E0, &unk_26E87BFC0);
  }
  v0 = (void *)qword_2687F59D8;

  return v0;
}

uint64_t sub_2352CB10C()
{
  qword_2687F59D8 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLog()
{
  if (qword_2687F59F0 != -1) {
    dispatch_once(&qword_2687F59F0, &unk_26E87BFE0);
  }
  v0 = (void *)qword_2687F59E8;

  return v0;
}

uint64_t sub_2352CB1A4()
{
  qword_2687F59E8 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLogQueue()
{
  if (qword_2687F5A00 != -1) {
    dispatch_once(&qword_2687F5A00, &unk_26E87C000);
  }
  v0 = (void *)qword_2687F59F8;

  return v0;
}

void sub_2352CB23C()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v2);
  v1 = (void *)qword_2687F59F8;
  qword_2687F59F8 = (uint64_t)v0;
}

uint64_t sub_2352CB2F8()
{
  qword_2687F5A08 = (uint64_t)objc_alloc_init(MEMORY[0x263EFEA58]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2352CB4FC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDeleted] & 1) != 0 || (objc_msgSend(v2, "isTrashed")) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isBlocked] ^ 1;
  }

  return v3;
}

uint64_t sub_2352CB550(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 isDataAvailable]
    || ([v2 isDeleted] & 1) != 0
    || ([v2 isTrashed] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 isBlocked] ^ 1;
  }

  return v3;
}

uint64_t sub_2352CCB50(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) didSpecifyContacts];
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    uint64_t v12 = [v5 start];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [*(id *)(a1 + 32) start];
      v15 = [v3 date];
      uint64_t v16 = [v14 compare:v15];

      if (v16 == 1) {
        goto LABEL_10;
      }
    }
    uint64_t v17 = [*(id *)(a1 + 32) end];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      v19 = [*(id *)(a1 + 32) end];
      id v20 = [v3 date];
      uint64_t v21 = [v19 compare:v20];

      if (v21 == -1) {
        goto LABEL_10;
      }
    }
    v22 = [*(id *)(a1 + 32) isNew];
    if ([v22 BOOLValue])
    {
      char v23 = [v3 isRead];

      if (v23)
      {
LABEL_10:
        uint64_t v11 = 0;
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v11 = 1;
    goto LABEL_15;
  }
  id v6 = [v5 contactsByVoicemailIdentifier];
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) specifiedContactIdentifiers];
    uint64_t v10 = [v8 identifier];
    uint64_t v11 = [v9 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

LABEL_15:
  return v11;
}

uint64_t sub_2352CCDB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) didSpecifyContacts])
  {
    uint64_t v8 = [*(id *)(a1 + 32) end];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [*(id *)(a1 + 32) end];
      uint64_t v11 = [v3 date];
      uint64_t v12 = [v10 compare:v11];

      if (v12 == -1) {
        goto LABEL_8;
      }
    }
    uint64_t v13 = [*(id *)(a1 + 32) isNew];
    if ([v13 BOOLValue])
    {
      char v14 = [v3 read];

      if (v14)
      {
LABEL_8:
        uint64_t v7 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v7 = 1;
    goto LABEL_13;
  }
  int v4 = [v3 contactIdentifier];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) specifiedContactIdentifiers];
    id v6 = [v3 contactIdentifier];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

LABEL_13:
  return v7;
}

void sub_2352CD360(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2352C7000, log, OS_LOG_TYPE_ERROR, "No incoming call exists. Returning failure", v1, 2u);
}

void sub_2352CD3A4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2352C7000, log, OS_LOG_TYPE_ERROR, "No calls exist. Returning failure", v1, 2u);
}

void sub_2352CD3E8()
{
  sub_2352CB0A0();
  sub_2352CB080(&dword_2352C7000, v0, v1, "Could not find contact with identifier %@: %@");
}

void sub_2352CD450()
{
  sub_2352CB0A0();
  sub_2352CB080(&dword_2352C7000, v0, v1, "Could not read contents of %@: %@");
}

void sub_2352CD4B8()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: No -callRecipient specified, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD4EC()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: No -destinationID found, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD520()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: FaceTime video not supported in CarPlay", v2, v3, v4, v5, v6);
}

void sub_2352CD554()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: device has no country code, failing validation", v2, v3, v4, v5, v6);
}

void sub_2352CD588()
{
  sub_2352CB0A0();
  sub_2352CB080(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Destination ID %@ is NOT VALID for country %@ according to PNIsValidPhoneNumberForCountry, failing validation");
}

void sub_2352CD5F0()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Video, but FaceTime Video is not available, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD624()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Video, but FaceTime Video is blocked, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD658()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Audio, but FaceTime Audio is not available, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD68C()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Audio, but FaceTime Audio is blocked or unsupported, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD6C0()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "Airplane mode is on, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD6F4()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: No cellular service, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD728(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2352C7000, a2, OS_LOG_TYPE_ERROR, "Retrieving subscription info failed with error %@.", (uint8_t *)&v2, 0xCu);
}

void sub_2352CD7A0()
{
  sub_2352CB074();
  sub_2352CB058(&dword_2352C7000, v0, v1, "-[PHAssistantCall _validate]: Call was telephony, but device doesn't support telephony calls, failed validation", v2, v3, v4, v5, v6);
}

void sub_2352CD7D4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_2352CB080(&dword_2352C7000, a2, a3, "Failed to perform app punch-out with URL %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x270F0CDA8]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x270F0CDB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x270F0CE00]();
}

uint64_t TUGreenTeaLogOutgoingSiriCallToHandle()
{
  return MEMORY[0x270F7CB48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}
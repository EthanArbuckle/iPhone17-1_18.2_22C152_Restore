void sub_22630491C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_26AB0AFC0)
  {
    sub_226317E78();
    v0 = sub_226317F88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AB0AFC0);
    }
  }
}

void sub_226304974()
{
  sub_22630491C();
  if (v0 <= 0x3F)
  {
    sub_226304B00(319, &qword_26AB0AF88, &qword_26AB0AF80);
    if (v1 <= 0x3F)
    {
      sub_226304B00(319, (unint64_t *)&unk_26AB0AFB0, &qword_26AB0AFA8);
      if (v2 <= 0x3F)
      {
        sub_226304B00(319, (unint64_t *)&unk_26AB0AF98, &qword_26AB0AF90);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_226304B00(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_226304B50(a3);
    unint64_t v4 = sub_226317F88();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_226304B50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_226305610()
{
  return swift_getGenericMetadata();
}

uint64_t sub_226305640()
{
  qword_26AB0B2B8 = objc_alloc_init(APControllerRequesterCoordinator);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_22630567C()
{
  qword_26AB0B1A8 = objc_alloc_init(APRequestCoordinator);
  return MEMORY[0x270F9A758]();
}

ValueMetadata *type metadata accessor for EventCollectionFeatureFlags()
{
  return &type metadata for EventCollectionFeatureFlags;
}

const char *sub_2263056CC()
{
  return "NextGenerationEventCollection";
}

const char *sub_2263056E0()
{
  return "PromotedContent";
}

uint64_t sub_2263056F8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DeadEndPipe()
{
  return sub_226305610();
}

uint64_t DeadEndPipe.init()()
{
  return v0;
}

uint64_t type metadata accessor for ClientEvent()
{
  uint64_t result = qword_26AB0AFD0;
  if (!qword_26AB0AFD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_226308F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_226308F6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_226308F7C(uint64_t a1)
{
}

void sub_226308F84(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v12 = objc_msgSend_identifier(v5, v6, v7, v8, v9, v10, v11);
  *a3 = objc_msgSend_isEqual_(v12, v13, *(void *)(a1 + 32), v14, v15, v16, v17);

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
}

uint64_t sub_226309594(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_22630983C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_226309854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_226309864(uint64_t a1)
{
}

void sub_22630986C(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_msgSend_stringWithFormat_(NSString, a4, @"Received error from proxyURL. %@", a6, a7, a1, a2, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();
}

void sub_2263098CC(uint64_t a1, void *a2)
{
}

void sub_226309974(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_msgSend_stringWithFormat_(NSString, a4, @"Received error from proxyURL. %@", a6, a7, a1, a2, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();
}

void sub_226309E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226309E54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_handleCompletionOfRequest_(WeakRetained, v2, *(void *)(a1 + 32), v3, v4, v5, v6);
}

void sub_22630A01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22630A040(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend_handleCompletionOfRequest_(WeakRetained, v3, *(void *)(a1 + 32), v4, v5, v6, v7);
}

void sub_22630D284()
{
  uint64_t v0 = (void *)qword_26AB0B180;
  qword_26AB0B180 = @"adprivacyd";
}

void sub_22630D2F0()
{
  uint64_t v0 = (void *)qword_26AB0B190;
  qword_26AB0B190 = @"1";
}

void sub_22630D59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22630D5C8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_BOOLValue(a2, v5, v6, v7, v8, v10, v11);
  }
  else
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v9;
      id v13 = v15;
      _os_log_impl(&dword_226303000, v12, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'disablePromotedContentDaemonSubsequentAdsFetch' value from the bag. Error: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_22630D7AC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v13 = v6;
  if (!a2 || v6)
  {
    __int16 v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      v21 = v13;
      id v17 = v19;
      _os_log_impl(&dword_226303000, v16, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'disablePromotedContentDaemonSubsequentAdsFetch' value from the bag. Error: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = objc_msgSend_BOOLValue(a2, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v14, v13, v15);
}

void sub_22630D99C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a4;
  if (a2) {
    objc_msgSend_BOOLValue(a2, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22630E498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22630E4B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22630E4C0(uint64_t a1)
{
}

void sub_22630E4C8(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_msgSend_stringWithFormat_(NSString, a4, @"Received error from proxyURL. %@", a6, a7, a1, a2, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();
}

void sub_22630E528(uint64_t a1, void *a2)
{
}

void sub_22630E698(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_msgSend_stringWithFormat_(NSString, a4, @"Received error during prewarming. %@", a6, a7, a1, a2, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();
}

void sub_22630E8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_22630E910(uint64_t a1, const char *a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v8 >= 2)
  {
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"Received unexpected N: %ld responses from XPC.", a6, a7, a3, a4, v8);
    CreateDiagnosticReport();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend__removeBox_(WeakRetained, v11, *(void *)(a1 + 32), v12, v13, v14, v15);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
  uint64_t v22 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
  v22[2](v22, 0);
}

void sub_22630EB08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22630EB2C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend__removeBox_(WeakRetained, v9, *(void *)(a1 + 32), v10, v11, v12, v13);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v14, v15, v16, v17, v18, v19);
  double v20 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v20[2](v20, v7, v6);
}

void sub_22630ECAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22630ECC8(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend__removeBox_(WeakRetained, v6, *(void *)(a1 + 32), v7, v8, v9, v10);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v11, v12, v13, v14, v15, v16);
  uint64_t v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v17[2](v17, v4);
}

void sub_226310784(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = APLogForCategory();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v5;
      double v9 = "Received error from signatureForData. %{public}@";
      double v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_226303000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    double v9 = "Received response from signatureForData.";
    double v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

void sub_2263109C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2263109D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2263109E8(uint64_t a1)
{
}

void sub_2263109F0(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_226303000, v3, OS_LOG_TYPE_ERROR, "Received error from signatureForData. %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_226310AA0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_226303000, v7, OS_LOG_TYPE_ERROR, "Received error from signatureForData. %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_226310C58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = APLogForCategory();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v5;
      double v9 = "Received error from signatureForData. %{public}@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_226303000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    double v9 = "Received response from signatureForData.";
    int v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

void type metadata accessor for APMetricPurposeType(uint64_t a1)
{
}

void type metadata accessor for APMetricOptions(uint64_t a1)
{
}

void sub_226311454(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22631149C()
{
  return sub_226318058();
}

uint64_t sub_2263114E4()
{
  return sub_226318048();
}

uint64_t sub_226311510()
{
  return sub_226318058();
}

void *sub_226311554@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_226311564(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_226311574()
{
  unint64_t result = qword_26812C5A0;
  if (!qword_26812C5A0)
  {
    type metadata accessor for APMetricPurposeType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812C5A0);
  }
  return result;
}

BOOL sub_2263115CC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t EventSource.init(bundleID:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  type metadata accessor for EventSource();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (uint64_t *)((char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_226317ED8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  os_log_type_t v11 = (char *)&v19 - v10;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v19 - v10, a1, v5);
  sub_226317EC8();
  sub_226311938();
  char v12 = sub_226317F18();
  uint64_t v19 = v6;
  int v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  if (v12)
  {
    v13(v11, v5);
    v13(a1, v5);
    uint64_t v14 = 978;
  }
  else
  {
    sub_226317EA8();
    char v15 = sub_226317F18();
    v13(v9, v5);
    if (v15)
    {
      v13(v11, v5);
      v13(a1, v5);
      uint64_t v14 = 976;
    }
    else
    {
      sub_226317E88();
      char v16 = sub_226317F18();
      v13(v9, v5);
      if (v16)
      {
        v13(v11, v5);
        v13(a1, v5);
        uint64_t v14 = 975;
      }
      else
      {
        sub_226317EB8();
        char v17 = sub_226317F18();
        v13(v9, v5);
        v13(v11, v5);
        if ((v17 & 1) == 0)
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v20, a1, v5);
          return swift_storeEnumTagMultiPayload();
        }
        v13(a1, v5);
        uint64_t v14 = 977;
      }
    }
  }
  *uint64_t v4 = v14;
  swift_storeEnumTagMultiPayload();
  return sub_226311990((uint64_t)v4, v20);
}

unint64_t sub_226311938()
{
  unint64_t result = qword_26812C610;
  if (!qword_26812C610)
  {
    sub_226317ED8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812C610);
  }
  return result;
}

uint64_t sub_226311990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t EventCapsule.event.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t EventCapsule.purpose.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 28));
}

uint64_t EventCapsule.options.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 32));
}

uint64_t EventCapsule.init(event:purpose:options:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t result = type metadata accessor for EventCapsule();
  *(void *)(a5 + *(int *)(result + 28)) = a2;
  *(void *)(a5 + *(int *)(result + 32)) = a3;
  return result;
}

uint64_t type metadata accessor for EventCapsule()
{
  return sub_226305610();
}

BOOL static EventCapsule<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_226317F18() & 1) != 0
    && (uint64_t v4 = type metadata accessor for EventCapsule(),
        *(void *)(a1 + *(int *)(v4 + 28)) == *(void *)(a2 + *(int *)(v4 + 28))))
  {
    return *(void *)(a1 + *(int *)(v4 + 32)) == *(void *)(a2 + *(int *)(v4 + 32));
  }
  else
  {
    return 0;
  }
}

BOOL sub_226311B50(uint64_t a1, uint64_t a2)
{
  return static EventCapsule<A>.== infix(_:_:)(a1, a2);
}

uint64_t EventCapsule.debugDescription.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_226317FB8();
  sub_226317F38();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  sub_226317F28();
  sub_226317F38();
  swift_bridgeObjectRelease();
  sub_226317F38();
  uint64_t v9 = *(void *)(v1 + *(int *)(a1 + 28));
  sub_226318018();
  sub_226317F38();
  swift_bridgeObjectRelease();
  sub_226317F38();
  uint64_t v9 = *(void *)(v1 + *(int *)(a1 + 32));
  type metadata accessor for APMetricOptions(0);
  sub_226317FE8();
  return v10;
}

uint64_t dispatch thunk of EventPipeline.deliverEvent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_226311D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_226311D48()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_226311DE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    *(void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_226311EF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_226311F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_226311FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22631203C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2263120C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_226312154(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x226312270);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_226312284(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            char v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x226312438);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

void static EventSourceID.appStore.getter(void *a1@<X8>)
{
  *a1 = 978;
}

void static EventSourceID.news.getter(void *a1@<X8>)
{
  *a1 = 976;
}

void static EventSourceID.promotedContentDaemon.getter(void *a1@<X8>)
{
  *a1 = 975;
}

void static EventSourceID.stocks.getter(void *a1@<X8>)
{
  *a1 = 977;
}

const char *EventCollectionFeatureFlags.domain.getter()
{
  return "PromotedContent";
}

const char *EventCollectionFeatureFlags.feature.getter()
{
  return "NextGenerationEventCollection";
}

uint64_t static EventCollectionFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t EventCollectionFeatureFlags.hash(into:)()
{
  return sub_226318048();
}

uint64_t EventCollectionFeatureFlags.hashValue.getter()
{
  return sub_226318058();
}

uint64_t sub_22631252C()
{
  return 1;
}

uint64_t sub_226312534()
{
  return sub_226318058();
}

uint64_t sub_226312578()
{
  return sub_226318048();
}

uint64_t sub_2263125A0()
{
  return sub_226318058();
}

unint64_t sub_2263125E4()
{
  unint64_t result = qword_26812C618[0];
  if (!qword_26812C618[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812C618);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EventCollectionFeatureFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for EventCollectionFeatureFlags(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x226312728);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_226312750()
{
  return 0;
}

uint64_t Handle.primary.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.secondary.getter()
{
  return *(void *)(v0 + 16);
}

AdPlatformsCommon::Handle __swiftcall Handle.init(_:)(Swift::String a1)
{
  *(Swift::String *)uint64_t v1 = a1;
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 1;
  result.primary = a1;
  return result;
}

AdPlatformsCommon::Handle __swiftcall Handle.init(primary:secondary:)(Swift::String primary, Swift::Int_optional secondary)
{
  *(Swift::String *)uint64_t v2 = primary;
  *(void *)(v2 + 16) = secondary.value;
  *(unsigned char *)(v2 + 24) = secondary.is_nil;
  result.primary = primary;
  result.secondary = secondary;
  return result;
}

uint64_t _s17AdPlatformsCommon6HandleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  BOOL v6 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v6 || (v7 = sub_226318028(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if ((v5 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v2 == v4) {
        char v9 = v5;
      }
      else {
        char v9 = 1;
      }
      if (v9) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Handle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Handle()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 initializeWithTake for Handle(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Handle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Handle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Handle()
{
  return &type metadata for Handle;
}

uint64_t TracingEventPipe.__allocating_init(source:connecting:)(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_226312A9C(a3, v6 + 32);
  return v6;
}

uint64_t TracingEventPipe.init(source:connecting:)(uint64_t a1, uint64_t a2, long long *a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_226312A9C(a3, v3 + 32);
  return v3;
}

uint64_t sub_226312A9C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_226312AB4(uint64_t a1)
{
  long long v2 = v1;
  uint64_t v4 = type metadata accessor for EventCapsule();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v35 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v28 - v8;
  uint64_t v10 = sub_226317F08();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226317EE8();
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v33(v9, a1, v4);
  swift_retain();
  int v14 = sub_226317EF8();
  os_log_type_t v15 = sub_226317F58();
  int v34 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v31 = v11;
    uint64_t v17 = v16;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v37 = v29;
    *(_DWORD *)uint64_t v17 = 136446466;
    uint64_t v32 = a1;
    uint64_t v30 = v10;
    os_log_t v28 = v14;
    uint64_t v18 = v2[2];
    unint64_t v19 = v2[3];
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_226312F50(v18, v19, &v37);
    sub_226317F98();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    v33(v35, (uint64_t)v9, v4);
    uint64_t v20 = sub_226317F28();
    uint64_t v36 = sub_226312F50(v20, v21, &v37);
    sub_226317F98();
    a1 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    os_log_t v22 = v28;
    _os_log_impl(&dword_226303000, v28, (os_log_type_t)v34, "%{public}s: delivering event %{public}s", (uint8_t *)v17, 0x16u);
    uint64_t v23 = v29;
    swift_arrayDestroy();
    MEMORY[0x22A64D510](v23, -1, -1);
    MEMORY[0x22A64D510](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v30);
  }
  else
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  v24 = v2 + 4;
  uint64_t v25 = v2[7];
  uint64_t v26 = v2[8];
  sub_226312F0C(v24, v25);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(a1, v25, v26);
}

uint64_t TracingEventPipe.deinit()
{
  swift_bridgeObjectRelease();
  sub_22631365C(v0 + 32);
  return v0;
}

uint64_t TracingEventPipe.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_22631365C(v0 + 32);
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t sub_226312EE8(uint64_t a1)
{
  return sub_226312AB4(a1);
}

void *sub_226312F0C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_226312F50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_226313024(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2263136AC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2263136AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_22631365C((uint64_t)v12);
  return v7;
}

uint64_t sub_226313024(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_226317FA8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2263131E0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_226317FD8();
  if (!v8)
  {
    sub_226317FF8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_226318008();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2263131E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226313278(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_226313458(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226313458(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226313278(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2263133F0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_226317FC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_226317FF8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_226317F48();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_226318008();
    __break(1u);
LABEL_14:
    uint64_t result = sub_226317FF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2263133F0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_226313708((uint64_t *)&unk_26812C6A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_226313458(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_226313708((uint64_t *)&unk_26812C6A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  int v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_226318008();
  __break(1u);
  return result;
}

uint64_t sub_2263135A8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TracingEventPipe()
{
  return sub_226305610();
}

uint64_t method lookup function for TracingEventPipe(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TracingEventPipe);
}

uint64_t dispatch thunk of TracingEventPipe.__allocating_init(source:connecting:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TracingEventPipe.deliverEvent(in:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t sub_22631365C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2263136AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_226313708(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t ClientEvent.handle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  char v4 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = *(void *)(v1 + 8);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t ClientEvent.order.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t ClientEvent.trace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 28), a1, &qword_26812C6B0);
}

uint64_t ClientEvent.branch.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 32), a1, &qword_26812C6B8);
}

uint64_t ClientEvent.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 36), a1, &qword_26812C6B8);
}

uint64_t ClientEvent.relay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 40), a1, &qword_26812C6C0);
}

uint64_t ClientEvent.properties.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 44), a1, &qword_26812C6C0);
}

uint64_t ClientEvent.internalProperties.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientEvent();
  return sub_2263138F4(v1 + *(int *)(v3 + 48), a1, (uint64_t *)&unk_26812C6C8);
}

uint64_t sub_2263138F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_226313708(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t ClientEvent.init(kind:handle:order:trace:branch:environment:relay:properties:internalProperties:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  long long v16 = *a2;
  uint64_t v17 = *((void *)a2 + 2);
  char v18 = *((unsigned char *)a2 + 24);
  *(void *)a9 = a1;
  *(_OWORD *)(a9 + 8) = v16;
  *(void *)(a9 + 24) = v17;
  *(unsigned char *)(a9 + 32) = v18;
  *(void *)(a9 + 40) = a3;
  unint64_t v19 = (int *)type metadata accessor for ClientEvent();
  sub_226313A64(a4, a9 + v19[7], &qword_26812C6B0);
  sub_226313A64(a5, a9 + v19[8], &qword_26812C6B8);
  sub_226313A64(a6, a9 + v19[9], &qword_26812C6B8);
  sub_226313A64(a7, a9 + v19[10], &qword_26812C6C0);
  sub_226313A64(a8, a9 + v19[11], &qword_26812C6C0);
  return sub_226313A64(a10, a9 + v19[12], (uint64_t *)&unk_26812C6C8);
}

uint64_t sub_226313A64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_226313708(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ClientEvent.filteringKind.getter()
{
  return *(void *)v0;
}

uint64_t _s17AdPlatformsCommon11ClientEventV2eeoiySbAC_ACtFZ_0(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_226313708(&qword_26AB0AF80);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v130 = v4;
  uint64_t v131 = v5;
  MEMORY[0x270FA5388](v4);
  v125 = (char *)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_226313708(&qword_26812C6B8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v124 = (uint64_t)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v126 = (uint64_t)&v123 - v10;
  uint64_t v129 = sub_226313708(&qword_26812C6D8);
  uint64_t v11 = MEMORY[0x270FA5388](v129);
  uint64_t v128 = (uint64_t)&v123 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v132 = (uint64_t)&v123 - v13;
  uint64_t v134 = sub_226317E78();
  uint64_t v136 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  v127 = (char *)&v123 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_226313708(&qword_26812C6B0);
  MEMORY[0x270FA5388](v15 - 8);
  v135 = (char *)&v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_226313708(&qword_26812C6E0);
  MEMORY[0x270FA5388](v133);
  uint64_t v138 = (uint64_t)&v123 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = (int *)type metadata accessor for ClientEvent();
  uint64_t v18 = MEMORY[0x270FA5388](v137);
  v139 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v123 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v144 = (uint64_t)&v123 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v143 = (char *)&v123 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v142 = (char *)&v123 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v141 = (uint64_t)&v123 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v140 = (uint64_t)&v123 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v148 = (uint64_t)&v123 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v147 = (uint64_t)&v123 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v149 = (uint64_t)&v123 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v146 = (uint64_t)&v123 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v40 = (char *)&v123 - v39;
  uint64_t v41 = MEMORY[0x270FA5388](v38);
  v43 = (char *)&v123 - v42;
  uint64_t v44 = MEMORY[0x270FA5388](v41);
  v46 = (char *)&v123 - v45;
  uint64_t v47 = MEMORY[0x270FA5388](v44);
  v49 = (char *)&v123 - v48;
  uint64_t v50 = MEMORY[0x270FA5388](v47);
  v52 = (char *)&v123 - v51;
  MEMORY[0x270FA5388](v50);
  v54 = (char *)&v123 - v53;
  uint64_t v55 = *a1;
  uint64_t v56 = *a2;
  v145 = a1;
  sub_226316FCC((uint64_t)a1, (uint64_t)&v123 - v53);
  uint64_t v57 = (uint64_t)a2;
  sub_226316FCC((uint64_t)a2, (uint64_t)v52);
  if (v55 != v56) {
    goto LABEL_7;
  }
  uint64_t v58 = *((void *)v54 + 3);
  char v59 = v54[32];
  uint64_t v60 = *((void *)v52 + 3);
  int v61 = v52[32];
  if (*((void *)v54 + 1) != *((void *)v52 + 1) || *((void *)v54 + 2) != *((void *)v52 + 2))
  {
    v123 = v40;
    v62 = v43;
    uint64_t v63 = v60;
    char v64 = sub_226318028();
    uint64_t v60 = v63;
    v43 = v62;
    v40 = v123;
    if ((v64 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (v59)
  {
    if (!v61)
    {
LABEL_7:
      sub_226317030((uint64_t)v52);
      sub_226317030((uint64_t)v54);
      uint64_t v65 = (uint64_t)v145;
      sub_226316FCC((uint64_t)v145, (uint64_t)v49);
      sub_226316FCC(v57, (uint64_t)v46);
      sub_226317030((uint64_t)v46);
      sub_226317030((uint64_t)v49);
      sub_226316FCC(v65, (uint64_t)v43);
      sub_226316FCC(v57, (uint64_t)v40);
      uint64_t v66 = v148;
LABEL_8:
      sub_226317030((uint64_t)v40);
      sub_226317030((uint64_t)v43);
      uint64_t v67 = (uint64_t)v139;
      uint64_t v68 = v147;
LABEL_9:
      uint64_t v69 = v146;
      uint64_t v70 = v149;
      sub_226316FCC(v65, v146);
      sub_226316FCC(v57, v70);
LABEL_10:
      sub_226317030(v70);
      sub_226317030(v69);
LABEL_11:
      sub_226316FCC(v65, v68);
      sub_226316FCC(v57, v66);
LABEL_12:
      sub_226317030(v66);
      sub_226317030(v68);
      uint64_t v72 = (uint64_t)v142;
      uint64_t v71 = (uint64_t)v143;
      uint64_t v74 = v140;
      uint64_t v73 = v141;
LABEL_13:
      sub_226316FCC(v65, v74);
      sub_226316FCC(v57, v73);
LABEL_14:
      sub_226317030(v73);
      sub_226317030(v74);
      sub_226316FCC(v65, v72);
      sub_226316FCC(v57, v71);
LABEL_15:
      sub_226317030(v71);
      sub_226317030(v72);
      uint64_t v75 = v65;
      uint64_t v76 = v144;
      sub_226316FCC(v75, v144);
      sub_226316FCC(v57, v67);
      goto LABEL_16;
    }
  }
  else
  {
    if (v58 == v60) {
      char v79 = v61;
    }
    else {
      char v79 = 1;
    }
    if (v79) {
      goto LABEL_7;
    }
  }
  sub_226317030((uint64_t)v52);
  sub_226317030((uint64_t)v54);
  uint64_t v65 = (uint64_t)v145;
  sub_226316FCC((uint64_t)v145, (uint64_t)v49);
  sub_226316FCC(v57, (uint64_t)v46);
  uint64_t v80 = *((void *)v49 + 5);
  sub_226317030((uint64_t)v49);
  uint64_t v81 = *((void *)v46 + 5);
  sub_226317030((uint64_t)v46);
  sub_226316FCC(v65, (uint64_t)v43);
  sub_226316FCC(v57, (uint64_t)v40);
  uint64_t v66 = v148;
  if (v80 != v81) {
    goto LABEL_8;
  }
  uint64_t v82 = v138;
  uint64_t v83 = v137[7];
  uint64_t v84 = (uint64_t)&v40[v83];
  uint64_t v85 = v138 + *(int *)(v133 + 48);
  sub_2263138F4((uint64_t)&v43[v83], v138, &qword_26812C6B0);
  sub_2263138F4(v84, v85, &qword_26812C6B0);
  v86 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v136 + 48);
  uint64_t v87 = v134;
  if (v86(v82, 1, v134) == 1)
  {
    sub_226317030((uint64_t)v40);
    sub_226317030((uint64_t)v43);
    int v88 = v86(v85, 1, v87);
    uint64_t v68 = v147;
    if (v88 == 1)
    {
      sub_2263170E8(v138, &qword_26812C6B0);
      uint64_t v69 = v146;
      sub_226316FCC(v65, v146);
      uint64_t v70 = v149;
      sub_226316FCC(v57, v149);
      uint64_t v67 = (uint64_t)v139;
      goto LABEL_30;
    }
LABEL_28:
    sub_2263170E8(v138, &qword_26812C6E0);
    uint64_t v67 = (uint64_t)v139;
    goto LABEL_9;
  }
  sub_2263138F4(v82, (uint64_t)v135, &qword_26812C6B0);
  if (v86(v85, 1, v87) == 1)
  {
    sub_226317030((uint64_t)v40);
    sub_226317030((uint64_t)v43);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v135, v87);
    uint64_t v68 = v147;
    goto LABEL_28;
  }
  uint64_t v89 = v136;
  v90 = v127;
  (*(void (**)(char *, uint64_t, uint64_t))(v136 + 32))(v127, v85, v87);
  sub_226317144();
  LODWORD(v133) = sub_226317F18();
  v91 = *(void (**)(char *, uint64_t))(v89 + 8);
  v91(v90, v87);
  sub_226317030((uint64_t)v40);
  sub_226317030((uint64_t)v43);
  v91(v135, v87);
  sub_2263170E8(v82, &qword_26812C6B0);
  uint64_t v69 = v146;
  sub_226316FCC(v65, v146);
  uint64_t v70 = v149;
  sub_226316FCC(v57, v149);
  uint64_t v67 = (uint64_t)v139;
  uint64_t v68 = v147;
  if ((v133 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_30:
  uint64_t v92 = v137[8];
  uint64_t v93 = v70 + v92;
  uint64_t v94 = v132;
  uint64_t v95 = v132 + *(int *)(v129 + 48);
  sub_2263138F4(v69 + v92, v132, &qword_26812C6B8);
  uint64_t v138 = v95;
  sub_2263138F4(v93, v95, &qword_26812C6B8);
  uint64_t v96 = v130;
  v139 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v131 + 48);
  if (v139(v94, 1, v130) == 1)
  {
    sub_226317030(v149);
    sub_226317030(v69);
    uint64_t v97 = v96;
    v98 = v139;
    if (v139(v138, 1, v97) == 1)
    {
      sub_2263170E8(v132, &qword_26812C6B8);
      sub_226316FCC(v65, v68);
      sub_226316FCC(v57, v66);
      goto LABEL_37;
    }
LABEL_35:
    sub_2263170E8(v132, &qword_26812C6D8);
    goto LABEL_11;
  }
  uint64_t v99 = v126;
  sub_2263138F4(v94, v126, &qword_26812C6B8);
  uint64_t v100 = v138;
  if (v139(v138, 1, v96) == 1)
  {
    sub_226317030(v149);
    sub_226317030(v146);
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v99, v96);
    goto LABEL_35;
  }
  uint64_t v101 = v131;
  v102 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v125, v100, v96);
  sub_22631708C();
  char v103 = sub_226317F18();
  v104 = *(void (**)(char *, uint64_t))(v101 + 8);
  v105 = v102;
  uint64_t v66 = v148;
  v104(v105, v96);
  sub_226317030(v149);
  sub_226317030(v146);
  v104((char *)v99, v96);
  uint64_t v68 = v147;
  uint64_t v65 = (uint64_t)v145;
  sub_2263170E8(v94, &qword_26812C6B8);
  sub_226316FCC(v65, v68);
  sub_226316FCC(v57, v66);
  v98 = v139;
  if ((v103 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_37:
  uint64_t v106 = v137[9];
  uint64_t v107 = v68 + v106;
  uint64_t v108 = v66 + v106;
  uint64_t v109 = v128;
  uint64_t v110 = v128 + *(int *)(v129 + 48);
  sub_2263138F4(v107, v128, &qword_26812C6B8);
  uint64_t v111 = v108;
  uint64_t v112 = v130;
  sub_2263138F4(v111, v110, &qword_26812C6B8);
  if (v98(v109, 1, v112) == 1)
  {
    sub_226317030(v148);
    sub_226317030(v147);
    int v113 = v98(v110, 1, v112);
    uint64_t v72 = (uint64_t)v142;
    uint64_t v71 = (uint64_t)v143;
    uint64_t v74 = v140;
    uint64_t v73 = v141;
    if (v113 == 1)
    {
      sub_2263170E8(v128, &qword_26812C6B8);
      sub_226316FCC(v65, v74);
      sub_226316FCC(v57, v73);
      goto LABEL_44;
    }
LABEL_42:
    sub_2263170E8(v128, &qword_26812C6D8);
    goto LABEL_13;
  }
  uint64_t v114 = v124;
  sub_2263138F4(v109, v124, &qword_26812C6B8);
  if (v98(v110, 1, v112) == 1)
  {
    sub_226317030(v148);
    sub_226317030(v147);
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v114, v112);
    uint64_t v72 = (uint64_t)v142;
    uint64_t v71 = (uint64_t)v143;
    uint64_t v74 = v140;
    uint64_t v73 = v141;
    goto LABEL_42;
  }
  uint64_t v115 = v114;
  uint64_t v116 = v131;
  v117 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v125, v110, v112);
  sub_22631708C();
  char v118 = sub_226317F18();
  v119 = *(void (**)(char *, uint64_t))(v116 + 8);
  v119(v117, v112);
  sub_226317030(v148);
  sub_226317030(v147);
  v119((char *)v115, v112);
  sub_2263170E8(v128, &qword_26812C6B8);
  uint64_t v74 = v140;
  sub_226316FCC(v65, v140);
  uint64_t v73 = v141;
  sub_226316FCC(v57, v141);
  uint64_t v72 = (uint64_t)v142;
  uint64_t v71 = (uint64_t)v143;
  if ((v118 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_44:
  char v120 = sub_226317F78();
  sub_226317030(v73);
  sub_226317030(v74);
  sub_226316FCC(v65, v72);
  sub_226316FCC(v57, v71);
  if ((v120 & 1) == 0) {
    goto LABEL_15;
  }
  char v121 = sub_226317F78();
  sub_226317030(v71);
  sub_226317030(v72);
  uint64_t v122 = v65;
  uint64_t v76 = v144;
  sub_226316FCC(v122, v144);
  sub_226316FCC(v57, v67);
  if (v121)
  {
    char v77 = sub_226317F68();
    goto LABEL_17;
  }
LABEL_16:
  char v77 = 0;
LABEL_17:
  sub_226317030(v67);
  sub_226317030(v76);
  return v77 & 1;
}

uint64_t sub_226314954()
{
  return MEMORY[0x263F8D6D8];
}

void *initializeBufferWithCopyOfBuffer for ClientEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    *(void *)(a1 + 40) = a2[5];
    uint64_t v11 = sub_226317E78();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_226313708(&qword_26812C6B0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_226313708(&qword_26AB0AF80);
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    if (v21(v18, 1, v19))
    {
      uint64_t v22 = sub_226313708(&qword_26812C6B8);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    if (v21((char *)a2 + v23, 1, v19))
    {
      uint64_t v26 = sub_226313708(&qword_26812C6B8);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v25, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
    }
    uint64_t v27 = a3[10];
    uint64_t v28 = (char *)v4 + v27;
    uint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = sub_226313708(&qword_26AB0AFA8);
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    if (v32(v29, 1, v30))
    {
      uint64_t v33 = sub_226313708(&qword_26812C6C0);
      memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    uint64_t v34 = a3[11];
    uint64_t v35 = (char *)v4 + v34;
    uint64_t v36 = (char *)a2 + v34;
    if (v32((char *)a2 + v34, 1, v30))
    {
      uint64_t v37 = sub_226313708(&qword_26812C6C0);
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v35, v36, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v35, 0, 1, v30);
    }
    uint64_t v38 = a3[12];
    uint64_t v39 = (char *)v4 + v38;
    v40 = (char *)a2 + v38;
    uint64_t v41 = sub_226313708(&qword_26AB0AF90);
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      uint64_t v43 = sub_226313708((uint64_t *)&unk_26812C6C8);
      memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v40, v41);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
  }
  return v4;
}

uint64_t destroy for ClientEvent(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_226317E78();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[8];
  uint64_t v8 = sub_226313708(&qword_26AB0AF80);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v11 = a1 + a2[9];
  if (!v10(v11, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v12 = a1 + a2[10];
  uint64_t v13 = sub_226313708(&qword_26AB0AFA8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (!v15(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v16 = a1 + a2[11];
  if (!v15(v16, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
  }
  uint64_t v17 = a1 + a2[12];
  uint64_t v18 = sub_226313708(&qword_26AB0AF90);
  uint64_t v21 = *(void *)(v18 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v17, 1, v18);
  if (!result)
  {
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8);
    return v20(v17, v18);
  }
  return result;
}

uint64_t initializeWithCopy for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_226317E78();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_226313708(&qword_26812C6B0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_226313708(&qword_26AB0AF80);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = sub_226313708(&qword_26812C6B8);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    uint64_t v24 = sub_226313708(&qword_26812C6B8);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v22, v23, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  uint64_t v28 = sub_226313708(&qword_26AB0AFA8);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48);
  if (v30(v27, 1, v28))
  {
    uint64_t v31 = sub_226313708(&qword_26812C6C0);
    memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  uint64_t v32 = a3[11];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  if (v30((const void *)(a2 + v32), 1, v28))
  {
    uint64_t v35 = sub_226313708(&qword_26812C6C0);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v33, v34, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v28);
  }
  uint64_t v36 = a3[12];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (const void *)(a2 + v36);
  uint64_t v39 = sub_226313708(&qword_26AB0AF90);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_226313708((uint64_t *)&unk_26812C6C8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  return a1;
}

uint64_t assignWithCopy for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_226317E78();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_226313708(&qword_26812C6B0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_226313708(&qword_26AB0AF80);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_12:
    uint64_t v24 = sub_226313708(&qword_26812C6B8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_13:
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  int v28 = v21((void *)(a1 + v25), 1, v19);
  int v29 = v21(v27, 1, v19);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v26, v27, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v26, v19);
LABEL_18:
    uint64_t v30 = sub_226313708(&qword_26812C6B8);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v26, v27, v19);
LABEL_19:
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  uint64_t v34 = sub_226313708(&qword_26AB0AFA8);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v35 + 8))(v32, v34);
LABEL_24:
    uint64_t v39 = sub_226313708(&qword_26812C6C0);
    memcpy(v32, v33, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v32, v33, v34);
LABEL_25:
  uint64_t v40 = a3[11];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  int v43 = v36((void *)(a1 + v40), 1, v34);
  int v44 = v36(v42, 1, v34);
  if (v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v41, v42, v34);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v41, 0, 1, v34);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v44)
  {
    (*(void (**)(void *, uint64_t))(v35 + 8))(v41, v34);
LABEL_30:
    uint64_t v45 = sub_226313708(&qword_26812C6C0);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v41, v42, v34);
LABEL_31:
  uint64_t v46 = a3[12];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = (void *)(a2 + v46);
  uint64_t v49 = sub_226313708(&qword_26AB0AF90);
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v50 + 48);
  int v52 = v51(v47, 1, v49);
  int v53 = v51(v48, 1, v49);
  if (!v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v50 + 24))(v47, v48, v49);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v47, v49);
    goto LABEL_36;
  }
  if (v53)
  {
LABEL_36:
    uint64_t v54 = sub_226313708((uint64_t *)&unk_26812C6C8);
    memcpy(v47, v48, *(void *)(*(void *)(v54 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v50 + 16))(v47, v48, v49);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
  return a1;
}

uint64_t initializeWithTake for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 17) = *(_OWORD *)(a2 + 17);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_226317E78();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_226313708(&qword_26812C6B0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[8];
  int v13 = (void *)(a1 + v12);
  int v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_226313708(&qword_26AB0AF80);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = sub_226313708(&qword_26812C6B8);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v17((const void *)(a2 + v19), 1, v15))
  {
    uint64_t v22 = sub_226313708(&qword_26812C6B8);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v20, v21, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  uint64_t v26 = sub_226313708(&qword_26AB0AFA8);
  uint64_t v27 = *(void *)(v26 - 8);
  int v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v25, 1, v26))
  {
    uint64_t v29 = sub_226313708(&qword_26812C6C0);
    memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 32))(v24, v25, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v30 = a3[11];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  if (v28((const void *)(a2 + v30), 1, v26))
  {
    uint64_t v33 = sub_226313708(&qword_26812C6C0);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 32))(v31, v32, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
  }
  uint64_t v34 = a3[12];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (const void *)(a2 + v34);
  uint64_t v37 = sub_226313708(&qword_26AB0AF90);
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
  {
    uint64_t v39 = sub_226313708((uint64_t *)&unk_26812C6C8);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v38 + 32))(v35, v36, v37);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  return a1;
}

uint64_t assignWithTake for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_226317E78();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_226313708(&qword_26812C6B0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = sub_226313708(&qword_26AB0AF80);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    uint64_t v23 = sub_226313708(&qword_26812C6B8);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_13:
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  int v27 = v20((void *)(a1 + v24), 1, v18);
  int v28 = v20(v26, 1, v18);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v25, v26, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v25, v18);
LABEL_18:
    uint64_t v29 = sub_226313708(&qword_26812C6B8);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v25, v26, v18);
LABEL_19:
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  uint64_t v33 = sub_226313708(&qword_26AB0AFA8);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 32))(v31, v32, v33);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v34 + 8))(v31, v33);
LABEL_24:
    uint64_t v38 = sub_226313708(&qword_26812C6C0);
    memcpy(v31, v32, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 40))(v31, v32, v33);
LABEL_25:
  uint64_t v39 = a3[11];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (void *)(a2 + v39);
  int v42 = v35((void *)(a1 + v39), 1, v33);
  int v43 = v35(v41, 1, v33);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 32))(v40, v41, v33);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v40, 0, 1, v33);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v43)
  {
    (*(void (**)(void *, uint64_t))(v34 + 8))(v40, v33);
LABEL_30:
    uint64_t v44 = sub_226313708(&qword_26812C6C0);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 40))(v40, v41, v33);
LABEL_31:
  uint64_t v45 = a3[12];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (void *)(a2 + v45);
  uint64_t v48 = sub_226313708(&qword_26AB0AF90);
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v49 + 48);
  int v51 = v50(v46, 1, v48);
  int v52 = v50(v47, 1, v48);
  if (!v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v49 + 40))(v46, v47, v48);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v49 + 8))(v46, v48);
    goto LABEL_36;
  }
  if (v52)
  {
LABEL_36:
    uint64_t v53 = sub_226313708((uint64_t *)&unk_26812C6C8);
    memcpy(v46, v47, *(void *)(*(void *)(v53 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v49 + 32))(v46, v47, v48);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226316C10);
}

uint64_t sub_226316C10(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_226313708(&qword_26812C6B0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[7];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_226313708(&qword_26812C6B8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_11;
  }
  uint64_t v13 = sub_226313708(&qword_26812C6C0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[10];
    goto LABEL_11;
  }
  uint64_t v15 = sub_226313708((uint64_t *)&unk_26812C6C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[12];
  return v16(v18, a2, v17);
}

uint64_t storeEnumTagSinglePayload for ClientEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226316DF8);
}

uint64_t sub_226316DF8(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_226313708(&qword_26812C6B0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[7];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_226313708(&qword_26812C6B8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_9;
  }
  uint64_t v13 = sub_226313708(&qword_26812C6C0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[10];
    goto LABEL_9;
  }
  uint64_t v15 = sub_226313708((uint64_t *)&unk_26812C6C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[12];
  return v16(v18, a2, a2, v17);
}

uint64_t sub_226316FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226317030(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22631708C()
{
  unint64_t result = qword_26812C6E8;
  if (!qword_26812C6E8)
  {
    sub_226304B50(&qword_26AB0AF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812C6E8);
  }
  return result;
}

uint64_t sub_2263170E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_226313708(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_226317144()
{
  unint64_t result = qword_26812C6F0;
  if (!qword_26812C6F0)
  {
    sub_226317E78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812C6F0);
  }
  return result;
}

uint64_t EventSource.debugDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226317ED8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for EventSource();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void *)((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_226317694(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
    sub_226317F38();
    sub_226317FE8();
    sub_226317F38();
    uint64_t v9 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v10 = *v8;
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
    sub_226317F38();
    v12[1] = v10;
    sub_226317FE8();
    sub_226317F38();
    return v13;
  }
  return v9;
}

uint64_t _s17AdPlatformsCommon11EventSourceO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226317ED8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EventSource();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v22 - v12);
  uint64_t v14 = sub_226313708((uint64_t *)&unk_26812C710);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_226317694(a1, (uint64_t)v17);
  sub_226317694(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_226317694((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v19 = *v13 == *(void *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_226317CC8((uint64_t)v17);
    char v19 = 0;
    return v19 & 1;
  }
  sub_226317694((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = sub_226317E98();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_2263179F0((uint64_t)v17);
  return v19 & 1;
}

uint64_t type metadata accessor for EventSource()
{
  uint64_t result = qword_26812C700;
  if (!qword_26812C700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226317694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_226317ED8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for EventSource(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_226317ED8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for EventSource(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_226317ED8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for EventSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2263179F0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_226317ED8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2263179F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for EventSource(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_226317ED8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for EventSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2263179F0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_226317ED8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for EventSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_226317C20()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_226317C30()
{
  uint64_t result = sub_226317ED8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_226317CC8(uint64_t a1)
{
  uint64_t v2 = sub_226313708((uint64_t *)&unk_26812C710);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

AdPlatformsCommon::EventSourceID __swiftcall EventSourceID.init(integerLiteral:)(AdPlatformsCommon::EventSourceID integerLiteral)
{
  v1->value = integerLiteral.value;
  return integerLiteral;
}

BOOL static EventSourceID.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t EventSourceID.value.getter()
{
  return *(void *)v0;
}

void *sub_226317D4C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t EventSourceID.debugDescription.getter()
{
  return sub_226318018();
}

uint64_t sub_226317D9C()
{
  return MEMORY[0x263F8D748];
}

uint64_t sub_226317DA8()
{
  return sub_226318018();
}

ValueMetadata *type metadata accessor for EventSourceID()
{
  return &type metadata for EventSourceID;
}

uint64_t DeadEndPipe.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeadEndPipe.deinit()
{
  return v0;
}

uint64_t DeadEndPipe.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t method lookup function for DeadEndPipe(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeadEndPipe);
}

uint64_t dispatch thunk of DeadEndPipe.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DeadEndPipe.deliverEvent(in:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_226317E78()
{
  return MEMORY[0x270F08B60]();
}

uint64_t sub_226317E88()
{
  return MEMORY[0x270F08B80]();
}

uint64_t sub_226317E98()
{
  return MEMORY[0x270F08B88]();
}

uint64_t sub_226317EA8()
{
  return MEMORY[0x270F08B90]();
}

uint64_t sub_226317EB8()
{
  return MEMORY[0x270F08B98]();
}

uint64_t sub_226317EC8()
{
  return MEMORY[0x270F08BA0]();
}

uint64_t sub_226317ED8()
{
  return MEMORY[0x270F08BA8]();
}

uint64_t sub_226317EE8()
{
  return MEMORY[0x270F08BB0]();
}

uint64_t sub_226317EF8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226317F08()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226317F18()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_226317F28()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_226317F38()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_226317F48()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226317F58()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_226317F68()
{
  return MEMORY[0x270F08BB8]();
}

uint64_t sub_226317F78()
{
  return MEMORY[0x270F08BC0]();
}

uint64_t sub_226317F88()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_226317F98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_226317FA8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_226317FB8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_226317FC8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226317FD8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226317FE8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_226317FF8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_226318008()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_226318018()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_226318028()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_226318038()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226318048()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226318058()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x270F08BD8]();
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x270F08BE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}
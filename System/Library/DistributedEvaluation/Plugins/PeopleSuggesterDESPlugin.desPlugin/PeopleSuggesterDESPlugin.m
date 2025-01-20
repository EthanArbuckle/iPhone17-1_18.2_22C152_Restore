void sub_10E8(id a1)
{
  os_log_t v1;
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = os_log_create("com.apple.PeopleSuggester", "general");
  v2 = (void *)qword_1DE98;
  qword_1DE98 = (uint64_t)v1;

  if (!qword_1DE98)
  {
    v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E800(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_11A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "messagePinning");
  v2 = (void *)qword_1DEA8;
  qword_1DEA8 = (uint64_t)v1;

  if (!qword_1DEA8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E83C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1258(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "family");
  v2 = (void *)qword_1DEB8;
  qword_1DEB8 = (uint64_t)v1;

  if (!qword_1DEB8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E878(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1310(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "heuristic");
  v2 = (void *)qword_1DEC8;
  qword_1DEC8 = (uint64_t)v1;

  if (!qword_1DEC8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E8B4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_13C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "CoreBehavior");
  v2 = (void *)qword_1DED8;
  qword_1DED8 = (uint64_t)v1;

  if (!qword_1DED8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E8F0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1480(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "Knn");
  v2 = (void *)qword_1DEE8;
  qword_1DEE8 = (uint64_t)v1;

  if (!qword_1DEE8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E92C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1538(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "feedback");
  v2 = (void *)qword_1DEF8;
  qword_1DEF8 = (uint64_t)v1;

  if (!qword_1DEF8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E968(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_15F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "shareextension");
  v2 = (void *)qword_1DF08;
  qword_1DF08 = (uint64_t)v1;

  if (!qword_1DF08)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E9A4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_16A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "mediaanalysis");
  v2 = (void *)qword_1DF10;
  qword_1DF10 = (uint64_t)v1;

  if (!qword_1DF10)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_E9E0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1760(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "contactEmbedding");
  v2 = (void *)qword_1DF28;
  qword_1DF28 = (uint64_t)v1;

  if (!qword_1DF28)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_EA1C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1818(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "featureGeneration");
  v2 = (void *)qword_1DF38;
  qword_1DF38 = (uint64_t)v1;

  if (!qword_1DF38)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_EA58(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_18D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "PeopleSuggesterRewrite");
  v2 = (void *)qword_1DF48;
  qword_1DF48 = (uint64_t)v1;

  if (!qword_1DF48)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_EA94(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1988(id a1)
{
  qword_1DF58 = (uint64_t)os_log_create("com.apple.PeopleSuggester", "signpost");

  _objc_release_x1();
}

void sub_19CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_20E0()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DF70;
  uint64_t v6 = qword_1DF70;
  if (!qword_1DF70)
  {
    sub_44F8();
    v4[3] = (uint64_t)objc_getClass("MLParameterKey");
    qword_1DF70 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_21D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2400()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DF78;
  uint64_t v6 = qword_1DF78;
  if (!qword_1DF78)
  {
    sub_44F8();
    v4[3] = (uint64_t)objc_getClass("MLModel");
    qword_1DF78 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_24F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2D6C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DF80;
  uint64_t v6 = qword_1DF80;
  if (!qword_1DF80)
  {
    sub_44F8();
    v4[3] = (uint64_t)objc_getClass("MLDictionaryFeatureProvider");
    qword_1DF80 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_2E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_307C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DF88;
  uint64_t v6 = qword_1DF88;
  if (!qword_1DF88)
  {
    sub_44F8();
    v4[3] = (uint64_t)objc_getClass("MLArrayBatchProvider");
    qword_1DF88 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_316C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_366C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DF90;
  uint64_t v6 = qword_1DF90;
  if (!qword_1DF90)
  {
    sub_44F8();
    v4[3] = (uint64_t)objc_getClass("MLMultiArray");
    qword_1DF90 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_375C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_44A8(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLModelConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_44F8()
{
  if (!qword_1DF68) {
    qword_1DF68 = _sl_dlopen();
  }
}

uint64_t sub_45C8()
{
  uint64_t result = _sl_dlopen();
  qword_1DF68 = result;
  return result;
}

Class sub_463C(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLParameterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_468C(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_46DC(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLDictionaryFeatureProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_472C(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLArrayBatchProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_477C(uint64_t a1)
{
  sub_44F8();
  Class result = objc_getClass("MLMultiArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DF90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_47E4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_4810(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_6F6C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

id sub_6F8C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DFA0;
  uint64_t v6 = qword_1DFA0;
  if (!qword_1DFA0)
  {
    sub_D58C();
    v4[3] = (uint64_t)objc_getClass("MLArrayBatchProvider");
    qword_1DFA0 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_707C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7094()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DFB0;
  uint64_t v6 = qword_1DFB0;
  if (!qword_1DFB0)
  {
    sub_D720();
    v4[3] = (uint64_t)objc_getClass("ODCurareReportFillerModelEvaluation");
    qword_1DFB0 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_7184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_76C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_8AD4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1DFE0;
  uint64_t v6 = qword_1DFE0;
  if (!qword_1DFE0)
  {
    sub_D720();
    v4[3] = (uint64_t)objc_getClass("ODCurareCandidateModel");
    qword_1DFE0 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_8BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_93BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9E94()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1E018;
  uint64_t v6 = qword_1E018;
  if (!qword_1E018)
  {
    sub_D58C();
    v4[3] = (uint64_t)objc_getClass("MLParameterKey");
    qword_1E018 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_9F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

id sub_BBAC()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_1E030;
  uint64_t v6 = qword_1E030;
  if (!qword_1E030)
  {
    sub_D58C();
    v4[3] = (uint64_t)objc_getClass("MLDictionaryFeatureProvider");
    qword_1E030 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_C35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_C3AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C3BC(uint64_t a1)
{
}

void sub_C3C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 task];
  uint64_t v5 = [v4 error];

  if (v5)
  {
    uint64_t v6 = (void *)qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F344(v6, v3);
    }
  }
  if (((*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))() & 1) == 0)
  {
    uint64_t v7 = [v3 task];
    [v7 cancel];

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_C484(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }
  uint64_t v6 = [v3 model];
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  unsigned __int8 v9 = [v6 writeToURL:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (*(void *)(*(void *)(a1[5] + 8) + 40) || (v9 & 1) == 0)
  {
    uint64_t v10 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F400((uint64_t)(a1 + 5), v10, v11, v12, v13, v14, v15, v16);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_D138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

Class sub_D53C(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLArrayBatchProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_D58C()
{
  if (!qword_1DFA8) {
    qword_1DFA8 = _sl_dlopen();
  }
}

uint64_t sub_D65C()
{
  uint64_t result = _sl_dlopen();
  qword_1DFA8 = result;
  return result;
}

Class sub_D6D0(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerModelEvaluation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_D720()
{
  if (!qword_1DFB8) {
    qword_1DFB8 = _sl_dlopen();
  }
}

uint64_t sub_D7F0()
{
  uint64_t result = _sl_dlopen();
  qword_1DFB8 = result;
  return result;
}

Class sub_D864(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerModelEvaluationSummary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_D8B4(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerModelHyperparameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_D904(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerModelInformation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_D954(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareModelInformation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_D9A4(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareCandidateModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_D9F4(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareDataCachePruningPolicyObject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DA44(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareEvaluationAndReportingModule");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DA94(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareModelSelectionParameter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1DFF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DAE4(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareModelSelectionPolicy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E000 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DB34(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurarePersonalizationPolicy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DB84(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLModelConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DBD4(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLParameterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E018 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DC24(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DC74(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLFeatureValue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E028 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DCC4(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLDictionaryFeatureProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DD14(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLMultiArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DD64(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLUpdateProgressHandlers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E040 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DDB4(uint64_t a1)
{
  sub_D58C();
  Class result = objc_getClass("MLUpdateTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E048 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DE04(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerDataSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E050 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DE54(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerDataSetSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E058 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_DEA4(uint64_t a1)
{
  sub_D720();
  Class result = objc_getClass("ODCurareReportFillerDataSetStats");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E060 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _PSUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3)
{
  uint64_t v4 = a3;
  os_log_t v5 = os_log_create("com.apple.PeopleSuggester.unarchiver", "general");
  uint64_t v6 = (void *)qword_1E068;
  qword_1E068 = (uint64_t)v5;

  uint64_t v7 = 0;
  if (!a1 || !v4) {
    goto LABEL_11;
  }
  if (!archive_read_new())
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if (archive_read_support_format_zip())
  {
    uint64_t v8 = (void *)qword_1E068;
    if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v9 = v8;
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = archive_error_string();
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "_PSUnarchiver: archive_read unable to set supported formats - %{public}s.", buf, 0xCu);
    }
LABEL_7:
    if (archive_read_free())
    {
      uint64_t v10 = (void *)qword_1E068;
      if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
        sub_F478(v10);
      }
    }
    goto LABEL_10;
  }
  int support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20 && support_filter_all)
  {
    uint64_t v13 = (void *)qword_1E068;
    if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
      sub_FB30(v13);
    }
    goto LABEL_7;
  }
  if (!archive_read_open_memory())
  {
    uint64_t v15 = v4;
    uint64_t v16 = +[NSFileManager defaultManager];
    NSFileAttributeKey v71 = NSFilePosixPermissions;
    v72 = &off_190E8;
    v17 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    v67[0] = 0;
    unsigned __int8 v18 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:0 attributes:v17 error:v67];
    id v19 = v67[0];

    if (v18) {
      goto LABEL_22;
    }
    v21 = [v19 domain];
    if ([v21 isEqualToString:NSCocoaErrorDomain])
    {
      v22 = (char *)[v19 code];

      if (v22 == &stru_1F8.sectname[12])
      {
LABEL_22:

        if (archive_write_disk_new())
        {
          if (archive_write_disk_set_standard_lookup())
          {
            v20 = (void *)qword_1E068;
            if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
              sub_F9AC(v20);
            }
          }
          else
          {
            if (!archive_write_disk_set_options())
            {
              v27 = [(NSURL *)v15 path];
              if (v27)
              {
                id v29 = v27;
                v30 = realpath_DARWIN_EXTSN((const char *)[v29 fileSystemRepresentation], 0);
                if (v30)
                {
                  v31 = v30;
                  id v32 = [objc_alloc((Class)NSString) initWithUTF8String:v30];
                  v33 = v29;
                  id v29 = v32;

                  free(v31);
                }
                else
                {
                  v34 = (void *)qword_1E068;
                  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                    sub_F880((uint64_t)v29, v34);
                  }
                }
              }
              else
              {
                id v29 = 0;
              }
              *(void *)&long long v28 = 134218240;
              long long v65 = v28;
              v66 = v29;
              while (1)
              {
                int next_header = archive_read_next_header();
                if (next_header)
                {
                  if (next_header == 1)
                  {
                    uint64_t v7 = 1;
                    goto LABEL_87;
                  }
                  v53 = (void *)qword_1E068;
                  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                    sub_F678(v53);
                  }
                  goto LABEL_86;
                }
                int v36 = archive_entry_filetype();
                uint64_t v38 = archive_entry_pathname_utf8();
                if (!v38)
                {
                  v54 = qword_1E068;
                  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                    sub_F6F8(v54);
                  }
                  goto LABEL_85;
                }
                v39 = (const char *)v38;
                uint64_t v40 = 0;
                do
                  int v41 = *(unsigned __int8 *)(v38 + v40++);
                while (v41 == 47);
                uint64_t v42 = v40 - 1;
                if (v40 != 1)
                {
                  v43 = qword_1E068;
                  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR))
                  {
                    size_t v49 = strlen(v39);
                    *(_DWORD *)buf = v65;
                    *(void *)&uint8_t buf[4] = v42;
                    __int16 v69 = 2048;
                    size_t v70 = v49;
                    _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "_PSUnarchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
                  }
                }
                id v44 = [objc_alloc((Class)NSString) initWithUTF8String:&v39[v42]];
                id v45 = [v44 length];
                if (!v45 && v36 != 0x4000)
                {
                  v55 = qword_1E068;
                  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                    sub_F83C(v55);
                  }

LABEL_85:
                  goto LABEL_86;
                }
                v46 = objc_msgSend(v66, "stringByAppendingPathComponent:", v44, v65);

                id v47 = v46;
                [v47 fileSystemRepresentation];
                archive_entry_update_pathname_utf8();

                archive_entry_perm();
                archive_entry_set_perm();
                if (v45)
                {
                  if (archive_write_header())
                  {
                    v58 = (void *)qword_1E068;
                    if (!os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_INFO)) {
                      goto LABEL_86;
                    }
                    v59 = v58;
                    uint64_t v60 = archive_error_string();
                    *(_DWORD *)buf = 136446210;
                    *(void *)&uint8_t buf[4] = v60;
                    v61 = "_PSUnarchiver: archive_write_header failed - %{public}s.";
                    goto LABEL_99;
                  }
                  if (!archive_entry_size_is_set() || archive_entry_size() >= 1)
                  {
                    while (1)
                    {
                      v67[2] = 0;
                      *(void *)buf = 0;
                      v67[1] = 0;
                      int data_block = archive_read_data_block();
                      if (data_block) {
                        break;
                      }
                      if (archive_write_data_block() < 0)
                      {
                        v51 = (void *)qword_1E068;
                        if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                          sub_F7BC(v51);
                        }
                        goto LABEL_86;
                      }
                    }
                    if (data_block == 1) {
                      goto LABEL_70;
                    }
                    v50 = (void *)qword_1E068;
                    if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                      sub_F73C(v50);
                    }
                    goto LABEL_86;
                  }
LABEL_70:
                  if (archive_write_finish_entry()) {
                    break;
                  }
                }
              }
              v62 = (void *)qword_1E068;
              if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_INFO))
              {
                v59 = v62;
                uint64_t v64 = archive_error_string();
                *(_DWORD *)buf = 136446210;
                *(void *)&uint8_t buf[4] = v64;
                v61 = "_PSUnarchiver: archive_write_finish_entry failed - %{public}s.";
LABEL_99:
                _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, v61, buf, 0xCu);
              }
LABEL_86:
              uint64_t v7 = 0;
LABEL_87:
              if (archive_write_close())
              {
                v56 = (void *)qword_1E068;
                if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                  sub_F5F8(v56);
                }
                uint64_t v7 = 0;
              }
              if (archive_write_free())
              {
                v57 = (void *)qword_1E068;
                if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
                  sub_F578(v57);
                }
              }

              goto LABEL_40;
            }
            v23 = (void *)qword_1E068;
            if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
              sub_F92C(v23);
            }
          }
          if (archive_write_free())
          {
            v24 = (void *)qword_1E068;
            if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
              sub_F578(v24);
            }
          }
        }
LABEL_39:
        uint64_t v7 = 0;
LABEL_40:

        if (archive_read_close())
        {
          v25 = (void *)qword_1E068;
          if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
            sub_F4F8(v25);
          }
        }
        goto LABEL_43;
      }
    }
    else
    {
    }
    if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
      sub_FA2C();
    }

    goto LABEL_39;
  }
  uint64_t v14 = (void *)qword_1E068;
  if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
    sub_FAB0(v14);
  }
  uint64_t v7 = 0;
LABEL_43:
  if (archive_read_free())
  {
    v26 = (void *)qword_1E068;
    if (os_log_type_enabled((os_log_t)qword_1E068, OS_LOG_TYPE_ERROR)) {
      sub_F478(v26);
    }
  }
LABEL_11:

  return v7;
}

void sub_E72C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_E74C()
{
  return archive_error_string();
}

void sub_E800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E8B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EA58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EAD0()
{
  sub_47CC();
  sub_47E4(&dword_0, v0, v1, "Failed to load adaptable model config with path:%@, with error：%@");
}

void sub_EB38()
{
  sub_47CC();
  sub_47E4(&dword_0, v0, v1, "ML model load: failed to load ml model with path:%@, with error：%@");
}

void sub_EBA0()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "predictWithMLModel - predictionFromFeatures failure", v2, v3, v4, v5, v6);
}

void sub_EBD4()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "predictWithMLModel - feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
}

void sub_EC08()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "batchPredictWithMLModel - predictionsFromBatch failure", v2, v3, v4, v5, v6);
}

void sub_EC3C()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "batchPredictWithMLModel - feature extraction MLArrayBatchProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
}

void sub_EC70()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "_PSRuleRankingMLModel - People Suggester ML model, predictionsFromBatch failure", v2, v3, v4, v5, v6);
}

void sub_ECA4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "_PSRuleRankingMLModel - People Suggester feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", buf, 2u);
}

void sub_ECE4()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "batchPredictWithAdaptedMLModel - MLMultiArray creation failure", v2, v3, v4, v5, v6);
}

void sub_ED18()
{
  sub_47CC();
  sub_47E4(&dword_0, v0, v1, "Remove file failed at path:%@, with error：%@");
}

void sub_ED80()
{
  sub_47CC();
  sub_47E4(&dword_0, v0, v1, "Failed to compile ml model with path:%@, with error：%@");
}

void sub_EDE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EE58()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Zipped Adaptable ML model copy attempted with null path", v2, v3, v4, v5, v6);
}

void sub_EE8C()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Zipped Adaptable ML model copy failed", v2, v3, v4, v5, v6);
}

void sub_EEC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EF2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EF98(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_F004()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Candidate model in evaluateWithModel had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
}

void sub_F038()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Candidate model in personalize had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
}

void sub_F06C()
{
  sub_DEF4();
  sub_4810(&dword_0, v0, v1, "Failed to get selected model with error: %@", v2, v3, v4, v5, v6);
}

void sub_F0D4()
{
  sub_DEF4();
  sub_4810(&dword_0, v0, v1, "Failed to run task with error: %@", v2, v3, v4, v5, v6);
}

void sub_F13C()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "No model is loaded for adaptation", v2, v3, v4, v5, v6);
}

void sub_F170()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "While cloning adaptable model, removing existing file failed", v2, v3, v4, v5, v6);
}

void sub_F1A4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 intermediateCompiledModelURL];
  uint64_t v7 = [v6 absoluteString];
  sub_DEF4();
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Adaptable ML model at path %@ load failed with error：%@", v8, 0x16u);
}

void sub_F274()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Adaptable ML model cloning to intermediate ML model is unsuccessful", v2, v3, v4, v5, v6);
}

void sub_F2A8()
{
  sub_4804();
  sub_19CC(&dword_0, v0, v1, "Deployed adaptable ML model cannot be found, therefore adaptation is halted", v2, v3, v4, v5, v6);
}

void sub_F2DC()
{
  sub_DEF4();
  sub_4810(&dword_0, v0, v1, "knowledgeStore executeQuery failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_F344(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 task];
  uint64_t v5 = [v4 error];
  sub_DEF4();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "context.task.error: %@", v6, 0xCu);
}

void sub_F400(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_F478(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: unable to free archive_read (leaking) - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F4F8(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: unable to close archive_read - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F578(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: unable to free archive_write_disk (leaking) - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F5F8(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: unable to close archive_write_disk - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F678(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_read_next_header failed - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F6F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "_PSUnarchiver: archive_entry with no path encountered.", v1, 2u);
}

void sub_F73C(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_read_data_block failed - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F7BC(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_write_data_block failed - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F83C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "_PSUnarchiver: archive_entry with no path after sanitization encountered.", v1, 2u);
}

void sub_F880(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "_PSUnarchiver: unable to resolve physical path for destination path %@ - %s.", (uint8_t *)&v6, 0x16u);
}

void sub_F92C(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_write_disk unable to set options - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_F9AC(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_write_disk unable to set lookup functions - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_FA2C()
{
  sub_DEF4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "_PSUnarchiver: failed to create directory at %@ - %@.", v2, 0x16u);
}

void sub_FAB0(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: unable to open archive_read - %{public}s.", v5, v6, v7, v8, v9);
}

void sub_FB30(void *a1)
{
  id v2 = a1;
  sub_E74C();
  sub_DEF4();
  sub_E72C(&dword_0, v3, v4, "_PSUnarchiver: archive_read unable to set supported compression formats - %{public}s.", v5, v6, v7, v8, v9);
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return _archive_entry_filetype();
}

uint64_t archive_entry_pathname_utf8()
{
  return _archive_entry_pathname_utf8();
}

uint64_t archive_entry_perm()
{
  return _archive_entry_perm();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_entry_size()
{
  return _archive_entry_size();
}

uint64_t archive_entry_size_is_set()
{
  return _archive_entry_size_is_set();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return _archive_entry_update_pathname_utf8();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_memory()
{
  return _archive_read_open_memory();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_zip()
{
  return _archive_read_support_format_zip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

{
}

{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_CDModelDataStreamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 CDModelDataStreamIdentifier];
}

id objc_msgSend_CDQuery(void *a1, const char *a2, ...)
{
  return [a1 CDQuery];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_adaptableModelConfiguration(void *a1, const char *a2, ...)
{
  return [a1 adaptableModelConfiguration];
}

id objc_msgSend_adaptableModelDeployPath(void *a1, const char *a2, ...)
{
  return [a1 adaptableModelDeployPath];
}

id objc_msgSend_adaptationStrategy(void *a1, const char *a2, ...)
{
  return [a1 adaptationStrategy];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_avg(void *a1, const char *a2, ...)
{
  return [a1 avg];
}

id objc_msgSend_behavioralRuleFeaturesStream(void *a1, const char *a2, ...)
{
  return [a1 behavioralRuleFeaturesStream];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calculateStats(void *a1, const char *a2, ...)
{
  return [a1 calculateStats];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_curareEvaluationAndReporting(void *a1, const char *a2, ...)
{
  return [a1 curareEvaluationAndReporting];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_evaluateIsInvokedOnce(void *a1, const char *a2, ...)
{
  return [a1 evaluateIsInvokedOnce];
}

id objc_msgSend_featureDict(void *a1, const char *a2, ...)
{
  return [a1 featureDict];
}

id objc_msgSend_featureNameDict(void *a1, const char *a2, ...)
{
  return [a1 featureNameDict];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_generalChannel(void *a1, const char *a2, ...)
{
  return [a1 generalChannel];
}

id objc_msgSend_generateCandidateModels(void *a1, const char *a2, ...)
{
  return [a1 generateCandidateModels];
}

id objc_msgSend_getDeployedAdaptableCompiledMLModelPath(void *a1, const char *a2, ...)
{
  return [a1 getDeployedAdaptableCompiledMLModelPath];
}

id objc_msgSend_getDeployedCompiledMLModelPath(void *a1, const char *a2, ...)
{
  return [a1 getDeployedCompiledMLModelPath];
}

id objc_msgSend_getIntermediateAdaptableCompiledMLModel(void *a1, const char *a2, ...)
{
  return [a1 getIntermediateAdaptableCompiledMLModel];
}

id objc_msgSend_getTrialCompiledAdaptableMLModelPath(void *a1, const char *a2, ...)
{
  return [a1 getTrialCompiledAdaptableMLModelPath];
}

id objc_msgSend_getTrialCompiledMLModelPath(void *a1, const char *a2, ...)
{
  return [a1 getTrialCompiledMLModelPath];
}

id objc_msgSend_getZippedDefaultAdaptableModelPath(void *a1, const char *a2, ...)
{
  return [a1 getZippedDefaultAdaptableModelPath];
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return [a1 int64Value];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intermediateCompiledModelURL(void *a1, const char *a2, ...)
{
  return [a1 intermediateCompiledModelURL];
}

id objc_msgSend_isDefaultModel(void *a1, const char *a2, ...)
{
  return [a1 isDefaultModel];
}

id objc_msgSend_isPersonalizableModel(void *a1, const char *a2, ...)
{
  return [a1 isPersonalizableModel];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_learningRate(void *a1, const char *a2, ...)
{
  return [a1 learningRate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_list(void *a1, const char *a2, ...)
{
  return [a1 list];
}

id objc_msgSend_loadDefaultModel(void *a1, const char *a2, ...)
{
  return [a1 loadDefaultModel];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return [a1 max];
}

id objc_msgSend_maxDepth(void *a1, const char *a2, ...)
{
  return [a1 maxDepth];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return [a1 min];
}

id objc_msgSend_minChildWeight(void *a1, const char *a2, ...)
{
  return [a1 minChildWeight];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modelConfiguration(void *a1, const char *a2, ...)
{
  return [a1 modelConfiguration];
}

id objc_msgSend_modelTag(void *a1, const char *a2, ...)
{
  return [a1 modelTag];
}

id objc_msgSend_modelTagToCandidateModel(void *a1, const char *a2, ...)
{
  return [a1 modelTagToCandidateModel];
}

id objc_msgSend_modelTagToHyperparameters(void *a1, const char *a2, ...)
{
  return [a1 modelTagToHyperparameters];
}

id objc_msgSend_modelURL(void *a1, const char *a2, ...)
{
  return [a1 modelURL];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numClasses(void *a1, const char *a2, ...)
{
  return [a1 numClasses];
}

id objc_msgSend_numTrees(void *a1, const char *a2, ...)
{
  return [a1 numTrees];
}

id objc_msgSend_numberOfUserSamples(void *a1, const char *a2, ...)
{
  return [a1 numberOfUserSamples];
}

id objc_msgSend_objective(void *a1, const char *a2, ...)
{
  return [a1 objective];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_peopleDirectory(void *a1, const char *a2, ...)
{
  return [a1 peopleDirectory];
}

id objc_msgSend_percentiles(void *a1, const char *a2, ...)
{
  return [a1 percentiles];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_predicateFormat(void *a1, const char *a2, ...)
{
  return [a1 predicateFormat];
}

id objc_msgSend_psAdaptationDefaults(void *a1, const char *a2, ...)
{
  return [a1 psAdaptationDefaults];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_recipientUniqueID(void *a1, const char *a2, ...)
{
  return [a1 recipientUniqueID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_ruleLabel(void *a1, const char *a2, ...)
{
  return [a1 ruleLabel];
}

id objc_msgSend_ruleScore(void *a1, const char *a2, ...)
{
  return [a1 ruleScore];
}

id objc_msgSend_selectedFeaturesConfig(void *a1, const char *a2, ...)
{
  return [a1 selectedFeaturesConfig];
}

id objc_msgSend_setParametersFromRecipe(void *a1, const char *a2, ...)
{
  return [a1 setParametersFromRecipe];
}

id objc_msgSend_shuffle(void *a1, const char *a2, ...)
{
  return [a1 shuffle];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_stdev(void *a1, const char *a2, ...)
{
  return [a1 stdev];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_topN(void *a1, const char *a2, ...)
{
  return [a1 topN];
}

id objc_msgSend_updateType(void *a1, const char *a2, ...)
{
  return [a1 updateType];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
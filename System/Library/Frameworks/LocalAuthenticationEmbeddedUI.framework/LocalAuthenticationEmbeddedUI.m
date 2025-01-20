void sub_23F458628(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_23F458A68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id LA_LOG()
{
  if (LA_LOG_once != -1) {
    dispatch_once(&LA_LOG_once, &__block_literal_global_1);
  }
  v0 = (void *)LA_LOG_log;

  return v0;
}

void sub_23F458CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F459FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

void sub_23F45A374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCDPStateControllerClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCDPStateControllerClass_softClass;
  uint64_t v7 = getCDPStateControllerClass_softClass;
  if (!getCDPStateControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCDPStateControllerClass_block_invoke;
    v3[3] = &unk_26506EBB0;
    v3[4] = &v4;
    __getCDPStateControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23F45A8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CoreCDPLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26506EBD0;
    uint64_t v6 = 0;
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!CoreCDPLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CDPStateController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getCDPStateControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCDPStateControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreCDPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_23F45C27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F45C630(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F45D594(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F45D680(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F45DB10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id LA_LOG_0()
{
  if (LA_LOG_once_0 != -1) {
    dispatch_once(&LA_LOG_once_0, &__block_literal_global_141);
  }
  v0 = (void *)LA_LOG_log_0;

  return v0;
}

void sub_23F45E2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F45E5C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_23F45FCDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_23F45FFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_block_invoke()
{
  LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt = (uint64_t)objc_alloc_init(MEMORY[0x263F08A30]);

  return MEMORY[0x270F9A758]();
}

void sub_23F4620FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F462468(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F462E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F463914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46535C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F465450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F46562C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F465720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F465930(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23F465A30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F466E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F4670B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F469E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromLAPSPasscodeTypeIdentifier(unint64_t a1)
{
  if (a1 > 4) {
    return @"LAPSPasscodeTypeIdentifierUnknown";
  }
  else {
    return off_26506F398[a1];
  }
}

id LAViewControllerForPresentationContext(void *a1)
{
  id v1 = a1;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v1)
  {
    uint64_t v2 = [v1 rootViewController];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F82E88] _applicationKeyWindow];
    uint64_t v2 = [v3 rootViewController];
  }

  return v2;
}

void sub_23F46ADDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46B220(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F46C0F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46D8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46DC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46DF54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F46E080(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F46E1C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F46E320(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F46E508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F46E6A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F46E808(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F46EBE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F46ED48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_23F46F868()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_bridgeObjectRetain();
  id v1 = (void *)sub_23F474588();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithOptions_configuration_, v1, 0);

  return v2;
}

id sub_23F46F980(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_bridgeObjectRetain();
  id v4 = a2;
  long long v5 = (void *)sub_23F474588();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithOptions_configuration_, v5, v4);

  return v6;
}

uint64_t sub_23F46FAC0()
{
  return sub_23F4700DC(MEMORY[0x263F52510]);
}

void sub_23F46FACC(uint64_t a1)
{
  id v2 = v1;
  uint64_t v43 = a1;
  uint64_t v3 = sub_23F474518();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  long long v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23F4744F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v37 - v11;
  uint64_t v13 = sub_23F474418();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(v2, sel_viewModel);
  if (!v17)
  {
LABEL_4:
    v40 = v10;
    id v18 = objc_msgSend(v2, sel_presentationContext);

    if (v18)
    {
      uint64_t v38 = v7;
      uint64_t v39 = v6;
      objc_msgSend(v2, sel_clean);
      sub_23F474408();
      uint64_t v45 = 0;
      unint64_t v46 = 0xE000000000000000;
      sub_23F474658();
      id v19 = objc_msgSend(v2, sel_description);
      uint64_t v20 = sub_23F4745D8();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();

      uint64_t v45 = v20;
      unint64_t v46 = v22;
      sub_23F474608();
      uint64_t v44 = sub_23F474508();
      sub_23F4746A8();
      sub_23F474608();
      swift_bridgeObjectRelease();
      sub_23F4743E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      id v23 = objc_msgSend(v2, sel_configuration);
      id v24 = objc_msgSend(v23, sel_countdownPrimaryActionTitle);

      if (v24)
      {
        sub_23F4745D8();
      }
      uint64_t v31 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v5, v43, v42);
      sub_23F4744E8();
      type metadata accessor for LAContextProvider();
      sub_23F473A48();
      id v32 = objc_msgSend(v2, sel_internalOptions);
      sub_23F474598();

      uint64_t v33 = v39;
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v40, v12, v39);
      id v34 = objc_allocWithZone((Class)sub_23F474488());
      v35 = (void *)sub_23F474448();
      sub_23F470868((uint64_t)v35);
      objc_msgSend(v2, sel_setViewModel_, v35);
      id v36 = objc_msgSend(v2, sel_viewModel);
      if (v36)
      {
        objc_msgSend(v36, sel_start);

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v33);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v33);
      }
    }
    else
    {
      sub_23F474488();
      sub_23F470F14();
      v28 = (void *)swift_allocError();
      unsigned char *v29 = 0;
      v30 = (void *)sub_23F474478();

      sub_23F470F68(0, v30);
    }
    return;
  }
  if (objc_msgSend(v17, sel_isInvalidated))
  {
    swift_unknownObjectRelease();
    goto LABEL_4;
  }
  sub_23F474488();
  sub_23F470F14();
  v25 = (void *)swift_allocError();
  unsigned char *v26 = 1;
  v27 = (void *)sub_23F474478();

  sub_23F470F68(0, v27);

  swift_unknownObjectRelease();
}

uint64_t sub_23F4700D0()
{
  return sub_23F4700DC(MEMORY[0x263F52518]);
}

uint64_t sub_23F4700DC(unsigned int *a1)
{
  uint64_t v2 = sub_23F474518();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *a1, v2);
  sub_23F46FACC((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_23F4701D4(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = sub_23F474518();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *a3, v5);
  id v9 = a1;
  sub_23F46FACC((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23F4702D0()
{
  id v1 = v0;
  uint64_t v2 = sub_23F474418();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v0, sel_viewModel);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)sub_23F4745A8();
    objc_msgSend(v7, sel_stopWithReason_invalidate_, v8, 1);

    swift_unknownObjectRelease();
  }
  objc_msgSend(v1, sel_clean);
  sub_23F474408();
  uint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  sub_23F474658();
  id v9 = objc_msgSend(v1, sel_description);
  uint64_t v10 = sub_23F4745D8();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();

  uint64_t v15 = v10;
  unint64_t v16 = v12;
  sub_23F474608();
  v14[1] = objc_msgSend(v1, sel_viewModel);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E050);
  sub_23F474648();
  swift_unknownObjectRelease();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F4743E8();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_23F470594()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_subscriptions);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_23F474628();

    uint64_t v5 = *(void *)(v4 + 16);
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
    uint64_t v5 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v5) {
      goto LABEL_9;
    }
  }
  uint64_t v6 = v4 + 32;
  do
  {
    sub_23F470698(v6, (uint64_t)v8);
    sub_23F474538();
    if (swift_dynamicCast())
    {
      sub_23F474528();
      swift_release();
    }
    v6 += 32;
    --v5;
  }
  while (v5);
LABEL_9:
  swift_bridgeObjectRelease();
  return objc_msgSend(v1, sel_setSubscriptions_, 0);
}

uint64_t sub_23F470698(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL sub_23F47073C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23F470754()
{
  return sub_23F474728();
}

uint64_t sub_23F47079C()
{
  return sub_23F474718();
}

uint64_t sub_23F4707C8()
{
  return sub_23F474728();
}

unint64_t sub_23F47080C()
{
  if (*v0) {
    return 0xD000000000000054;
  }
  else {
    return 0xD00000000000004ELL;
  }
}

void sub_23F470868(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D0);
  MEMORY[0x270FA5388](v34);
  id v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D8);
  uint64_t v3 = MEMORY[0x270FA5388](v29);
  id v32 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v30 = (char *)&v29 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0E0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0E8);
  uint64_t v33 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0F0);
  uint64_t v37 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_23F474438();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0F8);
  uint64_t v38 = MEMORY[0x263EFDCF8];
  sub_23F472178(&qword_268C3E100, &qword_268C3E0F8);
  sub_23F47397C(&qword_268C3E108, MEMORY[0x263F524F8]);
  sub_23F474568();
  swift_release();
  sub_23F472178(&qword_268C3E110, &qword_268C3E0E0);
  sub_23F474548();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v14 = sub_23F474468();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = (uint64_t)v30;
  v15(v30, 1, 1, v14);
  uint64_t v17 = (uint64_t)v32;
  v15(v32, 1, 1, v14);
  uint64_t v18 = (uint64_t)&v2[*(int *)(v34 + 48)];
  sub_23F471354(v16, (uint64_t)v2);
  sub_23F471354(v17, v18);
  sub_23F472178(&qword_268C3E118, &qword_268C3E0E8);
  uint64_t v19 = v31;
  sub_23F474558();
  sub_23F4735F0((uint64_t)v2, &qword_268C3E0D0);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v19);
  uint64_t v20 = swift_allocObject();
  unint64_t v21 = v39;
  swift_unknownObjectWeakInit();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_23F4714E0;
  *(void *)(v22 + 24) = v20;
  sub_23F472178(&qword_268C3E120, &qword_268C3E0F0);
  uint64_t v23 = v35;
  uint64_t v24 = sub_23F474578();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v23);
  uint64_t v40 = sub_23F474458();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E128);
  sub_23F472178(&qword_268C3E130, &qword_268C3E128);
  uint64_t v25 = sub_23F474578();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E138);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_23F477D20;
  uint64_t v27 = sub_23F474538();
  *(void *)(v26 + 32) = v24;
  *(void *)(v26 + 88) = v27;
  *(void *)(v26 + 56) = v27;
  *(void *)(v26 + 64) = v25;
  swift_retain();
  swift_retain();
  v28 = (void *)sub_23F474618();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setSubscriptions_, v28);
  swift_release();
  swift_release();
}

unint64_t sub_23F470F14()
{
  unint64_t result = qword_268C3E2D0[0];
  if (!qword_268C3E2D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C3E2D0);
  }
  return result;
}

void sub_23F470F68(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23F474418();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F474408();
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_23F474658();
  id v10 = objc_msgSend(v2, sel_description);
  sub_23F4745D8();

  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F474608();
  id v13 = objc_msgSend(v3, sel_delegate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0B8);
  sub_23F474648();
  swift_unknownObjectRelease();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F474608();
  id v13 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0C0);
  sub_23F474648();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F474608();
  id v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0C8);
  sub_23F474648();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F4743E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!a1)
  {
    unint64_t v11 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v11 = (void *)sub_23F474588();
  if (a2) {
LABEL_3:
  }
    a2 = (void *)sub_23F4743A8();
LABEL_4:
  objc_msgSend(v3, sel_finishWithResult_error_, v11, a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_23F471284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23F474468();
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_23F471354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F4713BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D0);
  uint64_t v6 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(int *)(v6 + 56);
  uint64_t v10 = a3 + v9;
  uint64_t v11 = (uint64_t)&v8[v9];
  uint64_t v12 = a1 + v9;
  sub_23F47358C(a1, (uint64_t)v8, &qword_268C3E0D8);
  sub_23F47358C(v12, v11, &qword_268C3E0D8);
  sub_23F471354(v11, a3);
  sub_23F47358C(a2, v10, &qword_268C3E0D8);
  return sub_23F4735F0((uint64_t)v8, &qword_268C3E0D8);
}

uint64_t sub_23F4714A8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23F4714E0(void (*a1)(void, void), unsigned int (*a2)(uint64_t, uint64_t))
{
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x2455CBE40](v2 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_23F471550(a1, a2);
  }
}

void sub_23F471550(void (*a1)(void, void), unsigned int (*a2)(uint64_t, uint64_t))
{
  v83 = a1;
  v84 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v85 = (uint64_t)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23F4744C8();
  uint64_t v79 = *(void *)(v6 - 8);
  uint64_t v80 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v77 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v78 = (char *)&v72 - v10;
  MEMORY[0x270FA5388](v9);
  v75 = (char *)&v72 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v74 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v72 = (char *)&v72 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v73 = (char *)&v72 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v76 = (char *)&v72 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v82 = (uint64_t)&v72 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v72 - v23;
  uint64_t v25 = sub_23F474418();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  v28 = (char *)&v72 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F474408();
  uint64_t v86 = 0;
  unint64_t v87 = 0xE000000000000000;
  sub_23F474658();
  id v81 = v2;
  id v29 = objc_msgSend(v2, sel_description);
  uint64_t v30 = sub_23F4745D8();
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();

  uint64_t v86 = v30;
  unint64_t v87 = v32;
  sub_23F474608();
  uint64_t v33 = v83;
  sub_23F47358C((uint64_t)v83, (uint64_t)v24, &qword_268C3E0D8);
  sub_23F4745E8();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F474608();
  uint64_t v34 = v84;
  sub_23F47358C((uint64_t)v84, (uint64_t)v24, &qword_268C3E0D8);
  sub_23F4745E8();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F4743E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  uint64_t v35 = v85;
  uint64_t v36 = v85 + *(int *)(v4 + 56);
  sub_23F47358C((uint64_t)v33, v85, &qword_268C3E0D8);
  sub_23F47358C((uint64_t)v34, v36, &qword_268C3E0D8);
  uint64_t v37 = sub_23F474468();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  if (v39(v36, 1, v37) == 1) {
    goto LABEL_2;
  }
  uint64_t v42 = v82;
  sub_23F47358C(v36, v82, &qword_268C3E0D8);
  uint64_t v43 = *(unsigned int (**)(uint64_t, uint64_t))(v38 + 88);
  unsigned int v44 = v43(v42, v37);
  unsigned int v45 = v44;
  int v46 = *MEMORY[0x263F524D0];
  v84 = v43;
  if (v44 == v46)
  {
    v83 = *(void (**)(void, void))(v38 + 96);
    v83(v42, v37);
    uint64_t v47 = v42;
    uint64_t v48 = v85;
    if (v39(v85, 1, v37) == 1) {
      goto LABEL_29;
    }
    uint64_t v49 = v48;
    uint64_t v50 = (uint64_t)v76;
  }
  else if (v44 == *MEMORY[0x263F524E0])
  {
    v83 = *(void (**)(void, void))(v38 + 96);
    v83(v42, v37);
    uint64_t v47 = v42;
    uint64_t v48 = v85;
    if (v39(v85, 1, v37) == 1) {
      goto LABEL_29;
    }
    uint64_t v49 = v48;
    uint64_t v50 = (uint64_t)v74;
  }
  else if (v44 == *MEMORY[0x263F524F0])
  {
    v83 = *(void (**)(void, void))(v38 + 96);
    v83(v42, v37);
    uint64_t v47 = v42;
    uint64_t v48 = v85;
    if (v39(v85, 1, v37) == 1) {
      goto LABEL_29;
    }
    uint64_t v49 = v48;
    uint64_t v50 = (uint64_t)v73;
  }
  else
  {
    if (v44 != *MEMORY[0x263F524D8])
    {
      if (v44 == *MEMORY[0x263F524E8])
      {
        (*(void (**)(uint64_t, uint64_t))(v38 + 96))(v42, v37);
        v71 = *(void **)(v42 + 8);
        sub_23F470F68(*(void **)v42, v71);

        swift_bridgeObjectRelease();
        sub_23F4735F0(v36, &qword_268C3E0D8);
        uint64_t v41 = v85;
        uint64_t v40 = &qword_268C3E0D8;
        goto LABEL_3;
      }
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v37);
      uint64_t v35 = v85;
LABEL_2:
      uint64_t v40 = &qword_268C3E0D0;
      uint64_t v41 = v35;
LABEL_3:
      sub_23F4735F0(v41, v40);
      return;
    }
    v83 = *(void (**)(void, void))(v38 + 96);
    v83(v42, v37);
    uint64_t v47 = v42;
    uint64_t v48 = v85;
    if (v39(v85, 1, v37) == 1) {
      goto LABEL_29;
    }
    uint64_t v49 = v48;
    uint64_t v50 = (uint64_t)v72;
  }
  sub_23F47358C(v49, v50, &qword_268C3E0D8);
  if (v84(v50, v37) != v45)
  {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v50, v37);
    uint64_t v47 = v42;
LABEL_29:
    v64 = v78;
    uint64_t v63 = v79;
    uint64_t v65 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 32))(v78, v47, v80);
    sub_23F4735F0(v36, &qword_268C3E0D8);
    sub_23F4735F0(v48, &qword_268C3E0D8);
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v77, v64, v65);
    id v66 = objc_msgSend(v81, sel_viewModel);
    if (v66)
    {
      id v67 = v66;
      swift_getObjectType();
      if (!(swift_conformsToProtocol2() ? v67 : 0)) {
        swift_unknownObjectRelease();
      }
    }
    id v69 = objc_allocWithZone((Class)sub_23F4744B8());
    v70 = (void *)sub_23F474498();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v65);
    sub_23F472684(v70);

    return;
  }
  v83(v50, v37);
  uint64_t v51 = v79;
  v52 = v75;
  uint64_t v53 = v42;
  uint64_t v54 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 32))(v75, v53, v80);
  v55 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
  v55(v50, v54);
  sub_23F4735F0(v36, &qword_268C3E0D8);
  sub_23F4735F0(v85, &qword_268C3E0D8);
  id v56 = objc_msgSend(v81, sel_pageViewController);
  id v57 = objc_msgSend(v56, sel_viewControllers);

  if (!v57)
  {
LABEL_42:
    v55((uint64_t)v52, v54);
    return;
  }
  sub_23F47364C();
  unint64_t v58 = sub_23F474628();

  if (!(v58 >> 62))
  {
    uint64_t v59 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v59) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  uint64_t v59 = sub_23F474678();
  swift_bridgeObjectRelease();
  if (!v59)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_20:
  unint64_t v60 = v59 - 1;
  if (__OFSUB__(v59, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  if ((v58 & 0xC000000000000001) != 0)
  {
LABEL_44:
    id v61 = (id)MEMORY[0x2455CB5E0](v60, v58);
    goto LABEL_25;
  }
  if ((v60 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v60 < *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v61 = *(id *)(v58 + 8 * v60 + 32);
LABEL_25:
    v62 = v61;
    swift_bridgeObjectRelease();
    sub_23F4744B8();
    if (swift_dynamicCastClass()) {
      sub_23F4744A8();
    }

    goto LABEL_42;
  }
  __break(1u);
}

uint64_t sub_23F471FC0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23F471FF8(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E0D0);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_23F472044(uint64_t a1)
{
  uint64_t v2 = sub_23F4743D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x2455CBE40](a1 + 16);
  if (result)
  {
    uint64_t v7 = (void *)result;
    id v8 = objc_msgSend(self, sel_dtoLearnMoreLinkURL);
    sub_23F4743C8();

    sub_23F4721BC();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_23F472170()
{
  return sub_23F472044(v0);
}

uint64_t sub_23F472178(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_23F4721BC()
{
  uint64_t v1 = sub_23F474418();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F474408();
  uint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  sub_23F474658();
  id v5 = objc_msgSend(v0, sel_description);
  uint64_t v6 = sub_23F4745D8();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();

  uint64_t v15 = v6;
  unint64_t v16 = v8;
  sub_23F474608();
  sub_23F4743D8();
  sub_23F47397C(&qword_268C3E140, MEMORY[0x263F06EA8]);
  sub_23F4746A8();
  sub_23F474608();
  swift_bridgeObjectRelease();
  sub_23F4743F8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_sharedApplication);
  uint64_t v11 = (void *)sub_23F4743B8();
  LODWORD(v5) = objc_msgSend(v10, sel_canOpenURL_, v11);

  if (v5)
  {
    id v12 = objc_msgSend(v9, sel_sharedApplication);
    uint64_t v13 = (void *)sub_23F4743B8();
    sub_23F472DB4(MEMORY[0x263F8EE78]);
    type metadata accessor for OpenExternalURLOptionsKey();
    sub_23F47397C(&qword_268C3E148, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
    uint64_t v14 = (void *)sub_23F474588();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_openURL_options_completionHandler_, v13, v14, 0);
  }
}

uint64_t sub_23F4724A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23F4744F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  if (objc_msgSend(v1, sel_viewModel))
  {
    sub_23F474488();
    if (swift_dynamicCastClass())
    {
      sub_23F474428();
      swift_unknownObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v7, v3);
      sub_23F4744D8();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
    swift_unknownObjectRelease();
  }
  uint64_t v11 = *MEMORY[0x263F52518];
  uint64_t v12 = sub_23F474518();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);

  return v13(a1, v11, v12);
}

void sub_23F472684(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23F474518();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v1, sel_presentationContext);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = &selRef_verifyPasscode_;
    if (objc_msgSend(v1, sel_isInViewHierarchy))
    {
LABEL_22:
      id v51 = [v2 v10[98]];
      unint64_t v52 = (unint64_t)objc_msgSend(v51, sel_viewControllers);

      if (v52)
      {
        sub_23F47364C();
        unint64_t v53 = sub_23F474628();

        if (v53 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v54 = sub_23F474678();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v54 = *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        unint64_t v52 = v54 != 0;
      }
      id v55 = [v2 v10[98]];
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E168);
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_23F477D30;
      *(void *)(v56 + 32) = a1;
      v59[1] = v56;
      sub_23F474638();
      sub_23F47364C();
      id v57 = a1;
      unint64_t v58 = (void *)sub_23F474618();
      swift_bridgeObjectRelease();
      objc_msgSend(v55, sel_setViewControllers_direction_animated_completion_, v58, 0, v52, 0);

      return;
    }
    id v11 = objc_msgSend(v1, sel_pageViewController);
    objc_msgSend(v2, sel_addChildViewController_, v11);
    id v12 = objc_msgSend(v11, sel_view);
    if (v12)
    {
      uint64_t v13 = v12;
      objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

      id v14 = objc_msgSend(v2, sel_view);
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = objc_msgSend(v11, sel_view);
        if (v16)
        {
          uint64_t v17 = v16;
          v59[0] = v5;
          objc_msgSend(v15, sel_addSubview_, v16);

          id v18 = objc_msgSend(v2, sel_view);
          if (v18)
          {
            uint64_t v19 = v18;
            id v20 = objc_msgSend(v18, sel_topAnchor);

            id v21 = objc_msgSend(v11, sel_view);
            if (v21)
            {
              uint64_t v22 = v21;
              id v23 = objc_msgSend(v21, sel_topAnchor);

              id v24 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v23);
              objc_msgSend(v24, sel_setActive_, 1);

              id v25 = objc_msgSend(v2, sel_view);
              if (v25)
              {
                uint64_t v26 = v25;
                id v27 = objc_msgSend(v25, sel_leadingAnchor);

                id v28 = objc_msgSend(v11, sel_view);
                if (v28)
                {
                  id v29 = v28;
                  id v30 = objc_msgSend(v28, sel_leadingAnchor);

                  id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
                  objc_msgSend(v31, sel_setActive_, 1);

                  id v32 = objc_msgSend(v2, sel_view);
                  if (v32)
                  {
                    uint64_t v33 = v32;
                    id v34 = objc_msgSend(v32, sel_bottomAnchor);

                    id v35 = objc_msgSend(v11, sel_view);
                    if (v35)
                    {
                      uint64_t v36 = v35;
                      id v37 = objc_msgSend(v35, sel_bottomAnchor);

                      id v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
                      objc_msgSend(v38, sel_setActive_, 1);

                      id v39 = objc_msgSend(v2, sel_view);
                      if (v39)
                      {
                        uint64_t v40 = v39;
                        id v41 = objc_msgSend(v39, sel_trailingAnchor);

                        id v42 = objc_msgSend(v11, sel_view);
                        if (v42)
                        {
                          uint64_t v43 = v42;
                          id v44 = objc_msgSend(v42, sel_trailingAnchor);

                          id v45 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v44);
                          objc_msgSend(v45, sel_setActive_, 1);

                          objc_msgSend(v11, sel_didMoveToParentViewController_, v2);
                          sub_23F4724A8((uint64_t)v7);
                          uint64_t v46 = v59[0];
                          int v47 = (*(uint64_t (**)(char *, uint64_t))(v59[0] + 88))(v7, v4);
                          if (v47 == *MEMORY[0x263F52510])
                          {
                            objc_msgSend(v9, sel_showViewController_sender_, v2, 0);
                            id v10 = &selRef_verifyPasscode_;
                          }
                          else
                          {
                            id v10 = &selRef_verifyPasscode_;
                            if (v47 == *MEMORY[0x263F52518])
                            {
                              objc_msgSend(v2, sel_setModalInPresentation_, 1);
                              objc_msgSend(v9, sel_presentViewController_animated_completion_, v2, 1, 0);
                            }
                            else
                            {
                              (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v4);
                            }
                          }
                          goto LABEL_22;
                        }
LABEL_38:
                        __break(1u);
                        return;
                      }
LABEL_37:
                      __break(1u);
                      goto LABEL_38;
                    }
LABEL_36:
                    __break(1u);
                    goto LABEL_37;
                  }
LABEL_35:
                  __break(1u);
                  goto LABEL_36;
                }
LABEL_34:
                __break(1u);
                goto LABEL_35;
              }
LABEL_33:
              __break(1u);
              goto LABEL_34;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  sub_23F474488();
  sub_23F470F14();
  uint64_t v48 = (void *)swift_allocError();
  *uint64_t v49 = 0;
  uint64_t v50 = (void *)sub_23F474478();

  sub_23F470F68(0, v50);
}

unint64_t sub_23F472DB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C3E150);
  uint64_t v2 = sub_23F474688();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23F47358C(v6, (uint64_t)&v13, &qword_268C3E158);
    uint64_t v7 = v13;
    unint64_t result = sub_23F473370(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_23F473404(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_268C3E170)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268C3E170);
    }
  }
}

uint64_t sub_23F472F3C(uint64_t a1, uint64_t a2)
{
  return sub_23F4730A8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23F472F54(uint64_t a1, id *a2)
{
  uint64_t result = sub_23F4745B8();
  *a2 = 0;
  return result;
}

uint64_t sub_23F472FCC(uint64_t a1, id *a2)
{
  char v3 = sub_23F4745C8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23F47304C@<X0>(uint64_t *a1@<X8>)
{
  sub_23F4745D8();
  uint64_t v2 = sub_23F4745A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23F473090(uint64_t a1, uint64_t a2)
{
  return sub_23F4730A8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23F4730A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23F4745D8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23F4730EC()
{
  sub_23F4745D8();
  sub_23F4745F8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23F473140()
{
  sub_23F4745D8();
  sub_23F474708();
  sub_23F4745F8();
  uint64_t v0 = sub_23F474728();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23F4731B4()
{
  uint64_t v0 = sub_23F4745D8();
  uint64_t v2 = v1;
  if (v0 == sub_23F4745D8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23F4746B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23F473240@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23F4745A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23F473288@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23F4745D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23F4732B4(uint64_t a1)
{
  uint64_t v2 = sub_23F47397C(&qword_268C3E148, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_23F47397C((unint64_t *)&unk_268C3E190, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_23F473370(uint64_t a1)
{
  sub_23F4745D8();
  sub_23F474708();
  sub_23F4745F8();
  uint64_t v2 = sub_23F474728();
  swift_bridgeObjectRelease();

  return sub_23F473414(a1, v2);
}

_OWORD *sub_23F473404(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23F473414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23F4745D8();
    uint64_t v8 = v7;
    if (v6 == sub_23F4745D8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23F4746B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_23F4745D8();
          uint64_t v15 = v14;
          if (v13 == sub_23F4745D8() && v15 == v16) {
            break;
          }
          char v18 = sub_23F4746B8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_23F47358C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F4735F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23F47364C()
{
  unint64_t result = qword_268C3E160;
  if (!qword_268C3E160)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C3E160);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s13FailureReasonOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13FailureReasonOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23F4737F8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_23F473820(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23F47382C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s13FailureReasonOMa()
{
  return &_s13FailureReasonON;
}

unint64_t sub_23F473850()
{
  unint64_t result = qword_268C3E360[0];
  if (!qword_268C3E360[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C3E360);
  }
  return result;
}

uint64_t sub_23F4738A4()
{
  return sub_23F47397C(&qword_268C3E178, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23F4738EC()
{
  return sub_23F47397C(&qword_268C3E180, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23F473934()
{
  return sub_23F47397C(&qword_268C3E188, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23F47397C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_23F4739C4()
{
  id v0 = objc_msgSend(self, sel_createContext);

  return v0;
}

id sub_23F473A48()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_23F473A7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LAContextProvider();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for LAContextProvider()
{
  return self;
}

id sub_23F473B14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LAContextProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __getCDPStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[LAPSCurrentPasscodeService changePasscode:to:enableRecovery:completion:](v0);
}

uint64_t sub_23F474378()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_23F474388()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_23F474398()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_23F4743A8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23F4743B8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23F4743C8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23F4743D8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23F4743E8()
{
  return MEMORY[0x270F47820]();
}

uint64_t sub_23F4743F8()
{
  return MEMORY[0x270F47830]();
}

uint64_t sub_23F474408()
{
  return MEMORY[0x270F47840]();
}

uint64_t sub_23F474418()
{
  return MEMORY[0x270F47858]();
}

uint64_t sub_23F474428()
{
  return MEMORY[0x270F478B0]();
}

uint64_t sub_23F474438()
{
  return MEMORY[0x270F478B8]();
}

uint64_t sub_23F474448()
{
  return MEMORY[0x270F478C0]();
}

uint64_t sub_23F474458()
{
  return MEMORY[0x270F478C8]();
}

uint64_t sub_23F474468()
{
  return MEMORY[0x270F478D0]();
}

uint64_t sub_23F474478()
{
  return MEMORY[0x270F478D8]();
}

uint64_t sub_23F474488()
{
  return MEMORY[0x270F478E0]();
}

uint64_t sub_23F474498()
{
  return MEMORY[0x270F478E8]();
}

uint64_t sub_23F4744A8()
{
  return MEMORY[0x270F478F0]();
}

uint64_t sub_23F4744B8()
{
  return MEMORY[0x270F478F8]();
}

uint64_t sub_23F4744C8()
{
  return MEMORY[0x270F47900]();
}

uint64_t sub_23F4744D8()
{
  return MEMORY[0x270F47908]();
}

uint64_t sub_23F4744E8()
{
  return MEMORY[0x270F47910]();
}

uint64_t sub_23F4744F8()
{
  return MEMORY[0x270F47918]();
}

uint64_t sub_23F474508()
{
  return MEMORY[0x270F47920]();
}

uint64_t sub_23F474518()
{
  return MEMORY[0x270F47928]();
}

uint64_t sub_23F474528()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_23F474538()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_23F474548()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_23F474558()
{
  return MEMORY[0x270EE3E90]();
}

uint64_t sub_23F474568()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_23F474578()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_23F474588()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23F474598()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23F4745A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23F4745B8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23F4745C8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23F4745D8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23F4745E8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23F4745F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23F474608()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23F474618()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23F474628()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23F474638()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23F474648()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_23F474658()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23F474668()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23F474678()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23F474688()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23F4746A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23F4746B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23F4746C8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23F4746D8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23F4746E8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23F4746F8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23F474708()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23F474718()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23F474728()
{
  return MEMORY[0x270F9FC90]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t LACLogDTO()
{
  return MEMORY[0x270F47878]();
}

uint64_t LACLogPasscodeService()
{
  return MEMORY[0x270F47890]();
}

uint64_t LALogForCategory()
{
  return MEMORY[0x270EF55E8]();
}

uint64_t LALogTypeForInternalError()
{
  return MEMORY[0x270EF55F8]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x270F4AE50]();
}

uint64_t MKBKeyBagMementoGetBlobState()
{
  return MEMORY[0x270F4AE98]();
}

uint64_t MKBVerifyPasswordWithContext()
{
  return MEMORY[0x270F4AED8]();
}

uint64_t NSLocalizedStringFromLACBiometryType()
{
  return MEMORY[0x270F47898]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x270EFDAF8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x270F79618]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}
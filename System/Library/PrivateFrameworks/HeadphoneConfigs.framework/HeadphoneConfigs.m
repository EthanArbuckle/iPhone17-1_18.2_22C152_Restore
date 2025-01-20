void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1E4C10BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1E4C1B064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1E4C1B42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4C1D40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4C29EF8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E4C29FCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C2A758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4C2A854(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C2D220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getHearingModeUIServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HearingModeSettingsUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __HearingModeSettingsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6EA85D8;
    uint64_t v5 = 0;
    HearingModeSettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HearingModeSettingsUILibraryCore_frameworkLibrary) {
    __getHearingModeUIServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("HearingModeUIService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getHearingModeUIServiceClass_block_invoke_cold_2();
  }
  getHearingModeUIServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HearingModeSettingsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HearingModeSettingsUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t isPreferredLanguageEnglish()
{
  v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v1 = [v0 firstObject];
  if ([v1 isEqualToString:@"en"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 hasPrefix:@"en-"];
  }

  return v2;
}

void sub_1E4C3AAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 168));
  _Unwind_Resume(a1);
}

void sub_1E4C3CC94(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1E4C3D634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C3D9B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C3ECA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sharedBluetoothSettingsLogComponent()
{
  if (sharedBluetoothSettingsLogComponent_onceToken != -1) {
    dispatch_once(&sharedBluetoothSettingsLogComponent_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)sharedBluetoothSettingsLogComponent_sharedBTSLog;

  return v0;
}

uint64_t __sharedBluetoothSettingsLogComponent_block_invoke()
{
  sharedBluetoothSettingsLogComponent_sharedBTSLog = (uint64_t)os_log_create("com.apple.bluetooth", "BluetoothSettings");

  return MEMORY[0x1F41817F8]();
}

void sub_1E4C44A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
}

id createWarningCellTitle()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setEditable:0];
  [v0 setSelectable:1];
  [v0 setUserInteractionEnabled:1];
  [v0 setScrollEnabled:0];
  objc_msgSend(v0, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v1 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v0 setFont:v1];

  uint64_t v2 = [MEMORY[0x1E4F92E40] appearance];
  v3 = [v2 textColor];
  if (v3)
  {
    [v0 setTextColor:v3];
  }
  else
  {
    long long v4 = [MEMORY[0x1E4FB1618] blackColor];
    [v0 setTextColor:v4];
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v0 setBackgroundColor:v5];

  LODWORD(v6) = 1144750080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [v0 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [v0 setContentCompressionResistancePriority:1 forAxis:v8];
  LODWORD(v9) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v9];
  [v0 sizeToFit];

  return v0;
}

id createWarningCellBody()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setEditable:0];
  [v0 setSelectable:1];
  [v0 setUserInteractionEnabled:1];
  [v0 setScrollEnabled:0];
  [v0 _setInteractiveTextSelectionDisabled:0];
  [v0 setShowsVerticalScrollIndicator:0];
  objc_msgSend(v0, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v1 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v0 setFont:v1];

  uint64_t v2 = [MEMORY[0x1E4F92E40] appearance];
  v3 = [v2 textColor];
  if (v3)
  {
    [v0 setTextColor:v3];
  }
  else
  {
    long long v4 = [MEMORY[0x1E4FB1618] blackColor];
    [v0 setTextColor:v4];
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v0 setBackgroundColor:v5];

  LODWORD(v6) = 1144750080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [v0 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [v0 setContentCompressionResistancePriority:1 forAxis:v8];
  LODWORD(v9) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v9];
  [v0 sizeToFit];

  return v0;
}

void sub_1E4C49098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4C499B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4C4A630(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4C4A884(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C4AEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4C4B1D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t cbTapActionForBT(int a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 4;
      break;
    case 4:
      uint64_t result = 5;
      break;
    default:
      uint64_t result = a1 != 15 && a1 != 0xFFFF;
      break;
  }
  return result;
}

void sub_1E4C53750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1E4C5DED4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1E4C5F664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C5FAA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C60544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C6091C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4C62010(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t static HPSCaseEngravingView.getEngravedCaseImage(_:productID:)(uint64_t a1, uint64_t a2, int a3)
{
  double v9 = (uint64_t (*)(uint64_t, uint64_t, int))((char *)&dword_1EAE8D598 + dword_1EAE8D598);
  double v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *double v7 = v3;
  v7[1] = sub_1E4C789E0;
  return v9(a1, a2, a3);
}

uint64_t sub_1E4C789E0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1E4C78ADC()
{
  uint64_t v0 = sub_1E4CBEA30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F93C28], v0);
  uint64_t v4 = sub_1E4CBEA40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

id sub_1E4C78BD0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();

  return v3;
}

uint64_t sub_1E4C78C20()
{
  return 0;
}

uint64_t sub_1E4C78DA8(int a1, int a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  uint64_t v5 = sub_1E4CBF1F0();
  uint64_t v7 = v6;
  v3[3] = v6;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, int))((char *)&dword_1EAE8D598 + dword_1EAE8D598);
  double v8 = (void *)swift_task_alloc();
  v3[4] = v8;
  *double v8 = v3;
  v8[1] = sub_1E4C78E84;
  return v10(v5, v7, a2);
}

uint64_t sub_1E4C78E84(const void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  ((void (**)(void, const void *))v3)[2](v3, a1);
  _Block_release(v3);
  _Block_release(a1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id HPSCaseEngravingView.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id HPSCaseEngravingView.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HPSCaseEngravingView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4C790B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1E4C7A900;
  return v6();
}

uint64_t sub_1E4C79180(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1E4C7A900;
  return v7();
}

uint64_t sub_1E4C7924C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E4CBF330();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E4CBF320();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4C7A564(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E4CBF310();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E4C793F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4C794CC;
  return v6(a1);
}

uint64_t sub_1E4C794CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E4C795C4(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(v3 + 344) = a3;
  *(void *)(v3 + 176) = a1;
  *(void *)(v3 + 184) = a2;
  uint64_t v4 = sub_1E4CBEA50();
  *(void *)(v3 + 192) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v3 + 200) = v5;
  *(void *)(v3 + 208) = *(void *)(v5 + 64);
  *(void *)(v3 + 216) = swift_task_alloc();
  *(void *)(v3 + 224) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D5E8);
  *(void *)(v3 + 232) = swift_task_alloc();
  uint64_t v6 = sub_1E4CBEA20();
  *(void *)(v3 + 240) = v6;
  *(void *)(v3 + 248) = *(void *)(v6 - 8);
  *(void *)(v3 + 256) = swift_task_alloc();
  *(void *)(v3 + 264) = swift_task_alloc();
  uint64_t v7 = sub_1E4CBEA80();
  *(void *)(v3 + 272) = v7;
  *(void *)(v3 + 280) = *(void *)(v7 - 8);
  *(void *)(v3 + 288) = swift_task_alloc();
  *(void *)(v3 + 296) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4C797A8, 0, 0);
}

uint64_t sub_1E4C797A8()
{
  *(void *)(v0 + 304) = sub_1E4C7A6B4();
  *(void *)(v0 + 312) = sub_1E4CBF4E0();
  sub_1E4CBEA70();
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v16 = *(void *)(v0 + 288);
  uint64_t v17 = *(void *)(v0 + 272);
  uint64_t v18 = *(void *)(v0 + 296);
  uint64_t v21 = *(void *)(v0 + 248);
  uint64_t v22 = *(void *)(v0 + 256);
  uint64_t v23 = *(void *)(v0 + 240);
  uint64_t v19 = *(void *)(v0 + 264);
  uint64_t v20 = *(void *)(v0 + 232);
  int v15 = *(_DWORD *)(v0 + 344);
  *(void *)(v0 + 128) = sub_1E4CBF210();
  *(void *)(v0 + 136) = v2;
  *(void *)(v0 + 144) = 58;
  *(void *)(v0 + 152) = 0xE100000000000000;
  *(void *)(v0 + 160) = 45;
  *(void *)(v0 + 168) = 0xE100000000000000;
  sub_1E4C7A70C();
  sub_1E4C7A760();
  uint64_t v3 = MEMORY[0x1E4FBB1A0];
  sub_1E4CBF370();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  sub_1E4CBF3B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1E4CC48E0;
  *(void *)(v6 + 56) = v3;
  *(void *)(v6 + 64) = sub_1E4C7A7B4();
  uint64_t v7 = MEMORY[0x1E4FBC4C0];
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = v5;
  uint64_t v8 = MEMORY[0x1E4FBC530];
  *(void *)(v6 + 96) = v7;
  *(void *)(v6 + 104) = v8;
  *(_DWORD *)(v6 + 72) = v15;
  sub_1E4CBEE60();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v16, v18, v17);
  sub_1E4CBEA90();
  sub_1E4CBEA00();
  sub_1E4CBEAA0();
  uint64_t v9 = *MEMORY[0x1E4F93C30];
  uint64_t v10 = sub_1E4CBEAB0();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 104))(v20, v9, v10);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  sub_1E4CBEA10();
  sub_1E4CBE9F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v22, v19, v23);
  *(void *)(v0 + 320) = sub_1E4CBEA60();
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_1E4C79C80;
  uint64_t v13 = *(void *)(v0 + 224);
  return MEMORY[0x1F4146338](v13);
}

uint64_t sub_1E4C79C80()
{
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E4C79F7C;
  }
  else {
    uint64_t v2 = sub_1E4C79D94;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4C79D94()
{
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[33];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[31];
  unint64_t v7 = v0[27];
  uint64_t v16 = v0[37];
  uint64_t v17 = v0[28];
  uint64_t v8 = v0[25];
  uint64_t v9 = v0[24];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v16, v2);
  uint64_t v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32);
  v10(v7, v17, v9);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  v10(v12 + v11, v7, v9);
  v0[12] = sub_1E4C7A898;
  v0[13] = v12;
  v0[8] = MEMORY[0x1E4F143A8];
  v0[9] = 1107296256;
  v0[10] = sub_1E4C78BD0;
  v0[11] = &block_descriptor_26;
  uint64_t v13 = _Block_copy(v0 + 8);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v13);
}

uint64_t sub_1E4C79F7C()
{
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[35];
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[30];
  uint64_t v7 = v0[31];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  uint64_t v8 = (void *)v0[42];
  uint64_t v9 = (void *)sub_1E4CBF4D0();
  sub_1E4CBF3B0();
  sub_1E4CBEE50();

  v0[6] = sub_1E4C78C20;
  v0[7] = 0;
  v0[2] = MEMORY[0x1E4F143A8];
  v0[3] = 1107296256;
  v0[4] = sub_1E4C78BD0;
  v0[5] = &block_descriptor;
  uint64_t v10 = _Block_copy(v0 + 2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void *))v0[1];
  return v11(v10);
}

uint64_t type metadata accessor for HPSCaseEngravingView()
{
  return self;
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

uint64_t sub_1E4C7A198()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4C7A1D8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  int v3 = *(_DWORD *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E4C7A29C;
  uint64_t v6 = (uint64_t (*)(int, int, void *))((char *)&dword_1EAE8D5A8 + dword_1EAE8D5A8);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4C7A29C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E4C7A394()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E4C7A900;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAE8D5B8 + dword_1EAE8D5B8);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4C7A498(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E4C7A900;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE8D5C8 + dword_1EAE8D5C8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E4C7A564(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D5A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4C7A5C4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4C7A5FC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4C7A29C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE8D5D8 + dword_1EAE8D5D8);
  return v6(a1, v4);
}

unint64_t sub_1E4C7A6B4()
{
  unint64_t result = qword_1EAE8D5F0;
  if (!qword_1EAE8D5F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE8D5F0);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1E4C7A70C()
{
  unint64_t result = qword_1EAE8D5F8;
  if (!qword_1EAE8D5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D5F8);
  }
  return result;
}

unint64_t sub_1E4C7A760()
{
  unint64_t result = qword_1EAE8D600;
  if (!qword_1EAE8D600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D600);
  }
  return result;
}

unint64_t sub_1E4C7A7B4()
{
  unint64_t result = qword_1EAE8D610;
  if (!qword_1EAE8D610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D610);
  }
  return result;
}

uint64_t sub_1E4C7A808()
{
  uint64_t v1 = sub_1E4CBEA50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1E4C7A898()
{
  sub_1E4CBEA50();

  return sub_1E4C78ADC();
}

uint64_t sub_1E4C7A904()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE900B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE900B8);
  sub_1E4CBEE80();
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4C7A970()
{
  if (qword_1EAE8E010 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE900B8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1E4C7AA0C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8E010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE900B8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_1E4C7AB00()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1E4C7ABD0(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
  id v5 = a1;

  sub_1E4C7AC3C();
}

void sub_1E4C7AC3C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D698);
  uint64_t v72 = *(void *)(v1 - 8);
  uint64_t v73 = v1;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v71 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6A0);
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v74 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6A8);
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v79 = v5;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v77 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1E4CBF410();
  uint64_t v68 = *(void *)(v69 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v67 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D630);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v70 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6B0);
  uint64_t v60 = *(v9 - 1);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D628);
  uint64_t v59 = *(v12 - 1);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  int v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6B8);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6C0);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  v61 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6C8);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x1F4188790](v66);
  v64 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  id v80 = *v24;
  if (v80)
  {
    uint64_t v58 = v0;
    v25 = (void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners);
    swift_beginAccess();
    v57 = v25;
    uint64_t v26 = *v25;
    if ((v26 & 0xC000000000000001) != 0)
    {
      id v27 = v80;
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_1E4CBF570();
      swift_bridgeObjectRelease();
      if (v28)
      {
LABEL_5:

        return;
      }
    }
    else
    {
      uint64_t v53 = *(void *)(v26 + 16);
      id v54 = v80;
      if (v53) {
        goto LABEL_5;
      }
    }
    v56 = v19;
    sub_1E4CBEC40();
    v29 = (void *)sub_1E4C843AC(v12);
    unint64_t v55 = v18;
    v30 = *(void (**)(char *, void *))(v59 + 8);
    v30(v17, v12);
    id v81 = v29;
    sub_1E4CBEB10();
    v31 = (void *)sub_1E4C843AC(v9);
    (*(void (**)(char *, void *))(v60 + 8))(v11, v9);
    id v83 = v31;
    sub_1E4CBEB20();
    uint64_t v32 = sub_1E4C843AC(v12);
    v30(v15, v12);
    uint64_t v82 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D660);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6D0);
    uint64_t v33 = MEMORY[0x1E4F1AAE8];
    sub_1E4C7D240(&qword_1EAE8D668, &qword_1EAE8D660);
    uint64_t v59 = v33;
    sub_1E4C7D240(&qword_1EAE8D6D8, &qword_1EAE8D6D0);
    sub_1E4CBEFA0();
    sub_1E4C7D240(&qword_1EAE8D6E0, &qword_1EAE8D6B8);
    unint64_t v34 = v55;
    v35 = (void *)sub_1E4CBF070();
    (*((void (**)(char *, unint64_t))v56 + 1))(v21, v34);
    id v81 = v35;
    sub_1E4C7CA18();
    id v83 = (id)sub_1E4CBF420();
    uint64_t v36 = sub_1E4CBF3F0();
    v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56);
    uint64_t v38 = (uint64_t)v70;
    v37(v70, 1, 1, v36);
    v39 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37;
    v56 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D6E8);
    sub_1E4C7D240(&qword_1EAE8D6F0, &qword_1EAE8D6E8);
    unint64_t v40 = sub_1E4C7CA58();
    v41 = v61;
    unint64_t v55 = v40;
    sub_1E4CBF0A0();
    sub_1E4C7CAB0(v38);

    swift_release();
    v42 = v67;
    sub_1E4CBF400();
    id v81 = (id)sub_1E4CBF420();
    v39(v38, 1, 1, v36);
    uint64_t v60 = MEMORY[0x1E4F1AAB8];
    sub_1E4C7D240(&qword_1EAE8D6F8, &qword_1EAE8D6C0);
    v43 = v64;
    uint64_t v44 = v63;
    sub_1E4CBF0B0();
    sub_1E4C7CAB0(v38);

    (*(void (**)(char *, uint64_t))(v68 + 8))(v42, v69);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v41, v44);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1E4C7D240(&qword_1EAE8D700, &qword_1EAE8D6C8);
    uint64_t v45 = v66;
    sub_1E4CBF0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v43, v45);
    swift_beginAccess();
    sub_1E4CBEFC0();
    swift_endAccess();
    swift_release();
    sub_1E4CBEAD0();
    v46 = v71;
    sub_1E4CBED90();
    swift_release();
    uint64_t v47 = v73;
    v48 = (void *)sub_1E4CBEAC0();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v46, v47);
    id v81 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D708);
    sub_1E4C7D240(&qword_1EAE8D710, &qword_1EAE8D708);
    v49 = v74;
    sub_1E4CBF0C0();
    swift_release();
    id v81 = (id)sub_1E4CBF420();
    v56(v38, 1, 1, v36);
    sub_1E4C7D240(&qword_1EAE8D718, &qword_1EAE8D6A0);
    uint64_t v50 = v76;
    v51 = v77;
    sub_1E4CBF0A0();
    sub_1E4C7CAB0(v38);

    (*(void (**)(char *, uint64_t))(v75 + 8))(v49, v50);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1E4C7D240(&qword_1EAE8D720, &qword_1EAE8D6A8);
    uint64_t v52 = v79;
    sub_1E4CBF0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v51, v52);
    swift_beginAccess();
    sub_1E4CBEFC0();
    swift_endAccess();
    swift_release();
    goto LABEL_5;
  }
}

void (*sub_1E4C7B8E8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1E4C7B948;
}

void sub_1E4C7B948(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1E4C7AC3C();
  }
}

uint64_t sub_1E4C7B97C()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1E4C7B988()
{
  return sub_1E4CBF010();
}

uint64_t sub_1E4C7BA38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4CBF050(&v1);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1E4C7BB1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1E4CBF060();
}

uint64_t sub_1E4C7BB88@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xB0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1E4C7BBE8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xB8))(*a1);
}

void (*sub_1E4C7BC40(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1E4CBF040();
  return sub_1E4C7BCCC;
}

void sub_1E4C7BCCC(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_1E4C7BD34()
{
  return 1;
}

uint64_t sub_1E4C7BD3C()
{
  return swift_endAccess();
}

uint64_t sub_1E4C7BDA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D628);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D620);
  sub_1E4CBF030();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1E4C7BECC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D628);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D620);
  sub_1E4CBF020();
  swift_endAccess();
  return sub_1E4C7BFDC;
}

void sub_1E4C7BFDC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1E4CBF030();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_1E4CBF030();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_1E4C7C14C()
{
  return swift_retain();
}

uint64_t sub_1E4C7C198(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1E4C7C1EC())()
{
  return j__swift_endAccess;
}

void *sub_1E4C7C24C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return sub_1E4C7C2B0(a1, a2, a3, a4, a5);
}

void *sub_1E4C7C2B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v49 = a4;
  uint64_t v50 = a5;
  uint64_t v48 = a3;
  uint64_t v47 = a2;
  id v52 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D630);
  MEMORY[0x1F4188790](v6 - 8);
  v56 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E4CBF410();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v53 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D628);
  uint64_t v11 = *(v10 - 1);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D638);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v54 = v14;
  uint64_t v55 = v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D640);
  uint64_t v60 = *(void *)(v57 - 8);
  MEMORY[0x1F4188790](v57);
  v51 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D620);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (void **)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice];
  *(void *)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners] = MEMORY[0x1E4FBC870];
  uint64_t v24 = &v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered];
  char v63 = 1;
  v25 = v5;
  sub_1E4CBF010();
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v24, v22, v19);
  *(void *)&v25[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener] = 0;
  swift_beginAccess();
  uint64_t v26 = *v23;
  id v27 = v52;
  *uint64_t v23 = v52;
  id v52 = v27;

  uint64_t v28 = &v25[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_action];
  uint64_t v29 = v48;
  *(void *)uint64_t v28 = v47;
  *((void *)v28 + 1) = v29;
  v30 = &v25[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadAllAction];
  uint64_t v31 = v50;
  *(void *)v30 = v49;
  *((void *)v30 + 1) = v31;
  swift_retain();
  swift_retain();

  uint64_t v32 = (objc_class *)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  v62.receiver = v25;
  v62.super_class = v32;
  uint64_t v33 = objc_msgSendSuper2(&v62, sel_init);
  unint64_t v34 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v33) + 0xC8);
  v35 = v33;
  v34();
  uint64_t v36 = (void *)sub_1E4C843AC(v10);
  (*(void (**)(char *, void *))(v11 + 8))(v13, v10);
  id v61 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D660);
  sub_1E4C7D240(&qword_1EAE8D668, &qword_1EAE8D660);
  sub_1E4CBF0C0();
  swift_release();
  v37 = v53;
  sub_1E4CBF400();
  sub_1E4C7CA18();
  id v61 = (id)sub_1E4CBF420();
  uint64_t v38 = sub_1E4CBF3F0();
  uint64_t v39 = (uint64_t)v56;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v56, 1, 1, v38);
  sub_1E4C7D240(&qword_1EAE8D678, &qword_1EAE8D638);
  sub_1E4C7CA58();
  unint64_t v40 = v51;
  uint64_t v41 = v54;
  sub_1E4CBF0B0();
  sub_1E4C7CAB0(v39);

  (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v59);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v17, v41);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1E4C7D240(&qword_1EAE8D688, &qword_1EAE8D640);
  uint64_t v42 = v57;
  uint64_t v43 = sub_1E4CBF0E0();

  swift_release();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v60 + 8))(v40, v42);
  uint64_t v44 = (void *)((char *)v35 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener);
  swift_beginAccess();
  *uint64_t v44 = v43;
  swift_release();
  return v35;
}

uint64_t type metadata accessor for BTSHeadphoneDevicePropertyObserver()
{
  uint64_t result = qword_1EAE8E030;
  if (!qword_1EAE8E030) {
    return swift_getSingletonMetadata();
  }
  return result;
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

unint64_t sub_1E4C7CA18()
{
  unint64_t result = qword_1EAE8D670;
  if (!qword_1EAE8D670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE8D670);
  }
  return result;
}

unint64_t sub_1E4C7CA58()
{
  unint64_t result = qword_1EAE8D680;
  if (!qword_1EAE8D680)
  {
    sub_1E4C7CA18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D680);
  }
  return result;
}

uint64_t sub_1E4C7CAB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4C7CB10()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4C7CB48(uint64_t a1)
{
  return sub_1E4C7D074(a1, &OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadAllAction);
}

uint64_t sub_1E4C7CC1C()
{
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))(1);
}

id sub_1E4C7CCDC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners];
  swift_beginAccess();
  *(void *)uint64_t v1 = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRelease();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1E4C7CEA8()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void sub_1E4C7CEDC()
{
}

uint64_t sub_1E4C7CF0C()
{
  return type metadata accessor for BTSHeadphoneDevicePropertyObserver();
}

void sub_1E4C7CF44()
{
  sub_1E4C7D338(319, &qword_1EAE8D690, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1E4C7D020()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1E4C7D030()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4C7D068(uint64_t a1)
{
  return sub_1E4C7D074(a1, &OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_action);
}

uint64_t sub_1E4C7D074(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E8B570](v2 + 16);
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(void (**)(void))(result + *a2);
    swift_retain();

    v6();
    return swift_release();
  }
  return result;
}

void sub_1E4C7D0F8()
{
  uint64_t v1 = v0 + 16;
  if (qword_1EAE8E010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAE900B8);
  objc_super v3 = sub_1E4CBEE90();
  os_log_type_t v4 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, v4, "btsPropertyObserver: $bobbleCapability changed trigger reload", v5, 2u);
    MEMORY[0x1E4E8B4E0](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x1E4E8B570](v1);
  if (v6)
  {
    uint64_t v7 = v6;
    (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v6) + 0x100))();
  }
}

uint64_t sub_1E4C7D240(unint64_t *a1, uint64_t *a2)
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

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CBListeningMode(uint64_t a1)
{
}

void type metadata accessor for AAFeatureCapability(uint64_t a1)
{
}

void sub_1E4C7D338(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1E4C7D384()
{
}

id sub_1E4C7D3A0()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setSpacing_, 5.0);
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1E4C7D450()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    id v5 = objc_msgSend(self, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E4FB28F0], *MEMORY[0x1E4FB09E0]);
    objc_msgSend(v4, sel_setFont_, v5);

    id v6 = objc_msgSend(self, sel_labelColor);
    objc_msgSend(v4, sel_setTextColor_, v6);

    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v7 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v4, sel_setText_, v7);

    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    uint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_1E4C7D5C0(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1E4C7D604(a1, a2);
}

id sub_1E4C7D604(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView] = 0;
  id v3 = &v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView_listTitle];
  *(void *)id v3 = a1;
  *((void *)v3 + 1) = a2;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for NumberedBulletListContentView();
  id v4 = objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v5 = sub_1E4C7D3A0();
  objc_msgSend(v4, sel_addSubview_, v5);

  id v6 = sub_1E4C7D3A0();
  objc_msgSend(v6, sel_pinToOther_, v4);

  id v7 = sub_1E4C7D3A0();
  id v8 = sub_1E4C7D450();
  objc_msgSend(v7, sel_addArrangedSubview_, v8);

  return v4;
}

uint64_t type metadata accessor for NumberedBulletListContentView()
{
  return self;
}

void sub_1E4C7D724()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView] = 0;

  sub_1E4CBF640();
  __break(1u);
}

void sub_1E4C7D820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_setNumberOfLines_, 0);
  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))((*MEMORY[0x1E4FBC8C8] & *v7) + 0xA8))(a1, a2, a3, a4, a5, a6, a7);
  objc_msgSend(v15, sel_setAttributedText_, v16);

  id v17 = sub_1E4C7D3A0();
  objc_msgSend(v17, sel_addArrangedSubview_, v15);
}

char *sub_1E4C7D96C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DE90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E4CC48E0;
  uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v12 = sub_1E4C7EA5C(0, &qword_1EAE8D750);
  *(void *)(inited + 40) = a6;
  uint64_t v13 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 104) = sub_1E4C7EA5C(0, &qword_1EAE8D758);
  *(void *)(inited + 80) = a7;
  id v14 = v11;
  id v15 = a6;
  id v16 = v13;
  id v17 = a7;
  sub_1E4C7DF1C(inited);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1E4CC4A30;
  id v20 = objc_allocWithZone(MEMORY[0x1E4FB08C0]);
  type metadata accessor for OptionKey(0);
  sub_1E4C7E0A8(&qword_1EAE8D760, type metadata accessor for OptionKey);
  uint64_t v21 = (void *)sub_1E4CBF180();
  id v22 = objc_msgSend(v20, sel_initWithTextAlignment_location_options_, 4, v21, a1);

  *(void *)(v19 + 32) = v22;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, &qword_1EAE8D768);
  uint64_t v23 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setTabStops_, v23);

  objc_msgSend(v18, sel_setDefaultTabInterval_, a1);
  objc_msgSend(v18, sel_setHeadIndent_, a1);
  swift_bridgeObjectRetain();
  sub_1E4CBF250();
  sub_1E4CBF250();
  sub_1E4CBF250();
  id v24 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  v25 = (void *)sub_1E4CBF1C0();
  id v26 = objc_msgSend(v24, sel_initWithString_, v25);

  uint64_t v27 = swift_initStackObject();
  *(_OWORD *)(v27 + 16) = xmmword_1E4CC4A40;
  uint64_t v28 = (void *)*MEMORY[0x1E4FB0738];
  *(void *)(v27 + 32) = *MEMORY[0x1E4FB0738];
  *(void *)(v27 + 64) = sub_1E4C7EA5C(0, &qword_1EAE8D770);
  *(void *)(v27 + 40) = v18;
  id v29 = v28;
  id v49 = v18;
  sub_1E4C7DF1C(v27);
  type metadata accessor for Key(0);
  sub_1E4C7E0A8(&qword_1EAE8D778, type metadata accessor for Key);
  v30 = (void *)sub_1E4CBF180();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_addAttributes_range_, v30, 0, objc_msgSend(v26, sel_length));

  uint64_t v31 = (void *)sub_1E4CBF180();
  objc_msgSend(v26, sel_addAttributes_range_, v31, 0, objc_msgSend(v26, sel_length));

  id v32 = objc_allocWithZone(NSString);
  uint64_t v33 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v34 = objc_msgSend(v32, sel_initWithString_, v33);

  v35 = (void *)sub_1E4CBF1C0();
  id v36 = objc_msgSend(v34, sel_rangeOfString_, v35);
  uint64_t v38 = v37;

  uint64_t v39 = (void *)sub_1E4CBF180();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_addAttributes_range_, v39, v36, v38);

  id v40 = objc_msgSend(v26, sel_string);
  uint64_t v41 = sub_1E4CBF1F0();
  unint64_t v43 = v42;

  uint64_t v44 = sub_1E4C7E0F0(v41, v43);
  uint64_t v46 = v45;
  swift_bridgeObjectRelease();
  if (!v46) {
    goto LABEL_8;
  }
  if (v44 == 10 && v46 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v47 = sub_1E4CBF6D0();
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0)
    {
LABEL_8:

      return (char *)v26;
    }
  }
  uint64_t result = (char *)objc_msgSend(v26, sel_length);
  if (!__OFSUB__(result, 1))
  {
    objc_msgSend(v26, sel_deleteCharactersInRange_, result - 1, 1);
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t sub_1E4C7DF1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DEC0);
  uint64_t v2 = sub_1E4CBF680();
  id v3 = (void *)v2;
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
    sub_1E4C7F644(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1E4C7F5B0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1E4C7F6AC(&v14, (_OWORD *)(v3[7] + 32 * result));
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

void type metadata accessor for OptionKey(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_1E4C7E060(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1E4C7E0A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E4C7E0F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  sub_1E4CBF240();
  return sub_1E4CBF270();
}

void sub_1E4C7E174()
{
}

id sub_1E4C7E1AC()
{
  return sub_1E4C7EE38(type metadata accessor for NumberedBulletListContentView);
}

id sub_1E4C7E224()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1E4C7E270()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle;
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle);
    uint64_t v7 = *(void *)(v5 + 8);
    objc_allocWithZone((Class)type metadata accessor for NumberedBulletListContentView());
    swift_bridgeObjectRetain();
    id v8 = sub_1E4C7D604(v6, v7);
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    char v9 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_1E4C7E320()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_configurationWithPointSize_weight_, 4, 39.0);
    swift_bridgeObjectRetain();
    id v5 = v4;
    uint64_t v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v6, v5);

    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v7);
    id v9 = objc_msgSend(self, sel_systemGray2Color);
    objc_msgSend(v8, sel_setTintColor_, v9);

    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v8, sel_setContentHuggingPriority_forAxis_, 1, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v8, sel_setContentHuggingPriority_forAxis_, 0, v11);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 0, v12);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 1, v13);

    long long v14 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v15 = v2;
  return v3;
}

char *sub_1E4C7E504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return sub_1E4C7E560(a1, a2, a3, a4);
}

char *sub_1E4C7E560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  double v11 = v4;
  id v12 = objc_msgSend(v10, sel_init);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v4[v9] = v12;
  *(void *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList] = 0;
  *(void *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView] = 0;
  double v13 = &v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle];
  *(void *)double v13 = a1;
  *((void *)v13 + 1) = a2;
  long long v14 = &v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_symbol];
  *(void *)long long v14 = a3;
  *((void *)v14 + 1) = a4;

  v53.receiver = v11;
  v53.super_class = (Class)type metadata accessor for IconWithNumberedBulletList();
  id v15 = (char *)objc_msgSendSuper2(&v53, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v16 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  id v17 = *(void **)&v15[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView];
  id v18 = v15;
  id v19 = v17;
  id v20 = sub_1E4C7E320();
  objc_msgSend(v19, sel_addSubview_, v20);

  id v21 = *(id *)&v15[v16];
  id v22 = sub_1E4C7E270();
  objc_msgSend(v21, _swift_FORCE_LOAD___swiftSpatial___HeadphoneConfigs, v22);

  id v52 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1E4CC4A50;
  id v24 = sub_1E4C7E320();
  id v25 = objc_msgSend(v24, sel_leadingAnchor);

  id v26 = objc_msgSend(*(id *)&v15[v16], sel_leadingAnchor);
  id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, 15.0);

  *(void *)(v23 + 32) = v27;
  id v28 = sub_1E4C7E320();
  id v29 = objc_msgSend(v28, sel_topAnchor);

  id v30 = objc_msgSend(*(id *)&v15[v16], sel_topAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v23 + 40) = v31;
  id v32 = sub_1E4C7E270();
  id v33 = objc_msgSend(v32, sel_leadingAnchor);

  id v34 = sub_1E4C7E320();
  id v35 = objc_msgSend(v34, sel_trailingAnchor);

  id v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_constant_, v35, 24.0);
  *(void *)(v23 + 48) = v36;
  id v37 = sub_1E4C7E270();
  id v38 = objc_msgSend(v37, sel_topAnchor);

  id v39 = objc_msgSend(*(id *)&v15[v16], sel_topAnchor);
  id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(void *)(v23 + 56) = v40;
  id v41 = sub_1E4C7E270();
  id v42 = objc_msgSend(v41, sel_trailingAnchor);

  id v43 = objc_msgSend(*(id *)&v15[v16], sel_trailingAnchor);
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_constant_, v43, 10.0);

  *(void *)(v23 + 64) = v44;
  id v45 = sub_1E4C7E270();
  id v46 = objc_msgSend(v45, sel_bottomAnchor);

  id v47 = objc_msgSend(*(id *)&v15[v16], sel_bottomAnchor);
  id v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(void *)(v23 + 72) = v48;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  id v49 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v52, sel_activateConstraints_, v49);

  objc_msgSend(v18, sel_addSubview_, *(void *)&v15[v16]);
  id v50 = *(id *)&v15[v16];
  objc_msgSend(v50, sel_pinToOther_, v18);

  return v18;
}

uint64_t type metadata accessor for IconWithNumberedBulletList()
{
  return self;
}

uint64_t sub_1E4C7EA5C(uint64_t a1, unint64_t *a2)
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

id sub_1E4C7EA98(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1E4C7EADC()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v1] = v2;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView] = 0;

  sub_1E4CBF640();
  __break(1u);
}

void sub_1E4C7EC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  long long v14 = sub_1E4C7E270();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))((*MEMORY[0x1E4FBC8C8] & *v14)
                                                                                       + 0xA0))(a1, a2, a3, a4, a5, a6, a7);
}

id sub_1E4C7ED34(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_1E4C7ED98()
{
}

void sub_1E4C7EDB4()
{
}

void sub_1E4C7EDF4()
{
}

id sub_1E4C7EE20()
{
  return sub_1E4C7EE38(type metadata accessor for IconWithNumberedBulletList);
}

id sub_1E4C7EE38(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1E4C7EEF4(uint64_t a1, uint64_t a2)
{
  return sub_1E4C7F000(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1E4C7EF20(uint64_t a1, uint64_t a2)
{
  return sub_1E4C7F000(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1E4C7EF38()
{
  sub_1E4CBF1F0();
  sub_1E4CBF230();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4C7EF8C()
{
  sub_1E4CBF1F0();
  sub_1E4CBF720();
  sub_1E4CBF230();
  uint64_t v0 = sub_1E4CBF740();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1E4C7F000(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1E4CBF1F0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1E4C7F044(uint64_t a1, id *a2)
{
  uint64_t result = sub_1E4CBF1D0();
  *a2 = 0;
  return result;
}

uint64_t sub_1E4C7F0BC(uint64_t a1, id *a2)
{
  char v3 = sub_1E4CBF1E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1E4C7F13C@<X0>(uint64_t *a1@<X8>)
{
  sub_1E4CBF1F0();
  uint64_t v2 = sub_1E4CBF1C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1E4C7F184()
{
  uint64_t v0 = sub_1E4CBF1F0();
  uint64_t v2 = v1;
  if (v0 == sub_1E4CBF1F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1E4CBF6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1E4C7F214(uint64_t a1)
{
  uint64_t v2 = sub_1E4C7E0A8(&qword_1EAE8D778, type metadata accessor for Key);
  uint64_t v3 = sub_1E4C7E0A8(&qword_1EAE8D7E8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1E4C7F2D0()
{
  return sub_1E4C7E0A8((unint64_t *)&unk_1EAE8DEE0, type metadata accessor for Key);
}

uint64_t sub_1E4C7F318()
{
  return sub_1E4C7E0A8(&qword_1EAE8D7C0, type metadata accessor for Key);
}

uint64_t sub_1E4C7F360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1E4CBF1C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1E4C7F3A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4CBF1F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1E4C7F3D4(uint64_t a1)
{
  uint64_t v2 = sub_1E4C7E0A8(&qword_1EAE8D760, type metadata accessor for OptionKey);
  uint64_t v3 = sub_1E4C7E0A8(&qword_1EAE8D7E0, type metadata accessor for OptionKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1E4C7F490()
{
  return sub_1E4C7E0A8(&qword_1EAE8D7C8, type metadata accessor for OptionKey);
}

uint64_t sub_1E4C7F4D8()
{
  return sub_1E4C7E0A8(&qword_1EAE8D7D0, type metadata accessor for OptionKey);
}

uint64_t sub_1E4C7F520()
{
  return sub_1E4C7E0A8((unint64_t *)&unk_1EAE8DEF0, type metadata accessor for Key);
}

uint64_t sub_1E4C7F568()
{
  return sub_1E4C7E0A8(&qword_1EAE8D7D8, type metadata accessor for OptionKey);
}

unint64_t sub_1E4C7F5B0(uint64_t a1)
{
  sub_1E4CBF1F0();
  sub_1E4CBF720();
  sub_1E4CBF230();
  uint64_t v2 = sub_1E4CBF740();
  swift_bridgeObjectRelease();

  return sub_1E4C7F6BC(a1, v2);
}

uint64_t sub_1E4C7F644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D7F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1E4C7F6AC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1E4C7F6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1E4CBF1F0();
    uint64_t v8 = v7;
    if (v6 == sub_1E4CBF1F0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1E4CBF6D0();
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
          uint64_t v13 = sub_1E4CBF1F0();
          uint64_t v15 = v14;
          if (v13 == sub_1E4CBF1F0() && v15 == v16) {
            break;
          }
          char v18 = sub_1E4CBF6D0();
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

uint64_t sub_1E4C7F840()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE900D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE900D8);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4C7F8B8()
{
  if (qword_1EAE8E640 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE900D8);
}

uint64_t sub_1E4C7F91C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8E640 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE900D8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1E4C7F9C4()
{
  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1E4CBE8B0();

  return v2;
}

uint64_t type metadata accessor for HPSAdaptiveVolumeSliderCell()
{
  return self;
}

uint64_t AAAutoANCStrength.description.getter(int a1)
{
  if (a1 > 1049)
  {
    if (a1 == 1050) {
      return 0x6D756964656DLL;
    }
    if (a1 == 1100) {
      return 1751607624;
    }
  }
  else
  {
    if (!a1) {
      return 1061109567;
    }
    if (a1 == 1000) {
      return 7827308;
    }
  }
  type metadata accessor for AAAutoANCStrength();
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

void type metadata accessor for AAAutoANCStrength()
{
  if (!qword_1EAE8D888)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAE8D888);
    }
  }
}

uint64_t sub_1E4C7FB9C(int a1)
{
  uint64_t v1 = 0;
  if (a1 <= 1049)
  {
    if (a1)
    {
      if (a1 == 1000) {
        return 2;
      }
      goto LABEL_9;
    }
    return v1;
  }
  if (a1 == 1100) {
    return v1;
  }
  if (a1 == 1050) {
    return 1;
  }
LABEL_9:
  type metadata accessor for AAAutoANCStrength();
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

uint64_t sub_1E4C7FC18()
{
  return AAAutoANCStrength.description.getter(*v0);
}

uint64_t sub_1E4C7FC20()
{
  uint64_t v1 = 0;
  int v2 = *v0;
  if (*v0 > 1049)
  {
    if (v2 == 1100) {
      return v1;
    }
    if (v2 == 1050) {
      return 1;
    }
  }
  else
  {
    if (!v2) {
      return v1;
    }
    if (v2 == 1000) {
      return 2;
    }
  }
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

id sub_1E4C7FC94()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider;
  int v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  }
  else
  {
    uint64_t v4 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8D0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1E4CC4DC0;
    type metadata accessor for HPSAdaptiveVolumeSliderCell();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v7 = self;
    id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v9 = sub_1E4CBE8B0();
    uint64_t v11 = v10;

    *(void *)(v5 + 32) = v9;
    *(void *)(v5 + 40) = v11;
    id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    uint64_t v13 = sub_1E4CBE8B0();
    uint64_t v15 = v14;

    *(void *)(v5 + 48) = v13;
    *(void *)(v5 + 56) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8D8);
    id v16 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    uint64_t v17 = sub_1E4CBE8B0();
    uint64_t v19 = v18;

    *(void *)(v5 + 64) = v17;
    *(void *)(v5 + 72) = v19;
    id v20 = (void *)sub_1E4CA18A4(v5, (uint64_t)&unk_1F4096118);
    objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, 0xE000000000000000);
    sub_1E4C7D240(&qword_1EAE8D8E0, &qword_1EAE8D8D8);
    v28[0] = sub_1E4CBEFE0();
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v21;
    *(void *)(v23 + 24) = v22;
    sub_1E4CBF000();
    sub_1E4CBF0E0();
    swift_release();
    swift_release();
    id v24 = (void (*)(void *, void))(*(uint64_t (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v4)
                                                                                     + 0x90))(v28);
    sub_1E4CBEFC0();
    swift_release();
    v24(v28, 0);
    id v25 = *(void **)((char *)v4 + v1);
    *(void *)((char *)v4 + v1) = v20;
    id v3 = v20;

    int v2 = 0;
  }
  id v26 = v2;
  return v3;
}

void sub_1E4C80058(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E4CBEEB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1E4E8B570](a1 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = *(void **)(v8 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice);
    if (!v10 || (swift_beginAccess(), (uint64_t v11 = MEMORY[0x1E4E8B570](a2 + 16)) == 0))
    {

      return;
    }
    id v12 = (void *)v11;
    uint64_t v13 = qword_1EAE8E640;
    id v14 = v10;
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_1EAE900D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    id v16 = v12;
    uint64_t v17 = sub_1E4CBEE90();
    int v18 = sub_1E4CBF3B0();
    BOOL v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
    id v20 = (void *)MEMORY[0x1E4FBC8C8];
    if (!v19)
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_19:
      sub_1E4CBEAD0();
      (*(void (**)(uint64_t *__return_ptr))((*v20 & *v16) + 0xC0))(&v32);
      sub_1E4CBED50();
      swift_release();

      return;
    }
    int v28 = v18;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v31 = sub_1E4C8304C(0x726564696C73, 0xE600000000000000, &v32);
    uint64_t v22 = sub_1E4CBF520();
    *(_WORD *)(v21 + 12) = 2080;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v16) + 0xC0))(&v31, v22);
    int v23 = v31;
    id v29 = v14;
    if ((int)v31 > 1049)
    {
      if (v31 == 1050)
      {
        unint64_t v24 = 0xE600000000000000;
        uint64_t v25 = 0x6D756964656DLL;
        goto LABEL_18;
      }
      if (v31 == 1100)
      {
        unint64_t v24 = 0xE400000000000000;
        uint64_t v25 = 1751607624;
        goto LABEL_18;
      }
    }
    else
    {
      if (!v31)
      {
        unint64_t v24 = 0xE400000000000000;
        uint64_t v25 = 1061109567;
LABEL_18:
        uint64_t v31 = sub_1E4C8304C(v25, v24, &v32);
        sub_1E4CBF520();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E4BFE000, v17, (os_log_type_t)v28, "%s: HPSAdaptiveVolumeSliderCell %s", (uint8_t *)v21, 0x16u);
        uint64_t v26 = v27;
        swift_arrayDestroy();
        MEMORY[0x1E4E8B4E0](v26, -1, -1);
        MEMORY[0x1E4E8B4E0](v21, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        id v14 = v29;
        id v20 = (void *)MEMORY[0x1E4FBC8C8];
        goto LABEL_19;
      }
      if (v31 == 1000)
      {
        unint64_t v24 = 0xE300000000000000;
        uint64_t v25 = 7827308;
        goto LABEL_18;
      }
    }

    type metadata accessor for AAAutoANCStrength();
    int v30 = v23;
    sub_1E4CBF6E0();
    __break(1u);
  }
}

uint64_t sub_1E4C804B4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = a1;
  return MEMORY[0x1F41817F8]();
}

void (*sub_1E4C804C8(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_1E4C7FC94();
  return sub_1E4C80510;
}

void sub_1E4C80510(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  *(void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = v2;
}

uint64_t sub_1E4C80528()
{
  return sub_1E4C819A4();
}

uint64_t sub_1E4C80534(uint64_t a1)
{
  return sub_1E4C819F8(a1, &OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners);
}

uint64_t (*sub_1E4C80540())()
{
  return j__swift_endAccess;
}

void sub_1E4C8059C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D808);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D810);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E4CBF4C0();
  uint64_t v82 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D818);
  uint64_t v81 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  id v14 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D820);
  id v83 = *(void (***)(void, void))(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
  }
  sub_1E4C81220((uint64_t)&v85, (uint64_t)v87);
  if (!v88) {
    goto LABEL_16;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8D828);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v79 = v15;
  int v18 = v1;
  BOOL v19 = v84;
  id v20 = (void *)sub_1E4CBF1C0();
  id v80 = v19;
  id v21 = objc_msgSend(v19, sel_objectForKey_, v20);

  if (v21)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
  }
  sub_1E4C81220((uint64_t)&v85, (uint64_t)v87);
  if (!v88)
  {

LABEL_16:
    sub_1E4C8370C((uint64_t)v87, (uint64_t *)&unk_1EAE8DDD0);
    goto LABEL_17;
  }
  sub_1E4CBEC80();
  if (swift_dynamicCast())
  {
    uint64_t v22 = v84;
    uint64_t v23 = OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice;
    unint64_t v24 = *(void **)((char *)v18 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice);
    *(void *)((char *)v18 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = v84;
    id v76 = v22;

    uint64_t v77 = v23;
    uint64_t v78 = v18;
    uint64_t v25 = *(void **)((char *)v18 + v23);
    if (v25)
    {
      id v26 = v25;
      sub_1E4CBEAD0();

      sub_1E4CBED60();
      swift_release();
      sub_1E4CBF4B0();
      uint64_t v27 = v82;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56))(v8, 1, 1, v9);
      v87[0] = objc_msgSend(self, sel_mainRunLoop);
      uint64_t v28 = sub_1E4CBF4A0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v5, 1, 1, v28);
      sub_1E4C7EA5C(0, &qword_1EAE8D838);
      sub_1E4C7D240(&qword_1EAE8D840, &qword_1EAE8D818);
      sub_1E4C836A4();
      sub_1E4CBF090();
      sub_1E4C8370C((uint64_t)v5, &qword_1EAE8D808);

      sub_1E4C8370C((uint64_t)v8, &qword_1EAE8D810);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v9);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v14, v12);
      uint64_t v29 = swift_allocObject();
      int v30 = v78;
      swift_unknownObjectWeakInit();
      uint64_t v31 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = v29;
      *(void *)(v32 + 24) = v31;
      sub_1E4C7D240(&qword_1EAE8D850, &qword_1EAE8D820);
      uint64_t v33 = v79;
      sub_1E4CBF0E0();
      swift_release();
      ((void (**)(char *, uint64_t))v83)[1](v17, v33);
      id v34 = (void *)MEMORY[0x1E4FBC8C8];
      id v35 = (void (*)(id *, void))(*(uint64_t (**)(id *))((*MEMORY[0x1E4FBC8C8] & *v30) + 0x90))(v87);
      sub_1E4CBEFC0();
      swift_release();
      v35(v87, 0);
      id v36 = objc_msgSend(v30, sel_contentView);
      id v37 = objc_msgSend(v36, sel_subviews);

      sub_1E4C7EA5C(0, &qword_1EAE8D858);
      unint64_t v38 = sub_1E4CBF2A0();

      id v39 = *(uint64_t (**)(void))((*v34 & *v30) + 0x68);
      id v40 = (void *)v39();
      LOBYTE(v33) = sub_1E4C81288((uint64_t)v40, v38);

      uint64_t v41 = swift_bridgeObjectRelease();
      id v42 = (void *)((uint64_t (*)(uint64_t))v39)(v41);
      id v43 = v42;
      if (v33)
      {
        objc_msgSend(v42, sel_layoutIfNeeded);

        objc_msgSend(v30, sel_layoutIfNeeded);
      }
      else
      {
        id v49 = v76;
        sub_1E4CBEAD0();
        int v50 = sub_1E4CBED40();
        swift_release();
        LODWORD(v87[0]) = v50;
        (*(void (**)(id *))((*v34 & *v43) + 0xC8))(v87);

        id v51 = objc_msgSend(v30, sel_contentView);
        id v52 = (void *)v39();
        objc_msgSend(v51, sel_addSubview_, v52);

        id v83 = (void (**)(void, void))self;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
        uint64_t v53 = swift_allocObject();
        *(_OWORD *)(v53 + 16) = xmmword_1E4CC4DD0;
        uint64_t v54 = (void *)v39();
        id v55 = objc_msgSend(v54, sel_topAnchor);

        id v56 = objc_msgSend(v30, sel_contentView);
        id v57 = objc_msgSend(v56, sel_topAnchor);

        id v58 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v57, 0.0);
        *(void *)(v53 + 32) = v58;
        uint64_t v59 = (void *)v39();
        id v60 = objc_msgSend(v59, sel_leadingAnchor);

        id v61 = objc_msgSend(v30, sel_contentView);
        id v62 = objc_msgSend(v61, sel_leadingAnchor);

        id v63 = objc_msgSend(v60, sel_constraintEqualToAnchor_constant_, v62, 20.0);
        *(void *)(v53 + 40) = v63;
        v64 = (void *)v39();
        id v65 = objc_msgSend(v64, sel_trailingAnchor);

        id v66 = objc_msgSend(v30, sel_contentView);
        id v67 = objc_msgSend(v66, sel_trailingAnchor);

        id v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v67, -20.0);
        *(void *)(v53 + 48) = v68;
        uint64_t v69 = (void *)v39();
        id v70 = objc_msgSend(v69, sel_bottomAnchor);

        id v71 = objc_msgSend(v30, sel_contentView);
        id v72 = objc_msgSend(v71, sel_bottomAnchor);

        id v73 = objc_msgSend(v70, sel_constraintEqualToAnchor_constant_, v72, 0.0);
        *(void *)(v53 + 56) = v73;
        v87[0] = (id)v53;
        sub_1E4CBF2C0();
        sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
        v74 = (void *)sub_1E4CBF290();
        swift_bridgeObjectRelease();
        objc_msgSend(v83, sel_activateConstraints_, v74);
      }
      return;
    }
LABEL_26:
    __break(1u);
    return;
  }

LABEL_17:
  if (qword_1EAE8E640 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v44, (uint64_t)qword_1EAE900D8);
  id v45 = sub_1E4CBEE90();
  os_log_type_t v46 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v45, v46))
  {
    id v47 = (uint8_t *)swift_slowAlloc();
    id v48 = (void *)swift_slowAlloc();
    v87[0] = v48;
    *(_DWORD *)id v47 = 136315138;
    *(void *)&long long v85 = sub_1E4C8304C(0xD00000000000001ALL, 0x80000001E4CCC9A0, (uint64_t *)v87);
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, v45, v46, "%s HPSAdaptiveVolumeSliderCell Depedencies not meet, bailing out of HPSAdaptiveVolumeSliderCell refresh", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v48, -1, -1);
    MEMORY[0x1E4E8B4E0](v47, -1, -1);
  }
}

uint64_t sub_1E4C81220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4C81288(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1E4CBF650())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x1E4E8A770](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_1E4C7EA5C(0, &qword_1EAE8D858);
      char v7 = sub_1E4CBF470();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1E4CBF470();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x1E4E8A770](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1E4CBF470();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

id sub_1E4C8146C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = v4;
  if (a3)
  {
    uint64_t v8 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_1E4C814FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  if (a3)
  {
    char v7 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  id v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_1E4C81640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  if (a3)
  {
    uint64_t v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_1E4C816BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  if (a3)
  {
    id v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  return v6;
}

id sub_1E4C81834(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_1E4C81924()
{
  return sub_1E4C82FB8(type metadata accessor for HPSAdaptiveVolumeSliderCell);
}

uint64_t sub_1E4C81998()
{
  return sub_1E4C819A4();
}

uint64_t sub_1E4C819A4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4C819EC(uint64_t a1)
{
  return sub_1E4C819F8(a1, &OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners);
}

uint64_t sub_1E4C819F8(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *unint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C81A48())()
{
  return j_j__swift_endAccess;
}

id sub_1E4C81AA4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_1E4C81B1C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection] = 0;
  if (a2)
  {
    objc_super v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeDetailController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void sub_1E4C81C28()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection] = 0;

  sub_1E4CBF640();
  __break(1u);
}

uint64_t sub_1E4C81D4C()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection;
  if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection];
  }
  else
  {
    id v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
    type metadata accessor for HPSAdaptiveVolumeSliderCell();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v6 = sub_1E4CBE8B0();
    uint64_t v8 = v7;

    uint64_t v9 = sub_1E4C87A94();
    uint64_t v11 = sub_1E4C87AA0(v9, v10, v6, v8);
    uint64_t v12 = (*(uint64_t (**)(void (*)(void *), void))(*(void *)v11 + 144))(sub_1E4C81FFC, 0);
    swift_release();
    v20[3] = type metadata accessor for HPSAdaptiveVolumeDetailController();
    v20[0] = v3;
    id v13 = v3;
    char v14 = sub_1E4C877B0();
    __n128 v15 = sub_1E4C879DC(0, 0, 0, 0, (uint64_t)v20, 0, 0, -1, (uint64_t)v21, 0, v14 & 1, 0, 0, (__n128)0, 0);
    uint64_t v16 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v12 + 160))(v21, v15);
    swift_release();
    sub_1E4C8411C((uint64_t)v21);
    uint64_t v22 = v13;
    uint64_t v17 = (*(uint64_t (**)(void (*)(void *), unsigned char *))(*(void *)v16 + 168))(sub_1E4C84170, v21);
    uint64_t v18 = swift_release();
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 176))(v18);
    swift_release();
    *(void *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1E4C81FFC(void *a1)
{
  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  id v4 = (id)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v4, *MEMORY[0x1E4F93170], 0xE000000000000000);
}

unint64_t sub_1E4C82108(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8C0);
  uint64_t v2 = (void *)sub_1E4CBF680();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1E4C838F4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_1E4C82224(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C8223C(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_1E4C81D4C();
  return sub_1E4C82284;
}

uint64_t sub_1E4C82284(void *a1)
{
  *(void *)(a1[1]
            + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = *a1;
  return swift_bridgeObjectRelease();
}

void sub_1E4C8229C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v0, sel_specifier);
  if (!v6)
  {
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_userInfo);

  if (v8)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
  }
  sub_1E4C81220((uint64_t)&v36, (uint64_t)v38);
  if (!v39)
  {
LABEL_15:
    sub_1E4C8370C((uint64_t)v38, (uint64_t *)&unk_1EAE8DDD0);
    goto LABEL_16;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8D828);
  if (swift_dynamicCast())
  {
    id v9 = v35;
    char v10 = (void *)sub_1E4CBF1C0();
    id v11 = objc_msgSend(v9, sel_objectForKey_, v10);

    if (v11)
    {
      sub_1E4CBF550();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
    }
    sub_1E4C81220((uint64_t)&v36, (uint64_t)v38);
    if (v39)
    {
      sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D878);
      if (swift_dynamicCast())
      {
        id v12 = v35;
        id v13 = objc_msgSend(v35, sel_headphoneDevice);
        if (v13)
        {
          uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice];
          *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = v13;
          id v15 = v13;

          uint64_t v16 = (objc_class *)type metadata accessor for HPSAdaptiveVolumeDetailController();
          v34.receiver = v1;
          v34.super_class = v16;
          objc_msgSendSuper2(&v34, sel_viewDidLoad);
          id v17 = objc_msgSend(v1, sel_navigationItem);
          type metadata accessor for HPSAdaptiveVolumeSliderCell();
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          id v19 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1E4CBE8B0();

          id v20 = (void *)sub_1E4CBF1C0();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_setTitle_, v20);

          return;
        }
      }
      else
      {
      }
      goto LABEL_16;
    }

    goto LABEL_15;
  }
LABEL_16:
  if (qword_1EAE8E640 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE900D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v21, v2);
  uint64_t v22 = sub_1E4CBEE90();
  os_log_type_t v23 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v33 = v5;
    uint64_t v26 = v25;
    v38[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    *(void *)&long long v36 = sub_1E4C8304C(0x4C64694477656976, 0xED0000292864616FLL, v38);
    sub_1E4CBF520();
    *(_WORD *)(v24 + 12) = 2080;
    sub_1E4CBECC0();
    uint64_t v27 = (void *)sub_1E4CBECB0();
    sub_1E4CBECA0();

    sub_1E4CBEC80();
    uint64_t v28 = sub_1E4CBF1B0();
    uint64_t v32 = v2;
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    *(void *)&long long v36 = sub_1E4C8304C(v28, v30, v38);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E4BFE000, v22, v23, "%s: HPSAdaptiveVolumeDetailController Depedencies not meet! %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v26, -1, -1);
    MEMORY[0x1E4E8B4E0](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v33, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1E4C828A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  id v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice))
  {
    unint64_t v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))(v4);
    unint64_t v27 = MEMORY[0x1E4FBC860];
    sub_1E4C83A50(v7);
    unint64_t v8 = v27;
    sub_1E4C7EA5C(0, &qword_1EAE8D880);
    id v9 = (void *)sub_1E4CBF290();
    char v10 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v1, sel_setValue_forKey_, v9, v10);

    uint64_t v11 = sub_1E4C82CCC(v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1E4C7EA5C(0, &qword_1EAE8D880);
    id v12 = (void *)sub_1E4CBF290();
    id v13 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v1, sel_setValue_forKey_, v12, v13);

    if (qword_1EAE8E640 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE900D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    id v15 = sub_1E4CBEE90();
    os_log_type_t v16 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      unint64_t v27 = v25;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v26 = sub_1E4C8304C(0x6569666963657073, 0xEC00000029287372, (uint64_t *)&v27);
      sub_1E4CBF520();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v24 = v17 + 14;
      sub_1E4CBECC0();
      uint64_t v18 = (void *)sub_1E4CBECB0();
      sub_1E4CBECA0();

      sub_1E4CBEC80();
      uint64_t v19 = sub_1E4CBF1B0();
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      uint64_t v26 = sub_1E4C8304C(v19, v21, (uint64_t *)&v27);
      sub_1E4CBF520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E4BFE000, v15, v16, "%s: HPSAdaptiveVolumeDetailController Depedencies not meet! %s", (uint8_t *)v17, 0x16u);
      uint64_t v22 = v25;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v22, -1, -1);
      MEMORY[0x1E4E8B4E0](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v11;
}

uint64_t sub_1E4C82CCC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1E4C83C1C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x1E4E8A770](i, a1);
        sub_1E4C7EA5C(0, &qword_1EAE8D880);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1E4C83C1C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1E4C83C1C(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_1E4C7F6AC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      unint64_t v8 = (id *)(a1 + 32);
      sub_1E4C7EA5C(0, &qword_1EAE8D880);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1E4C83C1C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1E4C83C1C(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_1E4C7F6AC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_1E4C82FA0()
{
  return sub_1E4C82FB8(type metadata accessor for HPSAdaptiveVolumeDetailController);
}

id sub_1E4C82FB8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1E4C8304C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E4C83120(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E4C842F8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E4C842F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1E4C83120(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E4CBF530();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E4C832DC(a5, a6);
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
  uint64_t v8 = sub_1E4CBF5D0();
  if (!v8)
  {
    sub_1E4CBF630();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E4CBF690();
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

uint64_t sub_1E4C832DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E4C83374(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E4C83554(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E4C83554(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E4C83374(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1E4C834EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E4CBF5A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E4CBF630();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E4CBF260();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E4CBF690();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E4CBF630();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E4C834EC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E4C83554(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1E4CBF690();
  __break(1u);
  return result;
}

unint64_t sub_1E4C836A4()
{
  unint64_t result = qword_1EAE8D848;
  if (!qword_1EAE8D848)
  {
    sub_1E4C7EA5C(255, &qword_1EAE8D838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D848);
  }
  return result;
}

uint64_t sub_1E4C8370C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E4C83768()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4C837A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4E8B570](v3);
  if (v4)
  {
    size_t v5 = (void *)v4;
    swift_beginAccess();
    uint64_t v6 = MEMORY[0x1E4E8B570](v2 + 16);
    if (v6)
    {
      int64_t v7 = (void *)v6;
      int64_t v8 = (void *)MEMORY[0x1E4FBC8C8];
      int64_t v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x68))();
      sub_1E4CBEAD0();
      int v10 = sub_1E4CBED40();
      swift_release();
      int v11 = v10;
      (*(void (**)(int *))((*v8 & *v9) + 0xC8))(&v11);
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for HPSAdaptiveVolumeDetailController()
{
  return self;
}

unint64_t sub_1E4C838F4(uint64_t a1, uint64_t a2)
{
  sub_1E4CBF720();
  sub_1E4CBF230();
  uint64_t v4 = sub_1E4CBF740();

  return sub_1E4C8396C(a1, a2, v4);
}

unint64_t sub_1E4C8396C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E4CBF6D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1E4CBF6D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1E4C83A50(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1E4E8A780](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1E4C83DAC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1E4CBF2C0();
}

uint64_t sub_1E4C83C1C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E4C83C3C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1E4C83C3C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    int v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int v10 = (char *)MEMORY[0x1E4FBC860];
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1E4CBF690();
  __break(1u);
  return result;
}

uint64_t sub_1E4C83DAC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1E4C7D240((unint64_t *)&qword_1EAE8D8A0, &qword_1EAE8D898);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D898);
          uint64_t v12 = sub_1E4C83FE0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1E4C7EA5C(0, &qword_1EAE8D880);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1E4CBF690();
  __break(1u);
  return result;
}

void (*sub_1E4C83FE0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1E4C84090(v6, a2, a3);
  return sub_1E4C84048;
}

void sub_1E4C84048(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1E4C84090(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1E4E8A770](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1E4C84110;
  }
  __break(1u);
  return result;
}

void sub_1E4C84110(id *a1)
{
}

uint64_t sub_1E4C8411C(uint64_t a1)
{
  return a1;
}

void sub_1E4C84170(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8B0);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_1E4CBF6F0(), *MEMORY[0x1E4F930A8]);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E4CC4A40;
  *(void *)(inited + 32) = 0x6E6F687064616568;
  *(void *)(inited + 40) = 0xEF65636976654465;
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice);
  if (v5)
  {
    uint64_t v6 = inited;
    *(void *)(inited + 48) = v5;
    id v7 = v5;
    sub_1E4C82108(v6);
    sub_1E4CBEC80();
    uint64_t v8 = (void *)sub_1E4CBF180();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E4C842F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_5Tm_0()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4C84398()
{
  sub_1E4C80058(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1E4C843AC(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D808);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (void *)sub_1E4C7EA5C(255, &qword_1EAE8D838);
  WitnessTable = (void *)swift_getWitnessTable();
  uint64_t v6 = (void *)sub_1E4C872D0((unint64_t *)&qword_1EAE8D848, &qword_1EAE8D838);
  v14[0] = a1;
  v14[1] = v4;
  v14[2] = WitnessTable;
  v14[3] = v6;
  uint64_t v7 = sub_1E4CBEFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)v14 - v9;
  v14[0] = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v11 = sub_1E4CBF4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
  sub_1E4CBF0A0();
  sub_1E4C8370C((uint64_t)v3, &qword_1EAE8D808);

  swift_getWitnessTable();
  uint64_t v12 = sub_1E4CBF070();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

id sub_1E4C84610(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  id v8 = objc_msgSend(objc_allocWithZone(v6), sel_initWithFrame_device_darkMode_, a1, a2 & 1, a3, a4, a5, a6);

  return v8;
}

void *sub_1E4C84694(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  *(void *)&v6[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners] = MEMORY[0x1E4FBC870];
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  BOOL v13 = objc_msgSendSuper2(&v16, sel_initWithFrame_device_darkMode_, a1, a2 & 1, a3, a4, a5, a6);
  id v14 = objc_msgSend(a1, sel_headphoneDevice);
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v13) + 0x78))();

  return v13;
}

uint64_t type metadata accessor for ModernBatteryStatusView()
{
  return self;
}

uint64_t sub_1E4C848C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1E4CBEB40();
  float v8 = v7 * 100.0;
  if ((~COERCE_INT(v7 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v8 <= -1.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 >= 256.0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t result = sub_1E4CBEB50();
  float v10 = v9 * 100.0;
  if ((~COERCE_INT(v9 * 100.0) & 0x7F800000) == 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v10 <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v10 >= 256.0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t result = sub_1E4CBEC00();
  float v12 = v11 * 100.0;
  if ((~COERCE_INT(v11 * 100.0) & 0x7F800000) == 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v12 >= 256.0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = sub_1E4CBEB60();
  float v14 = v13 * 100.0;
  if ((~LODWORD(v14) & 0x7F800000) == 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v14 <= -1.0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v14 >= 256.0)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  uint64_t v35 = v3;
  int v39 = (int)v10;
  int v40 = (int)v8;
  int v37 = (int)v14;
  int v38 = (int)v12;
  int v36 = sub_1E4CBEB70();
  char v15 = sub_1E4CBEB80();
  unsigned __int8 v16 = sub_1E4CBEC10();
  char v17 = sub_1E4CBEB90();
  sub_1E4CBEE70();
  uint64_t v18 = sub_1E4CBEE90();
  os_log_type_t v19 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v18, v19))
  {
    BOOL v32 = v16 == 1;
    BOOL v33 = v17 == 1;
    BOOL v30 = v36 == 1;
    BOOL v31 = v15 == 1;
    unint64_t v20 = (_DWORD *)swift_slowAlloc();
    uint64_t v34 = v2;
    unint64_t v21 = v20;
    _DWORD *v20 = 16779264;
    LOBYTE(v41) = v40;
    sub_1E4CBF520();
    *(_WORD *)((char *)v21 + 5) = 256;
    LOBYTE(v41) = v39;
    sub_1E4CBF520();
    *((_WORD *)v21 + 4) = 256;
    LOBYTE(v41) = v38;
    sub_1E4CBF520();
    *(_WORD *)((char *)v21 + 11) = 256;
    LOBYTE(v41) = v37;
    sub_1E4CBF520();
    *((_WORD *)v21 + 7) = 1024;
    int v41 = v30;
    sub_1E4CBF520();
    *((_WORD *)v21 + 10) = 1024;
    int v41 = v31;
    sub_1E4CBF520();
    *((_WORD *)v21 + 13) = 1024;
    int v41 = v32;
    sub_1E4CBF520();
    *((_WORD *)v21 + 16) = 1024;
    int v41 = v33;
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, v18, v19, "ModernBatteryStatusView: %hhu %hhu %hhu %hhu | %{BOOL}d %{BOOL}d %{BOOL}d %{BOOL}d", (uint8_t *)v21, 0x26u);
    uint64_t v22 = v21;
    uint64_t v2 = v34;
    MEMORY[0x1E4E8B4E0](v22, -1, -1);
  }
  int v23 = v16;
  int v24 = v36;

  if (v17 == 1) {
    int v25 = -1;
  }
  else {
    int v25 = 0;
  }
  if (v23 == 1) {
    int v26 = -1;
  }
  else {
    int v26 = 0;
  }
  if (v15 == 1) {
    int v27 = -1;
  }
  else {
    int v27 = 0;
  }
  if (v24 == 1) {
    int v28 = -1;
  }
  else {
    int v28 = 0;
  }
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v5, v2);
  *(unsigned char *)a1 = v37;
  *(_DWORD *)(a1 + 4) = v25;
  *(unsigned char *)(a1 + 8) = v38;
  *(_DWORD *)(a1 + 12) = v26;
  *(unsigned char *)(a1 + 16) = v39;
  *(_DWORD *)(a1 + 20) = v27;
  *(unsigned char *)(a1 + 24) = v40;
  *(_DWORD *)(a1 + 28) = v28;
  *(unsigned char *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = 0;
  return result;
}

void sub_1E4C84D58(void *a1)
{
  uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8F0);
  id v160 = *(id *)(v162 - 8);
  MEMORY[0x1F4188790](v162);
  v159 = (char *)v139 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8F8);
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x1F4188790](v164);
  v161 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)v139 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D900);
  uint64_t v154 = *(void *)(v155 - 8);
  MEMORY[0x1F4188790](v155);
  v152 = (char *)v139 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D908);
  uint64_t v157 = *(void *)(v158 - 8);
  MEMORY[0x1F4188790](v158);
  v156 = (char *)v139 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E4CBEEB0();
  uint64_t v183 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  v165 = (char *)v139 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v179 = (char *)v139 - v10;
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D910);
  uint64_t v187 = *(void *)(v171 - 8);
  MEMORY[0x1F4188790](v171);
  v168 = (char *)v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D918);
  uint64_t v181 = *(void *)(v12 - 8);
  uint64_t v182 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  v167 = (char *)v139 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v166 = (char *)v139 - v16;
  MEMORY[0x1F4188790](v15);
  v180 = (char *)v139 - v17;
  uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D920);
  uint64_t v170 = *(void *)(v172 - 8);
  MEMORY[0x1F4188790](v172);
  v169 = (char *)v139 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D928);
  uint64_t v174 = *(void *)(v176 - 8);
  MEMORY[0x1F4188790](v176);
  v173 = (char *)v139 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D930);
  uint64_t v177 = *(void *)(v20 - 8);
  uint64_t v178 = v20;
  MEMORY[0x1F4188790](v20);
  v175 = (char *)v139 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D630);
  MEMORY[0x1F4188790](v22 - 8);
  v185 = (char *)v139 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D808);
  MEMORY[0x1F4188790](v24 - 8);
  v184 = (char *)v139 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D938);
  uint64_t v186 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  int v28 = (char *)v139 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D940);
  v188 = *(void **)(v29 - 8);
  uint64_t v30 = MEMORY[0x1F4188790](v29);
  BOOL v32 = (char *)v139 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x1F4188790](v30);
  uint64_t v35 = (char *)v139 - v34;
  MEMORY[0x1F4188790](v33);
  int v37 = (char *)v139 - v36;
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D948);
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x1F4188790](v149);
  v147 = (char *)v139 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D950);
  uint64_t v151 = *(void *)(v153 - 8);
  MEMORY[0x1F4188790](v153);
  v150 = (char *)v139 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D958);
  uint64_t v41 = MEMORY[0x1F4188790](v40);
  uint64_t v44 = (char *)v139 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v45 = a1;
    v142 = v44;
    uint64_t v143 = v42;
    uint64_t v144 = v41;
    os_log_type_t v46 = v1;
    id v47 = &v1[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners];
    swift_beginAccess();
    v146 = v47;
    uint64_t v48 = *(void *)v47;
    uint64_t v145 = v7;
    if ((v48 & 0xC000000000000001) != 0)
    {
      id v49 = v45;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_1E4CBF570();
      swift_bridgeObjectRelease();
      if (v50)
      {
LABEL_4:

        return;
      }
    }
    else
    {
      uint64_t v51 = *(void *)(v48 + 16);
      id v52 = v45;
      if (v51) {
        goto LABEL_4;
      }
    }
    uint64_t v53 = v46;
    if (objc_msgSend(v46, sel_untethered))
    {
      v141 = v45;
      sub_1E4CBEBA0();
      id v160 = self;
      id v190 = objc_msgSend(v160, sel_mainRunLoop);
      uint64_t v164 = sub_1E4CBF4A0();
      uint64_t v54 = *(void *)(v164 - 8);
      v161 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56);
      uint64_t v163 = v54 + 56;
      uint64_t v55 = (uint64_t)v184;
      v161(v184, 1, 1, v164);
      v140 = v46;
      uint64_t v162 = sub_1E4C7EA5C(0, &qword_1EAE8D838);
      uint64_t v155 = MEMORY[0x1E4F1AC68];
      uint64_t v158 = sub_1E4C7D240(&qword_1EAE8D960, &qword_1EAE8D940);
      v165 = (char *)sub_1E4C872D0((unint64_t *)&qword_1EAE8D848, &qword_1EAE8D838);
      sub_1E4CBF0A0();
      sub_1E4C8370C(v55, &qword_1EAE8D808);

      v159 = (char *)MEMORY[0x1E4F1AAB8];
      uint64_t v157 = sub_1E4C7D240(&qword_1EAE8D9B0, &qword_1EAE8D938);
      id v56 = (void *)sub_1E4CBF070();
      id v57 = *(char **)(v186 + 8);
      v186 += 8;
      v156 = v57;
      ((void (*)(char *, uint64_t))v57)(v28, v26);
      uint64_t v154 = v188[1];
      ++v188;
      ((void (*)(char *, uint64_t))v154)(v37, v29);
      id v190 = v56;
      sub_1E4CBEBB0();
      id v58 = v160;
      id v191 = objc_msgSend(v160, sel_mainRunLoop);
      uint64_t v59 = v164;
      v161((char *)v55, 1, 1, v164);
      sub_1E4CBF0A0();
      sub_1E4C8370C(v55, &qword_1EAE8D808);

      id v60 = (void *)sub_1E4CBF070();
      ((void (*)(char *, uint64_t))v156)(v28, v26);
      id v61 = v35;
      id v62 = (void (*)(char *, uint64_t))v154;
      ((void (*)(char *, uint64_t))v154)(v61, v29);
      id v191 = v60;
      sub_1E4CBEC20();
      id v189 = objc_msgSend(v58, sel_mainRunLoop);
      id v63 = v161;
      v161((char *)v55, 1, 1, v59);
      sub_1E4CBF0A0();
      sub_1E4C8370C(v55, &qword_1EAE8D808);

      v64 = (void *)sub_1E4CBF070();
      ((void (*)(char *, uint64_t))v156)(v28, v26);
      v62(v32, v29);
      id v189 = v64;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D968);
      v139[1] = MEMORY[0x1E4F1AAE8];
      sub_1E4C7D240(&qword_1EAE8D970, &qword_1EAE8D968);
      id v65 = v147;
      sub_1E4CBEFA0();
      uint64_t v158 = MEMORY[0x1E4F1A808];
      sub_1E4C7D240(&qword_1EAE8D9B8, &qword_1EAE8D948);
      uint64_t v66 = v149;
      id v67 = (void *)sub_1E4CBF070();
      (*(void (**)(char *, uint64_t))(v148 + 8))(v65, v66);
      id v190 = v67;
      uint64_t v148 = sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D670);
      id v191 = (id)sub_1E4CBF420();
      v156 = (char *)sub_1E4CBF3F0();
      uint64_t v68 = *((void *)v156 - 1);
      uint64_t v154 = *(void *)(v68 + 56);
      uint64_t v157 = v68 + 56;
      uint64_t v69 = (uint64_t)v185;
      ((void (*)(char *, uint64_t, uint64_t, char *))v154)(v185, 1, 1, v156);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D9C0);
      sub_1E4C7D240(&qword_1EAE8D9C8, &qword_1EAE8D9C0);
      v152 = (char *)sub_1E4C872D0((unint64_t *)&qword_1EAE8D680, (unint64_t *)&qword_1EAE8D670);
      id v70 = v150;
      sub_1E4CBF0A0();
      sub_1E4C8370C(v69, &qword_1EAE8D630);

      swift_release();
      uint64_t v71 = swift_allocObject();
      id v72 = v140;
      swift_unknownObjectWeakInit();
      uint64_t v73 = swift_allocObject();
      v74 = v141;
      *(void *)(v73 + 16) = v71;
      *(void *)(v73 + 24) = v74;
      type metadata accessor for BTDeviceBatteryStatus(0);
      uint64_t v149 = v75;
      sub_1E4C7D240(&qword_1EAE8D9D0, &qword_1EAE8D950);
      v188 = v74;
      id v76 = v142;
      uint64_t v77 = v153;
      sub_1E4CBF080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v151 + 8))(v70, v77);
      swift_getKeyPath();
      id v190 = v72;
      uint64_t v153 = MEMORY[0x1E4F1A938];
      sub_1E4C7D240(&qword_1EAE8D9D8, &qword_1EAE8D958);
      uint64_t v78 = v144;
      sub_1E4CBF0F0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v143 + 8))(v76, v78);
      swift_beginAccess();
      sub_1E4CBEFC0();
      swift_endAccess();
      swift_release();
      uint64_t v79 = v180;
      sub_1E4CBEBD0();
      id v80 = v160;
      id v190 = objc_msgSend(v160, sel_mainRunLoop);
      uint64_t v81 = (uint64_t)v184;
      v63(v184, 1, 1, v164);
      uint64_t v155 = sub_1E4C7D240(&qword_1EAE8D988, &qword_1EAE8D918);
      uint64_t v82 = v168;
      uint64_t v83 = v182;
      sub_1E4CBF0A0();
      sub_1E4C8370C(v81, &qword_1EAE8D808);

      uint64_t v151 = sub_1E4C7D240(&qword_1EAE8D9E0, &qword_1EAE8D910);
      uint64_t v84 = v171;
      long long v85 = (void *)sub_1E4CBF070();
      uint64_t v186 = *(void *)(v187 + 8);
      v187 += 8;
      ((void (*)(char *, uint64_t))v186)(v82, v84);
      uint64_t v181 = *(void *)(v181 + 8);
      ((void (*)(char *, uint64_t))v181)(v79, v83);
      id v190 = v85;
      long long v86 = v166;
      sub_1E4CBEBE0();
      id v191 = objc_msgSend(v80, sel_mainRunLoop);
      uint64_t v87 = (uint64_t)v184;
      v161(v184, 1, 1, v164);
      sub_1E4CBF0A0();
      sub_1E4C8370C(v87, &qword_1EAE8D808);

      uint64_t v88 = (void *)sub_1E4CBF070();
      ((void (*)(char *, uint64_t))v186)(v82, v84);
      ((void (*)(char *, uint64_t))v181)(v86, v83);
      id v191 = v88;
      v89 = v167;
      sub_1E4CBEC30();
      id v189 = objc_msgSend(v160, sel_mainRunLoop);
      v161((char *)v87, 1, 1, v164);
      sub_1E4CBF0A0();
      sub_1E4C8370C(v87, &qword_1EAE8D808);

      v90 = (void *)sub_1E4CBF070();
      ((void (*)(char *, uint64_t))v186)(v82, v84);
      ((void (*)(char *, uint64_t))v181)(v89, v83);
      id v189 = v90;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D990);
      sub_1E4C7D240(&qword_1EAE8D998, &qword_1EAE8D990);
      v91 = v169;
      sub_1E4CBEFA0();
      sub_1E4C7D240(&qword_1EAE8D9E8, &qword_1EAE8D920);
      uint64_t v92 = v172;
      v93 = (void *)sub_1E4CBF070();
      (*(void (**)(char *, uint64_t))(v170 + 8))(v91, v92);
      id v190 = v93;
      id v191 = (id)sub_1E4CBF420();
      uint64_t v94 = (uint64_t)v185;
      ((void (*)(char *, uint64_t, uint64_t, char *))v154)(v185, 1, 1, v156);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D9F0);
      sub_1E4C7D240(&qword_1EAE8D9F8, &qword_1EAE8D9F0);
      v95 = v173;
      sub_1E4CBF0A0();
      sub_1E4C8370C(v94, &qword_1EAE8D630);

      swift_release();
      uint64_t v96 = swift_allocObject();
      v97 = v140;
      swift_unknownObjectWeakInit();
      uint64_t v98 = swift_allocObject();
      v99 = v188;
      *(void *)(v98 + 16) = v96;
      *(void *)(v98 + 24) = v99;
      sub_1E4C7D240(&qword_1EAE8DA00, &qword_1EAE8D928);
      v100 = v99;
      v101 = v175;
      uint64_t v102 = v176;
      sub_1E4CBF080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v174 + 8))(v95, v102);
      swift_getKeyPath();
      id v190 = v97;
      sub_1E4C7D240(&qword_1EAE8DA08, &qword_1EAE8D930);
      uint64_t v103 = v178;
      sub_1E4CBF0F0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v177 + 8))(v101, v103);
      swift_beginAccess();
      sub_1E4CBEFC0();
      swift_endAccess();
      swift_release();
      v104 = v179;
      sub_1E4CBEE70();
      v105 = sub_1E4CBEE90();
      os_log_type_t v106 = sub_1E4CBF3B0();
      if (os_log_type_enabled(v105, v106))
      {
        v107 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v107 = 0;
        _os_log_impl(&dword_1E4BFE000, v105, v106, "Battery view listening for untetheredSingle publishers where we listen to both left and right", v107, 2u);
        MEMORY[0x1E4E8B4E0](v107, -1, -1);
        v108 = v100;
      }
      else
      {
        v108 = v105;
        v105 = v100;
      }
      uint64_t v137 = v145;

      (*(void (**)(char *, uint64_t))(v183 + 8))(v104, v137);
    }
    else
    {
      v109 = v45;
      sub_1E4CBEBC0();
      uint64_t v187 = MEMORY[0x1E4F1AC68];
      sub_1E4C7D240(&qword_1EAE8D960, &qword_1EAE8D940);
      v110 = (void *)sub_1E4CBF070();
      ((void (*)(char *, uint64_t))v188[1])(v37, v29);
      id v190 = v110;
      v111 = v53;
      sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D670);
      id v191 = (id)sub_1E4CBF420();
      v179 = (char *)sub_1E4CBF3F0();
      uint64_t v112 = *((void *)v179 - 1);
      uint64_t v186 = *(void *)(v112 + 56);
      v188 = (void *)(v112 + 56);
      uint64_t v113 = (uint64_t)v185;
      ((void (*)(char *, uint64_t, uint64_t, char *))v186)(v185, 1, 1, v179);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D968);
      v184 = (char *)MEMORY[0x1E4F1AAE8];
      sub_1E4C7D240(&qword_1EAE8D970, &qword_1EAE8D968);
      uint64_t v178 = sub_1E4C872D0((unint64_t *)&qword_1EAE8D680, (unint64_t *)&qword_1EAE8D670);
      v114 = v152;
      sub_1E4CBF0A0();
      sub_1E4C8370C(v113, &qword_1EAE8D630);

      swift_release();
      uint64_t v115 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v116 = swift_allocObject();
      *(void *)(v116 + 16) = v115;
      *(void *)(v116 + 24) = v109;
      type metadata accessor for BTDeviceBatteryStatus(0);
      uint64_t v177 = v117;
      uint64_t v176 = MEMORY[0x1E4F1AAB8];
      sub_1E4C7D240(&qword_1EAE8D978, &qword_1EAE8D900);
      id v118 = v109;
      v119 = v156;
      uint64_t v120 = v155;
      sub_1E4CBF080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v154 + 8))(v114, v120);
      swift_getKeyPath();
      id v190 = v111;
      sub_1E4C7D240(&qword_1EAE8D980, &qword_1EAE8D908);
      uint64_t v121 = v158;
      sub_1E4CBF0F0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v157 + 8))(v119, v121);
      swift_beginAccess();
      sub_1E4CBEFC0();
      swift_endAccess();
      swift_release();
      v122 = v180;
      sub_1E4CBEBF0();
      sub_1E4C7D240(&qword_1EAE8D988, &qword_1EAE8D918);
      uint64_t v123 = v182;
      v124 = (void *)sub_1E4CBF070();
      (*(void (**)(char *, uint64_t))(v181 + 8))(v122, v123);
      id v190 = v124;
      id v191 = (id)sub_1E4CBF420();
      ((void (*)(uint64_t, uint64_t, uint64_t, char *))v186)(v113, 1, 1, v179);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D990);
      sub_1E4C7D240(&qword_1EAE8D998, &qword_1EAE8D990);
      v125 = v159;
      sub_1E4CBF0A0();
      sub_1E4C8370C(v113, &qword_1EAE8D630);

      swift_release();
      uint64_t v126 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v127 = swift_allocObject();
      *(void *)(v127 + 16) = v126;
      *(void *)(v127 + 24) = v118;
      sub_1E4C7D240(&qword_1EAE8D9A0, &qword_1EAE8D8F0);
      v128 = v118;
      v129 = (char *)v161;
      uint64_t v130 = v162;
      sub_1E4CBF080();
      swift_release();
      (*((void (**)(char *, uint64_t))v160 + 1))(v125, v130);
      swift_getKeyPath();
      id v190 = v111;
      sub_1E4C7D240(&qword_1EAE8D9A8, &qword_1EAE8D8F8);
      uint64_t v131 = v164;
      sub_1E4CBF0F0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v163 + 8))(v129, v131);
      swift_beginAccess();
      sub_1E4CBEFC0();
      swift_endAccess();
      swift_release();
      v132 = v165;
      sub_1E4CBEE70();
      v133 = sub_1E4CBEE90();
      os_log_type_t v134 = sub_1E4CBF3B0();
      if (os_log_type_enabled(v133, v134))
      {
        v135 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v135 = 0;
        _os_log_impl(&dword_1E4BFE000, v133, v134, "Battery view listening for untetheredSingle publishers where we listen to both left and right", v135, 2u);
        MEMORY[0x1E4E8B4E0](v135, -1, -1);
        v136 = v128;
      }
      else
      {
        v136 = v133;
        v133 = v128;
      }
      uint64_t v138 = v145;

      (*(void (**)(char *, uint64_t))(v183 + 8))(v132, v138);
    }
  }
}

id sub_1E4C86CF4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_status);
  int v4 = v14;
  char v5 = v15;
  int v6 = v16;
  char v7 = v17;
  int v8 = v18;
  char v9 = v19;
  int v10 = v20;
  char v11 = v21;
  int v12 = v22;
  *(unsigned char *)a2 = v13;
  *(_DWORD *)(a2 + 4) = v4;
  *(unsigned char *)(a2 + 8) = v5;
  *(_DWORD *)(a2 + 12) = v6;
  *(unsigned char *)(a2 + 16) = v7;
  *(_DWORD *)(a2 + 20) = v8;
  *(unsigned char *)(a2 + 24) = v9;
  *(_DWORD *)(a2 + 28) = v10;
  *(unsigned char *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = v12;
  return result;
}

id sub_1E4C86D80(char *a1, void **a2)
{
  char v2 = *a1;
  int v3 = *((_DWORD *)a1 + 1);
  char v4 = a1[8];
  int v5 = *((_DWORD *)a1 + 3);
  char v6 = a1[16];
  int v7 = *((_DWORD *)a1 + 5);
  char v8 = a1[24];
  int v9 = *((_DWORD *)a1 + 7);
  char v10 = a1[32];
  int v11 = *((_DWORD *)a1 + 9);
  int v12 = *a2;
  v14[0] = v2;
  int v15 = v3;
  char v16 = v4;
  int v17 = v5;
  char v18 = v6;
  int v19 = v7;
  char v20 = v8;
  int v21 = v9;
  char v22 = v10;
  int v23 = v11;
  return objc_msgSend(v12, sel_setStatus_, v14);
}

void sub_1E4C86E00(uint64_t a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1E4CBEEB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  int v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x1E4E8B570](a1 + 16);
  if (v12)
  {
    char v13 = (void *)v12;
    sub_1E4CBEE70();
    int v14 = sub_1E4CBEE90();
    os_log_type_t v15 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v14, v15))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v16 = 0;
      _os_log_impl(&dword_1E4BFE000, v14, v15, a3, v16, 2u);
      MEMORY[0x1E4E8B4E0](v16, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(_OWORD *__return_ptr, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v13) + 0x70))(v19, a2);

    long long v17 = v19[1];
    *(_OWORD *)a4 = v19[0];
    *(_OWORD *)(a4 + 16) = v17;
    *(void *)(a4 + 32) = v20;
  }
  else
  {
    *(unsigned char *)a4 = 0;
    *(_DWORD *)(a4 + 4) = 0;
    *(unsigned char *)(a4 + 8) = 0;
    *(_DWORD *)(a4 + 12) = 0;
    *(unsigned char *)(a4 + 16) = 0;
    *(_DWORD *)(a4 + 20) = 0;
    *(unsigned char *)(a4 + 24) = 0;
    *(_DWORD *)(a4 + 28) = 0;
    *(unsigned char *)(a4 + 32) = 0;
    *(_DWORD *)(a4 + 36) = 0;
  }
}

void sub_1E4C8706C()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners] = MEMORY[0x1E4FBC870];

  sub_1E4CBF640();
  __break(1u);
}

uint64_t sub_1E4C87160()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners);
  swift_beginAccess();
  *uint64_t v1 = MEMORY[0x1E4FBC870];
  return swift_bridgeObjectRelease();
}

void sub_1E4C87210()
{
}

id sub_1E4C87270()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unsigned __int8 *sub_1E4C872B4@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1E4C872C4(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E4C872D0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E4C7EA5C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4C87314()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void type metadata accessor for BTDeviceBatteryStatus(uint64_t a1)
{
}

char *keypath_get_selector_status()
{
  return sel_status;
}

void sub_1E4C87378(uint64_t a1@<X8>)
{
  sub_1E4C86E00(*(void *)(v1 + 16), *(void *)(v1 + 24), "Battery view levelPublisher triggered", a1);
}

uint64_t objectdestroy_2Tm()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4C873E0(uint64_t a1@<X8>)
{
  sub_1E4C86E00(*(void *)(v1 + 16), *(void *)(v1 + 24), "Battery view chargingPublisher triggered", a1);
}

uint64_t initializeBufferWithCopyOfBuffer for AnyBindable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1E4C87450(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1E4C87470(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for CBBatteryState(uint64_t a1)
{
}

uint64_t sub_1E4C874C0()
{
  return 0;
}

uint64_t sub_1E4C874CC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4C874FC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1E4C87534())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87558()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4C87588(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_1E4C875C0())()
{
  return nullsub_1;
}

double sub_1E4C875E0@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1E4C875EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4C875F8(v1 + 32, a1);
}

uint64_t sub_1E4C875F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4C87660(uint64_t a1)
{
  return sub_1E4C87668(a1, v1 + 32);
}

uint64_t sub_1E4C87668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1E4C876D0())()
{
  return nullsub_1;
}

uint64_t sub_1E4C876F0()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_1E4C876F8(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

uint64_t (*sub_1E4C87700())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87720()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_1E4C87728(uint64_t result)
{
  *(void *)(v1 + 72) = result;
  return result;
}

uint64_t (*sub_1E4C87730())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87750()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_1E4C87758(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t (*sub_1E4C87760())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87780()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_1E4C87788(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t (*sub_1E4C87790())()
{
  return nullsub_1;
}

uint64_t sub_1E4C877B0()
{
  return 0;
}

uint64_t sub_1E4C877B8()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t sub_1E4C877C0(uint64_t result)
{
  *(unsigned char *)(v1 + 96) = result;
  return result;
}

uint64_t (*sub_1E4C877C8())()
{
  return nullsub_1;
}

uint64_t sub_1E4C877E8()
{
  return *(void *)(v0 + 104);
}

uint64_t sub_1E4C877F0(uint64_t result)
{
  *(void *)(v1 + 104) = result;
  return result;
}

uint64_t (*sub_1E4C877F8())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87818()
{
  uint64_t v1 = *(void *)(v0 + 112);
  sub_1E4C87964(v1);
  return v1;
}

uint64_t sub_1E4C8784C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1E4C879AC(*(void *)(v2 + 112));
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*sub_1E4C87884())()
{
  return nullsub_1;
}

uint64_t sub_1E4C878A4()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_1E4C87964(v1);
  return v1;
}

uint64_t sub_1E4C878D8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1E4C879AC(*(void *)(v2 + 128));
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_1E4C87910())()
{
  return nullsub_1;
}

uint64_t sub_1E4C87930()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_1E4C87964(v1);
  return v1;
}

uint64_t sub_1E4C87964(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1E4C87974(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1E4C879AC(*(void *)(v2 + 144));
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return result;
}

uint64_t sub_1E4C879AC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_1E4C879BC())()
{
  return nullsub_1;
}

__n128 sub_1E4C879DC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, long long a12, long long a13, __n128 a14, uint64_t a15)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  sub_1E4C81220(a5, a9 + 32);
  *(void *)(a9 + 64) = a6;
  *(void *)(a9 + 72) = a7;
  *(void *)(a9 + 80) = a8;
  *(void *)(a9 + 88) = a10;
  *(unsigned char *)(a9 + 96) = a11;
  *(_OWORD *)(a9 + 104) = a12;
  *(_OWORD *)(a9 + 120) = a13;
  __n128 result = a14;
  *(__n128 *)(a9 + 136) = a14;
  *(void *)(a9 + 152) = a15;
  return result;
}

uint64_t sub_1E4C87A88()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1E4C87A94()
{
  return 0;
}

uint64_t sub_1E4C87AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_1E4C87B08(a1, a2, a3, a4);
  return v8;
}

void sub_1E4C87B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = MEMORY[0x1E4FBC860];
  if (a2)
  {
    char v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      int v7 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    char v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  int v7 = 0;
LABEL_6:
  id v8 = objc_msgSend(self, sel_groupSpecifierWithID_name_, v6, v7);

  if (v8)
  {
    *(void *)(v4 + 16) = v8;
    swift_beginAccess();
    id v9 = v8;
    MEMORY[0x1E4E8A440]();
    if (*(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1E4CBF2D0();
    sub_1E4CBF2E0();
    sub_1E4CBF2C0();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E4C87C40(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  return swift_retain();
}

uint64_t sub_1E4C87C88()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(uint64_t (***)(void, void))(*(void *)v0 + 88);
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  uint64_t v4 = v2[2](v3, v2);
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v6 = v2[11](v3, v2);
  uint64_t v8 = v7;
  uint64_t v9 = v2[10](v3, v2);
  uint64_t v11 = v10;
  uint64_t v12 = v2[9](v3, v2);
  uint64_t v13 = v2[6](v3, v2);
  uint64_t v14 = v2[12](v3, v2);
  uint64_t v16 = v15;
  id v17 = objc_allocWithZone((Class)type metadata accessor for HeadphoneSpecifier());
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(v23, v22, v6, v8, v9, v11, v12, v13, 0, v14, v16);
  int v19 = v18;
  swift_beginAccess();
  id v20 = v19;
  MEMORY[0x1E4E8A440]();
  if (*(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1E4CBF2D0();
  sub_1E4CBF2E0();
  sub_1E4CBF2C0();
  swift_endAccess();

  return swift_retain();
}

__n128 HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  id v19 = objc_allocWithZone(v10);
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10);
  return result;
}

uint64_t type metadata accessor for HeadphoneSpecifier()
{
  return self;
}

uint64_t sub_1E4C87F4C()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v2, v1);
  if (v3)
  {
    uint64_t v4 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v1 + 24))(v18, v2, v1);
  uint64_t v5 = v19;
  if (v19)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(v18, v19);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_1E4CBF6C0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 72))(v2, v1)) {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  else {
    uint64_t ObjCClassFromMetadata = 0;
  }
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v4, v10, v11, v12, ObjCClassFromMetadata, (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v2, v1), 0);

  uint64_t result = swift_unknownObjectRelease();
  if (v15)
  {
    swift_beginAccess();
    id v17 = v15;
    MEMORY[0x1E4E8A440]();
    if (*(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E4CBF2D0();
    }
    sub_1E4CBF2E0();
    sub_1E4CBF2C0();
    swift_endAccess();

    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1E4C88260(void (*a1)(void *))
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    swift_retain();
    return v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1E4CBF650();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t result = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_13:
    id v6 = (id)MEMORY[0x1E4E8A770](result, v3);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 8 * result + 32);
LABEL_8:
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    a1(v7);
    swift_retain();

    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E4C8837C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4C883B4()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1E4C883DC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t HeadphoneSpecifier.getAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction);
  sub_1E4C87964(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.setAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction);
  sub_1E4C87964(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.buttonTapAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);
  sub_1E4C87964(v1);
  return v1;
}

void HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v15 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction];
  *id v15 = a5;
  v15[1] = a6;
  uint64_t v16 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction];
  *uint64_t v16 = a3;
  v16[1] = a4;
  id v17 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction];
  *id v17 = a10;
  v17[1] = a11;
  if (a2)
  {
    sub_1E4C87964(a10);
    sub_1E4C87964(a3);
    sub_1E4C87964(a5);
    char v18 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    uint64_t v19 = a9;
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_1E4C87964(a10);
    sub_1E4C87964(a3);
    sub_1E4C87964(a5);
    char v18 = 0;
    uint64_t v19 = a9;
    if (a7)
    {
LABEL_3:
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v25 = a3;
      if (!v19) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t ObjCClassFromMetadata = 0;
  uint64_t v25 = a3;
  if (v19) {
LABEL_4:
  }
    uint64_t v19 = swift_getObjCClassFromMetadata();
LABEL_5:
  int v21 = (objc_class *)type metadata accessor for HeadphoneSpecifier();
  v29.receiver = v11;
  v29.super_class = v21;
  id v22 = objc_msgSendSuper2(&v29, sel_initWithName_target_set_get_detail_cell_edit_, v18, 0, sel_setSepcifierEnabledWithEnabled_, sel_specifierEnabled, ObjCClassFromMetadata, a8, v19);

  if (v22)
  {
    v28.receiver = v22;
    v28.super_class = v21;
    id v23 = v22;
    objc_msgSendSuper2(&v28, sel_setTarget_, v23);
    v27.receiver = v23;
    v27.super_class = v21;
    id v24 = v23;
    objc_msgSendSuper2(&v27, sel_setButtonAction_, sel_buttonTappedWithSender_);
    sub_1E4C879AC(a10);
    sub_1E4C879AC(a5);
    sub_1E4C879AC(v25);
  }
  else
  {
    __break(1u);
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t HeadphoneSpecifier.buttonTapped(sender:)()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);
  if (v1) {
    return v1();
  }
  return result;
}

NSNumber __swiftcall HeadphoneSpecifier.specifierEnabled()()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction);
  if (v1) {
    return (NSNumber)v1();
  }
  sub_1E4C88844();
  return (NSNumber)sub_1E4CBF460();
}

unint64_t sub_1E4C88844()
{
  unint64_t result = qword_1EAE8DA38;
  if (!qword_1EAE8DA38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE8DA38);
  }
  return result;
}

Swift::Void __swiftcall HeadphoneSpecifier.setSepcifierEnabled(enabled:)(NSNumber enabled)
{
  uint64_t v2 = *(void (**)(Class))(v1 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction);
  if (v2) {
    v2(enabled.super.super.isa);
  }
}

id HeadphoneSpecifier.__allocating_init(name:target:set:get:detail:cell:edit:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t ObjCClassFromMetadata, uint64_t a7, uint64_t a8)
{
  uint64_t v24 = a5;
  uint64_t v25 = a7;
  uint64_t v23 = a4;
  if (a2)
  {
    uint64_t v12 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    uint64_t v13 = a3[3];
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = a3[3];
    if (v13)
    {
LABEL_3:
      uint64_t v14 = __swift_project_boxed_opaque_existential_0(a3, v13);
      uint64_t v15 = *(void *)(v13 - 8);
      MEMORY[0x1F4188790](v14);
      id v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v17);
      uint64_t v18 = sub_1E4CBF6C0();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
      if (!ObjCClassFromMetadata) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v18 = 0;
  if (ObjCClassFromMetadata) {
LABEL_4:
  }
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
LABEL_5:
  if (a8) {
    a8 = swift_getObjCClassFromMetadata();
  }
  id v19 = objc_allocWithZone(v8);
  id v20 = objc_msgSend(v19, sel_initWithName_target_set_get_detail_cell_edit_, v12, v18, v23, v24, ObjCClassFromMetadata, v25, a8);

  swift_unknownObjectRelease();
  return v20;
}

void HeadphoneSpecifier.init(name:target:set:get:detail:cell:edit:)()
{
}

id HeadphoneSpecifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void HeadphoneSpecifier.init()()
{
}

id HeadphoneSpecifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneSpecifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t destroy for AnyBindable(void *a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[7]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 4));
  }
  if (a1[14]) {
    uint64_t result = swift_release();
  }
  if (a1[16]) {
    uint64_t result = swift_release();
  }
  if (a1[18])
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  id v6 = (_OWORD *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 56) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 32, v6, v7);
  }
  else
  {
    long long v8 = v6[1];
    *(_OWORD *)(a1 + 32) = *v6;
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 112);
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v9;
    *(void *)(a1 + 120) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  }
  uint64_t v12 = *(void *)(a2 + 128);
  if (v12)
  {
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  }
  uint64_t v14 = *(void *)(a2 + 144);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v14;
    *(void *)(a1 + 152) = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  }
  return a1;
}

uint64_t assignWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  else if (v4)
  {
    *(void *)(a1 + 56) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 112);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v9;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_15:
  uint64_t v10 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v10;
      *(void *)(a1 + 136) = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v10;
    *(void *)(a1 + 136) = v12;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_22:
  uint64_t v13 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v13;
      *(void *)(a1 + 152) = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v13;
  *(void *)(a1 + 152) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  uint64_t v8 = *(void *)(a1 + 112);
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v10;
      swift_release();
      goto LABEL_10;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v11;
    goto LABEL_10;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_10:
  uint64_t v12 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v12;
      *(void *)(a1 + 136) = v13;
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  else if (v12)
  {
    uint64_t v14 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v14;
    goto LABEL_17;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_17:
  uint64_t v15 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v15)
    {
      uint64_t v17 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v15;
      *(void *)(a1 + 152) = v17;
      return a1;
    }
LABEL_23:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_23;
  }
  uint64_t v16 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v15;
  *(void *)(a1 + 152) = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyBindable(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 160)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyBindable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyBindable()
{
  return &type metadata for AnyBindable;
}

uint64_t sub_1E4C895DC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PSSpecifierGroupBuilder()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for PSTableCellType()
{
  if (!qword_1EAE8DA40)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAE8DA40);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

char *sub_1E4C896D0()
{
  return &byte_1EAE900F0;
}

uint64_t sub_1E4C896DC()
{
  return byte_1EAE900F0;
}

uint64_t sub_1E4C89720(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1EAE900F0 = a1;
  return result;
}

uint64_t (*sub_1E4C89768())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E4C897C0(void *a1)
{
  id v1 = a1;
  char v2 = sub_1E4C897F4();

  return v2 & 1;
}

uint64_t sub_1E4C897F4()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &byte_1EAE900F0);
  swift_endAccess();
  if (v1)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1E4C81220((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v3;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v5);
    return 0;
  }
  return result;
}

uint64_t sub_1E4C898C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DDD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1E4C89928(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_1E4CBF300();
  swift_beginAccess();
  objc_setAssociatedObject(v1, &byte_1EAE900F0, v2, (void *)1);
  swift_endAccess();
}

void sub_1E4C899AC()
{
  id v1 = (void *)sub_1E4CBF300();
  swift_beginAccess();
  objc_setAssociatedObject(v0, &byte_1EAE900F0, v1, (void *)1);
  swift_endAccess();
}

void sub_1E4C89A1C()
{
  qword_1EAE900F8 = MEMORY[0x1E4FBC868];
}

uint64_t *sub_1E4C89A30()
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  return &qword_1EAE900F8;
}

uint64_t sub_1E4C89A7C()
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4C89BB4(uint64_t a1)
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EAE900F8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C89CDC())()
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void HPSHeadphoneManager.addTopLevelEntry(hpDevice:)(void *a1)
{
  uint64_t v3 = sub_1E4CBE8D0();
  uint64_t v58 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E4CBF100();
  uint64_t v60 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v59 = (uint64_t *)((char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1E4CBEEB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4CBEE70();
  id v12 = v1;
  id v13 = a1;
  id v14 = v12;
  id v15 = v13;
  uint64_t v16 = sub_1E4CBEE90();
  int v56 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v16, (os_log_type_t)v56))
  {
    os_log_t v51 = v16;
    id v52 = v11;
    uint64_t v53 = v9;
    uint64_t v54 = v8;
    uint64_t v55 = v6;
    id v57 = v14;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(void *)&long long v64 = v19;
    *(_DWORD *)uint64_t v17 = 136315650;
    if (qword_1EAE8E7E0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v20 = swift_bridgeObjectRetain();
    sub_1E4C8B898(v20);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = MEMORY[0x1E4E8A470](v22, MEMORY[0x1E4FBB1A0]);
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    *(void *)&v63[0] = sub_1E4C8304C(v23, v25, (uint64_t *)&v64);
    sub_1E4CBF520();
    id v26 = v57;

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v50 = v17 + 14;
    sub_1E4CBECC0();
    objc_super v27 = (void *)sub_1E4CBECB0();
    sub_1E4CBECA0();

    sub_1E4CBEC80();
    uint64_t v28 = sub_1E4CBF1A0();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    *(void *)&v63[0] = sub_1E4C8304C(v28, v30, (uint64_t *)&v64);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2112;
    *(void *)&v63[0] = v15;
    id v31 = v15;
    sub_1E4CBF520();
    void *v18 = v15;

    os_log_t v32 = v51;
    _os_log_impl(&dword_1E4BFE000, v51, (os_log_type_t)v56, "HPMHeadphoneManager: addTopLevelEntry %s  %s %@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v19, -1, -1);
    uint64_t v33 = v17;
    id v14 = v57;
    MEMORY[0x1E4E8B4E0](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    uint64_t v6 = v55;
    uint64_t v34 = &isRBSProcessHandleAvailable_onceToken;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v34 = &isRBSProcessHandleAvailable_onceToken;
  }
  sub_1E4C7CA18();
  uint64_t v35 = sub_1E4CBF420();
  int v37 = v59;
  uint64_t v36 = v60;
  *uint64_t v59 = v35;
  (*(void (**)(uint64_t *, void, uint64_t))(v36 + 104))(v37, *MEMORY[0x1E4FBCBF0], v6);
  char v38 = sub_1E4CBF110();
  (*(void (**)(uint64_t *, uint64_t))(v36 + 8))(v37, v6);
  if ((v38 & 1) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v34[252] != -1) {
LABEL_19:
  }
    swift_once();
  uint64_t v39 = sub_1E4CBEC70();
  uint64_t v41 = v40;
  swift_beginAccess();
  uint64_t v42 = qword_1EAE900F8;
  if (*(void *)(qword_1EAE900F8 + 16) && (unint64_t v43 = sub_1E4C838F4(v39, v41), (v44 & 1) != 0))
  {
    id v45 = *(void **)(*(void *)(v42 + 56) + 8 * v43);
    id v46 = v45;
  }
  else
  {
    id v45 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  objc_msgSend(v15, sel_setHasBackend_, 1);
  objc_msgSend(v45, sel_setHasBackend_, 1);
  sub_1E4C8C7A8(v45, v15);
  sub_1E4C8A5D8();
  id v47 = objc_msgSend(v14, sel_weakHashTblCopy);
  id v48 = objc_msgSend(v47, sel_objectEnumerator);

  id v49 = v48;
  sub_1E4CBF380();

  sub_1E4C8CF54(&qword_1EAE8DA48, MEMORY[0x1E4F27660]);
  sub_1E4CBF510();
  while (v65)
  {
    sub_1E4C7F6AC(&v64, v63);
    sub_1E4C842F8((uint64_t)v63, (uint64_t)v62);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA50);
    if (swift_dynamicCast())
    {
      objc_msgSend(v61, sel_addTopLevelEntryWithHpDevice_, v15);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
    sub_1E4CBF510();
  }
  (*(void (**)(char *, uint64_t))(v58 + 8))(v5, v3);
}

uint64_t sub_1E4C8A538()
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1E4C8B898(v0);
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

void sub_1E4C8A5D8()
{
  uint64_t v0 = (uint64_t *)sub_1E4CBEEB0();
  uint64_t v1 = *(v0 - 1);
  MEMORY[0x1F4188790](v0);
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (id)sub_1E4CBECC0();
  uint64_t v5 = (void *)sub_1E4CBECB0();
  objc_sync_enter(v5);

  uint64_t v6 = (void *)sub_1E4CBECB0();
  uint64_t v7 = (void (*)(uint64_t *, void))sub_1E4CBEC90();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  *uint64_t v9 = MEMORY[0x1E4FBC868];
  v7(v62, 0);

  if (qword_1EAE8E7E0 != -1) {
LABEL_25:
  }
    swift_once();
  swift_beginAccess();
  uint64_t v10 = swift_bridgeObjectRetain();
  sub_1E4C8BC8C(v10);
  unint64_t v12 = v11;
  v51[0] = 0;
  uint64_t v52 = v1;
  uint64_t v53 = v0;
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    uint64_t v58 = isUniquelyReferenced_nonNull_native;
    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v58 = isUniquelyReferenced_nonNull_native;
    if (v13)
    {
LABEL_4:
      id v56 = v4;
      unint64_t v57 = v12 & 0xC000000000000001;
      uint64_t v1 = 4;
      uint64_t v54 = v13;
      unint64_t v55 = v12;
      do
      {
        if (v57) {
          id v15 = (id)MEMORY[0x1E4E8A770](v1 - 4, v12);
        }
        else {
          id v15 = *(id *)(v12 + 8 * v1);
        }
        uint64_t v16 = v15;
        if (__OFADD__(v1 - 4, 1))
        {
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        uint64_t v60 = v1 - 3;
        uint64_t v17 = (void *)sub_1E4CBECB0();
        uint64_t v18 = sub_1E4CBEC70();
        uint64_t v20 = v19;
        id v4 = v16;
        uint64_t v59 = (void (*)(uint64_t *, void))sub_1E4CBEC90();
        uint64_t v0 = v21;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v61 = *v0;
        uint64_t v22 = v61;
        uint64_t *v0 = 0x8000000000000000;
        unint64_t v24 = sub_1E4C838F4(v18, v20);
        uint64_t v25 = *(void *)(v22 + 16);
        BOOL v26 = (v23 & 1) == 0;
        uint64_t v27 = v25 + v26;
        if (__OFADD__(v25, v26)) {
          goto LABEL_23;
        }
        char v28 = v23;
        if (*(void *)(v22 + 24) >= v27)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t isUniquelyReferenced_nonNull_native = v61;
            if (v23) {
              goto LABEL_5;
            }
          }
          else
          {
            sub_1E4C8C3E0();
            uint64_t isUniquelyReferenced_nonNull_native = v61;
            if (v28) {
              goto LABEL_5;
            }
          }
        }
        else
        {
          sub_1E4C8BF60(v27, isUniquelyReferenced_nonNull_native);
          unint64_t v29 = sub_1E4C838F4(v18, v20);
          if ((v28 & 1) != (v30 & 1))
          {
            sub_1E4CBF700();
            __break(1u);
            return;
          }
          unint64_t v24 = v29;
          uint64_t isUniquelyReferenced_nonNull_native = v61;
          if (v28)
          {
LABEL_5:
            uint64_t v14 = *(void *)(isUniquelyReferenced_nonNull_native + 56);

            *(void *)(v14 + 8 * v24) = v4;
            goto LABEL_6;
          }
        }
        *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v24 >> 6) + 64) |= 1 << v24;
        id v31 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v24);
        uint64_t *v31 = v18;
        v31[1] = v20;
        *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v24) = v4;
        uint64_t v32 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
        BOOL v33 = __OFADD__(v32, 1);
        uint64_t v34 = v32 + 1;
        if (v33) {
          goto LABEL_24;
        }
        *(void *)(isUniquelyReferenced_nonNull_native + 16) = v34;
        swift_bridgeObjectRetain();
LABEL_6:
        uint64_t *v0 = isUniquelyReferenced_nonNull_native;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v59(v62, 0);

        ++v1;
        unint64_t v12 = v55;
        id v4 = v56;
        uint64_t isUniquelyReferenced_nonNull_native = v58;
      }
      while (v60 != v54);
    }
  }
  swift_bridgeObjectRelease_n();
  sub_1E4CBEE70();
  id v35 = (id)v51[1];
  uint64_t v36 = sub_1E4CBEE90();
  os_log_type_t v37 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v62[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315394;
    uint64_t v40 = swift_bridgeObjectRetain();
    sub_1E4C8B898(v40);
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = MEMORY[0x1E4E8A470](v42, MEMORY[0x1E4FBB1A0]);
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    uint64_t v61 = sub_1E4C8304C(v43, v45, v62);
    sub_1E4CBF520();

    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    id v46 = (void *)sub_1E4CBECB0();
    sub_1E4CBECA0();

    sub_1E4CBEC80();
    uint64_t v47 = sub_1E4CBF1A0();
    unint64_t v49 = v48;
    swift_bridgeObjectRelease();
    uint64_t v61 = sub_1E4C8304C(v47, v49, v62);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E4BFE000, v36, v37, "HPMHeadphoneManager: updateConnectedForHPM %s  %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v39, -1, -1);
    MEMORY[0x1E4E8B4E0](v38, -1, -1);

    (*(void (**)(uint64_t, uint64_t *))(v52 + 8))(v58, v53);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t *))(v52 + 8))(isUniquelyReferenced_nonNull_native, v53);
  }
  uint64_t v50 = (void *)sub_1E4CBECB0();
  objc_sync_exit(v50);
}

void HPSHeadphoneManager.updateTopLevelEntry(hpDevice:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E4CBE8D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E4CBF100();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (void *)((char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1E4C7CA18();
  *unint64_t v11 = sub_1E4CBF420();
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  char v12 = sub_1E4CBF110();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (qword_1EAE8E7E0 != -1) {
LABEL_14:
  }
    swift_once();
  uint64_t v13 = sub_1E4CBEC70();
  uint64_t v15 = v14;
  swift_beginAccess();
  uint64_t v16 = qword_1EAE900F8;
  uint64_t v17 = *(void *)(qword_1EAE900F8 + 16);
  v25[0] = v5;
  if (v17 && (unint64_t v18 = sub_1E4C838F4(v13, v15), (v19 & 1) != 0))
  {
    uint64_t v20 = *(void **)(*(void *)(v16 + 56) + 8 * v18);
    id v21 = v20;
  }
  else
  {
    uint64_t v20 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1E4C8C7A8(v20, a1);
  id v22 = objc_msgSend(v2, sel_weakHashTblCopy);
  id v23 = objc_msgSend(v22, sel_objectEnumerator);

  id v24 = v23;
  sub_1E4CBF380();

  sub_1E4C8CF54(&qword_1EAE8DA48, MEMORY[0x1E4F27660]);
  sub_1E4CBF510();
  while (v29)
  {
    sub_1E4C7F6AC(&v28, v27);
    sub_1E4C842F8((uint64_t)v27, (uint64_t)v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA50);
    if (swift_dynamicCast())
    {
      objc_msgSend((id)v25[1], sel_updateTopLevelEntryWithHpDevice_, a1);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
    sub_1E4CBF510();
  }
  (*(void (**)(char *, uint64_t))(v25[0] + 8))(v7, v4);
}

void HPSHeadphoneManager.removeTopLevelEntry(hpDevice:)(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_1E4CBE8D0();
  uint64_t v55 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1E4CBEEB0();
  uint64_t v7 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)sub_1E4CBF100();
  uint64_t v11 = *(v10 - 1);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1E4C7CA18();
  *uint64_t v13 = sub_1E4CBF420();
  (*(void (**)(uint64_t *, void, void *))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  char v14 = sub_1E4CBF110();
  (*(void (**)(uint64_t *, void *))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v53 = v7;
  sub_1E4CBEE70();
  id v15 = v2;
  id v16 = a1;
  uint64_t v10 = v15;
  id v2 = v16;
  uint64_t v17 = sub_1E4CBEE90();
  int v18 = sub_1E4CBF3B0();
  char v19 = &isRBSProcessHandleAvailable_onceToken;
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    int v49 = v18;
    os_log_t v51 = v17;
    uint64_t v52 = v9;
    uint64_t v20 = v10;
    uint64_t v21 = swift_slowAlloc();
    unint64_t v48 = (void *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(void *)&long long v59 = v50;
    *(_DWORD *)uint64_t v21 = 136315650;
    if (qword_1EAE8E7E0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_1E4C8B898(v22);
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v25 = MEMORY[0x1E4E8A470](v24, MEMORY[0x1E4FBB1A0]);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(void *)&v58[0] = sub_1E4C8304C(v25, v27, (uint64_t *)&v59);
    sub_1E4CBF520();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    sub_1E4CBECC0();
    long long v28 = (void *)sub_1E4CBECB0();
    sub_1E4CBECA0();

    sub_1E4CBEC80();
    uint64_t v29 = sub_1E4CBF1A0();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    *(void *)&v58[0] = sub_1E4C8304C(v29, v31, (uint64_t *)&v59);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2112;
    *(void *)&v58[0] = v2;
    id v32 = v2;
    uint64_t v10 = v20;
    sub_1E4CBF520();
    BOOL v33 = v48;
    void *v48 = v2;

    os_log_t v34 = v51;
    _os_log_impl(&dword_1E4BFE000, v51, (os_log_type_t)v49, "HPMHeadphoneManager: removeTopLevelEntry %s  %s %@", (uint8_t *)v21, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v33, -1, -1);
    uint64_t v35 = v50;
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v35, -1, -1);
    MEMORY[0x1E4E8B4E0](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    char v19 = &isRBSProcessHandleAvailable_onceToken;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v54);
  }
  if (v19[252] != -1) {
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v36 = sub_1E4CBEC70();
  uint64_t v38 = v37;
  swift_beginAccess();
  uint64_t v39 = qword_1EAE900F8;
  if (*(void *)(qword_1EAE900F8 + 16) && (unint64_t v40 = sub_1E4C838F4(v36, v38), (v41 & 1) != 0))
  {
    uint64_t v42 = *(void **)(*(void *)(v39 + 56) + 8 * v40);
    id v43 = v42;
  }
  else
  {
    uint64_t v42 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  objc_msgSend(v2, sel_setHasBackend_, 0);
  objc_msgSend(v42, sel_setHasBackend_, 0);
  sub_1E4C8C7A8(v42, v2);
  sub_1E4C8A5D8();
  id v44 = objc_msgSend(v10, sel_weakHashTblCopy);
  id v45 = objc_msgSend(v44, sel_objectEnumerator);

  id v46 = v45;
  sub_1E4CBF380();

  sub_1E4C8CF54(&qword_1EAE8DA48, MEMORY[0x1E4F27660]);
  sub_1E4CBF510();
  while (v60)
  {
    sub_1E4C7F6AC(&v59, v58);
    sub_1E4C842F8((uint64_t)v58, (uint64_t)v57);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA50);
    if (swift_dynamicCast())
    {
      objc_msgSend(v56, sel_removeTopLevelEntryWithHpDevice_, v2);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v58);
    sub_1E4CBF510();
  }
  (*(void (**)(char *, uint64_t))(v55 + 8))(v6, v4);
}

void sub_1E4C8B898(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1;
    uint64_t v29 = MEMORY[0x1E4FBC860];
    sub_1E4C8C594(0, v1, 0);
    uint64_t v3 = v29;
    uint64_t v4 = sub_1E4C8C720(v2);
    int v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = v2 + 64;
    uint64_t v24 = v2 + 80;
    int64_t v25 = v1;
    uint64_t v26 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(v2 + 32))
    {
      unint64_t v11 = (unint64_t)v4 >> 6;
      if ((*(void *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(v2 + 36) != v6) {
        goto LABEL_26;
      }
      uint64_t v28 = v3;
      id v12 = *(id *)(*(void *)(v2 + 56) + 8 * v4);
      sub_1E4CBF590();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1E4CC4A40;
      *(void *)(v13 + 56) = sub_1E4CBEC80();
      *(void *)(v13 + 64) = sub_1E4C8CF54((unint64_t *)&qword_1EAE8DA60, MEMORY[0x1E4F65638]);
      *(void *)(v13 + 32) = v12;
      id v14 = v12;
      sub_1E4CBF200();
      sub_1E4CBF250();
      swift_bridgeObjectRelease();
      sub_1E4CBF250();
      sub_1E4CBEC70();
      sub_1E4CBF250();
      swift_bridgeObjectRelease();
      sub_1E4CBF250();
      objc_msgSend(v14, sel_hasBackend);
      sub_1E4CBF250();
      swift_bridgeObjectRelease();
      sub_1E4CBF250();
      if (v27)
      {
        swift_release();

        return;
      }
      uint64_t v15 = v2;

      uint64_t v3 = v28;
      unint64_t v17 = *(void *)(v28 + 16);
      unint64_t v16 = *(void *)(v28 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_1E4C8C594(v16 > 1, v17 + 1, 1);
        uint64_t v3 = v28;
      }
      *(void *)(v3 + 16) = v17 + 1;
      uint64_t v18 = v3 + 16 * v17;
      *(void *)(v18 + 32) = 0xD000000000000011;
      *(void *)(v18 + 40) = 0x80000001E4CCCFB0;
      int64_t v9 = 1 << *(unsigned char *)(v15 + 32);
      if (v4 >= v9) {
        goto LABEL_27;
      }
      uint64_t v8 = v26;
      uint64_t v19 = *(void *)(v26 + 8 * v11);
      if ((v19 & (1 << v4)) == 0) {
        goto LABEL_28;
      }
      uint64_t v2 = v15;
      if (*(_DWORD *)(v15 + 36) != v6) {
        goto LABEL_29;
      }
      unint64_t v20 = v19 & (-2 << (v4 & 0x3F));
      if (v20)
      {
        int64_t v9 = __clz(__rbit64(v20)) | v4 & 0xFFFFFFFFFFFFFFC0;
        int64_t v10 = v25;
      }
      else
      {
        unint64_t v21 = v11 + 1;
        unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
        int64_t v10 = v25;
        if (v11 + 1 < v22)
        {
          unint64_t v23 = *(void *)(v26 + 8 * v21);
          if (v23)
          {
LABEL_21:
            int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
          }
          else
          {
            while (v22 - 2 != v11)
            {
              unint64_t v23 = *(void *)(v24 + 8 * v11++);
              if (v23)
              {
                unint64_t v21 = v11 + 1;
                goto LABEL_21;
              }
            }
          }
        }
      }
      ++v7;
      uint64_t v4 = v9;
      if (v7 == v10) {
        return;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
}

void sub_1E4C8BC8C(uint64_t a1)
{
  int64_t v2 = 0;
  uint64_t v4 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & v3;
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v3) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v11 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v11 < v8)
    {
      unint64_t v12 = *(void *)(v4 + 8 * v11);
      ++v2;
      if (v12) {
        goto LABEL_22;
      }
      int64_t v2 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_26;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v2);
      if (v12) {
        goto LABEL_22;
      }
      int64_t v2 = v11 + 2;
      if (v11 + 2 >= v8) {
        goto LABEL_26;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v2);
      if (v12) {
        goto LABEL_22;
      }
      int64_t v2 = v11 + 3;
      if (v11 + 3 >= v8) {
        goto LABEL_26;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v2);
      if (v12)
      {
LABEL_22:
        unint64_t v7 = (v12 - 1) & v12;
        for (unint64_t i = __clz(__rbit64(v12)) + (v2 << 6); ; unint64_t i = v9 | (v2 << 6))
        {
          id v14 = *(id *)(*(void *)(a1 + 56) + 8 * i);
          if (objc_msgSend(v14, sel_hasBackend))
          {
            sub_1E4CBF5E0();
            sub_1E4CBF610();
            sub_1E4CBF620();
            sub_1E4CBF5F0();
            if (!v7) {
              goto LABEL_7;
            }
          }
          else
          {

            if (!v7) {
              goto LABEL_7;
            }
          }
LABEL_6:
          unint64_t v9 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
        }
      }
      int64_t v13 = v11 + 4;
      if (v13 < v8)
      {
        unint64_t v12 = *(void *)(v4 + 8 * v13);
        if (v12)
        {
          int64_t v2 = v13;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v2 = v13 + 1;
          if (__OFADD__(v13, 1)) {
            goto LABEL_28;
          }
          if (v2 >= v8) {
            break;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v2);
          ++v13;
          if (v12) {
            goto LABEL_22;
          }
        }
      }
    }
LABEL_26:
    swift_release();
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_1E4C8BE50()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1E4CC4A40;
  *(void *)(v1 + 56) = sub_1E4CBEC80();
  *(void *)(v1 + 64) = sub_1E4C8CF54((unint64_t *)&qword_1EAE8DA60, MEMORY[0x1E4F65638]);
  *(void *)(v1 + 32) = v0;
  id v2 = v0;
  uint64_t v5 = sub_1E4CBF200();
  sub_1E4CBF250();
  id v3 = objc_msgSend(v2, sel_description);
  sub_1E4CBF1F0();

  sub_1E4CBF250();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1E4C8BF60(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8C0);
  char v38 = a2;
  uint64_t v6 = sub_1E4CBF670();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          id v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1E4CBF720();
    sub_1E4CBF230();
    uint64_t result = sub_1E4CBF740();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_1E4C8C270(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1E4C838F4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1E4C8C3E0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1E4C8BF60(v15, a4 & 1);
  unint64_t v20 = sub_1E4C838F4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1E4CBF700();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_1E4C8C3E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E4CBF660();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1E4C8C594(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E4C8C5B4(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1E4C8C5B4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8D0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1E4CBF690();
  __break(1u);
  return result;
}

uint64_t sub_1E4C8C720(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1E4C8C7A8(void *a1, void *a2)
{
  uint64_t v4 = sub_1E4CBEEB0();
  char v5 = *(NSObject **)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  int64_t v11 = (char *)&v59 - v10;
  MEMORY[0x1F4188790](v9);
  int64_t v13 = (char *)&v59 - v12;
  if (a1)
  {
    uint64_t v63 = sub_1E4C8BE50();
    unint64_t v66 = v14;
    id v15 = a1;
    sub_1E4CBEAD0();
    uint64_t v16 = (void *)sub_1E4CBED80();
    swift_release();
    uint64_t v17 = (void *)sub_1E4CBEAF0();
    if (v16)
    {
      sub_1E4CBEC60();
    }
    else
    {
      sub_1E4CBEC50();
    }

    int64_t v24 = (void *)sub_1E4CBEB00();
    uint64_t v25 = a2;
    unint64_t v26 = (void *)sub_1E4CBECE0();

    id v64 = v25;
    id v65 = v15;
    if (v26)
    {
      BOOL v27 = (void *)sub_1E4CBEB00();
      sub_1E4CBECD0();

      sub_1E4CBEE70();
      unint64_t v28 = v66;
      swift_bridgeObjectRetain_n();
      id v29 = v26;
      uint64_t v30 = sub_1E4CBEE90();
      os_log_type_t v31 = sub_1E4CBF3B0();
      id v62 = v30;
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        long long v59 = (void *)swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        v68[0] = v60;
        *(_DWORD *)uint64_t v32 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v67 = sub_1E4C8304C(v63, v66, v68);
        uint64_t v61 = v4;
        sub_1E4CBF520();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v32 + 12) = 2112;
        uint64_t v67 = (uint64_t)v29;
        id v33 = v29;
        uint64_t v4 = v61;
        sub_1E4CBF520();
        uint64_t v34 = v59;
        *long long v59 = v26;

        uint64_t v35 = v62;
        _os_log_impl(&dword_1E4BFE000, v62, v31, "HPMHeadphoneManager updateHeadphoneDevice hearing record for fetched:%s with updated record %@", (uint8_t *)v32, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
        swift_arrayDestroy();
        MEMORY[0x1E4E8B4E0](v34, -1, -1);
        uint64_t v36 = v60;
        swift_arrayDestroy();
        MEMORY[0x1E4E8B4E0](v36, -1, -1);
        uint64_t v37 = v32;
        unint64_t v28 = v66;
        MEMORY[0x1E4E8B4E0](v37, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      isa = (void (*)(char *, uint64_t))v5[1].isa;
      isa(v13, v4);
    }
    else
    {
      id v62 = v5;
      sub_1E4CBEE70();
      id v38 = v25;
      uint64_t v39 = sub_1E4CBEE90();
      os_log_type_t v40 = sub_1E4CBF3B0();
      if (os_log_type_enabled(v39, v40))
      {
        char v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        uint64_t v61 = v4;
        uint64_t v43 = v42;
        v68[0] = v42;
        *(_DWORD *)char v41 = 136315138;
        uint64_t v44 = sub_1E4C8BE50();
        uint64_t v67 = sub_1E4C8304C(v44, v45, v68);
        sub_1E4CBF520();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E4BFE000, v39, v40, "HPMHeadphoneManager no incoming record for incomingDevice:%s", v41, 0xCu);
        swift_arrayDestroy();
        uint64_t v46 = v43;
        uint64_t v4 = v61;
        MEMORY[0x1E4E8B4E0](v46, -1, -1);
        MEMORY[0x1E4E8B4E0](v41, -1, -1);
      }
      else
      {
      }
      char v5 = v62;
      isa = (void (*)(char *, uint64_t))v62[1].isa;
      isa(v11, v4);
      unint64_t v28 = v66;
    }
    sub_1E4CBEE70();
    id v48 = v64;
    swift_bridgeObjectRetain();
    id v49 = v48;
    unint64_t v50 = (unint64_t)v8;
    os_log_t v51 = sub_1E4CBEE90();
    os_log_type_t v52 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      unint64_t v66 = v50;
      uint64_t v55 = v54;
      v68[0] = v54;
      *(_DWORD *)uint64_t v53 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1E4C8304C(v63, v28, v68);
      id v62 = v5;
      sub_1E4CBF520();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v53 + 12) = 2080;
      uint64_t v56 = sub_1E4C8BE50();
      uint64_t v67 = sub_1E4C8304C(v56, v57, v68);
      sub_1E4CBF520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E4BFE000, v51, v52, "HPMHeadphoneManager updateHeadphoneDevice fetchedDevice:%s ::::: incomingDevice:%s", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v55, -1, -1);
      MEMORY[0x1E4E8B4E0](v53, -1, -1);

      unint64_t v58 = v66;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v58 = v50;
    }
    return ((uint64_t (*)(unint64_t, uint64_t))isa)(v58, v4);
  }
  else
  {
    if (qword_1EAE8E7E0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1E4CBEC70();
    uint64_t v20 = v19;
    swift_beginAccess();
    id v21 = a2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v67 = qword_1EAE900F8;
    qword_1EAE900F8 = 0x8000000000000000;
    sub_1E4C8C270((uint64_t)v21, v18, v20, isUniquelyReferenced_nonNull_native);
    qword_1EAE900F8 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

ValueMetadata *_s14AssociatedKeysVMa()
{
  return &_s14AssociatedKeysVN;
}

uint64_t sub_1E4C8CF54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E4C8CF9C()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE90100);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90100);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4C8D00C()
{
  if (qword_1EAE8E7F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90100);
}

uint64_t sub_1E4C8D070@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8E7F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90100);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1E4C8D118()
{
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1E4CBE8B0();

  return v2;
}

void sub_1E4C8D1E4()
{
  id v1 = v0;
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  id v5 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_1E4CBE8B0();

  id v6 = objc_allocWithZone(MEMORY[0x1E4F83AF8]);
  uint64_t v7 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  unint64_t v8 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v6, sel_initWithTitle_detailText_icon_, v7, v8, 0, 0xE000000000000000);

  objc_msgSend(v15, sel_setModalInPresentation_, 1);
  id v9 = objc_msgSend(v15, sel_navigationItem);
  sub_1E4C7EA5C(0, &qword_1EAE8DA70);
  sub_1E4C7EA5C(0, &qword_1EAE8DA78);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1E4CBF480();
  int64_t v11 = (void *)sub_1E4CBF3C0();
  objc_msgSend(v9, sel_setRightBarButtonItem_, v11, 0, 0, 0, sub_1E4C8D54C, v10);

  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB19E8]), sel_initWithRootViewController_, v15);
  id v13 = objc_msgSend(v1, sel_navigationController);
  if (v13)
  {
    unint64_t v14 = v13;
    objc_msgSend(v13, sel_presentViewController_animated_completion_, v12, 1, 0);
  }
}

uint64_t sub_1E4C8D514()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4C8D54C()
{
  swift_beginAccess();
  id v1 = (void *)MEMORY[0x1E4E8B570](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_navigationController);

    if (v3)
    {
      objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
}

uint64_t BTSDeviceConfigController.b498Specifiers.getter()
{
  if (!objc_msgSend(v0, sel_device)) {
    return MEMORY[0x1E4FBC860];
  }
  swift_getObjectType();
  id v1 = sub_1E4C93630();
  swift_unknownObjectRelease();
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_1E4CBE8B0();
  uint64_t v7 = v6;

  uint64_t v8 = sub_1E4C87A94();
  uint64_t v10 = sub_1E4C87AA0(v5, v7, v8, v9);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v11 + 144))(sub_1E4C8DFE8);
  swift_release();
  id v13 = objc_msgSend(v3, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata);
  uint64_t v14 = sub_1E4CBE8B0();
  uint64_t v16 = v15;

  long long v38 = 0u;
  long long v37 = 0u;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v1;
  id v19 = v1;
  char v20 = sub_1E4C877B0();
  *((void *)&v35 + 1) = sub_1E4C8E090;
  *((void *)&v34 + 1) = sub_1E4C8E028;
  *(void *)&long long v35 = v17;
  *(void *)&long long v34 = 0;
  __n128 v21 = sub_1E4C879DC(0, 0, v14, v16, (uint64_t)&v37, 0, 0, 6, (uint64_t)v39, 0, v20 & 1, v34, v35, (__n128)(unint64_t)v18, 0);
  uint64_t v22 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v12 + 152))(v39, v21);
  swift_release();
  sub_1E4C8411C((uint64_t)v39);
  uint64_t v23 = (*(uint64_t (**)(void (*)(void *), void))(*(void *)v22 + 168))(sub_1E4C8E0F0, 0);
  swift_release();
  id v24 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v25 = sub_1E4CBE8B0();
  uint64_t v27 = v26;

  long long v38 = 0u;
  long long v37 = 0u;
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  char v29 = sub_1E4C877B0();
  v36.n128_u64[1] = (unint64_t)sub_1E4C8E158;
  v36.n128_u64[0] = 0;
  sub_1E4C879DC(0, 0, v25, v27, (uint64_t)&v37, 0, 0, 13, (uint64_t)v39, 0, v29 & 1, 0, 0, v36, v28);
  swift_release();
  uint64_t v30 = (*(uint64_t (**)(unsigned char *))(*(void *)v23 + 152))(v39);
  swift_release();
  uint64_t v31 = sub_1E4C8411C((uint64_t)v39);
  uint64_t v32 = (*(uint64_t (**)(uint64_t))(*(void *)v30 + 176))(v31);

  swift_release();
  return v32;
}

void sub_1E4C8DBDC(void *a1, uint64_t a2)
{
  uint64_t v28 = a2;
  id v29 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAF0);
  MEMORY[0x1F4188790](v2 - 8);
  id v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_1E4CBE8B0();
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v12 = sub_1E4CBE8B0();
  uint64_t v14 = v13;

  uint64_t v32 = v8;
  uint64_t v33 = v10;
  uint64_t v30 = v12;
  uint64_t v31 = v14;
  uint64_t v15 = sub_1E4CBE980();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_1E4C932AC();
  uint64_t v16 = sub_1E4CBF540();
  uint64_t v18 = v17;
  char v20 = v19;
  sub_1E4C93300((uint64_t)v4);
  swift_bridgeObjectRelease();
  if (v20)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1E4C7EA5C(0, &qword_1EAE8DB00);
    __n128 v21 = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v22 = NSStringFromClass(v21);
    if (!v22)
    {
      sub_1E4CBF1F0();
      uint64_t v22 = (NSString *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
    }
    id v23 = v29;
    objc_msgSend(v29, sel_setProperty_forKey_, v22, *MEMORY[0x1E4F93140], v28);

    id v24 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v23, sel_setProperty_forKey_, v24, *MEMORY[0x1E4F93160]);

    uint64_t v32 = v16;
    uint64_t v33 = v18;
    uint64_t v30 = v8;
    uint64_t v31 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DB08);
    sub_1E4C93360();
    v34.location = sub_1E4CBF490();
    uint64_t v25 = NSStringFromRange(v34);
    if (!v25)
    {
      sub_1E4CBF1F0();
      uint64_t v25 = (NSString *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v23, sel_setProperty_forKey_, v25, *MEMORY[0x1E4F93150]);

    id v26 = objc_msgSend(self, sel_valueWithNonretainedObject_, v28);
    objc_msgSend(v23, sel_setProperty_forKey_, v26, *MEMORY[0x1E4F93158]);

    uint64_t v27 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v23, sel_setProperty_forKey_, v27, *MEMORY[0x1E4F93148]);
  }
}

void sub_1E4C8DFE8(void *a1)
{
  sub_1E4C8DBDC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1E4C8DFF0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1E4C8E028()
{
  sub_1E4CBEAD0();
  int v0 = sub_1E4CBEDD0();
  swift_release();
  id v1 = objc_allocWithZone(NSNumber);

  return objc_msgSend(v1, sel_initWithInteger_, v0 == 1);
}

uint64_t sub_1E4C8E090(void *a1)
{
  sub_1E4CBEAD0();
  objc_msgSend(a1, sel_BOOLValue);
  sub_1E4CBEDE0();

  return swift_release();
}

void sub_1E4C8E0F0(void *a1)
{
  id v2 = (id)sub_1E4CBF300();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E4F93130]);
}

void sub_1E4C8E158()
{
  uint64_t v1 = v0 + 16;
  sub_1E4C92374((uint64_t)v7);
  id v2 = objc_allocWithZone((Class)type metadata accessor for B498TutorialController());
  id v3 = sub_1E4C8EDF8((uint64_t)v7);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB19E8]), sel_initWithRootViewController_, v3);

  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x1E4E8B570](v1);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_presentViewController_animated_completion_, v4, 1, 0);
  }
}

uint64_t sub_1E4C8E210@<X0>(uint64_t a1@<X8>)
{
  sub_1E4C92374((uint64_t)v3);
  return sub_1E4C92A04((uint64_t)v3, a1);
}

id sub_1E4C8E24C(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_1E4C8EDF8(a1);
}

uint64_t sub_1E4C8E280@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1E4C92A04(v1, (uint64_t)v61);
  long long v4 = 0uLL;
  char v5 = -1;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  long long v10 = 0uLL;
  switch(v61[64])
  {
    case 1:
      sub_1E4C7EA5C(0, &qword_1EAE8DA68);
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v25 = self;
      id v26 = objc_msgSend(v25, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v27 = sub_1E4CBE8B0();
      uint64_t v50 = v28;
      uint64_t v53 = v27;

      id v29 = objc_msgSend(v25, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
      uint64_t v30 = sub_1E4CBE8B0();
      uint64_t v32 = v31;

      id v33 = objc_msgSend(v25, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
      uint64_t v34 = sub_1E4CBE8B0();
      uint64_t v36 = v35;

      uint64_t result = sub_1E4C9527C(v53, v50, v30, v32, v34, v36, 0, 0, &v55);
      uint64_t v6 = v55;
      uint64_t v7 = v56;
      uint64_t v8 = v57;
      uint64_t v9 = v58;
      char v5 = 2;
      goto LABEL_5;
    case 2:
      sub_1E4C7EA5C(0, &qword_1EAE8DA68);
      uint64_t v37 = swift_getObjCClassFromMetadata();
      long long v38 = self;
      id v39 = objc_msgSend(v38, sel_bundleForClass_, v37);
      uint64_t v40 = sub_1E4CBE8B0();
      uint64_t v51 = v41;
      uint64_t v54 = v40;

      id v42 = objc_msgSend(v38, sel_bundleForClass_, v37, 0xE000000000000000);
      uint64_t v43 = sub_1E4CBE8B0();
      uint64_t v45 = v44;

      id v46 = objc_msgSend(v38, sel_bundleForClass_, v37, 0xE000000000000000);
      uint64_t v47 = sub_1E4CBE8B0();
      uint64_t v49 = v48;

      uint64_t result = sub_1E4C9527C(v54, v51, v43, v45, v47, v49, 0, 0, &v55);
      uint64_t v6 = v55;
      uint64_t v7 = v56;
      uint64_t v8 = v57;
      uint64_t v9 = v58;
      char v5 = 3;
      goto LABEL_5;
    case 3:
      goto LABEL_6;
    default:
      sub_1E4C7EA5C(0, &qword_1EAE8DA68);
      uint64_t v11 = swift_getObjCClassFromMetadata();
      uint64_t v12 = self;
      id v13 = objc_msgSend(v12, sel_bundleForClass_, v11);
      uint64_t v52 = sub_1E4CBE8B0();
      uint64_t v15 = v14;

      id v16 = objc_msgSend(v12, (SEL)&selRef_fillPillsAroundAngle_ + 5, v11, 0xE000000000000000);
      uint64_t v17 = sub_1E4CBE8B0();
      uint64_t v19 = v18;

      id v20 = objc_msgSend(v12, sel_bundleForClass_, v11, 0xE000000000000000);
      uint64_t v21 = sub_1E4CBE8B0();
      uint64_t v23 = v22;

      uint64_t result = sub_1E4C9527C(v52, v15, v17, v19, v21, v23, 0, 0, &v55);
      uint64_t v6 = v55;
      uint64_t v7 = v56;
      uint64_t v8 = v57;
      uint64_t v9 = v58;
      char v5 = 1;
LABEL_5:
      long long v4 = v59;
      long long v10 = v60;
LABEL_6:
      *(void *)a1 = v6;
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v8;
      *(void *)(a1 + 24) = v9;
      *(_OWORD *)(a1 + 32) = v4;
      *(_OWORD *)(a1 + 48) = v10;
      *(unsigned char *)(a1 + 64) = v5;
      return result;
  }
}

__n128 sub_1E4C8E828@<Q0>(uint64_t a1@<X8>)
{
  sub_1E4C92A04(v1, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  long long v7 = v9[1];
  __n128 v8 = (__n128)v9[2];
  long long v6 = v9[0];
  sub_1E4C93240(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  __n128 result = v8;
  *(__n128 *)(a1 + 32) = v8;
  *(void *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = v4;
  return result;
}

void *sub_1E4C8E8B0()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player);
  uint64_t v3 = v2;
  if (v2 == (void *)1)
  {
    uint64_t v3 = (void *)sub_1E4C8E920(v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_1E4C92C2C(v4);
  }
  sub_1E4C92FD8(v2);
  return v3;
}

uint64_t sub_1E4C8E920(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAC8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E4CBE910();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v22 - v10;
  id v12 = 0;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64) != 3) {
    return (uint64_t)v12;
  }
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v15 = (void *)sub_1E4CBF1C0();
  id v16 = (void *)sub_1E4CBF1C0();
  id v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (v17)
  {
    sub_1E4CBE8F0();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v18(v4, v9, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
    if (result != 1)
    {
      v18(v11, v4, v5);
      id v20 = objc_allocWithZone((Class)HPSMovieLoopPlayer);
      uint64_t v21 = (void *)sub_1E4CBE8E0();
      id v12 = objc_msgSend(v20, sel_initWithFrame_urlForResource_, v21, 0.0, 0.0, 0.0, 0.0);

      objc_msgSend(v12, sel_load);
      objc_msgSend(v12, sel_setDesiredBounds_, 0.0, 0.0, 150.0, 150.0);
      objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      return (uint64_t)v12;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  __break(1u);
  return result;
}

id sub_1E4C8EC64()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(self, sel_boldButton);
    uint64_t v6 = *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 40);
    uint64_t v7 = *(void **)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 48);
    sub_1E4C92A2C(*(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 8), *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 16), *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 24), *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 32), v6, v7, *(void *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 56), *(unsigned char *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (v6)
    {
      uint64_t v8 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_msgSend(v5, sel_setTitle_forState_, v8, 0);

    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_1E4CB0CD4((uint64_t)sub_1E4C92FE8, v9);
    swift_release_n();
    uint64_t v10 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v11 = v2;
  return v3;
}

id sub_1E4C8EDF8(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player] = 1;
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView] = 0;
  sub_1E4C92A04(a1, (uint64_t)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType]);
  sub_1E4C92A04(a1, (uint64_t)v15);
  id v3 = (void *)v15[6];
  sub_1E4C93240(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
  sub_1E4C93240(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  sub_1E4C92A04(a1, (uint64_t)v13);
  id v5 = v14;
  sub_1E4C93240(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  sub_1E4C92A04(a1, (uint64_t)v11);
  uint64_t v7 = v12;
  sub_1E4C93240(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for B498TutorialController();
  id v8 = objc_msgSendSuper2(&v10, sel_initWithTitle_detailText_icon_contentLayout_, v4, v6, v7, 2);
  sub_1E4C93240(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92AE0);

  return v8;
}

uint64_t sub_1E4C8EFFC()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v20, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalInPresentation_, 1);
  id v3 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

  id v4 = objc_msgSend(v1, sel_contentView);
  id v5 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  id v6 = objc_msgSend(v1, sel_buttonTray);
  id v7 = sub_1E4C8EC64();
  objc_msgSend(v6, sel_addButton_, v7);

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, 0);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1E4CB12B8((uint64_t)sub_1E4C92B60, v9);
  swift_release_n();
  id v10 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v10, sel_setLeftBarButtonItem_, v8);

  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_retain();
  sub_1E4C8F300(v12);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAA8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1E4CC48E0;
  uint64_t v14 = sub_1E4CBEEC0();
  uint64_t v15 = MEMORY[0x1E4FB0F40];
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v15;
  uint64_t v16 = sub_1E4CBEF90();
  uint64_t v17 = MEMORY[0x1E4FB1138];
  *(void *)(v13 + 48) = v16;
  *(void *)(v13 + 56) = v17;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = sub_1E4C92BC4;
  void v18[3] = v11;
  v18[4] = ObjectType;
  swift_retain();
  sub_1E4CBF3E0();

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1E4C8F300(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1E4E8B570](v1);
  if (v2)
  {
    id v3 = v2;
    switch(*((unsigned char *)v2 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64))
    {
      case 1:
        (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xF0))();
        break;
      case 2:
        (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xF8))();
        break;
      case 3:
        (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x108))();
        break;
      default:
        (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xE0))();
        break;
    }
  }
}

void sub_1E4C8F4BC()
{
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v15, sel_viewDidLayoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint];
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_availableContentViewHeight);
    double v4 = v3;
    id v5 = objc_msgSend(v0, sel_contentView);
    objc_msgSend(v5, sel_bounds);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    double Width = CGRectGetWidth(v16);
    if (v4 > Width) {
      double Width = v4;
    }
    objc_msgSend(v2, sel_setConstant_, Width);
  }
}

void sub_1E4C8F5F0(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v8, sel_viewDidAppear_, a1 & 1);
  double v3 = sub_1E4C8E8B0();
  objc_msgSend(v3, sel_play);

  id v4 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v4, sel_userInterfaceStyle);

  id v5 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView];
  if (v5)
  {
    id v6 = v5;
    CGFloat v7 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setState_animated_, v7, 1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1E4C8F770()
{
  id v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 48);
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 56);
  sub_1E4C92A2C(*(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 8), *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 16), *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 24), *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 32), *(void *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 40), v2, v1, *((unsigned char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v1)
  {
    id v3 = objc_msgSend(v0, sel_contentView);
    id v4 = objc_msgSend(v3, sel_subviews);

    sub_1E4C7EA5C(0, &qword_1EAE8D858);
    unint64_t v5 = sub_1E4CBF2A0();

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_1E4CBF650();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v6)
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))(v1);
      swift_bridgeObjectRelease();
      uint64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        id v16 = v0;
        swift_bridgeObjectRetain();
        uint64_t v9 = v7 + 48;
        do
        {
          CGFloat v11 = *(void **)(v9 + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v12 = v11;
          CGFloat v13 = (void *)sub_1E4CBF1C0();
          uint64_t v14 = (void *)sub_1E4CBF1C0();
          id v15 = v12;
          if (!v11) {
            id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1818]), sel_init);
          }
          id v10 = v12;
          objc_msgSend(v16, sel_addBulletedListItemWithTitle_description_image_, v13, v14, v15);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          v9 += 64;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void sub_1E4C8FA50(void *a1)
{
  id v3 = objc_msgSend(v1, sel_contentView);
  id v4 = objc_msgSend(v3, sel_heightAnchor);

  id v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 200.0);
  uint64_t v6 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint;
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint] = v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1E4CC50C0;
  id v9 = objc_msgSend(a1, sel_centerYAnchor);
  id v10 = objc_msgSend(v1, sel_contentView);
  id v11 = objc_msgSend(v10, sel_centerYAnchor);

  id v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(void *)(v8 + 32) = v12;
  id v13 = objc_msgSend(a1, sel_centerXAnchor);
  id v14 = objc_msgSend(v1, sel_contentView);
  id v15 = objc_msgSend(v14, sel_centerXAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v8 + 40) = v16;
  id v17 = objc_msgSend(a1, sel_widthAnchor);
  id v18 = objc_msgSend(v1, sel_contentView);
  id v19 = objc_msgSend(v18, sel_widthAnchor);

  id v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(void *)(v8 + 48) = v20;
  id v21 = objc_msgSend(a1, sel_heightAnchor);
  id v22 = objc_msgSend(a1, sel_widthAnchor);
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  *(void *)(v8 + 56) = v23;
  id v24 = *(void **)&v1[v6];
  if (v24)
  {
    uint64_t v25 = self;
    *(void *)(v8 + 64) = v24;
    sub_1E4CBF2C0();
    sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
    id v26 = v24;
    id v27 = (id)sub_1E4CBF290();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_activateConstraints_, v27);
  }
  else
  {
    __break(1u);
  }
}

void sub_1E4C8FD80()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  id v2 = objc_msgSend(v1, sel_subviews);

  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  unint64_t v3 = sub_1E4CBF2A0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1E4CBF650();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_22;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x1E4E8A770](i, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_removeFromSuperview);
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v8 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v8, sel_userInterfaceStyle);

  type metadata accessor for B498TutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v11 = objc_allocWithZone(MEMORY[0x1E4F4F8A0]);
  id v12 = (void *)sub_1E4CBF1C0();
  id v13 = objc_msgSend(v11, sel_initWithPackageName_inBundle_, v12, v10);

  uint64_t v14 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView;
  id v15 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView];
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView] = v13;

  id v16 = *(void **)&v0[v14];
  if (!v16)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v18 = v17;
  id v19 = objc_msgSend(v17, sel_window);

  if (v19 && (id v20 = *(void **)&v0[v14]) != 0)
  {
    id v21 = v20;
    id v22 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setState_animated_, v22, 1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v23 = objc_msgSend(v0, sel_contentView);
  if (!*(void *)&v0[v14]) {
    goto LABEL_24;
  }
  id v24 = v23;
  objc_msgSend(v23, sel_addSubview_);

  uint64_t v25 = *(void **)&v0[v14];
  if (!v25)
  {
LABEL_25:
    __break(1u);
    return;
  }
  id v26 = v25;
  sub_1E4C8FA50(v26);
}

void sub_1E4C900E0()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  id v2 = objc_msgSend(v1, sel_subviews);

  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  unint64_t v3 = sub_1E4CBF2A0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1E4CBF650();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x1E4E8A770](i, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_removeFromSuperview);
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  type metadata accessor for B498TutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v10 = (void *)sub_1E4CBF1C0();
  id v11 = objc_msgSend(self, sel_imageNamed_inBundle_, v10, v9);

  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v11);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setContentMode_, 1);
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))(v13);
  id v12 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v12, sel_addSubview_, v13);

  sub_1E4C8FA50(v13);
}

void sub_1E4C9038C(void *a1)
{
  id v2 = v1;
  sub_1E4CBF1F0();
  id v4 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
  id v5 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithType_, v5);

  sub_1E4CBF1F0();
  id v7 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
  id v8 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithType_, v8);

  id v10 = objc_msgSend(v2, sel_traitCollection);
  id v11 = objc_msgSend(v10, sel_userInterfaceStyle);

  uint64_t v12 = MEMORY[0x1E4F39AD8];
  if (v11 == (id)1) {
    float v13 = 1.0;
  }
  else {
    float v13 = 0.98;
  }
  int v14 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 20);
  int v15 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 44);
  int v16 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 76);
  id v17 = self;
  float v28 = v13;
  long long v29 = *(_OWORD *)(v12 + 4);
  int v30 = v14;
  float v31 = v13;
  long long v32 = *(_OWORD *)(v12 + 28);
  int v33 = v15;
  float v34 = v13;
  long long v35 = *(_OWORD *)(v12 + 52);
  uint64_t v36 = *(void *)(v12 + 68);
  int v37 = v16;
  id v18 = objc_msgSend(v17, sel_valueWithCAColorMatrix_, &v28);
  id v19 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v6, sel_setValue_forKey_, v18, v19);

  id v20 = (void *)sub_1E4CBF340();
  id v21 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v9, sel_setValue_forKey_, v20, v21);

  id v22 = objc_msgSend(a1, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1E4CC48E0;
  uint64_t v24 = sub_1E4C7EA5C(0, &qword_1EAE8DAB0);
  *(void *)(v23 + 32) = v6;
  *(void *)(v23 + 88) = v24;
  *(void *)(v23 + 56) = v24;
  *(void *)(v23 + 64) = v9;
  id v25 = v6;
  id v26 = v9;
  id v27 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setFilters_, v27);
}

void sub_1E4C906AC()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_contentView);
  id v3 = objc_msgSend(v2, sel_subviews);

  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  unint64_t v4 = sub_1E4CBF2A0();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1E4CBF650();
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_19;
  }
  for (uint64_t i = 0; i != v5; ++i)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x1E4E8A770](i, v4);
    }
    else {
      id v7 = *(id *)(v4 + 8 * i + 32);
    }
    id v8 = v7;
    objc_msgSend(v7, sel_removeFromSuperview);
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v9 = sub_1E4C8E8B0();
  if (!v9) {
    return;
  }
  id v10 = v9;
  id v11 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v11, sel_addSubview_, v10);

  uint64_t v12 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1E4CC4DD0;
  id v14 = objc_msgSend(v10, sel_topAnchor);
  id v15 = objc_msgSend(v1, sel_contentView);
  id v16 = objc_msgSend(v15, sel_topAnchor);

  id v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(void *)(v13 + 32) = v17;
  id v18 = objc_msgSend(v10, sel_centerXAnchor);
  id v19 = objc_msgSend(v1, sel_contentView);
  id v20 = objc_msgSend(v19, sel_centerXAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v13 + 40) = v21;
  id v22 = objc_msgSend(v10, sel_widthAnchor);
  id v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, 150.0);

  *(void *)(v13 + 48) = v23;
  id v24 = objc_msgSend(v10, sel_heightAnchor);
  id v25 = objc_msgSend(v10, sel_widthAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(void *)(v13 + 56) = v26;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  id v27 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  v89 = v12;
  objc_msgSend(v12, sel_activateConstraints_, v27);

  v91 = v10;
  objc_msgSend(v10, sel_load);
  type metadata accessor for IconWithNumberedBulletList();
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  long long v29 = self;
  id v30 = objc_msgSend(v29, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();
  id v88 = v1;

  uint64_t v31 = sub_1E4CBF220();
  uint64_t v33 = v32;
  swift_bridgeObjectRelease();
  float v34 = sub_1E4C7E504(v31, v33, 0xD000000000000013, 0x80000001E4CCD330);
  objc_msgSend(v34, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, 0xE000000000000000);
  id v92 = objc_msgSend(self, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E4FB28F0], *MEMORY[0x1E4FB09D8]);
  if (!v92)
  {
LABEL_19:
    __break(1u);
    return;
  }
  id v35 = objc_msgSend(v29, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v36 = sub_1E4CBE8B0();
  uint64_t v38 = v37;

  id v86 = self;
  id v39 = v29;
  id v40 = objc_msgSend(v86, sel_secondaryLabelColor, 0xE000000000000000);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t, id, id, double))((*MEMORY[0x1E4FBC8C8] & *(void *)v34)
                                                                                           + 0xC8);
  v41(v36, v38, 49, 0xE100000000000000, v92, v40, 20.0);
  swift_bridgeObjectRelease();

  uint64_t v87 = v39;
  id v42 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v43 = sub_1E4CBE8B0();
  uint64_t v45 = v44;

  id v46 = objc_msgSend(v86, sel_secondaryLabelColor, 0xE000000000000000);
  v41(v43, v45, 50, 0xE100000000000000, v92, v46, 20.0);
  swift_bridgeObjectRelease();

  id v47 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v48 = sub_1E4CBE8B0();
  uint64_t v50 = v49;

  id v51 = objc_msgSend(v86, sel_secondaryLabelColor, 0xE000000000000000);
  v41(v48, v50, 51, 0xE100000000000000, v92, v51, 20.0);
  swift_bridgeObjectRelease();

  id v52 = objc_msgSend(v88, sel_contentView);
  objc_msgSend(v52, sel_addSubview_, v34);

  id v53 = objc_msgSend(self, sel_accessoryButton);
  objc_msgSend(v53, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v54 = objc_msgSend(v87, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  uint64_t v55 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v53, sel_setTitle_forState_, v55, 0, 0xE000000000000000);

  sub_1E4C7EA5C(0, &qword_1EAE8DA78);
  uint64_t v56 = (void *)sub_1E4CBF480();
  objc_msgSend(v53, sel_addAction_forControlEvents_, v56, 64, 0, 0, 0, sub_1E4C91418, 0);

  LODWORD(v57) = 1148846080;
  objc_msgSend(v53, sel_setContentCompressionResistancePriority_forAxis_, 1, v57);
  id v58 = objc_msgSend(v53, sel_titleLabel);
  if (v58)
  {
    long long v59 = v58;
    objc_msgSend(v58, sel_setFont_, v92);
  }
  id v60 = objc_msgSend(v88, sel_contentView);
  objc_msgSend(v60, _swift_FORCE_LOAD___swiftSpatial___HeadphoneConfigs, v53);

  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_1E4CC50D0;
  id v62 = objc_msgSend(v34, sel_topAnchor);
  id v63 = objc_msgSend(v91, sel_bottomAnchor);
  id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v63, 35.0);

  *(void *)(v61 + 32) = v64;
  id v65 = objc_msgSend(v34, sel_leadingAnchor);
  id v66 = objc_msgSend(v88, sel_contentView);
  id v67 = objc_msgSend(v66, (SEL)&selRef_hideContinueButton + 2);

  id v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v67);
  *(void *)(v61 + 40) = v68;
  id v69 = objc_msgSend(v34, sel_trailingAnchor);
  id v70 = objc_msgSend(v88, _swift_FORCE_LOAD___swiftSpatial___HeadphoneConfigs);
  id v71 = objc_msgSend(v70, sel_trailingAnchor);

  id v72 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v71);
  *(void *)(v61 + 48) = v72;
  id v73 = objc_msgSend(v53, sel_topAnchor);
  id v74 = objc_msgSend(v34, sel_bottomAnchor);
  id v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_constant_, v74, 24.0);

  *(void *)(v61 + 56) = v75;
  id v76 = objc_msgSend(v53, sel_leadingAnchor);
  id v77 = objc_msgSend(v34, sel_leadingAnchor);
  id v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_constant_, v77, 40.0);

  *(void *)(v61 + 64) = v78;
  id v79 = objc_msgSend(v53, sel_trailingAnchor);
  id v80 = objc_msgSend(v34, sel_trailingAnchor);
  id v81 = objc_msgSend(v79, sel_constraintEqualToAnchor_constant_, v80, -40.0);

  *(void *)(v61 + 72) = v81;
  id v82 = objc_msgSend(v88, sel_contentView);
  id v83 = objc_msgSend(v82, sel_bottomAnchor);

  id v84 = objc_msgSend(v53, sel_bottomAnchor);
  id v85 = objc_msgSend(v83, sel_constraintEqualToAnchor_, v84);

  *(void *)(v61 + 80) = v85;
  sub_1E4CBF2C0();
  id v90 = (id)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v89, sel_activateConstraints_, v90);
}

uint64_t sub_1E4C91418()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAC8);
  MEMORY[0x1F4188790](v0 - 8);
  id v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E4CBE910();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4CBE900();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v8 = self;
    id v9 = objc_msgSend(v8, sel_sharedApplication);
    id v10 = (void *)sub_1E4CBE8E0();
    unsigned int v11 = objc_msgSend(v9, sel_canOpenURL_, v10);

    if (v11)
    {
      id v12 = objc_msgSend(v8, sel_sharedApplication);
      uint64_t v13 = (void *)sub_1E4CBE8E0();
      sub_1E4C91694(MEMORY[0x1E4FBC860]);
      type metadata accessor for OpenExternalURLOptionsKey();
      sub_1E4C93458(&qword_1EAE8DAD0);
      id v14 = (void *)sub_1E4CBF180();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_openURL_options_completionHandler_, v13, v14, 0);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

unint64_t sub_1E4C91694(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAD8);
  uint64_t v2 = sub_1E4CBF680();
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
    sub_1E4C92F70(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1E4C7F5B0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1E4C7F6AC(&v14, (_OWORD *)(v3[7] + 32 * result));
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

id sub_1E4C917B0()
{
  id v0 = objc_msgSend(self, sel_currentTraitCollection);
  objc_msgSend(v0, sel_userInterfaceStyle);

  sub_1E4CBF250();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_imageNamed_inBundle_, v4, v3);

  sub_1E4CBF250();
  id v7 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata);
  id v8 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v5, sel_imageNamed_inBundle_, v8, v7);

  sub_1E4CBF250();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  BOOL v11 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v5, sel_imageNamed_inBundle_, v11, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E4CC4DC0;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 48) = v12;
  uint64_t v20 = inited;
  sub_1E4CBF2C0();
  id v14 = v6;
  id v15 = v9;
  id v16 = v12;
  uint64_t v17 = swift_bridgeObjectRetain();
  id v18 = sub_1E4C91AB8(v17, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v18;
}

id sub_1E4C91AB8(uint64_t a1, uint64_t a2)
{
  unint64_t v43 = *(void *)(a1 + 16);
  if (*(void *)(a2 + 16) >= v43) {
    int64_t v4 = *(void *)(a1 + 16);
  }
  else {
    int64_t v4 = *(void *)(a2 + 16);
  }
  uint64_t v54 = MEMORY[0x1E4FBC860];
  sub_1E4C92250(0, v4, 0);
  uint64_t v5 = v54;
  uint64_t v41 = a2;
  uint64_t v42 = a1;
  int64_t v39 = v4;
  if (v4)
  {
    id v6 = (void **)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = (uint64_t *)(a1 + 48);
    while (1)
    {
      uint64_t v8 = *(v7 - 1);
      uint64_t v45 = *(v7 - 2);
      int64_t v47 = v4;
      uint64_t v9 = *v7;
      uint64_t v10 = v7[1];
      BOOL v11 = (void *)v7[4];
      id v12 = *v6;
      uint64_t v49 = v6 + 1;
      uint64_t v51 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v13 = v11;
      swift_bridgeObjectRetain();
      id result = v12;
      if (!v8) {
        break;
      }
      id v15 = result;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v16 = v15;
      sub_1E4C9527C(v45, v8, v9, v10, 0, 0, (uint64_t)v12, 0, v53);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id result = (id)swift_bridgeObjectRelease();
      uint64_t v5 = v51;
      uint64_t v54 = v51;
      unint64_t v18 = *(void *)(v51 + 16);
      unint64_t v17 = *(void *)(v51 + 24);
      if (v18 >= v17 >> 1)
      {
        id result = sub_1E4C92250((char *)(v17 > 1), v18 + 1, 1);
        uint64_t v5 = v54;
      }
      *(void *)(v5 + 16) = v18 + 1;
      id v19 = (_OWORD *)(v5 + (v18 << 6));
      long long v20 = v53[0];
      long long v21 = v53[1];
      long long v22 = v53[3];
      v19[4] = v53[2];
      v19[5] = v22;
      _OWORD v19[2] = v20;
      v19[3] = v21;
      v7 += 8;
      id v6 = v49;
      int64_t v4 = v47 - 1;
      if (v47 == 1) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    id result = (id)swift_bridgeObjectRetain();
LABEL_12:
    if (v43 <= v40)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (id)v5;
    }
    unint64_t v23 = v40 - v39;
    unint64_t v24 = v43 - v39;
    id v25 = (void **)(v41 + 8 * v39 + 32);
    id v26 = (uint64_t *)(v42 + (v39 << 6) + 48);
    while (v24)
    {
      if (v23)
      {
        unint64_t v50 = v24;
        uint64_t v27 = *(v26 - 1);
        uint64_t v28 = v26[1];
        uint64_t v44 = *v26;
        uint64_t v46 = *(v26 - 2);
        long long v29 = (void *)v26[4];
        id v30 = *v25;
        uint64_t v48 = v25;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        id v31 = v30;
        swift_bridgeObjectRetain();
        id v32 = v29;
        sub_1E4C9527C(v46, v27, v44, v28, 0, 0, (uint64_t)v30, 0, v52);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id result = (id)swift_bridgeObjectRelease();
        uint64_t v54 = v5;
        unint64_t v34 = *(void *)(v5 + 16);
        unint64_t v33 = *(void *)(v5 + 24);
        if (v34 >= v33 >> 1)
        {
          id result = sub_1E4C92250((char *)(v33 > 1), v34 + 1, 1);
          uint64_t v5 = v54;
        }
        *(void *)(v5 + 16) = v34 + 1;
        id v35 = (_OWORD *)(v5 + (v34 << 6));
        long long v36 = v52[0];
        long long v37 = v52[1];
        long long v38 = v52[3];
        v35[4] = v52[2];
        v35[5] = v38;
        v35[2] = v36;
        v35[3] = v37;
        --v23;
        id v25 = v48 + 1;
        v26 += 8;
        unint64_t v24 = v50 - 1;
        if (v50 != 1) {
          continue;
        }
      }
      goto LABEL_19;
    }
    __break(1u);
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1E4C91E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  id v12 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = 0;
    goto LABEL_6;
  }
  id v13 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void sub_1E4C91EF8()
{
}

id sub_1E4C91F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v7 = v6;
  BOOL v11 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void sub_1E4C92010()
{
}

id sub_1E4C92074()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for B498TutorialController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4C92144(uint64_t a1, uint64_t a2)
{
  return sub_1E4C92174(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1E4C9215C(uint64_t a1, uint64_t a2)
{
  return sub_1E4C92174(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1E4C92174(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1E4CBF1F0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1E4C921B8(uint64_t a1)
{
  uint64_t v2 = sub_1E4C93458(&qword_1EAE8DAD0);
  uint64_t v3 = sub_1E4C93458(&qword_1EAE8DB38);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

char *sub_1E4C92250(char *a1, int64_t a2, char a3)
{
  id result = sub_1E4C92270(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_1E4C92270(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAC0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

double sub_1E4C92374@<D0>(uint64_t a1@<X8>)
{
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = sub_1E4CBE8B0();
  uint64_t v63 = v5;
  uint64_t v64 = v4;

  id v6 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v7 = sub_1E4CBE8B0();
  uint64_t v61 = v8;
  uint64_t v62 = v7;

  id v9 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v10 = sub_1E4CBE8B0();
  uint64_t v59 = v11;
  uint64_t v60 = v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAC0);
  uint64_t v12 = (_OWORD *)swift_allocObject();
  v12[1] = xmmword_1E4CC4DC0;
  id v13 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v14 = sub_1E4CBE8B0();
  uint64_t v55 = v15;
  uint64_t v57 = v14;

  id v16 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v17 = sub_1E4CBE8B0();
  uint64_t v19 = v18;

  id v20 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  long long v21 = (void *)sub_1E4CBF1C0();
  id v66 = self;
  id v22 = objc_msgSend(v66, sel_imageNamed_inBundle_, v21, v20);

  sub_1E4C9527C(v57, v55, v17, v19, 0, 0, (uint64_t)v22, 0, v67);
  long long v23 = v67[1];
  _OWORD v12[2] = v67[0];
  uint64_t v12[3] = v23;
  long long v24 = v67[3];
  v12[4] = v67[2];
  v12[5] = v24;
  id v25 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v26 = sub_1E4CBE8B0();
  uint64_t v56 = v27;
  uint64_t v58 = v26;

  id v28 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v29 = sub_1E4CBE8B0();
  uint64_t v31 = v30;

  id v32 = objc_msgSend(v2, (SEL)&selRef_fillPillsAroundAngle_ + 5, ObjCClassFromMetadata, 0xE000000000000000);
  unint64_t v33 = (void *)sub_1E4CBF1C0();
  id v34 = objc_msgSend(v66, sel_imageNamed_inBundle_, v33, v32);

  sub_1E4C9527C(v58, v56, v29, v31, 0, 0, (uint64_t)v34, 0, v68);
  long long v35 = v68[1];
  v12[6] = v68[0];
  v12[7] = v35;
  long long v36 = v68[3];
  v12[8] = v68[2];
  v12[9] = v36;
  id v37 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v38 = sub_1E4CBE8B0();
  uint64_t v40 = v39;

  id v41 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v42 = sub_1E4CBE8B0();
  uint64_t v44 = v43;

  id v45 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v46 = (void *)sub_1E4CBF1C0();
  id v47 = objc_msgSend(v66, sel_imageNamed_inBundle_, v46, v45);

  sub_1E4C9527C(v38, v40, v42, v44, 0, 0, (uint64_t)v47, 0, v69);
  long long v48 = v69[1];
  v12[10] = v69[0];
  v12[11] = v48;
  long long v49 = v69[3];
  v12[12] = v69[2];
  v12[13] = v49;
  sub_1E4C9527C(v64, v63, v62, v61, v60, v59, 0, (uint64_t)v12, &v70);
  double result = *(double *)&v70;
  uint64_t v51 = v71;
  uint64_t v52 = v72;
  long long v53 = v73;
  long long v54 = v74;
  *(_OWORD *)a1 = v70;
  *(void *)(a1 + 16) = v51;
  *(void *)(a1 + 24) = v52;
  *(_OWORD *)(a1 + 32) = v53;
  *(_OWORD *)(a1 + 48) = v54;
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

uint64_t sub_1E4C92A04(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  *(unsigned char *)(a2 + 64) = *(unsigned char *)(a1 + 64);
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  return a2;
}

void sub_1E4C92A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 3u)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v9 = a7;
  }
}

uint64_t type metadata accessor for B498TutorialController()
{
  return self;
}

uint64_t sub_1E4C92AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 3u)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1E4C92B60()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x1E4E8B570](v0 + 16);
  if (v1)
  {
    long long v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

void sub_1E4C92BC4()
{
  sub_1E4C8F300(v0);
}

uint64_t sub_1E4C92BCC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E4C92C04()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1E4C92C2C(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t destroy for B498TutorialPanesType(uint64_t a1)
{
  return sub_1E4C92AE0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

uint64_t initializeWithCopy for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  id v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_1E4C92A2C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  id v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_1E4C92A2C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  unsigned __int8 v20 = *(unsigned char *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_1E4C92AE0(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_1E4C92AE0(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for B498TutorialPanesType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for B498TutorialPanesType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1E4C92EF8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

uint64_t sub_1E4C92F00(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for B498TutorialPanesType()
{
  return &type metadata for B498TutorialPanesType;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_1EAE8DB18)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAE8DB18);
    }
  }
}

uint64_t sub_1E4C92F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_1E4C92FD8(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_1E4C92FE8()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E8B570](v0 + 16);
  if (v2)
  {
    unsigned int v3 = (void *)v2;
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x1E4E8B570](v0 + 16);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      sub_1E4C92A04(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType, (uint64_t)v14);
      sub_1E4C93240((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);

      sub_1E4C8E280((uint64_t)v11);
      sub_1E4C93240((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92AE0);
      sub_1E4C931D8((uint64_t)v11, (uint64_t)v12);
      if (v12[64] != 255)
      {
        sub_1E4C92A04((uint64_t)v12, (uint64_t)v13);
        id v6 = objc_allocWithZone((Class)type metadata accessor for B498TutorialController());
        sub_1E4C93240((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C92A2C);
        id v7 = sub_1E4C8EDF8((uint64_t)v13);
        id v8 = objc_msgSend(v3, sel_navigationController);
        if (v8)
        {
          id v9 = v8;
          objc_msgSend(v8, sel_pushViewController_animated_, v7, 1);

          sub_1E4C93240((uint64_t)v11, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C93294);
          id v7 = v9;
        }
        else
        {

          sub_1E4C93240((uint64_t)v11, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C93294);
        }
        goto LABEL_9;
      }
    }
  }
  swift_beginAccess();
  uint64_t v10 = (void *)MEMORY[0x1E4E8B570](v1);
  if (!v10) {
    return;
  }
  id v7 = v10;
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, 0);
LABEL_9:
}

uint64_t sub_1E4C931D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4C93240(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 64);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v4);
  return a1;
}

uint64_t sub_1E4C93294(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255) {
    return sub_1E4C92AE0(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

unint64_t sub_1E4C932AC()
{
  unint64_t result = qword_1EAE8DAF8;
  if (!qword_1EAE8DAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DAF8);
  }
  return result;
}

uint64_t sub_1E4C93300(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E4C93360()
{
  unint64_t result = qword_1EAE8DB10;
  if (!qword_1EAE8DB10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE8DB08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DB10);
  }
  return result;
}

uint64_t sub_1E4C933BC()
{
  return sub_1E4C93458(&qword_1EAE8DB20);
}

uint64_t sub_1E4C933F0()
{
  return sub_1E4C93458(&qword_1EAE8DB28);
}

uint64_t sub_1E4C93424()
{
  return sub_1E4C93458(&qword_1EAE8DB30);
}

uint64_t sub_1E4C93458(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4C934A4()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE90118);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90118);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4C93524()
{
  if (qword_1EAE8EB00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90118);
}

uint64_t sub_1E4C93588@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8EB00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90118);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_1E4C93630()
{
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_headphoneDevice);
  }
  return result;
}

void *sub_1E4C93674()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  if (v0)
  {
    swift_unknownObjectRetain();
    id v1 = objc_msgSend(v0, sel_address);
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v0 = (void *)sub_1E4CBF1F0();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return v0;
}

id BTSDeviceConfigController.addTopLevelEntry(hpDevice:)()
{
  return objc_msgSend(v0, sel_reloadSpecifiers);
}

id BTSDeviceConfigController.removeTopLevelEntry(hpDevice:)()
{
  id v1 = v0;
  if (objc_msgSend(v0, sel_device))
  {
    id v2 = sub_1E4C93630();
    swift_unknownObjectRelease();
    if (v2)
    {
      uint64_t v3 = sub_1E4CBEC70();
      uint64_t v5 = v4;
      if (v3 == sub_1E4CBEC70() && v5 == v6)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v8 = sub_1E4CBF6D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v8 & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      id v9 = objc_msgSend(v0, sel_navigationController);
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = objc_msgSend(v9, sel_presentedViewController);

        if (v11)
        {

          id v12 = objc_msgSend(v1, sel_navigationController);
          if (v12)
          {
            long long v13 = v12;
            objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);
          }
        }
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  if (qword_1EAE8EB00 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EAE90118);
  uint64_t v15 = sub_1E4CBEE90();
  os_log_type_t v16 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_1E4C8304C(0xD00000000000001ELL, 0x80000001E4CCD7E0, &v20);
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, v15, v16, "Connected Headphones: %s removing device", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v18, -1, -1);
    MEMORY[0x1E4E8B4E0](v17, -1, -1);
  }

  return objc_msgSend(v1, sel_reloadSpecifiers);
}

uint64_t BTSDeviceConfigController.adaptiveVolumeSupported.getter()
{
  return sub_1E4C93B54(20, 0xD000000000000017, 0x80000001E4CCD800);
}

uint64_t BTSDeviceConfigController.conversationDetectSupported.getter()
{
  return sub_1E4C93B54(19, 0xD00000000000001BLL, 0x80000001E4CCD820);
}

uint64_t sub_1E4C93B54(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (objc_msgSend(v3, sel_device)
    && (id v6 = sub_1E4C93630(), swift_unknownObjectRelease(), v6))
  {
    char v7 = sub_1E4CBEB30();

    return v7 & 1;
  }
  else
  {
    if (qword_1EAE8EB00 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EAE90118);
    uint64_t v10 = sub_1E4CBEE90();
    os_log_type_t v11 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = v13;
      *(_DWORD *)id v12 = 136315138;
      sub_1E4C8304C(a2, a3, &v14);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v10, v11, "HeadphoneConfigs: %s no device!", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v13, -1, -1);
      MEMORY[0x1E4E8B4E0](v12, -1, -1);
    }

    return 0;
  }
}

uint64_t sub_1E4C93DA4()
{
  if (!objc_msgSend(v0, sel_device)) {
    return 0;
  }
  id v1 = sub_1E4C93630();
  swift_unknownObjectRelease();
  if (!v1) {
    return 0;
  }
  char v2 = sub_1E4CBEB30();

  return v2 & 1;
}

uint64_t sub_1E4C93EC8()
{
  if (!objc_msgSend(v0, sel_device)) {
    return 1;
  }
  id v1 = sub_1E4C93630();
  swift_unknownObjectRelease();
  if (!v1) {
    return 1;
  }
  char v2 = (void *)sub_1E4CBEB00();
  unsigned __int8 v3 = sub_1E4CBED00();

  uint64_t v4 = (void *)sub_1E4CBEB00();
  unsigned __int8 v5 = sub_1E4CBED30();

  BOOL v7 = v3 != 1 || v5 != 2;
  if (qword_1EAE8EB00 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EAE90118);
  uint64_t v9 = sub_1E4CBEE90();
  os_log_type_t v10 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v9, v10))
  {
    int v20 = v3;
    int v21 = v5;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v12;
    *(_DWORD *)uint64_t v11 = 136315650;
    if (v7) {
      uint64_t v13 = 5457241;
    }
    else {
      uint64_t v13 = 20302;
    }
    if (v7) {
      unint64_t v14 = 0xE300000000000000;
    }
    else {
      unint64_t v14 = 0xE200000000000000;
    }
    sub_1E4C8304C(v13, v14, &v22);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    if (v20 == 1) {
      uint64_t v15 = 5457241;
    }
    else {
      uint64_t v15 = 20302;
    }
    if (v20 == 1) {
      unint64_t v16 = 0xE300000000000000;
    }
    else {
      unint64_t v16 = 0xE200000000000000;
    }
    sub_1E4C8304C(v15, v16, &v22);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 2080;
    if (v21 == 2) {
      uint64_t v17 = 5457241;
    }
    else {
      uint64_t v17 = 20302;
    }
    if (v21 == 2) {
      unint64_t v18 = 0xE300000000000000;
    }
    else {
      unint64_t v18 = 0xE200000000000000;
    }
    sub_1E4C8304C(v17, v18, &v22);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E4BFE000, v9, v10, "Hearing: AdaptiveTransparency: Should Show: %s, HA Capa: %s, HP Region: %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v12, -1, -1);
    MEMORY[0x1E4E8B4E0](v11, -1, -1);
  }

  return v7;
}

id _sSo25BTSDeviceConfigControllerC16HeadphoneConfigsE19updateTopLevelEntry8hpDevicey0D7Manager0dK0C_tF_0()
{
  id v1 = v0;
  if (qword_1EAE8EB00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90118);
  unsigned __int8 v3 = sub_1E4CBEE90();
  os_log_type_t v4 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned __int8 v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v8 = v6;
    *(_DWORD *)unsigned __int8 v5 = 136315138;
    sub_1E4C8304C(0xD00000000000001ELL, 0x80000001E4CCD8B0, &v8);
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, v3, v4, "Connected Headphones: %s update device", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v6, -1, -1);
    MEMORY[0x1E4E8B4E0](v5, -1, -1);
  }

  return objc_msgSend(v1, sel_reloadSpecifiers);
}

uint64_t sub_1E4C94334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E4CBEEB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = 1;
  if (a2 != 8212 && a2 != 8228)
  {
    sub_1E4C842F8(a1, (uint64_t)v18);
    sub_1E4C94514();
    if (swift_dynamicCast())
    {
      id v9 = v17;
      id v10 = objc_msgSend(v17, sel_headphoneDevice);
      if (v10)
      {
        uint64_t v11 = v10;
        char v8 = sub_1E4CBEB30();

        return v8 & 1;
      }
    }
    sub_1E4CBEE70();
    uint64_t v12 = sub_1E4CBEE90();
    os_log_type_t v13 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_1E4BFE000, v12, v13, "BTSDeviceConfig: shouldShowCaseSoundForNewAccessories no device!", v14, 2u);
      MEMORY[0x1E4E8B4E0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    char v8 = 0;
  }
  return v8 & 1;
}

unint64_t sub_1E4C94514()
{
  unint64_t result = qword_1EAE8D878;
  if (!qword_1EAE8D878)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE8D878);
  }
  return result;
}

uint64_t sub_1E4C94554()
{
  return sub_1E4CBEDA0();
}

uint64_t sub_1E4C94578()
{
  return sub_1E4CBEDB0();
}

uint64_t (*sub_1E4C9459C(uint64_t a1))()
{
  *(void *)a1 = *(void *)(v1 + 24);
  *(unsigned char *)(a1 + 8) = sub_1E4CBEDA0();
  return sub_1E4C945E8;
}

uint64_t sub_1E4C945E8()
{
  return sub_1E4CBEDB0();
}

uint64_t sub_1E4C94610()
{
  return sub_1E4CBEDF0();
}

uint64_t sub_1E4C94634(unsigned __int8 a1)
{
  return sub_1E4C94798(a1, MEMORY[0x1E4F65640], MEMORY[0x1E4F65648]);
}

uint64_t sub_1E4C94660(unsigned __int8 a1)
{
  if (a1 < 4u) {
    return 0x10200u >> (8 * a1);
  }
  type metadata accessor for AAHeadGestureConfig(0);
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

void type metadata accessor for AAHeadGestureConfig(uint64_t a1)
{
}

uint64_t (*sub_1E4C946D0(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)(v1 + 24);
  *(unsigned char *)(a1 + 8) = sub_1E4CBEDF0();
  return sub_1E4C9471C;
}

uint64_t sub_1E4C9471C(uint64_t a1, uint64_t a2)
{
  return sub_1E4C94898(a1, a2, MEMORY[0x1E4F65640], MEMORY[0x1E4F65648]);
}

uint64_t sub_1E4C94748()
{
  return sub_1E4CBEE10();
}

uint64_t sub_1E4C9476C(unsigned __int8 a1)
{
  return sub_1E4C94798(a1, MEMORY[0x1E4F65648], MEMORY[0x1E4F65640]);
}

uint64_t sub_1E4C94798(unsigned __int8 a1, void (*a2)(void), uint64_t (*a3)(void))
{
  unsigned int v4 = a1;
  a2();
  if (v4 < 4) {
    return a3(0x10200u >> (8 * v4));
  }
  type metadata accessor for AAHeadGestureConfig(0);
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

uint64_t (*sub_1E4C94820(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)(v1 + 24);
  *(unsigned char *)(a1 + 8) = sub_1E4CBEE10();
  return sub_1E4C9486C;
}

uint64_t sub_1E4C9486C(uint64_t a1, uint64_t a2)
{
  return sub_1E4C94898(a1, a2, MEMORY[0x1E4F65648], MEMORY[0x1E4F65640]);
}

uint64_t sub_1E4C94898(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  unsigned int v5 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v6 = (unsigned char *)(a1 + 9);
  a3(*(unsigned __int8 *)(a1 + 8));
  if (v5 < 4) {
    return a4(0x10200u >> (8 * v5));
  }
  type metadata accessor for AAHeadGestureConfig(0);
  *uint64_t v6 = v5;
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

uint64_t sub_1E4C9492C()
{
  return swift_retain();
}

uint64_t sub_1E4C94934(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_1E4C9499C(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1E4C9499C(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = sub_1E4CBEEB0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  os_log_type_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + 24) = a4;
  *(unsigned char *)(v5 + 16) = a1;
  *(unsigned char *)(v5 + 17) = a2;
  *(unsigned char *)(v5 + 18) = a3;
  swift_retain();
  uint64_t v14 = sub_1E4C94F38();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  swift_retain();
  uint64_t v15 = sub_1E4CBEE90();
  os_log_type_t v16 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v23 = v10;
    id v17 = (uint8_t *)swift_slowAlloc();
    unint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)id v17 = 138412290;
    uint64_t v19 = sub_1E4CBED80();
    uint64_t v20 = v19;
    if (v19) {
      uint64_t v24 = v19;
    }
    else {
      uint64_t v24 = 0;
    }
    sub_1E4CBF520();
    void *v18 = v20;
    swift_release();
    _os_log_impl(&dword_1E4BFE000, v15, v16, "Bobble: reload for value change %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v18, -1, -1);
    MEMORY[0x1E4E8B4E0](v17, -1, -1);

    uint64_t v10 = v23;
  }
  else
  {

    swift_release();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v5;
}

uint64_t sub_1E4C94C10()
{
  swift_release();
  return v0;
}

uint64_t sub_1E4C94C30()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1E4C94C68()
{
  char v1 = sub_1E4CBEDA0();
  char v2 = sub_1E4CBEDF0();
  char v3 = sub_1E4CBEE10();
  type metadata accessor for BobbleSettingsViewModel();
  uint64_t v4 = swift_allocObject();
  swift_retain();
  sub_1E4C9499C(v1, v2, v3, v0);
  return v4;
}

uint64_t sub_1E4C94CE4(char a1)
{
  switch(a1)
  {
    case 0:
    case 2:
    case 3:
      break;
    case 1:
      break;
    default:
      type metadata accessor for AAHeadGestureConfig(0);
      sub_1E4CBF6E0();
      __break(1u);
      JUMPOUT(0x1E4C94DBCLL);
  }
  return sub_1E4C951A8();
}

uint64_t sub_1E4C94DCC(char a1)
{
  if (!a1 || a1 == 2)
  {
    return sub_1E4C951A8();
  }
  if (a1 == 1)
  {
    return sub_1E4C951A8();
  }
  type metadata accessor for AAMultiState(0);
  uint64_t result = sub_1E4CBF6E0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BobbleSettingsViewModel()
{
  return self;
}

void type metadata accessor for AAMultiState(uint64_t a1)
{
}

uint64_t sub_1E4C94EC4()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE90130);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90130);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4C94F38()
{
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90130);
}

uint64_t sub_1E4C94F9C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90130);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void sub_1E4C95044(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for BobbleTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  BOOL v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v9 = sub_1E4CBE8B0();
  uint64_t v11 = v10;

  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v13 = sub_1E4CBE8B0();
  uint64_t v15 = v14;

  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v11;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(void *)(a3 + 32) = v13;
  *(void *)(a3 + 40) = v15;
  *(void *)(a3 + 48) = 0;
  *(void *)(a3 + 56) = 0;
  *(unsigned char *)(a3 + 64) = 1;
}

uint64_t sub_1E4C951A8()
{
  type metadata accessor for BobbleTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1E4CBE8B0();

  return v2;
}

uint64_t type metadata accessor for BobbleTutorialController()
{
  return self;
}

uint64_t sub_1E4C9527C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

void sub_1E4C95290(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for BobbleTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  BOOL v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v9 = sub_1E4CBE8B0();
  uint64_t v11 = v10;

  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v13 = sub_1E4CBE8B0();
  uint64_t v15 = v14;

  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v11;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(void *)(a3 + 32) = v13;
  *(void *)(a3 + 40) = v15;
  *(void *)(a3 + 48) = 0;
  *(void *)(a3 + 56) = 0;
  *(unsigned char *)(a3 + 64) = 2;
}

void sub_1E4C953F4(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  char v4 = sub_1E4CBEE10();
  char v5 = sub_1E4CBEDF0();
  sub_1E4C92A04(v2, (uint64_t)v39);
  if (v40)
  {
    if (v40 == 1)
    {
      sub_1E4C99304((uint64_t)v39, (uint64_t)v41, &qword_1EAE8DB50);
      type metadata accessor for BobbleTutorialController();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      BOOL v7 = self;
      id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v9 = sub_1E4CBE8B0();
      uint64_t v11 = v10;

      if (v4 == 2)
      {
        id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        uint64_t v13 = sub_1E4CBE8B0();
        uint64_t v15 = v14;
      }
      else
      {
        if (v5 == 2)
        {
          id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        }
        else
        {
          if (qword_1EAE8EB08 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_1E4CBEEB0();
          __swift_project_value_buffer(v25, (uint64_t)qword_1EAE90130);
          uint64_t v26 = sub_1E4CBEE90();
          os_log_type_t v27 = sub_1E4CBF3A0();
          if (os_log_type_enabled(v26, v27))
          {
            id v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v28 = 0;
            _os_log_impl(&dword_1E4BFE000, v26, v27, "AADevice did not have mappings for accept / decline defaulting to nod -> accept shake -> decline", v28, 2u);
            MEMORY[0x1E4E8B4E0](v28, -1, -1);
          }

          id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        }
        uint64_t v13 = sub_1E4CBE8B0();
        uint64_t v15 = v29;
      }

      id v30 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
      uint64_t v22 = sub_1E4CBE8B0();
      uint64_t v23 = v31;

      char v24 = 2;
    }
    else
    {
      sub_1E4C99304((uint64_t)v39, (uint64_t)v41, &qword_1EAE8DB50);
      uint64_t v9 = 0;
      uint64_t v11 = 0;
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      char v24 = -1;
    }
  }
  else
  {
    sub_1E4C99304((uint64_t)v39, (uint64_t)v41, &qword_1EAE8DB50);
    type metadata accessor for BobbleTutorialController();
    uint64_t v16 = swift_getObjCClassFromMetadata();
    id v17 = self;
    id v18 = objc_msgSend(v17, sel_bundleForClass_, v16);
    uint64_t v9 = sub_1E4CBE8B0();
    uint64_t v11 = v19;

    if (v4 == 1)
    {
      id v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      uint64_t v13 = sub_1E4CBE8B0();
      uint64_t v15 = v21;
    }
    else
    {
      if (v5 == 1)
      {
        id v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      }
      else
      {
        if (qword_1EAE8EB08 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_1E4CBEEB0();
        __swift_project_value_buffer(v32, (uint64_t)qword_1EAE90130);
        unint64_t v33 = sub_1E4CBEE90();
        os_log_type_t v34 = sub_1E4CBF3A0();
        if (os_log_type_enabled(v33, v34))
        {
          long long v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v35 = 0;
          _os_log_impl(&dword_1E4BFE000, v33, v34, "AADevice did not have mappings for accept / decline defaulting to nod -> accept shake -> decline", v35, 2u);
          MEMORY[0x1E4E8B4E0](v35, -1, -1);
        }

        id v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      }
      uint64_t v13 = sub_1E4CBE8B0();
      uint64_t v15 = v36;
    }

    id v37 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
    uint64_t v22 = sub_1E4CBE8B0();
    uint64_t v23 = v38;

    char v24 = 1;
  }
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v11;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v15;
  *(void *)(a1 + 32) = v22;
  *(void *)(a1 + 40) = v23;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = v24;
}

__n128 sub_1E4C95ABC@<Q0>(uint64_t a1@<X8>)
{
  sub_1E4C92A04(v1, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  long long v7 = v9[1];
  __n128 v8 = (__n128)v9[2];
  long long v6 = v9[0];
  sub_1E4C99380(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97D7C);
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  __n128 result = v8;
  *(__n128 *)(a1 + 32) = v8;
  *(void *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = v4;
  return result;
}

uint64_t sub_1E4C95B44@<X0>(uint64_t a1@<X8>)
{
  sub_1E4C97E08((uint64_t)v3);
  return sub_1E4C92A04((uint64_t)v3, a1);
}

uint64_t sub_1E4C95B80()
{
  sub_1E4C92A04(v0, (uint64_t)v5);
  if (v6 == 1) {
    unsigned int v1 = 2;
  }
  else {
    unsigned int v1 = 3;
  }
  if (v6) {
    uint64_t v2 = &v8;
  }
  else {
    uint64_t v2 = &v7;
  }
  if (v6) {
    uint64_t v3 = v1;
  }
  else {
    uint64_t v3 = 0;
  }
  sub_1E4C99304((uint64_t)v5, (uint64_t)v2, &qword_1EAE8DB50);
  return v3;
}

uint64_t sub_1E4C95BF4()
{
  sub_1E4C92A04(v0, (uint64_t)v4);
  if (v5) {
    unsigned int v1 = &v7;
  }
  else {
    unsigned int v1 = &v6;
  }
  if (v5) {
    uint64_t v2 = v5;
  }
  else {
    uint64_t v2 = 1;
  }
  sub_1E4C99304((uint64_t)v4, (uint64_t)v1, &qword_1EAE8DB50);
  return v2;
}

char *sub_1E4C95C60(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return sub_1E4C95CAC(a1, a2, a3);
}

char *sub_1E4C95CAC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark] = 0;
  sub_1E4C92A04(a1, (uint64_t)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType]);
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice] = a3;
  sub_1E4C92A04(a1, (uint64_t)v17);
  if (v17[1]) {
    swift_bridgeObjectRetain();
  }
  id v7 = a3;
  sub_1E4C99380(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97D7C);
  char v8 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  sub_1E4C92A04(a1, (uint64_t)v15);
  if (v16) {
    swift_bridgeObjectRetain();
  }
  uint64_t v9 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for BobbleTutorialController();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 1);

  uint64_t v11 = (char *)v10;
  if (a2)
  {

    sub_1E4C99380(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97FBC);
    id v12 = *(void **)&v11[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(void *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = a2;
  }
  else
  {
    sub_1E4C97284();

    sub_1E4C99380(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97FBC);
    id v12 = v11;
  }

  return v11;
}

void sub_1E4C95E98(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for BobbleTutorialController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  id v3 = sub_1E4C96DF4();
  objc_msgSend(v3, sel_play);
}

uint64_t sub_1E4C95F70()
{
  unsigned int v1 = v0;
  uint64_t v2 = sub_1E4CBF430();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unsigned __int8 v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = (objc_class *)type metadata accessor for BobbleTutorialController();
  v40.receiver = v0;
  v40.super_class = v6;
  objc_msgSendSuper2(&v40, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalInPresentation_, 1);
  id v7 = objc_msgSend(self, sel_boldButton);
  char v8 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType];
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 8];
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 40];
  int v11 = v8[64];
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    swift_bridgeObjectRelease();
  }
  else {
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setTitle_forState_, v13, 0);

  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1E4CB0CD4((uint64_t)sub_1E4C98074, v14);
  swift_release_n();
  id v15 = objc_msgSend(v1, sel_buttonTray);
  objc_msgSend(v15, sel_addButton_, v7);

  id v16 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v16, sel_setHidesBackButton_, 1);

  id v17 = objc_msgSend(v1, sel_contentView);
  id v18 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v17, sel_setBackgroundColor_, v18);

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, 0);
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1E4CB12B8((uint64_t)sub_1E4C9873C, v20);
  swift_release_n();
  id v21 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v21, sel_setLeftBarButtonItem_, v19);

  if (v11)
  {
    uint64_t v22 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
    uint64_t v23 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    if (v23)
    {
      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v24;
      *(void *)(v25 + 24) = v7;
      aBlock[4] = sub_1E4C98934;
      aBlock[5] = v25;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1E4C95F6C;
      aBlock[3] = &block_descriptor_0;
      uint64_t v26 = _Block_copy(aBlock);
      id v27 = v23;
      id v28 = v7;
      swift_release();
      objc_msgSend(v27, sel_setHeadGestureUpdatedHandler_, v26);
      _Block_release(v26);
    }
    objc_msgSend(v7, sel_setEnabled_, 0);
    uint64_t v29 = *(void **)&v1[v22];
    if (v29) {
      objc_msgSend(v29, sel_setHeadGestureUpdateFlags_, 3);
    }
    if (qword_1EAE8EB08 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EAE90130);
    uint64_t v31 = sub_1E4CBEE90();
    os_log_type_t v32 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_1E4BFE000, v31, v32, "HG ViewDidLoad: button enabled == false, setting unumte [.headGesture, .audioFeedback].", v33, 2u);
      MEMORY[0x1E4E8B4E0](v33, -1, -1);
    }
  }
  id v34 = sub_1E4C96DF4();
  id v35 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v35, sel_addSubview_, v34);

  id v36 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v34, sel_pinToOther_, v36);

  objc_msgSend(v34, sel_load);
  id v37 = objc_msgSend(self, sel_defaultCenter);
  sub_1E4CBF440();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1E4C98BA8();
  sub_1E4CBF0E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  sub_1E4CBEFC0();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_1E4C965F8(uint64_t a1)
{
  unsigned int v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1E4C9663C(void *a1, uint64_t a2, void *a3)
{
  id v53 = a3;
  uint64_t v5 = sub_1E4CBEEB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 16;
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v5, (uint64_t)qword_1EAE90130);
  int v11 = *(void (**)(char *))(v6 + 16);
  uint64_t v55 = v10;
  v11(v8);
  id v12 = a1;
  uint64_t v13 = sub_1E4CBEE90();
  os_log_type_t v14 = sub_1E4CBF3B0();
  BOOL v15 = os_log_type_enabled(v13, v14);
  id v16 = &selRef_tableView_cellForRowAtIndexPath_;
  uint64_t v56 = v9;
  if (v15)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v58 = sub_1E4C8304C(0x4C64694477656976, 0xED0000292864616FLL, aBlock);
    sub_1E4CBF520();
    *(_WORD *)(v17 + 12) = 256;
    LOBYTE(v58) = objc_msgSend(v12, sel_detectedHeadGesture);
    id v16 = &selRef_tableView_cellForRowAtIndexPath_;
    uint64_t v9 = v56;
    sub_1E4CBF520();

    _os_log_impl(&dword_1E4BFE000, v13, v14, "%s Headgesture detected: %hhu", (uint8_t *)v17, 0xFu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v18, -1, -1);
    MEMORY[0x1E4E8B4E0](v17, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  unsigned int v19 = [v12 v16[161]];
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x1E4E8B570](v9);
  if (!v20) {
    goto LABEL_18;
  }
  id v21 = (void *)v20;
  uint64_t v22 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType);
  uint64_t v23 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 8);
  uint64_t v24 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 16);
  uint64_t v25 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 24);
  uint64_t v26 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 32);
  uint64_t v27 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 40);
  id v28 = *(void **)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 48);
  uint64_t v29 = *(void *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 56);
  unsigned int v54 = v19;
  unsigned __int8 v30 = *(unsigned char *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64);
  sub_1E4C97D7C(v22, v23, v24, v25, v26, v27, v28, v29, v30);

  uint64_t v31 = v22;
  uint64_t v32 = v56;
  sub_1E4C97FBC(v31, v23, v24, v25, v26, v27, v28, v29, v30);
  if (v54 == ((0x30200u >> (8 * v30)) & 3))
  {
    swift_beginAccess();
    uint64_t v33 = MEMORY[0x1E4E8B570](v32);
    if (v33)
    {
      id v34 = (char *)v33;
      id v35 = v53;
      if ((objc_msgSend(v53, sel_isEnabled) & 1) == 0)
      {
        objc_msgSend(v35, sel_setEnabled_, 1);
        id v36 = *(void **)&v34[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
        if (v36) {
          objc_msgSend(v36, sel_setHeadGestureUpdateFlags_, 7);
        }
        id v37 = sub_1E4CBEE90();
        os_log_type_t v38 = sub_1E4CBF3B0();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v39 = 0;
          _os_log_impl(&dword_1E4BFE000, v37, v38, "HG Callback: button enabled == true, setting mute: [.headGesture, .audioFeedback, .muteAudioFeedback].", v39, 2u);
          MEMORY[0x1E4E8B4E0](v39, -1, -1);
        }

        if (v34[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64] == 2)
        {
          id v40 = objc_msgSend(v34, sel_navigationItem);
          objc_msgSend(v40, sel_setLeftBarButtonItem_, 0);
        }
        id v41 = sub_1E4C96F18();
        objc_msgSend(v41, sel_setAlpha_, 0.0);

        id v42 = objc_msgSend(v34, sel_contentView);
        id v43 = sub_1E4C96F18();
        objc_msgSend(v42, sel_addSubview_, v43);

        id v44 = sub_1E4C96F18();
        id v45 = objc_msgSend(v34, sel_contentView);
        objc_msgSend(v44, sel_pinToOther_, v45);

        uint64_t v46 = self;
        uint64_t v47 = swift_allocObject();
        *(void *)(v47 + 16) = v34;
        aBlock[4] = (uint64_t)sub_1E4C9925C;
        aBlock[5] = v47;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1E4C965F8;
        aBlock[3] = (uint64_t)&block_descriptor_30;
        long long v48 = _Block_copy(aBlock);
        id v34 = v34;
        swift_release();
        objc_msgSend(v46, sel_animateWithDuration_animations_, v48, 0.5);
        _Block_release(v48);
      }
    }
  }
  else
  {
LABEL_18:
    long long v49 = sub_1E4CBEE90();
    os_log_type_t v50 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      aBlock[0] = v52;
      *(_DWORD *)uint64_t v51 = 136315138;
      void aBlock[6] = sub_1E4C8304C(0x4C64694477656976, 0xED0000292864616FLL, aBlock);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v49, v50, "%s Headgesture detected not match:", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v52, -1, -1);
      MEMORY[0x1E4E8B4E0](v51, -1, -1);
    }
  }
}

void sub_1E4C96D44(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1E4C96DF4()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset];
  }
  else
  {
    id v4 = v0;
    unsigned int v5 = v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64];
    type metadata accessor for BobbleVideoLoopPlayer();
    id v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_userInterfaceStyle);

    if (v5 < 2) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    char v8 = (void *)sub_1E4CA6514(v7, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v8, sel_load);
    objc_msgSend(v8, sel_setDesiredBounds_, 0.0, 0.0, 130.0, 130.0);
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v9 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_1E4C96F18()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v6 = (void *)sub_1E4CBF1C0();
    id v7 = objc_msgSend(self, sel_systemImageNamed_, v6);

    if (v7)
    {
      id v8 = objc_msgSend(self, sel_systemGreenColor);
      id v9 = objc_msgSend(v7, sel_imageWithTintColor_renderingMode_, v8, 1);
    }
    else
    {
      id v9 = 0;
    }
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v9);

    objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_addSubview_, v10);
    int v11 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1E4CC4DD0;
    id v13 = objc_msgSend(v10, sel_centerXAnchor);
    id v14 = objc_msgSend(v5, sel_centerXAnchor);
    id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

    *(void *)(v12 + 32) = v15;
    id v16 = objc_msgSend(v10, sel_centerYAnchor);
    id v17 = objc_msgSend(v5, sel_centerYAnchor);
    id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

    *(void *)(v12 + 40) = v18;
    id v19 = objc_msgSend(v10, sel_widthAnchor);
    id v20 = objc_msgSend(v19, sel_constraintEqualToConstant_, 75.0);

    *(void *)(v12 + 48) = v20;
    id v21 = objc_msgSend(v10, sel_heightAnchor);
    id v22 = objc_msgSend(v21, sel_constraintEqualToConstant_, 75.0);

    *(void *)(v12 + 56) = v22;
    sub_1E4CBF2C0();
    sub_1E4C99160();
    uint64_t v23 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_activateConstraints_, v23);

    uint64_t v24 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v25 = v2;
  return v3;
}

void sub_1E4C97284()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4E7A8]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
  *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager) = v1;

  uint64_t v4 = *(void **)(v0 + v2);
  if (v4)
  {
    objc_msgSend(v4, sel_setHeadGestureUpdateFlags_, 7);
    id v5 = *(void **)(v0 + v2);
    if (v5)
    {
      id v20 = sub_1E4C9750C;
      uint64_t v21 = 0;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 1107296256;
      id v18 = sub_1E4C965F8;
      id v19 = &block_descriptor_42;
      id v6 = _Block_copy(&v16);
      id v7 = v5;
      objc_msgSend(v7, sel_setInterruptionHandler_, v6);
      _Block_release(v6);

      id v8 = *(void **)(v0 + v2);
      if (v8)
      {
        uint64_t v9 = swift_allocObject();
        swift_unknownObjectWeakInit();
        id v20 = sub_1E4C993EC;
        uint64_t v21 = v9;
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 1107296256;
        id v18 = sub_1E4C965F8;
        id v19 = &block_descriptor_46;
        id v10 = _Block_copy(&v16);
        id v11 = v8;
        swift_release();
        objc_msgSend(v11, sel_setInvalidationHandler_, v10);
        _Block_release(v10);

        uint64_t v12 = *(void **)(v0 + v2);
        if (v12)
        {
          uint64_t v13 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v20 = sub_1E4C995EC;
          uint64_t v21 = v13;
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 1107296256;
          id v18 = sub_1E4C976B0;
          id v19 = &block_descriptor_50;
          id v14 = _Block_copy(&v16);
          id v15 = v12;
          swift_release();
          objc_msgSend(v15, sel_activateWithCompletion_, v14);
          _Block_release(v14);
        }
      }
    }
  }
}

void sub_1E4C9750C()
{
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90130);
  oslog = sub_1E4CBEE90();
  os_log_type_t v1 = sub_1E4CBF3A0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_1E4C8304C(0xD000000000000016, 0x80000001E4CCDD30, &v5);
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, oslog, v1, "%s aaDeviceManager interrupted!", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v3, -1, -1);
    MEMORY[0x1E4E8B4E0](v2, -1, -1);
  }
  else
  {
  }
}

void sub_1E4C976B0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_1E4C9771C()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
  if (v2)
  {
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E4C965F8;
    aBlock[3] = &block_descriptor_9;
    uint64_t v3 = _Block_copy(aBlock);
    id v4 = v2;
    objc_msgSend(v4, sel_setInvalidationHandler_, v3);
    _Block_release(v3);

    uint64_t v5 = *(void **)&v0[v1];
    if (v5) {
      objc_msgSend(v5, sel_invalidate);
    }
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for BobbleTutorialController();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_1E4C978E0()
{
}

void sub_1E4C97940()
{
}

uint64_t sub_1E4C979A4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4C979D4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

void *sub_1E4C97A0C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

void sub_1E4C97A34(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
}

uint64_t (*sub_1E4C97A60())()
{
  return nullsub_1;
}

uint64_t sub_1E4C97A80()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4C97A88(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*sub_1E4C97AB4())()
{
  return nullsub_1;
}

void sub_1E4C97AD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_1E4C97E08((uint64_t)v11);
    objc_allocWithZone((Class)type metadata accessor for BobbleTutorialController());
    id v4 = v3;
    uint64_t v5 = sub_1E4C95CAC((uint64_t)v11, 0, v4);
    oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB19E8]), sel_initWithRootViewController_, v5);

    objc_msgSend(v1, sel_presentViewController_animated_completion_, oslog, 1, 0);
  }
  else
  {
    if (qword_1EAE8EB08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EAE90130);
    oslog = sub_1E4CBEE90();
    os_log_type_t v7 = sub_1E4CBF3A0();
    if (os_log_type_enabled(oslog, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v11[0] = v9;
      *(_DWORD *)id v8 = 136315138;
      sub_1E4C8304C(0xD000000000000018, 0x80000001E4CCDB80, v11);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, oslog, v7, "%s Unable to present tutorial with out depedencies", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v9, -1, -1);
      MEMORY[0x1E4E8B4E0](v8, -1, -1);

      return;
    }
  }
}

void sub_1E4C97D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 2u) {
    sub_1E4C97D90(a1, a2, a3, a4, a5, a6, a7);
  }
}

void sub_1E4C97D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = a7;
  }
}

void sub_1E4C97E08(uint64_t a1@<X8>)
{
  type metadata accessor for BobbleTutorialController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_1E4CBE8B0();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v9 = sub_1E4CBE8B0();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v13 = sub_1E4CBE8B0();
  uint64_t v15 = v14;

  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v15;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 0;
}

uint64_t sub_1E4C97FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 2u) {
    return sub_1E4C97FD0(a1, a2, a3, a4, a5, a6, a7);
  }
  return a1;
}

uint64_t sub_1E4C97FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1E4C9803C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4C98074()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E8B570](v0 + 16);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x1E4E8B570](v0 + 16);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      sub_1E4C92A04(v4 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType, (uint64_t)v43);
      sub_1E4C99380((uint64_t)v43, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97D7C);

      uint64_t v6 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice;
      sub_1E4CBEAD0();
      sub_1E4C953F4((uint64_t)v40);
      swift_release();
      sub_1E4C99380((uint64_t)v43, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C97FBC);
      sub_1E4C99304((uint64_t)v40, (uint64_t)v41, &qword_1EAE8DB90);
      if (v41[64] != 255)
      {
        sub_1E4C92A04((uint64_t)v41, (uint64_t)aBlock);
        uint64_t v7 = (void *)sub_1E4CBEAF0();
        unsigned int v8 = objc_msgSend(v7, sel_primaryPlacement);

        if (v8 == 1
          || (uint64_t v9 = (void *)sub_1E4CBEAF0(),
              unsigned int v10 = objc_msgSend(v9, sel_secondaryPlacement),
              v9,
              v10 == 1))
        {
          uint64_t v11 = *(void **)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
          id v12 = *(void **)&v3[v6];
          objc_allocWithZone((Class)type metadata accessor for BobbleTutorialController());
          id v13 = v12;
          sub_1E4C99380((uint64_t)v40, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C993D4);
          id v14 = v11;
          uint64_t v15 = sub_1E4C95CAC((uint64_t)aBlock, (uint64_t)v11, v13);
          uint64_t v16 = (char *)objc_msgSend(v3, sel_navigationController);
          if (v16)
          {
            uint64_t v17 = v16;
            objc_msgSend(v16, sel_pushViewController_animated_, v15, 1);
            sub_1E4C99380((uint64_t)v40, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C99368);

            uint64_t v3 = v17;
          }
          else
          {
            sub_1E4C99380((uint64_t)v40, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C99368);
          }
        }
        else
        {
          type metadata accessor for BobbleTutorialController();
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          unsigned __int8 v30 = self;
          id v31 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1E4CBE8B0();

          id v32 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
          sub_1E4CBE8B0();

          uint64_t v33 = (void *)sub_1E4CBF1C0();
          swift_bridgeObjectRelease();
          id v34 = (void *)sub_1E4CBF1C0();
          swift_bridgeObjectRelease();
          id v35 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v33, v34, 1, 0xE000000000000000);

          id v36 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1E4CBE8B0();

          id v37 = (void *)sub_1E4CBF1C0();
          swift_bridgeObjectRelease();
          v44[4] = nullsub_1;
          v44[5] = 0;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 1107296256;
          v44[2] = sub_1E4C95F6C;
          v44[3] = &block_descriptor_39;
          os_log_type_t v38 = _Block_copy(v44);
          swift_release();
          id v39 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v37, 0, v38, 0xE000000000000000);
          _Block_release(v38);

          objc_msgSend(v35, sel_addAction_, v39);
          objc_msgSend(v3, sel_presentViewController_animated_completion_, v35, 1, 0);

          sub_1E4C99380((uint64_t)v40, (void (*)(void, void, void, void, void, void, void, void, char))sub_1E4C99368);
        }
        goto LABEL_18;
      }
    }
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x1E4E8B570](v1);
  if (v18)
  {
    id v19 = (void *)v18;
    id v20 = *(void **)(v18 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    id v21 = v20;

    if (v20)
    {
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1E4C965F8;
      aBlock[3] = &block_descriptor_36;
      id v22 = _Block_copy(aBlock);
      objc_msgSend(v21, sel_setInvalidationHandler_, v22);
      _Block_release(v22);
    }
  }
  swift_beginAccess();
  uint64_t v23 = MEMORY[0x1E4E8B570](v1);
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = *(id *)(v23 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v25, sel_invalidate);
  }
  swift_beginAccess();
  uint64_t v26 = (char *)MEMORY[0x1E4E8B570](v1);
  if (v26)
  {
    uint64_t v27 = *(void **)&v26[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(void *)&v26[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;
  }
  swift_beginAccess();
  id v28 = (char *)MEMORY[0x1E4E8B570](v1);
  if (v28)
  {
    uint64_t v3 = v28;
    objc_msgSend(v28, sel_dismissViewControllerAnimated_completion_, 1, 0);
LABEL_18:
  }
}

void sub_1E4C9873C()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E8B570](v0 + 16);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    id v5 = v4;

    if (v4)
    {
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1E4C965F8;
      aBlock[3] = &block_descriptor_33;
      uint64_t v6 = _Block_copy(aBlock);
      objc_msgSend(v5, sel_setInvalidationHandler_, v6);
      _Block_release(v6);
    }
  }
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x1E4E8B570](v1);
  if (v7)
  {
    unsigned int v8 = (void *)v7;
    id v9 = *(id *)(v7 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v9, sel_invalidate);
  }
  swift_beginAccess();
  unsigned int v10 = (char *)MEMORY[0x1E4E8B570](v1);
  if (v10)
  {
    uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(void *)&v10[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;
  }
  swift_beginAccess();
  id v12 = (void *)MEMORY[0x1E4E8B570](v1);
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

uint64_t sub_1E4C988F4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4C98934(void *a1)
{
  sub_1E4C9663C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_1E4C98954()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EAE90130);
  uint64_t v4 = sub_1E4CBEE90();
  os_log_type_t v5 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, v5, "Invalidate device manager and dismissing.", v6, 2u);
    MEMORY[0x1E4E8B4E0](v6, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = MEMORY[0x1E4E8B570](v2);
  if (v7)
  {
    unsigned int v8 = (void *)v7;
    id v9 = *(void **)(v7 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    id v10 = v9;

    if (v9)
    {
      objc_msgSend(v10, sel_setInvalidationHandler_, 0);
    }
  }
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x1E4E8B570](v2);
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = *(id *)(v11 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v13, sel_invalidate);
  }
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x1E4E8B570](v2);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    aBlock[4] = sub_1E4C991A0;
    aBlock[5] = v1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E4C965F8;
    aBlock[3] = &block_descriptor_24;
    uint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_dismissViewControllerAnimated_completion_, 1, v16);
    _Block_release(v16);
  }
}

unint64_t sub_1E4C98BA8()
{
  unint64_t result = qword_1EAE8DB88;
  if (!qword_1EAE8DB88)
  {
    sub_1E4CBF430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DB88);
  }
  return result;
}

uint64_t destroy for BobbleTutorialPanesType(uint64_t a1)
{
  return sub_1E4C97FBC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

uint64_t initializeWithCopy for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  id v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_1E4C97D7C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  id v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_1E4C97D7C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  unsigned __int8 v20 = *(unsigned char *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_1E4C97FBC(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t assignWithTake for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_1E4C97FBC(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for BobbleTutorialPanesType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BobbleTutorialPanesType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BobbleTutorialPanesType()
{
  return &type metadata for BobbleTutorialPanesType;
}

uint64_t destroy for TutorialProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TutorialProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v7 = (void *)a2[6];
  uint64_t v6 = a2[7];
  a1[6] = v7;
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TutorialProvider(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = (void *)a2[6];
  a1[6] = v5;
  id v6 = v5;

  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TutorialProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TutorialProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TutorialProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TutorialProvider()
{
  return &type metadata for TutorialProvider;
}

unint64_t sub_1E4C99160()
{
  unint64_t result = qword_1EAE8D7A8;
  if (!qword_1EAE8D7A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE8D7A8);
  }
  return result;
}

void sub_1E4C991A0()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x1E4E8B570](v0 + 16);
  if (v1)
  {
    unint64_t v2 = (void *)v1;
    long long v3 = (void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_listeners);
    swift_beginAccess();
    void *v3 = MEMORY[0x1E4FBC870];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1E4C99224()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4C9925C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = sub_1E4C96F18();
  objc_msgSend(v2, sel_setAlpha_, 1.0);

  id v3 = sub_1E4C96DF4();
  objc_msgSend(v3, sel_setAlpha_, 0.0);

  id v4 = objc_msgSend(v1, sel_view);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_setNeedsLayout);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E4C99304(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E4C99368(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255) {
    return sub_1E4C97FBC(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t sub_1E4C99380(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 64);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v4);
  return a1;
}

void sub_1E4C993D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255) {
    sub_1E4C97D7C(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

void sub_1E4C993EC()
{
  uint64_t v1 = v0 + 16;
  if (qword_1EAE8EB08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90130);
  id v3 = sub_1E4CBEE90();
  os_log_type_t v4 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_1E4C8304C(0xD000000000000016, 0x80000001E4CCDD30, v13);
    sub_1E4CBF520();
    _os_log_impl(&dword_1E4BFE000, v3, v4, "%s aaDeviceManager invalidated! reconstructing!", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v6, -1, -1);
    MEMORY[0x1E4E8B4E0](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = MEMORY[0x1E4E8B570](v1);
  if (v7)
  {
    id v8 = (char *)v7;
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4E7A8]), sel_init);
    uint64_t v10 = *(void **)&v8[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(void *)&v8[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = v9;
  }
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x1E4E8B570](v1);
  if (v11)
  {
    unsigned __int8 v12 = (void *)v11;
    sub_1E4C97284(v11);
  }
}

void sub_1E4C995EC(void *a1)
{
  if (a1)
  {
    uint64_t v3 = v1 + 16;
    if (qword_1EAE8EB08 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EAE90130);
    id v5 = a1;
    id v6 = a1;
    uint64_t v7 = sub_1E4CBEE90();
    os_log_type_t v8 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v16[0] = v11;
      *(_DWORD *)uint64_t v9 = 136315394;
      sub_1E4C8304C(0xD000000000000016, 0x80000001E4CCDD30, v16);
      sub_1E4CBF520();
      *(_WORD *)(v9 + 12) = 2112;
      id v12 = a1;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_1E4CBF520();
      *uint64_t v10 = v15;

      _os_log_impl(&dword_1E4BFE000, v7, v8, "%s unable to activate bobble gesture detection %@", (uint8_t *)v9, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v10, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v11, -1, -1);
      MEMORY[0x1E4E8B4E0](v9, -1, -1);
    }
    else
    {
    }
    swift_beginAccess();
    long long v13 = (char *)MEMORY[0x1E4E8B570](v3);
    if (v13)
    {
      long long v14 = *(void **)&v13[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
      *(void *)&v13[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;
    }
  }
}

void *sub_1E4C998AC()
{
  return &unk_1E6EA92D0;
}

unint64_t sub_1E4C998B8()
{
  return 0xD00000000000002DLL;
}

void *sub_1E4C99914()
{
  return &unk_1E6EA92E0;
}

unint64_t sub_1E4C99920()
{
  return 0xD000000000000030;
}

id sub_1E4C9997C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  id v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  if (v8)
  {

    id v9 = v8;
    objc_msgSend(v9, sel_setAccessoryType_, 0);
  }
  return v8;
}

uint64_t type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell()
{
  return self;
}

id sub_1E4C99AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  id v6 = objc_msgSendSuper2(&v9, sel_initWithStyle_reuseIdentifier_, a1, v5);

  id v7 = v6;
  objc_msgSend(v7, sel_setAccessoryType_, 0);
  objc_msgSend(v7, sel_setHoverStyle_, 0);

  return v7;
}

void sub_1E4C99C40()
{
}

void sub_1E4C99CF8(void *a1)
{
  uint64_t v3 = sub_1E4CBEF20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E4CBEF80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_40;
  }
  id v11 = objc_msgSend(a1, sel_name);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = sub_1E4CBF1F0();
    uint64_t v53 = v14;
    uint64_t v54 = v13;
  }
  else
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
  }
  id v15 = objc_msgSend(a1, sel_propertyForKey_, *MEMORY[0x1E4F93230]);
  uint64_t v45 = v4;
  if (v15)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  sub_1E4C81220((uint64_t)&v60, (uint64_t)v57);
  uint64_t v48 = v8;
  uint64_t v49 = v7;
  if (v58)
  {
    if (swift_dynamicCast())
    {
      uint64_t v51 = v55;
      unint64_t v16 = v56;
      goto LABEL_13;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v57);
  }
  uint64_t v51 = 0;
  unint64_t v16 = 0xE000000000000000;
LABEL_13:
  unint64_t v52 = v16;
  uint64_t v17 = (void *)sub_1E4CBF1C0();
  id v18 = objc_msgSend(a1, sel_propertyForKey_, v17);

  if (v18)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  sub_1E4C81220((uint64_t)&v60, (uint64_t)v57);
  os_log_type_t v50 = v1;
  uint64_t v46 = v3;
  if (v58)
  {
    if (swift_dynamicCast())
    {
      uint64_t v44 = (uint64_t)v55;
      unint64_t v47 = v56;
      goto LABEL_21;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v57);
  }
  uint64_t v44 = (*(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x50))(0x42414C5F4C4C4543, 0xEE0046464F5F4C45);
  unint64_t v47 = v19;
LABEL_21:
  unsigned __int8 v20 = (void *)sub_1E4CBF1C0();
  id v21 = objc_msgSend(a1, sel_propertyForKey_, v20, v44);

  if (v21)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  sub_1E4C81220((uint64_t)&v60, (uint64_t)v57);
  if (v58)
  {
    sub_1E4C88844();
    if (swift_dynamicCast())
    {
      id v22 = v55;
      goto LABEL_29;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v57);
  }
  sub_1E4C88844();
  id v22 = (void *)sub_1E4CBF460();
LABEL_29:
  sub_1E4CBEED0();
  sub_1E4CBEF70();
  uint64_t v23 = self;
  uint64_t v24 = *MEMORY[0x1E4FB28C8];
  double v25 = *MEMORY[0x1E4FB09D8];
  if (!objc_msgSend(v23, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB09D8]))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    return;
  }
  uint64_t v26 = (void (*)(uint64_t *, void))sub_1E4CBEF30();
  sub_1E4CBEEF0();
  v26(v57, 0);
  unsigned int v27 = objc_msgSend(v22, sel_BOOLValue);
  uint64_t v54 = v24;
  if (v27)
  {
    id v28 = objc_msgSend(self, sel_tertiaryLabelColor);
  }
  else
  {
    sub_1E4CBEF40();
    sub_1E4CBEF00();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v46);
  }
  uint64_t v29 = (void (*)(uint64_t *, void))sub_1E4CBEF30();
  sub_1E4CBEF10();
  v29(v57, 0);
  sub_1E4CBEEE0();
  if (!objc_msgSend(v23, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E4FB28F0], v25)) {
    goto LABEL_41;
  }
  unsigned __int8 v30 = (void (*)(uint64_t *, void))sub_1E4CBEF50();
  sub_1E4CBEEF0();
  v30(v57, 0);
  unsigned int v31 = objc_msgSend(v22, sel_BOOLValue);
  id v32 = self;
  uint64_t v33 = &selRef_tertiaryLabelColor;
  if (!v31) {
    uint64_t v33 = &selRef_secondaryLabelColor;
  }
  id v34 = [v32 *v33];
  id v35 = (void (*)(uint64_t *, void))sub_1E4CBEF50();
  sub_1E4CBEF10();
  v35(v57, 0);
  sub_1E4CBEF60();
  uint64_t v36 = v49;
  uint64_t v58 = v49;
  uint64_t v59 = MEMORY[0x1E4FB0F88];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v57);
  uint64_t v38 = v48;
  (*(void (**)(uint64_t *, char *, uint64_t))(v48 + 16))(boxed_opaque_existential_1, v10, v36);
  id v39 = v50;
  MEMORY[0x1E4E8A590](v57);
  sub_1E4C88844();
  id v40 = (void *)sub_1E4CBF460();
  char v41 = sub_1E4CBF470();

  if (v41)
  {
    id v42 = objc_msgSend(v23, sel__preferredFontForTextStyle_weight_, v54, *MEMORY[0x1E4FB09D0]);
    objc_msgSend(v39, sel__setBadgeFont_, v42);

    id v43 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v39, sel__setBadgeText_, v43);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v36);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v36);
    swift_bridgeObjectRelease();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1E4C9A57C()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1E4CBE8B0();

  return v2;
}

id sub_1E4C9A638()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4C9A670()
{
  return sub_1E4C9A6A4();
}

uint64_t sub_1E4C9A684()
{
  return sub_1E4C9A6A4();
}

uint64_t sub_1E4C9A6A4()
{
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1E4CBE8B0();

  return v2;
}

uint64_t BTSDeviceConfigController.turnOffListeningModeSpecifiers.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  id v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v49 - v7;
  if (!objc_msgSend(v1, sel_device)) {
    goto LABEL_8;
  }
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9 || (id v10 = objc_msgSend(v9, sel_headphoneDevice)) == 0)
  {
    swift_unknownObjectRelease();
LABEL_8:
    uint64_t v38 = sub_1E4CA3F3C();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v38, v2);
    id v39 = sub_1E4CBEE90();
    os_log_type_t v40 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v39, v40))
    {
      char v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v41 = 0;
      _os_log_impl(&dword_1E4BFE000, v39, v40, "No device!", v41, 2u);
      MEMORY[0x1E4E8B4E0](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return MEMORY[0x1E4FBC860];
  }
  id v11 = v10;
  id v12 = (void *)sub_1E4CBEB00();
  unsigned int v13 = objc_msgSend(v12, sel_listeningModeOffAllowed);

  if (!v13 || (uint64_t v14 = (void *)sub_1E4CBEB00(), v15 = sub_1E4CBECF0(), v14, v15 != 1))
  {
    uint64_t v43 = sub_1E4CA3F3C();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v43, v2);
    uint64_t v44 = sub_1E4CBEE90();
    os_log_type_t v45 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_1E4BFE000, v44, v45, "Requirements not meet !", v46, 2u);
      MEMORY[0x1E4E8B4E0](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
  uint64_t v16 = sub_1E4C87A94();
  uint64_t v18 = v17;
  uint64_t v19 = sub_1E4C87A94();
  uint64_t v21 = sub_1E4C87AA0(v16, v18, v19, v20);
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  uint64_t v23 = (*(uint64_t (**)(void))(*(void *)v22 + 144))(sub_1E4C9BE48);
  swift_release();
  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v25 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v26 = sub_1E4CBE8B0();
  uint64_t v28 = v27;

  memset(v49, 0, sizeof(v49));
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v11;
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v11;
  *(void *)(v31 + 24) = v30;
  id v32 = v11;
  swift_retain();
  char v33 = sub_1E4C877B0();
  *((void *)&v48 + 1) = sub_1E4C9C0C8;
  *((void *)&v47 + 1) = sub_1E4C9BFE4;
  *(void *)&long long v48 = v29;
  *(void *)&long long v47 = 0;
  sub_1E4C879DC(0, 0, v26, v28, (uint64_t)v49, 0, 0, 6, (uint64_t)v50, 0, v33 & 1, v47, v48, (__n128)(unint64_t)v31, 0);
  swift_release();
  uint64_t v34 = (*(uint64_t (**)(unsigned char *))(*(void *)v23 + 152))(v50);
  swift_release();
  sub_1E4C8411C((uint64_t)v50);
  uint64_t v35 = (*(uint64_t (**)(void (*)(void *), void))(*(void *)v34 + 168))(sub_1E4C9B8DC, 0);
  uint64_t v36 = swift_release();
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 176))(v36);
  swift_unknownObjectRelease();

  swift_release();
  return v37;
}

void sub_1E4C9AE04(void *a1, void *a2, uint8_t *a3)
{
  id v6 = (void *)sub_1E4CBEEB0();
  uint64_t v7 = *(v6 - 1);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v12 = (char *)&v75 - v11;
  unsigned int v13 = (void *)sub_1E4CBEB00();
  int v14 = sub_1E4CBED20();

  if (v14 == 1)
  {
    int v15 = (void *)sub_1E4CBEAF0();
    unsigned int v16 = objc_msgSend(v15, sel_productID);

    if ((v16 == 8212
       || (uint64_t v17 = (void *)sub_1E4CBEAF0(),
           unsigned int v18 = objc_msgSend(v17, sel_productID),
           v17,
           v18 == 8228))
      && objc_msgSend(a1, sel_BOOLValue))
    {
      uint64_t v19 = (void *)sub_1E4CBEB00();
      int v20 = sub_1E4CBED30();

      uint64_t v21 = 1599230796;
      if (v20 == 2) {
        uint64_t v21 = 0;
      }
      uint64_t v80 = v21;
      if (v20 == 2) {
        unint64_t v22 = 0xE000000000000000;
      }
      else {
        unint64_t v22 = 0xE400000000000000;
      }
      uint64_t v23 = sub_1E4CA3F3C();
      (*(void (**)(char *, uint64_t, void *))(v7 + 16))(v12, v23, v6);
      swift_bridgeObjectRetain_n();
      id v24 = a2;
      uint64_t v25 = v7;
      uint64_t v26 = sub_1E4CBEE90();
      uint64_t v27 = v6;
      os_log_type_t v28 = sub_1E4CBF390();
      BOOL v29 = os_log_type_enabled(v26, v28);
      id v78 = a3 + 16;
      id v79 = a3;
      id v77 = v24;
      if (v29)
      {
        uint64_t v30 = swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        uint64_t v76 = v31;
        *(_DWORD *)uint64_t v30 = 136315394;
        id v81 = v27;
        uint64_t aBlock = v31;
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_1E4C8304C(v80, v22, &aBlock);
        sub_1E4CBF520();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v30 + 12) = 256;
        uint64_t v75 = v30 + 14;
        id v32 = (void *)sub_1E4CBEB00();
        char v33 = sub_1E4CBED30();

        LOBYTE(v88) = v33;
        sub_1E4CBF520();

        _os_log_impl(&dword_1E4BFE000, v26, v28, "OffModeAlert: Prefix is %s %hhu!", (uint8_t *)v30, 0xFu);
        uint64_t v34 = v76;
        swift_arrayDestroy();
        MEMORY[0x1E4E8B4E0](v34, -1, -1);
        MEMORY[0x1E4E8B4E0](v30, -1, -1);

        (*(void (**)(char *, id))(v25 + 8))(v12, v81);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, void *))(v25 + 8))(v12, v27);
      }
      uint64_t v50 = v80;
      uint64_t aBlock = 0;
      unint64_t v83 = 0xE000000000000000;
      sub_1E4CBF590();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t aBlock = v50;
      unint64_t v83 = v22;
      sub_1E4CBF250();
      sub_1E4C7EA5C(0, &qword_1EAE8DA68);
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      unint64_t v52 = self;
      id v53 = objc_msgSend(v52, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1E4CBE8B0();
      swift_bridgeObjectRelease();

      uint64_t aBlock = 0;
      unint64_t v83 = 0xE000000000000000;
      sub_1E4CBF590();
      swift_bridgeObjectRelease();
      uint64_t aBlock = v50;
      unint64_t v83 = v22;
      sub_1E4CBF250();
      id v54 = objc_msgSend(v52, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1E4CBE8B0();
      swift_bridgeObjectRelease();

      uint64_t v55 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      unint64_t v56 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      id v57 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v55, v56, 1);

      id v58 = objc_msgSend(v52, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1E4CBE8B0();

      uint64_t v59 = swift_allocObject();
      long long v60 = v77;
      *(void *)(v59 + 16) = v77;
      *(void *)(v59 + 24) = a1;
      id v61 = v60;
      id v62 = a1;
      uint64_t v63 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      id v86 = sub_1E4C9C110;
      uint64_t v87 = v59;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      unint64_t v83 = 1107296256;
      id v84 = sub_1E4C95F6C;
      id v85 = &block_descriptor_1;
      uint64_t v64 = _Block_copy(&aBlock);
      swift_release();
      id v65 = self;
      id v66 = objc_msgSend(v65, sel_actionWithTitle_style_handler_, v63, 0, v64);
      _Block_release(v64);

      objc_msgSend(v57, sel_addAction_, v66);
      id v67 = objc_msgSend(v52, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1E4CBE8B0();

      id v68 = v79;
      swift_retain();
      id v69 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      id v86 = sub_1E4C9C19C;
      uint64_t v87 = (uint64_t)v68;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      unint64_t v83 = 1107296256;
      id v84 = sub_1E4C95F6C;
      id v85 = &block_descriptor_12;
      long long v70 = _Block_copy(&aBlock);
      swift_release();
      id v71 = objc_msgSend(v65, sel_actionWithTitle_style_handler_, v69, 1, v70);
      _Block_release(v70);

      objc_msgSend(v57, sel_addAction_, v71);
      uint64_t v72 = v78;
      swift_beginAccess();
      long long v73 = (void *)MEMORY[0x1E4E8B570](v72);
      if (v73)
      {
        long long v74 = v73;
        objc_msgSend(v73, sel_presentViewController_animated_completion_, v57, 1, 0);
      }
    }
    else
    {
      id v81 = (id)sub_1E4CBEB00();
      if (objc_msgSend(a1, sel_BOOLValue)) {
        uint64_t v48 = 1;
      }
      else {
        uint64_t v48 = 2;
      }
      objc_msgSend(v81, sel_setListeningModeOffAllowed_, v48);
      id v49 = v81;
    }
  }
  else
  {
    uint64_t v35 = (void *)sub_1E4CBEB00();
    if (objc_msgSend(a1, sel_BOOLValue)) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = 2;
    }
    objc_msgSend(v35, sel_setListeningModeOffAllowed_, v36);

    uint64_t v37 = sub_1E4CA3F3C();
    (*(void (**)(char *, uint64_t, void *))(v7 + 16))(v10, v37, v6);
    id v38 = a2;
    id v39 = sub_1E4CBEE90();
    os_log_type_t v40 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v39, v40))
    {
      char v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      id v81 = v6;
      uint64_t aBlock = v80;
      *(_DWORD *)char v41 = 136315138;
      id v79 = v41 + 4;
      uint64_t v42 = v7;
      id v43 = objc_msgSend(v38, sel_description);
      uint64_t v44 = sub_1E4CBF1F0();
      unint64_t v46 = v45;

      uint64_t v88 = sub_1E4C8304C(v44, v46, &aBlock);
      sub_1E4CBF520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E4BFE000, v39, v40, "Hearing Protection Capability not supported! %s", v41, 0xCu);
      uint64_t v47 = v80;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v47, -1, -1);
      MEMORY[0x1E4E8B4E0](v41, -1, -1);

      (*(void (**)(char *, id))(v42 + 8))(v10, v81);
    }
    else
    {

      (*(void (**)(char *, void *))(v7 + 8))(v10, v6);
    }
  }
}

void sub_1E4C9B8DC(void *a1)
{
  uint64_t v2 = (void *)sub_1E4CBF300();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E4F93130]);

  id v3 = (id)sub_1E4CBF1C0();
  objc_msgSend(a1, sel_setIdentifier_, v3);
}

BOOL sub_1E4C9B9B0()
{
  id v1 = v0;
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  id v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v30 - v7;
  if (!objc_msgSend(v1, sel_device)) {
    goto LABEL_8;
  }
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9 || (id v10 = objc_msgSend(v9, sel_headphoneDevice)) == 0)
  {
    swift_unknownObjectRelease();
LABEL_8:
    uint64_t v19 = sub_1E4CA3F3C();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v19, v2);
    int v20 = sub_1E4CBEE90();
    os_log_type_t v21 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = v23;
      *(_DWORD *)unint64_t v22 = 136315138;
      uint64_t v31 = sub_1E4C8304C(0xD000000000000015, 0x80000001E4CCDF10, &v32);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v20, v21, "%s: No device return true!", v22, 0xCu);
      uint64_t v18 = 1;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v23, -1, -1);
      MEMORY[0x1E4E8B4E0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return v18;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 1;
  }
  uint64_t v11 = v10;
  id v12 = (void *)sub_1E4CBEB00();
  unsigned int v13 = objc_msgSend(v12, sel_listeningModeOffAllowed);

  if (!v13)
  {
    uint64_t v25 = sub_1E4CA3F3C();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v25, v2);
    uint64_t v26 = sub_1E4CBEE90();
    os_log_type_t v27 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v32 = v29;
      *(_DWORD *)os_log_type_t v28 = 136315138;
      v30[1] = v28 + 4;
      uint64_t v31 = sub_1E4C8304C(0xD000000000000015, 0x80000001E4CCDF10, &v32);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v26, v27, "%s: listeningModeOffAllowed is unknown, return true!", v28, 0xCu);
      uint64_t v18 = 1;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v29, -1, -1);
      MEMORY[0x1E4E8B4E0](v28, -1, -1);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v18;
    }

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return 1;
  }
  int v14 = (void *)sub_1E4CBEB00();
  int v15 = sub_1E4CBECF0();

  if (v15 == 1)
  {
    unsigned int v16 = (void *)sub_1E4CBEB00();
    unsigned int v17 = objc_msgSend(v16, sel_listeningModeOffAllowed);

    swift_unknownObjectRelease();
    return v17 == 1;
  }
  else
  {

    swift_unknownObjectRelease();
    return 0;
  }
}

void sub_1E4C9BE48(void *a1)
{
  uint64_t v2 = (void *)sub_1E4CBEB00();
  sub_1E4CBED30();

  sub_1E4C7EA5C(0, &qword_1EAE8DA68);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  swift_bridgeObjectRelease();
  id v5 = (id)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v5, *MEMORY[0x1E4F93170], 0xE000000000000000);
}

uint64_t sub_1E4C9BFAC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1E4C9BFE4()
{
  uint64_t v0 = (void *)sub_1E4CBEB00();
  unsigned int v1 = objc_msgSend(v0, sel_listeningModeOffAllowed);

  id v2 = objc_allocWithZone(NSNumber);

  return objc_msgSend(v2, sel_initWithInteger_, v1 == 1);
}

uint64_t sub_1E4C9C050()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4C9C088()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4C9C0C8(void *a1)
{
  sub_1E4C9AE04(a1, *(void **)(v1 + 16), *(uint8_t **)(v1 + 24));
}

uint64_t sub_1E4C9C0D0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4C9C110()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v3 = (id)sub_1E4CBEB00();
  if (objc_msgSend(v1, sel_BOOLValue)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  objc_msgSend(v3, sel_setListeningModeOffAllowed_, v2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_1E4C9C19C()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x1E4E8B570](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v2, sel_reloadSpecifierID_, v3);
  }
}

id sub_1E4C9C230()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  sub_1E4C951A8();
  uint64_t v1 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setText_, v1);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setUserInteractionEnabled_, 0);
  return v0;
}

id sub_1E4C9C308()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label);
}

id sub_1E4C9C37C(uint64_t a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  return objc_msgSendSuper2(&v4, sel_addSubview_, a1);
}

id sub_1E4C9C408(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  uint64_t v9 = v4;
  *(void *)&v4[v8] = sub_1E4C9C230();
  *(void *)&v9[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  if (a3)
  {
    id v10 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_1E4C9C554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  uint64_t v7 = v3;
  *(void *)&v3[v6] = sub_1E4C9C230();
  *(void *)&v7[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  if (a3)
  {
    uint64_t v8 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_, a1, v8);

  return v9;
}

id sub_1E4C9C6E0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  objc_super v4 = v1;
  *(void *)&v1[v3] = sub_1E4C9C230();
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id sub_1E4C9C7E8()
{
  return sub_1E4C9FDF8(type metadata accessor for HPSCenterContentCell);
}

uint64_t variable initialization expression of BobbleSettingsViewController.headphoneDevice()
{
  return 0;
}

void *sub_1E4C9C8A0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1E4C9C950(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  objc_super v4 = *v3;
  char *v3 = a1;
}

uint64_t variable initialization expression of BobbleSettingsViewController.viewModel()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.listeners()
{
  return MEMORY[0x1E4FBC870];
}

id BobbleSettingsViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id BobbleSettingsViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset] = 0;
  if (a2)
  {
    id v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGesturesTopTextSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGesturesSwitchSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGestureMappingSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_tryBobbleSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_movieLoopView()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_topAsset()
{
  return 0;
}

uint64_t sub_1E4C9CBE0()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection;
  if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection];
  }
  else
  {
    id v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
    uint64_t v4 = sub_1E4C87A94();
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E4C87A94();
    uint64_t v9 = sub_1E4C87AA0(v4, v6, v7, v8);
    v17[3] = type metadata accessor for BobbleSettingsViewController();
    v17[0] = v3;
    id v10 = v3;
    char v11 = sub_1E4C877B0();
    __n128 v12 = sub_1E4C879DC(0, 0, 0, 0, (uint64_t)v17, 0, 0, -1, (uint64_t)v18, 0, v11 & 1, 0, 0, (__n128)0, 0);
    uint64_t v13 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v9 + 160))(v18, v12);
    swift_release();
    sub_1E4C8411C((uint64_t)v18);
    uint64_t v14 = (*(uint64_t (**)(uint64_t (*)(void *), void))(*(void *)v13 + 168))(sub_1E4C9CDC8, 0);
    uint64_t v15 = swift_release();
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 176))(v15);
    swift_release();
    *(void *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4C9CDC8(void *a1)
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1E4C9CE3C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C9CE54(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_1E4C9CBE0();
  return sub_1E4C9CE9C;
}

uint64_t sub_1E4C9CE9C(void *a1, uint64_t a2)
{
  return sub_1E4C9D93C(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection);
}

uint64_t sub_1E4C9CEA8()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection;
  if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection];
  }
  else
  {
    id v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
    uint64_t v4 = sub_1E4C87A94();
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E4C87A94();
    uint64_t v9 = sub_1E4C87AA0(v4, v6, v7, v8);
    uint64_t v10 = sub_1E4C951A8();
    uint64_t v12 = v11;
    v19[3] = type metadata accessor for BobbleSettingsViewController();
    v19[0] = v3;
    uint64_t v13 = v3;
    char v14 = sub_1E4C877B0();
    __n128 v15 = sub_1E4C879DC(0, 0, v10, v12, (uint64_t)v19, (uint64_t)sel_headGesturesEnabled, (uint64_t)sel_setHeadGesturesEnabledWithEnabled_, 6, (uint64_t)v20, 0, v14 & 1, 0, 0, (__n128)0, 0);
    uint64_t v16 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v9 + 160))(v20, v15);
    swift_release();
    uint64_t v17 = sub_1E4C8411C((uint64_t)v20);
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 176))(v17);
    swift_release();
    *(void *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4C9D078(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C9D090(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_1E4C9CEA8();
  return sub_1E4C9D0D8;
}

uint64_t sub_1E4C9D0D8(void *a1, uint64_t a2)
{
  return sub_1E4C9D93C(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection);
}

uint64_t sub_1E4C9D0E4()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection);
  }
  else
  {
    swift_unknownObjectWeakInit();
    uint64_t v2 = sub_1E4C9D16C((uint64_t)v4);
    swift_unknownObjectWeakDestroy();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4C9D16C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4E8B570](a1);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
  id v3 = (void *)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
  uint64_t v4 = sub_1E4C87A94();
  uint64_t v6 = v5;
  uint64_t v7 = sub_1E4C87A94();
  uint64_t v9 = sub_1E4C87AA0(v4, v6, v7, v8);
  uint64_t v10 = sub_1E4C951A8();
  uint64_t v12 = v11;
  uint64_t v13 = type metadata accessor for BobbleSettingsViewController();
  uint64_t v36 = v13;
  v35[0] = v3;
  uint64_t v14 = type metadata accessor for BobbleMappingSelectionController();
  id v15 = v3;
  char v16 = sub_1E4C877B0();
  memset(&v33[8], 0, 32);
  *(void *)char v33 = v14;
  __n128 v17 = sub_1E4C879DC(0, 0, v10, v12, (uint64_t)v35, (uint64_t)sel_acceptReplyPlayPauseStringMapping, 0, 2, (uint64_t)v37, 0, v16 & 1, *(long long *)v33, *(long long *)&v33[16], (__n128)*(unint64_t *)&v33[32], 0);
  uint64_t v18 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v9 + 160))(v37, v17);
  swift_release();
  uint64_t v19 = sub_1E4C8411C((uint64_t)v37);
  MEMORY[0x1F4188790](v19);
  *((void *)&v34 + 1) = v15;
  uint64_t v20 = (*(uint64_t (**)(void))(*(void *)v18 + 168))(sub_1E4CA0C64);
  swift_release();
  uint64_t v21 = sub_1E4C951A8();
  uint64_t v23 = v22;
  uint64_t v36 = v13;
  v35[0] = v15;
  id v24 = v15;
  char v25 = sub_1E4C877B0();
  memset(&v33[8], 0, 32);
  *(void *)char v33 = v14;
  __n128 v26 = sub_1E4C879DC(0, 0, v21, v23, (uint64_t)v35, (uint64_t)sel_declineDismissSkipStringMapping, 0, 2, (uint64_t)v37, 0, v25 & 1, *(long long *)v33, *(long long *)&v33[16], (__n128)*(unint64_t *)&v33[32], 0);
  uint64_t v27 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v20 + 160))(v37, v26);
  swift_release();
  uint64_t v28 = sub_1E4C8411C((uint64_t)v37);
  MEMORY[0x1F4188790](v28);
  *((void *)&v34 + 1) = v24;
  uint64_t v29 = (*(uint64_t (**)(void))(*(void *)v27 + 168))(sub_1E4CA0C6C);
  uint64_t v30 = swift_release();
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 176))(v30);
  swift_release();

  return v31;
}

unint64_t sub_1E4C9D518(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC58);
  uint64_t v2 = sub_1E4CBF680();
  id v3 = (void *)v2;
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
    sub_1E4CA0D90(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1E4C838F4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1E4C7F6AC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_1E4C9D644(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C9D65C(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_1E4C9D0E4();
  return sub_1E4C9D6A4;
}

uint64_t sub_1E4C9D6A4(void *a1, uint64_t a2)
{
  return sub_1E4C9D93C(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection);
}

uint64_t sub_1E4C9D6B0()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection;
  if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection];
  }
  else
  {
    id v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
    uint64_t v4 = sub_1E4C87A94();
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E4C87A94();
    uint64_t v9 = sub_1E4C87AA0(v4, v6, v7, v8);
    uint64_t v10 = sub_1E4C951A8();
    uint64_t v12 = v11;
    v20[3] = type metadata accessor for BobbleSettingsViewController();
    v20[0] = v3;
    BOOL v13 = v3;
    char v14 = sub_1E4C877B0();
    __n128 v15 = sub_1E4C879DC(0, 0, v10, v12, (uint64_t)v20, 0, 0, 13, (uint64_t)v21, 0, v14 & 1, 0, 0, (__n128)0, 0);
    uint64_t v16 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v9 + 160))(v21, v15);
    swift_release();
    sub_1E4C8411C((uint64_t)v21);
    uint64_t v17 = (*(uint64_t (**)(id (*)(void *), void))(*(void *)v16 + 168))(sub_1E4C9D8BC, 0);
    uint64_t v18 = swift_release();
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 176))(v18);
    swift_release();
    *(void *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_1E4C9D8BC(void *a1)
{
  return objc_msgSend(a1, sel_setButtonAction_, sel_presentBobbleTutorials);
}

uint64_t sub_1E4C9D8D0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4C9D8E8(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_1E4C9D6B0();
  return sub_1E4C9D930;
}

uint64_t sub_1E4C9D930(void *a1, uint64_t a2)
{
  return sub_1E4C9D93C(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection);
}

uint64_t sub_1E4C9D93C(void *a1, uint64_t a2, void *a3)
{
  *(void *)(a1[1] + *a3) = *a1;
  return swift_bridgeObjectRelease();
}

Swift::OpaquePointer_optional __swiftcall BobbleSettingsViewController.specifiers()()
{
  uint64_t v1 = v0;
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DBF0);
  uint64_t v111 = *(void *)(v110 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v110);
  uint64_t v4 = (char *)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v96 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DBF8);
  uint64_t v115 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC00);
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x1F4188790](v114);
  uint64_t v112 = (char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E4CBEEB0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  __n128 v15 = (char *)&v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  unint64_t v116 = (unint64_t)&v96 - v16;
  id v17 = objc_msgSend(v1, sel_specifier);
  if (!v17) {
    __break(1u);
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_userInfo);

  if (v19)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v124 = 0u;
    long long v125 = 0u;
  }
  sub_1E4C81220((uint64_t)&v124, (uint64_t)&v126);
  if (!v127)
  {
    sub_1E4C898C8((uint64_t)&v126);
    goto LABEL_22;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8D828);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    sub_1E4C7EA5C(0, &qword_1EAE8D880);
    uint64_t v48 = (void *)sub_1E4CBF290();
    id v49 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v1, sel_setValue_forKey_, v48, v49);

    uint64_t v50 = sub_1E4C94F38();
    uint64_t v51 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v50, v11);
    unint64_t v52 = sub_1E4CBEE90();
    os_log_type_t v53 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v126 = v55;
      *(_DWORD *)uint64_t v54 = 136315394;
      *(void *)&long long v124 = sub_1E4C8304C(0x6569666963657073, 0xEC00000029287372, &v126);
      sub_1E4CBF520();
      *(_WORD *)(v54 + 12) = 2048;
      *(void *)&long long v124 = 154;
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v52, v53, "%s: %ld Depedencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v55, -1, -1);
      MEMORY[0x1E4E8B4E0](v54, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v51);
    uint64_t v57 = 0;
    goto LABEL_25;
  }
  id v20 = v119;
  id v21 = objc_msgSend(self, sel_deviceKey);
  if (!v21)
  {
    sub_1E4CBF1F0();
    uint64_t v107 = v7;
    v108 = v6;
    id v21 = (id)sub_1E4CBF1C0();
    uint64_t v6 = v108;
    uint64_t v7 = v107;
    swift_bridgeObjectRelease();
  }
  id v109 = v20;
  id v22 = objc_msgSend(v20, sel_objectForKey_, v21);

  if (v22)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v124 = 0u;
    long long v125 = 0u;
  }
  sub_1E4C81220((uint64_t)&v124, (uint64_t)&v126);
  id v23 = v109;
  if (!v127)
  {

    sub_1E4C898C8((uint64_t)&v126);
    goto LABEL_22;
  }
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D878);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  v105 = v9;
  id v24 = v119;
  id v25 = objc_msgSend(v119, sel_headphoneDevice);
  if (!v25)
  {

    goto LABEL_21;
  }
  __n128 v26 = v25;
  id v106 = v24;
  uint64_t v27 = (void **)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  uint64_t v28 = *v27;
  *uint64_t v27 = v26;
  id v29 = v26;

  sub_1E4CBEAD0();
  uint64_t v30 = sub_1E4C94C68();
  swift_release();
  *(void *)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel) = v30;
  swift_release();
  uint64_t v31 = sub_1E4C94F38();
  uint64_t v32 = v12;
  char v33 = *(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 16);
  unint64_t v34 = v116;
  uint64_t v35 = v11;
  v33(v116, v31, v11);
  id v36 = v29;
  uint64_t v37 = sub_1E4CBEE90();
  int v38 = sub_1E4CBF3B0();
  BOOL v39 = os_log_type_enabled(v37, (os_log_type_t)v38);
  uint64_t v103 = v4;
  v108 = v6;
  uint64_t v107 = v7;
  if (v39)
  {
    int v99 = v38;
    uint64_t v102 = v35;
    v97 = v37;
    uint64_t v40 = swift_slowAlloc();
    v100 = (void *)swift_slowAlloc();
    uint64_t v101 = swift_slowAlloc();
    *(void *)&long long v124 = v101;
    *(_DWORD *)uint64_t v40 = 136315394;
    uint64_t v98 = v40 + 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_1E4CC4A40;
    *(void *)(v41 + 56) = sub_1E4CBEC80();
    *(void *)(v41 + 64) = sub_1E4CA04A4();
    *(void *)(v41 + 32) = v36;
    id v104 = v36;
    id v42 = v36;
    uint64_t v43 = sub_1E4CBF200();
    id v119 = (id)sub_1E4C8304C(v43, v44, (uint64_t *)&v124);
    sub_1E4CBF520();
    swift_bridgeObjectRelease();

    *(_WORD *)(v40 + 12) = 2112;
    unint64_t v45 = (uint8_t *)v40;
    uint64_t v98 = v40 + 14;
    unint64_t v46 = v42;
    sub_1E4CBEAD0();
    uint64_t v47 = (void *)sub_1E4CBED80();
    swift_release();
    if (v47) {
      id v119 = v47;
    }
    else {
      id v119 = 0;
    }
    sub_1E4CBF520();
    long long v60 = v97;
    id v61 = v100;
    void *v100 = v47;

    id v62 = v45;
    _os_log_impl(&dword_1E4BFE000, v60, (os_log_type_t)v99, "Bobble: specifiers, HeadphoneDevice:%s aad: %@ ", v45, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v61, -1, -1);
    uint64_t v63 = v101;
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v63, -1, -1);
    MEMORY[0x1E4E8B4E0](v62, -1, -1);

    uint64_t v59 = (*(uint64_t (**)(unint64_t, uint64_t))(v32 + 8))(v116, v102);
    id v36 = v104;
  }
  else
  {

    uint64_t v59 = (*(uint64_t (**)(unint64_t, uint64_t))(v32 + 8))(v34, v35);
  }
  uint64_t v64 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v120 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xE0))(v59);
  uint64_t v121 = (*(uint64_t (**)(void))((*v64 & *v1) + 0xF8))();
  uint64_t v122 = (*(uint64_t (**)(void))((*v64 & *v1) + 0x110))();
  uint64_t v123 = (*(uint64_t (**)(void))((*v64 & *v1) + 0x128))();
  *(void *)&long long v124 = MEMORY[0x1E4FBC860];
  unint64_t v65 = swift_bridgeObjectRetain();
  sub_1E4C83A50(v65);
  unint64_t v66 = swift_bridgeObjectRetain();
  sub_1E4C83A50(v66);
  unint64_t v67 = swift_bridgeObjectRetain();
  sub_1E4C83A50(v67);
  unint64_t v68 = swift_bridgeObjectRetain();
  sub_1E4C83A50(v68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D898);
  swift_arrayDestroy();
  unint64_t v69 = v124;
  sub_1E4C9FC1C();
  sub_1E4C7EA5C(0, &qword_1EAE8D880);
  long long v70 = (void *)sub_1E4CBF290();
  id v71 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v1, sel_setValue_forKey_, v70, v71);

  uint64_t v72 = (char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners;
  uint64_t v73 = swift_beginAccess();
  if ((*(void *)v72 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_1E4CBF570();
    uint64_t v73 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v74 = *(void *)(*(void *)v72 + 16);
  }
  id v75 = v109;
  id v76 = v106;
  if (!v74)
  {
    id v78 = *(uint64_t (**)(uint64_t))((*v64 & *v1) + 0x98);
    id v58 = (void *)v78(v73);
    if (v58)
    {
      id v79 = v58;
      unint64_t v116 = v69;
      id v104 = v36;
      sub_1E4CBEAD0();

      uint64_t v80 = v105;
      sub_1E4CBEDC0();
      swift_release();
      uint64_t v81 = v107;
      id v82 = (void *)sub_1E4CBEAC0();
      uint64_t v83 = (*(uint64_t (**)(char *, uint64_t))(v115 + 8))(v80, v81);
      id v119 = v82;
      id v58 = (void *)v78(v83);
      if (v58)
      {
        id v84 = v58;
        sub_1E4CBEAD0();

        id v85 = v108;
        sub_1E4CBEE20();
        swift_release();
        uint64_t v86 = v110;
        uint64_t v87 = sub_1E4CBEAC0();
        uint64_t v88 = *(uint64_t (**)(char *, uint64_t))(v111 + 8);
        uint64_t v89 = v88(v85, v86);
        uint64_t v118 = v87;
        id v58 = (void *)v78(v89);
        if (v58)
        {
          id v90 = v58;
          sub_1E4CBEAD0();

          v91 = v103;
          sub_1E4CBEE00();
          swift_release();
          uint64_t v92 = sub_1E4CBEAC0();
          v88(v91, v86);
          uint64_t v117 = v92;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC08);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC10);
          sub_1E4C7D240(&qword_1EAE8DC18, &qword_1EAE8DC08);
          sub_1E4C7D240(&qword_1EAE8DC20, &qword_1EAE8DC10);
          v93 = v112;
          sub_1E4CBEFA0();
          sub_1E4C7D240(&qword_1EAE8DC28, &qword_1EAE8DC00);
          uint64_t v94 = v114;
          v95 = (void *)sub_1E4CBF070();
          (*(void (**)(char *, uint64_t))(v113 + 8))(v93, v94);
          id v119 = v95;
          swift_allocObject();
          swift_unknownObjectWeakInit();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC30);
          sub_1E4C7D240(&qword_1EAE8DC38, &qword_1EAE8DC30);
          sub_1E4CBF0E0();
          swift_release();
          swift_release();
          swift_beginAccess();
          sub_1E4CBEFC0();
          swift_endAccess();
          swift_release();
          uint64_t v57 = sub_1E4C82CCC(v116);
          swift_bridgeObjectRelease();

          goto LABEL_25;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  id v77 = v36;
  uint64_t v57 = sub_1E4C82CCC(v69);
  swift_bridgeObjectRelease();

LABEL_25:
  id v58 = (void *)v57;
LABEL_42:
  result.value._rawValue = v58;
  result.is_nil = v56;
  return result;
}

uint64_t sub_1E4C9E990(uint64_t a1)
{
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x1E4E8B570](a1 + 16);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_reloadSpecifiers);
  }
  uint64_t v8 = sub_1E4C94F38();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  uint64_t v9 = sub_1E4CBEE90();
  os_log_type_t v10 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1E4BFE000, v9, v10, "Bobble: reload for value change", v11, 2u);
    MEMORY[0x1E4E8B4E0](v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall BobbleSettingsViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1);
  sub_1E4C9FC1C();
  id v3 = sub_1E4C9F8E8();
  objc_msgSend(v3, sel_play);

  objc_msgSend(v1, sel_reloadSpecifiers);
}

void sub_1E4C9EC8C()
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = sub_1E4CBEEB0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  objc_super v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E4C94F38();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  uint64_t v7 = sub_1E4CBEE90();
  int v8 = sub_1E4CBF3B0();
  BOOL v9 = os_log_type_enabled(v7, (os_log_type_t)v8);
  os_log_type_t v10 = (void *)MEMORY[0x1E4FBC8C8];
  if (v9)
  {
    int v30 = v8;
    uint64_t v32 = v1;
    uint64_t v11 = swift_slowAlloc();
    char v33 = (void *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v35[0] = v31;
    *(_DWORD *)uint64_t v11 = 136315650;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1E4CC4A40;
    uint64_t v13 = *(uint64_t (**)(void))((*v10 & *v6) + 0x98);
    uint64_t v14 = v13();
    if (v14)
    {
      uint64_t v15 = v14;
      *(void *)(v12 + 56) = sub_1E4CBEC80();
      *(void *)(v12 + 64) = sub_1E4CA04A4();
      *(void *)(v12 + 32) = v15;
      uint64_t v16 = sub_1E4CBF200();
      uint64_t v34 = sub_1E4C8304C(v16, v17, v35);
      sub_1E4CBF520();

      uint64_t v18 = swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2112;
      uint64_t v19 = ((uint64_t (*)(uint64_t))v13)(v18);
      if (v19)
      {
        id v20 = (void *)v19;
        sub_1E4CBEAD0();

        uint64_t v21 = sub_1E4CBED80();
        swift_release();
        if (v21) {
          uint64_t v34 = v21;
        }
        else {
          uint64_t v34 = 0;
        }
        sub_1E4CBF520();
        id v23 = v33;
        *char v33 = v21;

        *(_WORD *)(v11 + 22) = 256;
        uint64_t v24 = v13();
        if (v24)
        {
          id v25 = (void *)v24;
          sub_1E4CBEAD0();

          LOBYTE(v25) = sub_1E4CBEDA0();
          swift_release();
          LOBYTE(v34) = (_BYTE)v25;
          sub_1E4CBF520();

          _os_log_impl(&dword_1E4BFE000, v7, (os_log_type_t)v30, "Bobble: headGesturesEnabled, HeadphoneDevice:%s aad: %@ %hhd", (uint8_t *)v11, 0x19u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
          swift_arrayDestroy();
          MEMORY[0x1E4E8B4E0](v23, -1, -1);
          uint64_t v26 = v31;
          swift_arrayDestroy();
          MEMORY[0x1E4E8B4E0](v26, -1, -1);
          MEMORY[0x1E4E8B4E0](v11, -1, -1);

          uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v32);
          os_log_type_t v10 = (void *)MEMORY[0x1E4FBC8C8];
          goto LABEL_10;
        }
LABEL_15:

        __break(1u);
        return;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    goto LABEL_15;
  }

  uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
LABEL_10:
  uint64_t v27 = (*(uint64_t (**)(uint64_t))((*v10 & *v6) + 0x98))(v22);
  if (!v27) {
    __break(1u);
  }
  uint64_t v28 = (void *)v27;
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8DA38);
  sub_1E4CBEAD0();

  sub_1E4CBEDA0();
  swift_release();
  sub_1E4CBF460();
}

uint64_t sub_1E4C9F1BC(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    uint64_t v3 = (void *)result;
    swift_retain();
    if (objc_msgSend(v3, sel_BOOLValue)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    (*(void (**)(uint64_t))(*(void *)v2 + 144))(v4);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E4C9F2FC()
{
  return sub_1E4C951A8();
}

uint64_t sub_1E4C9F464()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
  uint64_t v2 = sub_1E4C87A94();
  uint64_t v4 = v3;
  uint64_t v5 = sub_1E4C87A94();
  uint64_t v7 = sub_1E4C87AA0(v2, v4, v5, v6);
  uint64_t v8 = sub_1E4C951A8();
  uint64_t v10 = v9;
  v19[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC40);
  v19[0] = v1;
  uint64_t v11 = type metadata accessor for BobbleSettingsViewController();
  char v12 = sub_1E4C877B0();
  memset((char *)v18 + 8, 0, 24);
  *(void *)&v18[0] = v11;
  __n128 v13 = sub_1E4C879DC(0, 0, v8, v10, (uint64_t)v19, (uint64_t)sel_headGestureOnInput_, 0, 2, (uint64_t)v20, 0, v12 & 1, v18[0], v18[1], (__n128)0, 0);
  uint64_t v14 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v7 + 160))(v20, v13);
  swift_release();
  uint64_t v15 = sub_1E4C8411C((uint64_t)v20);
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 176))(v15);
  swift_release();
  return v16;
}

void sub_1E4C9F670()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v1)
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 232);
    uint64_t v3 = swift_retain();
    char v4 = v2(v3);
    swift_release();
    sub_1E4C94CE4(v4);
  }
  else
  {
    __break(1u);
  }
}

void sub_1E4C9F7AC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v1)
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 184);
    uint64_t v3 = swift_retain();
    char v4 = v2(v3);
    swift_release();
    sub_1E4C94CE4(v4);
  }
  else
  {
    __break(1u);
  }
}

id sub_1E4C9F8E8()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView];
  }
  else
  {
    char v4 = v0;
    type metadata accessor for BobbleVideoLoopPlayer();
    id v5 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v5, sel_userInterfaceStyle);

    uint64_t v6 = (void *)sub_1E4CA6514(0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v6, sel_load);
    objc_msgSend(v6, sel_setDesiredBounds_, 0.0, 0.0, 130.0, 130.0);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v7 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_1E4C9F9F4()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
    id v6 = sub_1E4C9F8E8();
    objc_msgSend(v5, sel_addSubview_, v6);

    uint64_t v7 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E4CC5460;
    id v9 = sub_1E4C9F8E8();
    id v10 = objc_msgSend(v9, sel_centerXAnchor);

    id v11 = objc_msgSend(v5, sel_centerXAnchor);
    id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

    *(void *)(v8 + 32) = v12;
    id v13 = sub_1E4C9F8E8();
    id v14 = objc_msgSend(v13, sel_centerYAnchor);

    id v15 = objc_msgSend(v5, sel_centerYAnchor);
    id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 20.0);

    *(void *)(v8 + 40) = v16;
    sub_1E4CBF2C0();
    sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
    unint64_t v17 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_activateConstraints_, v17);

    uint64_t v18 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v19 = v2;
  return v3;
}

void sub_1E4C9FC1C()
{
  uint64_t v1 = v0;
  id v2 = sub_1E4C9F9F4();
  id v3 = objc_msgSend(v1, sel_view);
  if (!v3)
  {
    __break(1u);
    return;
  }
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_bounds);
  double v6 = v5;

  objc_msgSend(v2, sel_setFrame_, 0.0, 0.0, v6, 180.0);
  id v7 = objc_msgSend(v1, sel_table);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, sel_tableHeaderView);
    id v10 = sub_1E4C9F9F4();
    id v11 = v10;
    if (v9)
    {
      sub_1E4C7EA5C(0, &qword_1EAE8D858);
      id v12 = v9;
      char v13 = sub_1E4CBF470();

      if (v13) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v14 = sub_1E4C9F9F4();
    objc_msgSend(v8, sel_setTableHeaderView_, v14);

    uint64_t v8 = v14;
LABEL_8:
  }
  id v15 = objc_msgSend(v1, sel_table);
  id v16 = objc_msgSend(v15, sel_tableHeaderView);

  objc_msgSend(v16, sel_layoutIfNeeded);
}

id BobbleSettingsViewController.__deallocating_deinit()
{
  return sub_1E4C9FDF8(type metadata accessor for BobbleSettingsViewController);
}

id sub_1E4C9FDF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_1E4C9FEEC()
{
  id v1 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  objc_msgSend(v0, sel_setSelectionStyle_, 0);
  id v2 = objc_msgSend(v0, sel_subviews);
  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  unint64_t v3 = sub_1E4CBF2A0();

  id v4 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label];
  char v5 = sub_1E4C81288((uint64_t)v4, v3);
  swift_bridgeObjectRelease();

  if (v5)
  {
    objc_msgSend(v4, sel_layoutIfNeeded);
    objc_msgSend(v0, sel_layoutIfNeeded);
    return;
  }
  id v6 = objc_msgSend(v0, sel_subviews);
  unint64_t v7 = sub_1E4CBF2A0();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1E4CBF650();
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_7:
      if (v8 < 1)
      {
        __break(1u);
        return;
      }
      for (uint64_t i = 0; i != v8; ++i)
      {
        if ((v7 & 0xC000000000000001) != 0) {
          id v10 = (id)MEMORY[0x1E4E8A770](i, v7);
        }
        else {
          id v10 = *(id *)(v7 + 8 * i + 32);
        }
        id v11 = v10;
        objc_msgSend(v10, sel_removeFromSuperview);
      }
    }
  }
  swift_bridgeObjectRelease_n();
  objc_msgSend(v0, sel_addSubview_, v4);
  id v12 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1E4CC4DD0;
  id v14 = objc_msgSend(v4, sel_topAnchor);
  id v15 = objc_msgSend(v0, sel_topAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 0.0);

  *(void *)(v13 + 32) = v16;
  id v17 = objc_msgSend(v4, sel_leadingAnchor);
  id v18 = objc_msgSend(v0, sel_leadingAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, 20.0);

  *(void *)(v13 + 40) = v19;
  id v20 = objc_msgSend(v4, sel_trailingAnchor);
  id v21 = objc_msgSend(v0, sel_trailingAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v21, -20.0);

  *(void *)(v13 + 48) = v22;
  id v23 = objc_msgSend(v4, sel_bottomAnchor);
  id v24 = objc_msgSend(v0, sel_bottomAnchor);
  id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, 0.0);

  *(void *)(v13 + 56) = v25;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  id v26 = (id)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_activateConstraints_, v26);
}

uint64_t type metadata accessor for HPSCenterContentCell()
{
  return self;
}

uint64_t type metadata accessor for BobbleSettingsViewController()
{
  return self;
}

void sub_1E4CA0390()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners] = MEMORY[0x1E4FBC870];
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset] = 0;

  sub_1E4CBF640();
  __break(1u);
}

uint64_t sub_1E4CA0464()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4CA049C()
{
  return sub_1E4C9E990(v0);
}

unint64_t sub_1E4CA04A4()
{
  unint64_t result = qword_1EAE8DA60;
  if (!qword_1EAE8DA60)
  {
    sub_1E4CBEC80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DA60);
  }
  return result;
}

BOOL _s16HeadphoneConfigs28BobbleSettingsViewControllerC15bobbleSupportedySbyXlFZ_0()
{
  uint64_t v0 = sub_1E4CBEEB0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  id v4 = &v37[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v2);
  id v6 = &v37[-v5];
  unint64_t v7 = (__CFString *)sub_1E4CBF1C0();
  CFPreferencesAppSynchronize(v7);

  uint64_t v8 = (__CFString *)sub_1E4CBF1C0();
  id v9 = (__CFString *)sub_1E4CBF1C0();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v8, v9, 0);

  if (AppBooleanValue) {
    return 1;
  }
  swift_unknownObjectRetain();
  self;
  id v12 = (void *)swift_dynamicCastObjCClass();
  if (v12 && (id v13 = objc_msgSend(v12, sel_headphoneDevice)) != 0)
  {
    id v14 = v13;
    uint64_t v15 = sub_1E4C94F38();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v6, v15, v0);
    id v16 = v14;
    id v17 = sub_1E4CBEE90();
    os_log_type_t v18 = sub_1E4CBF3B0();
    int v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v43 = v40;
      *(_DWORD *)uint64_t v20 = 136315650;
      os_log_t v39 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D608);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1E4CC4A40;
      *(void *)(v21 + 56) = sub_1E4CBEC80();
      *(void *)(v21 + 64) = sub_1E4CA04A4();
      *(void *)(v21 + 32) = v16;
      id v22 = v16;
      id v41 = v16;
      id v23 = v22;
      uint64_t v24 = sub_1E4CBF200();
      uint64_t v42 = sub_1E4C8304C(v24, v25, &v43);
      sub_1E4CBF520();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      id v26 = (void *)sub_1E4CBEAE0();
      uint64_t v42 = (uint64_t)v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC48);
      uint64_t v27 = sub_1E4CBF4F0();
      int v38 = v19;
      unint64_t v29 = v28;

      uint64_t v42 = sub_1E4C8304C(v27, v29, &v43);
      sub_1E4CBF520();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 256;
      sub_1E4CBEAD0();
      LOBYTE(v26) = sub_1E4CBED70();

      swift_release();
      LOBYTE(v42) = (_BYTE)v26;
      sub_1E4CBF520();

      id v16 = v41;
      os_log_t v30 = v39;
      _os_log_impl(&dword_1E4BFE000, v39, (os_log_type_t)v38, "Bobble: headGesturesEnabled, HeadphoneDevice:%s aad: %s %hhu", (uint8_t *)v20, 0x19u);
      uint64_t v31 = v40;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v31, -1, -1);
      MEMORY[0x1E4E8B4E0](v20, -1, -1);
    }
    else
    {
    }
    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v6, v0);
    sub_1E4CBEAD0();
    int v36 = sub_1E4CBED70();
    swift_release();

    swift_unknownObjectRelease();
    return v36 == 2;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v32 = sub_1E4C94F38();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v4, v32, v0);
    char v33 = sub_1E4CBEE90();
    os_log_type_t v34 = sub_1E4CBF3B0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_1E4BFE000, v33, v34, "Bobble not supported!", v35, 2u);
      MEMORY[0x1E4E8B4E0](v35, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
}

uint64_t sub_1E4CA0A30(void *a1)
{
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_1E4C81220((uint64_t)&v9, (uint64_t)v11);
  if (!v12) {
    goto LABEL_16;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8D828);
  if ((swift_dynamicCast() & 1) == 0) {
    return sub_1E4C951A8();
  }
  id v1 = objc_msgSend(self, sel_deviceKey);
  if (!v1)
  {
    sub_1E4CBF1F0();
    id v1 = (id)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  id v2 = objc_msgSend(v8, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_1E4C81220((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
  {

LABEL_16:
    sub_1E4C898C8((uint64_t)v11);
    return sub_1E4C951A8();
  }
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D878);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return sub_1E4C951A8();
  }
  id v3 = objc_msgSend(v8, sel_headphoneDevice);
  if (!v3)
  {

    return sub_1E4C951A8();
  }
  id v4 = v3;
  sub_1E4CBEAD0();

  char v5 = sub_1E4CBEDA0();
  uint64_t v6 = sub_1E4C94DCC(v5);

  swift_release();
  return v6;
}

void sub_1E4CA0C64(void *a1)
{
}

void sub_1E4CA0C6C(void *a1)
{
}

void sub_1E4CA0C74(void *a1, char a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E4CC48E0;
  *(void *)(inited + 32) = 0x65736163657375;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(unsigned char *)(inited + 48) = a2;
  *(void *)(inited + 72) = &type metadata for BobbleMappingUseCase;
  *(void *)(inited + 80) = 0x65646F4D77656976;
  *(void *)(inited + 88) = 0xE90000000000006CLL;
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v7)
  {
    uint64_t v8 = inited;
    *(void *)(inited + 120) = type metadata accessor for BobbleSettingsViewModel();
    *(void *)(v8 + 96) = v7;
    swift_retain();
    sub_1E4C9D518(v8);
    long long v9 = (void *)sub_1E4CBF180();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E4CA0D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4CA0DF8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4CA0E08()
{
  return swift_bridgeObjectRetain();
}

id sub_1E4CA0E18()
{
  objc_msgSend(v0, sel_bounds);

  return objc_msgSend(v0, sel_trackRectForBounds_);
}

float sub_1E4CA0E58()
{
  objc_msgSend(v0, sel_maximumValue);
  return v1 / (float)(*(void *)(*(void *)&v0[qword_1EC066DA8] + 16) - 1);
}

double sub_1E4CA0E98()
{
  return 10.0;
}

double sub_1E4CA0EA0()
{
  return 27.0;
}

char *sub_1E4CA0EA8()
{
  return sub_1E4CA0F08((char *)sub_1E4CA3D44, (uint64_t)&v2, 0, *(void *)(*(void *)(v0 + qword_1EC066DA8) + 16));
}

char *sub_1E4CA0F08(char *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v19 = result;
  uint64_t v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = v4;
  uint64_t v7 = MEMORY[0x1E4FBC860];
  if (!v5) {
    return (char *)v7;
  }
  uint64_t v23 = MEMORY[0x1E4FBC860];
  unint64_t result = sub_1E4CA32C0(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = v23;
    if (a4 <= a3) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a4;
    }
    uint64_t v11 = a3;
    while (a4 != v11)
    {
      uint64_t v20 = v11;
      unint64_t result = (char *)((char *(*)(long long *__return_ptr, uint64_t *))v19)(&v21, &v20);
      if (v6)
      {
        swift_release();
        return (char *)v7;
      }
      uint64_t v6 = 0;
      long long v12 = v21;
      long long v13 = v22;
      uint64_t v23 = v7;
      unint64_t v15 = *(void *)(v7 + 16);
      unint64_t v14 = *(void *)(v7 + 24);
      if (v15 >= v14 >> 1)
      {
        long long v17 = v22;
        long long v18 = v21;
        unint64_t result = sub_1E4CA32C0((char *)(v14 > 1), v15 + 1, 1);
        long long v13 = v17;
        long long v12 = v18;
        uint64_t v7 = v23;
      }
      *(void *)(v7 + 16) = v15 + 1;
      uint64_t v16 = v7 + 32 * v15;
      *(_OWORD *)(v16 + 32) = v12;
      *(_OWORD *)(v16 + 48) = v13;
      if (a4 < a3) {
        goto LABEL_19;
      }
      if (v10 == v11) {
        goto LABEL_20;
      }
      if (a4 == ++v11) {
        return (char *)v7;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_1E4CA105C(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v6) {
      break;
    }
    uint64_t v13 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1E4CBF600();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1E4E8A770](v8, a3);
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return swift_release();
      }
      ++v8;
      sub_1E4CBF5E0();
      sub_1E4CBF610();
      sub_1E4CBF620();
      sub_1E4CBF5F0();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1E4CA11CC(void *a1)
{
  id v1 = a1;
  id v2 = sub_1E4CA1200();

  return v2;
}

id sub_1E4CA1200()
{
  objc_msgSend(v0, sel_value);

  return sub_1E4CA2D70(v1);
}

void sub_1E4CA1234(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  sub_1E4CA1288(a3);
}

id sub_1E4CA1288(uint64_t a1)
{
  float v2 = (float)a1;
  objc_msgSend(v1, sel_maximumValue);
  *(float *)&double v3 = (float)(*(float *)&v3 / (float)(*(void *)(*(void *)&v1[qword_1EC066DA8] + 16) - 1)) * v2;

  return objc_msgSend(v1, sel_setValue_animated_objectChange_, 1, 0, v3);
}

uint64_t sub_1E4CA12FC()
{
  objc_msgSend(v0, sel_selectedIndex);

  return sub_1E4CBF2F0();
}

uint64_t sub_1E4CA1380(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *v1;
  sub_1E4CA34F4();
  id v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v4(a1);
}

void (*sub_1E4CA140C(void *a1))(void ***a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x50);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  objc_msgSend(v1, sel_selectedIndex);
  sub_1E4CBF2F0();
  return sub_1E4CA1520;
}

void sub_1E4CA1520(void ***a1, char a2)
{
  float v2 = *a1;
  uint64_t v3 = (*a1)[3];
  uint64_t v4 = (*a1)[4];
  uint64_t v5 = (*a1)[1];
  size_t v6 = (*a1)[2];
  uint64_t v7 = **a1;
  if (a2)
  {
    ((void (*)(void *, void *, void *))v6[2])((*a1)[3], v4, v5);
    objc_msgSend(v7, sel_setSelectedIndex_, (*(uint64_t (**)(void))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0x58) + 8))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0x50)));
    uint64_t v8 = (void (*)(void *, void *))v6[1];
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    objc_msgSend(v7, sel_setSelectedIndex_, (*(uint64_t (**)(void))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0x58) + 8))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v7) + 0x50)));
    ((void (*)(void *, void *))v6[1])(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

double sub_1E4CA16C4(void *a1)
{
  id v1 = a1;
  sub_1E4CA1708();
  double v3 = v2;

  return v3;
}

uint64_t sub_1E4CA1708()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
  objc_msgSendSuper2(&v11, sel_intrinsicContentSize);
  double v2 = v1;
  objc_msgSend(v0, sel_bounds);
  unint64_t v3 = *(void *)&v0[qword_1EC066DB0];
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v4) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1E4CBF650();
  uint64_t v4 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    double v7 = v2;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x1E4E8A770](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      id v9 = v8;
      objc_msgSend(v8, sel_frame);
      double MaxY = CGRectGetMaxY(v12);

      if (v7 <= MaxY) {
        double v7 = MaxY;
      }
      ++v6;
    }
    while (v4 != v6);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1E4CA1894()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4CA18A4(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1E4CA18E8(a1, a2);
}

uint64_t sub_1E4CA18E8(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1E4FBC8C8] & *v2;
  *(void *)((char *)v2 + qword_1EC066DA0) = MEMORY[0x1E4FBC860];
  *(void *)((char *)v2 + qword_1EC066D90) = 0x4024000000000000;
  *(void *)((char *)v2 + qword_1EC066DB8) = 0x403B000000000000;
  *(void *)((char *)v2 + qword_1EC066D98) = a2;
  uint64_t v4 = self;
  id v5 = v2;
  id v6 = objc_msgSend(v4, sel_sharedApplication);
  id v7 = objc_msgSend(v6, sel_connectedScenes);

  sub_1E4C7EA5C(0, &qword_1EAE8DC70);
  sub_1E4CA35A4();
  uint64_t v8 = sub_1E4CBF350();

  sub_1E4CA1F2C(v8);
  unint64_t v10 = v9;
  uint64_t v49 = 0;
  swift_bridgeObjectRelease();
  if (v10 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    uint64_t v48 = v5;
    if (!v43)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRetain();
      uint64_t v20 = a1;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v48 = v5;
    if (!v11) {
      goto LABEL_16;
    }
  }
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x1E4E8A770](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_31;
    }
    id v12 = *(id *)(v10 + 32);
  }
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v13, sel_windows);

  sub_1E4C7EA5C(0, &qword_1EAE8DC80);
  unint64_t v10 = sub_1E4CBF2A0();

  if (!(v10 >> 62))
  {
    uint64_t v15 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_31:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1E4CBF650();
  if (!v15)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    id v5 = v48;
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v16 = 4;
  id v5 = &selRef_tableView_cellForRowAtIndexPath_;
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v17 = (id)MEMORY[0x1E4E8A770](v16 - 4, v10);
    }
    else {
      id v17 = *(id *)(v10 + 8 * v16);
    }
    long long v18 = v17;
    uint64_t v19 = v16 - 3;
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (objc_msgSend(v17, sel_isKeyWindow)) {
      break;
    }

    ++v16;
    if (v19 == v15) {
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease_n();
  id v40 = objc_msgSend(v18, sel_traitCollection);

  id v41 = objc_msgSend(v40, sel_layoutDirection);
  id v5 = v48;
  if (v41 != (id)1) {
    goto LABEL_17;
  }
  uint64_t v42 = swift_bridgeObjectRetain();
  uint64_t v20 = sub_1E4CA2248(v42);
LABEL_18:
  *(char **)((char *)v5 + qword_1EC066DA8) = (char *)v20;
  uint64_t v21 = *(void *)(v20 + 16);
  long long v22 = (char *)MEMORY[0x1E4FBC860];
  if (v21)
  {
    uint64_t v46 = a1;
    unint64_t v52 = (char *)MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1E4CBF600();
    uint64_t v45 = v20;
    uint64_t v23 = v20 + 40;
    uint64_t v24 = *MEMORY[0x1E4FB28F0];
    while (1)
    {
      unint64_t v25 = (objc_class *)MEMORY[0x1E4FB1930];
      swift_bridgeObjectRetain();
      id v26 = objc_msgSend(objc_allocWithZone(v25), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0, v45);
      objc_msgSend(v26, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      id v27 = sub_1E4CA2370(v24);
      objc_msgSend(v26, sel_setFont_, v27);

      unint64_t v28 = (void *)sub_1E4CBF1C0();
      objc_msgSend(v26, sel_setText_, v28);

      swift_bridgeObjectRelease();
      if (v49) {
        break;
      }
      v23 += 16;
      sub_1E4CBF5E0();
      sub_1E4CBF610();
      sub_1E4CBF620();
      sub_1E4CBF5F0();
      if (!--v21)
      {
        long long v22 = v52;
        swift_bridgeObjectRelease();
        a1 = v46;
        id v5 = v48;
        goto LABEL_23;
      }
    }
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_23:
    *(char **)((char *)v5 + qword_1EC066DB0) = v22;

    unint64_t v29 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider();
    v51.receiver = v5;
    v51.super_class = v29;
    v50.receiver = objc_msgSendSuper2(&v51, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v50.super_class = v29;
    id v30 = v50.receiver;
    objc_msgSendSuper2(&v50, sel__setTrackEnabled_, 1);
    objc_msgSend(v30, sel_setMinimumValue_, 0.0);
    uint64_t v31 = *(void *)(a1 + 16);
    uint64_t v32 = (char *)v30;
    swift_bridgeObjectRelease();
    *(float *)&double v33 = (float)(v31 - 1);
    objc_msgSend(v32, sel_setMaximumValue_, v33);

    unint64_t v34 = *(void *)&v32[qword_1EC066DB0];
    MEMORY[0x1F4188790](v35);
    v44[2] = v32;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1E4CA105C((void (*)(uint64_t *__return_ptr, id *))sub_1E4CA360C, (uint64_t)v44, v34);
    swift_bridgeObjectRelease();
    *(void *)&v32[qword_1EC066DA0] = v36;
    swift_bridgeObjectRelease();
    uint64_t v37 = self;
    sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
    swift_bridgeObjectRetain();
    int v38 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_activateConstraints_, v38);

    return (uint64_t)v32;
  }
  return result;
}

void sub_1E4CA1F2C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v23 = MEMORY[0x1E4FBC860];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1E4CBF560();
    sub_1E4C7EA5C(0, &qword_1EAE8DC70);
    sub_1E4CA35A4();
    sub_1E4CBF360();
    uint64_t v1 = v18;
    uint64_t v16 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_1E4CBF580()) {
      goto LABEL_37;
    }
    sub_1E4C7EA5C(0, &qword_1EAE8DC70);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v17;
    swift_unknownObjectRelease();
    uint64_t v11 = v3;
    uint64_t v9 = v4;
    if (!v17) {
      goto LABEL_37;
    }
LABEL_33:
    self;
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x1E4E8A440]();
      if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1E4CBF2D0();
      }
      sub_1E4CBF2E0();
      sub_1E4CBF2C0();
    }
    else
    {
    }
    uint64_t v3 = v11;
    unint64_t v4 = v9;
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
LABEL_32:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v8) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v16 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v8) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v16 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v8) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v16 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v8) {
              goto LABEL_37;
            }
            unint64_t v14 = *(void *)(v16 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v3 + 6;
              while (v8 != v15)
              {
                unint64_t v14 = *(void *)(v16 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
LABEL_37:
              sub_1E4CA3DCC();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_1E4CA2248(uint64_t result)
{
  uint64_t v1 = (char *)result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return (uint64_t)v1;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  unint64_t v5 = v2 >> 1;
  unint64_t v6 = v2 - 1;
  uint64_t v7 = 16 * v2 + 16;
  unint64_t v15 = v2 >> 1;
  while (1)
  {
    if (v4 == v6) {
      goto LABEL_4;
    }
    unint64_t v8 = *((void *)v1 + 2);
    if (v4 >= v8) {
      break;
    }
    if (v6 >= v8) {
      goto LABEL_13;
    }
    uint64_t v10 = *(void *)&v1[v3 + 32];
    uint64_t v9 = *(void *)&v1[v3 + 40];
    uint64_t v12 = *(void *)&v1[v7];
    uint64_t v11 = *(void *)&v1[v7 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_1E4CA33DC((uint64_t)v1);
    }
    int64_t v13 = &v1[v3];
    uint64_t result = swift_bridgeObjectRelease();
    *((void *)v13 + 4) = v12;
    *((void *)v13 + 5) = v11;
    if (v6 >= *((void *)v1 + 2)) {
      goto LABEL_14;
    }
    unint64_t v14 = &v1[v7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)unint64_t v14 = v10;
    *((void *)v14 + 1) = v9;
    unint64_t v5 = v15;
LABEL_4:
    ++v4;
    --v6;
    v7 -= 16;
    v3 += 16;
    if (v5 == v4) {
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id sub_1E4CA2370(uint64_t a1)
{
  unint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_sharedApplication);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  uint64_t v5 = sub_1E4CBF1F0();
  uint64_t v7 = v6;
  if (v5 == sub_1E4CBF1F0() && v7 == v8) {
    goto LABEL_13;
  }
  char v10 = sub_1E4CBF6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_14;
  }
  uint64_t v11 = sub_1E4CBF1F0();
  uint64_t v13 = v12;
  if (v11 == sub_1E4CBF1F0() && v13 == v14) {
    goto LABEL_13;
  }
  char v16 = sub_1E4CBF6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v17 = sub_1E4CBF1F0();
  uint64_t v19 = v18;
  if (v17 == sub_1E4CBF1F0() && v19 == v20)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v33 = sub_1E4CBF6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v33) {
    goto LABEL_14;
  }
  unint64_t v34 = (void *)*MEMORY[0x1E4FB27D0];
  uint64_t v35 = sub_1E4CBF1F0();
  uint64_t v37 = v36;
  if (v35 == sub_1E4CBF1F0() && v37 == v38)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v39 = sub_1E4CBF6D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      id v22 = v34;
      goto LABEL_16;
    }
  }
LABEL_15:
  id v21 = objc_msgSend(v2, sel_sharedApplication);
  id v22 = objc_msgSend(v21, sel_preferredContentSizeCategory);

LABEL_16:
  id v23 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, v22);
  id v24 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v23);
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, a1);
  id v26 = self;
  objc_msgSend(v24, sel_pointSize);
  id v27 = objc_msgSend(v26, sel_systemFontOfSize_);
  objc_msgSend(v24, sel_pointSize);
  double v29 = v28;
  id v30 = v23;
  id v31 = objc_msgSend(v25, sel_scaledFontForFont_maximumPointSize_compatibleWithTraitCollection_, v27, v30, v29);

  return v31;
}

void sub_1E4CA26FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_1E4CA37D4();
}

void sub_1E4CA2728(void *a1)
{
  id v1 = a1;
  sub_1E4CA3870();
}

id sub_1E4CA2770()
{
  unint64_t v1 = *(void *)&v0[qword_1EC066DA0];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    v8.receiver = v0;
    v8.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
    return objc_msgSendSuper2(&v8, sel_updateConstraints);
  }
  swift_bridgeObjectRetain_n();
  id result = (id)sub_1E4CBF650();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x1E4E8A770](i, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      objc_msgSend(v0, sel_maximumValue);
      objc_msgSend(v6, sel_setConstant_, sub_1E4CA2E64((float)(v7 / (float)(*(void *)(*(void *)&v0[qword_1EC066DA8] + 16) - 1)) * (float)i));
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1E4CA2910(void *a1)
{
  id v1 = a1;
  sub_1E4CA2770();
}

id sub_1E4CA2958(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
  return objc_msgSendSuper2(&v10, sel_trackRectForBounds_, a1, a2, a3, a4);
}

double sub_1E4CA2A0C(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  sub_1E4CA2958(a2, a3, a4, a5);
  double v11 = v10;

  return v11;
}

void sub_1E4CA2A8C(void *a1)
{
  id v1 = a1;
  sub_1E4CA3C94();
}

id sub_1E4CA2AE4(char a1, char a2, float a3)
{
  float v6 = (float)(uint64_t)sub_1E4CA2D70(a3);
  objc_msgSend(v3, sel_maximumValue);
  float v8 = (float)(v7 / (float)(*(void *)(*(void *)&v3[qword_1EC066DA8] + 16) - 1)) * v6;
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
  *(float *)&double v9 = v8;
  id result = objc_msgSendSuper2(&v11, sel_setValue_animated_, a1 & 1, v9);
  if (a2)
  {
    swift_getWitnessTable();
    sub_1E4CBEFE0();
    sub_1E4CBEFF0();
    return (id)swift_release();
  }
  return result;
}

void sub_1E4CA2BF8(void *a1, float a2, uint64_t a3, char a4, char a5)
{
  id v8 = a1;
  sub_1E4CA2AE4(a4, a5, a2);
}

void sub_1E4CA2C64()
{
  id v1 = objc_msgSend(v0, sel__minTrackView);
  if (v1)
  {
    id v5 = v1;
    id v2 = objc_msgSend(v0, sel__maxTrackView);
    if (v2)
    {
      id v3 = v2;
      objc_msgSend(v5, sel_setHidden_, 1);
      objc_msgSend(v3, sel_setHidden_, 1);

      id v4 = v3;
    }
    else
    {
      id v4 = v5;
    }
  }
}

float sub_1E4CA2D20(uint64_t a1)
{
  float v2 = (float)a1;
  objc_msgSend(v1, sel_maximumValue);
  return (float)(v3 / (float)(*(void *)(*(void *)&v1[qword_1EC066DA8] + 16) - 1)) * v2;
}

id sub_1E4CA2D70(float a1)
{
  id result = objc_msgSend(v1, sel_maximumValue);
  float v5 = roundf(a1 / (float)(v4 / (float)(*(void *)(*(void *)&v1[qword_1EC066DA8] + 16) - 1)));
  if ((~LODWORD(v5) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.2234e18) {
    return (id)(uint64_t)v5;
  }
LABEL_7:
  __break(1u);
  return result;
}

CGFloat sub_1E4CA2E04(float a1)
{
  CGFloat v2 = sub_1E4CA2E64(a1) + -1.0;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  CGRectGetMidY(v4);
  return v2;
}

CGFloat sub_1E4CA2E64(float a1)
{
  objc_msgSend(v1, sel_maximumValue);
  float v4 = v3;
  objc_msgSend(v1, sel_minimumValue);
  float v6 = v4 - v5;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  CGFloat v7 = (CGRectGetWidth(v10) + -16.0) / v6 * a1;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  return v7 + v8 + 8.0;
}

id sub_1E4CA2F1C(uint64_t a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
  objc_msgSendSuper2(&v11, sel_traitCollectionDidChange_, a1);
  unint64_t v3 = *(void *)&v1[qword_1EC066DB0];
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain_n();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return objc_msgSend(v1, sel_setNeedsDisplay);
  }
  swift_bridgeObjectRetain_n();
  id result = (id)sub_1E4CBF650();
  uint64_t v4 = (uint64_t)result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *MEMORY[0x1E4FB28F0];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x1E4E8A770](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      double v9 = v8;
      ++v6;
      id v10 = sub_1E4CA2370(v7);
      objc_msgSend(v9, sel_setFont_, v10);
    }
    while (v4 != v6);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1E4CA30AC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_1E4CA2F1C((uint64_t)a3);
}

void sub_1E4CA3118()
{
}

void sub_1E4CA3158()
{
}

id sub_1E4CA319C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneAccessoryLabeledSlider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4CA3210()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4CA327C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for HeadphoneAccessoryLabeledSlider();
  uint64_t result = sub_1E4CBEFE0();
  *a1 = result;
  return result;
}

char *sub_1E4CA32C0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E4CA32E0(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_1E4CA32E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DC88);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    id v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1E4CA33DC(uint64_t a1)
{
  return sub_1E4CA33F0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1E4CA33F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8D0);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1E4CA34F4()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58) + 8))(*(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50));

  return objc_msgSend(v0, sel_setSelectedIndex_, v1);
}

uint64_t type metadata accessor for HeadphoneAccessoryLabeledSlider()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_1E4CA35A4()
{
  unint64_t result = qword_1EAE8DC78;
  if (!qword_1EAE8DC78)
  {
    sub_1E4C7EA5C(255, &qword_1EAE8DC70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DC78);
  }
  return result;
}

void sub_1E4CA360C(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void **)(v2 + 16);
  char v5 = (void *)*a1;
  objc_msgSend(v4, sel_addSubview_, *a1);
  id v6 = objc_msgSend(v5, sel_topAnchor);
  id v7 = objc_msgSend(v4, sel_topAnchor);
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 47.0);

  objc_msgSend(v8, sel_setActive_, 1);
  id v9 = objc_msgSend(v5, sel_bottomAnchor);
  id v10 = objc_msgSend(v4, sel_bottomAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  objc_msgSend(v11, sel_setActive_, 1);
  id v12 = objc_msgSend(v5, sel_centerXAnchor);
  id v13 = objc_msgSend(v4, sel_leftAnchor);
  objc_msgSend(v4, sel_value);
  id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v13, sub_1E4CA2E64(v14));

  *a2 = v15;
}

void sub_1E4CA37D4()
{
  *(void *)&v0[qword_1EC066DA0] = MEMORY[0x1E4FBC860];
  *(void *)&v0[qword_1EC066D90] = 0x4024000000000000;
  *(void *)&v0[qword_1EC066DB8] = 0x403B000000000000;

  sub_1E4CBF640();
  __break(1u);
}

void sub_1E4CA3870()
{
  sub_1E4CA2C64();
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_systemFillColor);
  objc_msgSend(v2, sel_set);

  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  CGFloat v11 = CGRectGetHeight(v45) * 0.5;
  id v12 = objc_msgSend(self, sel_bezierPathWithRoundedRect_cornerRadius_, v4, v6, v8, v10, v11);
  objc_msgSend(v12, sel_fill);

  id v13 = objc_msgSend(v1, sel_systemGray4Color);
  objc_msgSend(v13, sel_set);

  uint64_t v14 = *(void *)(*(void *)&v0[qword_1EC066DA8] + 16);
  unint64_t v44 = v0;
  uint64_t v42 = sub_1E4CA0F08((char *)sub_1E4CA3D44, (uint64_t)v43, 0, v14);
  uint64_t v15 = *((void *)v42 + 2);
  if (v15)
  {
    unint64_t v16 = 0;
    uint64_t v17 = (double *)(v42 + 56);
    while (1)
    {
      double v18 = *(v17 - 3);
      double v19 = *(v17 - 2);
      double v20 = *(v17 - 1);
      double v21 = *v17;
      objc_msgSend(v0, sel_maximumValue);
      double v23 = sub_1E4CA2E64((float)(v22 / (float)(*(void *)(*(void *)&v0[qword_1EC066DA8] + 16) - 1)) * (float)(uint64_t)v16);
      if (v16)
      {
        double v24 = v23;
      }
      else
      {
        uint64_t v25 = *(void *)&v0[qword_1EC066DB0];
        if ((v25 & 0xC000000000000001) != 0)
        {
          id v26 = (id)MEMORY[0x1E4E8A770](0, v23);
        }
        else
        {
          if (!*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_31;
          }
          id v26 = *(id *)(v25 + 32);
        }
        id v27 = v26;
        objc_msgSend(v26, sel_bounds);
        double v29 = v28;

        double v24 = v29 * 0.5;
      }
      objc_msgSend(v0, sel_maximumValue);
      if ((~LODWORD(v30) & 0x7F800000) == 0) {
        break;
      }
      if (v30 <= -9.2234e18) {
        goto LABEL_27;
      }
      if (v30 >= 9.2234e18) {
        goto LABEL_28;
      }
      if (v16 == (uint64_t)v30)
      {
        objc_msgSend(v0, sel_bounds);
        objc_msgSend(v0, sel_trackRectForBounds_);
        double v32 = v31;
        uint64_t v33 = *(void *)&v0[qword_1EC066DB0];
        if ((v33 & 0xC000000000000001) != 0)
        {
          id v34 = (id)MEMORY[0x1E4E8A770](v16);
        }
        else
        {
          if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) <= v16) {
            goto LABEL_30;
          }
          id v34 = *(id *)(v33 + 8 * v16 + 32);
        }
        uint64_t v35 = v34;
        objc_msgSend(v34, sel_bounds);
        double v37 = v36;

        double v24 = v32 + v37 * -0.5;
      }
      uint64_t v38 = *(void *)&v0[qword_1EC066DA0];
      if ((v38 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        id v39 = (id)MEMORY[0x1E4E8A770](v16, v38);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) <= v16) {
          goto LABEL_29;
        }
        id v39 = *(id *)(v38 + 8 * v16 + 32);
      }
      ++v16;
      objc_msgSend(v39, sel_setConstant_, v24);

      v46.origin.x = v18;
      v46.origin.y = v19;
      v46.size.width = v20;
      v46.size.height = v21;
      CGFloat v40 = CGRectGetWidth(v46) * 0.5;
      id v41 = objc_msgSend(self, sel_bezierPathWithRoundedRect_cornerRadius_, v18, v19, v20, v21, v40);
      objc_msgSend(v41, sel_fill);

      v17 += 4;
      if (v15 == v16) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
  }
  else
  {
LABEL_25:
    swift_bridgeObjectRelease();
  }
}

id sub_1E4CA3C94()
{
  return objc_msgSend(v0, sel_setValue_animated_objectChange_, 1, 1);
}

void sub_1E4CA3CAC()
{
}

uint64_t sub_1E4CA3CDC()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1E4CA3CE8()
{
  return swift_initClassMetadata2();
}

double sub_1E4CA3D44@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = *(char **)(v2 + 16);
  float v5 = (float)*a1;
  objc_msgSend(v4, sel_maximumValue);
  *(CGFloat *)a2 = sub_1E4CA2E04((float)(v6 / (float)(*(void *)(*(void *)&v4[qword_1EC066DA8] + 16) - 1)) * v5);
  *(void *)(a2 + 8) = v7;
  double result = 2.0;
  *(_OWORD *)(a2 + 16) = xmmword_1E4CC5530;
  return result;
}

uint64_t sub_1E4CA3DCC()
{
  return swift_release();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1E4CA3DE0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1E4CA3E00(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1E4CA3E4C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1E4CA3E6C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_1E4CA3EC4()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE90148);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90148);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4CA3F3C()
{
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90148);
}

uint64_t sub_1E4CA3FA0@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90148);
  double v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1E4CA4048(uint64_t result)
{
  return result;
}

uint64_t sub_1E4CA4054(char a1)
{
  return *(void *)&aUnknown_4[8 * a1];
}

uint64_t sub_1E4CA4074(char *a1, char *a2)
{
  return sub_1E4CA4080(*a1, *a2);
}

uint64_t sub_1E4CA4080(char a1, char a2)
{
  if (*(void *)&aUnknown_4[8 * a1] == *(void *)&aUnknown_4[8 * a2] && qword_1E4CC5820[a1] == qword_1E4CC5820[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1E4CBF6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1E4CA4108()
{
  return sub_1E4CA4110();
}

uint64_t sub_1E4CA4110()
{
  return sub_1E4CBF740();
}

uint64_t sub_1E4CA417C()
{
  return sub_1E4CA4184();
}

uint64_t sub_1E4CA4184()
{
  sub_1E4CBF230();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4CA41D8()
{
  return sub_1E4CA41E0();
}

uint64_t sub_1E4CA41E0()
{
  return sub_1E4CBF740();
}

uint64_t sub_1E4CA4248@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E4CA57D4();
  *a1 = result;
  return result;
}

uint64_t sub_1E4CA4278@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4CA4054(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_1E4CA42A4(unint64_t a1)
{
  uint64_t v2 = *((void *)sub_1E4CA43E8() + 2);
  swift_bridgeObjectRelease();
  if (v2 <= (uint64_t)a1)
  {
    if (qword_1EAE8EC10 == -1) {
      goto LABEL_6;
    }
  }
  else
  {
    char v3 = sub_1E4CA43E8();
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v3[2] > a1)
    {
      uint64_t v4 = (unsigned int *)v3 + a1 + 8;
LABEL_10:
      uint64_t v10 = *v4;
      swift_bridgeObjectRelease();
      return (char *)v10;
    }
    __break(1u);
  }
  swift_once();
LABEL_6:
  uint64_t v5 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAE90148);
  float v6 = sub_1E4CBEE90();
  os_log_type_t v7 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v6, v7))
  {
    double v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v6, v7, "_modeForIndex: Index out of bounds!", v8, 2u);
    MEMORY[0x1E4E8B4E0](v8, -1, -1);
  }

  uint64_t result = (char *)sub_1E4CA43E8();
  if (*((void *)result + 2))
  {
    uint64_t v4 = (unsigned int *)(result + 32);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void *sub_1E4CA43E8()
{
  unsigned int v1 = objc_msgSend(v0, sel_autoANCSupported);
  unsigned int v2 = objc_msgSend(v0, sel_modeOffSupported);
  char v3 = &unk_1F4096ED8;
  if (v2) {
    char v3 = &unk_1F4096EA8;
  }
  uint64_t v4 = &unk_1F4096F38;
  if (v2) {
    uint64_t v4 = &unk_1F4096F08;
  }
  if (v1) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EAE90148);
  id v7 = v0;
  swift_bridgeObjectRetain_n();
  id v8 = v7;
  double v9 = sub_1E4CBEE90();
  os_log_type_t v10 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v12;
    *(_DWORD *)uint64_t v11 = 67109634;
    unsigned int v13 = objc_msgSend(v8, sel_autoANCSupported);

    LODWORD(v21) = v13;
    sub_1E4CBF520();

    *(_WORD *)(v11 + 8) = 1024;
    objc_msgSend(v8, sel_modeOffSupported, v21);

    sub_1E4CBF520();
    *(_WORD *)(v11 + 14) = 2080;
    type metadata accessor for BTAccessoryListeningMode(0);
    uint64_t v15 = v14;
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x1E4E8A470](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_1E4C8304C(v17, v19, &v22);
    sub_1E4CBF520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E4BFE000, v9, v10, "validModes: autoANCSupported: %{BOOL}d, modeOffSupported:%{BOOL}d, modes:%s", (uint8_t *)v11, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v12, -1, -1);
    MEMORY[0x1E4E8B4E0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v5;
}

uint64_t sub_1E4CA46EC(int a1)
{
  unsigned int v2 = sub_1E4CA43E8();
  uint64_t v3 = v2[2];
  if (v3)
  {
    if (*((_DWORD *)v2 + 8) == a1)
    {
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      return v4;
    }
    uint64_t v4 = 0;
    uint64_t v5 = v3 - 1;
    while (v5 != v4)
    {
      int v6 = *((_DWORD *)v2 + v4++ + 9);
      if (v6 == a1)
      {
        swift_bridgeObjectRelease();
        return v4;
      }
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EAE90148);
  id v8 = sub_1E4CBEE90();
  os_log_type_t v9 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl(&dword_1E4BFE000, v8, v9, "_indexForMode: No valid index found", v10, 2u);
    MEMORY[0x1E4E8B4E0](v10, -1, -1);
  }

  return 0;
}

void sub_1E4CA4860(NSObject *a1)
{
  unsigned int v2 = v1;
  os_log_t v38 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DCA8);
  uint64_t v36 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DCB0);
  uint64_t v37 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DCB8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1E4CA4EC0();
  if (v13)
  {
    if (!*(void *)(v13 + 16))
    {
      swift_bridgeObjectRelease();
      if (!v38) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
    sub_1E4C838F4(0x726576726573624FLL, 0xE800000000000000);
    char v15 = v14;
    swift_bridgeObjectRelease();
    if (v15) {
      return;
    }
  }
  if (!v38) {
    goto LABEL_13;
  }
LABEL_7:
  self;
  uint64_t v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    swift_unknownObjectRetain();
    id v18 = objc_msgSend(v17, sel_headphoneDevice);
    if (v18)
    {
      uint64_t v35 = v10;
      unint64_t v19 = v18;
      sub_1E4CA4EC0();
      v33[1] = sub_1E4CBEFD0();
      double v20 = (void *)sub_1E4CBF180();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      objc_setAssociatedObject(v2, &byte_1EAE90160, v20, (void *)1);
      swift_endAccess();

      id v34 = v19;
      uint64_t v21 = (void *)sub_1E4CBEB00();
      sub_1E4CBED10();
      uint64_t v22 = sub_1E4CBEAC0();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v3);
      uint64_t v39 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DCC0);
      sub_1E4C7D240(&qword_1EAE8DCC8, &qword_1EAE8DCC0);
      sub_1E4CBF0C0();
      swift_release();
      sub_1E4C7D240(&qword_1EAE8DCD0, &qword_1EAE8DCB0);
      sub_1E4CA5834();
      sub_1E4CBF0D0();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v6);
      swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_1E4C7D240(&qword_1EAE8DCE0, &qword_1EAE8DCB8);
      uint64_t v23 = sub_1E4CBF0E0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v9);
      swift_retain();
      uint64_t v24 = sub_1E4CA4EC0();
      if (v24)
      {
        uint64_t v25 = v24;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v39 = v25;
        sub_1E4CA54AC(v23, 0x726576726573624FLL, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
        uint64_t v27 = v39;
        swift_bridgeObjectRelease();
        if (v27)
        {
          double v28 = (void *)sub_1E4CBF180();
          swift_bridgeObjectRelease();
        }
        else
        {
          double v28 = 0;
        }
        swift_beginAccess();
        objc_setAssociatedObject(v2, &byte_1EAE90160, v28, (void *)1);
        swift_endAccess();

        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        __break(1u);
      }
      return;
    }
    swift_unknownObjectRelease();
  }
LABEL_13:
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EAE90148);
  os_log_t v38 = (os_log_t)sub_1E4CBEE90();
  os_log_type_t v30 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v38, v30))
  {
    double v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v31 = 0;
    _os_log_impl(&dword_1E4BFE000, v38, v30, "startObservingOffModeChanges: Precondition not meet no record!", v31, 2u);
    MEMORY[0x1E4E8B4E0](v31, -1, -1);
  }
  os_log_t v32 = v38;
}

uint64_t sub_1E4CA4EC0()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &byte_1EAE90160);
  swift_endAccess();
  if (v1)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1E4C81220((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DD08);
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v5);
  }
  return 0;
}

char *sub_1E4CA5004()
{
  return &byte_1EAE90160;
}

uint64_t sub_1E4CA5010()
{
  return byte_1EAE90160;
}

uint64_t sub_1E4CA5054(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1EAE90160 = a1;
  return result;
}

uint64_t (*sub_1E4CA509C())()
{
  return j__swift_endAccess;
}

BOOL sub_1E4CA5150(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_1E4CA5164(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_1E4CA5178@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_1E4CA5188(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E4CA5194(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DD00);
  char v36 = a2;
  uint64_t v6 = sub_1E4CBF670();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1E4CBF720();
    sub_1E4CBF230();
    uint64_t result = sub_1E4CBF740();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1E4CA54AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1E4C838F4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1E4CA561C();
LABEL_7:
    id v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1E4CA5194(v15, a4 & 1);
  unint64_t v21 = sub_1E4C838F4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1E4CBF700();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  id v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void *sub_1E4CA561C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DD00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E4CBF660();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1E4CA57D4()
{
  unint64_t v0 = sub_1E4CBF6B0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

void type metadata accessor for BTAccessoryListeningMode(uint64_t a1)
{
}

unint64_t sub_1E4CA5834()
{
  unint64_t result = qword_1EAE8DCD8;
  if (!qword_1EAE8DCD8)
  {
    type metadata accessor for HMMultiState(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DCD8);
  }
  return result;
}

void type metadata accessor for HMMultiState(uint64_t a1)
{
}

uint64_t sub_1E4CA58A0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4CA58D8(unsigned char *a1)
{
  uint64_t v2 = v1 + 16;
  if (*a1 == 1) {
    uint64_t v3 = 1702195828;
  }
  else {
    uint64_t v3 = 0x65736C6166;
  }
  if (*a1 == 1) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (qword_1EAE8EC10 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAE90148);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1E4CBEE90();
  os_log_type_t v7 = sub_1E4CBF3B0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v12[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1E4C8304C(v3, v4, v12);
    sub_1E4CBF520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1E4BFE000, v6, v7, "$listeningModeOffAllowed: Value Changed! %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v9, -1, -1);
    MEMORY[0x1E4E8B4E0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_beginAccess();
  uint64_t v10 = (void *)MEMORY[0x1E4E8B570](v2);
  if (v10)
  {
    uint64_t v11 = v10;
    objc_msgSend(v10, sel_resetUI);
  }
}

BOOL sub_1E4CA5ADC(uint64_t a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_8;
  }
  uint64_t v2 = (void *)v1;
  swift_unknownObjectRetain();
  id v3 = objc_msgSend(v2, sel_headphoneDevice);
  if (!v3)
  {
    swift_unknownObjectRelease();
LABEL_8:
    if (qword_1EAE8EC10 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EAE90148);
    int64_t v13 = sub_1E4CBEE90();
    os_log_type_t v14 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      sub_1E4C8304C(0xD00000000000001ALL, 0x80000001E4CCE580, &v23);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v13, v14, "%s: No device return true!", v15, 0xCu);
      uint64_t v11 = 1;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v16, -1, -1);
      MEMORY[0x1E4E8B4E0](v15, -1, -1);

      return v11;
    }

    return 1;
  }
  unint64_t v4 = v3;
  uint64_t v5 = (void *)sub_1E4CBEB00();
  unsigned int v6 = objc_msgSend(v5, sel_listeningModeOffAllowed);

  if (!v6)
  {
    if (qword_1EAE8EC10 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1E4CBEEB0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EAE90148);
    uint64_t v19 = sub_1E4CBEE90();
    os_log_type_t v20 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = v22;
      *(_DWORD *)unint64_t v21 = 136315138;
      sub_1E4C8304C(0xD00000000000001ALL, 0x80000001E4CCE580, &v23);
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v19, v20, "%s: listeningModeOffAllowed is unknown, return true!", v21, 0xCu);
      uint64_t v11 = 1;
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v22, -1, -1);
      MEMORY[0x1E4E8B4E0](v21, -1, -1);

      swift_unknownObjectRelease();
      return v11;
    }

    swift_unknownObjectRelease();
    return 1;
  }
  os_log_type_t v7 = (void *)sub_1E4CBEB00();
  int v8 = sub_1E4CBECF0();

  if (v8 == 1)
  {
    uint64_t v9 = (void *)sub_1E4CBEB00();
    unsigned int v10 = objc_msgSend(v9, sel_listeningModeOffAllowed);

    swift_unknownObjectRelease();
    return v10 == 1;
  }
  else
  {

    swift_unknownObjectRelease();
    return 0;
  }
}

unint64_t sub_1E4CA5EBC()
{
  unint64_t result = qword_1EAE8DCE8;
  if (!qword_1EAE8DCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DCE8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s4ModeOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s4ModeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1E4CA6078);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1E4CA60A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E4CA60A8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s4ModeOMa()
{
  return &_s4ModeON;
}

ValueMetadata *_s14AssociatedKeysVMa_0()
{
  return &_s14AssociatedKeysVN_0;
}

uint64_t static HPSSpatialProfileFeedback.getDraftViewController()()
{
  uint64_t v0 = sub_1E4CBF130();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_allocWithZone((Class)sub_1E4CBF150());
  sub_1E4CBF120();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F618D0], v0);
  sub_1E4CBF140();
  id v5 = objc_allocWithZone((Class)sub_1E4CBF170());
  return sub_1E4CBF160();
}

id HPSSpatialProfileFeedback.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id HPSSpatialProfileFeedback.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HPSSpatialProfileFeedback()
{
  return self;
}

id HPSSpatialProfileFeedback.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1E4CA6410(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

uint64_t sub_1E4CA6420(uint64_t result)
{
  return result;
}

uint64_t sub_1E4CA6428()
{
  return sub_1E4CBF740();
}

uint64_t sub_1E4CA6470()
{
  return sub_1E4CBF730();
}

uint64_t sub_1E4CA649C()
{
  return sub_1E4CBF740();
}

uint64_t *sub_1E4CA64E0@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_1E4CA64F8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E4CA6504()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase);
}

uint64_t sub_1E4CA6514(int a1, double a2, double a3, double a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return sub_1E4CA6588(a1, a2, a3, a4, a5);
}

uint64_t sub_1E4CA6588(int a1, double a2, double a3, double a4, double a5)
{
  unsigned int v6 = v5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DAC8);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  unint64_t v15 = &v54[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = &v54[-v17];
  MEMORY[0x1F4188790](v16);
  os_log_type_t v20 = &v54[-v19];
  uint64_t v21 = sub_1E4CBE910();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  BOOL v25 = &v54[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v23);
  Swift::Bool v56 = &v54[-v26];
  int v55 = a1;
  if (!(_BYTE)a1)
  {
    swift_getObjectType();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    char v36 = self;
    id v37 = v6;
    unint64_t v15 = objc_msgSend(v36, sel_bundleForClass_, ObjCClassFromMetadata);
    v58[0] = 0;
    v58[1] = 0xE000000000000000;
    sub_1E4CBF590();
    swift_bridgeObjectRelease();
    v58[0] = 0xD000000000000010;
    v58[1] = 0x80000001E4CCE610;
    sub_1E4CBF250();
    swift_bridgeObjectRelease();
    os_log_t v38 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    uint64_t v39 = (void *)sub_1E4CBF1C0();
    id v40 = objc_msgSend(v15, sel_URLForResource_withExtension_, v38, v39);

    if (v40)
    {
      sub_1E4CBE8F0();

      unint64_t v15 = *(unsigned char **)(v22 + 32);
      ((void (*)(unsigned char *, unsigned char *, uint64_t))v15)(v20, v25, v21);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(v20, 0, 1, v21);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) != 1)
      {
        uint64_t v32 = v56;
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v15)(v56, v20, v21);
LABEL_13:
        *((unsigned char *)v6 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase) = v55;

        uint64_t v49 = (void *)sub_1E4CBE8E0();
        objc_super v50 = (objc_class *)type metadata accessor for BobbleVideoLoopPlayer();
        v57.receiver = v6;
        v57.super_class = v50;
        id v51 = objc_msgSendSuper2(&v57, sel_initWithFrame_urlForResource_, v49, a2, a3, a4, a5);

        (*(void (**)(unsigned char *, uint64_t))(v22 + 8))(v32, v21);
        return (uint64_t)v51;
      }
      goto LABEL_17;
    }
LABEL_16:
    os_log_type_t v53 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    v22 += 56;
    v53(v20, 1, 1, v21);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a1 == 1)
  {
    swift_getObjectType();
    uint64_t v27 = swift_getObjCClassFromMetadata();
    uint64_t v28 = self;
    id v29 = v6;
    os_log_type_t v20 = objc_msgSend(v28, sel_bundleForClass_, v27);
    strcpy((char *)v58, "Bobble_Nod_");
    HIDWORD(v58[1]) = -352321536;
    sub_1E4CBF250();
    swift_bridgeObjectRelease();
    unint64_t v15 = (unsigned char *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    uint64_t v30 = (void *)sub_1E4CBF1C0();
    id v31 = objc_msgSend(v20, sel_URLForResource_withExtension_, v15, v30);

    if (v31)
    {
      sub_1E4CBE8F0();

      os_log_type_t v20 = *(unsigned char **)(v22 + 32);
      ((void (*)(unsigned char *, unsigned char *, uint64_t))v20)(v18, v25, v21);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(v18, 0, 1, v21);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21) != 1)
      {
        uint64_t v32 = v56;
        uint64_t v33 = v56;
        int64_t v34 = v18;
LABEL_12:
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v20)(v33, v34, v21);
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v52 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
      v22 += 56;
      v52(v18, 1, 1, v21);
    }
    __break(1u);
    goto LABEL_16;
  }
  swift_getObjectType();
  uint64_t v41 = swift_getObjCClassFromMetadata();
  uint64_t v42 = self;
  id v43 = v6;
  id v44 = objc_msgSend(v42, sel_bundleForClass_, v41);
  strcpy((char *)v58, "Bobble_Shake_");
  HIWORD(v58[1]) = -4864;
  sub_1E4CBF250();
  swift_bridgeObjectRelease();
  CGRect v45 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  CGRect v46 = (void *)sub_1E4CBF1C0();
  id v47 = objc_msgSend(v44, sel_URLForResource_withExtension_, v45, v46);

  if (!v47)
  {
LABEL_18:
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v15, 1, 1, v21);
    goto LABEL_19;
  }
  sub_1E4CBE8F0();

  os_log_type_t v20 = *(unsigned char **)(v22 + 32);
  ((void (*)(unsigned char *, unsigned char *, uint64_t))v20)(v15, v25, v21);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(v15, 0, 1, v21);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48))(v15, 1, v21);
  if (result != 1)
  {
    uint64_t v32 = v56;
    uint64_t v33 = v56;
    int64_t v34 = v15;
    goto LABEL_12;
  }
LABEL_19:
  __break(1u);
  return result;
}

void sub_1E4CA6C80()
{
  id v1 = v0;
  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for BobbleVideoLoopPlayer();
  objc_msgSendSuper2(&v26, sel_load);
  if (!*((unsigned char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase))
  {
    swift_getObjectType();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    id v4 = (void *)sub_1E4CBF1C0();
    id v5 = objc_msgSend(self, sel_imageNamed_inBundle_, v4, v3);

    if (v5)
    {
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v5);

      objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      id v7 = objc_msgSend(v1, sel_videoPlayer);
      uint64_t v8 = sub_1E4CBF450();
      unsigned int v10 = v9;
      uint64_t v12 = v11;
      unint64_t v13 = HIDWORD(v9);
      sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D670);
      uint64_t v14 = (void *)sub_1E4CBF420();
      uint64_t v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v15;
      *(void *)(v16 + 24) = v6;
      uint64_t v24 = sub_1E4CA7348;
      uint64_t v25 = v16;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      unint64_t v21 = 1107296256;
      uint64_t v22 = sub_1E4CA6F30;
      uint64_t v23 = &block_descriptor_2;
      uint64_t v17 = _Block_copy(&v20);
      id v18 = v6;
      swift_release();
      uint64_t v20 = v8;
      unint64_t v21 = __PAIR64__(v13, v10);
      uint64_t v22 = v12;
      id v19 = objc_msgSend(v7, sel_addPeriodicTimeObserverForInterval_queue_usingBlock_, &v20, v14, v17);
      _Block_release(v17);

      sub_1E4CBF550();
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1E4CA6F30(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(v2, v3, v4);

  return swift_release();
}

void sub_1E4CA6FE4()
{
}

id sub_1E4CA709C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  uint64_t v12 = (void *)sub_1E4CBE8E0();
  id v13 = objc_msgSend(v11, sel_initWithFrame_urlForResource_, v12, a2, a3, a4, a5);

  uint64_t v14 = sub_1E4CBE910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  return v13;
}

void sub_1E4CA7164()
{
}

void sub_1E4CA7218()
{
}

id sub_1E4CA7278()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BobbleVideoLoopPlayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BobbleVideoLoopPlayer()
{
  return self;
}

uint64_t sub_1E4CA72D0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4CA7308()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4CA7348(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void **)(v3 + 24);
  uint64_t v9 = v7 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x1E4E8B570](v9);
  if (v10)
  {
    id v11 = (void *)v10;
    v26.value = a1;
    *(void *)&v26.timescale = a2;
    v26.epoch = a3;
    if (CMTimeGetSeconds(&v26) >= 4.3)
    {
      objc_msgSend(v11, sel_addSubview_, v8);
      uint64_t v12 = self;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
      CMTimeValue v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1E4CC4DD0;
      id v14 = objc_msgSend(v8, sel_widthAnchor);
      objc_msgSend(v11, sel_desiredBounds);
      id v15 = objc_msgSend(v14, sel_constraintEqualToConstant_, CGRectGetWidth(v27));

      *(void *)(v13 + 32) = v15;
      id v16 = objc_msgSend(v8, sel_heightAnchor);
      objc_msgSend(v11, sel_desiredBounds);
      id v17 = objc_msgSend(v16, sel_constraintEqualToConstant_, CGRectGetHeight(v28));

      *(void *)(v13 + 40) = v17;
      id v18 = objc_msgSend(v8, sel_centerXAnchor);
      id v19 = objc_msgSend(v11, sel_centerXAnchor);
      id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

      *(void *)(v13 + 48) = v20;
      id v21 = objc_msgSend(v8, sel_centerYAnchor);
      id v22 = objc_msgSend(v11, sel_centerYAnchor);
      id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

      *(void *)(v13 + 56) = v23;
      v26.value = v13;
      sub_1E4CBF2C0();
      sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
      uint64_t v24 = (void *)sub_1E4CBF290();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_activateConstraints_, v24);

      id v25 = objc_msgSend(v11, sel_playerLooper);
      objc_msgSend(v25, sel_disableLooping);
    }
  }
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_1E4CA763C()
{
  unint64_t result = qword_1EAE8DD18;
  if (!qword_1EAE8DD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DD18);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BobbleVideoLoopPlayer.VideoUseCase(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BobbleVideoLoopPlayer.VideoUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1E4CA77ECLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BobbleVideoLoopPlayer.VideoUseCase()
{
  return &type metadata for BobbleVideoLoopPlayer.VideoUseCase;
}

void *sub_1E4CA7824()
{
  return &unk_1E4CC5990;
}

void *sub_1E4CA7830()
{
  return &unk_1E4CC5998;
}

uint64_t type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl()
{
  return self;
}

id sub_1E4CA7864()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl());

  return objc_msgSend(v0, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

id sub_1E4CA78C4()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
}

id sub_1E4CA78FC()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst));
}

id sub_1E4CA7934()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView));
}

id sub_1E4CA796C()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond));
}

id sub_1E4CA79A4()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView));
}

id sub_1E4CA79DC()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
}

id sub_1E4CA7A14()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray));
}

id sub_1E4CA7A4C()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView));
}

id sub_1E4CA7A84()
{
  return objc_retain(*(id *)(*(void *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView));
}

uint64_t sub_1E4CA7AA0()
{
  uint64_t v1 = sub_1E4CBE970();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  unsigned int v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (unsigned char *)(v0
               + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection
                + 8) != 1)
    return *(void *)v5;
  if (*(void *)(sub_1E4CBE940() + 16)) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  sub_1E4CBE950();
  uint64_t v7 = sub_1E4CBE960();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t result = v7 == 2;
  *(void *)uint64_t v5 = result;
  v5[8] = 0;
  return result;
}

uint64_t sub_1E4CA7BEC()
{
  return 0;
}

char *sub_1E4CA7BF8(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1E4CA7C3C(a1, a2);
}

char *sub_1E4CA7C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  unsigned int v6 = (objc_class *)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  id v7 = objc_allocWithZone(v6);
  uint64_t v8 = v2;
  *(void *)&v2[v5] = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  *(void *)&v8[v9] = objc_msgSend(objc_allocWithZone(v6), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v10 = &v8[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  id v11 = &v8[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_budInEarStringBlock];
  *(void *)id v11 = a1;
  *((void *)v11 + 1) = a2;
  swift_retain();

  v20.receiver = v8;
  v20.super_class = (Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t v12 = (char *)objc_msgSendSuper2(&v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v14 = *(void **)&v12[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  id v15 = v12;
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v12[v13], sel_setAlpha_, 0.0);
  uint64_t v16 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  objc_msgSend(*(id *)&v15[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_addSubview_, *(void *)&v12[v13]);
  objc_msgSend(v15, sel_addSubview_, *(void *)&v15[v16]);
  id v17 = *(id *)&v15[v16];
  sub_1E4CA9FF8(v17);

  id v18 = *(id *)&v12[v13];
  sub_1E4CA9FF8(v18);

  swift_release();
  return v15;
}

uint64_t type metadata accessor for HPSSpatialProfileSingleStepBottomContainer()
{
  return self;
}

uint64_t sub_1E4CA7E80(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1E4CBF1F0();

  return v3;
}

id sub_1E4CA7EE4(char a1)
{
  if (a1) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  objc_msgSend(*(id *)(*(void *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray), sel_setAlpha_, v2);
  uint64_t v3 = *(void **)(*(void *)(v1
                            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray);

  return objc_msgSend(v3, sel_setAlpha_, v2);
}

id sub_1E4CA7FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  objc_msgSend(*(id *)(*(void *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_removeTarget_action_forControlEvents_, 0, 0, 0xFFFFFFFFLL);
  uint64_t v6 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(*(void *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_removeTarget_action_forControlEvents_, 0, 0, 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(*(void *)(v2 + v5)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_addTarget_action_forControlEvents_, a1, a2, 64);
  id v7 = *(void **)(*(void *)(v2 + v6)
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton);

  return objc_msgSend(v7, sel_addTarget_action_forControlEvents_, a1, a2, 64);
}

void sub_1E4CA8128()
{
  id v1 = objc_retain(*(id *)(*(void *)(v0
                                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                         + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  uint64_t v2 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v1, sel_setTitle_forState_, v2, 0);

  id v3 = objc_retain(*(id *)(*(void *)(v0
                                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)
                         + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  id v4 = (id)sub_1E4CBF1C0();
  objc_msgSend(v3, sel_setTitle_forState_, v4, 0);
}

uint64_t sub_1E4CA827C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x138))(a1, a2, 0, 0);
}

uint64_t sub_1E4CA8364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v4)
                                                                                       + 0x140))(a1, a2, 0, 0, a3, a4);
}

void sub_1E4CA84C4(int a1, int a2, id *a3, void **a4, uint64_t a5, uint64_t a6)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 3:
    case 9:
    case 10:
    case 11:
      return;
    case 2:
      sub_1E4CA9C64();
      break;
    case 4:
      sub_1E4CA8910();
      break;
    case 5:
      sub_1E4CA8A44(a3, a4, a5, a6);
      break;
    case 6:
      sub_1E4CA93E0(a3, a4, a5, a6);
      break;
    case 7:
      sub_1E4CA9A14(a1);
      break;
    case 8:
      if (a1 == 2)
      {
        type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v7 = self;
        id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
        uint64_t v9 = sub_1E4CBE8B0();
        uint64_t v11 = v10;

        id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        uint64_t v13 = sub_1E4CBE8B0();
        uint64_t v15 = v14;

        sub_1E4CA90A4(v9, v11, v13, v15, 0, 0, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 12:
      sub_1E4CA9E18();
      break;
    default:
      type metadata accessor for HPSSpatialProfileV2EnrollmentStep(0);
      sub_1E4CBF6E0();
      __break(1u);
      JUMPOUT(0x1E4CA87F8);
  }
}

void sub_1E4CA8910()
{
  id v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  id v4 = (id)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setTitle_forState_, v4, 0, 0xE000000000000000);
}

void sub_1E4CA8A44(id *a1, void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  uint64_t v6 = *(void **)(*(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = self;
  id v9 = v6;
  id v10 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  uint64_t v11 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_, v11, 0xE000000000000000);

  id v12 = objc_retain(*(id *)(*(void *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  id v13 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  uint64_t v14 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setDetailText_, v14, 0xE000000000000000);

  id v15 = objc_retain(*(id *)(*(void *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  id v16 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  id v17 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setTitle_forState_, v17, 0, 0xE000000000000000);

  if (a1 && a2)
  {
    id v18 = *a2;
    id v19 = *(void **)&v4[v5];
    id v20 = *a1;
    id v21 = v19;
    id v22 = v20;
    id v23 = v21;
    id v24 = v18;
    uint64_t v25 = sub_1E4CA7AA0();
    objc_msgSend(v4, sel_bounds);
    if (v25) {
      double v27 = -0.5;
    }
    else {
      double v27 = 0.5;
    }
    double v28 = v26 * v27;
    objc_msgSend(v23, sel_frame);
    objc_msgSend(v23, sel_setFrame_, v28);
    objc_msgSend(v23, sel_setAlpha_, 0.0);
    objc_msgSend(v23, sel_layoutIfNeeded);

    if (*(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection]) {
      double v29 = -0.5;
    }
    else {
      double v29 = 0.5;
    }
    id v30 = v22;
    objc_msgSend(v4, sel_bounds);
    double v32 = v31 * v29;
    objc_msgSend(v30, sel_frame);
    objc_msgSend(v30, sel_setFrame_, v32);
    objc_msgSend(v30, sel_setAlpha_, 0.0);
    objc_msgSend(v30, sel_layoutIfNeeded);

    uint64_t v33 = self;
    int64_t v34 = (void *)swift_allocObject();
    v34[2] = v4;
    v34[3] = v24;
    v34[4] = v30;
    id v51 = sub_1E4CACCAC;
    unint64_t v52 = v34;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v48 = 1107296256;
    uint64_t v49 = sub_1E4C965F8;
    objc_super v50 = &block_descriptor_53;
    uint64_t v35 = _Block_copy(&aBlock);
    id v36 = v30;
    id v37 = v24;
    os_log_t v38 = v4;
    swift_release();
    uint64_t v39 = (void *)swift_allocObject();
    v39[2] = a3;
    v39[3] = a4;
    v39[4] = v38;
    id v51 = sub_1E4CACF4C;
    unint64_t v52 = v39;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v48 = 1107296256;
    uint64_t v49 = sub_1E4CA9050;
    objc_super v50 = &block_descriptor_59;
    id v40 = _Block_copy(&aBlock);
    uint64_t v41 = v38;
    sub_1E4C87964(a3);
    swift_release();
    objc_msgSend(v33, sel_animateWithDuration_animations_completion_, v35, v40, 0.6);
    _Block_release(v40);
    _Block_release(v35);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1E4CC4A40;
    *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v42 + 32) = 0xD000000000000065;
    *(void *)(v42 + 40) = 0x80000001E4CCEFF0;
    sub_1E4CBF710();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1E4CA9050(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1E4CA90A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v10 = objc_retain(*(id *)(*(void *)&v7[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  uint64_t v11 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v10, sel_setTitle_, v11);

  id v12 = objc_retain(*(id *)(*(void *)&v7[v9]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  id v13 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v12, sel_setDetailText_, v13);

  if (a6)
  {
    id v14 = objc_retain(*(id *)(*(void *)&v7[v9]
                            + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
    id v15 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v14, sel_setTitle_forState_, v15, 0);
  }
  double v16 = 0.0;
  if (a7) {
    double v16 = 1.0;
  }
  objc_msgSend(*(id *)(*(void *)&v7[v9]+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_setAlpha_, v16);
  id v17 = *(id *)&v7[v9];
  uint64_t v18 = sub_1E4CA7AA0();
  objc_msgSend(v7, sel_bounds);
  double v20 = -0.5;
  if (!v18) {
    double v20 = 0.5;
  }
  double v21 = v19 * v20;
  objc_msgSend(v17, sel_frame);
  objc_msgSend(v17, sel_setFrame_, v21);

  objc_msgSend(*(id *)&v7[v9], sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v7[v9], sel_layoutIfNeeded);
  id v22 = self;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v7;
  int64_t v34 = sub_1E4CAD724;
  uint64_t v35 = v23;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v31 = 1107296256;
  double v32 = sub_1E4C965F8;
  uint64_t v33 = &block_descriptor_89;
  id v24 = _Block_copy(&aBlock);
  uint64_t v25 = v7;
  swift_release();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  int64_t v34 = sub_1E4CAD8F8;
  uint64_t v35 = v26;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v31 = 1107296256;
  double v32 = sub_1E4CA9050;
  uint64_t v33 = &block_descriptor_95;
  double v27 = _Block_copy(&aBlock);
  double v28 = v25;
  swift_release();
  objc_msgSend(v22, sel_animateWithDuration_animations_completion_, v24, v27, 0.6);
  _Block_release(v27);
  _Block_release(v24);
}

void sub_1E4CA93E0(void **a1, void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  uint64_t v6 = *(void **)(*(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = self;
  id v9 = v6;
  id v10 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  uint64_t v11 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_, v11, 0xE000000000000000);

  id v12 = objc_retain(*(id *)(*(void *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  id v13 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4CBE8B0();

  id v14 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setDetailText_, v14, 0xE000000000000000);

  CGRect v45 = v4;
  objc_msgSend(*(id *)(*(void *)&v4[v5]+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_setAlpha_, 0.0);
  if (a1 && a2 && (id v15 = *a1, v16 = *a2, self, (v17 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v47 = v17;
    uint64_t v18 = *(void **)&v4[v5];
    id v19 = v15;
    id v49 = v16;
    id v20 = v18;
    uint64_t v21 = sub_1E4CA7AA0();
    objc_msgSend(v45, sel_bounds);
    double v23 = -0.5;
    if (!v21) {
      double v23 = 0.5;
    }
    double v24 = v22 * v23;
    objc_msgSend(v20, sel_frame);
    objc_msgSend(v20, sel_setFrame_, v24);

    objc_msgSend(*(id *)&v45[v5], sel_setAlpha_, 0.0);
    objc_msgSend(*(id *)&v45[v5], sel_layoutIfNeeded);
    uint64_t v25 = v19;
    id v26 = objc_msgSend(v19, sel_subviews);
    sub_1E4C7EA5C(0, &qword_1EAE8D858);
    unint64_t v27 = sub_1E4CBF2A0();

    if (v27 >> 62) {
      goto LABEL_21;
    }
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v28; uint64_t v28 = sub_1E4CBF650())
    {
      uint64_t v29 = 4;
      uint64_t v30 = 0;
      if ((v27 & 0xC000000000000001) != 0)
      {
LABEL_9:
        id v31 = (id)MEMORY[0x1E4E8A770](v30, v27);
        goto LABEL_11;
      }
      while (1)
      {
        id v31 = *(id *)(v27 + 8 * v29);
LABEL_11:
        double v32 = v31;
        if (__OFADD__(v30, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass()) {
          objc_msgSend(v32, sel_setAlpha_, 0.0);
        }

        if (v30 + 1 == v28) {
          goto LABEL_22;
        }
        uint64_t v30 = ++v29 - 4;
        if ((v27 & 0xC000000000000001) != 0) {
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
    }
LABEL_22:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v25, sel_layoutIfNeeded);
    int64_t v34 = self;
    uint64_t v35 = (void *)swift_allocObject();
    uint64_t v35[2] = v45;
    void v35[3] = v47;
    v35[4] = v25;
    uint64_t v54 = sub_1E4CAD164;
    int v55 = v35;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v51 = 1107296256;
    unint64_t v52 = sub_1E4C965F8;
    os_log_type_t v53 = &block_descriptor_71;
    id v36 = _Block_copy(&aBlock);
    id v37 = v25;
    id v38 = v49;
    uint64_t v39 = v45;
    swift_release();
    id v40 = (void *)swift_allocObject();
    v40[2] = a3;
    v40[3] = a4;
    v40[4] = v39;
    uint64_t v54 = sub_1E4CAD530;
    int v55 = v40;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v51 = 1107296256;
    unint64_t v52 = sub_1E4CA9050;
    os_log_type_t v53 = &block_descriptor_77;
    uint64_t v41 = _Block_copy(&aBlock);
    uint64_t v42 = v39;
    sub_1E4C87964(a3);
    swift_release();
    objc_msgSend(v34, sel_animateWithDuration_animations_completion_, v36, v41, 0.6);
    _Block_release(v41);
    _Block_release(v36);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1E4CC4A40;
    *(void *)(v33 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v33 + 32) = 0xD000000000000065;
    *(void *)(v33 + 40) = 0x80000001E4CCEFF0;
    sub_1E4CBF710();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1E4CA9A14(int a1)
{
  if (a1 == 6)
  {
    uint64_t v2 = *(void **)(*(void *)(v1
                              + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                  + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
    type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v4 = self;
    id v5 = v2;
    id v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v7 = sub_1E4CBE8B0();
    uint64_t v9 = v8;

    uint64_t v10 = sub_1E4CA7AA0();
    sub_1E4CAB134(v7, v9, v10);
  }
  else
  {
    type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
    uint64_t v11 = swift_getObjCClassFromMetadata();
    id v12 = self;
    id v13 = objc_msgSend(v12, sel_bundleForClass_, v11);
    uint64_t v14 = sub_1E4CBE8B0();
    uint64_t v16 = v15;

    id v17 = objc_msgSend(v12, sel_bundleForClass_, v11, 0xE000000000000000);
    uint64_t v18 = sub_1E4CBE8B0();
    uint64_t v20 = v19;

    sub_1E4CA90A4(v14, v16, v18, v20, 0, 0, 0);
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4CA9C64()
{
  uint64_t v1 = v0;
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_1E4CBE8B0();
  uint64_t v7 = v6;

  uint64_t v9 = (*(uint64_t (**)(uint64_t))(v1
                                          + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_budInEarStringBlock))(v8);
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }
  else
  {
    id v13 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    uint64_t v11 = sub_1E4CBE8B0();
    uint64_t v12 = v14;
  }
  sub_1E4CA90A4(v5, v7, v11, v12, 0, 0, 0);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4CA9E18()
{
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = sub_1E4CBE8B0();
  uint64_t v5 = v4;

  id v6 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v7 = sub_1E4CBE8B0();
  uint64_t v9 = v8;

  id v10 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v11 = sub_1E4CBE8B0();
  uint64_t v13 = v12;

  sub_1E4CA90A4(v3, v5, v7, v9, v11, v13, 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1E4CA9FF8(void *a1)
{
  id v2 = v1;
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1E4CC4DD0;
  id v6 = objc_msgSend(a1, sel_leadingAnchor);
  id v7 = objc_msgSend(v2, sel_leadingAnchor);
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(a1, sel_trailingAnchor);
  id v10 = objc_msgSend(v2, sel_trailingAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(a1, sel_topAnchor);
  id v13 = objc_msgSend(v2, sel_topAnchor);
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(a1, sel_bottomAnchor);
  id v16 = objc_msgSend(v2, sel_bottomAnchor);
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v5 + 56) = v17;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  id v18 = (id)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);
}

void type metadata accessor for HPSSpatialProfileV2EnrollmentStep(uint64_t a1)
{
}

id sub_1E4CAA28C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setLineBreakMode_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  id v1 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28F0]);
  objc_msgSend(v0, sel_setFont_, v1);

  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v2 = objc_msgSend(self, sel_systemGrayColor);
  objc_msgSend(v0, sel_setTextColor_, v2);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  return v0;
}

double sub_1E4CAA42C()
{
  id v1 = *(void **)(v0
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton);
  sub_1E4C7EA5C(0, &qword_1EAE8DDB8);
  unsigned int v2 = objc_msgSend(v1, sel_isKindOfClass_, swift_getObjCClassFromMetadata());
  id v3 = objc_msgSend(self, sel_currentDevice);
  uint64_t v4 = (void *)sub_1E4CBF1C0();
  int v5 = MGGetSInt32Answer();

  if (v5 < 0)
  {
    if (v2) {
      return 34.0;
    }
    return 24.0;
  }
  if (!v2) {
    return 24.0;
  }
  double result = 34.0;
  if (v5 == 2) {
    return 5.0;
  }
  return result;
}

id sub_1E4CAA55C()
{
  return sub_1E4CAB3E0(type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl);
}

void sub_1E4CAA65C()
{
}

id sub_1E4CAA6BC()
{
  return sub_1E4CAB3E0(type metadata accessor for HPSSpatialProfileSingleStepBottomContainer);
}

char *sub_1E4CAA734(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v70[4] = *(id *)MEMORY[0x1E4F143B8];
  swift_bridgeObjectRelease();
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel] = 0;
  id v6 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_1E4CBF1C0();
  v68.receiver = v4;
  v68.super_class = (Class)type metadata accessor for HPSHeaderView();
  id v8 = objc_msgSendSuper2(&v68, sel_initWithTitle_detailText_icon_, v6, v7, a4);

  id v9 = (char *)v8;
  uint64_t v10 = (uint64_t)objc_msgSend(v9, sel_subviews);
  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  uint64_t v11 = sub_1E4CBF2A0();

  v70[0] = (id)MEMORY[0x1E4FBC860];
  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0) {
      uint64_t v10 = v11;
    }
    else {
      uint64_t v10 = v11 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_3;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_28;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12) {
    goto LABEL_27;
  }
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_59;
  }
  for (uint64_t i = 0; i != v12; ++i)
  {
    if ((v11 & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x1E4E8A770](i, v11);
    }
    else {
      id v14 = *(id *)(v11 + 8 * i + 32);
    }
    id v15 = v14;
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (!v16)
    {

      continue;
    }
    id v17 = (void *)v16;
    id v18 = v15;
    id v19 = objc_msgSend(v17, sel_text);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_1E4CBF1F0();
      uint64_t v23 = v22;

      if (v21 == 0x64656C6961746564 && v23 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v25 = sub_1E4CBF6D0();
        swift_bridgeObjectRelease();

        if ((v25 & 1) == 0)
        {

          continue;
        }
      }
      sub_1E4CBF5E0();
      sub_1E4CBF610();
      sub_1E4CBF620();
      sub_1E4CBF5F0();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t)v70[0];
  if (((unint64_t)v70[0] & 0x8000000000000000) != 0)
  {
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1E4CBF650();
    swift_release();
    if (!v29) {
      goto LABEL_36;
    }
LABEL_30:
    if ((v10 & 0xC000000000000001) == 0)
    {
      if (!*(void *)(v10 + 16)) {
        __break(1u);
      }
      id v26 = *(id *)(v10 + 32);
LABEL_33:
      unint64_t v27 = v26;
      swift_release();
      self;
      uint64_t v28 = swift_dynamicCastObjCClass();
      if (!v28)
      {

        goto LABEL_37;
      }
      goto LABEL_38;
    }
LABEL_59:
    id v26 = (id)MEMORY[0x1E4E8A770](0, v10);
    goto LABEL_33;
  }
LABEL_28:
  if ((v10 & 0x4000000000000000) != 0) {
    goto LABEL_35;
  }
  if (*(void *)(v10 + 16)) {
    goto LABEL_30;
  }
LABEL_36:
  swift_release();
LABEL_37:
  uint64_t v28 = 0;
LABEL_38:
  uint64_t v30 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  id v31 = *(void **)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel];
  *(void *)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel] = v28;

  double v32 = self;
  v70[0] = *(id *)&v9[v30];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DDA8);
  uint64_t v33 = sub_1E4CBF500();
  v70[0] = 0;
  id v34 = objc_msgSend(v32, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v33, 0, v70);
  swift_unknownObjectRelease();
  id v35 = v70[0];
  if (!v34)
  {
    uint64_t v42 = v35;
    id v43 = (void *)sub_1E4CBE8C0();

    swift_willThrow();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_1E4CC4A40;
    *(void *)(v44 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v44 + 32) = 0xD00000000000003ELL;
    *(void *)(v44 + 40) = 0x80000001E4CCEE20;
    sub_1E4CBF710();
    swift_bridgeObjectRelease();

    return v9;
  }
  uint64_t v36 = sub_1E4CBE930();
  unint64_t v38 = v37;

  id v39 = objc_allocWithZone(MEMORY[0x1E4F28DC0]);
  sub_1E4CACBB8(v36, v38);
  id v40 = sub_1E4CACAF8();
  sub_1E4CACC10(v36, v38);
  if (!v40)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_1E4CC4A40;
    *(void *)(v41 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v41 + 32) = 0xD00000000000003DLL;
    *(void *)(v41 + 40) = 0x80000001E4CCEE60;
    sub_1E4CBF710();
LABEL_41:
    swift_bridgeObjectRelease();

    goto LABEL_42;
  }
  objc_msgSend(v40, sel_setRequiresSecureCoding_, 0);
  if (objc_msgSend(v40, sel_decodeObjectForKey_, *MEMORY[0x1E4F284E8]))
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v69, 0, sizeof(v69));
  }
  sub_1E4C81220((uint64_t)v69, (uint64_t)v70);
  if (!v70[3])
  {
    sub_1E4C898C8((uint64_t)v70);
    goto LABEL_57;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8DDB0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_57:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D890);
    uint64_t v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = xmmword_1E4CC4A40;
    *(void *)(v63 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v63 + 32) = 0xD000000000000049;
    *(void *)(v63 + 40) = 0x80000001E4CCEEA0;
    sub_1E4CBF710();

    goto LABEL_41;
  }
  unint64_t v66 = a4;
  CGRect v46 = *(void **)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  *(void *)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel] = v67;
  id v47 = v67;

  objc_msgSend(v47, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v47, sel_setAlpha_, 0.0);
  objc_msgSend(v9, sel_addSubview_, v47);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1E4CC4DD0;
  id v65 = v47;
  id v49 = objc_msgSend(v47, sel_leadingAnchor);
  double result = *(char **)&v9[v30];
  if (!result)
  {
    __break(1u);
    goto LABEL_62;
  }
  id v50 = objc_msgSend(result, sel_leadingAnchor);
  id v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  *(void *)(v48 + 32) = v51;
  id v52 = objc_msgSend(v65, sel_trailingAnchor);
  double result = *(char **)&v9[v30];
  if (!result)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  id v53 = objc_msgSend(result, sel_trailingAnchor);
  id v54 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v53);

  *(void *)(v48 + 40) = v54;
  id v55 = objc_msgSend(v65, sel_topAnchor);
  double result = *(char **)&v9[v30];
  if (!result)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  id v56 = objc_msgSend(result, sel_topAnchor);
  id v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v56);

  *(void *)(v48 + 48) = v57;
  double result = (char *)objc_msgSend(v65, sel_bottomAnchor);
  id v58 = *(void **)&v9[v30];
  if (!v58)
  {
LABEL_64:
    __break(1u);
    return result;
  }
  uint64_t v59 = result;
  id v64 = self;
  id v60 = objc_msgSend(v58, sel_bottomAnchor);
  id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

  *(void *)(v48 + 56) = v61;
  v70[0] = (id)v48;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  id v62 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v64, sel_activateConstraints_, v62);

LABEL_42:
  sub_1E4CACC10(v36, v38);
  return v9;
}

void sub_1E4CAB134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  id v6 = *(void **)&v3[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v7, sel_setText_, v8);

    id v9 = *(void **)&v3[v5];
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v3, sel_bounds);
      double v12 = -0.5;
      if (!a3) {
        double v12 = 0.5;
      }
      double v13 = v11 * v12;
      objc_msgSend(v10, sel_frame);
      objc_msgSend(v10, sel_setFrame_, v13);

      id v14 = *(void **)&v3[v5];
      if (v14)
      {
        objc_msgSend(v14, sel_setAlpha_, 0.0);
        id v15 = *(void **)&v3[v5];
        if (v15) {
          objc_msgSend(v15, sel_layoutIfNeeded);
        }
      }
    }
  }
  uint64_t v16 = self;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v3;
  *(void *)(v17 + 24) = a3;
  unint64_t v27 = sub_1E4CAC7F4;
  uint64_t v28 = v17;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 1107296256;
  char v25 = sub_1E4C965F8;
  id v26 = &block_descriptor_3;
  id v18 = _Block_copy(&v23);
  id v19 = v3;
  swift_release();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  unint64_t v27 = sub_1E4CACA2C;
  uint64_t v28 = v20;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 1107296256;
  char v25 = sub_1E4CA9050;
  id v26 = &block_descriptor_31;
  uint64_t v21 = _Block_copy(&v23);
  uint64_t v22 = v19;
  swift_release();
  objc_msgSend(v16, sel_animateWithDuration_animations_completion_, v18, v21, 0.6);
  _Block_release(v21);
  _Block_release(v18);
}

id sub_1E4CAB3C8()
{
  return sub_1E4CAB3E0(type metadata accessor for HPSHeaderView);
}

id sub_1E4CAB3E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void *sub_1E4CAB464@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1E4CAB474(void *a1@<X8>)
{
  *a1 = *v1;
}

char *sub_1E4CAB480()
{
  uint64_t v1 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  id v2 = objc_allocWithZone((Class)type metadata accessor for HPSHeaderView());
  objc_super v3 = v0;
  uint64_t v4 = (void *)sub_1E4CBF1C0();
  id v5 = objc_msgSend(v2, sel_initWithTitle_detailText_icon_, v4, 0, 0);

  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v1] = v5;
  uint64_t v6 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v3[v6] = v7;
  uint64_t v8 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView;
  *(void *)&v3[v8] = sub_1E4CAA28C();
  uint64_t v9 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v3[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  id v12 = objc_msgSend(self, sel_effectWithStyle_, 6);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v12);

  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setAlpha_, 0.0);
  *(void *)&v3[v11] = v13;
  uint64_t v14 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  id v15 = objc_msgSend(self, sel_boldButton);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v3[v14] = v15;
  uint64_t v16 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v3[v16] = v17;
  uint64_t v18 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v19, sel_setAxis_, 1);
  objc_msgSend(v19, sel_setAlignment_, 3);
  objc_msgSend(v19, sel_setDistribution_, 3);
  *(void *)&v3[v18] = v19;
  uint64_t v20 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1BE0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v3[v20] = v21;

  v122.receiver = v3;
  v122.super_class = (Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  uint64_t v22 = (char *)objc_msgSendSuper2(&v122, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v23 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  uint64_t v24 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView];
  objc_msgSend(v22, sel_addSubview_, v24);
  char v25 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView];
  uint64_t v26 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  objc_msgSend(v24, sel_addSubview_, v25);
  uint64_t v121 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  objc_msgSend(v25, sel_addArrangedSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView]);
  uint64_t v119 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  objc_msgSend(v25, sel_addArrangedSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst]);
  objc_msgSend(v25, sel_addArrangedSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView]);
  uint64_t v120 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  objc_msgSend(v25, sel_addArrangedSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond]);
  uint64_t v27 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  uint64_t v28 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray];
  uint64_t v117 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  objc_msgSend(v28, sel_addSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView]);
  uint64_t v116 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  objc_msgSend(v28, sel_addSubview_, *(void *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton]);
  objc_msgSend(v22, sel_addSubview_, v28);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1E4CC5980;
  id v30 = objc_msgSend(v24, sel_leadingAnchor);
  id v31 = objc_msgSend(v22, (SEL)&selRef_hideContinueButton + 2);
  id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(void *)(v29 + 32) = v32;
  id v33 = objc_msgSend(*(id *)&v22[v23], sel_trailingAnchor);
  id v34 = objc_msgSend(v22, (SEL)&selRef_showEarDistanceWarningContinueButton + 4);
  id v35 = objc_msgSend(v33, byte_1E6EA92EE, v34);

  *(void *)(v29 + 40) = v35;
  id v36 = objc_msgSend(*(id *)&v22[v23], sel_topAnchor);
  id v37 = objc_msgSend(v22, (SEL)&selRef_start + 3);
  id v38 = objc_msgSend(v36, byte_1E6EA92EE, v37);

  *(void *)(v29 + 48) = v38;
  id v39 = objc_msgSend(*(id *)&v22[v23], sel_bottomAnchor);
  id v40 = objc_msgSend(*(id *)&v22[v27], (SEL)&selRef_start + 3);
  id v41 = objc_msgSend(v39, byte_1E6EA92EE, v40);

  *(void *)(v29 + 56) = v41;
  id v42 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  id v43 = objc_msgSend(v22, sel_leadingAnchor);
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_constant_, v43, 24.0);

  *(void *)(v29 + 64) = v44;
  id v45 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  id v46 = objc_msgSend(v22, sel_trailingAnchor);
  id v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_constant_, v46, -24.0);

  *(void *)(v29 + 72) = v47;
  id v48 = objc_msgSend(*(id *)&v22[v26], (SEL)&selRef_start + 3);
  id v49 = objc_msgSend(*(id *)&v22[v23], (SEL)&selRef_start + 3);
  id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v49, 24.0);

  *(void *)(v29 + 80) = v50;
  id v51 = objc_msgSend(*(id *)&v22[v26], sel_bottomAnchor);
  id v52 = objc_msgSend(*(id *)&v22[v23], sel_bottomAnchor);
  id v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v52);

  *(void *)(v29 + 88) = v53;
  id v54 = objc_msgSend(*(id *)&v22[v116], sel_leadingAnchor);
  id v55 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  id v56 = objc_msgSend(v54, sel_constraintEqualToAnchor_constant_, v55, 24.0);

  *(void *)(v29 + 96) = v56;
  id v57 = objc_msgSend(*(id *)&v22[v116], sel_trailingAnchor);
  id v58 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  id v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, -24.0);

  *(void *)(v29 + 104) = v59;
  id v60 = objc_msgSend(*(id *)&v22[v116], (SEL)&_OBJC_LABEL_PROTOCOL___UIScrollViewDelegate + 5);
  id v61 = objc_msgSend(*(id *)&v22[v27], (SEL)&_OBJC_LABEL_PROTOCOL___UIScrollViewDelegate + 5);
  id v62 = objc_msgSend(self, sel_currentDevice);
  uint64_t v63 = (void *)sub_1E4CBF1C0();
  int v64 = MGGetSInt32Answer();

  if (v64 == 2) {
    double v65 = 89.0;
  }
  else {
    double v65 = 60.0;
  }
  id v118 = self;
  if (v64 >= 0) {
    double v66 = v65;
  }
  else {
    double v66 = 60.0;
  }
  id v67 = objc_msgSend(v60, sel_constraintEqualToAnchor_constant_, v61, -v66);

  *(void *)(v29 + 112) = v67;
  id v68 = objc_msgSend(*(id *)&v22[v117], sel_topAnchor);
  id v69 = objc_msgSend(*(id *)&v22[v27], sel_topAnchor);
  id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_, v69);

  *(void *)(v29 + 120) = v70;
  id v71 = objc_msgSend(*(id *)&v22[v117], sel_topAnchor);
  id v72 = objc_msgSend(*(id *)&v22[v116], sel_topAnchor);
  id v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v72, -sub_1E4CAA42C());

  *(void *)(v29 + 128) = v73;
  id v74 = objc_msgSend(*(id *)&v22[v117], sel_trailingAnchor);
  id v75 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  id v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(void *)(v29 + 136) = v76;
  id v77 = objc_msgSend(*(id *)&v22[v117], sel_leadingAnchor);
  id v78 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  id v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_, v78);

  *(void *)(v29 + 144) = v79;
  id v80 = objc_msgSend(*(id *)&v22[v117], sel_bottomAnchor);
  id v81 = objc_msgSend(*(id *)&v22[v27], sel_bottomAnchor);
  id v82 = objc_msgSend(v80, sel_constraintEqualToAnchor_, v81);

  *(void *)(v29 + 152) = v82;
  id v83 = objc_msgSend(*(id *)&v22[v119], sel_leadingAnchor);
  id v84 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  id v85 = objc_msgSend(v83, byte_1E6EA92EE, v84);

  *(void *)(v29 + 160) = v85;
  id v86 = objc_msgSend(*(id *)&v22[v119], sel_trailingAnchor);
  id v87 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  id v88 = objc_msgSend(v86, byte_1E6EA92EE, v87);

  *(void *)(v29 + 168) = v88;
  id v89 = objc_msgSend(*(id *)&v22[v119], sel_heightAnchor);
  id v90 = objc_msgSend(v89, sel_constraintEqualToConstant_, 24.0);

  *(void *)(v29 + 176) = v90;
  id v91 = objc_msgSend(*(id *)&v22[v120], sel_leadingAnchor);
  id v92 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  id v93 = objc_msgSend(v91, byte_1E6EA92EE, v92);

  *(void *)(v29 + 184) = v93;
  id v94 = objc_msgSend(*(id *)&v22[v120], sel_trailingAnchor);
  id v95 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  id v96 = objc_msgSend(v94, byte_1E6EA92EE, v95);

  *(void *)(v29 + 192) = v96;
  id v97 = objc_msgSend(*(id *)&v22[v120], sel_heightAnchor);
  id v98 = objc_msgSend(v97, sel_constraintEqualToConstant_, 24.0);

  *(void *)(v29 + 200) = v98;
  id v99 = objc_msgSend(*(id *)&v22[v121], sel_leadingAnchor);
  id v100 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  id v101 = objc_msgSend(v99, byte_1E6EA92EE, v100);

  *(void *)(v29 + 208) = v101;
  id v102 = objc_msgSend(*(id *)&v22[v121], sel_trailingAnchor);
  id v103 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  id v104 = objc_msgSend(v102, byte_1E6EA92EE, v103);

  *(void *)(v29 + 216) = v104;
  id v105 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  id v106 = objc_msgSend(v22, sel_leadingAnchor);
  id v107 = objc_msgSend(v105, byte_1E6EA92EE, v106);

  *(void *)(v29 + 224) = v107;
  id v108 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  id v109 = objc_msgSend(v22, sel_trailingAnchor);
  id v110 = objc_msgSend(v108, byte_1E6EA92EE, v109);

  *(void *)(v29 + 232) = v110;
  id v111 = objc_msgSend(*(id *)&v22[v27], sel_bottomAnchor);
  id v112 = objc_msgSend(v22, sel_bottomAnchor);
  id v113 = objc_msgSend(v111, byte_1E6EA92EE, v112);

  *(void *)(v29 + 240) = v113;
  sub_1E4CBF2C0();
  sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
  uint64_t v114 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v118, sel_activateConstraints_, v114);

  return v22;
}

void sub_1E4CAC394()
{
  uint64_t v1 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  id v2 = objc_allocWithZone((Class)type metadata accessor for HPSHeaderView());
  objc_super v3 = (void *)sub_1E4CBF1C0();
  id v4 = objc_msgSend(v2, sel_initWithTitle_detailText_icon_, v3, 0, 0);

  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v1] = v4;
  uint64_t v5 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v5] = v6;
  uint64_t v7 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView;
  *(void *)&v0[v7] = sub_1E4CAA28C();
  uint64_t v8 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v8] = v9;
  uint64_t v10 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  id v11 = objc_msgSend(self, sel_effectWithStyle_, 6);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v11);

  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v12, sel_setAlpha_, 0.0);
  *(void *)&v0[v10] = v12;
  uint64_t v13 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  id v14 = objc_msgSend(self, sel_boldButton);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v15] = v16;
  uint64_t v17 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v18, sel_setAxis_, 1);
  objc_msgSend(v18, sel_setAlignment_, 3);
  objc_msgSend(v18, sel_setDistribution_, 3);
  *(void *)&v0[v17] = v18;
  uint64_t v19 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1BE0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v0[v19] = v20;

  sub_1E4CBF640();
  __break(1u);
}

void sub_1E4CAC6A4()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v2 = (objc_class *)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v4 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection];
  *(void *)id v4 = 0;
  unsigned char v4[8] = 1;

  sub_1E4CBF640();
  __break(1u);
}

uint64_t type metadata accessor for HPSHeaderView()
{
  return self;
}

void type metadata accessor for UITraitEnvironmentLayoutDirection(uint64_t a1)
{
}

uint64_t sub_1E4CAC7BC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4CAC7F4()
{
  uint64_t v1 = *(char **)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel];
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 24);
    id v5 = v3;
    objc_msgSend(v1, sel_bounds);
    double v7 = 0.5;
    if (!v4) {
      double v7 = -0.5;
    }
    double v8 = v7 * v6;
    objc_msgSend(v5, sel_frame);
    objc_msgSend(v5, sel_setFrame_, v8);

    id v9 = *(void **)&v1[v2];
    if (v9)
    {
      objc_msgSend(v9, sel_setAlpha_, 0.0);
      uint64_t v10 = *(void **)&v1[v2];
      if (v10) {
        objc_msgSend(v10, sel_layoutIfNeeded);
      }
    }
  }
  uint64_t v11 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  id v12 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v13, sel_frame);
    objc_msgSend(v13, sel_setFrame_, 0.0);

    id v14 = *(void **)&v1[v11];
    if (v14) {
      objc_msgSend(v14, sel_layoutIfNeeded);
    }
  }
  uint64_t v15 = self;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v1;
  void v19[4] = sub_1E4CACA8C;
  v19[5] = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  _OWORD v19[2] = sub_1E4C965F8;
  v19[3] = &block_descriptor_37;
  uint64_t v17 = _Block_copy(v19);
  id v18 = v1;
  swift_release();
  objc_msgSend(v15, sel_animateWithDuration_delay_options_animations_completion_, 0, v17, 0, 0.2, 0.2);
  _Block_release(v17);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1E4CAC9F4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4CACA2C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel);
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  uint64_t v4 = *(void **)(v1
                + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel);
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel) = v4;
  id v6 = *(id *)(v1 + v3);
  *(void *)(v1 + v3) = v2;
  id v5 = v4;
}

id sub_1E4CACA8C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  id result = *(id *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel);
  if (result)
  {
    objc_msgSend(result, sel_setAlpha_, 1.0);
    id result = *(id *)(v1 + v2);
    if (result)
    {
      return objc_msgSend(result, sel_layoutIfNeeded);
    }
  }
  return result;
}

id sub_1E4CACAF8()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)sub_1E4CBE920();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_1E4CBE8C0();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1E4CACBB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1E4CACC10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1E4CACC68()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4CACCA0()
{
  return sub_1E4CA7E80(*(void *)(v0 + 16));
}

void sub_1E4CACCAC()
{
  id v2 = (char *)v0[2];
  uint64_t v1 = (void *)v0[3];
  id v3 = (void *)v0[4];
  id v4 = *(id *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  id v5 = v1;
  uint64_t v6 = sub_1E4CA7AA0();
  objc_msgSend(v2, sel_bounds);
  if (v6) {
    double v8 = 0.5;
  }
  else {
    double v8 = -0.5;
  }
  double v9 = v8 * v7;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v4, sel_setFrame_, v9);
  objc_msgSend(v4, sel_setAlpha_, 0.0);
  objc_msgSend(v4, sel_layoutIfNeeded);

  if (*(void *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection]) {
    double v10 = 0.5;
  }
  else {
    double v10 = -0.5;
  }
  id v11 = v5;
  objc_msgSend(v2, sel_bounds);
  double v13 = v10 * v12;
  objc_msgSend(v11, sel_frame);
  objc_msgSend(v11, sel_setFrame_, v13);
  objc_msgSend(v11, sel_setAlpha_, 0.0);
  objc_msgSend(v11, sel_layoutIfNeeded);

  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, 0.0);
  objc_msgSend(v3, sel_layoutIfNeeded);
  uint64_t v14 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v15 = *(id *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v15, sel_frame);
  objc_msgSend(v15, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v2[v14], sel_layoutIfNeeded);
  uint64_t v16 = self;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v3;
  *(void *)(v17 + 24) = v2;
  v21[4] = sub_1E4CAD09C;
  v21[5] = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 1107296256;
  v21[2] = sub_1E4C965F8;
  v21[3] = &block_descriptor_65;
  id v18 = _Block_copy(v21);
  id v19 = v3;
  id v20 = v2;
  swift_release();
  objc_msgSend(v16, sel_animateWithDuration_delay_options_animations_completion_, 0, v18, 0, 0.2, 0.2);
  _Block_release(v18);
}

void sub_1E4CACF4C()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  id v2 = *(void **)(v0 + 32);
  if (v1) {
    v1();
  }
  id v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xB0))();
  objc_msgSend(v4, sel_removeFromSuperview);

  id v5 = (void *)(*(uint64_t (**)(void))((*v3 & *v2) + 0xB8))();
  objc_msgSend(v5, sel_removeFromSuperview);

  uint64_t v6 = *(void *)((char *)v2
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  uint64_t v7 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  double v8 = *(void **)((char *)v2
                + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(void *)((char *)v2
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v8;
  id v10 = *(id *)((char *)v2 + v7);
  *(void *)((char *)v2 + v7) = v6;
  id v9 = v8;
}

uint64_t sub_1E4CAD05C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1E4CAD09C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  objc_msgSend(v1, sel_setAlpha_, 1.0);
  objc_msgSend(v1, sel_layoutIfNeeded);
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  id v4 = *(void **)(v2 + v3);

  return objc_msgSend(v4, sel_layoutIfNeeded);
}

uint64_t objectdestroy_49Tm()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1E4CAD164()
{
  uint64_t v1 = (char *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v29 = (void *)v0[4];
  id v3 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  id v4 = v2;
  uint64_t v5 = sub_1E4CA7AA0();
  objc_msgSend(v1, sel_bounds);
  double v7 = 0.5;
  if (!v5) {
    double v7 = -0.5;
  }
  double v8 = v7 * v6;
  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  uint64_t v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v8);
  if (sub_1E4CBF470())
  {
    objc_msgSend(v4, sel_setAlpha_, 0.0);
    id v10 = objc_msgSend(v4, sel_playerLayer);
    id v11 = v10;
    if (*(void *)&v1[v9]) {
      double v12 = 100.0;
    }
    else {
      double v12 = -100.0;
    }
    objc_msgSend(v10, sel_frame);
    objc_msgSend(v11, sel_setFrame_, v12);
  }
  else
  {
    objc_msgSend(v3, sel_setAlpha_, 0.0);
  }
  objc_msgSend(v3, sel_layoutIfNeeded);

  uint64_t v13 = *(void *)&v1[v9];
  id v14 = v4;
  objc_msgSend(v1, sel_bounds);
  double v16 = 0.5;
  if (!v13) {
    double v16 = -0.5;
  }
  double v17 = v16 * v15;
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_, v17);
  char v18 = sub_1E4CBF470();
  objc_msgSend(v14, sel_setAlpha_, 0.0);
  if (v18)
  {
    id v19 = objc_msgSend(v14, (SEL)&selRef_hearingAidSupport);
    id v20 = v19;
    if (*(void *)&v1[v9]) {
      double v21 = 100.0;
    }
    else {
      double v21 = -100.0;
    }
    objc_msgSend(v19, sel_frame);
    objc_msgSend(v20, sel_setFrame_, v21);
  }
  objc_msgSend(v14, sel_layoutIfNeeded);

  uint64_t v22 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v23 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v23, sel_frame);
  objc_msgSend(v23, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v1[v22], sel_layoutIfNeeded);
  uint64_t v24 = self;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v1;
  *(void *)(v25 + 24) = v29;
  aBlock[4] = sub_1E4CAD5AC;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E4C965F8;
  aBlock[3] = &block_descriptor_83;
  uint64_t v26 = _Block_copy(aBlock);
  uint64_t v27 = v1;
  id v28 = v29;
  swift_release();
  objc_msgSend(v24, sel_animateWithDuration_delay_options_animations_completion_, 0, v26, 0, 0.2, 0.2);
  _Block_release(v26);
}

uint64_t objectdestroy_55Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1E4CAD530()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  if (v1) {
    v1();
  }
  uint64_t v3 = *(void *)(v2
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  uint64_t v4 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(void *)(v2
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v5;
  id v7 = *(id *)(v2 + v4);
  *(void *)(v2 + v4) = v3;
  id v6 = v5;
}

uint64_t sub_1E4CAD5AC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  objc_msgSend(*(id *)(v2 + v3), sel_layoutIfNeeded);
  id v4 = objc_msgSend(v1, sel_subviews);
  sub_1E4C7EA5C(0, &qword_1EAE8D858);
  unint64_t v5 = sub_1E4CBF2A0();

  if (v5 >> 62) {
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1E4CBF650())
  {
    uint64_t v7 = 4;
    uint64_t v8 = 0;
    if ((v5 & 0xC000000000000001) != 0)
    {
LABEL_4:
      id v9 = (id)MEMORY[0x1E4E8A770](v8, v5);
      goto LABEL_6;
    }
    while (1)
    {
      id v9 = *(id *)(v5 + 8 * v7);
LABEL_6:
      id v10 = v9;
      BOOL v11 = __OFADD__(v8, 1);
      uint64_t v12 = v8 + 1;
      if (v11) {
        break;
      }
      self;
      if (!swift_dynamicCastObjCClass()) {
        objc_msgSend(v10, sel_setAlpha_, 1.0);
      }

      if (v12 == v6) {
        return swift_bridgeObjectRelease_n();
      }
      uint64_t v8 = ++v7 - 4;
      if ((v5 & 0xC000000000000001) != 0) {
        goto LABEL_4;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_1E4CAD724()
{
  uint64_t v1 = *(char **)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  id v3 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  uint64_t v4 = sub_1E4CA7AA0();
  objc_msgSend(v1, sel_bounds);
  double v6 = 0.5;
  if (!v4) {
    double v6 = -0.5;
  }
  double v7 = v6 * v5;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v7);

  objc_msgSend(*(id *)&v1[v2], sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v1[v2], sel_layoutIfNeeded);
  uint64_t v8 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  id v9 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v9, sel_frame);
  objc_msgSend(v9, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v1[v8], sel_layoutIfNeeded);
  id v10 = self;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  unsigned char v14[4] = sub_1E4CAD958;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1E4C965F8;
  v14[3] = &block_descriptor_101;
  uint64_t v12 = _Block_copy(v14);
  uint64_t v13 = v1;
  swift_release();
  objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v12, 0, 0.2, 0.2);
  _Block_release(v12);
}

void sub_1E4CAD8F8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v4;
  id v6 = *(id *)(v1 + v3);
  *(void *)(v1 + v3) = v2;
  id v5 = v4;
}

id sub_1E4CAD958()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  uint64_t v3 = *(void **)(v1 + v2);

  return objc_msgSend(v3, sel_layoutIfNeeded);
}

uint64_t sub_1E4CADA24()
{
  uint64_t v0 = sub_1E4CBEEB0();
  __swift_allocate_value_buffer(v0, qword_1EAE90168);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90168);
  return sub_1E4CBEEA0();
}

uint64_t sub_1E4CADAA8()
{
  if (qword_1EAE8F220 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4CBEEB0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE90168);
}

uint64_t sub_1E4CADB0C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8F220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE90168);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void sub_1E4CADBB4()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_text);
  if (v2)
  {

    uint64_t v3 = &v0[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange];
    if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange
                      + 8])
    {
      uint64_t v4 = self;
      id v5 = objc_msgSend(v4, sel_appearance);
      id v6 = objc_msgSend(v5, sel_altTextColor);

      id v50 = v6;
      if (!v6) {
        id v50 = (id)PreferencesTableViewFooterColor();
      }
      id v7 = objc_msgSend(v4, sel_appearance);
      id v8 = objc_msgSend(v7, sel_footerHyperlinkColor);

      if (!v8) {
        id v8 = objc_msgSend(self, sel_systemBlueColor);
      }
      id v9 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier];
      uint64_t v10 = *MEMORY[0x1E4F93160];
      if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x1E4F93160]))
      {
        id v48 = v8;
        id v49 = v3;
        sub_1E4CBF550();
        swift_unknownObjectRelease();
        sub_1E4C7F6AC(v51, v52);
        swift_dynamicCast();
        uint64_t v11 = (void *)sub_1E4CBF1C0();
        swift_bridgeObjectRelease();
        id v47 = objc_msgSend(v11, sel_length);

        if (objc_msgSend(v9, sel_propertyForKey_, v10))
        {
          sub_1E4CBF550();
          swift_unknownObjectRelease();
          sub_1E4C7F6AC(v51, v52);
          swift_dynamicCast();
          id v12 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
          uint64_t v13 = (void *)sub_1E4CBF1C0();
          swift_bridgeObjectRelease();
          id v14 = objc_msgSend(v12, sel_initWithString_, v13);

          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DE90);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_1E4CC48E0;
          double v16 = (void *)*MEMORY[0x1E4FB0700];
          *(void *)(inited + 32) = *MEMORY[0x1E4FB0700];
          id v17 = v14;
          id v18 = v16;
          id v19 = objc_msgSend(v1, sel__accessibilityHigherContrastTintColorForColor_, v50);
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DE98);
          *(void *)(inited + 40) = v19;
          double v21 = (void *)*MEMORY[0x1E4FB06F8];
          *(void *)(inited + 64) = v20;
          *(void *)(inited + 72) = v21;
          id v22 = v21;
          id v23 = v1;
          id v24 = (id)PreferencesTableViewFooterFont();
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DEA0);
          *(void *)(inited + 104) = v25;
          *(void *)(inited + 80) = v24;
          sub_1E4C7DF1C(inited);
          type metadata accessor for Key(0);
          sub_1E4CB0C28(&qword_1EAE8D778);
          uint64_t v26 = (void *)sub_1E4CBF180();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_addAttributes_range_, v26, 0, v47);

          uint64_t v27 = swift_initStackObject();
          *(_OWORD *)(v27 + 16) = xmmword_1E4CC5B20;
          *(void *)(v27 + 32) = v18;
          id v28 = v18;
          *(void *)(v27 + 40) = objc_msgSend(v23, sel__accessibilityHigherContrastTintColorForColor_, v48);
          *(void *)(v27 + 64) = v20;
          *(void *)(v27 + 72) = v22;
          id v29 = v22;
          id v30 = (id)PreferencesTableViewFooterFont();
          id v31 = (void **)MEMORY[0x1E4FB0720];
          *(void *)(v27 + 80) = v30;
          id v32 = *v31;
          *(void *)(v27 + 104) = v25;
          *(void *)(v27 + 112) = v32;
          id v33 = objc_allocWithZone(MEMORY[0x1E4F1CB10]);
          id v34 = v32;
          id v35 = (void *)sub_1E4CBF1C0();
          id v36 = objc_msgSend(v33, sel_initWithString_, v35);

          uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DEB0);
          *(void *)(v27 + 120) = v36;
          id v38 = (void *)*MEMORY[0x1E4FB0808];
          *(void *)(v27 + 144) = v37;
          *(void *)(v27 + 152) = v38;
          uint64_t v39 = sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8DA38);
          id v40 = v38;
          uint64_t v41 = sub_1E4CBF460();
          *(void *)(v27 + 184) = v39;
          *(void *)(v27 + 160) = v41;
          sub_1E4C7DF1C(v27);
          id v42 = (void *)sub_1E4CBF180();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_addAttributes_range_, v42, *(void *)v49, *((void *)v49 + 1));

          uint64_t v43 = swift_initStackObject();
          *(_OWORD *)(v43 + 16) = xmmword_1E4CC4A40;
          *(void *)(v43 + 32) = v28;
          id v44 = v28;
          id v45 = objc_msgSend(v23, sel__accessibilityHigherContrastTintColorForColor_, v48);
          *(void *)(v43 + 64) = v20;
          *(void *)(v43 + 40) = v45;
          sub_1E4C7DF1C(v43);
          id v46 = (void *)sub_1E4CBF180();
          swift_bridgeObjectRelease();
          objc_msgSend(v23, sel_setLinkTextAttributes_, v46);

          objc_msgSend(v23, sel_setAttributedText_, v17);
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
}

id sub_1E4CAE188()
{
  return sub_1E4CAE3F4(MEMORY[0x1E4F93160]);
}

id sub_1E4CAE194()
{
  id result = objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *MEMORY[0x1E4F93158]);
  if (result)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
    sub_1E4C7F6AC(&v6, &v7);
    sub_1E4C7EA5C(0, &qword_1EAE8DE88);
    swift_dynamicCast();
    id v2 = objc_msgSend(v5, sel_nonretainedObjectValue);

    if (v2)
    {
      sub_1E4CBF550();
      swift_unknownObjectRelease();
      sub_1E4C7F6AC(&v3, v4);
    }
    else
    {
      memset(v4, 0, sizeof(v4));
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DDD0);
    if (swift_dynamicCast()) {
      return (id)v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E4CAE348()
{
  id result = objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *MEMORY[0x1E4F93148]);
  if (result)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
    sub_1E4C7F6AC(&v3, &v4);
    swift_dynamicCast();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E4CAE3E8()
{
  return sub_1E4CAE3F4(MEMORY[0x1E4F93150]);
}

id sub_1E4CAE3F4(void *a1)
{
  id result = objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *a1);
  if (result)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
    sub_1E4C7F6AC(&v4, &v5);
    swift_dynamicCast();
    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E4CAE770()
{
  return sub_1E4CB0070(type metadata accessor for MultiLinkableTextView);
}

void *sub_1E4CAE798()
{
  return &unk_1E6EA92F0;
}

unint64_t sub_1E4CAE7A4()
{
  return 0xD000000000000014;
}

void *sub_1E4CAE800()
{
  return &unk_1E6EA9300;
}

unint64_t sub_1E4CAE80C()
{
  return 0xD000000000000014;
}

void *sub_1E4CAE868()
{
  return &unk_1E6EA9310;
}

unint64_t sub_1E4CAE874()
{
  return 0xD000000000000014;
}

void *sub_1E4CAE8D0()
{
  return &unk_1E6EA9320;
}

unint64_t sub_1E4CAE8DC()
{
  return 0xD000000000000013;
}

void *sub_1E4CAE938()
{
  return &unk_1E6EA9330;
}

unint64_t sub_1E4CAE944()
{
  return 0xD000000000000014;
}

uint64_t variable initialization expression of MultiLinkableFooterView.heightConstraints()
{
  return MEMORY[0x1E4FBC860];
}

id sub_1E4CAE9AC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container);
  if (v1)
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container);
LABEL_14:
    id v41 = v1;
    return v2;
  }
  uint64_t v42 = OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  objc_msgSend(v3, sel_setAlignment_, 1);
  objc_msgSend(v3, sel_setAxis_, 1);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v43 = v0;
  unint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_backingStore);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain_n();
    id result = (id)sub_1E4CBF650();
    uint64_t v5 = (uint64_t)result;
    if (result) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v3, sel_setSpacing_, 5.0);
    id v40 = *(void **)(v43 + v42);
    *(void *)(v43 + v42) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id result = (id)swift_bridgeObjectRetain_n();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v48 = v4 & 0xC000000000000001;
    double v8 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    uint64_t v46 = *MEMORY[0x1E4F93150];
    uint64_t v47 = *MEMORY[0x1E4F93160];
    uint64_t v44 = v5;
    unint64_t v45 = v4;
    while (1)
    {
      id v12 = v48 ? (id)MEMORY[0x1E4E8A770](v7, v4) : *(id *)(v4 + 8 * v7 + 32);
      uint64_t v13 = v12;
      id v14 = (objc_class *)type metadata accessor for MultiLinkableTextView();
      double v15 = (char *)objc_allocWithZone(v14);
      id v16 = v13;
      id v17 = &v15[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange];
      *(void *)id v17 = 0;
      *((void *)v17 + 1) = 0;
      *(void *)&v15[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier] = v16;
      v52.receiver = v15;
      v52.super_class = v14;
      id v18 = v16;
      id v19 = objc_msgSendSuper2(&v52, sel_initWithFrame_textContainer_, 0, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v19, sel_setDelegate_, v19);
      objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      uint64_t v20 = self;
      double v21 = (char *)v19;
      id v22 = objc_msgSend(v20, sel_clearColor);
      objc_msgSend(v21, sel_setBackgroundColor_, v22);

      objc_msgSend(v21, sel_setShowsVerticalScrollIndicator_, 0);
      objc_msgSend(v21, sel_setSelectable_, 1);
      objc_msgSend(v21, sel_setEditable_, 0);
      id v23 = objc_msgSend(v21, sel_textContainer);
      objc_msgSend(v23, sel_setLineFragmentPadding_, 0.0);

      objc_msgSend(v21, sel_setTextContainerInset_, v8, v9, v10, v11);
      objc_msgSend(v21, sel_setScrollEnabled_, 0);
      LODWORD(v24) = 1148846080;
      objc_msgSend(v21, sel_setContentCompressionResistancePriority_forAxis_, 1, v24);
      objc_msgSend(v21, sel__setInteractiveTextSelectionDisabled_, 1);
      uint64_t v25 = OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier;
      uint64_t v26 = *(void **)&v21[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier];
      id v27 = v18;
      id result = objc_msgSend(v26, sel_propertyForKey_, v47);
      if (!result) {
        break;
      }
      sub_1E4CBF550();
      swift_unknownObjectRelease();
      sub_1E4C7F6AC(v50, v51);
      swift_dynamicCast();
      id v28 = (void *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setText_, v28);

      id result = objc_msgSend(*(id *)&v21[v25], sel_propertyForKey_, v46);
      if (!result) {
        goto LABEL_19;
      }
      sub_1E4CBF550();
      swift_unknownObjectRelease();
      sub_1E4C7F6AC(v50, v51);
      swift_dynamicCast();
      id v29 = (NSString *)sub_1E4CBF1C0();
      swift_bridgeObjectRelease();
      NSRange v30 = NSRangeFromString(v29);

      *(NSRange *)&v21[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange] = v30;
      sub_1E4CADBB4();

      objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(v3, sel_addArrangedSubview_, v21);
      id v49 = self;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_1E4CC5460;
      id v32 = objc_msgSend(v3, sel_leadingAnchor);
      id v33 = objc_msgSend(v21, sel_leadingAnchor);
      uint64_t v34 = v7 + 1;
      id v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

      *(void *)(v31 + 32) = v35;
      id v36 = objc_msgSend(v3, sel_trailingAnchor);
      id v37 = objc_msgSend(v21, sel_trailingAnchor);
      id v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v37);

      *(void *)(v31 + 40) = v38;
      uint64_t v7 = v34;
      v51[0].receiver = (id)v31;
      sub_1E4CBF2C0();
      sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
      uint64_t v39 = (void *)sub_1E4CBF290();
      swift_bridgeObjectRelease();
      objc_msgSend(v49, sel_activateConstraints_, v39);

      unint64_t v4 = v45;
      if (v44 == v7) {
        goto LABEL_13;
      }
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of MultiLinkableFooterView.$__lazy_storage_$_container()
{
  return 0;
}

id MultiLinkableFooterView.__allocating_init(specifier:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MultiLinkableFooterView.init(specifier:)(a1);
}

id MultiLinkableFooterView.init(specifier:)(void *a1)
{
  *(void *)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints) = MEMORY[0x1E4FBC860];
  unint64_t v7 = OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container;
  *(void *)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container) = 0;
  if (!a1)
  {
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v8 = v2;
  long long v6 = a1;
  id v3 = (char *)(id)v2;
  if (objc_msgSend(v6, sel_userInfo))
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v69, 0, sizeof(v69));
  }
  sub_1E4C81220((uint64_t)v69, (uint64_t)v70);
  if (!v70[3])
  {
    sub_1E4C898C8((uint64_t)v70);
    goto LABEL_28;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DDE0);
  if (swift_dynamicCast())
  {
    if (*(void *)(v68 + 16))
    {
      unint64_t v9 = sub_1E4C838F4(0xD000000000000014, 0x80000001E4CCF100);
      if (v10)
      {
        v70[0] = *(void *)(*(void *)(v68 + 56) + 8 * v9);
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DDE8);
        if (swift_dynamicCast())
        {
          unint64_t v4 = *(void **)&v69[0];
          if (*(void *)(v68 + 16))
          {
            unint64_t v11 = sub_1E4C838F4(0xD000000000000014, 0x80000001E4CCF120);
            if (v12)
            {
              v70[0] = *(void *)(*(void *)(v68 + 56) + 8 * v11);
              swift_unknownObjectRetain();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DDF0);
              if (swift_dynamicCast())
              {
                unint64_t v65 = v7;
                unint64_t v7 = *(void *)&v69[0];
                if (*(void *)(v68 + 16)
                  && (unint64_t v13 = sub_1E4C838F4(0xD000000000000014, 0x80000001E4CCF140), (v14 & 1) != 0))
                {
                  v70[0] = *(void *)(*(void *)(v68 + 56) + 8 * v13);
                  swift_unknownObjectRetain();
                  if ((swift_dynamicCast() & 1) == 0)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    goto LABEL_38;
                  }
                  uint64_t v5 = *(void **)&v69[0];
                  if (*(void *)(v68 + 16))
                  {
                    unint64_t v15 = sub_1E4C838F4(0xD000000000000013, 0x80000001E4CCF160);
                    if (v16)
                    {
                      unint64_t v64 = v2;
                      uint64_t v17 = *(void *)(*(void *)(v68 + 56) + 8 * v15);
                      swift_unknownObjectRetain();
                      swift_bridgeObjectRelease();
                      v70[0] = v17;
                      if ((swift_dynamicCast() & 1) == 0)
                      {
LABEL_44:
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
LABEL_45:
                        unint64_t v8 = v64;
                        unint64_t v7 = v65;
                        goto LABEL_28;
                      }
                      unint64_t v2 = *(void *)&v69[0];
                      uint64_t v1 = v4[2];
                      if (!(v7 >> 62))
                      {
                        if (v1 == *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                          goto LABEL_21;
                        }
                        goto LABEL_43;
                      }
LABEL_42:
                      swift_bridgeObjectRetain();
                      uint64_t v62 = sub_1E4CBF650();
                      swift_bridgeObjectRelease();
                      if (v1 == v62)
                      {
LABEL_21:
                        if (v1 == v5[2])
                        {
                          if (v2 >> 62)
                          {
                            swift_bridgeObjectRetain();
                            uint64_t v63 = sub_1E4CBF650();
                            swift_bridgeObjectRelease();
                            if (v1 == v63) {
                              goto LABEL_24;
                            }
                          }
                          else if (v1 == *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
                          {
LABEL_24:
                            uint64_t v18 = sub_1E4CB0104(v4, v7, v5, v2);
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            uint64_t v19 = sub_1E4CAFA84(v18);
                            swift_release();
                            *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_backingStore] = v19;

                            uint64_t v20 = (void *)sub_1E4CBF1C0();
                            v67.receiver = v3;
                            v67.super_class = (Class)type metadata accessor for MultiLinkableFooterView();
                            id v21 = objc_msgSendSuper2(&v67, sel_initWithReuseIdentifier_, v20);

                            id v22 = v21;
                            id v23 = objc_msgSend(v22, sel_contentView);
                            id v24 = sub_1E4CAE9AC();
                            objc_msgSend(v23, sel_addSubview_, v24);

                            uint64_t v25 = self;
                            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
                            uint64_t v26 = swift_allocObject();
                            *(_OWORD *)(v26 + 16) = xmmword_1E4CC4DD0;
                            id v27 = sub_1E4CAE9AC();
                            id v28 = objc_msgSend(v27, sel_leadingAnchor);

                            id v29 = objc_msgSend(v22, sel_contentView);
                            id v30 = objc_msgSend(v29, sel_layoutMarginsGuide);

                            id v31 = objc_msgSend(v30, sel_leadingAnchor);
                            id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);

                            *(void *)(v26 + 32) = v32;
                            id v33 = sub_1E4CAE9AC();
                            id v34 = objc_msgSend(v33, sel_trailingAnchor);

                            id v35 = objc_msgSend(v22, sel_contentView);
                            id v36 = objc_msgSend(v35, sel_layoutMarginsGuide);

                            id v37 = objc_msgSend(v36, sel_trailingAnchor);
                            id v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);

                            *(void *)(v26 + 40) = v38;
                            id v39 = sub_1E4CAE9AC();
                            id v40 = objc_msgSend(v39, sel_topAnchor);

                            id v41 = objc_msgSend(v22, sel_contentView);
                            id v42 = objc_msgSend(v41, sel_layoutMarginsGuide);

                            id v43 = objc_msgSend(v42, sel_topAnchor);
                            id v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);

                            *(void *)(v26 + 48) = v44;
                            id v45 = sub_1E4CAE9AC();
                            id v46 = objc_msgSend(v45, sel_bottomAnchor);

                            id v47 = objc_msgSend(v22, sel_contentView);
                            id v48 = objc_msgSend(v47, sel_layoutMarginsGuide);

                            id v49 = objc_msgSend(v48, sel_bottomAnchor);
                            id v50 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v49);

                            *(void *)(v26 + 56) = v50;
                            v70[0] = v26;
                            sub_1E4CBF2C0();
                            sub_1E4C7EA5C(0, (unint64_t *)&qword_1EAE8D7A8);
                            id v51 = (void *)sub_1E4CBF290();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v25, sel_activateConstraints_, v51);

                            return v22;
                          }
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          goto LABEL_45;
                        }
                      }
LABEL_43:
                      swift_bridgeObjectRelease();
                      goto LABEL_44;
                    }
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRelease();
LABEL_38:
                swift_bridgeObjectRelease();
                unint64_t v7 = v65;
                goto LABEL_28;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_28:
  if (qword_1EAE8F220 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_1E4CBEEB0();
  __swift_project_value_buffer(v52, (uint64_t)qword_1EAE90168);
  id v53 = v6;
  id v54 = sub_1E4CBEE90();
  os_log_type_t v55 = sub_1E4CBF3A0();
  if (os_log_type_enabled(v54, v55))
  {
    unint64_t v66 = v7;
    id v56 = (uint8_t *)swift_slowAlloc();
    id v57 = (void *)swift_slowAlloc();
    *(_DWORD *)id v56 = 138412290;
    v70[0] = v53;
    id v58 = v53;
    sub_1E4CBF520();
    void *v57 = v6;

    _os_log_impl(&dword_1E4BFE000, v54, v55, "Depedencies not met %@", v56, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DA58);
    swift_arrayDestroy();
    MEMORY[0x1E4E8B4E0](v57, -1, -1);
    id v59 = v56;
    unint64_t v7 = v66;
    MEMORY[0x1E4E8B4E0](v59, -1, -1);
  }
  else
  {

    id v54 = v53;
  }

  swift_bridgeObjectRelease();
  id v60 = *(void **)(v8 + v7);

  type metadata accessor for MultiLinkableFooterView();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t type metadata accessor for MultiLinkableFooterView()
{
  return self;
}

uint64_t sub_1E4CAFA84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v15 = MEMORY[0x1E4FBC860];
    sub_1E4CBF600();
    uint64_t v13 = *MEMORY[0x1E4F93158];
    uint64_t v14 = *MEMORY[0x1E4F93160];
    uint64_t v11 = *MEMORY[0x1E4F93150];
    uint64_t v12 = *MEMORY[0x1E4F93148];
    uint64_t v4 = a1 + 40;
    do
    {
      uint64_t v5 = *(void *)(v4 + 8);
      uint64_t v6 = *(void *)(v4 + 32);
      id v7 = objc_allocWithZone(MEMORY[0x1E4F92E70]);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      id v8 = objc_msgSend(v7, sel_init);
      unint64_t v9 = (void *)sub_1E4CBF1C0();
      objc_msgSend(v8, sel_setProperty_forKey_, v9, v14);

      objc_msgSend(v8, sel_setProperty_forKey_, v5, v13);
      char v10 = (void *)sub_1E4CBF1C0();
      objc_msgSend(v8, sel_setProperty_forKey_, v10, v12);

      objc_msgSend(v8, sel_setProperty_forKey_, v6, v11);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      sub_1E4CBF5E0();
      sub_1E4CBF610();
      sub_1E4CBF620();
      sub_1E4CBF5F0();
      v4 += 48;
      --v2;
    }
    while (v2);
    return v15;
  }
  return result;
}

Swift::Void __swiftcall MultiLinkableFooterView.refreshContents(with:)(PSSpecifier_optional *with)
{
  objc_msgSend(v1, sel_setNeedsLayout);

  objc_msgSend(v1, sel_layoutIfNeeded);
}

double MultiLinkableFooterView.preferredHeight(forWidth:)()
{
  id v0 = sub_1E4CAE9AC();
  objc_msgSend(v0, sel_intrinsicContentSize);
  double v2 = v1;

  return v2;
}

double MultiLinkableFooterView.preferredHeight(forWidth:in:)()
{
  id v0 = sub_1E4CAE9AC();
  objc_msgSend(v0, sel_intrinsicContentSize);
  double v2 = v1;

  return v2;
}

void sub_1E4CAFE84()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints] = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container] = 0;

  sub_1E4CBF640();
  __break(1u);
}

id MultiLinkableFooterView.__allocating_init(reuseIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithReuseIdentifier_, v3);

  return v4;
}

void MultiLinkableFooterView.init(reuseIdentifier:)()
{
}

id MultiLinkableFooterView.__deallocating_deinit()
{
  return sub_1E4CB0070(type metadata accessor for MultiLinkableFooterView);
}

id sub_1E4CB0070(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1E4CB0104(void *a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v8 = a2;
  unint64_t v9 = a1;
  uint64_t v10 = a1[2];
  unint64_t v66 = a2 >> 62;
  if (a2 >> 62) {
    goto LABEL_114;
  }
  uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t v54 = a3[2];
  unint64_t v65 = a4 >> 62;
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v13 = v54;
  if (v12 < v54) {
    uint64_t v13 = v12;
  }
  if (v13 >= v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v14 >= v10) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v14;
  }
  unint64_t v64 = v9;
  uint64_t v67 = v8;
  unint64_t v69 = a4;
  if (v15 <= 0)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4FBC860];
      id v49 = (void *)(*(void *)(MEMORY[0x1E4FBC860] + 24) >> 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v10) {
        goto LABEL_61;
      }
      uint64_t v4 = (uint64_t)(v5 + 4);
      goto LABEL_51;
    }
    __break(1u);
  }
  else
  {
    uint64_t v47 = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DED0);
    uint64_t v6 = (void *)swift_allocObject();
    uint64_t v4 = (uint64_t)(_swift_stdlib_malloc_size(v6) - 32) / 48;
    uint64_t v50 = v15;
    id v6[2] = v15;
    v6[3] = 2 * v4;
    if (!v10) {
      goto LABEL_134;
    }
    uint64_t v5 = (void *)v9[4];
    uint64_t v15 = v9[5];
    if (v66)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_1E4CBF650();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    if (!v16) {
      goto LABEL_135;
    }
    uint64_t v11 = v8 & 0xC000000000000001;
    uint64_t v52 = v6;
    if ((v8 & 0xC000000000000001) == 0)
    {
      if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_119;
      }
      uint64_t v6 = *(void **)(v8 + 32);
      swift_unknownObjectRetain();
      if (!v54)
      {
LABEL_118:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
        goto LABEL_124;
      }
      goto LABEL_25;
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1E4E8A770](0, v8);
  if (!v54) {
    goto LABEL_118;
  }
LABEL_25:
  unint64_t v9 = (void *)a3[4];
  uint64_t v8 = a3[5];
  if (v65)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1E4CBF650();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v45 = v10;
  if (!v17) {
    goto LABEL_136;
  }
  uint64_t v10 = 0;
  a4 = 0;
  uint64_t v18 = v67 & 0xFFFFFFFFFFFFFF8;
  if (v67 < 0) {
    uint64_t v18 = v67;
  }
  unint64_t v57 = v18;
  id v49 = (void *)((v4 & 0x7FFFFFFFFFFFFFFFLL) - v50);
  uint64_t v4 = (uint64_t)(v52 + 10);
  while (1)
  {
    if ((v69 & 0xC000000000000001) != 0)
    {
      uint64_t v20 = MEMORY[0x1E4E8A770](a4, v69);
    }
    else
    {
      if (a4 >= *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_1E4CBF650();
        swift_bridgeObjectRelease();
        goto LABEL_3;
      }
      uint64_t v20 = swift_unknownObjectRetain();
    }
    *(void *)(v4 - 48) = v5;
    *(void *)(v4 - 40) = v15;
    *(void *)(v4 - 32) = v6;
    *(void *)(v4 - 24) = v9;
    *(void *)(v4 - 16) = v8;
    *(void *)(v4 - 8) = v20;
    if (v50 - 1 == a4) {
      break;
    }
    uint64_t v5 = *(void **)((char *)v64 + v10 + 48);
    uint64_t v15 = *(void *)((char *)v64 + v10 + 56);
    unint64_t v9 = (void *)v67;
    if (v66)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1E4CBF650();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (a4 + 1 == v21) {
      goto LABEL_132;
    }
    if (v11)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4E8A770]();
    }
    else
    {
      if (a4 + 1 >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_113;
      }
      uint64_t v6 = *(void **)(v67 + 40 + 8 * a4);
      swift_unknownObjectRetain();
    }
    if (v54 - 1 == a4) {
      goto LABEL_133;
    }
    unint64_t v9 = *(void **)((char *)a3 + v10 + 48);
    uint64_t v8 = *(void *)((char *)a3 + v10 + 56);
    if (v65)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1E4CBF650();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v19 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v4 += 48;
    ++a4;
    v10 += 16;
    if (a4 == v19) {
      goto LABEL_131;
    }
  }
  uint64_t v10 = v45;
  uint64_t v14 = v47;
  unint64_t v9 = v64;
  uint64_t v8 = v67;
  a4 = v69;
  uint64_t v15 = v50;
  uint64_t v5 = v52;
  if (v45 <= v47) {
    goto LABEL_61;
  }
LABEL_51:
  if (v10 <= v14) {
    goto LABEL_121;
  }
  id v22 = &v9[2 * v15];
  uint64_t v6 = (void *)v22[4];
  uint64_t v11 = v22[5];
  if (!v66)
  {
    uint64_t v23 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15 != v23) {
      goto LABEL_54;
    }
LABEL_60:
    swift_bridgeObjectRelease();
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_1E4CBF650();
  swift_bridgeObjectRelease();
  if (v15 == v24) {
    goto LABEL_60;
  }
LABEL_54:
  unint64_t v57 = v8 & 0xC000000000000001;
  if ((v8 & 0xC000000000000001) != 0) {
    goto LABEL_125;
  }
  if ((unint64_t)v15 < *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v63 = *(void *)(v8 + 8 * v15 + 32);
    swift_unknownObjectRetain();
    while (1)
    {
      if (v15 == v54)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        goto LABEL_61;
      }
      uint64_t v62 = v6;
      if (v15 >= v54) {
        goto LABEL_130;
      }
      id v30 = &a3[2 * v15];
      uint64_t v6 = (void *)v30[5];
      uint64_t v60 = v30[4];
      id v51 = v6;
      if (v65)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v42 = sub_1E4CBF650();
        swift_bridgeObjectRelease();
        if (v15 == v42)
        {
LABEL_105:
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_60;
        }
      }
      else
      {
        uint64_t v31 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v15 == v31) {
          goto LABEL_105;
        }
      }
      uint64_t v61 = v11;
      id v53 = v5;
      uint64_t v46 = a4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v48 = v8 & 0xFFFFFFFFFFFFFF8;
      unint64_t v44 = a4 + 32;
      uint64_t v55 = v10 - 1;
      unint64_t v56 = a4 & 0xC000000000000001;
      uint64_t v59 = 2 * v15;
      uint64_t v43 = v8 + 40;
      id v58 = a3;
      uint64_t v6 = v9;
      unint64_t v9 = v49;
      id v32 = v51;
      do
      {
        if (v56)
        {
          uint64_t v11 = MEMORY[0x1E4E8A770](v15, a4);
          if (v9) {
            goto LABEL_89;
          }
        }
        else
        {
          if ((unint64_t)v15 >= *(void *)(v46 + 16)) {
            goto LABEL_127;
          }
          uint64_t v11 = *(void *)(v44 + 8 * v15);
          swift_unknownObjectRetain();
          if (v9) {
            goto LABEL_89;
          }
        }
        unint64_t v33 = v53[3];
        if ((uint64_t)((v33 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_128;
        }
        uint64_t v5 = v32;
        int64_t v34 = v33 & 0xFFFFFFFFFFFFFFFELL;
        if (v34 <= 1) {
          uint64_t v35 = 1;
        }
        else {
          uint64_t v35 = v34;
        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DED0);
        uint64_t v8 = swift_allocObject();
        uint64_t v36 = (uint64_t)(_swift_stdlib_malloc_size((const void *)v8) - 32) / 48;
        *(void *)(v8 + 16) = v35;
        *(void *)(v8 + 24) = 2 * v36;
        unint64_t v37 = v8 + 32;
        uint64_t v38 = v53[3] >> 1;
        if (v53[2])
        {
          if ((void *)v8 != v53 || v37 >= (unint64_t)&v53[6 * v38 + 4]) {
            memmove((void *)(v8 + 32), v53 + 4, 48 * v38);
          }
          v53[2] = 0;
        }
        uint64_t v4 = v37 + 48 * v38;
        unint64_t v9 = (void *)((v36 & 0x7FFFFFFFFFFFFFFFLL) - v38);
        swift_release();
        id v53 = (void *)v8;
        a4 = v69;
        id v32 = v5;
LABEL_89:
        BOOL v27 = __OFSUB__(v9, 1);
        unint64_t v9 = (void *)((char *)v9 - 1);
        if (v27) {
          goto LABEL_120;
        }
        *(void *)uint64_t v4 = v62;
        *(void *)(v4 + 8) = v61;
        *(void *)(v4 + 16) = v63;
        *(void *)(v4 + 24) = v60;
        *(void *)(v4 + 32) = v32;
        *(void *)(v4 + 40) = v11;
        if (v55 == v15)
        {
          id v49 = v9;
          goto LABEL_111;
        }
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v10) {
          goto LABEL_122;
        }
        uint64_t v5 = (void *)v10;
        uint64_t v10 = v6[v59 + 7];
        uint64_t v62 = (void *)v6[v59 + 6];
        uint64_t v61 = v10;
        if (v66)
        {
          uint64_t v8 = (uint64_t)v9;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v40 = sub_1E4CBF650();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v40 = *(void *)(v48 + 16);
          swift_bridgeObjectRetain();
        }
        if (v11 == v40)
        {
          id v49 = v9;
          goto LABEL_110;
        }
        uint64_t v10 = (uint64_t)v5;
        if (v57)
        {
          uint64_t v41 = MEMORY[0x1E4E8A770](v15 + 1, v67);
        }
        else
        {
          if ((unint64_t)v11 >= *(void *)(v48 + 16)) {
            goto LABEL_129;
          }
          uint64_t v41 = *(void *)(v43 + 8 * v15);
          swift_unknownObjectRetain();
        }
        if (v54 - 1 == v15)
        {
          id v49 = v9;
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_111;
        }
        if (v11 >= v54) {
          goto LABEL_123;
        }
        uint64_t v63 = v41;
        id v32 = (void *)v58[v59 + 7];
        uint64_t v60 = v58[v59 + 6];
        if (v65)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_1E4CBF650();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v8 = *(void *)(v46 + 16);
          swift_bridgeObjectRetain();
        }
        v4 += 48;
        v6 += 2;
        uint64_t v5 = v58 + 2;
        v58 += 2;
        ++v15;
      }
      while (v11 != v8);
      id v49 = v9;
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_110:
      swift_bridgeObjectRelease();
LABEL_111:
      unint64_t v9 = v64;
      uint64_t v8 = v67;
      uint64_t v5 = v53;
LABEL_61:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v25 = v5[3];
      if (v25 < 2) {
        return (uint64_t)v5;
      }
      unint64_t v26 = v25 >> 1;
      BOOL v27 = __OFSUB__(v26, v49);
      unint64_t v28 = v26 - (void)v49;
      if (!v27)
      {
        v5[2] = v28;
        return (uint64_t)v5;
      }
LABEL_124:
      __break(1u);
LABEL_125:
      uint64_t v63 = MEMORY[0x1E4E8A770](v15, v8);
    }
  }
  __break(1u);
LABEL_127:
  __break(1u);
LABEL_128:
  __break(1u);
LABEL_129:
  __break(1u);
LABEL_130:
  __break(1u);
LABEL_131:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_132:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_133:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __break(1u);
LABEL_134:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __break(1u);
LABEL_135:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_136:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MultiLinkableTextView()
{
  return self;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

uint64_t sub_1E4CB0BF4()
{
  return sub_1E4CB0C28((unint64_t *)&unk_1EAE8DEE0);
}

uint64_t sub_1E4CB0C28(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4CB0C6C()
{
  return sub_1E4CB0C28(&qword_1EAE8D7C0);
}

uint64_t sub_1E4CB0CA0()
{
  return sub_1E4CB0C28((unint64_t *)&unk_1EAE8DEF0);
}

id sub_1E4CB0CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
  uint64_t v6 = (void *)sub_1E4CBF6F0();
  swift_beginAccess();
  objc_setAssociatedObject(v2, &unk_1EAE8F530, v6, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v2, sel_buttonTapped, 64);
}

uint64_t sub_1E4CB0DB8(uint64_t a1, uint64_t a2)
{
  return sub_1E4CB13D0(a1, a2, (uint64_t)&unk_1F40976B8, (uint64_t)sub_1E4CB1C04, &unk_1EAE8F530);
}

uint64_t sub_1E4CB0DE0()
{
  id v0 = sub_1E4CB0E80();
  if (v0)
  {
    double v2 = v0;
    uint64_t v3 = v1;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    uint64_t v5 = sub_1E4CB1C04;
  }
  else
  {
    uint64_t v5 = nullsub_1;
  }
  v5();

  return swift_release();
}

uint64_t (*sub_1E4CB0E80())()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_1EAE8F530);
  swift_endAccess();
  if (v1)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1E4C81220((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
    if (swift_dynamicCast())
    {
      *(_OWORD *)(swift_allocObject() + 16) = v3;
      return sub_1E4CB0FC8;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v5);
  }
  return 0;
}

uint64_t sub_1E4CB0F90()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4CB0FC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E4CB0FF0(void *a1)
{
  id v1 = a1;
  double v2 = sub_1E4CB0E80();
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_1E4CB1C04;
  }
  else
  {
    id v7 = nullsub_1;
  }
  v7();

  return swift_release();
}

void (*sub_1E4CB109C(void *a1))(uint64_t (***a1)(), char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v3[3] = sub_1E4CB0E80();
  v3[4] = v4;
  return sub_1E4CB10FC;
}

void sub_1E4CB10FC(uint64_t (***a1)(), char a2)
{
  double v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1)[3];
  uint64_t v4 = (*a1)[4];
  if (a2)
  {
    if (v3)
    {
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v3;
      *(void *)(v5 + 24) = v4;
      *double v2 = sub_1E4CB1C04;
      v2[1] = (uint64_t (*)())v5;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
      uint64_t v6 = (void *)sub_1E4CBF6F0();
    }
    else
    {
      uint64_t v6 = 0;
    }
    unint64_t v9 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v9, &unk_1EAE8F530, v6, (void *)1);
    swift_endAccess();
    sub_1E4C879AC(v3);
    swift_unknownObjectRelease();
    sub_1E4C879AC((uint64_t)v2[3]);
  }
  else
  {
    if (v3)
    {
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v3;
      *(void *)(v7 + 24) = v4;
      *double v2 = sub_1E4CB1C04;
      v2[1] = (uint64_t (*)())v7;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
      uint64_t v8 = (void *)sub_1E4CBF6F0();
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v10, &unk_1EAE8F530, v8, (void *)1);
    swift_endAccess();
    sub_1E4C879AC(v3);
    swift_unknownObjectRelease();
  }

  free(v2);
}

id sub_1E4CB12B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
  uint64_t v6 = (void *)sub_1E4CBF6F0();
  swift_beginAccess();
  objc_setAssociatedObject(v2, &unk_1EAE8F531, v6, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_setTarget_, v2);
  return objc_msgSend(v2, sel_setAction_, sel_buttonTapped);
}

uint64_t sub_1E4CB13A8(uint64_t a1, uint64_t a2)
{
  return sub_1E4CB13D0(a1, a2, (uint64_t)&unk_1F40977A8, (uint64_t)sub_1E4CB1C04, &unk_1EAE8F531);
}

uint64_t sub_1E4CB13D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  uint64_t v7 = v5;
  if (a1)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a1;
    *(void *)(v10 + 24) = a2;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
    uint64_t v11 = (void *)sub_1E4CBF6F0();
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_beginAccess();
  objc_setAssociatedObject(v7, a5, v11, (void *)1);
  swift_endAccess();
  sub_1E4C879AC(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_1E4CB14A4()
{
  uint64_t v0 = sub_1E4CB1544();
  if (v0)
  {
    double v2 = v0;
    uint64_t v3 = v1;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    uint64_t v5 = sub_1E4CB1C04;
  }
  else
  {
    uint64_t v5 = nullsub_1;
  }
  v5();

  return swift_release();
}

uint64_t (*sub_1E4CB1544())()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_1EAE8F531);
  swift_endAccess();
  if (v1)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1E4C81220((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
    if (swift_dynamicCast())
    {
      *(_OWORD *)(swift_allocObject() + 16) = v3;
      return sub_1E4CB1BCC;
    }
  }
  else
  {
    sub_1E4C898C8((uint64_t)v5);
  }
  return 0;
}

uint64_t sub_1E4CB1654(void *a1)
{
  id v1 = a1;
  double v2 = sub_1E4CB1544();
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1E4CB1C04;
  }
  else
  {
    uint64_t v7 = nullsub_1;
  }
  v7();

  return swift_release();
}

void (*sub_1E4CB1700(void *a1))(uint64_t (***a1)(), char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v3[3] = sub_1E4CB1544();
  v3[4] = v4;
  return sub_1E4CB1760;
}

void sub_1E4CB1760(uint64_t (***a1)(), char a2)
{
  double v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1)[3];
  uint64_t v4 = (*a1)[4];
  if (a2)
  {
    if (v3)
    {
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v3;
      *(void *)(v5 + 24) = v4;
      *double v2 = sub_1E4CB1C04;
      v2[1] = (uint64_t (*)())v5;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
      uint64_t v6 = (void *)sub_1E4CBF6F0();
    }
    else
    {
      uint64_t v6 = 0;
    }
    unint64_t v9 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v9, &unk_1EAE8F531, v6, (void *)1);
    swift_endAccess();
    sub_1E4C879AC(v3);
    swift_unknownObjectRelease();
    sub_1E4C879AC((uint64_t)v2[3]);
  }
  else
  {
    if (v3)
    {
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v3;
      *(void *)(v7 + 24) = v4;
      *double v2 = sub_1E4CB1C04;
      v2[1] = (uint64_t (*)())v7;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFC0);
      uint64_t v8 = (void *)sub_1E4CBF6F0();
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v10, &unk_1EAE8F531, v8, (void *)1);
    swift_endAccess();
    sub_1E4C879AC(v3);
    swift_unknownObjectRelease();
  }

  free(v2);
}

Swift::Void __swiftcall UIView.pinToOther(_:)(UIView *a1)
{
  double v2 = v1;
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE8DE00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1E4CC4DD0;
  id v6 = objc_msgSend(v2, sel_leadingAnchor);
  uint64_t v7 = [(UIView *)a1 leadingAnchor];
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(v2, sel_trailingAnchor);
  uint64_t v10 = [(UIView *)a1 trailingAnchor];
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(v2, sel_topAnchor);
  uint64_t v13 = [(UIView *)a1 topAnchor];
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(v2, sel_bottomAnchor);
  uint64_t v16 = [(UIView *)a1 bottomAnchor];
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v5 + 56) = v17;
  sub_1E4CBF2C0();
  sub_1E4C99160();
  id v18 = (id)sub_1E4CBF290();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);
}

void sub_1E4CB1B64(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  UIView.pinToOther(_:)(v4);
}

BOOL sub_1E4CB1C08(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1E4CB1C18()
{
  return sub_1E4CBF730();
}

uint64_t sub_1E4CB1C40()
{
  return sub_1E4CBF740();
}

uint64_t variable initialization expression of BobbleMappingSelectionController.viewModel()
{
  return 0;
}

uint64_t variable initialization expression of BobbleMappingSelectionController.mapingUseCase()
{
  return 2;
}

id BobbleMappingSelectionController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id BobbleMappingSelectionController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel] = 0;
  v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] = 2;
  *(void *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection] = 0;
  if (a2)
  {
    id v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

uint64_t type metadata accessor for BobbleMappingSelectionController()
{
  return self;
}

uint64_t variable initialization expression of BobbleMappingSelectionController.$__lazy_storage_$_headGestureMappingSection()
{
  return 0;
}

void sub_1E4CB1E44()
{
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel] = 0;
  v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] = 2;
  *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection] = 0;

  sub_1E4CBF640();
  __break(1u);
}

uint64_t sub_1E4CB1F60()
{
  uint64_t v1 = OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection;
  if (*(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection];
  }
  else
  {
    uint64_t v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D8A8);
    uint64_t v4 = sub_1E4C87A94();
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E4C87A94();
    uint64_t v9 = sub_1E4C87AA0(v4, v6, v7, v8);
    uint64_t v10 = sub_1E4C951A8();
    uint64_t v12 = v11;
    uint64_t v13 = type metadata accessor for BobbleMappingSelectionController();
    uint64_t v30 = v13;
    v29[0] = v3;
    id v14 = v3;
    char v15 = sub_1E4C877B0();
    __n128 v16 = sub_1E4C879DC(0, 0, v10, v12, (uint64_t)v29, 0, 0, 3, (uint64_t)v31, 0, v15 & 1, 0, 0, (__n128)0, 0);
    uint64_t v17 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v9 + 160))(v31, v16);
    swift_release();
    sub_1E4C8411C((uint64_t)v31);
    uint64_t v18 = (*(uint64_t (**)(void (*)(void *), void))(*(void *)v17 + 168))(sub_1E4CB2280, 0);
    swift_release();
    uint64_t v19 = sub_1E4C951A8();
    uint64_t v21 = v20;
    uint64_t v30 = v13;
    v29[0] = v14;
    id v22 = v14;
    char v23 = sub_1E4C877B0();
    __n128 v24 = sub_1E4C879DC(0, 0, v19, v21, (uint64_t)v29, 0, 0, 3, (uint64_t)v31, 0, v23 & 1, 0, 0, (__n128)0, 0);
    uint64_t v25 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v18 + 160))(v31, v24);
    swift_release();
    sub_1E4C8411C((uint64_t)v31);
    uint64_t v26 = (*(uint64_t (**)(void (*)(void *), void))(*(void *)v25 + 168))(sub_1E4CB22FC, 0);
    uint64_t v27 = swift_release();
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 176))(v27);
    swift_release();
    *(void *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1E4CB2280(void *a1)
{
  id v2 = (id)sub_1E4CBF1C0();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E4F93188]);
}

void sub_1E4CB22FC(void *a1)
{
  sub_1E4C951A8();
  id v2 = (id)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E4F93188]);
}

uint64_t sub_1E4CB2388(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4CB23A0(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_1E4CB1F60();
  return sub_1E4CB23E8;
}

uint64_t sub_1E4CB23E8(void *a1)
{
  *(void *)(a1[1]
            + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = *a1;
  return swift_bridgeObjectRelease();
}

Swift::OpaquePointer_optional __swiftcall BobbleMappingSelectionController.specifiers()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E4CBEEB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v1, sel_specifier);
  if (!v6)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = v6;
  id v9 = objc_msgSend(v6, sel_userInfo);

  if (v9)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_1E4C81220((uint64_t)&v31, (uint64_t)v33);
  if (!v34) {
    goto LABEL_21;
  }
  sub_1E4C7EA5C(0, &qword_1EAE8D828);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    sub_1E4C7EA5C(0, &qword_1EAE8D880);
    char v23 = (void *)sub_1E4CBF290();
    __n128 v24 = (void *)sub_1E4CBF1C0();
    objc_msgSend(v1, sel_setValue_forKey_, v23, v24);

    sub_1E4CBEE70();
    uint64_t v25 = sub_1E4CBEE90();
    os_log_type_t v26 = sub_1E4CBF3A0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v33[0] = v28;
      *(_DWORD *)uint64_t v27 = 136315394;
      *(void *)&long long v31 = sub_1E4C8304C(0x6569666963657073, 0xEC00000029287372, v33);
      sub_1E4CBF520();
      *(_WORD *)(v27 + 12) = 2048;
      *(void *)&long long v31 = 61;
      sub_1E4CBF520();
      _os_log_impl(&dword_1E4BFE000, v25, v26, "%s: %ld Depedencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E4E8B4E0](v28, -1, -1);
      MEMORY[0x1E4E8B4E0](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v22 = 0;
    goto LABEL_25;
  }
  uint64_t v10 = v30;
  uint64_t v11 = (void *)sub_1E4CBF1C0();
  id v12 = objc_msgSend(v10, sel_objectForKey_, v11);

  if (v12)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_1E4C81220((uint64_t)&v31, (uint64_t)v33);
  if (!v34) {
    goto LABEL_20;
  }
  type metadata accessor for BobbleSettingsViewModel();
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_22;
  }
  uint64_t v13 = v30;
  id v14 = (void *)sub_1E4CBF1C0();
  id v15 = objc_msgSend(v10, sel_objectForKey_, v14);

  if (v15)
  {
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_1E4C81220((uint64_t)&v31, (uint64_t)v33);
  if (!v34)
  {
    swift_release();
LABEL_20:

LABEL_21:
    sub_1E4C8370C((uint64_t)v33, (uint64_t *)&unk_1EAE8DDD0);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();

    goto LABEL_22;
  }
  char v16 = (char)v30;
  *(void *)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel) = v13;
  swift_retain();
  uint64_t v17 = swift_release();
  *((unsigned char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase) = v16;
  unint64_t v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x98))(v17);
  v33[0] = MEMORY[0x1E4FBC860];
  sub_1E4C83A50(v18);
  unint64_t v19 = v33[0];
  sub_1E4C7EA5C(0, &qword_1EAE8D880);
  uint64_t v20 = (void *)sub_1E4CBF290();
  uint64_t v21 = (void *)sub_1E4CBF1C0();
  objc_msgSend(v1, sel_setValue_forKey_, v20, v21);

  uint64_t v22 = sub_1E4C82CCC(v19);
  swift_release();
  swift_bridgeObjectRelease();
LABEL_25:
  id v6 = (id)v22;
LABEL_28:
  result.value._rawValue = v6;
  result.is_nil = v7;
  return result;
}

uint64_t BobbleMappingSelectionController.tableView(_:cellForRowAt:)(uint64_t a1)
{
  uint64_t v3 = (void *)sub_1E4CBE990();
  v27.receiver = v1;
  v27.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  id v4 = objc_msgSendSuper2(&v27, sel_tableView_cellForRowAtIndexPath_, a1, v3);

  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5) {
    goto LABEL_27;
  }
  id v6 = (void *)v5;
  uint64_t v7 = sub_1E4CBE9C0();
  if (v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase])
  {
    if (v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] != 1) {
      return (uint64_t)v6;
    }
    if (v7 != 1)
    {
      if (!v7)
      {
        uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (v8)
        {
          id v9 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 184);
          uint64_t v10 = swift_retain();
          unsigned __int8 v11 = v9(v10);
LABEL_12:
          int v15 = v11;
          swift_release();
          BOOL v16 = v15 == 1;
LABEL_18:
          uint64_t v25 = v16;
          objc_msgSend(v6, sel_setChecked_, v25);
          return (uint64_t)v6;
        }
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      return (uint64_t)v6;
    }
    uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
    if (!v17)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    unint64_t v18 = *(uint64_t (**)(uint64_t))(*(void *)v17 + 184);
    uint64_t v19 = swift_retain();
    unsigned __int8 v20 = v18(v19);
LABEL_17:
    int v24 = v20;
    swift_release();
    BOOL v16 = v24 == 2;
    goto LABEL_18;
  }
  if (v7 != 1)
  {
    if (!v7)
    {
      uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
      if (v12)
      {
        uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)v12 + 232);
        uint64_t v14 = swift_retain();
        unsigned __int8 v11 = v13(v14);
        goto LABEL_12;
      }
      goto LABEL_24;
    }
    return (uint64_t)v6;
  }
  uint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
  if (v21)
  {
    uint64_t v22 = *(uint64_t (**)(uint64_t))(*(void *)v21 + 232);
    uint64_t v23 = swift_retain();
    unsigned __int8 v20 = v22(v23);
    goto LABEL_17;
  }
LABEL_26:
  __break(1u);
LABEL_27:

  uint64_t result = sub_1E4CBF640();
  __break(1u);
  return result;
}

void BobbleMappingSelectionController.listItemSelected(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFE0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E4CBE9D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v2;
  id v9 = objc_msgSend(v2, sel_table);
  if (!v9)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v10 = v9;
  MEMORY[0x1E4E89B70](0, 0);
  unsigned __int8 v11 = (void *)sub_1E4CBE990();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  id v13 = objc_msgSend(v10, sel_cellForRowAtIndexPath_, v11);

  if (!v13) {
    return;
  }
  self;
  uint64_t v14 = swift_dynamicCastObjCClass();
  if (!v14) {
    goto LABEL_25;
  }
  int v15 = (void *)v14;
  id v32 = v13;
  id v16 = objc_msgSend(v35, sel_table);
  if (!v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v17 = v16;
  MEMORY[0x1E4E89B70](1, 0);
  unint64_t v18 = (void *)sub_1E4CBE990();
  v12(v8, v5);
  id v19 = objc_msgSend(v17, sel_cellForRowAtIndexPath_, v18);

  id v13 = v32;
  if (v19)
  {
    self;
    uint64_t v20 = swift_dynamicCastObjCClass();
    if (!v20) {
      goto LABEL_24;
    }
    uint64_t v21 = (void *)v20;
    objc_msgSend(v15, sel_setChecked_, 0);
    objc_msgSend(v21, sel_setChecked_, 0);
    uint64_t v22 = v34;
    sub_1E4CB3364(v33, v34);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v22, 1, v5) != 1)
    {
      uint64_t v23 = sub_1E4CBE9C0();
      v12((char *)v22, v5);
      if (v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase])
      {
        if (v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] != 1) {
          goto LABEL_24;
        }
        if (v23 != 1)
        {
          if (!v23)
          {
            uint64_t v24 = *(void *)&v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
            if (v24)
            {
              uint64_t v25 = *(void (**)(uint64_t))(*(void *)v24 + 192);
              swift_retain();
              v25(1);
LABEL_23:
              swift_release();
              objc_msgSend(v15, sel_setChecked_, 1);
              goto LABEL_24;
            }
            goto LABEL_30;
          }
LABEL_24:

          id v13 = v32;
          goto LABEL_25;
        }
        uint64_t v28 = *(void *)&v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (!v28)
        {
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
        uint64_t v29 = *(void (**)(uint64_t))(*(void *)v28 + 192);
        swift_retain();
        v29(2);
      }
      else
      {
        if (v23 != 1)
        {
          if (!v23)
          {
            uint64_t v26 = *(void *)&v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
            if (v26)
            {
              objc_super v27 = *(void (**)(uint64_t))(*(void *)v26 + 240);
              swift_retain();
              v27(1);
              goto LABEL_23;
            }
            goto LABEL_31;
          }
          goto LABEL_24;
        }
        uint64_t v30 = *(void *)&v35[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (!v30)
        {
LABEL_33:
          __break(1u);
          return;
        }
        long long v31 = *(void (**)(uint64_t))(*(void *)v30 + 240);
        swift_retain();
        v31(2);
      }
      int v15 = v21;
      goto LABEL_23;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_25:
}

id BobbleMappingSelectionController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4CB3364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E4CB33D0()
{
  unint64_t result = qword_1EAE8DFE8;
  if (!qword_1EAE8DFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8DFE8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BobbleMappingUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1E4CB34F0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BobbleMappingUseCase()
{
  return &type metadata for BobbleMappingUseCase;
}

unint64_t sub_1E4CB3528()
{
  unint64_t result = qword_1EAE8D8A0;
  if (!qword_1EAE8D8A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE8D898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8D8A0);
  }
  return result;
}

uint64_t sub_1E4CB3584()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

id sub_1E4CB3594()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EAE8F648 = (uint64_t)result;
  return result;
}

uint64_t sub_1E4CB35E8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90180);
}

uint64_t sub_1E4CB360C()
{
  return sub_1E4CBC23C(&qword_1EAE8F650, (uint64_t)qword_1EAE90180);
}

uint64_t sub_1E4CB3630@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F650, (uint64_t)qword_1EAE90180, a1);
}

uint64_t sub_1E4CB3654(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90198);
}

uint64_t sub_1E4CB3678()
{
  return sub_1E4CBC23C(&qword_1EAE8F658, (uint64_t)qword_1EAE90198);
}

uint64_t sub_1E4CB369C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F658, (uint64_t)qword_1EAE90198, a1);
}

uint64_t sub_1E4CB36C0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE901B0);
}

uint64_t sub_1E4CB36E4()
{
  return sub_1E4CBC23C(&qword_1EAE8F660, (uint64_t)qword_1EAE901B0);
}

uint64_t sub_1E4CB3708@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F660, (uint64_t)qword_1EAE901B0, a1);
}

uint64_t sub_1E4CB372C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE901C8);
}

uint64_t sub_1E4CB3748()
{
  return sub_1E4CBC23C(&qword_1EAE8F668, (uint64_t)qword_1EAE901C8);
}

uint64_t sub_1E4CB376C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F668, (uint64_t)qword_1EAE901C8, a1);
}

uint64_t sub_1E4CB3790(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE901E0);
}

uint64_t sub_1E4CB37AC()
{
  return sub_1E4CBC23C(&qword_1EAE8F670, (uint64_t)qword_1EAE901E0);
}

uint64_t sub_1E4CB37D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F670, (uint64_t)qword_1EAE901E0, a1);
}

uint64_t sub_1E4CB37F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE901F8);
}

uint64_t sub_1E4CB3814()
{
  return sub_1E4CBC23C(&qword_1EAE8F678, (uint64_t)qword_1EAE901F8);
}

uint64_t sub_1E4CB3838@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F678, (uint64_t)qword_1EAE901F8, a1);
}

uint64_t sub_1E4CB385C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90210);
}

uint64_t sub_1E4CB387C()
{
  return sub_1E4CBC23C(&qword_1EAE8F680, (uint64_t)qword_1EAE90210);
}

uint64_t sub_1E4CB38A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F680, (uint64_t)qword_1EAE90210, a1);
}

uint64_t sub_1E4CB38C4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90228);
}

uint64_t sub_1E4CB38E0()
{
  return sub_1E4CBC23C(&qword_1EAE8F688, (uint64_t)qword_1EAE90228);
}

uint64_t sub_1E4CB3904@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F688, (uint64_t)qword_1EAE90228, a1);
}

uint64_t sub_1E4CB3928(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90240);
}

uint64_t sub_1E4CB3948()
{
  return sub_1E4CBC23C(&qword_1EAE8F690, (uint64_t)qword_1EAE90240);
}

uint64_t sub_1E4CB396C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F690, (uint64_t)qword_1EAE90240, a1);
}

uint64_t sub_1E4CB3990(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90258);
}

uint64_t sub_1E4CB39AC()
{
  return sub_1E4CBC23C(&qword_1EAE8F698, (uint64_t)qword_1EAE90258);
}

uint64_t sub_1E4CB39D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F698, (uint64_t)qword_1EAE90258, a1);
}

uint64_t sub_1E4CB39F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90270);
}

uint64_t sub_1E4CB3A14()
{
  return sub_1E4CBC23C(&qword_1EAE8F6A0, (uint64_t)qword_1EAE90270);
}

uint64_t sub_1E4CB3A38@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6A0, (uint64_t)qword_1EAE90270, a1);
}

uint64_t sub_1E4CB3A5C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90288);
}

uint64_t sub_1E4CB3A7C()
{
  return sub_1E4CBC23C(&qword_1EAE8F6A8, (uint64_t)qword_1EAE90288);
}

uint64_t sub_1E4CB3AA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6A8, (uint64_t)qword_1EAE90288, a1);
}

uint64_t sub_1E4CB3AC4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE902A0);
}

uint64_t sub_1E4CB3AEC()
{
  return sub_1E4CBC23C(&qword_1EAE8F6B0, (uint64_t)qword_1EAE902A0);
}

uint64_t sub_1E4CB3B10@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6B0, (uint64_t)qword_1EAE902A0, a1);
}

uint64_t sub_1E4CB3B34(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE902B8);
}

uint64_t sub_1E4CB3B58()
{
  return sub_1E4CBC23C(&qword_1EAE8F6B8, (uint64_t)qword_1EAE902B8);
}

uint64_t sub_1E4CB3B7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6B8, (uint64_t)qword_1EAE902B8, a1);
}

uint64_t sub_1E4CB3BA0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE902D0);
}

uint64_t sub_1E4CB3BC4()
{
  return sub_1E4CBC23C(&qword_1EAE8F6C0, (uint64_t)qword_1EAE902D0);
}

uint64_t sub_1E4CB3BE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6C0, (uint64_t)qword_1EAE902D0, a1);
}

uint64_t sub_1E4CB3C0C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE902E8);
}

uint64_t sub_1E4CB3C30()
{
  return sub_1E4CBC23C(&qword_1EAE8F6C8, (uint64_t)qword_1EAE902E8);
}

uint64_t sub_1E4CB3C54@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6C8, (uint64_t)qword_1EAE902E8, a1);
}

uint64_t sub_1E4CB3C78(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90300);
}

uint64_t sub_1E4CB3C9C()
{
  return sub_1E4CBC23C(&qword_1EAE8F6D0, (uint64_t)qword_1EAE90300);
}

uint64_t sub_1E4CB3CC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6D0, (uint64_t)qword_1EAE90300, a1);
}

uint64_t sub_1E4CB3CE4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90318);
}

uint64_t sub_1E4CB3D08()
{
  return sub_1E4CBC23C(&qword_1EAE8F6D8, (uint64_t)qword_1EAE90318);
}

uint64_t sub_1E4CB3D2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6D8, (uint64_t)qword_1EAE90318, a1);
}

uint64_t sub_1E4CB3D50(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90330);
}

uint64_t sub_1E4CB3D74()
{
  return sub_1E4CBC23C(&qword_1EAE8F6E0, (uint64_t)qword_1EAE90330);
}

uint64_t sub_1E4CB3D98@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6E0, (uint64_t)qword_1EAE90330, a1);
}

uint64_t sub_1E4CB3DBC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90348);
}

uint64_t sub_1E4CB3DE0()
{
  return sub_1E4CBC23C(&qword_1EAE8F6E8, (uint64_t)qword_1EAE90348);
}

uint64_t sub_1E4CB3E04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6E8, (uint64_t)qword_1EAE90348, a1);
}

uint64_t sub_1E4CB3E28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90360);
}

uint64_t sub_1E4CB3E4C()
{
  return sub_1E4CBC23C(&qword_1EAE8F6F0, (uint64_t)qword_1EAE90360);
}

uint64_t sub_1E4CB3E70@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6F0, (uint64_t)qword_1EAE90360, a1);
}

uint64_t sub_1E4CB3E94(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90378);
}

uint64_t sub_1E4CB3EB0()
{
  return sub_1E4CBC23C(&qword_1EAE8F6F8, (uint64_t)qword_1EAE90378);
}

uint64_t sub_1E4CB3ED4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F6F8, (uint64_t)qword_1EAE90378, a1);
}

uint64_t sub_1E4CB3EF8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90390);
}

uint64_t sub_1E4CB3F14()
{
  return sub_1E4CBC23C(&qword_1EAE8F700, (uint64_t)qword_1EAE90390);
}

uint64_t sub_1E4CB3F38@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F700, (uint64_t)qword_1EAE90390, a1);
}

uint64_t sub_1E4CB3F5C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE903A8);
}

uint64_t sub_1E4CB3F7C()
{
  return sub_1E4CBC23C(&qword_1EAE8F708, (uint64_t)qword_1EAE903A8);
}

uint64_t sub_1E4CB3FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F708, (uint64_t)qword_1EAE903A8, a1);
}

uint64_t sub_1E4CB3FC4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE903C0);
}

uint64_t sub_1E4CB3FE4()
{
  return sub_1E4CBC23C(&qword_1EAE8F710, (uint64_t)qword_1EAE903C0);
}

uint64_t sub_1E4CB4008@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F710, (uint64_t)qword_1EAE903C0, a1);
}

uint64_t sub_1E4CB402C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE903D8);
}

uint64_t sub_1E4CB404C()
{
  return sub_1E4CBC23C(&qword_1EAE8F718, (uint64_t)qword_1EAE903D8);
}

uint64_t sub_1E4CB4070@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F718, (uint64_t)qword_1EAE903D8, a1);
}

uint64_t sub_1E4CB4094(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE903F0);
}

uint64_t sub_1E4CB40B4()
{
  return sub_1E4CBC23C(&qword_1EAE8F720, (uint64_t)qword_1EAE903F0);
}

uint64_t sub_1E4CB40D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F720, (uint64_t)qword_1EAE903F0, a1);
}

uint64_t sub_1E4CB40FC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90408);
}

uint64_t sub_1E4CB411C()
{
  return sub_1E4CBC23C(&qword_1EAE8F728, (uint64_t)qword_1EAE90408);
}

uint64_t sub_1E4CB4140@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F728, (uint64_t)qword_1EAE90408, a1);
}

uint64_t sub_1E4CB4164(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90420);
}

uint64_t sub_1E4CB4184()
{
  return sub_1E4CBC23C(&qword_1EAE8F730, (uint64_t)qword_1EAE90420);
}

uint64_t sub_1E4CB41A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F730, (uint64_t)qword_1EAE90420, a1);
}

uint64_t sub_1E4CB41CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90438);
}

uint64_t sub_1E4CB41EC()
{
  return sub_1E4CBC23C(&qword_1EAE8F738, (uint64_t)qword_1EAE90438);
}

uint64_t sub_1E4CB4210@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F738, (uint64_t)qword_1EAE90438, a1);
}

uint64_t sub_1E4CB4234(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90450);
}

uint64_t sub_1E4CB4254()
{
  return sub_1E4CBC23C(&qword_1EAE8F740, (uint64_t)qword_1EAE90450);
}

uint64_t sub_1E4CB4278@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F740, (uint64_t)qword_1EAE90450, a1);
}

uint64_t sub_1E4CB429C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90468);
}

uint64_t sub_1E4CB42BC()
{
  return sub_1E4CBC23C(&qword_1EAE8F748, (uint64_t)qword_1EAE90468);
}

uint64_t sub_1E4CB42E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F748, (uint64_t)qword_1EAE90468, a1);
}

uint64_t sub_1E4CB4304(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90480);
}

uint64_t sub_1E4CB4324()
{
  return sub_1E4CBC23C(&qword_1EAE8F750, (uint64_t)qword_1EAE90480);
}

uint64_t sub_1E4CB4348@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F750, (uint64_t)qword_1EAE90480, a1);
}

uint64_t sub_1E4CB436C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90498);
}

uint64_t sub_1E4CB438C()
{
  return sub_1E4CBC23C(&qword_1EAE8F758, (uint64_t)qword_1EAE90498);
}

uint64_t sub_1E4CB43B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F758, (uint64_t)qword_1EAE90498, a1);
}

uint64_t sub_1E4CB43D4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE904B0);
}

uint64_t sub_1E4CB43F4()
{
  return sub_1E4CBC23C(&qword_1EAE8F760, (uint64_t)qword_1EAE904B0);
}

uint64_t sub_1E4CB4418@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F760, (uint64_t)qword_1EAE904B0, a1);
}

uint64_t sub_1E4CB443C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE904C8);
}

uint64_t sub_1E4CB445C()
{
  return sub_1E4CBC23C(&qword_1EAE8F768, (uint64_t)qword_1EAE904C8);
}

uint64_t sub_1E4CB4480@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F768, (uint64_t)qword_1EAE904C8, a1);
}

uint64_t sub_1E4CB44A4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE904E0);
}

uint64_t sub_1E4CB44CC()
{
  return sub_1E4CBC23C(&qword_1EAE8F770, (uint64_t)qword_1EAE904E0);
}

uint64_t sub_1E4CB44F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F770, (uint64_t)qword_1EAE904E0, a1);
}

uint64_t sub_1E4CB4514(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE904F8);
}

uint64_t sub_1E4CB4530()
{
  return sub_1E4CBC23C(&qword_1EAE8F778, (uint64_t)qword_1EAE904F8);
}

uint64_t sub_1E4CB4554@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F778, (uint64_t)qword_1EAE904F8, a1);
}

uint64_t sub_1E4CB4578(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90510);
}

uint64_t sub_1E4CB4594()
{
  return sub_1E4CBC23C(&qword_1EAE8F780, (uint64_t)qword_1EAE90510);
}

uint64_t sub_1E4CB45B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F780, (uint64_t)qword_1EAE90510, a1);
}

uint64_t sub_1E4CB45DC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90528);
}

uint64_t sub_1E4CB45FC()
{
  return sub_1E4CBC23C(&qword_1EAE8F788, (uint64_t)qword_1EAE90528);
}

uint64_t sub_1E4CB4620@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F788, (uint64_t)qword_1EAE90528, a1);
}

uint64_t sub_1E4CB4644(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90540);
}

uint64_t sub_1E4CB4664()
{
  return sub_1E4CBC23C(&qword_1EAE8F790, (uint64_t)qword_1EAE90540);
}

uint64_t sub_1E4CB4688@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F790, (uint64_t)qword_1EAE90540, a1);
}

uint64_t sub_1E4CB46AC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90558);
}

uint64_t sub_1E4CB46CC()
{
  return sub_1E4CBC23C(&qword_1EAE8F798, (uint64_t)qword_1EAE90558);
}

uint64_t sub_1E4CB46F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F798, (uint64_t)qword_1EAE90558, a1);
}

uint64_t sub_1E4CB4714(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90570);
}

uint64_t sub_1E4CB4734()
{
  return sub_1E4CBC23C(&qword_1EAE8F7A0, (uint64_t)qword_1EAE90570);
}

uint64_t sub_1E4CB4758@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7A0, (uint64_t)qword_1EAE90570, a1);
}

uint64_t sub_1E4CB477C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90588);
}

uint64_t sub_1E4CB479C()
{
  return sub_1E4CBC23C(&qword_1EAE8F7A8, (uint64_t)qword_1EAE90588);
}

uint64_t sub_1E4CB47C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7A8, (uint64_t)qword_1EAE90588, a1);
}

uint64_t sub_1E4CB47E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE905A0);
}

uint64_t sub_1E4CB4804()
{
  return sub_1E4CBC23C(&qword_1EAE8F7B0, (uint64_t)qword_1EAE905A0);
}

uint64_t sub_1E4CB4828@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7B0, (uint64_t)qword_1EAE905A0, a1);
}

uint64_t sub_1E4CB484C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE905B8);
}

uint64_t sub_1E4CB486C()
{
  return sub_1E4CBC23C(&qword_1EAE8F7B8, (uint64_t)qword_1EAE905B8);
}

uint64_t sub_1E4CB4890@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7B8, (uint64_t)qword_1EAE905B8, a1);
}

uint64_t sub_1E4CB48B4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE905D0);
}

uint64_t sub_1E4CB48D4()
{
  return sub_1E4CBC23C(&qword_1EAE8F7C0, (uint64_t)qword_1EAE905D0);
}

uint64_t sub_1E4CB48F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7C0, (uint64_t)qword_1EAE905D0, a1);
}

uint64_t sub_1E4CB491C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE905E8);
}

uint64_t sub_1E4CB493C()
{
  return sub_1E4CBC23C(&qword_1EAE8F7C8, (uint64_t)qword_1EAE905E8);
}

uint64_t sub_1E4CB4960@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7C8, (uint64_t)qword_1EAE905E8, a1);
}

uint64_t sub_1E4CB4984(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90600);
}

uint64_t sub_1E4CB49A4()
{
  return sub_1E4CBC23C(&qword_1EAE8F7D0, (uint64_t)qword_1EAE90600);
}

uint64_t sub_1E4CB49C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7D0, (uint64_t)qword_1EAE90600, a1);
}

uint64_t sub_1E4CB49EC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90618);
}

uint64_t sub_1E4CB4A0C()
{
  return sub_1E4CBC23C(&qword_1EAE8F7D8, (uint64_t)qword_1EAE90618);
}

uint64_t sub_1E4CB4A30@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7D8, (uint64_t)qword_1EAE90618, a1);
}

uint64_t sub_1E4CB4A54(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90630);
}

uint64_t sub_1E4CB4A74()
{
  return sub_1E4CBC23C(&qword_1EAE8F7E0, (uint64_t)qword_1EAE90630);
}

uint64_t sub_1E4CB4A98@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7E0, (uint64_t)qword_1EAE90630, a1);
}

uint64_t sub_1E4CB4ABC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90648);
}

uint64_t sub_1E4CB4ADC()
{
  return sub_1E4CBC23C(&qword_1EAE8F7E8, (uint64_t)qword_1EAE90648);
}

uint64_t sub_1E4CB4B00@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7E8, (uint64_t)qword_1EAE90648, a1);
}

uint64_t sub_1E4CB4B24(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90660);
}

uint64_t sub_1E4CB4B44()
{
  return sub_1E4CBC23C(&qword_1EAE8F7F0, (uint64_t)qword_1EAE90660);
}

uint64_t sub_1E4CB4B68@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7F0, (uint64_t)qword_1EAE90660, a1);
}

uint64_t sub_1E4CB4B8C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90678);
}

uint64_t sub_1E4CB4BAC()
{
  return sub_1E4CBC23C(&qword_1EAE8F7F8, (uint64_t)qword_1EAE90678);
}

uint64_t sub_1E4CB4BD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F7F8, (uint64_t)qword_1EAE90678, a1);
}

uint64_t sub_1E4CB4BF4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90690);
}

uint64_t sub_1E4CB4C14()
{
  return sub_1E4CBC23C(&qword_1EAE8F800, (uint64_t)qword_1EAE90690);
}

uint64_t sub_1E4CB4C38@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F800, (uint64_t)qword_1EAE90690, a1);
}

uint64_t sub_1E4CB4C5C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE906A8);
}

uint64_t sub_1E4CB4C78()
{
  return sub_1E4CBC23C(&qword_1EAE8F808, (uint64_t)qword_1EAE906A8);
}

uint64_t sub_1E4CB4C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F808, (uint64_t)qword_1EAE906A8, a1);
}

uint64_t sub_1E4CB4CC0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE906C0);
}

uint64_t sub_1E4CB4CE0()
{
  return sub_1E4CBC23C(&qword_1EAE8F810, (uint64_t)qword_1EAE906C0);
}

uint64_t sub_1E4CB4D04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F810, (uint64_t)qword_1EAE906C0, a1);
}

uint64_t sub_1E4CB4D28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE906D8);
}

uint64_t sub_1E4CB4D48()
{
  return sub_1E4CBC23C(&qword_1EAE8F818, (uint64_t)qword_1EAE906D8);
}

uint64_t sub_1E4CB4D6C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F818, (uint64_t)qword_1EAE906D8, a1);
}

uint64_t sub_1E4CB4D90(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE906F0);
}

uint64_t sub_1E4CB4DB0()
{
  return sub_1E4CBC23C(&qword_1EAE8F820, (uint64_t)qword_1EAE906F0);
}

uint64_t sub_1E4CB4DD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F820, (uint64_t)qword_1EAE906F0, a1);
}

uint64_t sub_1E4CB4DF8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90708);
}

uint64_t sub_1E4CB4E18()
{
  return sub_1E4CBC23C(&qword_1EAE8F828, (uint64_t)qword_1EAE90708);
}

uint64_t sub_1E4CB4E3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F828, (uint64_t)qword_1EAE90708, a1);
}

uint64_t sub_1E4CB4E60(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90720);
}

uint64_t sub_1E4CB4E7C()
{
  return sub_1E4CBC23C(&qword_1EAE8F830, (uint64_t)qword_1EAE90720);
}

uint64_t sub_1E4CB4EA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F830, (uint64_t)qword_1EAE90720, a1);
}

uint64_t sub_1E4CB4EC4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90738);
}

uint64_t sub_1E4CB4EE0()
{
  return sub_1E4CBC23C(&qword_1EAE8F838, (uint64_t)qword_1EAE90738);
}

uint64_t sub_1E4CB4F04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F838, (uint64_t)qword_1EAE90738, a1);
}

uint64_t sub_1E4CB4F28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90750);
}

uint64_t sub_1E4CB4F44()
{
  return sub_1E4CBC23C(&qword_1EAE8F840, (uint64_t)qword_1EAE90750);
}

uint64_t sub_1E4CB4F68@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F840, (uint64_t)qword_1EAE90750, a1);
}

uint64_t sub_1E4CB4F8C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90768);
}

uint64_t sub_1E4CB4FAC()
{
  return sub_1E4CBC23C(&qword_1EAE8F848, (uint64_t)qword_1EAE90768);
}

uint64_t sub_1E4CB4FD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F848, (uint64_t)qword_1EAE90768, a1);
}

uint64_t sub_1E4CB4FF4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90780);
}

uint64_t sub_1E4CB5014()
{
  return sub_1E4CBC23C(&qword_1EAE8F850, (uint64_t)qword_1EAE90780);
}

uint64_t sub_1E4CB5038@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F850, (uint64_t)qword_1EAE90780, a1);
}

uint64_t sub_1E4CB505C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90798);
}

uint64_t sub_1E4CB5084()
{
  return sub_1E4CBC23C(&qword_1EAE8F858, (uint64_t)qword_1EAE90798);
}

uint64_t sub_1E4CB50A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F858, (uint64_t)qword_1EAE90798, a1);
}

uint64_t sub_1E4CB50CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE907B0);
}

uint64_t sub_1E4CB50E8()
{
  return sub_1E4CBC23C(&qword_1EAE8F860, (uint64_t)qword_1EAE907B0);
}

uint64_t sub_1E4CB510C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F860, (uint64_t)qword_1EAE907B0, a1);
}

uint64_t sub_1E4CB5130(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE907C8);
}

uint64_t sub_1E4CB514C()
{
  return sub_1E4CBC23C(&qword_1EAE8F868, (uint64_t)qword_1EAE907C8);
}

uint64_t sub_1E4CB5170@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F868, (uint64_t)qword_1EAE907C8, a1);
}

uint64_t sub_1E4CB5194(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE907E0);
}

uint64_t sub_1E4CB51B0()
{
  return sub_1E4CBC23C(&qword_1EAE8F870, (uint64_t)qword_1EAE907E0);
}

uint64_t sub_1E4CB51D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F870, (uint64_t)qword_1EAE907E0, a1);
}

uint64_t sub_1E4CB51F8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE907F8);
}

uint64_t sub_1E4CB5220()
{
  return sub_1E4CBC23C(&qword_1EAE8F878, (uint64_t)qword_1EAE907F8);
}

uint64_t sub_1E4CB5244@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F878, (uint64_t)qword_1EAE907F8, a1);
}

uint64_t sub_1E4CB5268(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90810);
}

uint64_t sub_1E4CB5284()
{
  return sub_1E4CBC23C(&qword_1EAE8F880, (uint64_t)qword_1EAE90810);
}

uint64_t sub_1E4CB52A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F880, (uint64_t)qword_1EAE90810, a1);
}

uint64_t sub_1E4CB52CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90828);
}

uint64_t sub_1E4CB52EC()
{
  return sub_1E4CBC23C(&qword_1EAE8F888, (uint64_t)qword_1EAE90828);
}

uint64_t sub_1E4CB5310@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F888, (uint64_t)qword_1EAE90828, a1);
}

uint64_t sub_1E4CB5334(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90840);
}

uint64_t sub_1E4CB5354()
{
  return sub_1E4CBC23C(&qword_1EAE8F890, (uint64_t)qword_1EAE90840);
}

uint64_t sub_1E4CB5378@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F890, (uint64_t)qword_1EAE90840, a1);
}

uint64_t sub_1E4CB539C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90858);
}

uint64_t sub_1E4CB53BC()
{
  return sub_1E4CBC23C(&qword_1EAE8F898, (uint64_t)qword_1EAE90858);
}

uint64_t sub_1E4CB53E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F898, (uint64_t)qword_1EAE90858, a1);
}

uint64_t sub_1E4CB5404(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90870);
}

uint64_t sub_1E4CB542C()
{
  return sub_1E4CBC23C(&qword_1EAE8F8A0, (uint64_t)qword_1EAE90870);
}

uint64_t sub_1E4CB5450@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8A0, (uint64_t)qword_1EAE90870, a1);
}

uint64_t sub_1E4CB5474(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90888);
}

uint64_t sub_1E4CB5490()
{
  return sub_1E4CBC23C(&qword_1EAE8F8A8, (uint64_t)qword_1EAE90888);
}

uint64_t sub_1E4CB54B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8A8, (uint64_t)qword_1EAE90888, a1);
}

uint64_t sub_1E4CB54D8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE908A0);
}

uint64_t sub_1E4CB54F8()
{
  return sub_1E4CBC23C(&qword_1EAE8F8B0, (uint64_t)qword_1EAE908A0);
}

uint64_t sub_1E4CB551C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8B0, (uint64_t)qword_1EAE908A0, a1);
}

uint64_t sub_1E4CB5540(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE908B8);
}

uint64_t sub_1E4CB5560()
{
  return sub_1E4CBC23C(&qword_1EAE8F8B8, (uint64_t)qword_1EAE908B8);
}

uint64_t sub_1E4CB5584@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8B8, (uint64_t)qword_1EAE908B8, a1);
}

uint64_t sub_1E4CB55A8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE908D0);
}

uint64_t sub_1E4CB55C8()
{
  return sub_1E4CBC23C(&qword_1EAE8F8C0, (uint64_t)qword_1EAE908D0);
}

uint64_t sub_1E4CB55EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8C0, (uint64_t)qword_1EAE908D0, a1);
}

uint64_t sub_1E4CB5610(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE908E8);
}

uint64_t sub_1E4CB5630()
{
  return sub_1E4CBC23C(&qword_1EAE8F8C8, (uint64_t)qword_1EAE908E8);
}

uint64_t sub_1E4CB5654@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8C8, (uint64_t)qword_1EAE908E8, a1);
}

uint64_t sub_1E4CB5678(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90900);
}

uint64_t sub_1E4CB5698()
{
  return sub_1E4CBC23C(&qword_1EAE8F8D0, (uint64_t)qword_1EAE90900);
}

uint64_t sub_1E4CB56BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8D0, (uint64_t)qword_1EAE90900, a1);
}

uint64_t sub_1E4CB56E0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90918);
}

uint64_t sub_1E4CB5708()
{
  return sub_1E4CBC23C(&qword_1EAE8F8D8, (uint64_t)qword_1EAE90918);
}

uint64_t sub_1E4CB572C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8D8, (uint64_t)qword_1EAE90918, a1);
}

uint64_t sub_1E4CB5750(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90930);
}

uint64_t sub_1E4CB576C()
{
  return sub_1E4CBC23C(&qword_1EAE8F8E0, (uint64_t)qword_1EAE90930);
}

uint64_t sub_1E4CB5790@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8E0, (uint64_t)qword_1EAE90930, a1);
}

uint64_t sub_1E4CB57B4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90948);
}

uint64_t sub_1E4CB57D0()
{
  return sub_1E4CBC23C(&qword_1EAE8F8E8, (uint64_t)qword_1EAE90948);
}

uint64_t sub_1E4CB57F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8E8, (uint64_t)qword_1EAE90948, a1);
}

uint64_t sub_1E4CB5818(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90960);
}

uint64_t sub_1E4CB5834()
{
  return sub_1E4CBC23C(&qword_1EAE8F8F0, (uint64_t)qword_1EAE90960);
}

uint64_t sub_1E4CB5858@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8F0, (uint64_t)qword_1EAE90960, a1);
}

uint64_t sub_1E4CB587C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90978);
}

uint64_t sub_1E4CB589C()
{
  return sub_1E4CBC23C(&qword_1EAE8F8F8, (uint64_t)qword_1EAE90978);
}

uint64_t sub_1E4CB58C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F8F8, (uint64_t)qword_1EAE90978, a1);
}

uint64_t sub_1E4CB58E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90990);
}

uint64_t sub_1E4CB5904()
{
  return sub_1E4CBC23C(&qword_1EAE8F900, (uint64_t)qword_1EAE90990);
}

uint64_t sub_1E4CB5928@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F900, (uint64_t)qword_1EAE90990, a1);
}

uint64_t sub_1E4CB594C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE909A8);
}

uint64_t sub_1E4CB5968()
{
  return sub_1E4CBC23C(&qword_1EAE8F908, (uint64_t)qword_1EAE909A8);
}

uint64_t sub_1E4CB598C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F908, (uint64_t)qword_1EAE909A8, a1);
}

uint64_t sub_1E4CB59B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE909C0);
}

uint64_t sub_1E4CB59D0()
{
  return sub_1E4CBC23C(&qword_1EAE8F910, (uint64_t)qword_1EAE909C0);
}

uint64_t sub_1E4CB59F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F910, (uint64_t)qword_1EAE909C0, a1);
}

uint64_t sub_1E4CB5A18(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE909D8);
}

uint64_t sub_1E4CB5A38()
{
  return sub_1E4CBC23C(&qword_1EAE8F918, (uint64_t)qword_1EAE909D8);
}

uint64_t sub_1E4CB5A5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F918, (uint64_t)qword_1EAE909D8, a1);
}

uint64_t sub_1E4CB5A80(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE909F0);
}

uint64_t sub_1E4CB5AA0()
{
  return sub_1E4CBC23C(&qword_1EAE8F920, (uint64_t)qword_1EAE909F0);
}

uint64_t sub_1E4CB5AC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F920, (uint64_t)qword_1EAE909F0, a1);
}

uint64_t sub_1E4CB5AE8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A08);
}

uint64_t sub_1E4CB5B08()
{
  return sub_1E4CBC23C(&qword_1EAE8F928, (uint64_t)qword_1EAE90A08);
}

uint64_t sub_1E4CB5B2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F928, (uint64_t)qword_1EAE90A08, a1);
}

uint64_t sub_1E4CB5B50(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A20);
}

uint64_t sub_1E4CB5B70()
{
  return sub_1E4CBC23C(&qword_1EAE8F930, (uint64_t)qword_1EAE90A20);
}

uint64_t sub_1E4CB5B94@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F930, (uint64_t)qword_1EAE90A20, a1);
}

uint64_t sub_1E4CB5BB8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A38);
}

uint64_t sub_1E4CB5BD8()
{
  return sub_1E4CBC23C(&qword_1EAE8F938, (uint64_t)qword_1EAE90A38);
}

uint64_t sub_1E4CB5BFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F938, (uint64_t)qword_1EAE90A38, a1);
}

uint64_t sub_1E4CB5C20(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A50);
}

uint64_t sub_1E4CB5C40()
{
  return sub_1E4CBC23C(&qword_1EAE8F940, (uint64_t)qword_1EAE90A50);
}

uint64_t sub_1E4CB5C64@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F940, (uint64_t)qword_1EAE90A50, a1);
}

uint64_t sub_1E4CB5C88(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A68);
}

uint64_t sub_1E4CB5CB0()
{
  return sub_1E4CBC23C(&qword_1EAE8F948, (uint64_t)qword_1EAE90A68);
}

uint64_t sub_1E4CB5CD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F948, (uint64_t)qword_1EAE90A68, a1);
}

uint64_t sub_1E4CB5CF8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A80);
}

uint64_t sub_1E4CB5D20()
{
  return sub_1E4CBC23C(&qword_1EAE8F950, (uint64_t)qword_1EAE90A80);
}

uint64_t sub_1E4CB5D44@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F950, (uint64_t)qword_1EAE90A80, a1);
}

uint64_t sub_1E4CB5D68(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90A98);
}

uint64_t sub_1E4CB5D90()
{
  return sub_1E4CBC23C(&qword_1EAE8F958, (uint64_t)qword_1EAE90A98);
}

uint64_t sub_1E4CB5DB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F958, (uint64_t)qword_1EAE90A98, a1);
}

uint64_t sub_1E4CB5DD8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90AB0);
}

uint64_t sub_1E4CB5E00()
{
  return sub_1E4CBC23C(&qword_1EAE8F960, (uint64_t)qword_1EAE90AB0);
}

uint64_t sub_1E4CB5E24@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F960, (uint64_t)qword_1EAE90AB0, a1);
}

uint64_t sub_1E4CB5E48(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90AC8);
}

uint64_t sub_1E4CB5E70()
{
  return sub_1E4CBC23C(&qword_1EAE8F968, (uint64_t)qword_1EAE90AC8);
}

uint64_t sub_1E4CB5E94@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F968, (uint64_t)qword_1EAE90AC8, a1);
}

uint64_t sub_1E4CB5EB8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90AE0);
}

uint64_t sub_1E4CB5EE0()
{
  return sub_1E4CBC23C(&qword_1EAE8F970, (uint64_t)qword_1EAE90AE0);
}

uint64_t sub_1E4CB5F04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F970, (uint64_t)qword_1EAE90AE0, a1);
}

uint64_t sub_1E4CB5F28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90AF8);
}

uint64_t sub_1E4CB5F50()
{
  return sub_1E4CBC23C(&qword_1EAE8F978, (uint64_t)qword_1EAE90AF8);
}

uint64_t sub_1E4CB5F74@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F978, (uint64_t)qword_1EAE90AF8, a1);
}

uint64_t sub_1E4CB5F98(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B10);
}

uint64_t sub_1E4CB5FC0()
{
  return sub_1E4CBC23C(&qword_1EAE8F980, (uint64_t)qword_1EAE90B10);
}

uint64_t sub_1E4CB5FE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F980, (uint64_t)qword_1EAE90B10, a1);
}

uint64_t sub_1E4CB6008(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B28);
}

uint64_t sub_1E4CB6030()
{
  return sub_1E4CBC23C(&qword_1EAE8F988, (uint64_t)qword_1EAE90B28);
}

uint64_t sub_1E4CB6054@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F988, (uint64_t)qword_1EAE90B28, a1);
}

uint64_t sub_1E4CB6078(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B40);
}

uint64_t sub_1E4CB609C()
{
  return sub_1E4CBC23C(&qword_1EAE8F990, (uint64_t)qword_1EAE90B40);
}

uint64_t sub_1E4CB60C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F990, (uint64_t)qword_1EAE90B40, a1);
}

uint64_t sub_1E4CB60E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B58);
}

uint64_t sub_1E4CB610C()
{
  return sub_1E4CBC23C(&qword_1EAE8F998, (uint64_t)qword_1EAE90B58);
}

uint64_t sub_1E4CB6130@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F998, (uint64_t)qword_1EAE90B58, a1);
}

uint64_t sub_1E4CB6154(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B70);
}

uint64_t sub_1E4CB617C()
{
  return sub_1E4CBC23C(&qword_1EAE8F9A0, (uint64_t)qword_1EAE90B70);
}

uint64_t sub_1E4CB61A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9A0, (uint64_t)qword_1EAE90B70, a1);
}

uint64_t sub_1E4CB61C4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90B88);
}

uint64_t sub_1E4CB61F0()
{
  return sub_1E4CBC23C(&qword_1EAE8F9A8, (uint64_t)qword_1EAE90B88);
}

uint64_t sub_1E4CB6214@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9A8, (uint64_t)qword_1EAE90B88, a1);
}

uint64_t sub_1E4CB6238(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90BA0);
}

uint64_t sub_1E4CB6264()
{
  return sub_1E4CBC23C(&qword_1EAE8F9B0, (uint64_t)qword_1EAE90BA0);
}

uint64_t sub_1E4CB6288@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9B0, (uint64_t)qword_1EAE90BA0, a1);
}

uint64_t sub_1E4CB62AC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90BB8);
}

uint64_t sub_1E4CB62D4()
{
  return sub_1E4CBC23C(&qword_1EAE8F9B8, (uint64_t)qword_1EAE90BB8);
}

uint64_t sub_1E4CB62F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9B8, (uint64_t)qword_1EAE90BB8, a1);
}

uint64_t sub_1E4CB631C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90BD0);
}

uint64_t sub_1E4CB6344()
{
  return sub_1E4CBC23C(&qword_1EAE8F9C0, (uint64_t)qword_1EAE90BD0);
}

uint64_t sub_1E4CB6368@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9C0, (uint64_t)qword_1EAE90BD0, a1);
}

uint64_t sub_1E4CB638C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90BE8);
}

uint64_t sub_1E4CB63B4()
{
  return sub_1E4CBC23C(&qword_1EAE8F9C8, (uint64_t)qword_1EAE90BE8);
}

uint64_t sub_1E4CB63D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9C8, (uint64_t)qword_1EAE90BE8, a1);
}

uint64_t sub_1E4CB63FC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C00);
}

uint64_t sub_1E4CB6424()
{
  return sub_1E4CBC23C(&qword_1EAE8F9D0, (uint64_t)qword_1EAE90C00);
}

uint64_t sub_1E4CB6448@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9D0, (uint64_t)qword_1EAE90C00, a1);
}

uint64_t sub_1E4CB646C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C18);
}

uint64_t sub_1E4CB6490()
{
  return sub_1E4CBC23C(&qword_1EAE8F9D8, (uint64_t)qword_1EAE90C18);
}

uint64_t sub_1E4CB64B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9D8, (uint64_t)qword_1EAE90C18, a1);
}

uint64_t sub_1E4CB64D8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C30);
}

uint64_t sub_1E4CB6500()
{
  return sub_1E4CBC23C(&qword_1EAE8F9E0, (uint64_t)qword_1EAE90C30);
}

uint64_t sub_1E4CB6524@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9E0, (uint64_t)qword_1EAE90C30, a1);
}

uint64_t sub_1E4CB6548(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C48);
}

uint64_t sub_1E4CB6570()
{
  return sub_1E4CBC23C(&qword_1EAE8F9E8, (uint64_t)qword_1EAE90C48);
}

uint64_t sub_1E4CB6594@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9E8, (uint64_t)qword_1EAE90C48, a1);
}

uint64_t sub_1E4CB65B8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C60);
}

uint64_t sub_1E4CB65E0()
{
  return sub_1E4CBC23C(&qword_1EAE8F9F0, (uint64_t)qword_1EAE90C60);
}

uint64_t sub_1E4CB6604@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9F0, (uint64_t)qword_1EAE90C60, a1);
}

uint64_t sub_1E4CB6628(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C78);
}

uint64_t sub_1E4CB6650()
{
  return sub_1E4CBC23C(&qword_1EAE8F9F8, (uint64_t)qword_1EAE90C78);
}

uint64_t sub_1E4CB6674@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8F9F8, (uint64_t)qword_1EAE90C78, a1);
}

uint64_t sub_1E4CB6698(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90C90);
}

uint64_t sub_1E4CB66C0()
{
  return sub_1E4CBC23C(&qword_1EAE8FA00, (uint64_t)qword_1EAE90C90);
}

uint64_t sub_1E4CB66E4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA00, (uint64_t)qword_1EAE90C90, a1);
}

uint64_t sub_1E4CB6708(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90CA8);
}

uint64_t sub_1E4CB6730()
{
  return sub_1E4CBC23C(&qword_1EAE8FA08, (uint64_t)qword_1EAE90CA8);
}

uint64_t sub_1E4CB6754@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA08, (uint64_t)qword_1EAE90CA8, a1);
}

uint64_t sub_1E4CB6778(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90CC0);
}

uint64_t sub_1E4CB67A0()
{
  return sub_1E4CBC23C(&qword_1EAE8FA10, (uint64_t)qword_1EAE90CC0);
}

uint64_t sub_1E4CB67C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA10, (uint64_t)qword_1EAE90CC0, a1);
}

uint64_t sub_1E4CB67E8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90CD8);
}

uint64_t sub_1E4CB680C()
{
  return sub_1E4CBC23C(&qword_1EAE8FA18, (uint64_t)qword_1EAE90CD8);
}

uint64_t sub_1E4CB6830@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA18, (uint64_t)qword_1EAE90CD8, a1);
}

uint64_t sub_1E4CB6854(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90CF0);
}

uint64_t sub_1E4CB6870()
{
  return sub_1E4CBC23C(&qword_1EAE8FA20, (uint64_t)qword_1EAE90CF0);
}

uint64_t sub_1E4CB6894@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA20, (uint64_t)qword_1EAE90CF0, a1);
}

uint64_t sub_1E4CB68B8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D08);
}

uint64_t sub_1E4CB68D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FA28, (uint64_t)qword_1EAE90D08);
}

uint64_t sub_1E4CB68F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA28, (uint64_t)qword_1EAE90D08, a1);
}

uint64_t sub_1E4CB691C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D20);
}

uint64_t sub_1E4CB6938()
{
  return sub_1E4CBC23C(&qword_1EAE8FA30, (uint64_t)qword_1EAE90D20);
}

uint64_t sub_1E4CB695C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA30, (uint64_t)qword_1EAE90D20, a1);
}

uint64_t sub_1E4CB6980(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D38);
}

uint64_t sub_1E4CB699C()
{
  return sub_1E4CBC23C(&qword_1EAE8FA38, (uint64_t)qword_1EAE90D38);
}

uint64_t sub_1E4CB69C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA38, (uint64_t)qword_1EAE90D38, a1);
}

uint64_t sub_1E4CB69E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D50);
}

uint64_t sub_1E4CB6A00()
{
  return sub_1E4CBC23C(&qword_1EAE8FA40, (uint64_t)qword_1EAE90D50);
}

uint64_t sub_1E4CB6A24@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA40, (uint64_t)qword_1EAE90D50, a1);
}

uint64_t sub_1E4CB6A48(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D68);
}

uint64_t sub_1E4CB6A64()
{
  return sub_1E4CBC23C(&qword_1EAE8FA48, (uint64_t)qword_1EAE90D68);
}

uint64_t sub_1E4CB6A88@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA48, (uint64_t)qword_1EAE90D68, a1);
}

uint64_t sub_1E4CB6AAC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D80);
}

uint64_t sub_1E4CB6AC8()
{
  return sub_1E4CBC23C(&qword_1EAE8FA50, (uint64_t)qword_1EAE90D80);
}

uint64_t sub_1E4CB6AEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA50, (uint64_t)qword_1EAE90D80, a1);
}

uint64_t sub_1E4CB6B10(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90D98);
}

uint64_t sub_1E4CB6B38()
{
  return sub_1E4CBC23C(&qword_1EAE8FA58, (uint64_t)qword_1EAE90D98);
}

uint64_t sub_1E4CB6B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA58, (uint64_t)qword_1EAE90D98, a1);
}

uint64_t sub_1E4CB6B80(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90DB0);
}

uint64_t sub_1E4CB6BA8()
{
  return sub_1E4CBC23C(&qword_1EAE8FA60, (uint64_t)qword_1EAE90DB0);
}

uint64_t sub_1E4CB6BCC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA60, (uint64_t)qword_1EAE90DB0, a1);
}

uint64_t sub_1E4CB6BF0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90DC8);
}

uint64_t sub_1E4CB6C18()
{
  return sub_1E4CBC23C(&qword_1EAE8FA68, (uint64_t)qword_1EAE90DC8);
}

uint64_t sub_1E4CB6C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA68, (uint64_t)qword_1EAE90DC8, a1);
}

uint64_t sub_1E4CB6C60(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90DE0);
}

uint64_t sub_1E4CB6C88()
{
  return sub_1E4CBC23C(&qword_1EAE8FA70, (uint64_t)qword_1EAE90DE0);
}

uint64_t sub_1E4CB6CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA70, (uint64_t)qword_1EAE90DE0, a1);
}

uint64_t sub_1E4CB6CD0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90DF8);
}

uint64_t sub_1E4CB6CF8()
{
  return sub_1E4CBC23C(&qword_1EAE8FA78, (uint64_t)qword_1EAE90DF8);
}

uint64_t sub_1E4CB6D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA78, (uint64_t)qword_1EAE90DF8, a1);
}

uint64_t sub_1E4CB6D40(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E10);
}

uint64_t sub_1E4CB6D68()
{
  return sub_1E4CBC23C(&qword_1EAE8FA80, (uint64_t)qword_1EAE90E10);
}

uint64_t sub_1E4CB6D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA80, (uint64_t)qword_1EAE90E10, a1);
}

uint64_t sub_1E4CB6DB0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E28);
}

uint64_t sub_1E4CB6DD8()
{
  return sub_1E4CBC23C(&qword_1EAE8FA88, (uint64_t)qword_1EAE90E28);
}

uint64_t sub_1E4CB6DFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA88, (uint64_t)qword_1EAE90E28, a1);
}

uint64_t sub_1E4CB6E20(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E40);
}

uint64_t sub_1E4CB6E48()
{
  return sub_1E4CBC23C(&qword_1EAE8FA90, (uint64_t)qword_1EAE90E40);
}

uint64_t sub_1E4CB6E6C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA90, (uint64_t)qword_1EAE90E40, a1);
}

uint64_t sub_1E4CB6E90(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E58);
}

uint64_t sub_1E4CB6EB8()
{
  return sub_1E4CBC23C(&qword_1EAE8FA98, (uint64_t)qword_1EAE90E58);
}

uint64_t sub_1E4CB6EDC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FA98, (uint64_t)qword_1EAE90E58, a1);
}

uint64_t sub_1E4CB6F00(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E70);
}

uint64_t sub_1E4CB6F1C()
{
  return sub_1E4CBC23C(&qword_1EAE8FAA0, (uint64_t)qword_1EAE90E70);
}

uint64_t sub_1E4CB6F40@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAA0, (uint64_t)qword_1EAE90E70, a1);
}

uint64_t sub_1E4CB6F64(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90E88);
}

uint64_t sub_1E4CB6F80()
{
  return sub_1E4CBC23C(&qword_1EAE8FAA8, (uint64_t)qword_1EAE90E88);
}

uint64_t sub_1E4CB6FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAA8, (uint64_t)qword_1EAE90E88, a1);
}

uint64_t sub_1E4CB6FC8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90EA0);
}

uint64_t sub_1E4CB6FE4()
{
  return sub_1E4CBC23C(&qword_1EAE8FAB0, (uint64_t)qword_1EAE90EA0);
}

uint64_t sub_1E4CB7008@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAB0, (uint64_t)qword_1EAE90EA0, a1);
}

uint64_t sub_1E4CB702C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90EB8);
}

uint64_t sub_1E4CB7048()
{
  return sub_1E4CBC23C(&qword_1EAE8FAB8, (uint64_t)qword_1EAE90EB8);
}

uint64_t sub_1E4CB706C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAB8, (uint64_t)qword_1EAE90EB8, a1);
}

uint64_t sub_1E4CB7090(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90ED0);
}

uint64_t sub_1E4CB70AC()
{
  return sub_1E4CBC23C(&qword_1EAE8FAC0, (uint64_t)qword_1EAE90ED0);
}

uint64_t sub_1E4CB70D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAC0, (uint64_t)qword_1EAE90ED0, a1);
}

uint64_t sub_1E4CB70F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90EE8);
}

uint64_t sub_1E4CB7110()
{
  return sub_1E4CBC23C(&qword_1EAE8FAC8, (uint64_t)qword_1EAE90EE8);
}

uint64_t sub_1E4CB7134@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAC8, (uint64_t)qword_1EAE90EE8, a1);
}

uint64_t sub_1E4CB7158(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F00);
}

uint64_t sub_1E4CB7174()
{
  return sub_1E4CBC23C(&qword_1EAE8FAD0, (uint64_t)qword_1EAE90F00);
}

uint64_t sub_1E4CB7198@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAD0, (uint64_t)qword_1EAE90F00, a1);
}

uint64_t sub_1E4CB71BC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F18);
}

uint64_t sub_1E4CB71D8()
{
  return sub_1E4CBC23C(&qword_1EAE8FAD8, (uint64_t)qword_1EAE90F18);
}

uint64_t sub_1E4CB71FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAD8, (uint64_t)qword_1EAE90F18, a1);
}

uint64_t sub_1E4CB7220(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F30);
}

uint64_t sub_1E4CB7248()
{
  return sub_1E4CBC23C(&qword_1EAE8FAE0, (uint64_t)qword_1EAE90F30);
}

uint64_t sub_1E4CB726C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAE0, (uint64_t)qword_1EAE90F30, a1);
}

uint64_t sub_1E4CB7290(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F48);
}

uint64_t sub_1E4CB72B8()
{
  return sub_1E4CBC23C(&qword_1EAE8FAE8, (uint64_t)qword_1EAE90F48);
}

uint64_t sub_1E4CB72DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAE8, (uint64_t)qword_1EAE90F48, a1);
}

uint64_t sub_1E4CB7300(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F60);
}

uint64_t sub_1E4CB7328()
{
  return sub_1E4CBC23C(&qword_1EAE8FAF0, (uint64_t)qword_1EAE90F60);
}

uint64_t sub_1E4CB734C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAF0, (uint64_t)qword_1EAE90F60, a1);
}

uint64_t sub_1E4CB7370(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F78);
}

uint64_t sub_1E4CB7398()
{
  return sub_1E4CBC23C(&qword_1EAE8FAF8, (uint64_t)qword_1EAE90F78);
}

uint64_t sub_1E4CB73BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FAF8, (uint64_t)qword_1EAE90F78, a1);
}

uint64_t sub_1E4CB73E0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90F90);
}

uint64_t sub_1E4CB7408()
{
  return sub_1E4CBC23C(&qword_1EAE8FB00, (uint64_t)qword_1EAE90F90);
}

uint64_t sub_1E4CB742C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB00, (uint64_t)qword_1EAE90F90, a1);
}

uint64_t sub_1E4CB7450(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90FA8);
}

uint64_t sub_1E4CB7478()
{
  return sub_1E4CBC23C(&qword_1EAE8FB08, (uint64_t)qword_1EAE90FA8);
}

uint64_t sub_1E4CB749C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB08, (uint64_t)qword_1EAE90FA8, a1);
}

uint64_t sub_1E4CB74C0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90FC0);
}

uint64_t sub_1E4CB74E8()
{
  return sub_1E4CBC23C(&qword_1EAE8FB10, (uint64_t)qword_1EAE90FC0);
}

uint64_t sub_1E4CB750C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB10, (uint64_t)qword_1EAE90FC0, a1);
}

uint64_t sub_1E4CB7530(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90FD8);
}

uint64_t sub_1E4CB7558()
{
  return sub_1E4CBC23C(&qword_1EAE8FB18, (uint64_t)qword_1EAE90FD8);
}

uint64_t sub_1E4CB757C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB18, (uint64_t)qword_1EAE90FD8, a1);
}

uint64_t sub_1E4CB75A0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE90FF0);
}

uint64_t sub_1E4CB75C8()
{
  return sub_1E4CBC23C(&qword_1EAE8FB20, (uint64_t)qword_1EAE90FF0);
}

uint64_t sub_1E4CB75EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB20, (uint64_t)qword_1EAE90FF0, a1);
}

uint64_t sub_1E4CB7610(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91008);
}

uint64_t sub_1E4CB7638()
{
  return sub_1E4CBC23C(&qword_1EAE8FB28, (uint64_t)qword_1EAE91008);
}

uint64_t sub_1E4CB765C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB28, (uint64_t)qword_1EAE91008, a1);
}

uint64_t sub_1E4CB7680(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91020);
}

uint64_t sub_1E4CB76A4()
{
  return sub_1E4CBC23C(&qword_1EAE8FB30, (uint64_t)qword_1EAE91020);
}

uint64_t sub_1E4CB76C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB30, (uint64_t)qword_1EAE91020, a1);
}

uint64_t sub_1E4CB76EC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91038);
}

uint64_t sub_1E4CB7714()
{
  return sub_1E4CBC23C(&qword_1EAE8FB38, (uint64_t)qword_1EAE91038);
}

uint64_t sub_1E4CB7738@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB38, (uint64_t)qword_1EAE91038, a1);
}

uint64_t sub_1E4CB775C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91050);
}

uint64_t sub_1E4CB7784()
{
  return sub_1E4CBC23C(&qword_1EAE8FB40, (uint64_t)qword_1EAE91050);
}

uint64_t sub_1E4CB77A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB40, (uint64_t)qword_1EAE91050, a1);
}

uint64_t sub_1E4CB77CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91068);
}

uint64_t sub_1E4CB77F4()
{
  return sub_1E4CBC23C(&qword_1EAE8FB48, (uint64_t)qword_1EAE91068);
}

uint64_t sub_1E4CB7818@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB48, (uint64_t)qword_1EAE91068, a1);
}

uint64_t sub_1E4CB783C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91080);
}

uint64_t sub_1E4CB7864()
{
  return sub_1E4CBC23C(&qword_1EAE8FB50, (uint64_t)qword_1EAE91080);
}

uint64_t sub_1E4CB7888@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB50, (uint64_t)qword_1EAE91080, a1);
}

uint64_t sub_1E4CB78AC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91098);
}

uint64_t sub_1E4CB78D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FB58, (uint64_t)qword_1EAE91098);
}

uint64_t sub_1E4CB78F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB58, (uint64_t)qword_1EAE91098, a1);
}

uint64_t sub_1E4CB791C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE910B0);
}

uint64_t sub_1E4CB7944()
{
  return sub_1E4CBC23C(&qword_1EAE8FB60, (uint64_t)qword_1EAE910B0);
}

uint64_t sub_1E4CB7968@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB60, (uint64_t)qword_1EAE910B0, a1);
}

uint64_t sub_1E4CB798C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE910C8);
}

uint64_t sub_1E4CB79B4()
{
  return sub_1E4CBC23C(&qword_1EAE8FB68, (uint64_t)qword_1EAE910C8);
}

uint64_t sub_1E4CB79D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB68, (uint64_t)qword_1EAE910C8, a1);
}

uint64_t sub_1E4CB79FC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE910E0);
}

uint64_t sub_1E4CB7A24()
{
  return sub_1E4CBC23C(&qword_1EAE8FB70, (uint64_t)qword_1EAE910E0);
}

uint64_t sub_1E4CB7A48@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB70, (uint64_t)qword_1EAE910E0, a1);
}

uint64_t sub_1E4CB7A6C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE910F8);
}

uint64_t sub_1E4CB7A94()
{
  return sub_1E4CBC23C(&qword_1EAE8FB78, (uint64_t)qword_1EAE910F8);
}

uint64_t sub_1E4CB7AB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB78, (uint64_t)qword_1EAE910F8, a1);
}

uint64_t sub_1E4CB7ADC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91110);
}

uint64_t sub_1E4CB7B04()
{
  return sub_1E4CBC23C(&qword_1EAE8FB80, (uint64_t)qword_1EAE91110);
}

uint64_t sub_1E4CB7B28@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB80, (uint64_t)qword_1EAE91110, a1);
}

uint64_t sub_1E4CB7B4C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91128);
}

uint64_t sub_1E4CB7B70()
{
  return sub_1E4CBC23C(&qword_1EAE8FB88, (uint64_t)qword_1EAE91128);
}

uint64_t sub_1E4CB7B94@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB88, (uint64_t)qword_1EAE91128, a1);
}

uint64_t sub_1E4CB7BB8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91140);
}

uint64_t sub_1E4CB7BE0()
{
  return sub_1E4CBC23C(&qword_1EAE8FB90, (uint64_t)qword_1EAE91140);
}

uint64_t sub_1E4CB7C04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB90, (uint64_t)qword_1EAE91140, a1);
}

uint64_t sub_1E4CB7C28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91158);
}

uint64_t sub_1E4CB7C50()
{
  return sub_1E4CBC23C(&qword_1EAE8FB98, (uint64_t)qword_1EAE91158);
}

uint64_t sub_1E4CB7C74@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FB98, (uint64_t)qword_1EAE91158, a1);
}

uint64_t sub_1E4CB7C98(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91170);
}

uint64_t sub_1E4CB7CC0()
{
  return sub_1E4CBC23C(&qword_1EAE8FBA0, (uint64_t)qword_1EAE91170);
}

uint64_t sub_1E4CB7CE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBA0, (uint64_t)qword_1EAE91170, a1);
}

uint64_t sub_1E4CB7D08(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91188);
}

uint64_t sub_1E4CB7D30()
{
  return sub_1E4CBC23C(&qword_1EAE8FBA8, (uint64_t)qword_1EAE91188);
}

uint64_t sub_1E4CB7D54@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBA8, (uint64_t)qword_1EAE91188, a1);
}

uint64_t sub_1E4CB7D78(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE911A0);
}

uint64_t sub_1E4CB7DA0()
{
  return sub_1E4CBC23C(&qword_1EAE8FBB0, (uint64_t)qword_1EAE911A0);
}

uint64_t sub_1E4CB7DC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBB0, (uint64_t)qword_1EAE911A0, a1);
}

uint64_t sub_1E4CB7DE8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE911B8);
}

uint64_t sub_1E4CB7E10()
{
  return sub_1E4CBC23C(&qword_1EAE8FBB8, (uint64_t)qword_1EAE911B8);
}

uint64_t sub_1E4CB7E34@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBB8, (uint64_t)qword_1EAE911B8, a1);
}

uint64_t sub_1E4CB7E58(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE911D0);
}

uint64_t sub_1E4CB7E80()
{
  return sub_1E4CBC23C(&qword_1EAE8FBC0, (uint64_t)qword_1EAE911D0);
}

uint64_t sub_1E4CB7EA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBC0, (uint64_t)qword_1EAE911D0, a1);
}

uint64_t sub_1E4CB7EC8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE911E8);
}

uint64_t sub_1E4CB7EF0()
{
  return sub_1E4CBC23C(&qword_1EAE8FBC8, (uint64_t)qword_1EAE911E8);
}

uint64_t sub_1E4CB7F14@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBC8, (uint64_t)qword_1EAE911E8, a1);
}

uint64_t sub_1E4CB7F38(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91200);
}

uint64_t sub_1E4CB7F60()
{
  return sub_1E4CBC23C(&qword_1EAE8FBD0, (uint64_t)qword_1EAE91200);
}

uint64_t sub_1E4CB7F84@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBD0, (uint64_t)qword_1EAE91200, a1);
}

uint64_t sub_1E4CB7FA8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91218);
}

uint64_t sub_1E4CB7FD0()
{
  return sub_1E4CBC23C(&qword_1EAE8FBD8, (uint64_t)qword_1EAE91218);
}

uint64_t sub_1E4CB7FF4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBD8, (uint64_t)qword_1EAE91218, a1);
}

uint64_t sub_1E4CB8018(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91230);
}

uint64_t sub_1E4CB803C()
{
  return sub_1E4CBC23C(&qword_1EAE8FBE0, (uint64_t)qword_1EAE91230);
}

uint64_t sub_1E4CB8060@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBE0, (uint64_t)qword_1EAE91230, a1);
}

uint64_t sub_1E4CB8084(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91248);
}

uint64_t sub_1E4CB80AC()
{
  return sub_1E4CBC23C(&qword_1EAE8FBE8, (uint64_t)qword_1EAE91248);
}

uint64_t sub_1E4CB80D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBE8, (uint64_t)qword_1EAE91248, a1);
}

uint64_t sub_1E4CB80F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91260);
}

uint64_t sub_1E4CB811C()
{
  return sub_1E4CBC23C(&qword_1EAE8FBF0, (uint64_t)qword_1EAE91260);
}

uint64_t sub_1E4CB8140@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBF0, (uint64_t)qword_1EAE91260, a1);
}

uint64_t sub_1E4CB8164(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91278);
}

uint64_t sub_1E4CB818C()
{
  return sub_1E4CBC23C(&qword_1EAE8FBF8, (uint64_t)qword_1EAE91278);
}

uint64_t sub_1E4CB81B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FBF8, (uint64_t)qword_1EAE91278, a1);
}

uint64_t sub_1E4CB81D4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91290);
}

uint64_t sub_1E4CB81FC()
{
  return sub_1E4CBC23C(&qword_1EAE8FC00, (uint64_t)qword_1EAE91290);
}

uint64_t sub_1E4CB8220@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC00, (uint64_t)qword_1EAE91290, a1);
}

uint64_t sub_1E4CB8244(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE912A8);
}

uint64_t sub_1E4CB8268()
{
  return sub_1E4CBC23C(&qword_1EAE8FC08, (uint64_t)qword_1EAE912A8);
}

uint64_t sub_1E4CB828C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC08, (uint64_t)qword_1EAE912A8, a1);
}

uint64_t sub_1E4CB82B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE912C0);
}

uint64_t sub_1E4CB82D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FC10, (uint64_t)qword_1EAE912C0);
}

uint64_t sub_1E4CB82F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC10, (uint64_t)qword_1EAE912C0, a1);
}

uint64_t sub_1E4CB831C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE912D8);
}

uint64_t sub_1E4CB8340()
{
  return sub_1E4CBC23C(&qword_1EAE8FC18, (uint64_t)qword_1EAE912D8);
}

uint64_t sub_1E4CB8364@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC18, (uint64_t)qword_1EAE912D8, a1);
}

uint64_t sub_1E4CB8388(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE912F0);
}

uint64_t sub_1E4CB83AC()
{
  return sub_1E4CBC23C(&qword_1EAE8FC20, (uint64_t)qword_1EAE912F0);
}

uint64_t sub_1E4CB83D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC20, (uint64_t)qword_1EAE912F0, a1);
}

uint64_t sub_1E4CB83F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91308);
}

uint64_t sub_1E4CB8418()
{
  return sub_1E4CBC23C(&qword_1EAE8FC28, (uint64_t)qword_1EAE91308);
}

uint64_t sub_1E4CB843C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC28, (uint64_t)qword_1EAE91308, a1);
}

uint64_t sub_1E4CB8460(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91320);
}

uint64_t sub_1E4CB8488()
{
  return sub_1E4CBC23C(&qword_1EAE8FC30, (uint64_t)qword_1EAE91320);
}

uint64_t sub_1E4CB84AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC30, (uint64_t)qword_1EAE91320, a1);
}

uint64_t sub_1E4CB84D0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91338);
}

uint64_t sub_1E4CB84F8()
{
  return sub_1E4CBC23C(&qword_1EAE8FC38, (uint64_t)qword_1EAE91338);
}

uint64_t sub_1E4CB851C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC38, (uint64_t)qword_1EAE91338, a1);
}

uint64_t sub_1E4CB8540(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91350);
}

uint64_t sub_1E4CB8568()
{
  return sub_1E4CBC23C(&qword_1EAE8FC40, (uint64_t)qword_1EAE91350);
}

uint64_t sub_1E4CB858C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC40, (uint64_t)qword_1EAE91350, a1);
}

uint64_t sub_1E4CB85B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91368);
}

uint64_t sub_1E4CB85D8()
{
  return sub_1E4CBC23C(&qword_1EAE8FC48, (uint64_t)qword_1EAE91368);
}

uint64_t sub_1E4CB85FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC48, (uint64_t)qword_1EAE91368, a1);
}

uint64_t sub_1E4CB8620(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91380);
}

uint64_t sub_1E4CB8644()
{
  return sub_1E4CBC23C(&qword_1EAE8FC50, (uint64_t)qword_1EAE91380);
}

uint64_t sub_1E4CB8668@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC50, (uint64_t)qword_1EAE91380, a1);
}

uint64_t sub_1E4CB868C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91398);
}

uint64_t sub_1E4CB86B0()
{
  return sub_1E4CBC23C(&qword_1EAE8FC58, (uint64_t)qword_1EAE91398);
}

uint64_t sub_1E4CB86D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC58, (uint64_t)qword_1EAE91398, a1);
}

uint64_t sub_1E4CB86F8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE913B0);
}

uint64_t sub_1E4CB871C()
{
  return sub_1E4CBC23C(&qword_1EAE8FC60, (uint64_t)qword_1EAE913B0);
}

uint64_t sub_1E4CB8740@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC60, (uint64_t)qword_1EAE913B0, a1);
}

uint64_t sub_1E4CB8764(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE913C8);
}

uint64_t sub_1E4CB8788()
{
  return sub_1E4CBC23C(&qword_1EAE8FC68, (uint64_t)qword_1EAE913C8);
}

uint64_t sub_1E4CB87AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC68, (uint64_t)qword_1EAE913C8, a1);
}

uint64_t sub_1E4CB87D0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE913E0);
}

uint64_t sub_1E4CB87F4()
{
  return sub_1E4CBC23C(&qword_1EAE8FC70, (uint64_t)qword_1EAE913E0);
}

uint64_t sub_1E4CB8818@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC70, (uint64_t)qword_1EAE913E0, a1);
}

uint64_t sub_1E4CB883C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE913F8);
}

uint64_t sub_1E4CB8864()
{
  return sub_1E4CBC23C(&qword_1EAE8FC78, (uint64_t)qword_1EAE913F8);
}

uint64_t sub_1E4CB8888@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC78, (uint64_t)qword_1EAE913F8, a1);
}

uint64_t sub_1E4CB88AC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91410);
}

uint64_t sub_1E4CB88D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FC80, (uint64_t)qword_1EAE91410);
}

uint64_t sub_1E4CB88F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC80, (uint64_t)qword_1EAE91410, a1);
}

uint64_t sub_1E4CB891C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91428);
}

uint64_t sub_1E4CB8944()
{
  return sub_1E4CBC23C(&qword_1EAE8FC88, (uint64_t)qword_1EAE91428);
}

uint64_t sub_1E4CB8968@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC88, (uint64_t)qword_1EAE91428, a1);
}

uint64_t sub_1E4CB898C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91440);
}

uint64_t sub_1E4CB89B4()
{
  return sub_1E4CBC23C(&qword_1EAE8FC90, (uint64_t)qword_1EAE91440);
}

uint64_t sub_1E4CB89D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC90, (uint64_t)qword_1EAE91440, a1);
}

uint64_t sub_1E4CB89FC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91458);
}

uint64_t sub_1E4CB8A20()
{
  return sub_1E4CBC23C(&qword_1EAE8FC98, (uint64_t)qword_1EAE91458);
}

uint64_t sub_1E4CB8A44@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FC98, (uint64_t)qword_1EAE91458, a1);
}

uint64_t sub_1E4CB8A68(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91470);
}

uint64_t sub_1E4CB8A90()
{
  return sub_1E4CBC23C(&qword_1EAE8FCA0, (uint64_t)qword_1EAE91470);
}

uint64_t sub_1E4CB8AB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCA0, (uint64_t)qword_1EAE91470, a1);
}

uint64_t sub_1E4CB8AD8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91488);
}

uint64_t sub_1E4CB8B00()
{
  return sub_1E4CBC23C(&qword_1EAE8FCA8, (uint64_t)qword_1EAE91488);
}

uint64_t sub_1E4CB8B24@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCA8, (uint64_t)qword_1EAE91488, a1);
}

uint64_t sub_1E4CB8B48(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE914A0);
}

uint64_t sub_1E4CB8B70()
{
  return sub_1E4CBC23C(&qword_1EAE8FCB0, (uint64_t)qword_1EAE914A0);
}

uint64_t sub_1E4CB8B94@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCB0, (uint64_t)qword_1EAE914A0, a1);
}

uint64_t sub_1E4CB8BB8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE914B8);
}

uint64_t sub_1E4CB8BE0()
{
  return sub_1E4CBC23C(&qword_1EAE8FCB8, (uint64_t)qword_1EAE914B8);
}

uint64_t sub_1E4CB8C04@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCB8, (uint64_t)qword_1EAE914B8, a1);
}

uint64_t sub_1E4CB8C28(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE914D0);
}

uint64_t sub_1E4CB8C50()
{
  return sub_1E4CBC23C(&qword_1EAE8FCC0, (uint64_t)qword_1EAE914D0);
}

uint64_t sub_1E4CB8C74@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCC0, (uint64_t)qword_1EAE914D0, a1);
}

uint64_t sub_1E4CB8C98(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE914E8);
}

uint64_t sub_1E4CB8CC0()
{
  return sub_1E4CBC23C(&qword_1EAE8FCC8, (uint64_t)qword_1EAE914E8);
}

uint64_t sub_1E4CB8CE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCC8, (uint64_t)qword_1EAE914E8, a1);
}

uint64_t sub_1E4CB8D08(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91500);
}

uint64_t sub_1E4CB8D2C()
{
  return sub_1E4CBC23C(&qword_1EAE8FCD0, (uint64_t)qword_1EAE91500);
}

uint64_t sub_1E4CB8D50@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCD0, (uint64_t)qword_1EAE91500, a1);
}

uint64_t sub_1E4CB8D74(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91518);
}

uint64_t sub_1E4CB8D9C()
{
  return sub_1E4CBC23C(&qword_1EAE8FCD8, (uint64_t)qword_1EAE91518);
}

uint64_t sub_1E4CB8DC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCD8, (uint64_t)qword_1EAE91518, a1);
}

uint64_t sub_1E4CB8DE4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91530);
}

uint64_t sub_1E4CB8E0C()
{
  return sub_1E4CBC23C(&qword_1EAE8FCE0, (uint64_t)qword_1EAE91530);
}

uint64_t sub_1E4CB8E30@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCE0, (uint64_t)qword_1EAE91530, a1);
}

uint64_t sub_1E4CB8E54(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91548);
}

uint64_t sub_1E4CB8E7C()
{
  return sub_1E4CBC23C(&qword_1EAE8FCE8, (uint64_t)qword_1EAE91548);
}

uint64_t sub_1E4CB8EA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCE8, (uint64_t)qword_1EAE91548, a1);
}

uint64_t sub_1E4CB8EC4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91560);
}

uint64_t sub_1E4CB8EEC()
{
  return sub_1E4CBC23C(&qword_1EAE8FCF0, (uint64_t)qword_1EAE91560);
}

uint64_t sub_1E4CB8F10@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCF0, (uint64_t)qword_1EAE91560, a1);
}

uint64_t sub_1E4CB8F34(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91578);
}

uint64_t sub_1E4CB8F5C()
{
  return sub_1E4CBC23C(&qword_1EAE8FCF8, (uint64_t)qword_1EAE91578);
}

uint64_t sub_1E4CB8F80@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FCF8, (uint64_t)qword_1EAE91578, a1);
}

uint64_t sub_1E4CB8FA4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91590);
}

uint64_t sub_1E4CB8FCC()
{
  return sub_1E4CBC23C(&qword_1EAE8FD00, (uint64_t)qword_1EAE91590);
}

uint64_t sub_1E4CB8FF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD00, (uint64_t)qword_1EAE91590, a1);
}

uint64_t sub_1E4CB9014(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE915A8);
}

uint64_t sub_1E4CB9038()
{
  return sub_1E4CBC23C(&qword_1EAE8FD08, (uint64_t)qword_1EAE915A8);
}

uint64_t sub_1E4CB905C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD08, (uint64_t)qword_1EAE915A8, a1);
}

uint64_t sub_1E4CB9080(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE915C0);
}

uint64_t sub_1E4CB90A8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD10, (uint64_t)qword_1EAE915C0);
}

uint64_t sub_1E4CB90CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD10, (uint64_t)qword_1EAE915C0, a1);
}

uint64_t sub_1E4CB90F0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE915D8);
}

uint64_t sub_1E4CB9118()
{
  return sub_1E4CBC23C(&qword_1EAE8FD18, (uint64_t)qword_1EAE915D8);
}

uint64_t sub_1E4CB913C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD18, (uint64_t)qword_1EAE915D8, a1);
}

uint64_t sub_1E4CB9160(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE915F0);
}

uint64_t sub_1E4CB9188()
{
  return sub_1E4CBC23C(&qword_1EAE8FD20, (uint64_t)qword_1EAE915F0);
}

uint64_t sub_1E4CB91AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD20, (uint64_t)qword_1EAE915F0, a1);
}

uint64_t sub_1E4CB91D0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91608);
}

uint64_t sub_1E4CB91F8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD28, (uint64_t)qword_1EAE91608);
}

uint64_t sub_1E4CB921C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD28, (uint64_t)qword_1EAE91608, a1);
}

uint64_t sub_1E4CB9240(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91620);
}

uint64_t sub_1E4CB9268()
{
  return sub_1E4CBC23C(&qword_1EAE8FD30, (uint64_t)qword_1EAE91620);
}

uint64_t sub_1E4CB928C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD30, (uint64_t)qword_1EAE91620, a1);
}

uint64_t sub_1E4CB92B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91638);
}

uint64_t sub_1E4CB92D8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD38, (uint64_t)qword_1EAE91638);
}

uint64_t sub_1E4CB92FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD38, (uint64_t)qword_1EAE91638, a1);
}

uint64_t sub_1E4CB9320(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91650);
}

uint64_t sub_1E4CB9344()
{
  return sub_1E4CBC23C(&qword_1EAE8FD40, (uint64_t)qword_1EAE91650);
}

uint64_t sub_1E4CB9368@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD40, (uint64_t)qword_1EAE91650, a1);
}

uint64_t sub_1E4CB938C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91668);
}

uint64_t sub_1E4CB93A8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD48, (uint64_t)qword_1EAE91668);
}

uint64_t sub_1E4CB93CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD48, (uint64_t)qword_1EAE91668, a1);
}

uint64_t sub_1E4CB93F0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91680);
}

uint64_t sub_1E4CB9410()
{
  return sub_1E4CBC23C(&qword_1EAE8FD50, (uint64_t)qword_1EAE91680);
}

uint64_t sub_1E4CB9434@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD50, (uint64_t)qword_1EAE91680, a1);
}

uint64_t sub_1E4CB9458(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91698);
}

uint64_t sub_1E4CB9478()
{
  return sub_1E4CBC23C(&qword_1EAE8FD58, (uint64_t)qword_1EAE91698);
}

uint64_t sub_1E4CB949C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD58, (uint64_t)qword_1EAE91698, a1);
}

uint64_t sub_1E4CB94C0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE916B0);
}

uint64_t sub_1E4CB94E0()
{
  return sub_1E4CBC23C(&qword_1EAE8FD60, (uint64_t)qword_1EAE916B0);
}

uint64_t sub_1E4CB9504@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD60, (uint64_t)qword_1EAE916B0, a1);
}

uint64_t sub_1E4CB9528(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE916C8);
}

uint64_t sub_1E4CB9544()
{
  return sub_1E4CBC23C(&qword_1EAE8FD68, (uint64_t)qword_1EAE916C8);
}

uint64_t sub_1E4CB9568@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD68, (uint64_t)qword_1EAE916C8, a1);
}

uint64_t sub_1E4CB958C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE916E0);
}

uint64_t sub_1E4CB95A8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD70, (uint64_t)qword_1EAE916E0);
}

uint64_t sub_1E4CB95CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD70, (uint64_t)qword_1EAE916E0, a1);
}

uint64_t sub_1E4CB95F0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE916F8);
}

uint64_t sub_1E4CB9618()
{
  return sub_1E4CBC23C(&qword_1EAE8FD78, (uint64_t)qword_1EAE916F8);
}

uint64_t sub_1E4CB963C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD78, (uint64_t)qword_1EAE916F8, a1);
}

uint64_t sub_1E4CB9660(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91710);
}

uint64_t sub_1E4CB9680()
{
  return sub_1E4CBC23C(&qword_1EAE8FD80, (uint64_t)qword_1EAE91710);
}

uint64_t sub_1E4CB96A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD80, (uint64_t)qword_1EAE91710, a1);
}

uint64_t sub_1E4CB96C8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91728);
}

uint64_t sub_1E4CB96E8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD88, (uint64_t)qword_1EAE91728);
}

uint64_t sub_1E4CB970C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD88, (uint64_t)qword_1EAE91728, a1);
}

uint64_t sub_1E4CB9730(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91740);
}

uint64_t sub_1E4CB9750()
{
  return sub_1E4CBC23C(&qword_1EAE8FD90, (uint64_t)qword_1EAE91740);
}

uint64_t sub_1E4CB9774@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD90, (uint64_t)qword_1EAE91740, a1);
}

uint64_t sub_1E4CB9798(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91758);
}

uint64_t sub_1E4CB97B8()
{
  return sub_1E4CBC23C(&qword_1EAE8FD98, (uint64_t)qword_1EAE91758);
}

uint64_t sub_1E4CB97DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FD98, (uint64_t)qword_1EAE91758, a1);
}

uint64_t sub_1E4CB9800(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91770);
}

uint64_t sub_1E4CB9820()
{
  return sub_1E4CBC23C(&qword_1EAE8FDA0, (uint64_t)qword_1EAE91770);
}

uint64_t sub_1E4CB9844@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDA0, (uint64_t)qword_1EAE91770, a1);
}

uint64_t sub_1E4CB9868(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91788);
}

uint64_t sub_1E4CB9894()
{
  return sub_1E4CBC23C(&qword_1EAE8FDA8, (uint64_t)qword_1EAE91788);
}

uint64_t sub_1E4CB98B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDA8, (uint64_t)qword_1EAE91788, a1);
}

uint64_t sub_1E4CB98DC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE917A0);
}

uint64_t sub_1E4CB9904()
{
  return sub_1E4CBC23C(&qword_1EAE8FDB0, (uint64_t)qword_1EAE917A0);
}

uint64_t sub_1E4CB9928@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDB0, (uint64_t)qword_1EAE917A0, a1);
}

uint64_t sub_1E4CB994C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE917B8);
}

uint64_t sub_1E4CB9974()
{
  return sub_1E4CBC23C(&qword_1EAE8FDB8, (uint64_t)qword_1EAE917B8);
}

uint64_t sub_1E4CB9998@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDB8, (uint64_t)qword_1EAE917B8, a1);
}

uint64_t sub_1E4CB99BC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE917D0);
}

uint64_t sub_1E4CB99E4()
{
  return sub_1E4CBC23C(&qword_1EAE8FDC0, (uint64_t)qword_1EAE917D0);
}

uint64_t sub_1E4CB9A08@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDC0, (uint64_t)qword_1EAE917D0, a1);
}

uint64_t sub_1E4CB9A2C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE917E8);
}

uint64_t sub_1E4CB9A54()
{
  return sub_1E4CBC23C(&qword_1EAE8FDC8, (uint64_t)qword_1EAE917E8);
}

uint64_t sub_1E4CB9A78@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDC8, (uint64_t)qword_1EAE917E8, a1);
}

uint64_t sub_1E4CB9A9C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91800);
}

uint64_t sub_1E4CB9AC4()
{
  return sub_1E4CBC23C(&qword_1EAE8FDD0, (uint64_t)qword_1EAE91800);
}

uint64_t sub_1E4CB9AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDD0, (uint64_t)qword_1EAE91800, a1);
}

uint64_t sub_1E4CB9B0C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91818);
}

uint64_t sub_1E4CB9B30()
{
  return sub_1E4CBC23C(&qword_1EAE8FDD8, (uint64_t)qword_1EAE91818);
}

uint64_t sub_1E4CB9B54@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDD8, (uint64_t)qword_1EAE91818, a1);
}

uint64_t sub_1E4CB9B78(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91830);
}

uint64_t sub_1E4CB9BA0()
{
  return sub_1E4CBC23C(&qword_1EAE8FDE0, (uint64_t)qword_1EAE91830);
}

uint64_t sub_1E4CB9BC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDE0, (uint64_t)qword_1EAE91830, a1);
}

uint64_t sub_1E4CB9BE8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91848);
}

uint64_t sub_1E4CB9C10()
{
  return sub_1E4CBC23C(&qword_1EAE8FDE8, (uint64_t)qword_1EAE91848);
}

uint64_t sub_1E4CB9C34@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDE8, (uint64_t)qword_1EAE91848, a1);
}

uint64_t sub_1E4CB9C58(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91860);
}

uint64_t sub_1E4CB9C80()
{
  return sub_1E4CBC23C(&qword_1EAE8FDF0, (uint64_t)qword_1EAE91860);
}

uint64_t sub_1E4CB9CA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDF0, (uint64_t)qword_1EAE91860, a1);
}

uint64_t sub_1E4CB9CC8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91878);
}

uint64_t sub_1E4CB9CF0()
{
  return sub_1E4CBC23C(&qword_1EAE8FDF8, (uint64_t)qword_1EAE91878);
}

uint64_t sub_1E4CB9D14@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FDF8, (uint64_t)qword_1EAE91878, a1);
}

uint64_t sub_1E4CB9D38(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91890);
}

uint64_t sub_1E4CB9D60()
{
  return sub_1E4CBC23C(&qword_1EAE8FE00, (uint64_t)qword_1EAE91890);
}

uint64_t sub_1E4CB9D84@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE00, (uint64_t)qword_1EAE91890, a1);
}

uint64_t sub_1E4CB9DA8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE918A8);
}

uint64_t sub_1E4CB9DCC()
{
  return sub_1E4CBC23C(&qword_1EAE8FE08, (uint64_t)qword_1EAE918A8);
}

uint64_t sub_1E4CB9DF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE08, (uint64_t)qword_1EAE918A8, a1);
}

uint64_t sub_1E4CB9E14(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE918C0);
}

uint64_t sub_1E4CB9E3C()
{
  return sub_1E4CBC23C(&qword_1EAE8FE10, (uint64_t)qword_1EAE918C0);
}

uint64_t sub_1E4CB9E60@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE10, (uint64_t)qword_1EAE918C0, a1);
}

uint64_t sub_1E4CB9E84(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE918D8);
}

uint64_t sub_1E4CB9EAC()
{
  return sub_1E4CBC23C(&qword_1EAE8FE18, (uint64_t)qword_1EAE918D8);
}

uint64_t sub_1E4CB9ED0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE18, (uint64_t)qword_1EAE918D8, a1);
}

uint64_t sub_1E4CB9EF4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE918F0);
}

uint64_t sub_1E4CB9F1C()
{
  return sub_1E4CBC23C(&qword_1EAE8FE20, (uint64_t)qword_1EAE918F0);
}

uint64_t sub_1E4CB9F40@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE20, (uint64_t)qword_1EAE918F0, a1);
}

uint64_t sub_1E4CB9F64(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91908);
}

uint64_t sub_1E4CB9F8C()
{
  return sub_1E4CBC23C(&qword_1EAE8FE28, (uint64_t)qword_1EAE91908);
}

uint64_t sub_1E4CB9FB0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE28, (uint64_t)qword_1EAE91908, a1);
}

uint64_t sub_1E4CB9FD4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91920);
}

uint64_t sub_1E4CB9FFC()
{
  return sub_1E4CBC23C(&qword_1EAE8FE30, (uint64_t)qword_1EAE91920);
}

uint64_t sub_1E4CBA020@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE30, (uint64_t)qword_1EAE91920, a1);
}

uint64_t sub_1E4CBA044(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91938);
}

uint64_t sub_1E4CBA068()
{
  return sub_1E4CBC23C(&qword_1EAE8FE38, (uint64_t)qword_1EAE91938);
}

uint64_t sub_1E4CBA08C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE38, (uint64_t)qword_1EAE91938, a1);
}

uint64_t sub_1E4CBA0B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91950);
}

uint64_t sub_1E4CBA0D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FE40, (uint64_t)qword_1EAE91950);
}

uint64_t sub_1E4CBA0F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE40, (uint64_t)qword_1EAE91950, a1);
}

uint64_t sub_1E4CBA11C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91968);
}

uint64_t sub_1E4CBA140()
{
  return sub_1E4CBC23C(&qword_1EAE8FE48, (uint64_t)qword_1EAE91968);
}

uint64_t sub_1E4CBA164@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE48, (uint64_t)qword_1EAE91968, a1);
}

uint64_t sub_1E4CBA188(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91980);
}

uint64_t sub_1E4CBA1AC()
{
  return sub_1E4CBC23C(&qword_1EAE8FE50, (uint64_t)qword_1EAE91980);
}

uint64_t sub_1E4CBA1D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE50, (uint64_t)qword_1EAE91980, a1);
}

uint64_t sub_1E4CBA1F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91998);
}

uint64_t sub_1E4CBA218()
{
  return sub_1E4CBC23C(&qword_1EAE8FE58, (uint64_t)qword_1EAE91998);
}

uint64_t sub_1E4CBA23C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE58, (uint64_t)qword_1EAE91998, a1);
}

uint64_t sub_1E4CBA260(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE919B0);
}

uint64_t sub_1E4CBA284()
{
  return sub_1E4CBC23C(&qword_1EAE8FE60, (uint64_t)qword_1EAE919B0);
}

uint64_t sub_1E4CBA2A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE60, (uint64_t)qword_1EAE919B0, a1);
}

uint64_t sub_1E4CBA2CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE919C8);
}

uint64_t sub_1E4CBA2F0()
{
  return sub_1E4CBC23C(&qword_1EAE8FE68, (uint64_t)qword_1EAE919C8);
}

uint64_t sub_1E4CBA314@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE68, (uint64_t)qword_1EAE919C8, a1);
}

uint64_t sub_1E4CBA338(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE919E0);
}

uint64_t sub_1E4CBA35C()
{
  return sub_1E4CBC23C(&qword_1EAE8FE70, (uint64_t)qword_1EAE919E0);
}

uint64_t sub_1E4CBA380@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE70, (uint64_t)qword_1EAE919E0, a1);
}

uint64_t sub_1E4CBA3A4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE919F8);
}

uint64_t sub_1E4CBA3C8()
{
  return sub_1E4CBC23C(&qword_1EAE8FE78, (uint64_t)qword_1EAE919F8);
}

uint64_t sub_1E4CBA3EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE78, (uint64_t)qword_1EAE919F8, a1);
}

uint64_t sub_1E4CBA410(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A10);
}

uint64_t sub_1E4CBA434()
{
  return sub_1E4CBC23C(&qword_1EAE8FE80, (uint64_t)qword_1EAE91A10);
}

uint64_t sub_1E4CBA458@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE80, (uint64_t)qword_1EAE91A10, a1);
}

uint64_t sub_1E4CBA47C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A28);
}

uint64_t sub_1E4CBA4A0()
{
  return sub_1E4CBC23C(&qword_1EAE8FE88, (uint64_t)qword_1EAE91A28);
}

uint64_t sub_1E4CBA4C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE88, (uint64_t)qword_1EAE91A28, a1);
}

uint64_t sub_1E4CBA4E8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A40);
}

uint64_t sub_1E4CBA510()
{
  return sub_1E4CBC23C(&qword_1EAE8FE90, (uint64_t)qword_1EAE91A40);
}

uint64_t sub_1E4CBA534@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE90, (uint64_t)qword_1EAE91A40, a1);
}

uint64_t sub_1E4CBA558(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A58);
}

uint64_t sub_1E4CBA578()
{
  return sub_1E4CBC23C(&qword_1EAE8FE98, (uint64_t)qword_1EAE91A58);
}

uint64_t sub_1E4CBA59C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FE98, (uint64_t)qword_1EAE91A58, a1);
}

uint64_t sub_1E4CBA5C0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A70);
}

uint64_t sub_1E4CBA5E4()
{
  return sub_1E4CBC23C(&qword_1EAE8FEA0, (uint64_t)qword_1EAE91A70);
}

uint64_t sub_1E4CBA608@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEA0, (uint64_t)qword_1EAE91A70, a1);
}

uint64_t sub_1E4CBA62C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91A88);
}

uint64_t sub_1E4CBA658()
{
  return sub_1E4CBC23C(&qword_1EAE8FEA8, (uint64_t)qword_1EAE91A88);
}

uint64_t sub_1E4CBA67C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEA8, (uint64_t)qword_1EAE91A88, a1);
}

uint64_t sub_1E4CBA6A0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91AA0);
}

uint64_t sub_1E4CBA6C4()
{
  return sub_1E4CBC23C(&qword_1EAE8FEB0, (uint64_t)qword_1EAE91AA0);
}

uint64_t sub_1E4CBA6E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEB0, (uint64_t)qword_1EAE91AA0, a1);
}

uint64_t sub_1E4CBA70C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91AB8);
}

uint64_t sub_1E4CBA730()
{
  return sub_1E4CBC23C(&qword_1EAE8FEB8, (uint64_t)qword_1EAE91AB8);
}

uint64_t sub_1E4CBA754@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEB8, (uint64_t)qword_1EAE91AB8, a1);
}

uint64_t sub_1E4CBA778(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91AD0);
}

uint64_t sub_1E4CBA79C()
{
  return sub_1E4CBC23C(&qword_1EAE8FEC0, (uint64_t)qword_1EAE91AD0);
}

uint64_t sub_1E4CBA7C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEC0, (uint64_t)qword_1EAE91AD0, a1);
}

uint64_t sub_1E4CBA7E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91AE8);
}

uint64_t sub_1E4CBA80C()
{
  return sub_1E4CBC23C(&qword_1EAE8FEC8, (uint64_t)qword_1EAE91AE8);
}

uint64_t sub_1E4CBA830@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEC8, (uint64_t)qword_1EAE91AE8, a1);
}

uint64_t sub_1E4CBA854(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B00);
}

uint64_t sub_1E4CBA880()
{
  return sub_1E4CBC23C(&qword_1EAE8FED0, (uint64_t)qword_1EAE91B00);
}

uint64_t sub_1E4CBA8A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FED0, (uint64_t)qword_1EAE91B00, a1);
}

uint64_t sub_1E4CBA8C8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B18);
}

uint64_t sub_1E4CBA8EC()
{
  return sub_1E4CBC23C(&qword_1EAE8FED8, (uint64_t)qword_1EAE91B18);
}

uint64_t sub_1E4CBA910@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FED8, (uint64_t)qword_1EAE91B18, a1);
}

uint64_t sub_1E4CBA934(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B30);
}

uint64_t sub_1E4CBA95C()
{
  return sub_1E4CBC23C(&qword_1EAE8FEE0, (uint64_t)qword_1EAE91B30);
}

uint64_t sub_1E4CBA980@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEE0, (uint64_t)qword_1EAE91B30, a1);
}

uint64_t sub_1E4CBA9A4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B48);
}

uint64_t sub_1E4CBA9C8()
{
  return sub_1E4CBC23C(&qword_1EAE8FEE8, (uint64_t)qword_1EAE91B48);
}

uint64_t sub_1E4CBA9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEE8, (uint64_t)qword_1EAE91B48, a1);
}

uint64_t sub_1E4CBAA10(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B60);
}

uint64_t sub_1E4CBAA3C()
{
  return sub_1E4CBC23C(&qword_1EAE8FEF0, (uint64_t)qword_1EAE91B60);
}

uint64_t sub_1E4CBAA60@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEF0, (uint64_t)qword_1EAE91B60, a1);
}

uint64_t sub_1E4CBAA84(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B78);
}

uint64_t sub_1E4CBAAB0()
{
  return sub_1E4CBC23C(&qword_1EAE8FEF8, (uint64_t)qword_1EAE91B78);
}

uint64_t sub_1E4CBAAD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FEF8, (uint64_t)qword_1EAE91B78, a1);
}

uint64_t sub_1E4CBAAF8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91B90);
}

uint64_t sub_1E4CBAB1C()
{
  return sub_1E4CBC23C(&qword_1EAE8FF00, (uint64_t)qword_1EAE91B90);
}

uint64_t sub_1E4CBAB40@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF00, (uint64_t)qword_1EAE91B90, a1);
}

uint64_t sub_1E4CBAB64(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91BA8);
}

uint64_t sub_1E4CBAB88()
{
  return sub_1E4CBC23C(&qword_1EAE8FF08, (uint64_t)qword_1EAE91BA8);
}

uint64_t sub_1E4CBABAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF08, (uint64_t)qword_1EAE91BA8, a1);
}

uint64_t sub_1E4CBABD0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91BC0);
}

uint64_t sub_1E4CBABF4()
{
  return sub_1E4CBC23C(&qword_1EAE8FF10, (uint64_t)qword_1EAE91BC0);
}

uint64_t sub_1E4CBAC18@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF10, (uint64_t)qword_1EAE91BC0, a1);
}

uint64_t sub_1E4CBAC3C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91BD8);
}

uint64_t sub_1E4CBAC60()
{
  return sub_1E4CBC23C(&qword_1EAE8FF18, (uint64_t)qword_1EAE91BD8);
}

uint64_t sub_1E4CBAC84@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF18, (uint64_t)qword_1EAE91BD8, a1);
}

uint64_t sub_1E4CBACA8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91BF0);
}

uint64_t sub_1E4CBACCC()
{
  return sub_1E4CBC23C(&qword_1EAE8FF20, (uint64_t)qword_1EAE91BF0);
}

uint64_t sub_1E4CBACF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF20, (uint64_t)qword_1EAE91BF0, a1);
}

uint64_t sub_1E4CBAD14(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C08);
}

uint64_t sub_1E4CBAD3C()
{
  return sub_1E4CBC23C(&qword_1EAE8FF28, (uint64_t)qword_1EAE91C08);
}

uint64_t sub_1E4CBAD60@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF28, (uint64_t)qword_1EAE91C08, a1);
}

uint64_t sub_1E4CBAD84(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C20);
}

uint64_t sub_1E4CBADA8()
{
  return sub_1E4CBC23C(&qword_1EAE8FF30, (uint64_t)qword_1EAE91C20);
}

uint64_t sub_1E4CBADCC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF30, (uint64_t)qword_1EAE91C20, a1);
}

uint64_t sub_1E4CBADF0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C38);
}

uint64_t sub_1E4CBAE14()
{
  return sub_1E4CBC23C(&qword_1EAE8FF38, (uint64_t)qword_1EAE91C38);
}

uint64_t sub_1E4CBAE38@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF38, (uint64_t)qword_1EAE91C38, a1);
}

uint64_t sub_1E4CBAE5C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C50);
}

uint64_t sub_1E4CBAE80()
{
  return sub_1E4CBC23C(&qword_1EAE8FF40, (uint64_t)qword_1EAE91C50);
}

uint64_t sub_1E4CBAEA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF40, (uint64_t)qword_1EAE91C50, a1);
}

uint64_t sub_1E4CBAEC8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C68);
}

uint64_t sub_1E4CBAEEC()
{
  return sub_1E4CBC23C(&qword_1EAE8FF48, (uint64_t)qword_1EAE91C68);
}

uint64_t sub_1E4CBAF10@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF48, (uint64_t)qword_1EAE91C68, a1);
}

uint64_t sub_1E4CBAF34(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C80);
}

uint64_t sub_1E4CBAF58()
{
  return sub_1E4CBC23C(&qword_1EAE8FF50, (uint64_t)qword_1EAE91C80);
}

uint64_t sub_1E4CBAF7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF50, (uint64_t)qword_1EAE91C80, a1);
}

uint64_t sub_1E4CBAFA0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91C98);
}

uint64_t sub_1E4CBAFC4()
{
  return sub_1E4CBC23C(&qword_1EAE8FF58, (uint64_t)qword_1EAE91C98);
}

uint64_t sub_1E4CBAFE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF58, (uint64_t)qword_1EAE91C98, a1);
}

uint64_t sub_1E4CBB00C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91CB0);
}

uint64_t sub_1E4CBB030()
{
  return sub_1E4CBC23C(&qword_1EAE8FF60, (uint64_t)qword_1EAE91CB0);
}

uint64_t sub_1E4CBB054@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF60, (uint64_t)qword_1EAE91CB0, a1);
}

uint64_t sub_1E4CBB078(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91CC8);
}

uint64_t sub_1E4CBB09C()
{
  return sub_1E4CBC23C(&qword_1EAE8FF68, (uint64_t)qword_1EAE91CC8);
}

uint64_t sub_1E4CBB0C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF68, (uint64_t)qword_1EAE91CC8, a1);
}

uint64_t sub_1E4CBB0E4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91CE0);
}

uint64_t sub_1E4CBB108()
{
  return sub_1E4CBC23C(&qword_1EAE8FF70, (uint64_t)qword_1EAE91CE0);
}

uint64_t sub_1E4CBB12C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF70, (uint64_t)qword_1EAE91CE0, a1);
}

uint64_t sub_1E4CBB150(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91CF8);
}

uint64_t sub_1E4CBB174()
{
  return sub_1E4CBC23C(&qword_1EAE8FF78, (uint64_t)qword_1EAE91CF8);
}

uint64_t sub_1E4CBB198@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF78, (uint64_t)qword_1EAE91CF8, a1);
}

uint64_t sub_1E4CBB1BC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D10);
}

uint64_t sub_1E4CBB1E0()
{
  return sub_1E4CBC23C(&qword_1EAE8FF80, (uint64_t)qword_1EAE91D10);
}

uint64_t sub_1E4CBB204@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF80, (uint64_t)qword_1EAE91D10, a1);
}

uint64_t sub_1E4CBB228(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D28);
}

uint64_t sub_1E4CBB24C()
{
  return sub_1E4CBC23C(&qword_1EAE8FF88, (uint64_t)qword_1EAE91D28);
}

uint64_t sub_1E4CBB270@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF88, (uint64_t)qword_1EAE91D28, a1);
}

uint64_t sub_1E4CBB294(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D40);
}

uint64_t sub_1E4CBB2B8()
{
  return sub_1E4CBC23C(&qword_1EAE8FF90, (uint64_t)qword_1EAE91D40);
}

uint64_t sub_1E4CBB2DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF90, (uint64_t)qword_1EAE91D40, a1);
}

uint64_t sub_1E4CBB300(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D58);
}

uint64_t sub_1E4CBB324()
{
  return sub_1E4CBC23C(&qword_1EAE8FF98, (uint64_t)qword_1EAE91D58);
}

uint64_t sub_1E4CBB348@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FF98, (uint64_t)qword_1EAE91D58, a1);
}

uint64_t sub_1E4CBB36C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D70);
}

uint64_t sub_1E4CBB390()
{
  return sub_1E4CBC23C(&qword_1EAE8FFA0, (uint64_t)qword_1EAE91D70);
}

uint64_t sub_1E4CBB3B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFA0, (uint64_t)qword_1EAE91D70, a1);
}

uint64_t sub_1E4CBB3D8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91D88);
}

uint64_t sub_1E4CBB3FC()
{
  return sub_1E4CBC23C(&qword_1EAE8FFA8, (uint64_t)qword_1EAE91D88);
}

uint64_t sub_1E4CBB420@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFA8, (uint64_t)qword_1EAE91D88, a1);
}

uint64_t sub_1E4CBB444(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91DA0);
}

uint64_t sub_1E4CBB468()
{
  return sub_1E4CBC23C(&qword_1EAE8FFB0, (uint64_t)qword_1EAE91DA0);
}

uint64_t sub_1E4CBB48C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFB0, (uint64_t)qword_1EAE91DA0, a1);
}

uint64_t sub_1E4CBB4B0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91DB8);
}

uint64_t sub_1E4CBB4D4()
{
  return sub_1E4CBC23C(&qword_1EAE8FFB8, (uint64_t)qword_1EAE91DB8);
}

uint64_t sub_1E4CBB4F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFB8, (uint64_t)qword_1EAE91DB8, a1);
}

uint64_t sub_1E4CBB51C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91DD0);
}

uint64_t sub_1E4CBB540()
{
  return sub_1E4CBC23C(&qword_1EAE8FFC0, (uint64_t)qword_1EAE91DD0);
}

uint64_t sub_1E4CBB564@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFC0, (uint64_t)qword_1EAE91DD0, a1);
}

uint64_t sub_1E4CBB588(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91DE8);
}

uint64_t sub_1E4CBB5AC()
{
  return sub_1E4CBC23C(&qword_1EAE8FFC8, (uint64_t)qword_1EAE91DE8);
}

uint64_t sub_1E4CBB5D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFC8, (uint64_t)qword_1EAE91DE8, a1);
}

uint64_t sub_1E4CBB5F4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E00);
}

uint64_t sub_1E4CBB618()
{
  return sub_1E4CBC23C(&qword_1EAE8FFD0, (uint64_t)qword_1EAE91E00);
}

uint64_t sub_1E4CBB63C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFD0, (uint64_t)qword_1EAE91E00, a1);
}

uint64_t sub_1E4CBB660(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E18);
}

uint64_t sub_1E4CBB684()
{
  return sub_1E4CBC23C(&qword_1EAE8FFD8, (uint64_t)qword_1EAE91E18);
}

uint64_t sub_1E4CBB6A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFD8, (uint64_t)qword_1EAE91E18, a1);
}

uint64_t sub_1E4CBB6CC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E30);
}

uint64_t sub_1E4CBB6E4()
{
  return sub_1E4CBC23C(&qword_1EAE8FFE0, (uint64_t)qword_1EAE91E30);
}

uint64_t sub_1E4CBB708@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFE0, (uint64_t)qword_1EAE91E30, a1);
}

uint64_t sub_1E4CBB72C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E48);
}

uint64_t sub_1E4CBB750()
{
  return sub_1E4CBC23C(&qword_1EAE8FFE8, (uint64_t)qword_1EAE91E48);
}

uint64_t sub_1E4CBB774@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFE8, (uint64_t)qword_1EAE91E48, a1);
}

uint64_t sub_1E4CBB798(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E60);
}

uint64_t sub_1E4CBB7BC()
{
  return sub_1E4CBC23C(&qword_1EAE8FFF0, (uint64_t)qword_1EAE91E60);
}

uint64_t sub_1E4CBB7E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFF0, (uint64_t)qword_1EAE91E60, a1);
}

uint64_t sub_1E4CBB804(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E78);
}

uint64_t sub_1E4CBB828()
{
  return sub_1E4CBC23C(&qword_1EAE8FFF8, (uint64_t)qword_1EAE91E78);
}

uint64_t sub_1E4CBB84C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE8FFF8, (uint64_t)qword_1EAE91E78, a1);
}

uint64_t sub_1E4CBB870(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91E90);
}

uint64_t sub_1E4CBB894()
{
  return sub_1E4CBC23C(&qword_1EAE90000, (uint64_t)qword_1EAE91E90);
}

uint64_t sub_1E4CBB8B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90000, (uint64_t)qword_1EAE91E90, a1);
}

uint64_t sub_1E4CBB8DC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91EA8);
}

uint64_t sub_1E4CBB900()
{
  return sub_1E4CBC23C(&qword_1EAE90008, (uint64_t)qword_1EAE91EA8);
}

uint64_t sub_1E4CBB924@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90008, (uint64_t)qword_1EAE91EA8, a1);
}

uint64_t sub_1E4CBB948(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91EC0);
}

uint64_t sub_1E4CBB96C()
{
  return sub_1E4CBC23C(&qword_1EAE90010, (uint64_t)qword_1EAE91EC0);
}

uint64_t sub_1E4CBB990@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90010, (uint64_t)qword_1EAE91EC0, a1);
}

uint64_t sub_1E4CBB9B4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91ED8);
}

uint64_t sub_1E4CBB9D8()
{
  return sub_1E4CBC23C(&qword_1EAE90018, (uint64_t)qword_1EAE91ED8);
}

uint64_t sub_1E4CBB9FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90018, (uint64_t)qword_1EAE91ED8, a1);
}

uint64_t sub_1E4CBBA20(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91EF0);
}

uint64_t sub_1E4CBBA44()
{
  return sub_1E4CBC23C(&qword_1EAE90020, (uint64_t)qword_1EAE91EF0);
}

uint64_t sub_1E4CBBA68@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90020, (uint64_t)qword_1EAE91EF0, a1);
}

uint64_t sub_1E4CBBA8C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F08);
}

uint64_t sub_1E4CBBAB0()
{
  return sub_1E4CBC23C(&qword_1EAE90028, (uint64_t)qword_1EAE91F08);
}

uint64_t sub_1E4CBBAD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90028, (uint64_t)qword_1EAE91F08, a1);
}

uint64_t sub_1E4CBBAF8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F20);
}

uint64_t sub_1E4CBBB1C()
{
  return sub_1E4CBC23C(&qword_1EAE90030, (uint64_t)qword_1EAE91F20);
}

uint64_t sub_1E4CBBB40@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90030, (uint64_t)qword_1EAE91F20, a1);
}

uint64_t sub_1E4CBBB64(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F38);
}

uint64_t sub_1E4CBBB88()
{
  return sub_1E4CBC23C(&qword_1EAE90038, (uint64_t)qword_1EAE91F38);
}

uint64_t sub_1E4CBBBAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90038, (uint64_t)qword_1EAE91F38, a1);
}

uint64_t sub_1E4CBBBD0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F50);
}

uint64_t sub_1E4CBBBF4()
{
  return sub_1E4CBC23C(&qword_1EAE90040, (uint64_t)qword_1EAE91F50);
}

uint64_t sub_1E4CBBC18@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90040, (uint64_t)qword_1EAE91F50, a1);
}

uint64_t sub_1E4CBBC3C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F68);
}

uint64_t sub_1E4CBBC60()
{
  return sub_1E4CBC23C(&qword_1EAE90048, (uint64_t)qword_1EAE91F68);
}

uint64_t sub_1E4CBBC84@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90048, (uint64_t)qword_1EAE91F68, a1);
}

uint64_t sub_1E4CBBCA8(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F80);
}

uint64_t sub_1E4CBBCCC()
{
  return sub_1E4CBC23C(&qword_1EAE90050, (uint64_t)qword_1EAE91F80);
}

uint64_t sub_1E4CBBCF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90050, (uint64_t)qword_1EAE91F80, a1);
}

uint64_t sub_1E4CBBD14(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91F98);
}

uint64_t sub_1E4CBBD38()
{
  return sub_1E4CBC23C(&qword_1EAE90058, (uint64_t)qword_1EAE91F98);
}

uint64_t sub_1E4CBBD5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90058, (uint64_t)qword_1EAE91F98, a1);
}

uint64_t sub_1E4CBBD80(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91FB0);
}

uint64_t sub_1E4CBBDA4()
{
  return sub_1E4CBC23C(&qword_1EAE90060, (uint64_t)qword_1EAE91FB0);
}

uint64_t sub_1E4CBBDC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90060, (uint64_t)qword_1EAE91FB0, a1);
}

uint64_t sub_1E4CBBDEC(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91FC8);
}

uint64_t sub_1E4CBBE10()
{
  return sub_1E4CBC23C(&qword_1EAE90068, (uint64_t)qword_1EAE91FC8);
}

uint64_t sub_1E4CBBE34@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90068, (uint64_t)qword_1EAE91FC8, a1);
}

uint64_t sub_1E4CBBE58(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91FE0);
}

uint64_t sub_1E4CBBE7C()
{
  return sub_1E4CBC23C(&qword_1EAE90070, (uint64_t)qword_1EAE91FE0);
}

uint64_t sub_1E4CBBEA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90070, (uint64_t)qword_1EAE91FE0, a1);
}

uint64_t sub_1E4CBBEC4(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE91FF8);
}

uint64_t sub_1E4CBBEE8()
{
  return sub_1E4CBC23C(&qword_1EAE90078, (uint64_t)qword_1EAE91FF8);
}

uint64_t sub_1E4CBBF0C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90078, (uint64_t)qword_1EAE91FF8, a1);
}

uint64_t sub_1E4CBBF30(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92010);
}

uint64_t sub_1E4CBBF54()
{
  return sub_1E4CBC23C(&qword_1EAE90080, (uint64_t)qword_1EAE92010);
}

uint64_t sub_1E4CBBF78@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90080, (uint64_t)qword_1EAE92010, a1);
}

uint64_t sub_1E4CBBF9C(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92028);
}

uint64_t sub_1E4CBBFC0()
{
  return sub_1E4CBC23C(&qword_1EAE90088, (uint64_t)qword_1EAE92028);
}

uint64_t sub_1E4CBBFE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90088, (uint64_t)qword_1EAE92028, a1);
}

uint64_t sub_1E4CBC008(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92040);
}

uint64_t sub_1E4CBC02C()
{
  return sub_1E4CBC23C(&qword_1EAE90090, (uint64_t)qword_1EAE92040);
}

uint64_t sub_1E4CBC050@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90090, (uint64_t)qword_1EAE92040, a1);
}

uint64_t sub_1E4CBC074(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92058);
}

uint64_t sub_1E4CBC098()
{
  return sub_1E4CBC23C(&qword_1EAE90098, (uint64_t)qword_1EAE92058);
}

uint64_t sub_1E4CBC0BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE90098, (uint64_t)qword_1EAE92058, a1);
}

uint64_t sub_1E4CBC0E0(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92070);
}

uint64_t sub_1E4CBC108()
{
  return sub_1E4CBC23C(&qword_1EAE900A0, (uint64_t)qword_1EAE92070);
}

uint64_t sub_1E4CBC12C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE900A0, (uint64_t)qword_1EAE92070, a1);
}

uint64_t sub_1E4CBC150(uint64_t a1)
{
  return sub_1E4CBC174(a1, qword_1EAE92088);
}

uint64_t sub_1E4CBC174(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1E4CBEE40();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EAE8F640 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EAE8F648;
  return sub_1E4CBEE30();
}

uint64_t sub_1E4CBC218()
{
  return sub_1E4CBC23C(&qword_1EAE900A8, (uint64_t)qword_1EAE92088);
}

uint64_t sub_1E4CBC23C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1E4CBEE40();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1E4CBC290@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4CBC2B4(&qword_1EAE900A8, (uint64_t)qword_1EAE92088, a1);
}

uint64_t sub_1E4CBC2B4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E4CBEE40();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getHearingModeUIServiceClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *HearingModeSettingsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BTSDeviceConfigController.m", 81, @"%s", *a1);

  __break(1u);
}

void __getHearingModeUIServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getHearingModeUIServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BTSDeviceConfigController.m", 83, @"Unable to find class %s", "HearingModeUIService");

  __break(1u);
}

uint64_t sub_1E4CBE8B0()
{
  return off_1F40E3F58();
}

uint64_t sub_1E4CBE8C0()
{
  return aNpointcolor();
}

uint64_t sub_1E4CBE8D0()
{
  return (*(uint64_t (**)(void))&aTextloupevisib[8])();
}

uint64_t sub_1E4CBE8E0()
{
  return off_1F40E49A0();
}

uint64_t sub_1E4CBE8F0()
{
  return aInputcontexthi();
}

uint64_t sub_1E4CBE900()
{
  return (*(uint64_t (**)(void))&aTUisupplementa[8])();
}

uint64_t sub_1E4CBE910()
{
  return aInlinecompleti();
}

uint64_t sub_1E4CBE920()
{
  return off_1F40E4D48();
}

uint64_t sub_1E4CBE930()
{
  return off_1F40E4DA8();
}

uint64_t sub_1E4CBE940()
{
  return aInsertattribut();
}

uint64_t sub_1E4CBE950()
{
  return (*(uint64_t (**)(void))&aCarettransform_0[16])();
}

uint64_t sub_1E4CBE960()
{
  return (*(uint64_t (**)(void))&aChoosesuppleme[40])();
}

uint64_t sub_1E4CBE970()
{
  return off_1F40E5840();
}

uint64_t sub_1E4CBE980()
{
  return aConvertpointto();
}

uint64_t sub_1E4CBE990()
{
  return off_1F40E5E68();
}

uint64_t sub_1E4CBE9A0()
{
  return off_1F40E5EA0();
}

uint64_t sub_1E4CBE9B0()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1E4CBE9C0()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1E4CBE9D0()
{
  return off_1F40E5EF0();
}

uint64_t sub_1E4CBE9F0()
{
  return MEMORY[0x1F4146340]();
}

uint64_t sub_1E4CBEA00()
{
  return MEMORY[0x1F4146348]();
}

uint64_t sub_1E4CBEA10()
{
  return MEMORY[0x1F4146350]();
}

uint64_t sub_1E4CBEA20()
{
  return MEMORY[0x1F4146358]();
}

uint64_t sub_1E4CBEA30()
{
  return MEMORY[0x1F4146360]();
}

uint64_t sub_1E4CBEA40()
{
  return MEMORY[0x1F4146368]();
}

uint64_t sub_1E4CBEA50()
{
  return MEMORY[0x1F4146370]();
}

uint64_t sub_1E4CBEA60()
{
  return MEMORY[0x1F4146378]();
}

uint64_t sub_1E4CBEA70()
{
  return MEMORY[0x1F4146380]();
}

uint64_t sub_1E4CBEA80()
{
  return MEMORY[0x1F4146388]();
}

uint64_t sub_1E4CBEA90()
{
  return MEMORY[0x1F4146390]();
}

uint64_t sub_1E4CBEAA0()
{
  return MEMORY[0x1F4146398]();
}

uint64_t sub_1E4CBEAB0()
{
  return MEMORY[0x1F41463A0]();
}

uint64_t sub_1E4CBEAC0()
{
  return MEMORY[0x1F411CC90]();
}

uint64_t sub_1E4CBEAD0()
{
  return MEMORY[0x1F411CC98]();
}

uint64_t sub_1E4CBEAE0()
{
  return MEMORY[0x1F411CCA0]();
}

uint64_t sub_1E4CBEAF0()
{
  return MEMORY[0x1F411CCA8]();
}

uint64_t sub_1E4CBEB00()
{
  return MEMORY[0x1F411CCB0]();
}

uint64_t sub_1E4CBEB10()
{
  return MEMORY[0x1F411CCB8]();
}

uint64_t sub_1E4CBEB20()
{
  return MEMORY[0x1F411CCC0]();
}

uint64_t sub_1E4CBEB30()
{
  return MEMORY[0x1F411CCC8]();
}

uint64_t sub_1E4CBEB40()
{
  return MEMORY[0x1F411CCD0]();
}

uint64_t sub_1E4CBEB50()
{
  return MEMORY[0x1F411CCD8]();
}

uint64_t sub_1E4CBEB60()
{
  return MEMORY[0x1F411CCE0]();
}

uint64_t sub_1E4CBEB70()
{
  return MEMORY[0x1F411CCE8]();
}

uint64_t sub_1E4CBEB80()
{
  return MEMORY[0x1F411CCF0]();
}

uint64_t sub_1E4CBEB90()
{
  return MEMORY[0x1F411CCF8]();
}

uint64_t sub_1E4CBEBA0()
{
  return MEMORY[0x1F411CD00]();
}

uint64_t sub_1E4CBEBB0()
{
  return MEMORY[0x1F411CD08]();
}

uint64_t sub_1E4CBEBC0()
{
  return MEMORY[0x1F411CD10]();
}

uint64_t sub_1E4CBEBD0()
{
  return MEMORY[0x1F411CD18]();
}

uint64_t sub_1E4CBEBE0()
{
  return MEMORY[0x1F411CD20]();
}

uint64_t sub_1E4CBEBF0()
{
  return MEMORY[0x1F411CD28]();
}

uint64_t sub_1E4CBEC00()
{
  return MEMORY[0x1F411CD30]();
}

uint64_t sub_1E4CBEC10()
{
  return MEMORY[0x1F411CD38]();
}

uint64_t sub_1E4CBEC20()
{
  return MEMORY[0x1F411CD40]();
}

uint64_t sub_1E4CBEC30()
{
  return MEMORY[0x1F411CD48]();
}

uint64_t sub_1E4CBEC40()
{
  return MEMORY[0x1F411CD50]();
}

uint64_t sub_1E4CBEC50()
{
  return MEMORY[0x1F411CD58]();
}

uint64_t sub_1E4CBEC60()
{
  return MEMORY[0x1F411CD60]();
}

uint64_t sub_1E4CBEC70()
{
  return MEMORY[0x1F411CD68]();
}

uint64_t sub_1E4CBEC80()
{
  return MEMORY[0x1F411CD70]();
}

uint64_t sub_1E4CBEC90()
{
  return MEMORY[0x1F411CD78]();
}

uint64_t sub_1E4CBECA0()
{
  return MEMORY[0x1F411CD80]();
}

uint64_t sub_1E4CBECB0()
{
  return MEMORY[0x1F411CD88]();
}

uint64_t sub_1E4CBECC0()
{
  return MEMORY[0x1F411CD90]();
}

uint64_t sub_1E4CBECD0()
{
  return MEMORY[0x1F411CD98]();
}

uint64_t sub_1E4CBECE0()
{
  return MEMORY[0x1F411CDA0]();
}

uint64_t sub_1E4CBECF0()
{
  return MEMORY[0x1F411CDA8]();
}

uint64_t sub_1E4CBED00()
{
  return MEMORY[0x1F411CDB0]();
}

uint64_t sub_1E4CBED10()
{
  return MEMORY[0x1F411CDB8]();
}

uint64_t sub_1E4CBED20()
{
  return MEMORY[0x1F411CDC0]();
}

uint64_t sub_1E4CBED30()
{
  return MEMORY[0x1F411CDC8]();
}

uint64_t sub_1E4CBED40()
{
  return MEMORY[0x1F411CDD0]();
}

uint64_t sub_1E4CBED50()
{
  return MEMORY[0x1F411CDD8]();
}

uint64_t sub_1E4CBED60()
{
  return MEMORY[0x1F411CDE0]();
}

uint64_t sub_1E4CBED70()
{
  return MEMORY[0x1F411CDE8]();
}

uint64_t sub_1E4CBED80()
{
  return MEMORY[0x1F411CDF0]();
}

uint64_t sub_1E4CBED90()
{
  return MEMORY[0x1F411CDF8]();
}

uint64_t sub_1E4CBEDA0()
{
  return MEMORY[0x1F411CE00]();
}

uint64_t sub_1E4CBEDB0()
{
  return MEMORY[0x1F411CE08]();
}

uint64_t sub_1E4CBEDC0()
{
  return MEMORY[0x1F411CE10]();
}

uint64_t sub_1E4CBEDD0()
{
  return MEMORY[0x1F411CE18]();
}

uint64_t sub_1E4CBEDE0()
{
  return MEMORY[0x1F411CE20]();
}

uint64_t sub_1E4CBEDF0()
{
  return MEMORY[0x1F411CE28]();
}

uint64_t sub_1E4CBEE00()
{
  return MEMORY[0x1F411CE30]();
}

uint64_t sub_1E4CBEE10()
{
  return MEMORY[0x1F411CE38]();
}

uint64_t sub_1E4CBEE20()
{
  return MEMORY[0x1F411CE40]();
}

uint64_t sub_1E4CBEE30()
{
  return off_1F40E05E0();
}

uint64_t sub_1E4CBEE40()
{
  return off_1F40E05E8();
}

uint64_t sub_1E4CBEE50()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1E4CBEE60()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1E4CBEE70()
{
  return MEMORY[0x1F411CE48]();
}

uint64_t sub_1E4CBEE80()
{
  return MEMORY[0x1F411CE50]();
}

uint64_t sub_1E4CBEE90()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E4CBEEA0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E4CBEEB0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E4CBEEC0()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1E4CBEED0()
{
  return MEMORY[0x1F4165D70]();
}

uint64_t sub_1E4CBEEE0()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1E4CBEEF0()
{
  return MEMORY[0x1F4165DE0]();
}

uint64_t sub_1E4CBEF00()
{
  return MEMORY[0x1F4165DE8]();
}

uint64_t sub_1E4CBEF10()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1E4CBEF20()
{
  return MEMORY[0x1F4165E08]();
}

uint64_t sub_1E4CBEF30()
{
  return MEMORY[0x1F4165E28]();
}

uint64_t sub_1E4CBEF40()
{
  return MEMORY[0x1F4165E30]();
}

uint64_t sub_1E4CBEF50()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1E4CBEF60()
{
  return MEMORY[0x1F4165ED8]();
}

uint64_t sub_1E4CBEF70()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1E4CBEF80()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1E4CBEF90()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1E4CBEFA0()
{
  return ((uint64_t (*)(void))UINavigationController__classData.base_prots)();
}

uint64_t sub_1E4CBEFB0()
{
  return sel_isPresentingWrongEar();
}

uint64_t sub_1E4CBEFC0()
{
  return (*(uint64_t (**)(void))&sel_showOcclusionContinueButton[8])();
}

uint64_t sub_1E4CBEFD0()
{
  return sel_startEarDistanceWarnCoolDownTimer();
}

uint64_t sub_1E4CBEFE0()
{
  return sel_startEnrollGuidanceTimer();
}

uint64_t sub_1E4CBEFF0()
{
  return (*(uint64_t (**)(void))&sel_triggerEarDistanceWarnCoolDownTimer[8])();
}

uint64_t sub_1E4CBF000()
{
  return (*(uint64_t (**)(void))&sel_triggerEarDistanceWarnCoolDownTimer[24])();
}

uint64_t sub_1E4CBF010()
{
  return off_1F40D6B80();
}

uint64_t sub_1E4CBF020()
{
  return sel_updateEarEnrollText();
}

uint64_t sub_1E4CBF030()
{
  return (*(&sel_updateEarEnrollText + 1))();
}

uint64_t sub_1E4CBF040()
{
  return (*(&sel_updateEarEnrollText + 2))();
}

#error "1E4CBF05C: call analysis failed (funcsize=3)"

uint64_t sub_1E4CBF060()
{
  return off_1F40D6BA8();
}

uint64_t sub_1E4CBF070()
{
  return (*(uint64_t (**)(void))&sel_observeValueForKeyPath_ofObject_change_context_[40])();
}

uint64_t sub_1E4CBF080()
{
  return (*(uint64_t (**)(void))&sel_startPlayerRightEar[8])();
}

uint64_t sub_1E4CBF090()
{
  return off_1F40D6CB0();
}

uint64_t sub_1E4CBF0A0()
{
  return (*(uint64_t (**)(void))&aDistributionar[8])();
}

uint64_t sub_1E4CBF0B0()
{
  return (*(uint64_t (**)(void))&aDistributionar[24])();
}

uint64_t sub_1E4CBF0C0()
{
  return OBJC_IVAR___UIStackView__alignmentArrangement();
}

uint64_t sub_1E4CBF0D0()
{
  return (*(uint64_t (**)(void))&aUialignedlayou[24])();
}

uint64_t sub_1E4CBF0E0()
{
  return (*(uint64_t (**)(void))&aDidrequesttall[24])();
}

uint64_t sub_1E4CBF0F0()
{
  return (*(uint64_t (**)(void))&aDidrequesttall[32])();
}

uint64_t sub_1E4CBF100()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1E4CBF110()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1E4CBF120()
{
  return MEMORY[0x1F4119188]();
}

uint64_t sub_1E4CBF130()
{
  return MEMORY[0x1F4119190]();
}

uint64_t sub_1E4CBF140()
{
  return MEMORY[0x1F4119198]();
}

uint64_t sub_1E4CBF150()
{
  return MEMORY[0x1F41191A0]();
}

uint64_t sub_1E4CBF160()
{
  return MEMORY[0x1F41191D8]();
}

uint64_t sub_1E4CBF170()
{
  return MEMORY[0x1F41191E0]();
}

uint64_t sub_1E4CBF180()
{
  return off_1F40E6000();
}

uint64_t sub_1E4CBF190()
{
  return off_1F40E6030();
}

uint64_t sub_1E4CBF1A0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1E4CBF1B0()
{
  return MEMORY[0x1F41833F0]();
}

uint64_t sub_1E4CBF1C0()
{
  return off_1F40E6190();
}

uint64_t sub_1E4CBF1D0()
{
  return off_1F40E61B8();
}

uint64_t sub_1E4CBF1E0()
{
  return off_1F40E61C8();
}

uint64_t sub_1E4CBF1F0()
{
  return off_1F40E61D8();
}

uint64_t sub_1E4CBF200()
{
  return off_1F40E6238();
}

uint64_t sub_1E4CBF210()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1E4CBF220()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1E4CBF230()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E4CBF240()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1E4CBF250()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E4CBF260()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E4CBF270()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1E4CBF280()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E4CBF290()
{
  return (*(uint64_t (**)(void))&aCursorbehavior_0[8])();
}

uint64_t sub_1E4CBF2A0()
{
  return (*(uint64_t (**)(void))&aTUitextinputsu[16])();
}

uint64_t sub_1E4CBF2B0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1E4CBF2C0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E4CBF2D0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E4CBF2E0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E4CBF2F0()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1E4CBF300()
{
  return (*(uint64_t (**)(void))&aTUitextinputsu[40])();
}

uint64_t sub_1E4CBF310()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E4CBF320()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E4CBF330()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E4CBF340()
{
  return (*(uint64_t (**)(void))&aSupportsimagep_0[8])();
}

uint64_t sub_1E4CBF350()
{
  return off_1F40E6458();
}

uint64_t sub_1E4CBF360()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1E4CBF370()
{
  return MEMORY[0x1F4188468]();
}

uint64_t sub_1E4CBF380()
{
  return aAnimatorfortex();
}

uint64_t sub_1E4CBF390()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1E4CBF3A0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E4CBF3B0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E4CBF3C0()
{
  return MEMORY[0x1F41664B8]();
}

uint64_t sub_1E4CBF3D0()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1E4CBF3E0()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1E4CBF3F0()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1E4CBF400()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1E4CBF410()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1E4CBF420()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1E4CBF430()
{
  return off_1F40E6798();
}

uint64_t sub_1E4CBF440()
{
  return aTNscustomtextr();
}

uint64_t sub_1E4CBF450()
{
  return MEMORY[0x1F4186B40]();
}

uint64_t sub_1E4CBF460()
{
  return aNdocumentUsing();
}

uint64_t sub_1E4CBF470()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E4CBF480()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1E4CBF490()
{
  return (*(uint64_t (**)(void))&aComparefoundra[16])();
}

uint64_t sub_1E4CBF4A0()
{
  return aItionIndocumen();
}

uint64_t sub_1E4CBF4B0()
{
  return (*(uint64_t (**)(void))&aScrollrangetov[16])();
}

uint64_t sub_1E4CBF4C0()
{
  return (*(uint64_t (**)(void))&aReplacefoundte[24])();
}

uint64_t sub_1E4CBF4D0()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1E4CBF4E0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1E4CBF4F0()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1E4CBF500()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1E4CBF510()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1E4CBF520()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E4CBF530()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E4CBF540()
{
  return off_1F40E6D38();
}

uint64_t sub_1E4CBF550()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1E4CBF560()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1E4CBF570()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1E4CBF580()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1E4CBF590()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E4CBF5A0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E4CBF5B0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E4CBF5C0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1E4CBF5D0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E4CBF5E0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1E4CBF5F0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1E4CBF600()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1E4CBF610()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1E4CBF620()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1E4CBF630()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E4CBF640()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E4CBF650()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E4CBF660()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1E4CBF670()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1E4CBF680()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E4CBF690()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E4CBF6B0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E4CBF6C0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1E4CBF6D0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E4CBF6E0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1E4CBF6F0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1E4CBF700()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1E4CBF710()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1E4CBF720()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E4CBF730()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E4CBF740()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  off_1F40F4A90();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)(*(uint64_t (**)(void))&aBodyrectfortra[16])();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return (*(uint64_t (**)(CFStringRef))&aPercentagefont_1[8])(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)(*(uint64_t (**)(CFStringRef, CFStringRef))&aPercentagefont_1[24])(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return (*(uint64_t (**)(CFStringRef, CFStringRef, Boolean *))&aUpdateforobser[8])(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1F4116000]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x1F4116028]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)off_1F40D9790(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)sel_setupViews(retstr, angle);
}

#error "1E4CBF81C: call analysis failed (funcsize=3)"

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return stru_1F40DB248((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  ((void (*)(__n128, __n128, __n128, __n128))*(&stru_1F40DB248 + 1))((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  ((void (*)(__n128, __n128, __n128, __n128))stru_1F40DB268.name)((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  stru_1F40DB288((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  OBWelcomeController__classData((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)off_1F40DC088(retstr, lhs, rhs);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  (*(void (**)(CMTime *))&sel_buttonTrayEffectView[16])(time);
  return result;
}

#error "1E4CBF89C: call analysis failed (funcsize=3)"

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)(*(void *(**)(CMTime *__return_ptr, void, Float64))&sel_initWithBudsInEarString_[16])(retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)off_1F40DC1D8(retstr, start, duration);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return aNge(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return (*(uint64_t (**)(CVPixelBufferRef))&aSetselectedtex_0[8])(pixelBuffer);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)(*(uint64_t (**)(NSString *))&aWritingtoolsco_3[40])(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = (*(uint64_t (**)(NSString *))&aWritingtoolsco_7[24])(aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)off_1F40E7258(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)off_1F40E7280(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)off_1F40E72A0(range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)off_1F40E72A8((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)off_1F40E72B0(aSelector);
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x1F4145E60]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x1F4145EF0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x1F4145EF8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)(*(uint64_t (**)(const void *))&sel_setOptimizedBatteryChargingEnabled_[16])(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

#error "1E4CBFA4C: call analysis failed (funcsize=3)"

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)aDinatorRequest(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return (*(uint64_t (**)(void))&sel_userDidTapSpatialProfileLearnMoreLink_[16])();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

#error "1E4CBFABC: call analysis failed (funcsize=3)"

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)off_1F40CBA60(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)OBJC_IVAR___BKUIPearlEnrollView__cameraShadeView();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return aProgressiveblu(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)(*(uint64_t (**)(dispatch_queue_attr_t, void, void))&aDebugtemplatei[16])(attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)(*(uint64_t (**)(const char *, dispatch_queue_attr_t))&aDebugtemplatei[24])(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return (*(uint64_t (**)(dispatch_time_t, int64_t))&aNudgespaused[8])(when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return ((uint64_t (*)(void))stru_1F40CC490.type)();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)(*(uint64_t (**)(size_t))&aSuccessanimati_1[24])(__size);
}

size_t malloc_size(const void *ptr)
{
  return aTUitraitchange(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)off_1F40CCCF0(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)aTUilayoutguide(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)off_1F40CD360(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return off_1F40CD3B8(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return (*(uint64_t (**)(void))&sel_updateLeftEarEnrollStart[8])();
}

unsigned int sleep(unsigned int a1)
{
  return OBJC_IVAR___UILabel__intrinsicSizeBaselineInfo(*(void *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}
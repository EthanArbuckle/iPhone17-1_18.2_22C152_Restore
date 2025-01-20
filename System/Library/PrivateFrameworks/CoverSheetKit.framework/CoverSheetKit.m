BOOL CSTimeNumberingSystemTypeRequiresLanguageTagging(uint64_t a1)
{
  return a1 == 3 || a1 == 16;
}

void sub_1ADA2C2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _CS_Private_MainScreenClass()
{
  if (_CS_Private_MainScreenClass_onceToken != -1) {
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_7);
  }
  return _CS_Private_MainScreenClass_mainScreenClass;
}

uint64_t _CS_Private_BaseIsN84OrSimilarDevice()
{
  if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1) {
    dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_14);
  }
  return _CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice;
}

uint64_t _CS_Private_ProductType()
{
  if (_CS_Private_ProductType_onceToken != -1) {
    dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_12);
  }
  return _CS_Private_ProductType_productType;
}

uint64_t CSEffectiveArtworkSubtype()
{
  if (CSEffectiveArtworkSubtype_onceToken != -1) {
    dispatch_once(&CSEffectiveArtworkSubtype_onceToken, &__block_literal_global_1);
  }
  return CSEffectiveArtworkSubtype_deviceSubtype;
}

void __CSEffectiveArtworkSubtype_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFDictionaryGetValue(v0, @"ArtworkDeviceSubType");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (v2) {
      CSEffectiveArtworkSubtype_deviceSubtype = (int)[v2 intValue];
    }
    CFRelease(v1);
  }
}

uint64_t CSTimeNumberingSystemStringToType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"latn"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"arab"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"deva"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"khmr"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"mymr"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"beng"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"guru"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"gujr"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"taml"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"telu"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"mlym"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"knda"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"orya"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"olck"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"mtei"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"arabext"])
  {
    uint64_t v2 = 16;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *CSTimeNumberingSystemTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF) {
    return 0;
  }
  else {
    return off_1E5E8A608[a1 - 1];
  }
}

__CFString *CSTimeNumberingSystemTypeLanguageTag(uint64_t a1)
{
  if (a1 == 16)
  {
    uint64_t v2 = @"ur";
  }
  else if (a1 == 3)
  {
    id v1 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:&unk_1F0480C10];
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1ADA34030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterContentVibrantMonochromeStyleClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PosterKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5E8A700;
    uint64_t v5 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary) {
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PRPosterContentVibrantMonochromeStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_2();
  }
  getPRPosterContentVibrantMonochromeStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PosterKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary = result;
  return result;
}

id CSFrameworkBundle()
{
  if (CSFrameworkBundle___once != -1) {
    dispatch_once(&CSFrameworkBundle___once, &__block_literal_global_3);
  }
  CFDictionaryRef v0 = (void *)CSFrameworkBundle___bundle;

  return v0;
}

uint64_t __CSFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = CSFrameworkBundle___bundle;
  CSFrameworkBundle___bundle = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id CSLogCommon()
{
  if (CSLogCommon_onceToken != -1) {
    dispatch_once(&CSLogCommon_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)CSLogCommon___logObj;

  return v0;
}

uint64_t __CSLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CoverSheetKit", "Common");
  uint64_t v1 = CSLogCommon___logObj;
  CSLogCommon___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t sub_1ADA39668()
{
  return 1;
}

uint64_t sub_1ADA39670()
{
  return 1;
}

uint64_t sub_1ADA39678(uint64_t a1)
{
  uint64_t v3 = sub_1ADA3E688(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + qword_1E9A5B2C8) - 8) + 8))(a1);
  return v3;
}

uint64_t sub_1ADA396E4(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *v1;
  uint64_t v4 = sub_1ADA3E5A0(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + qword_1E9A5B2C8) - 8) + 8))(a1);
  return v4;
}

void *sub_1ADA39788(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1ADA397CC(a1, a2);
}

void *sub_1ADA397CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v2) + qword_1E9A5B2C8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1, a2);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_1ADA3FB60();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_1ADA39904(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_1ADA39948(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LockScreenHostingController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_1ADA399E0(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1ADA39948(a3);
}

id sub_1ADA39A08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ADA39A84()
{
  type metadata accessor for LockScreenHostingController();
  return sub_1ADA3E688(v0);
}

uint64_t sub_1ADA39AC0()
{
  uint64_t v0 = sub_1ADA3FAC0();
  __swift_allocate_value_buffer(v0, qword_1E9A5B2B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9A5B2B0);
  return sub_1ADA3FAB0();
}

uint64_t sub_1ADA39B34()
{
  if (qword_1E9A5B0C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1ADA3FAC0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9A5B2B0);
}

uint64_t sub_1ADA39B98@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9A5B0C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1ADA3FAC0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9A5B2B0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_1ADA39C50()
{
  return *(id *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_hostingController);
}

uint64_t sub_1ADA39CA8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1ADA39D3C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_1ADA39D88@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x78))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1ADA39DE8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x80))(*a1);
}

uint64_t (*sub_1ADA39E40())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1ADA39F40()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 152);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1ADA3A024(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x78))();
  if (v5)
  {
    MEMORY[0x1F4188790](v5, v6);
    sub_1ADA3FC10();
    sub_1ADA3FAD0();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(**(void **)((char *)v2
                                                               + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                                 + 160);
    swift_retain();
    v8(a1, a2);
    return swift_release();
  }
}

uint64_t sub_1ADA3A178@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xC0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1ADA3A1D4(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xC8);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1ADA3A24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(**(void **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                               + 160);
  swift_retain();
  swift_bridgeObjectRetain();
  v5(a2, a3);

  return swift_release();
}

uint64_t (*sub_1ADA3A2E0(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[2] = v1;
  a1[3] = v3;
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + v3) + 152);
  uint64_t v5 = swift_retain();
  uint64_t v6 = v4(v5);
  uint64_t v8 = v7;
  swift_release();
  *a1 = v6;
  a1[1] = v8;
  return sub_1ADA3A374;
}

uint64_t sub_1ADA3A374(uint64_t *a1, char a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = *a1;
  uint64_t v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x78);
  if (a2)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = ((uint64_t (*)(uint64_t))v6)(v7);
    if (v8)
    {
      MEMORY[0x1F4188790](v8, v9);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = *(void (**)(uint64_t, uint64_t))(**(void **)((char *)v4 + a1[3]) + 160);
      swift_retain();
      v13(v5, v3);
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = v6();
    if (v10)
    {
      MEMORY[0x1F4188790](v10, v11);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    else
    {
      v14 = *(void (**)(uint64_t, uint64_t))(**(void **)((char *)v4 + a1[3]) + 160);
      swift_retain();
      v14(v5, v3);
      return swift_release();
    }
  }
}

uint64_t sub_1ADA3A634()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 200);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1ADA3A6FC(void *a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x78))();
  if (v3)
  {
    MEMORY[0x1F4188790](v3, v4);
    sub_1ADA3FC10();
    sub_1ADA3FAD0();

    return swift_release();
  }
  else
  {
    uint64_t v6 = *(void (**)(void *))(**(void **)((char *)v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                       + 208);
    swift_retain();
    v6(a1);
    return swift_release();
  }
}

uint64_t sub_1ADA3A834@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xD8))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3A890(id *a1, void **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xE0))(*a1);
}

uint64_t sub_1ADA3A8F4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(**(void **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 208);
  swift_retain();
  v3(a2);

  return swift_release();
}

void (*sub_1ADA3A96C(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + v3) + 200);
  uint64_t v5 = swift_retain();
  uint64_t v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1ADA3A9FC;
}

void sub_1ADA3A9FC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x78);
  if (a2)
  {
    id v6 = v3;
    uint64_t v7 = v5();
    if (v7)
    {
      MEMORY[0x1F4188790](v7, v8);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
    }
    else
    {
      uint64_t v11 = *(void (**)(id))(**(void **)((char *)v4 + *(void *)(a1 + 16)) + 208);
      swift_retain();
      v11(v6);
      swift_release();
    }
  }
  else
  {
    uint64_t v9 = v5();
    if (v9)
    {
      MEMORY[0x1F4188790](v9, v10);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
    }
    else
    {
      v12 = *(void (**)(void *))(**(void **)((char *)v4 + *(void *)(a1 + 16)) + 208);
      swift_retain();
      v12(v3);
      swift_release();
    }
  }
}

uint64_t sub_1ADA3AC9C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 248);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1ADA3AD64(void *a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x78))();
  if (v3)
  {
    MEMORY[0x1F4188790](v3, v4);
    sub_1ADA3FC10();
    sub_1ADA3FAD0();

    return swift_release();
  }
  else
  {
    id v6 = *(void (**)(void *))(**(void **)((char *)v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                       + 256);
    swift_retain();
    v6(a1);
    return swift_release();
  }
}

uint64_t sub_1ADA3AEA4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xF0))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3AF00(id *a1, void **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xF8))(*a1);
}

uint64_t sub_1ADA3AF64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(**(void **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 256);
  swift_retain();
  v3(a2);

  return swift_release();
}

void (*sub_1ADA3AFE4(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + v3) + 248);
  uint64_t v5 = swift_retain();
  uint64_t v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1ADA3B074;
}

void sub_1ADA3B074(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x78);
  if (a2)
  {
    id v6 = v3;
    uint64_t v7 = v5();
    if (v7)
    {
      MEMORY[0x1F4188790](v7, v8);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
    }
    else
    {
      uint64_t v11 = *(void (**)(id))(**(void **)((char *)v4 + *(void *)(a1 + 16)) + 256);
      swift_retain();
      v11(v6);
      swift_release();
    }
  }
  else
  {
    uint64_t v9 = v5();
    if (v9)
    {
      MEMORY[0x1F4188790](v9, v10);
      sub_1ADA3FC10();
      sub_1ADA3FAD0();
      swift_release();
    }
    else
    {
      v12 = *(void (**)(void *))(**(void **)((char *)v4 + *(void *)(a1 + 16)) + 256);
      swift_retain();
      v12(v3);
      swift_release();
    }
  }
}

uint64_t sub_1ADA3B31C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 296);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1ADA3B424(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(**(void **)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 304);
  swift_retain();
  v3(a1);

  return swift_release();
}

uint64_t sub_1ADA3B4A4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x108))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3B508(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x110))(*a1);
}

uint64_t (*sub_1ADA3B568(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + v3) + 296);
  uint64_t v5 = swift_retain();
  uint64_t v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1ADA3B600;
}

uint64_t sub_1ADA3B600(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(a1[1] + a1[2]) + 304);
  swift_retain();
  v2(v1);

  return swift_release();
}

double sub_1ADA3B704()
{
  uint64_t v1 = *(double (**)(uint64_t))(**(void **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 344);
  uint64_t v2 = swift_retain();
  double v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1ADA3B814(double a1)
{
  double v3 = *(void (**)(uint64_t, double))(**(void **)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                              + 352);
  uint64_t v4 = swift_retain();
  v3(v4, a1);

  return swift_release();
}

void sub_1ADA3B89C(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x120))();
}

uint64_t sub_1ADA3B900(double *a1, void **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x128))(*a1);
}

uint64_t (*sub_1ADA3B960(double *a1))(double *a1)
{
  uint64_t v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  *((void *)a1 + 1) = v1;
  *((void *)a1 + 2) = v3;
  uint64_t v4 = *(double (**)(uint64_t))(**(void **)(v1 + v3) + 344);
  uint64_t v5 = swift_retain();
  double v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1ADA3BA00;
}

uint64_t sub_1ADA3BA00(double *a1)
{
  double v1 = *a1;
  uint64_t v2 = *(void (**)(uint64_t, double))(**(void **)(*((void *)a1 + 1) + *((void *)a1 + 2)) + 352);
  uint64_t v3 = swift_retain();
  v2(v3, v1);

  return swift_release();
}

void sub_1ADA3BB54()
{
  double v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
  id v2 = objc_msgSend(v1, sel_view);

  if (v2)
  {
    objc_msgSend(v2, sel_frame);
  }
  else
  {
    __break(1u);
  }
}

void sub_1ADA3BCFC(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x70))();
  id v10 = objc_msgSend(v9, sel_view);

  if (v10)
  {
    objc_msgSend(v10, sel_setFrame_, a1, a2, a3, a4);
  }
  else
  {
    __break(1u);
  }
}

void sub_1ADA3BDD4(void **a1@<X0>, uint64_t a2@<X8>)
{
  *(double *)a2 = (*(double (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x138))();
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
}

uint64_t sub_1ADA3BE3C(double *a1, void **a2)
{
  return (*(uint64_t (**)(double, double, double, double))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x140))(*a1, a1[1], a1[2], a1[3]);
}

void sub_1ADA3BEA0(void *a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x70);
  unint64_t v5 = ((*MEMORY[0x1E4FBC8C8] & *v1) + 112) & 0xFFFFFFFFFFFFLL | 0xE202000000000000;
  v3[5] = v4;
  v3[6] = v5;
  double v6 = (void *)v4();
  id v7 = objc_msgSend(v6, sel_view);

  if (v7)
  {
    objc_msgSend(v7, sel_frame);
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;

    *uint64_t v3 = v9;
    v3[1] = v11;
    v3[2] = v13;
    v3[3] = v15;
  }
  else
  {
    __break(1u);
  }
}

void sub_1ADA3BF9C(double **a1, char a2)
{
  uint64_t v3 = *a1;
  double v4 = **a1;
  double v5 = (*a1)[1];
  double v6 = (*a1)[2];
  double v7 = (*a1)[3];
  uint64_t v8 = (void *)(*((uint64_t (**)(double **))*a1 + 5))(a1);
  id v9 = objc_msgSend(v8, sel_view);

  if (a2)
  {
    if (v9) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if (!v9)
  {
    __break(1u);
    return;
  }
LABEL_5:
  objc_msgSend(v9, sel_setFrame_, v4, v5, v6, v7);

  free(v3);
}

uint64_t sub_1ADA3C058()
{
  return 0;
}

uint64_t sub_1ADA3C0A8()
{
  double v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_visible);
  swift_beginAccess();
  return *v1;
}

void sub_1ADA3C15C(char a1)
{
  uint64_t v3 = (char *)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_visible);
  swift_beginAccess();
  *uint64_t v3 = a1;
  sub_1ADA3C4C8(a1);
}

uint64_t sub_1ADA3C1B8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x150))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1ADA3C220(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x158))(*a1);
}

void (*sub_1ADA3C280(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CSTitleElementViewAdapter_visible;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1ADA3C2EC;
}

void sub_1ADA3C2EC(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0) {
    sub_1ADA3C4C8(*(unsigned char *)(v3[3] + v3[4]));
  }

  free(v3);
}

id TitleElementViewAdapter.__allocating_init(frame:)()
{
  id v1 = objc_allocWithZone(v0);
  return _s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0();
}

uint64_t sub_1ADA3C36C()
{
  return 0;
}

id sub_1ADA3C378()
{
  id v0 = objc_msgSend(self, sel_whiteColor);

  return v0;
}

id sub_1ADA3C3B8()
{
  if (qword_1E9A5B0C8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1E9A5B0D0;

  return v0;
}

double sub_1ADA3C414()
{
  return 0.5;
}

uint64_t sub_1ADA3C41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12 = swift_allocObject();
  sub_1ADA3FA80();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  *(double *)(v12 + 56) = a6;
  return v12;
}

void sub_1ADA3C4C8(char a1)
{
  uint64_t v2 = v1;
  if (qword_1E9A5B0C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1ADA3FAC0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9A5B2B0);
  double v5 = sub_1ADA3FAA0();
  os_log_type_t v6 = sub_1ADA3FC40();
  if (os_log_type_enabled(v5, v6))
  {
    double v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v7 = 67109120;
    v10[0] = a1 & 1;
    sub_1ADA3FC50();
    _os_log_impl(&dword_1ADA27000, v5, v6, "[TitleElementViewAdapter] text became visible: %{BOOL}d", v7, 8u);
    MEMORY[0x1B3E6DCF0](v7, -1, -1);
  }

  id v8 = *(id *)(v2 + OBJC_IVAR___CSTitleElementViewAdapter_hostingController);
  id v9 = (void (*)(int *, void))sub_1ADA3FB50();
  sub_1ADA3FB90();
  v9(v10, 0);
}

id TitleElementViewAdapter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TitleElementViewAdapter.init()()
{
}

id TitleElementViewAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleElementViewAdapter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ADA3C764(uint64_t a1)
{
  uint64_t result = swift_release();
  *id v1 = a1;
  return result;
}

uint64_t (*sub_1ADA3C790())()
{
  return nullsub_1;
}

uint64_t sub_1ADA3C7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFA0);
  MEMORY[0x1F4188790](v3, v4);
  os_log_type_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFA8);
  MEMORY[0x1F4188790](v40, v7);
  id v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFB0);
  MEMORY[0x1F4188790](v38, v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFB8);
  MEMORY[0x1F4188790](v41, v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFC0);
  uint64_t v17 = MEMORY[0x1F4188790](v39, v16);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v20);
  v22 = (char *)&v37 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFC8);
  uint64_t v25 = MEMORY[0x1F4188790](v23, v24);
  v27 = (char *)&v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(v25);
  if (v28 == 2)
  {
    *(void *)os_log_type_t v6 = sub_1ADA3FB40();
    *((void *)v6 + 1) = 0;
    v6[16] = 1;
    uint64_t v33 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B040) + 44);
    uint64_t v37 = v3;
    v34 = &v6[v33];
    sub_1ADA3CD9C(a1, (uint64_t)v22);
    sub_1ADA3F77C((uint64_t)v22, (uint64_t)v19, &qword_1E9A5AFC0);
    *(void *)v34 = 0;
    v34[8] = 1;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B048);
    sub_1ADA3F77C((uint64_t)v19, (uint64_t)&v34[*(int *)(v35 + 48)], &qword_1E9A5AFC0);
    sub_1ADA3F7F0((uint64_t)v22, &qword_1E9A5AFC0);
    sub_1ADA3F7F0((uint64_t)v19, &qword_1E9A5AFC0);
    sub_1ADA3F77C((uint64_t)v6, (uint64_t)v12, &qword_1E9A5AFA0);
    swift_storeEnumTagMultiPayload();
    sub_1ADA3ECB4(&qword_1E9A5AFD8, &qword_1E9A5AFC8);
    sub_1ADA3ECB4(&qword_1E9A5AFE0, &qword_1E9A5AFA0);
    sub_1ADA3FB80();
    sub_1ADA3F77C((uint64_t)v15, (uint64_t)v9, &qword_1E9A5AFB8);
    swift_storeEnumTagMultiPayload();
    sub_1ADA3E9CC();
    sub_1ADA3EAD4();
    sub_1ADA3FB80();
    sub_1ADA3F7F0((uint64_t)v15, &qword_1E9A5AFB8);
    uint64_t v31 = (uint64_t)v6;
    v32 = &qword_1E9A5AFA0;
  }
  else if (v28)
  {
    sub_1ADA3CD9C(a1, (uint64_t)v22);
    sub_1ADA3F77C((uint64_t)v22, (uint64_t)v9, &qword_1E9A5AFC0);
    swift_storeEnumTagMultiPayload();
    sub_1ADA3E9CC();
    sub_1ADA3EAD4();
    sub_1ADA3FB80();
    uint64_t v31 = (uint64_t)v22;
    v32 = &qword_1E9A5AFC0;
  }
  else
  {
    *(void *)v27 = sub_1ADA3FB40();
    *((void *)v27 + 1) = 0;
    v27[16] = 1;
    uint64_t v29 = (uint64_t)&v27[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B050) + 44)];
    sub_1ADA3CD9C(a1, (uint64_t)v22);
    sub_1ADA3F77C((uint64_t)v22, (uint64_t)v19, &qword_1E9A5AFC0);
    sub_1ADA3F77C((uint64_t)v19, v29, &qword_1E9A5AFC0);
    uint64_t v30 = v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B058) + 48);
    *(void *)uint64_t v30 = 0;
    *(unsigned char *)(v30 + 8) = 1;
    sub_1ADA3F7F0((uint64_t)v22, &qword_1E9A5AFC0);
    sub_1ADA3F7F0((uint64_t)v19, &qword_1E9A5AFC0);
    sub_1ADA3F77C((uint64_t)v27, (uint64_t)v12, &qword_1E9A5AFC8);
    swift_storeEnumTagMultiPayload();
    sub_1ADA3ECB4(&qword_1E9A5AFD8, &qword_1E9A5AFC8);
    sub_1ADA3ECB4(&qword_1E9A5AFE0, &qword_1E9A5AFA0);
    sub_1ADA3FB80();
    sub_1ADA3F77C((uint64_t)v15, (uint64_t)v9, &qword_1E9A5AFB8);
    swift_storeEnumTagMultiPayload();
    sub_1ADA3E9CC();
    sub_1ADA3EAD4();
    sub_1ADA3FB80();
    sub_1ADA3F7F0((uint64_t)v15, &qword_1E9A5AFB8);
    uint64_t v31 = (uint64_t)v27;
    v32 = &qword_1E9A5AFC8;
  }
  return sub_1ADA3F7F0(v31, v32);
}

uint64_t sub_1ADA3CD9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B038);
  uint64_t v5 = v4 - 8;
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1ADA3FAF0();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  uint64_t v11 = MEMORY[0x1F4188790](v9, v10);
  v45 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 152))(v11);
  uint64_t v47 = v13;
  sub_1ADA3F718();
  uint64_t v14 = sub_1ADA3FBC0();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  (*(void (**)(void))(*(void *)a1 + 248))();
  sub_1ADA3FBA0();
  uint64_t v19 = sub_1ADA3FBB0();
  uint64_t v40 = v20;
  uint64_t v41 = v19;
  char v22 = v21;
  uint64_t v42 = v23;
  swift_release();
  sub_1ADA3F76C(v14, v16, v18);
  uint64_t v24 = swift_bridgeObjectRelease();
  double v25 = (*(double (**)(uint64_t))(*(void *)a1 + 344))(v24);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = (*(uint64_t (**)(void))(*(void *)a1 + 200))();
  uint64_t v28 = MEMORY[0x1B3E6D490](v27);
  uint64_t v29 = v45;
  sub_1ADA3FAE0();
  uint64_t v30 = swift_getKeyPath();
  uint64_t v31 = (char *)v8 + *(int *)(v5 + 36);
  uint64_t v33 = v43;
  uint64_t v32 = v44;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v31, v29, v44);
  *uint64_t v8 = v30;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5AFC0);
  sub_1ADA3F77C((uint64_t)v8, a2 + *(int *)(v34 + 36), &qword_1E9A5B038);
  uint64_t v36 = v40;
  uint64_t v35 = v41;
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v36;
  *(unsigned char *)(a2 + 16) = v22 & 1;
  *(void *)(a2 + 24) = v42;
  *(void *)(a2 + 32) = KeyPath;
  *(double *)(a2 + 40) = v25;
  *(void *)(a2 + 48) = v28;
  uint64_t v37 = v35;
  sub_1ADA3F7E0(v35, v36, v22 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1ADA3F7F0((uint64_t)v8, &qword_1E9A5B038);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v45, v32);
  sub_1ADA3F76C(v37, v36, v22 & 1);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1ADA3D0FC()
{
  return sub_1ADA3FBF0();
}

uint64_t sub_1ADA3D118@<X0>(uint64_t a1@<X8>)
{
  return sub_1ADA3C7B0(*v1, a1);
}

id sub_1ADA3D120()
{
  id result = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2928]);
  qword_1E9A5B0D0 = (uint64_t)result;
  return result;
}

uint64_t (*sub_1ADA3D168())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1ADA3D1BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_1ADA3D1C4()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = v0[2];
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1ADA3D254@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1ADA3D2A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1ADA3D308(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  uint64_t v6 = v2;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  (*(void (**)(void))(*(void *)v2 + 384))();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*sub_1ADA3D3B8(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 376))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1ADA3ED60();
  sub_1ADA3FA70();
  swift_release();
  v3[7] = sub_1ADA3D168();
  return sub_1ADA3D4BC;
}

void sub_1ADA3D4BC(void *a1)
{
}

uint64_t (*sub_1ADA3D4C8())()
{
  return j__swift_endAccess;
}

id sub_1ADA3D520()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = (void *)v0[4];

  return v1;
}

uint64_t sub_1ADA3D5B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3D5FC(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 208))(*a1);
}

void sub_1ADA3D650(void *a1)
{
}

void (*sub_1ADA3D670(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 376))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1ADA3ED60();
  sub_1ADA3FA70();
  swift_release();
  v3[7] = sub_1ADA3D4C8();
  return sub_1ADA3D774;
}

void sub_1ADA3D774(void *a1)
{
}

uint64_t (*sub_1ADA3D780())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1ADA3D7D4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1ADA3D7DC()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = (void *)v0[5];

  return v1;
}

uint64_t sub_1ADA3D86C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3D8B8(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 256))(*a1);
}

void sub_1ADA3D914(void *a1)
{
}

void sub_1ADA3D934(void *a1)
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 384))();
  swift_release();
}

void (*sub_1ADA3D9D0(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 376))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1ADA3ED60();
  sub_1ADA3FA70();
  swift_release();
  v3[7] = sub_1ADA3D780();
  return sub_1ADA3DAD4;
}

void sub_1ADA3DAD4(void *a1)
{
}

uint64_t (*sub_1ADA3DAE0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1ADA3DB34()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  return v0[6];
}

uint64_t sub_1ADA3DBB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 296))();
  *a2 = result;
  return result;
}

uint64_t sub_1ADA3DC08(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 304))(*a1);
}

uint64_t sub_1ADA3DC58(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v4 = v1;
  uint64_t v5 = a1;
  (*(void (**)(void))(*(void *)v1 + 384))();
  return swift_release();
}

void (*sub_1ADA3DCF8(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 376))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1ADA3ED60();
  sub_1ADA3FA70();
  swift_release();
  v3[7] = sub_1ADA3DAE0();
  return sub_1ADA3DDFC;
}

void sub_1ADA3DDFC(void *a1)
{
}

uint64_t (*sub_1ADA3DE08())()
{
  return j_j__swift_endAccess;
}

void sub_1ADA3DE5C(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

double sub_1ADA3DE64()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 376))();
  swift_release();
  swift_beginAccess();
  return v0[7];
}

void sub_1ADA3DEE4(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 344))();
}

uint64_t sub_1ADA3DF38(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 352))(*a1);
}

uint64_t sub_1ADA3DF88()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 384))();
  return swift_release();
}

void (*sub_1ADA3E034(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 376))(KeyPath);
  swift_release();
  v3[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1ADA3ED60();
  sub_1ADA3FA70();
  swift_release();
  v3[7] = sub_1ADA3DE08();
  return sub_1ADA3E138;
}

void sub_1ADA3E138(void *a1)
{
}

void sub_1ADA3E144(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_1ADA3FA60();
  swift_release();

  free(v1);
}

uint64_t sub_1ADA3E1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  sub_1ADA3FA80();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a5;
  *(double *)(v6 + 56) = a6;
  return v6;
}

uint64_t sub_1ADA3E244()
{
  return sub_1ADA3FA50();
}

uint64_t sub_1ADA3E29C()
{
  return sub_1ADA3FA40();
}

uint64_t sub_1ADA3E32C()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  uint64_t v2 = sub_1ADA3FA90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1ADA3E3A8()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  uint64_t v2 = sub_1ADA3FA90();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1ADA3E460()
{
  return sub_1ADA3FB00();
}

uint64_t sub_1ADA3E484(uint64_t a1)
{
  uint64_t v2 = sub_1ADA3FAF0();
  MEMORY[0x1F4188790](v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1ADA3FB10();
}

uint64_t sub_1ADA3E54C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1ADA3FB20();
  *a1 = v3;
  return result;
}

uint64_t sub_1ADA3E578()
{
  return sub_1ADA3FB30();
}

uint64_t sub_1ADA3E5A0(uint64_t a1)
{
  MEMORY[0x1F4188790](a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return sub_1ADA3FB70();
}

uint64_t sub_1ADA3E688(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for LockScreenHostingController());
  return sub_1ADA3E5A0(a1);
}

uint64_t type metadata accessor for LockScreenHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1ADA3E720()
{
  return sub_1ADA3A24C(v0[2], v0[3], v0[4]);
}

uint64_t sub_1ADA3E750()
{
  return sub_1ADA3A8F4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1ADA3E77C()
{
  return sub_1ADA3AF64(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id _s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0()
{
  v0[OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges] = 1;
  v0[OBJC_IVAR___CSTitleElementViewAdapter_visible] = 0;
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_whiteColor);
  if (qword_1E9A5B0C8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1E9A5B0D0;
  type metadata accessor for TitleLabelView.Coordinator();
  uint64_t v5 = (void *)swift_allocObject();
  id v6 = v4;
  sub_1ADA3FA80();
  v5[2] = 0;
  v5[3] = 0xE000000000000000;
  v5[4] = v3;
  v5[5] = v6;
  v5[6] = 1;
  v5[7] = 0x3FE0000000000000;
  *(void *)&v2[OBJC_IVAR___CSTitleElementViewAdapter_coordinator] = v5;
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9A5B088));
  uint64_t v13 = v5;
  swift_retain();
  uint64_t v8 = (void *)sub_1ADA3FB70();
  *(void *)&v2[OBJC_IVAR___CSTitleElementViewAdapter_hostingController] = v8;
  id result = objc_msgSend(v8, sel_view);
  if (result)
  {
    uint64_t v10 = result;
    id v11 = objc_msgSend(v1, sel_clearColor);
    objc_msgSend(v10, sel_setBackgroundColor_, v11);

    v12.receiver = v2;
    v12.super_class = (Class)type metadata accessor for TitleElementViewAdapter();
    return objc_msgSendSuper2(&v12, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for TitleElementViewAdapter()
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

unint64_t sub_1ADA3E9CC()
{
  unint64_t result = qword_1E9A5AFD0;
  if (!qword_1E9A5AFD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9A5AFB8);
    sub_1ADA3ECB4(&qword_1E9A5AFD8, &qword_1E9A5AFC8);
    sub_1ADA3ECB4(&qword_1E9A5AFE0, &qword_1E9A5AFA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5AFD0);
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

unint64_t sub_1ADA3EAD4()
{
  unint64_t result = qword_1E9A5AFE8;
  if (!qword_1E9A5AFE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9A5AFC0);
    sub_1ADA3EB74();
    sub_1ADA3ECB4(&qword_1E9A5B030, &qword_1E9A5B038);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5AFE8);
  }
  return result;
}

unint64_t sub_1ADA3EB74()
{
  unint64_t result = qword_1E9A5AFF0;
  if (!qword_1E9A5AFF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9A5AFF8);
    sub_1ADA3EC14();
    sub_1ADA3ECB4(&qword_1E9A5B020, &qword_1E9A5B028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5AFF0);
  }
  return result;
}

unint64_t sub_1ADA3EC14()
{
  unint64_t result = qword_1E9A5B000;
  if (!qword_1E9A5B000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9A5B008);
    sub_1ADA3ECB4(&qword_1E9A5B010, &qword_1E9A5B018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5B000);
  }
  return result;
}

uint64_t sub_1ADA3ECB4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1ADA3ECF8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  swift_beginAccess();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1ADA3ED60()
{
  unint64_t result = qword_1E9A5B060;
  if (!qword_1E9A5B060)
  {
    type metadata accessor for TitleLabelView.Coordinator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5B060);
  }
  return result;
}

uint64_t type metadata accessor for TitleLabelView.Coordinator()
{
  uint64_t result = qword_1E9A5B290;
  if (!qword_1E9A5B290) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1ADA3EE04()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = v1;
  id v4 = v1;
}

void sub_1ADA3EE60()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
  id v4 = v1;
}

uint64_t sub_1ADA3EEBC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 48) = v1;
  return result;
}

uint64_t sub_1ADA3EF0C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 56) = v2;
  return result;
}

uint64_t sub_1ADA3EF60(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1ADA44268, 1);
}

uint64_t sub_1ADA3EF80()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for TitleElementViewAdapter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TitleElementViewAdapter);
}

uint64_t dispatch thunk of TitleElementViewAdapter.viewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.__allocating_init(frame:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

ValueMetadata *type metadata accessor for TitleLabelView()
{
  return &type metadata for TitleLabelView;
}

uint64_t sub_1ADA3F57C()
{
  return type metadata accessor for TitleLabelView.Coordinator();
}

uint64_t sub_1ADA3F584()
{
  uint64_t result = sub_1ADA3FA90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_1ADA3F644()
{
  unint64_t result = qword_1E9A5B068;
  if (!qword_1E9A5B068)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9A5B070);
    sub_1ADA3E9CC();
    sub_1ADA3EAD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5B068);
  }
  return result;
}

void type metadata accessor for NSTextAlignment()
{
  if (!qword_1E9A5B078)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9A5B078);
    }
  }
}

unint64_t sub_1ADA3F718()
{
  unint64_t result = qword_1E9A5B080;
  if (!qword_1E9A5B080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A5B080);
  }
  return result;
}

uint64_t sub_1ADA3F76C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1ADA3F77C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1ADA3F7E0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1ADA3F7F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1ADA3F8E0()
{
}

uint64_t sub_1ADA3F8F8()
{
  return sub_1ADA3E750();
}

uint64_t sub_1ADA3F910()
{
  return sub_1ADA3E77C();
}

uint64_t sub_1ADA3F928()
{
  return sub_1ADA3E720();
}

void __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PosterKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CSProminentDisplayViewController.m", 35, @"%s", *a1);

  __break(1u);
}

void __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRPosterContentVibrantMonochromeStyleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSProminentDisplayViewController.m", 36, @"Unable to find class %s", "PRPosterContentVibrantMonochromeStyle");

  __break(1u);
  sub_1ADA3FA40();
}

uint64_t sub_1ADA3FA40()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1ADA3FA50()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1ADA3FA60()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1ADA3FA70()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1ADA3FA80()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1ADA3FA90()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1ADA3FAA0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1ADA3FAB0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1ADA3FAC0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1ADA3FAD0()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1ADA3FAE0()
{
  return MEMORY[0x1F40F9008]();
}

uint64_t sub_1ADA3FAF0()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_1ADA3FB00()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_1ADA3FB10()
{
  return MEMORY[0x1F40F9350]();
}

uint64_t sub_1ADA3FB20()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_1ADA3FB30()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_1ADA3FB40()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1ADA3FB50()
{
  return MEMORY[0x1F40F9DF8]();
}

uint64_t sub_1ADA3FB60()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_1ADA3FB70()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1ADA3FB80()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1ADA3FB90()
{
  return MEMORY[0x1F40FA4A8]();
}

uint64_t sub_1ADA3FBA0()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_1ADA3FBB0()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1ADA3FBC0()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1ADA3FBD0()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1ADA3FBE0()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1ADA3FBF0()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1ADA3FC00()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1ADA3FC10()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1ADA3FC20()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1ADA3FC30()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1ADA3FC40()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1ADA3FC50()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1F410C4E0]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1F410C610]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF318](font);
}

CFArrayRef CTFontCopyVariationAxes(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1F40DF320](font);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1F4166FE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
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

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}
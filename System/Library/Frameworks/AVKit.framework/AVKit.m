void sub_1B05BA94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, void);
  v11 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
  v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B05BBC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B05BC7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B05BCDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

uint64_t __AVBundle_block_invoke()
{
  AVBundle_bundle = +[_AVKitBundle bundle];

  return MEMORY[0x1F41817F8]();
}

void sub_1B05C00AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B05C0CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AVKitUserDefaults()
{
  if (AVKitUserDefaults_initializeAVKitUserDefaultsOnceToken != -1) {
    dispatch_once(&AVKitUserDefaults_initializeAVKitUserDefaultsOnceToken, &__block_literal_global_16_25040);
  }
  v0 = (void *)AVKitUserDefaults_AVKitUserDefaults;

  return v0;
}

uint64_t AVApplicationIdentifier()
{
  if (AVApplicationIdentifier_createMainAppBundleOnceToken != -1) {
    dispatch_once(&AVApplicationIdentifier_createMainAppBundleOnceToken, &__block_literal_global_8);
  }
  v0 = (void *)AVApplicationIdentifier_mainAppBundle;

  return [v0 bundleIdentifier];
}

id _ObservationForSharedAVKitSetting(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F28EE8];
  v9 = AVKitUserDefaults();
  id v10 = v6;
  v11 = objc_msgSend(v8, "keyPathWithRootObject:path:", v9, objc_msgSend(v10, "cStringUsingEncoding:", 4));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___ObservationForSharedAVKitSetting_block_invoke;
  v17[3] = &unk_1E5FC1E38;
  id v18 = v10;
  id v19 = v5;
  id v20 = v7;
  id v21 = 0;
  id v12 = v7;
  id v13 = v5;
  id v14 = v10;
  v15 = [v11 addObserverBlock:v17];

  return v15;
}

void sub_1B05C10B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionKitCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5FC1E58;
    uint64_t v6 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!VisionKitCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("VKCImageAnalyzer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getVKCImageAnalyzerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B05C1FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B05C4F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B05C6388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1B05C64A8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

uint64_t AVVideoGravityFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F15AF0]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F15AF8]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F15AE8]])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id NSStringFromVideoGravity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = **((id **)&unk_1E5FC2070 + a1 - 1);
  }
  return v2;
}

void sub_1B05C7314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id _AVLog()
{
  if (_AVLog_onceToken != -1) {
    dispatch_once(&_AVLog_onceToken, &__block_literal_global_347);
  }
  v0 = (void *)_log;

  return v0;
}

void sub_1B05C7A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B05C819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B05C9350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AVLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = AVBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_1F09185C8 table:0];

  return v3;
}

id AVBundle()
{
  if (AVBundle_onceToken != -1) {
    dispatch_once(&AVBundle_onceToken, &__block_literal_global_25019);
  }
  v0 = (void *)AVBundle_bundle;

  return v0;
}

uint64_t __AVKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.avkit"];
  uint64_t v1 = AVKitUserDefaults_AVKitUserDefaults;
  AVKitUserDefaults_AVKitUserDefaults = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __AVApplicationIdentifier_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = AVApplicationIdentifier_mainAppBundle;
  AVApplicationIdentifier_mainAppBundle = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t sub_1B05CA72C(uint64_t a1, uint64_t a2)
{
  return sub_1B05CAE0C(a1, a2, MEMORY[0x1F418C0E8]);
}

uint64_t sub_1B05CA744(uint64_t a1, id *a2)
{
  uint64_t result = sub_1B0706020();
  *a2 = 0;
  return result;
}

uint64_t sub_1B05CA7BC(uint64_t a1, id *a2)
{
  char v3 = sub_1B0706030();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B05CA83C@<X0>(uint64_t *a1@<X8>)
{
  sub_1B0706040();
  uint64_t v2 = sub_1B0706010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B05CA888@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0706040();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for AVMetadataIdentifier(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for AVInfoDescriptionView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1B05CA914(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B05CA934(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for AudioFormatListItem(uint64_t a1)
{
}

void type metadata accessor for CMFormatDescription(uint64_t a1)
{
}

void type metadata accessor for AVMediaCharacteristic(uint64_t a1)
{
}

void type metadata accessor for Identifier(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1B05CA9C8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B05CA9E8(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1B05CAA38(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B05CAA58(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

uint64_t sub_1B05CAA98(uint64_t a1)
{
  uint64_t v2 = sub_1B05CABE4(&qword_1E9B34F68, type metadata accessor for Identifier);
  uint64_t v3 = sub_1B05CABE4(&qword_1E9B34F70, type metadata accessor for Identifier);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B05CAB54()
{
  return sub_1B05CABE4(&qword_1E9B34F00, type metadata accessor for Identifier);
}

uint64_t sub_1B05CAB9C()
{
  return sub_1B05CABE4(&qword_1E9B34F08, type metadata accessor for Identifier);
}

uint64_t sub_1B05CABE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B05CAC2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B0706010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B05CAC74(uint64_t a1)
{
  uint64_t v2 = sub_1B05CABE4(&qword_1E9B34F48, type metadata accessor for AVMetadataIdentifier);
  uint64_t v3 = sub_1B05CABE4(&qword_1E9B34F50, type metadata accessor for AVMetadataIdentifier);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B05CAD30(uint64_t a1)
{
  uint64_t v2 = sub_1B05CABE4(&qword_1E9B34F58, type metadata accessor for AVMediaCharacteristic);
  uint64_t v3 = sub_1B05CABE4(&qword_1E9B34F60, type metadata accessor for AVMediaCharacteristic);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B05CADEC(uint64_t a1, uint64_t a2)
{
  return sub_1B05CAE0C(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1B05CAE0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1B0706040();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B05CAE50()
{
  sub_1B0706040();
  sub_1B0706050();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05CAEA4()
{
  sub_1B0706040();
  sub_1B0706230();
  sub_1B0706050();
  uint64_t v0 = sub_1B0706250();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B05CAF18()
{
  return sub_1B05CABE4(&qword_1E9B34F10, type metadata accessor for Identifier);
}

uint64_t sub_1B05CAF60()
{
  return sub_1B05CABE4(&qword_1E9B34F18, type metadata accessor for AVMediaCharacteristic);
}

uint64_t sub_1B05CAFA8()
{
  return sub_1B05CABE4(&qword_1E9B34F20, type metadata accessor for AVMediaCharacteristic);
}

uint64_t sub_1B05CAFF0()
{
  return sub_1B05CABE4(&qword_1E9B34F28, type metadata accessor for AVMediaCharacteristic);
}

uint64_t sub_1B05CB038()
{
  return sub_1B05CABE4(&qword_1E9B34F30, type metadata accessor for AVMetadataIdentifier);
}

uint64_t sub_1B05CB080()
{
  return sub_1B05CABE4(&qword_1E9B34F38, type metadata accessor for AVMetadataIdentifier);
}

uint64_t sub_1B05CB0C8()
{
  uint64_t v0 = sub_1B0706040();
  uint64_t v2 = v1;
  if (v0 == sub_1B0706040() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1B0706220();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B05CB154()
{
  return sub_1B05CABE4(&qword_1E9B34F40, type metadata accessor for AVMetadataIdentifier);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1B05CB1B0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B05CB1D0(uint64_t result, int a2, int a3)
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

void type metadata accessor for AudioStreamBasicDescription(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

uint64_t sub_1B05CB22C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  char v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1B05CB298(uint64_t a1)
{
  uint64_t v2 = sub_1B0705E90();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1B05CB2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B05CB360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B05CB3C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B05CB428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B05CB48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05CB4A0);
}

uint64_t sub_1B05CB4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1B05CB50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05CB520);
}

uint64_t sub_1B05CB520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705E90();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AVInfoTabBadgeModifier()
{
  uint64_t result = qword_1E9B34F88;
  if (!qword_1E9B34F88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B05CB5DC()
{
  uint64_t result = sub_1B0705E90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B05CB674(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B05CB694(uint64_t result, int a2, int a3)
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

uint64_t sub_1B05CB6D4()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1B05CB704(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_1B05CB750()
{
  unint64_t result = qword_1E9B34FA8;
  if (!qword_1E9B34FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B34FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B34FA8);
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

ValueMetadata *type metadata accessor for AVSizePreferenceKey()
{
  return &type metadata for AVSizePreferenceKey;
}

ValueMetadata *type metadata accessor for AVSizeModifier()
{
  return &type metadata for AVSizeModifier;
}

void sub_1B05CB81C()
{
  xmmword_1E9B3A360 = 0uLL;
}

double sub_1B05CB82C@<D0>(_OWORD *a1@<X8>)
{
  if (qword_1E9B34EA0 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_1E9B3A360;
  *a1 = xmmword_1E9B3A360;
  return result;
}

double sub_1B05CB888(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_1B05CB8C8()
{
  return sub_1B07058F0() & 1;
}

uint64_t sub_1B05CB8E4()
{
  return sub_1B07058F0() & 1;
}

uint64_t sub_1B05CB900()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05CB91C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B0705E30();
  uint64_t result = sub_1B07058C0();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_1B05CB95C()
{
  return sub_1B0705880();
}

uint64_t sub_1B05CB974()
{
  return sub_1B0705890();
}

uint64_t sub_1B05CB98C()
{
  return sub_1B07058A0();
}

uint64_t sub_1B05CB9A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1B0705F70();
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34FC0);
  v9 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(a2 + *(int *)(result + 36));
  void *v9 = sub_1B05CB91C;
  v9[1] = 0;
  v9[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v4;
  v9[3] = v6;
  return result;
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

unint64_t sub_1B05CBA94()
{
  unint64_t result = qword_1E9B34FC8;
  if (!qword_1E9B34FC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B34FC0);
    sub_1B05CBB34(&qword_1E9B34FD0, &qword_1E9B34FB8);
    sub_1B05CBB34(&qword_1E9B34FD8, &qword_1E9B34FE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B34FC8);
  }
  return result;
}

uint64_t sub_1B05CBB34(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1B05CBD10(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR___AVInfoTabCoordinator_actions;
  *(void *)(v1 + OBJC_IVAR___AVInfoTabCoordinator_actions) = a1;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  if (v4)
  {
    type metadata accessor for AVInfoTabViewController();
    uint64_t result = swift_dynamicCastClass();
    if (result)
    {
      uint64_t v5 = *(void *)(v1 + v2);
      unint64_t v6 = *(void *)(result + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
      *(void *)(result + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions) = v5;
      id v7 = v4;
      swift_bridgeObjectRetain_n();
      unsigned __int8 v8 = sub_1B05F8298(v6, v5);
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        sub_1B05F7BC0();
      }

      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

char *sub_1B05CBDFC(void *a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController] = 0;
  uint64_t v5 = OBJC_IVAR___AVInfoTabCoordinator_playerItem;
  *(void *)&v2[OBJC_IVAR___AVInfoTabCoordinator_playerItem] = 0;
  uint64_t v6 = OBJC_IVAR___AVInfoTabCoordinator_actions;
  *(void *)&v2[OBJC_IVAR___AVInfoTabCoordinator_actions] = MEMORY[0x1E4FBC860];
  id v7 = *(void **)&v2[v5];
  *(void *)&v2[v5] = a1;
  unsigned __int8 v8 = v2;
  id v9 = a1;

  *(void *)&v2[v6] = a2;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for AVInfoTabCoordinator();
  id v10 = (char *)objc_msgSendSuper2(&v15, sel_init);
  id v11 = objc_allocWithZone((Class)type metadata accessor for AVInfoTabViewController());
  id v12 = sub_1B05F67C8(v9, a2);
  id v13 = *(void **)&v10[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController];
  *(void *)&v10[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController] = v12;

  return v10;
}

id sub_1B05CBF78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AVInfoTabCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AVInfoTabCoordinator()
{
  return self;
}

unint64_t sub_1B05CC02C()
{
  unint64_t result = qword_1E9B34E40;
  if (!qword_1E9B34E40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9B34E40);
  }
  return result;
}

void sub_1B05CC06C(void *a1)
{
  uint64_t v2 = OBJC_IVAR___AVInfoTabCoordinator_playerItem;
  char v3 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_playerItem);
  *(void *)(v1 + OBJC_IVAR___AVInfoTabCoordinator_playerItem) = a1;
  id v4 = a1;

  uint64_t v5 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  if (v5)
  {
    type metadata accessor for AVInfoTabViewController();
    if (swift_dynamicCastClass())
    {
      uint64_t v6 = *(void **)(v1 + v2);
      id v8 = v6;
      id v7 = v5;
      sub_1B05F88AC(v6);
    }
  }
}

uint64_t sub_1B05CC128(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1B05CC13C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
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

ValueMetadata *type metadata accessor for AVInfoDescriptionView()
{
  return &type metadata for AVInfoDescriptionView;
}

uint64_t sub_1B05CC184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05CC1A0@<X0>(uint64_t a1@<X8>)
{
  sub_1B0705CD0();
  uint64_t v2 = sub_1B0705D00();
  uint64_t v4 = v3;
  char v6 = v5;
  swift_release();
  uint64_t v7 = sub_1B0705CF0();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_1B05CC13C(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  sub_1B0705B40();
  uint64_t v12 = sub_1B0705CE0();
  uint64_t v31 = v13;
  uint64_t v32 = v12;
  uint64_t v33 = v14;
  char v16 = v15 & 1;
  sub_1B05CC13C(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_1B0705CA0();
  uint64_t v17 = sub_1B0705D00();
  uint64_t v19 = v18;
  char v21 = v20;
  swift_release();
  LOBYTE(v9) = v21 & 1;
  sub_1B0705B40();
  uint64_t v22 = sub_1B0705CE0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_1B05CC13C(v17, v19, v9);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v32;
  *(void *)(a1 + 8) = v31;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v33;
  *(void *)(a1 + 32) = v22;
  *(void *)(a1 + 40) = v24;
  *(unsigned char *)(a1 + 48) = v28;
  *(void *)(a1 + 56) = v26;
  *(void *)(a1 + 64) = KeyPath;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  sub_1B05CC128(v32, v31, v16);
  swift_bridgeObjectRetain();
  sub_1B05CC128(v22, v24, v28);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B05CC13C(v22, v24, v28);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1B05CC13C(v32, v31, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05CC40C()
{
  return sub_1B0705D40();
}

uint64_t sub_1B05CC424()
{
  return sub_1B0705D50();
}

uint64_t sub_1B05CC43C()
{
  return sub_1B0705D90();
}

__n128 sub_1B05CC458@<Q0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  long long v22 = *v1;
  long long v23 = v3;
  long long v4 = v1[3];
  long long v24 = v1[2];
  long long v25 = v4;
  uint64_t v5 = sub_1B0705AC0();
  sub_1B05CC1A0((uint64_t)&v14);
  char v6 = v15;
  uint64_t v7 = v16;
  char v8 = v18;
  uint64_t v9 = v20;
  char v10 = v21;
  __n128 result = v19;
  long long v12 = v14;
  long long v13 = v17;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = v13;
  *(unsigned char *)(a1 + 72) = v8;
  *(__n128 *)(a1 + 80) = result;
  *(void *)(a1 + 96) = v9;
  *(unsigned char *)(a1 + 104) = v10;
  return result;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwxx_0(uint64_t a1)
{
  sub_1B05CC13C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1B05CC13C(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));

  return swift_bridgeObjectRelease();
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_1B05CC128(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_1B05CC128(v7, v8, v9);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_1B05CC128(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_1B05CC13C(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  char v12 = *(unsigned char *)(a2 + 48);
  sub_1B05CC128(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = v12;
  sub_1B05CC13C(v13, v14, v15);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_1B05CC13C(v5, v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v8;
  sub_1B05CC13C(v9, v10, v11);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B05CC76C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoDescriptionViewConfiguration()
{
  return &type metadata for AVInfoDescriptionViewConfiguration;
}

unint64_t sub_1B05CC7D0()
{
  unint64_t result = qword_1E9B35000;
  if (!qword_1E9B35000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35000);
  }
  return result;
}

void sub_1B05CC820()
{
  qword_1E9B3A370 = 0x4028000000000000;
}

uint64_t sub_1B05CC830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v2 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35020);
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  v30 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05D8270(v1, (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabMetadataStripView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v29 = swift_allocObject();
  sub_1B05D9CC0((uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v6, type metadata accessor for AVInfoTabMetadataStripView);
  type metadata accessor for AVObservableBundle();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = AVBundle();
  sub_1B05D7CA8(&qword_1E9B35028, v8, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
  uint64_t v28 = sub_1B0705820();
  uint64_t v27 = sub_1B0705E50();
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_1E9B34EA8 != -1) {
    swift_once();
  }
  sub_1B0705F70();
  sub_1B07058B0();
  uint64_t v10 = v48;
  char v11 = v49;
  uint64_t v12 = v50;
  char v13 = v51;
  uint64_t v14 = v52;
  uint64_t v15 = v53;
  sub_1B0705CC0();
  uint64_t v16 = sub_1B0705CB0();
  swift_release();
  uint64_t v17 = swift_getKeyPath();
  v34 = sub_1B05D704C;
  unint64_t v35 = v29;
  uint64_t v36 = v28;
  uint64_t v37 = v7;
  uint64_t v38 = KeyPath;
  uint64_t v39 = v27;
  uint64_t v40 = v10;
  char v41 = v11;
  uint64_t v42 = v12;
  char v43 = v13;
  uint64_t v44 = v14;
  uint64_t v45 = v15;
  uint64_t v46 = v17;
  uint64_t v47 = v16;
  uint64_t v18 = sub_1B0705910();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  char v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4F3CB68], v18);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35030);
  unint64_t v23 = sub_1B05D7938();
  long long v24 = v30;
  sub_1B0705DA0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v34 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v22;
  unint64_t v35 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v32;
  sub_1B0705E10();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v24, v25);
}

uint64_t sub_1B05CCCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350B0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_1B0705A60();
  *((void *)v8 + 1) = 0x4020000000000000;
  v8[16] = 0;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350B8);
  sub_1B05CCDE0(a2, a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_1B05DA300((uint64_t)v8, a3, &qword_1E9B350B0);
  uint64_t v10 = (void *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350C0) + 36));
  *uint64_t v10 = 0xD000000000000021;
  v10[1] = 0x80000001B07229D0;
  return sub_1B05DA364((uint64_t)v8, &qword_1E9B350B0);
}

uint64_t sub_1B05CCDE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  v330 = (void *)((char *)v314 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v7);
  v341 = (void *)((char *)v314 - v9);
  v334 = (void *)type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  uint64_t v10 = MEMORY[0x1F4188790](v334);
  v324 = (void *)((char *)v314 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  v344 = (void *)((char *)v314 - v13);
  MEMORY[0x1F4188790](v12);
  v352 = (void *)((char *)v314 - v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350C8);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)v314 - (((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v325 = v18;
  MEMORY[0x1F4188790](v17);
  char v21 = (char *)v314 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350D0);
  MEMORY[0x1F4188790](v22 - 8);
  long long v24 = (char *)v314 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v24 = sub_1B0705A60();
  *((void *)v24 + 1) = 0x4008000000000000;
  v24[16] = 0;
  uint64_t v25 = (uint64_t *)&v24[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350D8) + 44)];
  uint64_t v342 = a2;
  sub_1B05CF918(a1, v25);
  sub_1B05DA300((uint64_t)v24, (uint64_t)v21, &qword_1E9B350D0);
  *(void *)&v21[*(int *)(v16 + 44)] = 0x3FF0000000000000;
  sub_1B05DA364((uint64_t)v24, &qword_1E9B350D0);
  v343 = v19;
  uint64_t v26 = (uint64_t)v19;
  uint64_t v27 = a1;
  sub_1B05DA3C0((uint64_t)v21, v26, &qword_1E9B350C8);
  uint64_t v28 = (int *)type metadata accessor for MediaInfo();
  unint64_t v29 = *(unsigned int *)(a1 + v28[13]) | ((unint64_t)*(unsigned __int8 *)(a1 + v28[13] + 4) << 32);
  uint64_t v333 = a3;
  if ((v29 & 0xFF00000000) != 0x400000000 && (*(unsigned char *)(a1 + *(int *)(v6 + 20)) & 0x40) != 0)
  {
    unint64_t v354 = v29;
    type metadata accessor for AVObservableBundle();
    sub_1B05D7CA8(&qword_1E9B35028, v30, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
    uint64_t v351 = sub_1B0705990();
    uint64_t v338 = v31;
    type metadata accessor for CGSize(0);
    long long v356 = 0uLL;
    sub_1B0705ED0();
    uint64_t v337 = *((void *)&v357 + 1);
    uint64_t v350 = v357;
    uint64_t v349 = v358;
    uint64_t v32 = sub_1B0705B10();
    uint64_t v33 = *(void *)(v32 - 8);
    MEMORY[0x1F4188790](v32);
    unint64_t v35 = (char *)v314 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)&long long v357 = 0xD000000000000021;
    *((void *)&v357 + 1) = 0x80000001B07229D0;
    sub_1B0705B80();
    sub_1B07058D0();
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
    LOBYTE(v356) = 0;
    sub_1B0705ED0();
    uint64_t v347 = v357;
    uint64_t v346 = *((void *)&v357 + 1);
    uint64_t v336 = v37;
    uint64_t v348 = v39;
  }
  else
  {
    uint64_t v338 = 0;
    uint64_t v350 = 0;
    uint64_t v337 = 0;
    uint64_t v349 = 0;
    unint64_t v354 = 0;
    uint64_t v336 = 0;
    uint64_t v347 = 0;
    uint64_t v348 = 0;
    uint64_t v346 = 0;
    uint64_t v351 = 1;
  }
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E0);
  v332 = v314;
  MEMORY[0x1F4188790](v40 - 8);
  uint64_t v355 = v41;
  uint64_t v353 = (uint64_t)v314 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v42 = *(unsigned __int8 *)(a1 + v28[15]);
  v339 = v28;
  v345 = (void *)v6;
  if (v42 == 2)
  {
    uint64_t v43 = 1145597551;
  }
  else
  {
    if (v42 != 3)
    {
LABEL_11:
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
      uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v353, 1, 1, v45);
      goto LABEL_16;
    }
    uint64_t v43 = 1261727343;
  }
  unint64_t v44 = v43 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
  if ((*(unsigned char *)(a1 + *(int *)(v6 + 20)) & 4) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v326 = (void *)a1;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
  v340 = v314;
  v331 = (void *)v47;
  v335 = *(char **)(v47 - 8);
  uint64_t v48 = MEMORY[0x1F4188790](v47);
  uint64_t v50 = (char *)v314 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v329 = v314;
  MEMORY[0x1F4188790](v48);
  uint64_t v52 = (char *)v314 - v51;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
  v328 = v314;
  MEMORY[0x1F4188790](v53 - 8);
  v55 = (char *)v314 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = v334;
  v57 = v352;
  v58 = (char *)v352 + *((int *)v334 + 6);
  uint64_t v59 = *MEMORY[0x1E4F3EC18];
  uint64_t v60 = sub_1B0705E90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104))(v58, v59, v60);
  type metadata accessor for AVObservableBundle();
  sub_1B05D7CA8(&qword_1E9B35028, v61, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
  uint64_t *v57 = sub_1B0705990();
  v57[1] = v62;
  v63 = (char *)v57 + *((int *)v56 + 7);
  __asm { FMOV            V0.2D, #1.0 }
  long long v356 = _Q0;
  type metadata accessor for CGSize(0);
  sub_1B0705ED0();
  uint64_t v69 = v358;
  *(_OWORD *)v63 = v357;
  *((void *)v63 + 2) = v69;
  v57[2] = 0x6974756C6F736552;
  v57[3] = v44;
  if (v42 == 3) {
    v70 = "CONTENT_TABS_ACCESSIBILITY_4k";
  }
  else {
    v70 = "CONTENT_TABS_ACCESSIBILITY_HD";
  }
  uint64_t v71 = (uint64_t)v352;
  sub_1B05D1DC0(0xD00000000000001DLL, (unint64_t)(v70 - 32) | 0x8000000000000000);
  swift_bridgeObjectRelease();
  sub_1B05D7CF0(v71, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
  uint64_t v72 = sub_1B0705B10();
  uint64_t v73 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  v75 = (char *)v314 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v357 = 0xD000000000000021;
  *((void *)&v357 + 1) = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v72);
  LOBYTE(v356) = 0;
  sub_1B0705ED0();
  LOBYTE(v72) = v357;
  uint64_t v80 = *((void *)&v357 + 1);
  sub_1B05DA300((uint64_t)v55, (uint64_t)v52, &qword_1E9B350F8);
  v81 = v331;
  v82 = &v52[*((int *)v331 + 9)];
  *(void *)v82 = v77;
  *((void *)v82 + 1) = v79;
  v82[16] = v72;
  *((void *)v82 + 3) = v80;
  sub_1B05DA364((uint64_t)v55, &qword_1E9B350F8);
  sub_1B05DA3C0((uint64_t)v52, (uint64_t)v50, &qword_1E9B350E8);
  uint64_t v83 = v353;
  sub_1B05DA3C0((uint64_t)v50, v353, &qword_1E9B350E8);
  uint64_t v46 = (*((uint64_t (**)(uint64_t, void, uint64_t, void *))v335 + 7))(v83, 0, 1, v81);
  uint64_t v6 = (uint64_t)v345;
  uint64_t v27 = (uint64_t)v326;
  uint64_t v28 = v339;
LABEL_16:
  v331 = v314;
  MEMORY[0x1F4188790](v46);
  v352 = (void *)((char *)v314 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v85 = *(unsigned __int8 *)(v27 + v28[16]);
  if (v85 == 2)
  {
    unint64_t v87 = 0xE800000000000000;
    unint64_t v86 = 0x524448726F6C6F43;
  }
  else
  {
    if (v85 != 3) {
      goto LABEL_22;
    }
    unint64_t v86 = 0xD000000000000010;
    unint64_t v87 = 0x80000001B0722AC0;
  }
  if ((*(unsigned char *)(v27 + *(int *)(v6 + 20)) & 8) != 0)
  {
    v326 = (void *)v27;
    uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
    v340 = v314;
    v329 = (void *)v90;
    v335 = *(char **)(v90 - 8);
    uint64_t v91 = MEMORY[0x1F4188790](v90);
    v93 = (char *)v314 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
    v328 = v314;
    MEMORY[0x1F4188790](v91);
    v95 = (char *)v314 - v94;
    uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
    v327 = v314;
    MEMORY[0x1F4188790](v96 - 8);
    v98 = (char *)v314 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0);
    v99 = v334;
    v100 = v344;
    v101 = (char *)v344 + *((int *)v334 + 6);
    uint64_t v102 = *MEMORY[0x1E4F3EC18];
    uint64_t v103 = sub_1B0705E90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v103 - 8) + 104))(v101, v102, v103);
    type metadata accessor for AVObservableBundle();
    sub_1B05D7CA8(&qword_1E9B35028, v104, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
    uint64_t *v100 = sub_1B0705990();
    v100[1] = v105;
    v106 = (char *)v100 + *((int *)v99 + 7);
    __asm { FMOV            V0.2D, #1.0 }
    long long v356 = _Q0;
    type metadata accessor for CGSize(0);
    sub_1B0705ED0();
    uint64_t v108 = v358;
    *(_OWORD *)v106 = v357;
    *((void *)v106 + 2) = v108;
    v100[2] = v86;
    v100[3] = v87;
    if (v85 == 3)
    {
      uint64_t v109 = 0xD000000000000027;
      v110 = "CONTENT_TABS_ACCESSIBILITY_DOLBY_VISION";
    }
    else
    {
      uint64_t v109 = 0xD00000000000001ELL;
      v110 = "CONTENT_TABS_ACCESSIBILITY_HDR";
    }
    uint64_t v111 = (uint64_t)v344;
    sub_1B05D1DC0(v109, (unint64_t)(v110 - 32) | 0x8000000000000000);
    swift_bridgeObjectRelease();
    sub_1B05D7CF0(v111, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    uint64_t v112 = sub_1B0705B10();
    uint64_t v113 = *(void *)(v112 - 8);
    MEMORY[0x1F4188790](v112);
    v115 = (char *)v314 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)&long long v357 = 0xD000000000000021;
    *((void *)&v357 + 1) = 0x80000001B07229D0;
    sub_1B0705B80();
    sub_1B07058D0();
    uint64_t v117 = v116;
    uint64_t v119 = v118;
    (*(void (**)(char *, uint64_t))(v113 + 8))(v115, v112);
    LOBYTE(v356) = 0;
    sub_1B0705ED0();
    LOBYTE(v112) = v357;
    uint64_t v120 = *((void *)&v357 + 1);
    sub_1B05DA300((uint64_t)v98, (uint64_t)v95, &qword_1E9B350F8);
    v121 = v329;
    v122 = &v95[*((int *)v329 + 9)];
    *(void *)v122 = v117;
    *((void *)v122 + 1) = v119;
    v122[16] = v112;
    *((void *)v122 + 3) = v120;
    sub_1B05DA364((uint64_t)v98, &qword_1E9B350F8);
    sub_1B05DA3C0((uint64_t)v95, (uint64_t)v93, &qword_1E9B350E8);
    uint64_t v123 = (uint64_t)v352;
    sub_1B05DA3C0((uint64_t)v93, (uint64_t)v352, &qword_1E9B350E8);
    uint64_t v89 = (*((uint64_t (**)(uint64_t, void, uint64_t, void *))v335 + 7))(v123, 0, 1, v121);
    uint64_t v6 = (uint64_t)v345;
    uint64_t v27 = (uint64_t)v326;
    uint64_t v28 = v339;
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
  uint64_t v89 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v352, 1, 1, v88);
LABEL_27:
  uint64_t v124 = (uint64_t)v341;
  MEMORY[0x1F4188790](v89);
  v126 = (char *)v314 - ((v125 + 15) & 0xFFFFFFFFFFFFFFF0);
  _ZF = *(unsigned char *)(v27 + v28[17]) == 4;
  v344 = (uint64_t *)v126;
  v329 = v127;
  if (_ZF && (*(unsigned char *)(v27 + *(int *)(v6 + 20)) & 0x10) != 0)
  {
    v328 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
    v340 = v314;
    v335 = (char *)*(v328 - 1);
    MEMORY[0x1F4188790](v328);
    v326 = (void *)((char *)v314 - ((v130 + 15) & 0xFFFFFFFFFFFFFFF0));
    v323 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
    v327 = v314;
    uint64_t v131 = *(void *)(*(v323 - 1) + 64);
    MEMORY[0x1F4188790](v323);
    unint64_t v132 = (v131 + 15) & 0xFFFFFFFFFFFFFFF0;
    v322 = (void *)((char *)v314 - v132);
    uint64_t v133 = v27;
    v134 = v334;
    v135 = v324;
    v136 = (char *)v324 + *((int *)v334 + 6);
    uint64_t v137 = *MEMORY[0x1E4F3EC18];
    uint64_t v138 = sub_1B0705E90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v138 - 8) + 104))(v136, v137, v138);
    type metadata accessor for AVObservableBundle();
    sub_1B05D7CA8(&qword_1E9B35028, v139, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
    uint64_t *v135 = sub_1B0705990();
    v135[1] = v140;
    v141 = (char *)v135 + *((int *)v134 + 7);
    __asm { FMOV            V0.2D, #1.0 }
    long long v356 = _Q0;
    type metadata accessor for CGSize(0);
    uint64_t v143 = sub_1B0705ED0();
    v321 = v314;
    uint64_t v144 = v358;
    *(_OWORD *)v141 = v357;
    *((void *)v141 + 2) = v144;
    v135[2] = 0x6C6F446F69647541;
    v135[3] = 0xEF736F6D74417962;
    MEMORY[0x1F4188790](v143);
    v145 = (char *)v314 - v132;
    v146 = (void *)sub_1B0706010();
    v147 = (void *)sub_1B0706010();
    id v148 = AVLocalizedString(v146);

    uint64_t v149 = sub_1B0706040();
    uint64_t v151 = v150;

    *(void *)&long long v357 = v149;
    *((void *)&v357 + 1) = v151;
    sub_1B05D7C54();
    uint64_t v152 = sub_1B0705D30();
    uint64_t v154 = v153;
    char v156 = v155 & 1;
    sub_1B05D7CA8(&qword_1E9B35100, 255, (void (*)(uint64_t))type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    uint64_t v27 = v133;
    sub_1B0705DE0();
    sub_1B05CC13C(v152, v154, v156);
    swift_bridgeObjectRelease();
    uint64_t v157 = sub_1B0705AA0();
    uint64_t v158 = *(void *)(v157 - 8);
    MEMORY[0x1F4188790](v157);
    v160 = (char *)v314 - ((v159 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B0705A90();
    uint64_t v161 = (uint64_t)v322;
    sub_1B0705930();
    (*(void (**)(char *, uint64_t))(v158 + 8))(v160, v157);
    uint64_t v162 = (uint64_t)v344;
    sub_1B05DA364((uint64_t)v145, &qword_1E9B350F8);
    sub_1B05D7CF0((uint64_t)v135, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    uint64_t v163 = sub_1B0705B10();
    uint64_t v164 = *(void *)(v163 - 8);
    MEMORY[0x1F4188790](v163);
    v166 = (char *)v314 - ((v165 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)&long long v357 = 0xD000000000000021;
    *((void *)&v357 + 1) = 0x80000001B07229D0;
    sub_1B0705B80();
    sub_1B07058D0();
    uint64_t v168 = v167;
    uint64_t v170 = v169;
    v171 = v166;
    uint64_t v28 = v339;
    (*(void (**)(char *, uint64_t))(v164 + 8))(v171, v163);
    uint64_t v124 = (uint64_t)v341;
    LOBYTE(v356) = 0;
    sub_1B0705ED0();
    LOBYTE(v163) = v357;
    uint64_t v172 = *((void *)&v357 + 1);
    uint64_t v173 = (uint64_t)v326;
    sub_1B05DA300(v161, (uint64_t)v326, &qword_1E9B350F8);
    v174 = v328;
    uint64_t v175 = v173 + *((int *)v328 + 9);
    *(void *)uint64_t v175 = v168;
    *(void *)(v175 + 8) = v170;
    *(unsigned char *)(v175 + 16) = v163;
    *(void *)(v175 + 24) = v172;
    sub_1B05DA364(v161, &qword_1E9B350F8);
    sub_1B05DA3C0(v173, v162, &qword_1E9B350E8);
    uint64_t v129 = (*((uint64_t (**)(uint64_t, void, uint64_t, void *))v335 + 7))(v162, 0, 1, v174);
  }
  else
  {
    uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
    uint64_t v129 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v128 - 8) + 56))(v126, 1, 1, v128);
  }
  v176 = *(void **)(v27 + v28[14]);
  if (!v176) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)(v27 + *((int *)v345 + 5)) & 0x20) == 0)
  {
    v176 = 0;
LABEL_35:
    v340 = 0;
    uint64_t v317 = 0;
    uint64_t v319 = 0;
    uint64_t v318 = 0;
    goto LABEL_37;
  }
  uint64_t v177 = sub_1B0705B10();
  uint64_t v178 = *(void *)(v177 - 8);
  MEMORY[0x1F4188790](v177);
  v180 = (char *)v314 - ((v179 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v357 = 0xD000000000000021;
  *((void *)&v357 + 1) = 0x80000001B07229D0;
  id v181 = v176;
  sub_1B0705B80();
  sub_1B07058D0();
  v183 = v182;
  uint64_t v185 = v184;
  v186 = v180;
  uint64_t v28 = v339;
  (*(void (**)(char *, uint64_t))(v178 + 8))(v186, v177);
  LOBYTE(v356) = 0;
  sub_1B0705ED0();

  uint64_t v124 = (uint64_t)v341;
  uint64_t v319 = v357;
  uint64_t v318 = *((void *)&v357 + 1);
  v340 = v183;
  uint64_t v317 = v185;
LABEL_37:
  MEMORY[0x1F4188790](v129);
  v188 = (char *)v314 - ((v187 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v189 = *(unsigned __int8 *)(v27 + v28[20]);
  sub_1B05D8270(v27, v124, type metadata accessor for AVInfoTabMetadataStripView);
  v328 = v176;
  v327 = v314;
  v335 = v188;
  if (v189 == 1)
  {
    uint64_t v190 = *(void *)(v124 + *((int *)v345 + 5));
    sub_1B05D7CF0(v124, type metadata accessor for AVInfoTabMetadataStripView);
    if ((v190 & 0x80) != 0)
    {
      v322 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
      v341 = v314;
      v323 = (void *)*(v322 - 1);
      MEMORY[0x1F4188790](v322);
      uint64_t v320 = (uint64_t)v314 - ((v191 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v315 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
      v321 = v314;
      uint64_t v192 = *(void *)(*(void *)(v315 - 8) + 64);
      MEMORY[0x1F4188790](v315);
      unint64_t v193 = (v192 + 15) & 0xFFFFFFFFFFFFFFF0;
      v316 = (void *)((char *)v314 - v193);
      v194 = v334;
      v195 = v324;
      v196 = (char *)v324 + *((int *)v334 + 6);
      uint64_t v197 = *MEMORY[0x1E4F3EC18];
      uint64_t v198 = sub_1B0705E90();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v198 - 8) + 104))(v196, v197, v198);
      type metadata accessor for AVObservableBundle();
      sub_1B05D7CA8(&qword_1E9B35028, v199, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
      uint64_t *v195 = sub_1B0705990();
      v195[1] = v200;
      v201 = (char *)v195 + *((int *)v194 + 7);
      __asm { FMOV            V0.2D, #1.0 }
      long long v356 = _Q0;
      type metadata accessor for CGSize(0);
      uint64_t v203 = sub_1B0705ED0();
      v314[1] = v314;
      uint64_t v204 = v358;
      *(_OWORD *)v201 = v357;
      *((void *)v201 + 2) = v204;
      v195[2] = 0x6B73616D5F6363;
      v195[3] = 0xE700000000000000;
      uint64_t v205 = MEMORY[0x1F4188790](v203);
      v314[0] = v314;
      MEMORY[0x1F4188790](v205);
      v206 = (void *)sub_1B0706010();
      v207 = (void *)sub_1B0706010();
      id v208 = AVLocalizedString(v206);

      uint64_t v209 = sub_1B0706040();
      uint64_t v211 = v210;

      *(void *)&long long v357 = v209;
      *((void *)&v357 + 1) = v211;
      sub_1B05D7C54();
      uint64_t v212 = sub_1B0705D30();
      uint64_t v214 = v213;
      v326 = (void *)v27;
      char v216 = v215 & 1;
      sub_1B05D7CA8(&qword_1E9B35100, 255, (void (*)(uint64_t))type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
      sub_1B0705DE0();
      sub_1B05CC13C(v212, v214, v216);
      swift_bridgeObjectRelease();
      uint64_t v217 = sub_1B0705AA0();
      uint64_t v218 = *(void *)(v217 - 8);
      MEMORY[0x1F4188790](v217);
      v220 = (char *)v314 - ((v219 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1B0705A90();
      sub_1B0705930();
      (*(void (**)(char *, uint64_t))(v218 + 8))(v220, v217);
      uint64_t v27 = (uint64_t)v326;
      sub_1B05DA364((uint64_t)v314 - v193, &qword_1E9B350F8);
      uint64_t v221 = (uint64_t)v316;
      sub_1B05DA3C0((uint64_t)v314 - v193, (uint64_t)v316, &qword_1E9B350F8);
      uint64_t v222 = (uint64_t)v195;
      uint64_t v223 = (uint64_t)v335;
      sub_1B05D7CF0(v222, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
      uint64_t v224 = sub_1B0705B10();
      uint64_t v225 = *(void *)(v224 - 8);
      MEMORY[0x1F4188790](v224);
      v227 = (char *)v314 - ((v226 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(void *)&long long v357 = 0xD000000000000021;
      *((void *)&v357 + 1) = 0x80000001B07229D0;
      sub_1B0705B80();
      sub_1B07058D0();
      uint64_t v229 = v228;
      uint64_t v231 = v230;
      v232 = v227;
      uint64_t v28 = v339;
      (*(void (**)(char *, uint64_t))(v225 + 8))(v232, v224);
      LOBYTE(v356) = 0;
      sub_1B0705ED0();
      LOBYTE(v224) = v357;
      uint64_t v233 = *((void *)&v357 + 1);
      uint64_t v234 = v320;
      sub_1B05DA300(v221, v320, &qword_1E9B350F8);
      uint64_t v235 = (uint64_t)v322;
      uint64_t v236 = v234 + *((int *)v322 + 9);
      *(void *)uint64_t v236 = v229;
      *(void *)(v236 + 8) = v231;
      *(unsigned char *)(v236 + 16) = v224;
      *(void *)(v236 + 24) = v233;
      sub_1B05DA364(v221, &qword_1E9B350F8);
      sub_1B05DA3C0(v234, v223, &qword_1E9B350E8);
      v188 = (char *)v223;
      uint64_t v237 = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v323[7])(v223, 0, 1, v235);
      goto LABEL_42;
    }
  }
  else
  {
    sub_1B05D7CF0(v124, type metadata accessor for AVInfoTabMetadataStripView);
  }
  uint64_t v238 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
  uint64_t v237 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v238 - 8) + 56))(v188, 1, 1, v238);
LABEL_42:
  MEMORY[0x1F4188790](v237);
  v339 = (int *)((char *)v314 - ((v239 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v240 = *(unsigned __int8 *)(v27 + v28[21]);
  uint64_t v241 = (uint64_t)v330;
  sub_1B05D8270(v27, (uint64_t)v330, type metadata accessor for AVInfoTabMetadataStripView);
  v326 = v314;
  if (v240 != 1)
  {
    sub_1B05D7CF0(v241, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_46;
  }
  uint64_t v242 = *(void *)(v241 + *((int *)v345 + 5));
  sub_1B05D7CF0(v241, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v242 & 0x100) == 0)
  {
LABEL_46:
    uint64_t v288 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
    uint64_t v286 = (uint64_t)v339;
    uint64_t v287 = (*(uint64_t (**)(int *, uint64_t, uint64_t, uint64_t))(*(void *)(v288 - 8) + 56))(v339, 1, 1, v288);
    goto LABEL_47;
  }
  v330 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350E8);
  v345 = v314;
  v341 = (void *)*(v330 - 1);
  MEMORY[0x1F4188790](v330);
  v322 = (void *)((char *)v314 - ((v243 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v320 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
  v323 = v314;
  uint64_t v244 = *(void *)(*(void *)(v320 - 8) + 64);
  MEMORY[0x1F4188790](v320);
  unint64_t v245 = (v244 + 15) & 0xFFFFFFFFFFFFFFF0;
  v321 = (void *)((char *)v314 - v245);
  v246 = v334;
  v247 = v324;
  v248 = (char *)v324 + *((int *)v334 + 6);
  uint64_t v249 = *MEMORY[0x1E4F3EC18];
  uint64_t v250 = sub_1B0705E90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v250 - 8) + 104))(v248, v249, v250);
  type metadata accessor for AVObservableBundle();
  sub_1B05D7CA8(&qword_1E9B35028, v251, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
  uint64_t *v247 = sub_1B0705990();
  v247[1] = v252;
  v253 = (char *)v247 + *((int *)v246 + 7);
  __asm { FMOV            V0.2D, #1.0 }
  long long v356 = _Q0;
  type metadata accessor for CGSize(0);
  uint64_t v255 = sub_1B0705ED0();
  uint64_t v256 = v358;
  *(_OWORD *)v253 = v357;
  *((void *)v253 + 2) = v256;
  v247[2] = 0xD000000000000011;
  v247[3] = 0x80000001B0722A00;
  uint64_t v257 = MEMORY[0x1F4188790](v255);
  v316 = v314;
  MEMORY[0x1F4188790](v257);
  v258 = (void *)sub_1B0706010();
  v259 = (void *)sub_1B0706010();
  id v260 = AVLocalizedString(v258);

  uint64_t v261 = sub_1B0706040();
  uint64_t v263 = v262;

  *(void *)&long long v357 = v261;
  *((void *)&v357 + 1) = v263;
  sub_1B05D7C54();
  uint64_t v264 = sub_1B0705D30();
  uint64_t v266 = v265;
  char v268 = v267 & 1;
  sub_1B05D7CA8(&qword_1E9B35100, 255, (void (*)(uint64_t))type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
  sub_1B0705DE0();
  sub_1B05CC13C(v264, v266, v268);
  swift_bridgeObjectRelease();
  uint64_t v269 = sub_1B0705AA0();
  uint64_t v270 = *(void *)(v269 - 8);
  MEMORY[0x1F4188790](v269);
  v272 = (char *)v314 - ((v271 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705A90();
  sub_1B0705930();
  (*(void (**)(char *, uint64_t))(v270 + 8))(v272, v269);
  sub_1B05DA364((uint64_t)v314 - v245, &qword_1E9B350F8);
  uint64_t v273 = (uint64_t)v321;
  sub_1B05DA3C0((uint64_t)v314 - v245, (uint64_t)v321, &qword_1E9B350F8);
  sub_1B05D7CF0((uint64_t)v247, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
  uint64_t v274 = sub_1B0705B10();
  uint64_t v275 = *(void *)(v274 - 8);
  MEMORY[0x1F4188790](v274);
  v277 = (char *)v314 - ((v276 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v357 = 0xD000000000000021;
  *((void *)&v357 + 1) = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  uint64_t v279 = v278;
  uint64_t v281 = v280;
  (*(void (**)(char *, uint64_t))(v275 + 8))(v277, v274);
  v188 = v335;
  LOBYTE(v356) = 0;
  sub_1B0705ED0();
  LOBYTE(v274) = v357;
  uint64_t v282 = *((void *)&v357 + 1);
  uint64_t v283 = (uint64_t)v322;
  sub_1B05DA300(v273, (uint64_t)v322, &qword_1E9B350F8);
  uint64_t v284 = (uint64_t)v330;
  uint64_t v285 = v283 + *((int *)v330 + 9);
  *(void *)uint64_t v285 = v279;
  *(void *)(v285 + 8) = v281;
  *(unsigned char *)(v285 + 16) = v274;
  *(void *)(v285 + 24) = v282;
  sub_1B05DA364(v273, &qword_1E9B350F8);
  uint64_t v286 = (uint64_t)v339;
  sub_1B05DA3C0(v283, (uint64_t)v339, &qword_1E9B350E8);
  uint64_t v287 = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v341[7])(v286, 0, 1, v284);
LABEL_47:
  v334 = v314;
  MEMORY[0x1F4188790](v287);
  v290 = (char *)v314 - ((v289 + 15) & 0xFFFFFFFFFFFFFFF0);
  v321 = v290;
  uint64_t v291 = sub_1B05DA300((uint64_t)v343, (uint64_t)v290, &qword_1E9B350C8);
  v330 = v314;
  uint64_t v292 = v355;
  MEMORY[0x1F4188790](v291);
  unint64_t v293 = (v292 + 15) & 0xFFFFFFFFFFFFFFF0;
  v345 = (void *)((char *)v314 - v293);
  uint64_t v294 = sub_1B05DA300(v353, (uint64_t)v314 - v293, &qword_1E9B350E0);
  v325 = v314;
  MEMORY[0x1F4188790](v294);
  v341 = (void *)((char *)v314 - v293);
  uint64_t v295 = sub_1B05DA300((uint64_t)v352, (uint64_t)v314 - v293, &qword_1E9B350E0);
  v324 = v314;
  MEMORY[0x1F4188790](v295);
  v296 = (char *)v314 - v293;
  uint64_t v320 = (uint64_t)v314 - v293;
  uint64_t v297 = sub_1B05DA300((uint64_t)v344, (uint64_t)v314 - v293, &qword_1E9B350E0);
  v323 = v314;
  MEMORY[0x1F4188790](v297);
  uint64_t v342 = (uint64_t)v314 - v293;
  uint64_t v298 = sub_1B05DA300((uint64_t)v188, (uint64_t)v314 - v293, &qword_1E9B350E0);
  v322 = v314;
  MEMORY[0x1F4188790](v298);
  uint64_t v355 = (uint64_t)v314 - v293;
  sub_1B05DA300(v286, (uint64_t)v314 - v293, &qword_1E9B350E0);
  uint64_t v299 = v333;
  sub_1B05DA300((uint64_t)v290, v333, &qword_1E9B350C8);
  v300 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F0);
  v301 = (void *)(v299 + v300[12]);
  uint64_t v302 = v338;
  void *v301 = v351;
  v301[1] = v302;
  uint64_t v303 = v337;
  v301[2] = v350;
  v301[3] = v303;
  uint64_t v304 = v348;
  unint64_t v305 = v354;
  v301[4] = v349;
  v301[5] = v305;
  v301[6] = v336;
  v301[7] = v304;
  uint64_t v306 = v346;
  uint64_t v307 = v347;
  v301[8] = v347;
  v301[9] = v306;
  uint64_t v347 = v307;
  uint64_t v348 = v304;
  uint64_t v346 = v306;
  sub_1B05DA300((uint64_t)v345, v299 + v300[16], &qword_1E9B350E0);
  sub_1B05DA300((uint64_t)v341, v299 + v300[20], &qword_1E9B350E0);
  sub_1B05DA300((uint64_t)v296, v299 + v300[24], &qword_1E9B350E0);
  v308 = (void *)(v299 + v300[28]);
  v309 = v328;
  v310 = v340;
  void *v308 = v328;
  v308[1] = v310;
  uint64_t v311 = v319;
  v308[2] = v317;
  v308[3] = v311;
  v308[4] = v318;
  sub_1B05DA300(v342, v299 + v300[32], &qword_1E9B350E0);
  sub_1B05DA300(v355, v299 + v300[36], &qword_1E9B350E0);
  uint64_t v312 = v299 + v300[40];
  *(void *)uint64_t v312 = 0;
  *(unsigned char *)(v312 + 8) = 1;
  sub_1B05D7B2C(v351);
  sub_1B05D7B80(v309);
  sub_1B05DA364((uint64_t)v339, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v335, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v344, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v352, &qword_1E9B350E0);
  sub_1B05DA364(v353, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v343, &qword_1E9B350C8);
  sub_1B05DA364(v355, &qword_1E9B350E0);
  sub_1B05DA364(v342, &qword_1E9B350E0);
  sub_1B05D7BC4(v309);
  sub_1B05DA364(v320, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v341, &qword_1E9B350E0);
  sub_1B05DA364((uint64_t)v345, &qword_1E9B350E0);
  sub_1B05D7C04(v351);
  return sub_1B05DA364((uint64_t)v321, &qword_1E9B350C8);
}

uint64_t sub_1B05CF918@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVInfoTabMetadataStripView(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MediaInfo();
  uint64_t v8 = (unint64_t *)(a1 + *(int *)(v7 + 40));
  unint64_t v9 = v8[1];
  uint64_t v92 = a2;
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = v7;
  unint64_t v11 = *v8;
  uint64_t v12 = *(void *)(a1 + *(int *)(v4 + 20));
  sub_1B05D8270(a1, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v12 & 1) == 0)
  {
    sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_7:
    uint64_t v81 = 0;
    uint64_t v98 = 0;
    uint64_t v80 = 0;
    uint64_t v95 = 0;
    uint64_t v97 = 0;
    uint64_t v79 = 0;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    unint64_t v78 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = *(void *)&v6[*(int *)(v10 + 40) + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  unint64_t v101 = v11;
  unint64_t v102 = v9;
  sub_1B05D7C54();
  uint64_t v81 = sub_1B0705D30();
  uint64_t v98 = v14;
  uint64_t v95 = v15;
  uint64_t v80 = v16 & 1;
  uint64_t v17 = sub_1B0705B10();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v101 = 0xD000000000000021;
  unint64_t v102 = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  char v100 = 0;
  sub_1B0705ED0();
  uint64_t v94 = v101;
  unint64_t v78 = v102;
  uint64_t v79 = v22;
  uint64_t v93 = v24;
  uint64_t v97 = 257;
LABEL_8:
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35108);
  uint64_t v91 = &v78;
  uint64_t v26 = v25 - 8;
  uint64_t v90 = *(unint64_t **)(*(void *)(v25 - 8) + 64);
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  unint64_t v89 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v99 = (uint64_t)&v78 - v89;
  uint64_t v96 = &v78;
  MEMORY[0x1F4188790](v27);
  uint64_t v30 = (char *)&v78 - v29;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35110);
  uint64_t v88 = &v78;
  MEMORY[0x1F4188790](v31 - 8);
  uint64_t v33 = (char *)&v78 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05D0228(a1, (uint64_t)v33);
  uint64_t v34 = sub_1B0705B10();
  uint64_t v35 = *(void *)(v34 - 8);
  unint64_t v87 = (void *)a1;
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)(v35 + 64);
  MEMORY[0x1F4188790](v34);
  unint64_t v85 = 0x80000001B07229D0;
  unint64_t v86 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v101 = 0xD000000000000021;
  unint64_t v102 = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v84 = *(void (**)(char *, uint64_t))(v36 + 8);
  v84((char *)&v78 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
  char v100 = 0;
  sub_1B0705ED0();
  char v42 = v101;
  unint64_t v43 = v102;
  sub_1B05DA300((uint64_t)v33, (uint64_t)v30, &qword_1E9B35110);
  unint64_t v44 = &v30[*(int *)(v26 + 44)];
  *(void *)unint64_t v44 = v39;
  *((void *)v44 + 1) = v41;
  v44[16] = v42;
  *((void *)v44 + 3) = v43;
  sub_1B05DA364((uint64_t)v33, &qword_1E9B35110);
  sub_1B05DA3C0((uint64_t)v30, v99, &qword_1E9B35108);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35118);
  uint64_t v88 = &v78;
  uint64_t v46 = v45 - 8;
  uint64_t v47 = *(void *)(*(void *)(v45 - 8) + 64);
  uint64_t v48 = MEMORY[0x1F4188790](v45);
  unint64_t v49 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v96 = (unint64_t *)((char *)&v78 - v49);
  uint64_t v83 = &v78;
  MEMORY[0x1F4188790](v48);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35120);
  v82 = &v78;
  MEMORY[0x1F4188790](v50 - 8);
  uint64_t v52 = (char *)&v78 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1B05D10A4((uint64_t)v87, (uint64_t)v52);
  MEMORY[0x1F4188790](v53);
  uint64_t v54 = (char *)&v78 - v86;
  unint64_t v101 = 0xD000000000000021;
  unint64_t v102 = v85;
  sub_1B0705B80();
  sub_1B07058D0();
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  v84(v54, v34);
  char v100 = 0;
  sub_1B0705ED0();
  char v59 = v101;
  unint64_t v60 = v102;
  sub_1B05DA300((uint64_t)v52, (uint64_t)&v78 - v49, &qword_1E9B35120);
  uint64_t v61 = (char *)&v78 + *(int *)(v46 + 44) - v49;
  *(void *)uint64_t v61 = v56;
  *((void *)v61 + 1) = v58;
  v61[16] = v59;
  *((void *)v61 + 3) = v60;
  sub_1B05DA364((uint64_t)v52, &qword_1E9B35120);
  uint64_t v62 = (uint64_t)v96;
  uint64_t v63 = sub_1B05DA3C0((uint64_t)&v78 - v49, (uint64_t)v96, &qword_1E9B35118);
  unint64_t v87 = &v78;
  MEMORY[0x1F4188790](v63);
  v64 = (char *)&v78 - v89;
  uint64_t v65 = sub_1B05DA300(v99, (uint64_t)&v78 - v89, &qword_1E9B35108);
  uint64_t v90 = &v78;
  MEMORY[0x1F4188790](v65);
  v66 = (char *)&v78 - v49;
  sub_1B05DA300(v62, (uint64_t)&v78 - v49, &qword_1E9B35118);
  v67 = v92;
  uint64_t v68 = v81;
  uint64_t v69 = v97;
  uint64_t v70 = v98;
  *uint64_t v92 = v81;
  v67[1] = v70;
  uint64_t v98 = v70;
  LOBYTE(v54) = v80;
  uint64_t v71 = v95;
  v67[2] = v80;
  v67[3] = v71;
  uint64_t v97 = v69;
  uint64_t v72 = v79;
  v67[4] = v69;
  v67[5] = v72;
  uint64_t v73 = v94;
  v67[6] = v93;
  v67[7] = v73;
  v67[8] = v78;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35128);
  sub_1B05DA300((uint64_t)v64, (uint64_t)v67 + *(int *)(v74 + 48), &qword_1E9B35108);
  sub_1B05DA300((uint64_t)v66, (uint64_t)v67 + *(int *)(v74 + 64), &qword_1E9B35118);
  uint64_t v75 = v70;
  uint64_t v76 = v95;
  sub_1B05D7D50(v68, v75, (char)v54, v95);
  sub_1B05DA364((uint64_t)v96, &qword_1E9B35118);
  sub_1B05DA364(v99, &qword_1E9B35108);
  sub_1B05DA364((uint64_t)v66, &qword_1E9B35118);
  sub_1B05DA364((uint64_t)v64, &qword_1E9B35108);
  return sub_1B05D7DA0(v68, v98, (char)v54, v76);
}

uint64_t sub_1B05D0228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v3 = type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView(0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v84 = (uint64_t *)((char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v82 = (uint64_t)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v72 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v83 = v12;
  uint64_t v13 = (char *)&v72 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MediaInfo();
  uint64_t v15 = a1 + *(int *)(v14 + 28);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300(v15, (uint64_t)v18, &qword_1E9B34D38);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v18, 1, v10) == 1)
  {
    sub_1B05DA364((uint64_t)v18, &qword_1E9B34D38);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B351A0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v85, 1, 1, v19);
  }
  uint64_t v21 = *(int *)(v10 + 48);
  uint64_t v22 = &v13[v21];
  uint64_t v80 = v10;
  uint64_t v23 = *(int *)(v10 + 64);
  uint64_t v24 = &v13[v23];
  uint64_t v25 = &v18[v21];
  uint64_t v26 = &v18[v23];
  sub_1B05DA3C0((uint64_t)v18, (uint64_t)v13, &qword_1E9B34D48);
  uint64_t v27 = *(void *)v25;
  uint64_t v28 = *((void *)v25 + 1);
  uint64_t v78 = v27;
  *(void *)uint64_t v22 = v27;
  *((void *)v22 + 1) = v28;
  uint64_t v29 = *((void *)v26 + 1);
  uint64_t v76 = *(void *)v26;
  *(void *)uint64_t v24 = v76;
  *((void *)v24 + 1) = v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35130);
  uint64_t v81 = &v72;
  uint64_t v31 = *(void *)(*(void *)(v30 - 8) + 64);
  MEMORY[0x1F4188790](v30 - 8);
  uint64_t v32 = *(void *)(a1 + *(int *)(v5 + 20));
  sub_1B05D8270(a1, (uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
  uint64_t v33 = (uint64_t)v13;
  uint64_t v79 = v31;
  uint64_t v77 = v28;
  uint64_t v74 = (uint64_t)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = v29;
  if ((v32 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B05D7CF0((uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
    uint64_t v34 = v82;
    uint64_t v35 = v83;
LABEL_8:
    sub_1B05D8270(a1, v34, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1B05D7CF0(v34, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_9;
  }
  uint64_t v36 = *(void *)&v9[*(int *)(v14 + 40) + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B05D7CF0((uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
  uint64_t v34 = v82;
  uint64_t v35 = v83;
  if (!v36) {
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  sub_1B05D8270(a1, v34, type metadata accessor for AVInfoTabMetadataStripView);
  char v37 = sub_1B05D0AB0();
  sub_1B05D7CF0(v34, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v37 & 1) == 0)
  {
LABEL_9:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35138);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))((char *)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v45);
    goto LABEL_10;
  }
  sub_1B0705A70();
  uint64_t v38 = sub_1B0705D20();
  uint64_t v40 = v39;
  uint64_t v86 = v38;
  uint64_t v87 = v39;
  char v42 = v41 & 1;
  char v88 = v41 & 1;
  uint64_t v89 = v43;
  sub_1B0705DF0();
  sub_1B05CC13C(v38, v40, v42);
  swift_bridgeObjectRelease();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35138);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))((char *)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v44);
LABEL_10:
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B351A8);
  uint64_t v83 = &v72;
  uint64_t v47 = v46 - 8;
  uint64_t v48 = *(void *)(*(void *)(v46 - 8) + 64);
  uint64_t v49 = MEMORY[0x1F4188790](v46);
  uint64_t v50 = (char *)&v72 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = (uint64_t)&v72;
  unint64_t v73 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v51 = MEMORY[0x1F4188790](v49);
  uint64_t v53 = (char *)&v72 - v52;
  MEMORY[0x1F4188790](v51);
  uint64_t v54 = (char *)&v72 - (((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300(v33, (uint64_t)v54, &qword_1E9B34D48);
  uint64_t v55 = *(int *)(v80 + 48);
  uint64_t v82 = v33;
  uint64_t v56 = (uint64_t)v84;
  uint64_t v57 = (uint64_t *)((char *)v84 + v55);
  uint64_t v58 = (uint64_t *)((char *)v84 + *(int *)(v80 + 64));
  sub_1B05DA3C0((uint64_t)v54, (uint64_t)v84, &qword_1E9B34D48);
  uint64_t v59 = v77;
  void *v57 = v78;
  v57[1] = v59;
  uint64_t v60 = v75;
  void *v58 = v76;
  v58[1] = v60;
  sub_1B05D8270(v56, (uint64_t)v53, type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView);
  *(_WORD *)&v53[*(int *)(v47 + 44)] = 257;
  sub_1B05D7CF0(v56, type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView);
  sub_1B05DA3C0((uint64_t)v53, (uint64_t)v50, &qword_1E9B351A8);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B351B0);
  uint64_t v84 = &v72;
  uint64_t v62 = MEMORY[0x1F4188790](v61 - 8);
  v64 = (char *)&v72 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v62);
  v66 = (char *)&v72 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = v74;
  uint64_t v68 = sub_1B05DA300(v74, (uint64_t)v66, &qword_1E9B35130);
  MEMORY[0x1F4188790](v68);
  uint64_t v69 = (char *)&v72 - v73;
  sub_1B05DA300((uint64_t)v50, (uint64_t)&v72 - v73, &qword_1E9B351A8);
  sub_1B05DA300((uint64_t)v66, (uint64_t)v64, &qword_1E9B35130);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B351B8);
  sub_1B05DA300((uint64_t)v69, (uint64_t)&v64[*(int *)(v70 + 48)], &qword_1E9B351A8);
  sub_1B05DA364((uint64_t)v50, &qword_1E9B351A8);
  sub_1B05DA364(v67, &qword_1E9B35130);
  sub_1B05DA364(v82, &qword_1E9B34D30);
  sub_1B05DA364((uint64_t)v69, &qword_1E9B351A8);
  sub_1B05DA364((uint64_t)v66, &qword_1E9B35130);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B351A0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v64, 0, 1, v71);
  return sub_1B05DA3C0((uint64_t)v64, v85, &qword_1E9B351B0);
}

uint64_t sub_1B05D0AB0()
{
  uint64_t v1 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v2 = MEMORY[0x1F4188790](v1 - 8);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)v27 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = type metadata accessor for MediaInfo();
  sub_1B05DA300(v0 + *(int *)(v12 + 28), (uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
  if (v14((char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v13) == 1)
  {
    sub_1B05DA364((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
    uint64_t v15 = sub_1B0705750();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
LABEL_4:
    sub_1B05DA364((uint64_t)v9, &qword_1E9B34D48);
    sub_1B05D8270(v0, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_5:
    sub_1B05D8270(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_6:
    sub_1B05D7CF0((uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
    char v17 = 0;
    return v17 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B05DA3C0((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v9, &qword_1E9B34D48);
  uint64_t v16 = sub_1B0705750();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v9, 1, v16) == 1) {
    goto LABEL_4;
  }
  sub_1B05DA364((uint64_t)v9, &qword_1E9B34D48);
  uint64_t v19 = sub_1B05D8270(v0, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  MEMORY[0x1F4188790](v19);
  sub_1B05DA300((uint64_t)&v6[*(int *)(v12 + 28)], (uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
  if (v14((char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v13) == 1)
  {
    sub_1B05DA364((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
LABEL_14:
    sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_1B05D8270(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_15;
  }
  uint64_t v20 = (void *)((char *)v27 + *(int *)(v13 + 48) - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27[0] = *v20;
  v27[1] = v27;
  uint64_t v21 = v20[1];
  swift_bridgeObjectRelease();
  sub_1B05DA364((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D48);
  if (!v21) {
    goto LABEL_14;
  }
  if (!v27[0] && v21 == 0xE000000000000000)
  {
    sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  char v26 = sub_1B0706220();
  sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_1B05D8270(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
  if (v26) {
    goto LABEL_6;
  }
LABEL_15:
  MEMORY[0x1F4188790](v22);
  sub_1B05DA300((uint64_t)&v4[*(int *)(v12 + 28)], (uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
  if (v14((char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v13) == 1)
  {
    sub_1B05DA364((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D38);
    char v17 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)((char *)v27 + *(int *)(v13 + 64) - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    sub_1B05DA364((uint64_t)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D48);
    if (v24)
    {
      if (v25 || v24 != 0xE000000000000000) {
        char v17 = sub_1B0706220() ^ 1;
      }
      else {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 1;
    }
  }
  sub_1B05D7CF0((uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
  swift_bridgeObjectRelease();
  return v17 & 1;
}

uint64_t sub_1B05D10A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v3 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  unint64_t v9 = (char *)v64 - v8;
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)v64 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)v64 - v14;
  MEMORY[0x1F4188790](v13);
  char v17 = (char *)v64 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35130);
  MEMORY[0x1F4188790](v18 - 8);
  v64[3] = v19;
  uint64_t v20 = (char *)v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(int *)(v3 + 20);
  uint64_t v22 = *(void *)(a1 + v21);
  sub_1B05D8270(a1, (uint64_t)v17, type metadata accessor for AVInfoTabMetadataStripView);
  if (v22)
  {
    uint64_t v23 = *(void *)&v17[*(int *)(type metadata accessor for MediaInfo() + 40) + 8];
    swift_bridgeObjectRetain();
    sub_1B05D7CF0((uint64_t)v17, type metadata accessor for AVInfoTabMetadataStripView);
    if (v23)
    {
      swift_bridgeObjectRelease();
      sub_1B05D8270(a1, (uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
      sub_1B05D7CF0((uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
      sub_1B05D8270(a1, (uint64_t)v12, type metadata accessor for AVInfoTabMetadataStripView);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B05D7CF0((uint64_t)v17, type metadata accessor for AVInfoTabMetadataStripView);
  }
  sub_1B05D8270(a1, (uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
  char v24 = sub_1B05D0AB0();
  sub_1B05D7CF0((uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1B05D8270(a1, (uint64_t)v12, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v24 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v25 = type metadata accessor for MediaInfo();
  char v26 = v12[*(int *)(v25 + 76) + 24];
  sub_1B05D8270((uint64_t)v12, (uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
  if (v26)
  {
    uint64_t v27 = *(void *)&v9[*(int *)(v25 + 32) + 8];
    swift_bridgeObjectRetain();
    sub_1B05D7CF0((uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
    if (v27)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
LABEL_9:
    sub_1B05D7CF0((uint64_t)v12, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1B05D8270(a1, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_12:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35138);
    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v20, 1, 1, v29);
    goto LABEL_14;
  }
  sub_1B05D7CF0((uint64_t)v9, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_11:
  sub_1B05D7CF0((uint64_t)v12, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1B05D8270(a1, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  uint64_t v28 = *(void *)&v6[*(int *)(v3 + 20)];
  sub_1B05D7CF0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v28 & 2) == 0) {
    goto LABEL_12;
  }
  sub_1B0705A70();
  uint64_t v31 = sub_1B0705D20();
  uint64_t v33 = v32;
  uint64_t v72 = v31;
  uint64_t v73 = v32;
  char v35 = v34 & 1;
  LOBYTE(v74) = v34 & 1;
  uint64_t v75 = v36;
  sub_1B0705DF0();
  sub_1B05CC13C(v31, v33, v35);
  swift_bridgeObjectRelease();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35138);
  uint64_t v30 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v20, 0, 1, v37);
LABEL_14:
  if ((*(unsigned char *)(a1 + v21) & 2) != 0)
  {
    uint64_t v30 = type metadata accessor for MediaInfo();
    uint64_t v43 = (uint64_t *)(a1 + *(int *)(v30 + 32));
    uint64_t v44 = v43[1];
    if (v44)
    {
      uint64_t v72 = *v43;
      uint64_t v73 = v44;
      sub_1B05D7C54();
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_1B0705D30();
      uint64_t v67 = v45;
      uint64_t v68 = v46 & 1;
      uint64_t v69 = v47;
      __int16 v70 = 257;
      char v71 = 0;
    }
    else
    {
      if (*(unsigned char *)(a1 + *(int *)(v30 + 76) + 24))
      {
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        int v42 = 16711680;
        goto LABEL_25;
      }
      sub_1B0706130();
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35148);
      v64[2] = v64;
      MEMORY[0x1F4188790](v48 - 8);
      sub_1B05D1A9C((char *)v64 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v50 = sub_1B0705720();
      v64[1] = v64;
      MEMORY[0x1F4188790](v50);
      uint64_t v51 = sub_1B07056D0();
      v64[0] = v64;
      MEMORY[0x1F4188790](v51 - 8);
      sub_1B07056C0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35150);
      sub_1B0705700();
      uint64_t v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_1B071FFD0;
      sub_1B07056E0();
      sub_1B07056F0();
      sub_1B05D7EC0(v52);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      uint64_t v53 = sub_1B0705770();
      MEMORY[0x1F4188790](v53 - 8);
      sub_1B0705760();
      uint64_t v54 = sub_1B0705790();
      MEMORY[0x1F4188790](v54 - 8);
      sub_1B0705780();
      sub_1B0705710();
      sub_1B05DA434(&qword_1E9B35158, MEMORY[0x1F418B9A0]);
      sub_1B05D81BC();
      uint64_t v66 = sub_1B0705D10();
      uint64_t v67 = v56;
      uint64_t v68 = v55 & 1;
      uint64_t v69 = v57;
      __int16 v70 = 257;
      char v71 = 1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35168);
    sub_1B05DA250(&qword_1E9B35170, &qword_1E9B35168);
    uint64_t v30 = sub_1B0705B00();
    uint64_t v38 = v72;
    uint64_t v39 = v73;
    uint64_t v40 = v74;
    uint64_t v41 = v75;
    if (v77) {
      int v58 = 0x10000;
    }
    else {
      int v58 = 0;
    }
    int v42 = v58 | v76;
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    int v42 = 16646144;
  }
LABEL_25:
  MEMORY[0x1F4188790](v30);
  uint64_t v60 = (char *)v64 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300((uint64_t)v20, (uint64_t)v60, &qword_1E9B35130);
  uint64_t v61 = v65;
  sub_1B05DA300((uint64_t)v60, v65, &qword_1E9B35130);
  uint64_t v62 = v61 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35140) + 48);
  *(void *)uint64_t v62 = v38;
  *(void *)(v62 + 8) = v39;
  *(void *)(v62 + 16) = v40;
  *(void *)(v62 + 24) = v41;
  *(unsigned char *)(v62 + 34) = BYTE2(v42);
  *(_WORD *)(v62 + 32) = v42;
  sub_1B05D7DF0(v38, v39, v40, v41, v42);
  sub_1B05DA364((uint64_t)v20, &qword_1E9B35130);
  sub_1B05D7E58(v38, v39, v40, v41, v42);
  return sub_1B05DA364((uint64_t)v60, &qword_1E9B35130);
}

uint64_t sub_1B05D1A9C@<X0>(char *a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v1 = sub_1B0705750();
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = v2[8];
  MEMORY[0x1F4188790](v1);
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = sub_1B0705730();
  MEMORY[0x1F4188790](v5);
  uint64_t v6 = (char *)v24 - v4;
  sub_1B0705730();
  sub_1B05DA434(&qword_1E9B35190, MEMORY[0x1F418B9A8]);
  uint64_t result = sub_1B0705FF0();
  if (result)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35198);
    char v26 = v24;
    uint64_t v9 = v8 - 8;
    MEMORY[0x1F4188790](v8);
    uint64_t v11 = (char *)v24 - v4;
    uint64_t v12 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v24[1] = v10;
    unint64_t v25 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v28 = &v12[*(int *)(v9 + 56)];
    uint64_t v13 = v28;
    uint64_t v14 = (void (*)(char *, char *, uint64_t))v2[4];
    v14(v12, v11, v1);
    uint64_t v15 = ((uint64_t (*)(char *, char *, uint64_t))v14)(v13, v6, v1);
    v24[0] = v24;
    MEMORY[0x1F4188790](v15);
    uint64_t v16 = &v12[*(int *)(v9 + 56)];
    char v17 = (void (*)(char *, char *, uint64_t))v2[2];
    v17(v12, v12, v1);
    v17(v16, v28, v1);
    uint64_t v18 = v27;
    v14(v27, v12, v1);
    uint64_t v19 = (uint64_t (*)(char *, uint64_t))v2[1];
    uint64_t v20 = v19(v16, v1);
    MEMORY[0x1F4188790](v20);
    uint64_t v21 = (char *)v24 - v25;
    uint64_t v22 = (char *)v24 + *(int *)(v9 + 56) - v25;
    v14((char *)v24 - v25, v12, v1);
    v14(v22, v28, v1);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35148);
    v14(&v18[*(int *)(v23 + 36)], v22, v1);
    return v19(v21, v1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B05D1DC0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B350F8);
    MEMORY[0x1F4188790](v2);
    unint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v5 = (void *)sub_1B0706010();
    uint64_t v6 = (void *)sub_1B0706010();
    id v7 = AVLocalizedString(v5);

    uint64_t v8 = sub_1B0706040();
    uint64_t v10 = v9;

    v21[2] = v8;
    v21[3] = v10;
    sub_1B05D7C54();
    uint64_t v11 = sub_1B0705D30();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
    sub_1B05D7CA8(&qword_1E9B35100, 255, (void (*)(uint64_t))type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    sub_1B0705DE0();
    sub_1B05CC13C(v11, v13, v15);
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1B0705AA0();
    uint64_t v17 = *(void *)(v16 - 8);
    MEMORY[0x1F4188790](v16);
    uint64_t v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B0705A90();
    sub_1B0705930();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    return sub_1B05DA364((uint64_t)v4, &qword_1E9B350F8);
  }
  else
  {
    sub_1B0705A70();
    type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
    sub_1B05D7CA8(&qword_1E9B35100, 255, (void (*)(uint64_t))type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    sub_1B0705DD0();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B05D20F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35240);
    MEMORY[0x1F4188790](v2);
    unint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v5 = (void *)sub_1B0706010();
    uint64_t v6 = (void *)sub_1B0706010();
    id v7 = AVLocalizedString(v5);

    uint64_t v8 = sub_1B0706040();
    uint64_t v10 = v9;

    v21[2] = v8;
    v21[3] = v10;
    sub_1B05D7C54();
    uint64_t v11 = sub_1B0705D30();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35258);
    sub_1B05D9EA8();
    sub_1B0705DE0();
    sub_1B05CC13C(v11, v13, v15);
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1B0705AA0();
    uint64_t v17 = *(void *)(v16 - 8);
    MEMORY[0x1F4188790](v16);
    uint64_t v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B0705A90();
    sub_1B0705930();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    return sub_1B05DA364((uint64_t)v4, &qword_1E9B35240);
  }
  else
  {
    sub_1B0705A70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35258);
    sub_1B05D9EA8();
    sub_1B0705DD0();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void *sub_1B05D23D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1B05D23E0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1B05D23E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1B05D23FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1B05D2410@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1B05D2424(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1B05D2454@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1B05D2480@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1B05D24A4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1B05D24B8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1B05D24CC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1B05D24E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1B05D24F4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1B05D2508(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1B05D251C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1B05D2530()
{
  return *v0 == 0;
}

uint64_t sub_1B05D2540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1B05D2558(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1B05D256C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1B05D257C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1B05D2588(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B05D259C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1B05DA5B4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_1B05D25DC()
{
  uint64_t v0 = unk_1F0914398;
  if ((unk_1F0914398 & ~qword_1F0914390) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_1F0914390;
  uint64_t v2 = qword_1F09143A0;
  if ((qword_1F09143A0 & ~v1) == 0) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = v2 | v1;
  if ((unk_1F09143A8 & ~v3) != 0) {
    uint64_t v4 = unk_1F09143A8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 | v3;
  uint64_t v6 = qword_1F09143B0;
  if ((qword_1F09143B0 & ~v5) == 0) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | v5;
  if ((unk_1F09143B8 & ~v7) != 0) {
    uint64_t v8 = unk_1F09143B8;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | v7;
  uint64_t v10 = qword_1F09143C0;
  if ((qword_1F09143C0 & ~v9) == 0) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 | v9;
  if ((unk_1F09143C8 & ~v11) != 0) {
    uint64_t v12 = unk_1F09143C8;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12 | v11;
  uint64_t v14 = qword_1F09143D0;
  if ((qword_1F09143D0 & ~v13) == 0) {
    uint64_t v14 = 0;
  }
  qword_1E9B3A378 = v14 | v13;
}

uint64_t sub_1B05D2664@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  uint64_t v37 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v38 = v4;
  uint64_t v39 = (uint64_t)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)v1)
  {
    uint64_t v8 = *(void **)(*(void *)v1 + 16);
    swift_bridgeObjectRetain();
    id v9 = v8;
    uint64_t v35 = sub_1B0705EB0();
    uint64_t v10 = v1 + *(int *)(v3 + 24);
    uint64_t v11 = sub_1B0705E90();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v36 = v3;
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v13(v7, v10, v11);
    uint64_t v40 = sub_1B0705AB0();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35218);
    MEMORY[0x1F4188790](v14 - 8);
    uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13(v16, (uint64_t)v7, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    sub_1B0705E80();
    sub_1B05DA364((uint64_t)v16, &qword_1E9B35218);
    uint64_t v17 = sub_1B0705E70();
    uint64_t v18 = *(void *)(v17 - 8);
    MEMORY[0x1F4188790](v17);
    uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E4F3EBF0], v17);
    uint64_t v21 = sub_1B0705EA0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_1B05D7CF0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    uint64_t v22 = v39;
    sub_1B05D8270(v1, v39, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    unint64_t v23 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v24 = swift_allocObject();
    sub_1B05D9CC0(v22, v24 + v23, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    if (qword_1E9B34EA8 != -1) {
      swift_once();
    }
    unint64_t v25 = (uint64_t *)(v1 + *(int *)(v36 + 28));
    uint64_t v27 = v25[1];
    uint64_t v28 = v25[2];
    uint64_t v41 = *v25;
    uint64_t v26 = v41;
    uint64_t v42 = v27;
    uint64_t v43 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35220);
    sub_1B0705EE0();
    uint64_t v41 = v26;
    uint64_t v42 = v27;
    uint64_t v43 = v28;
    sub_1B0705EE0();
    sub_1B0705F70();
    uint64_t result = sub_1B07058B0();
    uint64_t v30 = v41;
    char v31 = v42;
    uint64_t v32 = v43;
    char v33 = v44;
    *(void *)a1 = v40;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    *(void *)(a1 + 24) = v21;
    *(void *)(a1 + 32) = 0;
    *(_WORD *)(a1 + 40) = 1;
    *(void *)(a1 + 48) = sub_1B05D9D28;
    *(void *)(a1 + 56) = v24;
    *(void *)(a1 + 64) = v30;
    *(unsigned char *)(a1 + 72) = v31;
    *(void *)(a1 + 80) = v32;
    *(unsigned char *)(a1 + 88) = v33;
    *(_OWORD *)(a1 + 96) = v45;
  }
  else
  {
    type metadata accessor for AVObservableBundle();
    sub_1B05D7CA8(&qword_1E9B35028, v34, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B0705980();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B05D2BBC()
{
  return sub_1B0705EF0();
}

double sub_1B05D2C34@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel_image);
  if (v7)
  {
    id v35 = v7;
    v30[2] = sub_1B0705E60();
    uint64_t v8 = sub_1B0705E90();
    char v33 = v30;
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v8);
    uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v31 = v11;
    unsigned int v12 = objc_msgSend(a1, sel_isImageMask);
    uint64_t v13 = (unsigned int *)MEMORY[0x1E4F3EC10];
    if (v12) {
      uint64_t v13 = (unsigned int *)MEMORY[0x1E4F3EC18];
    }
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *v13, v8);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v14(v6, v11, v8);
    uint64_t v34 = sub_1B0705AB0();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35218);
    MEMORY[0x1F4188790](v15 - 8);
    uint64_t v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14(v17, v6, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v17, 0, 1, v8);
    sub_1B0705E80();
    sub_1B05DA364((uint64_t)v17, &qword_1E9B35218);
    uint64_t v18 = sub_1B0705E70();
    v30[1] = v30;
    uint64_t v19 = *(void *)(v18 - 8);
    MEMORY[0x1F4188790](v18);
    uint64_t v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4F3EBF0], v18);
    uint64_t v32 = sub_1B0705EA0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    sub_1B05D7CF0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v31, v8);
    if (qword_1E9B34EA8 != -1) {
      swift_once();
    }
    id v22 = v35;
    objc_msgSend(v35, sel_size);
    objc_msgSend(v22, sel_size);
    sub_1B0705F70();
    sub_1B07058B0();
    v36[0] = v34;
    *(_OWORD *)&v36[1] = xmmword_1B071FFE0;
    v36[3] = v32;
    long long v37 = xmmword_1B071FFE0;
    *(void *)&long long v38 = v49;
    *((void *)&v38 + 1) = v50;
    *(void *)&long long v39 = v51;
    *((void *)&v39 + 1) = v52;
    long long v40 = v53;
    char v41 = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35228);
    sub_1B05D9D98();
    sub_1B0705B00();
    swift_release();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    memset(v36, 0, sizeof(v36));
    char v41 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35228);
    sub_1B05D9D98();
    sub_1B0705B00();
  }
  double result = *(double *)&v42;
  long long v24 = v43;
  long long v25 = v44;
  long long v26 = v45;
  long long v27 = v46;
  long long v28 = v47;
  char v29 = v48;
  *(_OWORD *)a2 = v42;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v25;
  *(_OWORD *)(a2 + 48) = v26;
  *(_OWORD *)(a2 + 64) = v27;
  *(_OWORD *)(a2 + 80) = v28;
  *(unsigned char *)(a2 + 96) = v29;
  return result;
}

double sub_1B05D3164@<D0>(uint64_t a1@<X8>)
{
  return sub_1B05D2C34(*v1, a1);
}

uint64_t sub_1B05D316C@<X0>(void *a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unint64_t v5 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = *(int *)(v4 + 48);
  uint64_t v7 = *(int *)(v4 + 64);
  uint64_t v8 = (uint64_t *)((char *)&v63 + v7 - v5);
  uint64_t v9 = (uint64_t *)(v1 + v6);
  uint64_t v10 = (uint64_t *)(v1 + v7);
  sub_1B05DA300(v1, (uint64_t)&v63 - v5, &qword_1E9B34D48);
  *(_OWORD *)((char *)&v63 + v6 - v5) = *(_OWORD *)(v1 + v6);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t *v8 = *v10;
  v8[1] = v11;
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_1B05DA364((uint64_t)&v63 - v5, &qword_1E9B34D48);
    *(void *)&long long v72 = v12;
    *((void *)&v72 + 1) = v11;
    sub_1B05D7C54();
    uint64_t v13 = sub_1B0705D30();
    uint64_t v15 = v14;
    *(void *)&long long v69 = v13;
    *((void *)&v69 + 1) = v14;
    char v17 = v16 & 1;
    *(void *)&long long v70 = v16 & 1;
    *((void *)&v70 + 1) = v18;
    LOBYTE(v71) = 0;
    sub_1B05CC128(v13, v14, v16 & 1);
    swift_bridgeObjectRetain();
    sub_1B0705B00();
    long long v69 = v72;
    long long v70 = v73;
    __int16 v71 = v74;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B352E0);
    sub_1B05DA250(&qword_1E9B352E8, &qword_1E9B352E0);
    sub_1B0705B00();
    sub_1B05CC13C(v13, v15, v17);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = *((void *)&v72 + 1);
    uint64_t v20 = v72;
    uint64_t v23 = *((void *)&v73 + 1);
    uint64_t v22 = v73;
    if (v75) {
      __int16 v24 = 256;
    }
    else {
      __int16 v24 = 0;
    }
    __int16 v25 = v24 | v74;
  }
  else
  {
    sub_1B05DA364((uint64_t)&v63 - v5, &qword_1E9B34D48);
    uint64_t v26 = sub_1B0705750();
    uint64_t v67 = &v63;
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = MEMORY[0x1F4188790](v26);
    uint64_t v66 = (char *)&v63 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v65 = &v63;
    MEMORY[0x1F4188790](v28);
    uint64_t v30 = (char *)&v63 - v5;
    uint64_t v31 = *(int *)(v2 + 48);
    uint64_t v32 = *(int *)(v2 + 64);
    sub_1B05DA300(v1, (uint64_t)v30, &qword_1E9B34D48);
    *(_OWORD *)&v30[v31] = *(_OWORD *)v9;
    *(_OWORD *)&v30[v32] = *(_OWORD *)v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v30, 1, v26) == 1)
    {
      uint64_t v33 = sub_1B05DA364((uint64_t)v30, &qword_1E9B34D48);
      MEMORY[0x1F4188790](v33);
      uint64_t v34 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      id v35 = &v34[*(int *)(v2 + 48)];
      uint64_t v36 = *(int *)(v2 + 64);
      sub_1B05DA300(v1, (uint64_t)v34, &qword_1E9B34D48);
      uint64_t v37 = *v9;
      uint64_t v20 = v9[1];
      *(void *)id v35 = *v9;
      *((void *)v35 + 1) = v20;
      *(_OWORD *)&v34[v36] = *(_OWORD *)v10;
      if (v20)
      {
        swift_bridgeObjectRetain();
        sub_1B05DA364((uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D48);
        *(void *)&long long v72 = v37;
        *((void *)&v72 + 1) = v20;
        sub_1B05D7C54();
        *(void *)&long long v69 = sub_1B0705D30();
        *((void *)&v69 + 1) = v39;
        *(void *)&long long v70 = v38 & 1;
        *((void *)&v70 + 1) = v40;
        __int16 v71 = 256;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B352E0);
        sub_1B05DA250(&qword_1E9B352E8, &qword_1E9B352E0);
        uint64_t result = sub_1B0705B00();
        uint64_t v21 = *((void *)&v72 + 1);
        uint64_t v20 = v72;
        uint64_t v23 = *((void *)&v73 + 1);
        uint64_t v22 = v73;
        if (v75) {
          __int16 v41 = 256;
        }
        else {
          __int16 v41 = 0;
        }
        __int16 v25 = v41 | v74;
      }
      else
      {
        uint64_t result = sub_1B05DA364((uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B34D48);
        __int16 v25 = -256;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v63 = v26;
      uint64_t v64 = v27;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v66, v30, v26);
      uint64_t v42 = sub_1B07056B0();
      uint64_t v65 = &v63;
      uint64_t v43 = *(void *)(v42 - 8);
      uint64_t v44 = MEMORY[0x1F4188790](v42);
      long long v46 = (char *)&v63 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v47 = MEMORY[0x1F4188790](v44);
      uint64_t v49 = (char *)&v63 - v48;
      MEMORY[0x1B3E94780](v47);
      uint64_t v50 = sub_1B07056A0();
      uint64_t v51 = *(void *)(v50 - 8);
      MEMORY[0x1F4188790](v50);
      long long v53 = (char *)&v63 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1B0705690();
      sub_1B0705680();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
      uint64_t v54 = *(void (**)(char *, uint64_t))(v43 + 8);
      v54(v49, v42);
      sub_1B05DA434(&qword_1E9B352F0, MEMORY[0x1F418B960]);
      sub_1B0705740();
      v54(v46, v42);
      long long v69 = v72;
      sub_1B05D7C54();
      uint64_t v55 = sub_1B0705D30();
      uint64_t v57 = v56;
      *(void *)&long long v69 = v55;
      *((void *)&v69 + 1) = v56;
      LOBYTE(v50) = v58 & 1;
      *(void *)&long long v70 = v58 & 1;
      *((void *)&v70 + 1) = v59;
      LOBYTE(v71) = 1;
      sub_1B05CC128(v55, v56, v58 & 1);
      swift_bridgeObjectRetain();
      sub_1B0705B00();
      long long v69 = v72;
      long long v70 = v73;
      __int16 v71 = v74;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B352E0);
      sub_1B05DA250(&qword_1E9B352E8, &qword_1E9B352E0);
      sub_1B0705B00();
      sub_1B05CC13C(v55, v57, v50);
      swift_bridgeObjectRelease();
      uint64_t v21 = *((void *)&v72 + 1);
      uint64_t v20 = v72;
      uint64_t v23 = *((void *)&v73 + 1);
      uint64_t v22 = v73;
      __int16 v60 = v74;
      LODWORD(v51) = v75;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v66, v63);
      if (v51) {
        __int16 v61 = 256;
      }
      else {
        __int16 v61 = 0;
      }
      __int16 v25 = v61 | v60;
    }
  }
  uint64_t v62 = v68;
  *uint64_t v68 = v20;
  v62[1] = v21;
  v62[2] = v22;
  v62[3] = v23;
  *((_WORD *)v62 + 16) = v25;
  return result;
}

uint64_t sub_1B05D3924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(v1 + 44);
  unint64_t v4 = 0xE700000000000000;
  uint64_t v5 = 0x68736572465452;
  uint64_t v6 = v1;
  switch(*(unsigned char *)(v1 + 44))
  {
    case 1:
      goto LABEL_4;
    case 2:
      unint64_t v4 = 0xEB00000000646569;
      uint64_t v5 = 0x6669747265435452;
      goto LABEL_4;
    case 3:
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35238);
      MEMORY[0x1F4188790](v30);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35240);
      sub_1B05D9E20();
      return sub_1B0705B00();
    default:
      unint64_t v4 = 0xE800000000000000;
      uint64_t v5 = 0x6E6574746F525452;
LABEL_4:
      uint64_t v48 = a1;
      unint64_t v7 = v4;
      uint64_t v44 = v3;
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35240);
      uint64_t v8 = MEMORY[0x1F4188790](v47);
      uint64_t v46 = (uint64_t)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v45 = v37;
      MEMORY[0x1F4188790](v8);
      uint64_t v43 = (char *)v37 - v10;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35258) - 8;
      uint64_t v42 = v37;
      MEMORY[0x1F4188790](v41);
      char v38 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35278);
      uint64_t v40 = v37;
      uint64_t v12 = *(void *)(v39 - 8);
      MEMORY[0x1F4188790](v39);
      uint64_t v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35260);
      v37[2] = v37;
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = MEMORY[0x1F4188790](v15);
      uint64_t v19 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      v37[1] = v37;
      uint64_t v20 = MEMORY[0x1F4188790](v17);
      v37[-2] = v6;
      MEMORY[0x1F4188790](v20);
      v37[-4] = v5;
      v37[-3] = v7;
      v37[-2] = v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35280);
      sub_1B05D9FA4(&qword_1E9B35288, &qword_1E9B35280, (void (*)(void))sub_1B05DA018);
      sub_1B0705EC0();
      swift_bridgeObjectRelease();
      uint64_t v21 = sub_1B0705B60();
      uint64_t v22 = *(void *)(v21 - 8);
      MEMORY[0x1F4188790](v21);
      __int16 v24 = (char *)v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1B0705B50();
      sub_1B05CBB34(&qword_1E9B35268, &qword_1E9B35260);
      sub_1B05DA434(&qword_1E9B35270, MEMORY[0x1F418FC28]);
      sub_1B0705D60();
      __int16 v25 = v24;
      uint64_t v26 = (uint64_t)v38;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
      uint64_t v27 = v39;
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v26, v14, v39);
      *(_WORD *)(v26 + *(int *)(v41 + 44)) = 1;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v27);
      if (v44)
      {
        if (v44 == 1)
        {
          unint64_t v28 = 0x80000001B0722BE0;
          uint64_t v29 = 0xD00000000000002ELL;
          goto LABEL_11;
        }
        uint64_t v29 = 0xD000000000000032;
        uint64_t v32 = "CONTENT_TABS_ACCESSIBILITY_ROTTEN_TOMATO_CERTIFIED";
      }
      else
      {
        uint64_t v29 = 0xD00000000000002FLL;
        uint64_t v32 = "CONTENT_TABS_ACCESSIBILITY_ROTTEN_TOMATO_ROTTEN";
      }
      unint64_t v28 = (unint64_t)(v32 - 32) | 0x8000000000000000;
LABEL_11:
      uint64_t v33 = (uint64_t)v43;
      sub_1B05D20F8(v29, v28);
      swift_bridgeObjectRelease();
      sub_1B05DA364(v26, &qword_1E9B35258);
      uint64_t v34 = v46;
      sub_1B05DA3C0(v33, v46, &qword_1E9B35240);
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35238);
      MEMORY[0x1F4188790](v35);
      sub_1B05DA300(v34, (uint64_t)v37 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B35240);
      swift_storeEnumTagMultiPayload();
      sub_1B05D9E20();
      sub_1B0705B00();
      return sub_1B05DA364(v34, &qword_1E9B35240);
  }
}

uint64_t sub_1B05D4028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  float v3 = *(float *)(a1 + 40);
  if (v3 > 1.0) {
    float v3 = v3 / 100.0;
  }
  float v19 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B352C8);
  uint64_t v18 = (uint64_t)&v18;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_1B0705770();
  MEMORY[0x1F4188790](v9 - 8);
  sub_1B0705760();
  sub_1B05DA1FC();
  sub_1B0705620();
  uint64_t v10 = sub_1B0705660();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705650();
  MEMORY[0x1B3E947E0](v13, v4);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_1B05CBB34(&qword_1E9B352D8, &qword_1E9B352C8);
  uint64_t result = sub_1B0705D10();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v15;
  *(unsigned char *)(a2 + 16) = v16 & 1;
  *(void *)(a2 + 24) = v17;
  return result;
}

uint64_t sub_1B05D42C8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)a1)
  {
    uint64_t v7 = *(void **)(*(void *)a1 + 16);
    swift_bridgeObjectRetain();
    id v8 = v7;
    uint64_t v34 = sub_1B0705EB0();
    uint64_t v9 = sub_1B0705E90();
    uint64_t v32 = v30;
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4F3EC10], v9);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v13(v6, v12, v9);
    uint64_t v33 = sub_1B0705AB0();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35218);
    MEMORY[0x1F4188790](v14 - 8);
    char v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13(v16, v6, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
    sub_1B0705E80();
    sub_1B05DA364((uint64_t)v16, &qword_1E9B35218);
    uint64_t v17 = sub_1B0705E70();
    v30[1] = v30;
    uint64_t v18 = (uint64_t)v6;
    uint64_t v19 = *(void *)(v17 - 8);
    MEMORY[0x1F4188790](v17);
    uint64_t v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4F3EBF0], v17);
    uint64_t v31 = sub_1B0705EA0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    sub_1B05D7CF0(v18, (uint64_t (*)(void))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v22 = (_OWORD *)swift_allocObject();
    long long v23 = *(_OWORD *)(a1 + 16);
    v22[1] = *(_OWORD *)a1;
    v22[2] = v23;
    *(_OWORD *)((char *)v22 + 45) = *(_OWORD *)(a1 + 29);
    sub_1B05DA1C4(a1);
    if (qword_1E9B34EA8 != -1) {
      swift_once();
    }
    long long v39 = *(_OWORD *)(a1 + 16);
    uint64_t v40 = *(void *)(a1 + 32);
    long long v35 = *(_OWORD *)(a1 + 16);
    uint64_t v36 = *(void *)(a1 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35220);
    sub_1B0705EE0();
    long long v35 = v39;
    uint64_t v36 = v40;
    sub_1B0705EE0();
    sub_1B0705F70();
    uint64_t result = sub_1B07058B0();
    uint64_t v25 = v35;
    char v26 = BYTE8(v35);
    uint64_t v27 = v36;
    char v28 = v37;
    *(void *)a2 = v33;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 1;
    *(void *)(a2 + 24) = v31;
    *(void *)(a2 + 32) = 0;
    *(_WORD *)(a2 + 40) = 1;
    *(void *)(a2 + 48) = sub_1B05DA1BC;
    *(void *)(a2 + 56) = v22;
    *(void *)(a2 + 64) = v25;
    *(unsigned char *)(a2 + 72) = v26;
    *(void *)(a2 + 80) = v27;
    *(unsigned char *)(a2 + 88) = v28;
    *(_OWORD *)(a2 + 96) = v38;
  }
  else
  {
    type metadata accessor for AVObservableBundle();
    sub_1B05D7CA8(&qword_1E9B35028, v29, (void (*)(uint64_t))type metadata accessor for AVObservableBundle);
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B0705980();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B05D4800()
{
  return sub_1B0705EF0();
}

uint64_t sub_1B05D4854@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05D3924(a1);
}

uint64_t sub_1B05D4890()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AVObservableBundle()
{
  return self;
}

uint64_t sub_1B05D48EC()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1B05D48F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0705830();
  *a1 = result;
  return result;
}

void *sub_1B05D4948(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = (int *)type metadata accessor for MediaInfo();
    uint64_t v10 = v9[7];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_1B0705750();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
        memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      uint64_t v20 = *(int *)(v13 + 48);
      uint64_t v21 = &v11[v20];
      uint64_t v22 = &v12[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = *(int *)(v13 + 64);
      uint64_t v25 = &v11[v24];
      char v26 = &v12[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      char v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    uint64_t v29 = v9[8];
    uint64_t v30 = (void *)((char *)v4 + v29);
    uint64_t v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    void *v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = v9[9];
    uint64_t v34 = (void *)((char *)v4 + v33);
    long long v35 = (void *)((char *)a2 + v33);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = v9[10];
    long long v38 = (void *)((char *)v4 + v37);
    long long v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    *long long v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = v9[11];
    uint64_t v42 = (char *)v4 + v41;
    uint64_t v43 = (void *)((char *)a2 + v41);
    unint64_t v44 = *(void *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    }
    else
    {
      uint64_t v45 = *v43;
      sub_1B05D4EC8(*v43, v44);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
    }
    *((unsigned char *)v4 + v9[12]) = *((unsigned char *)a2 + v9[12]);
    uint64_t v46 = v9[13];
    uint64_t v47 = (char *)v4 + v46;
    uint64_t v48 = (char *)a2 + v46;
    *(_DWORD *)uint64_t v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    uint64_t v49 = v9[14];
    uint64_t v50 = *(void **)((char *)a2 + v49);
    *(void *)((char *)v4 + v49) = v50;
    *((unsigned char *)v4 + v9[15]) = *((unsigned char *)a2 + v9[15]);
    *((unsigned char *)v4 + v9[16]) = *((unsigned char *)a2 + v9[16]);
    *((unsigned char *)v4 + v9[17]) = *((unsigned char *)a2 + v9[17]);
    uint64_t v51 = v9[18];
    uint64_t v52 = (_OWORD *)((char *)v4 + v51);
    long long v53 = (_OWORD *)((char *)a2 + v51);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *uint64_t v52 = *v53;
    uint64_t v54 = v9[19];
    uint64_t v55 = (_OWORD *)((char *)v4 + v54);
    uint64_t v56 = (_OWORD *)((char *)a2 + v54);
    _OWORD *v55 = *v56;
    *(_OWORD *)((char *)v55 + 9) = *(_OWORD *)((char *)v56 + 9);
    *((unsigned char *)v4 + v9[20]) = *((unsigned char *)a2 + v9[20]);
    *((unsigned char *)v4 + v9[21]) = *((unsigned char *)a2 + v9[21]);
    uint64_t v57 = v9[22];
    char v58 = (char *)v4 + v57;
    uint64_t v59 = (char *)a2 + v57;
    uint64_t v60 = sub_1B0705750();
    uint64_t v61 = *(void *)(v60 - 8);
    uint64_t v62 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
    id v63 = v50;
    if (v62(v59, 1, v60))
    {
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v58, v59, *(void *)(*(void *)(v64 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v58, v59, v60);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
    }
    *((unsigned char *)v4 + v9[23]) = *((unsigned char *)a2 + v9[23]);
    uint64_t v65 = v9[24];
    uint64_t v66 = (void *)((char *)v4 + v65);
    uint64_t v67 = (void *)((char *)a2 + v65);
    uint64_t v68 = v67[1];
    void *v66 = *v67;
    v66[1] = v68;
    uint64_t v69 = v9[25];
    long long v70 = (void *)((char *)v4 + v69);
    __int16 v71 = (void *)((char *)a2 + v69);
    uint64_t v72 = v71[1];
    void *v70 = *v71;
    v70[1] = v72;
    uint64_t v73 = v9[26];
    unsigned __int8 v74 = (void *)((char *)v4 + v73);
    unsigned __int8 v75 = (void *)((char *)a2 + v73);
    uint64_t v76 = v75[1];
    *unsigned __int8 v74 = *v75;
    v74[1] = v76;
    uint64_t v77 = v9[27];
    uint64_t v78 = (void *)((char *)v4 + v77);
    uint64_t v79 = (void *)((char *)a2 + v77);
    uint64_t v80 = v79[1];
    *uint64_t v78 = *v79;
    v78[1] = v80;
    uint64_t v81 = v9[28];
    uint64_t v82 = (void *)((char *)v4 + v81);
    uint64_t v83 = (void *)((char *)a2 + v81);
    uint64_t v84 = v83[1];
    void *v82 = *v83;
    v82[1] = v84;
    uint64_t v85 = v9[29];
    uint64_t v86 = (char *)v4 + v85;
    uint64_t v87 = (char *)a2 + v85;
    *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
    v86[4] = v87[4];
    *(void *)((char *)v4 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1B05D4EC8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B05D4F20(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)type metadata accessor for MediaInfo();
  uint64_t v3 = a1 + v2[7];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    uint64_t v5 = sub_1B0705750();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + v2[11]);
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_1B05D51A0(*v7, v8);
  }

  uint64_t v9 = a1 + v2[22];
  uint64_t v10 = sub_1B0705750();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05D51A0(uint64_t a1, unint64_t a2)
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

void *sub_1B05D51F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  unint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = sub_1B0705750();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    uint64_t v18 = *(int *)(v12 + 48);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = *(int *)(v12 + 64);
    uint64_t v23 = &v10[v22];
    uint64_t v24 = &v11[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    char v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  uint64_t v27 = v8[8];
  char v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *char v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = v8[9];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = v8[10];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = v8[11];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (void *)((char *)a2 + v39);
  unint64_t v42 = *(void *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  else
  {
    uint64_t v43 = *v41;
    sub_1B05D4EC8(*v41, v42);
    *(void *)uint64_t v40 = v43;
    *((void *)v40 + 1) = v42;
  }
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v44 = v8[13];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  uint64_t v47 = v8[14];
  uint64_t v48 = *(void **)((char *)a2 + v47);
  *(void *)((char *)a1 + v47) = v48;
  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v49 = v8[18];
  uint64_t v50 = (_OWORD *)((char *)a1 + v49);
  uint64_t v51 = (_OWORD *)((char *)a2 + v49);
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *uint64_t v50 = *v51;
  uint64_t v52 = v8[19];
  long long v53 = (_OWORD *)((char *)a1 + v52);
  uint64_t v54 = (_OWORD *)((char *)a2 + v52);
  *long long v53 = *v54;
  *(_OWORD *)((char *)v53 + 9) = *(_OWORD *)((char *)v54 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v55 = v8[22];
  uint64_t v56 = (char *)a1 + v55;
  uint64_t v57 = (char *)a2 + v55;
  uint64_t v58 = sub_1B0705750();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
  id v61 = v48;
  if (v60(v57, 1, v58))
  {
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v56, v57, *(void *)(*(void *)(v62 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v56, v57, v58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  }
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v63 = v8[24];
  uint64_t v64 = (void *)((char *)a1 + v63);
  uint64_t v65 = (void *)((char *)a2 + v63);
  uint64_t v66 = v65[1];
  void *v64 = *v65;
  v64[1] = v66;
  uint64_t v67 = v8[25];
  uint64_t v68 = (void *)((char *)a1 + v67);
  uint64_t v69 = (void *)((char *)a2 + v67);
  uint64_t v70 = v69[1];
  *uint64_t v68 = *v69;
  v68[1] = v70;
  uint64_t v71 = v8[26];
  uint64_t v72 = (void *)((char *)a1 + v71);
  uint64_t v73 = (void *)((char *)a2 + v71);
  uint64_t v74 = v73[1];
  *uint64_t v72 = *v73;
  v72[1] = v74;
  uint64_t v75 = v8[27];
  uint64_t v76 = (void *)((char *)a1 + v75);
  uint64_t v77 = (void *)((char *)a2 + v75);
  uint64_t v78 = v77[1];
  *uint64_t v76 = *v77;
  v76[1] = v78;
  uint64_t v79 = v8[28];
  uint64_t v80 = (void *)((char *)a1 + v79);
  uint64_t v81 = (void *)((char *)a2 + v79);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  uint64_t v83 = v8[29];
  uint64_t v84 = (char *)a1 + v83;
  uint64_t v85 = (char *)a2 + v83;
  *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
  v84[4] = v85[4];
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1B05D5728(void *a1, void *a2, uint64_t a3)
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
  uint64_t v5 = (int *)type metadata accessor for MediaInfo();
  uint64_t v6 = v5[7];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1B05DA364((uint64_t)v7, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v18 = sub_1B0705750();
    uint64_t v98 = *(void *)(v18 - 8);
    uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v98 + 48);
    int v20 = v19(v7, 1, v18);
    int v21 = v19(v8, 1, v18);
    if (v20)
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v7, v8, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v7, 0, 1, v18);
LABEL_16:
        uint64_t v30 = *(int *)(v9 + 48);
        uint64_t v31 = &v7[v30];
        uint64_t v32 = &v8[v30];
        *(void *)uint64_t v31 = *(void *)v32;
        *((void *)v31 + 1) = *((void *)v32 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(int *)(v9 + 64);
        uint64_t v34 = &v7[v33];
        uint64_t v35 = &v8[v33];
        *(void *)uint64_t v34 = *(void *)v35;
        *((void *)v34 + 1) = *((void *)v35 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 24))(v7, v8, v18);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v98 + 8))(v7, v18);
    }
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v14 = sub_1B0705750();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  uint64_t v22 = *(int *)(v9 + 48);
  uint64_t v23 = &v7[v22];
  uint64_t v24 = &v8[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = *(int *)(v9 + 64);
  char v26 = &v7[v25];
  uint64_t v27 = &v8[v25];
  *(void *)char v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  char v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v7, 0, 1, v9);
LABEL_17:
  uint64_t v36 = v5[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v5[9];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = v5[10];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = v5[11];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  unint64_t v48 = *(void *)((char *)a2 + v45 + 8);
  if (*(void *)((char *)a1 + v45 + 8) >> 60 == 15)
  {
    if (v48 >> 60 != 15)
    {
      uint64_t v49 = *v47;
      sub_1B05D4EC8(v49, v48);
      *uint64_t v46 = v49;
      v46[1] = v48;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v48 >> 60 == 15)
  {
    sub_1B05D5FA0((uint64_t)v46);
LABEL_22:
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    goto LABEL_24;
  }
  uint64_t v50 = *v47;
  sub_1B05D4EC8(v50, v48);
  uint64_t v51 = *v46;
  unint64_t v52 = v46[1];
  *uint64_t v46 = v50;
  v46[1] = v48;
  sub_1B05D51A0(v51, v52);
LABEL_24:
  *((unsigned char *)a1 + v5[12]) = *((unsigned char *)a2 + v5[12]);
  uint64_t v53 = v5[13];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  int v56 = *(_DWORD *)v55;
  v54[4] = v55[4];
  *(_DWORD *)uint64_t v54 = v56;
  uint64_t v57 = v5[14];
  uint64_t v58 = *(void **)((char *)a1 + v57);
  uint64_t v59 = *(void **)((char *)a2 + v57);
  *(void *)((char *)a1 + v57) = v59;
  id v60 = v59;

  *((unsigned char *)a1 + v5[15]) = *((unsigned char *)a2 + v5[15]);
  *((unsigned char *)a1 + v5[16]) = *((unsigned char *)a2 + v5[16]);
  *((unsigned char *)a1 + v5[17]) = *((unsigned char *)a2 + v5[17]);
  uint64_t v61 = v5[18];
  uint64_t v62 = (_OWORD *)((char *)a1 + v61);
  uint64_t v63 = (long long *)((char *)a2 + v61);
  long long v64 = *v63;
  *(_OWORD *)((char *)v62 + 9) = *(long long *)((char *)v63 + 9);
  *uint64_t v62 = v64;
  uint64_t v65 = v5[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (long long *)((char *)a2 + v65);
  long long v68 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(long long *)((char *)v67 + 9);
  _OWORD *v66 = v68;
  *((unsigned char *)a1 + v5[20]) = *((unsigned char *)a2 + v5[20]);
  *((unsigned char *)a1 + v5[21]) = *((unsigned char *)a2 + v5[21]);
  uint64_t v69 = v5[22];
  uint64_t v70 = (char *)a1 + v69;
  uint64_t v71 = (char *)a2 + v69;
  uint64_t v72 = sub_1B0705750();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
  int v75 = v74(v70, 1, v72);
  int v76 = v74(v71, 1, v72);
  if (!v75)
  {
    if (!v76)
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 24))(v70, v71, v72);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
    goto LABEL_29;
  }
  if (v76)
  {
LABEL_29:
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v70, v71, *(void *)(*(void *)(v77 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v70, v71, v72);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
LABEL_30:
  *((unsigned char *)a1 + v5[23]) = *((unsigned char *)a2 + v5[23]);
  uint64_t v78 = v5[24];
  uint64_t v79 = (void *)((char *)a1 + v78);
  uint64_t v80 = (void *)((char *)a2 + v78);
  *uint64_t v79 = *v80;
  v79[1] = v80[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v81 = v5[25];
  uint64_t v82 = (void *)((char *)a1 + v81);
  uint64_t v83 = (void *)((char *)a2 + v81);
  void *v82 = *v83;
  v82[1] = v83[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = v5[26];
  uint64_t v85 = (void *)((char *)a1 + v84);
  uint64_t v86 = (void *)((char *)a2 + v84);
  *uint64_t v85 = *v86;
  v85[1] = v86[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v87 = v5[27];
  char v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  *char v88 = *v89;
  v88[1] = v89[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v90 = v5[28];
  uint64_t v91 = (void *)((char *)a1 + v90);
  uint64_t v92 = (void *)((char *)a2 + v90);
  *uint64_t v91 = *v92;
  v91[1] = v92[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v93 = v5[29];
  uint64_t v94 = (char *)a1 + v93;
  uint64_t v95 = (char *)a2 + v93;
  int v96 = *(_DWORD *)v95;
  v94[4] = v95[4];
  *(_DWORD *)uint64_t v94 = v96;
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1B05D5FA0(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1B05D5FF4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = (int *)type metadata accessor for MediaInfo();
  uint64_t v8 = v7[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_1B0705750();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v9, v10, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
    }
    *(_OWORD *)&v9[*(int *)(v11 + 48)] = *(_OWORD *)&v10[*(int *)(v11 + 48)];
    *(_OWORD *)&v9[*(int *)(v11 + 64)] = *(_OWORD *)&v10[*(int *)(v11 + 64)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
  *(_OWORD *)((char *)a1 + v7[10]) = *(_OWORD *)((char *)a2 + v7[10]);
  *(_OWORD *)((char *)a1 + v7[11]) = *(_OWORD *)((char *)a2 + v7[11]);
  *((unsigned char *)a1 + v7[12]) = *((unsigned char *)a2 + v7[12]);
  uint64_t v17 = v7[13];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(void *)((char *)a1 + v7[14]) = *(void *)((char *)a2 + v7[14]);
  *((unsigned char *)a1 + v7[15]) = *((unsigned char *)a2 + v7[15]);
  *((unsigned char *)a1 + v7[16]) = *((unsigned char *)a2 + v7[16]);
  *((unsigned char *)a1 + v7[17]) = *((unsigned char *)a2 + v7[17]);
  uint64_t v20 = v7[18];
  int v21 = (_OWORD *)((char *)a1 + v20);
  uint64_t v22 = (_OWORD *)((char *)a2 + v20);
  _OWORD *v21 = *v22;
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v22 + 9);
  uint64_t v23 = v7[19];
  uint64_t v24 = (_OWORD *)((char *)a1 + v23);
  uint64_t v25 = (_OWORD *)((char *)a2 + v23);
  *uint64_t v24 = *v25;
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)((char *)v25 + 9);
  *((unsigned char *)a1 + v7[20]) = *((unsigned char *)a2 + v7[20]);
  *((unsigned char *)a1 + v7[21]) = *((unsigned char *)a2 + v7[21]);
  uint64_t v26 = v7[22];
  uint64_t v27 = (char *)a1 + v26;
  char v28 = (char *)a2 + v26;
  uint64_t v29 = sub_1B0705750();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  *((unsigned char *)a1 + v7[23]) = *((unsigned char *)a2 + v7[23]);
  *(_OWORD *)((char *)a1 + v7[24]) = *(_OWORD *)((char *)a2 + v7[24]);
  *(_OWORD *)((char *)a1 + v7[25]) = *(_OWORD *)((char *)a2 + v7[25]);
  *(_OWORD *)((char *)a1 + v7[26]) = *(_OWORD *)((char *)a2 + v7[26]);
  *(_OWORD *)((char *)a1 + v7[27]) = *(_OWORD *)((char *)a2 + v7[27]);
  *(_OWORD *)((char *)a1 + v7[28]) = *(_OWORD *)((char *)a2 + v7[28]);
  uint64_t v32 = v7[29];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  *(_DWORD *)uint64_t v33 = *(_DWORD *)v34;
  v33[4] = v34[4];
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_1B05D6430(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1B05DA364((uint64_t)v10, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v21 = sub_1B0705750();
    uint64_t v106 = *(void *)(v21 - 8);
    uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v106 + 48);
    int v23 = v22(v10, 1, v21);
    int v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v10, v11, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v10, 0, 1, v21);
LABEL_16:
        uint64_t v26 = *(int *)(v12 + 48);
        uint64_t v27 = &v10[v26];
        char v28 = &v11[v26];
        uint64_t v30 = *(void *)v28;
        uint64_t v29 = *((void *)v28 + 1);
        *(void *)uint64_t v27 = v30;
        *((void *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        uint64_t v31 = *(int *)(v12 + 64);
        uint64_t v32 = &v10[v31];
        uint64_t v33 = &v11[v31];
        uint64_t v35 = *(void *)v33;
        uint64_t v34 = *((void *)v33 + 1);
        *(void *)uint64_t v32 = v35;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v106 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v106 + 8))(v10, v21);
    }
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v17 = sub_1B0705750();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  uint64_t v36 = v8[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = v8[9];
  uint64_t v42 = (void *)((char *)a1 + v41);
  uint64_t v43 = (void *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = v8[10];
  uint64_t v47 = (void *)((char *)a1 + v46);
  unint64_t v48 = (void *)((char *)a2 + v46);
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v8[11];
  uint64_t v52 = (uint64_t)a1 + v51;
  uint64_t v53 = (char *)a2 + v51;
  unint64_t v54 = *(void *)((char *)a1 + v51 + 8);
  if (v54 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
    goto LABEL_22;
  }
  unint64_t v55 = *((void *)v53 + 1);
  if (v55 >> 60 == 15)
  {
    sub_1B05D5FA0(v52);
    goto LABEL_20;
  }
  uint64_t v56 = *(void *)v52;
  *(void *)uint64_t v52 = *(void *)v53;
  *(void *)(v52 + 8) = v55;
  sub_1B05D51A0(v56, v54);
LABEL_22:
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v57 = v8[13];
  uint64_t v58 = (char *)a1 + v57;
  uint64_t v59 = (char *)a2 + v57;
  *(_DWORD *)uint64_t v58 = *(_DWORD *)v59;
  v58[4] = v59[4];
  uint64_t v60 = v8[14];
  uint64_t v61 = *(void **)((char *)a1 + v60);
  *(void *)((char *)a1 + v60) = *(void *)((char *)a2 + v60);

  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v62 = v8[18];
  uint64_t v63 = (_OWORD *)((char *)a1 + v62);
  long long v64 = (_OWORD *)((char *)a2 + v62);
  _OWORD *v63 = *v64;
  *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)((char *)v64 + 9);
  uint64_t v65 = v8[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (_OWORD *)((char *)a2 + v65);
  _OWORD *v66 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(_OWORD *)((char *)v67 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v68 = v8[22];
  uint64_t v69 = (char *)a1 + v68;
  uint64_t v70 = (char *)a2 + v68;
  uint64_t v71 = sub_1B0705750();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
  int v74 = v73(v69, 1, v71);
  int v75 = v73(v70, 1, v71);
  if (!v74)
  {
    if (!v75)
    {
      (*(void (**)(char *, char *, uint64_t))(v72 + 40))(v69, v70, v71);
      goto LABEL_28;
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v69, v71);
    goto LABEL_27;
  }
  if (v75)
  {
LABEL_27:
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v69, v70, *(void *)(*(void *)(v76 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v69, v70, v71);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
LABEL_28:
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v77 = v8[24];
  uint64_t v78 = (void *)((char *)a1 + v77);
  uint64_t v79 = (void *)((char *)a2 + v77);
  uint64_t v81 = *v79;
  uint64_t v80 = v79[1];
  *uint64_t v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  uint64_t v82 = v8[25];
  uint64_t v83 = (void *)((char *)a1 + v82);
  uint64_t v84 = (void *)((char *)a2 + v82);
  uint64_t v86 = *v84;
  uint64_t v85 = v84[1];
  *uint64_t v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease();
  uint64_t v87 = v8[26];
  char v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  uint64_t v91 = *v89;
  uint64_t v90 = v89[1];
  *char v88 = v91;
  v88[1] = v90;
  swift_bridgeObjectRelease();
  uint64_t v92 = v8[27];
  uint64_t v93 = (void *)((char *)a1 + v92);
  uint64_t v94 = (void *)((char *)a2 + v92);
  uint64_t v96 = *v94;
  uint64_t v95 = v94[1];
  void *v93 = v96;
  v93[1] = v95;
  swift_bridgeObjectRelease();
  uint64_t v97 = v8[28];
  uint64_t v98 = (void *)((char *)a1 + v97);
  uint64_t v99 = (void *)((char *)a2 + v97);
  uint64_t v101 = *v99;
  uint64_t v100 = v99[1];
  void *v98 = v101;
  v98[1] = v100;
  swift_bridgeObjectRelease();
  uint64_t v102 = v8[29];
  uint64_t v103 = (char *)a1 + v102;
  uint64_t v104 = (char *)a2 + v102;
  *(_DWORD *)uint64_t v103 = *(_DWORD *)v104;
  v103[4] = v104[4];
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1B05D6B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05D6B8C);
}

uint64_t sub_1B05D6B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaInfo();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1B05D6BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05D6C0C);
}

uint64_t sub_1B05D6C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaInfo();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView(uint64_t a1)
{
  return sub_1B05D8238(a1, (uint64_t *)&unk_1E9B35010);
}

uint64_t sub_1B05D6C9C()
{
  uint64_t result = type metadata accessor for MediaInfo();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B05D6D34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D6D50()
{
  uint64_t v1 = *(void *)(type metadata accessor for AVInfoTabMetadataStripView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MediaInfo();
  uint64_t v7 = v0 + v3 + v6[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    uint64_t v9 = sub_1B0705750();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v9);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (uint64_t *)(v5 + v6[11]);
  unint64_t v12 = v11[1];
  if (v12 >> 60 != 15) {
    sub_1B05D51A0(*v11, v12);
  }

  uint64_t v13 = v5 + v6[22];
  uint64_t v14 = sub_1B0705750();
  uint64_t v15 = *(void *)(v14 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1B05D704C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AVInfoTabMetadataStripView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1B05CCCDC(a1, v6, a2);
}

uint64_t sub_1B05D70CC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B352F8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35300);
  uint64_t v17 = v16 - 8;
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = &v28[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v28[8] = a2;
  uint64_t v29 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35308);
  sub_1B0705EE0();
  if (v30) {
    double v20 = 0.0;
  }
  else {
    double v20 = 1.0;
  }
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35310);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, a1, v21);
  *(double *)&v19[*(int *)(v17 + 44)] = v20;
  uint64_t v22 = swift_allocObject();
  *(double *)(v22 + 16) = a5;
  *(double *)(v22 + 24) = a6;
  *(unsigned char *)(v22 + 32) = a2;
  *(void *)(v22 + 40) = a3;
  swift_retain();
  uint64_t v23 = sub_1B0705F70();
  uint64_t v25 = v24;
  sub_1B05DA300((uint64_t)v19, (uint64_t)v15, &qword_1E9B35300);
  uint64_t v26 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v15[*(int *)(v13 + 44)];
  *uint64_t v26 = sub_1B05DA2F0;
  v26[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v22;
  v26[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v23;
  v26[3] = v25;
  sub_1B05DA364((uint64_t)v19, &qword_1E9B35300);
  return sub_1B05DA3C0((uint64_t)v15, a4, &qword_1E9B352F8);
}

uint64_t sub_1B05D72D8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v39 = a4;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35318);
  uint64_t v11 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1B0705E30();
  uint64_t v14 = sub_1B0705B10();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v40 = 0xD000000000000021;
  unint64_t v41 = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  unint64_t v19 = v18;
  unint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  unint64_t v40 = v19;
  unint64_t v41 = v21;
  uint64_t v42 = v23;
  uint64_t v43 = v25;
  uint64_t v26 = swift_allocObject();
  *(double *)(v26 + 16) = a5;
  *(double *)(v26 + 24) = a6;
  *(unsigned char *)(v26 + 32) = a2;
  *(void *)(v26 + 40) = a3;
  type metadata accessor for CGRect(0);
  sub_1B05DA434(&qword_1E9B35320, type metadata accessor for CGRect);
  swift_retain();
  sub_1B0705E20();
  swift_release();
  swift_release();
  uint64_t v27 = sub_1B07058E0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(void *)(v28 + 64);
  MEMORY[0x1F4188790](v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))((char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v27);
  unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = swift_allocObject();
  *(double *)(v31 + 16) = a5;
  *(double *)(v31 + 24) = a6;
  *(unsigned char *)(v31 + 32) = a2;
  *(void *)(v31 + 40) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v31 + v30, (char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0), v27);
  uint64_t v33 = v38;
  uint64_t v32 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v39, v13, v38);
  uint64_t v34 = (uint64_t (**)())(v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35328) + 36));
  *uint64_t v34 = sub_1B05DA548;
  v34[1] = (uint64_t (*)())v31;
  v34[2] = 0;
  v34[3] = 0;
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t))(v11 + 8);
  swift_retain();
  return v35(v13, v33);
}

uint64_t sub_1B05D76D4(CGRect *a1, CGFloat *a2)
{
  CGFloat v2 = *a2;
  CGFloat v3 = a2[1];
  CGFloat v4 = a2[2];
  CGFloat v5 = a2[3];
  v8.origin.x = *a2;
  v8.origin.y = v3;
  v8.size.width = v4;
  v8.size.height = v5;
  uint64_t result = CGRectEqualToRect(*a1, v8);
  if ((result & 1) == 0)
  {
    v7.origin.x = v2;
    v7.origin.y = v3;
    v7.size.width = v4;
    v7.size.height = v5;
    CGRectGetMaxX(v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35308);
    return sub_1B0705EF0();
  }
  return result;
}

uint64_t sub_1B05D778C(char a1, unint64_t a2, CGFloat a3)
{
  uint64_t v6 = sub_1B0705B10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v21 = 0xD000000000000021;
  unint64_t v22 = 0x80000001B07229D0;
  sub_1B0705B80();
  sub_1B07058D0();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  CGFloat MaxX = CGRectGetMaxX(v23);
  LOBYTE(v21) = a1;
  unint64_t v22 = a2;
  v20[15] = MaxX > a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35308);
  return sub_1B0705EF0();
}

uint64_t sub_1B05D7918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B05D70CC(a1, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), a2, *(double *)v2, *(double *)(v2 + 8));
}

unint64_t sub_1B05D7938()
{
  unint64_t result = qword_1E9B35038;
  if (!qword_1E9B35038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35030);
    sub_1B05D9FA4(&qword_1E9B35040, &qword_1E9B35048, (void (*)(void))sub_1B05D79E4);
    sub_1B05CBB34(&qword_1E9B350A0, &qword_1E9B350A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35038);
  }
  return result;
}

unint64_t sub_1B05D79E4()
{
  unint64_t result = qword_1E9B35050;
  if (!qword_1E9B35050)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35058);
    sub_1B05D7A6C();
    sub_1B05CBB34(&qword_1E9B35090, &qword_1E9B35098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35050);
  }
  return result;
}

unint64_t sub_1B05D7A6C()
{
  unint64_t result = qword_1E9B35060;
  if (!qword_1E9B35060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35068);
    sub_1B05CBB34(&qword_1E9B35070, &qword_1E9B35078);
    sub_1B05CBB34(&qword_1E9B35080, &qword_1E9B35088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35060);
  }
  return result;
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView.BadgeView(uint64_t a1)
{
  return sub_1B05D8238(a1, (uint64_t *)&unk_1E9B351C0);
}

uint64_t sub_1B05D7B2C(uint64_t result)
{
  if (result != 1)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

id sub_1B05D7B80(id result)
{
  if (result)
  {
    id v1 = result;
    swift_retain();
    return v1;
  }
  return result;
}

void *sub_1B05D7BC4(void *result)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1B05D7C04(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1B05D7C54()
{
  unint64_t result = qword_1E9B34E70;
  if (!qword_1E9B34E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B34E70);
  }
  return result;
}

uint64_t sub_1B05D7CA8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B05D7CF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B05D7D50(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B05CC128(result, a2, a3 & 1);
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B05D7DA0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B05CC13C(result, a2, a3 & 1);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B05D7DF0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if ((a5 & 0xFF0000) != 0xFE0000) {
    return sub_1B05D7E04(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1B05D7E04(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if (BYTE2(a5) != 255) {
    return sub_1B05D7E1C(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1B05D7E1C(uint64_t a1, uint64_t a2, char a3)
{
  sub_1B05CC128(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1B05D7E58(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if ((a5 & 0xFF0000) != 0xFE0000) {
    return sub_1B05D7E6C(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1B05D7E6C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if (BYTE2(a5) != 255) {
    return sub_1B05D7E84(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1B05D7E84(uint64_t a1, uint64_t a2, char a3)
{
  sub_1B05CC13C(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05D7EC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35178);
    uint64_t v3 = sub_1B0706170();
    uint64_t v36 = v3 + 56;
    uint64_t result = sub_1B0705700();
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(result - 8);
    uint64_t v8 = *(void (**)(char *))(v7 + 16);
    uint64_t v34 = v7 + 16;
    uint64_t v35 = v8;
    uint64_t v29 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = v3;
    uint64_t v37 = *(void *)(v7 + 72);
    uint64_t v33 = *(void *)(v7 + 64);
    double v10 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v27 = v1;
    uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32);
    while (1)
    {
      MEMORY[0x1F4188790](result);
      unint64_t v32 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      double v12 = (char *)&v26 - v32;
      v35((char *)&v26 - v32);
      sub_1B05DA434(&qword_1E9B35180, MEMORY[0x1F418B970]);
      uint64_t v13 = sub_1B0705FE0();
      uint64_t v14 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v15 = v13 & v14;
      unint64_t v16 = (v13 & (unint64_t)v14) >> 6;
      uint64_t v17 = *(void *)(v36 + 8 * v16);
      uint64_t v18 = 1 << (v13 & v14);
      if ((v18 & v17) != 0)
      {
        unint64_t v30 = &v26;
        uint64_t v31 = v6;
        do
        {
          MEMORY[0x1F4188790](v13);
          unint64_t v19 = (char *)&v26 - v32;
          uint64_t v20 = v9;
          ((void (*)(char *, unint64_t, uint64_t))v35)((char *)&v26 - v32, *(void *)(v9 + 48) + v15 * v37, v5);
          sub_1B05DA434(&qword_1E9B35188, MEMORY[0x1F418B970]);
          char v21 = sub_1B0706000();
          unint64_t v22 = *v10;
          uint64_t v13 = (*v10)(v19, v5);
          if (v21)
          {
            uint64_t result = v22(v12, v5);
            uint64_t v1 = v27;
            uint64_t v9 = v20;
            uint64_t v6 = v31;
            goto LABEL_4;
          }
          unint64_t v15 = (v15 + 1) & v14;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)(v36 + 8 * (v15 >> 6));
          uint64_t v18 = 1 << v15;
          uint64_t v9 = v20;
        }
        while ((v17 & (1 << v15)) != 0);
        uint64_t v1 = v27;
        uint64_t v6 = v31;
      }
      *(void *)(v36 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v9 + 48) + v15 * v37, v12, v5);
      uint64_t v23 = *(void *)(v9 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        break;
      }
      *(void *)(v9 + 16) = v25;
LABEL_4:
      if (++v6 == v1) {
        return v9;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC870];
  }
  return result;
}

unint64_t sub_1B05D81BC()
{
  unint64_t result = qword_1E9B35160;
  if (!qword_1E9B35160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35160);
  }
  return result;
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView(uint64_t a1)
{
  return sub_1B05D8238(a1, (uint64_t *)&unk_1E9B351D0);
}

uint64_t sub_1B05D8238(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B05D8270(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.ContentRatingBadgeView()
{
  return &type metadata for AVInfoTabMetadataStripView.ContentRatingBadgeView;
}

uint64_t sub_1B05D82E8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    uint64_t v7 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_1B0705E90();
    double v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = v7 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(void *)(v14 + 16) = *(void *)(v15 + 16);
  }
  swift_retain();
  return v7;
}

uint64_t sub_1B05D8410(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_release();
}

uint64_t sub_1B05D84A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1B0705E90();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  swift_retain();
  return a1;
}

void *sub_1B05D8588(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B0705E90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1B05D8680(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B0705E90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((void *)v12 + 2) = *((void *)v13 + 2);
  return a1;
}

uint64_t sub_1B05D8728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  swift_release();
  return a1;
}

uint64_t sub_1B05D87F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05D880C);
}

uint64_t sub_1B05D880C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1B0705E90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1B05D88BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05D88D0);
}

uint64_t sub_1B05D88D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1B0705E90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1B05D8978()
{
  uint64_t result = sub_1B0705E90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for AVInfoTabMetadataStripView.TomatoRatingView()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  return a1;
}

__n128 __swift_memcpy45_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 29) = *(_OWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 45)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 44) = 0;
    *(_DWORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 45) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 45) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.TomatoRatingView()
{
  return &type metadata for AVInfoTabMetadataStripView.TomatoRatingView;
}

uint64_t *sub_1B05D8C88(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_1B0705750();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(v6 + 48);
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = *(int *)(v6 + 64);
    unint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B05D8E34(uint64_t a1)
{
  uint64_t v2 = sub_1B0705750();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_1B05D8F20(char *a1, char *a2)
{
  uint64_t v4 = sub_1B0705750();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v8 = *(int *)(v7 + 48);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  uint64_t v13 = *(int *)(v7 + 64);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1B05D9074(char *a1, char *a2)
{
  uint64_t v4 = sub_1B0705750();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v11 = *(int *)(v10 + 48);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(v10 + 64);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1B05D9258(char *a1, char *a2)
{
  uint64_t v4 = sub_1B0705750();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
  *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
  return a1;
}

char *sub_1B05D938C(char *a1, char *a2)
{
  uint64_t v4 = sub_1B0705750();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v11 = *(int *)(v10 + 48);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = v15;
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(int *)(v10 + 64);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B05D9550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05D9564);
}

uint64_t sub_1B05D9564(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1B05D95D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05D95E8);
}

uint64_t sub_1B05D95E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1B05D965C()
{
  sub_1B05D970C();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    uint64_t v2 = &v1;
    swift_initStructMetadata();
  }
}

void sub_1B05D970C()
{
  if (!qword_1E9B34E88)
  {
    sub_1B0705750();
    unint64_t v0 = sub_1B0706150();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9B34E88);
    }
  }
}

uint64_t destroy for AVDroppedIfNoSpace()
{
  return swift_release();
}

uint64_t initializeWithCopy for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVDroppedIfNoSpace(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVDroppedIfNoSpace(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVDroppedIfNoSpace()
{
  return &type metadata for AVDroppedIfNoSpace;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.Badge()
{
  return &type metadata for AVInfoTabMetadataStripView.Badge;
}

unint64_t sub_1B05D9918()
{
  unint64_t result = qword_1E9B351E0;
  if (!qword_1E9B351E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B351E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35030);
    sub_1B05D7938();
    swift_getOpaqueTypeConformance2();
    sub_1B05DA434(&qword_1E9B351F0, MEMORY[0x1F41901D0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B351E0);
  }
  return result;
}

unint64_t sub_1B05D99CC()
{
  unint64_t result = qword_1E9B351F8;
  if (!qword_1E9B351F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B351F8);
  }
  return result;
}

unint64_t sub_1B05D9A24()
{
  unint64_t result = qword_1E9B35200;
  if (!qword_1E9B35200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35200);
  }
  return result;
}

unint64_t sub_1B05D9A7C()
{
  unint64_t result = qword_1E9B35208;
  if (!qword_1E9B35208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35208);
  }
  return result;
}

unint64_t sub_1B05D9AD4()
{
  unint64_t result = qword_1E9B35210;
  if (!qword_1E9B35210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35210);
  }
  return result;
}

uint64_t sub_1B05D9B28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D9B44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D9B60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D9B7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D9B98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05D9BB4()
{
  uint64_t v1 = (int *)(type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_1B0705E90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1B05D9CC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B05D9D28()
{
  type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);

  return sub_1B05D2BBC();
}

unint64_t sub_1B05D9D98()
{
  unint64_t result = qword_1E9B35230;
  if (!qword_1E9B35230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35228);
    sub_1B05CBB34((unint64_t *)&qword_1E9B34FA8, &qword_1E9B34FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35230);
  }
  return result;
}

unint64_t sub_1B05D9E20()
{
  unint64_t result = qword_1E9B35248;
  if (!qword_1E9B35248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35240);
    sub_1B05D9EA8();
    sub_1B05DA434(&qword_1E9B351F0, MEMORY[0x1F41901D0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35248);
  }
  return result;
}

unint64_t sub_1B05D9EA8()
{
  unint64_t result = qword_1E9B35250;
  if (!qword_1E9B35250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35258);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35260);
    sub_1B0705B60();
    sub_1B05CBB34(&qword_1E9B35268, &qword_1E9B35260);
    sub_1B05DA434(&qword_1E9B35270, MEMORY[0x1F418FC28]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35250);
  }
  return result;
}

uint64_t sub_1B05D9F90@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05D4028(*(void *)(v1 + 16), a1);
}

uint64_t sub_1B05D9F98@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05D42C8(*(void *)(v1 + 32), a1);
}

uint64_t sub_1B05D9FA4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B05DA018()
{
  unint64_t result = qword_1E9B35290;
  if (!qword_1E9B35290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35298);
    sub_1B05DA0A0();
    sub_1B05CBB34(&qword_1E9B352B8, &qword_1E9B352C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35290);
  }
  return result;
}

unint64_t sub_1B05DA0A0()
{
  unint64_t result = qword_1E9B352A0;
  if (!qword_1E9B352A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B352A8);
    sub_1B05CBB34((unint64_t *)&qword_1E9B34FA8, &qword_1E9B34FB0);
    sub_1B05DA128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B352A0);
  }
  return result;
}

unint64_t sub_1B05DA128()
{
  unint64_t result = qword_1E9B352B0;
  if (!qword_1E9B352B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B352B0);
  }
  return result;
}

uint64_t sub_1B05DA17C()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 61, 7);
}

uint64_t sub_1B05DA1BC()
{
  return sub_1B05D4800();
}

uint64_t sub_1B05DA1C4(uint64_t a1)
{
  return a1;
}

unint64_t sub_1B05DA1FC()
{
  unint64_t result = qword_1E9B352D0;
  if (!qword_1E9B352D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B352D0);
  }
  return result;
}

uint64_t sub_1B05DA250(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1B05DA2B8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B05DA2F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B05D72D8(a1, *(unsigned char *)(v2 + 32), *(void *)(v2 + 40), a2, *(double *)(v2 + 16), *(double *)(v2 + 24));
}

uint64_t sub_1B05DA300(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B05DA364(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B05DA3C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B05DA424(CGRect *a1, CGFloat *a2)
{
  return sub_1B05D76D4(a1, a2);
}

uint64_t sub_1B05DA434(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B05DA47C()
{
  uint64_t v1 = sub_1B07058E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B05DA548()
{
  sub_1B07058E0();
  CGFloat v1 = *(double *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);

  return sub_1B05D778C(v2, v3, v1);
}

uint64_t sub_1B05DA5B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1B05DA5EC()
{
  return sub_1B05D9FA4(&qword_1E9B35288, &qword_1E9B35280, (void (*)(void))sub_1B05DA018);
}

uint64_t sub_1B05DA628()
{
  return sub_1B05DA664(&qword_1E9B35330, &qword_1E9B35338, (void (*)(void))sub_1B05D9D98);
}

uint64_t sub_1B05DA664(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B05DA6D8()
{
  return sub_1B05DA664(&qword_1E9B35340, &qword_1E9B35348, (void (*)(void))sub_1B05D9E20);
}

unint64_t sub_1B05DA718()
{
  unint64_t result = qword_1E9B35350;
  if (!qword_1E9B35350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35358);
    sub_1B05DA780();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35350);
  }
  return result;
}

unint64_t sub_1B05DA780()
{
  unint64_t result = qword_1E9B35360;
  if (!qword_1E9B35360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35368);
    sub_1B05DA250(&qword_1E9B352E8, &qword_1E9B352E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35360);
  }
  return result;
}

unint64_t sub_1B05DA818()
{
  unint64_t result = qword_1E9B35370;
  if (!qword_1E9B35370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B352F8);
    sub_1B05DA8A0();
    sub_1B05CBB34(&qword_1E9B35388, &qword_1E9B35390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35370);
  }
  return result;
}

unint64_t sub_1B05DA8A0()
{
  unint64_t result = qword_1E9B35378;
  if (!qword_1E9B35378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35300);
    sub_1B05CBB34(&qword_1E9B35380, &qword_1E9B35310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35378);
  }
  return result;
}

void *sub_1B05DA934(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = (int *)type metadata accessor for MediaInfo();
    uint64_t v10 = v9[7];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_1B0705750();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
        memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      uint64_t v20 = *(int *)(v13 + 48);
      char v21 = &v11[v20];
      unint64_t v22 = &v12[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)char v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = *(int *)(v13 + 64);
      uint64_t v25 = &v11[v24];
      uint64_t v26 = &v12[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    uint64_t v29 = v9[8];
    unint64_t v30 = (void *)((char *)v4 + v29);
    uint64_t v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    void *v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = v9[9];
    uint64_t v34 = (void *)((char *)v4 + v33);
    uint64_t v35 = (void *)((char *)a2 + v33);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = v9[10];
    uint64_t v38 = (void *)((char *)v4 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = v9[11];
    uint64_t v42 = (char *)v4 + v41;
    uint64_t v43 = (void *)((char *)a2 + v41);
    unint64_t v44 = *(void *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    }
    else
    {
      uint64_t v45 = *v43;
      sub_1B05D4EC8(*v43, v44);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
    }
    *((unsigned char *)v4 + v9[12]) = *((unsigned char *)a2 + v9[12]);
    uint64_t v46 = v9[13];
    uint64_t v47 = (char *)v4 + v46;
    unint64_t v48 = (char *)a2 + v46;
    *(_DWORD *)uint64_t v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    uint64_t v49 = v9[14];
    uint64_t v50 = *(void **)((char *)a2 + v49);
    *(void *)((char *)v4 + v49) = v50;
    *((unsigned char *)v4 + v9[15]) = *((unsigned char *)a2 + v9[15]);
    *((unsigned char *)v4 + v9[16]) = *((unsigned char *)a2 + v9[16]);
    *((unsigned char *)v4 + v9[17]) = *((unsigned char *)a2 + v9[17]);
    uint64_t v51 = v9[18];
    uint64_t v52 = (_OWORD *)((char *)v4 + v51);
    uint64_t v53 = (_OWORD *)((char *)a2 + v51);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *uint64_t v52 = *v53;
    uint64_t v54 = v9[19];
    unint64_t v55 = (_OWORD *)((char *)v4 + v54);
    uint64_t v56 = (_OWORD *)((char *)a2 + v54);
    _OWORD *v55 = *v56;
    *(_OWORD *)((char *)v55 + 9) = *(_OWORD *)((char *)v56 + 9);
    *((unsigned char *)v4 + v9[20]) = *((unsigned char *)a2 + v9[20]);
    *((unsigned char *)v4 + v9[21]) = *((unsigned char *)a2 + v9[21]);
    uint64_t v57 = v9[22];
    uint64_t v58 = (char *)v4 + v57;
    uint64_t v59 = (char *)a2 + v57;
    uint64_t v60 = sub_1B0705750();
    uint64_t v61 = *(void *)(v60 - 8);
    uint64_t v62 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
    id v63 = v50;
    if (v62(v59, 1, v60))
    {
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v58, v59, *(void *)(*(void *)(v64 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v58, v59, v60);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
    }
    *((unsigned char *)v4 + v9[23]) = *((unsigned char *)a2 + v9[23]);
    uint64_t v65 = v9[24];
    uint64_t v66 = (void *)((char *)v4 + v65);
    uint64_t v67 = (void *)((char *)a2 + v65);
    uint64_t v68 = v67[1];
    void *v66 = *v67;
    v66[1] = v68;
    uint64_t v69 = v9[25];
    uint64_t v70 = (void *)((char *)v4 + v69);
    uint64_t v71 = (void *)((char *)a2 + v69);
    uint64_t v72 = v71[1];
    void *v70 = *v71;
    v70[1] = v72;
    uint64_t v73 = v9[26];
    int v74 = (void *)((char *)v4 + v73);
    int v75 = (void *)((char *)a2 + v73);
    uint64_t v76 = v75[1];
    *int v74 = *v75;
    v74[1] = v76;
    uint64_t v77 = v9[27];
    uint64_t v78 = (void *)((char *)v4 + v77);
    uint64_t v79 = (void *)((char *)a2 + v77);
    uint64_t v80 = v79[1];
    *uint64_t v78 = *v79;
    v78[1] = v80;
    uint64_t v81 = v9[28];
    uint64_t v82 = (void *)((char *)v4 + v81);
    uint64_t v83 = (void *)((char *)a2 + v81);
    uint64_t v84 = v83[1];
    void *v82 = *v83;
    v82[1] = v84;
    uint64_t v85 = v9[29];
    uint64_t v86 = (char *)v4 + v85;
    uint64_t v87 = (char *)a2 + v85;
    *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
    v86[4] = v87[4];
    uint64_t v88 = type metadata accessor for AVInfoTabViewConfiguration(0);
    *(void *)((char *)v4 + *(int *)(v88 + 20)) = *(void *)((char *)a2 + *(int *)(v88 + 20));
    uint64_t v89 = a3[5];
    uint64_t v90 = (void *)((char *)v4 + v89);
    uint64_t v91 = (void *)((char *)a2 + v89);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v92 = sub_1B0705B70();
      uint64_t v93 = *(void *)(v92 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v93 + 48))(v91, 1, v92))
      {
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v90, v91, *(void *)(*(void *)(v94 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v93 + 16))(v90, v91, v92);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v93 + 56))(v90, 0, 1, v92);
      }
    }
    else
    {
      *uint64_t v90 = *v91;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v95 = a3[6];
    uint64_t v96 = (void *)((char *)v4 + v95);
    uint64_t v97 = (void *)((char *)a2 + v95);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v98 = sub_1B0705B70();
      uint64_t v99 = *(void *)(v98 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v99 + 48))(v97, 1, v98))
      {
        uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v96, v97, *(void *)(*(void *)(v100 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v99 + 16))(v96, v97, v98);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v99 + 56))(v96, 0, 1, v98);
      }
    }
    else
    {
      *uint64_t v96 = *v97;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v101 = a3[7];
    uint64_t v102 = a3[8];
    uint64_t v103 = (char *)v4 + v101;
    uint64_t v104 = (char *)a2 + v101;
    *(_OWORD *)uint64_t v103 = *(_OWORD *)v104;
    *((void *)v103 + 2) = *((void *)v104 + 2);
    uint64_t v105 = (char *)v4 + v102;
    uint64_t v106 = (char *)a2 + v102;
    *(_OWORD *)uint64_t v105 = *(_OWORD *)v106;
    *((void *)v105 + 2) = *((void *)v106 + 2);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for AVInfoTabViewConfiguration(uint64_t a1)
{
  return sub_1B05D8238(a1, (uint64_t *)&unk_1E9B34DB0);
}

uint64_t sub_1B05DB190(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for MediaInfo();
  uint64_t v5 = a1 + v4[7];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_1B0705750();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t *)(a1 + v4[11]);
  unint64_t v10 = v9[1];
  if (v10 >> 60 != 15) {
    sub_1B05D51A0(*v9, v10);
  }

  uint64_t v11 = a1 + v4[22];
  uint64_t v12 = sub_1B0705750();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for AVInfoTabViewConfiguration(0);
  swift_bridgeObjectRelease();
  uint64_t v14 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1B0705B70();
    uint64_t v16 = *(void *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v17 = a1 + *(int *)(a2 + 24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_1B0705B70();
    uint64_t v19 = *(void *)(v18 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18)) {
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

void *sub_1B05DB5C0(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  unint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = sub_1B0705750();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    uint64_t v18 = *(int *)(v12 + 48);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = *(int *)(v12 + 64);
    uint64_t v23 = &v10[v22];
    uint64_t v24 = &v11[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  uint64_t v27 = v8[8];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = v8[9];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = v8[10];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = v8[11];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (void *)((char *)a2 + v39);
  unint64_t v42 = *(void *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  else
  {
    uint64_t v43 = *v41;
    sub_1B05D4EC8(*v41, v42);
    *(void *)uint64_t v40 = v43;
    *((void *)v40 + 1) = v42;
  }
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v44 = v8[13];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  uint64_t v47 = v8[14];
  unint64_t v48 = *(void **)((char *)a2 + v47);
  *(void *)((char *)a1 + v47) = v48;
  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v49 = v8[18];
  uint64_t v50 = (_OWORD *)((char *)a1 + v49);
  uint64_t v51 = (_OWORD *)((char *)a2 + v49);
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *uint64_t v50 = *v51;
  uint64_t v52 = v8[19];
  uint64_t v53 = (_OWORD *)((char *)a1 + v52);
  uint64_t v54 = (_OWORD *)((char *)a2 + v52);
  *uint64_t v53 = *v54;
  *(_OWORD *)((char *)v53 + 9) = *(_OWORD *)((char *)v54 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v55 = v8[22];
  uint64_t v56 = (char *)a1 + v55;
  uint64_t v57 = (char *)a2 + v55;
  uint64_t v58 = sub_1B0705750();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
  id v61 = v48;
  if (v60(v57, 1, v58))
  {
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v56, v57, *(void *)(*(void *)(v62 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v56, v57, v58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  }
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v63 = v8[24];
  uint64_t v64 = (void *)((char *)a1 + v63);
  uint64_t v65 = (void *)((char *)a2 + v63);
  uint64_t v66 = v65[1];
  void *v64 = *v65;
  v64[1] = v66;
  uint64_t v67 = v8[25];
  uint64_t v68 = (void *)((char *)a1 + v67);
  uint64_t v69 = (void *)((char *)a2 + v67);
  uint64_t v70 = v69[1];
  *uint64_t v68 = *v69;
  v68[1] = v70;
  uint64_t v71 = v8[26];
  uint64_t v72 = (void *)((char *)a1 + v71);
  uint64_t v73 = (void *)((char *)a2 + v71);
  uint64_t v74 = v73[1];
  *uint64_t v72 = *v73;
  v72[1] = v74;
  uint64_t v75 = v8[27];
  uint64_t v76 = (void *)((char *)a1 + v75);
  uint64_t v77 = (void *)((char *)a2 + v75);
  uint64_t v78 = v77[1];
  *uint64_t v76 = *v77;
  v76[1] = v78;
  uint64_t v79 = v8[28];
  uint64_t v80 = (void *)((char *)a1 + v79);
  uint64_t v81 = (void *)((char *)a2 + v79);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  uint64_t v83 = v8[29];
  uint64_t v84 = (char *)a1 + v83;
  uint64_t v85 = (char *)a2 + v83;
  *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
  v84[4] = v85[4];
  uint64_t v86 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(void *)((char *)a1 + *(int *)(v86 + 20)) = *(void *)((char *)a2 + *(int *)(v86 + 20));
  uint64_t v87 = a3[5];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v90 = sub_1B0705B70();
    uint64_t v91 = *(void *)(v90 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v91 + 48))(v89, 1, v90))
    {
      uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
      memcpy(v88, v89, *(void *)(*(void *)(v92 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v91 + 16))(v88, v89, v90);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v91 + 56))(v88, 0, 1, v90);
    }
  }
  else
  {
    *uint64_t v88 = *v89;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v93 = a3[6];
  uint64_t v94 = (void *)((char *)a1 + v93);
  uint64_t v95 = (void *)((char *)a2 + v93);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v96 = sub_1B0705B70();
    uint64_t v97 = *(void *)(v96 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v97 + 48))(v95, 1, v96))
    {
      uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
      memcpy(v94, v95, *(void *)(*(void *)(v98 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v97 + 16))(v94, v95, v96);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v97 + 56))(v94, 0, 1, v96);
    }
  }
  else
  {
    *uint64_t v94 = *v95;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v99 = a3[7];
  uint64_t v100 = a3[8];
  uint64_t v101 = (char *)a1 + v99;
  uint64_t v102 = (char *)a2 + v99;
  *(_OWORD *)uint64_t v101 = *(_OWORD *)v102;
  *((void *)v101 + 2) = *((void *)v102 + 2);
  uint64_t v103 = (char *)a1 + v100;
  uint64_t v104 = (char *)a2 + v100;
  *(_OWORD *)uint64_t v103 = *(_OWORD *)v104;
  *((void *)v103 + 2) = *((void *)v104 + 2);
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1B05DBDB0(void *a1, void *a2, int *a3)
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
  uint64_t v5 = (int *)type metadata accessor for MediaInfo();
  uint64_t v6 = v5[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1B05DA364((uint64_t)v7, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v18 = sub_1B0705750();
    uint64_t v117 = *(void *)(v18 - 8);
    uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v117 + 48);
    int v20 = v19(v7, 1, v18);
    int v21 = v19(v8, 1, v18);
    if (v20)
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v117 + 16))(v7, v8, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v117 + 56))(v7, 0, 1, v18);
LABEL_16:
        uint64_t v30 = *(int *)(v9 + 48);
        uint64_t v31 = &v7[v30];
        uint64_t v32 = &v8[v30];
        *(void *)uint64_t v31 = *(void *)v32;
        *((void *)v31 + 1) = *((void *)v32 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(int *)(v9 + 64);
        uint64_t v34 = &v7[v33];
        uint64_t v35 = &v8[v33];
        *(void *)uint64_t v34 = *(void *)v35;
        *((void *)v34 + 1) = *((void *)v35 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v117 + 24))(v7, v8, v18);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v117 + 8))(v7, v18);
    }
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v14 = sub_1B0705750();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  uint64_t v22 = *(int *)(v9 + 48);
  uint64_t v23 = &v7[v22];
  uint64_t v24 = &v8[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = *(int *)(v9 + 64);
  uint64_t v26 = &v7[v25];
  uint64_t v27 = &v8[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v7, 0, 1, v9);
LABEL_17:
  uint64_t v36 = v5[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v5[9];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = v5[10];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = v5[11];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  unint64_t v48 = *(void *)((char *)a2 + v45 + 8);
  if (*(void *)((char *)a1 + v45 + 8) >> 60 == 15)
  {
    if (v48 >> 60 != 15)
    {
      uint64_t v49 = *v47;
      sub_1B05D4EC8(v49, v48);
      *uint64_t v46 = v49;
      v46[1] = v48;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v48 >> 60 == 15)
  {
    sub_1B05D5FA0((uint64_t)v46);
LABEL_22:
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    goto LABEL_24;
  }
  uint64_t v50 = *v47;
  sub_1B05D4EC8(v50, v48);
  uint64_t v51 = *v46;
  unint64_t v52 = v46[1];
  *uint64_t v46 = v50;
  v46[1] = v48;
  sub_1B05D51A0(v51, v52);
LABEL_24:
  *((unsigned char *)a1 + v5[12]) = *((unsigned char *)a2 + v5[12]);
  uint64_t v53 = v5[13];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  int v56 = *(_DWORD *)v55;
  v54[4] = v55[4];
  *(_DWORD *)uint64_t v54 = v56;
  uint64_t v57 = v5[14];
  uint64_t v58 = *(void **)((char *)a1 + v57);
  uint64_t v59 = *(void **)((char *)a2 + v57);
  *(void *)((char *)a1 + v57) = v59;
  id v60 = v59;

  *((unsigned char *)a1 + v5[15]) = *((unsigned char *)a2 + v5[15]);
  *((unsigned char *)a1 + v5[16]) = *((unsigned char *)a2 + v5[16]);
  *((unsigned char *)a1 + v5[17]) = *((unsigned char *)a2 + v5[17]);
  uint64_t v61 = v5[18];
  uint64_t v62 = (_OWORD *)((char *)a1 + v61);
  uint64_t v63 = (long long *)((char *)a2 + v61);
  long long v64 = *v63;
  *(_OWORD *)((char *)v62 + 9) = *(long long *)((char *)v63 + 9);
  *uint64_t v62 = v64;
  uint64_t v65 = v5[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (long long *)((char *)a2 + v65);
  long long v68 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(long long *)((char *)v67 + 9);
  _OWORD *v66 = v68;
  *((unsigned char *)a1 + v5[20]) = *((unsigned char *)a2 + v5[20]);
  *((unsigned char *)a1 + v5[21]) = *((unsigned char *)a2 + v5[21]);
  uint64_t v69 = v5[22];
  uint64_t v70 = (char *)a1 + v69;
  uint64_t v71 = (char *)a2 + v69;
  uint64_t v72 = sub_1B0705750();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
  int v75 = v74(v70, 1, v72);
  int v76 = v74(v71, 1, v72);
  if (v75)
  {
    if (!v76)
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v70, v71, v72);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v76)
  {
    (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
LABEL_29:
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v70, v71, *(void *)(*(void *)(v77 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v73 + 24))(v70, v71, v72);
LABEL_30:
  *((unsigned char *)a1 + v5[23]) = *((unsigned char *)a2 + v5[23]);
  uint64_t v78 = v5[24];
  uint64_t v79 = (void *)((char *)a1 + v78);
  uint64_t v80 = (void *)((char *)a2 + v78);
  *uint64_t v79 = *v80;
  v79[1] = v80[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v81 = v5[25];
  uint64_t v82 = (void *)((char *)a1 + v81);
  uint64_t v83 = (void *)((char *)a2 + v81);
  void *v82 = *v83;
  v82[1] = v83[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = v5[26];
  uint64_t v85 = (void *)((char *)a1 + v84);
  uint64_t v86 = (void *)((char *)a2 + v84);
  *uint64_t v85 = *v86;
  v85[1] = v86[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v87 = v5[27];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  *uint64_t v88 = *v89;
  v88[1] = v89[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v90 = v5[28];
  uint64_t v91 = (void *)((char *)a1 + v90);
  uint64_t v92 = (void *)((char *)a2 + v90);
  *uint64_t v91 = *v92;
  v91[1] = v92[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v93 = v5[29];
  uint64_t v94 = (char *)a1 + v93;
  uint64_t v95 = (char *)a2 + v93;
  int v96 = *(_DWORD *)v95;
  v94[4] = v95[4];
  *(_DWORD *)uint64_t v94 = v96;
  uint64_t v97 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(void *)((char *)a1 + *(int *)(v97 + 20)) = *(void *)((char *)a2 + *(int *)(v97 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v98 = a3[5];
    uint64_t v99 = (void *)((char *)a1 + v98);
    uint64_t v100 = (void *)((char *)a2 + v98);
    sub_1B05DA364((uint64_t)a1 + v98, &qword_1E9B34E68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v101 = sub_1B0705B70();
      uint64_t v102 = *(void *)(v101 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v102 + 48))(v100, 1, v101))
      {
        uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v99, v100, *(void *)(*(void *)(v103 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v102 + 16))(v99, v100, v101);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v102 + 56))(v99, 0, 1, v101);
      }
    }
    else
    {
      void *v99 = *v100;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v104 = a3[6];
    uint64_t v105 = (void *)((char *)a1 + v104);
    uint64_t v106 = (void *)((char *)a2 + v104);
    sub_1B05DA364((uint64_t)a1 + v104, &qword_1E9B34E68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v107 = sub_1B0705B70();
      uint64_t v108 = *(void *)(v107 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v108 + 48))(v106, 1, v107))
      {
        uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v105, v106, *(void *)(*(void *)(v109 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v108 + 16))(v105, v106, v107);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v108 + 56))(v105, 0, 1, v107);
      }
    }
    else
    {
      *uint64_t v105 = *v106;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v110 = a3[7];
  uint64_t v111 = (void *)((char *)a1 + v110);
  uint64_t v112 = (void *)((char *)a2 + v110);
  *uint64_t v111 = *v112;
  v111[1] = v112[1];
  v111[2] = v112[2];
  swift_retain();
  swift_release();
  uint64_t v113 = a3[8];
  uint64_t v114 = (void *)((char *)a1 + v113);
  v115 = (void *)((char *)a2 + v113);
  *uint64_t v114 = *v115;
  v114[1] = v115[1];
  v114[2] = v115[2];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1B05DC948(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = (int *)type metadata accessor for MediaInfo();
  uint64_t v8 = v7[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_1B0705750();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v9, v10, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
    }
    *(_OWORD *)&v9[*(int *)(v11 + 48)] = *(_OWORD *)&v10[*(int *)(v11 + 48)];
    *(_OWORD *)&v9[*(int *)(v11 + 64)] = *(_OWORD *)&v10[*(int *)(v11 + 64)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
  *(_OWORD *)((char *)a1 + v7[10]) = *(_OWORD *)((char *)a2 + v7[10]);
  *(_OWORD *)((char *)a1 + v7[11]) = *(_OWORD *)((char *)a2 + v7[11]);
  *((unsigned char *)a1 + v7[12]) = *((unsigned char *)a2 + v7[12]);
  uint64_t v17 = v7[13];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(void *)((char *)a1 + v7[14]) = *(void *)((char *)a2 + v7[14]);
  *((unsigned char *)a1 + v7[15]) = *((unsigned char *)a2 + v7[15]);
  *((unsigned char *)a1 + v7[16]) = *((unsigned char *)a2 + v7[16]);
  *((unsigned char *)a1 + v7[17]) = *((unsigned char *)a2 + v7[17]);
  uint64_t v20 = v7[18];
  int v21 = (_OWORD *)((char *)a1 + v20);
  uint64_t v22 = (_OWORD *)((char *)a2 + v20);
  _OWORD *v21 = *v22;
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v22 + 9);
  uint64_t v23 = v7[19];
  uint64_t v24 = (_OWORD *)((char *)a1 + v23);
  uint64_t v25 = (_OWORD *)((char *)a2 + v23);
  *uint64_t v24 = *v25;
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)((char *)v25 + 9);
  *((unsigned char *)a1 + v7[20]) = *((unsigned char *)a2 + v7[20]);
  *((unsigned char *)a1 + v7[21]) = *((unsigned char *)a2 + v7[21]);
  uint64_t v26 = v7[22];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_1B0705750();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  *((unsigned char *)a1 + v7[23]) = *((unsigned char *)a2 + v7[23]);
  *(_OWORD *)((char *)a1 + v7[24]) = *(_OWORD *)((char *)a2 + v7[24]);
  *(_OWORD *)((char *)a1 + v7[25]) = *(_OWORD *)((char *)a2 + v7[25]);
  *(_OWORD *)((char *)a1 + v7[26]) = *(_OWORD *)((char *)a2 + v7[26]);
  *(_OWORD *)((char *)a1 + v7[27]) = *(_OWORD *)((char *)a2 + v7[27]);
  *(_OWORD *)((char *)a1 + v7[28]) = *(_OWORD *)((char *)a2 + v7[28]);
  uint64_t v32 = v7[29];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  *(_DWORD *)uint64_t v33 = *(_DWORD *)v34;
  v33[4] = v34[4];
  uint64_t v35 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(void *)((char *)a1 + *(int *)(v35 + 20)) = *(void *)((char *)a2 + *(int *)(v35 + 20));
  uint64_t v36 = a3[5];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v40 = sub_1B0705B70();
    uint64_t v41 = *(void *)(v40 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v38, 1, v40))
    {
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
      memcpy(v37, v38, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v37, v38, v40);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v37, 0, 1, v40);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
  }
  uint64_t v43 = a3[6];
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = (char *)a2 + v43;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v46 = sub_1B0705B70();
    uint64_t v47 = *(void *)(v46 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
    {
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
      memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v44, v45, v46);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v44, v45, *(void *)(*(void *)(v39 - 8) + 64));
  }
  uint64_t v49 = a3[7];
  uint64_t v50 = a3[8];
  uint64_t v51 = (char *)a1 + v49;
  unint64_t v52 = (char *)a2 + v49;
  *(_OWORD *)uint64_t v51 = *(_OWORD *)v52;
  *((void *)v51 + 2) = *((void *)v52 + 2);
  uint64_t v53 = (char *)a1 + v50;
  uint64_t v54 = (char *)a2 + v50;
  *(_OWORD *)uint64_t v53 = *(_OWORD *)v54;
  *((void *)v53 + 2) = *((void *)v54 + 2);
  return a1;
}

void *sub_1B05DD03C(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1B05DA364((uint64_t)v10, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v21 = sub_1B0705750();
    uint64_t v127 = *(void *)(v21 - 8);
    uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v127 + 48);
    int v23 = v22(v10, 1, v21);
    int v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v127 + 32))(v10, v11, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v127 + 56))(v10, 0, 1, v21);
LABEL_16:
        uint64_t v26 = *(int *)(v12 + 48);
        uint64_t v27 = &v10[v26];
        uint64_t v28 = &v11[v26];
        uint64_t v30 = *(void *)v28;
        uint64_t v29 = *((void *)v28 + 1);
        *(void *)uint64_t v27 = v30;
        *((void *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        uint64_t v31 = *(int *)(v12 + 64);
        uint64_t v32 = &v10[v31];
        uint64_t v33 = &v11[v31];
        uint64_t v35 = *(void *)v33;
        uint64_t v34 = *((void *)v33 + 1);
        *(void *)uint64_t v32 = v35;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v127 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v127 + 8))(v10, v21);
    }
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v17 = sub_1B0705750();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  uint64_t v36 = v8[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = v8[9];
  uint64_t v42 = (void *)((char *)a1 + v41);
  uint64_t v43 = (void *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = v8[10];
  uint64_t v47 = (void *)((char *)a1 + v46);
  uint64_t v48 = (void *)((char *)a2 + v46);
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v8[11];
  uint64_t v52 = (uint64_t)a1 + v51;
  uint64_t v53 = (char *)a2 + v51;
  unint64_t v54 = *(void *)((char *)a1 + v51 + 8);
  if (v54 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
    goto LABEL_22;
  }
  unint64_t v55 = *((void *)v53 + 1);
  if (v55 >> 60 == 15)
  {
    sub_1B05D5FA0(v52);
    goto LABEL_20;
  }
  uint64_t v56 = *(void *)v52;
  *(void *)uint64_t v52 = *(void *)v53;
  *(void *)(v52 + 8) = v55;
  sub_1B05D51A0(v56, v54);
LABEL_22:
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v57 = v8[13];
  uint64_t v58 = (char *)a1 + v57;
  uint64_t v59 = (char *)a2 + v57;
  *(_DWORD *)uint64_t v58 = *(_DWORD *)v59;
  v58[4] = v59[4];
  uint64_t v60 = v8[14];
  uint64_t v61 = *(void **)((char *)a1 + v60);
  *(void *)((char *)a1 + v60) = *(void *)((char *)a2 + v60);

  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v62 = v8[18];
  uint64_t v63 = (_OWORD *)((char *)a1 + v62);
  long long v64 = (_OWORD *)((char *)a2 + v62);
  _OWORD *v63 = *v64;
  *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)((char *)v64 + 9);
  uint64_t v65 = v8[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (_OWORD *)((char *)a2 + v65);
  _OWORD *v66 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(_OWORD *)((char *)v67 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v68 = v8[22];
  uint64_t v69 = (char *)a1 + v68;
  uint64_t v70 = (char *)a2 + v68;
  uint64_t v71 = sub_1B0705750();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
  int v74 = v73(v69, 1, v71);
  int v75 = v73(v70, 1, v71);
  if (v74)
  {
    if (!v75)
    {
      (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v69, v70, v71);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v75)
  {
    (*(void (**)(char *, uint64_t))(v72 + 8))(v69, v71);
LABEL_27:
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v69, v70, *(void *)(*(void *)(v76 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v72 + 40))(v69, v70, v71);
LABEL_28:
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v77 = v8[24];
  uint64_t v78 = (void *)((char *)a1 + v77);
  uint64_t v79 = (void *)((char *)a2 + v77);
  uint64_t v81 = *v79;
  uint64_t v80 = v79[1];
  *uint64_t v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  uint64_t v82 = v8[25];
  uint64_t v83 = (void *)((char *)a1 + v82);
  uint64_t v84 = (void *)((char *)a2 + v82);
  uint64_t v86 = *v84;
  uint64_t v85 = v84[1];
  *uint64_t v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease();
  uint64_t v87 = v8[26];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  uint64_t v91 = *v89;
  uint64_t v90 = v89[1];
  *uint64_t v88 = v91;
  v88[1] = v90;
  swift_bridgeObjectRelease();
  uint64_t v92 = v8[27];
  uint64_t v93 = (void *)((char *)a1 + v92);
  uint64_t v94 = (void *)((char *)a2 + v92);
  uint64_t v96 = *v94;
  uint64_t v95 = v94[1];
  void *v93 = v96;
  v93[1] = v95;
  swift_bridgeObjectRelease();
  uint64_t v97 = v8[28];
  uint64_t v98 = (void *)((char *)a1 + v97);
  uint64_t v99 = (void *)((char *)a2 + v97);
  uint64_t v101 = *v99;
  uint64_t v100 = v99[1];
  void *v98 = v101;
  v98[1] = v100;
  swift_bridgeObjectRelease();
  uint64_t v102 = v8[29];
  uint64_t v103 = (char *)a1 + v102;
  uint64_t v104 = (char *)a2 + v102;
  *(_DWORD *)uint64_t v103 = *(_DWORD *)v104;
  v103[4] = v104[4];
  uint64_t v105 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(void *)((char *)a1 + *(int *)(v105 + 20)) = *(void *)((char *)a2 + *(int *)(v105 + 20));
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v106 = a3[5];
    uint64_t v107 = (char *)a1 + v106;
    uint64_t v108 = (char *)a2 + v106;
    sub_1B05DA364((uint64_t)a1 + v106, &qword_1E9B34E68);
    uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v110 = sub_1B0705B70();
      uint64_t v111 = *(void *)(v110 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v111 + 48))(v108, 1, v110))
      {
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v107, v108, *(void *)(*(void *)(v112 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v111 + 32))(v107, v108, v110);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v111 + 56))(v107, 0, 1, v110);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v107, v108, *(void *)(*(void *)(v109 - 8) + 64));
    }
    uint64_t v113 = a3[6];
    uint64_t v114 = (char *)a1 + v113;
    v115 = (char *)a2 + v113;
    sub_1B05DA364((uint64_t)a1 + v113, &qword_1E9B34E68);
    uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v117 = sub_1B0705B70();
      uint64_t v118 = *(void *)(v117 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v118 + 48))(v115, 1, v117))
      {
        uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
        memcpy(v114, v115, *(void *)(*(void *)(v119 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v114, v115, v117);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v118 + 56))(v114, 0, 1, v117);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v114, v115, *(void *)(*(void *)(v116 - 8) + 64));
    }
  }
  uint64_t v120 = a3[7];
  v121 = (char *)a1 + v120;
  v122 = (char *)a2 + v120;
  *(_OWORD *)v121 = *(_OWORD *)v122;
  *((void *)v121 + 2) = *((void *)v122 + 2);
  swift_release();
  uint64_t v123 = a3[8];
  uint64_t v124 = (char *)a1 + v123;
  uint64_t v125 = (char *)a2 + v123;
  *(_OWORD *)uint64_t v124 = *(_OWORD *)v125;
  *((void *)v124 + 2) = *((void *)v125 + 2);
  swift_release();
  return a1;
}

uint64_t sub_1B05DDA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05DDAA0);
}

uint64_t sub_1B05DDAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AVInfoTabViewConfiguration(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353B8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28) + 16);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_1B05DDBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05DDBDC);
}

uint64_t sub_1B05DDBDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for AVInfoTabViewConfiguration(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353B8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 16) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for AVInfoTabView(uint64_t a1)
{
  return sub_1B05D8238(a1, (uint64_t *)&unk_1E9B34D80);
}

void sub_1B05DDD14()
{
  type metadata accessor for AVInfoTabViewConfiguration(319);
  if (v0 <= 0x3F)
  {
    sub_1B05DDDE8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1B05DDDE8()
{
  if (!qword_1E9B34DC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B34DC8);
    unint64_t v0 = sub_1B0705870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9B34DC0);
    }
  }
}

void *sub_1B05DDE44(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = (int *)type metadata accessor for MediaInfo();
    uint64_t v10 = v9[7];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_1B0705750();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
        memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      uint64_t v20 = *(int *)(v13 + 48);
      uint64_t v21 = &v11[v20];
      uint64_t v22 = &v12[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = *(int *)(v13 + 64);
      uint64_t v25 = &v11[v24];
      uint64_t v26 = &v12[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    uint64_t v29 = v9[8];
    uint64_t v30 = (void *)((char *)v4 + v29);
    uint64_t v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    void *v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = v9[9];
    uint64_t v34 = (void *)((char *)v4 + v33);
    uint64_t v35 = (void *)((char *)a2 + v33);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = v9[10];
    uint64_t v38 = (void *)((char *)v4 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = v9[11];
    uint64_t v42 = (char *)v4 + v41;
    uint64_t v43 = (void *)((char *)a2 + v41);
    unint64_t v44 = *(void *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    }
    else
    {
      uint64_t v45 = *v43;
      sub_1B05D4EC8(*v43, v44);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
    }
    *((unsigned char *)v4 + v9[12]) = *((unsigned char *)a2 + v9[12]);
    uint64_t v46 = v9[13];
    uint64_t v47 = (char *)v4 + v46;
    uint64_t v48 = (char *)a2 + v46;
    *(_DWORD *)uint64_t v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    uint64_t v49 = v9[14];
    uint64_t v50 = *(void **)((char *)a2 + v49);
    *(void *)((char *)v4 + v49) = v50;
    *((unsigned char *)v4 + v9[15]) = *((unsigned char *)a2 + v9[15]);
    *((unsigned char *)v4 + v9[16]) = *((unsigned char *)a2 + v9[16]);
    *((unsigned char *)v4 + v9[17]) = *((unsigned char *)a2 + v9[17]);
    uint64_t v51 = v9[18];
    uint64_t v52 = (_OWORD *)((char *)v4 + v51);
    uint64_t v53 = (_OWORD *)((char *)a2 + v51);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *uint64_t v52 = *v53;
    uint64_t v54 = v9[19];
    unint64_t v55 = (_OWORD *)((char *)v4 + v54);
    uint64_t v56 = (_OWORD *)((char *)a2 + v54);
    _OWORD *v55 = *v56;
    *(_OWORD *)((char *)v55 + 9) = *(_OWORD *)((char *)v56 + 9);
    *((unsigned char *)v4 + v9[20]) = *((unsigned char *)a2 + v9[20]);
    *((unsigned char *)v4 + v9[21]) = *((unsigned char *)a2 + v9[21]);
    uint64_t v57 = v9[22];
    uint64_t v58 = (char *)v4 + v57;
    uint64_t v59 = (char *)a2 + v57;
    uint64_t v60 = sub_1B0705750();
    uint64_t v61 = *(void *)(v60 - 8);
    uint64_t v62 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
    id v63 = v50;
    if (v62(v59, 1, v60))
    {
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v58, v59, *(void *)(*(void *)(v64 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v58, v59, v60);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
    }
    *((unsigned char *)v4 + v9[23]) = *((unsigned char *)a2 + v9[23]);
    uint64_t v65 = v9[24];
    uint64_t v66 = (void *)((char *)v4 + v65);
    uint64_t v67 = (void *)((char *)a2 + v65);
    uint64_t v68 = v67[1];
    void *v66 = *v67;
    v66[1] = v68;
    uint64_t v69 = v9[25];
    uint64_t v70 = (void *)((char *)v4 + v69);
    uint64_t v71 = (void *)((char *)a2 + v69);
    uint64_t v72 = v71[1];
    void *v70 = *v71;
    v70[1] = v72;
    uint64_t v73 = v9[26];
    int v74 = (void *)((char *)v4 + v73);
    int v75 = (void *)((char *)a2 + v73);
    uint64_t v76 = v75[1];
    *int v74 = *v75;
    v74[1] = v76;
    uint64_t v77 = v9[27];
    uint64_t v78 = (void *)((char *)v4 + v77);
    uint64_t v79 = (void *)((char *)a2 + v77);
    uint64_t v80 = v79[1];
    *uint64_t v78 = *v79;
    v78[1] = v80;
    uint64_t v81 = v9[28];
    uint64_t v82 = (void *)((char *)v4 + v81);
    uint64_t v83 = (void *)((char *)a2 + v81);
    uint64_t v84 = v83[1];
    void *v82 = *v83;
    v82[1] = v84;
    uint64_t v85 = v9[29];
    uint64_t v86 = (char *)v4 + v85;
    uint64_t v87 = (char *)a2 + v85;
    *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
    v86[4] = v87[4];
    *(void *)((char *)v4 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1B05DE3CC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v2 = (int *)type metadata accessor for MediaInfo();
  uint64_t v3 = a1 + v2[7];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    uint64_t v5 = sub_1B0705750();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + v2[11]);
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_1B05D51A0(*v7, v8);
  }

  uint64_t v9 = a1 + v2[22];
  uint64_t v10 = sub_1B0705750();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1B05DE664(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  unint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = sub_1B0705750();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    uint64_t v18 = *(int *)(v12 + 48);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = *(int *)(v12 + 64);
    uint64_t v23 = &v10[v22];
    uint64_t v24 = &v11[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  uint64_t v27 = v8[8];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = v8[9];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = v8[10];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = v8[11];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (void *)((char *)a2 + v39);
  unint64_t v42 = *(void *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  else
  {
    uint64_t v43 = *v41;
    sub_1B05D4EC8(*v41, v42);
    *(void *)uint64_t v40 = v43;
    *((void *)v40 + 1) = v42;
  }
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v44 = v8[13];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  uint64_t v47 = v8[14];
  uint64_t v48 = *(void **)((char *)a2 + v47);
  *(void *)((char *)a1 + v47) = v48;
  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v49 = v8[18];
  uint64_t v50 = (_OWORD *)((char *)a1 + v49);
  uint64_t v51 = (_OWORD *)((char *)a2 + v49);
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *uint64_t v50 = *v51;
  uint64_t v52 = v8[19];
  uint64_t v53 = (_OWORD *)((char *)a1 + v52);
  uint64_t v54 = (_OWORD *)((char *)a2 + v52);
  *uint64_t v53 = *v54;
  *(_OWORD *)((char *)v53 + 9) = *(_OWORD *)((char *)v54 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v55 = v8[22];
  uint64_t v56 = (char *)a1 + v55;
  uint64_t v57 = (char *)a2 + v55;
  uint64_t v58 = sub_1B0705750();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
  id v61 = v48;
  if (v60(v57, 1, v58))
  {
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v56, v57, *(void *)(*(void *)(v62 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v56, v57, v58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  }
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v63 = v8[24];
  uint64_t v64 = (void *)((char *)a1 + v63);
  uint64_t v65 = (void *)((char *)a2 + v63);
  uint64_t v66 = v65[1];
  void *v64 = *v65;
  v64[1] = v66;
  uint64_t v67 = v8[25];
  uint64_t v68 = (void *)((char *)a1 + v67);
  uint64_t v69 = (void *)((char *)a2 + v67);
  uint64_t v70 = v69[1];
  *uint64_t v68 = *v69;
  v68[1] = v70;
  uint64_t v71 = v8[26];
  uint64_t v72 = (void *)((char *)a1 + v71);
  uint64_t v73 = (void *)((char *)a2 + v71);
  uint64_t v74 = v73[1];
  *uint64_t v72 = *v73;
  v72[1] = v74;
  uint64_t v75 = v8[27];
  uint64_t v76 = (void *)((char *)a1 + v75);
  uint64_t v77 = (void *)((char *)a2 + v75);
  uint64_t v78 = v77[1];
  *uint64_t v76 = *v77;
  v76[1] = v78;
  uint64_t v79 = v8[28];
  uint64_t v80 = (void *)((char *)a1 + v79);
  uint64_t v81 = (void *)((char *)a2 + v79);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  uint64_t v83 = v8[29];
  uint64_t v84 = (char *)a1 + v83;
  uint64_t v85 = (char *)a2 + v83;
  *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
  v84[4] = v85[4];
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1B05DEB9C(void *a1, void *a2, uint64_t a3)
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
  uint64_t v5 = (int *)type metadata accessor for MediaInfo();
  uint64_t v6 = v5[7];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1B05DA364((uint64_t)v7, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v18 = sub_1B0705750();
    uint64_t v98 = *(void *)(v18 - 8);
    uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v98 + 48);
    int v20 = v19(v7, 1, v18);
    int v21 = v19(v8, 1, v18);
    if (v20)
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v7, v8, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v7, 0, 1, v18);
LABEL_16:
        uint64_t v30 = *(int *)(v9 + 48);
        uint64_t v31 = &v7[v30];
        uint64_t v32 = &v8[v30];
        *(void *)uint64_t v31 = *(void *)v32;
        *((void *)v31 + 1) = *((void *)v32 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(int *)(v9 + 64);
        uint64_t v34 = &v7[v33];
        uint64_t v35 = &v8[v33];
        *(void *)uint64_t v34 = *(void *)v35;
        *((void *)v34 + 1) = *((void *)v35 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 24))(v7, v8, v18);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v98 + 8))(v7, v18);
    }
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v14 = sub_1B0705750();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  uint64_t v22 = *(int *)(v9 + 48);
  uint64_t v23 = &v7[v22];
  uint64_t v24 = &v8[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = *(int *)(v9 + 64);
  uint64_t v26 = &v7[v25];
  uint64_t v27 = &v8[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v7, 0, 1, v9);
LABEL_17:
  uint64_t v36 = v5[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v5[9];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = v5[10];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = v5[11];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  unint64_t v48 = *(void *)((char *)a2 + v45 + 8);
  if (*(void *)((char *)a1 + v45 + 8) >> 60 == 15)
  {
    if (v48 >> 60 != 15)
    {
      uint64_t v49 = *v47;
      sub_1B05D4EC8(v49, v48);
      *uint64_t v46 = v49;
      v46[1] = v48;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v48 >> 60 == 15)
  {
    sub_1B05D5FA0((uint64_t)v46);
LABEL_22:
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    goto LABEL_24;
  }
  uint64_t v50 = *v47;
  sub_1B05D4EC8(v50, v48);
  uint64_t v51 = *v46;
  unint64_t v52 = v46[1];
  *uint64_t v46 = v50;
  v46[1] = v48;
  sub_1B05D51A0(v51, v52);
LABEL_24:
  *((unsigned char *)a1 + v5[12]) = *((unsigned char *)a2 + v5[12]);
  uint64_t v53 = v5[13];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  int v56 = *(_DWORD *)v55;
  v54[4] = v55[4];
  *(_DWORD *)uint64_t v54 = v56;
  uint64_t v57 = v5[14];
  uint64_t v58 = *(void **)((char *)a1 + v57);
  uint64_t v59 = *(void **)((char *)a2 + v57);
  *(void *)((char *)a1 + v57) = v59;
  id v60 = v59;

  *((unsigned char *)a1 + v5[15]) = *((unsigned char *)a2 + v5[15]);
  *((unsigned char *)a1 + v5[16]) = *((unsigned char *)a2 + v5[16]);
  *((unsigned char *)a1 + v5[17]) = *((unsigned char *)a2 + v5[17]);
  uint64_t v61 = v5[18];
  uint64_t v62 = (_OWORD *)((char *)a1 + v61);
  uint64_t v63 = (long long *)((char *)a2 + v61);
  long long v64 = *v63;
  *(_OWORD *)((char *)v62 + 9) = *(long long *)((char *)v63 + 9);
  *uint64_t v62 = v64;
  uint64_t v65 = v5[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (long long *)((char *)a2 + v65);
  long long v68 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(long long *)((char *)v67 + 9);
  _OWORD *v66 = v68;
  *((unsigned char *)a1 + v5[20]) = *((unsigned char *)a2 + v5[20]);
  *((unsigned char *)a1 + v5[21]) = *((unsigned char *)a2 + v5[21]);
  uint64_t v69 = v5[22];
  uint64_t v70 = (char *)a1 + v69;
  uint64_t v71 = (char *)a2 + v69;
  uint64_t v72 = sub_1B0705750();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
  int v75 = v74(v70, 1, v72);
  int v76 = v74(v71, 1, v72);
  if (!v75)
  {
    if (!v76)
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 24))(v70, v71, v72);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
    goto LABEL_29;
  }
  if (v76)
  {
LABEL_29:
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v70, v71, *(void *)(*(void *)(v77 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v70, v71, v72);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
LABEL_30:
  *((unsigned char *)a1 + v5[23]) = *((unsigned char *)a2 + v5[23]);
  uint64_t v78 = v5[24];
  uint64_t v79 = (void *)((char *)a1 + v78);
  uint64_t v80 = (void *)((char *)a2 + v78);
  *uint64_t v79 = *v80;
  v79[1] = v80[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v81 = v5[25];
  uint64_t v82 = (void *)((char *)a1 + v81);
  uint64_t v83 = (void *)((char *)a2 + v81);
  void *v82 = *v83;
  v82[1] = v83[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = v5[26];
  uint64_t v85 = (void *)((char *)a1 + v84);
  uint64_t v86 = (void *)((char *)a2 + v84);
  *uint64_t v85 = *v86;
  v85[1] = v86[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v87 = v5[27];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  *uint64_t v88 = *v89;
  v88[1] = v89[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v90 = v5[28];
  uint64_t v91 = (void *)((char *)a1 + v90);
  uint64_t v92 = (void *)((char *)a2 + v90);
  *uint64_t v91 = *v92;
  v91[1] = v92[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v93 = v5[29];
  uint64_t v94 = (char *)a1 + v93;
  uint64_t v95 = (char *)a2 + v93;
  int v96 = *(_DWORD *)v95;
  v94[4] = v95[4];
  *(_DWORD *)uint64_t v94 = v96;
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1B05DF424(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  swift_bridgeObjectRelease();
  unint64_t v8 = (int *)type metadata accessor for MediaInfo();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1B05DA364((uint64_t)v10, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v21 = sub_1B0705750();
    uint64_t v106 = *(void *)(v21 - 8);
    uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v106 + 48);
    int v23 = v22(v10, 1, v21);
    int v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v10, v11, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v10, 0, 1, v21);
LABEL_16:
        uint64_t v26 = *(int *)(v12 + 48);
        uint64_t v27 = &v10[v26];
        uint64_t v28 = &v11[v26];
        uint64_t v30 = *(void *)v28;
        uint64_t v29 = *((void *)v28 + 1);
        *(void *)uint64_t v27 = v30;
        *((void *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        uint64_t v31 = *(int *)(v12 + 64);
        uint64_t v32 = &v10[v31];
        uint64_t v33 = &v11[v31];
        uint64_t v35 = *(void *)v33;
        uint64_t v34 = *((void *)v33 + 1);
        *(void *)uint64_t v32 = v35;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v106 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v106 + 8))(v10, v21);
    }
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v17 = sub_1B0705750();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  uint64_t v36 = v8[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = v8[9];
  uint64_t v42 = (void *)((char *)a1 + v41);
  uint64_t v43 = (void *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = v8[10];
  uint64_t v47 = (void *)((char *)a1 + v46);
  unint64_t v48 = (void *)((char *)a2 + v46);
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v8[11];
  uint64_t v52 = (uint64_t)a1 + v51;
  uint64_t v53 = (char *)a2 + v51;
  unint64_t v54 = *(void *)((char *)a1 + v51 + 8);
  if (v54 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
    goto LABEL_22;
  }
  unint64_t v55 = *((void *)v53 + 1);
  if (v55 >> 60 == 15)
  {
    sub_1B05D5FA0(v52);
    goto LABEL_20;
  }
  uint64_t v56 = *(void *)v52;
  *(void *)uint64_t v52 = *(void *)v53;
  *(void *)(v52 + 8) = v55;
  sub_1B05D51A0(v56, v54);
LABEL_22:
  *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
  uint64_t v57 = v8[13];
  uint64_t v58 = (char *)a1 + v57;
  uint64_t v59 = (char *)a2 + v57;
  *(_DWORD *)uint64_t v58 = *(_DWORD *)v59;
  v58[4] = v59[4];
  uint64_t v60 = v8[14];
  uint64_t v61 = *(void **)((char *)a1 + v60);
  *(void *)((char *)a1 + v60) = *(void *)((char *)a2 + v60);

  *((unsigned char *)a1 + v8[15]) = *((unsigned char *)a2 + v8[15]);
  *((unsigned char *)a1 + v8[16]) = *((unsigned char *)a2 + v8[16]);
  *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
  uint64_t v62 = v8[18];
  uint64_t v63 = (_OWORD *)((char *)a1 + v62);
  long long v64 = (_OWORD *)((char *)a2 + v62);
  _OWORD *v63 = *v64;
  *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)((char *)v64 + 9);
  uint64_t v65 = v8[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (_OWORD *)((char *)a2 + v65);
  _OWORD *v66 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(_OWORD *)((char *)v67 + 9);
  *((unsigned char *)a1 + v8[20]) = *((unsigned char *)a2 + v8[20]);
  *((unsigned char *)a1 + v8[21]) = *((unsigned char *)a2 + v8[21]);
  uint64_t v68 = v8[22];
  uint64_t v69 = (char *)a1 + v68;
  uint64_t v70 = (char *)a2 + v68;
  uint64_t v71 = sub_1B0705750();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
  int v74 = v73(v69, 1, v71);
  int v75 = v73(v70, 1, v71);
  if (!v74)
  {
    if (!v75)
    {
      (*(void (**)(char *, char *, uint64_t))(v72 + 40))(v69, v70, v71);
      goto LABEL_28;
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v69, v71);
    goto LABEL_27;
  }
  if (v75)
  {
LABEL_27:
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v69, v70, *(void *)(*(void *)(v76 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v69, v70, v71);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
LABEL_28:
  *((unsigned char *)a1 + v8[23]) = *((unsigned char *)a2 + v8[23]);
  uint64_t v77 = v8[24];
  uint64_t v78 = (void *)((char *)a1 + v77);
  uint64_t v79 = (void *)((char *)a2 + v77);
  uint64_t v81 = *v79;
  uint64_t v80 = v79[1];
  *uint64_t v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  uint64_t v82 = v8[25];
  uint64_t v83 = (void *)((char *)a1 + v82);
  uint64_t v84 = (void *)((char *)a2 + v82);
  uint64_t v86 = *v84;
  uint64_t v85 = v84[1];
  *uint64_t v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease();
  uint64_t v87 = v8[26];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  uint64_t v91 = *v89;
  uint64_t v90 = v89[1];
  *uint64_t v88 = v91;
  v88[1] = v90;
  swift_bridgeObjectRelease();
  uint64_t v92 = v8[27];
  uint64_t v93 = (void *)((char *)a1 + v92);
  uint64_t v94 = (void *)((char *)a2 + v92);
  uint64_t v96 = *v94;
  uint64_t v95 = v94[1];
  void *v93 = v96;
  v93[1] = v95;
  swift_bridgeObjectRelease();
  uint64_t v97 = v8[28];
  uint64_t v98 = (void *)((char *)a1 + v97);
  uint64_t v99 = (void *)((char *)a2 + v97);
  uint64_t v101 = *v99;
  uint64_t v100 = v99[1];
  void *v98 = v101;
  v98[1] = v100;
  swift_bridgeObjectRelease();
  uint64_t v102 = v8[29];
  uint64_t v103 = (char *)a1 + v102;
  uint64_t v104 = (char *)a2 + v102;
  v103[4] = v104[4];
  *(_DWORD *)uint64_t v103 = *(_DWORD *)v104;
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B05DFB74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05DFB88);
}

uint64_t sub_1B05DFB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MediaInfo();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1B05DFC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05DFC5C);
}

uint64_t sub_1B05DFC5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MediaInfo();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1B05DFD18()
{
  uint64_t result = type metadata accessor for MediaInfo();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B05DFDB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05DFDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AVInfoTabView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v7 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v42 - v8;
  sub_1B07058C0();
  double v11 = v10;
  double v13 = v12;
  char v14 = sub_1B05E2CB4();
  sub_1B05E4F58(a2, (uint64_t)v9, type metadata accessor for AVInfoTabView);
  if (v14)
  {
    sub_1B05E4FC0((uint64_t)v9, type metadata accessor for AVInfoTabView);
LABEL_5:
    sub_1B05E4F58(a2, (uint64_t)v7, type metadata accessor for AVInfoTabView);
    unint64_t v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v17 = swift_allocObject();
    sub_1B05E47E4((uint64_t)v7, v17 + v16);
    uint64_t v18 = sub_1B0705940();
    char v19 = sub_1B0705C60();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353F0);
    MEMORY[0x1F4188790](v20);
    uint64_t v22 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)uint64_t v22 = sub_1B05E4F40;
    *((void *)v22 + 1) = v17;
    *((void *)v22 + 2) = v18;
    v22[24] = v19;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353C0);
    sub_1B05E4EB4();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B353C8);
    unint64_t v24 = sub_1B05E4DD8();
    unint64_t v25 = sub_1B05E4E60();
    uint64_t v44 = (uint64_t (*)(uint64_t))v23;
    uint64_t v45 = &type metadata for AVChromelessButtonStyle;
    unint64_t v46 = v24;
    unint64_t v47 = v25;
    swift_getOpaqueTypeConformance2();
    return sub_1B0705B00();
  }
  char v15 = sub_1B05E3E5C();
  sub_1B05E4FC0((uint64_t)v9, type metadata accessor for AVInfoTabView);
  if ((v15 & 1) != 0 && v13 < v11) {
    goto LABEL_5;
  }
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353C0);
  v42[2] = v42;
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v30 = (char *)v42 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05E4F58(a2, (uint64_t)v7, type metadata accessor for AVInfoTabView);
  unint64_t v31 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v32 = swift_allocObject();
  sub_1B05E47E4((uint64_t)v7, v32 + v31);
  LOBYTE(v31) = sub_1B0705C60();
  sub_1B0705840();
  uint64_t v44 = sub_1B05E4D2C;
  uint64_t v45 = (ValueMetadata *)v32;
  LOBYTE(v46) = v31;
  unint64_t v47 = v33;
  uint64_t v48 = v34;
  uint64_t v49 = v35;
  uint64_t v50 = v36;
  char v51 = 0;
  char v43 = 1;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353C8);
  unint64_t v38 = sub_1B05E4DD8();
  unint64_t v39 = sub_1B05E4E60();
  sub_1B0705D70();
  swift_release();
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353F0);
  v42[1] = v42;
  MEMORY[0x1F4188790](v40);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)v42 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v27);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B353F8);
  sub_1B05E4EB4();
  uint64_t v44 = (uint64_t (*)(uint64_t))v37;
  uint64_t v45 = &type metadata for AVChromelessButtonStyle;
  unint64_t v46 = v38;
  unint64_t v47 = v39;
  swift_getOpaqueTypeConformance2();
  sub_1B0705B00();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v27);
}

void sub_1B05E0310()
{
  qword_1E9B35398 = 0x4069000000000000;
}

void sub_1B05E0320()
{
  qword_1E9B353A0 = 0x4024000000000000;
}

void sub_1B05E0330()
{
  qword_1E9B353A8 = 0x3FFC71C71C71C71CLL;
}

double sub_1B05E034C()
{
  id v0 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2910]);
  objc_msgSend(v0, sel_lineHeight);
  double v2 = v1;

  double result = v2 * 4.0;
  *(double *)&qword_1E9B353B0 = v2 * 4.0;
  return result;
}

uint64_t sub_1B05E03C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35418);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1E9B34EC0 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1E9B353A0;
  *(void *)uint64_t v5 = sub_1B0705A60();
  *((void *)v5 + 1) = v6;
  v5[16] = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35420);
  sub_1B05E050C(a2, (uint64_t)&v5[*(int *)(v7 + 44)]);
  v9[15] = 0;
  sub_1B05CBB34(&qword_1E9B35428, &qword_1E9B35418);
  sub_1B05E4E60();
  sub_1B0705D70();
  return sub_1B05DA364((uint64_t)v5, &qword_1E9B35418);
}

uint64_t sub_1B05E050C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v153 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35430);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v152 = v4;
  uint64_t v154 = (uint64_t)&v134 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(int *)(type metadata accessor for MediaInfo() + 44);
  uint64_t v151 = a1;
  uint64_t v6 = (uint64_t *)((char *)a1 + v5);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    id v9 = objc_allocWithZone(MEMORY[0x1E4FB1818]);
    sub_1B05D4EC8(v8, v7);
    double v10 = (void *)sub_1B0705670();
    id v11 = objc_msgSend(v9, sel_initWithData_, v10);

    if (v11)
    {
      uint64_t v149 = (uint64_t *)v8;
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35488);
      uint64_t v150 = &v134;
      v147 = (uint64_t *)v12;
      uint64_t v13 = MEMORY[0x1F4188790](v12);
      id v148 = (uint64_t *)((char *)&v134 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v145 = &v134;
      MEMORY[0x1F4188790](v13);
      uint64_t v144 = (char *)&v134 - v15;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354A0);
      uint64_t v143 = &v134;
      v142 = (uint64_t *)v16;
      MEMORY[0x1F4188790](v16);
      uint64_t v18 = (char *)&v134 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354B0);
      v141 = &v134;
      uint64_t v140 = v19;
      MEMORY[0x1F4188790](v19);
      uint64_t v21 = (double *)((char *)&v134 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v22 = (char *)v11;
      sub_1B0705E60();
      uint64_t v23 = sub_1B0705E70();
      uint64_t v24 = *(void *)(v23 - 8);
      MEMORY[0x1F4188790](v23);
      uint64_t v26 = (char *)&v134 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, void, uint64_t))(v24 + 104))(v26, *MEMORY[0x1E4F3EBF0], v23);
      uint64_t v27 = sub_1B0705EA0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      objc_msgSend(v22, sel_size);
      double v29 = v28;
      v146 = v22;
      objc_msgSend(v22, sel_size);
      double v31 = v29 / v30;
      if (qword_1E9B34EB8 != -1) {
        swift_once();
      }
      sub_1B0705F70();
      sub_1B07058B0();
      uint64_t v32 = v155;
      int v138 = BYTE8(v155);
      uint64_t v137 = v156;
      int v136 = BYTE8(v156);
      uint64_t v134 = *((void *)&v157 + 1);
      uint64_t v135 = v157;
      uint64_t v33 = sub_1B0705950();
      uint64_t v139 = &v134;
      uint64_t v34 = MEMORY[0x1F4188790](v33 - 8);
      uint64_t v36 = (_OWORD *)((char *)&v134 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v37 = (char *)v36 + *(int *)(v34 + 28);
      uint64_t v38 = *MEMORY[0x1E4F3D498];
      uint64_t v39 = sub_1B0705A80();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v37, v38, v39);
      __asm { FMOV            V0.2D, #5.0 }
      *uint64_t v36 = _Q0;
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354E0);
      uint64_t v46 = v45 - 8;
      MEMORY[0x1F4188790](v45);
      uint64_t v48 = (char *)&v134 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1B05E4F58((uint64_t)v36, (uint64_t)v48, MEMORY[0x1F418F050]);
      *(_WORD *)&v48[*(int *)(v46 + 44)] = 256;
      sub_1B05DA300((uint64_t)v48, (uint64_t)v21 + *(int *)(v140 + 36), &qword_1E9B354E0);
      *(void *)uint64_t v21 = v27;
      v21[1] = v31;
      *((_WORD *)v21 + 8) = 0;
      *((void *)v21 + 3) = v32;
      *((unsigned char *)v21 + 32) = v138;
      *((void *)v21 + 5) = v137;
      *((unsigned char *)v21 + 48) = v136;
      uint64_t v49 = v134;
      *((void *)v21 + 7) = v135;
      *((void *)v21 + 8) = v49;
      swift_retain();
      sub_1B05DA364((uint64_t)v48, &qword_1E9B354E0);
      sub_1B05E4FC0((uint64_t)v36, MEMORY[0x1F418F078]);
      swift_release();
      sub_1B05DA300((uint64_t)v21, (uint64_t)v18, &qword_1E9B354B0);
      uint64_t v50 = &v18[*((int *)v142 + 9)];
      *(void *)uint64_t v50 = 0;
      *((_WORD *)v50 + 4) = 257;
      sub_1B05DA364((uint64_t)v21, &qword_1E9B354B0);
      sub_1B05E561C(&qword_1E9B35498, &qword_1E9B354A0, (void (*)(void))sub_1B05E5174);
      uint64_t v51 = (uint64_t)v144;
      sub_1B0705DF0();
      sub_1B05DA364((uint64_t)v18, &qword_1E9B354A0);
      uint64_t v52 = &qword_1E9B35488;
      uint64_t v53 = (uint64_t)v148;
      sub_1B05DA3C0(v51, (uint64_t)v148, &qword_1E9B35488);
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35480);
      MEMORY[0x1F4188790](v54);
      sub_1B05DA300(v53, (uint64_t)&v134 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B35488);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35438);
      sub_1B05E50C0();
      sub_1B05E561C(&qword_1E9B354E8, &qword_1E9B35438, (void (*)(void))sub_1B05E5290);
      sub_1B0705B00();

      sub_1B05E5468((uint64_t)v149, v7);
      uint64_t v56 = v53;
      goto LABEL_12;
    }
    sub_1B05E5468(v8, v7);
  }
  uint64_t v149 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35438);
  uint64_t v150 = &v134;
  uint64_t v57 = MEMORY[0x1F4188790](v149);
  id v148 = (uint64_t *)((char *)&v134 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  v147 = &v134;
  MEMORY[0x1F4188790](v57);
  v146 = (char *)&v134 - v59;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35440);
  v145 = &v134;
  MEMORY[0x1F4188790](v60 - 8);
  uint64_t v144 = (char *)&v134 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35448);
  uint64_t v143 = &v134;
  MEMORY[0x1F4188790](v62);
  long long v64 = (char *)&v134 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35450);
  v142 = &v134;
  uint64_t v66 = v65 - 8;
  MEMORY[0x1F4188790](v65);
  uint64_t v68 = (char *)&v134 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1B0705950();
  v141 = &v134;
  uint64_t v70 = MEMORY[0x1F4188790](v69 - 8);
  uint64_t v72 = (_OWORD *)((char *)&v134 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v73 = (char *)v72 + *(int *)(v70 + 28);
  uint64_t v74 = *MEMORY[0x1E4F3D498];
  uint64_t v75 = sub_1B0705A80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104))(v73, v74, v75);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v72 = _Q0;
  uint64_t v77 = sub_1B0705F60();
  uint64_t v78 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790](v77);
  uint64_t v80 = (char *)&v134 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705F50();
  char v81 = sub_1B0705C60();
  uint64_t v82 = &v68[*(int *)(v66 + 44)];
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v82, v80, v77);
  v82[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35458) + 36)] = v81;
  sub_1B05E4F58((uint64_t)v72, (uint64_t)v68, MEMORY[0x1F418F050]);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v80, v77);
  sub_1B05E4FC0((uint64_t)v72, MEMORY[0x1F418F078]);
  if (qword_1E9B34EC8 != -1) {
    swift_once();
  }
  uint64_t v83 = qword_1E9B353A8;
  sub_1B05DA300((uint64_t)v68, (uint64_t)v64, &qword_1E9B35450);
  uint64_t v84 = &v64[*(int *)(v62 + 36)];
  *(void *)uint64_t v84 = v83;
  *((_WORD *)v84 + 4) = 0;
  sub_1B05DA364((uint64_t)v68, &qword_1E9B35450);
  sub_1B05E561C(&qword_1E9B35460, &qword_1E9B35448, (void (*)(void))sub_1B05E5020);
  uint64_t v85 = (uint64_t)v144;
  sub_1B0705DF0();
  sub_1B05DA364((uint64_t)v64, &qword_1E9B35448);
  if (qword_1E9B34EB8 != -1) {
    swift_once();
  }
  sub_1B0705F70();
  sub_1B07058B0();
  uint64_t v86 = v146;
  sub_1B05DA300(v85, (uint64_t)v146, &qword_1E9B35440);
  uint64_t v87 = &v86[*((int *)v149 + 9)];
  long long v88 = v156;
  *(_OWORD *)uint64_t v87 = v155;
  *((_OWORD *)v87 + 1) = v88;
  *((_OWORD *)v87 + 2) = v157;
  sub_1B05DA364(v85, &qword_1E9B35440);
  uint64_t v52 = &qword_1E9B35438;
  uint64_t v89 = (uint64_t)v148;
  sub_1B05DA3C0((uint64_t)v86, (uint64_t)v148, &qword_1E9B35438);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35480);
  MEMORY[0x1F4188790](v90);
  sub_1B05DA300(v89, (uint64_t)&v134 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B35438);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35488);
  sub_1B05E50C0();
  sub_1B05E561C(&qword_1E9B354E8, &qword_1E9B35438, (void (*)(void))sub_1B05E5290);
  sub_1B0705B00();
  uint64_t v56 = v89;
LABEL_12:
  sub_1B05DA364(v56, v52);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354F8);
  uint64_t v150 = &v134;
  uint64_t v93 = *(uint64_t **)(*(void *)(v92 - 8) + 64);
  uint64_t v94 = MEMORY[0x1F4188790](v92 - 8);
  uint64_t v149 = &v134;
  MEMORY[0x1F4188790](v94);
  uint64_t v96 = (char *)&v134 - v95;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35500);
  id v148 = &v134;
  MEMORY[0x1F4188790](v97 - 8);
  uint64_t v99 = (char *)&v134 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v99 = sub_1B0705AC0();
  *((void *)v99 + 1) = 0x4020000000000000;
  v99[16] = 0;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35508);
  uint64_t v101 = v151;
  sub_1B05E1A0C(v151, (uint64_t)&v99[*(int *)(v100 + 44)]);
  sub_1B0705F80();
  sub_1B05E1EAC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v96, 0.0, 1, 0.0, 1);
  sub_1B05DA364((uint64_t)v99, &qword_1E9B35500);
  v147 = (uint64_t *)((char *)&v134 - (((unint64_t)v93 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B05DA3C0((uint64_t)v96, (uint64_t)v147, &qword_1E9B354F8);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35510);
  v146 = (char *)&v134;
  MEMORY[0x1F4188790](v102 - 8);
  v145 = v103;
  uint64_t v104 = (char *)&v134 - (((unint64_t)v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v105 = *(uint64_t *)((char *)v101 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20));
  if (v105 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v106 = sub_1B0706200();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v106 = *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35518);
  uint64_t v108 = v107;
  uint64_t v109 = *(void *)(v107 - 8);
  if (v106 < 1)
  {
    uint64_t v120 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v104, 1, 1, v107);
  }
  else
  {
    uint64_t v144 = v104;
    uint64_t v151 = v93;
    uint64_t v143 = &v134;
    MEMORY[0x1F4188790](v107);
    uint64_t v111 = (char *)&v134 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35528);
    v142 = &v134;
    MEMORY[0x1F4188790](v112 - 8);
    uint64_t v114 = (char *)&v134 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35530);
    v141 = &v134;
    MEMORY[0x1F4188790](v115);
    uint64_t v117 = (char *)&v134 - ((v116 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)uint64_t v117 = sub_1B0705AD0();
    *((void *)v117 + 1) = 0x4020000000000000;
    v117[16] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35538);
    *(void *)&long long v158 = v105;
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E78);
    sub_1B05E53B8();
    sub_1B05E5414();
    sub_1B0705F40();
    sub_1B05CBB34(&qword_1E9B35550, &qword_1E9B35530);
    sub_1B0705E10();
    sub_1B05DA364((uint64_t)v117, &qword_1E9B35530);
    if (qword_1E9B34EB8 != -1) {
      swift_once();
    }
    sub_1B0705F70();
    sub_1B07058B0();
    sub_1B05DA300((uint64_t)v114, (uint64_t)v111, &qword_1E9B35528);
    uint64_t v118 = &v111[*(int *)(v108 + 36)];
    long long v119 = v159;
    *(_OWORD *)uint64_t v118 = v158;
    *((_OWORD *)v118 + 1) = v119;
    *((_OWORD *)v118 + 2) = v160;
    sub_1B05DA364((uint64_t)v114, &qword_1E9B35528);
    uint64_t v104 = v144;
    sub_1B05DA3C0((uint64_t)v111, (uint64_t)v144, &qword_1E9B35518);
    uint64_t v120 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v109 + 56))(v104, 0, 1, v108);
    uint64_t v93 = v151;
  }
  uint64_t v151 = &v134;
  MEMORY[0x1F4188790](v120);
  v122 = (char *)&v134 - ((v121 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = v154;
  uint64_t v124 = sub_1B05DA300(v154, (uint64_t)v122, &qword_1E9B35430);
  uint64_t v152 = &v134;
  MEMORY[0x1F4188790](v124);
  uint64_t v125 = (char *)&v134 - (((unint64_t)v93 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = (uint64_t)v147;
  uint64_t v127 = sub_1B05DA300((uint64_t)v147, (uint64_t)v125, &qword_1E9B354F8);
  uint64_t v144 = (char *)&v134;
  MEMORY[0x1F4188790](v127);
  uint64_t v129 = (char *)&v134 - ((v128 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300((uint64_t)v104, (uint64_t)v129, &qword_1E9B35510);
  uint64_t v130 = (uint64_t)v104;
  uint64_t v131 = v153;
  sub_1B05DA300((uint64_t)v122, v153, &qword_1E9B35430);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35520);
  sub_1B05DA300((uint64_t)v125, v131 + *(int *)(v132 + 48), &qword_1E9B354F8);
  sub_1B05DA300((uint64_t)v129, v131 + *(int *)(v132 + 64), &qword_1E9B35510);
  sub_1B05DA364(v130, &qword_1E9B35510);
  sub_1B05DA364(v126, &qword_1E9B354F8);
  sub_1B05DA364(v123, &qword_1E9B35430);
  sub_1B05DA364((uint64_t)v129, &qword_1E9B35510);
  sub_1B05DA364((uint64_t)v125, &qword_1E9B354F8);
  return sub_1B05DA364((uint64_t)v122, &qword_1E9B35430);
}

uint64_t sub_1B05E1A0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v4 = MEMORY[0x1F4188790](v36);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35558);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  uint64_t v11 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v35 = (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v33 - v12;
  unint64_t v14 = a1[1];
  if (v14)
  {
    uint64_t v34 = *a1;
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v34 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  uint64_t v16 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for MediaInfo() + 36));
  unint64_t v17 = v16[1];
  uint64_t v38 = v6;
  uint64_t v37 = a2;
  if (v17)
  {
    uint64_t v18 = *v16;
    unint64_t v19 = v17;
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  unint64_t v19 = a1[3];
  if (v19)
  {
    uint64_t v18 = a1[2];
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
LABEL_9:
  uint64_t v20 = (char *)a1 + *(int *)(type metadata accessor for AVInfoTabView(0) + 28);
  uint64_t v21 = *((void *)v20 + 2);
  long long v52 = *(_OWORD *)v20;
  uint64_t v53 = v21;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35220);
  sub_1B0705F00();
  uint64_t v22 = v39;
  unint64_t v23 = v40;
  uint64_t v24 = v41;
  unint64_t v25 = v42;
  if (qword_1E9B34ED0 != -1) {
    swift_once();
  }
  sub_1B0705F70();
  sub_1B07058B0();
  uint64_t v39 = v34;
  unint64_t v40 = v15;
  uint64_t v41 = v18;
  unint64_t v42 = v19;
  uint64_t v43 = v22;
  unint64_t v44 = v23;
  uint64_t v45 = v24;
  unint64_t v46 = v25;
  uint64_t v47 = v52;
  char v48 = BYTE8(v52);
  uint64_t v49 = v53;
  char v50 = v54;
  long long v51 = v55;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35560);
  sub_1B05E561C(&qword_1E9B35568, &qword_1E9B35560, (void (*)(void))sub_1B05E547C);
  sub_1B0705E10();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v26 = v35;
  sub_1B05DA3C0((uint64_t)v13, v35, &qword_1E9B35558);
  uint64_t v27 = sub_1B05E4F58((uint64_t)a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for MediaInfo);
  if (qword_1E9B34EB0 != -1) {
    uint64_t v27 = swift_once();
  }
  *(void *)&v8[*(int *)(v36 + 20)] = qword_1E9B3A378;
  MEMORY[0x1F4188790](v27);
  double v28 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300(v26, (uint64_t)v28, &qword_1E9B35558);
  uint64_t v29 = (uint64_t)v38;
  sub_1B05E4F58((uint64_t)v8, (uint64_t)v38, type metadata accessor for AVInfoTabMetadataStripView);
  uint64_t v30 = v37;
  sub_1B05DA300((uint64_t)v28, v37, &qword_1E9B35558);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35578);
  sub_1B05E4F58(v29, v30 + *(int *)(v31 + 48), type metadata accessor for AVInfoTabMetadataStripView);
  sub_1B05E4FC0((uint64_t)v8, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1B05DA364(v26, &qword_1E9B35558);
  sub_1B05E4FC0(v29, type metadata accessor for AVInfoTabMetadataStripView);
  return sub_1B05DA364((uint64_t)v28, &qword_1E9B35558);
}

__n128 sub_1B05E1EAC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B07060E0();
    unint64_t v23 = (void *)sub_1B0705C20();
    sub_1B0705810();
  }
  sub_1B0705960();
  sub_1B05DA300(v13, a9, &qword_1E9B35500);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354F8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  void v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_1B05E206C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  unint64_t v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B07060E0();
    long long v28 = (void *)sub_1B0705C20();
    sub_1B0705810();

    unint64_t v19 = a16;
  }
  sub_1B0705960();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  long long v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  _OWORD *v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  void v30[2] = v34;
  void v30[3] = v35;
  return result;
}

uint64_t sub_1B05E2268()
{
  return sub_1B0706040();
}

id sub_1B05E2280@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  double v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_1B05E228C@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_1B0705AC0();
  *(void *)(a2 + 8) = 0x402C000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35580);
  return sub_1B05E22EC(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_1B05E22EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVInfoTabView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35588);
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v9 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v25 - v11;
  *(void *)uint64_t v12 = sub_1B0705AC0();
  *((void *)v12 + 1) = 0x4018000000000000;
  v12[16] = 0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35590);
  sub_1B05E25D0(a1, (uint64_t)&v12[*(int *)(v13 + 44)]);
  sub_1B05DA3C0((uint64_t)v12, (uint64_t)v10, &qword_1E9B35588);
  uint64_t v14 = type metadata accessor for AVInfoTabViewConfiguration(0);
  unint64_t v15 = *(uint64_t *)((char *)a1 + *(int *)(v14 + 20));
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1B0706200();
    uint64_t v14 = swift_bridgeObjectRelease();
    if (v19 >= 1) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    goto LABEL_6;
  }
  if (*(uint64_t *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1B05E4F58((uint64_t)a1, (uint64_t)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabView);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v14 = sub_1B05E47E4((uint64_t)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  uint64_t v18 = sub_1B05E54F4;
LABEL_6:
  MEMORY[0x1F4188790](v14);
  uint64_t v20 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300((uint64_t)v10, (uint64_t)v20, &qword_1E9B35588);
  sub_1B05DA300((uint64_t)v20, a2, &qword_1E9B35588);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35598);
  uint64_t v22 = (uint64_t (**)(uint64_t))(a2 + *(int *)(v21 + 48));
  char *v22 = v18;
  v22[1] = (uint64_t (*)(uint64_t))v17;
  uint64_t v23 = a2 + *(int *)(v21 + 64);
  *(void *)uint64_t v23 = 0;
  *(unsigned char *)(v23 + 8) = 1;
  sub_1B05E54D0((uint64_t)v18);
  sub_1B05DA364((uint64_t)v10, &qword_1E9B35588);
  sub_1B05E54E0((uint64_t)v18);
  return sub_1B05DA364((uint64_t)v20, &qword_1E9B35588);
}

uint64_t sub_1B05E25D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVInfoTabMetadataStripView(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v30 - v8;
  if (a1[1])
  {
    uint64_t v10 = *a1;
    unint64_t v11 = a1[1];
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0xE000000000000000;
  }
  uint64_t v12 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for MediaInfo() + 36));
  unint64_t v13 = v12[1];
  unint64_t v40 = v9;
  uint64_t v41 = v7;
  uint64_t v38 = v10;
  uint64_t v39 = v4;
  if (v13)
  {
    uint64_t v31 = *v12;
    unint64_t v32 = v13;
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  unint64_t v14 = a1[3];
  if (v14)
  {
    uint64_t v31 = a1[2];
    unint64_t v32 = v14;
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
LABEL_9:
  unint64_t v15 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabView(0) + 32));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = v15[2];
  uint64_t v42 = *v15;
  uint64_t v43 = v17;
  uint64_t v44 = v18;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35220);
  sub_1B0705F00();
  uint64_t v19 = v45;
  uint64_t v37 = v46;
  uint64_t v20 = v47;
  uint64_t v21 = v48;
  sub_1B07058C0();
  if (*(unint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)) >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B0706200();
    swift_bridgeObjectRelease();
  }
  if (qword_1E9B34EA8 != -1) {
    swift_once();
  }
  uint64_t v45 = v16;
  uint64_t v46 = v17;
  uint64_t v47 = v18;
  sub_1B0705EE0();
  sub_1B0705F70();
  sub_1B07058B0();
  uint64_t v36 = v45;
  int v35 = v46;
  uint64_t v34 = v47;
  int v33 = v48;
  uint64_t v22 = v49;
  uint64_t v23 = v50;
  uint64_t v24 = (uint64_t)v40;
  sub_1B05E4F58((uint64_t)a1, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for MediaInfo);
  *(void *)(v24 + *(int *)(v39 + 20)) = 99;
  uint64_t v25 = (uint64_t)v41;
  sub_1B05E4F58(v24, (uint64_t)v41, type metadata accessor for AVInfoTabMetadataStripView);
  uint64_t v26 = v37;
  *(void *)a2 = v38;
  *(void *)(a2 + 8) = v11;
  unint64_t v27 = v32;
  *(void *)(a2 + 16) = v31;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v26;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v21;
  *(void *)(a2 + 64) = v36;
  *(unsigned char *)(a2 + 72) = v35;
  *(void *)(a2 + 80) = v34;
  *(unsigned char *)(a2 + 88) = v33;
  *(void *)(a2 + 96) = v22;
  *(void *)(a2 + 104) = v23;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355B8);
  sub_1B05E4F58(v25, a2 + *(int *)(v28 + 48), type metadata accessor for AVInfoTabMetadataStripView);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B05E4FC0(v24, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1B05E4FC0(v25, type metadata accessor for AVInfoTabMetadataStripView);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05E29FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_1B0705A60();
  *(void *)(a3 + 8) = 0x4024000000000000;
  *(unsigned char *)(a3 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355A0);
  v12[1] = *(void *)(a2 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20));
  swift_getKeyPath();
  uint64_t v6 = sub_1B07058E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355A8);
  sub_1B05E53B8();
  sub_1B05E561C(&qword_1E9B355B0, &qword_1E9B355A8, (void (*)(void))sub_1B05E5414);
  return sub_1B0705F40();
}

double sub_1B05E2C10@<D0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  sub_1B07058C0();
  sub_1B0705F70();
  sub_1B07058B0();
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8;
  double result = *(double *)&v9;
  *(_OWORD *)(a2 + 40) = v9;
  return result;
}

uint64_t sub_1B05E2CB4()
{
  uint64_t v1 = type metadata accessor for AVInfoTabView(0);
  uint64_t v2 = MEMORY[0x1F4188790](v1);
  uint64_t v100 = &v91[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v113 = &v91[-v5];
  MEMORY[0x1F4188790](v4);
  uint64_t v102 = &v91[-v6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = &v91[-v9];
  uint64_t v111 = (unsigned char *)v1;
  uint64_t v103 = (unsigned char *)v0;
  uint64_t v11 = sub_1B05E667C((uint64_t)&v91[-v9]);
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = &v91[-v9];
  uint64_t v13 = *MEMORY[0x1E4F3DA60];
  uint64_t v14 = sub_1B0705B70();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned char **)(v15 + 104);
  unsigned int v101 = v13;
  uint64_t v108 = v16;
  uint64_t v109 = (unsigned char *)(v15 + 104);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v16)(&v91[-v9], v13, v14);
  uint64_t v106 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56);
  uint64_t v107 = v15 + 56;
  v106(&v91[-v9], 0, 1, v14);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355C0);
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v104 = v19;
  uint64_t v105 = v18;
  uint64_t v20 = &v91[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = (uint64_t)&v20[*(int *)(v18 + 48)];
  sub_1B05DA300((uint64_t)&v91[-v9], (uint64_t)v20, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v91[-v9], v21, &qword_1E9B34DC8);
  uint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  uint64_t v23 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v22)(v20, 1, v14);
  uint64_t v98 = v15;
  uint64_t v99 = v15 + 48;
  uint64_t v110 = v22;
  uint64_t v112 = v8;
  if (v23 == 1)
  {
    sub_1B05DA364((uint64_t)&v91[-v9], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v91[-v9], &qword_1E9B34DC8);
    if (v22(v21, 1, v14) == 1)
    {
      sub_1B05DA364((uint64_t)v20, &qword_1E9B34DC8);
      uint64_t v24 = sub_1B05E4F58((uint64_t)v103, (uint64_t)v102, type metadata accessor for AVInfoTabView);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v97 = v91;
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = &v91[-v9];
  sub_1B05DA300((uint64_t)v20, (uint64_t)&v91[-v9], &qword_1E9B34DC8);
  uint64_t v26 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v22)(v21, 1, v14);
  if (v26 == 1)
  {
    sub_1B05DA364((uint64_t)&v91[-v9], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v91[-v9], &qword_1E9B34DC8);
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(&v91[-v9], v14);
LABEL_6:
    sub_1B05DA364((uint64_t)v20, &qword_1E9B355C0);
    uint64_t v28 = (uint64_t)v102;
    uint64_t v27 = (uint64_t)v103;
    sub_1B05E4F58((uint64_t)v103, (uint64_t)v102, type metadata accessor for AVInfoTabView);
    uint64_t v29 = v113;
LABEL_11:
    uint64_t v45 = v14;
    sub_1B05E4FC0(v28, type metadata accessor for AVInfoTabView);
LABEL_15:
    uint64_t v48 = sub_1B05E4F58(v27, (uint64_t)v29, type metadata accessor for AVInfoTabView);
    uint64_t v49 = v112;
    goto LABEL_16;
  }
  MEMORY[0x1F4188790](v26);
  uint64_t v31 = &v91[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 32))(v31, v21, v14);
  sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
  LODWORD(v96) = sub_1B0706000();
  unint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
  v32(v31, v14);
  sub_1B05DA364((uint64_t)v12, &qword_1E9B34DC8);
  sub_1B05DA364((uint64_t)v10, &qword_1E9B34DC8);
  v32(v25, v14);
  uint64_t v15 = v98;
  sub_1B05DA364((uint64_t)v20, &qword_1E9B34DC8);
  uint64_t v28 = (uint64_t)v102;
  uint64_t v27 = (uint64_t)v103;
  uint64_t v24 = sub_1B05E4F58((uint64_t)v103, (uint64_t)v102, type metadata accessor for AVInfoTabView);
  uint64_t v29 = v113;
  if ((v96 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v97 = v91;
  uint64_t v33 = v112;
  MEMORY[0x1F4188790](v24);
  unint64_t v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  int v35 = &v91[-v34];
  uint64_t v36 = sub_1B05E667C((uint64_t)&v91[-v34]);
  uint64_t v96 = v91;
  MEMORY[0x1F4188790](v36);
  uint64_t v37 = &v91[-v34];
  ((void (*)(unsigned char *, void, uint64_t))v108)(&v91[-v34], *MEMORY[0x1E4F3DA50], v14);
  uint64_t v38 = ((uint64_t (*)(unsigned char *, void, uint64_t, uint64_t))v106)(&v91[-v34], 0, 1, v14);
  uint64_t v95 = v91;
  MEMORY[0x1F4188790](v38);
  unint64_t v40 = &v91[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v41 = (uint64_t)&v40[*(int *)(v105 + 48)];
  sub_1B05DA300((uint64_t)&v91[-v34], (uint64_t)v40, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v91[-v34], v41, &qword_1E9B34DC8);
  uint64_t v42 = v110;
  uint64_t v43 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v110)(v40, 1, v14);
  if (v43 == 1)
  {
    sub_1B05DA364((uint64_t)&v91[-v34], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v91[-v34], &qword_1E9B34DC8);
    sub_1B05E4FC0((uint64_t)v102, type metadata accessor for AVInfoTabView);
    if (v42(v41, 1, v14) == 1)
    {
      sub_1B05DA364((uint64_t)v40, &qword_1E9B34DC8);
      uint64_t v44 = v113;
      sub_1B05E4F58((uint64_t)v103, (uint64_t)v113, type metadata accessor for AVInfoTabView);
LABEL_31:
      sub_1B05E4FC0((uint64_t)v44, type metadata accessor for AVInfoTabView);
      char v66 = 1;
      return v66 & 1;
    }
    goto LABEL_14;
  }
  uint64_t v94 = v91;
  MEMORY[0x1F4188790](v43);
  uint64_t v46 = &v91[-v34];
  sub_1B05DA300((uint64_t)v40, (uint64_t)v46, &qword_1E9B34DC8);
  uint64_t v47 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v42)(v41, 1, v14);
  if (v47 == 1)
  {
    sub_1B05DA364((uint64_t)v37, &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)v35, &qword_1E9B34DC8);
    sub_1B05E4FC0((uint64_t)v102, type metadata accessor for AVInfoTabView);
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v46, v14);
LABEL_14:
    uint64_t v45 = v14;
    sub_1B05DA364((uint64_t)v40, &qword_1E9B355C0);
    uint64_t v29 = v113;
    uint64_t v27 = (uint64_t)v103;
    goto LABEL_15;
  }
  uint64_t v93 = v91;
  MEMORY[0x1F4188790](v47);
  uint64_t v83 = &v91[-((v82 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 32))(v83, v41, v14);
  sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
  int v92 = sub_1B0706000();
  uint64_t v84 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
  v84(v83, v14);
  sub_1B05DA364((uint64_t)v37, &qword_1E9B34DC8);
  sub_1B05DA364((uint64_t)v35, &qword_1E9B34DC8);
  sub_1B05E4FC0((uint64_t)v102, type metadata accessor for AVInfoTabView);
  uint64_t v85 = v46;
  uint64_t v45 = v14;
  v84(v85, v14);
  sub_1B05DA364((uint64_t)v40, &qword_1E9B34DC8);
  uint64_t v44 = v113;
  uint64_t v48 = sub_1B05E4F58((uint64_t)v103, (uint64_t)v113, type metadata accessor for AVInfoTabView);
  uint64_t v49 = v112;
  if (v92) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v103 = v91;
  MEMORY[0x1F4188790](v48);
  unint64_t v50 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  long long v51 = &v91[-v50];
  uint64_t v52 = sub_1B05E667C((uint64_t)&v91[-v50]);
  uint64_t v102 = v91;
  MEMORY[0x1F4188790](v52);
  uint64_t v53 = &v91[-v50];
  ((void (*)(unsigned char *, void, uint64_t))v108)(&v91[-v50], v101, v45);
  uint64_t v54 = ((uint64_t (*)(unsigned char *, void, uint64_t, uint64_t))v106)(&v91[-v50], 0, 1, v45);
  uint64_t v97 = v91;
  MEMORY[0x1F4188790](v54);
  uint64_t v56 = &v91[-((v55 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = (uint64_t)&v56[*(int *)(v105 + 48)];
  sub_1B05DA300((uint64_t)&v91[-v50], (uint64_t)v56, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v91[-v50], v57, &qword_1E9B34DC8);
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v110;
  uint64_t v59 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v110)(v56, 1, v45);
  if (v59 != 1)
  {
    uint64_t v96 = v91;
    MEMORY[0x1F4188790](v59);
    uint64_t v62 = &v91[-v50];
    sub_1B05DA300((uint64_t)v56, (uint64_t)&v91[-v50], &qword_1E9B34DC8);
    uint64_t v63 = v58(v57, 1, v45);
    uint64_t v60 = v45;
    if (v63 != 1)
    {
      uint64_t v67 = v98;
      MEMORY[0x1F4188790](v63);
      uint64_t v69 = &v91[-((v68 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v67 + 32))(v69, v57, v60);
      sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
      LODWORD(v95) = sub_1B0706000();
      uint64_t v70 = *(void (**)(unsigned char *, uint64_t))(v67 + 8);
      v70(v69, v60);
      sub_1B05DA364((uint64_t)v53, &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)v51, &qword_1E9B34DC8);
      v70(v62, v60);
      long long v64 = v113;
      sub_1B05DA364((uint64_t)v56, &qword_1E9B34DC8);
      uint64_t v65 = v100;
      uint64_t v61 = sub_1B05E4F58((uint64_t)v64, (uint64_t)v100, type metadata accessor for AVInfoTabView);
      if (v95) {
        goto LABEL_24;
      }
LABEL_22:
      sub_1B05E4FC0((uint64_t)v65, type metadata accessor for AVInfoTabView);
      sub_1B05E4FC0((uint64_t)v64, type metadata accessor for AVInfoTabView);
      char v66 = 0;
      return v66 & 1;
    }
    sub_1B05DA364((uint64_t)&v91[-v50], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v91[-v50], &qword_1E9B34DC8);
    (*(void (**)(unsigned char *, uint64_t))(v98 + 8))(&v91[-v50], v45);
LABEL_21:
    sub_1B05DA364((uint64_t)v56, &qword_1E9B355C0);
    long long v64 = v113;
    uint64_t v65 = v100;
    sub_1B05E4F58((uint64_t)v113, (uint64_t)v100, type metadata accessor for AVInfoTabView);
    goto LABEL_22;
  }
  sub_1B05DA364((uint64_t)&v91[-v50], &qword_1E9B34DC8);
  sub_1B05DA364((uint64_t)&v91[-v50], &qword_1E9B34DC8);
  if (v58(v57, 1, v45) != 1) {
    goto LABEL_21;
  }
  uint64_t v60 = v45;
  sub_1B05DA364((uint64_t)v56, &qword_1E9B34DC8);
  uint64_t v61 = sub_1B05E4F58((uint64_t)v113, (uint64_t)v100, type metadata accessor for AVInfoTabView);
LABEL_24:
  uint64_t v103 = v91;
  uint64_t v71 = v112;
  MEMORY[0x1F4188790](v61);
  unint64_t v72 = (v71 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v73 = sub_1B05E667C((uint64_t)&v91[-v72]);
  uint64_t v111 = v91;
  MEMORY[0x1F4188790](v73);
  ((void (*)(unsigned char *, void, uint64_t))v108)(&v91[-v72], v101, v60);
  uint64_t v74 = ((uint64_t (*)(unsigned char *, void, uint64_t, uint64_t))v106)(&v91[-v72], 0, 1, v60);
  uint64_t v109 = v91;
  MEMORY[0x1F4188790](v74);
  uint64_t v76 = &v91[-((v75 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v77 = (uint64_t)&v76[*(int *)(v105 + 48)];
  uint64_t v78 = &qword_1E9B34DC8;
  sub_1B05DA300((uint64_t)&v91[-v72], (uint64_t)v76, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v91[-v72], v77, &qword_1E9B34DC8);
  uint64_t v79 = v110;
  uint64_t v80 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v110)(v76, 1, v60);
  if (v80 == 1)
  {
    sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
    sub_1B05E4FC0((uint64_t)v100, type metadata accessor for AVInfoTabView);
    sub_1B05E4FC0((uint64_t)v113, type metadata accessor for AVInfoTabView);
    if (v79(v77, 1, v60) == 1)
    {
      char v66 = -1;
    }
    else
    {
      uint64_t v78 = &qword_1E9B355C0;
      char v66 = 0;
    }
  }
  else
  {
    uint64_t v108 = v91;
    MEMORY[0x1F4188790](v80);
    sub_1B05DA300((uint64_t)v76, (uint64_t)&v91[-v72], &qword_1E9B34DC8);
    uint64_t v81 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v79)(v77, 1, v60);
    if (v81 == 1)
    {
      sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
      sub_1B05E4FC0((uint64_t)v100, type metadata accessor for AVInfoTabView);
      sub_1B05E4FC0((uint64_t)v113, type metadata accessor for AVInfoTabView);
      (*(void (**)(unsigned char *, uint64_t))(v98 + 8))(&v91[-v72], v60);
      uint64_t v78 = &qword_1E9B355C0;
      char v66 = 0;
    }
    else
    {
      uint64_t v86 = v98;
      MEMORY[0x1F4188790](v81);
      long long v88 = &v91[-((v87 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v86 + 32))(v88, v77, v60);
      sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
      char v66 = sub_1B0706000();
      uint64_t v89 = *(void (**)(unsigned char *, uint64_t))(v86 + 8);
      v89(v88, v60);
      uint64_t v78 = &qword_1E9B34DC8;
      sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)&v91[-v72], &qword_1E9B34DC8);
      sub_1B05E4FC0((uint64_t)v100, type metadata accessor for AVInfoTabView);
      sub_1B05E4FC0((uint64_t)v113, type metadata accessor for AVInfoTabView);
      v89(&v91[-v72], v60);
    }
  }
  sub_1B05DA364((uint64_t)v76, v78);
  return v66 & 1;
}

uint64_t sub_1B05E3E5C()
{
  uint64_t v1 = type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1F4188790](v1);
  long long v64 = &v49[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
  uint64_t v4 = *(void *)(*(void *)(v3 - 8) + 64);
  MEMORY[0x1F4188790](v3 - 8);
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = &v49[-v5];
  uint64_t v61 = (unsigned char *)v1;
  uint64_t v63 = (unsigned char *)v0;
  uint64_t v7 = sub_1B05E667C((uint64_t)&v49[-v5]);
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = &v49[-v5];
  uint64_t v9 = *MEMORY[0x1E4F3DA50];
  uint64_t v10 = sub_1B0705B70();
  uint64_t v11 = *(void **)(v10 - 8);
  uint64_t v12 = (void (*)(unsigned char *, void, uint64_t))v11[13];
  LODWORD(v60) = v9;
  uint64_t v58 = v11 + 13;
  uint64_t v56 = v12;
  v12(&v49[-v5], v9, v10);
  uint64_t v13 = (uint64_t (*)(unsigned char *, void, uint64_t, uint64_t))v11[7];
  uint64_t v59 = v11 + 7;
  uint64_t v57 = v13;
  v13(&v49[-v5], 0, 1, v10);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355C0);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v54 = v16;
  uint64_t v55 = v15;
  uint64_t v17 = &v49[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_1B05DA300((uint64_t)&v49[-v5], (uint64_t)v17, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v49[-v5], v18, &qword_1E9B34DC8);
  uint64_t v62 = v11;
  uint64_t v19 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v11[6];
  uint64_t v20 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v19)(v17, 1, v10);
  if (v20 != 1)
  {
    uint64_t v52 = v49;
    MEMORY[0x1F4188790](v20);
    uint64_t v23 = &v49[-v5];
    sub_1B05DA300((uint64_t)v17, (uint64_t)&v49[-v5], &qword_1E9B34DC8);
    uint64_t v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v19)(v18, 1, v10);
    if (v24 != 1)
    {
      long long v51 = v19;
      uint64_t v53 = v4;
      uint64_t v26 = v62;
      MEMORY[0x1F4188790](v24);
      uint64_t v28 = &v49[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(unsigned char *, uint64_t, uint64_t))v26[4])(v28, v18, v10);
      sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
      int v50 = sub_1B0706000();
      uint64_t v29 = (void (*)(unsigned char *, uint64_t))v26[1];
      v29(v28, v10);
      sub_1B05DA364((uint64_t)v8, &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)v6, &qword_1E9B34DC8);
      v29(v23, v10);
      uint64_t v4 = v53;
      uint64_t v21 = v64;
      sub_1B05DA364((uint64_t)v17, &qword_1E9B34DC8);
      uint64_t v22 = sub_1B05E4F58((uint64_t)v63, (uint64_t)v21, type metadata accessor for AVInfoTabView);
      if (v50) {
        goto LABEL_9;
      }
LABEL_7:
      sub_1B05E4FC0((uint64_t)v21, type metadata accessor for AVInfoTabView);
      char v25 = 0;
      return v25 & 1;
    }
    sub_1B05DA364((uint64_t)&v49[-v5], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v49[-v5], &qword_1E9B34DC8);
    ((void (*)(unsigned char *, uint64_t))v62[1])(&v49[-v5], v10);
LABEL_6:
    sub_1B05DA364((uint64_t)v17, &qword_1E9B355C0);
    uint64_t v21 = v64;
    sub_1B05E4F58((uint64_t)v63, (uint64_t)v64, type metadata accessor for AVInfoTabView);
    goto LABEL_7;
  }
  sub_1B05DA364((uint64_t)&v49[-v5], &qword_1E9B34DC8);
  sub_1B05DA364((uint64_t)&v49[-v5], &qword_1E9B34DC8);
  if (v19(v18, 1, v10) != 1) {
    goto LABEL_6;
  }
  long long v51 = v19;
  sub_1B05DA364((uint64_t)v17, &qword_1E9B34DC8);
  uint64_t v21 = v64;
  uint64_t v22 = sub_1B05E4F58((uint64_t)v63, (uint64_t)v64, type metadata accessor for AVInfoTabView);
LABEL_9:
  uint64_t v52 = v49;
  uint64_t v53 = v4;
  MEMORY[0x1F4188790](v22);
  unint64_t v30 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = &v49[-v30];
  uint64_t v32 = sub_1B05E667C((uint64_t)&v49[-v30]);
  uint64_t v63 = v49;
  MEMORY[0x1F4188790](v32);
  uint64_t v33 = &v49[-v30];
  v56(&v49[-v30], v60, v10);
  uint64_t v34 = v57(&v49[-v30], 0, 1, v10);
  uint64_t v35 = (uint64_t)v21;
  uint64_t v61 = v49;
  MEMORY[0x1F4188790](v34);
  uint64_t v37 = &v49[-((v36 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v38 = (uint64_t)&v37[*(int *)(v55 + 48)];
  uint64_t v39 = &qword_1E9B34DC8;
  sub_1B05DA300((uint64_t)&v49[-v30], (uint64_t)v37, &qword_1E9B34DC8);
  sub_1B05DA300((uint64_t)&v49[-v30], v38, &qword_1E9B34DC8);
  unint64_t v40 = v51;
  uint64_t v41 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v51)(v37, 1, v10);
  if (v41 == 1)
  {
    sub_1B05DA364((uint64_t)&v49[-v30], &qword_1E9B34DC8);
    sub_1B05DA364((uint64_t)&v49[-v30], &qword_1E9B34DC8);
    sub_1B05E4FC0(v35, type metadata accessor for AVInfoTabView);
    if (v40(v38, 1, v10) == 1)
    {
      char v25 = -1;
    }
    else
    {
      uint64_t v39 = &qword_1E9B355C0;
      char v25 = 0;
    }
  }
  else
  {
    uint64_t v60 = v49;
    MEMORY[0x1F4188790](v41);
    uint64_t v42 = &v49[-v30];
    sub_1B05DA300((uint64_t)v37, (uint64_t)&v49[-v30], &qword_1E9B34DC8);
    uint64_t v43 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v40)(v38, 1, v10);
    if (v43 == 1)
    {
      sub_1B05DA364((uint64_t)&v49[-v30], &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)&v49[-v30], &qword_1E9B34DC8);
      sub_1B05E4FC0((uint64_t)v64, type metadata accessor for AVInfoTabView);
      ((void (*)(unsigned char *, uint64_t))v62[1])(&v49[-v30], v10);
      uint64_t v39 = &qword_1E9B355C0;
      char v25 = 0;
    }
    else
    {
      uint64_t v59 = v49;
      uint64_t v44 = v62;
      MEMORY[0x1F4188790](v43);
      uint64_t v46 = &v49[-((v45 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(unsigned char *, uint64_t, uint64_t))v44[4])(v46, v38, v10);
      sub_1B05E68D8(&qword_1E9B355C8, MEMORY[0x1F418FC48]);
      char v25 = sub_1B0706000();
      uint64_t v47 = (void (*)(unsigned char *, uint64_t))v44[1];
      v47(v46, v10);
      uint64_t v39 = &qword_1E9B34DC8;
      sub_1B05DA364((uint64_t)v33, &qword_1E9B34DC8);
      sub_1B05DA364((uint64_t)v31, &qword_1E9B34DC8);
      sub_1B05E4FC0((uint64_t)v64, type metadata accessor for AVInfoTabView);
      v47(v42, v10);
    }
  }
  sub_1B05DA364((uint64_t)v37, v39);
  return v25 & 1;
}

uint64_t sub_1B05E46E0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](a1 - 8);
  sub_1B05E4F58(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1B05E47E4((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_1B05E4848;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

uint64_t sub_1B05E47E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVInfoTabView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B05E4848(uint64_t a1)
{
  return sub_1B05E4D44(a1, sub_1B05DFDCC);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for AVInfoTabView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v6 = (int *)type metadata accessor for MediaInfo();
  uint64_t v7 = v0 + v3 + v6[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    uint64_t v9 = v0;
    uint64_t v10 = v4;
    uint64_t v11 = sub_1B0705750();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v7, v11);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v10;
    uint64_t v0 = v9;
    uint64_t v3 = (v2 + 16) & ~v2;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = (uint64_t *)(v5 + v6[11]);
  unint64_t v14 = v13[1];
  if (v14 >> 60 != 15) {
    sub_1B05D51A0(*v13, v14);
  }

  uint64_t v15 = v5 + v6[22];
  uint64_t v16 = sub_1B0705750();
  uint64_t v17 = *(void *)(v16 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16)) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for AVInfoTabViewConfiguration(0);
  swift_bridgeObjectRelease();
  uint64_t v18 = v5 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_1B0705B70();
    uint64_t v20 = *(void *)(v19 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19)) {
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v21 = v5 + *(int *)(v1 + 24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_1B0705B70();
    uint64_t v23 = *(void *)(v22 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22)) {
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1B05E4D2C(uint64_t a1)
{
  return sub_1B05E4D44(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1B05E228C);
}

uint64_t sub_1B05E4D44(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for AVInfoTabView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_1B05E4DD8()
{
  unint64_t result = qword_1E9B353D0;
  if (!qword_1E9B353D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B353C8);
    sub_1B05CBB34(&qword_1E9B353D8, &qword_1E9B353E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B353D0);
  }
  return result;
}

unint64_t sub_1B05E4E60()
{
  unint64_t result = qword_1E9B353E8;
  if (!qword_1E9B353E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B353E8);
  }
  return result;
}

unint64_t sub_1B05E4EB4()
{
  unint64_t result = qword_1E9B35400;
  if (!qword_1E9B35400)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B353F8);
    sub_1B05CBB34(&qword_1E9B35408, &qword_1E9B35410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35400);
  }
  return result;
}

uint64_t sub_1B05E4F40(uint64_t a1)
{
  return sub_1B05E4D44(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1B05E03C4);
}

uint64_t sub_1B05E4F58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B05E4FC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1B05E5020()
{
  unint64_t result = qword_1E9B35468;
  if (!qword_1E9B35468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35450);
    sub_1B05E68D8(&qword_1E9B35470, MEMORY[0x1F418F068]);
    sub_1B05CBB34(&qword_1E9B35478, &qword_1E9B35458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35468);
  }
  return result;
}

unint64_t sub_1B05E50C0()
{
  unint64_t result = qword_1E9B35490;
  if (!qword_1E9B35490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35488);
    sub_1B05E561C(&qword_1E9B35498, &qword_1E9B354A0, (void (*)(void))sub_1B05E5174);
    sub_1B05E68D8(&qword_1E9B351F0, MEMORY[0x1F41901D8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35490);
  }
  return result;
}

unint64_t sub_1B05E5174()
{
  unint64_t result = qword_1E9B354A8;
  if (!qword_1E9B354A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B354B0);
    sub_1B05E561C(&qword_1E9B354B8, &qword_1E9B354C0, (void (*)(void))sub_1B05E5228);
    sub_1B05CBB34(&qword_1E9B354D8, &qword_1E9B354E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B354A8);
  }
  return result;
}

unint64_t sub_1B05E5228()
{
  unint64_t result = qword_1E9B354C8;
  if (!qword_1E9B354C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B354D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B354C8);
  }
  return result;
}

unint64_t sub_1B05E5290()
{
  unint64_t result = qword_1E9B354F0;
  if (!qword_1E9B354F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35440);
    sub_1B05E561C(&qword_1E9B35460, &qword_1E9B35448, (void (*)(void))sub_1B05E5020);
    sub_1B05E68D8(&qword_1E9B351F0, MEMORY[0x1F41901D8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B354F0);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

id sub_1B05E5350@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_identifier);
  *a2 = result;
  return result;
}

uint64_t sub_1B05E538C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0706040();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1B05E53B8()
{
  unint64_t result = qword_1E9B35540;
  if (!qword_1E9B35540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B34E78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35540);
  }
  return result;
}

unint64_t sub_1B05E5414()
{
  unint64_t result = qword_1E9B35548;
  if (!qword_1E9B35548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35548);
  }
  return result;
}

uint64_t sub_1B05E5468(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B05D51A0(a1, a2);
  }
  return a1;
}

unint64_t sub_1B05E547C()
{
  unint64_t result = qword_1E9B35570;
  if (!qword_1E9B35570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35570);
  }
  return result;
}

uint64_t sub_1B05E54D0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B05E54E0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1B05E54F4(uint64_t a1)
{
  return sub_1B05E4D44(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1B05E29FC);
}

uint64_t sub_1B05E550C()
{
  uint64_t v1 = sub_1B07058E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

double sub_1B05E559C@<D0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1B07058E0();

  return sub_1B05E2C10(a1, a2);
}

uint64_t sub_1B05E561C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B05E568C(void *a1)
{
  objc_msgSend(a1, sel_performWithSender_target_, objc_msgSend(a1, sel_sender), 0);

  return swift_unknownObjectRelease();
}

uint64_t sub_1B05E56F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35610);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355F8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35618);
  sub_1B05E7298();
  sub_1B0705EC0();
  sub_1B05CBB34(&qword_1E9B35600, &qword_1E9B355F8);
  sub_1B05E7234();
  sub_1B0705D60();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = sub_1B0705F70();
  __n128 v14 = sub_1B05E206C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a2, 0.0, 1, 0.0, 1, v12, v13, &qword_1E9B35610, &qword_1E9B355E8);
  return (*(uint64_t (**)(unsigned char *, uint64_t, __n128))(v5 + 8))(v7, v4, v14);
}

uint64_t sub_1B05E5970@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_title);
  sub_1B0706040();

  sub_1B05D7C54();
  uint64_t result = sub_1B0705D30();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

id sub_1B05E59F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id result = objc_msgSend(a1, sel_image);
  if (result)
  {
    id v4 = result;
    sub_1B0705E60();
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35218);
    MEMORY[0x1F4188790](v5 - 8);
    uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v8 = *MEMORY[0x1E4F3EC18];
    uint64_t v9 = sub_1B0705E90();
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    uint64_t v11 = sub_1B0705E80();

    swift_release();
    id result = (id)sub_1B05DA364((uint64_t)v7, &qword_1E9B35218);
  }
  else
  {
    uint64_t v11 = 0;
  }
  *a2 = v11;
  return result;
}

uint64_t sub_1B05E5B6C()
{
  uint64_t v1 = *v0;
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355E8);
  sub_1B05E7168();
  return sub_1B0705F10();
}

uint64_t sub_1B05E5C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35628);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v42 = (uint64_t)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35630);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v38 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35638);
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35640);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v1;
  uint64_t v44 = v1;
  sub_1B0705C50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35648);
  sub_1B05E7300();
  sub_1B0705850();
  uint64_t v13 = sub_1B0705B30();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705B20();
  unsigned __int8 v17 = sub_1B0705C50();
  sub_1B0705C40();
  sub_1B0705C40();
  if (sub_1B0705C40() != v17) {
    sub_1B0705C40();
  }
  uint64_t v18 = sub_1B05CBB34(&qword_1E9B35680, &qword_1E9B35640);
  sub_1B0705E00();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v19 = sub_1B0705C10();
  v35[1] = v35;
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705B20();
  unsigned __int8 v23 = sub_1B0705C50();
  unsigned __int8 v24 = sub_1B0705C30();
  sub_1B0705C40();
  sub_1B0705C40();
  if (sub_1B0705C40() != v23) {
    sub_1B0705C40();
  }
  sub_1B0705C40();
  if (sub_1B0705C40() != v24) {
    sub_1B0705C40();
  }
  *(void *)&long long v45 = v9;
  *((void *)&v45 + 1) = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v37;
  char v25 = v38;
  sub_1B0705DC0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v26);
  long long v27 = *(_OWORD *)(v39 + 48);
  long long v45 = *(_OWORD *)(v39 + 32);
  long long v46 = v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35688);
  MEMORY[0x1B3E950D0](v47, v28);
  double v29 = *(double *)&v47[1];
  uint64_t v30 = sub_1B0705F70();
  uint64_t v31 = v42;
  __n128 v33 = sub_1B05E206C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v42, 0.0, 1, v29, 0, v30, v32, &qword_1E9B35630, &qword_1E9B35628);
  (*(void (**)(char *, uint64_t, __n128))(v40 + 8))(v25, v41, v33);
  return sub_1B05DA3C0(v31, v43, &qword_1E9B35628);
}

uint64_t sub_1B05E61B0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *a1;
  long long v32 = a1[1];
  long long v33 = v4;
  sub_1B05E7478((uint64_t)&v33);
  sub_1B05E7478((uint64_t)&v32);
  sub_1B05D7C54();
  uint64_t v31 = sub_1B0705D30();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_1B0705D30();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  char v18 = sub_1B0705C60();
  sub_1B0705840();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  long long v27 = (_OWORD *)swift_allocObject();
  long long v28 = a1[1];
  v27[1] = *a1;
  void v27[2] = v28;
  long long v29 = a1[3];
  v27[3] = a1[2];
  v27[4] = v29;
  char v35 = v15 & 1;
  char v34 = 0;
  *(void *)a2 = v31;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v13;
  *(unsigned char *)(a2 + 48) = v15 & 1;
  *(void *)(a2 + 56) = v17;
  *(unsigned char *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = v20;
  *(void *)(a2 + 80) = v22;
  *(void *)(a2 + 88) = v24;
  *(void *)(a2 + 96) = v26;
  *(unsigned char *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = sub_1B05E74F4;
  *(void *)(a2 + 120) = v27;
  return sub_1B05E74FC((uint64_t)a1);
}

uint64_t sub_1B05E6324()
{
  return sub_1B0705F30();
}

uint64_t sub_1B05E6374@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05E5C18(a1);
}

uint64_t sub_1B05E63B0@<X0>(char *a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_1B0705B90();
  uint64_t v23 = *(void *)(v1 - 8);
  uint64_t v2 = v23;
  uint64_t v3 = *(void *)(v23 + 64);
  MEMORY[0x1F4188790](v1);
  uint64_t v22 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705BA0();
  uint64_t v4 = sub_1B0705BB0();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v5 = v20;
  uint64_t v21 = v4;
  uint64_t v6 = *(void *)(v20 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = sub_1B0705BC0();
  MEMORY[0x1F4188790](v7);
  char v8 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(uint64_t (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v10 = v9(v8, v8, v1);
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v13 = v21;
  v12(v11, v11, v21);
  char v14 = v24;
  v9(v24, v8, v1);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B356B0);
  v12(&v14[*(int *)(v15 + 48)], v11, v13);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v20 + 8);
  v16(v11, v13);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v23 + 8);
  v17(v22, v1);
  v16(v11, v13);
  return ((uint64_t (*)(char *, uint64_t))v17)(v8, v1);
}

uint64_t sub_1B05E662C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1B0705A60();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B356A8);
  return sub_1B05E63B0((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_1B05E667C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05DA300(v2, (uint64_t)v6, &qword_1E9B34E68);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_1B05DA3C0((uint64_t)v6, a1, &qword_1E9B34DC8);
  }
  os_log_type_t v8 = sub_1B07060E0();
  uint64_t v9 = sub_1B0705C20();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_1B05E6920(0xD000000000000020, 0x80000001B0722C40, &v17);
    _os_log_impl(&dword_1B05B7000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E96820](v11, -1, -1);
    MEMORY[0x1B3E96820](v10, -1, -1);
  }

  uint64_t v12 = sub_1B0705A50();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0705A40();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1B05E68D8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1B05E6920(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1B05E69F4(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B05E6B44((uint64_t)v12, *a3);
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
      sub_1B05E6B44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_1B05E69F4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_1B05E6BA0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1B07061A0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
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

uint64_t sub_1B05E6B44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B05E6BA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B05E6C38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1B05E6D3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1B05E6D3C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B05E6C38(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1B05E6CD4(v2, 0);
      uint64_t result = sub_1B0706180();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1B0706060();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B05E6CD4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1B05E6D3C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B355D0);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for AVInfoTabView.ActionButton()
{
  return &type metadata for AVInfoTabView.ActionButton;
}

uint64_t destroy for AVInfoTabView.ScrollableDescriptionView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AVInfoTabView.ScrollableDescriptionView(void *a1, void *a2)
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
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

uint64_t assignWithTake for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVInfoTabView.ScrollableDescriptionView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AVInfoTabView.ScrollableDescriptionView()
{
  return &type metadata for AVInfoTabView.ScrollableDescriptionView;
}

uint64_t sub_1B05E70B8()
{
  return sub_1B05CBB34(&qword_1E9B355D8, &qword_1E9B355E0);
}

uint64_t sub_1B05E70E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05E7104()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05E7120()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B05E7158()
{
  return sub_1B05E568C(*(void **)(v0 + 16));
}

uint64_t sub_1B05E7160@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05E56F0(*(void *)(v1 + 16), a1);
}

unint64_t sub_1B05E7168()
{
  unint64_t result = qword_1E9B355F0;
  if (!qword_1E9B355F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B355E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B355F8);
    sub_1B05CBB34(&qword_1E9B35600, &qword_1E9B355F8);
    sub_1B05E7234();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B355F0);
  }
  return result;
}

unint64_t sub_1B05E7234()
{
  unint64_t result = qword_1E9B35608;
  if (!qword_1E9B35608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35608);
  }
  return result;
}

uint64_t sub_1B05E7288@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05E5970(*(void **)(v1 + 16), a1);
}

id sub_1B05E7290@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B05E59F4(*(void **)(v1 + 16), a1);
}

unint64_t sub_1B05E7298()
{
  unint64_t result = qword_1E9B35620;
  if (!qword_1E9B35620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35620);
  }
  return result;
}

uint64_t sub_1B05E72F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1B05E61B0(*(long long **)(v1 + 16), a1);
}

unint64_t sub_1B05E7300()
{
  unint64_t result = qword_1E9B35650;
  if (!qword_1E9B35650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35648);
    sub_1B05E7388();
    sub_1B05CBB34(&qword_1E9B352B8, &qword_1E9B352C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35650);
  }
  return result;
}

unint64_t sub_1B05E7388()
{
  unint64_t result = qword_1E9B35658;
  if (!qword_1E9B35658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35660);
    sub_1B05E561C(&qword_1E9B35668, &qword_1E9B35670, (void (*)(void))sub_1B05E7424);
    sub_1B05DA128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35658);
  }
  return result;
}

unint64_t sub_1B05E7424()
{
  unint64_t result = qword_1E9B35678;
  if (!qword_1E9B35678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35678);
  }
  return result;
}

uint64_t sub_1B05E7478(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B05E74A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1B05E74F4()
{
  return sub_1B05E6324();
}

uint64_t sub_1B05E74FC(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for AVCenteredLabelStyle()
{
  return &type metadata for AVCenteredLabelStyle;
}

uint64_t sub_1B05E7560()
{
  return sub_1B05CBB34(&qword_1E9B35690, &qword_1E9B35698);
}

unint64_t sub_1B05E7594()
{
  unint64_t result = qword_1E9B356A0;
  if (!qword_1E9B356A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35628);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35638);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35640);
    sub_1B05CBB34(&qword_1E9B35680, &qword_1E9B35640);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B356A0);
  }
  return result;
}

uint64_t sub_1B05E7674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05E7690()
{
  return sub_1B05CBB34(&qword_1E9B356B8, &qword_1E9B356C0);
}

void *sub_1B05E76C0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    uint64_t v10 = a3[7];
    size_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_1B0705750();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
        memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      uint64_t v20 = *(int *)(v13 + 48);
      uint64_t v21 = &v11[v20];
      uint64_t v22 = &v12[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = *(int *)(v13 + 64);
      uint64_t v25 = &v11[v24];
      uint64_t v26 = &v12[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      long long v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    uint64_t v29 = a3[8];
    uint64_t v30 = a3[9];
    uint64_t v31 = (void *)((char *)a1 + v29);
    long long v32 = (void *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    char v34 = (void *)((char *)a1 + v30);
    char v35 = (void *)((char *)a2 + v30);
    uint64_t v36 = v35[1];
    *char v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = a3[10];
    uint64_t v38 = a3[11];
    uint64_t v39 = (void *)((char *)a1 + v37);
    uint64_t v40 = (void *)((char *)a2 + v37);
    uint64_t v41 = v40[1];
    *uint64_t v39 = *v40;
    v39[1] = v41;
    uint64_t v42 = (char *)a1 + v38;
    uint64_t v43 = (void *)((char *)a2 + v38);
    unint64_t v44 = *(void *)((char *)a2 + v38 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    }
    else
    {
      uint64_t v45 = *v43;
      sub_1B05D4EC8(*v43, v44);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
    }
    uint64_t v46 = a3[13];
    *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    uint64_t v47 = (char *)a1 + v46;
    uint64_t v48 = (char *)a2 + v46;
    *(_DWORD *)uint64_t v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    uint64_t v49 = a3[14];
    uint64_t v50 = a3[15];
    long long v51 = *(void **)((char *)a2 + v49);
    *(void *)((char *)a1 + v49) = v51;
    *((unsigned char *)a1 + v50) = *((unsigned char *)a2 + v50);
    uint64_t v52 = a3[17];
    *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
    *((unsigned char *)a1 + v52) = *((unsigned char *)a2 + v52);
    uint64_t v53 = a3[18];
    uint64_t v54 = a3[19];
    uint64_t v55 = (_OWORD *)((char *)a1 + v53);
    uint64_t v56 = (_OWORD *)((char *)a2 + v53);
    _OWORD *v55 = *v56;
    *(_OWORD *)((char *)v55 + 9) = *(_OWORD *)((char *)v56 + 9);
    uint64_t v57 = (_OWORD *)((char *)a1 + v54);
    uint64_t v58 = (_OWORD *)((char *)a2 + v54);
    _OWORD *v57 = *v58;
    *(_OWORD *)((char *)v57 + 9) = *(_OWORD *)((char *)v58 + 9);
    uint64_t v59 = a3[21];
    *((unsigned char *)a1 + a3[20]) = *((unsigned char *)a2 + a3[20]);
    *((unsigned char *)a1 + v59) = *((unsigned char *)a2 + v59);
    uint64_t v60 = a3[22];
    uint64_t v61 = (char *)a1 + v60;
    uint64_t v62 = (char *)a2 + v60;
    uint64_t v63 = sub_1B0705750();
    uint64_t v64 = *(void *)(v63 - 8);
    uint64_t v65 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48);
    id v66 = v51;
    if (v65(v62, 1, v63))
    {
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v61, v62, *(void *)(*(void *)(v67 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v61, v62, v63);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v61, 0, 1, v63);
    }
    uint64_t v68 = a3[24];
    *((unsigned char *)a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
    uint64_t v69 = (void *)((char *)a1 + v68);
    uint64_t v70 = (void *)((char *)a2 + v68);
    uint64_t v71 = v70[1];
    *uint64_t v69 = *v70;
    v69[1] = v71;
    uint64_t v72 = a3[25];
    uint64_t v73 = a3[26];
    uint64_t v74 = (void *)((char *)a1 + v72);
    uint64_t v75 = (void *)((char *)a2 + v72);
    uint64_t v76 = v75[1];
    *uint64_t v74 = *v75;
    v74[1] = v76;
    uint64_t v77 = (void *)((char *)a1 + v73);
    uint64_t v78 = (void *)((char *)a2 + v73);
    uint64_t v79 = v78[1];
    *uint64_t v77 = *v78;
    v77[1] = v79;
    uint64_t v80 = a3[27];
    uint64_t v81 = a3[28];
    uint64_t v82 = (void *)((char *)a1 + v80);
    uint64_t v83 = (void *)((char *)a2 + v80);
    uint64_t v84 = v83[1];
    void *v82 = *v83;
    v82[1] = v84;
    uint64_t v85 = (void *)((char *)a1 + v81);
    uint64_t v86 = (void *)((char *)a2 + v81);
    uint64_t v87 = v86[1];
    *uint64_t v85 = *v86;
    v85[1] = v87;
    uint64_t v88 = a3[29];
    uint64_t v89 = (char *)a1 + v88;
    uint64_t v90 = (char *)a2 + v88;
    *(_DWORD *)uint64_t v89 = *(_DWORD *)v90;
    v89[4] = v90[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B05E7BF0(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_1B0705750();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t *)(a1 + a2[11]);
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15) {
    sub_1B05D51A0(*v8, v9);
  }

  uint64_t v10 = a1 + a2[22];
  uint64_t v11 = sub_1B0705750();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1B05E7E68(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = sub_1B0705750();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    uint64_t v18 = *(int *)(v12 + 48);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = *(int *)(v12 + 64);
    uint64_t v23 = &v10[v22];
    uint64_t v24 = &v11[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  uint64_t v27 = a3[8];
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)((char *)a1 + v27);
  uint64_t v30 = (void *)((char *)a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  long long v32 = (void *)((char *)a1 + v28);
  uint64_t v33 = (void *)((char *)a2 + v28);
  uint64_t v34 = v33[1];
  *long long v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = a3[10];
  uint64_t v36 = a3[11];
  uint64_t v37 = (void *)((char *)a1 + v35);
  uint64_t v38 = (void *)((char *)a2 + v35);
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  uint64_t v40 = (char *)a1 + v36;
  uint64_t v41 = (void *)((char *)a2 + v36);
  unint64_t v42 = *(void *)((char *)a2 + v36 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  else
  {
    uint64_t v43 = *v41;
    sub_1B05D4EC8(*v41, v42);
    *(void *)uint64_t v40 = v43;
    *((void *)v40 + 1) = v42;
  }
  uint64_t v44 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  uint64_t v47 = a3[14];
  uint64_t v48 = a3[15];
  uint64_t v49 = *(void **)((char *)a2 + v47);
  *(void *)((char *)a1 + v47) = v49;
  *((unsigned char *)a1 + v48) = *((unsigned char *)a2 + v48);
  uint64_t v50 = a3[17];
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  *((unsigned char *)a1 + v50) = *((unsigned char *)a2 + v50);
  uint64_t v51 = a3[18];
  uint64_t v52 = a3[19];
  uint64_t v53 = (_OWORD *)((char *)a1 + v51);
  uint64_t v54 = (_OWORD *)((char *)a2 + v51);
  *uint64_t v53 = *v54;
  *(_OWORD *)((char *)v53 + 9) = *(_OWORD *)((char *)v54 + 9);
  uint64_t v55 = (_OWORD *)((char *)a1 + v52);
  uint64_t v56 = (_OWORD *)((char *)a2 + v52);
  _OWORD *v55 = *v56;
  *(_OWORD *)((char *)v55 + 9) = *(_OWORD *)((char *)v56 + 9);
  uint64_t v57 = a3[21];
  *((unsigned char *)a1 + a3[20]) = *((unsigned char *)a2 + a3[20]);
  *((unsigned char *)a1 + v57) = *((unsigned char *)a2 + v57);
  uint64_t v58 = a3[22];
  uint64_t v59 = (char *)a1 + v58;
  uint64_t v60 = (char *)a2 + v58;
  uint64_t v61 = sub_1B0705750();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48);
  id v64 = v49;
  if (v63(v60, 1, v61))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v59, v60, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v59, v60, v61);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
  }
  uint64_t v66 = a3[24];
  *((unsigned char *)a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
  uint64_t v67 = (void *)((char *)a1 + v66);
  uint64_t v68 = (void *)((char *)a2 + v66);
  uint64_t v69 = v68[1];
  void *v67 = *v68;
  v67[1] = v69;
  uint64_t v70 = a3[25];
  uint64_t v71 = a3[26];
  uint64_t v72 = (void *)((char *)a1 + v70);
  uint64_t v73 = (void *)((char *)a2 + v70);
  uint64_t v74 = v73[1];
  *uint64_t v72 = *v73;
  v72[1] = v74;
  uint64_t v75 = (void *)((char *)a1 + v71);
  uint64_t v76 = (void *)((char *)a2 + v71);
  uint64_t v77 = v76[1];
  void *v75 = *v76;
  v75[1] = v77;
  uint64_t v78 = a3[27];
  uint64_t v79 = a3[28];
  uint64_t v80 = (void *)((char *)a1 + v78);
  uint64_t v81 = (void *)((char *)a2 + v78);
  uint64_t v82 = v81[1];
  *uint64_t v80 = *v81;
  v80[1] = v82;
  uint64_t v83 = (void *)((char *)a1 + v79);
  uint64_t v84 = (void *)((char *)a2 + v79);
  uint64_t v85 = v84[1];
  *uint64_t v83 = *v84;
  v83[1] = v85;
  uint64_t v86 = a3[29];
  uint64_t v87 = (char *)a1 + v86;
  uint64_t v88 = (char *)a2 + v86;
  *(_DWORD *)uint64_t v87 = *(_DWORD *)v88;
  v87[4] = v88[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1B05E8348(void *a1, void *a2, int *a3)
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
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1B05DA364((uint64_t)v7, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v18 = sub_1B0705750();
    uint64_t v98 = *(void *)(v18 - 8);
    uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v98 + 48);
    int v20 = v19(v7, 1, v18);
    int v21 = v19(v8, 1, v18);
    if (v20)
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v7, v8, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v7, 0, 1, v18);
LABEL_16:
        uint64_t v30 = *(int *)(v9 + 48);
        uint64_t v31 = &v7[v30];
        long long v32 = &v8[v30];
        *(void *)uint64_t v31 = *(void *)v32;
        *((void *)v31 + 1) = *((void *)v32 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(int *)(v9 + 64);
        uint64_t v34 = &v7[v33];
        uint64_t v35 = &v8[v33];
        *(void *)uint64_t v34 = *(void *)v35;
        *((void *)v34 + 1) = *((void *)v35 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        (*(void (**)(char *, char *, uint64_t))(v98 + 24))(v7, v8, v18);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v98 + 8))(v7, v18);
    }
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v14 = sub_1B0705750();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  uint64_t v22 = *(int *)(v9 + 48);
  uint64_t v23 = &v7[v22];
  uint64_t v24 = &v8[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = *(int *)(v9 + 64);
  uint64_t v26 = &v7[v25];
  uint64_t v27 = &v8[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v7, 0, 1, v9);
LABEL_17:
  uint64_t v36 = a3[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[9];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[10];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[11];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  unint64_t v48 = *(void *)((char *)a2 + v45 + 8);
  if (*(void *)((char *)a1 + v45 + 8) >> 60 == 15)
  {
    if (v48 >> 60 != 15)
    {
      uint64_t v49 = *v47;
      sub_1B05D4EC8(v49, v48);
      *uint64_t v46 = v49;
      v46[1] = v48;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v48 >> 60 == 15)
  {
    sub_1B05D5FA0((uint64_t)v46);
LABEL_22:
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    goto LABEL_24;
  }
  uint64_t v50 = *v47;
  sub_1B05D4EC8(v50, v48);
  uint64_t v51 = *v46;
  unint64_t v52 = v46[1];
  *uint64_t v46 = v50;
  v46[1] = v48;
  sub_1B05D51A0(v51, v52);
LABEL_24:
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  uint64_t v53 = a3[13];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  int v56 = *(_DWORD *)v55;
  v54[4] = v55[4];
  *(_DWORD *)uint64_t v54 = v56;
  uint64_t v57 = a3[14];
  uint64_t v58 = *(void **)((char *)a1 + v57);
  uint64_t v59 = *(void **)((char *)a2 + v57);
  *(void *)((char *)a1 + v57) = v59;
  id v60 = v59;

  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  uint64_t v61 = a3[18];
  uint64_t v62 = (_OWORD *)((char *)a1 + v61);
  uint64_t v63 = (long long *)((char *)a2 + v61);
  long long v64 = *v63;
  *(_OWORD *)((char *)v62 + 9) = *(long long *)((char *)v63 + 9);
  *uint64_t v62 = v64;
  uint64_t v65 = a3[19];
  uint64_t v66 = (_OWORD *)((char *)a1 + v65);
  uint64_t v67 = (long long *)((char *)a2 + v65);
  long long v68 = *v67;
  *(_OWORD *)((char *)v66 + 9) = *(long long *)((char *)v67 + 9);
  _OWORD *v66 = v68;
  *((unsigned char *)a1 + a3[20]) = *((unsigned char *)a2 + a3[20]);
  *((unsigned char *)a1 + a3[21]) = *((unsigned char *)a2 + a3[21]);
  uint64_t v69 = a3[22];
  uint64_t v70 = (char *)a1 + v69;
  uint64_t v71 = (char *)a2 + v69;
  uint64_t v72 = sub_1B0705750();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
  int v75 = v74(v70, 1, v72);
  int v76 = v74(v71, 1, v72);
  if (!v75)
  {
    if (!v76)
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 24))(v70, v71, v72);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
    goto LABEL_29;
  }
  if (v76)
  {
LABEL_29:
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v70, v71, *(void *)(*(void *)(v77 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v70, v71, v72);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
LABEL_30:
  *((unsigned char *)a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
  uint64_t v78 = a3[24];
  uint64_t v79 = (void *)((char *)a1 + v78);
  uint64_t v80 = (void *)((char *)a2 + v78);
  *uint64_t v79 = *v80;
  v79[1] = v80[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v81 = a3[25];
  uint64_t v82 = (void *)((char *)a1 + v81);
  uint64_t v83 = (void *)((char *)a2 + v81);
  void *v82 = *v83;
  v82[1] = v83[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = a3[26];
  uint64_t v85 = (void *)((char *)a1 + v84);
  uint64_t v86 = (void *)((char *)a2 + v84);
  *uint64_t v85 = *v86;
  v85[1] = v86[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v87 = a3[27];
  uint64_t v88 = (void *)((char *)a1 + v87);
  uint64_t v89 = (void *)((char *)a2 + v87);
  *uint64_t v88 = *v89;
  v88[1] = v89[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v90 = a3[28];
  uint64_t v91 = (void *)((char *)a1 + v90);
  int v92 = (void *)((char *)a2 + v90);
  *uint64_t v91 = *v92;
  v91[1] = v92[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v93 = a3[29];
  uint64_t v94 = (char *)a1 + v93;
  uint64_t v95 = (char *)a2 + v93;
  int v96 = *(_DWORD *)v95;
  v94[4] = v95[4];
  *(_DWORD *)uint64_t v94 = v96;
  return a1;
}

_OWORD *sub_1B05E8BA4(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_1B0705750();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v8, v9, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v8, 0, 1, v13);
    }
    *(_OWORD *)&v8[*(int *)(v10 + 48)] = *(_OWORD *)&v9[*(int *)(v10 + 48)];
    *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v16 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  uint64_t v17 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  uint64_t v18 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  uint64_t v19 = (char *)a1 + v18;
  int v20 = (char *)a2 + v18;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
  v19[4] = v20[4];
  uint64_t v21 = a3[15];
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  uint64_t v22 = a3[17];
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
  uint64_t v23 = a3[18];
  uint64_t v24 = a3[19];
  uint64_t v25 = (_OWORD *)((char *)a1 + v23);
  uint64_t v26 = (_OWORD *)((char *)a2 + v23);
  *uint64_t v25 = *v26;
  *(_OWORD *)((char *)v25 + 9) = *(_OWORD *)((char *)v26 + 9);
  uint64_t v27 = (_OWORD *)((char *)a1 + v24);
  uint64_t v28 = (_OWORD *)((char *)a2 + v24);
  *uint64_t v27 = *v28;
  *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v28 + 9);
  uint64_t v29 = a3[21];
  *((unsigned char *)a1 + a3[20]) = *((unsigned char *)a2 + a3[20]);
  *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
  uint64_t v30 = a3[22];
  uint64_t v31 = (char *)a1 + v30;
  long long v32 = (char *)a2 + v30;
  uint64_t v33 = sub_1B0705750();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  uint64_t v36 = a3[24];
  *((unsigned char *)a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
  *(_OWORD *)((char *)a1 + v36) = *(_OWORD *)((char *)a2 + v36);
  uint64_t v37 = a3[26];
  *(_OWORD *)((char *)a1 + a3[25]) = *(_OWORD *)((char *)a2 + a3[25]);
  *(_OWORD *)((char *)a1 + v37) = *(_OWORD *)((char *)a2 + v37);
  uint64_t v38 = a3[28];
  *(_OWORD *)((char *)a1 + a3[27]) = *(_OWORD *)((char *)a2 + a3[27]);
  *(_OWORD *)((char *)a1 + v38) = *(_OWORD *)((char *)a2 + v38);
  uint64_t v39 = a3[29];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  *(_DWORD *)uint64_t v40 = *(_DWORD *)v41;
  v40[4] = v41[4];
  return a1;
}

void *sub_1B05E8FA0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1B05DA364((uint64_t)v10, &qword_1E9B34D30);
      goto LABEL_7;
    }
    uint64_t v21 = sub_1B0705750();
    uint64_t v108 = *(void *)(v21 - 8);
    uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v108 + 48);
    int v23 = v22(v10, 1, v21);
    int v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v10, v11, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v108 + 56))(v10, 0, 1, v21);
LABEL_16:
        uint64_t v26 = *(int *)(v12 + 48);
        uint64_t v27 = &v10[v26];
        uint64_t v28 = &v11[v26];
        uint64_t v30 = *(void *)v28;
        uint64_t v29 = *((void *)v28 + 1);
        *(void *)uint64_t v27 = v30;
        *((void *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        uint64_t v31 = *(int *)(v12 + 64);
        long long v32 = &v10[v31];
        uint64_t v33 = &v11[v31];
        uint64_t v35 = *(void *)v33;
        uint64_t v34 = *((void *)v33 + 1);
        *(void *)long long v32 = v35;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v108 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v108 + 8))(v10, v21);
    }
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v17 = sub_1B0705750();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  uint64_t v36 = a3[8];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[9];
  uint64_t v42 = (void *)((char *)a1 + v41);
  uint64_t v43 = (void *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[10];
  uint64_t v47 = (void *)((char *)a1 + v46);
  unint64_t v48 = (void *)((char *)a2 + v46);
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[11];
  uint64_t v52 = (uint64_t)a1 + v51;
  uint64_t v53 = (char *)a2 + v51;
  unint64_t v54 = *(void *)((char *)a1 + v51 + 8);
  if (v54 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
    goto LABEL_22;
  }
  unint64_t v55 = *((void *)v53 + 1);
  if (v55 >> 60 == 15)
  {
    sub_1B05D5FA0(v52);
    goto LABEL_20;
  }
  uint64_t v56 = *(void *)v52;
  *(void *)uint64_t v52 = *(void *)v53;
  *(void *)(v52 + 8) = v55;
  sub_1B05D51A0(v56, v54);
LABEL_22:
  uint64_t v57 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  uint64_t v58 = (char *)a1 + v57;
  uint64_t v59 = (char *)a2 + v57;
  *(_DWORD *)uint64_t v58 = *(_DWORD *)v59;
  v58[4] = v59[4];
  uint64_t v60 = a3[14];
  uint64_t v61 = *(void **)((char *)a1 + v60);
  *(void *)((char *)a1 + v60) = *(void *)((char *)a2 + v60);

  uint64_t v62 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + v62) = *((unsigned char *)a2 + v62);
  uint64_t v63 = a3[18];
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  long long v64 = (_OWORD *)((char *)a1 + v63);
  uint64_t v65 = (_OWORD *)((char *)a2 + v63);
  *(_OWORD *)((char *)v64 + 9) = *(_OWORD *)((char *)v65 + 9);
  _OWORD *v64 = *v65;
  uint64_t v66 = a3[19];
  uint64_t v67 = a3[20];
  long long v68 = (_OWORD *)((char *)a1 + v66);
  uint64_t v69 = (_OWORD *)((char *)a2 + v66);
  *long long v68 = *v69;
  *(_OWORD *)((char *)v68 + 9) = *(_OWORD *)((char *)v69 + 9);
  *((unsigned char *)a1 + v67) = *((unsigned char *)a2 + v67);
  uint64_t v70 = a3[22];
  *((unsigned char *)a1 + a3[21]) = *((unsigned char *)a2 + a3[21]);
  uint64_t v71 = (char *)a1 + v70;
  uint64_t v72 = (char *)a2 + v70;
  uint64_t v73 = sub_1B0705750();
  uint64_t v74 = *(void *)(v73 - 8);
  int v75 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 48);
  int v76 = v75(v71, 1, v73);
  int v77 = v75(v72, 1, v73);
  if (!v76)
  {
    if (!v77)
    {
      (*(void (**)(char *, char *, uint64_t))(v74 + 40))(v71, v72, v73);
      goto LABEL_28;
    }
    (*(void (**)(char *, uint64_t))(v74 + 8))(v71, v73);
    goto LABEL_27;
  }
  if (v77)
  {
LABEL_27:
    uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    memcpy(v71, v72, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v71, v72, v73);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56))(v71, 0, 1, v73);
LABEL_28:
  uint64_t v79 = a3[24];
  *((unsigned char *)a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
  uint64_t v80 = (void *)((char *)a1 + v79);
  uint64_t v81 = (void *)((char *)a2 + v79);
  uint64_t v83 = *v81;
  uint64_t v82 = v81[1];
  *uint64_t v80 = v83;
  v80[1] = v82;
  swift_bridgeObjectRelease();
  uint64_t v84 = a3[25];
  uint64_t v85 = (void *)((char *)a1 + v84);
  uint64_t v86 = (void *)((char *)a2 + v84);
  uint64_t v88 = *v86;
  uint64_t v87 = v86[1];
  *uint64_t v85 = v88;
  v85[1] = v87;
  swift_bridgeObjectRelease();
  uint64_t v89 = a3[26];
  uint64_t v90 = (void *)((char *)a1 + v89);
  uint64_t v91 = (void *)((char *)a2 + v89);
  uint64_t v93 = *v91;
  uint64_t v92 = v91[1];
  *uint64_t v90 = v93;
  v90[1] = v92;
  swift_bridgeObjectRelease();
  uint64_t v94 = a3[27];
  uint64_t v95 = (void *)((char *)a1 + v94);
  int v96 = (void *)((char *)a2 + v94);
  uint64_t v98 = *v96;
  uint64_t v97 = v96[1];
  void *v95 = v98;
  v95[1] = v97;
  swift_bridgeObjectRelease();
  uint64_t v99 = a3[28];
  uint64_t v100 = (void *)((char *)a1 + v99);
  unsigned int v101 = (void *)((char *)a2 + v99);
  uint64_t v103 = *v101;
  uint64_t v102 = v101[1];
  void *v100 = v103;
  v100[1] = v102;
  swift_bridgeObjectRelease();
  uint64_t v104 = a3[29];
  uint64_t v105 = (char *)a1 + v104;
  uint64_t v106 = (char *)a2 + v104;
  *(_DWORD *)uint64_t v105 = *(_DWORD *)v106;
  v105[4] = v106[4];
  return a1;
}

uint64_t sub_1B05E96B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B05E96C8);
}

uint64_t sub_1B05E96C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a1 + *(int *)(a3 + 28);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = a1 + *(int *)(a3 + 88);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_1B05E9808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B05E981C);
}

uint64_t sub_1B05E981C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 88);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for MediaInfo()
{
  uint64_t result = qword_1E9B34E90;
  if (!qword_1E9B34E90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B05E999C()
{
  sub_1B05E9AE4();
  if (v0 <= 0x3F)
  {
    sub_1B05D970C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1B05E9AE4()
{
  if (!qword_1E9B34D40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B34D30);
    unint64_t v0 = sub_1B0706150();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9B34D40);
    }
  }
}

void sub_1B05E9B40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return;
  }
  unint64_t v4 = self;
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = *(id *)(a1 + 8 * v5 + 32);
    id v7 = objc_msgSend(v1, sel_externalMetadata);
    if (!v7)
    {
      sub_1B05F5D00(0, &qword_1E9B34DE8);
      sub_1B0706080();
      id v7 = (id)sub_1B0706070();
      swift_bridgeObjectRelease();
    }
    id v8 = objc_msgSend(v4, sel_metadataItemsFromArray_filteredByIdentifier_, v7, v6);

    sub_1B05F5D00(0, &qword_1E9B34DE8);
    unint64_t v9 = sub_1B0706080();

    if (v9 >> 62) {
      break;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_10;
    }
LABEL_7:
    ++v5;
    swift_bridgeObjectRelease();

    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1B0706200();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_7;
  }
LABEL_10:
  if ((v9 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1B3E95340](0, v9);
LABEL_13:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v11 = *(id *)(v9 + 32);
      goto LABEL_13;
    }
    __break(1u);
  }
}

uint64_t sub_1B05E9D1C()
{
  v1[3] = v0;
  sub_1B07060B0();
  v1[4] = sub_1B07060A0();
  uint64_t v3 = sub_1B0706090();
  v1[5] = v3;
  v1[6] = v2;
  return MEMORY[0x1F4188298](sub_1B05E9DB4, v3, v2);
}

uint64_t sub_1B05E9DB4()
{
  *(void *)(v0 + 56) = objc_msgSend(*(id *)(v0 + 24), sel_asset);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D70);
  uint64_t v1 = sub_1B07057F0();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  void *v2 = v0;
  v2[1] = sub_1B05E9E9C;
  return MEMORY[0x1F4182DC0](v0 + 16, v1);
}

uint64_t sub_1B05E9E9C()
{
  uint64_t v3 = *v1;
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v4 = *(void **)(v2 + 56);
  if (v0)
  {

    swift_release();
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    id v7 = sub_1B05EA0A0;
  }
  else
  {
    swift_release();

    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    id v7 = sub_1B05EA004;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1B05EA004()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)*MEMORY[0x1E4F15B80];
  char v3 = sub_1B05EA104((uint64_t)v2, v1);

  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4(v3 & 1);
}

uint64_t sub_1B05EA0A0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1B05EA104(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1B0706040();
  uint64_t v5 = v4;
  if (v3 == sub_1B0706040() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_1B0706220();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_1B0706040();
    uint64_t v14 = v13;
    if (v12 == sub_1B0706040() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_1B0706220();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B05EA25C()
{
  v1[3] = v0;
  sub_1B07060B0();
  v1[4] = sub_1B07060A0();
  uint64_t v3 = sub_1B0706090();
  v1[5] = v3;
  v1[6] = v2;
  return MEMORY[0x1F4188298](sub_1B05EA2F4, v3, v2);
}

uint64_t sub_1B05EA2F4()
{
  *(void *)(v0 + 56) = objc_msgSend(*(id *)(v0 + 24), sel_asset);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D70);
  uint64_t v1 = sub_1B07057F0();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  void *v2 = v0;
  v2[1] = sub_1B05EA3DC;
  return MEMORY[0x1F4182DC0](v0 + 16, v1);
}

uint64_t sub_1B05EA3DC()
{
  uint64_t v3 = *v1;
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v4 = *(void **)(v2 + 56);
  if (v0)
  {

    swift_release();
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    id v7 = sub_1B05F64B8;
  }
  else
  {
    swift_release();

    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    id v7 = sub_1B05EA544;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1B05EA544()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)*MEMORY[0x1E4F15B00];
  char v3 = sub_1B05EA104((uint64_t)v2, v1);

  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4(v3 & 1);
}

char *sub_1B05EA5E0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B0706200();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B05EE22C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x1B3E95340](i, a1);
        sub_1B05F5D00(0, &qword_1E9B34E38);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B05EE22C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1B05EE22C((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_1B05F5CF0(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      char v8 = (id *)(a1 + 32);
      sub_1B05F5D00(0, &qword_1E9B34E38);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B05EE22C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1B05EE22C((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_1B05F5CF0(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B05EA844()
{
  uint64_t result = sub_1B0706010();
  qword_1E9B3A348 = result;
  return result;
}

uint64_t sub_1B05EA87C()
{
  uint64_t result = sub_1B0706010();
  qword_1E9B3A380 = result;
  return result;
}

uint64_t sub_1B05EA8B4()
{
  uint64_t result = sub_1B0706010();
  qword_1E9B3A350 = result;
  return result;
}

uint64_t sub_1B05EA8EC()
{
  uint64_t result = sub_1B0706010();
  qword_1E9B3A340 = result;
  return result;
}

BOOL sub_1B05EA92C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_1B05EA940(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_1B05EA954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_1B05EA968(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

BOOL sub_1B05EA97C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B05EA990()
{
  return sub_1B0706250();
}

uint64_t sub_1B05EA9D8()
{
  return sub_1B0706240();
}

uint64_t sub_1B05EAA04()
{
  return sub_1B0706250();
}

unint64_t sub_1B05EAA48@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1B05F1980(*a1);
  *a2 = result;
  return result;
}

void sub_1B05EAA74(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1B05EAA80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, int a19, char a20,uint64_t a21,char a22,char a23,char a24,long long a25,uint64_t a26,char a27,long long a28,uint64_t a29,char a30,char a31,char a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45,char a46)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  uint64_t v47 = (int *)type metadata accessor for MediaInfo();
  sub_1B05DA3C0(a7, (uint64_t)a9 + v47[7], &qword_1E9B34D38);
  unint64_t v48 = (void *)((char *)a9 + v47[8]);
  *unint64_t v48 = a8;
  v48[1] = a10;
  uint64_t v49 = (void *)((char *)a9 + v47[9]);
  *uint64_t v49 = a11;
  v49[1] = a12;
  uint64_t v50 = (void *)((char *)a9 + v47[10]);
  *uint64_t v50 = a13;
  v50[1] = a14;
  uint64_t v51 = (void *)((char *)a9 + v47[11]);
  *uint64_t v51 = a15;
  v51[1] = a16;
  *((unsigned char *)a9 + v47[12]) = a17;
  uint64_t v52 = (char *)a9 + v47[13];
  v52[4] = a20;
  *(_DWORD *)uint64_t v52 = a19;
  *(void *)((char *)a9 + v47[14]) = a21;
  *((unsigned char *)a9 + v47[15]) = a22;
  *((unsigned char *)a9 + v47[16]) = a23;
  *((unsigned char *)a9 + v47[17]) = a24;
  uint64_t v53 = (char *)a9 + v47[18];
  *(_OWORD *)uint64_t v53 = a25;
  *((void *)v53 + 2) = a26;
  v53[24] = a27 & 1;
  unint64_t v54 = (char *)a9 + v47[19];
  *(_OWORD *)unint64_t v54 = a28;
  *((void *)v54 + 2) = a29;
  v54[24] = a30 & 1;
  *((unsigned char *)a9 + v47[20]) = a31;
  *((unsigned char *)a9 + v47[21]) = a32;
  uint64_t result = sub_1B05DA3C0(a33, (uint64_t)a9 + v47[22], &qword_1E9B34D48);
  *((unsigned char *)a9 + v47[23]) = a34;
  uint64_t v56 = (void *)((char *)a9 + v47[24]);
  void *v56 = a35;
  v56[1] = a36;
  uint64_t v57 = (void *)((char *)a9 + v47[25]);
  void *v57 = a37;
  v57[1] = a38;
  uint64_t v58 = (void *)((char *)a9 + v47[26]);
  void *v58 = a39;
  v58[1] = a40;
  uint64_t v59 = (void *)((char *)a9 + v47[27]);
  *uint64_t v59 = a41;
  v59[1] = a42;
  uint64_t v60 = (void *)((char *)a9 + v47[28]);
  *uint64_t v60 = a43;
  v60[1] = a44;
  uint64_t v61 = (char *)a9 + v47[29];
  *(_DWORD *)uint64_t v61 = a45;
  v61[4] = a46 & 1;
  return result;
}

uint64_t sub_1B05EAD5C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  return MEMORY[0x1F4188298](sub_1B05EAD7C, 0, 0);
}

uint64_t sub_1B05EAD7C()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = sub_1B0705750();
  v0[23] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v0[24] = v4;
  v0[25] = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v4(v1, 1, 1, v2);
  uint64_t v5 = self;
  sub_1B0706040();
  unint64_t v6 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_identifierForKey_keySpace_, v6, *MEMORY[0x1E4F15DE0]);
  v0[26] = v7;

  if (v7)
  {
    sub_1B0706040();
    char v8 = (void *)sub_1B0706010();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v5, sel_identifierForKey_keySpace_, v8, *MEMORY[0x1E4F15DF8]);
    v0[27] = v9;

    if (v9)
    {
      sub_1B0706040();
      unint64_t v10 = (void *)sub_1B0706010();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v5, sel_identifierForKey_keySpace_, v10, *MEMORY[0x1E4F15E08]);
      v0[28] = v11;

      if (v11)
      {
        sub_1B0706040();
        uint64_t v12 = (void *)sub_1B0706010();
        swift_bridgeObjectRelease();
        id v13 = objc_msgSend(v5, sel_identifierForKey_keySpace_, v12, *MEMORY[0x1E4F15DE8]);
        v0[29] = v13;

        if (v13)
        {
          sub_1B0706040();
          uint64_t v14 = (void *)sub_1B0706010();
          swift_bridgeObjectRelease();
          id v15 = objc_msgSend(v5, sel_identifierForKey_keySpace_, v14, *MEMORY[0x1E4F15DF0]);
          v0[30] = v15;

          if (v15)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
            uint64_t inited = swift_initStackObject();
            v0[31] = inited;
            *(_OWORD *)(inited + 16) = xmmword_1B0720720;
            *(void *)(inited + 32) = v7;
            *(void *)(inited + 40) = v9;
            *(void *)(inited + 48) = v11;
            *(void *)(inited + 56) = v13;
            *(void *)(inited + 64) = v15;
            v0[32] = sub_1B07060B0();
            id v17 = v7;
            id v18 = v9;
            id v19 = v11;
            id v20 = v13;
            id v21 = v15;
            v0[33] = sub_1B07060A0();
            uint64_t v22 = sub_1B0706090();
            uint64_t v24 = v23;
            uint64_t v25 = sub_1B05EB158;
            goto LABEL_14;
          }
        }
      }
    }
  }
  v0[50] = 0;
  v0[51] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t v26 = swift_initStackObject();
  v0[52] = v26;
  *(_OWORD *)(v26 + 16) = xmmword_1B0720730;
  if (qword_1E9B34E08 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)qword_1E9B3A340;
  *(void *)(v26 + 32) = qword_1E9B3A340;
  sub_1B07060B0();
  id v28 = v27;
  v0[53] = sub_1B07060A0();
  uint64_t v22 = sub_1B0706090();
  uint64_t v24 = v29;
  uint64_t v25 = sub_1B05EBF9C;
LABEL_14:
  return MEMORY[0x1F4188298](v25, v22, v24);
}

uint64_t sub_1B05EB158()
{
  uint64_t v1 = *(void *)(v0 + 248);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 272) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05EB204, 0, 0);
}

uint64_t sub_1B05EB204()
{
  if (v0[34])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    uint64_t v1 = swift_task_alloc();
    v0[35] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35748);
    uint64_t v2 = sub_1B07057E0();
    v0[36] = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_1B05EB3A0;
    return MEMORY[0x1F4182DC0](v1, v2);
  }
  else
  {
    v0[40] = 0;
    v0[41] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
    v0[42] = swift_task_alloc();
    v0[43] = sub_1B07060A0();
    uint64_t v5 = sub_1B0706090();
    return MEMORY[0x1F4188298](sub_1B05EB7F4, v5, v4);
  }
}

uint64_t sub_1B05EB3A0()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05EC304;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05EB4E8;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05EB4E8()
{
  sub_1B05DA364(v0[21], &qword_1E9B34D48);
  sub_1B05DA3C0(v0[35], v0[21], &qword_1E9B34D48);
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
  uint64_t v1 = sub_1B07057C0();
  v0[38] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[39] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1B05EB5E0;
  return MEMORY[0x1F4182DC0](v0 + 18, v1);
}

uint64_t sub_1B05EB5E0()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05EC428;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05EB728;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05EB728()
{
  *(_OWORD *)(v0 + 320) = *(_OWORD *)(v0 + 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  *(void *)(v0 + 336) = swift_task_alloc();
  *(void *)(v0 + 344) = sub_1B07060A0();
  uint64_t v2 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05EB7F4, v2, v1);
}

uint64_t sub_1B05EB7F4()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_release();
  *(void *)(v0 + 352) = objc_msgSend(v1, sel_asset);
  return MEMORY[0x1F4188298](sub_1B05EB87C, 0, 0);
}

uint64_t sub_1B05EB87C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D78);
  uint64_t v1 = sub_1B0705800();
  *(void *)(v0 + 360) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v2;
  void *v2 = v0;
  v2[1] = sub_1B05EB944;
  return MEMORY[0x1F4182DC0](v0 + 160, v1);
}

uint64_t sub_1B05EB944()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(void **)(v2 + 352);
  if (v0)
  {

    swift_release();
    uint64_t v4 = sub_1B05EC4F0;
  }
  else
  {
    swift_release();

    uint64_t v4 = sub_1B05EBAA8;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1B05EBAA8()
{
  uint64_t v1 = *(void *)(v0 + 160);
  *(void *)(v0 + 376) = v1;
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35748);
    uint64_t v2 = sub_1B07057E0();
    *(void *)(v0 + 384) = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 392) = v3;
    void *v3 = v0;
    v3[1] = sub_1B05EBCF4;
    uint64_t v4 = *(void *)(v0 + 336);
    return MEMORY[0x1F4182DC0](v4, v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 336);
    uint64_t v7 = *(void **)(v0 + 232);
    uint64_t v6 = *(void **)(v0 + 240);
    id v9 = *(void **)(v0 + 216);
    char v8 = *(void **)(v0 + 224);
    unint64_t v10 = *(void **)(v0 + 208);
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 192);
    sub_1B05DA364(*(void *)(v0 + 168), &qword_1E9B34D48);

    v12(v5, 1, 1, v11);
    sub_1B05DA3C0(*(void *)(v0 + 336), *(void *)(v0 + 168), &qword_1E9B34D48);
    swift_task_dealloc();
    *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 320);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
    uint64_t inited = swift_initStackObject();
    *(void *)(v0 + 416) = inited;
    *(_OWORD *)(inited + 16) = xmmword_1B0720730;
    if (qword_1E9B34E08 != -1) {
      swift_once();
    }
    uint64_t v14 = (void *)qword_1E9B3A340;
    *(void *)(inited + 32) = qword_1E9B3A340;
    sub_1B07060B0();
    id v15 = v14;
    *(void *)(v0 + 424) = sub_1B07060A0();
    uint64_t v17 = sub_1B0706090();
    return MEMORY[0x1F4188298](sub_1B05EBF9C, v17, v16);
  }
}

uint64_t sub_1B05EBCF4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 376);

    swift_release();
    uint64_t v4 = sub_1B05F64A8;
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 376);
    swift_release();

    uint64_t v4 = sub_1B05EBE30;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1B05EBE30()
{
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v3 = *(void **)(v0 + 216);
  uint64_t v2 = *(void **)(v0 + 224);
  uint64_t v4 = *(void **)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 168);

  sub_1B05DA364(v5, &qword_1E9B34D48);
  sub_1B05DA3C0(*(void *)(v0 + 336), *(void *)(v0 + 168), &qword_1E9B34D48);
  swift_task_dealloc();
  *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 320);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 416) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  if (qword_1E9B34E08 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_1E9B3A340;
  *(void *)(inited + 32) = qword_1E9B3A340;
  sub_1B07060B0();
  id v8 = v7;
  *(void *)(v0 + 424) = sub_1B07060A0();
  uint64_t v10 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05EBF9C, v10, v9);
}

uint64_t sub_1B05EBF9C()
{
  uint64_t v1 = *(void *)(v0 + 416);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 432) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05EC044, 0, 0);
}

uint64_t sub_1B05EC044()
{
  if (v0[54])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[55] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[56] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05EC154;
    return MEMORY[0x1F4182DC0](v0 + 16, v1);
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, void, void))v0[1];
    uint64_t v4 = v0[50];
    uint64_t v5 = v0[51];
    return v3(v4, v5, 0, 0);
  }
}

uint64_t sub_1B05EC154()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05EC68C;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05EC29C;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05EC29C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 400);
  uint64_t v5 = *(void *)(v0 + 408);
  return v3(v4, v5, v1, v2);
}

uint64_t sub_1B05EC304()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[24];
  uint64_t v3 = v0[23];
  sub_1B05DA364(v0[21], &qword_1E9B34D48);
  v2(v1, 1, 1, v3);
  sub_1B05DA3C0(v0[35], v0[21], &qword_1E9B34D48);
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
  uint64_t v4 = sub_1B07057C0();
  v0[38] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[39] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1B05EB5E0;
  return MEMORY[0x1F4182DC0](v0 + 18, v4);
}

uint64_t sub_1B05EC428()
{
  *(void *)(v0 + 320) = 0;
  *(void *)(v0 + 328) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  *(void *)(v0 + 336) = swift_task_alloc();
  *(void *)(v0 + 344) = sub_1B07060A0();
  uint64_t v2 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05EB7F4, v2, v1);
}

uint64_t sub_1B05EC4F0()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v3 = *(void **)(v0 + 232);
  uint64_t v2 = *(void **)(v0 + 240);
  uint64_t v5 = *(void **)(v0 + 216);
  uint64_t v4 = *(void **)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 184);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 168);

  sub_1B05DA364(v8, &qword_1E9B34D48);
  v6(v1, 1, 1, v7);
  sub_1B05DA3C0(*(void *)(v0 + 336), *(void *)(v0 + 168), &qword_1E9B34D48);
  swift_task_dealloc();
  *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 320);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 416) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  if (qword_1E9B34E08 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_1E9B3A340;
  *(void *)(inited + 32) = qword_1E9B3A340;
  sub_1B07060B0();
  id v11 = v10;
  *(void *)(v0 + 424) = sub_1B07060A0();
  uint64_t v13 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05EBF9C, v13, v12);
}

uint64_t sub_1B05EC68C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 408);
  return v1(v2, v3, 0, 0);
}

uint64_t sub_1B05EC6F8(uint64_t a1, uint64_t a2)
{
  v2[28] = a1;
  v2[29] = a2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B356D8 + dword_1E9B356D8);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[30] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B05EC7A4;
  return v6(a2);
}

uint64_t sub_1B05EC7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  *(void *)(v4 + 248) = v6;
  *(void *)(v4 + 256) = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v4 + 264) = v7;
  *(_DWORD *)(v4 + 536) = *(_DWORD *)(v6 + 48);
  *(_DWORD *)(v4 + 540) = *(_DWORD *)(v6 + 64);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 272) = v8;
  void *v8 = v5;
  v8[1] = sub_1B05EC98C;
  uint64_t v9 = *(void *)(v3 + 232);
  v8[21] = v7;
  v8[22] = v9;
  return MEMORY[0x1F4188298](sub_1B05EAD7C, 0, 0);
}

uint64_t sub_1B05EC98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)*v4;
  uint64_t v10 = (void *)*v4;
  uint64_t v11 = *(int *)(*v4 + 540);
  uint64_t v12 = *(int *)(*v4 + 536);
  uint64_t v13 = *(void *)(*v4 + 264);
  uint64_t v20 = *v4;
  v10[35] = a1;
  v10[36] = a2;
  uint64_t v14 = (void *)(v13 + v11);
  uint64_t v15 = (void *)(v13 + v12);
  v10[37] = a3;
  v10[38] = a4;
  swift_task_dealloc();
  void *v15 = a1;
  v15[1] = a2;
  void *v14 = a3;
  v14[1] = a4;
  uint64_t v19 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B356E8 + dword_1E9B356E8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)swift_task_alloc();
  v10[39] = v16;
  void *v16 = v20;
  v16[1] = sub_1B05ECB58;
  uint64_t v17 = v9[29];
  return v19(v17);
}

uint64_t sub_1B05ECB58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[5] = v2;
  void v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))&aDB[*(int *)aDB];
  uint64_t v6 = (void *)swift_task_alloc();
  v4[40] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_1B05ECCB8;
  uint64_t v7 = v3[29];
  return v9(v7);
}

uint64_t sub_1B05ECCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[8] = v2;
  v4[9] = a1;
  v4[10] = a2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B356F8 + dword_1E9B356F8);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[41] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_1B05ECE18;
  uint64_t v7 = v3[29];
  return v9(v7);
}

uint64_t sub_1B05ECE18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[11] = v2;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B35700 + dword_1E9B35700);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[42] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_1B05ECF78;
  uint64_t v7 = v3[29];
  return v9(v7);
}

uint64_t sub_1B05ECF78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[14] = v2;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))&aPib[*(int *)aPib];
  uint64_t v6 = (void *)swift_task_alloc();
  v4[43] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_1B05ED0D8;
  uint64_t v7 = v3[29];
  return v9(v7);
}

uint64_t sub_1B05ED0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[17] = v2;
  v3[18] = a1;
  v3[19] = a2;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B05ED1DC, 0, 0);
}

uint64_t sub_1B05ED1DC()
{
  if (objc_msgSend(*(id *)(v0 + 232), sel_hasEnabledAudio)
    && !objc_msgSend(*(id *)(v0 + 232), sel_hasEnabledVideo))
  {
    char v1 = 1;
  }
  else
  {
    char v1 = 2;
  }
  *(unsigned char *)(v0 + 552) = v1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B35710 + dword_1E9B35710);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v2;
  void *v2 = v0;
  v2[1] = sub_1B05ED2BC;
  uint64_t v3 = *(void *)(v0 + 232);
  return v5(v3);
}

uint64_t sub_1B05ED2BC(uint64_t a1)
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v3[20] = v1;
  v3[21] = a1;
  uint64_t v4 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B35718 + dword_1E9B35718);
  uint64_t v5 = (void *)swift_task_alloc();
  v3[45] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1B05ED418;
  uint64_t v6 = v2[29];
  return v8(v6);
}

uint64_t sub_1B05ED418(uint64_t a1)
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v3[22] = v1;
  v3[23] = a1;
  uint64_t v4 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B35720 + dword_1E9B35720);
  uint64_t v5 = (void *)swift_task_alloc();
  v3[46] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1B05ED574;
  uint64_t v6 = v2[29];
  return v8(v6);
}

uint64_t sub_1B05ED574(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(v2 + 200) = a1;
  *(void *)(v2 + 192) = v1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B05ED678, 0, 0);
}

uint64_t sub_1B05ED678()
{
  *(unsigned char *)(v0 + 553) = sub_1B05F4DF0(*(void **)(v0 + 232));
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_1E9B35728 + dword_1E9B35728);
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v1;
  void *v1 = v0;
  v1[1] = sub_1B05ED72C;
  uint64_t v2 = *(void *)(v0 + 232);
  return v4(v2);
}

uint64_t sub_1B05ED72C(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(v2 + 216) = a1;
  *(void *)(v2 + 208) = v1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B05ED830, 0, 0);
}

uint64_t sub_1B05ED830()
{
  char v12 = *(unsigned char *)(v0 + 216);
  char v1 = *(unsigned char *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v17 = *(void *)(v0 + 120);
  uint64_t v18 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v15 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v9 = *(void *)(v0 + 32);
  uint64_t v13 = *(void *)(v0 + 24);
  uint64_t v14 = *(void *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 232), sel_duration);
  *(_DWORD *)(v0 + 544) = v20;
  *(_DWORD *)(v0 + 548) = v21;
  *(void *)(v0 + 384) = v19;
  *(void *)(v0 + 392) = v22;
  *(unsigned char *)(v0 + 554) = sub_1B0706120() & 1;
  *(unsigned char *)(v0 + 555) = v12;
  *(unsigned char *)(v0 + 556) = v1;
  *(void *)(v0 + 400) = v2;
  *(void *)(v0 + 408) = v3;
  *(void *)(v0 + 416) = v4;
  *(void *)(v0 + 424) = v18;
  *(void *)(v0 + 432) = v5;
  *(void *)(v0 + 440) = v17;
  *(void *)(v0 + 448) = v6;
  *(void *)(v0 + 456) = v16;
  *(void *)(v0 + 464) = v7;
  *(void *)(v0 + 472) = v15;
  *(void *)(v0 + 480) = v8;
  *(void *)(v0 + 488) = v14;
  *(void *)(v0 + 496) = v9;
  *(void *)(v0 + 504) = v13;
  *(void *)(v0 + 512) = sub_1B07060B0();
  sub_1B07060A0();
  swift_release();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 520) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1B05ED9AC;
  return sub_1B05E9D1C();
}

uint64_t sub_1B05ED9AC(char a1)
{
  *(unsigned char *)(*(void *)v1 + 557) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B05EDAAC, 0, 0);
}

uint64_t sub_1B05EDAAC()
{
  sub_1B07060A0();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 528) = v1;
  void *v1 = v0;
  v1[1] = sub_1B05EDB48;
  return sub_1B05EA25C();
}

uint64_t sub_1B05EDB48(char a1)
{
  *(unsigned char *)(*(void *)v1 + 558) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B05EDC48, 0, 0);
}

uint64_t sub_1B05EDC48()
{
  char v31 = *(unsigned char *)(v0 + 557);
  char v32 = *(unsigned char *)(v0 + 558);
  uint64_t v42 = *(void *)(v0 + 496);
  uint64_t v43 = *(void *)(v0 + 504);
  uint64_t v44 = *(void *)(v0 + 488);
  uint64_t v41 = *(void *)(v0 + 472);
  uint64_t v39 = *(void *)(v0 + 480);
  uint64_t v40 = *(void *)(v0 + 464);
  uint64_t v37 = *(void *)(v0 + 448);
  uint64_t v38 = *(void *)(v0 + 456);
  uint64_t v35 = *(void *)(v0 + 432);
  uint64_t v36 = *(void *)(v0 + 440);
  uint64_t v33 = *(void *)(v0 + 416);
  uint64_t v34 = *(void *)(v0 + 424);
  uint64_t v23 = *(void *)(v0 + 408);
  uint64_t v30 = *(void *)(v0 + 400);
  char v28 = *(unsigned char *)(v0 + 555);
  char v29 = *(unsigned char *)(v0 + 556);
  char v20 = *(unsigned char *)(v0 + 554);
  uint64_t v1 = *(void *)(v0 + 384);
  char v26 = *(unsigned char *)(v0 + 553);
  char v27 = *(unsigned char *)(v0 + 552);
  uint64_t v19 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 288);
  uint64_t v18 = *(void *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 264);
  if (v20)
  {
    uint64_t v6 = *(void *)(v0 + 544);
  }
  else
  {
    uint64_t v1 = 0;
    uint64_t v6 = 0;
  }
  if (*(unsigned char *)(v0 + 554)) {
    uint64_t v7 = *(void *)(v0 + 392);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v21 = v7;
  uint64_t v22 = v6;
  uint64_t v8 = *(void *)(v0 + 248);
  uint64_t v24 = v1;
  uint64_t v25 = *(void **)(v0 + 224);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)(v9 + *(int *)(v8 + 48));
  uint64_t v11 = (void *)(v9 + *(int *)(v8 + 64));
  sub_1B05DA300(v4, v9, &qword_1E9B34D48);
  sub_1B05DA364(v4, &qword_1E9B34D30);
  *uint64_t v10 = v3;
  v10[1] = v2;
  void *v11 = v18;
  v11[1] = v19;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v9, 0, 1, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = sub_1B0705750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *((void *)&v17 + 1) = v22;
  *(void *)&long long v17 = v24;
  sub_1B05EAA80(v43, v42, v41, v40, 0, 0, v9, v44, v25, v39, v38, v37, v36, v35, v34, v33, v27, v16, v23,
    (v23 & 0xFFFFFFFFFFuLL) >> 32,
    v30,
    v29,
    v26,
    v28,
    0,
    0,
    1,
    v17,
    v21,
    v20 ^ 1,
    v31,
    v32,
    v12,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_1B05EDFB8@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1B05D4EC8(a2, a3);
      uint64_t v10 = (char *)sub_1B07055E0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1B0705600();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1B07055F0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1B05EE21CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1B05D51A0(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      long long v17 = (char *)sub_1B07055E0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1B0705600();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1B07055F0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

char *sub_1B05EE22C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B05EE24C(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_1B05EE24C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E50);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  size_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_1B05EE354(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1B05EDFB8((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1B05EE42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1B07055E0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1B0705600();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1B07055F0();
  sub_1B05EDFB8(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1B05EE4E4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1B05EE74CLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1B05D4EC8(a3, a4);
                  sub_1B05D4EC8(a1, a2);
                  char v17 = sub_1B05EE42C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1B05D51A0(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1B05D4EC8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1B05EE42C(v21, v22, v20, a3, a4);
                  sub_1B05D51A0(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1B05D4EC8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1B05D4EC8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1B05EE354(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1B05D51A0(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1B05EE77C(void *a1, void *a2)
{
  type metadata accessor for MediaInfo();
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v353 = &v327[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v352 = &v327[-v7];
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v339 = &v327[-v9];
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v340 = &v327[-v11];
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v355 = &v327[-v13];
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v358 = &v327[-v15];
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v338 = &v327[-v17];
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  long long v357 = &v327[-v19];
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  uint64_t v351 = &v327[-v22];
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  long long v356 = &v327[-v24];
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  uint64_t v350 = &v327[-v26];
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v28 = MEMORY[0x1F4188790](v27);
  uint64_t v29 = MEMORY[0x1F4188790](v28);
  uint64_t v30 = MEMORY[0x1F4188790](v29);
  unint64_t v354 = &v327[-v31];
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v348 = &v327[-v33];
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  uint64_t v35 = MEMORY[0x1F4188790](v34);
  v367 = &v327[-v36];
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  uint64_t v38 = MEMORY[0x1F4188790](v37);
  v345 = &v327[-v39];
  uint64_t v40 = MEMORY[0x1F4188790](v38);
  uint64_t v42 = &v327[-v41];
  uint64_t v43 = MEMORY[0x1F4188790](v40);
  v343 = &v327[-v44];
  uint64_t v45 = MEMORY[0x1F4188790](v43);
  uint64_t v342 = &v327[-v46];
  uint64_t v47 = MEMORY[0x1F4188790](v45);
  v341 = &v327[-v48];
  uint64_t v49 = MEMORY[0x1F4188790](v47);
  v371 = &v327[-v50];
  uint64_t v51 = MEMORY[0x1F4188790](v49);
  v372 = &v327[-v52];
  uint64_t v53 = MEMORY[0x1F4188790](v51);
  v359 = &v327[-v54];
  uint64_t v55 = MEMORY[0x1F4188790](v53);
  v374 = &v327[-v56];
  uint64_t v57 = MEMORY[0x1F4188790](v55);
  uint64_t v375 = (uint64_t)&v327[-v58];
  uint64_t v59 = MEMORY[0x1F4188790](v57);
  uint64_t v61 = &v327[-v60];
  uint64_t v62 = MEMORY[0x1F4188790](v59);
  v366 = &v327[-v63];
  uint64_t v64 = MEMORY[0x1F4188790](v62);
  v362 = &v327[-v65];
  uint64_t v66 = MEMORY[0x1F4188790](v64);
  v363 = &v327[-v67];
  uint64_t v68 = MEMORY[0x1F4188790](v66);
  v364 = &v327[-v69];
  uint64_t v70 = MEMORY[0x1F4188790](v68);
  v365 = &v327[-v71];
  uint64_t v72 = MEMORY[0x1F4188790](v70);
  v368 = &v327[-v73];
  uint64_t v74 = MEMORY[0x1F4188790](v72);
  v373 = &v327[-v75];
  uint64_t v76 = MEMORY[0x1F4188790](v74);
  v370 = &v327[-v77];
  uint64_t v78 = MEMORY[0x1F4188790](v76);
  v369 = &v327[-v79];
  uint64_t v80 = MEMORY[0x1F4188790](v78);
  uint64_t v82 = &v327[-v81];
  uint64_t v83 = MEMORY[0x1F4188790](v80);
  uint64_t v376 = (uint64_t)&v327[-v84];
  uint64_t v85 = MEMORY[0x1F4188790](v83);
  uint64_t v87 = &v327[-v86];
  uint64_t v88 = MEMORY[0x1F4188790](v85);
  uint64_t v90 = &v327[-v89];
  uint64_t v91 = MEMORY[0x1F4188790](v88);
  uint64_t v93 = &v327[-v92];
  MEMORY[0x1F4188790](v91);
  int v96 = &v327[-v94];
  uint64_t v97 = a1[1];
  uint64_t v98 = a2[1];
  uint64_t v337 = v99;
  uint64_t v360 = v100;
  uint64_t v336 = v101;
  uint64_t v349 = v102;
  uint64_t v347 = v103;
  uint64_t v346 = v104;
  v344 = v42;
  v361 = v61;
  v377 = a1;
  if (!v97)
  {
    if (!v98)
    {
LABEL_51:
      v335 = v95;
      sub_1B05F1860((uint64_t)a1, (uint64_t)&v327[-v94]);
      sub_1B05F1860((uint64_t)a2, (uint64_t)v93);
      goto LABEL_52;
    }
LABEL_8:
    sub_1B05F1860((uint64_t)a1, (uint64_t)&v327[-v94]);
    sub_1B05F1860((uint64_t)a2, (uint64_t)v93);
    goto LABEL_9;
  }
  if (!v98) {
    goto LABEL_8;
  }
  if (*a1 == *a2 && v97 == v98) {
    goto LABEL_51;
  }
  v335 = v95;
  char v105 = sub_1B0706220();
  sub_1B05F1860((uint64_t)a1, (uint64_t)v96);
  sub_1B05F1860((uint64_t)a2, (uint64_t)v93);
  if ((v105 & 1) == 0)
  {
LABEL_9:
    sub_1B05F18C4((uint64_t)v93);
    sub_1B05F18C4((uint64_t)v96);
LABEL_10:
    uint64_t v106 = v373;
    sub_1B05F1860((uint64_t)a1, (uint64_t)v90);
    sub_1B05F1860((uint64_t)a2, (uint64_t)v87);
    goto LABEL_11;
  }
LABEL_52:
  uint64_t v158 = *((void *)v96 + 3);
  uint64_t v159 = *((void *)v93 + 3);
  if (!v158)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v93);
    sub_1B05F18C4((uint64_t)v96);
    if (!v159) {
      goto LABEL_59;
    }
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (!v159)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v93);
    sub_1B05F18C4((uint64_t)v96);
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (*((void *)v96 + 2) == *((void *)v93 + 2) && v158 == v159)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v93);
    sub_1B05F18C4((uint64_t)v96);
    swift_bridgeObjectRelease();
LABEL_59:
    sub_1B05F1860((uint64_t)a1, (uint64_t)v90);
    sub_1B05F1860((uint64_t)a2, (uint64_t)v87);
    goto LABEL_62;
  }
  char v160 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v93);
  sub_1B05F18C4((uint64_t)v96);
  swift_bridgeObjectRelease();
  sub_1B05F1860((uint64_t)a1, (uint64_t)v90);
  sub_1B05F1860((uint64_t)a2, (uint64_t)v87);
  uint64_t v106 = v373;
  if ((v160 & 1) == 0)
  {
LABEL_11:
    uint64_t v107 = (uint64_t)a2;
    sub_1B05F18C4((uint64_t)v87);
    sub_1B05F18C4((uint64_t)v90);
    uint64_t v109 = v371;
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    uint64_t v110 = v375;
LABEL_12:
    uint64_t v112 = v376;
    sub_1B05F1860((uint64_t)v377, v376);
    sub_1B05F1860(v107, (uint64_t)v82);
    goto LABEL_13;
  }
LABEL_62:
  uint64_t v161 = *((void *)v90 + 5);
  uint64_t v162 = *((void *)v87 + 5);
  if (!v161)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v87);
    sub_1B05F18C4((uint64_t)v90);
    uint64_t v111 = v374;
    if (!v162) {
      goto LABEL_69;
    }
    uint64_t v107 = (uint64_t)a2;
    uint64_t v110 = v375;
    swift_bridgeObjectRelease();
    uint64_t v109 = v371;
    uint64_t v108 = v372;
    uint64_t v106 = v373;
    goto LABEL_12;
  }
  if (!v162)
  {
    uint64_t v107 = (uint64_t)a2;
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v87);
    sub_1B05F18C4((uint64_t)v90);
    swift_bridgeObjectRelease();
    uint64_t v109 = v371;
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    uint64_t v110 = v375;
    uint64_t v106 = v373;
    goto LABEL_12;
  }
  if (*((void *)v90 + 4) == *((void *)v87 + 4) && v161 == v162)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v87);
    sub_1B05F18C4((uint64_t)v90);
    swift_bridgeObjectRelease();
LABEL_69:
    sub_1B05F1860((uint64_t)a1, v376);
    uint64_t v107 = (uint64_t)a2;
    sub_1B05F1860((uint64_t)a2, (uint64_t)v82);
    goto LABEL_72;
  }
  char v163 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v87);
  sub_1B05F18C4((uint64_t)v90);
  swift_bridgeObjectRelease();
  uint64_t v112 = v376;
  sub_1B05F1860((uint64_t)a1, v376);
  uint64_t v107 = (uint64_t)a2;
  sub_1B05F1860((uint64_t)a2, (uint64_t)v82);
  uint64_t v109 = v371;
  uint64_t v108 = v372;
  uint64_t v111 = v374;
  uint64_t v110 = v375;
  uint64_t v106 = v373;
  if ((v163 & 1) == 0)
  {
LABEL_13:
    sub_1B05F18C4((uint64_t)v82);
    sub_1B05F18C4(v112);
    uint64_t v113 = (uint64_t)v366;
    uint64_t v114 = v367;
LABEL_14:
    uint64_t v115 = (uint64_t)v369;
LABEL_15:
    sub_1B05F1860((uint64_t)v377, v115);
    uint64_t v116 = (uint64_t)v370;
    sub_1B05F1860(v107, (uint64_t)v370);
LABEL_16:
    sub_1B05F18C4(v116);
    sub_1B05F18C4(v115);
    uint64_t v117 = v114;
    uint64_t v118 = (uint64_t)v109;
    uint64_t v119 = v110;
    uint64_t v120 = v107;
    uint64_t v121 = (uint64_t)v377;
LABEL_17:
    sub_1B05F1860(v121, (uint64_t)v106);
    v122 = v368;
    sub_1B05F1860(v120, (uint64_t)v368);
LABEL_18:
    sub_1B05F18C4((uint64_t)v122);
    sub_1B05F18C4((uint64_t)v106);
LABEL_19:
    uint64_t v124 = v364;
    uint64_t v123 = v365;
    sub_1B05F1860(v121, (uint64_t)v365);
    sub_1B05F1860(v120, (uint64_t)v124);
LABEL_20:
    sub_1B05F18C4((uint64_t)v124);
    sub_1B05F18C4((uint64_t)v123);
LABEL_21:
    uint64_t v125 = v363;
    sub_1B05F1860(v121, (uint64_t)v363);
    uint64_t v126 = v362;
    sub_1B05F1860(v120, (uint64_t)v362);
LABEL_22:
    sub_1B05F18C4((uint64_t)v126);
    sub_1B05F18C4((uint64_t)v125);
LABEL_23:
    sub_1B05F1860(v121, v113);
    uint64_t v127 = (uint64_t)v361;
    sub_1B05F1860(v120, (uint64_t)v361);
LABEL_24:
    sub_1B05F18C4(v127);
    sub_1B05F18C4(v113);
LABEL_25:
    sub_1B05F1860(v121, v119);
    sub_1B05F1860(v120, (uint64_t)v111);
    uint64_t v128 = v359;
LABEL_26:
    sub_1B05F18C4((uint64_t)v111);
    sub_1B05F18C4(v119);
LABEL_27:
    sub_1B05F1860(v121, (uint64_t)v128);
    sub_1B05F1860(v120, (uint64_t)v108);
    uint64_t v129 = v358;
    uint64_t v130 = v357;
LABEL_28:
    sub_1B05F18C4((uint64_t)v108);
    sub_1B05F18C4((uint64_t)v128);
    sub_1B05F1860(v121, v118);
    uint64_t v131 = v341;
    sub_1B05F1860(v120, (uint64_t)v341);
    uint64_t v132 = v360;
LABEL_29:
    sub_1B05F18C4((uint64_t)v131);
    sub_1B05F18C4(v118);
LABEL_30:
    uint64_t v133 = v342;
    sub_1B05F1860(v121, (uint64_t)v342);
    uint64_t v134 = v343;
    sub_1B05F1860(v120, (uint64_t)v343);
LABEL_31:
    uint64_t v135 = (uint64_t)v117;
    sub_1B05F18C4((uint64_t)v134);
    sub_1B05F18C4((uint64_t)v133);
LABEL_32:
    uint64_t v136 = (uint64_t)v344;
    sub_1B05F1860(v121, (uint64_t)v344);
    uint64_t v137 = v345;
    sub_1B05F1860(v120, (uint64_t)v345);
    int v138 = v356;
    uint64_t v139 = v354;
LABEL_33:
    sub_1B05F18C4((uint64_t)v137);
    sub_1B05F18C4(v136);
    uint64_t v140 = v346;
    sub_1B05F1860(v121, v346);
    sub_1B05F1860(v120, v135);
LABEL_34:
    sub_1B05F18C4(v135);
    sub_1B05F18C4(v140);
    uint64_t v141 = v347;
    sub_1B05F1860(v121, v347);
    v142 = v348;
    sub_1B05F1860(v120, (uint64_t)v348);
    uint64_t v143 = v129;
LABEL_35:
    sub_1B05F18C4((uint64_t)v142);
    sub_1B05F18C4(v141);
    sub_1B05F1860(v121, (uint64_t)v139);
    uint64_t v144 = v349;
    sub_1B05F1860(v120, v349);
    v145 = v355;
LABEL_36:
    sub_1B05F18C4(v144);
    sub_1B05F18C4((uint64_t)v139);
    v146 = v351;
LABEL_37:
    uint64_t v147 = v336;
    sub_1B05F1860(v121, v336);
    sub_1B05F1860(v120, v132);
    id v148 = v338;
LABEL_38:
    sub_1B05F18C4(v132);
    sub_1B05F18C4(v147);
    uint64_t v149 = v350;
    sub_1B05F1860(v121, (uint64_t)v350);
    sub_1B05F1860(v120, (uint64_t)v138);
LABEL_39:
    sub_1B05F18C4((uint64_t)v138);
    sub_1B05F18C4((uint64_t)v149);
    uint64_t v150 = v340;
    uint64_t v151 = v339;
LABEL_40:
    sub_1B05F1860(v121, (uint64_t)v146);
    uint64_t v152 = v337;
    sub_1B05F1860(v120, v337);
LABEL_41:
    sub_1B05F18C4(v152);
    sub_1B05F18C4((uint64_t)v146);
LABEL_42:
    sub_1B05F1860(v121, (uint64_t)v130);
    sub_1B05F1860(v120, (uint64_t)v148);
LABEL_43:
    sub_1B05F18C4((uint64_t)v148);
    sub_1B05F18C4((uint64_t)v130);
LABEL_44:
    sub_1B05F1860(v121, (uint64_t)v143);
    sub_1B05F1860(v120, (uint64_t)v145);
LABEL_45:
    sub_1B05F18C4((uint64_t)v145);
    sub_1B05F18C4((uint64_t)v143);
LABEL_46:
    sub_1B05F1860(v121, (uint64_t)v150);
    sub_1B05F1860(v120, (uint64_t)v151);
LABEL_47:
    sub_1B05F18C4((uint64_t)v151);
    sub_1B05F18C4((uint64_t)v150);
LABEL_48:
    uint64_t v153 = v352;
    sub_1B05F1860(v121, (uint64_t)v352);
    uint64_t v154 = v120;
    long long v155 = v353;
    sub_1B05F1860(v154, (uint64_t)v353);
LABEL_49:
    sub_1B05F18C4((uint64_t)v155);
    sub_1B05F18C4((uint64_t)v153);
    return 0;
  }
LABEL_72:
  uint64_t v164 = &qword_1E9B34D38;
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  v334 = v327;
  uint64_t v166 = *(void *)(*(void *)(v165 - 8) + 64);
  MEMORY[0x1F4188790](v165 - 8);
  unint64_t v333 = (v166 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v167 = &v327[-v333];
  sub_1B05DA300(v168 + v335[7], (uint64_t)&v327[-v333], &qword_1E9B34D38);
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v170 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v169 - 8) + 48);
  if (v170(v167, 1, v169) == 1)
  {
    v171 = 0;
    uint64_t v172 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v173 = &v167[*(int *)(v169 + 64)];
    v171 = (unsigned char *)*v173;
    uint64_t v172 = v173[1];
    uint64_t v164 = &qword_1E9B34D48;
  }
  uint64_t v174 = sub_1B05DA364((uint64_t)v167, v164);
  MEMORY[0x1F4188790](v174);
  uint64_t v175 = &v327[-v333];
  sub_1B05DA300((uint64_t)&v82[v335[7]], (uint64_t)&v327[-v333], &qword_1E9B34D38);
  if (v170(v175, 1, v169) == 1)
  {
    sub_1B05DA364((uint64_t)v175, &qword_1E9B34D38);
    uint64_t v109 = v371;
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    uint64_t v110 = v375;
    uint64_t v176 = v376;
    if (!v172)
    {
      uint64_t v177 = 0;
      goto LABEL_84;
    }
LABEL_83:
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v82);
    sub_1B05F18C4(v176);
    swift_bridgeObjectRelease_n();
    uint64_t v113 = (uint64_t)v366;
    uint64_t v114 = v367;
    uint64_t v106 = v373;
    goto LABEL_14;
  }
  v334 = v171;
  swift_bridgeObjectRelease();
  uint64_t v178 = &v175[*(int *)(v169 + 64)];
  uint64_t v179 = (unsigned char *)*v178;
  uint64_t v177 = v178[1];
  sub_1B05DA364((uint64_t)v175, &qword_1E9B34D48);
  uint64_t v109 = v371;
  uint64_t v108 = v372;
  uint64_t v111 = v374;
  uint64_t v110 = v375;
  uint64_t v176 = v376;
  if (!v172)
  {
LABEL_84:
    uint64_t v115 = (uint64_t)v369;
    sub_1B05F18C4((uint64_t)v82);
    sub_1B05F18C4(v176);
    if (v177)
    {
      swift_bridgeObjectRelease();
      uint64_t v113 = (uint64_t)v366;
      uint64_t v114 = v367;
      uint64_t v106 = v373;
      goto LABEL_15;
    }
    goto LABEL_86;
  }
  if (!v177) {
    goto LABEL_83;
  }
  if (v334 == v179 && v172 == v177)
  {
    swift_bridgeObjectRelease();
    sub_1B05F18C4((uint64_t)v82);
    sub_1B05F18C4(v176);
    swift_bridgeObjectRelease();
    uint64_t v115 = (uint64_t)v369;
LABEL_86:
    sub_1B05F1860((uint64_t)v377, v115);
    sub_1B05F1860(v107, (uint64_t)v370);
    goto LABEL_87;
  }
  LODWORD(v334) = sub_1B0706220();
  swift_bridgeObjectRelease();
  sub_1B05F18C4((uint64_t)v82);
  sub_1B05F18C4(v176);
  swift_bridgeObjectRelease();
  uint64_t v115 = (uint64_t)v369;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v369);
  uint64_t v116 = (uint64_t)v370;
  sub_1B05F1860(v107, (uint64_t)v370);
  uint64_t v113 = (uint64_t)v366;
  uint64_t v114 = v367;
  uint64_t v106 = v373;
  if ((v334 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_87:
  v180 = &qword_1E9B34D38;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  uint64_t v182 = *(void *)(*(void *)(v181 - 8) + 64);
  MEMORY[0x1F4188790](v181 - 8);
  unint64_t v183 = (v182 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1B05DA300(v115 + v335[7], (uint64_t)&v327[-v183], &qword_1E9B34D38);
  uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  uint64_t v185 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v184 - 8) + 48);
  if (v185(&v327[-v183], 1, v184) == 1)
  {
    v334 = 0;
    uint64_t v376 = 0;
  }
  else
  {
    v186 = &v327[*(int *)(v184 + 48) - v183];
    v188 = (unsigned char *)*v186;
    uint64_t v187 = v186[1];
    v334 = v188;
    uint64_t v376 = v187;
    swift_bridgeObjectRelease();
    v180 = &qword_1E9B34D48;
  }
  uint64_t v120 = v107;
  uint64_t v189 = sub_1B05DA364((uint64_t)&v327[-v183], v180);
  MEMORY[0x1F4188790](v189);
  sub_1B05DA300((uint64_t)&v370[v335[7]], (uint64_t)&v327[-v183], &qword_1E9B34D38);
  unsigned int v190 = v185(&v327[-v183], 1, v184);
  uint64_t v121 = (uint64_t)v377;
  if (v190 == 1)
  {
    sub_1B05DA364((uint64_t)&v327[-v183], &qword_1E9B34D38);
    uint64_t v117 = v367;
    uint64_t v118 = (uint64_t)v371;
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    uint64_t v119 = v375;
    uint64_t v191 = (uint64_t)v369;
    if (!v376)
    {
      uint64_t v192 = 0;
      goto LABEL_102;
    }
    goto LABEL_98;
  }
  unint64_t v193 = &v327[*(int *)(v184 + 48) - v183];
  v194 = (unsigned char *)*v193;
  uint64_t v192 = v193[1];
  swift_bridgeObjectRelease();
  sub_1B05DA364((uint64_t)&v327[-v183], &qword_1E9B34D48);
  uint64_t v118 = (uint64_t)v371;
  uint64_t v108 = v372;
  uint64_t v191 = (uint64_t)v369;
  if (!v376)
  {
    uint64_t v117 = v367;
    uint64_t v111 = v374;
    uint64_t v119 = v375;
LABEL_102:
    uint64_t v113 = (uint64_t)v366;
    sub_1B05F18C4((uint64_t)v370);
    sub_1B05F18C4(v191);
    if (v192)
    {
      swift_bridgeObjectRelease();
      goto LABEL_104;
    }
    goto LABEL_105;
  }
  uint64_t v117 = v367;
  uint64_t v111 = v374;
  uint64_t v119 = v375;
  if (!v192)
  {
LABEL_98:
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v370);
    sub_1B05F18C4(v191);
    swift_bridgeObjectRelease_n();
    uint64_t v113 = (uint64_t)v366;
LABEL_104:
    uint64_t v106 = v373;
    goto LABEL_17;
  }
  if (v334 == v194 && v376 == v192)
  {
    swift_bridgeObjectRelease();
    sub_1B05F18C4((uint64_t)v370);
    sub_1B05F18C4(v191);
    swift_bridgeObjectRelease();
LABEL_105:
    uint64_t v106 = v373;
    sub_1B05F1860(v121, (uint64_t)v373);
    sub_1B05F1860(v120, (uint64_t)v368);
    goto LABEL_106;
  }
  LODWORD(v334) = sub_1B0706220();
  swift_bridgeObjectRelease();
  sub_1B05F18C4((uint64_t)v370);
  sub_1B05F18C4(v191);
  swift_bridgeObjectRelease();
  uint64_t v106 = v373;
  sub_1B05F1860(v121, (uint64_t)v373);
  v122 = v368;
  sub_1B05F1860(v120, (uint64_t)v368);
  uint64_t v113 = (uint64_t)v366;
  if ((v334 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_106:
  uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  uint64_t v376 = (uint64_t)v327;
  unint64_t v196 = *(void *)(*(void *)(v195 - 8) + 64);
  MEMORY[0x1F4188790](v195 - 8);
  uint64_t v197 = &v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D38);
  uint64_t v199 = *(void *)(*(void *)(v198 - 8) + 64);
  MEMORY[0x1F4188790](v198 - 8);
  sub_1B05DA300((uint64_t)&v106[v335[7]], (uint64_t)&v327[-((v199 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1E9B34D38);
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  v201 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v200 - 8) + 48);
  if (v201(&v327[-((v199 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, v200) == 1)
  {
    sub_1B05DA364((uint64_t)&v327[-((v199 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1E9B34D38);
    uint64_t v202 = sub_1B0705750();
    uint64_t v203 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v202 - 8) + 56))(&v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v202);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v203 = sub_1B05DA3C0((uint64_t)&v327[-((v199 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t)&v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1E9B34D48);
  }
  v370 = v327;
  uint64_t v204 = MEMORY[0x1F4188790](v203);
  uint64_t v205 = &v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v204);
  v206 = &v327[-((v199 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B05DA300((uint64_t)&v368[v335[7]], (uint64_t)v206, &qword_1E9B34D38);
  unsigned int v207 = v201(v206, 1, v200);
  unint64_t v333 = v196;
  if (v207 == 1)
  {
    sub_1B05DA364((uint64_t)v206, &qword_1E9B34D38);
    uint64_t v208 = sub_1B0705750();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v208 - 8) + 56))(&v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v208);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B05DA3C0((uint64_t)v206, (uint64_t)&v327[-((v196 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1E9B34D48);
  }
  uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D50);
  v369 = v327;
  uint64_t v210 = MEMORY[0x1F4188790](v209 - 8);
  uint64_t v212 = &v327[-((v211 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v213 = (uint64_t)&v212[*(int *)(v210 + 56)];
  sub_1B05DA300((uint64_t)v197, (uint64_t)v212, &qword_1E9B34D48);
  v334 = (unsigned char *)v213;
  sub_1B05DA300((uint64_t)v205, v213, &qword_1E9B34D48);
  uint64_t v214 = (unsigned char *)sub_1B0705750();
  uint64_t v215 = *((void *)v214 - 1);
  char v216 = *(uint64_t (**)(unsigned char *, uint64_t, unsigned char *))(v215 + 48);
  uint64_t v217 = v216(v212, 1, v214);
  uint64_t v218 = v368;
  if (v217 == 1)
  {
    sub_1B05DA364((uint64_t)v205, &qword_1E9B34D48);
    sub_1B05DA364((uint64_t)v197, &qword_1E9B34D48);
    sub_1B05F18C4((uint64_t)v218);
    sub_1B05F18C4((uint64_t)v373);
    if (v216(v334, 1, v214) == 1)
    {
      unint64_t v333 = (unint64_t)v216;
      uint64_t v330 = v215 + 48;
      v334 = (unsigned char *)v215;
      v373 = v214;
      sub_1B05DA364((uint64_t)v212, &qword_1E9B34D48);
      uint64_t v123 = v365;
      sub_1B05F1860(v121, (uint64_t)v365);
      uint64_t v124 = v364;
      sub_1B05F1860(v120, (uint64_t)v364);
      uint64_t v113 = (uint64_t)v366;
      uint64_t v117 = v367;
      uint64_t v118 = (uint64_t)v371;
      uint64_t v111 = v374;
      uint64_t v119 = v375;
      goto LABEL_121;
    }
LABEL_117:
    sub_1B05DA364((uint64_t)v212, &qword_1E9B34D50);
    uint64_t v118 = (uint64_t)v371;
    uint64_t v119 = v375;
    uint64_t v113 = (uint64_t)v366;
    uint64_t v117 = v367;
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    goto LABEL_19;
  }
  v331 = v205;
  v332 = v197;
  MEMORY[0x1F4188790](v217);
  v220 = &v327[-((v219 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B05DA300((uint64_t)v212, (uint64_t)v220, &qword_1E9B34D48);
  uint64_t v221 = v334;
  unint64_t v333 = (unint64_t)v216;
  uint64_t v222 = v216(v334, 1, v214);
  if (v222 == 1)
  {
    sub_1B05DA364((uint64_t)v331, &qword_1E9B34D48);
    sub_1B05DA364((uint64_t)v332, &qword_1E9B34D48);
    sub_1B05F18C4((uint64_t)v368);
    sub_1B05F18C4((uint64_t)v373);
    (*(void (**)(unsigned char *, unsigned char *))(v215 + 8))(v220, v214);
    goto LABEL_117;
  }
  uint64_t v330 = v215 + 48;
  v329 = v327;
  MEMORY[0x1F4188790](v222);
  uint64_t v224 = v214;
  uint64_t v225 = &v327[-((v223 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, unsigned char *, unsigned char *))(v215 + 32))(v225, v221, v224);
  sub_1B05F1920();
  int v328 = sub_1B0706000();
  v334 = (unsigned char *)v215;
  uint64_t v226 = *(void (**)(unsigned char *, unsigned char *))(v215 + 8);
  v226(v225, v224);
  sub_1B05DA364((uint64_t)v331, &qword_1E9B34D48);
  sub_1B05DA364((uint64_t)v332, &qword_1E9B34D48);
  sub_1B05F18C4((uint64_t)v368);
  sub_1B05F18C4((uint64_t)v373);
  v373 = v224;
  v226(v220, v224);
  sub_1B05DA364((uint64_t)v212, &qword_1E9B34D48);
  uint64_t v123 = v365;
  sub_1B05F1860(v121, (uint64_t)v365);
  uint64_t v124 = v364;
  sub_1B05F1860(v120, (uint64_t)v364);
  uint64_t v113 = (uint64_t)v366;
  uint64_t v117 = v367;
  uint64_t v118 = (uint64_t)v371;
  uint64_t v108 = v372;
  uint64_t v111 = v374;
  uint64_t v119 = v375;
  if ((v328 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_121:
  uint64_t v227 = v335[8];
  uint64_t v228 = &v123[v227];
  uint64_t v229 = *(void *)&v123[v227 + 8];
  uint64_t v230 = &v124[v227];
  uint64_t v231 = v123;
  uint64_t v232 = (uint64_t)v124;
  uint64_t v233 = v230[1];
  if (!v229)
  {
    uint64_t v234 = (uint64_t)v231;
    swift_bridgeObjectRetain();
    sub_1B05F18C4(v232);
    sub_1B05F18C4(v234);
    if (!v233) {
      goto LABEL_127;
    }
LABEL_129:
    swift_bridgeObjectRelease();
    uint64_t v108 = v372;
    goto LABEL_21;
  }
  if (!v233)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v364);
    sub_1B05F18C4((uint64_t)v365);
    goto LABEL_129;
  }
  if (*v228 == *v230 && v229 == v233)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v364);
    sub_1B05F18C4((uint64_t)v365);
    swift_bridgeObjectRelease();
LABEL_127:
    uint64_t v125 = v363;
    sub_1B05F1860(v121, (uint64_t)v363);
    uint64_t v126 = v362;
    sub_1B05F1860(v120, (uint64_t)v362);
    goto LABEL_131;
  }
  LODWORD(v376) = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v364);
  sub_1B05F18C4((uint64_t)v365);
  swift_bridgeObjectRelease();
  uint64_t v125 = v363;
  sub_1B05F1860(v121, (uint64_t)v363);
  uint64_t v126 = v362;
  sub_1B05F1860(v120, (uint64_t)v362);
  uint64_t v108 = v372;
  if ((v376 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_131:
  uint64_t v235 = v335[9];
  uint64_t v236 = &v125[v235];
  uint64_t v237 = *(void *)&v125[v235 + 8];
  uint64_t v238 = &v126[v235];
  uint64_t v239 = v238[1];
  if (!v237)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v126);
    sub_1B05F18C4((uint64_t)v125);
    if (!v239) {
      goto LABEL_137;
    }
LABEL_139:
    swift_bridgeObjectRelease();
    uint64_t v108 = v372;
    goto LABEL_23;
  }
  if (!v239)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v126);
    sub_1B05F18C4((uint64_t)v125);
    goto LABEL_139;
  }
  if (*v236 == *v238 && v237 == v239)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v362);
    sub_1B05F18C4((uint64_t)v363);
    swift_bridgeObjectRelease();
LABEL_137:
    sub_1B05F1860(v121, v113);
    uint64_t v127 = (uint64_t)v361;
    sub_1B05F1860(v120, (uint64_t)v361);
    goto LABEL_141;
  }
  LODWORD(v376) = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v362);
  sub_1B05F18C4((uint64_t)v363);
  swift_bridgeObjectRelease();
  sub_1B05F1860(v121, v113);
  uint64_t v127 = (uint64_t)v361;
  sub_1B05F1860(v120, (uint64_t)v361);
  uint64_t v108 = v372;
  if ((v376 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_141:
  uint64_t v240 = v335[11];
  uint64_t v241 = *(void *)(v113 + v240);
  unint64_t v242 = *(void *)(v113 + v240 + 8);
  uint64_t v243 = (uint64_t *)(v127 + v240);
  uint64_t v244 = *v243;
  unint64_t v245 = v243[1];
  if (v242 >> 60 == 15)
  {
    uint64_t v376 = v241;
    sub_1B05F196C(v244, v245);
    sub_1B05F18C4(v127);
    sub_1B05F18C4(v113);
    if (v245 >> 60 == 15)
    {
      sub_1B05E5468(v376, v242);
      uint64_t v119 = v375;
      sub_1B05F1860(v121, v375);
      uint64_t v111 = v374;
      sub_1B05F1860(v120, (uint64_t)v374);
      goto LABEL_148;
    }
LABEL_146:
    sub_1B05E5468(v376, v242);
    sub_1B05E5468(v244, v245);
    uint64_t v108 = v372;
    uint64_t v111 = v374;
    uint64_t v119 = v375;
    goto LABEL_25;
  }
  uint64_t v246 = v241;
  if (v245 >> 60 == 15)
  {
    sub_1B05D4EC8(v241, v242);
    sub_1B05D4EC8(v246, v242);
    sub_1B05F18C4((uint64_t)v361);
    sub_1B05F18C4(v113);
    uint64_t v376 = v246;
    sub_1B05E5468(v246, v242);
    goto LABEL_146;
  }
  sub_1B05F196C(v241, v242);
  sub_1B05F196C(v244, v245);
  sub_1B05F196C(v246, v242);
  LODWORD(v376) = sub_1B05EE4E4(v246, v242, v244, v245);
  sub_1B05E5468(v244, v245);
  sub_1B05E5468(v246, v242);
  sub_1B05F18C4((uint64_t)v361);
  sub_1B05F18C4(v113);
  sub_1B05E5468(v246, v242);
  uint64_t v119 = v375;
  sub_1B05F1860(v121, v375);
  uint64_t v111 = v374;
  sub_1B05F1860(v120, (uint64_t)v374);
  uint64_t v108 = v372;
  uint64_t v128 = v359;
  if ((v376 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_148:
  v247 = v335;
  uint64_t v248 = v335[10];
  uint64_t v249 = (void *)(v119 + v248);
  uint64_t v250 = *(void *)(v119 + v248 + 8);
  uint64_t v251 = &v111[v248];
  uint64_t v252 = v251[1];
  if (!v250)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v111);
    sub_1B05F18C4(v119);
    if (!v252) {
      goto LABEL_154;
    }
LABEL_156:
    swift_bridgeObjectRelease();
    uint64_t v108 = v372;
    uint64_t v128 = v359;
    goto LABEL_27;
  }
  if (!v252)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v111);
    sub_1B05F18C4(v119);
    goto LABEL_156;
  }
  if (*v249 == *v251 && v250 == v252)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v111);
    sub_1B05F18C4(v119);
    swift_bridgeObjectRelease();
LABEL_154:
    uint64_t v128 = v359;
    sub_1B05F1860(v121, (uint64_t)v359);
    uint64_t v108 = v372;
    sub_1B05F1860(v120, (uint64_t)v372);
    uint64_t v129 = v358;
    uint64_t v130 = v357;
    goto LABEL_158;
  }
  LODWORD(v376) = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v111);
  sub_1B05F18C4(v119);
  swift_bridgeObjectRelease();
  uint64_t v128 = v359;
  sub_1B05F1860(v121, (uint64_t)v359);
  uint64_t v108 = v372;
  sub_1B05F1860(v120, (uint64_t)v372);
  uint64_t v129 = v358;
  uint64_t v130 = v357;
  if ((v376 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_158:
  int v253 = v128[v247[12]];
  sub_1B05F18C4((uint64_t)v128);
  int v254 = v108[v247[12]];
  sub_1B05F18C4((uint64_t)v108);
  sub_1B05F1860(v121, v118);
  uint64_t v131 = v341;
  sub_1B05F1860(v120, (uint64_t)v341);
  BOOL v255 = v253 == v254;
  uint64_t v132 = v360;
  if (!v255) {
    goto LABEL_29;
  }
  uint64_t v376 = v120;
  uint64_t v256 = v335;
  int v257 = *(unsigned __int8 *)(v118 + v335[15]);
  sub_1B05F18C4(v118);
  uint64_t v258 = (uint64_t)v131;
  int v259 = v131[v256[15]];
  sub_1B05F18C4(v258);
  if (v257 == 4)
  {
    uint64_t v129 = v358;
    uint64_t v130 = v357;
    uint64_t v132 = v360;
    uint64_t v117 = v367;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    if (v259 != 4) {
      goto LABEL_30;
    }
    uint64_t v133 = v342;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v342);
    uint64_t v134 = v343;
    sub_1B05F1860(v120, (uint64_t)v343);
  }
  else
  {
    uint64_t v129 = v358;
    uint64_t v130 = v357;
    uint64_t v132 = v360;
    uint64_t v117 = v367;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    if (v259 == 4) {
      goto LABEL_30;
    }
    id v260 = v342;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v342);
    uint64_t v134 = v343;
    sub_1B05F1860(v120, (uint64_t)v343);
    BOOL v255 = v257 == v259;
    uint64_t v133 = v260;
    if (!v255) {
      goto LABEL_31;
    }
  }
  uint64_t v261 = v335;
  uint64_t v262 = (uint64_t)v133;
  int v263 = v133[v335[16]];
  sub_1B05F18C4(v262);
  int v264 = v134[v261[16]];
  sub_1B05F18C4((uint64_t)v134);
  if (v263 == 4)
  {
    uint64_t v129 = v358;
    uint64_t v130 = v357;
    uint64_t v132 = v360;
    uint64_t v135 = (uint64_t)v367;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    if (v264 != 4) {
      goto LABEL_32;
    }
    uint64_t v136 = (uint64_t)v344;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v344);
    uint64_t v137 = v345;
    sub_1B05F1860(v120, (uint64_t)v345);
    uint64_t v139 = v354;
  }
  else
  {
    uint64_t v129 = v358;
    uint64_t v130 = v357;
    uint64_t v132 = v360;
    uint64_t v135 = (uint64_t)v367;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    if (v264 == 4) {
      goto LABEL_32;
    }
    uint64_t v136 = (uint64_t)v344;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v344);
    uint64_t v137 = v345;
    sub_1B05F1860(v120, (uint64_t)v345);
    BOOL v255 = v263 == v264;
    int v138 = v356;
    uint64_t v139 = v354;
    if (!v255) {
      goto LABEL_33;
    }
  }
  uint64_t v265 = v335;
  int v266 = *(unsigned __int8 *)(v136 + v335[17]);
  sub_1B05F18C4(v136);
  LODWORD(v265) = v137[v265[17]];
  sub_1B05F18C4((uint64_t)v137);
  uint64_t v140 = v346;
  sub_1B05F1860(v121, v346);
  sub_1B05F1860(v120, v135);
  BOOL v255 = v266 == v265;
  uint64_t v132 = v360;
  int v138 = v356;
  if (!v255) {
    goto LABEL_34;
  }
  char v267 = v335;
  int v268 = *(unsigned __int8 *)(v140 + v335[20]);
  sub_1B05F18C4(v140);
  LODWORD(v267) = *(unsigned __int8 *)(v135 + v267[20]);
  sub_1B05F18C4(v135);
  uint64_t v141 = v347;
  sub_1B05F1860(v121, v347);
  v142 = v348;
  sub_1B05F1860(v120, (uint64_t)v348);
  BOOL v255 = v268 == v267;
  uint64_t v132 = v360;
  int v138 = v356;
  uint64_t v143 = v129;
  if (!v255) {
    goto LABEL_35;
  }
  uint64_t v269 = v335;
  int v270 = *(unsigned __int8 *)(v141 + v335[21]);
  sub_1B05F18C4(v141);
  LODWORD(v269) = v142[v269[21]];
  sub_1B05F18C4((uint64_t)v142);
  sub_1B05F1860(v121, (uint64_t)v139);
  uint64_t v144 = v349;
  sub_1B05F1860(v120, v349);
  BOOL v255 = v270 == v269;
  uint64_t v132 = v360;
  int v138 = v356;
  v145 = v355;
  if (!v255) {
    goto LABEL_36;
  }
  uint64_t v271 = v335[22];
  uint64_t v272 = (uint64_t)&v139[v271];
  uint64_t v273 = v144 + v271;
  uint64_t v274 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D50);
  uint64_t v275 = MEMORY[0x1F4188790](v274 - 8);
  v277 = &v327[-((v276 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v278 = (uint64_t)&v277[*(int *)(v275 + 56)];
  sub_1B05DA300(v272, (uint64_t)v277, &qword_1E9B34D48);
  sub_1B05DA300(v273, v278, &qword_1E9B34D48);
  if (((unsigned int (*)(unsigned char *, uint64_t, unsigned char *))v333)(v277, 1, v373) == 1)
  {
    sub_1B05F18C4(v144);
    sub_1B05F18C4((uint64_t)v354);
    if (((unsigned int (*)(uint64_t, uint64_t, unsigned char *))v333)(v278, 1, v373) == 1)
    {
      sub_1B05DA364((uint64_t)v277, &qword_1E9B34D48);
      uint64_t v121 = (uint64_t)v377;
      uint64_t v147 = v336;
      sub_1B05F1860((uint64_t)v377, v336);
      uint64_t v120 = v376;
      uint64_t v132 = v360;
      sub_1B05F1860(v376, v360);
      uint64_t v143 = v358;
      v145 = v355;
      uint64_t v130 = v357;
      id v148 = v338;
      v146 = v351;
      goto LABEL_185;
    }
LABEL_183:
    sub_1B05DA364((uint64_t)v277, &qword_1E9B34D50);
    uint64_t v143 = v358;
    v145 = v355;
    uint64_t v130 = v357;
    v146 = v351;
    int v138 = v356;
    uint64_t v132 = v360;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_37;
  }
  uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D48);
  MEMORY[0x1F4188790](v279 - 8);
  uint64_t v281 = &v327[-((v280 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B05DA300((uint64_t)v277, (uint64_t)v281, &qword_1E9B34D48);
  uint64_t v282 = ((uint64_t (*)(uint64_t, uint64_t, unsigned char *))v333)(v278, 1, v373);
  if (v282 == 1)
  {
    sub_1B05F18C4(v144);
    sub_1B05F18C4((uint64_t)v354);
    (*((void (**)(unsigned char *, unsigned char *))v334 + 1))(v281, v373);
    goto LABEL_183;
  }
  uint64_t v283 = v334;
  MEMORY[0x1F4188790](v282);
  uint64_t v285 = &v327[-((v284 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v286 = v278;
  uint64_t v287 = v373;
  (*((void (**)(unsigned char *, uint64_t, unsigned char *))v283 + 4))(v285, v286, v373);
  sub_1B05F1920();
  LODWORD(v375) = sub_1B0706000();
  uint64_t v288 = (void (*)(unsigned char *, unsigned char *))*((void *)v283 + 1);
  v288(v285, v287);
  sub_1B05F18C4(v144);
  sub_1B05F18C4((uint64_t)v354);
  v288(v281, v287);
  sub_1B05DA364((uint64_t)v277, &qword_1E9B34D48);
  uint64_t v121 = (uint64_t)v377;
  uint64_t v147 = v336;
  sub_1B05F1860((uint64_t)v377, v336);
  uint64_t v120 = v376;
  uint64_t v132 = v360;
  sub_1B05F1860(v376, v360);
  uint64_t v143 = v358;
  v145 = v355;
  uint64_t v130 = v357;
  id v148 = v338;
  v146 = v351;
  int v138 = v356;
  if ((v375 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_185:
  uint64_t v289 = v132;
  v290 = v335;
  LODWORD(v375) = *(unsigned __int8 *)(v147 + v335[23]);
  sub_1B05F18C4(v147);
  LODWORD(v290) = *(unsigned __int8 *)(v289 + v290[23]);
  sub_1B05F18C4(v289);
  uint64_t v149 = v350;
  sub_1B05F1860(v121, (uint64_t)v350);
  sub_1B05F1860(v120, (uint64_t)v356);
  int v138 = v356;
  if (v375 != v290) {
    goto LABEL_39;
  }
  uint64_t v291 = v335[24];
  uint64_t v292 = &v149[v291];
  uint64_t v293 = *(void *)&v149[v291 + 8];
  uint64_t v294 = &v356[v291];
  uint64_t v295 = v294[1];
  if (!v293)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v356);
    sub_1B05F18C4((uint64_t)v350);
    if (!v295) {
      goto LABEL_192;
    }
LABEL_194:
    swift_bridgeObjectRelease();
    uint64_t v150 = v340;
    uint64_t v151 = v339;
    uint64_t v143 = v358;
    v145 = v355;
    uint64_t v130 = v357;
    id v148 = v338;
    v146 = v351;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_40;
  }
  if (!v295)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v356);
    sub_1B05F18C4((uint64_t)v350);
    goto LABEL_194;
  }
  if (*v292 == *v294 && v293 == v295)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v356);
    sub_1B05F18C4((uint64_t)v350);
    swift_bridgeObjectRelease();
LABEL_192:
    v146 = v351;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v351);
    uint64_t v152 = v337;
    sub_1B05F1860(v376, v337);
    goto LABEL_196;
  }
  LODWORD(v375) = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v356);
  sub_1B05F18C4((uint64_t)v350);
  swift_bridgeObjectRelease();
  uint64_t v121 = (uint64_t)v377;
  v146 = v351;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v351);
  uint64_t v120 = v376;
  uint64_t v152 = v337;
  sub_1B05F1860(v376, v337);
  uint64_t v150 = v340;
  uint64_t v151 = v339;
  uint64_t v143 = v358;
  v145 = v355;
  uint64_t v130 = v357;
  id v148 = v338;
  if ((v375 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_196:
  uint64_t v296 = v335[25];
  uint64_t v297 = &v146[v296];
  uint64_t v298 = *(void *)&v146[v296 + 8];
  uint64_t v299 = v152;
  v300 = (void *)(v152 + v296);
  uint64_t v301 = v300[1];
  if (!v298)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4(v152);
    sub_1B05F18C4((uint64_t)v351);
    if (!v301) {
      goto LABEL_202;
    }
LABEL_204:
    swift_bridgeObjectRelease();
    uint64_t v150 = v340;
    uint64_t v151 = v339;
    uint64_t v143 = v358;
    v145 = v355;
    uint64_t v130 = v357;
    id v148 = v338;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_42;
  }
  if (!v301)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4(v152);
    sub_1B05F18C4((uint64_t)v351);
    goto LABEL_204;
  }
  if (*v297 == *v300 && v298 == v301)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4(v152);
    sub_1B05F18C4((uint64_t)v351);
    swift_bridgeObjectRelease();
LABEL_202:
    uint64_t v130 = v357;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v357);
    id v148 = v338;
    sub_1B05F1860(v376, (uint64_t)v338);
    goto LABEL_206;
  }
  char v302 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4(v299);
  sub_1B05F18C4((uint64_t)v351);
  swift_bridgeObjectRelease();
  uint64_t v121 = (uint64_t)v377;
  uint64_t v130 = v357;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v357);
  uint64_t v120 = v376;
  id v148 = v338;
  sub_1B05F1860(v376, (uint64_t)v338);
  uint64_t v150 = v340;
  uint64_t v151 = v339;
  uint64_t v143 = v358;
  v145 = v355;
  if ((v302 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_206:
  uint64_t v303 = v335[26];
  uint64_t v304 = &v130[v303];
  uint64_t v305 = *(void *)&v130[v303 + 8];
  uint64_t v306 = &v148[v303];
  uint64_t v307 = v306[1];
  if (!v305)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v338);
    sub_1B05F18C4((uint64_t)v357);
    if (!v307) {
      goto LABEL_212;
    }
LABEL_214:
    swift_bridgeObjectRelease();
    uint64_t v150 = v340;
    uint64_t v151 = v339;
    uint64_t v143 = v358;
    v145 = v355;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_44;
  }
  if (!v307)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v338);
    sub_1B05F18C4((uint64_t)v357);
    goto LABEL_214;
  }
  if (*v304 == *v306 && v305 == v307)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v338);
    sub_1B05F18C4((uint64_t)v357);
    swift_bridgeObjectRelease();
LABEL_212:
    uint64_t v143 = v358;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v358);
    v145 = v355;
    sub_1B05F1860(v376, (uint64_t)v355);
    goto LABEL_216;
  }
  char v308 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v338);
  sub_1B05F18C4((uint64_t)v357);
  swift_bridgeObjectRelease();
  uint64_t v121 = (uint64_t)v377;
  uint64_t v143 = v358;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v358);
  uint64_t v120 = v376;
  v145 = v355;
  sub_1B05F1860(v376, (uint64_t)v355);
  uint64_t v150 = v340;
  uint64_t v151 = v339;
  if ((v308 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_216:
  uint64_t v309 = v335[27];
  v310 = &v143[v309];
  uint64_t v311 = *(void *)&v143[v309 + 8];
  uint64_t v312 = &v145[v309];
  uint64_t v313 = v312[1];
  if (!v311)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v355);
    sub_1B05F18C4((uint64_t)v358);
    if (!v313) {
      goto LABEL_222;
    }
LABEL_224:
    swift_bridgeObjectRelease();
    uint64_t v150 = v340;
    uint64_t v151 = v339;
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_46;
  }
  if (!v313)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v355);
    sub_1B05F18C4((uint64_t)v358);
    goto LABEL_224;
  }
  if (*v310 == *v312 && v311 == v313)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v355);
    sub_1B05F18C4((uint64_t)v358);
    swift_bridgeObjectRelease();
LABEL_222:
    uint64_t v150 = v340;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v340);
    uint64_t v151 = v339;
    sub_1B05F1860(v376, (uint64_t)v339);
    goto LABEL_226;
  }
  char v314 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v355);
  sub_1B05F18C4((uint64_t)v358);
  swift_bridgeObjectRelease();
  uint64_t v121 = (uint64_t)v377;
  uint64_t v150 = v340;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v340);
  uint64_t v120 = v376;
  uint64_t v151 = v339;
  sub_1B05F1860(v376, (uint64_t)v339);
  if ((v314 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_226:
  uint64_t v315 = v335[28];
  v316 = &v150[v315];
  uint64_t v317 = *(void *)&v150[v315 + 8];
  uint64_t v318 = &v151[v315];
  uint64_t v319 = v318[1];
  if (!v317)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v339);
    sub_1B05F18C4((uint64_t)v340);
    if (!v319) {
      goto LABEL_232;
    }
LABEL_234:
    swift_bridgeObjectRelease();
    uint64_t v120 = v376;
    uint64_t v121 = (uint64_t)v377;
    goto LABEL_48;
  }
  if (!v319)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v339);
    sub_1B05F18C4((uint64_t)v340);
    goto LABEL_234;
  }
  if (*v316 == *v318 && v317 == v319)
  {
    swift_bridgeObjectRetain();
    sub_1B05F18C4((uint64_t)v339);
    sub_1B05F18C4((uint64_t)v340);
    swift_bridgeObjectRelease();
LABEL_232:
    uint64_t v153 = v352;
    sub_1B05F1860((uint64_t)v377, (uint64_t)v352);
    long long v155 = v353;
    sub_1B05F1860(v376, (uint64_t)v353);
    goto LABEL_236;
  }
  char v320 = sub_1B0706220();
  swift_bridgeObjectRetain();
  sub_1B05F18C4((uint64_t)v339);
  sub_1B05F18C4((uint64_t)v340);
  swift_bridgeObjectRelease();
  uint64_t v153 = v352;
  sub_1B05F1860((uint64_t)v377, (uint64_t)v352);
  long long v155 = v353;
  sub_1B05F1860(v376, (uint64_t)v353);
  if ((v320 & 1) == 0) {
    goto LABEL_49;
  }
LABEL_236:
  v321 = v335;
  v322 = (float *)&v153[v335[29]];
  float v323 = *v322;
  char v324 = *((unsigned char *)v322 + 4);
  sub_1B05F18C4((uint64_t)v153);
  v325 = (float *)&v155[v321[29]];
  float v326 = *v325;
  uint64_t v156 = *((unsigned __int8 *)v325 + 4);
  sub_1B05F18C4((uint64_t)v155);
  if ((v324 & 1) == 0) {
    return (v323 == v326) & ~v156;
  }
  return v156;
}

uint64_t sub_1B05F1860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B05F18C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MediaInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B05F1920()
{
  unint64_t result = qword_1E9B356C8;
  if (!qword_1E9B356C8)
  {
    sub_1B0705750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9B356C8);
  }
  return result;
}

uint64_t sub_1B05F196C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B05D4EC8(a1, a2);
  }
  return a1;
}

unint64_t sub_1B05F1980(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_1B05F1990(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return MEMORY[0x1F4188298](sub_1B05F19B0, 0, 0);
}

uint64_t sub_1B05F19B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  uint64_t v2 = (void *)*MEMORY[0x1E4F15C80];
  *(void *)(inited + 32) = *MEMORY[0x1E4F15C80];
  sub_1B07060B0();
  id v3 = v2;
  *(void *)(v0 + 88) = sub_1B07060A0();
  uint64_t v5 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F1A80, v5, v4);
}

uint64_t sub_1B05F1A80()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 96) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F1B28, 0, 0);
}

uint64_t sub_1B05F1B28()
{
  if (v0[12])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[13] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[14] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F1C34;
    return MEMORY[0x1F4182DC0](v0 + 7, v1);
  }
  else
  {
    id v3 = (uint64_t (*)(void, void))v0[1];
    return v3(0, 0);
  }
}

uint64_t sub_1B05F1C34()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F64AC;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F64C4;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F1D7C(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return MEMORY[0x1F4188298](sub_1B05F1D9C, 0, 0);
}

uint64_t sub_1B05F1D9C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  *(void *)(inited + 32) = @"avkt/com.apple.avkit.programScheduledTime";
  sub_1B07060B0();
  uint64_t v2 = @"avkt/com.apple.avkit.programScheduledTime";
  *(void *)(v0 + 88) = sub_1B07060A0();
  uint64_t v4 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F1E6C, v4, v3);
}

uint64_t sub_1B05F1E6C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 96) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F1F14, 0, 0);
}

uint64_t sub_1B05F1F14()
{
  if (v0[12])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[13] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[14] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F2020;
    return MEMORY[0x1F4182DC0](v0 + 7, v1);
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(void, void))v0[1];
    return v3(0, 0);
  }
}

uint64_t sub_1B05F2020()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F21CC;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F2168;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F2168()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v1, v2);
}

uint64_t sub_1B05F21CC()
{
  uint64_t v1 = *(uint64_t (**)(void, void))(v0 + 8);
  return v1(0, 0);
}

uint64_t sub_1B05F2234(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return MEMORY[0x1F4188298](sub_1B05F2254, 0, 0);
}

uint64_t sub_1B05F2254()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B071FFD0;
  if (qword_1E9B34E10 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9B3A348;
  uint64_t v3 = (void *)*MEMORY[0x1E4F15DB0];
  *(void *)(inited + 32) = qword_1E9B3A348;
  *(void *)(inited + 40) = v3;
  sub_1B07060B0();
  id v4 = v2;
  id v5 = v3;
  *(void *)(v0 + 96) = sub_1B07060A0();
  uint64_t v7 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F236C, v7, v6);
}

uint64_t sub_1B05F236C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F2414, 0, 0);
}

uint64_t sub_1B05F2414()
{
  if (v0[13])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[14] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F2520;
    return MEMORY[0x1F4182DC0](v0 + 8, v1);
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(void, void))v0[1];
    return v3(0, 0);
  }
}

uint64_t sub_1B05F2520()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F2668;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F64C8;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F2668()
{
  uint64_t v1 = *(uint64_t (**)(void, void))(v0 + 8);
  return v1(0, 0);
}

uint64_t sub_1B05F26D0(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return MEMORY[0x1F4188298](sub_1B05F26F0, 0, 0);
}

uint64_t sub_1B05F26F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  uint64_t v2 = (void *)*MEMORY[0x1E4F15C58];
  *(void *)(inited + 32) = *MEMORY[0x1E4F15C58];
  sub_1B07060B0();
  id v3 = v2;
  *(void *)(v0 + 88) = sub_1B07060A0();
  uint64_t v5 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F1A80, v5, v4);
}

uint64_t sub_1B05F27C0(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return MEMORY[0x1F4188298](sub_1B05F27E0, 0, 0);
}

uint64_t sub_1B05F27E0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B071FFD0;
  uint64_t v2 = self;
  sub_1B0706040();
  id v3 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E4F15E08]);

  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(inited + 32) = v4;
  sub_1B0706040();
  uint64_t v8 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v8, *MEMORY[0x1E4F15DF8]);

  if (!v9)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F4188298](v5, v6, v7);
  }
  *(void *)(inited + 40) = v9;
  sub_1B07060B0();
  *(void *)(v0 + 96) = sub_1B07060A0();
  uint64_t v10 = sub_1B0706090();
  uint64_t v12 = v11;
  uint64_t v5 = sub_1B05F297C;
  uint64_t v6 = v10;
  uint64_t v7 = v12;
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1B05F297C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F2A24, 0, 0);
}

uint64_t sub_1B05F2A24()
{
  if (v0[13])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[14] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F2B30;
    return MEMORY[0x1F4182DC0](v0 + 8, v1);
  }
  else
  {
    id v3 = (uint64_t (*)(void, void))v0[1];
    return v3(0, 0);
  }
}

uint64_t sub_1B05F2B30()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F64B0;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F64C8;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F2C78(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return MEMORY[0x1F4188298](sub_1B05F2C98, 0, 0);
}

uint64_t sub_1B05F2C98()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B071FFD0;
  uint64_t v2 = self;
  sub_1B0706040();
  uint64_t v3 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E4F15DE0]);

  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(inited + 32) = v4;
  sub_1B0706040();
  uint64_t v8 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v8, *MEMORY[0x1E4F15E08]);

  if (!v9)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F4188298](v5, v6, v7);
  }
  *(void *)(inited + 40) = v9;
  sub_1B07060B0();
  *(void *)(v0 + 96) = sub_1B07060A0();
  uint64_t v10 = sub_1B0706090();
  uint64_t v12 = v11;
  uint64_t v5 = sub_1B05F2E34;
  uint64_t v6 = v10;
  uint64_t v7 = v12;
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1B05F2E34()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F2EDC, 0, 0);
}

uint64_t sub_1B05F2EDC()
{
  if (v0[13])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D60);
    uint64_t v1 = sub_1B07057D0();
    v0[14] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F2FE8;
    return MEMORY[0x1F4182DC0](v0 + 8, v1);
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(void, unint64_t))v0[1];
    return v3(0, 0xF000000000000000);
  }
}

uint64_t sub_1B05F2FE8()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F3194;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F3130;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F3130()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v1, v2);
}

uint64_t sub_1B05F3194()
{
  uint64_t v1 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
  return v1(0, 0xF000000000000000);
}

uint64_t sub_1B05F31FC(uint64_t a1)
{
  *(void *)(v1 + 112) = a1;
  return MEMORY[0x1F4188298](sub_1B05F321C, 0, 0);
}

uint64_t sub_1B05F321C()
{
  v0[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  v0[16] = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B0720730;
  if (qword_1E9B34E18 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9B3A350;
  *(void *)(inited + 32) = qword_1E9B3A350;
  v0[17] = sub_1B07060B0();
  id v3 = v2;
  v0[18] = sub_1B07060A0();
  uint64_t v5 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F332C, v5, v4);
}

uint64_t sub_1B05F332C()
{
  uint64_t v1 = v0[16];
  swift_release();
  sub_1B05E9B40(v1);
  v0[19] = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  v0[20] = v3;
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F33DC, 0, 0);
}

uint64_t sub_1B05F33DC()
{
  if (v0[19])
  {
    uint64_t inited = swift_initStackObject();
    v0[21] = inited;
    *(_OWORD *)(inited + 16) = xmmword_1B0720730;
    if (qword_1E9B34ED8 != -1) {
      swift_once();
    }
    uint64_t v2 = (void *)qword_1E9B3A380;
    *(void *)(inited + 32) = qword_1E9B3A380;
    id v3 = v2;
    v0[22] = sub_1B07060A0();
    uint64_t v5 = sub_1B0706090();
    return MEMORY[0x1F4188298](sub_1B05F3504, v5, v4);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    return v6(0x400000000);
  }
}

uint64_t sub_1B05F3504()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 184) = v2;
  swift_setDeallocating();
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F35A4, 0, 0);
}

uint64_t sub_1B05F35A4()
{
  if (*(void *)(v0 + 184))
  {
    *(void *)(v0 + 192) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35740);
    uint64_t v1 = sub_1B07057B0();
    *(void *)(v0 + 200) = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F36BC;
    return MEMORY[0x1F4182DC0](v0 + 96, v1);
  }
  else
  {

    id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v3(0x400000000);
  }
}

uint64_t sub_1B05F36BC()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F3B20;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F3804;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F3804()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    objc_msgSend(*(id *)(v0 + 96), sel_floatValue);
    unsigned int v3 = v2;

    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(unsigned char *)(v0 + 240) = v1 == 0;
  *(void *)(v0 + 216) = v4;
  uint64_t v5 = sub_1B07057B0();
  *(void *)(v0 + 224) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1B05F3900;
  return MEMORY[0x1F4182DC0](v0 + 104, v5);
}

uint64_t sub_1B05F3900()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F3BE8;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F3A48;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

void sub_1B05F3A48()
{
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1)
  {
    char v2 = *(unsigned char *)(v0 + 240);
    uint64_t v3 = *(void **)(v0 + 184);
    uint64_t v4 = *(void **)(v0 + 152);
    unint64_t v5 = (unint64_t)objc_msgSend(*(id *)(v0 + 104), sel_integerValue);

    if (v2)
    {
      uint64_t v6 = 0x400000000;
    }
    else
    {
      if (v5 > 3)
      {
        __break(1u);
        return;
      }
      uint64_t v6 = *(void *)(v0 + 216) | (v5 << 32);
    }
  }
  else
  {
    uint64_t v7 = *(void **)(v0 + 152);

    uint64_t v6 = 0x400000000;
  }
  uint64_t v8 = *(void (**)(uint64_t))(v0 + 8);
  v8(v6);
}

uint64_t sub_1B05F3B20()
{
  *(unsigned char *)(v0 + 240) = 1;
  *(void *)(v0 + 216) = 0;
  uint64_t v1 = sub_1B07057B0();
  *(void *)(v0 + 224) = v1;
  char v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v2;
  void *v2 = v0;
  v2[1] = sub_1B05F3900;
  return MEMORY[0x1F4182DC0](v0 + 104, v1);
}

uint64_t sub_1B05F3BE8()
{
  uint64_t v1 = *(void **)(v0 + 152);

  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(0x400000000);
}

uint64_t sub_1B05F3C54(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return MEMORY[0x1F4188298](sub_1B05F3C74, 0, 0);
}

uint64_t sub_1B05F3C74()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1B071FFD0;
  char v2 = self;
  sub_1B0706040();
  uint64_t v3 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E4F15E08]);

  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(inited + 32) = v4;
  sub_1B0706040();
  uint64_t v8 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v8, *MEMORY[0x1E4F15DF0]);

  if (!v9)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F4188298](v5, v6, v7);
  }
  *(void *)(inited + 40) = v9;
  sub_1B07060B0();
  *(void *)(v0 + 96) = sub_1B07060A0();
  uint64_t v10 = sub_1B0706090();
  uint64_t v12 = v11;
  unint64_t v5 = sub_1B05F3E10;
  uint64_t v6 = v10;
  uint64_t v7 = v12;
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1B05F3E10()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  sub_1B05E9B40(v1);
  *(void *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return MEMORY[0x1F4188298](sub_1B05F3EB8, 0, 0);
}

uint64_t sub_1B05F3EB8()
{
  if (v0[13])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D68);
    uint64_t v1 = sub_1B07057C0();
    v0[14] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    void *v2 = v0;
    v2[1] = sub_1B05F3FC0;
    return MEMORY[0x1F4182DC0](v0 + 8, v1);
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3(0);
  }
}

uint64_t sub_1B05F3FC0()
{
  swift_task_dealloc();
  if (v0)
  {

    swift_release();
    uint64_t v1 = sub_1B05F41EC;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1B05F4108;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B05F4108()
{
  id v1 = (id)v0[9];
  uint64_t v2 = (void *)v0[13];
  if (v1)
  {
    id v3 = objc_msgSend(self, sel_shared);
    uint64_t v4 = (void *)sub_1B0706010();
    swift_bridgeObjectRelease();
    id v1 = objc_msgSend(v3, sel_findRatingString_, v4);
  }
  else
  {
  }
  uint64_t v5 = (uint64_t (*)(id))v0[1];
  return v5(v1);
}

uint64_t sub_1B05F41EC()
{
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1B05F4250(uint64_t a1)
{
  v1[3] = a1;
  sub_1B07060B0();
  v1[4] = sub_1B07060A0();
  uint64_t v3 = sub_1B0706090();
  v1[5] = v3;
  v1[6] = v2;
  return MEMORY[0x1F4188298](sub_1B05F42E8, v3, v2);
}

uint64_t sub_1B05F42E8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 24), sel_asset);
  *(void *)(v0 + 56) = v1;
  objc_msgSend(v1, sel_maximumVideoResolution);
  *(double *)(v0 + 64) = v2;
  *(double *)(v0 + 72) = v3;
  if (v3 <= 0.0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (v2 < 3648.0 && v3 < 3648.0) {
      unsigned int v5 = 2;
    }
    else {
      unsigned int v5 = 3;
    }
    if (v3 < 720.0 && v2 < 1280.0) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
  }
  id v8 = objc_msgSend(*(id *)(v0 + 24), sel_tracks);
  sub_1B05F5D00(0, &qword_1E9B34DF0);
  unint64_t v9 = sub_1B0706080();

  uint64_t v38 = MEMORY[0x1E4FBC860];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B0706200();
    uint64_t v10 = swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_17;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    uint64_t v25 = MEMORY[0x1E4FBC860];
    *(void *)(v0 + 80) = MEMORY[0x1E4FBC860];
    if (v25 < 0) {
      goto LABEL_57;
    }
    goto LABEL_37;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12) {
    goto LABEL_36;
  }
LABEL_17:
  if (v12 < 1)
  {
    __break(1u);
    return MEMORY[0x1F4182DC0](v10, v11);
  }
  unsigned int v37 = v7;
  for (uint64_t i = 0; i != v12; ++i)
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x1B3E95340](i, v9);
    }
    else {
      id v14 = *(id *)(v9 + 8 * i + 32);
    }
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_assetTrack);
    if (!v16)
    {
LABEL_19:

      continue;
    }
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v16, sel_mediaType);

    uint64_t v19 = sub_1B0706040();
    uint64_t v21 = v20;
    if (v19 == sub_1B0706040() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v24 = sub_1B0706220();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if ((v24 & 1) == 0) {
        goto LABEL_19;
      }
    }
    sub_1B07061B0();
    sub_1B07061D0();
    sub_1B07061E0();
    sub_1B07061C0();
  }
  swift_bridgeObjectRelease();
  uint64_t v25 = v38;
  uint64_t v7 = v37;
  *(void *)(v0 + 80) = v38;
  if ((v38 & 0x8000000000000000) == 0)
  {
LABEL_37:
    if ((v25 & 0x4000000000000000) != 0) {
      goto LABEL_57;
    }
    uint64_t v26 = *(void *)(v25 + 16);
    *(void *)(v0 + 88) = v26;
    if (v26) {
      goto LABEL_39;
    }
LABEL_52:
    swift_release();

    swift_release();
    uint64_t v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v34(v7);
  }
LABEL_57:
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_1B0706200();
  swift_release();
  *(void *)(v0 + 88) = v36;
  if (!v36) {
    goto LABEL_52;
  }
LABEL_39:
  unint64_t v27 = 0;
  id v1 = (id)(v0 + 16);
  while (1)
  {
    *(unsigned char *)(v0 + 136) = v7;
    uint64_t v28 = *(void *)(v0 + 80);
    if ((v28 & 0xC000000000000001) != 0)
    {
      id v29 = (id)MEMORY[0x1B3E95340](v27);
    }
    else
    {
      if (v27 >= *(void *)(v28 + 16)) {
        goto LABEL_56;
      }
      id v29 = *(id *)(v28 + 8 * v27 + 32);
    }
    uint64_t v30 = v29;
    *(void *)(v0 + 96) = v29;
    *(void *)(v0 + 104) = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    if (!objc_msgSend(v29, sel_isEnabled))
    {
      id v31 = objc_msgSend(v30, sel_assetTrack);
      *(void *)(v0 + 112) = v31;
      if (v31) {
        break;
      }
    }

    unint64_t v27 = *(void *)(v0 + 104);
    if (v27 == *(void *)(v0 + 88))
    {
      id v1 = *(id *)(v0 + 56);
      goto LABEL_52;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D58);
  uint64_t v32 = sub_1B07057A0();
  *(void *)(v0 + 120) = v32;
  uint64_t v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_1B05F478C;
  uint64_t v10 = v0 + 16;
  uint64_t v11 = v32;
  return MEMORY[0x1F4182DC0](v10, v11);
}

uint64_t sub_1B05F478C()
{
  uint64_t v3 = *v1;
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v4 = *(void **)(v2 + 112);
  if (v0)
  {

    swift_release();
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    uint64_t v7 = sub_1B05F4C14;
  }
  else
  {
    swift_release();

    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    uint64_t v7 = sub_1B05F48F4;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1B05F48F4(id a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B0706200();
    a1 = (id)swift_bridgeObjectRelease();
    uint64_t v25 = (void *)(v2 + 16);
    if (v4) {
      goto LABEL_3;
    }
LABEL_27:
    id v16 = *(void **)(v2 + 96);
    swift_bridgeObjectRelease();

    uint64_t v6 = *(unsigned __int8 *)(v2 + 136);
    goto LABEL_28;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v25 = (void *)(v2 + 16);
  if (!v4) {
    goto LABEL_27;
  }
LABEL_3:
  if (v4 < 1)
  {
LABEL_46:
    __break(1u);
    return MEMORY[0x1F4182DC0](a1, a2);
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(unsigned __int8 *)(v2 + 136);
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v7 = (const opaqueCMFormatDescription *)MEMORY[0x1B3E95340](v5, v3);
    }
    else {
      uint64_t v7 = (const opaqueCMFormatDescription *)*(id *)(v3 + 8 * v5 + 32);
    }
    id v8 = v7;
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v7);

    if (Dimensions.height >= 1)
    {
      double v11 = *(double *)(v2 + 64);
      double v10 = *(double *)(v2 + 72);
      if (v10 < 720.0 && v11 < 1280.0)
      {
        if ((v6 & 0xFE) != 0) {
          uint64_t v6 = v6;
        }
        else {
          uint64_t v6 = 1;
        }
      }
      else
      {
        unsigned int v13 = v6;
        if (v6 <= 2u) {
          unsigned int v13 = 2;
        }
        if (v11 < 3648.0 && v10 < 3648.0) {
          uint64_t v6 = v13;
        }
        else {
          uint64_t v6 = 3;
        }
      }
    }
    ++v5;
  }
  while (v4 != v5);
  uint64_t v15 = *(void **)(v2 + 96);
  swift_bridgeObjectRelease();

LABEL_28:
  unint64_t v17 = *(void *)(v2 + 104);
  if (v17 != *(void *)(v2 + 88))
  {
    while (1)
    {
      *(unsigned char *)(v2 + 136) = v6;
      a2 = *(void *)(v2 + 80);
      if ((a2 & 0xC000000000000001) != 0)
      {
        a1 = (id)MEMORY[0x1B3E95340](v17);
      }
      else
      {
        if (v17 >= *(void *)(a2 + 16)) {
          goto LABEL_45;
        }
        a1 = *(id *)(a2 + 8 * v17 + 32);
      }
      uint64_t v21 = a1;
      *(void *)(v2 + 96) = a1;
      *(void *)(v2 + 104) = v17 + 1;
      if (__OFADD__(v17, 1))
      {
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      if (!objc_msgSend(a1, sel_isEnabled))
      {
        id v22 = objc_msgSend(v21, sel_assetTrack);
        *(void *)(v2 + 112) = v22;
        if (v22) {
          break;
        }
      }

      unint64_t v17 = *(void *)(v2 + 104);
      if (v17 == *(void *)(v2 + 88)) {
        goto LABEL_29;
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D58);
    uint64_t v23 = sub_1B07057A0();
    *(void *)(v2 + 120) = v23;
    char v24 = (void *)swift_task_alloc();
    *(void *)(v2 + 128) = v24;
    *char v24 = v2;
    v24[1] = sub_1B05F478C;
    a1 = v25;
    a2 = v23;
    return MEMORY[0x1F4182DC0](a1, a2);
  }
LABEL_29:
  id v18 = *(void **)(v2 + 56);
  swift_release();

  swift_release();
  uint64_t v19 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return v19(v6);
}

uint64_t sub_1B05F4C14()
{
  uint64_t v2 = *(unsigned __int8 *)(v0 + 136);
  unint64_t v3 = *(void *)(v0 + 104);
  if (v3 == *(void *)(v0 + 88))
  {
LABEL_2:
    uint64_t v4 = *(void **)(v0 + 56);
    swift_release();

    swift_release();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v5(v2);
  }
  else
  {
    while (1)
    {
      *(unsigned char *)(v0 + 136) = v2;
      uint64_t v7 = *(void *)(v0 + 80);
      if ((v7 & 0xC000000000000001) != 0)
      {
        id v1 = (id)MEMORY[0x1B3E95340](v3);
      }
      else
      {
        if (v3 >= *(void *)(v7 + 16)) {
          goto LABEL_18;
        }
        id v1 = *(id *)(v7 + 8 * v3 + 32);
      }
      id v8 = v1;
      *(void *)(v0 + 96) = v1;
      *(void *)(v0 + 104) = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
        return MEMORY[0x1F4182DC0](v1, v7);
      }
      if (!objc_msgSend(v1, sel_isEnabled))
      {
        id v9 = objc_msgSend(v8, sel_assetTrack);
        *(void *)(v0 + 112) = v9;
        if (v9) {
          break;
        }
      }

      unint64_t v3 = *(void *)(v0 + 104);
      if (v3 == *(void *)(v0 + 88)) {
        goto LABEL_2;
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D58);
    uint64_t v10 = sub_1B07057A0();
    *(void *)(v0 + 120) = v10;
    double v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v11;
    void *v11 = v0;
    v11[1] = sub_1B05F478C;
    id v1 = (id)(v0 + 16);
    uint64_t v7 = v10;
    return MEMORY[0x1F4182DC0](v1, v7);
  }
}

uint64_t sub_1B05F4DF0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_asset);
  id v2 = objc_msgSend(v1, sel_availableVideoDynamicRanges);
  sub_1B05F5D00(0, &qword_1E9B34E38);
  unint64_t v3 = sub_1B0706080();

  uint64_t v4 = sub_1B05EA5E0(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)v4 + 2);
  if (v5)
  {
    uint64_t v6 = (uint64_t)(v4 + 32);
    uint64_t v7 = 1;
    while (1)
    {
      sub_1B05E6B44(v6, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      id v8 = objc_msgSend(v10, sel_integerValue);

      if (v7 <= (uint64_t)v8) {
        uint64_t v7 = (uint64_t)v8;
      }
      v6 += 32;
      if (!--v5)
      {

        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();

LABEL_10:
    if ((unint64_t)(v7 - 1) <= 7) {
      return (0x300000302030201uLL >> (8 * (v7 - 1)));
    }
    else {
      return 0;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    return 1;
  }
}

uint64_t sub_1B05F4F70(uint64_t a1)
{
  v1[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DD0);
  v1[18] = swift_task_alloc();
  uint64_t v2 = sub_1B0705FD0();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  sub_1B07060B0();
  v1[22] = sub_1B07060A0();
  uint64_t v4 = sub_1B0706090();
  v1[23] = v4;
  v1[24] = v3;
  return MEMORY[0x1F4188298](sub_1B05F5094, v4, v3);
}

uint64_t sub_1B05F5094()
{
  id v1 = objc_msgSend(*(id *)(v0 + 136), sel_tracks);
  sub_1B05F5D00(0, &qword_1E9B34DF0);
  unint64_t v2 = sub_1B0706080();

  uint64_t v30 = MEMORY[0x1E4FBC860];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B0706200();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x1E4FBC860];
    *(void *)(v0 + 200) = MEMORY[0x1E4FBC860];
    if ((v16 & 0x8000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_22;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_51;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x1B3E95340](i, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_assetTrack);
    if (!v7)
    {
LABEL_5:

      continue;
    }
    id v8 = v7;
    id v9 = objc_msgSend(v7, sel_mediaType);

    uint64_t v10 = sub_1B0706040();
    uint64_t v12 = v11;
    if (v10 == sub_1B0706040() && v12 == v13)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v15 = sub_1B0706220();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if ((v15 & 1) == 0) {
        goto LABEL_5;
      }
    }
    sub_1B07061B0();
    sub_1B07061D0();
    sub_1B07061E0();
    sub_1B07061C0();
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = v30;
  *(void *)(v0 + 200) = v30;
  if (v30 < 0) {
    goto LABEL_43;
  }
LABEL_23:
  if ((v16 & 0x4000000000000000) == 0)
  {
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17) {
      goto LABEL_25;
    }
LABEL_46:
    swift_release();
    swift_release();
    uint64_t v25 = 0;
LABEL_47:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v28(v25);
  }
LABEL_43:
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_1B0706200();
  swift_release();
  if (!v27) {
    goto LABEL_46;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1B0706200();
  swift_release();
  if (!v17) {
    goto LABEL_46;
  }
  uint64_t v16 = *(void *)(v0 + 200);
LABEL_25:
  *(void *)(v0 + 208) = v17;
  *(_DWORD *)(v0 + 68) = 1;
  *(_WORD *)(v0 + 65) = 1;
  if ((v16 & 0xC000000000000001) == 0)
  {
    if (*(void *)(v16 + 16))
    {
      id v18 = *(id *)(v16 + 32);
      goto LABEL_29;
    }
LABEL_51:
    __break(1u);
    goto LABEL_46;
  }
  id v18 = (id)MEMORY[0x1B3E95340](0, v16);
LABEL_29:
  uint64_t v19 = v18;
  *(void *)(v0 + 216) = v18;
  *(void *)(v0 + 224) = 1;
  id v20 = objc_msgSend(v18, sel_assetTrack);
  *(void *)(v0 + 232) = v20;
  if (!v20)
  {

    swift_release();
    char v23 = *(unsigned char *)(v0 + 66);
    int v24 = *(unsigned __int8 *)(v0 + 65);
    swift_release();
    if (v24) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = 4;
    }
    if ((v24 & 1) == 0 && (v23 & 1) == 0)
    {
      unsigned int v26 = *(_DWORD *)(v0 + 68);
      if (v26 <= 3)
      {
        if (v26 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = 2;
        }
      }
      else
      {
        uint64_t v25 = 3;
      }
    }
    goto LABEL_47;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D58);
  uint64_t v21 = sub_1B07057A0();
  *(void *)(v0 + 240) = v21;
  id v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v22;
  void *v22 = v0;
  v22[1] = sub_1B05F5500;
  return MEMORY[0x1F4182DC0](v0 + 128, v21);
}

uint64_t sub_1B05F5500()
{
  uint64_t v3 = *v1;
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v4 = *(void **)(v2 + 232);
  if (v0)
  {

    swift_release();
    uint64_t v5 = *(void *)(v3 + 184);
    uint64_t v6 = *(void *)(v3 + 192);
    id v7 = sub_1B05F5A98;
  }
  else
  {
    swift_release();

    uint64_t v5 = *(void *)(v3 + 184);
    uint64_t v6 = *(void *)(v3 + 192);
    id v7 = sub_1B05F5668;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1B05F5668(id a1, uint64_t a2)
{
  uint64_t v3 = (const opaqueCMFormatDescription *)(v2 + 128);
  unint64_t v4 = *(void *)(v2 + 128);
  if (v4 >> 62) {
    goto LABEL_24;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v36 = (const opaqueCMFormatDescription *)(v2 + 128);
  if (!v5)
  {
LABEL_25:
    LOBYTE(v7) = *(unsigned char *)(v2 + 66);
    unsigned int v8 = *(_DWORD *)(v2 + 68);
LABEL_26:
    id v22 = *(void **)(v2 + 216);
    uint64_t v23 = *(void *)(v2 + 224);
    uint64_t v24 = *(void *)(v2 + 208);
    swift_bridgeObjectRelease();

    if (v23 == v24)
    {
      swift_release();
      swift_release();
      if (v7)
      {
        uint64_t v25 = 4;
LABEL_50:
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v34 = *(uint64_t (**)(uint64_t))(v2 + 8);
        return v34(v25);
      }
    }
    else
    {
      unint64_t v26 = *(void *)(v2 + 224);
      *(unsigned char *)(v2 + 66) = v7 & 1;
      *(_DWORD *)(v2 + 68) = v8;
      *(unsigned char *)(v2 + 65) = 0;
      a2 = *(void *)(v2 + 200);
      if ((a2 & 0xC000000000000001) != 0)
      {
        a1 = (id)MEMORY[0x1B3E95340](v26);
      }
      else
      {
        if (v26 >= *(void *)(a2 + 16)) {
          goto LABEL_55;
        }
        a1 = *(id *)(a2 + 8 * v26 + 32);
      }
      uint64_t v27 = a1;
      *(void *)(v2 + 216) = a1;
      *(void *)(v2 + 224) = v26 + 1;
      if (__OFADD__(v26, 1)) {
        goto LABEL_54;
      }
      id v28 = objc_msgSend(a1, sel_assetTrack);
      *(void *)(v2 + 232) = v28;
      if (v28)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D58);
        uint64_t v29 = sub_1B07057A0();
        *(void *)(v2 + 240) = v29;
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v2 + 248) = v30;
        void *v30 = v2;
        v30[1] = sub_1B05F5500;
        a1 = v36;
        a2 = v29;
        return MEMORY[0x1F4182DC0](a1, a2);
      }

      swift_release();
      char v31 = *(unsigned char *)(v2 + 66);
      int v32 = *(unsigned __int8 *)(v2 + 65);
      swift_release();
      if (v32) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = 4;
      }
      if (v32 & 1) != 0 || (v31) {
        goto LABEL_50;
      }
      unsigned int v8 = *(_DWORD *)(v2 + 68);
    }
    if (v8 <= 1) {
      unsigned int v33 = 1;
    }
    else {
      unsigned int v33 = 2;
    }
    if (v8 <= 3) {
      uint64_t v25 = v33;
    }
    else {
      uint64_t v25 = 3;
    }
    goto LABEL_50;
  }
  while (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v40 = (uint64_t)v3 - 56;
    uint64_t v41 = (uint64_t)v3 - 112;
    unint64_t v38 = v4;
    unint64_t v39 = v4 & 0xC000000000000001;
    int v7 = *(unsigned __int8 *)(v2 + 66);
    unsigned int v8 = *(_DWORD *)(v2 + 68);
    uint64_t v37 = v5;
    while (1)
    {
      int v43 = v7;
      if (v39) {
        uint64_t v11 = (const opaqueCMFormatDescription *)MEMORY[0x1B3E95340](v6, v4);
      }
      else {
        uint64_t v11 = (const opaqueCMFormatDescription *)*(id *)(v4 + 8 * v6 + 32);
      }
      uint64_t v3 = v11;
      uint64_t v13 = *(void *)(v2 + 152);
      uint64_t v12 = *(void *)(v2 + 160);
      uint64_t v14 = *(void *)(v2 + 144);
      BOOL v42 = CMAudioFormatDescriptionIsAtmos(v11) != 0;
      sub_1B0706100();
      sub_1B05DA3C0(v40, v41, &qword_1E9B34E00);
      char v15 = *(unsigned char *)(v2 + 64);
      int v16 = *(_DWORD *)(v2 + 56);
      sub_1B07060F0();
      uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
      unint64_t v4 = v12 + 48;
      if (v17(v14, 1, v13) == 1)
      {
        uint64_t v9 = *(void *)(v2 + 144);

        sub_1B05DA364(v9, &qword_1E9B34DD0);
LABEL_6:
        LODWORD(v10) = 0;
        goto LABEL_7;
      }
      (*(void (**)(void, void, void))(*(void *)(v2 + 160) + 32))(*(void *)(v2 + 168), *(void *)(v2 + 144), *(void *)(v2 + 152));
      if (v16) {
        char v18 = v15;
      }
      else {
        char v18 = 1;
      }
      uint64_t v20 = *(void *)(v2 + 160);
      uint64_t v19 = *(void *)(v2 + 168);
      uint64_t v21 = *(void *)(v2 + 152);
      if ((v18 & 1) == 0)
      {

        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
        goto LABEL_6;
      }
      sub_1B0705FC0();
      unint64_t v10 = sub_1B0705FB0();

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      if ((v10 & 0x8000000000000000) != 0) {
        break;
      }
      if (HIDWORD(v10)) {
        goto LABEL_23;
      }
LABEL_7:
      ++v6;
      int v7 = v42 | v43;
      if (v8 <= v10) {
        unsigned int v8 = v10;
      }
      unint64_t v4 = v38;
      if (v37 == v6) {
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B0706200();
    a1 = (id)swift_bridgeObjectRelease();
    uint64_t v36 = v3;
    if (!v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
  return MEMORY[0x1F4182DC0](a1, a2);
}

uint64_t sub_1B05F5A98()
{
  swift_release();
  char v1 = *(unsigned char *)(v0 + 66);
  int v2 = *(unsigned __int8 *)(v0 + 65);
  swift_release();
  if (v2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 4;
  }
  if ((v2 & 1) == 0 && (v1 & 1) == 0)
  {
    unsigned int v4 = *(_DWORD *)(v0 + 68);
    if (v4 <= 1) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 2;
    }
    if (v4 <= 3) {
      uint64_t v3 = v5;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v3);
}

uint64_t CMAudioFormatDescriptionIsAtmos(const opaqueCMFormatDescription *a1)
{
  signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a1);
  uint64_t result = 1;
  if (MediaSubType <= 1885692722)
  {
    if (MediaSubType > 1700997938)
    {
      if (MediaSubType == 1700997939) {
        return result;
      }
      if (MediaSubType != 1700998451)
      {
        int v4 = 1885547315;
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (MediaSubType == 1667574579) {
      return result;
    }
    int v5 = 1667575091;
LABEL_12:
    if (MediaSubType != v5) {
      return 0;
    }
    goto LABEL_16;
  }
  if (MediaSubType > 1902469938)
  {
    if (MediaSubType == 2053464883) {
      goto LABEL_16;
    }
    if (MediaSubType == 2053319475) {
      return result;
    }
    int v5 = 1902469939;
    goto LABEL_12;
  }
  if (MediaSubType != 1885692723)
  {
    int v4 = 1902324531;
    goto LABEL_24;
  }
LABEL_16:
  size_t sizeOut = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(a1, &sizeOut);
  uint64_t result = 0;
  if (FormatList && sizeOut >= 0x30)
  {
    signed int MediaSubType = FormatList->mASBD.mFormatID;
    uint64_t result = 1;
    if (MediaSubType <= 1885547314)
    {
      if (MediaSubType == 1667574579) {
        return result;
      }
      int v4 = 1700997939;
LABEL_24:
      if (MediaSubType == v4) {
        return result;
      }
      return 0;
    }
    if (MediaSubType != 1885547315 && MediaSubType != 1902324531)
    {
      int v4 = 2053319475;
      goto LABEL_24;
    }
  }
  return result;
}

_OWORD *sub_1B05F5CF0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B05F5D00(uint64_t a1, unint64_t *a2)
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MediaInfo.AudioFormat(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MediaInfo.AudioFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1B05F5EA4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaInfo.AudioFormat()
{
  return &type metadata for MediaInfo.AudioFormat;
}

ValueMetadata *type metadata accessor for MediaInfo.VideoRange()
{
  return &type metadata for MediaInfo.VideoRange;
}

ValueMetadata *type metadata accessor for MediaInfo.VideoResolution()
{
  return &type metadata for MediaInfo.VideoResolution;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MediaInfo.TomatoRating(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaInfo.TomatoRating(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaInfo.TomatoRating()
{
  return &type metadata for MediaInfo.TomatoRating;
}

uint64_t getEnumTagSinglePayload for MediaInfo.MediaType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MediaInfo.MediaType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1B05F6110);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1B05F6138(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B05F6140(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MediaInfo.MediaType()
{
  return &type metadata for MediaInfo.MediaType;
}

unint64_t sub_1B05F615C()
{
  unint64_t result = qword_1E9B35750;
  if (!qword_1E9B35750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35750);
  }
  return result;
}

unint64_t sub_1B05F61B4()
{
  unint64_t result = qword_1E9B35758;
  if (!qword_1E9B35758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35758);
  }
  return result;
}

unint64_t sub_1B05F620C()
{
  unint64_t result = qword_1E9B35760;
  if (!qword_1E9B35760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35760);
  }
  return result;
}

unint64_t sub_1B05F6264()
{
  unint64_t result = qword_1E9B35768;
  if (!qword_1E9B35768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35768);
  }
  return result;
}

uint64_t _s5AVKit9MediaInfoV12TomatoRatingV9FreshnessOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s5AVKit9MediaInfoV12TomatoRatingV9FreshnessOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1B05F6414);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaInfo.TomatoRating.Freshness()
{
  return &type metadata for MediaInfo.TomatoRating.Freshness;
}

unint64_t sub_1B05F6450()
{
  unint64_t result = qword_1E9B35770;
  if (!qword_1E9B35770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9B35770);
  }
  return result;
}

uint64_t sub_1B05F662C(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
  *(void *)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions) = a1;
  swift_bridgeObjectRetain();
  unsigned __int8 v4 = sub_1B05F8298(v3, a1);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    sub_1B05F7BC0();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B05F669C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for MediaInfo();
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  unsigned int v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  int v8 = &v11[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata;
  swift_beginAccess();
  sub_1B05F1860(v9, (uint64_t)v8);
  swift_beginAccess();
  sub_1B05F8848(a1, v9);
  swift_endAccess();
  sub_1B05F1860(v9, (uint64_t)v6);
  LOBYTE(v9) = sub_1B05EE77C(v8, v6);
  sub_1B05F18C4((uint64_t)v6);
  if ((v9 & 1) == 0) {
    sub_1B05F7BC0();
  }
  sub_1B05F18C4(a1);
  return sub_1B05F18C4((uint64_t)v8);
}

id sub_1B05F67C8(void *a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem;
  *(void *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem] = 0;
  *(void *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken] = 0;
  unsigned int v6 = *(void **)&v2[v5];
  *(void *)&v2[v5] = a1;
  uint64_t v7 = v2;
  id v8 = a1;

  *(void *)&v7[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions] = a2;
  uint64_t v9 = &v7[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata];
  unint64_t v10 = (int *)type metadata accessor for MediaInfo();
  uint64_t v11 = &v9[v10[7]];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = &v9[v10[22]];
  uint64_t v14 = sub_1B0705750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  char v15 = &v9[v10[8]];
  *(void *)char v15 = 0;
  *((void *)v15 + 1) = 0;
  int v16 = &v9[v10[9]];
  *(void *)int v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = &v9[v10[10]];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  *(_OWORD *)&v9[v10[11]] = xmmword_1B0720B30;
  v9[v10[12]] = 0;
  char v18 = &v9[v10[13]];
  v18[4] = 4;
  *(_DWORD *)char v18 = 0;
  *(void *)&v9[v10[14]] = 0;
  v9[v10[15]] = 0;
  v9[v10[16]] = 0;
  v9[v10[17]] = 0;
  uint64_t v19 = &v9[v10[18]];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  v19[24] = 1;
  uint64_t v20 = &v9[v10[19]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = 0;
  v20[24] = 1;
  v9[v10[20]] = 0;
  v9[v10[21]] = 0;
  v9[v10[23]] = 0;
  uint64_t v21 = &v9[v10[24]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  id v22 = &v9[v10[25]];
  *(void *)id v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = &v9[v10[26]];
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = 0;
  uint64_t v24 = &v9[v10[27]];
  *(void *)uint64_t v24 = 0;
  *((void *)v24 + 1) = 0;
  uint64_t v25 = &v9[v10[28]];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  unint64_t v26 = &v9[v10[29]];
  *(_DWORD *)unint64_t v26 = 0;
  v26[4] = 1;

  v32.receiver = v7;
  v32.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  id v27 = objc_msgSendSuper2(&v32, sel_initWithNibName_bundle_, 0, 0);
  id v28 = (void *)sub_1B0706010();
  uint64_t v29 = (void *)sub_1B0706010();
  id v30 = AVLocalizedString(v28);

  if (!v30)
  {
    sub_1B0706040();
    id v30 = (id)sub_1B0706010();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v27, sel_setTitle_, v30);

  return v27;
}

void sub_1B05F6CA4()
{
  v28.receiver = v0;
  v28.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  objc_msgSendSuper2(&v28, sel_viewDidLayoutSubviews);
  uint64_t v1 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController;
  int v2 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController];
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_view);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_msgSend(v0, sel_view);
      if (v5)
      {
        unsigned int v6 = v5;
        objc_msgSend(v5, sel_bounds);
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
        char v15 = *(void **)&v0[v1];
        if (!v15) {
          return;
        }
        id v16 = objc_msgSend(v15, sel_view);
        if (v16)
        {
          uint64_t v17 = v16;
          objc_msgSend(v16, sel_transform);
          long long v25 = *(_OWORD *)&v27.c;
          long long v26 = *(_OWORD *)&v27.a;
          long long v24 = *(_OWORD *)&v27.tx;

          char v18 = *(void **)&v0[v1];
          if (!v18) {
            return;
          }
          id v19 = objc_msgSend(v18, sel_view);
          if (v19)
          {
            uint64_t v20 = v19;
            CGAffineTransformMakeScale(&v27, 1.01, 1.01);
            objc_msgSend(v20, sel_setTransform_, &v27);

            uint64_t v21 = *(void **)&v0[v1];
            if (!v21) {
              return;
            }
            id v22 = objc_msgSend(v21, sel_view);
            if (v22)
            {
              uint64_t v23 = v22;
              *(_OWORD *)&v27.a = v26;
              *(_OWORD *)&v27.c = v25;
              *(_OWORD *)&v27.tx = v24;
              objc_msgSend(v22, sel_setTransform_, &v27);

              return;
            }
LABEL_16:
            __break(1u);
            return;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

id sub_1B05F6ED4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  id v3 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken];
  if (v3)
  {
    id v4 = v3;
    sub_1B0705610();

    id v3 = *(void **)&v1[v2];
  }
  *(void *)&v1[v2] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

uint64_t sub_1B05F6FF0()
{
  return type metadata accessor for AVInfoTabViewController();
}

uint64_t type metadata accessor for AVInfoTabViewController()
{
  uint64_t result = qword_1E9B34DA0;
  if (!qword_1E9B34DA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B05F7044()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController;
  if (!*(void *)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController])
  {
    uint64_t v6 = (uint64_t)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata];
    swift_beginAccess();
    sub_1B05F1860(v6, (uint64_t)v4);
    uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions];
    *(void *)&v4[*(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)] = v7;
    double v8 = (uint64_t *)&v4[v2[5]];
    uint64_t *v8 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    swift_storeEnumTagMultiPayload();
    double v9 = (uint64_t *)&v4[v2[6]];
    uint64_t *v9 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    double v10 = &v4[v2[7]];
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    type metadata accessor for CGSize(0);
    swift_bridgeObjectRetain();
    sub_1B0705ED0();
    uint64_t v11 = v31;
    *(_OWORD *)double v10 = v30;
    *((void *)v10 + 2) = v11;
    double v12 = &v4[v2[8]];
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    sub_1B0705ED0();
    uint64_t v13 = v31;
    *(_OWORD *)double v12 = v30;
    *((void *)v12 + 2) = v13;
    id v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35798));
    uint64_t v15 = sub_1B0705AE0();
    id v16 = *(void **)&v1[v5];
    *(void *)&v1[v5] = v15;

    uint64_t v17 = *(void **)&v1[v5];
    if (v17)
    {
      objc_msgSend(v17, sel_willMoveToParentViewController_, v1);
      char v18 = *(void **)&v1[v5];
      if (v18)
      {
        id v19 = objc_msgSend(v18, sel_view);
        if (v19)
        {
          uint64_t v20 = v19;
          id v21 = objc_msgSend(self, sel_clearColor);
          objc_msgSend(v20, sel_setBackgroundColor_, v21);

          if (*(void *)&v1[v5])
          {
            objc_msgSend(v1, sel_addChildViewController_);
            id v22 = objc_msgSend(v1, sel_view);
            if (v22)
            {
              uint64_t v23 = v22;
              long long v24 = *(void **)&v1[v5];
              if (v24)
              {
                id v25 = objc_msgSend(v24, sel_view);
                if (v25)
                {
                  long long v26 = v25;
                  objc_msgSend(v23, sel_addSubview_, v25);

                  CGAffineTransform v27 = *(void **)&v1[v5];
                  if (v27)
                  {
                    objc_msgSend(v27, sel_didMoveToParentViewController_, v1);
                    return;
                  }
LABEL_19:
                  __break(1u);
                  return;
                }
LABEL_18:
                __break(1u);
                goto LABEL_19;
              }
LABEL_17:
              __break(1u);
              goto LABEL_18;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

void sub_1B05F7344(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_tracks);
  sub_1B05F5D00(0, &qword_1E9B34DF0);
  uint64_t v4 = sub_1B0706080();

  *a2 = v4;
}

void sub_1B05F73B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1B3E968D0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_1B05F740C();
  }
}

void sub_1B05F740C()
{
  uint64_t v1 = (int *)type metadata accessor for MediaInfo();
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (_OWORD *)((char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DD8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem];
  if (v7)
  {
    uint64_t v8 = sub_1B07060D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_1B07060B0();
    id v9 = v7;
    double v10 = v0;
    uint64_t v11 = sub_1B07060A0();
    double v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x1E4FBCFD8];
    _OWORD v12[2] = v11;
    unint64_t v12[3] = v13;
    v12[4] = v9;
    v12[5] = v10;
    sub_1B05F7A1C((uint64_t)v6, (uint64_t)&unk_1E9B35780, (uint64_t)v12);
    swift_release();
  }
  else
  {
    id v14 = (char *)v3 + v1[7];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34D30);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    id v16 = (char *)v3 + v1[22];
    uint64_t v17 = sub_1B0705750();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
    v3[1] = 0u;
    v3[2] = 0u;
    _OWORD *v3 = 0u;
    char v18 = (void *)((char *)v3 + v1[8]);
    void *v18 = 0;
    v18[1] = 0;
    id v19 = (void *)((char *)v3 + v1[9]);
    void *v19 = 0;
    v19[1] = 0;
    uint64_t v20 = (void *)((char *)v3 + v1[10]);
    *uint64_t v20 = 0;
    v20[1] = 0;
    *(_OWORD *)((char *)v3 + v1[11]) = xmmword_1B0720B30;
    *((unsigned char *)v3 + v1[12]) = 0;
    id v21 = (char *)v3 + v1[13];
    void v21[4] = 4;
    *(_DWORD *)id v21 = 0;
    *(void *)((char *)v3 + v1[14]) = 0;
    *((unsigned char *)v3 + v1[15]) = 0;
    *((unsigned char *)v3 + v1[16]) = 0;
    *((unsigned char *)v3 + v1[17]) = 0;
    id v22 = (char *)v3 + v1[18];
    *(void *)id v22 = 0;
    *((void *)v22 + 1) = 0;
    *((void *)v22 + 2) = 0;
    v22[24] = 1;
    uint64_t v23 = (char *)v3 + v1[19];
    *(void *)uint64_t v23 = 0;
    *((void *)v23 + 1) = 0;
    *((void *)v23 + 2) = 0;
    v23[24] = 1;
    *((unsigned char *)v3 + v1[20]) = 0;
    *((unsigned char *)v3 + v1[21]) = 0;
    *((unsigned char *)v3 + v1[23]) = 0;
    long long v24 = (void *)((char *)v3 + v1[24]);
    *long long v24 = 0;
    v24[1] = 0;
    id v25 = (void *)((char *)v3 + v1[25]);
    *id v25 = 0;
    v25[1] = 0;
    long long v26 = (void *)((char *)v3 + v1[26]);
    *long long v26 = 0;
    v26[1] = 0;
    CGAffineTransform v27 = (void *)((char *)v3 + v1[27]);
    *CGAffineTransform v27 = 0;
    v27[1] = 0;
    uint64_t v28 = (void *)((char *)v3 + v1[28]);
    *uint64_t v28 = 0;
    v28[1] = 0;
    uint64_t v29 = (char *)v3 + v1[29];
    *(_DWORD *)uint64_t v29 = 0;
    v29[4] = 1;
    sub_1B05F669C((uint64_t)v3);
  }
}

uint64_t sub_1B05F7744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a5;
  type metadata accessor for MediaInfo();
  v5[3] = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  v5[4] = v7;
  v5[5] = sub_1B07060B0();
  v5[6] = sub_1B07060A0();
  uint64_t v8 = (void *)swift_task_alloc();
  v5[7] = v8;
  void *v8 = v5;
  v8[1] = sub_1B05F7844;
  return sub_1B05EC6F8(v7, a4);
}

uint64_t sub_1B05F7844()
{
  swift_task_dealloc();
  uint64_t v1 = sub_1B0706090();
  return MEMORY[0x1F4188298](sub_1B05F7980, v1, v0);
}

uint64_t sub_1B05F7980()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  swift_release();
  sub_1B05F1860(v1, v2);
  sub_1B05F669C(v2);
  sub_1B05F18C4(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1B05F7A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B07060D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B07060C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B05F8238(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B0706090();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1B05F7BC0()
{
  uint64_t v1 = (int *)type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController);
  if (v4)
  {
    uint64_t v5 = v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata;
    swift_beginAccess();
    sub_1B05F1860(v5, (uint64_t)v3);
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
    *(void *)&v3[*(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)] = v6;
    uint64_t v7 = (uint64_t *)&v3[v1[5]];
    *uint64_t v7 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34E68);
    swift_storeEnumTagMultiPayload();
    uint64_t v8 = (uint64_t *)&v3[v1[6]];
    uint64_t *v8 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    id v9 = &v3[v1[7]];
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    type metadata accessor for CGSize(0);
    id v10 = v4;
    swift_bridgeObjectRetain();
    sub_1B0705ED0();
    uint64_t v11 = v17;
    *(_OWORD *)id v9 = v16;
    *((void *)v9 + 2) = v11;
    double v12 = &v3[v1[8]];
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    sub_1B0705ED0();
    uint64_t v13 = v17;
    *(_OWORD *)double v12 = v16;
    *((void *)v12 + 2) = v13;
    sub_1B0705AF0();
  }
}

uint64_t sub_1B05F7E0C()
{
  uint64_t result = type metadata accessor for MediaInfo();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B05F7EB8()
{
  return sub_1B07059E0();
}

uint64_t sub_1B05F7EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B05F7F20(a1, a2, a3, a4, MEMORY[0x1F418F358]);
}

uint64_t sub_1B05F7EFC()
{
  return sub_1B07059F0();
}

uint64_t sub_1B05F7F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B05F7FD4(a1, (uint64_t)v9);
  return a5(v9);
}

uint64_t sub_1B05F7FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B05F7F20(a1, a2, a3, a4, MEMORY[0x1F418F3A8]);
}

uint64_t sub_1B05F7FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B05F803C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B05F8084(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1B05F8144;
  return sub_1B05F7744(a1, v4, v5, v7, v6);
}

uint64_t sub_1B05F8144()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B05F8238(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B34DD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1B05F8298(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1B0706200();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1B0706200();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x1B3E95340](0, v3))
  {
    uint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x1B3E95340](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_1B05F5D00(0, (unint64_t *)&qword_1E9B34E40);
    char v14 = sub_1B0706140();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x1B3E95340](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        id v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x1B3E95340](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        id v21 = v20;
        unint64_t v5 = sub_1B0706140();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      id v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        CGAffineTransform v27 = *v25++;
        long long v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_1B0706140();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B05F8584(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_1B05F8660;
  return v6(a1);
}

uint64_t sub_1B05F8660()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B05F8758()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B05F8790(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1B05F8144;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9B35788 + dword_1E9B35788);
  return v6(a1, v4);
}

uint64_t sub_1B05F8848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_1B05F88AC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem;
  unint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem);
  if (a1)
  {
    if (v5)
    {
      sub_1B05F5D00(0, &qword_1E9B34DE0);
      id v6 = v5;
      id v7 = a1;
      char v8 = sub_1B0706140();

      if (v8) {
        goto LABEL_9;
      }
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  uint64_t v9 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken);
  if (v10)
  {
    id v11 = v10;
    sub_1B0705610();

    uint64_t v10 = *(void **)(v2 + v9);
  }
  *(void *)(v2 + v9) = 0;

LABEL_9:
  id v12 = *(void **)(v2 + v4);
  *(void *)(v2 + v4) = a1;
  id v13 = a1;

  uint64_t v14 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  if (!*(void *)(v2 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken))
  {
    unint64_t v15 = *(void **)(v2 + v4);
    if (v15)
    {
      id v18 = *(void **)(v2 + v4);
      swift_getKeyPath();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      id v16 = v15;
      unint64_t v15 = (void *)sub_1B0705640();
      swift_release();
      swift_release();

      unint64_t v17 = *(void **)(v2 + v14);
    }
    else
    {
      unint64_t v17 = 0;
    }
    *(void *)(v2 + v14) = v15;
  }
  sub_1B05F740C();
}

char *keypath_get_selector_tracks()
{
  return sel_tracks;
}

uint64_t sub_1B05F8A54()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B05F8A8C(uint64_t a1, uint64_t a2)
{
  sub_1B05F73B8(a1, a2, v2);
}

uint64_t getEnumTagSinglePayload for AVChromelessButtonStyle(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AVChromelessButtonStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x1B05F8C00);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVChromelessButtonStyle()
{
  return &type metadata for AVChromelessButtonStyle;
}

uint64_t sub_1B05F8C38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05F8C54(uint64_t a1)
{
  return sub_1B05F8C7C(a1, MEMORY[0x1F4190398], &qword_1E9B3A388);
}

uint64_t sub_1B05F8C68(uint64_t a1)
{
  return sub_1B05F8C7C(a1, MEMORY[0x1F4190350], &qword_1E9B3A390);
}

uint64_t sub_1B05F8C7C(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  a2();
  uint64_t v4 = sub_1B0705CB0();
  uint64_t result = swift_release();
  *a3 = v4;
  return result;
}

uint64_t sub_1B05F8CC4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v116 = a2;
  uint64_t v111 = a3;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357A0);
  uint64_t v109 = *(void *)(v110 - 8);
  MEMORY[0x1F4188790](v110);
  uint64_t v108 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357A8);
  MEMORY[0x1F4188790](v130);
  uint64_t v131 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357B0);
  MEMORY[0x1F4188790](v127);
  uint64_t v129 = (uint64_t)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357B8);
  MEMORY[0x1F4188790](v125);
  uint64_t v126 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357C0);
  uint64_t v123 = *(void *)(v8 - 8);
  uint64_t v124 = v8;
  MEMORY[0x1F4188790](v8);
  v122 = (char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357C8);
  MEMORY[0x1F4188790](v120);
  uint64_t v121 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357D0);
  MEMORY[0x1F4188790](v117);
  uint64_t v119 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357D8);
  MEMORY[0x1F4188790](v115);
  uint64_t v118 = (uint64_t)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357E0);
  MEMORY[0x1F4188790](v113);
  uint64_t v114 = (uint64_t)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357E8);
  MEMORY[0x1F4188790](v112);
  unint64_t v15 = (char *)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357F0);
  uint64_t v17 = v16 - 8;
  MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B357F8);
  uint64_t v21 = v20 - 8;
  MEMORY[0x1F4188790](v20);
  unint64_t v23 = (char *)&v107 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1B0705BD0();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  CGAffineTransform v27 = (char *)&v107 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = a1;
  sub_1B0705BE0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v23, v27, v24);
  uint64_t v29 = &v23[*(int *)(v21 + 44)];
  *(void *)uint64_t v29 = KeyPath;
  *((void *)v29 + 1) = 2;
  v29[16] = 0;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  sub_1B0705F70();
  sub_1B07058B0();
  sub_1B05DA300((uint64_t)v23, (uint64_t)v19, &qword_1E9B357F8);
  unint64_t v30 = &v19[*(int *)(v17 + 44)];
  long long v31 = v133;
  *(_OWORD *)unint64_t v30 = v132;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v134;
  sub_1B05DA364((uint64_t)v23, &qword_1E9B357F8);
  LOBYTE(v23) = sub_1B0705C70();
  unsigned __int8 v32 = sub_1B0705C90();
  char v33 = sub_1B0705C80();
  sub_1B0705C80();
  if (sub_1B0705C80() != v23) {
    char v33 = sub_1B0705C80();
  }
  sub_1B0705C80();
  if (sub_1B0705C80() != v32) {
    char v33 = sub_1B0705C80();
  }
  uint64_t v34 = v130;
  int v35 = v116 & 1;
  sub_1B0705840();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  sub_1B05DA300((uint64_t)v19, (uint64_t)v15, &qword_1E9B357F0);
  uint64_t v44 = &v15[*(int *)(v112 + 36)];
  *uint64_t v44 = v33;
  *((void *)v44 + 1) = v37;
  *((void *)v44 + 2) = v39;
  *((void *)v44 + 3) = v41;
  *((void *)v44 + 4) = v43;
  v44[40] = 0;
  sub_1B05DA364((uint64_t)v19, &qword_1E9B357F0);
  if (!v35)
  {
    if (qword_1E9B34EE8 != -1) {
      swift_once();
    }
    uint64_t v45 = &qword_1E9B3A390;
    goto LABEL_11;
  }
  if (qword_1E9B34EE0 != -1) {
    goto LABEL_17;
  }
  while (1)
  {
    uint64_t v45 = &qword_1E9B3A388;
LABEL_11:
    uint64_t v46 = *v45;
    swift_retain();
    uint64_t v47 = swift_getKeyPath();
    uint64_t v48 = v114;
    sub_1B05DA300((uint64_t)v15, v114, &qword_1E9B357E8);
    uint64_t v49 = (uint64_t *)(v48 + *(int *)(v113 + 36));
    *uint64_t v49 = v47;
    v49[1] = v46;
    sub_1B05DA364((uint64_t)v15, &qword_1E9B357E8);
    uint64_t v50 = sub_1B0705E40();
    uint64_t v51 = swift_getKeyPath();
    uint64_t v52 = v118;
    sub_1B05DA300(v48, v118, &qword_1E9B357E0);
    uint64_t v53 = (uint64_t *)(v52 + *(int *)(v115 + 36));
    *uint64_t v53 = v51;
    v53[1] = v50;
    sub_1B05DA364(v48, &qword_1E9B357E0);
    uint64_t v54 = sub_1B0705F60();
    uint64_t v55 = *(void *)(v54 - 8);
    MEMORY[0x1F4188790](v54);
    uint64_t v57 = (char *)&v107 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B0705F50();
    char v58 = sub_1B0705C60();
    uint64_t v59 = (uint64_t)v119;
    uint64_t v60 = &v119[*(int *)(v117 + 36)];
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v60, v57, v54);
    v60[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35458) + 36)] = v58;
    sub_1B05DA300(v52, v59, &qword_1E9B357D8);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
    sub_1B05DA364(v52, &qword_1E9B357D8);
    uint64_t v61 = sub_1B0705950();
    uint64_t v62 = MEMORY[0x1F4188790](v61 - 8);
    uint64_t v64 = (_OWORD *)((char *)&v107 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v65 = (char *)v64 + *(int *)(v62 + 28);
    uint64_t v66 = *MEMORY[0x1E4F3D4A8];
    uint64_t v67 = sub_1B0705A80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v65, v66, v67);
    __asm { FMOV            V0.2D, #8.0 }
    _OWORD *v64 = _Q0;
    uint64_t v73 = (uint64_t)v121;
    uint64_t v74 = (uint64_t)&v121[*(int *)(v120 + 36)];
    sub_1B05F9E48((uint64_t)v64, v74);
    *(_WORD *)(v74 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B354E0) + 36)) = 256;
    sub_1B05DA300(v59, v73, &qword_1E9B357D0);
    sub_1B05F9EAC((uint64_t)v64);
    sub_1B05DA364(v59, &qword_1E9B357D0);
    uint64_t v75 = sub_1B0705920();
    uint64_t v76 = *(void *)(v75 - 8);
    MEMORY[0x1F4188790](v75);
    uint64_t v78 = (char *)&v107 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B0705970();
    sub_1B05F9F08();
    sub_1B05FA2BC(&qword_1E9B35850, MEMORY[0x1F418EED8]);
    uint64_t v79 = v122;
    sub_1B0705D80();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v75);
    sub_1B05DA364(v73, &qword_1E9B357C8);
    double v80 = (sub_1B0705BF0() & 1) != 0 ? 0.75 : 1.0;
    sub_1B0705FA0();
    uint64_t v82 = v81;
    uint64_t v84 = v83;
    uint64_t v86 = v123;
    uint64_t v85 = v124;
    uint64_t v87 = (uint64_t)v126;
    (*(void (**)(char *, char *, uint64_t))(v123 + 16))(v126, v79, v124);
    uint64_t v88 = v87 + *(int *)(v125 + 36);
    *(double *)uint64_t v88 = v80;
    *(double *)(v88 + 8) = v80;
    *(void *)(v88 + 16) = v82;
    *(void *)(v88 + 24) = v84;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v79, v85);
    uint64_t v89 = sub_1B0705F90();
    char v90 = sub_1B0705BF0();
    uint64_t v91 = v129;
    sub_1B05DA300(v87, v129, &qword_1E9B357B8);
    uint64_t v92 = v91 + *(int *)(v127 + 36);
    *(void *)uint64_t v92 = v89;
    *(unsigned char *)(v92 + 8) = v90 & 1;
    sub_1B05DA364(v87, &qword_1E9B357B8);
    uint64_t v93 = swift_getKeyPath();
    uint64_t v94 = sub_1B0705860();
    uint64_t v95 = *(void *)(v94 - 8);
    MEMORY[0x1F4188790](v94);
    uint64_t v97 = (char *)&v107 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v95 + 104))(v97, *MEMORY[0x1E4F3C5C8], v94);
    unint64_t v15 = v131;
    uint64_t v98 = (uint64_t *)&v131[*(int *)(v34 + 36)];
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35858);
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))((char *)v98 + *(int *)(v99 + 28), v97, v94);
    uint64_t *v98 = v93;
    sub_1B05DA300(v91, (uint64_t)v15, &qword_1E9B357B0);
    (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v94);
    sub_1B05DA364(v91, &qword_1E9B357B0);
    uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B35860);
    MEMORY[0x1F4188790](v100);
    uint64_t v102 = (char *)&v107 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v103 = *MEMORY[0x1E4F3CB90];
    uint64_t v104 = sub_1B0705910();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v104 - 8) + 104))(v102, v103, v104);
    sub_1B05FA2BC(&qword_1E9B35868, MEMORY[0x1F418EE30]);
    if (sub_1B0706000()) {
      break;
    }
    __break(1u);
LABEL_17:
    swift_once();
  }
  sub_1B05FA304();
  sub_1B05FA4E4();
  char v105 = v108;
  sub_1B0705DB0();
  sub_1B05DA364((uint64_t)v102, &qword_1E9B35860);
  sub_1B05DA364((uint64_t)v15, &qword_1E9B357A8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v109 + 32))(v111, v105, v110);
}

uint64_t sub_1B05F9B50(uint64_t a1)
{
  uint64_t v2 = sub_1B0705860();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1B07059B0();
}

uint64_t sub_1B05F9C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B05F8CC4(a1, *v2, a2);
}

uint64_t sub_1B05F9C20@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1B0705A20();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B05F9C54@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1B0705A20();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B05F9C88()
{
  return sub_1B0705A30();
}

uint64_t sub_1B05F9CB8()
{
  return sub_1B0705A30();
}

uint64_t sub_1B05F9CE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B07059C0();
  *a1 = result;
  return result;
}

uint64_t sub_1B05F9D14()
{
  return sub_1B07059D0();
}

uint64_t sub_1B05F9D40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0705A00();
  *a1 = result;
  return result;
}

uint64_t sub_1B05F9D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0705A00();
  *a1 = result;
  return result;
}

uint64_t sub_1B05F9D98()
{
  return sub_1B0705A10();
}

uint64_t sub_1B05F9DC4()
{
  return sub_1B0705A10();
}

uint64_t sub_1B05F9DF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B07059C0();
  *a1 = result;
  return result;
}

uint64_t sub_1B05F9E1C()
{
  return sub_1B07059D0();
}

uint64_t sub_1B05F9E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0705950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B05F9EAC(uint64_t a1)
{
  uint64_t v2 = sub_1B0705950();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B05F9F08()
{
  unint64_t result = qword_1E9B35800;
  if (!qword_1E9B35800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357C8);
    sub_1B05F9F90();
    sub_1B05CBB34(&qword_1E9B354D8, &qword_1E9B354E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35800);
  }
  return result;
}

unint64_t sub_1B05F9F90()
{
  unint64_t result = qword_1E9B35808;
  if (!qword_1E9B35808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357D0);
    sub_1B05FA018();
    sub_1B05CBB34(&qword_1E9B35478, &qword_1E9B35458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35808);
  }
  return result;
}

unint64_t sub_1B05FA018()
{
  unint64_t result = qword_1E9B35810;
  if (!qword_1E9B35810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357D8);
    sub_1B05FA0A0();
    sub_1B05CBB34(&qword_1E9B35090, &qword_1E9B35098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35810);
  }
  return result;
}

unint64_t sub_1B05FA0A0()
{
  unint64_t result = qword_1E9B35818;
  if (!qword_1E9B35818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357E0);
    sub_1B05FA184(&qword_1E9B35820, &qword_1E9B357E8, (void (*)(void))sub_1B05FA154);
    sub_1B05CBB34(&qword_1E9B350A0, &qword_1E9B350A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35818);
  }
  return result;
}

uint64_t sub_1B05FA154()
{
  return sub_1B05FA184(&qword_1E9B35828, &qword_1E9B357F0, (void (*)(void))sub_1B05FA1F4);
}

uint64_t sub_1B05FA184(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B05FA1F4()
{
  unint64_t result = qword_1E9B35830;
  if (!qword_1E9B35830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357F8);
    sub_1B05FA2BC(&qword_1E9B35838, MEMORY[0x1F418FDA0]);
    sub_1B05CBB34(&qword_1E9B35840, &qword_1E9B35848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35830);
  }
  return result;
}

uint64_t sub_1B05FA294()
{
  return sub_1B07059A0();
}

uint64_t sub_1B05FA2BC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1B05FA304()
{
  unint64_t result = qword_1E9B35870;
  if (!qword_1E9B35870)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357A8);
    sub_1B05FA38C();
    sub_1B05CBB34(&qword_1E9B35898, &qword_1E9B35858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35870);
  }
  return result;
}

unint64_t sub_1B05FA38C()
{
  unint64_t result = qword_1E9B35878;
  if (!qword_1E9B35878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357B0);
    sub_1B05FA414();
    sub_1B05CBB34(&qword_1E9B35888, &qword_1E9B35890);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35878);
  }
  return result;
}

unint64_t sub_1B05FA414()
{
  unint64_t result = qword_1E9B35880;
  if (!qword_1E9B35880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B357C8);
    sub_1B0705920();
    sub_1B05F9F08();
    sub_1B05FA2BC(&qword_1E9B35850, MEMORY[0x1F418EED8]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B35880);
  }
  return result;
}

unint64_t sub_1B05FA4E4()
{
  unint64_t result = qword_1E9B358A0;
  if (!qword_1E9B358A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B35860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B358A0);
  }
  return result;
}

uint64_t sub_1B05FA540()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B05FA5B4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __VisionKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __AVAppStorePlayerViewUsePlayerLayerOnly_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"com.apple.avkit", @"appStorePlayerViewPlayerLayerOnly", 0);
  AVAppStorePlayerViewUsePlayerLayerOnly_AVAppStorePlayerViewUsePlayerLayerOnly = result != 0;
  return result;
}

uint64_t __AVAppStorePlayerViewDisableVideo_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"com.apple.avkit", @"appStorePlayerViewDisableVideo", 0);
  AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo = result != 0;
  return result;
}

id _AVMethodProem(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _NSFullMethodName();
  uint64_t v3 = [v2 rangeOfString:@" "];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    uint64_t v5 = NSString;
    uint64_t v6 = [v2 substringToIndex:v3];
    uint64_t v7 = [v2 substringFromIndex:v4 + 1];
    uint64_t v8 = [v5 stringWithFormat:@"%@ (%p) %@", v6, v1, v7];

    uint64_t v2 = (void *)v8;
  }

  return v2;
}

void sub_1B0601068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0603CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B060422C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0604AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0606F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0607198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0609C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B060C4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B060D760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06134A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
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

void _UpdatePreferredMediaSelectionOptions(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v9 = [v8 extendedLanguageTag];
        if (v9) {
          [v2 addObject:v9];
        }
        objc_msgSend(v8, "avkit_setPreferredSortIndex:", 0x7FFFFFFFFFFFFFFFLL);
        objc_msgSend(v8, "avkit_setBestChoiceForRecentLanguage:", 0);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v5);
  }

  uint64_t v10 = +[AVKitGlobalSettings shared];
  uint64_t v11 = [v10 preferredLanguages];

  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v13 = [v3 firstObject];
  char v33 = objc_msgSend(v13, "avkit_recentLanguageCode");

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v11;
  uint64_t v34 = v2;
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v38)
  {
    uint64_t v14 = 0;
    char v36 = 0;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v17 = _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(v2, v16);
        if ([v17 count])
        {
          uint64_t v18 = [v17 firstIndex];
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (uint64_t k = v18; k != 0x7FFFFFFFFFFFFFFFLL; uint64_t k = [v17 indexGreaterThanIndex:k])
            {
              uint64_t v20 = objc_msgSend(v3, "objectAtIndexedSubscript:", k, v33);
              char v21 = [v12 containsObject:v20];
              uint64_t v22 = _AVLog();
              BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
              if (v21)
              {
                if (v23)
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
                  __int16 v49 = 2114;
                  uint64_t v50 = v20;
                  _os_log_impl(&dword_1B05B7000, v22, OS_LOG_TYPE_DEFAULT, "%s NOT adding preferred option %{public}@ because we already have it!", buf, 0x16u);
                }
              }
              else
              {
                if (v23)
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
                  __int16 v49 = 2114;
                  uint64_t v50 = v20;
                  _os_log_impl(&dword_1B05B7000, v22, OS_LOG_TYPE_DEFAULT, "%s Adding preferred option %{public}@", buf, 0x16u);
                }

                [v12 addObject:v20];
                ++v14;
              }
              objc_msgSend(v20, "avkit_setPreferredSortIndex:", v14);
            }
            uint64_t v2 = v34;
          }
        }
        else
        {
          if ((v36 & 1) == 0)
          {
            uint64_t v24 = _AVLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
              __int16 v49 = 2112;
              uint64_t v50 = v2;
              _os_log_impl(&dword_1B05B7000, v24, OS_LOG_TYPE_DEFAULT, "%s Media option languages: %@", buf, 0x16u);
            }
          }
          uint64_t v25 = _AVLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
            __int16 v49 = 2114;
            uint64_t v50 = v16;
            _os_log_impl(&dword_1B05B7000, v25, OS_LOG_TYPE_DEFAULT, "%s It appears none of the options matches preferred language %{public}@", buf, 0x16u);
          }

          char v36 = 1;
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v38);
  }

  uint64_t v26 = _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(v2, v33);
  if ([v26 count])
  {
    uint64_t v27 = [v26 firstIndex];
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = v27;
      char v29 = 0;
      do
      {
        unint64_t v30 = objc_msgSend(v3, "objectAtIndexedSubscript:", v28, v33);
        if (objc_msgSend(v30, "avkit_preferredSortIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v30, "avkit_setBestChoiceForRecentLanguage:", 1);
        }
        else
        {
          if ((v29 & 1) == 0)
          {
            long long v31 = _AVLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
              __int16 v49 = 2114;
              uint64_t v50 = v33;
              _os_log_impl(&dword_1B05B7000, v31, OS_LOG_TYPE_DEFAULT, "%s The best choice for the recent language (%{public}@) is already in the preferred list", buf, 0x16u);
            }
          }
          char v29 = 1;
        }

        uint64_t v28 = [v26 indexGreaterThanIndex:v28];
      }
      while (v28 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    unsigned __int8 v32 = _AVLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
      __int16 v49 = 2114;
      uint64_t v50 = v33;
      _os_log_impl(&dword_1B05B7000, v32, OS_LOG_TYPE_DEFAULT, "%s It appears none of the options matches recent language %{public}@", buf, 0x16u);
    }
  }
}

id _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(void *a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
    v21[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v7 = [v5 preferredLocalizationsFromArray:v3 forPreferences:v6];

    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v8];
    uint64_t v10 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v9];
    uint64_t v11 = *MEMORY[0x1E4F1C438];
    uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

    uint64_t v13 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4];
    uint64_t v14 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v13];
    unint64_t v15 = [v14 objectForKeyedSubscript:v11];

    uint64_t v16 = 0;
    if (v15 && v12)
    {
      if ([v15 isEqualToString:v12])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = ___MediaOptionIndexesFromAvailableOptionsForPreferredLanguage_block_invoke;
        v18[3] = &unk_1E5FC2178;
        id v19 = v8;
        id v20 = v9;
        uint64_t v16 = [v3 indexesOfObjectsPassingTest:v18];
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v16;
}

void sub_1B06142F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0616D88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B06195F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0619D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B061BEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B061C314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B061C3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B061CFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B061DB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B061E9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B061F2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0625C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  uint64_t v22 = v21;
  objc_destroyWeak(v22);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0625E14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B0626B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0629DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1B062A768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B062B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerClass_block_invoke_4449(uint64_t a1)
{
  VisionKitCoreLibrary();
  Class result = objc_getClass("VKCImageAnalyzer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerClass_softClass_4448 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)-[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](v3);
  }
  return result;
}

uint64_t VisionKitCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary_4452)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionKitCoreLibraryCore_block_invoke_4453;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5FC24B0;
    uint64_t v5 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary_4452 = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = VisionKitCoreLibraryCore_frameworkLibrary_4452;
    if (VisionKitCoreLibraryCore_frameworkLibrary_4452)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return VisionKitCoreLibraryCore_frameworkLibrary_4452;
}

uint64_t __VisionKitCoreLibraryCore_block_invoke_4453()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary_4452 = result;
  return result;
}

void sub_1B062BCA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B062C2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerRequestClass_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  Class result = objc_getClass("VKCImageAnalyzerRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2(v3);
  }
  return result;
}

void *__getvk_imageOrientationFromTransformSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)VisionKitCoreLibrary();
  Class result = dlsym(v2, "vk_imageOrientationFromTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getvk_imageOrientationFromTransformSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__4598(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4599(uint64_t a1)
{
}

uint64_t AVCaptureEventPhaseFromPhysicalButtonState(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else
    {
      if (result != 2)
      {
        uint64_t v2 = result;
        uint64_t v1 = _AVLog();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v4 = v2;
          _os_log_impl(&dword_1B05B7000, v1, OS_LOG_TYPE_DEFAULT, "Invalid _UIPhysicalButtonState %ld. Cannot be converted to AVCaptureEventPhase.", buf, 0xCu);
        }

        __assert_rtn("AVCaptureEventPhaseFromPhysicalButtonState", "AVCaptureEvent.m", 90, "NO");
      }
      return 1;
    }
  }
  return result;
}

void sub_1B0631F60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL isRunningEventThread()
{
  uint64_t v0 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v1 = +[AVAirTransport eventThread];
  BOOL v2 = v0 == v1;

  return v2;
}

void sub_1B063503C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5640(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5641(uint64_t a1)
{
}

void sub_1B0637410(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B063854C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _avairlog()
{
  if (_avairlog_onceToken != -1) {
    dispatch_once(&_avairlog_onceToken, &__block_literal_global_6237);
  }
  uint64_t v0 = (void *)_avairlog__log;

  return v0;
}

uint64_t ___avairlog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.avkit", "Air");
  uint64_t v1 = _avairlog__log;
  _avairlog__log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B063DD20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B063F808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0646BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064A578(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_1B064A870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064AB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064AE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064B1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064C11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064CCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064DA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064E854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B064F3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0650590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B0650E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0651D60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B0652A64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0652B34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B065581C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8501(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8502(uint64_t a1)
{
}

void sub_1B0658E28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B065AD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B065CAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B065CCAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

CMTime *AVTimeIntervalToCMTime(CMTime *result, Float64 a2)
{
  uint64_t v2 = result;
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&result->value = *MEMORY[0x1E4F1F9F8];
  result->CMTimeEpoch epoch = *(void *)(v3 + 16);
  if (a2 == INFINITY)
  {
    uint64_t v4 = MEMORY[0x1E4F1FA10];
  }
  else if (a2 == -INFINITY)
  {
    uint64_t v4 = MEMORY[0x1E4F1FA08];
  }
  else
  {
    if (a2 != 0.0)
    {
      Class result = CMTimeMakeWithSeconds(&v6, a2, 90000);
      *(_OWORD *)&v2->value = *(_OWORD *)&v6.value;
      CMTimeEpoch epoch = v6.epoch;
      goto LABEL_8;
    }
    uint64_t v4 = MEMORY[0x1E4F1FA48];
  }
  *(_OWORD *)&result->value = *(_OWORD *)v4;
  CMTimeEpoch epoch = *(void *)(v4 + 16);
LABEL_8:
  v2->CMTimeEpoch epoch = epoch;
  return result;
}

void sub_1B065F82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0663B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVRequestConcreteImplementation(void *a1, const char *a2, objc_class *a3)
{
  uint64_t v12 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  CMTime v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  if (v5 == a3)
  {
    [MEMORY[0x1E4F1CA00] raise:v8, @"*** -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!", v7, v6, v10, v11 format];
  }
  else
  {
    uint64_t v9 = 45;
    if (v5 == v12) {
      uint64_t v9 = 43;
    }
    [MEMORY[0x1E4F1CA00] raise:v8, @"*** -%@ only defined for abstract class.  Define %c[%@ %@]!", v7, v9, v6, v7 format];
  }
}

void __AVSecondScreenDebugHUDEnabled_block_invoke()
{
  if (AVSecondScreenExperimentsAllowed_onceToken != -1) {
    dispatch_once(&AVSecondScreenExperimentsAllowed_onceToken, &__block_literal_global_151);
  }
  char v0 = AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed;
  if (AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed) {
    char v0 = CFPreferencesGetAppBooleanValue(@"enableSecondScreenHUD", @"com.apple.avkit", 0) != 0;
  }
  AVSecondScreenDebugHUDEnabled__Enabled = v0;
}

uint64_t __AVSecondScreenExperimentsAllowed_block_invoke()
{
  if (AVSecondScreenTVSupportEnabled_onceToken != -1) {
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_125);
  }
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled) {
    uint64_t result = MGGetBoolAnswer();
  }
  else {
    uint64_t result = 0;
  }
  AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed = result;
  return result;
}

void __AVSecondScreenTVSupportEnabled_block_invoke()
{
  if (AVSecondScreenSupportsExternalHDR_onceToken != -1) {
    dispatch_once(&AVSecondScreenSupportsExternalHDR_onceToken, &__block_literal_global_120);
  }
  if (AVSecondScreenSupportsExternalHDR_AVSecondScreenSupportsExternalHDR)
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    char v0 = [v1 bundleIdentifier];
    AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled = [v0 hasPrefix:@"com.apple.springboard"] ^ 1;
  }
  else
  {
    AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled = 0;
  }
}

uint64_t __AVSecondScreenSupportsExternalHDR_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  AVSecondScreenSupportsExternalHDR_AVSecondScreenSupportsExternalHDR = result;
  return result;
}

void sub_1B0669328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0669A08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0669C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B066BC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B066DAE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0670D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0674884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0675A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v26 - 160));
  _Unwind_Resume(a1);
}

void sub_1B06764D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B06791B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06793C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B067D250(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

void sub_1B0688908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1B0689F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B068A468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B068A6D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B068ADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1B068C7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

Class __getMPMediaControlsConfigurationClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  Class result = objc_getClass("MPMediaControlsConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMediaControlsConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getMPMediaControlsClass_block_invoke(v3);
  }
  return result;
}

Class __getMPMediaControlsClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  Class result = objc_getClass("MPMediaControls");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPMediaControlsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke(v3);
  }
  return result;
}

void MediaPlayerLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaPlayerLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5FC3240;
    uint64_t v3 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
    char v0 = (void *)v1[0];
    if (MediaPlayerLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      char v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

void _CommonInit(void *a1, long long *a2)
{
  uint64_t v3 = a1;
  v3[2] = 0xBFF0000000000000;
  if ((*((_DWORD *)a2 + 3) & 1) == 0
    || (*((_DWORD *)a2 + 9) & 1) == 0
    || *((void *)a2 + 5)
    || (*((void *)a2 + 3) & 0x8000000000000000) != 0)
  {
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime duration = start;
    p_CMTime start = &start;
    p_CMTime duration = &duration;
  }
  else
  {
    if ((*((_DWORD *)a2 + 3) & 0x1D) == 1 && (*((_DWORD *)a2 + 9) & 0x1D) == 1
      || (dyld_program_sdk_at_least() & 1) == 0)
    {
      long long v10 = *a2;
      long long v11 = a2[2];
      *((_OWORD *)v3 + 5) = a2[1];
      *((_OWORD *)v3 + 6) = v11;
      *((_OWORD *)v3 + 4) = v10;
      goto LABEL_7;
    }
    if ((*((_DWORD *)a2 + 3) & 0x1D) != 1)
    {
      uint64_t v12 = MEMORY[0x1E4F1FA30];
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      *((_OWORD *)v3 + 4) = *MEMORY[0x1E4F1FA30];
      *((_OWORD *)v3 + 5) = v13;
      long long v7 = *(_OWORD *)(v12 + 32);
      goto LABEL_6;
    }
    int v8 = *((_DWORD *)a2 + 9);
    if ((v8 & 0x1D) == 1 || (v8 & 0x11) == 0x11)
    {
      *(_OWORD *)&start.value = *(long long *)((char *)a2 + 24);
      CMTimeEpoch v9 = *((void *)a2 + 5);
    }
    else
    {
      *(_OWORD *)&start.value = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    }
    start.CMTimeEpoch epoch = v9;
    CMTime duration = *(CMTime *)a2;
    long long v14 = *(_OWORD *)&start.value;
    CMTimeEpoch v15 = v9;
    p_CMTime start = &duration;
    p_CMTime duration = (CMTime *)&v14;
  }
  CMTimeRangeMake(&v17, p_start, p_duration);
  long long v6 = *(_OWORD *)&v17.start.epoch;
  *((_OWORD *)v3 + 4) = *(_OWORD *)&v17.start.value;
  *((_OWORD *)v3 + 5) = v6;
  long long v7 = *(_OWORD *)&v17.duration.timescale;
LABEL_6:
  *((_OWORD *)v3 + 6) = v7;
LABEL_7:
  *((unsigned char *)v3 + 9) = 1;
  void v3[6] = 0x7FF0000000000000;
  v3[7] = 0;
}

id _bestMatch(void *a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  if (![v11 length]) {
    __assert_rtn("_bestMatch", "AVRatingProviders.m", 98, "[countryCode length]");
  }
  if (a4)
  {
    if (a4 == 2)
    {
      uint64_t v12 = v10;
      long long v13 = v11;
      uint64_t v14 = 2;
      goto LABEL_17;
    }
    if (a4 == 1)
    {
      uint64_t v12 = v9;
      long long v13 = v11;
      uint64_t v14 = 1;
LABEL_17:
      _bestMatchForDomain(v12, v13, v14);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    id v23 = 0;
  }
  else
  {
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    if (![v17 length]) {
      __assert_rtn("_bestMatchForCountry", "AVRatingProviders.m", 89, "[countryCode length] > 0");
    }
    uint64_t v18 = _bestMatchForDomain(v15, v17, 1);
    uint64_t v19 = _bestMatchForDomain(v16, v17, 2);
    id v20 = (void *)v19;
    if (v19) {
      char v21 = (void *)v19;
    }
    else {
      char v21 = v18;
    }
    if (v18) {
      uint64_t v22 = v18;
    }
    else {
      uint64_t v22 = (void *)v19;
    }
    if (!a5) {
      char v21 = v22;
    }
    id v23 = v21;
  }
LABEL_19:

  return v23;
}

AVMediaContentRating *_bestMatchForDomain(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (![v6 length]) {
    __assert_rtn("_bestMatchForDomain", "AVRatingProviders.m", 72, "[countryCode length] > 0 && domain != AVMediaContentRatingDomainUnknown");
  }
  long long v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    int v8 = [v5 objectForKeyedSubscript:@"ratingString"];
    id v9 = -[AVMediaContentRating initWithRating:rank:countryCode:domain:]([AVMediaContentRating alloc], "initWithRating:rank:countryCode:domain:", v8, [v7 integerValue], v6, a3);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id _KeyForRating(void *a1)
{
  uint64_t v1 = [a1 uppercaseString];
  long long v2 = [v1 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F09185C8];
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1F09185C8];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F09185C8];

  return v4;
}

void _MakeReverseDictionaryForRatingDictionary(void *a1, void *a2, void *a3)
{
  id v15 = a1;
  id v5 = a3;
  id v6 = a2;
  long long v7 = [v6 objectForKeyedSubscript:@"rank"];
  int v8 = [v6 objectForKeyedSubscript:@"rating"];

  id v9 = _KeyForRating(v8);
  if (v8 && v7)
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:v9];
    if (v10)
    {
      id v11 = (void *)v10;
      uint64_t v12 = [v15 uppercaseString];
      [v11 setObject:v7 forKeyedSubscript:v12];
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v14 = [v15 uppercaseString];
      id v11 = objc_msgSend(v13, "initWithObjectsAndKeys:", v7, v14, 0);

      [v5 setObject:v11 forKeyedSubscript:v9];
    }
    [v11 setObject:v8 forKeyedSubscript:@"ratingString"];
  }
}

void sub_1B0693A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

void sub_1B0695C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0695FAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1B0697D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0697FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B069A24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B069B57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B069B890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B069BC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15641(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15642(uint64_t a1)
{
}

id getMPMediaControlsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  char v0 = (void *)getMPMediaControlsClass_softClass_15650;
  uint64_t v7 = getMPMediaControlsClass_softClass_15650;
  if (!getMPMediaControlsClass_softClass_15650)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaControlsClass_block_invoke_15651;
    v3[3] = &unk_1E5FC42C0;
    v3[4] = &v4;
    __getMPMediaControlsClass_block_invoke_15651((uint64_t)v3);
    char v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B069BD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaControlsClass_block_invoke_15651(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_15652)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke_15653;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5FC3428;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_15652 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MediaPlayerLibraryCore_frameworkLibrary_15652)
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
    Class result = objc_getClass("MPMediaControls");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getMPMediaControlsClass_softClass_15650 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke_15653()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_15652 = result;
  return result;
}

void _CommonInit_15688(void *a1)
{
  id v1 = a1;
  long long v2 = [[AVObservationController alloc] initWithOwner:v1];
  uint64_t v3 = (void *)v1[58];
  v1[58] = v2;

  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.avkit.avroutepickerview", v4);
  uint64_t v6 = (void *)v1[51];
  v1[51] = v5;

  [v1 _createOrUpdateRoutePickerButton];
  uint64_t v7 = [v1 _defaultActiveTintColor];
  [v1 setActiveTintColor:v7];

  id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v1 action:sel__routePickerButtonTapped_];
  [v1 addGestureRecognizer:v8];
  [v1 _setupOutputContext];
  [v1 _registerNotifications];
  [v1 _updateAirPlayActive];
}

void sub_1B06A0C40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B06A2000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *location,id *a23,id *a24,id *a25,id *a26,id *a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(a15);
  objc_destroyWeak(a12);
  objc_destroyWeak(a9);
  objc_destroyWeak(a10);
  objc_destroyWeak(a13);
  objc_destroyWeak(a11);
  objc_destroyWeak(a16);
  objc_destroyWeak(a14);
  objc_destroyWeak(a17);
  objc_destroyWeak(a19);
  objc_destroyWeak(a18);
  objc_destroyWeak(a21);
  objc_destroyWeak(a20);
  objc_destroyWeak(location);
  objc_destroyWeak(a23);
  objc_destroyWeak(a25);
  objc_destroyWeak(a24);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak((id *)&STACK[0x300]);
  objc_destroyWeak((id *)(v29 - 128));
  _Unwind_Resume(a1);
}

void sub_1B06A27FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B06A2F1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B06A3E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06A4778(_Unwind_Exception *a1)
{
}

void sub_1B06A49D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06A5A98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1B06A88A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1B06AA8EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void AVPlayerControllerTimeResolverUpdate(void *a1)
{
  id v1 = a1;
  AVPlayerControllerTimeResolverUpdateTime(v1);
  uint64_t v2 = (id *)v1;
  uint64_t v3 = [v2[1] timing];
  uint64_t v4 = [v2[1] minTiming];
  dispatch_queue_t v5 = [v2[1] maxTiming];
  if (v3)
  {
    [v3 rate];
    double v8 = fabs(v7);
    double v6 = 0.0;
    double v9 = v8;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    double v9 = 0.0;
    if (!v4) {
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v2[1], "hasSeekableLiveStreamingContent", v6))
  {
    [v4 rate];
    double v10 = fabs(v6);
    if (v9 < v10) {
      double v9 = v10;
    }
  }
LABEL_8:
  if (v5)
  {
    if (objc_msgSend(v2[1], "hasSeekableLiveStreamingContent", v6))
    {
      [v5 rate];
      double v12 = fabs(v11);
      if (v9 < v12) {
        double v9 = v12;
      }
    }
  }
  double v13 = AVPlayerControllerTimeResolverGetEffectiveInterval(v2) / v9 * 0.5;
  double v14 = fabs(v13);
  id v15 = v2[5];
  if (v14 >= INFINITY && v14 <= INFINITY && v15)
  {
    [v15 invalidate];
    id v16 = v2[5];
    v2[5] = 0;
  }
  else if (v14 != INFINITY)
  {
    if (v15)
    {
      [v15 interval];
      if (v17 == v13) {
        goto LABEL_21;
      }
      id v15 = v2[5];
    }
    [v15 invalidate];
    objc_initWeak(&location, v2);
    uint64_t v18 = [AVTimer alloc];
    uint64_t v19 = MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __AVPlayerControllerTimeResolverUpdateTimer_block_invoke;
    v23[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v24, &location);
    uint64_t v21 = [(AVTimer *)v18 initWithTimeInterval:v19 queue:v23 block:1 repeats:v13];
    id v22 = v2[5];
    v2[5] = (id)v21;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
LABEL_21:
}

void sub_1B06AC014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVPlayerControllerTimeResolverUpdateTime(void *a1)
{
  int v35 = a1;
  +[AVValueTiming currentTimeStamp];
  double v2 = v1;
  uint64_t v3 = [v35[1] timing];
  [v3 anchorTimeStamp];
  double v5 = v4;
  double v6 = [v35[1] timing];
  double v7 = v6;
  if (v2 > v5) {
    [v6 valueForTimeStamp:v2];
  }
  else {
    [v6 anchorValue];
  }
  double v9 = v8;

  double EffectiveInterval = AVPlayerControllerTimeResolverGetEffectiveInterval(v35);
  double v11 = EffectiveInterval * round(v9 / EffectiveInterval);
  double v12 = v9 - v11;
  int v13 = [v35[1] hasSeekableLiveStreamingContent];
  id v14 = v35[1];
  if (v13)
  {
    id v15 = [v14 minTiming];
    id v16 = v35[1];
    if (v15)
    {
      double v17 = [v16 minTiming];
      [v17 valueForTimeStamp:v2];
      double v19 = v18 - v12;
    }
    else
    {
      [v16 minTime];
      double v19 = v21;
    }
  }
  else
  {
    [v14 minTime];
    double v19 = v20;
  }
  int v22 = [v35[1] hasSeekableLiveStreamingContent];
  id v23 = v35[1];
  if (v22)
  {
    id v24 = [v23 maxTiming];
    id v25 = v35[1];
    if (v24)
    {
      uint64_t v26 = [v25 maxTiming];
      [v26 valueForTimeStamp:v2];
      double v28 = v27 - v12;
    }
    else
    {
      [v25 maxTime];
      double v28 = v30;
    }
  }
  else
  {
    [v23 maxTime];
    double v28 = v29;
  }
  double v31 = fmax(v19, fmin(v11, v28));
  unsigned __int8 v32 = v35;
  BOOL v33 = v28 == *((double *)v35 + 7);
  if (v31 == *((double *)v35 + 4))
  {
    char v34 = 1;
    if (v19 == *((double *)v35 + 6)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  char v34 = 0;
  if (v19 != *((double *)v35 + 6))
  {
LABEL_18:
    [v35 willChangeValueForKey:@"minTime"];
    *((double *)v35 + 6) = v19;
    [v35 didChangeValueForKey:@"minTime"];
    unsigned __int8 v32 = v35;
  }
LABEL_19:
  if (v33)
  {
    if (v34) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  [v35 willChangeValueForKey:@"maxTime"];
  *((double *)v35 + 7) = v28;
  [v35 didChangeValueForKey:@"maxTime"];
  unsigned __int8 v32 = v35;
  if ((v34 & 1) == 0)
  {
LABEL_21:
    [v35 willChangeValueForKey:@"currentTime"];
    *((double *)v35 + 4) = v31;
    [v35 didChangeValueForKey:@"currentTime"];
    unsigned __int8 v32 = v35;
  }
LABEL_22:
}

double AVPlayerControllerTimeResolverGetEffectiveInterval(void *a1)
{
  id v1 = a1;
  double v2 = (void *)*((void *)v1 + 1);
  if (v2)
  {
    if (objc_msgSend(v2, "hasSeekableLiveStreamingContent", *((double *)v1 + 3))) {
      [v1 seekableTimeRangeDuration];
    }
    else {
      [*((id *)v1 + 1) contentDuration];
    }
    BOOL v5 = ((*(void *)&v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF
      && (*(void *)&v3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 >= 0xFFFFFFFFFFFFFLL;
    double v6 = *((double *)v1 + 2);
    if (v5) {
      double v4 = fmax(v6, 1.0);
    }
    else {
      double v4 = fmin(v6, v3 / *((double *)v1 + 3));
    }
  }
  else
  {
    double v4 = *((double *)v1 + 2);
  }

  return v4;
}

void __AVPlayerControllerTimeResolverUpdateTimer_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    AVPlayerControllerTimeResolverUpdateTime(WeakRetained);
    id WeakRetained = v2;
  }
}

void sub_1B06AFBD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B06B5694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B06B5F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __MapImageNameNumberAware_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F094A370];
  uint64_t v1 = MapImageNameNumberAware_sDigitAwareSet;
  MapImageNameNumberAware_sDigitAwareSet = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B06B80BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06B973C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BA558(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1B06BC480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BC708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BC928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BD278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BDBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06BFC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C1430(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B06C1E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C22D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C26C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C29B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C2B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C2CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C33A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06C4B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18195(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18196(uint64_t a1)
{
}

void sub_1B06C7DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getMPVolumeHUDControllerClass()
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMPVolumeHUDControllerClass_softClass;
  uint64_t v7 = getMPVolumeHUDControllerClass_softClass;
  if (!getMPVolumeHUDControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMPVolumeHUDControllerClass_block_invoke;
    v3[3] = &unk_1E5FC42C0;
    v3[4] = &v4;
    __getMPVolumeHUDControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B06C858C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPVolumeHUDControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_18800)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke_18801;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5FC3C48;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_18800 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MediaPlayerLibraryCore_frameworkLibrary_18800)
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
    Class result = objc_getClass("MPVolumeHUDController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getMPVolumeHUDControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke_18801()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_18800 = result;
  return result;
}

void sub_1B06C8F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06CDE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06CE180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v18 - 104));
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06D2B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06D3514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06D435C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06D5AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalysisInteractionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary_20990)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionKitCoreLibraryCore_block_invoke_20991;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5FC3EA0;
    uint64_t v6 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary_20990 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VisionKitCoreLibraryCore_frameworkLibrary_20990)
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
    Class result = objc_getClass("VKCImageAnalysisInteraction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getVKCImageAnalysisInteractionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionKitCoreLibraryCore_block_invoke_20991()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary_20990 = result;
  return result;
}

void sub_1B06DCCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06DEB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06DEF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  objc_destroyWeak((id *)(v19 - 72));
  _Unwind_Resume(a1);
}

void sub_1B06DF0E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B06DF21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22598(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22599(uint64_t a1)
{
}

void sub_1B06E08A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06E0C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06E3FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06E55D8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void playbackMinTimeForPlayerItem(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  if (!v3 || (id v5 = v3, [v3 reversePlaybackEndTime], v3 = v5, (*(unsigned char *)(a1 + 12) & 1) == 0))
  {
    uint64_t v4 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)a1 = *MEMORY[0x1E4F1FA48];
    *(void *)(a1 + 16) = *(void *)(v4 + 16);
  }
}

void playbackMaxTimeForPlayerItemAndContentDuration(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  if (!v5 || (v6 = v5, [v5 forwardPlaybackEndTime], id v5 = v6, (*(unsigned char *)(a1 + 12) & 1) == 0))
  {
    *(_OWORD *)a1 = *(_OWORD *)a3;
    *(void *)(a1 + 16) = *(void *)(a3 + 16);
  }
}

void sub_1B06E8594(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B06EAA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 208));
  _Unwind_Resume(a1);
}

void sub_1B06EC480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _audibleMediaSettingsChangeNotificationCallback(uint64_t a1, void *a2)
{
  return [a2 reloadAudioOptions];
}

void _captionAppearanceSettingsChangeNotificationCallback(uint64_t a1, void *a2)
{
  id v3 = a2;
  MACaptionAppearanceDisplayType DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
  if (DisplayType != [v3 captionAppearanceDisplayType]) {
    [v3 setCaptionAppearanceDisplayType:DisplayType];
  }
  [v3 reloadLegibleOptions];
}

void sub_1B06EEE4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B06F7550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06F77A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B06F8434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06FB9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B06FBBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _CommonInit_24491(void *a1)
{
  id v1 = a1;
  [v1 setShowsMenuAsPrimaryAction:1];
  [v1 setContextMenuInteractionEnabled:1];
  [v1 setAppliesTransformToImageViewWhenHighlighted:1];
}

void sub_1B06FD340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__24657(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24658(uint64_t a1)
{
}

void sub_1B06FE2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVAsynchronousLocalizedString(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  if (AVAsynchronousLocalizedString_createQueueOnceToken != -1) {
    dispatch_once(&AVAsynchronousLocalizedString_createQueueOnceToken, &__block_literal_global_13_25035);
  }
  double v8 = AVAsynchronousLocalizedString_localizedStringBackgroundQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AVAsynchronousLocalizedString_block_invoke_2;
  block[3] = &unk_1E5FC4670;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __AVAsynchronousLocalizedString_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = AVLocalizedString(*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __AVAsynchronousLocalizedString_block_invoke_3;
  v5[3] = &unk_1E5FC4648;
  id v3 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __AVAsynchronousLocalizedString_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __AVAsynchronousLocalizedString_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.localizedStringBundleQueue", v2);
  id v1 = (void *)AVAsynchronousLocalizedString_localizedStringBackgroundQ;
  AVAsynchronousLocalizedString_localizedStringBackgroundQ = (uint64_t)v0;
}

void sub_1B070369C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 248), 8);
  _Block_object_dispose((const void *)(v58 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_1B07042B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B07055E0()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1B07055F0()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1B0705600()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1B0705610()
{
  return MEMORY[0x1F40E4468]();
}

uint64_t sub_1B0705620()
{
  return MEMORY[0x1F40E4638]();
}

uint64_t sub_1B0705630()
{
  return MEMORY[0x1F40E4658]();
}

uint64_t sub_1B0705640()
{
  return MEMORY[0x1F40E4750]();
}

uint64_t sub_1B0705650()
{
  return MEMORY[0x1F40E47E8]();
}

uint64_t sub_1B0705660()
{
  return MEMORY[0x1F40E4818]();
}

uint64_t sub_1B0705670()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1B0705680()
{
  return MEMORY[0x1F40E4F70]();
}

uint64_t sub_1B0705690()
{
  return MEMORY[0x1F40E4FC0]();
}

uint64_t sub_1B07056A0()
{
  return MEMORY[0x1F40E4FC8]();
}

uint64_t sub_1B07056B0()
{
  return MEMORY[0x1F40E5060]();
}

uint64_t sub_1B07056C0()
{
  return MEMORY[0x1F40E5208]();
}

uint64_t sub_1B07056D0()
{
  return MEMORY[0x1F40E5218]();
}

uint64_t sub_1B07056E0()
{
  return MEMORY[0x1F40E5230]();
}

uint64_t sub_1B07056F0()
{
  return MEMORY[0x1F40E5260]();
}

uint64_t sub_1B0705700()
{
  return MEMORY[0x1F40E5278]();
}

uint64_t sub_1B0705710()
{
  return MEMORY[0x1F40E5280]();
}

uint64_t sub_1B0705720()
{
  return MEMORY[0x1F40E5290]();
}

uint64_t sub_1B0705730()
{
  return MEMORY[0x1F40E52A8]();
}

uint64_t sub_1B0705740()
{
  return MEMORY[0x1F40E5360]();
}

uint64_t sub_1B0705750()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1B0705760()
{
  return MEMORY[0x1F40E5650]();
}

uint64_t sub_1B0705770()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_1B0705780()
{
  return MEMORY[0x1F40E59F0]();
}

uint64_t sub_1B0705790()
{
  return MEMORY[0x1F40E5B10]();
}

uint64_t sub_1B07057A0()
{
  return MEMORY[0x1F4182D48]();
}

uint64_t sub_1B07057B0()
{
  return MEMORY[0x1F4182D68]();
}

uint64_t sub_1B07057C0()
{
  return MEMORY[0x1F4182D70]();
}

uint64_t sub_1B07057D0()
{
  return MEMORY[0x1F4182D78]();
}

uint64_t sub_1B07057E0()
{
  return MEMORY[0x1F4182D80]();
}

uint64_t sub_1B07057F0()
{
  return MEMORY[0x1F4182D88]();
}

uint64_t sub_1B0705800()
{
  return MEMORY[0x1F4182D90]();
}

uint64_t sub_1B0705810()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B0705820()
{
  return MEMORY[0x1F40F7D60]();
}

uint64_t sub_1B0705830()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1B0705840()
{
  return MEMORY[0x1F40F7E78]();
}

uint64_t sub_1B0705850()
{
  return MEMORY[0x1F40F7F58]();
}

uint64_t sub_1B0705860()
{
  return MEMORY[0x1F40F8048]();
}

uint64_t sub_1B0705870()
{
  return MEMORY[0x1F40F80A8]();
}

uint64_t sub_1B0705880()
{
  return MEMORY[0x1F40F8358]();
}

uint64_t sub_1B0705890()
{
  return MEMORY[0x1F40F8368]();
}

uint64_t sub_1B07058A0()
{
  return MEMORY[0x1F40F8370]();
}

uint64_t sub_1B07058B0()
{
  return MEMORY[0x1F40F83E8]();
}

uint64_t sub_1B07058C0()
{
  return MEMORY[0x1F40F84B0]();
}

uint64_t sub_1B07058D0()
{
  return MEMORY[0x1F40F84D0]();
}

uint64_t sub_1B07058E0()
{
  return MEMORY[0x1F40F84E0]();
}

uint64_t sub_1B07058F0()
{
  return MEMORY[0x1F40F85C0]();
}

uint64_t sub_1B0705900()
{
  return MEMORY[0x1F40F85D0]();
}

uint64_t sub_1B0705910()
{
  return MEMORY[0x1F40F8A30]();
}

uint64_t sub_1B0705920()
{
  return MEMORY[0x1F40F8B00]();
}

uint64_t sub_1B0705930()
{
  return MEMORY[0x1F40F8BD0]();
}

uint64_t sub_1B0705940()
{
  return MEMORY[0x1F40F8C50]();
}

uint64_t sub_1B0705950()
{
  return MEMORY[0x1F40F8E98]();
}

uint64_t sub_1B0705960()
{
  return MEMORY[0x1F40F8F58]();
}

uint64_t sub_1B0705970()
{
  return MEMORY[0x1F40F90A0]();
}

uint64_t sub_1B0705980()
{
  return MEMORY[0x1F40F90D0]();
}

uint64_t sub_1B0705990()
{
  return MEMORY[0x1F40F90E8]();
}

uint64_t sub_1B07059A0()
{
  return MEMORY[0x1F40F9140]();
}

uint64_t sub_1B07059B0()
{
  return MEMORY[0x1F40F9148]();
}

uint64_t sub_1B07059C0()
{
  return MEMORY[0x1F40F9288]();
}

uint64_t sub_1B07059D0()
{
  return MEMORY[0x1F40F9290]();
}

uint64_t sub_1B07059E0()
{
  return MEMORY[0x1F40F9368]();
}

uint64_t sub_1B07059F0()
{
  return MEMORY[0x1F40F93E0]();
}

uint64_t sub_1B0705A00()
{
  return MEMORY[0x1F40F9558]();
}

uint64_t sub_1B0705A10()
{
  return MEMORY[0x1F40F9560]();
}

uint64_t sub_1B0705A20()
{
  return MEMORY[0x1F40F9668]();
}

uint64_t sub_1B0705A30()
{
  return MEMORY[0x1F40F9678]();
}

uint64_t sub_1B0705A40()
{
  return MEMORY[0x1F40F96C0]();
}

uint64_t sub_1B0705A50()
{
  return MEMORY[0x1F40F96D0]();
}

uint64_t sub_1B0705A60()
{
  return MEMORY[0x1F40F98C8]();
}

uint64_t sub_1B0705A70()
{
  return MEMORY[0x1F40F9AC8]();
}

uint64_t sub_1B0705A80()
{
  return MEMORY[0x1F40F9B60]();
}

uint64_t sub_1B0705A90()
{
  return MEMORY[0x1F40F9C20]();
}

uint64_t sub_1B0705AA0()
{
  return MEMORY[0x1F40F9C50]();
}

uint64_t sub_1B0705AB0()
{
  return MEMORY[0x1F40F9CD0]();
}

uint64_t sub_1B0705AC0()
{
  return MEMORY[0x1F40F9CE0]();
}

uint64_t sub_1B0705AD0()
{
  return MEMORY[0x1F40F9CF8]();
}

uint64_t sub_1B0705AE0()
{
  return MEMORY[0x1F40F9E18]();
}

uint64_t sub_1B0705AF0()
{
  return MEMORY[0x1F40F9E38]();
}

uint64_t sub_1B0705B00()
{
  return MEMORY[0x1F40F9FA0]();
}

uint64_t sub_1B0705B10()
{
  return MEMORY[0x1F40FA088]();
}

uint64_t sub_1B0705B20()
{
  return MEMORY[0x1F40FA0A8]();
}

uint64_t sub_1B0705B30()
{
  return MEMORY[0x1F40FA0B8]();
}

uint64_t sub_1B0705B40()
{
  return MEMORY[0x1F40FA398]();
}

uint64_t sub_1B0705B50()
{
  return MEMORY[0x1F40FA420]();
}

uint64_t sub_1B0705B60()
{
  return MEMORY[0x1F40FA428]();
}

uint64_t sub_1B0705B70()
{
  return MEMORY[0x1F40FA478]();
}

uint64_t sub_1B0705B80()
{
  return MEMORY[0x1F40FA570]();
}

uint64_t sub_1B0705B90()
{
  return MEMORY[0x1F40FA598]();
}

uint64_t sub_1B0705BA0()
{
  return MEMORY[0x1F40FA5B0]();
}

uint64_t sub_1B0705BB0()
{
  return MEMORY[0x1F40FA5C0]();
}

uint64_t sub_1B0705BC0()
{
  return MEMORY[0x1F40FA5C8]();
}

uint64_t sub_1B0705BD0()
{
  return MEMORY[0x1F40FA698]();
}

uint64_t sub_1B0705BE0()
{
  return MEMORY[0x1F40FA6A8]();
}

uint64_t sub_1B0705BF0()
{
  return MEMORY[0x1F40FA6B0]();
}

uint64_t sub_1B0705C00()
{
  return MEMORY[0x1F40FA808]();
}

uint64_t sub_1B0705C10()
{
  return MEMORY[0x1F40FA818]();
}

uint64_t sub_1B0705C20()
{
  return MEMORY[0x1F40FAD70]();
}

uint64_t sub_1B0705C30()
{
  return MEMORY[0x1F40FAD80]();
}

uint64_t sub_1B0705C40()
{
  return MEMORY[0x1F40FAD90]();
}

uint64_t sub_1B0705C50()
{
  return MEMORY[0x1F40FADA0]();
}

uint64_t sub_1B0705C60()
{
  return MEMORY[0x1F40FADC8]();
}

uint64_t sub_1B0705C70()
{
  return MEMORY[0x1F40FADF0]();
}

uint64_t sub_1B0705C80()
{
  return MEMORY[0x1F40FAE08]();
}

uint64_t sub_1B0705C90()
{
  return MEMORY[0x1F40FAE10]();
}

uint64_t sub_1B0705CA0()
{
  return MEMORY[0x1F40FAE70]();
}

uint64_t sub_1B0705CB0()
{
  return MEMORY[0x1F40FAF10]();
}

uint64_t sub_1B0705CC0()
{
  return MEMORY[0x1F40FB128]();
}

uint64_t sub_1B0705CD0()
{
  return MEMORY[0x1F40FB138]();
}

uint64_t sub_1B0705CE0()
{
  return MEMORY[0x1F40FB3B8]();
}

uint64_t sub_1B0705CF0()
{
  return MEMORY[0x1F40FB448]();
}

uint64_t sub_1B0705D00()
{
  return MEMORY[0x1F40FB458]();
}

uint64_t sub_1B0705D10()
{
  return MEMORY[0x1F40FB540]();
}

uint64_t sub_1B0705D20()
{
  return MEMORY[0x1F40FB550]();
}

uint64_t sub_1B0705D30()
{
  return MEMORY[0x1F40FB588]();
}

uint64_t sub_1B0705D40()
{
  return MEMORY[0x1F40FB5C8]();
}

uint64_t sub_1B0705D50()
{
  return MEMORY[0x1F40FB5E0]();
}

uint64_t sub_1B0705D60()
{
  return MEMORY[0x1F40FB668]();
}

uint64_t sub_1B0705D70()
{
  return MEMORY[0x1F40FB6D8]();
}

uint64_t sub_1B0705D80()
{
  return MEMORY[0x1F40FB730]();
}

uint64_t sub_1B0705D90()
{
  return MEMORY[0x1F40FB928]();
}

uint64_t sub_1B0705DA0()
{
  return MEMORY[0x1F40FB9D0]();
}

uint64_t sub_1B0705DB0()
{
  return MEMORY[0x1F40FB9E0]();
}

uint64_t sub_1B0705DC0()
{
  return MEMORY[0x1F40FBAD8]();
}

uint64_t sub_1B0705DD0()
{
  return MEMORY[0x1F40FBB80]();
}

uint64_t sub_1B0705DE0()
{
  return MEMORY[0x1F40FBB88]();
}

uint64_t sub_1B0705DF0()
{
  return MEMORY[0x1F40FBCC0]();
}

uint64_t sub_1B0705E00()
{
  return MEMORY[0x1F40FBD90]();
}

uint64_t sub_1B0705E10()
{
  return MEMORY[0x1F40FBEC8]();
}

uint64_t sub_1B0705E20()
{
  return MEMORY[0x1F40FC160]();
}

uint64_t sub_1B0705E30()
{
  return MEMORY[0x1F40FC3C8]();
}

uint64_t sub_1B0705E40()
{
  return MEMORY[0x1F40FC3F0]();
}

uint64_t sub_1B0705E50()
{
  return MEMORY[0x1F40FC4A0]();
}

uint64_t sub_1B0705E60()
{
  return MEMORY[0x1F40FC528]();
}

uint64_t sub_1B0705E70()
{
  return MEMORY[0x1F40FC560]();
}

uint64_t sub_1B0705E80()
{
  return MEMORY[0x1F40FC588]();
}

uint64_t sub_1B0705E90()
{
  return MEMORY[0x1F40FC5B0]();
}

uint64_t sub_1B0705EA0()
{
  return MEMORY[0x1F40FC5E0]();
}

uint64_t sub_1B0705EB0()
{
  return MEMORY[0x1F40FC608]();
}

uint64_t sub_1B0705EC0()
{
  return MEMORY[0x1F40FC618]();
}

uint64_t sub_1B0705ED0()
{
  return MEMORY[0x1F40FC6E8]();
}

uint64_t sub_1B0705EE0()
{
  return MEMORY[0x1F40FC6F8]();
}

uint64_t sub_1B0705EF0()
{
  return MEMORY[0x1F40FC710]();
}

uint64_t sub_1B0705F00()
{
  return MEMORY[0x1F40FC720]();
}

uint64_t sub_1B0705F10()
{
  return MEMORY[0x1F40FC758]();
}

uint64_t sub_1B0705F20()
{
  return MEMORY[0x1F40FC908]();
}

uint64_t sub_1B0705F30()
{
  return MEMORY[0x1F40FC918]();
}

uint64_t sub_1B0705F40()
{
  return MEMORY[0x1F40FC9C0]();
}

uint64_t sub_1B0705F50()
{
  return MEMORY[0x1F40FCBC0]();
}

uint64_t sub_1B0705F60()
{
  return MEMORY[0x1F40FCBD0]();
}

uint64_t sub_1B0705F70()
{
  return MEMORY[0x1F40FCC38]();
}

uint64_t sub_1B0705F80()
{
  return MEMORY[0x1F40FCC48]();
}

uint64_t sub_1B0705F90()
{
  return MEMORY[0x1F40FCCC8]();
}

uint64_t sub_1B0705FA0()
{
  return MEMORY[0x1F40FCED0]();
}

uint64_t sub_1B0705FB0()
{
  return MEMORY[0x1F4186920]();
}

uint64_t sub_1B0705FC0()
{
  return MEMORY[0x1F4186930]();
}

uint64_t sub_1B0705FD0()
{
  return MEMORY[0x1F4186938]();
}

uint64_t sub_1B0705FE0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B0705FF0()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1B0706000()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B0706010()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1B0706020()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_1B0706030()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_1B0706040()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1B0706050()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B0706060()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B0706070()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1B0706080()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1B0706090()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B07060A0()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B07060B0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B07060C0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B07060D0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B07060E0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B07060F0()
{
  return MEMORY[0x1F4186AD8]();
}

uint64_t sub_1B0706100()
{
  return MEMORY[0x1F4186AE0]();
}

uint64_t sub_1B0706120()
{
  return MEMORY[0x1F4186B48]();
}

uint64_t sub_1B0706130()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1B0706140()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1B0706150()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B0706170()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B0706180()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B0706190()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B07061A0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B07061B0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B07061C0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B07061D0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B07061E0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B07061F0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B0706200()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B0706220()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B0706230()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B0706240()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B0706250()
{
  return MEMORY[0x1F4185EF8]();
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x1F40D0EC8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1F40F4A58]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1F40F4CE0](a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioFormatListItem *)MEMORY[0x1F40DB8A8](desc, sizeOut);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeCodeFormatDescriptionGetFrameDuration(CMTime *__return_ptr retstr, CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return (CMTime *)MEMORY[0x1F40DC0B0](retstr, timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DC0C0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  MEMORY[0x1F40DC250](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1F40DC260](retstr, timebase);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1F40DC368]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t FigGetRotationAngleAndFlipsFromCGAffineTransform()
{
  return MEMORY[0x1F40ED610]();
}

uint64_t FigIsHDRAllowedOnDevice()
{
  return MEMORY[0x1F40DDB38]();
}

BOOL MACaptionAppearanceAddSelectedLanguage(MACaptionAppearanceDomain domain, CFStringRef language)
{
  return MEMORY[0x1F40ECF38](domain, language);
}

CFArrayRef MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(MACaptionAppearanceDomain domain)
{
  return (CFArrayRef)MEMORY[0x1F40ECF60](domain);
}

CFArrayRef MACaptionAppearanceCopySelectedLanguages(MACaptionAppearanceDomain domain)
{
  return (CFArrayRef)MEMORY[0x1F40ECF68](domain);
}

MACaptionAppearanceDisplayType MACaptionAppearanceGetDisplayType(MACaptionAppearanceDomain domain)
{
  return MEMORY[0x1F40ECF88](domain);
}

uint64_t MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MEMORY[0x1F40ECFD0]();
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MRLanguageOptionCopyIdentifier()
{
  return MEMORY[0x1F412E3A0]();
}

uint64_t MRLanguageOptionCreate()
{
  return MEMORY[0x1F412E3B0]();
}

uint64_t MRLanguageOptionCreateAutomaticLanguageOptionForType()
{
  return MEMORY[0x1F412E3B8]();
}

uint64_t MRLanguageOptionCreateFromExternalRepresentation()
{
  return MEMORY[0x1F412E3C8]();
}

uint64_t MRLanguageOptionGetType()
{
  return MEMORY[0x1F412E3D0]();
}

uint64_t MRLanguageOptionGroupCreate()
{
  return MEMORY[0x1F412E3E0]();
}

uint64_t MRLanguageOptionGroupsCreateExternalRepresentation()
{
  return MEMORY[0x1F412E400]();
}

uint64_t MRLanguageOptionsCreateExternalRepresentation()
{
  return MEMORY[0x1F412E420]();
}

uint64_t MRMediaRemoteAddCommandHandlerBlock()
{
  return MEMORY[0x1F412E490]();
}

uint64_t MRMediaRemoteCommandInfoCreate()
{
  return MEMORY[0x1F412E4C8]();
}

uint64_t MRMediaRemoteCommandInfoSetCommand()
{
  return MEMORY[0x1F412E4E0]();
}

uint64_t MRMediaRemoteCommandInfoSetEnabled()
{
  return MEMORY[0x1F412E4E8]();
}

uint64_t MRMediaRemoteCommandInfoSetOptions()
{
  return MEMORY[0x1F412E4F0]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x1F412E570]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x1F412E588]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1F412E598]();
}

uint64_t MRMediaRemoteRemoveCommandHandlerBlock()
{
  return MEMORY[0x1F412E728]();
}

uint64_t MRMediaRemoteSetCanBeNowPlayingApplication()
{
  return MEMORY[0x1F412E798]();
}

uint64_t MRMediaRemoteSetNowPlayingInfoWithMergePolicy()
{
  return MEMORY[0x1F412E7C8]();
}

uint64_t MRMediaRemoteSetParentApplication()
{
  return MEMORY[0x1F412E7E0]();
}

uint64_t MRMediaRemoteSetSupportedCommands()
{
  return MEMORY[0x1F412E800]();
}

uint64_t MRMediaRemoteSetWantsOriginChangeNotifications()
{
  return MEMORY[0x1F412E820]();
}

uint64_t MRPairedDeviceCopyDeviceUID()
{
  return MEMORY[0x1F412E8B8]();
}

uint64_t MRPairedDeviceCopyGroupedDevices()
{
  return MEMORY[0x1F412E8C8]();
}

uint64_t MRPairedDeviceGetDeviceClass()
{
  return MEMORY[0x1F412E8E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4166B28]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1F4166BB0]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4166C10]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4166CD8]();
}

uint64_t UIPointIsDiscrete()
{
  return MEMORY[0x1F4166DF0]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4166DF8]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1F4166E00]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4166EE8]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4166EF0]();
}

uint64_t _AXSAutomaticSubtitlesShowOnSkipBack()
{
  return MEMORY[0x1F4178958]();
}

uint64_t _AXSAutomaticSubtitlesShowWhenMuted()
{
  return MEMORY[0x1F4178960]();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return MEMORY[0x1F4178A10]();
}

uint64_t _AXSExtendedVoiceIsolationMediaModesEnabled()
{
  return MEMORY[0x1F4178AB0]();
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  return MEMORY[0x1F4178DE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1F40E7358]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE0](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}
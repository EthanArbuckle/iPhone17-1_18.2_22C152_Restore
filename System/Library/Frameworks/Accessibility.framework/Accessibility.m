ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes;
}

uint64_t sub_213B3ECBC(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return sub_213B52FC0();
}

BOOL static AccessibilitySettings.animatedImagesEnabled.getter()
{
  return AXAnimatedImagesEnabled();
}

BOOL AXAssistiveAccessEnabled()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (unsigned int (*)(void))get_AXSClarityBoardEnabledSymbolLoc_ptr;
  v7 = get_AXSClarityBoardEnabledSymbolLoc_ptr;
  if (!get_AXSClarityBoardEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSClarityBoardEnabled");
    get_AXSClarityBoardEnabledSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0() != 0;
}

BOOL AXAnimatedImagesEnabled(void)
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (unsigned int (*)(void))get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
  v7 = get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
  if (!get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
    get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0() != 0;
}

BOOL AXPrefersNonBlinkingTextInsertionIndicator()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (unsigned int (*)(void))get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  v7 = get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  if (!get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSPrefersNonBlinkingCursorIndicator");
    get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0() != 0;
}

uint64_t libAccessibilityLibrary()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = libAccessibilityLibraryCore_frameworkLibrary;
  uint64_t v9 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __libAccessibilityLibraryCore_block_invoke;
    v3[4] = &unk_2641D8718;
    uint64_t v4 = &v6;
    v5 = v3;
    long long v10 = xmmword_2641D86F8;
    uint64_t v11 = 0;
    v7[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  v1 = v3[0];
  if (!v0)
  {
    v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_213B3F16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213B3F18C()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744D8 = result;
  return result;
}

uint64_t sub_213B3F1C4()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744D0 = result;
  return result;
}

uint64_t sub_213B3F1FC()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744C8 = result;
  return result;
}

uint64_t sub_213B3F234()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744C0 = result;
  return result;
}

uint64_t sub_213B3F26C()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744B8 = result;
  return result;
}

uint64_t sub_213B3F2A4()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744B0 = result;
  return result;
}

uint64_t sub_213B3F2DC()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744A8 = result;
  return result;
}

uint64_t sub_213B3F314()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA744A0 = result;
  return result;
}

uint64_t sub_213B3F34C()
{
  uint64_t result = sub_213B52FB0();
  qword_26AA74498 = result;
  return result;
}

__CFString *static AccessibilitySettings.animatedImagesEnabledDidChangeNotification.getter()
{
  return @"com.apple.accessibility.reduce.motion.autoplay.animated.images.status";
}

unint64_t sub_213B3F394()
{
  unint64_t result = qword_26AA73930;
  if (!qword_26AA73930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73930);
  }
  return result;
}

unint64_t sub_213B3F3E8()
{
  unint64_t result = qword_26AA73928;
  if (!qword_26AA73928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73928);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.SpellOutAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.SpellOutAttribute;
}

unint64_t sub_213B3F454()
{
  unint64_t result = qword_26AA739B8;
  if (!qword_26AA739B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA739B8);
  }
  return result;
}

unint64_t sub_213B3F4A8()
{
  return 0xD000000000000026;
}

uint64_t sub_213B3F4C8(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73948);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute;
}

unint64_t sub_213B3F4FC()
{
  unint64_t result = qword_26AA739B0;
  if (!qword_26AA739B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA739B0);
  }
  return result;
}

unint64_t sub_213B3F550()
{
  return 0xD000000000000027;
}

uint64_t sub_213B3F570(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, qword_26AA739C0);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute;
}

unint64_t sub_213B3F5A4()
{
  unint64_t result = qword_26AA739A8;
  if (!qword_26AA739A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA739A8);
  }
  return result;
}

unint64_t sub_213B3F5F8()
{
  return 0xD000000000000026;
}

uint64_t sub_213B3F618(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73968);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute;
}

unint64_t sub_213B3F64C()
{
  unint64_t result = qword_26AA739A0;
  if (!qword_26AA739A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA739A0);
  }
  return result;
}

unint64_t sub_213B3F6A0()
{
  return 0xD000000000000026;
}

uint64_t sub_213B3F6C0(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73970);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute;
}

unint64_t sub_213B3F6F4()
{
  unint64_t result = qword_26AA73998;
  if (!qword_26AA73998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73998);
  }
  return result;
}

unint64_t sub_213B3F748()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_213B3F768(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73950);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute;
}

unint64_t sub_213B3F79C()
{
  unint64_t result = qword_26AA73990;
  if (!qword_26AA73990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73990);
  }
  return result;
}

unint64_t sub_213B3F7F0()
{
  return 0xD000000000000020;
}

uint64_t sub_213B3F810(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73940);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute;
}

unint64_t sub_213B3F844()
{
  unint64_t result = qword_26AA73988;
  if (!qword_26AA73988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73988);
  }
  return result;
}

unint64_t sub_213B3F898()
{
  return 0xD000000000000019;
}

uint64_t sub_213B3F8B8(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73920);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.IPANotationAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.IPANotationAttribute;
}

unint64_t sub_213B3F8EC()
{
  unint64_t result = qword_26AA73980;
  if (!qword_26AA73980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73980);
  }
  return result;
}

unint64_t sub_213B3F940()
{
  return 0xD000000000000023;
}

uint64_t sub_213B3F960(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, qword_26AA73958);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextCustomAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextCustomAttribute;
}

unint64_t sub_213B3F994()
{
  unint64_t result = qword_26AA73978;
  if (!qword_26AA73978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AA73978);
  }
  return result;
}

unint64_t sub_213B3F9E8()
{
  return 0xD000000000000017;
}

uint64_t sub_213B3FA08(uint64_t a1, uint64_t a2)
{
  return sub_213B3ECBC(a1, a2, &qword_26AA73938);
}

BOOL AXPrefersHorizontalTextLayout(void)
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (unsigned int (*)(void))get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr;
  v7 = get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr;
  if (!get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSPrefersHorizontalTextLayout");
    get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0() != 0;
}

void AXOpenSettingsFeature(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  v3 = a2;
  if ((unint64_t)(a1 - 1) >= 2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v5 = AXLocalizedString(@"ERROR_OPEN_SETTINGS_UNSUPPPORTED_TYPE");
    v27[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v7 = [v4 errorWithDomain:*MEMORY[0x263F07F70] code:1 userInfo:v6];

    if (v7)
    {
      if (!v3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v8 = (void *)getAXUIClientClass_softClass;
  uint64_t v23 = getAXUIClientClass_softClass;
  if (!getAXUIClientClass_softClass)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __getAXUIClientClass_block_invoke;
    v19[3] = &unk_2641D86D8;
    v19[4] = &v20;
    __getAXUIClientClass_block_invoke((uint64_t)v19);
    uint64_t v8 = (void *)v21[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v20, 8);
  id v10 = [v9 alloc];
  uint64_t v11 = NSString;
  uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
  v13 = [v12 bundleIdentifier];
  v14 = [v11 stringWithFormat:@"OpenPrefClient-%@", v13];
  v15 = (void *)[v10 initWithIdentifier:v14 serviceBundleName:@"AXAssetAndDataServer"];

  v24 = @"feature";
  v16 = [NSNumber numberWithInteger:a1];
  v25 = v16;
  v17 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v18 = [MEMORY[0x263F21380] mainAccessQueue];
  [v15 sendAsynchronousMessage:v17 withIdentifier:14 targetAccessQueue:v18 completion:0];

  v7 = 0;
  if (v3) {
LABEL_8:
  }
    v3[2](v3, v7);
LABEL_9:
}

void sub_213B40B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2641D8738;
    uint64_t v6 = 0;
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AccessibilityUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXUIClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getAXUIClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXUIClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUILibraryCore_frameworkLibrary = result;
  return result;
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  Components = CGColorGetComponents(color);
  CGFloat Alpha = CGColorGetAlpha(color);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(color);
  if (Components)
  {
    CGColorSpaceRef v5 = ColorSpace;
    long long v70 = 0u;
    long long v71 = 0u;
    if (_AXSRGBColorSpace_onceToken[0] != -1) {
      dispatch_once(_AXSRGBColorSpace_onceToken, &__block_literal_global);
    }
    if ((CGColorSpaceRef)_AXSRGBColorSpace_RGBColorSpace == v5) {
      goto LABEL_12;
    }
    if (_AXExtendedSRGBColorSpace_onceToken != -1) {
      dispatch_once(&_AXExtendedSRGBColorSpace_onceToken, &__block_literal_global_37);
    }
    if ((CGColorSpaceRef)_AXExtendedSRGBColorSpace_ExtendedSRGBColorSpace == v5) {
      goto LABEL_12;
    }
    if (AXRGBColorTransform_onceToken != -1) {
      dispatch_once(&AXRGBColorTransform_onceToken, &__block_literal_global_39);
    }
    if (CGColorTransformConvertColorComponents())
    {
      *((CGFloat *)&v71 + 1) = Alpha;
      Components = (const CGFloat *)&v70;
LABEL_12:
      double v6 = *Components;
      double v7 = Components[1];
      int v8 = 1;
      double v10 = Components[2];
      double v9 = Components[3];
      goto LABEL_14;
    }
  }
  int v8 = 0;
  double v6 = -1.0;
  double v7 = -1.0;
  double v10 = -1.0;
  double v9 = -1.0;
LABEL_14:
  if (v6 < v7 || v6 < v10)
  {
    if (v7 < v6 || v7 < v10)
    {
      if (v7 >= v6) {
        double v13 = v6;
      }
      else {
        double v13 = v7;
      }
      double v14 = v10;
    }
    else
    {
      if (v6 >= v10) {
        double v13 = v10;
      }
      else {
        double v13 = v6;
      }
      double v14 = v7;
    }
  }
  else
  {
    if (v7 >= v10) {
      double v13 = v10;
    }
    else {
      double v13 = v7;
    }
    double v14 = v6;
  }
  double v15 = 0.0;
  double v16 = 0.0;
  if (v14 > 0.0)
  {
    double v15 = (v14 - v13) / v14;
    double v17 = (v14 - v6) / (v14 - v13);
    double v18 = (v14 - v7) / (v14 - v13);
    double v19 = (v14 - v10) / (v14 - v13);
    double v20 = 5.0 - v17;
    if (v13 == v6) {
      double v20 = v18 + 3.0;
    }
    double v21 = v17 + 1.0;
    if (v13 != v10) {
      double v21 = 3.0 - v19;
    }
    if (v14 != v7) {
      double v21 = v20;
    }
    BOOL v22 = v13 == v7;
    double v23 = 1.0 - v18;
    double v24 = v19 + 5.0;
    if (v22) {
      double v23 = v24;
    }
    if (v14 != v6) {
      double v23 = v21;
    }
    if (v15 == 0.0) {
      double v16 = 0.0;
    }
    else {
      double v16 = v23;
    }
  }
  v68[0] = @"red";
  v25 = objc_msgSend(NSNumber, "numberWithDouble:");
  v69[0] = v25;
  v68[1] = @"green";
  uint64_t v26 = [NSNumber numberWithDouble:v7];
  v69[1] = v26;
  v68[2] = @"blue";
  v27 = [NSNumber numberWithDouble:v10];
  v69[2] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];
  v29 = (void *)[v28 mutableCopy];

  if (v8)
  {
    v30 = objc_msgSend(NSNumber, "numberWithDouble:", (double)fmod(v16 / 6.0, 1.0), @"hue");
    *(void *)&long long v70 = v30;
    v67[1] = @"saturation";
    v31 = [NSNumber numberWithDouble:v15];
    *((void *)&v70 + 1) = v31;
    v67[2] = @"brightness";
    v32 = [NSNumber numberWithDouble:v14];
    *(void *)&long long v71 = v32;
    v67[3] = @"alpha";
    v33 = [NSNumber numberWithDouble:v9];
    *((void *)&v71 + 1) = v33;
    v34 = [NSDictionary dictionaryWithObjects:&v70 forKeys:v67 count:4];
    [v29 setValuesForKeysWithDictionary:v34];
  }
  v35 = [v29 objectForKeyedSubscript:@"hue"];

  v36 = [v29 objectForKeyedSubscript:@"hue"];
  [v36 doubleValue];
  double v38 = v37;

  v39 = [v29 objectForKeyedSubscript:@"saturation"];
  [v39 doubleValue];
  double v41 = v40;

  v42 = [v29 objectForKeyedSubscript:@"alpha"];
  [v42 doubleValue];
  double v44 = v43;

  v45 = [v29 objectForKeyedSubscript:@"red"];
  [v45 doubleValue];
  double v47 = v46;

  v48 = [v29 objectForKeyedSubscript:@"green"];
  [v48 doubleValue];
  double v50 = v49;

  v51 = [v29 objectForKeyedSubscript:@"blue"];
  [v51 doubleValue];
  double v53 = v52;

  double v54 = fmax(v44 * (v50 * 0.715200007 + v47 * 0.212599993 + v53 * 0.0722000003), 0.0);
  if (v54 <= 1.0) {
    double v55 = v54;
  }
  else {
    double v55 = 1.0;
  }
  if (!v35)
  {
    v57 = 0;
    goto LABEL_65;
  }
  if (v44 == 0.0)
  {
    v56 = @"transparent";
LABEL_64:
    v57 = AXLocalizedString(v56);
    goto LABEL_65;
  }
  if (v55 > 0.99000001)
  {
    v56 = @"white";
    goto LABEL_64;
  }
  if (v55 < 0.00999999978)
  {
    v56 = @"black";
    goto LABEL_64;
  }
  if (v41 >= 0.0500000007)
  {
    BOOL v61 = v38 > 0.0560000017;
    if (v38 >= 0.111000001) {
      BOOL v61 = 0;
    }
    BOOL v62 = v55 < 0.540000021 && v61;
    v59 = AXColorGetLightnessDescription(v55);
    if (v41 >= 0.200000003)
    {
      v60 = 0;
      if (v41 <= 0.899999976 || v55 <= 0.699999988)
      {
LABEL_81:
        if (v62)
        {
          v64 = @"brown";
        }
        else
        {
          if (v38 < 0.0 || v38 > 1.0)
          {
            v65 = AXLogCommon();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              AXNameFromColor_cold_1(v65, v38);
            }

            v66 = 0;
            goto LABEL_121;
          }
          if (v38 >= 0.0280000009)
          {
            if (v38 < 0.0560000017)
            {
              v64 = @"red orange";
              goto LABEL_120;
            }
            if (v38 < 0.111000001)
            {
              v64 = @"orange";
              goto LABEL_120;
            }
            if (v38 < 0.128999993)
            {
              v64 = @"orange yellow";
              goto LABEL_120;
            }
            if (v38 < 0.166999996)
            {
              v64 = @"yellow";
              goto LABEL_120;
            }
            if (v38 < 0.222000003)
            {
              v64 = @"yellow green";
              goto LABEL_120;
            }
            if (v38 < 0.388999999)
            {
              v64 = @"green";
              goto LABEL_120;
            }
            if (v38 < 0.469000012)
            {
              v64 = @"blue green";
              goto LABEL_120;
            }
            if (v38 < 0.540000021)
            {
              v64 = @"cyan";
              goto LABEL_120;
            }
            if (v38 < 0.611000001)
            {
              v64 = @"cyan blue";
              goto LABEL_120;
            }
            if (v38 < 0.666999996)
            {
              v64 = @"blue";
              goto LABEL_120;
            }
            if (v38 < 0.800000012)
            {
              v64 = @"blue magenta";
              goto LABEL_120;
            }
            if (v38 < 0.888999999)
            {
              v64 = @"magenta";
              goto LABEL_120;
            }
            if (v38 < 0.916999996)
            {
              v64 = @"magenta pink";
              goto LABEL_120;
            }
            if (v38 < 0.958000004)
            {
              v64 = @"pink";
              goto LABEL_120;
            }
            if (v38 < 0.986000001)
            {
              v64 = @"pink red";
              goto LABEL_120;
            }
          }
          v64 = @"red";
        }
LABEL_120:
        v66 = AXLocalizedString(v64);
LABEL_121:
        v57 = AXColorDescriptionFromAttributeDescriptions(v59, v60, v66);

        goto LABEL_122;
      }
      v63 = @"vibrant";
    }
    else
    {
      v63 = @"grayish";
    }
    v60 = AXLocalizedString(v63);
    goto LABEL_81;
  }
  v59 = AXColorGetLightnessDescription(v55);
  v60 = AXLocalizedString(@"gray");
  v57 = AXColorDescriptionFromAttributeDescriptions(v59, 0, v60);
LABEL_122:

LABEL_65:

  return (NSString *)v57;
}

id AXColorDescriptionFromAttributeDescriptions(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 length];
  uint64_t v9 = [v6 length];
  if (v8)
  {
    if (v9)
    {
      double v10 = AXLocalizedString(@"color.attributes.format.all");
      uint64_t v11 = NSString;
      id v14 = v6;
      id v15 = v7;
    }
    else
    {
      double v10 = AXLocalizedString(@"color.attributes.format.lightness.hue");
      uint64_t v11 = NSString;
      id v14 = v7;
    }
    objc_msgSend(v11, "localizedStringWithFormat:", v10, v5, v14, v15);
    goto LABEL_8;
  }
  if (v9)
  {
    double v10 = AXLocalizedString(@"color.attributes.format.saturation.hue");
    objc_msgSend(NSString, "localizedStringWithFormat:", v10, v6, v7, v15);
LABEL_8:
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  id v12 = v7;
LABEL_9:

  return v12;
}

id AXColorGetLightnessDescription(double a1)
{
  if (a1 < 0.349999994)
  {
    v1 = @"dark";
LABEL_5:
    v2 = AXLocalizedString(v1);
    goto LABEL_7;
  }
  if (a1 > 0.850000024)
  {
    v1 = @"light";
    goto LABEL_5;
  }
  v2 = 0;
LABEL_7:

  return v2;
}

uint64_t __AXRGBColorTransform_block_invoke()
{
  if (_AXSRGBColorSpace_onceToken[0] != -1) {
    dispatch_once(_AXSRGBColorSpace_onceToken, &__block_literal_global);
  }
  uint64_t result = MEMORY[0x2166914A0](_AXSRGBColorSpace_RGBColorSpace, 0);
  AXRGBColorTransform_ColorTransform = result;
  return result;
}

AXRequest *accessibilityAXRuntimeRequestingClient()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXRequestingClientSymbolLoc_ptr;
  uint64_t v9 = getAXRequestingClientSymbolLoc_ptr;
  if (!getAXRequestingClientSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getAXRequestingClientSymbolLoc_block_invoke;
    v5[3] = &unk_2641D86D8;
    v5[4] = &v6;
    __getAXRequestingClientSymbolLoc_block_invoke((uint64_t)v5);
    uint64_t v0 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  unint64_t v1 = v0() - 1;
  if (v1 <= 0x11 && ((0x2461Fu >> v1) & 1) != 0) {
    v2 = [[AXRequest alloc] initWithTechnology:*(&off_2641D87A8)[v1]];
  }
  else {
    v2 = 0;
  }

  return v2;
}

void *__getAXRequestingClientSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AXRuntimeLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AXRuntimeLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_2641D8790;
    uint64_t v7 = 0;
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
    if (AXRuntimeLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AXRequestingClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXRequestingClientSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXRuntimeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXRuntimeLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t accessibilityHIServicesRequestingClient()
{
  return 0;
}

id getCIImageClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCIImageClass_softClass;
  uint64_t v7 = getCIImageClass_softClass;
  if (!getCIImageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCIImageClass_block_invoke;
    v3[3] = &unk_2641D86D8;
    v3[4] = &v4;
    __getCIImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_213B422E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIImageClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CoreImageLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2641D8838;
    uint64_t v6 = 0;
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!CoreImageLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CIImage");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getCIImageClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreImageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreImageLibraryCore_frameworkLibrary = result;
  return result;
}

void _AXPostPlatformNotification(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v4 = (void (*)(uint64_t, id))getUIAccessibilityPostNotificationSymbolLoc_ptr;
  double v10 = getUIAccessibilityPostNotificationSymbolLoc_ptr;
  if (!getUIAccessibilityPostNotificationSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getUIAccessibilityPostNotificationSymbolLoc_block_invoke;
    v6[3] = &unk_2641D86D8;
    v6[4] = &v7;
    __getUIAccessibilityPostNotificationSymbolLoc_block_invoke((uint64_t)v6);
    uint64_t v4 = (void (*)(uint64_t, id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    long long v5 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v4(a1, v3);
}

void *__getUIAccessibilityPostNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __UIKitLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_2641D8850;
    uint64_t v7 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    v2 = (void *)UIKitLibraryCore_frameworkLibrary;
    if (UIKitLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)UIKitLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "UIAccessibilityPostNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilityPostNotificationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

id AXTextPreferredFontForTextStyle(void *a1)
{
  id v1 = a1;
  if (!_contentSizeCategoryOverrideForPreviews) {
    _PreferredContentSizeCategory();
  }
  v2 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getNSFontClass_softClass;
  uint64_t v11 = getNSFontClass_softClass;
  if (!getNSFontClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getNSFontClass_block_invoke;
    v7[3] = &unk_2641D86D8;
    v7[4] = &v8;
    __getNSFontClass_block_invoke((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  long long v5 = [v4 fontWithDescriptor:v2 size:0.0];

  return v5;
}

void sub_213B43818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _contentSizeCategoryToUse()
{
  uint64_t result = _contentSizeCategoryOverrideForPreviews;
  if (!_contentSizeCategoryOverrideForPreviews) {
    return _PreferredContentSizeCategory();
  }
  return result;
}

double AXTextPreferredUserFontSizeForSize(double a1)
{
  if (!_contentSizeCategoryOverrideForPreviews) {
    _PreferredContentSizeCategory();
  }
  v2 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  id v3 = (void *)CTFontDescriptorCopyAttribute(v2, (CFStringRef)*MEMORY[0x263F03B28]);
  [v3 doubleValue];
  double v5 = v4;

  CFRelease(v2);
  if (a1 > 0.0) {
    return fmin(fmax(round(v5 * a1 / 13.0), 8.0), 120.0);
  }
  return v5;
}

uint64_t AXTextGetAppUsesCustomContentSize()
{
  if (!_observingNotification)
  {
    _RefreshContentSizePreferences();
    _BeginObservingPreferredContentSizeChangedNotification();
  }
  return _cachedUsesCustomContentSize;
}

void _RefreshContentSizePreferences()
{
  CFStringRef v0 = (const __CFString *)_AXSCopyPreferredContentSizeCategoryName();
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v2 = [v1 BOOLForKey:@"UIContentSizeIsCustom"];

  if (_cachedPreferredContentSizeCategory
    && CFEqual(v0, (CFStringRef)_cachedPreferredContentSizeCategory))
  {
    if (_cachedUsesCustomContentSize == v2) {
      return;
    }
  }
  else
  {
    _cachedPreferredContentSizeCategory = (uint64_t)v0;
    if (_cachedUsesCustomContentSize == v2) {
      goto LABEL_7;
    }
  }
  _cachedUsesCustomContentSize = v2;
LABEL_7:
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"UIContentSizeCategoryDidChangeNotification" object:0];
}

void _BeginObservingPreferredContentSizeChangedNotification()
{
  if (!_observingNotification)
  {
    _observingNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v1 = (const __CFString *)*MEMORY[0x263F8B110];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_PreferredContentSizeChangedCallback, v1, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

void AXTextSetAppUsesCustomContentSize(int a1)
{
  if (!_observingNotification) {
    _BeginObservingPreferredContentSizeChangedNotification();
  }
  if (_cachedUsesCustomContentSize != a1)
  {
    int v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v3 = v2;
    if (a1) {
      [v2 setBool:1 forKey:@"UIContentSizeIsCustom"];
    }
    else {
      [v2 removeObjectForKey:@"UIContentSizeIsCustom"];
    }

    _cachedUsesCustomContentSize = a1;
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263F8B110];
    CFNotificationCenterPostNotification(DistributedCenter, v5, 0, 0, 1u);
  }
}

uint64_t AXTextSetContentSizeCategoryOverrideForPreviews(uint64_t result)
{
  _contentSizeCategoryOverrideForPreviews = result;
  return result;
}

uint64_t _PreferredContentSizeCategory()
{
  if (!_observingNotification)
  {
    _RefreshContentSizePreferences();
    _BeginObservingPreferredContentSizeChangedNotification();
  }
  return _cachedPreferredContentSizeCategory;
}

Class __getNSFontClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2641D8870;
    uint64_t v6 = 0;
    AppKitLibraryCore_frameworkLibrary = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!AppKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NSFont");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)__getNSFontClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNSFontClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppKitLibraryCore_frameworkLibrary = result;
  return result;
}

id getkAXMChartAxisTitleKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartAxisTitleKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartAxisTitleKeySymbolLoc_ptr;
  if (!getkAXMChartAxisTitleKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartAxisTitleKey");
    getkAXMChartAxisTitleKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartNumericAxisScaleTypeKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartNumericAxisScaleTypeKey");
    getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartNumericAxisLowerBoundKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartNumericAxisLowerBoundKey");
    getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartNumericAxisUpperBoundKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartNumericAxisUpperBoundKey");
    getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartNumericAxisGridlinePositionsKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartNumericAxisGridlinePositionsKey");
    getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartAxisTypeNumeric()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartAxisTypeNumericSymbolLoc_ptr;
  uint64_t v8 = getkAXMChartAxisTypeNumericSymbolLoc_ptr;
  if (!getkAXMChartAxisTypeNumericSymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartAxisTypeNumeric");
    getkAXMChartAxisTypeNumericSymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartAxisTypeKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartAxisTypeKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartAxisTypeKeySymbolLoc_ptr;
  if (!getkAXMChartAxisTypeKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartAxisTypeKey");
    getkAXMChartAxisTypeKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartCategoryAxisCategoriesKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr;
  if (!getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartCategoryAxisCategoriesKey");
    getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartAxisTypeCategorical()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartAxisTypeCategoricalSymbolLoc_ptr;
  uint64_t v8 = getkAXMChartAxisTypeCategoricalSymbolLoc_ptr;
  if (!getkAXMChartAxisTypeCategoricalSymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartAxisTypeCategorical");
    getkAXMChartAxisTypeCategoricalSymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesNameKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesNameKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesNameKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesNameKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesNameKey");
    getkAXMChartSeriesNameKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesContinuousKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesContinuousKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesContinuousKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesContinuousKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesContinuousKey");
    getkAXMChartSeriesContinuousKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesXDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesXDataKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesXDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesXDataKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesXDataKey");
    getkAXMChartSeriesXDataKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesYDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesYDataKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesYDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesYDataKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesYDataKey");
    getkAXMChartSeriesYDataKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesZNumericDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesZNumericDataKey");
    getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesZCategoricalDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesZCategoricalDataKey");
    getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesValueDescriptionsKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesValueDescriptionsKey");
    getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id AXAudioGraphLog()
{
  if (AXAudioGraphLog_onceToken != -1) {
    dispatch_once(&AXAudioGraphLog_onceToken, &__block_literal_global_467);
  }
  CFStringRef v0 = (void *)AXAudioGraphLog_Log;

  return v0;
}

id getkAXMChartSeriesMeanValueDescriptionKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesMeanValueDescriptionKey");
    getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

void sub_213B483F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

id getkAXMChartTitleKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartTitleKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartTitleKeySymbolLoc_ptr;
  if (!getkAXMChartTitleKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartTitleKey");
    getkAXMChartTitleKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSummaryKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSummaryKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSummaryKeySymbolLoc_ptr;
  if (!getkAXMChartSummaryKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSummaryKey");
    getkAXMChartSummaryKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartContentDirectionKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartContentDirectionKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartContentDirectionKeySymbolLoc_ptr;
  if (!getkAXMChartContentDirectionKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartContentDirectionKey");
    getkAXMChartContentDirectionKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartXAxisKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartXAxisKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartXAxisKeySymbolLoc_ptr;
  if (!getkAXMChartXAxisKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartXAxisKey");
    getkAXMChartXAxisKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartYAxisKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartYAxisKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartYAxisKeySymbolLoc_ptr;
  if (!getkAXMChartYAxisKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartYAxisKey");
    getkAXMChartYAxisKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartAdditionalAxesKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartAdditionalAxesKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartAdditionalAxesKeySymbolLoc_ptr;
  if (!getkAXMChartAdditionalAxesKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartAdditionalAxesKey");
    getkAXMChartAdditionalAxesKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getkAXMChartSeriesKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v0 = (void **)getkAXMChartSeriesKeySymbolLoc_ptr;
  uint64_t v8 = getkAXMChartSeriesKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesKeySymbolLoc_ptr)
  {
    CFStringRef v1 = (void *)AXMediaUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAXMChartSeriesKey");
    getkAXMChartSeriesKeySymbolLoc_ptr = v6[3];
    CFStringRef v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  int v2 = *v0;

  return v2;
}

id getAXMDataSonificationManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFStringRef v0 = (void *)getAXMDataSonificationManagerClass_softClass;
  uint64_t v7 = getAXMDataSonificationManagerClass_softClass;
  if (!getAXMDataSonificationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXMDataSonificationManagerClass_block_invoke;
    v3[3] = &unk_2641D86D8;
    v3[4] = &v4;
    __getAXMDataSonificationManagerClass_block_invoke((uint64_t)v3);
    CFStringRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_213B49DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkAXMChartAxisTitleKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartAxisTitleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartAxisTitleKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXMediaUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AXMediaUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2641D88C8;
    uint64_t v5 = 0;
    AXMediaUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AXMediaUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
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

uint64_t __AXMediaUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXMediaUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkAXMChartNumericAxisScaleTypeKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartNumericAxisScaleTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartNumericAxisLowerBoundKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartNumericAxisLowerBoundKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartNumericAxisUpperBoundKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartNumericAxisUpperBoundKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartNumericAxisGridlinePositionsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartAxisTypeNumericSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartAxisTypeNumeric");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartAxisTypeNumericSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartAxisTypeKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartAxisTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartAxisTypeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartCategoryAxisCategoriesKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartCategoryAxisCategoriesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartAxisTypeCategoricalSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartAxisTypeCategorical");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartAxisTypeCategoricalSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesContinuousKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesContinuousKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesContinuousKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesXDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesXDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesXDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesYDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesYDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesYDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesZNumericDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesZNumericDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesZCategoricalDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesZCategoricalDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesLabelDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesLabelDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesLabelDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesValueDescriptionsKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesValueDescriptionsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXAudioGraphLog_block_invoke()
{
  AXAudioGraphLog_Log = (uint64_t)os_log_create("com.apple.Accessibility", "AudioGraph");

  return MEMORY[0x270F9A758]();
}

void *__getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesMeanValueDescriptionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartTitleKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartTitleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartTitleKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSummaryKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSummaryKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSummaryKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartContentDirectionKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartContentDirectionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartContentDirectionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartContentFrameKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartContentFrameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartContentFrameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartXAxisKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartXAxisKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartXAxisKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartYAxisKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartYAxisKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartYAxisKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartAdditionalAxesKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartAdditionalAxesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartAdditionalAxesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAXMChartSeriesKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "kAXMChartSeriesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXMChartSeriesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMDataSonificationManagerClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMDataSonificationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMDataSonificationManagerClass_block_invoke_cold_1();
  }
  getAXMDataSonificationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AXApplicationFocusDidChange(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    id v3 = (void (*)(uint64_t, id))getUIAccessibilityPostNotificationSymbolLoc_ptr_0;
    uint64_t v9 = getUIAccessibilityPostNotificationSymbolLoc_ptr_0;
    if (!getUIAccessibilityPostNotificationSymbolLoc_ptr_0)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0;
      v5[3] = &unk_2641D86D8;
      v5[4] = &v6;
      __getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0((uint64_t)v5);
      id v3 = (void (*)(uint64_t, id))v7[3];
    }
    _Block_object_dispose(&v6, 8);
    if (!v3)
    {
      long long v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
      _Block_object_dispose(&v6, 8);
      _Unwind_Resume(v4);
    }
    v3(1053, v2);
  }
}

void *__getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __UIKitLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_2641D8930;
    uint64_t v7 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)UIKitLibraryCore_frameworkLibrary_0;
    if (UIKitLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)UIKitLibraryCore_frameworkLibrary_0;
LABEL_5:
  Class result = dlsym(v2, "UIAccessibilityPostNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilityPostNotificationSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

AXHearingDeviceEar AXMFiHearingDeviceStreamingEar(void)
{
  return MEMORY[0x270F90808]();
}

BOOL AXSupportsBidirectionalAXMFiHearingDeviceStreaming(void)
{
  if (AXSupportsBidirectionalAXMFiHearingDeviceStreaming_onceToken != -1) {
    dispatch_once(&AXSupportsBidirectionalAXMFiHearingDeviceStreaming_onceToken, &__block_literal_global_1);
  }
  return AXSupportsBidirectionalAXMFiHearingDeviceStreaming_SupportsLEA2;
}

uint64_t __AXSupportsBidirectionalAXMFiHearingDeviceStreaming_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  AXSupportsBidirectionalAXMFiHearingDeviceStreaming_SupportsLEA2 = result;
  return result;
}

NSArray *AXMFiHearingDevicePairedUUIDs(void)
{
  uint64_t v0 = _AXSHearingDevicePairedUUIDs();
  id v1 = [MEMORY[0x263EFF980] array];
  id v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    id v3 = v2;
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, @"com.apple.developer.hearing-aid-app", 0);
    if (!v4)
    {
LABEL_12:
      CFRelease(v3);
      goto LABEL_13;
    }
    uint64_t v5 = (void *)v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = v5;
      if ([v7 length])
      {
        if ([v7 isEqualToString:@"com.apple.hearing.internal"])
        {
          uint64_t v8 = [v0 allValues];
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke;
          v19[3] = &unk_2641D8960;
          id v1 = v1;
          id v20 = v1;
          [v8 enumerateObjectsUsingBlock:v19];
        }
        else
        {
          uint64_t v10 = [v0 valueForKey:v7];

          id v1 = (id)v10;
        }
      }
    }
    else
    {
      CFTypeID v9 = CFGetTypeID(v5);
      if (v9 != CFArrayGetTypeID())
      {
LABEL_11:
        CFRelease(v5);
        goto LABEL_12;
      }
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke_2;
      v16[3] = &unk_2641D8988;
      id v17 = v0;
      id v1 = v1;
      id v18 = v1;
      [v5 enumerateObjectsUsingBlock:v16];

      id v7 = v17;
    }

    goto LABEL_11;
  }
LABEL_13:
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke_3;
  v14[3] = &unk_2641D89B0;
  id v12 = v11;
  id v15 = v12;
  [v1 enumerateObjectsUsingBlock:v14];

  return (NSArray *)v12;
}

void __AXMFiHearingDevicePairedUUIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

void __AXMFiHearingDevicePairedUUIDs_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

void __AXMFiHearingDevicePairedUUIDs_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithUUIDString:v4];

  uint64_t v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v5 = v6;
  }
}

void sub_213B4B744(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2641D89D0;
    uint64_t v6 = 0;
    AccessibilityUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AccessibilityUILibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("AXUIClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getAXUIClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXUIClientClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

id AXLocalizedString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26C49B9E8 table:@"Accessibility"];

  return v4;
}

id AXBrailleMap.subscript.getter()
{
  return objc_msgSend(v0, sel_heightAtPoint_);
}

id sub_213B4C010@<X0>(id *a1@<X0>, double *a2@<X1>, _DWORD *a3@<X8>)
{
  id result = objc_msgSend(*a1, sel_heightAtPoint_, *a2, a2[1]);
  *a3 = v5;
  return result;
}

id sub_213B4C048(_DWORD *a1, id *a2, double *a3, double a4)
{
  LODWORD(a4) = *a1;
  return objc_msgSend(*a2, sel_setHeight_atPoint_, a4, *a3, a3[1]);
}

id AXBrailleMap.subscript.setter()
{
  return objc_msgSend(v0, sel_setHeight_atPoint_);
}

id (*AXBrailleMap.subscript.modify(uint64_t a1, double a2, double a3))(uint64_t a1, double a2)
{
  *(void *)(a1 + 16) = v3;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  objc_msgSend(v3, sel_heightAtPoint_);
  *(_DWORD *)(a1 + 24) = v5;
  return sub_213B4C0C8;
}

id sub_213B4C0C8(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 24);
  return objc_msgSend(*(id *)(a1 + 16), sel_setHeight_atPoint_, a2, *(double *)a1, *(double *)(a1 + 8));
}

uint64_t sub_213B4C0E4()
{
  return 0;
}

id AXNumericDataAxisDescriptor.range.getter()
{
  objc_msgSend(v0, sel_lowerBound);
  double v2 = v1;
  id result = objc_msgSend(v0, sel_upperBound);
  if (v2 > v4) {
    __break(1u);
  }
  return result;
}

id AXNumericDataAxisDescriptor.range.setter(double a1, double a2)
{
  objc_msgSend(v2, sel_setLowerBound_);

  return objc_msgSend(v2, sel_setUpperBound_, a2);
}

id (*AXNumericDataAxisDescriptor.range.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  objc_msgSend(v1, sel_lowerBound);
  double v4 = v3;
  id result = (id (*)(uint64_t))objc_msgSend(v1, sel_upperBound);
  if (v4 > v6)
  {
    __break(1u);
  }
  else
  {
    *(double *)a1 = v4;
    *(double *)(a1 + 8) = v6;
    return sub_213B4C214;
  }
  return result;
}

id sub_213B4C214(uint64_t a1)
{
  double v1 = *(void **)(a1 + 16);
  double v2 = *(double *)(a1 + 8);
  objc_msgSend(v1, sel_setLowerBound_, *(double *)a1);

  return objc_msgSend(v1, sel_setUpperBound_, v2);
}

char *AXNumericDataAxisDescriptor.gridlinePositions.getter()
{
  id v1 = objc_msgSend(v0, sel_gridlinePositions);
  sub_213B4D990(0, &qword_26AA738F0);
  unint64_t v2 = sub_213B530B0();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_213B53190();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  id result = sub_213B4D904(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x216691290](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      objc_msgSend(v7, sel_doubleValue);
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        sub_213B4D904((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v5;
      *(void *)(v13 + 16) = v12 + 1;
      *(void *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void AXNumericDataAxisDescriptor.gridlinePositions.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    sub_213B53160();
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = v4 + 1;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)(a1 + 8 * v4 + 32));
      sub_213B53140();
      sub_213B53170();
      sub_213B53180();
      sub_213B53150();
      uint64_t v4 = v5;
    }
    while (v3 != v5);
  }
  swift_bridgeObjectRelease();
  sub_213B4D990(0, &qword_26AA738F0);
  id v6 = (id)sub_213B530A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setGridlinePositions_, v6);
}

void (*AXNumericDataAxisDescriptor.gridlinePositions.modify(char **a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = AXNumericDataAxisDescriptor.gridlinePositions.getter();
  return sub_213B4C5BC;
}

void sub_213B4C5BC(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    AXNumericDataAxisDescriptor.gridlinePositions.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AXNumericDataAxisDescriptor.gridlinePositions.setter(*a1);
  }
}

id AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v12 = (void *)sub_213B52FB0();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a5 + 16);
  if (v13)
  {
    double v21 = v12;
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_213B53160();
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = v14 + 1;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)(a5 + 8 * v14 + 32));
      sub_213B53140();
      sub_213B53170();
      sub_213B53180();
      sub_213B53150();
      uint64_t v14 = v15;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    unint64_t v12 = v21;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_213B4D990(0, &qword_26AA738F0);
  id v17 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  aBlock[4] = a6;
  aBlock[5] = a7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213B4C838;
  aBlock[3] = &block_descriptor;
  id v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v19 = objc_msgSend(v16, sel_initWithTitle_lowerBound_upperBound_gridlinePositions_valueDescriptionProvider_, v12, v17, v18, a1, a2);
  swift_release();
  _Block_release(v18);

  return v19;
}

id sub_213B4C838(uint64_t a1, double a2)
{
  uint64_t v3 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = swift_retain();
  v3(v4, a2);
  swift_release();
  uint64_t v5 = (void *)sub_213B52FB0();
  swift_bridgeObjectRelease();

  return v5;
}

id AXNumericDataAxisDescriptor.init(attributedTitle:range:gridlinePositions:valueDescriptionProvider:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7 = a3;
  unint64_t v11 = a1;
  uint64_t v12 = *(void *)(a2 + 16);
  if (v12)
  {
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_213B53160();
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = v13 + 1;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)(a2 + 8 * v13 + 32));
      sub_213B53140();
      sub_213B53170();
      sub_213B53180();
      sub_213B53150();
      uint64_t v13 = v14;
    }
    while (v12 != v14);
    swift_bridgeObjectRelease();
    uint64_t v7 = a3;
    unint64_t v11 = a1;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_213B4D990(0, &qword_26AA738F0);
  id v16 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  aBlock[4] = v7;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213B4C838;
  aBlock[3] = &block_descriptor_3;
  id v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v18 = objc_msgSend(v15, sel_initWithAttributedTitle_lowerBound_upperBound_gridlinePositions_valueDescriptionProvider_, v11, v16, v17, a5, a6);

  swift_release();
  _Block_release(v17);

  return v18;
}

void __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(AXDataPoint *__return_ptr retstr, Swift::Double x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  uint64_t v6 = v5;
  uint64_t countAndFlagsBits = label.value._countAndFlagsBits;
  char rawValue = (char)additionalValues._rawValue;
  double v9 = *(double *)&y.is_nil;
  unint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_valueWithNumber_, x);
  if ((rawValue & 1) == 0)
  {
    id v13 = objc_msgSend(v11, sel_valueWithNumber_, v9);
    uint64_t v14 = *(void *)(countAndFlagsBits + 16);
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  id v13 = 0;
  uint64_t v14 = *(void *)(countAndFlagsBits + 16);
  if (!v14) {
    goto LABEL_10;
  }
LABEL_3:
  id v23 = v13;
  sub_213B53160();
  id v15 = (unsigned char *)(countAndFlagsBits + 48);
  do
  {
    uint64_t v19 = *((void *)v15 - 2);
    if (*v15)
    {
      uint64_t v16 = *((void *)v15 - 1);
      swift_bridgeObjectRetain();
      id v17 = (void *)sub_213B52FB0();
      id v18 = objc_msgSend(v11, sel_valueWithCategory_, v17);

      sub_213B4D93C(v19, v16, 1);
    }
    else
    {
      id v20 = objc_msgSend(v11, sel_valueWithNumber_, *((double *)v15 - 2));
    }
    sub_213B53140();
    sub_213B53170();
    sub_213B53180();
    sub_213B53150();
    v15 += 24;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  id v13 = v23;
LABEL_11:
  sub_213B4D990(0, (unint64_t *)&unk_26AA738D8);
  double v21 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    BOOL v22 = (void *)sub_213B52FB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v22 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithX_y_additionalValues_label_, v12, v13, v21, v22);
}

void __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(AXDataPoint *__return_ptr retstr, Swift::String x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  uint64_t v23 = v5;
  uint64_t countAndFlagsBits = label.value._countAndFlagsBits;
  char rawValue = (char)additionalValues._rawValue;
  double v8 = *(double *)&y.is_nil;
  double v9 = (void *)sub_213B52FB0();
  swift_bridgeObjectRelease();
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_valueWithCategory_, v9);

  if ((rawValue & 1) == 0)
  {
    id v12 = objc_msgSend(v10, sel_valueWithNumber_, v8);
    uint64_t v13 = *(void *)(countAndFlagsBits + 16);
    if (v13) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  id v12 = 0;
  uint64_t v13 = *(void *)(countAndFlagsBits + 16);
  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  id v22 = v12;
  sub_213B53160();
  uint64_t v14 = (unsigned char *)(countAndFlagsBits + 48);
  do
  {
    uint64_t v18 = *((void *)v14 - 2);
    if (*v14)
    {
      uint64_t v15 = *((void *)v14 - 1);
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)sub_213B52FB0();
      id v17 = objc_msgSend(v10, sel_valueWithCategory_, v16);

      sub_213B4D93C(v18, v15, 1);
    }
    else
    {
      id v19 = objc_msgSend(v10, sel_valueWithNumber_, *((double *)v14 - 2));
    }
    sub_213B53140();
    sub_213B53170();
    sub_213B53180();
    sub_213B53150();
    v14 += 24;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  id v12 = v22;
LABEL_11:
  sub_213B4D990(0, (unint64_t *)&unk_26AA738D8);
  id v20 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  if (v23)
  {
    double v21 = (void *)sub_213B52FB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v21 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithX_y_additionalValues_label_, v11, v12, v20, v21);
}

id AXChartDescriptor.xAxis.getter()
{
  id v1 = objc_msgSend(v0, sel_xAxis);

  return v1;
}

uint64_t AXChartDescriptor.xAxis.setter(uint64_t a1)
{
  objc_msgSend(v1, sel_setXAxis_, a1);

  return swift_unknownObjectRelease();
}

uint64_t (*AXChartDescriptor.xAxis.modify(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_xAxis);
  return sub_213B4D088;
}

uint64_t sub_213B4D088(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 8), sel_setXAxis_, *(void *)a1);

  return swift_unknownObjectRelease();
}

uint64_t AXChartDescriptor.additionalAxes.getter()
{
  id v1 = objc_msgSend(v0, sel_additionalAxes);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
  uint64_t v3 = sub_213B530B0();

  return v3;
}

void sub_213B4D13C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_additionalAxes);
  if (v3)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
    uint64_t v5 = sub_213B530B0();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  *a2 = v5;
}

void sub_213B4D1B4(void *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_213B53190()) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
      id v4 = (id)sub_213B530A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_setAdditionalAxes_, v4);

      return;
    }
  }
  swift_bridgeObjectRelease();

  objc_msgSend(v2, sel_setAdditionalAxes_, 0);
}

void AXChartDescriptor.additionalAxes.setter(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (sub_213B53190()) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
    id v2 = (id)sub_213B530A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setAdditionalAxes_, v2);

    return;
  }
  swift_bridgeObjectRelease();

  objc_msgSend(v1, sel_setAdditionalAxes_, 0);
}

void (*AXChartDescriptor.additionalAxes.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_additionalAxes);
  if (v3)
  {
    id v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
    uint64_t v5 = sub_213B530B0();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  *a1 = v5;
  return sub_213B4D41C;
}

void sub_213B4D41C(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = (unint64_t)*a1 >> 62;
  if (a2)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_213B53190();
      uint64_t v6 = (void *)a1[1];
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v6 = (void *)a1[1];
      if (v5)
      {
LABEL_4:
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
        uint64_t v7 = (void *)sub_213B530A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v6, sel_setAdditionalAxes_, v7);

LABEL_12:
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setAdditionalAxes_, 0);
    goto LABEL_12;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_213B53190();
    swift_bridgeObjectRelease();
    double v8 = (void *)a1[1];
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    double v8 = (void *)a1[1];
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_7:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
      id v11 = (id)sub_213B530A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setAdditionalAxes_, v11);

      return;
    }
  }
  swift_bridgeObjectRelease();

  objc_msgSend(v8, sel_setAdditionalAxes_, 0);
}

id AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, unint64_t a7)
{
  if (a2)
  {
    id v11 = (void *)sub_213B52FB0();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = 0;
    if (a4)
    {
LABEL_3:
      id v12 = (void *)sub_213B52FB0();
      swift_bridgeObjectRelease();
      if (!(a7 >> 62)) {
        goto LABEL_4;
      }
LABEL_9:
      id v19 = a6;
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_213B53190();
      swift_bridgeObjectRelease();
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  id v12 = 0;
  if (a7 >> 62) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v13 = *(void **)((a7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v14 = a6;
  if (v13)
  {
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
    uint64_t v13 = (void *)sub_213B530A0();
  }
LABEL_6:
  swift_bridgeObjectRelease();
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_213B4D990(0, &qword_26AA738E8);
  uint64_t v16 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithTitle_summary_xAxisDescriptor_yAxisDescriptor_additionalAxes_series_, v11, v12, a5, a6, v13, v16);

  swift_unknownObjectRelease();
  return v17;
}

id AXChartDescriptor.init(attributedTitle:summary:xAxis:yAxis:additionalAxes:series:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6)
{
  if (a3)
  {
    uint64_t v10 = (void *)sub_213B52FB0();
    swift_bridgeObjectRelease();
    if (!(a6 >> 62)) {
      goto LABEL_3;
    }
LABEL_7:
    id v17 = a5;
    swift_bridgeObjectRetain();
    id v11 = (void *)sub_213B53190();
    swift_bridgeObjectRelease();
    if (!v11) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = 0;
  if (a6 >> 62) {
    goto LABEL_7;
  }
LABEL_3:
  id v11 = *(void **)((a6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v12 = a5;
  if (v11)
  {
LABEL_4:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9070);
    id v11 = (void *)sub_213B530A0();
  }
LABEL_5:
  swift_bridgeObjectRelease();
  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_213B4D990(0, &qword_26AA738E8);
  id v14 = (void *)sub_213B530A0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithAttributedTitle_summary_xAxisDescriptor_yAxisDescriptor_additionalAxes_series_, a1, v10, a4, a5, v11, v14);

  swift_unknownObjectRelease();
  return v15;
}

char *sub_213B4D904(char *a1, int64_t a2, char a3)
{
  id result = sub_213B4DD10(a1, a2, a3, *v3);
  void *v3 = result;
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

uint64_t sub_213B4D93C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
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

uint64_t sub_213B4D990(uint64_t a1, unint64_t *a2)
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

id sub_213B4D9CC@<X0>(id *a1@<X0>, double *a2@<X8>)
{
  id v3 = *a1;
  objc_msgSend(*a1, sel_lowerBound);
  double v5 = v4;
  id result = objc_msgSend(v3, sel_upperBound);
  if (v5 > v7)
  {
    __break(1u);
  }
  else
  {
    *a2 = v5;
    a2[1] = v7;
  }
  return result;
}

id sub_213B4DA2C(double *a1, id *a2)
{
  double v2 = a1[1];
  id v3 = *a2;
  objc_msgSend(*a2, sel_setLowerBound_, *a1);

  return objc_msgSend(v3, sel_setUpperBound_, v2);
}

char *sub_213B4DA88@<X0>(char **a1@<X8>)
{
  id result = AXNumericDataAxisDescriptor.gridlinePositions.getter();
  *a1 = result;
  return result;
}

void sub_213B4DAB4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  AXNumericDataAxisDescriptor.gridlinePositions.setter(v0);
}

id sub_213B4DAE0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_xAxis);
  *a2 = result;
  return result;
}

id sub_213B4DB1C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setXAxis_, *a1);
}

uint64_t sub_213B4DB3C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s5ValueOwxx(uint64_t a1)
{
  return sub_213B4D93C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_213B4DB3C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s5ValueOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_213B4DB3C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_213B4D93C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_213B4D93C(v4, v5, v6);
  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_213B4DCE8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_213B4DCF4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AXDataPoint.Value()
{
  return &type metadata for AXDataPoint.Value;
}

char *sub_213B4DD10(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9080);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void sub_213B4DE48()
{
  sub_213B515A4();

  JUMPOUT(0x216691070);
}

void sub_213B4DE94()
{
  sub_213B515A4();

  JUMPOUT(0x216691080);
}

uint64_t AttributeDynamicLookup.subscript.getter(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  return MEMORY[0x270EEF818](v3, v3, a2);
}

uint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73920);
}

unint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.markdownName.getter()
{
  return 0xD000000000000019;
}

uint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.decodeMarkdown(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_213B53240();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    unint64_t v5 = sub_213B531E0();
    if (v5 >= 7) {
      char v6 = 0;
    }
    else {
      char v6 = v5;
    }
    *a2 = v6;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  return result;
}

unint64_t AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 7;
  if (result < 7) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

id static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.objectiveCValue(for:)(unsigned __int8 *a1)
{
  return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *a1);
}

uint64_t AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.rawValue.getter()
{
  return *v0;
}

id static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.value(for:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(a1, sel_integerValue);
  if ((unint64_t)result >= 7) {
    char v4 = 0;
  }
  else {
    char v4 = (char)result;
  }
  *a2 = v4;
  return result;
}

BOOL sub_213B4E0B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213B4E0C4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x746C7561666564;
    }
    else {
      uint64_t v3 = 1751607656;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE700000000000000;
    }
    else {
      unint64_t v4 = 0xE400000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x746C7561666564;
      }
      else {
        uint64_t v6 = 1751607656;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE700000000000000;
      }
      else {
        unint64_t v7 = 0xE400000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 7827308;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 7827308)
  {
LABEL_21:
    char v8 = sub_213B531C0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_213B4E1C0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E69616C70;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E69616C70;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x656C6F736E6F63;
      break;
    case 2:
      uint64_t v5 = 0x74737953656C6966;
      unint64_t v3 = 0xEA00000000006D65;
      break;
    case 3:
      uint64_t v5 = 0x6E6967617373656DLL;
      unint64_t v3 = 0xE900000000000067;
      break;
    case 4:
      uint64_t v5 = 0x766974617272616ELL;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 5:
      uint64_t v5 = 0x6F43656372756F73;
      unint64_t v3 = 0xEA00000000006564;
      break;
    case 6:
      uint64_t v5 = 0x6873646165727073;
      unint64_t v3 = 0xEB00000000746565;
      break;
    case 7:
      uint64_t v5 = 0x636F725064726F77;
      unint64_t v3 = 0xEE00676E69737365;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x656C6F736E6F63) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xEA00000000006D65;
      if (v5 != 0x74737953656C6966) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xE900000000000067;
      if (v5 != 0x6E6967617373656DLL) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xE900000000000065;
      if (v5 != 0x766974617272616ELL) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xEA00000000006564;
      if (v5 != 0x6F43656372756F73) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      uint64_t v2 = 0x6873646165727073;
      unint64_t v6 = 0xEB00000000746565;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xEE00676E69737365;
      if (v5 != 0x636F725064726F77) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_213B531C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_213B4E4A4()
{
  return sub_213B53230();
}

uint64_t sub_213B4E4EC()
{
  return sub_213B53220();
}

uint64_t sub_213B4E518()
{
  sub_213B52FE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_213B4E67C()
{
  return sub_213B53230();
}

uint64_t sub_213B4E6C0()
{
  return sub_213B53230();
}

unint64_t sub_213B4E834@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)(*a1, a2);
}

void sub_213B4E83C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_213B4E848()
{
  return sub_213B53090();
}

uint64_t sub_213B4E8A8()
{
  return sub_213B53070();
}

uint64_t sub_213B4E8F8()
{
  return sub_213B52F80();
}

uint64_t sub_213B4E958()
{
  return sub_213B52F90();
}

uint64_t sub_213B4E9B8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.decodeMarkdown(from:)(a1, a2);
}

id sub_213B4E9D0(unsigned __int8 *a1)
{
  return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *a1);
}

unint64_t sub_213B4EA14@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  unint64_t result = AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)((unint64_t)objc_msgSend(a1, sel_integerValue), &v5);
  char v4 = v5;
  if (v5 == 7) {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextCustomAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73938);
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextCustomAttribute.markdownName.getter()
{
  return 0xD000000000000017;
}

uint64_t sub_213B4EAB4()
{
  return sub_213B52F80();
}

uint64_t sub_213B4EB38()
{
  return sub_213B52F90();
}

uint64_t sub_213B4EBBC()
{
  return sub_213B52FA0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73950);
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.markdownName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.decodeMarkdown(from:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_213B53240();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    sub_213B531D0();
    AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)(&v7);
    char v5 = v7;
    if (v7 == 8) {
      char v5 = 0;
    }
    *a2 = v5;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B531A0();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 8;
  if (v2 < 8) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.objectiveCValue(for:)(uint64_t a1)
{
  return sub_213B4FDFC(a1, (void (*)(void))sub_213B4ED9C);
}

uint64_t sub_213B4ED9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = 0x6E69616C70;
  uint64_t v6 = *v4;
  unint64_t v7 = 0xE500000000000000;
  uint64_t v8 = 0x6E69616C70;
  switch(v6)
  {
    case 1:
      unint64_t v7 = 0xE700000000000000;
      uint64_t v8 = 0x656C6F736E6F63;
      break;
    case 2:
      uint64_t v8 = 0x74737953656C6966;
      unint64_t v7 = 0xEA00000000006D65;
      break;
    case 3:
      uint64_t v8 = 0x6E6967617373656DLL;
      unint64_t v7 = 0xE900000000000067;
      break;
    case 4:
      uint64_t v8 = 0x766974617272616ELL;
      unint64_t v7 = 0xE900000000000065;
      break;
    case 5:
      uint64_t v8 = 0x6F43656372756F73;
      unint64_t v7 = 0xEA00000000006564;
      break;
    case 6:
      uint64_t v8 = 0x6873646165727073;
      unint64_t v7 = 0xEB00000000746565;
      break;
    case 7:
      uint64_t v8 = 0x636F725064726F77;
      unint64_t v7 = 0xEE00676E69737365;
      break;
    default:
      break;
  }
  sub_213B515F8(1, v8, v7, a4);
  swift_bridgeObjectRelease();
  sub_213B51744();
  sub_213B53120();
  swift_bridgeObjectRelease();
  unint64_t v10 = 0xE500000000000000;
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      unint64_t v10 = 0xE700000000000000;
      unint64_t v5 = 0x656C6F736E6F63;
      break;
    case 2:
      unint64_t v5 = 0x74737953656C6966;
      unint64_t v10 = 0xEA00000000006D65;
      break;
    case 3:
      unint64_t v5 = 0x6E6967617373656DLL;
      unint64_t v10 = 0xE900000000000067;
      break;
    case 4:
      unint64_t v5 = 0x766974617272616ELL;
      unint64_t v10 = 0xE900000000000065;
      break;
    case 5:
      unint64_t v5 = 0x6F43656372756F73;
      unint64_t v10 = 0xEA00000000006564;
      break;
    case 6:
      unint64_t v5 = 0x6873646165727073;
      unint64_t v10 = 0xEB00000000746565;
      break;
    case 7:
      unint64_t v5 = 0x636F725064726F77;
      unint64_t v10 = 0xEE00676E69737365;
      break;
    default:
      JUMPOUT(0);
  }
  uint64_t v11 = sub_213B51694(1uLL, v5, v10, v9);
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x216691130](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_213B53020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_213B53040();
  sub_213B53010();
  swift_bridgeObjectRelease();
  return v19;
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.value(for:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B52FC0();
  unint64_t result = sub_213B4F1B4(v2, v3, &v6);
  char v5 = v6;
  if (v6 == 8) {
    char v5 = 0;
  }
  *a1 = v5;
  return result;
}

unint64_t sub_213B4F1B4@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  if ((sub_213B53030() & 1) == 0)
  {
    unint64_t result = swift_bridgeObjectRelease();
    char v25 = 8;
    goto LABEL_11;
  }
  unint64_t v6 = sub_213B52FF0();
  unint64_t v8 = sub_213B51694(v6, a1, a2, v7);
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t result = sub_213B53100();
  if (v12) {
    unint64_t v13 = v10;
  }
  else {
    unint64_t v13 = result;
  }
  if (v13 >> 14 < v8 >> 14)
  {
    __break(1u);
  }
  else
  {
    sub_213B53110();
    uint64_t v14 = sub_213B530F0();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    unint64_t result = sub_213B53100();
    if (v17) {
      unint64_t result = v10;
    }
    if (v10 >> 14 >= result >> 14)
    {
      uint64_t v18 = sub_213B53110();
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      swift_bridgeObjectRelease();
      MEMORY[0x216691130](v18, v20, v22, v24);
      swift_bridgeObjectRelease();
      v26[0] = v14;
      v26[1] = v16;
      swift_bridgeObjectRetain();
      sub_213B53020();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)((char *)v26);
      char v25 = v26[0];
LABEL_11:
      *a3 = v25;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.rawValue.getter()
{
  uint64_t result = 0x6E69616C70;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656C6F736E6F63;
      break;
    case 2:
      uint64_t result = 0x74737953656C6966;
      break;
    case 3:
      uint64_t result = 0x6E6967617373656DLL;
      break;
    case 4:
      uint64_t result = 0x766974617272616ELL;
      break;
    case 5:
      uint64_t result = 0x6F43656372756F73;
      break;
    case 6:
      uint64_t result = 0x6873646165727073;
      break;
    case 7:
      uint64_t result = 0x636F725064726F77;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_213B4F4CC(unsigned __int8 *a1, char *a2)
{
  return sub_213B4E1C0(*a1, *a2);
}

uint64_t sub_213B4F4D8()
{
  return sub_213B4E6C0();
}

uint64_t sub_213B4F4E4()
{
  return sub_213B4E518();
}

uint64_t sub_213B4F4EC()
{
  return sub_213B4E6C0();
}

uint64_t sub_213B4F4F4@<X0>(char *a1@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)(a1);
}

void sub_213B4F500(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x6E69616C70;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x656C6F736E6F63;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x74737953656C6966;
      *(void *)(a1 + 8) = 0xEA00000000006D65;
      break;
    case 3:
      *(void *)a1 = 0x6E6967617373656DLL;
      *(void *)(a1 + 8) = 0xE900000000000067;
      break;
    case 4:
      *(void *)a1 = 0x766974617272616ELL;
      *(void *)(a1 + 8) = 0xE900000000000065;
      break;
    case 5:
      *(void *)a1 = 0x6F43656372756F73;
      *(void *)(a1 + 8) = 0xEA00000000006564;
      break;
    case 6:
      *(void *)a1 = 0x6873646165727073;
      *(void *)(a1 + 8) = 0xEB00000000746565;
      break;
    case 7:
      strcpy((char *)a1, "wordProcessing");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_213B4F648()
{
  return sub_213B53080();
}

uint64_t sub_213B4F6A8()
{
  return sub_213B53060();
}

uint64_t sub_213B4F6F8()
{
  return sub_213B52F80();
}

uint64_t sub_213B4F758()
{
  return sub_213B52F90();
}

uint64_t sub_213B4F7B8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.decodeMarkdown(from:)(a1, a2);
}

uint64_t sub_213B4F7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213B50734(a1, a2, a3, (void (*)(void))sub_213B4ED9C);
}

unint64_t sub_213B4F7FC@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B52FC0();
  unint64_t result = sub_213B4F1B4(v2, v3, &v6);
  char v5 = v6;
  if (v6 == 8) {
    char v5 = 0;
  }
  *a1 = v5;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73968);
}

unint64_t static AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_213B4F888()
{
  return sub_213B52F80();
}

uint64_t sub_213B4F8A8()
{
  return sub_213B52F90();
}

uint64_t sub_213B4F8C8()
{
  return sub_213B52FA0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73940);
}

unint64_t static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.markdownName.getter()
{
  return 0xD000000000000020;
}

id static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.objectiveCValue(for:)(double a1)
{
  return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1 + 1.0);
}

double static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.value(for:)(void *a1)
{
  objc_msgSend(a1, sel_doubleValue);
  return v1 + -1.0;
}

uint64_t sub_213B4F9F0()
{
  return sub_213B52F80();
}

uint64_t sub_213B4FA10()
{
  return sub_213B52F90();
}

uint64_t sub_213B4FA30()
{
  return sub_213B52FA0();
}

id sub_213B4FA90(double *a1)
{
  return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *a1 + 1.0);
}

double sub_213B4FAE4@<D0>(void *a1@<X0>, double *a2@<X8>)
{
  objc_msgSend(a1, sel_doubleValue);
  double result = v3 + -1.0;
  *a2 = result;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.SpellOutAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73948);
}

unint64_t static AttributeScopes.AccessibilityAttributes.SpellOutAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_213B4FB64()
{
  return sub_213B52FA0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute.name.getter()
{
  return sub_213B4FD68(&qword_26AA73970);
}

unint64_t static AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_213B4FC04()
{
  return sub_213B52FA0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.IPANotationAttribute.name.getter()
{
  return sub_213B4FD68(qword_26AA73958);
}

unint64_t static AttributeScopes.AccessibilityAttributes.IPANotationAttribute.markdownName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_213B4FCA4()
{
  return sub_213B52F80();
}

uint64_t sub_213B4FCC4()
{
  return sub_213B52F90();
}

uint64_t sub_213B4FCE4()
{
  return sub_213B52FA0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.name.getter()
{
  return sub_213B4FD68(qword_26AA739C0);
}

uint64_t sub_213B4FD68(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return sub_213B52FC0();
}

unint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.markdownName.getter()
{
  return 0xD000000000000027;
}

uint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.objectiveCValue(for:)(uint64_t a1)
{
  return sub_213B4FDFC(a1, (void (*)(void))sub_213B4FE54);
}

uint64_t sub_213B4FDFC(uint64_t a1, void (*a2)(void))
{
  a2();
  uint64_t v2 = sub_213B52FB0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_213B4FE54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v5 = *v4;
  unint64_t v6 = 0xE700000000000000;
  uint64_t v7 = 0x746C7561666564;
  if (v5 != 1)
  {
    uint64_t v7 = 1751607656;
    unint64_t v6 = 0xE400000000000000;
  }
  if (*v4) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 7827308;
  }
  if (*v4) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = 0xE300000000000000;
  }
  sub_213B515F8(1, v8, v9, a4);
  swift_bridgeObjectRelease();
  sub_213B51744();
  sub_213B53120();
  swift_bridgeObjectRelease();
  unint64_t v11 = 0xE700000000000000;
  uint64_t v12 = 0x746C7561666564;
  if (v5 != 1)
  {
    uint64_t v12 = 1751607656;
    unint64_t v11 = 0xE400000000000000;
  }
  if (v5) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 7827308;
  }
  if (v5) {
    unint64_t v14 = v11;
  }
  else {
    unint64_t v14 = 0xE300000000000000;
  }
  uint64_t v15 = sub_213B51694(1uLL, v13, v14, v10);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  MEMORY[0x216691130](v15, v17, v19, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_213B53020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_213B53040();
  sub_213B53010();
  swift_bridgeObjectRelease();
  return v23;
}

unint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.value(for:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B52FC0();
  unint64_t result = sub_213B50098(v2, v3, &v6);
  char v5 = v6;
  if (v6 == 3) {
    char v5 = 1;
  }
  *a1 = v5;
  return result;
}

unint64_t sub_213B50098@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  if ((sub_213B53030() & 1) == 0)
  {
    unint64_t result = swift_bridgeObjectRelease();
    char v25 = 3;
    goto LABEL_11;
  }
  unint64_t v6 = sub_213B52FF0();
  unint64_t v8 = sub_213B51694(v6, a1, a2, v7);
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t result = sub_213B53100();
  if (v12) {
    unint64_t v13 = v10;
  }
  else {
    unint64_t v13 = result;
  }
  if (v13 >> 14 < v8 >> 14)
  {
    __break(1u);
  }
  else
  {
    sub_213B53110();
    uint64_t v14 = sub_213B530F0();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    unint64_t result = sub_213B53100();
    if (v17) {
      unint64_t result = v10;
    }
    if (v10 >> 14 >= result >> 14)
    {
      uint64_t v18 = sub_213B53110();
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      swift_bridgeObjectRelease();
      MEMORY[0x216691130](v18, v20, v22, v24);
      swift_bridgeObjectRelease();
      v26[0] = v14;
      v26[1] = v16;
      swift_bridgeObjectRetain();
      sub_213B53020();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)((char *)v26);
      char v25 = v26[0];
LABEL_11:
      *a3 = v25;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B531A0();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 3;
  if (v2 < 3) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.rawValue.getter()
{
  uint64_t v1 = 0x746C7561666564;
  if (*v0 != 1) {
    uint64_t v1 = 1751607656;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7827308;
  }
}

uint64_t sub_213B5032C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_213B4E0C4(*a1, *a2);
}

uint64_t sub_213B50338()
{
  return sub_213B53230();
}

uint64_t sub_213B503CC()
{
  sub_213B52FE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_213B5044C()
{
  return sub_213B53230();
}

uint64_t sub_213B504DC@<X0>(char *a1@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)(a1);
}

void sub_213B504E8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xE700000000000000;
  uint64_t v5 = 0x746C7561666564;
  if (v2 != 1)
  {
    uint64_t v5 = 1751607656;
    unint64_t v4 = 0xE400000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7827308;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_213B50538()
{
  return sub_213B53080();
}

uint64_t sub_213B50598()
{
  return sub_213B53060();
}

uint64_t sub_213B505E8()
{
  return sub_213B52F80();
}

uint64_t sub_213B50648()
{
  return sub_213B52F90();
}

uint64_t sub_213B506A8()
{
  return sub_213B52FA0();
}

uint64_t sub_213B50708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213B50734(a1, a2, a3, (void (*)(void))sub_213B4FE54);
}

uint64_t sub_213B50734(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v4 = sub_213B52FB0();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_213B5078C@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_213B52FC0();
  unint64_t result = sub_213B50098(v2, v3, &v6);
  char v5 = v6;
  if (v6 == 3) {
    char v5 = 1;
  }
  *a1 = v5;
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_213B50870()
{
  unint64_t result = qword_2677F9090;
  if (!qword_2677F9090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9090);
  }
  return result;
}

unint64_t sub_213B508C8()
{
  unint64_t result = qword_2677F9098;
  if (!qword_2677F9098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9098);
  }
  return result;
}

uint64_t sub_213B5091C()
{
  return sub_213B51444(&qword_2677F90A0);
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

unint64_t sub_213B509A4()
{
  unint64_t result = qword_2677F90B0;
  if (!qword_2677F90B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90B0);
  }
  return result;
}

unint64_t sub_213B509FC()
{
  unint64_t result = qword_2677F90B8;
  if (!qword_2677F90B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90B8);
  }
  return result;
}

uint64_t sub_213B50A50()
{
  return MEMORY[0x263F8D508];
}

uint64_t sub_213B50A5C()
{
  return MEMORY[0x263F8D558];
}

uint64_t sub_213B50A68()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_213B50A78()
{
  unint64_t result = qword_2677F8DF8;
  if (!qword_2677F8DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F8DF8);
  }
  return result;
}

unint64_t sub_213B50AD0()
{
  unint64_t result = qword_2677F8DF0;
  if (!qword_2677F8DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F8DF0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s23AccessibilityAttributesV21HeadingLevelAttributeO12HeadingLevelOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s23AccessibilityAttributesV21HeadingLevelAttributeO12HeadingLevelOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x213B50C90);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_213B50CB8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_213B50CC0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel;
}

uint64_t _s23AccessibilityAttributesV23TextualContextAttributeO14TextualContextOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s23AccessibilityAttributesV23TextualContextAttributeO14TextualContextOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x213B50E34);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext;
}

uint64_t _s23AccessibilityAttributesV29AnnouncementPriorityAttributeO20AnnouncementPriorityOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s23AccessibilityAttributesV29AnnouncementPriorityAttributeO20AnnouncementPriorityOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x213B50FC8);
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

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority;
}

unint64_t sub_213B51000()
{
  unint64_t result = qword_2677F90C0;
  if (!qword_2677F90C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90C0);
  }
  return result;
}

unint64_t sub_213B51054()
{
  unint64_t result = qword_2677F90C8;
  if (!qword_2677F90C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90C8);
  }
  return result;
}

unint64_t sub_213B510A8()
{
  unint64_t result = qword_2677F90D0;
  if (!qword_2677F90D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90D0);
  }
  return result;
}

unint64_t sub_213B510FC()
{
  unint64_t result = qword_2677F90D8;
  if (!qword_2677F90D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90D8);
  }
  return result;
}

unint64_t sub_213B51150()
{
  unint64_t result = qword_2677F90E0;
  if (!qword_2677F90E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90E0);
  }
  return result;
}

unint64_t sub_213B511A4()
{
  unint64_t result = qword_2677F90E8;
  if (!qword_2677F90E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90E8);
  }
  return result;
}

unint64_t sub_213B511F8()
{
  unint64_t result = qword_2677F90F0;
  if (!qword_2677F90F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90F0);
  }
  return result;
}

unint64_t sub_213B5124C()
{
  unint64_t result = qword_2677F90F8;
  if (!qword_2677F90F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F90F8);
  }
  return result;
}

unint64_t sub_213B512A0()
{
  unint64_t result = qword_2677F9100;
  if (!qword_2677F9100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9100);
  }
  return result;
}

unint64_t sub_213B512F4()
{
  unint64_t result = qword_2677F9108;
  if (!qword_2677F9108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9108);
  }
  return result;
}

unint64_t sub_213B51348()
{
  unint64_t result = qword_2677F9110;
  if (!qword_2677F9110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9110);
  }
  return result;
}

unint64_t sub_213B5139C()
{
  unint64_t result = qword_2677F9118;
  if (!qword_2677F9118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9118);
  }
  return result;
}

unint64_t sub_213B513F0()
{
  unint64_t result = qword_2677F9120;
  if (!qword_2677F9120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9120);
  }
  return result;
}

uint64_t sub_213B51444(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677F90A8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_213B514A8()
{
  unint64_t result = qword_2677F9138;
  if (!qword_2677F9138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9138);
  }
  return result;
}

unint64_t sub_213B514FC()
{
  unint64_t result = qword_2677F9140;
  if (!qword_2677F9140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9140);
  }
  return result;
}

unint64_t sub_213B51550()
{
  unint64_t result = qword_2677F9148;
  if (!qword_2677F9148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9148);
  }
  return result;
}

unint64_t sub_213B515A4()
{
  unint64_t result = qword_2677F9150;
  if (!qword_2677F9150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9150);
  }
  return result;
}

uint64_t sub_213B515F8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_213B53000();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_213B51694(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
  }
  unint64_t v4 = a3;
  unint64_t v5 = a2;
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v7 = 11;
  }
  unint64_t v8 = v7 | (v6 << 16);
  a1 = sub_213B53000();
  if (a2) {
    a1 = v8;
  }
  if (4 * v6 < a1 >> 14) {
    goto LABEL_14;
  }
  a2 = v8;
  a3 = v5;
  a4 = v4;

  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

unint64_t sub_213B51744()
{
  unint64_t result = qword_2677F8E00;
  if (!qword_2677F8E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F8E00);
  }
  return result;
}

BOOL static AccessibilityNotification.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccessibilityNotification.Kind.hash(into:)()
{
  return sub_213B53220();
}

uint64_t AccessibilityNotification.Kind.hashValue.getter()
{
  return sub_213B53230();
}

void static AccessibilityNotification.Announcement._kind.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

id AccessibilityNotification.Announcement._info.getter()
{
  return *v0;
}

void AccessibilityNotification.Announcement._info.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*AccessibilityNotification.Announcement._info.modify())()
{
  return nullsub_2;
}

unint64_t sub_213B51888()
{
  unint64_t result = qword_2677F8E08;
  if (!qword_2677F8E08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2677F8E08);
  }
  return result;
}

Accessibility::AccessibilityNotification::Announcement __swiftcall AccessibilityNotification.Announcement.init(_:)(Accessibility::AccessibilityNotification::Announcement result)
{
  v1->_info.super.isa = result._info.super.isa;
  return result;
}

void sub_213B518D4(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

id sub_213B518DC@<X0>(void **a1@<X8>)
{
  int v2 = *v1;
  *a1 = *v1;
  return v2;
}

void sub_213B518E8()
{
  _AXPostPlatformNotification(1008, *v0);
}

Swift::Void __swiftcall _AccessibilityNotifications.post()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v2 + 16))(&v11, v3, v2);
  uint64_t v8 = dword_213B55A90[(char)v11];
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v3, v2);
  uint64_t v9 = (void *)sub_213B531B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  _AXPostPlatformNotification(v8, v9);
  swift_unknownObjectRelease();
}

void static AccessibilityNotification.LayoutChanged._kind.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t AccessibilityNotification.LayoutChanged._info.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_213B51D38(v1, a1);
}

uint64_t AccessibilityNotification.LayoutChanged._info.setter(uint64_t a1)
{
  return sub_213B51DA0(a1, v1);
}

uint64_t (*AccessibilityNotification.LayoutChanged._info.modify())()
{
  return nullsub_2;
}

uint64_t AccessibilityNotification.LayoutChanged.init(_:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  return sub_213B51DA0(a1, (uint64_t)a2);
}

void sub_213B51AA4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_213B51AB0@<X0>(uint64_t a1@<X8>)
{
  return sub_213B51D38(v1, a1);
}

uint64_t sub_213B51ABC(uint64_t a1, uint64_t a2)
{
  return sub_213B51B04(a1, a2, 1001);
}

void static AccessibilityNotification.ScreenChanged._kind.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t (*AccessibilityNotification.ScreenChanged._info.modify())()
{
  return nullsub_2;
}

void sub_213B51AF0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_213B51AFC(uint64_t a1, uint64_t a2)
{
  return sub_213B51B04(a1, a2, 1000);
}

uint64_t sub_213B51B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_213B51D38(v3, (uint64_t)&v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677F9158);
  uint64_t v5 = (void *)sub_213B53200();
  _AXPostPlatformNotification(a3, v5);
  return swift_unknownObjectRelease();
}

void static AccessibilityNotification.PageScrolled._kind.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t (*AccessibilityNotification.PageScrolled._info.modify())()
{
  return nullsub_2;
}

uint64_t _s13Accessibility0A12NotificationO12AnnouncementVyAE10Foundation16AttributedStringVcfC_0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_213B52F30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213B51888();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = sub_213B530E0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *a2 = v8;
  return result;
}

void _s13Accessibility0A12NotificationO12AnnouncementVyAESScfC_0(void *a1@<X8>)
{
  id v2 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v3 = (void *)sub_213B52FB0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithString_, v3);

  *a1 = v4;
}

void sub_213B51D1C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void sub_213B51D28()
{
  _AXPostPlatformNotification(1009, *v0);
}

uint64_t sub_213B51D38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677F9158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213B51DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677F9158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_213B51E0C()
{
  unint64_t result = qword_2677F9160;
  if (!qword_2677F9160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677F9160);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityNotification()
{
  return &type metadata for AccessibilityNotification;
}

uint64_t getEnumTagSinglePayload for AccessibilityNotification.Kind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccessibilityNotification.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x213B51FCCLL);
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

ValueMetadata *type metadata accessor for AccessibilityNotification.Kind()
{
  return &type metadata for AccessibilityNotification.Kind;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.Announcement()
{
  return &type metadata for AccessibilityNotification.Announcement;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessibilityNotification.LayoutChanged(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AccessibilityNotification.LayoutChanged(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
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
          *unint64_t result = *a2;
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AccessibilityNotification.LayoutChanged(uint64_t a1, _OWORD *a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  return a1;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.LayoutChanged()
{
  return &type metadata for AccessibilityNotification.LayoutChanged;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    *(void *)(a1 + 24) = v3;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AccessibilityNotification.ScreenChanged()
{
  return &type metadata for AccessibilityNotification.ScreenChanged;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.PageScrolled()
{
  return &type metadata for AccessibilityNotification.PageScrolled;
}

uint64_t dispatch thunk of static _AccessibilityNotifications._kind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _AccessibilityNotifications._info.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _AccessibilityNotifications.post()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

BOOL static AccessibilitySettings.prefersNonBlinkingTextInsertionIndicator.getter()
{
  return AXPrefersNonBlinkingTextInsertionIndicator();
}

Swift::Bool __swiftcall AXPrefersHorizontalTextLayout()()
{
  return AXPrefersHorizontalTextLayout();
}

BOOL static AccessibilitySettings.prefersHorizontalTextLayout.getter()
{
  return AXPrefersHorizontalTextLayout();
}

__CFString *static AccessibilitySettings.prefersHorizontalTextLayoutDidChangeNotification.getter()
{
  return @"com.apple.accessibility.prefers.horizontal.text";
}

Swift::Bool __swiftcall AXAnimatedImagesEnabled()()
{
  return AXAnimatedImagesEnabled();
}

uint64_t static AccessibilitySettings.openSettings(for:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_213B525AC, 0, 0);
}

uint64_t sub_213B525AC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  unint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  void *v3 = v0;
  v3[1] = sub_213B52698;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_213B52698()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_213B527CC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_213B527B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_213B527B4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213B527CC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_213B52830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9180);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_213B52C00;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213B52A3C;
  aBlock[3] = &block_descriptor_0;
  int v9 = _Block_copy(aBlock);
  swift_release();
  AXOpenSettingsFeature(a2, v9);
  _Block_release(v9);
}

void sub_213B529D0(uint64_t a1)
{
  sub_213B52830(a1, *(void *)(v1 + 16));
}

uint64_t sub_213B529D8(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9180);
    return sub_213B530C0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9180);
    return sub_213B530D0();
  }
}

void sub_213B52A3C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

__CFString *sub_213B52AA8()
{
  qword_2677F9168 = @"com.apple.accessibility.prefers.horizontal.text";
  return @"com.apple.accessibility.prefers.horizontal.text";
}

id static NSNotificationName.AXPrefersHorizontalTextLayoutDidChange.getter()
{
  return sub_213B52B20(&qword_2677F8F98, (void **)&qword_2677F9168);
}

__CFString *sub_213B52AE4()
{
  qword_2677F9170 = @"com.apple.accessibility.reduce.motion.autoplay.animated.images.status";
  return @"com.apple.accessibility.reduce.motion.autoplay.animated.images.status";
}

id static NSNotificationName.AXAnimatedImagesEnabledDidChange.getter()
{
  return sub_213B52B20(qword_2677F8FA0, (void **)&qword_2677F9170);
}

id sub_213B52B20(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

uint64_t sub_213B52B6C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9180);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_213B52C00(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677F9180);

  return sub_213B529D8(a1);
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

uint64_t AXAnimatedImagesEnabled_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getAXUIClientClass_block_invoke_cold_1(v0);
}

void __getAXUIClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  AXNameFromColor_cold_1(v0, v1);
}

void AXNameFromColor_cold_1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_213B3D000, log, OS_LOG_TYPE_ERROR, "Hue value should be in range [0..1f], got %f", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNSFontClass_block_invoke_cold_1(v0);
}

uint64_t __getNSFontClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXDataSeriesDescriptor initWithDictionary:](v0);
}

void __getAXMDataSonificationManagerClass_block_invoke_cold_1()
{
}

uint64_t sub_213B52F30()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_213B52F40()
{
  return MEMORY[0x270EEF138]();
}

uint64_t sub_213B52F50()
{
  return MEMORY[0x270EEF140]();
}

uint64_t sub_213B52F60()
{
  return MEMORY[0x270EEF150]();
}

uint64_t sub_213B52F80()
{
  return MEMORY[0x270EEFA90]();
}

uint64_t sub_213B52F90()
{
  return MEMORY[0x270EEFA98]();
}

uint64_t sub_213B52FA0()
{
  return MEMORY[0x270EEFB90]();
}

uint64_t sub_213B52FB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_213B52FC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_213B52FD0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_213B52FE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_213B52FF0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_213B53000()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_213B53010()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_213B53020()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_213B53030()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_213B53040()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_213B53060()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_213B53070()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_213B53080()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_213B53090()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_213B530A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_213B530B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_213B530C0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_213B530D0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_213B530E0()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_213B530F0()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_213B53100()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_213B53110()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_213B53120()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_213B53130()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_213B53140()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_213B53150()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_213B53160()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_213B53170()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_213B53180()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_213B53190()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_213B531A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_213B531B0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_213B531C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_213B531D0()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_213B531E0()
{
  return MEMORY[0x270F9F808]();
}

uint64_t sub_213B53200()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_213B53210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_213B53220()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_213B53230()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_213B53240()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x270EE5DA0]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x270EE5DB0]();
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x270EE9B08](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x270EE9B80]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSSize NSSizeFromString(NSString *aString)
{
  MEMORY[0x270EF2BF0](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x270EF2C40]((__n128)aSize, *(__n128 *)&aSize.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

uint64_t _AXSCopyPreferredContentSizeCategoryName()
{
  return MEMORY[0x270F906E0]();
}

uint64_t _AXSHearingDevicePairedUUIDs()
{
  return MEMORY[0x270F90800]();
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  return MEMORY[0x270F90B60]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
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

void objc_enumerationMutation(id obj)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}